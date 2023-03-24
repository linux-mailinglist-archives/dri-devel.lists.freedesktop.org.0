Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 093346C8498
	for <lists+dri-devel@lfdr.de>; Fri, 24 Mar 2023 19:15:35 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4F3F310E180;
	Fri, 24 Mar 2023 18:15:30 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1399F10E180;
 Fri, 24 Mar 2023 18:15:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1679681729; x=1711217729;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=XhASnXZHo20k7UFkZmC4Nfr6Plzv5SgYWpNDV2s+LGY=;
 b=LRHZPwhT9R8ZnW/jwpIcHDhwoZRJVqGQg9egJ0e6rlOkl6C/Trq7B0Rd
 lVidL9mJzNk+K7vI/U+S8eCVHNG+8n4KJB1ZJf199oJzCkRSC3acqdNw/
 nDV2TrtWn9PPRjG/u+OIJK6avLhI9LdMntDqpgvog5cImhc5SeWMMPyHs
 eQamqinTFmIeoTGjg6HBHuVlt5C9PzIuOAfcxbuhp7BT8j0w9AFeQvrf/
 LybK76ZMaS4hqiJjVfJ7nqdQqNlWltKr1CbZV/DD3YrbgOzPNqzpgafT5
 qwpr5weZ+/s+nvuKWjmCxcTouu2YPXE4QAiQCV6Ss619jmhxCcd9YnTMr w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10659"; a="367587340"
X-IronPort-AV: E=Sophos;i="5.98,288,1673942400"; d="scan'208";a="367587340"
Received: from orsmga003.jf.intel.com ([10.7.209.27])
 by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 24 Mar 2023 11:15:08 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10659"; a="632922200"
X-IronPort-AV: E=Sophos;i="5.98,288,1673942400"; d="scan'208";a="632922200"
Received: from fmsmsx602.amr.corp.intel.com ([10.18.126.82])
 by orsmga003.jf.intel.com with ESMTP; 24 Mar 2023 11:15:07 -0700
