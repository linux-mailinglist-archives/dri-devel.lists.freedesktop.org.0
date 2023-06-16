Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 29F9D733533
	for <lists+dri-devel@lfdr.de>; Fri, 16 Jun 2023 17:54:55 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0891310E65C;
	Fri, 16 Jun 2023 15:54:49 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga07.intel.com (mga07.intel.com [134.134.136.100])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B9F4910E66F;
 Fri, 16 Jun 2023 15:54:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1686930887; x=1718466887;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=SCYn8lAt1WDuJFdDppUF97taev0BeV91PAxz9LAIp/k=;
 b=YsQf7m3Nvbj9ygFTGla7tqSwItqWZ0GBOavbhLicyPDGyz2wehqY/cTD
 cCoTRcqEvfcJC2xuYuGCq+nkIjcpvBqDowJ7nrKSUihp4S66+voM+mh5t
 IbbwMxqSjA1It7DNo3q26Twz4y94yhHazHDIF2DqX+vks0ywceLfa8a11
 HYs5gWTHzfCszM7d44sKYVS/PKTO5tpRqzjUomAX/xJfH04ZJMgAPlUlX
 MkL+xdQVSXL7oUnGY4VGItlCKFHbYKllSiJZZ91VRx28jZeI2N8FdM/Jp
 WDrJeK/1EN1poV7ffjVJJstVDDb20hlx3tFyHXCNzqTpgzCHUFOeXFndz w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10742"; a="425183009"
X-IronPort-AV: E=Sophos;i="6.00,247,1681196400"; d="scan'208";a="425183009"
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
 by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Jun 2023 08:54:46 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10742"; a="857425247"
X-IronPort-AV: E=Sophos;i="6.00,247,1681196400"; d="scan'208";a="857425247"
Received: from orsmsx601.amr.corp.intel.com ([10.22.229.14])
 by fmsmga001.fm.intel.com with ESMTP; 16 Jun 2023 08:54:44 -0700
Received: from orsmsx601.amr.corp.intel.com (10.22.229.14) by
 ORSMSX601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.23; Fri, 16 Jun 2023 08:54:44 -0700
Received: from ORSEDG602.ED.cps.intel.com (10.7.248.7) by
 orsmsx601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.23 via Frontend Transport; Fri, 16 Jun 2023 08:54:44 -0700
Received: from NAM12-BN8-obe.outbound.protection.outlook.com (104.47.55.172)
 by edgegateway.intel.com (134.134.137.103) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.23; Fri, 16 Jun 2023 08:54:43 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=iyIoz/KMfKXrcy9exgptwye2V5idm4ybLiLXKo627u7V/b7qbnEjWbZDUkf8qkRlPUp64BNl19GF6hLIJS7oVzwsQ69ZKA1lI4pPbUgjxAGsEyeq7Adro8ju687e44W9I+r8fI+Qc7qStySGpKWIRiA9t6qEExdpFujM1HeZZXPYVOyg+XPmjIlH8nbIXgBm+s3E8X+fo3kxjJywQ1myOxC1DCDL8ko+v8AQjVEw+3upIkMTv0WyQgzyC3OarmBl7BUS8caIpRv875bFUGkeRMHCQF9YiVL5mqbZ4o0icbwazhZB5uYOVG6knZ2MX60Xko/GvFlqiv8+KfNxA9HQhw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=F5n2gnFUiIDAJY/GVro7Oxofdu2+niOLZrBfLQ11d38=;
 b=kiEiWh1pZdy7uusCEJWSysLe+Dh0oWY91bBvApUCz0mMYpUpl3+/T+os4HHadoyHIMqoUTKD7wIygYAmTCxjkearHkk5+UJ+pEGT28SJ9OPlB4AmH0FYT+qrJ6rsuuaK66qjDOGXkvduDTd9+KW990qQnONACEuDgWwRkvcpWkLtCN5uVMTfkuhZ7km9K0thF3Y7ZXjZyXS6YkuZ+AhyY2t8lQJFvZj5kZAhuZDazbJr41dr9A0Un40pZoq9l9L3CZMLDZj+yhx1BPd6VD2G2L8lap35gvi/2U47vpWEPklgHKwsNIvLO/WUzAm5rz2T6YDsgYqLEwQMi5eYuTURTg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH7PR11MB7605.namprd11.prod.outlook.com (2603:10b6:510:277::5)
 by SJ0PR11MB5895.namprd11.prod.outlook.com (2603:10b6:a03:42b::19)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6477.37; Fri, 16 Jun
 2023 15:54:41 +0000
