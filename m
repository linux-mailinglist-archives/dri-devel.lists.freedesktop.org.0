Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 9E51E6C8982
	for <lists+dri-devel@lfdr.de>; Sat, 25 Mar 2023 01:06:47 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8B39F10E1BD;
	Sat, 25 Mar 2023 00:06:42 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 185C510E15B;
 Sat, 25 Mar 2023 00:06:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1679702800; x=1711238800;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=URGRBEhONDsP+JgOWPyYOcxJIcVZY+QJ0FGQ1fVJUUg=;
 b=H/grVTp9A1MTre/fmuEpBBAwTld5xjmG/sMKMAnr1RB/6vq4kGNWyNx3
 aSyhFxn3p5RH5c6Lj8LbUZQD3QO1k/XbUIsePSm6G3RqiwTnxfhKKyDrc
 4zTqgwvVC2uRsZVJ9oSvcG0E0ji6/izsOEk1BbCFwiCnz1xSpb3fHBE31
 X5tOVjbuagQLVkwB9FpETG7zv5MY9raft+VqIzKbblwaQIodatZIKh135
 oTkLj/DCn5cup4A3uYAhu4k2aBhGDytwvS1ya+D5C7GHoWK5xyfa8ueoN
 lVVHV4Lb3FU7s25tDlq5TKXMwV8EZjCFvFL+yL/Uias73hN/IHi88tk2g g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10659"; a="367650272"
X-IronPort-AV: E=Sophos;i="5.98,289,1673942400"; d="scan'208";a="367650272"
Received: from orsmga002.jf.intel.com ([10.7.209.21])
 by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 24 Mar 2023 17:06:39 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10659"; a="682857562"
X-IronPort-AV: E=Sophos;i="5.98,289,1673942400"; d="scan'208";a="682857562"
Received: from orsmsx602.amr.corp.intel.com ([10.22.229.15])
 by orsmga002.jf.intel.com with ESMTP; 24 Mar 2023 17:06:39 -0700
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX602.amr.corp.intel.com (10.22.229.15) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.21; Fri, 24 Mar 2023 17:06:38 -0700
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.21; Fri, 24 Mar 2023 17:06:38 -0700
Received: from ORSEDG601.ED.cps.intel.com (10.7.248.6) by
 orsmsx610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.21 via Frontend Transport; Fri, 24 Mar 2023 17:06:38 -0700
