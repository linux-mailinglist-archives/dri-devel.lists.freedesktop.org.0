Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 26D264C06DC
	for <lists+dri-devel@lfdr.de>; Wed, 23 Feb 2022 02:28:33 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BA5A010E213;
	Wed, 23 Feb 2022 01:28:30 +0000 (UTC)
X-Original-To: DRI-Devel@lists.freedesktop.org
Delivered-To: DRI-Devel@lists.freedesktop.org
Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3399D10E21B;
 Wed, 23 Feb 2022 01:28:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1645579709; x=1677115709;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=z7N4rnL/C19CWa4rHdZP1jRFjENbbI0RwmJ4uvici0Y=;
 b=OElqkNEIaRPEDFTb5YyPo5+mCr1u2QB7xhRyGUeBIQJBhOxcynz3iji7
 YjCi68/EQmanMDkYR/JJz2muAbDuGo6zKY6vPanajHBMjoKrr3OfyDojq
 ORdjKmHxixi1Px3sde+H7GhRxLIfp7QeXElHsF9p3h+uWNuE7/NQMtb2R
 ok2kaUxSqi1MLZt3Gyk7Xqm7oMSlRfFCEErkbgDeZJynOvghDaYuQb6XE
 tPOwJqp6/nUDtqZyMC2Y1thQeIgAYdfjKMqydWpFYm/EXWL369Z5ulgty
 uXSsNQgkMzAg87S07LNV/pKcQZzYLdk4wGAvuup8qQWBztClHPhQRCzK+ w==;
X-IronPort-AV: E=McAfee;i="6200,9189,10266"; a="251777728"
X-IronPort-AV: E=Sophos;i="5.88,389,1635231600"; d="scan'208";a="251777728"
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
 by orsmga103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 Feb 2022 17:28:28 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.88,389,1635231600"; d="scan'208";a="683726539"
Received: from fmsmsx601.amr.corp.intel.com ([10.18.126.81])
 by fmsmga001.fm.intel.com with ESMTP; 22 Feb 2022 17:28:28 -0800
