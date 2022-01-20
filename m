Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 906364955AA
	for <lists+dri-devel@lfdr.de>; Thu, 20 Jan 2022 21:54:34 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C6AB510E3C8;
	Thu, 20 Jan 2022 20:54:29 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga06.intel.com (mga06.intel.com [134.134.136.31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AEBD010E3C8;
 Thu, 20 Jan 2022 20:54:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1642712068; x=1674248068;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=50PXb6zCl28hhcuAS+IAbPJEZ9K8TPTSQHMQHb+AN9U=;
 b=RBh0v9hpbwxYmjOB12RE1O3Tc0oTh6WuyiI6Mp5YP8d3RNP8Db8T/IEM
 U0LVpbhuzcX8kE2RBiUkw9/wbxzmvQ5wIDxy6xPQlA8938z9g+wnUOrgd
 DC9tTUupDy4pZCh5lqhtivYjxq2G81lLS9s9kU12WdkxciwraL/3yUUdv
 W3879HhjuOsjc6LmEZHUqLr3q8Ny9OR4E3gM5JK29uNDyM/nNOf7DAeHO
 NYgwrfVOuBUtr7dS9//7JVYomsjXfcjf0dAYD/xN5PnPErsxAzzaABvRk
 LKXGtiRnTSFSNabJujYM0OMw8wbfBSiakbgI09qj0tLWqKTmxuH0iaxPP w==;
X-IronPort-AV: E=McAfee;i="6200,9189,10233"; a="306194073"
X-IronPort-AV: E=Sophos;i="5.88,303,1635231600"; d="scan'208";a="306194073"
Received: from orsmga003.jf.intel.com ([10.7.209.27])
 by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Jan 2022 12:54:28 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.88,303,1635231600"; d="scan'208";a="475678602"
Received: from fmsmsx602.amr.corp.intel.com ([10.18.126.82])
 by orsmga003.jf.intel.com with ESMTP; 20 Jan 2022 12:54:28 -0800
Received: from fmsmsx612.amr.corp.intel.com (10.18.126.92) by
 fmsmsx602.amr.corp.intel.com (10.18.126.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2308.20; Thu, 20 Jan 2022 12:54:27 -0800
Received: from fmsedg601.ED.cps.intel.com (10.1.192.135) by
 fmsmsx612.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2308.20 via Frontend Transport; Thu, 20 Jan 2022 12:54:27 -0800
Received: from NAM12-MW2-obe.outbound.protection.outlook.com (104.47.66.49) by
 edgegateway.intel.com (192.55.55.70) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2308.20; Thu, 20 Jan 2022 12:54:27 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=PSiOnNfxaPluM6Cr8Xpo0kLg5Cjz9edpU4EZ06/x3CT0vIfjBKI9P2f3fTsRl9UyVClPOaW6Ow/1leP/cQZIWw/S6deZysNe5Ij5Say5UKShHtsJoTt/E7lb2e3GgK0XEQXxgXHqmoDmS55NYOnchp/8exeeTfUUAD2uAXGhPhleK7bQlZDiBF1zjjbVAYlA0TTwYT4jgFCf3D7XUs8iW3lGV0It7rdyfmHZ5Tw0h9N/Miox6zJ3tqPs/NUmC1mwY9x4ljLqAdJvlTB1aizEGRfXtotFtX/Anm2xGwNOKUpGVnOsx4/J8ITGHUut1gsFZBnPUjZ4vM37bkBaplP03g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ZDi1Eq1UWRFWmr4ITYuEXJS1pg43TzWqcf06AbMlIyU=;
 b=nbMlSIW6DlN7StYMFew7MNLQUMozEeMEspIU7W6fKkIzHCNrLNZOeDNf5o4DasGZVeMASENWpxyMzpVBp7xGa5lZf+wR6VkJSbfrub6SmfcneZ1Uynlb7vsrQ4Ssjp2qYNQxgcrENyC/PdF/Kt1KP0I2NEF+bg/hgkFNW85ssAcMHGDXp7+mycOArZnog88+yFD1MWcAF4AVDyALR/lbB1xlzRgjjvL+Ovh3K2qtpTkHZ+DbW9s/GMCY2Z0zMDe0r59cA6wF2VOJX1sFHH57RTINsuVZrZF1rAfAUHmRE1FB/2XhhvaTq6g/PvmNgwHapZdMBvVninOmDD9ONFimoA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from BY5PR11MB3911.namprd11.prod.outlook.com (2603:10b6:a03:18d::29)
 by BYAPR11MB3029.namprd11.prod.outlook.com (2603:10b6:a03:8e::26)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4909.7; Thu, 20 Jan
 2022 20:54:03 +0000
Received: from BY5PR11MB3911.namprd11.prod.outlook.com
 ([fe80::b006:30e2:f354:3ea5]) by BY5PR11MB3911.namprd11.prod.outlook.com
 ([fe80::b006:30e2:f354:3ea5%5]) with mapi id 15.20.4909.010; Thu, 20 Jan 2022
 20:54:03 +0000
Message-ID: <81558cf3-8eb3-7d45-d534-0769243d4bd1@intel.com>
Date: Thu, 20 Jan 2022 12:54:00 -0800
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Firefox/91.0 Thunderbird/91.5.0
Subject: Re: [PATCH] drm/i915: Lock timeline mutex directly in error path of
 eb_pin_timeline
Content-Language: en-GB
To: Matthew Brost <matthew.brost@intel.com>,
 <intel-gfx@lists.freedesktop.org>, <dri-devel@lists.freedesktop.org>
References: <20220111163929.14017-1-matthew.brost@intel.com>
From: John Harrison <john.c.harrison@intel.com>
In-Reply-To: <20220111163929.14017-1-matthew.brost@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: MW4PR04CA0036.namprd04.prod.outlook.com
 (2603:10b6:303:6a::11) To BY5PR11MB3911.namprd11.prod.outlook.com
 (2603:10b6:a03:18d::29)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 5ecfe816-4b90-445d-d4c5-08d9dc56fda2
X-MS-TrafficTypeDiagnostic: BYAPR11MB3029:EE_
X-LD-Processed: 46c98d88-e344-4ed4-8496-4ed7712e255d,ExtAddr
X-Microsoft-Antispam-PRVS: <BYAPR11MB30290B218CCB58E13B437A69BD5A9@BYAPR11MB3029.namprd11.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:4303;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: BuIeZ9ZVfTluG/cI3q+wCvkk21qCTA+z8J1B1om2HrSx4c5CfIXGsHvxkbGSRdM5sQq92C0pm9aOLdSsZ4YmhH+47SXuVzeSLKnBsRUK9he/MLdbQnq5tM0etPUuA4ahYU5a2HrIX1Qvv/ZkozvFbS0YDdmOZnvH1oFVH75adw8ZYg0CcJ0i8p6bMPaBsyZh1+8wvKX1oWAX4Cl7OSJazZxY/ic8xGd/dEDOTs85vxHjVgFeVIP/LD9nRD06J7/R2XzrOEdwMjiG3C3oFHbHMtXZFxzwM5Nl9DaAfaVQH4ySeW3Lc2T2GpEoV32qGhK7nLftIYxlBThGFJ3PuOtusXHEmXLKJy4ICVIgdzyzfC/sqbzV0mhuFgcR5LLdsQcq659KaN0QdgUYrx6M94KD+SsE5VHeVoA9X4jYSVZFBt/4A49DAupDmVG4yu+NKTDecgvJzxH4K1++wKDpfkxTDOWXdKxhA1JrvBDq50B8ZiXyHAVArDBYjc5/BHaFPAZgjn7Dn8x3MVU09WKuNwCIuFuhLg4t7DTIC3ZRVVj59hENKAusBMvnxtzm2kcdmDr7GDkrl/MocrekV5D7j7zNR9EgXq0IitJCzAvWniknBQpIIGpP+BZclj6kJPaIWYYa5oSDG6NtDxa7DM55jw4S0gQZH18/sSjzQVagocJCWwjbiqPS16HOrTUCnsLW9hbCMj2DUt2sAtP+mI4tVw7ZcaFN/MWYIkln9r0o/exAzl0=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BY5PR11MB3911.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(366004)(66476007)(66946007)(31686004)(4326008)(38100700002)(316002)(107886003)(186003)(450100002)(53546011)(6506007)(36756003)(8676002)(8936002)(83380400001)(86362001)(6486002)(5660300002)(82960400001)(2616005)(26005)(508600001)(31696002)(66556008)(6512007)(2906002)(43740500002)(45980500001);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?R3dMY1ZJTGRWU29adGh2OTBsYk1nYlVDbXVXdlcweExEUVlMZFVReDUxOHE4?=
 =?utf-8?B?Y1hpUU1wcWQwUjdsbDFtWk1XdTRmcUJ2cG56ZWJudHlOSEs3YkxtZ3dtMW91?=
 =?utf-8?B?M0QzdklmZG92MnFiVUFML3VXRHRIekVVRFh4bWpWQ2VVZU9NajFLUW9lVWU5?=
 =?utf-8?B?M0NWVDVCS0dCTXNJbkI0Zm92QnlwS3JSd1F6dHMrMlV2M1FOUVFwQTAwbHdS?=
 =?utf-8?B?ZEpPUG42OGNwZVV5NXlPb0RDajVMSVM3Z3RIMms1YlEyTVcxeW1RWmhSWUox?=
 =?utf-8?B?MjlDUE10TDZOUjMvczRLMXV3Sm5YTkJkeksvQy9lMUlrT0o0RU5MZW1URVVl?=
 =?utf-8?B?Q2ZkZUxsdlNPcExXamMzVU5DbmtkcnlTSFc1MWZWZFlHTU9UYlpuNEVmSCtx?=
 =?utf-8?B?bElybFdDT0l5UlBvTmpOMlVTSkpNMXJZdnBrazV0RVNybE9oWjJUbUVQdHhD?=
 =?utf-8?B?VmRMZkpoWlVrc1E2WHUwSjBSOWFVZUtaUWRxSTVLZkFxWEpBVGFJcGk0eE1Q?=
 =?utf-8?B?SlV5VDdENGlrV2o4OWxkV2NMbFMxK2FKc3E5MmJ2YTFTbUIwWWorUkozUDlE?=
 =?utf-8?B?VSt0ZFBVdEl4aEJLYU9xbzVYeDRobFdEMUFQamgvd09ray8vTFhGTEJQQ1gw?=
 =?utf-8?B?cHkybHRyNkI1TGVrR3dOcExmUXkwMFF3TkNDeHZkdkVGejVaOE5CVDRyQWRX?=
 =?utf-8?B?ODN4a0o4cC9yR0ZPc0hVejJ6QjJJVmtzZ1BISk5qV0kzZWFRei9XNlIxV0Rs?=
 =?utf-8?B?a1o1dkI2akt6U295Wlk3ZDhPUDFoL1lVc21SVyt1RU5rb0wrdE5sZDRTWndq?=
 =?utf-8?B?OGZtR0thT28yMk1qOXJuY0JGNTExTDM4MmtDT1JNTmpnS3h5ZkxGeVRaRXIv?=
 =?utf-8?B?RkFsYStGQ3pLdlZEU0xaVmViUVNDdHVPM2N4VGZoMitrNjhyd1U0TjNWd0Fp?=
 =?utf-8?B?SUxGOUpvcElkeHhyeGdQM0VrOGRGcmdYQXNRSFhFR1VKOXlJRmpiYWpMMGc3?=
 =?utf-8?B?WkRMRHA2WnNBNzVzVUZiMTJoY3BlQVROay9aRkdOY2lqai9iTkFvNXZFM1pI?=
 =?utf-8?B?Z0ppYysvQmM3NkUxOEZBRWlaVWR3QlVKT0RxSFRtemU3M3YxOTc0eER4M2Fy?=
 =?utf-8?B?c1JiR2NYbWd2eXdJeklINmxpODhFK2grQXRPY1dLYlQ0MlBZYTJtbEFscjVm?=
 =?utf-8?B?TzR6OTBhSkJjMm9JN1FQU1J2V1dRR2NhclhEc3BNYmdlZEN4SzNsRTlUQWp4?=
 =?utf-8?B?VFpsTHhIcDhHeU5FUkhwL3piemZNdGtZNG5ZeDVpWS9wSkVpYXFaTnpCMVZ0?=
 =?utf-8?B?SHFDeUNmL2RFVXdBWnNNWDFza3pYYUp3K2FCcHV2SWMraFJRazZqVDdHazBv?=
 =?utf-8?B?ZmlaRG5jWVFNR21wQW5wSDZvWFBDYmM2V0c1bHZxMGhVTGtCckhxaVc2WHg0?=
 =?utf-8?B?QnNUZzh0VVJSSGt1UDIzNmY2dmkyZWZ1TVNuaW9POW5yZFJuV1Q4MjVtUCs4?=
 =?utf-8?B?Y25McS9XOFZGT0V5dmxyRmZjTjZMbUtPR3NOVnBsYk03Yi9BMHFRZzd3Wmll?=
 =?utf-8?B?aElncUh6NXYzQlFZS3lKMkdSSkdrdldBbjRHRnhWU2FsNjAyUjQyZ05UaCtP?=
 =?utf-8?B?ZHZmNlg4bitETG9jeU8rQnFOK2tRQ3BMdU12YUN6REZMZk5pMU1lQUFLZUE5?=
 =?utf-8?B?eVk1ZlZ1cGE4VVlkQlJETW1FMURPUFRCMmZuKy9tUFVLeG55bkVRamg4RlVl?=
 =?utf-8?B?bUM3QlV0SFlLZFR1NEhqblArSlMrUWsvczJaTGg5OVlOei9VRnN0cC9lYThQ?=
 =?utf-8?B?SnJPMVI1VHFtWWcyTU00QVNrMjg5clZMTmZJdWpGcGFGRTVFWXhlSUE0WjRS?=
 =?utf-8?B?RzRDU0ZEV0pJZEM1YmlXSjR0VWowalF2dkVITHp4cHhnTUxLdklQSDBDOVdK?=
 =?utf-8?B?blJUNFEwcXRqYm1zY2h4SjYyZTlmdmJ6aEZMeTFSL0Z3RjNNT1c2bWZHNzFi?=
 =?utf-8?B?b3J3cGY2SllaLzRObEM5MjREUTR4bGExejhoZExhV0x3Q0IrTkpQM09TL0R2?=
 =?utf-8?B?SWFPTnV4ZlF4YXR6VVM1ZXFMVDlMZXM1OG1TT25lbmxsL0RubjVCMGZ2S25y?=
 =?utf-8?B?cDE3MVF4MVA0aGx1MlIzWXR6ckk1a0tnK0xHbE5BN2RxSkF2cXYrbldxM1lD?=
 =?utf-8?B?R0J3RkV0R09XN3U4M1RuUjFReVBLR1JNRitGWU9JVFpLWkdxSUNra0pSUktB?=
 =?utf-8?Q?+qDKyyHoxsNeDM7hM+n5YM5tSZdqkwvGfxL7D/hQ/U=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 5ecfe816-4b90-445d-d4c5-08d9dc56fda2
X-MS-Exchange-CrossTenant-AuthSource: BY5PR11MB3911.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Jan 2022 20:54:03.2897 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Ekh2w/a8HWkGaRrJA5yPVs2tCST7EeTc8+XikFQHyGOy0K1czQdGZ+I+jdj7n+Nvytx+7PXY7y3uc/mRphg52XPSQfh5mBlswilI4x4xxgY=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BYAPR11MB3029
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
Cc: daniele.ceraolospurio@intel.com, tvrtko.ursulin@intel.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 1/11/2022 08:39, Matthew Brost wrote:
> Don't use the interruptable version of the timeline mutex lock in the
> error path of eb_pin_timeline as the cleanup must always happen.
>
> v2:
>   (John Harrison)
>    - Don't check for interrupt during mutex lock
> v3:
>   (Tvrtko)
>    - A comment explaining why lock helper isn't used
>
> Fixes: 544460c33821 ("drm/i915: Multi-BB execbuf")
> Signed-off-by: Matthew Brost <matthew.brost@intel.com>
Reviewed-by: John Harrison <John.C.Harrison@Intel.com>

> ---
>   drivers/gpu/drm/i915/gem/i915_gem_execbuffer.c | 9 +++++++--
>   1 file changed, 7 insertions(+), 2 deletions(-)
>
> diff --git a/drivers/gpu/drm/i915/gem/i915_gem_execbuffer.c b/drivers/gpu/drm/i915/gem/i915_gem_execbuffer.c
> index 9e221ce427075..4a611d62e991a 100644
> --- a/drivers/gpu/drm/i915/gem/i915_gem_execbuffer.c
> +++ b/drivers/gpu/drm/i915/gem/i915_gem_execbuffer.c
> @@ -2518,9 +2518,14 @@ static int eb_pin_timeline(struct i915_execbuffer *eb, struct intel_context *ce,
>   				      timeout) < 0) {
>   			i915_request_put(rq);
>   
> -			tl = intel_context_timeline_lock(ce);
> +			/*
> +			 * Error path, cannot use intel_context_timeline_lock as
> +			 * that is user interruptable and this clean up step
> +			 * must be done.
> +			 */
> +			mutex_lock(&ce->timeline->mutex);
>   			intel_context_exit(ce);
> -			intel_context_timeline_unlock(tl);
> +			mutex_unlock(&ce->timeline->mutex);
>   
>   			if (nonblock)
>   				return -EWOULDBLOCK;