Received: from fmsmsx610.amr.corp.intel.com (10.18.126.90) by
 fmsmsx602.amr.corp.intel.com (10.18.126.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.21; Fri, 24 Mar 2023 11:15:07 -0700
Received: from fmsmsx610.amr.corp.intel.com (10.18.126.90) by
 fmsmsx610.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.21; Fri, 24 Mar 2023 11:15:06 -0700
Received: from fmsedg602.ED.cps.intel.com (10.1.192.136) by
 fmsmsx610.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.21 via Frontend Transport; Fri, 24 Mar 2023 11:15:06 -0700
Received: from NAM11-DM6-obe.outbound.protection.outlook.com (104.47.57.173)
 by edgegateway.intel.com (192.55.55.71) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.21; Fri, 24 Mar 2023 11:15:06 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Zin+2iGB1wHv2P86xGxLXEnQ1ZpFW95/yDRGTD/DzjLiFAAjEcFHvVmoxw1fYVS/91GeDD8v1cDL/dPTUnd31s4ohckuplwt+WpWJ4T8jmtfOb462b4liWd9zpwbXNRY8SX7Ex/JzpRCMsd7ZLM4kgS0+yMl4HhimzMwcLS98oqLIH+LvqF1Zt/ShdcyJ6yxQgv50TiRrA9l5lBMM+5ghiDG8wwHgO4tT4ohpDOQpRkCf0W3bzxLEhTszG2gXyKYRImhQZ4TwxJv2FVSkG7nEPqWl2WhwmWmY148YV5bYAwkwhHPVGcwGvm6lAlAVJ0X9U7cghHxi51/oKaGh7dR2g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=6xGn0y1ziB8bT8EetM0BUr6f8qEgEAwvqsjLl0Sdap8=;
 b=MbgKW0ZutMzSRtENDPPLpId0trOhPChFp86ub4TTOTT9K85iwKth/24NjnT52bum7BytzCKK/MNGD5FdqTfrx1H8V5oA07LGKD4kgcjH62XkF5Uf5HsoAeXJKGJtW+bnysf+pSOQVnZbgIWYR8qc3T1WWHyFOC/4Y7iDs2FIEeDUCzc9hsKTMkyclAifC3i737X6VtR7pXK5UExvHmXpvjvKJNfOwTNFhnsu2hdBS5IQIKgva4fB+OKaEUvhabxhtXTGZ7KP7VnWh1qkfIJ9QS7kshZq6TNwPWvaYHB4UytbEveCvZP3MdmZ7vqla3/GBW6rePItIiYlH77NeKJiag==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from BY5PR11MB4274.namprd11.prod.outlook.com (2603:10b6:a03:1c1::23)
 by CO1PR11MB4898.namprd11.prod.outlook.com (2603:10b6:303:92::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6178.38; Fri, 24 Mar
 2023 18:15:04 +0000
Received: from BY5PR11MB4274.namprd11.prod.outlook.com
 ([fe80::5c78:a264:4cea:6fa5]) by BY5PR11MB4274.namprd11.prod.outlook.com
 ([fe80::5c78:a264:4cea:6fa5%5]) with mapi id 15.20.6178.038; Fri, 24 Mar 2023
 18:15:04 +0000
Message-ID: <4760d41f-c237-9f97-eb32-5d2ab05eea20@intel.com>
Date: Fri, 24 Mar 2023 11:15:02 -0700
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Firefox/102.0 Thunderbird/102.8.0
Subject: Re: [PATCH] drm/i915/guc: Disable PL1 power limit when loading GuC
 firmware
Content-Language: en-US
To: Ashutosh Dixit <ashutosh.dixit@intel.com>,
 <intel-gfx@lists.freedesktop.org>
References: <20230316035954.2593843-1-ashutosh.dixit@intel.com>
From: "Belgaumkar, Vinay" <vinay.belgaumkar@intel.com>
In-Reply-To: <20230316035954.2593843-1-ashutosh.dixit@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: BY3PR05CA0008.namprd05.prod.outlook.com
 (2603:10b6:a03:254::13) To BY5PR11MB4274.namprd11.prod.outlook.com
 (2603:10b6:a03:1c1::23)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BY5PR11MB4274:EE_|CO1PR11MB4898:EE_
X-MS-Office365-Filtering-Correlation-Id: 62c6be24-a107-46ec-5a17-08db2c93b09e
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: ISdqtx5n7ggPTjhL7oc/Obh6C557tdV35i4km8diRgv1gDpb3kvU/nFISkT5kTZy5s0kV39NiDkbRvEMVpIfgosESNE3Ic/EGIgDlnhm9g4ELqxQDzCp+bTcUTyByZhlydt/JwbUWYWal2R1Rv4ewVS29TIW1ulWudkpcDDZuUbfNiwediA/qrX4MMz4BBFvzOCcj5hepiREkOjxPmTDiGQo17xG9Xp8FRcUdxp9/DWxdKKrQQ3cY41QQwE8tqOo7pUmaCMI+Daib7hdS05dvXuYUKBZyZbrd90/lv++O2ypIr/Pe2Bw94mW1g/NHSwgtTVz1xqoO5sze+PrQuN4heKYbEbEy2kn/K1mOWTo2zOnT+QCEivFXPPjvRCk8o2OvOFoonluW1+NtGoXKkp5iTLbt4FVfG1vpsYV6pIe27PeaXXZ4l/N7sx5l5fMmqgtU/k1eF3PglIKmgDqe5gxPzNG3C6C5m9rvTldKdo69ufEkN2K6d3OOxFRm6XgJiHQ96csfJnBoAgIZ+4sZpF2yZKzq6OezR6zS41gP3trESopzk+IErRFCHjO9UcMtHQhQjE9ZJBwyIrqZDx2/1ehRsH4tjQ0sOsXLe7EUUo7ZcDjqo8lobb812Ch05c+I3Z3OGnoNZ3+s6cIP+6W3KpGiYB0Icu50SI5NVUb88jb27pT76y9rWN3SGNjVyBzMBRLYfjKfKusdgEegam2E6OqkQ==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BY5PR11MB4274.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230028)(39860400002)(376002)(136003)(346002)(366004)(396003)(451199021)(41300700001)(66556008)(316002)(66946007)(186003)(2906002)(478600001)(82960400001)(5660300002)(966005)(54906003)(6486002)(31696002)(26005)(6512007)(66476007)(8676002)(86362001)(8936002)(4326008)(36756003)(2616005)(83380400001)(31686004)(6506007)(53546011)(38100700002)(45980500001)(43740500002)(473944003);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?U2NwVXZIcWZpb0svUTdmajk0Rmp4WGh1VjVqYStycmlEMVREQzd6ZXV6cmEy?=
 =?utf-8?B?cDdUTTFISjlSMWoxS25MWEI2YXZTU2hQR0ovTTZpc1pXQThaeFhwbGppc2tx?=
 =?utf-8?B?OEwxK0RLMzZ2NmtEeFdZdjVNZ1R0U2VnL0l5L1RvT0tDQktyUkxzWG1sRXd4?=
 =?utf-8?B?bnduVUQ3SlJyVU00RjhXZzZXNkJnKzdEWWRPRFh2TkR0UlFLZTBadk9CNnMr?=
 =?utf-8?B?Vi9XY0hheitsdHBqVmFySlhBYk1hZnRVS3RrbWlYNkYyV0pXcFNQMGlMNGpp?=
 =?utf-8?B?UjhBb3l2cE5TSkhIOWlGL1dGK1lSOVVIb3lTcWxrckM3WldIZDU0SmNRZzdr?=
 =?utf-8?B?MjlhcnBaWFFrWFFwMVR1Mkk2NXhNRXUxWnlqUW5vbzVSM2ZpN2l5RWdhemRr?=
 =?utf-8?B?YS9kdk1FNElsZkVPWFlEVUs1TWtPeWhTQUJpbk5URXFXYjloZGtDZHlkQU1q?=
 =?utf-8?B?eGlPVUR6K1R2SkdwSFlrSXJjcjQ2QktWa3Y0UkEraGlldElPaUVTd21CZmhV?=
 =?utf-8?B?WFdHN1pFbFo1S1NkMEZhY2JiOHJhd1hUVlpzd1doRnVxV1FpUm9yOTlJVFdO?=
 =?utf-8?B?REVzWUVveVRFblpJYkNYS2ZuQWNoNlZkTkxLM2EyL1VMT2hDUUppUE05cU1E?=
 =?utf-8?B?cW1LUXA1WnN3MUdlVm8yUFNJd1FQTTU2Nko4Q0VheEt3ZzRPS1VTQXRXM1Qy?=
 =?utf-8?B?Qm5jYlp1M21RK3ZtbEJQMVFjVituYjNFSDhTUmcwZFpPV0V1ZE81am0vQW5M?=
 =?utf-8?B?aklVOWRpSjN5QWZVUVBESXJQcVpDVkx0Rjl6aVZaVnplZ3hZOVZlV0o0eG5h?=
 =?utf-8?B?L0dreXV0cmdKVTFHYnF3TU4yVlkvUGs4VkNSZmwxYkpDS3d0a0xOZ0lRMFFY?=
 =?utf-8?B?MzBWYnZYazUydURzUDN2a3hGWjRIclZZNUVtNzkvTXpiQmlhUWwzd3RWak1S?=
 =?utf-8?B?NzlFWmg4SDVtOXNPTDdrU281SDkyM1l6ZVlZUmREbGJKSG9Qb05NcFNWNmJa?=
 =?utf-8?B?RXhyUlZXVXFMaDE0T00zWndiekorOEZBN2YzYzhxbi9zeWhGdGVQWTB6SC9k?=
 =?utf-8?B?OFBHUDJjN1pacXp4b0REbTRkeHZTRTE1QXg2VUZNeE5HbVhXYS9EUlhwcGpQ?=
 =?utf-8?B?enF2TG4wU0R0QlE5VXplOG1sYzIzMWwrY1hhS0hiVFIyZENFamxNb3FmQ3Ny?=
 =?utf-8?B?RllqVHYwbGRxU3JsSWJhVVNVQkZiTEV3eDJxcTVzczhpZWNFUlVLeTk3TkRn?=
 =?utf-8?B?bDlOYWxxMjdjbjdwLzF1L0ZKVDVhUExNVnpTRStBVyttSUM3UUp4TytYd0dt?=
 =?utf-8?B?QXg3TXQxUDRvYmlhOUxQOWNGMlFSbC8wV0U1ZDVZV1NMZkRYU1JUV3N2WU51?=
 =?utf-8?B?bjFYRWQ4c043WUhzbzF5SktTbUh1Rms4bVpMVjdKOXovZTZ5VEltckNEZTNT?=
 =?utf-8?B?dWhQQWE2Q3pvYXhhaFNJdDltR2VPdG1tVm9yZlFDTDdRZ0V3WVNhb0FkdkQ0?=
 =?utf-8?B?WDdGYXU5NDNTcjN5WFE3K0FESGY0N2FyZzJHTTRRY0ZDaVdXNlRFTFh3WXgr?=
 =?utf-8?B?RFowRXNDM3BURG44V1c5VDI5UzYzQ1BBdHh5Zm5xcGMxaWhTcURERTNVRE5X?=
 =?utf-8?B?ZDNOVDhxME5aRHo0bjZpdlp2K0Z2RkUxZGxlRDdhUnNWUmpPSUwydzBCcUNV?=
 =?utf-8?B?UDlteHRvb05EckRrSlFHYXZxUyt2bjVTeGhCcWhIR1pBTWw1VCtzMVNSaGVG?=
 =?utf-8?B?NVRyYldseVVwZ2dwa0RGSjdoQkZrWStkRUswU3IrM2o2TVZvKzRuTExGVThi?=
 =?utf-8?B?QUpuUXY5N05wZ0VCTnZTNERhK0lyeUdJU3U5bFg5dlpBNEVPblZobk92RGFv?=
 =?utf-8?B?MEdsTC92OFhwcXloVEVDeGZ2SzMxWXJaeDVRUVNJM2tHSWNpbmhRZDVDNkdl?=
 =?utf-8?B?azZUOVhYTGNGcXFLUUFBUk5KZ0twbFMyc0RQaHJWNWtEampHTHBGOXlmbkN3?=
 =?utf-8?B?akJvOUdCZEV0TjBJQVNZTmRMaUVTbjV5UmlnZXREUDNwakNkMytmYkZBRzhB?=
 =?utf-8?B?TXdKSEJnU3hJS0VhL1ZRRUJRZUtOa2hqcjFnazFVR25tV041dXVaL0NRMURP?=
 =?utf-8?B?STAwUHhCRVErL0tEZ0JUSXl0bzBlMUFoakg4RVppTzZLMnBDNHRkTmQ2c2RK?=
 =?utf-8?B?bmc9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 62c6be24-a107-46ec-5a17-08db2c93b09e
X-MS-Exchange-CrossTenant-AuthSource: BY5PR11MB4274.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Mar 2023 18:15:04.0383 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: jtkceQutkY26pxDaS/AfUX/mY1vYp29rv2r/54y6z6zQe7HphUB3pFZC8wBXb42cPys/cjNuhM8A9X99jqEVMgx+ov4zZtE0L6ZgYlR+2V0=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CO1PR11MB4898
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
Cc: John Harrison <john.c.harrison@intel.com>,
 Badal Nilawar <badal.nilawar@intel.com>, dri-devel@lists.freedesktop.org,
 Rodrigo Vivi <rodrigo.vivi@intel.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


On 3/15/2023 8:59 PM, Ashutosh Dixit wrote:
> On dGfx, the PL1 power limit being enabled and set to a low value results
> in a low GPU operating freq. It also negates the freq raise operation which
> is done before GuC firmware load. As a result GuC firmware load can time
> out. Such timeouts were seen in the GL #8062 bug below (where the PL1 power
> limit was enabled and set to a low value). Therefore disable the PL1 power
> limit when allowed by HW when loading GuC firmware.
v3 label missing in subject.
>
> v2:
>   - Take mutex (to disallow writes to power1_max) across GuC reset/fw load
>   - Add hwm_power_max_restore to error return code path
>
> v3 (Jani N):
>   - Add/remove explanatory comments
>   - Function renames
>   - Type corrections
>   - Locking annotation
>
> Link: https://gitlab.freedesktop.org/drm/intel/-/issues/8062
> Signed-off-by: Ashutosh Dixit <ashutosh.dixit@intel.com>
> ---
>   drivers/gpu/drm/i915/gt/uc/intel_uc.c |  9 +++++++
>   drivers/gpu/drm/i915/i915_hwmon.c     | 39 +++++++++++++++++++++++++++
>   drivers/gpu/drm/i915/i915_hwmon.h     |  7 +++++
>   3 files changed, 55 insertions(+)
>
> diff --git a/drivers/gpu/drm/i915/gt/uc/intel_uc.c b/drivers/gpu/drm/i915/gt/uc/intel_uc.c
> index 4ccb4be4c9cba..aa8e35a5636a0 100644
> --- a/drivers/gpu/drm/i915/gt/uc/intel_uc.c
> +++ b/drivers/gpu/drm/i915/gt/uc/intel_uc.c
> @@ -18,6 +18,7 @@
>   #include "intel_uc.h"
>   
>   #include "i915_drv.h"
> +#include "i915_hwmon.h"
>   
>   static const struct intel_uc_ops uc_ops_off;
>   static const struct intel_uc_ops uc_ops_on;
> @@ -461,6 +462,7 @@ static int __uc_init_hw(struct intel_uc *uc)
>   	struct intel_guc *guc = &uc->guc;
>   	struct intel_huc *huc = &uc->huc;
>   	int ret, attempts;
> +	bool pl1en;

