Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 11D743FF6F2
	for <lists+dri-devel@lfdr.de>; Fri,  3 Sep 2021 00:11:46 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E49766E826;
	Thu,  2 Sep 2021 22:11:41 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6BCFF6E825;
 Thu,  2 Sep 2021 22:11:40 +0000 (UTC)
X-IronPort-AV: E=McAfee;i="6200,9189,10095"; a="206478792"
X-IronPort-AV: E=Sophos;i="5.85,263,1624345200"; d="scan'208";a="206478792"
Received: from orsmga008.jf.intel.com ([10.7.209.65])
 by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Sep 2021 15:11:39 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.85,263,1624345200"; d="scan'208";a="476939460"
Received: from orsmsx602.amr.corp.intel.com ([10.22.229.15])
 by orsmga008.jf.intel.com with ESMTP; 02 Sep 2021 15:11:39 -0700
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX602.amr.corp.intel.com (10.22.229.15) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2242.12; Thu, 2 Sep 2021 15:11:39 -0700
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 orsmsx610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2242.12 via Frontend Transport; Thu, 2 Sep 2021 15:11:39 -0700
Received: from NAM10-MW2-obe.outbound.protection.outlook.com (104.47.55.108)
 by edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2242.10; Thu, 2 Sep 2021 15:11:39 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=VX8P+vXSecCxwZtyo379mbA6U3wnO62TS72phRwRBwVm3Dik0cKd0UiXrbkzWvi91+wqge44nwHHYe/STCNAsbUfbh8IHYL+HTJpdEYLZxdGu3dpSGM4VbOapQXo2V8lvkrMEcKxR/4UnbTKJpie7oVhgcEupH1fPwHjF6vBvnJzZWsb5DZn5m6OzHHgsN+EB7SmWQuwoBRmga/7am9S4mM2e267uVZq5gFxGqi8KehlrkyIZLkoElVal4LVrJ8LhOyYqVp/6qvsGTm0+rI04NkbpXM54lYmKnLUcaxTW8/5yfhCjw1TV7mO5Jvrh72EBe8sMSX7CDL/WfItdicanQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version; 
 bh=er8MaVPuGLbANo0JoLcTbIWUraAZQo2ho7Sm7FDbkkk=;
 b=bu8tTTW5ZTa8ksy9jiGjYOdNC/AREYyhlNCUxP6+ovySAs9qvpTfdxVLS4FA3y9Llf8aYVprU42t2Cim0xACqNyAUbGnlNfcFCqBg/7yEZAxq7VPsBc7DrOsHmP6c7duQ3+Bn8EPsht1G6sk7876TLp7ILIxk3aAP066Ly/Crhz4Ds1dg6rn03G7Rb8vY2bXl2sLd4DRuW+7sLXP+5yiizOjimwlAmUysuWwX9pHl7Nfc3wted/Z5RQElh2Emr9mNaAdgeFsI+lF9uMVq3RtB0kpPkippUjiYXvM+5To2zQSqm6MjAG8a6QisuCFTKLqU92uQV0k7skb7h3lXQFfig==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=intel.onmicrosoft.com; 
 s=selector2-intel-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=er8MaVPuGLbANo0JoLcTbIWUraAZQo2ho7Sm7FDbkkk=;
 b=MD0C2Kf+SXUH3LYgCMxdF+UX8sUo9abEHU9ulCkVcBb0OZqcu8Jr14OmFYTsYTRLE5omCyR3zpleWRLjAhPwQgYg18AOKO1ThB088MPhWtSGUrhiefqzQq494/Cs8qZBHU62v+AyeFlpzcC629IYbP642Vhlh6/InSX2XShlmTU=
Authentication-Results: intel.com; dkim=none (message not signed)
 header.d=none;intel.com; dmarc=none action=none header.from=intel.com;