Received: from fmsmsx611.amr.corp.intel.com (10.18.126.91) by
 fmsmsx601.amr.corp.intel.com (10.18.126.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2308.21; Tue, 22 Feb 2022 17:28:28 -0800
Received: from fmsmsx610.amr.corp.intel.com (10.18.126.90) by
 fmsmsx611.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2308.20; Tue, 22 Feb 2022 17:28:27 -0800
Received: from fmsedg601.ED.cps.intel.com (10.1.192.135) by
 fmsmsx610.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2308.20 via Frontend Transport; Tue, 22 Feb 2022 17:28:27 -0800
Received: from NAM12-BN8-obe.outbound.protection.outlook.com (104.47.55.175)
 by edgegateway.intel.com (192.55.55.70) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2308.20; Tue, 22 Feb 2022 17:28:27 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=F2V2mM+ROsfyWNPfjiVePzZ18pW/f+Y6UDX1x8Xc3erUnPJvI0yK18GtkpNJaPQL1EK45Q65THJdMyjn1GQpzIcm+JWvd2w15R3eEPEigKhuo/mmFjY84hqmSduaqYCrVwAO72MWISKAODQCifz83/CEZAbT2wNpBAfiWLRPw5BwVlXWsYAOVIzkudVovBt30rW90yW/upBBXzDv8jBqNf1xRCFHQN76GPwh0PjaUUPvudTFjYIKwNlXpKy7+aiDnI9hsm5vErrmV1pjw8RQ2WZAff+1+elDturkQjEXHzROmA1Nq9G4TfisN4NmvqPidfN83jl/10ibHDzvSSJY+g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=/sA5cbYZZy9l6N+10vVYJtOTEEKy6U7xQL2zL6GJARo=;
 b=PrJ8DbJvqmAgimRCxwxucHd1hbreNGJvZk5XUVfgmO67vngTOdDauoOiw0uIPqN6q16/GotaQQQMc91Ig2TFnC61S3i8caYcRXCnnn+X4t0BO80km6Qnp8a2imIxOjtdcmSZ8KbFVlYszi78sgadgV6ncuUMiYhRjeW3tu6tca07Upf2yTfLLPuCzA9T2PMpnJoF55QgwA/B+AsoSKbAkzvIf5EMBi1/Qu3LK1nzP8Oysg6EUorkaav6pkYlbLXxFOrcZ8SItvDaZ+fJVIAZ9shcWSKZicTXCRppgxyRhxEMla6hzj5NlKXk45wamjZPTVXn6W1jGb1LJEHGjB4NwQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DM4PR11MB5488.namprd11.prod.outlook.com (2603:10b6:5:39d::5) by
 DM5PR11MB1610.namprd11.prod.outlook.com (2603:10b6:4:4::16) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4995.22; Wed, 23 Feb 2022 01:28:25 +0000
Received: from DM4PR11MB5488.namprd11.prod.outlook.com
 ([fe80::3c4e:eb25:76ff:a869]) by DM4PR11MB5488.namprd11.prod.outlook.com
 ([fe80::3c4e:eb25:76ff:a869%4]) with mapi id 15.20.4995.027; Wed, 23 Feb 2022
 01:28:25 +0000
Message-ID: <895cebd9-3cd7-6059-fcf7-34ca933fb7be@intel.com>
Date: Tue, 22 Feb 2022 17:28:23 -0800
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.6.0
Subject: Re: [PATCH 8/8] drm/i915/guc: Fix potential invalid pointer
 dereferences when decoding G2Hs
Content-Language: en-US
To: <John.C.Harrison@Intel.com>, <Intel-GFX@Lists.FreeDesktop.Org>
References: <20220217235207.930153-1-John.C.Harrison@Intel.com>
 <20220217235207.930153-9-John.C.Harrison@Intel.com>
From: "Ceraolo Spurio, Daniele" <daniele.ceraolospurio@intel.com>
In-Reply-To: <20220217235207.930153-9-John.C.Harrison@Intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: BY5PR03CA0008.namprd03.prod.outlook.com
 (2603:10b6:a03:1e0::18) To DM4PR11MB5488.namprd11.prod.outlook.com
 (2603:10b6:5:39d::5)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 0bf985f0-7732-4c25-dfa6-08d9f66bc9c1
X-MS-TrafficTypeDiagnostic: DM5PR11MB1610:EE_
X-Microsoft-Antispam-PRVS: <DM5PR11MB16103E46EBBC31EA534232D1F43C9@DM5PR11MB1610.namprd11.prod.outlook.com>
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: zGwLlLl8mB5iF3dnC6l4GVXtGKRlkJ7TvDJ8BH8p14vqt03jL+TyObyqibQV4qVQVffz76zBr6o0t42Es5neNRUfpueYk3rf7783JZwKtrX+0rXajVxaF1qj66o5rALpm+KsdsQ2w/q3L4FQOiufGTtFAwVtK8KODoFtWkVl5PAOJ964xzWF/BUUzKsbqG5tpjK6uLsnzTz1BAr/+KgMzZW3fIU+4ah88lFxui8xuHw0DMEMz4XNHGwGWLM95+sjCKf8P+NaeLmtkWmTRf9sPQt+c05ZlykJnUS0s5tgF2+rawpShnbVsUo0c3RZ7qOcFSSl/PY8zyuI0jWg34qSmtkMW7nZMf0sKsBVq2QxE01TGSZMWQyMGuMWAUhEmrnLTVOM0ipZenRVmdnSCk1JnYc5Qt6VVe/kVY3k2L+e4UYsHchJHaCtbg7HY873nSBVLVfYv60/pLqSfuTqDrTUAtHOs7qcCugJtW293QBaEUGFB+ZEU2dVGD56C9Sgtv3JvW9hzZy7nzokWcFRCEjRzZuTd6UHkSiFZqZugpRfQdu43Myo8ViRE3Y3g+MRKtgC/y5umr9Bybcbaid1Uq+rJQMyGu4UXpoZZG//P7zjJHPJFt2bnQnNRMVG3tqhjH+iQV4K059EdW5lRQ+GPXHr4Ntmw/j3QP0a6TzJSxQ+VS6lZB2BHtgqUE4sSES756wzen6W6WAzpWGLpik+MrJ43s2mfWTjfRqMdtKTBu0LLVYIyfW22oJO3s8P/8O2jzXF
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM4PR11MB5488.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230001)(366004)(186003)(26005)(66556008)(66946007)(6512007)(53546011)(6506007)(2616005)(6486002)(31696002)(86362001)(508600001)(316002)(8676002)(66476007)(82960400001)(450100002)(83380400001)(4326008)(38100700002)(5660300002)(31686004)(2906002)(8936002)(36756003)(45980500001)(43740500002);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?ZlcraG04TlVQMWNtdkUrZDg3WllRT0YrV3QzcXA0NjRyWEcvYUFQTDZ3UStI?=
 =?utf-8?B?MkYxSldWT2Y5bHQxUWRZT2g3QnYrWUhqQ0xlSWRPM1pQNW5hSW5RcEhuS1Jp?=
 =?utf-8?B?bW1qM3dmUG5scHBZUUJuWFlheUphYks2Zkgra1ZZdkVpQnJmRGJwWGlXcVhO?=
 =?utf-8?B?NlluRm13NCs1dE9oeTdSbXpaaWZNN3NRSGNCdmdlSG9qVVhDdnVONU14YllL?=
 =?utf-8?B?ckdHUFF0bU5xdU9iZ1oxZmVMSzQ3OFVyV0dYSENsSHlmWVhEU08xWmlnZFJ2?=
 =?utf-8?B?dkR5TkdoN3pwMU5DTitSMWdZcHM1ZUVmQWIvNElrc0RsYlR4aUtsZDlZdjRi?=
 =?utf-8?B?c08rZnlsZ0lrWUFBdlVjZ1B5OTl0am1GdVB4Zm1RRyt1SmYyZ1hwWmJCR2Y0?=
 =?utf-8?B?alFpQkZpSkNlSDY1QWRsb0VhSUlvZDZ2Sm9qaVcwZm1PTitWcVZTaTM4NGRQ?=
 =?utf-8?B?eDRhMTVzdndZM2p0UlFQdFJTZVZCR2hCM1FldTZndVNPR0FXR0dtUW1EeHl4?=
 =?utf-8?B?NW9NRUg1MmI1WUM3bmtwNTBWUTlVaXRQaUM0SkRNRGtjdjlzOGZZd2Fwc2R6?=
 =?utf-8?B?eW1GR2NERExrU25pNU8wSnZvOWYrKzNCTWh2T2FqSDhzZW9YWVhjaVZaTlli?=
 =?utf-8?B?N1lXbks3bVJNZ1Y4Z1J0MXF2QWI1L1c2M2Q5OW9oUElEZDlTclBxOS9aV0dh?=
 =?utf-8?B?b0M3VmpmWlFxRWtXMFA2TkJEVDQremxvRnZUVkppRGlGRmttdC85TzRwNE9K?=
 =?utf-8?B?WVlsQ2E2R2JBNy9SbjM0bWNpMVhwTUxBNmk5d2grWGdaRzlSeDV0cGQvczdD?=
 =?utf-8?B?ZlNKZHQ5Q2tsU096RGdzZFJHK2FFQkNmaHpkWUFiL0wwb0R1Z0wyTXhaUHJl?=
 =?utf-8?B?NDMzMGdRYnFTUEtadHhMREphVkQycVNTTTBFcDNXZGxvbUUyMGNQOXVyRFFL?=
 =?utf-8?B?ajYyNGs1N2dlSUQ2WE1FeHJSeXlPMVpMOVFKL1c5YnJaOUVVdGlXeVN1Yi8z?=
 =?utf-8?B?NFBWVTJtR2V0M1Q5TEpWMFRlMEVlY1Ftd0tYQ3RSS2ZuWFdWa3IzSjVuWmlQ?=
 =?utf-8?B?cWZnMGJtREZnTzhzNHJPbTFsVXRjTEVnS3pKTFliV2RiRlpLZ05QbHNFd00v?=
 =?utf-8?B?YXZWN2JzYzZZb21XOVhDTXpaek1OR1lTV1JZYzUxMkowMVk4Z29WTER6ZkZG?=
 =?utf-8?B?SkNtcUg2UzlJYzhBS1pDNm1xMlF5MTl4bFFOT0M0MnNERVROUVZRS3NxdTlk?=
 =?utf-8?B?ZDduMjV6cmVtR1J5RE1ROTZuSll5UXZoR3VCN3B2Zng2cDFpaUlVYkwwNm4z?=
 =?utf-8?B?OGM1bmI4dUlTOHlIMGRTRXhSS1FtR2pkSm9MczMvSTQycGxFUlRDRmg0d0g3?=
 =?utf-8?B?SGxFSWMyNGF1V2RiRUVLbzZidUZ1K2ZoWEJjOS94RXpZT2g3WEF1VG03ZVI1?=
 =?utf-8?B?WHYzbGVWQ2k2d21MY1doNzBBbVJHczIzUzB4Z1UvQmg2U0lzU1RuckJoN3l6?=
 =?utf-8?B?NHJRMlVTa3FKYzZmei8zZWNDdWxVUlVFK3EzUm1jYmk3ZXd6R2M0emFXY1dI?=
 =?utf-8?B?dXMrY3hpN2VxWHkzTjJ4SEtEQ0lKbTI1R0Y0SjQ2ekJ0UUZ2Y2hhbGVCTXlq?=
 =?utf-8?B?QXoxZ0toaUMvT1VFV3ZuUm1abzR4QU04b2lGd1plYnV0dFM1Um5SUXRxdGdV?=
 =?utf-8?B?c2Y2aVBFaHhLU0F0cmpqdUlTOTZSczR0SGxrMzQ5NmQyeVQ4eW1wSVNsSTFV?=
 =?utf-8?B?Qk9sQ1poVlIydWpqN3M4V2JXaGZyWjRDdFhwaFllS0lnaVBvSGkzTmRFVCti?=
 =?utf-8?B?aDF3YjZQTVh5cnpOUlJUdmFkUTQyTHZiZU8rZnFXY2h3QnNxQ2lvTUVlQmVN?=
 =?utf-8?B?b2gxQXBIei9SZ2o3ajFlaDBvY2ZYU1F5WDZIU3Y2SVcvUHZnUXlaUkNqYjk4?=
 =?utf-8?B?STkzYWpQVVhFVG81RlJmalp5bGNHOHVFVTIxcnJhT1NTMWVldWtFT0dOTHdB?=
 =?utf-8?B?VEU3RlpwSjFDUHhPL2xFMUxqUTJjcE5peEdIdmp5VGNNblc3RmZRT2hxYlNI?=
 =?utf-8?B?K2dLWEFmMGl1TTk1NVdWSzUyMHRKTlg4VlRVQnNxMWpaelM3SlJ2akFwWUxi?=
 =?utf-8?B?NlVMS280d0Ezb3lQYThHSGpjUzh5SDdDb2hwTUMwU0lGQk9rVTJEbGdNalVD?=
 =?utf-8?B?K3V5QXp6Wjg5VGxHZ3pYb2YraXcwSk5nSHRWdWpmTmFJVkVwQVVsb0ZzNjBx?=
 =?utf-8?Q?zxO2IMxkK1SNdS3Ad8rlsqr5T09ZBopXRoyBjIKYr4=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 0bf985f0-7732-4c25-dfa6-08d9f66bc9c1