Init to 'false' here


>   
>   	GEM_BUG_ON(!intel_uc_supports_guc(uc));
>   	GEM_BUG_ON(!intel_uc_wants_guc(uc));
> @@ -491,6 +493,9 @@ static int __uc_init_hw(struct intel_uc *uc)
>   	else
>   		attempts = 1;
>   
> +	/* Disable a potentially low PL1 power limit to allow freq to be raised */
> +	i915_hwmon_power_max_disable(gt->i915, &pl1en);
> +
>   	intel_rps_raise_unslice(&uc_to_gt(uc)->rps);
>   
>   	while (attempts--) {
> @@ -547,6 +552,8 @@ static int __uc_init_hw(struct intel_uc *uc)
>   		intel_rps_lower_unslice(&uc_to_gt(uc)->rps);
>   	}
>   
> +	i915_hwmon_power_max_restore(gt->i915, pl1en);
> +
>   	guc_info(guc, "submission %s\n", str_enabled_disabled(intel_uc_uses_guc_submission(uc)));
>   	guc_info(guc, "SLPC %s\n", str_enabled_disabled(intel_uc_uses_guc_slpc(uc)));
>   
> @@ -563,6 +570,8 @@ static int __uc_init_hw(struct intel_uc *uc)
>   	/* Return GT back to RPn */
>   	intel_rps_lower_unslice(&uc_to_gt(uc)->rps);
>   
> +	i915_hwmon_power_max_restore(gt->i915, pl1en);