Received: from PH0PR11MB5642.namprd11.prod.outlook.com (2603:10b6:510:e5::13)
 by PH0PR11MB5675.namprd11.prod.outlook.com (2603:10b6:510:d4::17)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4478.19; Thu, 2 Sep
 2021 22:11:38 +0000
Received: from PH0PR11MB5642.namprd11.prod.outlook.com
 ([fe80::880d:1a54:ca07:738a]) by PH0PR11MB5642.namprd11.prod.outlook.com
 ([fe80::880d:1a54:ca07:738a%9]) with mapi id 15.20.4478.021; Thu, 2 Sep 2021
 22:11:37 +0000
Subject: Re: [PATCH v5 02/25] drm/i915/guc: Fix outstanding G2H accounting
To: Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>,
 <intel-gfx@lists.freedesktop.org>
CC: <dri-devel@lists.freedesktop.org>, <matthew.brost@intel.com>
References: <20210902005022.711767-1-daniele.ceraolospurio@intel.com>
 <20210902005022.711767-3-daniele.ceraolospurio@intel.com>
From: John Harrison <john.c.harrison@intel.com>
Message-ID: <e2422131-56f7-091c-b2ba-fb8387af9b60@intel.com>
Date: Thu, 2 Sep 2021 15:11:34 -0700
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Firefox/78.0 Thunderbird/78.13.0
In-Reply-To: <20210902005022.711767-3-daniele.ceraolospurio@intel.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
Content-Language: en-GB
X-ClientProxiedBy: MW4P221CA0011.NAMP221.PROD.OUTLOOK.COM
 (2603:10b6:303:8b::16) To PH0PR11MB5642.namprd11.prod.outlook.com
 (2603:10b6:510:e5::13)
MIME-Version: 1.0
Received: from [192.168.1.221] (73.157.192.58) by
 MW4P221CA0011.NAMP221.PROD.OUTLOOK.COM (2603:10b6:303:8b::16) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4478.21 via Frontend Transport; Thu, 2 Sep 2021 22:11:37 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 5a475bd9-f322-43b9-8c18-08d96e5ea22c
