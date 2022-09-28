Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 67EAD5ED169
	for <lists+dri-devel@lfdr.de>; Wed, 28 Sep 2022 02:10:57 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A9C3410E1BF;
	Wed, 28 Sep 2022 00:10:50 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga07.intel.com (mga07.intel.com [134.134.136.100])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CA1B610E1BB;
 Wed, 28 Sep 2022 00:10:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1664323839; x=1695859839;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=XMO4feUFpc4u99OtmcD4G5OviKdJ6ri2BkL5WPGJ4HA=;
 b=WK51UurMplmOVYHelYx7xT8L/9Kgt7W8Wfh71QUbtNLP4sCNi4LO4Cs7
 dLKuwZjJizbM7G2ZbZLJ4CxyN2Ebw1DeGCEySzahYZxGx6x4+P5UdEKc8
 n38bS/CyFmODaX6eFlvuHU1zmbC2a7t8YQOXFpk7wE+xb8CWc469P+cXy
 G50ZbqAVKHrhDCG7CD2Nj5vCZ4tL+gcP9bfAgzhHOdGofKfElmRFIykvV
 citzZHtwjlXcDYBWZ4NBDMDl9t68qWycyFgD/RBkEHrbEVE96T8SeOu0w
 6rI3G36T9xS7jAr7ZNSakKIVylic2eFGltDrpWRnQ0pE9QJsk3nYD2GoY Q==;
X-IronPort-AV: E=McAfee;i="6500,9779,10483"; a="365507615"
X-IronPort-AV: E=Sophos;i="5.93,350,1654585200"; d="scan'208";a="365507615"
Received: from orsmga003.jf.intel.com ([10.7.209.27])
 by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Sep 2022 17:10:38 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10483"; a="572835057"
X-IronPort-AV: E=Sophos;i="5.93,350,1654585200"; d="scan'208";a="572835057"
Received: from fmsmsx603.amr.corp.intel.com ([10.18.126.83])
 by orsmga003.jf.intel.com with ESMTP; 27 Sep 2022 17:10:38 -0700
