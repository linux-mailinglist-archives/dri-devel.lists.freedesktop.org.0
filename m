Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 6B8C86CF9A8
	for <lists+dri-devel@lfdr.de>; Thu, 30 Mar 2023 05:46:36 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8093910ECCA;
	Thu, 30 Mar 2023 03:46:31 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga12.intel.com (mga12.intel.com [192.55.52.136])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B245F10ECC2;
 Thu, 30 Mar 2023 03:46:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1680147988; x=1711683988;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=mlt72MslX4o50uYTgQkT2jHTS/TzfPBY8eBGPxeVBq8=;
 b=X0BKoMAAvIqQFe3xhSPYwF3jFFkDOYNRqMu1peyjkhqoMWkfEvXyKLAY
 ZR1ULbayb2lrLkJ4lgYn5zLEzhc4AVwSydRPvqLrvVgimjKUZydbJ1/qI
 nVaz21+g84uDfJUAF6o4xV5chmpAtnR4zCWgz/DwJckdzwgmQQbzobC4d
 zssL8Hzspe9fhsJKny+eB0fYgSkN2wRnBnzQxsjAESITN78sToh+lefm4
 HAl8J4oeEbmsDAFb3f9KgfYIKIASlYMBU12xbao4mGBQvJWUvI84FIPEI
 T4D8OXAVVnbguBj9f0ogZ5DrfPHG4vNjaSRZLaIwC6xGOx0dX1y5NIAhh Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10664"; a="320714503"
X-IronPort-AV: E=Sophos;i="5.98,301,1673942400"; d="scan'208";a="320714503"
Received: from orsmga008.jf.intel.com ([10.7.209.65])
 by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 29 Mar 2023 20:46:28 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10664"; a="714839548"
X-IronPort-AV: E=Sophos;i="5.98,301,1673942400"; d="scan'208";a="714839548"
Received: from fmsmsx601.amr.corp.intel.com ([10.18.126.81])
 by orsmga008.jf.intel.com with ESMTP; 29 Mar 2023 20:46:27 -0700
