Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id C4E316AA776
	for <lists+dri-devel@lfdr.de>; Sat,  4 Mar 2023 02:59:09 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C3C3E10E790;
	Sat,  4 Mar 2023 01:59:03 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A883A10E16E;
 Sat,  4 Mar 2023 01:59:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1677895141; x=1709431141;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=/dhQhUHgP709Pfjn7l0THOiker5eZQ/fG6CKa1PXwq8=;
 b=FzEz5sVSoy9z5JHM/eH7cOWxmptiPWmqLrgrtgR8OM04MYp2xa2Okd0E
 VyXV2q0vMvvRWyWhuvVFkFesRSF/Ksp582V9B/VLRtfbMUiutSTXld0vL
 Ca5iYey+75k4tqp4kkwwgIKWimuZpO4fDadGpVETFg47TkMhULKaXCgER
 nleR68qqmm1CpO6ozCtLWngyc/sc9mC+17jNiTm2SYW/jAxn/zZdC+Lh2
 2thbdPS5+olrTojZNv8PWzPgTluBcAa6ajE6rkxPbcxftgI3y3dW3Rf40
 Yv/YqQ3uZ7nxzul4loqXpsIRje5gYct2VyxVc0qWvKnVnMUMQAznXXvW3 Q==;
X-IronPort-AV: E=McAfee;i="6500,9779,10638"; a="323509133"
X-IronPort-AV: E=Sophos;i="5.98,232,1673942400"; d="scan'208";a="323509133"
Received: from orsmga003.jf.intel.com ([10.7.209.27])
 by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 Mar 2023 17:58:59 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10638"; a="625554568"
X-IronPort-AV: E=Sophos;i="5.98,232,1673942400"; d="scan'208";a="625554568"
Received: from fmsmsx601.amr.corp.intel.com ([10.18.126.81])
 by orsmga003.jf.intel.com with ESMTP; 03 Mar 2023 17:58:59 -0800
