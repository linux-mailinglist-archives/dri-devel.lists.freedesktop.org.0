Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 242497ED5E1
	for <lists+dri-devel@lfdr.de>; Wed, 15 Nov 2023 22:18:14 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 11D8E10E25C;
	Wed, 15 Nov 2023 21:18:10 +0000 (UTC)
X-Original-To: DRI-Devel@lists.freedesktop.org
Delivered-To: DRI-Devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 74D0810E248;
 Wed, 15 Nov 2023 21:18:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1700083088; x=1731619088;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=OVeTs9e2WAmP5+lHTD1fGlAQ7TnmlAqZkdt4BVflfW0=;
 b=Hqba4+i0sSVfZ5IXRM3mfU8UGT4HhsGPpDe9tRlAjw60IzKJyPHefgFK
 OB2SEdQMwi1fZSG3/XvSOx4Ubc6yG2Bj0JPiw7VXnfNPh2OklxfGcD4dp
 CwwdyjlsMYOe64W3q2kb/k36W4P1WLcP1tzCaUAafWzoZfr3abvto6q0l
 GG5uiTxyypRMhcLMTc1Pu/zJKMFUgByMwXKFVfWDAgQOHMvxrUOoXOnyn
 9U5CGwZCI1LIcjmXAi9jaJh/jZkPYWokosQMThpN+b0dwB//Kj6FMY9Gg
 KBUC0mAi6mfEXoTqxDYIl3zzK9fL16pDXs/6zL41NVXpnAcOrcUDrvUgB A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10895"; a="4034283"
X-IronPort-AV: E=Sophos;i="6.03,306,1694761200"; 
   d="scan'208";a="4034283"
Received: from orsmga003.jf.intel.com ([10.7.209.27])
 by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 Nov 2023 13:18:07 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10895"; a="714991690"
X-IronPort-AV: E=Sophos;i="6.03,306,1694761200"; d="scan'208";a="714991690"
Received: from fmsmsx602.amr.corp.intel.com ([10.18.126.82])
 by orsmga003.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 15 Nov 2023 13:18:07 -0800
Received: from fmsmsx611.amr.corp.intel.com (10.18.126.91) by
 fmsmsx602.amr.corp.intel.com (10.18.126.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.34; Wed, 15 Nov 2023 13:18:06 -0800
Received: from fmsedg601.ED.cps.intel.com (10.1.192.135) by
 fmsmsx611.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.34 via Frontend Transport; Wed, 15 Nov 2023 13:18:06 -0800
Received: from NAM02-SN1-obe.outbound.protection.outlook.com (104.47.57.40) by
 edgegateway.intel.com (192.55.55.70) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.34; Wed, 15 Nov 2023 13:18:06 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=gxcmf2g7LeTmGXa2nzb7/mpLNUXKSUQl+NTU2hnW/oc3nvxX9gfPKoDDgp2/4L9qno/OSQLELX//mKJfaa1TBZjVYtCiSGfedTCJOmX7DmuzPs6fNIqmOl9LHz3tYG/R034I0ImFlRHQQCRxT8j8IFU7d/rW3MyojhltXFCxeJdQzifXrrMGf7p4oqXURKLi7YFzPNXMyRpU9hHBFNN1UqFeDQix/iEi/j1bBUm4YTBRrYg9n1c2LtqPMO8ontdvirkGkNtiEQvs2CntTtNykH5uzHDh1iijTJzClcqVsLOKOm6gL3puS84G+l0Sd3e1WPBAr7rJImf3j/qglDt4pw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=PvltjrNsGJp952XnLIGZC4nXGWlEeuNCPB0jk50yhes=;
 b=i1s39SvooWlO91ByPUkwTTtum/E+//fkblnKVtS1pj8GIaDO1HZpo7d9eoCUjW3i3YD0JYLjrA4wHvxI2+Cyo7fNbnKC2v/Cj+M6cKGJjMe3rLeX5gCH6a6gpwaIqS8Mg9plXGoILVws9otUWeMyOp8TkY5sEyeCL16vFAD5ZXgUIUQ2Z25B8KEg94nGDPnR2XTJFUBpep6VnwanoaVONdLpttzcEFY5ORrBvulhqngV5SvZ/Elv7eS061vOWbvOd/uf2NGdAcDgKWVrJ1ntV0FvaG4hbDqZadI3q5UFqOLoyX1lgAifHNAiW2MK9f91t6aTrabAjXXpqnLcaH4NiQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from SJ2PR11MB7617.namprd11.prod.outlook.com (2603:10b6:a03:4cb::9)
 by SJ0PR11MB5182.namprd11.prod.outlook.com (2603:10b6:a03:2ae::13)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6977.31; Wed, 15 Nov
 2023 21:18:03 +0000
Received: from SJ2PR11MB7617.namprd11.prod.outlook.com
 ([fe80::e664:6a97:c93:4e57]) by SJ2PR11MB7617.namprd11.prod.outlook.com
 ([fe80::e664:6a97:c93:4e57%5]) with mapi id 15.20.6977.029; Wed, 15 Nov 2023
 21:18:03 +0000
Message-ID: <3e78c9b5-073c-4e7b-95bb-fcee5717c85b@intel.com>
Date: Wed, 15 Nov 2023 13:18:02 -0800
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/2] drm/i915/guc: Don't double enable a context
Content-Language: en-US
To: <John.C.Harrison@Intel.com>, <Intel-GFX@Lists.FreeDesktop.Org>
References: <20231110005409.304273-1-John.C.Harrison@Intel.com>
 <20231110005409.304273-2-John.C.Harrison@Intel.com>