Received: from fmsmsx607.amr.corp.intel.com (10.18.126.87) by
 fmsmsx603.amr.corp.intel.com (10.18.126.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.31; Tue, 27 Sep 2022 17:10:38 -0700
Received: from fmsmsx601.amr.corp.intel.com (10.18.126.81) by
 fmsmsx607.amr.corp.intel.com (10.18.126.87) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.31; Tue, 27 Sep 2022 17:10:38 -0700
Received: from fmsedg601.ED.cps.intel.com (10.1.192.135) by
 fmsmsx601.amr.corp.intel.com (10.18.126.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.31 via Frontend Transport; Tue, 27 Sep 2022 17:10:38 -0700
Received: from NAM12-DM6-obe.outbound.protection.outlook.com (104.47.59.170)
 by edgegateway.intel.com (192.55.55.70) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2375.31; Tue, 27 Sep 2022 17:10:37 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=dI69C57o0oFbUqezjri+OPCVpkQ/WTyh/1E5JPB2ckKA8Rc5xzxorhsX6B3yE/QIeIFEp8ruVhib9pctsramcWXfto26dwqDosTmxVAlfQ47S/4GJzMEj4c63DxqWZyFoGKF0KrDSLHmElBjTAO91bl6qNork+ypL+7w5hJLjO9EeL0yYqVx3UPrqJ7mLtsXxElIisRSS4gmxLYTyFoCz0/dfhK7DceG0+hmkdbZ9p5jiN8N7Jbcj1XMvgoegCUkP8+h0kRHuI0jZwbzgRvavxlcVMOkWkmegTzTA5rf2ShAr9J6Y6eU0GzmgrODWDcdS705nuq0p3eMSeDdbHjGSw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Le4GLs0F8eiG3zfJLon0cIydzmQr1w52DYyYePbeouw=;
 b=K1kiraIyBW4vpaO37I7nsUcrJPUyehBehyaYT2SCtTrYUP1TAREi0P7uqOk1kZfZzzVMr6hHciUU/G7h+YoCS14FmyNdSoS7ckKz0RFwhldI3Al/fW3ywTonhT8V/g4nsS+GyyikucluBfeiXRxw2+65ZpGkY9A1btaxZCnlYXO5ke5omuuo7DRFK+HKBO635MojKz3jI2iLmQn3+tHjZLUYZbPV216VlHAMTTW1dK+jOBq6IdS8+EiBdEvWKx/AYlYQm5rZSn2m+HB9XJQ4N/LxKd+qwm5DBFhuGPFGiPFrmL8Eef1fTZNPM96Q4KWIjvdHlh+CeD6g66bUdacsyA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from MWHPR11MB1632.namprd11.prod.outlook.com (2603:10b6:301:11::11)
 by CH0PR11MB5562.namprd11.prod.outlook.com (2603:10b6:610:d5::18)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5676.15; Wed, 28 Sep
 2022 00:10:36 +0000
Received: from MWHPR11MB1632.namprd11.prod.outlook.com
 ([fe80::29f8:1b74:685c:6198]) by MWHPR11MB1632.namprd11.prod.outlook.com
 ([fe80::29f8:1b74:685c:6198%7]) with mapi id 15.20.5654.026; Wed, 28 Sep 2022
 00:10:36 +0000
Date: Tue, 27 Sep 2022 17:10:33 -0700
From: Matt Roper <matthew.d.roper@intel.com>
To: Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>
Subject: Re: [PATCH 7/7] drm/i915/guc: handle interrupts from media GuC
Message-ID: <YzOQ+bcBA+PwRZek@mdroper-desk1.amr.corp.intel.com>
References: <20220922221117.458087-1-daniele.ceraolospurio@intel.com>
 <20220922221117.458087-8-daniele.ceraolospurio@intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20220922221117.458087-8-daniele.ceraolospurio@intel.com>
X-ClientProxiedBy: BYAPR07CA0001.namprd07.prod.outlook.com
 (2603:10b6:a02:bc::14) To MWHPR11MB1632.namprd11.prod.outlook.com
 (2603:10b6:301:11::11)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MWHPR11MB1632:EE_|CH0PR11MB5562:EE_
X-MS-Office365-Filtering-Correlation-Id: 8f85f241-38b3-4398-7a96-08daa0e5ddf3
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: QPHC4ioDGyPV7r9M8rOismBH9YEKq0vH5rkL6werXF2BB6H5j46bQFmXfJgw9uqe7y+6Oao1EJESpr8+X/Jxf8NBJylzF11nBLPbpZ6nk0MYWZ+9SXNwJm7hr3jc3jQP3TLLnGQsIxMWVBBMu1LhjH293edxL4WDXo9YyYNMj4TqOKN4YR500O4F8IqNr7G0UVGDPjGXRBu6qq260aFel4hy8WhKFCm5L2xlsp5DTR8jKWeU+XZcbpQeuRTqf7XUesDPdacQ0jmSEmRYMCsNKsZdB19LI0G6VjMnCrfw4BCW7P+j77CP+QASNUW1ua8pmRYQSnnDlZmN4r6+B7DzH8uDFzJr1uzLUr2TMZH8KcvMS6NgLA7rLdJI2s9pxKIyhbhwK7i9aNHCEhO42W6hTg1pivwGmzPvQwCUkAvZNS61kBnhrV5JsZyAGZyVfeLIqg8opy5AJez+MXfvCVImLteH1RlVH4B1lYE7z2VO8QQIdRQf02psCU+h885+GwmXfCH+gaw7wQ/ywpZ4ciJc9nLK8j4ZLqUI16lpO5wPbHxlAH+olObFmok+f+/JUwb3aXKdJvrbsyKonXoG6xv4ExbeQN1Rgn6PUIsjPT1SuzbFpzRXpSkjIZTImHmX2apH/+tZ10nBrwkIDXR+CnFR7zy+DnNzPus2eqfBPC9f3o5HvH8DYGZ9qJymSLOJGvhKoAqvJ8DpCzImXzbrshfY7A==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MWHPR11MB1632.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230022)(136003)(396003)(376002)(39860400002)(346002)(366004)(451199015)(478600001)(6862004)(316002)(8936002)(6506007)(26005)(186003)(86362001)(66946007)(450100002)(66476007)(4326008)(66556008)(82960400001)(38100700002)(5660300002)(6636002)(6512007)(6666004)(54906003)(107886003)(8676002)(2906002)(6486002)(83380400001)(41300700001);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?VC41RBfFtUjTA1MEvLQJfD5kePu/cjidlTDznLBuA2SeI7wDJA0BaU8ZcR6x?=
 =?us-ascii?Q?ojAouI0/jBuNwlfMtx+LvI4CiQ6lIWkxeKniP2fHG7C6oTR9PDOxfgPYaQBB?=
 =?us-ascii?Q?tY//61YAYPiKVsUZGMRHzlegyRz4DpiglTgGufCW2chv/VDfckiqC9xbgYHd?=
 =?us-ascii?Q?ZqyYJyLlQ75i0J7Ovc34+YH1Zze87anLQfHGaPBYLtq7naKTV0aBuDio493a?=
 =?us-ascii?Q?pHlrQow0QDhLab0cY/EgstwgJAVVlsQHGMSlZqS6wYNoKt7x5XdDJsS4ni6H?=
 =?us-ascii?Q?ZL1bakl7FoieLmPQEXSqU14vcTcBUYYGuOZKG4DAja512O4PjbXI2A0rWG3E?=
 =?us-ascii?Q?iq9hHeRucN6T+GGqWGC+mebDtyZAVXPjJ8ov1jpUenBSRB6tDU8EAnfU3EMX?=
 =?us-ascii?Q?nUWbax09Us24cAKxmKGLYwgKY7kPCqIL46bbq/Hgkw4glnJRigPYP47D0uoj?=
 =?us-ascii?Q?cX+yNcZMWAs/nUkkuH1U29i11dIBauV2xcXP7fXTSLVp66r/yijaqGkUAZE9?=
 =?us-ascii?Q?NYcbnQ3sZtE+IpGTOUTqOztH7Led24I1S23yI80/P0AG1Tok2MuemZlf51OP?=
 =?us-ascii?Q?10mU/EcmwcpI+YSOpd6G5GMKwQbxZK6VSkHcDkUNq1bTXP5fWNaF/jDQVfpC?=
 =?us-ascii?Q?uJsIFecnfUViE4qP95f6NBM3GGRIAs21AwK8DBGLO1yX+VdfhiRAYpgaiYHl?=
 =?us-ascii?Q?Vho6vYwCzyuqIOdlTyJ+LtX/5JirRUHYv+hfEZgAzsr1FdyLgEnF6vsY0F0w?=
 =?us-ascii?Q?Aa/2Fa5HigXPLdMiBcnySnP5prJGRYmgCY7zZlhjOkBytOV5UxrE7yGQmsLN?=
 =?us-ascii?Q?AVHsTI+/zg6Rs1pL4A4RJq1gD/DMzgCdXZtNbSKsN7AczjocaF9I+R2gnSxp?=
 =?us-ascii?Q?+Udo7pxaRk8p6AJdcJBVlY9WTcrmfUzSoxq3zMb4MXdjf73s3WSnwDwsRHaE?=
 =?us-ascii?Q?mCmevRlleKT4kx982MIMv/6F9RAgVsi8HdAlBdhVGADuFjACqIS8/CZRIvQ6?=
 =?us-ascii?Q?weFUFT/QoLY9KpFN3bZLbDyPArwnuU8S/zuUIrD/cwp7SnIdoaUbN3IXH339?=
 =?us-ascii?Q?RGhyGwJPLNoz3eP5Fm60AaKuDjxZOjTG4AV6IQETfbSUz0pF1lZtYcTaRVm8?=
 =?us-ascii?Q?VKy1jpH2uzxLijtwvXPylGjNVNLQo4F58onkwsdpBtokXo+yTc0LbYCWeM9D?=
 =?us-ascii?Q?nkbteCnq/OsXxjTmmDDASmSDCkU2DDVj2Oob/d0fyeT9BhqvEqWGI5VPiV0q?=
 =?us-ascii?Q?zSWL76RDUb4rW6Q81qGYdPiotnUQNp1WhkrOrYpJAEDX8yNigM2kX7Jkt+Oq?=
 =?us-ascii?Q?V+yQSVupEZC05FkruMnkyipEl+q0Ed64Gw6c0IFMvD/N1ICFKm0iH7C2TStZ?=
 =?us-ascii?Q?VGuBaW90hO2s/eCFON8Vau7e3sZT2qIhU10ddh0CH7ybPgiSunQnfr+cnva+?=
 =?us-ascii?Q?hG3wL9HWAekiEQR/o4kLhveSoR8ukFBczEeXwWT6vxt9JGhGyyqniJeEJD+e?=
 =?us-ascii?Q?xcq+SPoi8iG9awAW9+dwgcn+dxAtxWMivJlOUx1UfzLjDbiZbaEnYfNEJvPu?=
 =?us-ascii?Q?YzLqpBIw/t1elWL9PzSM3mfmpKDLyFiqJkXn0ktcF8ykQ6taq6C97GmaVGqX?=
 =?us-ascii?Q?JA=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 8f85f241-38b3-4398-7a96-08daa0e5ddf3
X-MS-Exchange-CrossTenant-AuthSource: MWHPR11MB1632.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 Sep 2022 00:10:36.0053 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: GMM6gw5oWd/v+8zkKA7GMGKGoB0SmwnpvM//6e1rEbIFDUjUk/IsVvHw9uDUAib98yJRp5jpryPrN+/oFEs+MIKh40Ehko26Pv2AFRKE5V4=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH0PR11MB5562
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
Cc: intel-gfx@lists.freedesktop.org,
 Alan Previn <alan.previn.teres.alexis@intel.com>,
 John Harrison <John.C.Harrison@intel.com>, dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Thu, Sep 22, 2022 at 03:11:17PM -0700, Daniele Ceraolo Spurio wrote:
> The render and media GuCs share the same interrupt enable register, so
> we can no longer disable interrupts when we disable communication for
> one of the GuCs as this would impact the other GuC. Instead, we keep the
> interrupts always enabled in HW and use a variable in the GuC structure
> to determine if we want to service the received interrupts or not.

Even if they have a unified enable bit, can't we still just update the
per-GuC mask bit to get the same behavior (i.e., no interrupts
delivered to the host for that specific GuC)?

> 
> Signed-off-by: Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>
> Cc: Matt Roper <matthew.d.roper@intel.com>
> Cc: John Harrison <John.C.Harrison@Intel.com>
> Cc: Alan Previn <alan.previn.teres.alexis@intel.com>
> ---
>  drivers/gpu/drm/i915/gt/intel_gt_irq.c  | 21 ++++++++++++++----
>  drivers/gpu/drm/i915/gt/intel_gt_regs.h |  2 ++
>  drivers/gpu/drm/i915/gt/uc/intel_guc.c  | 29 ++++++++++++++-----------
>  drivers/gpu/drm/i915/gt/uc/intel_guc.h  |  5 ++++-
>  drivers/gpu/drm/i915/gt/uc/intel_uc.c   |  8 +++++--
>  5 files changed, 45 insertions(+), 20 deletions(-)
> 
> diff --git a/drivers/gpu/drm/i915/gt/intel_gt_irq.c b/drivers/gpu/drm/i915/gt/intel_gt_irq.c
> index f26882fdc24c..e33ed9ae1439 100644
> --- a/drivers/gpu/drm/i915/gt/intel_gt_irq.c
> +++ b/drivers/gpu/drm/i915/gt/intel_gt_irq.c
> @@ -17,6 +17,9 @@
>  
>  static void guc_irq_handler(struct intel_guc *guc, u16 iir)
>  {
> +	if (unlikely(!guc->interrupts.enabled))
> +		return;
> +
>  	if (iir & GUC_INTR_GUC2HOST)
>  		intel_guc_to_host_event_handler(guc);
>  }
> @@ -249,6 +252,7 @@ void gen11_gt_irq_postinstall(struct intel_gt *gt)
>  {
>  	struct intel_uncore *uncore = gt->uncore;
>  	u32 irqs = GT_RENDER_USER_INTERRUPT;
> +	u32 guc_mask = intel_uc_wants_guc(&gt->uc) ? GUC_INTR_GUC2HOST : 0;
>  	const u32 gsc_mask = GSC_IRQ_INTF(0) | GSC_IRQ_INTF(1);
>  	u32 dmask;
>  	u32 smask;
> @@ -299,6 +303,19 @@ void gen11_gt_irq_postinstall(struct intel_gt *gt)
>  	if (HAS_HECI_GSC(gt->i915))
>  		intel_uncore_write(uncore, GEN11_GUNIT_CSME_INTR_MASK, ~gsc_mask);
>  
> +	if (guc_mask) {
> +		/* the enable bit is common for both GTs but the masks are separate */
> +		u32 mask = gt->type == GT_MEDIA ?
> +			REG_FIELD_PREP(ENGINE0_MASK, guc_mask) :
> +			REG_FIELD_PREP(ENGINE1_MASK, guc_mask);
> +
> +		intel_uncore_write(uncore, GEN11_GUC_SG_INTR_ENABLE,
> +				   REG_FIELD_PREP(ENGINE1_MASK, guc_mask));
> +
> +		/* we might not be the first GT to write this reg */
> +		intel_uncore_rmw(uncore, GEN12_GUC_MGUC_INTR_MASK, mask, 0);
> +	}
> +
>  	/*
>  	 * RPS interrupts will get enabled/disabled on demand when RPS itself
>  	 * is enabled/disabled.
> @@ -307,10 +324,6 @@ void gen11_gt_irq_postinstall(struct intel_gt *gt)
>  	gt->pm_imr = ~gt->pm_ier;
>  	intel_uncore_write(uncore, GEN11_GPM_WGBOXPERF_INTR_ENABLE, 0);
>  	intel_uncore_write(uncore, GEN11_GPM_WGBOXPERF_INTR_MASK,  ~0);
> -
> -	/* Same thing for GuC interrupts */
> -	intel_uncore_write(uncore, GEN11_GUC_SG_INTR_ENABLE, 0);
> -	intel_uncore_write(uncore, GEN11_GUC_SG_INTR_MASK,  ~0);
>  }
>  
>  void gen5_gt_irq_handler(struct intel_gt *gt, u32 gt_iir)
> diff --git a/drivers/gpu/drm/i915/gt/intel_gt_regs.h b/drivers/gpu/drm/i915/gt/intel_gt_regs.h
> index 1cbb7226400b..792809e49680 100644
> --- a/drivers/gpu/drm/i915/gt/intel_gt_regs.h
> +++ b/drivers/gpu/drm/i915/gt/intel_gt_regs.h
> @@ -1519,6 +1519,7 @@
>  #define   GEN11_CSME				(31)
>  #define   GEN11_GUNIT				(28)
>  #define   GEN11_GUC				(25)
> +#define   GEN12_GUCM				(24)
>  #define   GEN11_WDPERF				(20)
>  #define   GEN11_KCR				(19)
>  #define   GEN11_GTPM				(16)
> @@ -1573,6 +1574,7 @@
>  #define GEN11_VECS0_VECS1_INTR_MASK		_MMIO(0x1900d0)
>  #define GEN12_VECS2_VECS3_INTR_MASK		_MMIO(0x1900d4)
>  #define GEN11_GUC_SG_INTR_MASK			_MMIO(0x1900e8)
> +#define GEN12_GUC_MGUC_INTR_MASK		_MMIO(0x1900e8) /* MTL+ */

Technically we should probably give this a "MTL_" prefix or something
since we're not referring to new platforms as "gen12" anymore.

>  #define GEN11_GPM_WGBOXPERF_INTR_MASK		_MMIO(0x1900ec)
>  #define GEN11_CRYPTO_RSVD_INTR_MASK		_MMIO(0x1900f0)
>  #define GEN11_GUNIT_CSME_INTR_MASK		_MMIO(0x1900f4)
> diff --git a/drivers/gpu/drm/i915/gt/uc/intel_guc.c b/drivers/gpu/drm/i915/gt/uc/intel_guc.c
> index b0beab44b34c..ab0263d8e1cf 100644
> --- a/drivers/gpu/drm/i915/gt/uc/intel_guc.c
> +++ b/drivers/gpu/drm/i915/gt/uc/intel_guc.c
> @@ -98,6 +98,8 @@ static void gen9_enable_guc_interrupts(struct intel_guc *guc)
>  		     gt->pm_guc_events);
>  	gen6_gt_pm_enable_irq(gt, gt->pm_guc_events);
>  	spin_unlock_irq(gt->irq_lock);
> +
> +	guc->interrupts.enabled = true;
>  }
>  
>  static void gen9_disable_guc_interrupts(struct intel_guc *guc)
> @@ -105,6 +107,7 @@ static void gen9_disable_guc_interrupts(struct intel_guc *guc)
>  	struct intel_gt *gt = guc_to_gt(guc);
>  
>  	assert_rpm_wakelock_held(&gt->i915->runtime_pm);
> +	guc->interrupts.enabled = false;
>  
>  	spin_lock_irq(gt->irq_lock);
>  
> @@ -116,39 +119,39 @@ static void gen9_disable_guc_interrupts(struct intel_guc *guc)
>  	gen9_reset_guc_interrupts(guc);
>  }
>  
> +static bool __gen11_reset_guc_interrupts(struct intel_gt *gt)
> +{
> +	u32 irq = gt->type == GT_MEDIA ? GEN12_GUCM : GEN11_GUC;
> +
> +	lockdep_assert_held(gt->irq_lock);
> +	return gen11_gt_reset_one_iir(gt, 0, irq);
> +}
> +
>  static void gen11_reset_guc_interrupts(struct intel_guc *guc)
>  {
>  	struct intel_gt *gt = guc_to_gt(guc);
>  
>  	spin_lock_irq(gt->irq_lock);
> -	gen11_gt_reset_one_iir(gt, 0, GEN11_GUC);
> +	__gen11_reset_guc_interrupts(gt);
>  	spin_unlock_irq(gt->irq_lock);
>  }
>  
>  static void gen11_enable_guc_interrupts(struct intel_guc *guc)
>  {
>  	struct intel_gt *gt = guc_to_gt(guc);
> -	u32 events = REG_FIELD_PREP(ENGINE1_MASK, GUC_INTR_GUC2HOST);
>  
>  	spin_lock_irq(gt->irq_lock);
> -	WARN_ON_ONCE(gen11_gt_reset_one_iir(gt, 0, GEN11_GUC));
> -	intel_uncore_write(gt->uncore,
> -			   GEN11_GUC_SG_INTR_ENABLE, events);
> -	intel_uncore_write(gt->uncore,
> -			   GEN11_GUC_SG_INTR_MASK, ~events);

The modified postinstall left us with GUC2HOST enabled but masked.
Don't we still need to clear the mask so the interrupts will start being
delivered?


Matt

> +	__gen11_reset_guc_interrupts(gt);
>  	spin_unlock_irq(gt->irq_lock);
> +
> +	guc->interrupts.enabled = true;
>  }
>  
>  static void gen11_disable_guc_interrupts(struct intel_guc *guc)
>  {
>  	struct intel_gt *gt = guc_to_gt(guc);
>  
> -	spin_lock_irq(gt->irq_lock);
> -
> -	intel_uncore_write(gt->uncore, GEN11_GUC_SG_INTR_MASK, ~0);
> -	intel_uncore_write(gt->uncore, GEN11_GUC_SG_INTR_ENABLE, 0);
> -
> -	spin_unlock_irq(gt->irq_lock);
> +	guc->interrupts.enabled = false;
>  	intel_synchronize_irq(gt->i915);
>  
>  	gen11_reset_guc_interrupts(guc);
> diff --git a/drivers/gpu/drm/i915/gt/uc/intel_guc.h b/drivers/gpu/drm/i915/gt/uc/intel_guc.h
> index 804133df1ac9..061d55de3a94 100644
> --- a/drivers/gpu/drm/i915/gt/uc/intel_guc.h
> +++ b/drivers/gpu/drm/i915/gt/uc/intel_guc.h
> @@ -78,6 +78,7 @@ struct intel_guc {
>  
>  	/** @interrupts: pointers to GuC interrupt-managing functions. */
>  	struct {
> +		bool enabled;
>  		void (*reset)(struct intel_guc *guc);
>  		void (*enable)(struct intel_guc *guc);
>  		void (*disable)(struct intel_guc *guc);
> @@ -316,9 +317,11 @@ static inline int intel_guc_send_busy_loop(struct intel_guc *guc,
>  	return err;
>  }
>  
> +/* Only call this from the interrupt handler code */
>  static inline void intel_guc_to_host_event_handler(struct intel_guc *guc)
>  {
> -	intel_guc_ct_event_handler(&guc->ct);
> +	if (guc->interrupts.enabled)
> +		intel_guc_ct_event_handler(&guc->ct);
>  }
>  
>  /* GuC addresses above GUC_GGTT_TOP also don't map through the GTT */
> diff --git a/drivers/gpu/drm/i915/gt/uc/intel_uc.c b/drivers/gpu/drm/i915/gt/uc/intel_uc.c
> index 4cd8a787f9e5..1d28286e6f06 100644
> --- a/drivers/gpu/drm/i915/gt/uc/intel_uc.c
> +++ b/drivers/gpu/drm/i915/gt/uc/intel_uc.c
> @@ -636,8 +636,10 @@ void intel_uc_runtime_suspend(struct intel_uc *uc)
>  {
>  	struct intel_guc *guc = &uc->guc;
>  
> -	if (!intel_guc_is_ready(guc))
> +	if (!intel_guc_is_ready(guc)) {
> +		guc->interrupts.enabled = false;
>  		return;
> +	}
>  
>  	/*
>  	 * Wait for any outstanding CTB before tearing down communication /w the
> @@ -657,8 +659,10 @@ void intel_uc_suspend(struct intel_uc *uc)
>  	intel_wakeref_t wakeref;
>  	int err;
>  
> -	if (!intel_guc_is_ready(guc))
> +	if (!intel_guc_is_ready(guc)) {
> +		guc->interrupts.enabled = false;
>  		return;
> +	}
>  
>  	with_intel_runtime_pm(&uc_to_gt(uc)->i915->runtime_pm, wakeref) {
>  		err = intel_guc_suspend(guc);
> -- 
> 2.37.3
> 

-- 
Matt Roper
Graphics Software Engineer
VTT-OSGC Platform Enablement
Intel Corporation