X-MS-Exchange-CrossTenant-AuthSource: DM4PR11MB5488.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Feb 2022 01:28:25.7901 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 9M54aX+aQi8pOTe11BcRam8w51dWItwNuXiK0CjWHqxB5dbsO6N2pTGxoGMGZlilXvNGangPPXcg27QmNfRQAu9634nFgOq4oD3kYUlMxSc=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM5PR11MB1610
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



On 2/17/2022 3:52 PM, John.C.Harrison@Intel.com wrote:
> From: John Harrison <John.C.Harrison@Intel.com>
>
> Some G2H handlers were reading the context id field from the payload
> before checking the payload met the minimum length required.
>
> Signed-off-by: John Harrison <John.C.Harrison@Intel.com>

Reviewed-by: Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>

While double-checking the other msg handler I noticed that we don't do 
any checks on len for intel_guc_log_handle_flush_event(). Not really 
relevant for this patch, just wondering out loud if we should add a 
check to make sure the message is not corrupted.

Daniele

> ---
>   drivers/gpu/drm/i915/gt/uc/intel_guc_submission.c | 6 ++++--
>   1 file changed, 4 insertions(+), 2 deletions(-)
>
> diff --git a/drivers/gpu/drm/i915/gt/uc/intel_guc_submission.c b/drivers/gpu/drm/i915/gt/uc/intel_guc_submission.c
> index b70b1ff46418..ea17dca68674 100644
> --- a/drivers/gpu/drm/i915/gt/uc/intel_guc_submission.c
> +++ b/drivers/gpu/drm/i915/gt/uc/intel_guc_submission.c
> @@ -3895,12 +3895,13 @@ int intel_guc_deregister_done_process_msg(struct intel_guc *guc,
>   					  u32 len)
>   {
>   	struct intel_context *ce;
> -	u32 ctx_id = msg[0];
> +	u32 ctx_id;
>   
>   	if (unlikely(len < 1)) {
>   		drm_err(&guc_to_gt(guc)->i915->drm, "Invalid length %u\n", len);
>   		return -EPROTO;
>   	}
> +	ctx_id = msg[0];
>   
>   	ce = g2h_context_lookup(guc, ctx_id);
>   	if (unlikely(!ce))
> @@ -3946,12 +3947,13 @@ int intel_guc_sched_done_process_msg(struct intel_guc *guc,
>   {
>   	struct intel_context *ce;
>   	unsigned long flags;
> -	u32 ctx_id = msg[0];
> +	u32 ctx_id;
>   
>   	if (unlikely(len < 2)) {
>   		drm_err(&guc_to_gt(guc)->i915->drm, "Invalid length %u\n", len);
>   		return -EPROTO;
>   	}
> +	ctx_id = msg[0];
>   
>   	ce = g2h_context_lookup(guc, ctx_id);
>   	if (unlikely(!ce))