X-MS-TrafficTypeDiagnostic: PH0PR11MB5675:
X-LD-Processed: 46c98d88-e344-4ed4-8496-4ed7712e255d,ExtAddr
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <PH0PR11MB5675F0F84FA9E32E1B8C60F5BDCE9@PH0PR11MB5675.namprd11.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:7219;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 20hnxnNLFNTKWneCYShDfYxZ0L6B+BUvnKzbxK708nPQeBwMTbdHz44OaPYnKwSWWnBCd2LVPnfnvJy1EU5KSunqxq8d2UL84gqmCXN3qFsX5x0dxL63H274ovZF2tV0Bo3lwMTJvPmOwdEmCsMNlRnl01F27AKZPSjfICTk8hfxy2WD5umgnRPP2BNG7am95lxqv7SCefZTZIAtOyB9t5LCFZB8xRvIHqDvBOXVMtHaS2omB2HZNqGBKCvDMDQ9brmVKR+b0XiDIJsYrc+R9V9hQPcZ8/cMEmd+QrjKsonDyKwp9Gky5LxPJpZMwOd8/CQCm6N/Y2smUeoAjb4p/MqkOBiuWAhS8U/OB3+LSWpZeWb+pNNi/czM8PyhqOyCZ60V9IMRyyh5XoZH48KNzP5fb4ioQmlS6zOpPmj6blzupxH7jtDfv7Nav8q2fyQen/BY1cRAsgbCLkT856dSwrseV4g5uRVaMRL/0OtQDY3DtLqINkIUCTwhbnehIx5UtsTEEZXsE6F4o/sFLBZTglCgXptwFG8CT5StPZ/08pG9mMODW++sslHvNZTiOb/b3SqNQVYo1Ms2OWXZFueE4fOfW07HY1Vl4VrtM0AZwZHnBIUjeeXaX8j1eg5F7VChWHSMh8GYUxQQRp+IXDuCfbvfx6mQqPGNbzFtzO9NFXxxmF1x71Q1IjLEFamy5Bhl10x5PDou0l8KwrK44+bk5sJj8tghBBCJgmWUleskRpPThcOm1C1khvr0JQCuoC3O
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH0PR11MB5642.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(136003)(39860400002)(396003)(366004)(376002)(346002)(53546011)(186003)(6666004)(31696002)(107886003)(16576012)(36756003)(66556008)(66476007)(31686004)(26005)(4326008)(8676002)(38100700002)(66946007)(478600001)(450100002)(83380400001)(8936002)(2906002)(6486002)(2616005)(86362001)(5660300002)(956004)(316002)(15650500001)(43740500002)(45980500001);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?czdsaFpvdzQvK2xPMFkwY2VNWjM3Q0E2L0x1U0FOZXUrRU9xTWVONTBWNkw2?=
 =?utf-8?B?UXR3TFMvSkU0NjJ0YzVoUGM2NDA2L29ya0pXb2FibEFVM1pmTDdLSGZ3Z3Er?=
 =?utf-8?B?M21XT0lVeTJNYmplNjUwNitiNnBYdW45LzFiQzNRYjhrR2w3Qnh5bzZjSWx4?=
 =?utf-8?B?aVR3NVBzMG5Sa1padXBZTmFkajdUMWdMU2NWaGFwd1ZwZVB3cVpOdmZXS1dD?=
 =?utf-8?B?MGwzZE94c1BaS2pDSzRGY1A5TmFodkwzczRCbVFTTjd6cnVPd1V1dzZRa3RF?=
 =?utf-8?B?SmRrL28zc2ltalEyazRpOTZsYzVNMk96ajZtSHRlbVJ2V29tN1duVzhGU2dL?=
 =?utf-8?B?L2RJaE1DMFlVSW12Zktvb2tGQ09BR3BBbE1adTRodlg2Tk9OLzRtWnowSFhC?=
 =?utf-8?B?QWpZcWNJcWRtc0NZdXlOYUdSdE93ZDF6RUhKUkxDdDRTUTZuTlcxOU43WVRZ?=
 =?utf-8?B?K0FkcHU5V3AzSXVGa0dFT2JaYnRjRlJPTXc2OE41VzJLNjZuT1Zna2RmbXha?=
 =?utf-8?B?NThISWNtL3V0a2NMOUlPVFBJRzRSQ3k5S1BJT0JFOXVZTS9HTG9kU1ZJOGRl?=
 =?utf-8?B?cm4weVBuQlBzSTk3Wm83STVzMGlrNlNyMzF2aGoxS095QWdIRjdiTlBLMTBy?=
 =?utf-8?B?VXh1bmphS3l0bGJHZ2I4NFVvb2UyeU12YXFjZk9aRms2clkzaXZwc05DNnBm?=
 =?utf-8?B?RThBbE1lUXo1U0xuTFpJZEdrSy9hVllhclRhM2RGWDdOYlZwckJ0eGpZNmZ1?=
 =?utf-8?B?ZldHblZqSTUvRUprNGdNQ3J0VVRFcWdvVDR2SHJ1bGdSMUJNUGl2QnFLcERL?=
 =?utf-8?B?dGptMWNxaGlsc3hscGp0bWVDeDNUcmRnVEhxZDlrcERZWlRGcGcvQmZaMWtt?=
 =?utf-8?B?c1o3MW9tRG1CVDVaTjU0b0gxUHlFaldPVDRNK2lhYWt2eFQyY2o1RUNLdXJP?=
 =?utf-8?B?Q1p3Ujk1RVhCNFpjYW0xRzVpWjNKVnd0aWRqRjljZTFZV25yTmNYck9TQXla?=
 =?utf-8?B?WGozODIzMHZOQWhIbW8wQ3c0UlIvcmlBblFzK0hkTXVhNU5hR0JIZWxBeFg0?=
 =?utf-8?B?YnpZUVcvZWNiVUtla1RwK3dEMEU4dVJhN01xanVsUS9nQWdQN3QzNUwxTk1y?=
 =?utf-8?B?SkpnRVdUVlJFZURHc2lRQUZKWlB6c3J2bkk3TEZDYmlLZnpuUjdQRnhNZmsy?=
 =?utf-8?B?OGRGQmovbDFMTTRmMnJQTUdydTA5OUFiRHR3c01QMTZwTHBtZ0FMWUt2bWZT?=
 =?utf-8?B?ai9kaUx0dlVXYjJNUXArbEhKT2xQKzIya2lwb0FINFZLQkx5NG9BZGhuU3dU?=
 =?utf-8?B?YnhQRWRYUmtDRjhlbXc4U1BmQ2V4bitNQzJJTVROYWRNU0swa3BCOFdXZ1No?=
 =?utf-8?B?ZkhqRTZuakpCQUxVUC9tZmJIRVZZZ3VZVytzNmVMSDIwSjgyYTRoUGI1d1RB?=
 =?utf-8?B?TkJLbXNPSlV5OG13aXdBWlppTk9oSTE4Q1Q1b0owYnZvVlFsSmp6RUMvdSs0?=
 =?utf-8?B?dVNvL3prZU91WjNGamVaL0dDNVI5R2hKaHF4dTh2enU0L3h5aTU2aEl4dldh?=
 =?utf-8?B?cmhIMG8rNGhTaFBTT0x4Q0FaTVZteFdocmYxMElVdkkyWVVPWGdlL2Y0UWdT?=
 =?utf-8?B?UkZIQ3UzOWlITVFJUStxVG53Smg4bStkaElCR0JRWS9SMnQ5T2FDMG1lRTRm?=
 =?utf-8?B?V0xidXpqMjBwWGxYZGN1c1BQZ1JTREdDS09CNzFxcjlFMklMdmpSbVpGcGdl?=
 =?utf-8?Q?fqrf1a0IICkFEV12eKk0vSogy955o0yN2wZEtIj?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 5a475bd9-f322-43b9-8c18-08d96e5ea22c