Received: from NAM10-BN7-obe.outbound.protection.outlook.com (104.47.70.104)
 by edgegateway.intel.com (134.134.137.102) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.21; Fri, 24 Mar 2023 17:06:38 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Ip8/Zh8MHS05D1sF/ZOmH9tG0Ac3cIsLlDDmzNdYsh7cVZhjOKWXJguYGsY4ggfEQGKZYhP9WPdq3bY1qpslZVGqeQGbfRzs+SQYj75ekS3rYlpRCo67eqq2U78p6irzdLeZbwW5U/2xpwDLeNKauCFxE55tBJYJA03uriQ46k3jtbAbCyyUcqVqJJs3kfCYAH7pTH5vnl5Tt92ewJN9bUhMQx25KNAzqyzr13c3DuC4rWHl0yhaI1aNrxTNGcFJfRClgoPtnQclMPRcJ14IQuOKBeARRu6M/6W9wTJmq7sp7BfDrNFA1pCKH1xH8SFyqWtlmScLiQ/RRTRDQo6v3g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=lr2xX7r+rLfh9lfGean6dqeHXo4y9Zt4FLRO1bW1xro=;
 b=ben2ehDcDcee3OuQPj2lNmPRDnpmBuPO/R1k4mm9r09JbpKsW9ypijqWqqIWzppGvwVUPRigYCCtTKaRgoZaiejEJrJwIHRVyV8CtOkm5mOx/ZKemq40NrZD85zjOw98InilYnxEEMaa5k6v0nFYfTziTJbSmnNMsS/PHCZWCpBZiAFcy55kVP2NZITaPVMvds8ej3CUd2D8FVNZQzM5uhVsdqwVll1qja4WWTLlN5qKSzbSmP756fQ5iQQFqCZ6Qa41dAyLXXHN91wyKjltgikh+p4R4UaO7Xbr0H6htPSGj2FpJ+Fu+2d8oyYaM/lO33Kx9BkIPkGJZ9ehzeFgiw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from BY5PR11MB4274.namprd11.prod.outlook.com (2603:10b6:a03:1c1::23)
 by DM6PR11MB4721.namprd11.prod.outlook.com (2603:10b6:5:2a3::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6178.38; Sat, 25 Mar
 2023 00:06:35 +0000
Received: from BY5PR11MB4274.namprd11.prod.outlook.com
 ([fe80::5c78:a264:4cea:6fa5]) by BY5PR11MB4274.namprd11.prod.outlook.com
 ([fe80::5c78:a264:4cea:6fa5%5]) with mapi id 15.20.6178.038; Sat, 25 Mar 2023
 00:06:35 +0000
Message-ID: <7b24abc4-30df-227c-bb6c-04de96e59f40@intel.com>
Date: Fri, 24 Mar 2023 17:06:33 -0700
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Firefox/102.0 Thunderbird/102.8.0
Subject: Re: [PATCH] drm/i915/guc: Disable PL1 power limit when loading GuC
 firmware
Content-Language: en-US
To: "Dixit, Ashutosh" <ashutosh.dixit@intel.com>
References: <20230316035954.2593843-1-ashutosh.dixit@intel.com>
 <4760d41f-c237-9f97-eb32-5d2ab05eea20@intel.com>
 <87sfdtload.wl-ashutosh.dixit@intel.com>
From: "Belgaumkar, Vinay" <vinay.belgaumkar@intel.com>
In-Reply-To: <87sfdtload.wl-ashutosh.dixit@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: BYAPR05CA0093.namprd05.prod.outlook.com
 (2603:10b6:a03:e0::34) To BY5PR11MB4274.namprd11.prod.outlook.com
 (2603:10b6:a03:1c1::23)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BY5PR11MB4274:EE_|DM6PR11MB4721:EE_
X-MS-Office365-Filtering-Correlation-Id: a1baad19-a36d-424e-72ce-08db2cc4cc1e
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: ft7BODJSmfI61Smn9qczKGZIRgvButDfD4AkKZSlWGDVPkvkgd3+RYEJM3KlM7NAPtOKoGOdXb6Y1Bg7qay3NCZT4L2Ie8jwD5Z12T4n2ZpnpPhDwEM5ux95G8V0Xtw2GNcwLjsIkX5iwvzNToNcQqJURme0FyCcb68mn38YOAIgIl6g2ap5PmVYMGziKlS9JatAXfVXPcf7d1on2prKwW9QGT0LRBmybBIvxi7Xl2mexCuW+Liv1vnWkPVYOG9FTAtiW7FHjNHzMgwLwUTdciOkyh0bES3l57rx+FzXImPNGFWpLQtWrTRaeFLyvodGWg0VlSJFvofsXJOynuS79hhSEK0TqKLG+l2Uv6Roh9jLGooYdkBFssIUdKZWuAptox3TJjOckUao5HgzVhVn3ZyFN6XUO9HU6wJ9T1Xn4EkRkJ3lccSYuzAHugYEx41Qq3SRySsFovrBeik9NxpjcoXj2zheTuknCalacbsrHrsuBDYOOnt2ewH9ni9QaFe3bE9zaBsBV6eswDqVoaJTfZ4ftt32bIPWbKvSnAY7N3a4Ks8srjeCHk5MmcnREaEEO0wIQOstfTDw9d/cCT9HCP8qaGLOGEkTXyLiEpnQ28FYz7xtHxKTPeQ7qESjvyA7qUIrncznu5LYyk31rCkkpfguHUbflsX/Uml1uapy1UGJIWiU+UE3ZCLWCPmub4CH9oY12JUTC2fFZ0AAZYtUAw==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BY5PR11MB4274.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230028)(346002)(366004)(136003)(39860400002)(376002)(396003)(451199021)(31696002)(82960400001)(66899021)(86362001)(5660300002)(41300700001)(2616005)(31686004)(66556008)(8936002)(37006003)(4326008)(6862004)(6506007)(53546011)(186003)(66476007)(6636002)(54906003)(38100700002)(83380400001)(66946007)(36756003)(6512007)(30864003)(966005)(6486002)(26005)(8676002)(316002)(478600001)(2906002)(45980500001)(43740500002)(473944003);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?MFpMc0krMjl5bnBJMEMvUm9OQktCMVN1M1d6NHQ0RzVnNmJkT05PVGtHMkFp?=
 =?utf-8?B?elduMVY4OG94ZTA2YkpoMElrb2tLVU0rcXJibFhXTVB5ZHJybDVSRWNNbjY5?=
 =?utf-8?B?K01vbEc4bjdKSFpkUjA0Sm5ndkpiSjhRbUoxUUpUTStoSVBZVEpzNGtici9M?=
 =?utf-8?B?Yis3QUdja2lDQTJaY3NhZXlXbkI2K1NaY3FmSjJTMk1YbUxZUmlHRXRhU3lC?=
 =?utf-8?B?eUxHVWlISWpERDVvMVZCVm5oeEpYT0VVNEN6QkhQOElHNllESGwwWkJaNmFl?=
 =?utf-8?B?SmtwWmdyQUg2UHNLRnluYW9FVERRdGUwKzBxREc0dTZDeVBURS9GQTJ2OTNO?=
 =?utf-8?B?VHA0RVB1eUhZWHVKeVNjT21LMCttTHJKV0Z6M1NOYjhBRUlRZUNpRGNWRGpU?=
 =?utf-8?B?Zjkzd1YyaWRwK1Z3TmNVSGl4TGYvdHJBUG9IbCsvMVE0UnJSUGFLcXRDd2M4?=
 =?utf-8?B?RWF4Z09kWXlVMTBhb3YyWnh1NEc5YnRGakF3ZGxhUmM5S21sNmZxeW1rYVQw?=
 =?utf-8?B?cTdkQ2JXQnFWN0tFVWlzaU05NzdjKzRVV2kyWHZBYmlyNkNnaDJJM0pvRXp1?=
 =?utf-8?B?WE1BclBDN082TUN1aERud2M1MktmQy9Pc3ZLVDR1S3p5T1QzdVByK1MxK3hU?=
 =?utf-8?B?NkoxSVoyMGp5SWRDTXVJTGFhenQwKzJRdTNMdHROWHQ2Nks0ZFZEK292T2FX?=
 =?utf-8?B?YXQ1ejRnbTBINHlzQlU5bjFlODh5aTlZd1BMWFI0YW5TN0RoTVVVbkdJWExJ?=
 =?utf-8?B?WjlYQWxwUlNnOHdzMTVVL1JWbFBlVW1lWkFiSnhpbFREM2xidXBWcFVOcEVK?=
 =?utf-8?B?cEgrakYrSDV1YjNOZm4rZW5zRnVMZk5pWEp1cUNRNENFR1RRLy8wdmdxU29y?=
 =?utf-8?B?a1ZmWTloa3B0WWZ5ZDZnc0c3Qzl3TkxXeURIU2hGbld3aVJ0QjRVRytLcE9v?=
 =?utf-8?B?L1ZnSk1wQXNKRG5DdlhSYUUrd2tFdnZKekhJUkQ3bk1BTlU5U09qczZyUHBh?=
 =?utf-8?B?TEhPY3Qxa0NDUVJPbVl3SDBUaDdzYUM1REluaFpQeXRxQkFpVXcraVdPall5?=
 =?utf-8?B?NGpZa2RvN2JaSkMzMEZNc3ZpZWozVHBkMWtlaUNvaldSM2xEdzBxT2RTbGpT?=
 =?utf-8?B?VU1HOVRHMkMxd3lVOGNwQXNZTzFFeDFiZ28zejl1ME1QR3VYcDlGNVFJb2ov?=
 =?utf-8?B?MTdWdm5zY0FZMzNEY2VHQ0Z4VGxqUlZ5V09Ya1ZoQnJydE41Z1dGcEtjcEVK?=
 =?utf-8?B?eUVIckZyVlZUTlZtUjVkN3BGSGhQVzQyM0VLZTVucFZUdTRXaDhsVkl1RWlQ?=
 =?utf-8?B?cXVYUUxoTG9aWmNvU1VpaTltUUs4Rjg1MGFiOVAxT1hiSkVMRVphRW0xdkJo?=
 =?utf-8?B?TnhDdDVMclgwYjdjdGxDYTFhSGFPQzljUHhkbnBpblNBUGtKMzVwc1BHN2dV?=
 =?utf-8?B?OVVDMkJONEhZYlA4TmtRZ0ptblNjRTE4c3BMQUlacmZEQTZQSHk2K1Y4ZjFJ?=
 =?utf-8?B?cHR4SHJwajRGUXdEY3NET05EWC9ST2g4NEtZbkJWWjNIN3AxU1ptVFJKOW51?=
 =?utf-8?B?MmlsaFVYUnBMdDNhelE5dmNUbjRtZDhyR3Y5aDVHOC9VbXROWHVndFNwQ3Nv?=
 =?utf-8?B?bGtDUzUzNTdhdVRQMXNDVHpSQ0pvNlQzZXlVSXNWeFJKclFsSlVsN01XR1Nm?=
 =?utf-8?B?Q3h6ZGR1cmZxTm42YTJ4ZGt6NVhEVVoycmJVbUh0eUI1Z21PR3VsQm94QVRW?=
 =?utf-8?B?eVhCaFhNWkdNQTJzYzlXUWpuWUVLZ1pVZkxQU1FqS3hnNGwwcVhmMTZrM2xp?=
 =?utf-8?B?aHRxRUZsQjJkY3ZCSzI3cTNYOEJ4ek5hSzVDVXFTRUZvRFVqYXhTT1VUeWZs?=
 =?utf-8?B?ZG82N09rTnpvcHNjRHd4VmdtZXVUOEdpMmNjNlNINjBKWmxjUWpSVTNwaWhq?=
 =?utf-8?B?VFZORFVGMGRxc05ZaVZpcWFJMk5DY1psaTJkVm5wcCtFK2crRmJOUEVvK3hR?=
 =?utf-8?B?S3pnM3dObEFJVWZGWTg5Umk0TnlRRVgwdzB0ZmNzbWxpNUJjWmlGemtVdG84?=
 =?utf-8?B?SmlZNExtZ0U4cVJ0OWxoenNjb2phUExpOUJySSt4U3NrVHduMEhCaCt1Z0Rv?=
 =?utf-8?B?bGhJUUdlZ040SWU5Z0V5UUNrQUFhQndYM0xWaFVwQjBRc1FWU0RMQVVzTHl2?=
 =?utf-8?B?RlE9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: a1baad19-a36d-424e-72ce-08db2cc4cc1e