Received: from fmsmsx601.amr.corp.intel.com (10.18.126.81) by
 fmsmsx601.amr.corp.intel.com (10.18.126.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.21; Fri, 3 Mar 2023 17:58:58 -0800
Received: from fmsedg601.ED.cps.intel.com (10.1.192.135) by
 fmsmsx601.amr.corp.intel.com (10.18.126.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.21 via Frontend Transport; Fri, 3 Mar 2023 17:58:58 -0800
Received: from NAM10-BN7-obe.outbound.protection.outlook.com (104.47.70.106)
 by edgegateway.intel.com (192.55.55.70) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.21; Fri, 3 Mar 2023 17:58:58 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=dNg0khot1ksucQcEVQ4oKUSOKQGadDxGTZKC8sAKLqnWRmohUJmK26aPjRdXp2WXy8VHLxGkI13zA/UM8kHJBaKTuvuy7iVtdIibk1zGABkTNyj7KeVw9VJL9quS8KuYrmIIzC/EXRcU5EadrH2T0lVbxJeuqyVlyN7X5gy03xJqv8ynmqi8Olv14twu00GNCEVn+8nkrkYKD91aRhit649DB5p340I2fmo4n251a+hJIPD5DlVL3KuodlqZly6VUFk8IiEvSjwBunI62sznnAO3b5hHcZFZorj5iuUY0nJh/TqBV8OMbxEMtmsZF2xrcIDy1kxgReyb8+GDhDVCtA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=QyAZK2eNbXIGVG6vBk6wFWXIpZLGGEusXEhY2cpFYa0=;
 b=ZE1H2ADEOH/n430laJoldv5sBK8k8aCaCfSCxU3/h4aVkokgGYollLMS1brlb1X26PTuox2TJ7MLY+9O1rrfJtkw37+y22L1o0Zj6BCk5rGXqT6isLa2/eLCUDF4na7VYqXjg94DKH+ph94KwzlEfKpBj2H0yXUv/BgbW4mOEU6sKfiljfQzzF6K/Ps9laRki43NBgMP2MdfxJoJRPG5tfjb+jJhxwJSCEUbIjg5g9GyOUtOldu867qswaKCmRYGRrHT95C6NrHiPcC+D9sZv/vEmKhAbtx09mCHQRYhAIZFi4a1WZd0VnLQoYzKavOURUu6aV/F0cMZ4Ph3JFobsg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DM4PR11MB5488.namprd11.prod.outlook.com (2603:10b6:5:39d::5) by
 IA0PR11MB7862.namprd11.prod.outlook.com (2603:10b6:208:3dc::8) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.6156.23; Sat, 4 Mar 2023 01:58:51 +0000
Received: from DM4PR11MB5488.namprd11.prod.outlook.com
 ([fe80::218f:c449:80c8:7ad9]) by DM4PR11MB5488.namprd11.prod.outlook.com
 ([fe80::218f:c449:80c8:7ad9%6]) with mapi id 15.20.6156.022; Sat, 4 Mar 2023
 01:58:51 +0000
Message-ID: <b923b230-603e-312d-8d4f-160486095152@intel.com>
Date: Fri, 3 Mar 2023 17:58:48 -0800
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.7.2
Subject: Re: [PATCH v6 7/8] drm/i915/pxp: On MTL, KCR enabling doesn't wait on
 tee component
Content-Language: en-US
To: Alan Previn <alan.previn.teres.alexis@intel.com>,
 <intel-gfx@lists.freedesktop.org>
References: <20230228022150.1657843-1-alan.previn.teres.alexis@intel.com>
 <20230228022150.1657843-8-alan.previn.teres.alexis@intel.com>
From: "Ceraolo Spurio, Daniele" <daniele.ceraolospurio@intel.com>
In-Reply-To: <20230228022150.1657843-8-alan.previn.teres.alexis@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: BYAPR01CA0038.prod.exchangelabs.com (2603:10b6:a03:94::15)
 To DM4PR11MB5488.namprd11.prod.outlook.com
 (2603:10b6:5:39d::5)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM4PR11MB5488:EE_|IA0PR11MB7862:EE_
X-MS-Office365-Filtering-Correlation-Id: 0eebdb3e-b71e-4e6a-cf6d-08db1c540033
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: IYLQoDFZSRliSfkNE2mYL3skAoi3vPkiP4SG8O9KU7WQvBi6eN2VuEejCGPZpdYKFzCi3GweFlbjiEREmuiPO+p7OtlDF/YVSPqvQB3azA/jXW1DYUR1QgjYSDFcxSqEramDPlOYSlN0Hwz4keOQAR2t5eZ6nc2FVkm/Ixl9ALmu36cH0vzgs5t+NSYUQvu5d1bRofwaGsf3iAH3XsxCATdj0t50owz28R5K6DzrC1vDqngpu9SyOkXgRfGALABcn9IZ14pCkjkgmTu6eYiy289BHjiRvmxwKS8E/mR/nyohWMBN54QTPCubHL3r48zYOWOcoIpeUN5fhA9fta4lgULkS4ECinFUd6KoNnunvXokoc5EbLPfHtSwUmpNWZaNgUMO+qGdB0UvcX3ofMe+rIpMm8l6RfTlY2Seji7+iICNjKkgvmwKgagL6wQbwjyEzuE6vfuFnryF/FozU/rBumkJWxl2brJz8jGSP6OlS7+Y3EzN9TIJbYCKBviO4E/OrsQoISHZHoLYbH7gHpKeyjew3A80MeEtKkgMGQE1skNBFYTDy1814WCLKoMJ7ZXLagSZ1xwRdGlN3MCdfLKdNMdcNleI1zzD379DG+tiGPpx7S4TXJmbDExpT5+Wgc7vFNTRuRPQgNwgnYITCCeDDfc8CZWuKTzHcWSTHvSWUMpq76atV+0S8mV3NloCUCwP8hZ3QZkpcFcp/vZA4HqYijwAGNGf5FQ+M6YfE5hX1Jc=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM4PR11MB5488.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230025)(366004)(346002)(376002)(396003)(39860400002)(136003)(451199018)(36756003)(82960400001)(6666004)(6486002)(186003)(6506007)(6512007)(53546011)(83380400001)(26005)(41300700001)(66476007)(66946007)(8676002)(66556008)(4326008)(2906002)(8936002)(5660300002)(38100700002)(316002)(86362001)(31696002)(478600001)(31686004)(2616005)(43740500002)(45980500001);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?SllXY0tRZkNyNUVFdU0wK0FvcDQwbHRINzVCaS9BOGxXQkdRMEFZR1hSWnZm?=
 =?utf-8?B?Z2pFNHFJcDZhWnAzZWdvU0Q3OVROQ0FQTEtIQ3J1ZTA5dHlyOGxUQkhBSWdq?=
 =?utf-8?B?dWk2dU9QbXhHMEdVL3RsZFNQZW9oa09FWUtKNUhpcTY0V3RFVHBlVjRZdi80?=
 =?utf-8?B?KzF4OEtXeTBnVStWZDh4VEZrY1hTWkdJcFJRTXZjdXZzbVFqWThnMWRjcG40?=
 =?utf-8?B?ZUlLMjh2YTZJNFRRN2paZ2ZHaisraWl6WnAwTW9hUGlUTjdnRUMzZlVwNGxw?=
 =?utf-8?B?cFlyZnNlSTg1WTV4ZnoreTZKSUZXek9sZkJTREh3R01EZEw0ZkJIUDdLTUli?=
 =?utf-8?B?UWNudlczTHVNRmE5N1NOaDVIM3U2WTVsZy9BcjZKckdYRTh2Z1AxcVZWZG9t?=
 =?utf-8?B?R2RtOGxPbGtSRzdpR2FaRXZ1bzJDUjFJcnFjckJMSForQnc0cnptaDJTM2tJ?=
 =?utf-8?B?d0U0THphWFY4TFpuWTd6ZmhVakF3YmtYOW1VRE1NK05MWWE2Z0pWUm0wYzhL?=
 =?utf-8?B?R1V3ZG12QU1LdWZlRllwUlUxTzllVzNxSEMvN3REYzdjYlE1U3U5eHU5cWhj?=
 =?utf-8?B?alNoMDlTejJGNWhyekZkaXRnQk5MYmUwUWIwZFArbkNlYTFwcVRRRVZMbjVG?=
 =?utf-8?B?aXEycWxOOVRTdFd5MXNSMVlUYzlrVkdpQURIZ0hjcmtkUjBPclM0cFVLQitH?=
 =?utf-8?B?L3RoUU9jT2RBVGpEM3BqOGhOWnhITmlkaURrNUtsUUEzcU53NWlrdGsrNmMz?=
 =?utf-8?B?KzB1bC9mRWszc0x1VmdEZyt2VHBNalB6cGRRWktLMnJ1QVp5MC9mSk1JeTlp?=
 =?utf-8?B?V0lGcTYzdjBMVkxNVDZPZ1dQUUdNQUxBb0ZUcXY5blZaeHR5S0dKNUlsTGJl?=
 =?utf-8?B?ZGovK1ZkakJQNC8vN0NZdC9CTzJnbC9yc1p1a1Noa3J6SWJ4WkpmK0tpRzUw?=
 =?utf-8?B?TisxbVg0WE5qTEpJTkJzcUhFb090eXozcWpvanNLNmJyTmpOTTV3RzQ5d0RW?=
 =?utf-8?B?eFBBNURzMkJ2aEl2ZTIxTndTeDFOcWpTT3dLYVRSamNFMXFTVFRTMTNNbEZ0?=
 =?utf-8?B?a0JmdDZoSE5hWm5OZTY5TTZsdHg3R2owMnVpU0ZSdEk1bHZmQVhtR1N3ZldZ?=
 =?utf-8?B?QWk2ekVZWHlJeUFsLzR1UFg0RHR6akE2cytBMUswM1R1ZEM1OVFnMUE0cFEz?=
 =?utf-8?B?eXhuN0pvWS81SzRnN1hSMEk3SytXQWVna281V1ovUmJhMUoyd1gyQ0JoTWVX?=
 =?utf-8?B?LzYvL2NoQkZBNUd1QXlneEdxbzBWcXNrNlEzQzJZdzVxa3cxNERYbkJxQTVh?=
 =?utf-8?B?TzRKRUFFKzBMMWM0c2lXVDIwb0JOa2dkRWp3ck1KMFl5U28zVlo2YXhrR1Rp?=
 =?utf-8?B?ZGg4eGFHdVFvbGk5MmRZT3FGUWhGN3pqSncyZGZTa3NLenNuZkdvV0dLRDFv?=
 =?utf-8?B?K21Hcnl4U2QxY09rTDNRVUxaOURQTEtZMHdTSWNoS3VlUHdZNUthK01rTEtl?=
 =?utf-8?B?VlUzSXpOTHZGbzIzNEhLdW1aMUtPcVRGQlY0K2VoUU4rM2J4L0p1eURocGlS?=
 =?utf-8?B?YjdmM1h1MGlCY0x0WjhuV2NFY2h0eDRoeTZEL1lmblBNaS9zYlVxL012dHV2?=
 =?utf-8?B?aGw2WW15SHhtY2NkcjhKY3drVDBWa3hRUWlDbk1DQUEvQmJPV0VhVTZmSEZY?=
 =?utf-8?B?NWpHOEMzdWJYeWMzUTJNOTQvM3JiaURBdTZ5ZythNEIvbGpodlppcktwOVZ1?=
 =?utf-8?B?OWRMc0I0UFdINXZDMno4WVNjTHJyNEszZUFBMmh4ZVZsSkJSL1dmZ1ZxNlgv?=
 =?utf-8?B?aERPZ3V3YytZd1dzS2ErdmJ3SmFZZTcwWklBbDl6bjQrTHhRN2pUYXd4N1A5?=
 =?utf-8?B?ZUJnYWJtQXc3RXQwemh0QVBkQXphdG9UNzA1RVU0ckpuRm1KWlBubFE2TUZ0?=
 =?utf-8?B?eHdqdTNJMEhldzZ0RVJWTUFzWTBGOWE3aGgvYlhhQjA3L0tQM0hnejNKT0Ro?=
 =?utf-8?B?WUVqeGF0NzhmWndkb0pEeDFaNlBscE10Uzc3aFF2RjFBdlZURFVKUmdKUmxj?=
 =?utf-8?B?emNkUmVuVDFpN1RTODZ0aUJwOUhiQitKYm1TT0lreTVJZTdSMnFpaENqYi9q?=
 =?utf-8?B?bXdwVHhHQ3FNb1pja0ppZmhlb2srcnpHR0FaYlRKTDVQdS93UXl0Y3dhMjlX?=
 =?utf-8?Q?1ZclgwF0CaFugMYsw0UA0Dw=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 0eebdb3e-b71e-4e6a-cf6d-08db1c540033
X-MS-Exchange-CrossTenant-AuthSource: DM4PR11MB5488.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 Mar 2023 01:58:51.0689 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: ewDxFI+agj366lCOwvSC47TWkw++eO0fHIIJryfDEFwrxGSXoPzhOm46MAIGBYyqle0kn2diw3CN2YhI7T2gdcNoGuPeWhXDQSy4wXysfC4=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA0PR11MB7862
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



On 2/27/2023 6:21 PM, Alan Previn wrote:
> On legacy platforms, KCR HW enabling is done at the time the mei
> component interface is bound. It's also disabled during unbind.
> However, for MTL onwards, we don't depend on a tee component
> to start sending GSC-CS firmware messages.
>
> Thus, immediately enable (or disable) KCR HW on PXP's init,
> fini and resume.
>
> Signed-off-by: Alan Previn <alan.previn.teres.alexis@intel.com>
> ---
>   drivers/gpu/drm/i915/pxp/intel_pxp.c    | 19 +++++++++++++++----
>   drivers/gpu/drm/i915/pxp/intel_pxp_pm.c |  3 ++-
>   2 files changed, 17 insertions(+), 5 deletions(-)
>
> diff --git a/drivers/gpu/drm/i915/pxp/intel_pxp.c b/drivers/gpu/drm/i915/pxp/intel_pxp.c
> index 61041277be24..e2f2cc5f6a6e 100644
> --- a/drivers/gpu/drm/i915/pxp/intel_pxp.c
> +++ b/drivers/gpu/drm/i915/pxp/intel_pxp.c
> @@ -119,6 +119,7 @@ static void destroy_vcs_context(struct intel_pxp *pxp)
>   static void pxp_init_full(struct intel_pxp *pxp)
>   {
>   	struct intel_gt *gt = pxp->ctrl_gt;
> +	intel_wakeref_t wakeref;
>   	int ret;
>   
>   	/*
> @@ -140,10 +141,15 @@ static void pxp_init_full(struct intel_pxp *pxp)
>   	if (ret)
>   		return;
>   
> -	if (HAS_ENGINE(pxp->ctrl_gt, GSC0))
> +	if (HAS_ENGINE(pxp->ctrl_gt, GSC0)) {
>   		ret = intel_pxp_gsccs_init(pxp);
> -	else
> +		if (!ret) {
> +			with_intel_runtime_pm(&pxp->ctrl_gt->i915->runtime_pm, wakeref)
> +				intel_pxp_init_hw(pxp);

personal preference: I'd move this (and the matching call in fini) 
inside intel_pxp_gsccs_init/fini. That way we can see this as more 
back-end specific: the gsccs initialize everything immediately, while 
the tee back-end follows a 2-step approach with the component.
Not a blocker since it is a personal preference, so with or without the 
change:

Reviewed-by: Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>

Daniele

> +		}
> +	} else {
>   		ret = intel_pxp_tee_component_init(pxp);
> +	}
>   	if (ret)
>   		goto out_context;
>   
> @@ -239,15 +245,20 @@ int intel_pxp_init(struct drm_i915_private *i915)
>   
>   void intel_pxp_fini(struct drm_i915_private *i915)
>   {
> +	intel_wakeref_t wakeref;
> +
>   	if (!i915->pxp)
>   		return;
>   
>   	i915->pxp->arb_is_valid = false;
>   
> -	if (HAS_ENGINE(i915->pxp->ctrl_gt, GSC0))
> +	if (HAS_ENGINE(i915->pxp->ctrl_gt, GSC0)) {
> +		with_intel_runtime_pm(&i915->pxp->ctrl_gt->i915->runtime_pm, wakeref)
> +			intel_pxp_fini_hw(i915->pxp);
>   		intel_pxp_gsccs_fini(i915->pxp);
> -	else
> +	} else {
>   		intel_pxp_tee_component_fini(i915->pxp);
> +	}
>   
>   	destroy_vcs_context(i915->pxp);
>   
> diff --git a/drivers/gpu/drm/i915/pxp/intel_pxp_pm.c b/drivers/gpu/drm/i915/pxp/intel_pxp_pm.c
> index 4f836b317424..1a04067f61fc 100644
> --- a/drivers/gpu/drm/i915/pxp/intel_pxp_pm.c
> +++ b/drivers/gpu/drm/i915/pxp/intel_pxp_pm.c
> @@ -43,8 +43,9 @@ void intel_pxp_resume_complete(struct intel_pxp *pxp)
>   	 * The PXP component gets automatically unbound when we go into S3 and
>   	 * re-bound after we come out, so in that scenario we can defer the
>   	 * hw init to the bind call.
> +	 * NOTE: GSC-CS backend doesn't rely on components.
>   	 */
> -	if (!pxp->pxp_component)
> +	if (!HAS_ENGINE(pxp->ctrl_gt, GSC0) && !pxp->pxp_component)
>   		return;
>   
>   	intel_pxp_init_hw(pxp);

