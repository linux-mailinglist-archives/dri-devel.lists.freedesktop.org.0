Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 9DE2A7812A9
	for <lists+dri-devel@lfdr.de>; Fri, 18 Aug 2023 20:16:23 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8F44010E548;
	Fri, 18 Aug 2023 18:16:19 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.151])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 71D4110E548
 for <dri-devel@lists.freedesktop.org>; Fri, 18 Aug 2023 18:16:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1692382577; x=1723918577;
 h=from:to:cc:subject:date:message-id:
 content-transfer-encoding:mime-version;
 bh=7IJAw38fUR460SdSWl7eKhO467hAZMMIVQkhcqsAOGw=;
 b=XklAEPKXwgrnmrXvRJcigHXYaClaDdiAX05C6diissv28EFgtSvqhMjK
 6I99EBl5deIIvBnteZr8dcpma6oVGXgy8jb6JxdP07vPRsVx4COeGLUf2
 NPf/oRvq4sQcP4sOzAgPQdUmG0dt7et6dbrbe2P8GlHbntLdiBBrrzAOi
 bmygsTFy7wdFsr6Y2/BXaCfaExkRECbHrqB0BTxJn3o9D5DxiSVpUZgXZ
 OFqb4ZL/0+L4fkOyGFkCz3ljW8NJAyIp7aKxwORvG8jirAgAc/fosatUj
 G7S7VwALSKXGDkv4vNBW5RVskfX4MtC1neuXTwHiQ7auz3frjLjMT7xlT Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10806"; a="353469260"
X-IronPort-AV: E=Sophos;i="6.01,183,1684825200"; d="scan'208";a="353469260"
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
 by fmsmga107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 Aug 2023 11:16:16 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10806"; a="800549328"
X-IronPort-AV: E=Sophos;i="6.01,183,1684825200"; d="scan'208";a="800549328"
Received: from fmsmsx601.amr.corp.intel.com ([10.18.126.81])
 by fmsmga008.fm.intel.com with ESMTP; 18 Aug 2023 11:16:16 -0700