From: Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>
In-Reply-To: <20231110005409.304273-2-John.C.Harrison@Intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: SJ0PR13CA0134.namprd13.prod.outlook.com
 (2603:10b6:a03:2c6::19) To SJ2PR11MB7617.namprd11.prod.outlook.com
 (2603:10b6:a03:4cb::9)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ2PR11MB7617:EE_|SJ0PR11MB5182:EE_
X-MS-Office365-Filtering-Correlation-Id: 40350448-b03f-408e-8c20-08dbe6205a3e
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: Xkkz6fSkPFYOxAepDrBfhe5A/2k7Tkfcbh86NmR+SKI0noBWUUKs8JneBdxrW1G/IQr2a9mvMFXi/PEnNqMIDRtF4TSo78x3LFyPUl+bQkD+zBMuWR2cEZzs4lagdXE7j2jkZ3PgZLQyP9au/0XJpC0S5PgwL/Udv92ftH8d9StSloPSi9XG9de2ezERXusCrLKN3Daxhvu/wdZQCa/OyvtLVy/ARIZd8IKbQfcLn4Ss7BYUFurdM1aYkZV0lTHkZSbiWTOCVS7ZqjxIP2WAalosP29WnfV7nRKaHSV7JfIirz+PwVKY33LjAfI1tgS+JVOVgyGFiDRJ3HBegg/6eL5I/Sp3SoTazXE8cuuuYdxvv8fBRgP7kxGmM8fsul9d/E4+n8qdMXAq/HZqPkD06F6CQXAffKaYITlKpYgfjalwINKTEKbVcFoVStDWxvpitN2UPnHqwfg/ycpKYT9XBRi29v7wsCdka1+3GWk+nLGBp5I1a9r4KDmZRHcXiKNAd94AFclnMkrIipLq6C/OFOv7fHltEVFGxxyrSgHW1g1eraPpjjmi08D6ipLjFWfIBfh81Zsnxb5izDxB3OzOhi+rBY/fktOZmc5Bsda8Epz9Q9WSF1pCkVtUy54+ooa1f9ASzSJ0nuoE+ZmCZisBJw==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SJ2PR11MB7617.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(376002)(366004)(346002)(396003)(39860400002)(136003)(230922051799003)(1800799009)(186009)(451199024)(64100799003)(31686004)(6512007)(53546011)(450100002)(4326008)(8936002)(83380400001)(6506007)(8676002)(2906002)(41300700001)(38100700002)(316002)(26005)(478600001)(82960400001)(5660300002)(31696002)(2616005)(86362001)(6486002)(36756003)(66556008)(66476007)(66946007)(45980500001)(43740500002);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?U2NlZjZveDBISHhObk1qQjdqOXFrcDh3UVRidmM3VXBqRHMrMnd5b3VIelZT?=
 =?utf-8?B?anRHOWY3RlBuY1d0dTJSWmJRL0FhcGVjWHZzNkJrdjlqcDB2M0VVMS9pZ1Vp?=
 =?utf-8?B?ZlUvT0RISGZrUnJYb1BnYWY4L2hQZ1V6QnJnRVplVGV5Mm5OUUFmYkRFcUVt?=
 =?utf-8?B?VDdaZGFuNWpDUkE2R1k1Q01yVW1RVHR3RmxRTmwvcGVkRDgxSHg1SnlIaEdC?=
 =?utf-8?B?bFpSL0tRNGVnQU9uQ21rdUdkMUM3dUxGbmdzZTR4MDJGdjFuTlhHZ2xPUzdG?=
 =?utf-8?B?T3JLRTlYcktKL0pIV3JaQ2F3d0tLcWJMRytpcEhITlFyWVRkUWcrM3pITy9n?=
 =?utf-8?B?SEtDTjRXRk9SSG1LM1gxV29OVTV5ejg5c3YrbnJhdytnT3pIR0ZpOXQ4ZzRa?=
 =?utf-8?B?V09KaUFOUlBEdEM1Skc1U3NMSUhnd2Izc0JTZi9iWmJkZFdRYURXOW42S3VJ?=
 =?utf-8?B?MXdPcjZJQWtxZFR0NXdQWW9jejNGbE9lNmZFZU1HU0VLdEI1cTlOZm9OclJu?=
 =?utf-8?B?ODFBSU5BSm5oazhMZCtzaitJYStLMUJZZWtKODNiOXVCTzFpTmZzVjRKS21X?=
 =?utf-8?B?cVBIZFBzREx4MGNaMWRic3R4UnFMbENZVEZIckJleUw1aUlSVld0dmNTbUti?=
 =?utf-8?B?dmY0aUwvd3ZEbEs3Uk1qRVBFbHRsKzVhSm5nZmYxWXJnYUd3SHJWZi9VTnBB?=
 =?utf-8?B?bDZPRnpKUS9tVDkrUnJUVG5lRHlvZ09Cb2U0aXRhcE9YZE5hZmFSd1VEOTgy?=
 =?utf-8?B?NDhWemk1UXZhWVE2QkRpN0lUa0JwQ05EbXBhdnlLNnFKbEZkUzcxQ3V0TmpF?=
 =?utf-8?B?dlgzd3FSTHlDWjgrMnVvRm8vOEU5V3BWR05WTFpkbWpRbm56aHpVN1NiSWtr?=
 =?utf-8?B?eWlJYVF5TlIvK2t1djZvKzRXUVZIa1lQSW93TlhqaGhFejB3emJQYlZHQnNE?=
 =?utf-8?B?YkNDYWlFcEFPdXRTMElTekY0MjFaYkdYZzQxTUtWSStHUFVMWnBObXkrQURx?=
 =?utf-8?B?SXBaRkpjclZWWVNWdkliZUF1WVFVaHV0Yi9LanlFTE84WTRKVWh4M3RjdzJZ?=
 =?utf-8?B?ZGR0b295MXM5Z2NtTnU4NUxpdzJVcFYweDhQRlhucWlmR05qTWhVSExReTJN?=
 =?utf-8?B?dEo0VTE5UUVGV2tlUTJab2kzNlpiWWlUQzlXMzhpSnJpYmxMTDBzdEZ5aWdI?=
 =?utf-8?B?WkpTMjJHc1pEZW51UmtPcmhwNmJkKzFyWDJKSEJkZDhmcnAwRSs3Y2ZNNXdp?=
 =?utf-8?B?VXV3aDFiY2UyWStUTEpPRHRyYUZSMHZ4SHVNRmVsSllGcG84WFRTUEFGaGU4?=
 =?utf-8?B?S3MwS21jMjBOeVZYYklhZVgxby9GaC8zbWNDSmNSTHRFTDlYdERPczE1UFVM?=
 =?utf-8?B?S0laNzdQeFMyYUdlOHZRZUxQM2RzTmlHR3ZzNTNuVmNmeVdrZ1RjSk02b3F1?=
 =?utf-8?B?aGQzeWpDTkdKV281Q0F4Qng4QW85ZmF4a2FUdFVTUVB5M1BLSnc5M29QRy82?=
 =?utf-8?B?NTVOU0NHZnc1SHBIV2YyY2tjVjdtTjJNclBRWVBYOFZJSC8rdzVUWWhzYWZ2?=
 =?utf-8?B?VjJ0bzBWNWRkUTNGQlVSdk9ETkhDOGFpV3pzMENyR0Y4RlIwTkNtb1lyaUJx?=
 =?utf-8?B?MXg1MmtmQ1lOM2dMSWZnUVU4S25IMFRBNU0vUHNodW9hRGJXK0djQ24yRjBo?=
 =?utf-8?B?Ty9JenVrYmJ2RElaeGdOME1QWnVXNDY5VHphRHBEenRieHdLTDZYcGJJSTVo?=
 =?utf-8?B?c2ViRHV4RVlNdXhHbmRBS0p1RUFqdnQ2SGJhemlSTlFyZmJOTk4zN252U3U0?=
 =?utf-8?B?bzV0M0U0dXg4VWljMmlRMDFza3ZJeXVvL0JvbHNkSjBMRjBWaW1wdlNmRDNG?=
 =?utf-8?B?MGxOSzN0RmhUcXBwZ2dBVE51d3JmZW4xWE1HbUwyc1pHWi9YMjkwMitCZDdy?=
 =?utf-8?B?SDAzYTZuNjhleFA1clRKWUExNUlSYjl5dFBJTk40a0pYYlhZY2pFZEVKMlFp?=
 =?utf-8?B?cEc0WUphelF3ekk4Zldld3pzSDZqZ3JJODUwbExza3Nvay9qQUJjdUowVTU2?=
 =?utf-8?B?VHRVS3B1Y1ovQzdtNXV4VFlsOWxpRnBmb0s1dVFEaVRnb0VZZ0pjVDVKWWZy?=
 =?utf-8?B?M01hM2t2R3E1d2YxYURPcXlsa0ErQUErZzdzaW1lRnJZNDRSN0xlSVNjdWtl?=
 =?utf-8?Q?0eLmd9ZLNWxSgjraDepwc2Y=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 40350448-b03f-408e-8c20-08dbe6205a3e