X-MS-Exchange-CrossTenant-AuthSource: BY5PR11MB4274.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 25 Mar 2023 00:06:35.4535 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: tcwht5CpmUyi3gOcECmv3BZQXRgwN4y/ge2b+pfcUIFyJNtDHTcpIYJ6MYrIUrpd2cjaneSw6BTPWhx8XI4aA3arV8zIOT0NNOwqX7cBgRw=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR11MB4721
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
Cc: intel-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 Badal Nilawar <badal.nilawar@intel.com>, Rodrigo Vivi <rodrigo.vivi@intel.com>,
 John Harrison <john.c.harrison@intel.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


On 3/24/2023 4:31 PM, Dixit, Ashutosh wrote:
> On Fri, 24 Mar 2023 11:15:02 -0700, Belgaumkar, Vinay wrote:
> Hi Vinay,
>
> Thanks for the review. Comments inline below.
Sorry about asking the same questions all over again :) Didn't look at 
previous versions.
>
>> On 3/15/2023 8:59 PM, Ashutosh Dixit wrote:
>>> On dGfx, the PL1 power limit being enabled and set to a low value results
>>> in a low GPU operating freq. It also negates the freq raise operation which
>>> is done before GuC firmware load. As a result GuC firmware load can time
>>> out. Such timeouts were seen in the GL #8062 bug below (where the PL1 power
>>> limit was enabled and set to a low value). Therefore disable the PL1 power
>>> limit when allowed by HW when loading GuC firmware.
>> v3 label missing in subject.
>>> v2:
>>>    - Take mutex (to disallow writes to power1_max) across GuC reset/fw load
>>>    - Add hwm_power_max_restore to error return code path
>>>
>>> v3 (Jani N):
>>>    - Add/remove explanatory comments
>>>    - Function renames
>>>    - Type corrections
>>>    - Locking annotation
>>>
>>> Link: https://gitlab.freedesktop.org/drm/intel/-/issues/8062
>>> Signed-off-by: Ashutosh Dixit <ashutosh.dixit@intel.com>
>>> ---
>>>    drivers/gpu/drm/i915/gt/uc/intel_uc.c |  9 +++++++
>>>    drivers/gpu/drm/i915/i915_hwmon.c     | 39 +++++++++++++++++++++++++++
>>>    drivers/gpu/drm/i915/i915_hwmon.h     |  7 +++++
>>>    3 files changed, 55 insertions(+)
>>>
>>> diff --git a/drivers/gpu/drm/i915/gt/uc/intel_uc.c b/drivers/gpu/drm/i915/gt/uc/intel_uc.c
>>> index 4ccb4be4c9cba..aa8e35a5636a0 100644
>>> --- a/drivers/gpu/drm/i915/gt/uc/intel_uc.c
>>> +++ b/drivers/gpu/drm/i915/gt/uc/intel_uc.c
>>> @@ -18,6 +18,7 @@
>>>    #include "intel_uc.h"
>>>      #include "i915_drv.h"
>>> +#include "i915_hwmon.h"
>>>      static const struct intel_uc_ops uc_ops_off;
>>>    static const struct intel_uc_ops uc_ops_on;
>>> @@ -461,6 +462,7 @@ static int __uc_init_hw(struct intel_uc *uc)
>>> 	struct intel_guc *guc = &uc->guc;
>>> 	struct intel_huc *huc = &uc->huc;
>>> 	int ret, attempts;
>>> +	bool pl1en;
>> Init to 'false' here
> See next comment.
>
>>
>>> 		GEM_BUG_ON(!intel_uc_supports_guc(uc));
>>> 	GEM_BUG_ON(!intel_uc_wants_guc(uc));
>>> @@ -491,6 +493,9 @@ static int __uc_init_hw(struct intel_uc *uc)
>>> 	else
>>> 		attempts = 1;
>>>    +	/* Disable a potentially low PL1 power limit to allow freq to be
>>> raised */
>>> +	i915_hwmon_power_max_disable(gt->i915, &pl1en);
>>> +
>>> 	intel_rps_raise_unslice(&uc_to_gt(uc)->rps);
>>> 		while (attempts--) {
>>> @@ -547,6 +552,8 @@ static int __uc_init_hw(struct intel_uc *uc)
>>> 		intel_rps_lower_unslice(&uc_to_gt(uc)->rps);
>>> 	}
>>>    +	i915_hwmon_power_max_restore(gt->i915, pl1en);
>>> +
>>> 	guc_info(guc, "submission %s\n", str_enabled_disabled(intel_uc_uses_guc_submission(uc)));
>>> 	guc_info(guc, "SLPC %s\n", str_enabled_disabled(intel_uc_uses_guc_slpc(uc)));
>>>    @@ -563,6 +570,8 @@ static int __uc_init_hw(struct intel_uc *uc)
>>> 	/* Return GT back to RPn */
>>> 	intel_rps_lower_unslice(&uc_to_gt(uc)->rps);
>>>    +	i915_hwmon_power_max_restore(gt->i915, pl1en);
>> if (pl1en)
>>
>>      i915_hwmon_power_max_enable().
> IMO it's better not to have checks in the main __uc_init_hw() function (if
> we do this we'll need to add 2 checks in __uc_init_hw()). If you really
> want we could do something like this inside
> i915_hwmon_power_max_disable/i915_hwmon_power_max_restore. But for now I
> am not making any changes.
ok.
>
> (I can send a patch with the changes if you want to take a look but IMO it
> will add more logic/code but without real benefits (it will save a rmw if
> the limit was already disabled, but IMO this code is called so infrequently
> (only during GuC resets) as to not have any significant impact)).
>
>>> +
>>> 	__uc_sanitize(uc);
>>> 		if (!ret) {
>>> diff --git a/drivers/gpu/drm/i915/i915_hwmon.c b/drivers/gpu/drm/i915/i915_hwmon.c
>>> index ee63a8fd88fc1..769b5bda4d53f 100644
>>> --- a/drivers/gpu/drm/i915/i915_hwmon.c
>>> +++ b/drivers/gpu/drm/i915/i915_hwmon.c
>>> @@ -444,6 +444,45 @@ hwm_power_write(struct hwm_drvdata *ddat, u32 attr, int chan, long val)
>>> 	}
>>>    }
>>>    +void i915_hwmon_power_max_disable(struct drm_i915_private *i915, bool
>>> *old)
>> Shouldn't we call this i915_hwmon_package_pl1_disable()?
> I did think of using "pl1" in the function name but then decided to retain
> "power_max" because other hwmon functions for PL1 limit also use
> "power_max" (hwm_power_max_read/hwm_power_max_write) and currently
> "hwmon_power_max" is mapped to the PL1 limit. So "power_max" is used to
> show that all these functions deal with the PL1 power limit.
>
> There is a comment in __uc_init_hw() explaining "power_max" means the PL1
> power limit.
ok.
>
>>> +	__acquires(i915->hwmon->hwmon_lock)
>>> +{
>>> +	struct i915_hwmon *hwmon = i915->hwmon;
>>> +	intel_wakeref_t wakeref;
>>> +	u32 r;
>>> +
>>> +	if (!hwmon || !i915_mmio_reg_valid(hwmon->rg.pkg_rapl_limit))
>>> +		return;
>>> +
>>> +	/* Take mutex to prevent concurrent hwm_power_max_write */
>>> +	mutex_lock(&hwmon->hwmon_lock);
>>> +
>>> +	with_intel_runtime_pm(hwmon->ddat.uncore->rpm, wakeref)
>>> +		r = intel_uncore_rmw(hwmon->ddat.uncore,
>>> +				     hwmon->rg.pkg_rapl_limit,
>>> +				     PKG_PWR_LIM_1_EN, 0);
>> Most of this code (lock and rmw parts) is already inside static void
>> hwm_locked_with_pm_intel_uncore_rmw() , can we reuse that here?
> This was the case in v1 of the patch:
>
> https://patchwork.freedesktop.org/patch/526393/?series=115003&rev=1
>
> But now this cannot be done because if you notice we acquire the mutex in
> i915_hwmon_power_max_disable() and release the mutex in
> i915_hwmon_power_max_restore().
>
> I explained the reason why this the mutex is handled this way in my reply
> to Jani Nikula here:
>
> https://patchwork.freedesktop.org/patch/526598/?series=115003&rev=2
>
> Quoting below:
>
> ```
>>> +	/* hwmon_lock mutex is unlocked in hwm_power_max_restore */
>> Not too happy about that... any better ideas?
> Afais, taking the mutex is the only fully correct solution (when we disable
> the power limit, userspace can go re-enable it). Examples of partly
> incorrect solutions (which don't take the mutex) include:
>
> a. Don't take the mutex, don't do anything, ignore any changes to the value
>     if it has changed during GuC reset/fw load (just overwrite the changed
>     value). Con: changed value is lost.
>
> b. Detect if the value has changed (the limit has been re-enabled) after we
>     have disabled the limit and in that case skip restoring the value. But
>     then someone can say why do we allow enabling the PL1 limit since we
>     want to disable it.
>
> Both these are very unlikely scenarios so they might work. But I would
> first like to explore if holding a mutex across GuC reset is prolebmatic
> since that is /the/ correct solution. But if anyone comes up with a reason
> why that cannot be done we can look at these other not completely correct
> options.

Well, one reason is that this is adding a lot of duplicate/non-reusable 
code needlessly. If it gets re-used elsewhere, that could lead to some 
weird situations where the lock could be held for an extended period of 
time and introduce dependencies. Also, how/why would the user modify 
this PL1 during guc load? The sysfs interfaces are not even ready at 
this point? Even if we consider this during a resume, the terminal will 
not be available to the user.

Thanks,

Vinay.

> ```
>
>>> +
>>> +	*old = !!(r & PKG_PWR_LIM_1_EN);
>>> +}
>>> +
>>> +void i915_hwmon_power_max_restore(struct drm_i915_private *i915, bool old)
>>> +	__releases(i915->hwmon->hwmon_lock)
>> We can just call this i915_hwmon_power_max_enable() and call whenever the
>> old value was actually enabled. That way, we have proper mirror functions.
> As I explained that would mean adding two checks in the main __uc_init_hw()
> function which I am trying to avoid. So we have disable/restore pair.
>
>>> +{
>>> +	struct i915_hwmon *hwmon = i915->hwmon;
>>> +	intel_wakeref_t wakeref;
>>> +
>>> +	if (!hwmon || !i915_mmio_reg_valid(hwmon->rg.pkg_rapl_limit))
>>> +		return;
>>> +
>>> +	with_intel_runtime_pm(hwmon->ddat.uncore->rpm, wakeref)
>>> +		intel_uncore_rmw(hwmon->ddat.uncore,
>>> +				 hwmon->rg.pkg_rapl_limit,
>>> +				 PKG_PWR_LIM_1_EN,
>>> +				 old ? PKG_PWR_LIM_1_EN : 0);
>> 3rd param should be 0 here, else we will end up clearing other bits.
> No see intel_uncore_rmw(), it will only clear the PKG_PWR_LIM_1_EN bit, so
> the code here is correct. intel_uncore_rmw() does:
>
>          val = (old & ~clear) | set;
Ok, just confusing, since you are also setting it with the 4th param.
>
> So for now I am not making any changes, if you feel strongly about
> something one way or another let me know. Anyway these comments should help
> you understand the patch better so take a look and we can go from there.
>
> Thanks.
> --
> Ashutosh
>
>>> +
>>> +	mutex_unlock(&hwmon->hwmon_lock);
>>> +}
>>> +
>>>    static umode_t
>>>    hwm_energy_is_visible(const struct hwm_drvdata *ddat, u32 attr)
>>>    {
>>> diff --git a/drivers/gpu/drm/i915/i915_hwmon.h b/drivers/gpu/drm/i915/i915_hwmon.h
>>> index 7ca9cf2c34c96..0fcb7de844061 100644
>>> --- a/drivers/gpu/drm/i915/i915_hwmon.h
>>> +++ b/drivers/gpu/drm/i915/i915_hwmon.h
>>> @@ -7,14 +7,21 @@
>>>    #ifndef __I915_HWMON_H__
>>>    #define __I915_HWMON_H__
>>>    +#include <linux/types.h>
>>> +
>>>    struct drm_i915_private;
>>> +struct intel_gt;
>>>      #if IS_REACHABLE(CONFIG_HWMON)
>>>    void i915_hwmon_register(struct drm_i915_private *i915);
>>>    void i915_hwmon_unregister(struct drm_i915_private *i915);
>>> +void i915_hwmon_power_max_disable(struct drm_i915_private *i915, bool *old);
>>> +void i915_hwmon_power_max_restore(struct drm_i915_private *i915, bool old);
>>>    #else
>>>    static inline void i915_hwmon_register(struct drm_i915_private *i915) { };
>>>    static inline void i915_hwmon_unregister(struct drm_i915_private *i915) { };
>>> +static inline void i915_hwmon_power_max_disable(struct drm_i915_private *i915, bool *old) { };
>>> +static inline void i915_hwmon_power_max_restore(struct drm_i915_private *i915, bool old) { };
>>>    #endif
>>>      #endif /* __I915_HWMON_H__ */