Received: from fmsmsx603.amr.corp.intel.com (10.18.126.83) by
 fmsmsx601.amr.corp.intel.com (10.18.126.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.21; Wed, 29 Mar 2023 20:46:26 -0700
Received: from fmsedg601.ED.cps.intel.com (10.1.192.135) by
 fmsmsx603.amr.corp.intel.com (10.18.126.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.21 via Frontend Transport; Wed, 29 Mar 2023 20:46:26 -0700
Received: from NAM10-DM6-obe.outbound.protection.outlook.com (104.47.58.107)
 by edgegateway.intel.com (192.55.55.70) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.21; Wed, 29 Mar 2023 20:46:26 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=CnC7MNBNqBvijXjmGxiKJx5/iCz74faIaJAd3F8M/jnvFXCJBg6PM9VcpwWT7PlaHSttX71XiPbwRd0Pc6wAGTo47cm9gUODeNuhggRT/DnVTMoogsvow6jMtf/Lh/KKsBD7ko1RdfQw6jUZIq2YXZov9GSs9PE0gdqw4hr+XUJ8/yh2rf1V9SYpmzzk7oZ4EPMOjXot8FWflCCLq0CJXKq1Mp3K/i9xAnEutXk1EyZA1nyGRdqa00DciJi0k208mqEoQofiElWm84Kyx4u+7gDwilJu2vtHADCXBQ6EVa3Lq/oghXP1wK4aU9nCAww164symNsGiGjYvnUrcbIgrQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=F/AgOUtLNgdWmGGoUzGy2rEjlEkg+VkPl6N1LKvyTLk=;
 b=PWb772sy3JkUQN0+jGzoYz81c40CQ2nKEayWbPPXu0TRiyrXIKaVB5gaVL7PjAlFaFI9wt9/qSNGvnOi8841hz34MgqIm0rcjNbYO2le68wDUQGd/RDvUXt4oDvURS9EhTYeQGemHF3uQUEXNwWgZZNzy7Jmq514bMeNxTNomYZBIt1ZQ15cXBSDVHv8yydLgBPJO+Ys902h1t8Nx9nfOGHJOG/c/Wf9R92Ool82FWJIyfrKAkmX4ihoKeP7KcXhoNQ8GcQG7rYSp7/PsmeUIakw1slKfR6CKSqzbGfT86vvkGswWmpBAh6odQocNACCYqQshglN1PLanXZRhqRdsg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from CY5PR11MB6139.namprd11.prod.outlook.com (2603:10b6:930:29::17)
 by IA0PR11MB7187.namprd11.prod.outlook.com (2603:10b6:208:441::12)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6178.41; Thu, 30 Mar
 2023 03:46:24 +0000
Received: from CY5PR11MB6139.namprd11.prod.outlook.com
 ([fe80::2629:fb12:6221:3745]) by CY5PR11MB6139.namprd11.prod.outlook.com
 ([fe80::2629:fb12:6221:3745%5]) with mapi id 15.20.6254.022; Thu, 30 Mar 2023
 03:46:24 +0000
Date: Wed, 29 Mar 2023 21:46:21 -0600
From: Lucas De Marchi <lucas.demarchi@intel.com>
To: "Srivatsa, Anusha" <anusha.srivatsa@intel.com>
Subject: Re: [PATCH 3/3] drm/xe: Update GuC/HuC firmware autoselect logic
Message-ID: <20230330034621.zdlunvob4mc7nzxt@ldmartin-desk2>
References: <20230324051754.1346390-1-lucas.demarchi@intel.com>
 <20230324051754.1346390-4-lucas.demarchi@intel.com>
 <SJ2PR11MB771527702FC1B562638E67D1F8889@SJ2PR11MB7715.namprd11.prod.outlook.com>
Content-Type: text/plain; charset="us-ascii"; format=flowed
Content-Disposition: inline
In-Reply-To: <SJ2PR11MB771527702FC1B562638E67D1F8889@SJ2PR11MB7715.namprd11.prod.outlook.com>
X-ClientProxiedBy: SJ2PR07CA0015.namprd07.prod.outlook.com
 (2603:10b6:a03:505::28) To CY5PR11MB6139.namprd11.prod.outlook.com
 (2603:10b6:930:29::17)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CY5PR11MB6139:EE_|IA0PR11MB7187:EE_
X-MS-Office365-Filtering-Correlation-Id: 6dae5bd4-89b8-444d-e5ac-08db30d15528
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: CcB9oIJ4hgd/GO9KPazce78lp8NLr2iTOHXrzsjFSWiekeZvI4NwmlvHFjeeinqMR/tVf54tpXZ7oS/1gLteqGOyGKs2xHQ7t7eYgV0f3cXZBqSk1XeH6bm3x7I7MG0ABlRRkmQEjZUDg06qZJXN1xqFQlDlFQugz9XtLGuTrBq7CRQFJFR0jRaz1EjmexIZ6IxRrN3z486UhyF3KtTqXle6qllBSmtGoAaXsI+feECrCQmKsR/kn39wKcn1yNguPFxQrMjrIdeq80TYIFD7Tv93epCOvWLcmnSb8ycS5fgUAaET2X7y8XxeYqa9t4Owlms51Zn/JMwUBmXomC7b/pefFBIte8NYS3eT1S2xEioSn1V/jcAbfaUy3AugXkwbBhBcmfAqojDLoQQjPjvF4HY9xFuInO+0t/VIVMx5W2+dZVzw7E9RkPt0+n1+VYUV7usthuwL2BIjyAUujcqUnk4jXBWcw4bwYmUdG1TtY3I5voBE8m8vD2z5O46cZC8B8FjPu5Jb+qec13XFa0JVFzcOROBZ9DIx2Iz/uDzmk1cbzGGig1mhejSuRfyhzyxIM+aJKMqg/TJA2GO3IodnUw==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CY5PR11MB6139.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230028)(7916004)(136003)(376002)(39860400002)(366004)(396003)(346002)(451199021)(38100700002)(33716001)(66946007)(8676002)(66556008)(66476007)(53546011)(4326008)(6862004)(8936002)(41300700001)(30864003)(186003)(5660300002)(9686003)(6666004)(478600001)(6486002)(6636002)(26005)(6512007)(6506007)(54906003)(86362001)(1076003)(316002)(82960400001)(2906002)(15650500001)(83380400001);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?//EcrtrsEZI5jTO5pDvUMbaTyZosTBf/QeWFAjZe0UBx7Ae9mNl+E4RbQB6J?=
 =?us-ascii?Q?RGE182kHUSoLPHlPddGODaM7sQ4XjobQzlfygx3zh11POmQ2Oj2o01G6r+Jk?=
 =?us-ascii?Q?cD0a+18TuKC/FRhIBripvZD2js98LhudLW7pq9iuzSqzoq8E9MsmjAlg+eQ2?=
 =?us-ascii?Q?HZrTavGuI2M87C/tALj3VarqJ3AS1WN3HAJA2Lci3nvubOqZiZX4jsGoXEgp?=
 =?us-ascii?Q?o1Mg4KMgPobnLa0KTH8Af3Wf8PHYGPJmdqSGp5cCZjnKZh+9kngaAoqBKUdR?=
 =?us-ascii?Q?Q/gzgbYN6rF0AiB/v8f79V0bIxYqabM/NgnkNXcCPUImIEobEBkp265zb3py?=
 =?us-ascii?Q?pLaNnP93mD8aSBI5bEIi7mW/96/Nmy2b5UbW6v7u92ptHkdboTtaS825gH51?=
 =?us-ascii?Q?Eq8DXT9R2jELF1hQ6gu76Q1y4bvrDRvlJ2JWiTziAgCV5mFquS7YBEXzQp9f?=
 =?us-ascii?Q?IhGJAVhmlGSzpLbeh3brRazdpT1dRX6U+aIrekNhn3LVawzZsCABYkrDGupT?=
 =?us-ascii?Q?0rRjPjh1V/9lQvvLMEN+AridRXecAzmoo0sz2DXwlt4U4xPfzhWk7tvrOQKu?=
 =?us-ascii?Q?2d4PMMheQOQbsZsOvxxR4eGhb4+qbKOnMdwbNGoc5guAtAiSFI0ZGEK/JjvH?=
 =?us-ascii?Q?dLkVqHlBHhosNJj7hOE52fRx/WtjEwxh9driMCwBK3/2MvuLBSJB2wLYYkec?=
 =?us-ascii?Q?DCIcvEcbwfDokGXIC2ZkUQyC1lKammz79wL1QSAr/VCjy1JfAZhDzCpOTYIY?=
 =?us-ascii?Q?XiCVAYvt1zOhGLnI4JzSFg8XWdHOB7/NWl+1qkot96lPNd1xL2c3KlVrkDCF?=
 =?us-ascii?Q?ghVlwMF/UxN7K8MddvPDAFBuFnWbh6o7ZJ9rlY2OZvNeRRqYiqE1actB1pH2?=
 =?us-ascii?Q?88+wkMPzKC+z8bcCRH7pAUDr2iWV3iF7474rv46pcRN0fPFymc7JfphIsiAv?=
 =?us-ascii?Q?PA354KWHWYnkrEZ9ITpVuuEe4hvLsWg+oNt40fgDlGIBoT+QFLA8XPhOlTjE?=
 =?us-ascii?Q?xBCSvdvXo7XtVmHtytRY+o8hhkUnh3cf+9CP35gQCyHMlDJZ6MhCVjNjgppB?=
 =?us-ascii?Q?fivfUsQJdsH54jlyn3fuHdEcNZmY/xW39D1zK3IkeLV5MPwJz4BdfhMLzrYn?=
 =?us-ascii?Q?xn4CUGOemyEHXWeEbXcrfgdNR+y/MXZaqaFFr3jibc9L+j9MxdZHTv410om8?=
 =?us-ascii?Q?0gVJ17eP2zpBO1N9HyxhLT7Ov1UgtRQQEJ0I/iyLI+QTRb7NR40BX8v2BlHu?=
 =?us-ascii?Q?WH3DNeMO6/bEru+iS+xxdPktIv5E3UQN8nK76p1W8OugCOEczRkTb//jZHXj?=
 =?us-ascii?Q?TO7sWYaAVoOsqMnjcu4vhfZxcFR6zh/ivh//SxUQNUhwwpctc/PD9/SrifMn?=
 =?us-ascii?Q?A5sbcTNMpnpGpqjza95ivRCMH/az103IWJwUy/FAszWrqrpogzfSY6UfBXcf?=
 =?us-ascii?Q?cooaS7K/ZHgIz5emGNkA0kKONYqUrAOj/LpOu35Cqhi9XQ/IQjmEUpnHF9fl?=
 =?us-ascii?Q?uEKBz/P+qHMQ4zEGYYfrP8QjH8BB6mKcoEZbA0ni4leOz0QkVH7jAWpKHfzl?=
 =?us-ascii?Q?wrljWgFUkqatYU2bugSDpEt/PD2wkprrgmrkU6vSH6kJFeNdK6RJoVMHxdq6?=
 =?us-ascii?Q?mA=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 6dae5bd4-89b8-444d-e5ac-08db30d15528
X-MS-Exchange-CrossTenant-AuthSource: CY5PR11MB6139.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 Mar 2023 03:46:24.1714 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: NFoQumk40Po64uNMeerjeVhI+mBnhBeSw/T8BCHhBG4/zH8i26cuExu3AHqBXlgHLRXMtxgtDFUd5MtRnU8irt7D0Jh1Pq8g1QjZyFZ120s=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA0PR11MB7187
X-OriginatorOrg: intel.com
X-BeenThere: dri-devel@lists.freedesktop.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Direct Rendering Infrastructure - Development
 <dri-devel.lists.freedesktop.org>
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/dri-devel>,
 <mailto:dri-devel-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/dri-devel>
List-Post: <mailto:dri-devel@lists.freedesktop.org>
List-Help: <mailto:dri-devel-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/dri-devel>,
 <mailto:dri-devel-request@lists.freedesktop.org?subject=subscribe>
Cc: Daniel Vetter <daniel.vetter@ffwll.ch>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 "Ceraolo Spurio, Daniele" <daniele.ceraolospurio@intel.com>,
 Dave Airlie <airlied@redhat.com>,
 "intel-xe@lists.freedesktop.org" <intel-xe@lists.freedesktop.org>, "Harrison,
 John C" <john.c.harrison@intel.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Tue, Mar 28, 2023 at 04:31:13PM -0700, Anusha Srivatsa wrote:
>
>
>> -----Original Message-----
>> From: De Marchi, Lucas <lucas.demarchi@intel.com>
>> Sent: Thursday, March 23, 2023 10:18 PM
>> To: intel-xe@lists.freedesktop.org
>> Cc: Srivatsa, Anusha <anusha.srivatsa@intel.com>; Harrison, John C
>> <john.c.harrison@intel.com>; Ceraolo Spurio, Daniele
>> <daniele.ceraolospurio@intel.com>; dri-devel@lists.freedesktop.org; Daniel
>> Vetter <daniel.vetter@ffwll.ch>; Dave Airlie <airlied@redhat.com>; De Marchi,
>> Lucas <lucas.demarchi@intel.com>
>> Subject: [PATCH 3/3] drm/xe: Update GuC/HuC firmware autoselect logic
>>
>> Update the logic to autoselect GuC/HuC for the platforms with the following
>> improvements:
>>
>> - Document what is the firmware file that is expected to be
>>   loaded and what is checked from blob headers
>> - When the platform is under force-probe it's desired to enforce
>>   the full-version requirement so the correct firmware is used
>>   before widespread adoption and backward-compatibility
>>
>Extra line ^
>
>>   commitments
>> - Directory from which we expect firmware blobs to be available in
>>   upstream linux-firmware repository depends on the platform: for
>>   the ones supported by i915 it uses the i915/ directory, but the ones
>>   expected to be supported by xe, it's on the xe/ directory. This
>>   means that for platforms in the intersection, the firmware is
>>   loaded from a different directory, but that is not much important
>>   in the firmware repo and it avoids firmware duplication.
>>
>> - Make the table with the firmware definitions clearly state the
>>   versions being expected. Now with macros to select the version it's
>>   possible to choose between full-version/major-version for GuC and
>>   full-version/no-version for HuC. These are similar to the macros used
>>   in i915, but implemented in a slightly different way to avoid
>>   duplicating the macros for each firmware/type and functionality,
>>   besides adding the support for different directories.
>>
>> - There is no check added regarding force-probe since xe should
>>   reuse the same firmware files published for i915 for past
>>   platforms. This can be improved later with additional
>>   kunit checking against a hardcoded list of platforms that
>Extra line here.
>
>>   falls in this category.
>> - As mentioned in the TODO, the major version fallback was not
>>   implemented before as currently each platform only supports one
>>   major. That can be easily added later.
>>
>> - GuC version for MTL and PVC were updated to 70.6.4, using the exact
>>   full version, while the
>>
>> After this the GuC firmware used by PVC changes to pvc_guc_70.5.2.bin since it's
>> using a file not published yet.
>>
>> Signed-off-by: Lucas De Marchi <lucas.demarchi@intel.com>
>> ---
>>  drivers/gpu/drm/xe/xe_uc_fw.c       | 315 +++++++++++++++++-----------
>>  drivers/gpu/drm/xe/xe_uc_fw.h       |   2 +-
>>  drivers/gpu/drm/xe/xe_uc_fw_types.h |   7 +
>>  3 files changed, 204 insertions(+), 120 deletions(-)
>>
>> diff --git a/drivers/gpu/drm/xe/xe_uc_fw.c b/drivers/gpu/drm/xe/xe_uc_fw.c
>> index 174c42873ebb..653bc3584cc5 100644
>> --- a/drivers/gpu/drm/xe/xe_uc_fw.c
>> +++ b/drivers/gpu/drm/xe/xe_uc_fw.c
>> @@ -17,6 +17,137 @@
>>  #include "xe_mmio.h"
>>  #include "xe_uc_fw.h"
>>
>> +/*
>> + * List of required GuC and HuC binaries per-platform. They must be
>> +ordered
>> + * based on platform, from newer to older.
>> + *
>> + * Versioning follows the guidelines from
>> + * Documentation/driver-api/firmware/firmware-usage-guidelines.rst.
>> +There is a
>> + * distinction for platforms being officially supported by the driver or not.
>> + * Platforms not available publicly or not yet officially supported by
>> +the
>> + * driver (under force-probe), use the mmp_ver(): the firmware
>> +autoselect logic
>> + * will select the firmware from disk with filename that matches the
>> +full
>> + * "mpp version", i.e. major.minor.patch. mmp_ver() should only be used
>> +for
>> + * this case.
>> + *
>> + * For platforms officially supported by the driver, the filename
>> +always only
>> + * ever contains the major version (GuC) or no version at all (HuC).
>> + *
>> + * After loading the file, the driver parses the versions embedded in the blob.
>> + * The major version needs to match a major version supported by the
>> +driver (if
>> + * any). The minor version is also checked and a notice emitted to the
>> +log if
>> + * the version found is smaller than the version wanted. This is done
>> +only for
>> + * informational purposes so users may have a chance to upgrade, but
>> +the driver
>> + * still loads and use the older firmware.
>> + *
>> + * Examples:
>> + *
>> + *	1) Platform officially supported by i915 - using Tigerlake as example.
>> + *	   Driver loads the following firmware blobs from disk:
>> + *
>> + *		- i915/tgl_guc_<major>.bin
>> + *		- i915/tgl_huc.bin
>> + *
>> + *	   <major> number for GuC is checked that it matches the version inside
>> + *	   the blob. <minor> version is checked and if smaller than the expected
>> + *	   an info message is emitted about that.
>> + *
>> + *	1) XE_<FUTUREINTELPLATFORM>, still under require_force_probe.
>> Using
>> + *	   "wipplat" as a short-name. Driver loads the following firmware blobs
>> + *	   from disk:
>> + *
>> + *		- xe/wipplat_guc_<major>.<minor>.<patch>.bin
>> + *		- xe/wipplat_huc_<major>.<minor>.<patch>.bin
>> + *
>> + *	   <major> and <minor> are checked that they match the version inside
>> + *	   the blob. Both of them need to match exactly what the driver is
>> + *	   expecting, otherwise it fails.
>> + *
>> + *	3) Platform officially supported by xe and out of force-probe. Using
>> + *	   "plat" as a short-name. Except for the different directory, the
>> + *	   behavior is the same as (1). Driver loads the following firmware
>> + *	   blobs from disk:
>> + *
>> + *		- xe/plat_guc_<major>.bin
>> + *		- xe/plat_huc.bin
>> + *
>> + *	   <major> number for GuC is checked that it matches the version inside
>> + *	   the blob. <minor> version is checked and if smaller than the expected
>> + *	   an info message is emitted about that.
>> + *
>> + * For the platforms already released with a major version, they should
>> +never be
>> + * removed from the table. Instead new entries with newer versions may
>> +be added
>> + * before them, so they take precedence.
>> + *
>> + * TODO: Currently there's no fallback on major version. That's because
>> +xe
>> + * driver only supports the one major version of each firmware in the table.
>> + * This needs to be fixed when the major version of GuC is updated.
>> + */
>> +
>> +struct uc_fw_entry {
>> +	enum xe_platform platform;
>> +	struct {
>> +		const char *path;
>> +		u16 major;
>> +		u16 minor;
>> +		bool full_ver_required;
>> +	};
>> +};
>> +
>> +struct fw_blobs_by_type {
>> +	const struct uc_fw_entry *entries;
>> +	u32 count;
>> +};
>> +
>> +#define XE_GUC_FIRMWARE_DEFS(fw_def, mmp_ver, major_ver)
>> 		\
>> +	fw_def(METEORLAKE,	mmp_ver(  i915,	guc,	mtl,	70, 6, 4))
>> 	\
>> +	fw_def(PVC,		mmp_ver(  xe,	guc,	pvc,	70, 6, 4))
>> 	\
>> +	fw_def(ALDERLAKE_P,	major_ver(i915,	guc,	adlp,	70, 5))
>> 	\
>> +	fw_def(ALDERLAKE_S,	major_ver(i915,	guc,	tgl,	70, 5))
>> 	\
>> +	fw_def(DG2,		major_ver(i915,	guc,	dg2,	70, 5))
>> 	\
>> +	fw_def(DG1,		major_ver(i915,	guc,	dg1,	70, 5))
>> 	\
>> +	fw_def(TIGERLAKE,	major_ver(i915,	guc,	tgl,	70, 5))
>> +
>> +#define XE_HUC_FIRMWARE_DEFS(fw_def, mmp_ver, no_ver)
>> 		\
>> +	fw_def(ALDERLAKE_S,	no_ver(i915,	huc,	tgl))
>> 	\
>> +	fw_def(DG1,		no_ver(i915,	huc,	dg1))
>> 	\
>> +	fw_def(TIGERLAKE,	no_ver(i915,	huc,	tgl))
>> +
>> +#define MAKE_FW_PATH(dir__, uc__, shortname__, version__)
>> 	\
>> +	__stringify(dir__) "/" __stringify(shortname__) "_" __stringify(uc__)
>> version__ ".bin"
>> +
>> +#define fw_filename_mmp_ver(dir_, uc_, shortname_, a, b, c)
>> 	\
>> +	MAKE_FW_PATH(dir_, uc_, shortname_, "_" __stringify(a ## . ## b ## .
>> ## c))
>> +#define fw_filename_major_ver(dir_, uc_, shortname_, a, b)
>> 	\
>> +	MAKE_FW_PATH(dir_, uc_, shortname_, "_" __stringify(a))
>> +#define fw_filename_no_ver(dir_, uc_, shortname_)
>> 	\
>> +	MAKE_FW_PATH(dir_, uc_, shortname_, "")
>> +
>> +#define uc_fw_entry_mmp_ver(dir_, uc_, shortname_, a, b, c)
>> 	\
>> +	{ fw_filename_mmp_ver(dir_, uc_, shortname_, a, b, c),
>> 	\
>> +	  a, b, true }
>> +#define uc_fw_entry_major_ver(dir_, uc_, shortname_, a, b)
>> 	\
>> +	{ fw_filename_major_ver(dir_, uc_, shortname_, a, b),
>> 	\
>> +	  a, b }
>Why is b required here?

because it is setting the minor in the corresponding struct uc_fw_entry.
 From the tables above, basically for the rows using major_ver(), it
will use up to the major version in the arguments to decide what is the
*file*  to load. The path for the file is constructed with the macro
above, so it can be used by both MODULE_FIRMWARE and by setting the
patch in the uc_fw_entry.  The same major_ver() is used to fill out the
rest of the uc_fw_entry, where we need the minor too.

See doucumentation above. Copying the relevant part here:

	<major> number for GuC is checked that it matches the version inside
	the blob. <minor> version is checked and if smaller than the expected
	an info message is emitted about that.


Lucas De Marchi

>
>
>Anusha
>> +#define uc_fw_entry_no_ver(dir_, uc_, shortname_)
>> 	\
>> +	{ fw_filename_no_ver(dir_, uc_, shortname_),
>> 	\
>> +	  0, 0 }
>> +
>> +/* All blobs need to be declared via MODULE_FIRMWARE() */
>> +#define XE_UC_MODULE_FIRMWARE(platform__, fw_filename)
>> 		\
>> +	MODULE_FIRMWARE(fw_filename);
>> +
>> +#define XE_UC_FW_ENTRY(platform__, entry__)
>> 		\
>> +	{
>> 	\
>> +		.platform = XE_ ## platform__,
>> 	\
>> +		entry__,
>> 	\
>> +	},
>> +
>> +XE_GUC_FIRMWARE_DEFS(XE_UC_MODULE_FIRMWARE,
>> 			\
>> +		     fw_filename_mmp_ver, fw_filename_major_ver)
>> +XE_HUC_FIRMWARE_DEFS(XE_UC_MODULE_FIRMWARE,
>> 			\
>> +		     fw_filename_mmp_ver, fw_filename_no_ver)
>> +
>>  static struct xe_gt *
>>  __uc_fw_to_gt(struct xe_uc_fw *uc_fw, enum xe_uc_fw_type type)  { @@ -
>> 37,123 +168,38 @@ static struct xe_device *uc_fw_to_xe(struct xe_uc_fw
>> *uc_fw)
>>  	return gt_to_xe(uc_fw_to_gt(uc_fw));
>>  }
>>
>> -/*
>> - * List of required GuC and HuC binaries per-platform.
>> - * Must be ordered based on platform, from newer to older.
>> - */
>> -#define XE_GUC_FIRMWARE_DEFS(fw_def, guc_def) \
>> -	fw_def(METEORLAKE,   guc_def(mtl,  70, 5, 2)) \
>> -	fw_def(PVC,          guc_def(pvc,  70, 5, 2)) \
>> -	fw_def(ALDERLAKE_P,  guc_def(adlp,  70, 5, 2)) \
>> -	fw_def(ALDERLAKE_S,  guc_def(tgl,  70, 5, 2)) \
>> -	fw_def(DG2,          guc_def(dg2,  70, 5, 2)) \
>> -	fw_def(DG1,          guc_def(dg1,  70, 5, 2)) \
>> -	fw_def(TIGERLAKE,    guc_def(tgl,  70, 5, 2))
>> -
>> -#define XE_HUC_FIRMWARE_DEFS(fw_def, huc_def, huc_ver) \
>> -	fw_def(ALDERLAKE_S,	huc_def(tgl)) \
>> -	fw_def(DG1,		huc_def(dg1)) \
>> -	fw_def(TIGERLAKE,	huc_def(tgl))
>> -
>> -#define __MAKE_HUC_FW_PATH(prefix_, name_) \
>> -        "i915/" \
>> -        __stringify(prefix_) "_" name_ ".bin"
>> -
>> -#define __MAKE_UC_FW_PATH_MAJOR(prefix_, name_, major_) \
>> -	"i915/" \
>> -	__stringify(prefix_) "_" name_ "_" \
>> -	__stringify(major_) ".bin"
>> -
>> -#define __MAKE_UC_FW_PATH_FULL_VER(prefix_, name_, major_, minor_,
>> patch_) \
>> -        "i915/" \
>> -       __stringify(prefix_) "_" name_ "_" \
>> -       __stringify(major_) "." \
>> -       __stringify(minor_) "." \
>> -       __stringify(patch_) ".bin"
>> -
>> -#define MAKE_GUC_FW_PATH(prefix_, major_, minor_, patch_) \
>> -	__MAKE_UC_FW_PATH_MAJOR(prefix_, "guc", major_)
>> -
>> -#define MAKE_HUC_FW_PATH(prefix_) \
>> -	__MAKE_HUC_FW_PATH(prefix_, "huc")
>> -
>> -#define MAKE_HUC_FW_PATH_FULL_VER(prefix_, major_, minor_, patch_) \
>> -	__MAKE_UC_FW_PATH_FULL_VER(prefix_, "huc", major_, minor_,
>> patch_)
>> -
>> -
>> -/* All blobs need to be declared via MODULE_FIRMWARE() */ -#define
>> XE_UC_MODULE_FW(platform_, uc_) \
>> -	MODULE_FIRMWARE(uc_);
>> -
>> -XE_GUC_FIRMWARE_DEFS(XE_UC_MODULE_FW, MAKE_GUC_FW_PATH) -
>> XE_HUC_FIRMWARE_DEFS(XE_UC_MODULE_FW, MAKE_HUC_FW_PATH,
>> MAKE_HUC_FW_PATH_FULL_VER)
>> -
>> -/* The below structs and macros are used to iterate across the list of blobs */ -
>> struct __packed uc_fw_blob {
>> -	u8 major;
>> -	u8 minor;
>> -	const char *path;
>> -};
>> -
>> -#define UC_FW_BLOB(major_, minor_, path_) \
>> -	{ .major = major_, .minor = minor_, .path = path_ }
>> -
>> -#define GUC_FW_BLOB(prefix_, major_, minor_, patch_) \
>> -	UC_FW_BLOB(major_, minor_, \
>> -		   MAKE_GUC_FW_PATH(prefix_, major_, minor_, patch_))
>> -
>> -#define HUC_FW_BLOB(prefix_) \
>> -	UC_FW_BLOB(0, 0, MAKE_HUC_FW_PATH(prefix_))
>> -
>> -#define HUC_FW_VERSION_BLOB(prefix_, major_, minor_, bld_num_) \
>> -	UC_FW_BLOB(major_, minor_, \
>> -		   MAKE_HUC_FW_PATH_FULL_VER(prefix_, major_, minor_,
>> bld_num_))
>> -
>> -struct uc_fw_platform_requirement {
>> -	enum xe_platform p;
>> -	const struct uc_fw_blob blob;
>> -};
>> -
>> -#define MAKE_FW_LIST(platform_, uc_) \
>> -{ \
>> -	.p = XE_##platform_, \
>> -	.blob = uc_, \
>> -},
>> -
>> -struct fw_blobs_by_type {
>> -	const struct uc_fw_platform_requirement *blobs;
>> -	u32 count;
>> -};
>> -
>>  static void
>>  uc_fw_auto_select(struct xe_device *xe, struct xe_uc_fw *uc_fw)  {
>> -	static const struct uc_fw_platform_requirement blobs_guc[] = {
>> -		XE_GUC_FIRMWARE_DEFS(MAKE_FW_LIST, GUC_FW_BLOB)
>> +	static const struct uc_fw_entry entries_guc[] = {
>> +		XE_GUC_FIRMWARE_DEFS(XE_UC_FW_ENTRY,
>> +				     uc_fw_entry_mmp_ver,
>> +				     uc_fw_entry_major_ver)
>>  	};
>> -	static const struct uc_fw_platform_requirement blobs_huc[] = {
>> -		XE_HUC_FIRMWARE_DEFS(MAKE_FW_LIST, HUC_FW_BLOB,
>> HUC_FW_VERSION_BLOB)
>> +	static const struct uc_fw_entry entries_huc[] = {
>> +		XE_HUC_FIRMWARE_DEFS(XE_UC_FW_ENTRY,
>> +				     uc_fw_entry_mmp_ver,
>> +				     uc_fw_entry_no_ver)
>>  	};
>>  	static const struct fw_blobs_by_type
>> blobs_all[XE_UC_FW_NUM_TYPES] = {
>> -		[XE_UC_FW_TYPE_GUC] = { blobs_guc, ARRAY_SIZE(blobs_guc)
>> },
>> -		[XE_UC_FW_TYPE_HUC] = { blobs_huc, ARRAY_SIZE(blobs_huc)
>> },
>> +		[XE_UC_FW_TYPE_GUC] = { entries_guc,
>> ARRAY_SIZE(entries_guc) },
>> +		[XE_UC_FW_TYPE_HUC] = { entries_huc,
>> ARRAY_SIZE(entries_huc) },
>>  	};
>> -	static const struct uc_fw_platform_requirement *fw_blobs;
>> +	static const struct uc_fw_entry *entries;
>>  	enum xe_platform p = xe->info.platform;
>> -	u32 fw_count;
>> +	u32 count;
>>  	int i;
>>
>>  	XE_BUG_ON(uc_fw->type >= ARRAY_SIZE(blobs_all));
>> -	fw_blobs = blobs_all[uc_fw->type].blobs;
>> -	fw_count = blobs_all[uc_fw->type].count;
>> -
>> -	for (i = 0; i < fw_count && p <= fw_blobs[i].p; i++) {
>> -		if (p == fw_blobs[i].p) {
>> -			const struct uc_fw_blob *blob = &fw_blobs[i].blob;
>> -
>> -			uc_fw->path = blob->path;
>> -			uc_fw->major_ver_wanted = blob->major;
>> -			uc_fw->minor_ver_wanted = blob->minor;
>> +	entries = blobs_all[uc_fw->type].entries;
>> +	count = blobs_all[uc_fw->type].count;
>> +
>> +	for (i = 0; i < count && p <= entries[i].platform; i++) {
>> +		if (p == entries[i].platform) {
>> +			uc_fw->path = entries[i].path;
>> +			uc_fw->major_ver_wanted = entries[i].major;
>> +			uc_fw->minor_ver_wanted = entries[i].minor;
>> +			uc_fw->full_ver_required = entries[i].full_ver_required;
>>  			break;
>>  		}
>>  	}
>> @@ -227,6 +273,47 @@ static void guc_read_css_info(struct xe_uc_fw *uc_fw,
>> struct uc_css_header *css)
>>  	uc_fw->private_data_size = css->private_data_size;  }
>>
>> +static int uc_fw_check_version_requirements(struct xe_uc_fw *uc_fw) {
>> +	struct xe_device *xe = uc_fw_to_xe(uc_fw);
>> +
>> +	/* Driver has no requirement on any version, any is good. */
>> +	if (!uc_fw->major_ver_wanted)
>> +		return 0;
>> +
>> +	/*
>> +	 * If full version is required, both major and minor should match.
>> +	 * Otherwise, at least the major version.
>> +	 */
>> +	if (uc_fw->major_ver_wanted != uc_fw->major_ver_found ||
>> +	    (uc_fw->full_ver_required &&
>> +	     uc_fw->minor_ver_wanted != uc_fw->minor_ver_found)) {
>> +		drm_notice(&xe->drm, "%s firmware %s: unexpected version:
>> %u.%u != %u.%u\n",
>> +			   xe_uc_fw_type_repr(uc_fw->type), uc_fw->path,
>> +			   uc_fw->major_ver_found, uc_fw->minor_ver_found,
>> +			   uc_fw->major_ver_wanted, uc_fw-
>> >minor_ver_wanted);
>> +		goto fail;
>> +	}
>> +
>> +	if (uc_fw->minor_ver_wanted > uc_fw->minor_ver_found) {
>> +		drm_notice(&xe->drm, "%s firmware (%u.%u) is recommended,
>> but only (%u.%u) was found in %s\n",
>> +			   xe_uc_fw_type_repr(uc_fw->type),
>> +			   uc_fw->major_ver_wanted, uc_fw-
>> >minor_ver_wanted,
>> +			   uc_fw->major_ver_found, uc_fw->minor_ver_found,
>> +			   uc_fw->path);
>> +		drm_info(&xe->drm, "Consider updating your linux-firmware
>> pkg or downloading from %s\n",
>> +			 XE_UC_FIRMWARE_URL);
>> +	}
>> +
>> +	return 0;
>> +
>> +fail:
>> +	if (xe_uc_fw_is_overridden(uc_fw))
>> +		return 0;
>> +
>> +	return -ENOEXEC;
>> +}
>> +
>>  int xe_uc_fw_init(struct xe_uc_fw *uc_fw)  {
>>  	struct xe_device *xe = uc_fw_to_xe(uc_fw); @@ -308,19 +395,9 @@
>> int xe_uc_fw_init(struct xe_uc_fw *uc_fw)
>>  	uc_fw->minor_ver_found = FIELD_GET(CSS_SW_VERSION_UC_MINOR,
>>  					   css->sw_version);
>>
>> -	if (uc_fw->major_ver_wanted) {
>> -		if (uc_fw->major_ver_found != uc_fw->major_ver_wanted ||
>> -		    uc_fw->minor_ver_found < uc_fw->minor_ver_wanted) {
>> -			drm_notice(&xe->drm, "%s firmware %s: unexpected
>> version: %u.%u != %u.%u\n",
>> -				   xe_uc_fw_type_repr(uc_fw->type), uc_fw-
>> >path,
>> -				   uc_fw->major_ver_found, uc_fw-
>> >minor_ver_found,
>> -				   uc_fw->major_ver_wanted, uc_fw-
>> >minor_ver_wanted);
>> -			if (!xe_uc_fw_is_overridden(uc_fw)) {
>> -				err = -ENOEXEC;
>> -				goto fail;
>> -			}
>> -		}
>> -	}
>> +	err = uc_fw_check_version_requirements(uc_fw);
>> +	if (err)
>> +		goto fail;
>>
>>  	if (uc_fw->type == XE_UC_FW_TYPE_GUC)
>>  		guc_read_css_info(uc_fw, css);
>> diff --git a/drivers/gpu/drm/xe/xe_uc_fw.h b/drivers/gpu/drm/xe/xe_uc_fw.h
>> index bf31c3bb0e0f..e16267e71280 100644
>> --- a/drivers/gpu/drm/xe/xe_uc_fw.h
>> +++ b/drivers/gpu/drm/xe/xe_uc_fw.h
>> @@ -175,6 +175,6 @@ static inline u32 xe_uc_fw_get_upload_size(struct
>> xe_uc_fw *uc_fw)
>>  	return __xe_uc_fw_get_upload_size(uc_fw);
>>  }
>>
>> -#define XE_UC_FIRMWARE_URL
>> "https://git.kernel.org/pub/scm/linux/kernel/git/firmware/linux-
>> firmware.git/tree/i915"
>> +#define XE_UC_FIRMWARE_URL
>> "https://git.kernel.org/pub/scm/linux/kernel/git/firmware/linux-firmware.git"
>>
>>  #endif
>> diff --git a/drivers/gpu/drm/xe/xe_uc_fw_types.h
>> b/drivers/gpu/drm/xe/xe_uc_fw_types.h
>> index 1cfd30a655df..6c595aaa2399 100644
>> --- a/drivers/gpu/drm/xe/xe_uc_fw_types.h
>> +++ b/drivers/gpu/drm/xe/xe_uc_fw_types.h
>> @@ -78,6 +78,13 @@ struct xe_uc_fw {
>>  	const char *path;
>>  	/** @user_overridden: user provided path to uC firmware via
>> modparam */
>>  	bool user_overridden;
>> +	/**
>> +	 * @full_version_required: driver still under development and not ready
>> +	 * for backward-compatible firmware. To be used only for **new**
>> +	 * platforms, i.e. still under require_force_probe protection and not
>> +	 * supported by i915.
>> +	 */
>> +	bool full_ver_required;
>>  	/** @size: size of uC firmware including css header */
>>  	size_t size;
>>
>> --
>> 2.39.0
>