Received: from PH7PR11MB7605.namprd11.prod.outlook.com
 ([fe80::d2fe:fc74:e24b:26da]) by PH7PR11MB7605.namprd11.prod.outlook.com
 ([fe80::d2fe:fc74:e24b:26da%5]) with mapi id 15.20.6500.029; Fri, 16 Jun 2023
 15:54:41 +0000
Message-ID: <2e8ce4e7-9efa-3c47-d9b2-b16f4ba75dba@intel.com>
Date: Fri, 16 Jun 2023 08:54:39 -0700
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.11.0
Subject: Re: [PATCH v1] drm/i915/gsc: Fix intel_gsc_uc_fw_proxy_init_done with
 directed wakerefs
To: Alan Previn <alan.previn.teres.alexis@intel.com>,
 <intel-gfx@lists.freedesktop.org>
References: <20230615211940.4061378-1-alan.previn.teres.alexis@intel.com>
Content-Language: en-US
From: "Ceraolo Spurio, Daniele" <daniele.ceraolospurio@intel.com>
In-Reply-To: <20230615211940.4061378-1-alan.previn.teres.alexis@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: BYAPR02CA0035.namprd02.prod.outlook.com
 (2603:10b6:a02:ee::48) To PH7PR11MB7605.namprd11.prod.outlook.com
 (2603:10b6:510:277::5)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR11MB7605:EE_|SJ0PR11MB5895:EE_
