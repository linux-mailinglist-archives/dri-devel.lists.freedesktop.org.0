Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 71EC8672E94
	for <lists+dri-devel@lfdr.de>; Thu, 19 Jan 2023 03:01:53 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3EBC610E228;
	Thu, 19 Jan 2023 02:01:49 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8CF5C10E228;
 Thu, 19 Jan 2023 02:01:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1674093707; x=1705629707;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=rLVXE+oomhYsB9kRrGp4Xw1jGeG5e3ACIHR9pbTJ/FE=;
 b=jQgVzBcEEYdrbGKGT3KMU4TtmZuTjc/SIYpLf2IgwI5vrhGVWgS4Ngke
 8RbhixoRZq8oaJMak7lrcxkOnKFTRZordvvQvVgVta6fF8c4DFTk11o23
 ctqv1i29oPUMeZblWNOWGVyFQAqns0TGqurMu8EPgHXX+W8oUyY/y12Gu
 ffToHV5xEJYWZHrOe/bCYD/W0HK4F2vMbEKPv6SozoUBQzYSx4vsomIrr
 3OXGMH1RZULSkIKd6G8sQG7jQsf9s8TChvUZNNRIjmVBiz0KRkiVgYoFZ
 fMeeeUbba9TJTjdzf9zmWtAmPwR7IB2UcoaYKKVrZ+Ijl300/12VyTEem w==;
X-IronPort-AV: E=McAfee;i="6500,9779,10594"; a="322853204"
X-IronPort-AV: E=Sophos;i="5.97,226,1669104000"; d="scan'208";a="322853204"
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
 by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 Jan 2023 18:01:46 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10594"; a="768003115"
X-IronPort-AV: E=Sophos;i="5.97,226,1669104000"; d="scan'208";a="768003115"
Received: from orsmsx603.amr.corp.intel.com ([10.22.229.16])
 by fmsmga002.fm.intel.com with ESMTP; 18 Jan 2023 18:01:46 -0800
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.16; Wed, 18 Jan 2023 18:01:46 -0800
Received: from ORSEDG601.ED.cps.intel.com (10.7.248.6) by
 orsmsx610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.16 via Frontend Transport; Wed, 18 Jan 2023 18:01:46 -0800