Received: from fmsmsx612.amr.corp.intel.com (10.18.126.92) by
 fmsmsx601.amr.corp.intel.com (10.18.126.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.27; Fri, 18 Aug 2023 11:16:15 -0700
Received: from fmsmsx602.amr.corp.intel.com (10.18.126.82) by
 fmsmsx612.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.27; Fri, 18 Aug 2023 11:16:15 -0700
Received: from fmsedg601.ED.cps.intel.com (10.1.192.135) by
 fmsmsx602.amr.corp.intel.com (10.18.126.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.27 via Frontend Transport; Fri, 18 Aug 2023 11:16:15 -0700
Received: from NAM12-DM6-obe.outbound.protection.outlook.com (104.47.59.173)
 by edgegateway.intel.com (192.55.55.70) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.27; Fri, 18 Aug 2023 11:16:15 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=fBefZ1jdHejQIMPMTVDEYXlnr4x3GSiTNGt8pcvzZzF7J2rTJEvUcq/rhAb+1mlnBB3e3EYse9c+tRzrRW3OymJQq1pzXL+qgQSCVr5YfK8Boj4VGn7Scir9JXl64YHTzFSiIX4rBHCek++NPlFKoAFu3BbWNUhSM/eESN3bPdx+2wZ2P7bIRTnRyIPf1eJh5anlF7wWElN++hdx7UmhsIjCZIGDicBcde410R8ukWenBPRGdnAllFUCZ7SmLDU3ahrDjOkvuq7+Pmn3IuFOhpbzIO30WIdKJkaql/bmULlmGAKKYTdNSAGgo6RUQmvgOX+hw+OuvhpaNtLw3Tw1NQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=P7Mm1zmohH8izbBQ8+PetmZMRSRyhKjqzAdU5ujVwn8=;
 b=DJh9PRG9JGiEQOJiki5yECKF369GBtz/AsMuwVVpspscqec3veTzvnRQSoDQ5iE2ed2kRHCL4q5AEimS35NsnFq2ZF9/9TjZcJJYXMzVRRsarr9RUrQX8A/AdwB48LP3IzMTp0CDYgbuCm/FqVfOEYp09y124pq/j2RG9/+2nOYB7fSZ7lUVQgZ1Pv/qaTR/uOeXu3DBm/vS+OCsZH/+E5v3zrJisblQbuvc+c0N1YTSmG56mj+GKJ/iVUVnO1UtW/ulsF0Mcxq62QUjJRo2Y6PgUKY6AY8az6X4HA1odzlW3aI8sSXy37w+8WDMZx/jFcxFVPDqEw+4g3X9kJqJsQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from MN0PR11MB6059.namprd11.prod.outlook.com (2603:10b6:208:377::9)
 by SA1PR11MB7109.namprd11.prod.outlook.com (2603:10b6:806:2ba::17)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6678.31; Fri, 18 Aug
 2023 18:16:13 +0000
Received: from MN0PR11MB6059.namprd11.prod.outlook.com
 ([fe80::7f94:b6c4:1ce2:294]) by MN0PR11MB6059.namprd11.prod.outlook.com
 ([fe80::7f94:b6c4:1ce2:294%5]) with mapi id 15.20.6699.020; Fri, 18 Aug 2023
 18:16:13 +0000
From: Rodrigo Vivi <rodrigo.vivi@intel.com>
To: <dri-devel@lists.freedesktop.org>, <airlied@gmail.com>,
 <daniel.vetter@ffwll.ch>
Subject: [PATCH 1/5] drm/doc/rfc: No STAGING out of drivers/staging.
Date: Fri, 18 Aug 2023 14:15:58 -0400
Message-ID: <20230818181604.507051-1-rodrigo.vivi@intel.com>
X-Mailer: git-send-email 2.41.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: BYAPR07CA0063.namprd07.prod.outlook.com
 (2603:10b6:a03:60::40) To MN0PR11MB6059.namprd11.prod.outlook.com
 (2603:10b6:208:377::9)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MN0PR11MB6059:EE_|SA1PR11MB7109:EE_
X-MS-Office365-Filtering-Correlation-Id: 550a6262-89ca-402c-fb70-08dba017344f
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: oDKA/IE9ff5cAW1I6H0SDEKT7+6ZwoOiYDms1WIIBGw9YtU+N+kkt+0Si3dajFzoMXB5psF4Zu895ytgLe4XyS0K58UTRyJLrggzR3jxNcQC8PHcF42asbSI8g/tiDCWB1kIX93m/4iP6z8OGej1bc5OyWGBc9ewPjpINskuJKQRep/hN6mI8vmQc2p+BUWEGkgjVwSWPvIuoCv820xVC5ennAKZifod5f0ecvEH3jCtd1IKADY8m/WRKaXlv9zyyRhDFIcFBFglSPQNAJlDHa+6oU8GfPbUG8ZI9QOD+/bq6eMeRhpIi6FNRU/NWrs1Y8j+pa/NeaAXukWDwHyEdWhfG6xRnOuqJ5/olQlzYxE94hUQAxG3rwDjXkDhWJyCuBWMPG/JBa7L8uRZeLS/Z8DgRbk7WyAZnPPavRiOqC3wz6ISvtLv2yVBhU1h9CHbFau/IY+aq9l5CK0d/0VxdvyDdiCWd6FICfFknqyAVS/bKneE4kvAzKerhWjEOOem2lC5DQji8yZqN5lZZlduz65OC9rN4MbNSEZFViSWs4Q=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN0PR11MB6059.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(366004)(39860400002)(396003)(376002)(346002)(136003)(1800799009)(186009)(451199024)(2906002)(83380400001)(66556008)(66946007)(478600001)(6666004)(316002)(6486002)(6506007)(66476007)(44832011)(2616005)(5660300002)(966005)(107886003)(6512007)(1076003)(8676002)(8936002)(41300700001)(4326008)(26005)(86362001)(36756003)(38100700002)(82960400001);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?NzliVXRuTjNMUnJNVW91dHpFVkNJRGRncTIxd3dESDFoRmtmSmNTbUNySHNJ?=
 =?utf-8?B?dEhEZVhBWUJwWC9jRGlOYnhEeUIwMzVJOEdwTXowU0hob3d2WXZQOVZlaWJH?=
 =?utf-8?B?SU50NE5DZkZPQk16NllSejduMVJpeXVoOWZ6RUpYc1FCQ1NoYktldFFVZWF1?=
 =?utf-8?B?QVpSTEM3aDlZQkJiTzlEeVY0Q3AzK2w0U0dXK3haN1F1QmxwcW4vMEEvSk5U?=
 =?utf-8?B?MHZ1MDByVXJ4cUJJYWk4VWdOa3ZIS1FQM3hMMm9aZHc2Nys1aHM1RmJaSVhq?=
 =?utf-8?B?djVpY0hVTkR3YUF1ay80ZkRUcThJVllLMHgvcm05QitPcmlHNVBCcm9rSWRR?=
 =?utf-8?B?RXdtWmdvM0N0NWtER0ZrcWNWdkxWcnVWbk5XZ0MxUXUwc0FhcWt6MGZiVUVv?=
 =?utf-8?B?TlZFNDIxYitIYkZLR2xpZ1lJNjhFVmgzQXNMWmRZWTd5NjVHbHpGN0NJdm9Q?=
 =?utf-8?B?TWZjSy92aSs0Y29ZdjhWMzFJVFNrRUxNc0pZSERRKzE5eWg4cWEwM0NSV1RR?=
 =?utf-8?B?MlpYWUFwOWNiRXZjZ1RQMTBMakFoNDBLY1VYMzJBQzRLa2xCZW9hTEZxdVk1?=
 =?utf-8?B?dHU0S0wxTWtIR21wdXkxNm52R1E4YlQrUFR2eCtJMDE5YlpOUTFPY3pERG9S?=
 =?utf-8?B?dU9CVjF3RGNIbTdDZXZvZlJPRkdPelAzdm90dFNQbkNZd1ZWT2QzMWYyUDBD?=
 =?utf-8?B?WmZMWlVvM1Q3NGp3LzF3aUpSK0tQUklVcnhlenR6TnhvN2txOXJCNGE4UGVk?=
 =?utf-8?B?N2haYkRxNERMS1BqN3htaUtlMkhZT29WeDV3b1ptQlJXNUNjLzdVazRyMnp5?=
 =?utf-8?B?cm5Kd2ZqTXI3TFN1ZE1lOHlBaHcyRW1EbDEvZHZqM2Zub2lqZlJGdlU4RnRh?=
 =?utf-8?B?NnpWeE5zQVNDMnc4RU40Z0FmemNaSUJ4Tk9vYldsQWRSL3ArNGxPQS9rZkFo?=
 =?utf-8?B?bWdnTlUrN0Y1VXE4VXVSSGxlTHRnVzZNZkNlUzg2T1h3bW83K3RrbGwyWVNi?=
 =?utf-8?B?SjFFNzM4QUZTMXF1cHZyTEora0FwUTBSSnVxdVBNT0l3K09TbVRpc3U2MDBC?=
 =?utf-8?B?eEJEZmdUaVNxbVptSjhJZGJPQzd1UjFsV2VkQXY5UFdZR05XbWpyU3l4ZEN2?=
 =?utf-8?B?L3BvazlGajNUK0hkemdMWGY5a0xUTmJNMERGNVpPV0FNa0NNTm9iYUpEdnJo?=
 =?utf-8?B?NE1GKzMxMU5YWFVTNVRZQ2I0Yk4xRWxZRFdCUG1kYitiMzFRSkxzUTZNWlFh?=
 =?utf-8?B?TlAyaXdpZEFBRHRERW9CZ1c5enhObjhsc2JuZXhFa1R5SGtpSFBvUm1vQnVD?=
 =?utf-8?B?WW5tZFZmQ3NIWkgwazBpbll2a3dmM3JpTG1vMmFpaW9Sanl2OXJaNEx1N25m?=
 =?utf-8?B?VHUvR1FlMUJMdldwV00vaVVBVEI4V0tBbC9iYXZGaDN5a2JCN2J5SnU4UFJN?=
 =?utf-8?B?TDMrVGVoeWtMNjkwSU9qaFc0d3NjZjQ3dHBuSzlxWkYzSE9GZnp6WGUvUGw5?=
 =?utf-8?B?YSs3RHI4QVhHOG56NVM5S0MvblErT0lHNmMzcjNybUZaNjljOVRKQ1Zrdktw?=
 =?utf-8?B?cEF6SU10MVIybTZIUjlsMFdmV2hDdlVadUhEVUlEV24wZ3hpdVJoZEVLOVhz?=
 =?utf-8?B?T2hRN0M2MmJHRUpnb0Nhakl4MmJzUTRQNGZyNmgya0JDSDN4d0lPSkdZb2RO?=
 =?utf-8?B?WUdmeUV0WkxGczZOeGpJaGcrL1E1bnBJanE2M3dUNzZVNCtTbWdwc1h5czFE?=
 =?utf-8?B?a1NxcUs1UXlPUUxDY3lZOVo5cGdVNGFCZ2pzK2tpU2xpMk5VYnltYUQ1WWpR?=
 =?utf-8?B?a2wyVGNVeWJBYjhURVVmQlBBWnI1R0FtbCtHVUlWbjNoOXd2dncxQ0xlLzdR?=
 =?utf-8?B?TlJxS1JCTUJ2Qkd5cHpxV1ZZQ00xU29EYVpEV1hHdHFSbDN4MFhxK3lPUWdN?=
 =?utf-8?B?ejlJdnJMMUFHaWhUcGNLTDRyMWptUTE2aXVJdEhWcUI4dmhBMXJsbGNwYVJr?=
 =?utf-8?B?WGx4UDVLUEtGeTJ1WC9rUkhHU3RpYkFyeHdMT25tWjI2WW10RXJ0TDJUdTVI?=
 =?utf-8?B?TzMrUzJ1MHVOMlZBZWRPeFh6RzhZRzZKOVhTZUFNdFRMdFRlL3JZc29XclN0?=
 =?utf-8?Q?GEJSc5/FTqj3lDfdeuICnKw3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 550a6262-89ca-402c-fb70-08dba017344f
X-MS-Exchange-CrossTenant-AuthSource: MN0PR11MB6059.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Aug 2023 18:16:12.8743 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Gh/t1RtrXSks4nQU5JlinmLApLn10MQo6RBV9fVGWE/e9n3Lx+G0XBj3AEz6cWkUVRHxROtoY0ufJkXsKLDnVA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA1PR11MB7109
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
Cc: Rodrigo Vivi <rodrigo.vivi@intel.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Also the uapi should be reviewed and scrutinized before xe
is accepted upstream and we shouldn't cause regression.

Link: https://lore.kernel.org/all/20230630100059.122881-1-thomas.hellstrom@linux.intel.com
Signed-off-by: Rodrigo Vivi <rodrigo.vivi@intel.com>
---
 Documentation/gpu/rfc/xe.rst | 6 ------
 1 file changed, 6 deletions(-)

diff --git a/Documentation/gpu/rfc/xe.rst b/Documentation/gpu/rfc/xe.rst
index 2516fe141db6..3d2181bf3dad 100644
--- a/Documentation/gpu/rfc/xe.rst
+++ b/Documentation/gpu/rfc/xe.rst
@@ -67,12 +67,6 @@ platforms.
 
 When the time comes for Xe, the protection will be lifted on Xe and kept in i915.
 
-Xe driver will be protected with both STAGING Kconfig and force_probe. Changes in
-the uAPI are expected while the driver is behind these protections. STAGING will
-be removed when the driver uAPI gets to a mature state where we can guarantee the
-‘no regression’ rule. Then force_probe will be lifted only for future platforms
-that will be productized with Xe driver, but not with i915.
-
 Xe – Pre-Merge Goals
 ====================
 
-- 
2.41.0

