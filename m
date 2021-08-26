Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 531E63F90DF
	for <lists+dri-devel@lfdr.de>; Fri, 27 Aug 2021 01:10:17 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4689A6E8C5;
	Thu, 26 Aug 2021 23:10:10 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F08976E8C4;
 Thu, 26 Aug 2021 23:10:07 +0000 (UTC)
X-IronPort-AV: E=McAfee;i="6200,9189,10088"; a="217895385"
X-IronPort-AV: E=Sophos;i="5.84,354,1620716400"; d="scan'208";a="217895385"
Received: from orsmga001.jf.intel.com ([10.7.209.18])
 by orsmga103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Aug 2021 16:10:06 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.84,354,1620716400"; d="scan'208";a="508545979"
Received: from orsmsx606.amr.corp.intel.com ([10.22.229.19])
 by orsmga001.jf.intel.com with ESMTP; 26 Aug 2021 16:10:06 -0700
Received: from orsmsx611.amr.corp.intel.com (10.22.229.24) by
 ORSMSX606.amr.corp.intel.com (10.22.229.19) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2242.10; Thu, 26 Aug 2021 16:10:05 -0700
Received: from orsmsx608.amr.corp.intel.com (10.22.229.21) by
 ORSMSX611.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2242.10; Thu, 26 Aug 2021 16:10:05 -0700
Received: from ORSEDG601.ED.cps.intel.com (10.7.248.6) by
 orsmsx608.amr.corp.intel.com (10.22.229.21) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2242.10 via Frontend Transport; Thu, 26 Aug 2021 16:10:05 -0700
Received: from NAM12-DM6-obe.outbound.protection.outlook.com (104.47.59.173)
 by edgegateway.intel.com (134.134.137.102) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2242.10; Thu, 26 Aug 2021 16:10:04 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=VOEnzR2jZqE70XUUjUKZBytW67vva3KgWEw9hkiJFeJE6AOkOqCKktDBKzE1Dl+RvpGH3Uf+ajJKZo/fzZnha2KPVT1+PBkq4v1ydcv8/N0mRqVfSdezvf/oU5MSEaB89Uu/mYcvWxFNMtEs+krYM6JqqezdkdvZNgq26CPFrOLX9EQtftkgdleNtroQth2nKBCji4JmElVGgUSwfkdBEGKdaPhnLB6AAUrh1dJzYkZmJNwBCOh68hrUnLzq8J5RiNdVPgti3LMyWmwn6jT9WtplwayjIFh4B0+kLrjTGYAnok3IVBlzlN7CcXx0dNJj7jzv9uCkUs3pysmxeR1Wyw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=1TkulH4ys7uyT3H6ty/cwjJHTutSAoFCfbJc3kcvHEk=;
 b=jxbFbdWMLHnchSlPNBreBpbsQ9BYsTp1gSiMlAqcwXMVHOd7LC2X28DEkh0hictUIFvOoR70Uoj3/GCzhm6YZodj53S18NSJKEFSUvDRAZ4YfAv6Y2g6jro1XqD+RQ0n/XL1VxGbtLtFE3TBtlu7MXJ4BJe0VHO2JWZuL1fCS22JyIBkgaMOePwxbdJhnQpsUQbTyWGLQKYCydWjawgMBpWsmpm4f1IgU6kujiTLJpxTPCosSafvFmoEP0LyrgcMOg4as11ZJSeAkZuQPLzOhPEbeysLGySL2IMHfl37VpoCYsSTnwtCmupBOBBankyO1XH8s/z0T13Uorj2LZ8/9w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=intel.onmicrosoft.com; 
 s=selector2-intel-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=1TkulH4ys7uyT3H6ty/cwjJHTutSAoFCfbJc3kcvHEk=;
 b=CSNHuFn5mYNUO+Izaqrfdh4rC5rDFXIkH9prYwUicGtZgnh7UlDkitY4Zr7uGzyX2UYAUWnqnBVzc1Fq1huPEdc9vtqce4nSLLncPbEtdd7TgEEl1hdrMQ3gt6kYPuKUwXAp4TU/qTpaZHFyrfcAoSDBm8NEiuSr2Qru6+qW+10=
Authentication-Results: lists.freedesktop.org; dkim=none (message not signed)
 header.d=none; lists.freedesktop.org;
 dmarc=none action=none header.from=intel.com;
Received: from DM4PR11MB5488.namprd11.prod.outlook.com (2603:10b6:5:39d::5) by
 DM6PR11MB4394.namprd11.prod.outlook.com (2603:10b6:5:202::18) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4436.22; Thu, 26 Aug 2021 23:10:02 +0000