X-MS-Office365-Filtering-Correlation-Id: b9af7d58-543a-48e4-00b4-08db6e81ff4d
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: MLdY2OvZv26ukXJL0RnFBv38H4LrJXxhy07k+JhHCWTzB40axCkPC7/DUH1KxWOh2ZquHksuM3rCgW5uglxROjCoQIsjMfw4rauZv2L3C9wEr7vZytYU9U/AiYnG++PilVuxhPeM2rSxEp8ZcQ21eVrEjV3jAzTk/K31woWDYG//9H21C/ttNCD6vLDVr9OsTnLFV8c9fZjhBVPuG6LzJFL1mwzORMWaCU85U0ttW19txaW1joX3sbg6KoA1+Vojr4PoAN2nHeEtvaxASyUDYiQ5eEhHWEgct3GZ+vQXMp5HqPBAhVfXc3T8dyHv/kRf5qeoH+Daf0xRI6Kpv1IxtRSdOkpSqJk9Omc03uSx4oKH68JIb3xjbYpDFKuhMS8va+3GBOejq0PWEvAADdcYDRgHwc7CecYASeHTaVo/WpyYrZuAodA5rapqLIzYpD6RGMR1Rv1aU/LPh9VtFMzlHDnD5NhT22PvRL9ur2mdCtWGjUo+iKa9phMC6HgvyUwy7mVExlbEJBkkBjbsuotDBVW6XoVWtQxylTulFjZDpXv+rvXzsx6Lzdl2IoqowNN7IaIxCWHkVgcUcJjt7egj3GwspzLuQaH8ojOfyiMw/QGEpYG0Xs0rNXtDOTsZ1Wv3l8aS6our9MC4RKs0BuRpyA==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR11MB7605.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230028)(396003)(39860400002)(376002)(366004)(346002)(136003)(451199021)(26005)(8936002)(6486002)(8676002)(6512007)(41300700001)(36756003)(82960400001)(478600001)(66556008)(4326008)(66946007)(38100700002)(86362001)(66476007)(316002)(31696002)(450100002)(53546011)(6506007)(83380400001)(5660300002)(186003)(2616005)(2906002)(31686004)(43740500002)(45980500001);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?dlNFQnl2eDJlKzNjZzZmTzRTVVIwM0dZUmlYR3lzUlR5NXpUME5pdjBJL3d3?=
 =?utf-8?B?R2w3dDJEVUMzZlFDdU9GcnV1Sk5uYXRNQkl4WWZrSU03MEE5dmRYVVJpeWh1?=
 =?utf-8?B?b2Q2c3BQUWkySVQwRkd0RXZKWGVaVElRY3kycGRKaWZuYTl6TXRKMkphQlY1?=
 =?utf-8?B?WkEyKzhqN0JqdWV6Q3JMNW00WWpsRkx2cHpVUHlQdkt5S2w4aVVuRE9kdU5V?=
 =?utf-8?B?M2M2b2NENWJxcUF0WFpXMTR6SlJNYzFiWjRKbStCbHVoWHRxZkZKcUNYbGNG?=
 =?utf-8?B?cHRTYmdTODVEMVREZWh3SW1HOWJ3S21RSmtRc2dXbXAxMEZoSFFCUUJGWDg0?=
 =?utf-8?B?dHB1Y2RxNjgwMkxSeUY3RE9UUW9YblNnWWZ4cW1XaFo5bmZMdjJuT0V4L0FE?=
 =?utf-8?B?cnIyM25MOUpjWjhEbytuT2krc2N5VmRhZTV6ZTBEdlFiNFZYc3ZyWDBKeDZJ?=
 =?utf-8?B?ejNUdEVhK294NmpBNEc2M0NVWGVyUmZyN2d2b0xYU2dZaTRCZThISm1NTnlC?=
 =?utf-8?B?NEtMZmc5TUIvc0dCOTRvUmcxandadkcwZnorNHg3bzFLWVRYaGRFQXM1ZEtO?=
 =?utf-8?B?cmlDYTlZUVByL0JLUlFoeHAwSUxkaGw1Z3dTQWwyL3B5YVBnb3JNZWxuWVVD?=
 =?utf-8?B?Ri9yQThrUjRCWUI1bDdMTUVpbHlDVU81Sk0wMkJVeXYvdDY5dHJzbTQzeTJs?=
 =?utf-8?B?clp2c1lWMmtONHZxY0dTaytoTXVBMDN2V3MxNXJWVWVMczBCTEFldGx1aFcv?=
 =?utf-8?B?b2pybzRjRm05VUthaDJYR0NzRldkNzQ2MWpESENRMFRNNXZ4c2NheG84MGhh?=
 =?utf-8?B?UDF6MHVvNnBybGdvT2dNaC9mMnVJbEx3TE4xZmpGVEhWS2tHUnRUNGxNRkVH?=
 =?utf-8?B?djNVYWxlSmM0UExaaFJIcnJLSHViR1NYcUtZMEUxUlcvd1QreWN5RUl5TGsy?=
 =?utf-8?B?TWFWVEN0L3RLdnlaci9UZHRwd2pqSC9Jay8zMHJJbkVCczdkL3JEMnQxZndv?=
 =?utf-8?B?UmMvMDlpcUFNeURMZ3RBZ3pBdzVuc3FlM3U0ZG1RUDZsV0FUTUhGNTFQeTI3?=
 =?utf-8?B?b011bFBYdDJOZkFVbiszQWI2QVJVaEJXd0xIVmdqd0w3RHo5VnliUElnWmdn?=
 =?utf-8?B?MGNFci9TZS9lSHoxK2h3NWdIZlY2WTBSQkN3MFBNU3k4a0EvNUx2SDk2bTBw?=
 =?utf-8?B?c05aekl3QlhUSCtWVm52VFU5WE1Fb29RMWNCN1Y2MVpKQURCOVZJT2RKcE41?=
 =?utf-8?B?bW1jUnQ3amNTZ1dnbU5nTTFkZnpuUWkyVmVrZWVXeDBKVUUzSXYxR0FMOFFV?=
 =?utf-8?B?dk9CcWVUcDk3WlptaXlxcWJBVkNINXFlNkxTL2RHbkpjWWVUT2wzVkxBT01i?=
 =?utf-8?B?Ym1tQUJwTjk1a3NGdGcrMVZlTW00S1dmcGpSMndoYjhWZmVCZGluTVk0RXFa?=
 =?utf-8?B?OFA2MHhNMGFIT2wrUmlseXl3TDgvRm5tZk12dWRCeFJYWVZOTmF0ZHBrWlha?=
 =?utf-8?B?Q0VZMjdwczh2MjBiQmszWWVJTU1hZEVnaHp2ajJaSm1Kam9odlZVc3J6M3lw?=
 =?utf-8?B?Q0JzbmlCbXJPd2xVd0lla1ZNdGwrUlRoMzdOQnR0aUVGZzVOSmVPTTgrYkkz?=
 =?utf-8?B?N0FVYmFpNGdmMlhJNlFwNVo0c0ZkWncxaTg3enlyc1QyRnFBQ0k0U21rQ0po?=
 =?utf-8?B?VG5kYk43K2l3d1dTY2k0NVJRb2pTZ01TQ1pyZWZBdThMZjlQM3diYSs3alF3?=
 =?utf-8?B?QzNNRURQQW9CT2swVWl0eU11dno3dlR6elRoMEVSRGM4c1NiSjk5V2V6ODhF?=
 =?utf-8?B?cFFhQkdxb2ZBOGFPc2k5TTcrQ3NIWk02eGNUUDNmZkNEd29PaWNNN0dYSTky?=
 =?utf-8?B?eDJ1alJDUzF2cFY1TTZzTTN2M1UvNUVTY1ZTMXdVOHBSUWZBZExtTExWa0NF?=
 =?utf-8?B?OXpnLytpZjRlUjJ5T2xyZnk3Mkt6RzVqV3UwZVRqTE5VMnZmZjJKUjVSTU9l?=
 =?utf-8?B?SC9DYlZONnNzTk9wT2dVL3JvbjNlL3NkSWFkTjFOVVRZWFVWdkhwb3VmUGJH?=
 =?utf-8?B?bWgvOG11aU5La0JBUXc0dFdQaEc1YTFzWEtvcFJTaW1SejFsQkh1cWtXazNo?=
 =?utf-8?B?RnFFWnRnTmU3TEFpb2VDalI5dDIyMHBhTitwU09TR3dwYzNkN1hlWkp4TU5s?=
 =?utf-8?B?b0E9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: b9af7d58-543a-48e4-00b4-08db6e81ff4d