Received: from NAM10-BN7-obe.outbound.protection.outlook.com (104.47.70.106)
 by edgegateway.intel.com (134.134.137.102) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.16; Wed, 18 Jan 2023 18:01:45 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=TI1Vhe2F7+H9gPgYwAClAqdXJK4xfX64kXdVBuOq74S/llkcUMqS7btzAx7CkJF4Z74+QFiLnZWB5dEu1c1RBgzN7oac9gsU+tgiXqucdODzc3OSxd5W7CKMCsAlcyUjAjKquurgUiLnCz+37koxpkimJ2GsE/aCVPyZDJtA7k2y/exN7QH/lqKuoiLUflWlRjKnWjb6/HHqLgZZlLTd/KzggpN+tCf2dnG/2yo0ujP2/2797DbvdTSec6Ga/NnWygegp1nuk69rvznZQrlEeff2qAqT7OBgGKr2N5nGsrkcwVP1V2nQsnh/KxYhRoLvgBIRkX0+V7wEkGYkIYZ5+Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=46kZhtHaDtK9FsrzQRr7aYvTDomYQ0mKLk5WiJPj340=;
 b=SZuE5ZYE/njQsarT4g77sCUTiRBCCyniN2xDQOb46B/FwQUQPWbEYUy5DNc4EXr9ax5d+VtuDtLeSKzcNnDFpMDLk/mJHdVW7TVZhixsDU8/k6QfyE7oUJUDR7aOmrfOH3ybGwtwvIglsjH9CLCF9/SS6AKd7LDnDeFlaTWq5/lnBdkCFViZ9OkEeG8Sfi07S/eAqGIqe4e2RxUoCAuxYuHO5rgC8CA35OCMMUvd0CLUSwcc0Gzu2j4nJ1enu6cTG0fwHzeRKt6wCqfye40KCgk57lkSoT05MF63SxYd0MhA/Ft9wEIyvj7B3gkG6Tgeh4bA5Hzv5yjUXev2x5wN4A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DM4PR11MB5488.namprd11.prod.outlook.com (2603:10b6:5:39d::5) by
 IA1PR11MB7246.namprd11.prod.outlook.com (2603:10b6:208:42e::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5986.23; Thu, 19 Jan
 2023 02:01:42 +0000
Received: from DM4PR11MB5488.namprd11.prod.outlook.com
 ([fe80::62c1:155c:1857:167a]) by DM4PR11MB5488.namprd11.prod.outlook.com
 ([fe80::62c1:155c:1857:167a%9]) with mapi id 15.20.6002.025; Thu, 19 Jan 2023
 02:01:42 +0000
Message-ID: <c8b6c0a9-0030-c356-f6dc-64fda4f90559@intel.com>
Date: Wed, 18 Jan 2023 18:01:33 -0800
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.6.1
Subject: Re: [PATCH v2 7/9] drm/i915/pxp: MTL-KCR interrupt ctrl's are in GT-0
Content-Language: en-US
To: Alan Previn <alan.previn.teres.alexis@intel.com>,
 <intel-gfx@lists.freedesktop.org>
References: <20230111214226.907536-1-alan.previn.teres.alexis@intel.com>
 <20230111214226.907536-8-alan.previn.teres.alexis@intel.com>
From: "Ceraolo Spurio, Daniele" <daniele.ceraolospurio@intel.com>
In-Reply-To: <20230111214226.907536-8-alan.previn.teres.alexis@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: BY5PR20CA0001.namprd20.prod.outlook.com
 (2603:10b6:a03:1f4::14) To DM4PR11MB5488.namprd11.prod.outlook.com
 (2603:10b6:5:39d::5)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM4PR11MB5488:EE_|IA1PR11MB7246:EE_
X-MS-Office365-Filtering-Correlation-Id: 3bb37aef-e78f-4af6-0f5c-08daf9c11bf8
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: EvZFgONDhpUpiYyoRZBp9jVyI5eFro0enhghb6NqsHsspDbIwJvI+K+XCTa4upcS9XqcdSmt7e0wSVdQOkm9unZppUQxf/s8SXNP+DWo2arYOr1vCpF9sZ+gkMfhXPdd0uBc77urxpvs1eIUEiT7Zp+dinC5m14a3/3QNPpnT66e+zX1vZDqa36SED+hHD02uzDgOfzeTVvcOFt7UylGDksdw665iNtT0ca5K+/HkLCJBkXd4RMqiyC74NKwVZLtYAGnnq+8o60OpvNmYeg1TGXIEtGhiSzKMOxYzexndwfLkmaO46OOSeryXC8U5ZkmynuDN4mCuWJYSayh7uSWf9q6NrhnCWqJTBQrEynIq9bF79UFTyT/oEaHOrL6rT74PynibQ0LxBfQ/+vF+WdZgkssiD9zoJ6V9fnQLvTHtEgV4CxMZrizFOjk3c1CxrDReUAIxmkwF1NQkuOb2Gif91Y55AF2zriUk2p+1aQpW0CUaTTJmKZ7LwU4szvCUuXLzGmiexq7Vk22zAsKptr2DAOSSQvwjh2Xn4CD64EwJ3WbgcxI0vVwtL31SCZQXZP1z2aO9X+EDOA4k6w+AwLd8cE9E/qQg9ddO95UKL0WxdsZqnlnJk6EBcgvDeEKn2ZFMYIC5HRG5hifRGuGIyFiIqqx2aj84bUTx7LtuXsxYZPBYnVV7F/8T9QG9UcESgK+6o9M9KD8EOgnKBjOHVZy5Hk0k/U++vRhVXiJPE2dThg=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM4PR11MB5488.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230022)(396003)(136003)(366004)(376002)(346002)(39860400002)(451199015)(31686004)(66946007)(2616005)(6512007)(66476007)(26005)(41300700001)(4326008)(53546011)(8676002)(36756003)(186003)(86362001)(66556008)(31696002)(82960400001)(5660300002)(8936002)(316002)(6666004)(6506007)(83380400001)(478600001)(2906002)(38100700002)(6486002)(45980500001)(43740500002);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?VnRMYmhVdXljcFgzWUFBUktMZWtUMit3cXdNMkNSL1plNDNqM3ZKUzNvblhm?=
 =?utf-8?B?VUVxaisvZE0vK0ZnV0M4TTdaNFRWZERQYlRQQWR1SHZHT1BYeWFRczNmdzJ1?=
 =?utf-8?B?RUdrUUFxRUpQcm80QmtaTFFJQlRoRnBqbVFDUlRtV29WbG12N25Sb092YWhn?=
 =?utf-8?B?WFJoNzV5SG1Dd2JQbjFYQXJIOVgxYW10ci80dDhsc3JCTFUyY3dyVlpaRXJO?=
 =?utf-8?B?b0lORkU2alluUkZ6QVdRWHFIbTZtdUdqbjh2NGwycTczVGR2ZFVzR3ppWXls?=
 =?utf-8?B?ekJub3hDTkZERzJNN2dWY25XcGE5YXljenhYVmM2UWpyTVdHL2lXcXZXV1Uy?=
 =?utf-8?B?SGIrZFh5Y1RzSHRVUVRXcHhmS1Y3R2tBbnVuOFQ3THdTVzFqby9vMTlHazhU?=
 =?utf-8?B?cExkZmJ0QUxmaG1EVjVFeUtSaGZXV01iMUh0MEJqdzRWbmNzMWxYVUlYUEdp?=
 =?utf-8?B?QkVBVkxVemM1WXNQTURRbGEvTDFpNTlCanhSZFlKVUxmTEl2ZGRWRkhHS05j?=
 =?utf-8?B?U3UrQURYY0VVSElzZUk5WjdnK0kyMTdSN3ZHNWllMUtzdzVOK1lDTWVYMXo5?=
 =?utf-8?B?YjAzT3B1emRMVEVVM1J6Z0ZJdThwN2pjRFFIRENFSkZDYWV5VDlqUkFZNTlO?=
 =?utf-8?B?YXdKMDdKbWJkYXV2Q3FINGtvUjlVN3Z0M3M1WEk2djY5MnpwZVk0QlplczRh?=
 =?utf-8?B?VnVTSnlZL2xpVCtzY21NYmwwOTRVemdzNXVLOFNIYVRrRXFHWkQ0bzZLaGI4?=
 =?utf-8?B?aG9VcGZ3QWx4dHZUYXRQWWFONXRvcWY0eWVVLzNuYitUY2t0NnB6YmFIWjhx?=
 =?utf-8?B?M1FqMkhsKzl5SVhkODBYdUIycVE3WlZkN2U5dW5PemZkNm5VV3I3NmJkRFVo?=
 =?utf-8?B?WmZkTTVsbVRJZHczam1oQUp2TzRvNTVDM253ZmtSTVlLODVMRk9KNTExOVRw?=
 =?utf-8?B?WEU3NXUrMlh3bE5vMWRMVmVFYlE4QlVzWjBVelNRTUkvM1gwWjhYOVlKMXZh?=
 =?utf-8?B?M0wybmJnN3Z6VWNaZkhROERuOHFVamN3N3hKbTBVNHFaazhvRTVVTjM0dWpH?=
 =?utf-8?B?MUdCMTJsNmdkMllLQjVHbmh0cTk0YktjNHdpbi9MQWdIelVMclh2Z3dUa3Fj?=
 =?utf-8?B?SnEvREh1cE1WWENhall6dEV0cHZKMWpqRGg5Y3pNRTdXejNaUXNjZHBHZ2xX?=
 =?utf-8?B?a0RGMmovT3NDTWdsbDhYMEJ4TTMyc2ZZMGhkSmo4cC9LTld3dmhJZFEyZ3pW?=
 =?utf-8?B?WDRDOE81QlRoQ1FZZVM5UnFBVnRIQkdKVFZSRDdwcVh0dUNlSlBVditnazc2?=
 =?utf-8?B?ZUljY1pySWk2TmJCS2wwcVVjZFVpZytObE5OaXRGMFF3QkN3dWtGQzQ2TVM3?=
 =?utf-8?B?UjFIWEUzRTBtSklrRGc5c3VSaHBGb0c0bHg4ZHR2TTQ0VmhMbFR1SnUyNm02?=
 =?utf-8?B?bEtvU1B1K25PbzBaUE1zb1Q3R0Nkbm1jQytSejFnWUFzakVxNmt6bkthTW1M?=
 =?utf-8?B?eXBUbHVaTWcxRktndjBmK2daWUhESDlCMERTYmpYdktEOHVmVU9BRlBNdjAv?=
 =?utf-8?B?QjA5MXVhWWFCNmR4eHNsdDFzZTFVWHdaSWJaN1B4Uk9qRld4amVRS01sQy85?=
 =?utf-8?B?b2h0VEpNN0tSOVBJL29LdGU2K016OWFndnBtWXZlQVBHNXFEcHo4R25qZmFo?=
 =?utf-8?B?Z25TR1FXUHJ5NWg0cEMvU21BTGJTeXJlUGl1ZWg3SlhQY3MvTytlRk1JYzF0?=
 =?utf-8?B?TFdQeG12S1o4eWRYZCtrUE9peEVpS0NPcktEeG9ZSFRxSlpDVXg3VmRxYzB4?=
 =?utf-8?B?b08rU2Z6Vlh3ZDBRYVlOdlhrdFdmRzVRWUVaTCtOZVFEMXN1SzZLVmdZR0hv?=
 =?utf-8?B?bCtEbGJRR2RTdExaMXNsMEFYdEgwRUVJV0NmYmVwd1JodzFZdElaS1RsRzZ1?=
 =?utf-8?B?NTllSTlPQlZaODI1aFRTY0MvbFlDejRVQmh5WTRvbmtITWtSa1ZuMnBNOTRN?=
 =?utf-8?B?dy9DdEJ3SnYrL2Mzc2dlTmFBRThQaVR0UTNGRjhtd0hIZ2p2R0VxclFLaTlp?=
 =?utf-8?B?R3I5dTVoc0JDWVJzS1NybzIvczRnVUd6TDR4ak92aDhoNkNIa0plN1FBazEw?=
 =?utf-8?B?dWlTZUo4TFljU1RkU1hYNTY5VStwZjJUZVh0ZklRQ2VKZUVPY3liNU1qQjAz?=
 =?utf-8?Q?NysSSyNKqtN9CUk1+bL1D2w=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 3bb37aef-e78f-4af6-0f5c-08daf9c11bf8