Received: from DM4PR11MB5488.namprd11.prod.outlook.com
 ([fe80::450:6ab1:b0a:a165]) by DM4PR11MB5488.namprd11.prod.outlook.com
 ([fe80::450:6ab1:b0a:a165%7]) with mapi id 15.20.4457.020; Thu, 26 Aug 2021
 23:10:02 +0000
Subject: Re: [PATCH 02/27] drm/i915/guc: Fix outstanding G2H accounting
To: Matthew Brost <matthew.brost@intel.com>,
 <intel-gfx@lists.freedesktop.org>, <dri-devel@lists.freedesktop.org>
References: <20210826032327.18078-1-matthew.brost@intel.com>
 <20210826032327.18078-3-matthew.brost@intel.com>
From: Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>
Message-ID: <3fde98f9-b408-63cf-ea31-779bf477b68e@intel.com>
Date: Thu, 26 Aug 2021 16:09:59 -0700
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Firefox/78.0 Thunderbird/78.13.0
In-Reply-To: <20210826032327.18078-3-matthew.brost@intel.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit
Content-Language: en-US
X-ClientProxiedBy: MWHPR14CA0006.namprd14.prod.outlook.com
 (2603:10b6:300:ae::16) To DM4PR11MB5488.namprd11.prod.outlook.com
 (2603:10b6:5:39d::5)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from [10.79.152.56] (192.55.52.219) by
 MWHPR14CA0006.namprd14.prod.outlook.com (2603:10b6:300:ae::16) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4457.21 via Frontend Transport; Thu, 26 Aug 2021 23:10:01 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 6f8ef559-00e0-42de-60c9-08d968e6a230