X-MS-Exchange-CrossTenant-AuthSource: PH7PR11MB7605.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Jun 2023 15:54:41.7978 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: kHZUaRpCUfzIMv+zTppbrVynygSEU1ULackC1YU452OxK07Vf66Lr9pDPEqqz7yJDrxQi3IuPLreT+kV9WlxrGpoFHV4EsYym19BwScaFBg=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR11MB5895
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
Cc: dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>



On 6/15/2023 2:19 PM, Alan Previn wrote:
> intel_gsc_uc_fw_proxy_init_done is used by a few code paths
> and usages. However, certain paths need a wakeref while others
> can't take a wakeref such as from the runtime_pm_resume callstack.
>
> Add a param into this helper to allow callers to direct whether
> to take the wakeref or not. This resolves the following bug:
>
>     INFO: task sh:2607 blocked for more than 61 seconds.
>     Not tainted 6.3.0-pxp-gsc-final-jun14+ #297
>     "echo 0 > /proc/sys/kernel/hung_task_timeout_secs" disables this message.
>     task:sh              state:D stack:13016 pid:2607  ppid:2602   flags:0x00004000
>     Call Trace:
>        <TASK>
>        __schedule+0x47b/0xe10
>        schedule+0x58/0xd0
>        rpm_resume+0x1cc/0x800
>        ? __pfx_autoremove_wake_function+0x10/0x10
>        __pm_runtime_resume+0x42/0x80
>        __intel_runtime_pm_get+0x19/0x80 [i915]
>        gsc_uc_get_fw_status+0x10/0x50 [i915]
>        intel_gsc_uc_fw_init_done+0x9/0x20 [i915]
>        intel_gsc_uc_load_start+0x5b/0x130 [i915]
>        __uc_resume+0xa5/0x280 [i915]
>        intel_runtime_resume+0xd4/0x250 [i915]
>        ? __pfx_pci_pm_runtime_resume+0x10/0x10
>     __rpm_callback+0x3c/0x160
>
> Fixes: 8c33c3755b75 ("drm/i915/gsc: take a wakeref for the proxy-init-completion check")
> Signed-off-by: Alan Previn <alan.previn.teres.alexis@intel.com>