X-MS-Exchange-CrossTenant-AuthSource: PH0PR11MB5642.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 Sep 2021 22:11:37.8486 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: P1seH5vlEPzc1edSOMxULSVoxBPjzUDShcR9Q5fYPEuyZHkIxKbduEO0DeHpqyjoPkG/8vqk6cFHUsB132g9/ff7IXnaC4gMr6LigOaklcM=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH0PR11MB5675
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 9/1/2021 17:49, Daniele Ceraolo Spurio wrote:
> From: Matthew Brost <matthew.brost@intel.com>
>
> A small race that could result in incorrect accounting of the number
> of outstanding G2H. Basically prior to this patch we did not increment
> the number of outstanding G2H if we encoutered a GT reset while sending
> a H2G. This was incorrect as the context state had already been updated
> to anticipate a G2H response thus the counter should be incremented.
>
> As part of this change we remove a legacy (now unused) path that was the
> last caller requiring a G2H response that was not guaranteed to loop.
> This allows us to simplify the accounting as we don't need to handle the
> case where the send fails due to the channel being busy.
>
> Also always use helper when decrementing this value.
>
> v2 (Daniele): update GEM_BUG_ON check, pull in dead code removal from
> later patch, remove loop param from context_deregister.
>
> Fixes: f4eb1f3fe946 ("drm/i915/guc: Ensure G2H response has space in buffer")
> Signed-off-by: Matthew Brost <matthew.brost@intel.com>
> Signed-off-by: Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>
> Cc: <stable@vger.kernel.org>
Reviewed-by: John Harrison <John.C.Harrison@Intel.com>