if (pl1en)

     i915_hwmon_power_max_enable().

> +
>   	__uc_sanitize(uc);
>   
>   	if (!ret) {
> diff --git a/drivers/gpu/drm/i915/i915_hwmon.c b/drivers/gpu/drm/i915/i915_hwmon.c
> index ee63a8fd88fc1..769b5bda4d53f 100644
> --- a/drivers/gpu/drm/i915/i915_hwmon.c
> +++ b/drivers/gpu/drm/i915/i915_hwmon.c
> @@ -444,6 +444,45 @@ hwm_power_write(struct hwm_drvdata *ddat, u32 attr, int chan, long val)
>   	}
>   }
>   
> +void i915_hwmon_power_max_disable(struct drm_i915_private *i915, bool *old)
Shouldn't we call this i915_hwmon_package_pl1_disable()?
> +	__acquires(i915->hwmon->hwmon_lock)
> +{
> +	struct i915_hwmon *hwmon = i915->hwmon;
> +	intel_wakeref_t wakeref;
> +	u32 r;
> +
> +	if (!hwmon || !i915_mmio_reg_valid(hwmon->rg.pkg_rapl_limit))
> +		return;
> +
> +	/* Take mutex to prevent concurrent hwm_power_max_write */
> +	mutex_lock(&hwmon->hwmon_lock);
> +
> +	with_intel_runtime_pm(hwmon->ddat.uncore->rpm, wakeref)
> +		r = intel_uncore_rmw(hwmon->ddat.uncore,
> +				     hwmon->rg.pkg_rapl_limit,
> +				     PKG_PWR_LIM_1_EN, 0);
Most of this code (lock and rmw parts) is already inside static void
hwm_locked_with_pm_intel_uncore_rmw() , can we reuse that here?
> +
> +	*old = !!(r & PKG_PWR_LIM_1_EN);
> +}
> +
> +void i915_hwmon_power_max_restore(struct drm_i915_private *i915, bool old)
> +	__releases(i915->hwmon->hwmon_lock)
We can just call this i915_hwmon_power_max_enable() and call whenever 
the old value was actually enabled. That way, we have proper mirror 
functions.
> +{
> +	struct i915_hwmon *hwmon = i915->hwmon;
> +	intel_wakeref_t wakeref;
> +
> +	if (!hwmon || !i915_mmio_reg_valid(hwmon->rg.pkg_rapl_limit))
> +		return;
> +
> +	with_intel_runtime_pm(hwmon->ddat.uncore->rpm, wakeref)
> +		intel_uncore_rmw(hwmon->ddat.uncore,
> +				 hwmon->rg.pkg_rapl_limit,
> +				 PKG_PWR_LIM_1_EN,
> +				 old ? PKG_PWR_LIM_1_EN : 0);

3rd param should be 0 here, else we will end up clearing other bits.

Thanks,

Vinay.

> +
> +	mutex_unlock(&hwmon->hwmon_lock);
> +}
> +
>   static umode_t
>   hwm_energy_is_visible(const struct hwm_drvdata *ddat, u32 attr)
>   {
> diff --git a/drivers/gpu/drm/i915/i915_hwmon.h b/drivers/gpu/drm/i915/i915_hwmon.h
> index 7ca9cf2c34c96..0fcb7de844061 100644
> --- a/drivers/gpu/drm/i915/i915_hwmon.h
> +++ b/drivers/gpu/drm/i915/i915_hwmon.h
> @@ -7,14 +7,21 @@
>   #ifndef __I915_HWMON_H__
>   #define __I915_HWMON_H__
>   
> +#include <linux/types.h>
> +
>   struct drm_i915_private;
> +struct intel_gt;
>   
>   #if IS_REACHABLE(CONFIG_HWMON)
>   void i915_hwmon_register(struct drm_i915_private *i915);
>   void i915_hwmon_unregister(struct drm_i915_private *i915);
> +void i915_hwmon_power_max_disable(struct drm_i915_private *i915, bool *old);
> +void i915_hwmon_power_max_restore(struct drm_i915_private *i915, bool old);
>   #else
>   static inline void i915_hwmon_register(struct drm_i915_private *i915) { };
>   static inline void i915_hwmon_unregister(struct drm_i915_private *i915) { };
> +static inline void i915_hwmon_power_max_disable(struct drm_i915_private *i915, bool *old) { };
> +static inline void i915_hwmon_power_max_restore(struct drm_i915_private *i915, bool old) { };
>   #endif
>   
>   #endif /* __I915_HWMON_H__ */