Reviewed-by: Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>

I'm going to send a trybot of this patch with the FW definition patch, 
just to make sure there aren't any other issues that kick in once the FW 
is defined and the code starts being executed, and merge if the results 
are ok.

Daniele

> ---
>   drivers/gpu/drm/i915/gt/uc/intel_gsc_fw.c  | 17 +++++++++++------
>   drivers/gpu/drm/i915/gt/uc/intel_gsc_fw.h  |  2 +-
>   drivers/gpu/drm/i915/gt/uc/intel_gsc_uc.c  |  2 +-
>   drivers/gpu/drm/i915/pxp/intel_pxp_gsccs.c |  2 +-
>   4 files changed, 14 insertions(+), 9 deletions(-)
>
> diff --git a/drivers/gpu/drm/i915/gt/uc/intel_gsc_fw.c b/drivers/gpu/drm/i915/gt/uc/intel_gsc_fw.c
> index 856de9af1e3a..ab1a456f833d 100644
> --- a/drivers/gpu/drm/i915/gt/uc/intel_gsc_fw.c
> +++ b/drivers/gpu/drm/i915/gt/uc/intel_gsc_fw.c
> @@ -22,27 +22,32 @@ static bool gsc_is_in_reset(struct intel_uncore *uncore)
>   			HECI1_FWSTS1_CURRENT_STATE_RESET;
>   }
>   
> -static u32 gsc_uc_get_fw_status(struct intel_uncore *uncore)
> +static u32 gsc_uc_get_fw_status(struct intel_uncore *uncore, bool needs_wakeref)
>   {
>   	intel_wakeref_t wakeref;
>   	u32 fw_status = 0;
>   
> -	with_intel_runtime_pm(uncore->rpm, wakeref)
> -		fw_status = intel_uncore_read(uncore, HECI_FWSTS(MTL_GSC_HECI1_BASE, 1));
> +	if (needs_wakeref)
> +		wakeref = intel_runtime_pm_get(uncore->rpm);
>   
> +	fw_status = intel_uncore_read(uncore, HECI_FWSTS(MTL_GSC_HECI1_BASE, 1));
> +
> +	if (needs_wakeref)
> +		intel_runtime_pm_put(uncore->rpm, wakeref);
>   	return fw_status;
>   }
>   
> -bool intel_gsc_uc_fw_proxy_init_done(struct intel_gsc_uc *gsc)
> +bool intel_gsc_uc_fw_proxy_init_done(struct intel_gsc_uc *gsc, bool needs_wakeref)
>   {
>   	return REG_FIELD_GET(HECI1_FWSTS1_CURRENT_STATE,
> -			     gsc_uc_get_fw_status(gsc_uc_to_gt(gsc)->uncore)) ==
> +			     gsc_uc_get_fw_status(gsc_uc_to_gt(gsc)->uncore,
> +						  needs_wakeref)) ==
>   	       HECI1_FWSTS1_PROXY_STATE_NORMAL;
>   }
>   
>   bool intel_gsc_uc_fw_init_done(struct intel_gsc_uc *gsc)
>   {
> -	return gsc_uc_get_fw_status(gsc_uc_to_gt(gsc)->uncore) &
> +	return gsc_uc_get_fw_status(gsc_uc_to_gt(gsc)->uncore, false) &
>   	       HECI1_FWSTS1_INIT_COMPLETE;
>   }
>   
> diff --git a/drivers/gpu/drm/i915/gt/uc/intel_gsc_fw.h b/drivers/gpu/drm/i915/gt/uc/intel_gsc_fw.h
> index 8d7b9e4f1ffc..ad2167ce9137 100644
> --- a/drivers/gpu/drm/i915/gt/uc/intel_gsc_fw.h
> +++ b/drivers/gpu/drm/i915/gt/uc/intel_gsc_fw.h
> @@ -15,6 +15,6 @@ struct intel_uncore;
>   int intel_gsc_fw_get_binary_info(struct intel_uc_fw *gsc_fw, const void *data, size_t size);
>   int intel_gsc_uc_fw_upload(struct intel_gsc_uc *gsc);
>   bool intel_gsc_uc_fw_init_done(struct intel_gsc_uc *gsc);
> -bool intel_gsc_uc_fw_proxy_init_done(struct intel_gsc_uc *gsc);
> +bool intel_gsc_uc_fw_proxy_init_done(struct intel_gsc_uc *gsc, bool needs_wakeref);
>   
>   #endif
> diff --git a/drivers/gpu/drm/i915/gt/uc/intel_gsc_uc.c b/drivers/gpu/drm/i915/gt/uc/intel_gsc_uc.c
> index 85d90f0a15e3..75a3a0790ef3 100644
> --- a/drivers/gpu/drm/i915/gt/uc/intel_gsc_uc.c
> +++ b/drivers/gpu/drm/i915/gt/uc/intel_gsc_uc.c
> @@ -72,7 +72,7 @@ static void gsc_work(struct work_struct *work)
>   			 * complete the request handling cleanly, so we need to check the
>   			 * status register to check if the proxy init was actually successful
>   			 */
> -			if (intel_gsc_uc_fw_proxy_init_done(gsc)) {
> +			if (intel_gsc_uc_fw_proxy_init_done(gsc, false)) {
>   				drm_dbg(&gt->i915->drm, "GSC Proxy initialized\n");
>   				intel_uc_fw_change_status(&gsc->fw, INTEL_UC_FIRMWARE_RUNNING);
>   			} else {
> diff --git a/drivers/gpu/drm/i915/pxp/intel_pxp_gsccs.c b/drivers/gpu/drm/i915/pxp/intel_pxp_gsccs.c
> index f13890ec7db1..c7df47364013 100644
> --- a/drivers/gpu/drm/i915/pxp/intel_pxp_gsccs.c
> +++ b/drivers/gpu/drm/i915/pxp/intel_pxp_gsccs.c
> @@ -197,7 +197,7 @@ bool intel_pxp_gsccs_is_ready_for_sessions(struct intel_pxp *pxp)
>   	 * are out of order) will suffice.
>   	 */
>   	if (intel_huc_is_authenticated(&pxp->ctrl_gt->uc.huc, INTEL_HUC_AUTH_BY_GSC) &&
> -	    intel_gsc_uc_fw_proxy_init_done(&pxp->ctrl_gt->uc.gsc))
> +	    intel_gsc_uc_fw_proxy_init_done(&pxp->ctrl_gt->uc.gsc, true))
>   		return true;
>   
>   	return false;
>
> base-commit: 134d180cacae82fadbc5ee32f86014cc290f5e0c