> ---
>   .../gpu/drm/i915/gt/uc/intel_guc_submission.c | 79 +++++++++----------
>   1 file changed, 37 insertions(+), 42 deletions(-)
>
> diff --git a/drivers/gpu/drm/i915/gt/uc/intel_guc_submission.c b/drivers/gpu/drm/i915/gt/uc/intel_guc_submission.c
> index 69faa39da178..aff5dd247a88 100644
> --- a/drivers/gpu/drm/i915/gt/uc/intel_guc_submission.c
> +++ b/drivers/gpu/drm/i915/gt/uc/intel_guc_submission.c
> @@ -352,20 +352,29 @@ static inline void set_lrc_desc_registered(struct intel_guc *guc, u32 id,
>   	xa_unlock_irqrestore(&guc->context_lookup, flags);
>   }
>   
> +static void decr_outstanding_submission_g2h(struct intel_guc *guc)
> +{
> +	if (atomic_dec_and_test(&guc->outstanding_submission_g2h))
> +		wake_up_all(&guc->ct.wq);
> +}
> +
>   static int guc_submission_send_busy_loop(struct intel_guc *guc,
>   					 const u32 *action,
>   					 u32 len,
>   					 u32 g2h_len_dw,
>   					 bool loop)
>   {
> -	int err;
> -
> -	err = intel_guc_send_busy_loop(guc, action, len, g2h_len_dw, loop);
> +	/*
> +	 * We always loop when a send requires a reply (i.e. g2h_len_dw > 0),
> +	 * so we don't handle the case where we don't get a reply because we
> +	 * aborted the send due to the channel being busy.
> +	 */
> +	GEM_BUG_ON(g2h_len_dw && !loop);
>   
> -	if (!err && g2h_len_dw)
> +	if (g2h_len_dw)
>   		atomic_inc(&guc->outstanding_submission_g2h);
>   
> -	return err;
> +	return intel_guc_send_busy_loop(guc, action, len, g2h_len_dw, loop);
>   }
>   
>   int intel_guc_wait_for_pending_msg(struct intel_guc *guc,
> @@ -616,7 +625,7 @@ static void scrub_guc_desc_for_outstanding_g2h(struct intel_guc *guc)
>   		init_sched_state(ce);
>   
>   		if (pending_enable || destroyed || deregister) {
> -			atomic_dec(&guc->outstanding_submission_g2h);
> +			decr_outstanding_submission_g2h(guc);
>   			if (deregister)
>   				guc_signal_context_fence(ce);
>   			if (destroyed) {
> @@ -635,7 +644,7 @@ static void scrub_guc_desc_for_outstanding_g2h(struct intel_guc *guc)
>   				intel_engine_signal_breadcrumbs(ce->engine);
>   			}
>   			intel_context_sched_disable_unpin(ce);
> -			atomic_dec(&guc->outstanding_submission_g2h);
> +			decr_outstanding_submission_g2h(guc);
>   			spin_lock_irqsave(&ce->guc_state.lock, flags);
>   			guc_blocked_fence_complete(ce);
>   			spin_unlock_irqrestore(&ce->guc_state.lock, flags);
> @@ -1233,8 +1242,7 @@ static int register_context(struct intel_context *ce, bool loop)
>   }
>   
>   static int __guc_action_deregister_context(struct intel_guc *guc,
> -					   u32 guc_id,
> -					   bool loop)
> +					   u32 guc_id)
>   {
>   	u32 action[] = {
>   		INTEL_GUC_ACTION_DEREGISTER_CONTEXT,
> @@ -1243,16 +1251,16 @@ static int __guc_action_deregister_context(struct intel_guc *guc,
>   
>   	return guc_submission_send_busy_loop(guc, action, ARRAY_SIZE(action),
>   					     G2H_LEN_DW_DEREGISTER_CONTEXT,
> -					     loop);
> +					     true);
>   }
>   
> -static int deregister_context(struct intel_context *ce, u32 guc_id, bool loop)
> +static int deregister_context(struct intel_context *ce, u32 guc_id)
>   {
>   	struct intel_guc *guc = ce_to_guc(ce);
>   
>   	trace_intel_context_deregister(ce);
>   
> -	return __guc_action_deregister_context(guc, guc_id, loop);
> +	return __guc_action_deregister_context(guc, guc_id);
>   }
>   
>   static intel_engine_mask_t adjust_engine_mask(u8 class, intel_engine_mask_t mask)
> @@ -1340,26 +1348,23 @@ static int guc_lrc_desc_pin(struct intel_context *ce, bool loop)
>   	 * registering this context.
>   	 */
>   	if (context_registered) {
> +		bool disabled;
> +		unsigned long flags;
> +
>   		trace_intel_context_steal_guc_id(ce);
> -		if (!loop) {
> +		GEM_BUG_ON(!loop);
> +
> +		/* Seal race with Reset */
> +		spin_lock_irqsave(&ce->guc_state.lock, flags);
> +		disabled = submission_disabled(guc);
> +		if (likely(!disabled)) {
>   			set_context_wait_for_deregister_to_register(ce);
>   			intel_context_get(ce);
> -		} else {
> -			bool disabled;
> -			unsigned long flags;
> -
> -			/* Seal race with Reset */
> -			spin_lock_irqsave(&ce->guc_state.lock, flags);
> -			disabled = submission_disabled(guc);
> -			if (likely(!disabled)) {
> -				set_context_wait_for_deregister_to_register(ce);
> -				intel_context_get(ce);
> -			}
> -			spin_unlock_irqrestore(&ce->guc_state.lock, flags);
> -			if (unlikely(disabled)) {
> -				reset_lrc_desc(guc, desc_idx);
> -				return 0;	/* Will get registered later */
> -			}
> +		}
> +		spin_unlock_irqrestore(&ce->guc_state.lock, flags);
> +		if (unlikely(disabled)) {
> +			reset_lrc_desc(guc, desc_idx);
> +			return 0;	/* Will get registered later */
>   		}
>   
>   		/*
> @@ -1367,13 +1372,9 @@ static int guc_lrc_desc_pin(struct intel_context *ce, bool loop)
>   		 * context whose guc_id was stolen.
>   		 */
>   		with_intel_runtime_pm(runtime_pm, wakeref)
> -			ret = deregister_context(ce, ce->guc_id, loop);
> -		if (unlikely(ret == -EBUSY)) {
> -			clr_context_wait_for_deregister_to_register(ce);
> -			intel_context_put(ce);
> -		} else if (unlikely(ret == -ENODEV)) {
> +			ret = deregister_context(ce, ce->guc_id);
> +		if (unlikely(ret == -ENODEV))
>   			ret = 0;	/* Will get registered later */
> -		}
>   	} else {
>   		with_intel_runtime_pm(runtime_pm, wakeref)
>   			ret = register_context(ce, loop);
> @@ -1730,7 +1731,7 @@ static inline void guc_lrc_desc_unpin(struct intel_context *ce)
>   	GEM_BUG_ON(context_enabled(ce));
>   
>   	clr_context_registered(ce);
> -	deregister_context(ce, ce->guc_id, true);
> +	deregister_context(ce, ce->guc_id);
>   }
>   
>   static void __guc_context_destroy(struct intel_context *ce)
> @@ -2583,12 +2584,6 @@ g2h_context_lookup(struct intel_guc *guc, u32 desc_idx)
>   	return ce;
>   }
>   
> -static void decr_outstanding_submission_g2h(struct intel_guc *guc)
> -{
> -	if (atomic_dec_and_test(&guc->outstanding_submission_g2h))
> -		wake_up_all(&guc->ct.wq);
> -}
> -
>   int intel_guc_deregister_done_process_msg(struct intel_guc *guc,
>   					  const u32 *msg,
>   					  u32 len)