X-MS-TrafficTypeDiagnostic: DM6PR11MB4394:
X-LD-Processed: 46c98d88-e344-4ed4-8496-4ed7712e255d,ExtAddr
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <DM6PR11MB439450CB043E9FE2608F4AC4F4C79@DM6PR11MB4394.namprd11.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:9508;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 0fcYnNn3HYe2ksGRECW+rsAd8BgRImROTC792pB+L85117vNS6wPMqiNSnnne6SPuUE4kdIPXSSxWfOu7mXYb3JQBZaegvIyv04Y4PoG4eVG2wgh/TnynC/l73kz+Q2wckF1wIRiSs65x3u7GAylSFg4mEtgK31NJLnbYKEPJsplmiVasm3/hH30UK7fX0YOo2cVSINxVtTLCXsD+gTP4/88qqpuoLMDPtjPK0dHVemyo8XaXwqcpPuVzaNCMmWVeJyFAYBiwzDIsj4gNFmZmKdvbH7pXETTCspdavjSGL3G1zQ8O0S3X6jfqESUV2F1rwvFzufFZudT2E4L0kGe0DXBBQrkT95oneA/wZVPK7qB74A7m7z/EcPPs6KfYt5rBsaUg9UnZqVJXfE3Ayv+dVL/HaP9JLfuXIvkue655sPMrbFy+hdbv/S/br8v+odpzFBeWA+Phf4bJ/HQnHJ40SIDxTGlaf0E6N42bphuJgaMAs0BEhSpXTHB/rJSNG9h6FeSJM4SqqxzFJ6IGB05Hv7Bduw94BRhZrxFSMpyud89cv/8nNJxgqLq+w6kAc7cXi/+CtEI44mw12sU9OGItg3zZYhprzM3HudUHVoY4JCZ79MbTPScc0PFDzmF7IJWFRzgs8KIg40UgmBu750CvedC6PxM70xxqVAkg+aEq909gKYVFIuusPM+pLHdW93bmezZlQLk7QY/+Q/Ii4YtD7zIKgTuUi4Egr/vAcDR99s=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM4PR11MB5488.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(136003)(366004)(39860400002)(346002)(396003)(376002)(186003)(26005)(31696002)(16576012)(66946007)(38100700002)(86362001)(66476007)(66556008)(8676002)(83380400001)(316002)(2906002)(5660300002)(478600001)(31686004)(956004)(2616005)(6486002)(36756003)(8936002)(450100002)(15650500001)(53546011)(43740500002)(45980500001);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?L1BObVN5RVROdzAzY1RKRy9hc2o3Rytoc1BOcW12cGUzL1BOMGQxUnZKb1hU?=
 =?utf-8?B?ZWpxSEp1WkVlMUt0cjJWRGk2dVlNOWVCc3ZZL0QvOEJNd1VnUEsrQys1UTJE?=
 =?utf-8?B?MlZKSEkzN2paNmZKbGwwOW1ONTB2d2JjbWxIVzV5NkNiSXAxbWNaTjMveXZl?=
 =?utf-8?B?bk5lOWhEaGdQUVFEVEUyWmM0TkVHL1RRZ29ZQUE2SlY5QWxQTkxObDVmTFZN?=
 =?utf-8?B?OTRwbjQ2L2JkdEQ3bW0rM0JsUVl2cVZjNkpFWmtwdWVsSHBUVjJzQVpIMTJT?=
 =?utf-8?B?UVdlcXgrKzRaUUVWbkk2Z0JBYVYycUtGcHBYMUEzeUdzeUpuN1gvWktTTWZZ?=
 =?utf-8?B?MlZ1eHQzckllTUpETmQ0STVoSDJmOXFtTlIzcDMwME40Q3I3SjdZVlB6TDEx?=
 =?utf-8?B?MlFkUnpVN2Nob0F0QUF1TTNXUE9YODRlU2FKZjQ1b1NjUjhaREpsT3o3QjZK?=
 =?utf-8?B?K3pHQVVaamZNSy9wZWF1cDQrY1l5NUVES3pNaXh5a0RTYlZkY09aR0FxOWNo?=
 =?utf-8?B?V2ZFTFpQOCtBMVgwN0RGSC9iNUE3UG05TElrUkkrUm1IRHVNTVNMZXRtczJv?=
 =?utf-8?B?TFNzSnB2QzBIWVhjUytjOHZJMnhsVTlRSnpCQ0s1NGd0WHV4bVlEclMvYnVk?=
 =?utf-8?B?RFNCcVA4ZHU4VVA2eExjOGFtQ0VldGVqaHhuTkN1aitjRjUwM1JSc01XbFB0?=
 =?utf-8?B?L3ZjOW5laC8vSVVWL28wWUZpeDhKcGk1ZkdnT3dMWVAyN1h1Ni91UG1UWllK?=
 =?utf-8?B?Vk92K1pHRkJCMXZaVTRCQUV4azhESGw0V1Z5R3lWcXlyckl0U1B1Ykp2ZVdj?=
 =?utf-8?B?aTl1MW4xVWpnSnZVRjdRcUFKb3p0alRZL2NMakxmN0VJb0RJU3BWQ3ptanZS?=
 =?utf-8?B?QXdSY3NMa1ZYcmllciszalJ6dzF0Ujg4NW1UendiNGJ0UnVYa1J0a29aNnpk?=
 =?utf-8?B?LzRNZERDdkZ2MHRMUUpoMVh1UDlrL3BhN01UaTZuQ0hncTFMaFUyKzA1cnE2?=
 =?utf-8?B?YTA1bGtocjRVM3BicVhkK1RzTEtWcDdxNldBN010WUw3bTVvT0NHR2FjSUhH?=
 =?utf-8?B?V1NXSFZhUVliZEVENlcxRm1pU09ReWRmc1lSS09jRzhSUHBWK2JYamxJU3Nm?=
 =?utf-8?B?aTFoUkErTUZLR3hsQkgrZ2dQOHY1cnA3Zll2RmVnYXpkYURtWkNCV2QrNXR5?=
 =?utf-8?B?RkMwYVRtOHUyV2hod3BhcVFSWXdvelI0WlcvNFlkRThjbjRCSDB1Y1J6NlYw?=
 =?utf-8?B?S0xkaUNpeFBGRTdMU21TNHpJTWNtYmdHbkNlMFpremFqRk5zUmdxQksvT0Jq?=
 =?utf-8?B?MFIvUVk4Z3hIa1lXTlcwRlpCRnB5S2UxTVpJZVZSMDdvdzZodUtrWDlid0Vn?=
 =?utf-8?B?WkJ1dkRNOEdzZzAvdnJUZGJNRFNsS3dJdGVvMzVPWkM2U1ZUQkNZMUxhMEcz?=
 =?utf-8?B?aE9ZR1hzRElvSlpkN05YZlFyNkM3dGg2Vm05cXdSN2pCN21PRitIZ1FGb2l2?=
 =?utf-8?B?dkxNT1FlRDZCOTZROEs3STFVR3VMVWJFQldkSXc1S3F0SXlVQmx5KysxT3hM?=
 =?utf-8?B?VUhYaXF3TU9PWXRMamM3eGU1VjZHTGJmNGsweGY4RER1RTYrSEgyU2ZJei81?=
 =?utf-8?B?d0R3VjY3L2I1bDZqYStnb0ttZHhVeER5Ny8wcFpoTkdQSUpiZ01GMFhyQXZG?=
 =?utf-8?B?bDVkc3FpUTB3UlhLOGJxVXZyU2RkR21WbEhwZ1g1c25yaGpFZjBFb2hHNktJ?=
 =?utf-8?Q?kBrURoyTpvFTjEisBnX4UtflwT23T14zvlA8Cke?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 6f8ef559-00e0-42de-60c9-08d968e6a230