X-MS-Exchange-CrossTenant-AuthSource: DM4PR11MB5488.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Jan 2023 02:01:42.1778 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: jTzqkvZ7pdaS0aZ+LvhdaYZYIUQq4+hKIhybjExK+PacQgUmzcofySdW4vQlI5ZHMBO6rKyLW+vpzk+1ZCxTcEjT74/yGu13euCkRunhWxc=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA1PR11MB7246
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
Cc: Juston Li <justonli@chromium.org>, dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>



On 1/11/2023 1:42 PM, Alan Previn wrote:
> Despite KCR subsystem being in the media-tile (close to the
> GSC-CS), the IRQ controls for it are on GT-0 with other global
> IRQ controls. Thus, add a helper for KCR hw interrupt
> enable/disable functions to get the correct gt structure (for
> uncore) for MTL.
>
> In the helper, we get GT-0's handle for uncore when touching
> IRQ registers despite the pxp->ctrl_gt being the media-tile.
> No difference for legacy of course.
>
> Signed-off-by: Alan Previn <alan.previn.teres.alexis@intel.com>
> ---
>   drivers/gpu/drm/i915/pxp/intel_pxp_debugfs.c |  2 +-
>   drivers/gpu/drm/i915/pxp/intel_pxp_irq.c     | 23 +++++++++++++++++---
>   drivers/gpu/drm/i915/pxp/intel_pxp_irq.h     |  8 +++++++
>   3 files changed, 29 insertions(+), 4 deletions(-)
>
> diff --git a/drivers/gpu/drm/i915/pxp/intel_pxp_debugfs.c b/drivers/gpu/drm/i915/pxp/intel_pxp_debugfs.c
> index 4b8e70caa3ad..9f6e300486b4 100644
> --- a/drivers/gpu/drm/i915/pxp/intel_pxp_debugfs.c
> +++ b/drivers/gpu/drm/i915/pxp/intel_pxp_debugfs.c
> @@ -44,7 +44,7 @@ static int pxp_terminate_get(void *data, u64 *val)
>   static int pxp_terminate_set(void *data, u64 val)
>   {
>   	struct intel_pxp *pxp = data;
> -	struct intel_gt *gt = pxp->ctrl_gt;
> +	struct intel_gt *gt = intel_pxp_get_irq_gt(pxp);

This doesn't seem to be required here. The only use of gt in this 
function is an assert below and both the root and media gt point to the 
same irq_lock, so it doesn't matter which one we're using. Should we 
keep it anyway just for safety in case things change in the future? or 
just add a comment instead?

>   
>   	if (!intel_pxp_is_active(pxp))
>   		return -ENODEV;
> diff --git a/drivers/gpu/drm/i915/pxp/intel_pxp_irq.c b/drivers/gpu/drm/i915/pxp/intel_pxp_irq.c
> index 91e9622c07d0..2eef0c19e91a 100644
> --- a/drivers/gpu/drm/i915/pxp/intel_pxp_irq.c
> +++ b/drivers/gpu/drm/i915/pxp/intel_pxp_irq.c
> @@ -8,6 +8,7 @@
>   #include "gt/intel_gt_regs.h"
>   #include "gt/intel_gt_types.h"
>   
> +#include "i915_drv.h"
>   #include "i915_irq.h"
>   #include "i915_reg.h"
>   
> @@ -17,6 +18,22 @@
>   #include "intel_pxp_types.h"
>   #include "intel_runtime_pm.h"
>   
> +/**
> + * intel_pxp_get_irq_gt - Find the correct GT that owns KCR interrupts
> + * @pxp: pointer to pxp struct
> + *
> + * For platforms with a single GT, we return the pxp->ctrl_gt (as expected)
> + * but for MTL+ that has a media-tile, although the KCR engine is in the
> + * media-tile (i.e. pxp->ctrl_gt), the IRQ controls are on the root tile.
> + */
> +struct intel_gt *intel_pxp_get_irq_gt(struct intel_pxp *pxp)
> +{
> +	if (pxp->uses_gsccs)
> +		return to_gt(pxp->ctrl_gt->i915);
> +
> +	return pxp->ctrl_gt;

AFAICT here we can skip the if and always return the root gt, because 
that's what happens in both cases. If you want to make sure we don't get 
issues in the future maybe instead add a:

GEM_BUG_ON(!i915->media_gt && !gt_is_root(pxp->ctrl_gt))

> +}
> +
>   /**
>    * intel_pxp_irq_handler - Handles PXP interrupts.
>    * @pxp: pointer to pxp struct
> @@ -29,7 +46,7 @@ void intel_pxp_irq_handler(struct intel_pxp *pxp, u16 iir)
>   	if (GEM_WARN_ON(!intel_pxp_is_enabled(pxp)))
>   		return;
>   
> -	gt = pxp->ctrl_gt;
> +	gt = intel_pxp_get_irq_gt(pxp);

Here also we only have the assert below

Daniele

>   
>   	lockdep_assert_held(gt->irq_lock);
>   
> @@ -68,7 +85,7 @@ static inline void pxp_irq_reset(struct intel_gt *gt)
>   
>   void intel_pxp_irq_enable(struct intel_pxp *pxp)
>   {
> -	struct intel_gt *gt = pxp->ctrl_gt;
> +	struct intel_gt *gt = intel_pxp_get_irq_gt(pxp);
>   
>   	spin_lock_irq(gt->irq_lock);
>   
> @@ -83,7 +100,7 @@ void intel_pxp_irq_enable(struct intel_pxp *pxp)
>   
>   void intel_pxp_irq_disable(struct intel_pxp *pxp)
>   {
> -	struct intel_gt *gt = pxp->ctrl_gt;
> +	struct intel_gt *gt = intel_pxp_get_irq_gt(pxp);
>   
>   	/*
>   	 * We always need to submit a global termination when we re-enable the
> diff --git a/drivers/gpu/drm/i915/pxp/intel_pxp_irq.h b/drivers/gpu/drm/i915/pxp/intel_pxp_irq.h
> index 8c292dc86f68..eea87c9eb62b 100644
> --- a/drivers/gpu/drm/i915/pxp/intel_pxp_irq.h
> +++ b/drivers/gpu/drm/i915/pxp/intel_pxp_irq.h
> @@ -9,6 +9,7 @@
>   #include <linux/types.h>
>   
>   struct intel_pxp;
> +struct intel_gt;
>   
>   #define GEN12_DISPLAY_PXP_STATE_TERMINATED_INTERRUPT BIT(1)
>   #define GEN12_DISPLAY_APP_TERMINATED_PER_FW_REQ_INTERRUPT BIT(2)
> @@ -23,6 +24,8 @@ struct intel_pxp;
>   void intel_pxp_irq_enable(struct intel_pxp *pxp);
>   void intel_pxp_irq_disable(struct intel_pxp *pxp);
>   void intel_pxp_irq_handler(struct intel_pxp *pxp, u16 iir);
> +struct intel_gt *intel_pxp_get_irq_gt(struct intel_pxp *pxp);
> +
>   #else
>   static inline void intel_pxp_irq_handler(struct intel_pxp *pxp, u16 iir)
>   {
> @@ -35,6 +38,11 @@ static inline void intel_pxp_irq_enable(struct intel_pxp *pxp)
>   static inline void intel_pxp_irq_disable(struct intel_pxp *pxp)
>   {
>   }
> +
> +static inline struct intel_gt *intel_pxp_get_irq_gt(struct intel_pxp *pxp)
> +{
> +	return NULL;
> +}
>   #endif
>   
>   #endif /* __INTEL_PXP_IRQ_H__ */