X-MS-Exchange-CrossTenant-AuthSource: SJ2PR11MB7617.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 Nov 2023 21:18:03.1679 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: wpyzsjIdyuxPyxlAn9pC7fLX0SmWm7+Kb9T9aHHv1kKLVPAQsXQ0FltI7EfVUbsiIYrb4wrroVgBr9rX8u9c35JjALqMDAXzWRJh9cAQIAE=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR11MB5182
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
Cc: DRI-Devel@Lists.FreeDesktop.Org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>



On 11/9/2023 4:54 PM, John.C.Harrison@Intel.com wrote:
> From: John Harrison <John.C.Harrison@Intel.com>
>
> If a context is blocked, unblocked and subitted repeatedly in rapid
> succession, the driver can end up trying to enable the context while
> the previous enable request is still in flight. This can lead to much
> confusion in the state tracking.
>
> Prevent that by checking the pending enable flag before trying to
> enable a context.
>
> Signed-off-by: John Harrison <John.C.Harrison@Intel.com>

Reviewed-by: Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>

Daniele

> ---
>   drivers/gpu/drm/i915/gt/uc/intel_guc_submission.c | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/drivers/gpu/drm/i915/gt/uc/intel_guc_submission.c b/drivers/gpu/drm/i915/gt/uc/intel_guc_submission.c
> index d37698bd6b91a..d399e4d238c10 100644
> --- a/drivers/gpu/drm/i915/gt/uc/intel_guc_submission.c
> +++ b/drivers/gpu/drm/i915/gt/uc/intel_guc_submission.c
> @@ -720,7 +720,7 @@ static int __guc_add_request(struct intel_guc *guc, struct i915_request *rq)
>   	if (unlikely(context_blocked(ce) && !intel_context_is_parent(ce)))
>   		goto out;
>   
> -	enabled = context_enabled(ce) || context_blocked(ce);
> +	enabled = context_enabled(ce) || context_blocked(ce) || context_pending_enable(ce);
>   
>   	if (!enabled) {
>   		action[len++] = INTEL_GUC_ACTION_SCHED_CONTEXT_MODE_SET;