X-MS-Exchange-CrossTenant-AuthSource: DM4PR11MB5488.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Aug 2021 23:10:02.3418 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 6kOo3dB5OPRrDbZ27MBDJ/wEZYMYX7rudAEHeeoIu1f6CfRfXAHHXA2FOmyBqyua1EkId/HFQqysbBQv6IBXrXeKfjxbeb9auXVD1GO4gKY=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR11MB4394
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



On 8/25/2021 8:23 PM, Matthew Brost wrote:
> A small race that could result in incorrect accounting of the number
> of outstanding G2H. Basically prior to this patch we did not increment
> the number of outstanding G2H if we encoutered a GT reset while sending
> a H2G. This was incorrect as the context state had already been updated
> to anticipate a G2H response thus the counter should be incremented.
>
> Also always use helper when decrementing this value.
>
> Fixes: f4eb1f3fe946 ("drm/i915/guc: Ensure G2H response has space in buffer")
> Signed-off-by: Matthew Brost <matthew.brost@intel.com>
> Cc: <stable@vger.kernel.org>
> ---
>   .../gpu/drm/i915/gt/uc/intel_guc_submission.c | 23 ++++++++++---------
>   1 file changed, 12 insertions(+), 11 deletions(-)
>
> diff --git a/drivers/gpu/drm/i915/gt/uc/intel_guc_submission.c b/drivers/gpu/drm/i915/gt/uc/intel_guc_submission.c
> index 69faa39da178..03a86da6011e 100644
> --- a/drivers/gpu/drm/i915/gt/uc/intel_guc_submission.c
> +++ b/drivers/gpu/drm/i915/gt/uc/intel_guc_submission.c
> @@ -352,6 +352,12 @@ static inline void set_lrc_desc_registered(struct intel_guc *guc, u32 id,
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
> @@ -360,11 +366,12 @@ static int guc_submission_send_busy_loop(struct intel_guc *guc,
>   {
>   	int err;
>   
> -	err = intel_guc_send_busy_loop(guc, action, len, g2h_len_dw, loop);
> -
> -	if (!err && g2h_len_dw)
> +	if (g2h_len_dw)
>   		atomic_inc(&guc->outstanding_submission_g2h);
>   
> +	err = intel_guc_send_busy_loop(guc, action, len, g2h_len_dw, loop);
> +	GEM_BUG_ON(g2h_len_dw && err == -EBUSY);

AFAICS having a return g2h is not tied to not returning EBUSY, the only 
way to avoid  EBUSY seems to be for loop to be true. maybe have instead:

GEM_BUG_ON(g2h_len_dw && !loop);

earlier on?

Daniele

> +
>   	return err;
>   }
>   
> @@ -616,7 +623,7 @@ static void scrub_guc_desc_for_outstanding_g2h(struct intel_guc *guc)
>   		init_sched_state(ce);
>   
>   		if (pending_enable || destroyed || deregister) {
> -			atomic_dec(&guc->outstanding_submission_g2h);
> +			decr_outstanding_submission_g2h(guc);
>   			if (deregister)
>   				guc_signal_context_fence(ce);
>   			if (destroyed) {
> @@ -635,7 +642,7 @@ static void scrub_guc_desc_for_outstanding_g2h(struct intel_guc *guc)
>   				intel_engine_signal_breadcrumbs(ce->engine);
>   			}
>   			intel_context_sched_disable_unpin(ce);
> -			atomic_dec(&guc->outstanding_submission_g2h);
> +			decr_outstanding_submission_g2h(guc);
>   			spin_lock_irqsave(&ce->guc_state.lock, flags);
>   			guc_blocked_fence_complete(ce);
>   			spin_unlock_irqrestore(&ce->guc_state.lock, flags);
> @@ -2583,12 +2590,6 @@ g2h_context_lookup(struct intel_guc *guc, u32 desc_idx)
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

