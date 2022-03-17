Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 7526D4DCC05
	for <lists+dri-devel@lfdr.de>; Thu, 17 Mar 2022 18:05:56 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 059A110E1CE;
	Thu, 17 Mar 2022 17:05:53 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3A1D810E1CE;
 Thu, 17 Mar 2022 17:05:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1647536752; x=1679072752;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=ExB1yTnqCzYn6KgzdIcm6j3Lj07zFpGClQPAh03AoqY=;
 b=Fgx4oBxKyeR2SmY+ubdlLAvSuczxVyKI/SMqOUeXLemJMrOnJuwlnBuH
 rbDup1i/J08pZerjdo0zxdejX3mrqyXTZ4UnYKt2m903Dr5RRS8Z4E+6D
 AJcxL1rdl/57b32g7WatJe8GE3sLcCcr9d088i6KhN9QF5/qy/LJP0x+R
 X0IqPNBeXY27EhcFsnsnUbqbae8zx3nvEOi2FZ1TiBUy3N0Z4Me6vkSrA
 pwZF/yuN8l/LZICBPgkfV8LlVuZu3l9BtTmNbhLiOwwyP0Dqu9HoczoNf
 269KaHFUh7yef2YLfQrBZ0yjQNq2Rbu4ILOHddx2TjNJOC1/A7JGDYm5O Q==;
X-IronPort-AV: E=McAfee;i="6200,9189,10289"; a="256647962"
X-IronPort-AV: E=Sophos;i="5.90,188,1643702400"; d="scan'208";a="256647962"
Received: from orsmga007.jf.intel.com ([10.7.209.58])
 by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 Mar 2022 10:05:06 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.90,188,1643702400"; d="scan'208";a="541445625"
Received: from fmsmsx605.amr.corp.intel.com ([10.18.126.85])
 by orsmga007.jf.intel.com with ESMTP; 17 Mar 2022 10:05:06 -0700
Received: from fmsmsx612.amr.corp.intel.com (10.18.126.92) by
 fmsmsx605.amr.corp.intel.com (10.18.126.85) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2308.21; Thu, 17 Mar 2022 10:05:06 -0700
Received: from fmsmsx611.amr.corp.intel.com (10.18.126.91) by
 fmsmsx612.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2308.21; Thu, 17 Mar 2022 10:05:05 -0700
Received: from fmsmsx611.amr.corp.intel.com ([10.18.126.91]) by
 fmsmsx611.amr.corp.intel.com ([10.18.126.91]) with mapi id 15.01.2308.021;
 Thu, 17 Mar 2022 10:05:05 -0700
From: "Srivatsa, Anusha" <anusha.srivatsa@intel.com>
To: "Roper, Matthew D" <matthew.d.roper@intel.com>,
 "intel-gfx@lists.freedesktop.org" <intel-gfx@lists.freedesktop.org>
Subject: RE: [Intel-gfx] [PATCH v2 1/2] drm/i915/dg2: Add preemption changes
 for Wa_14015141709
Thread-Topic: [Intel-gfx] [PATCH v2 1/2] drm/i915/dg2: Add preemption changes
 for Wa_14015141709
Thread-Index: AQHYMCI1+9BNGUsIVECQFc07ta2IwazD4eBQ
Date: Thu, 17 Mar 2022 17:05:05 +0000
Message-ID: <bcf9ca0bf6294ba3a6f7548fb3b2f3ee@intel.com>
References: <20220304234639.3231617-1-matthew.d.roper@intel.com>
In-Reply-To: <20220304234639.3231617-1-matthew.d.roper@intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
dlp-version: 11.6.401.20
dlp-product: dlpe-windows
dlp-reaction: no-action
x-originating-ip: [10.22.254.132]
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
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
Cc: "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Looks good.

Reviewed-by: Anusha Srivatsa <anusha.srivatsa@intel.com>

> -----Original Message-----
> From: Intel-gfx <intel-gfx-bounces@lists.freedesktop.org> On Behalf Of Ma=
tt
> Roper
> Sent: Friday, March 4, 2022 3:47 PM
> To: intel-gfx@lists.freedesktop.org
> Cc: dri-devel@lists.freedesktop.org
> Subject: [Intel-gfx] [PATCH v2 1/2] drm/i915/dg2: Add preemption changes
> for Wa_14015141709
>=20
> From: Akeem G Abodunrin <akeem.g.abodunrin@intel.com>
>=20
> Starting with DG2, preemption can no longer be controlled using userspace
> on a per-context basis. Instead, the hardware only allows us to enable or
> disable preemption in a global, system-wide basis.  Also, we lose the abi=
lity
> to specify the preemption granularity (such as batch-level vs command-lev=
el
> vs object-level).
>=20
> v2 (MattR):
>  - Move debugfs interface to a separate patch.  (Jani)
>=20
> Cc: Matt Roper <matthew.d.roper@intel.com>
> Cc: Prathap Kumar Valsan <prathap.kumar.valsan@intel.com>
> Cc: John Harrison <john.c.harrison@intel.com>
> Cc: Joonas Lahtinen <joonas.lahtinen@linux.intel.com>
> Cc: Jani Nikula <jani.nikula@linux.intel.com>
> Cc: Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>
> Signed-off-by: Akeem G Abodunrin <akeem.g.abodunrin@intel.com>
> Signed-off-by: Matt Roper <matthew.d.roper@intel.com>
> ---
>  drivers/gpu/drm/i915/gt/intel_workarounds.c | 2 +-
>  drivers/gpu/drm/i915/i915_drv.h             | 3 +++
>  2 files changed, 4 insertions(+), 1 deletion(-)
>=20
> diff --git a/drivers/gpu/drm/i915/gt/intel_workarounds.c
> b/drivers/gpu/drm/i915/gt/intel_workarounds.c
> index beca8735bae5..f695a9c96c8d 100644
> --- a/drivers/gpu/drm/i915/gt/intel_workarounds.c
> +++ b/drivers/gpu/drm/i915/gt/intel_workarounds.c
> @@ -2310,7 +2310,7 @@ rcs_engine_wa_init(struct intel_engine_cs *engine,
> struct i915_wa_list *wal)
>  			     FF_DOP_CLOCK_GATE_DISABLE);
>  	}
>=20
> -	if (IS_GRAPHICS_VER(i915, 9, 12)) {
> +	if (HAS_PERCTX_PREEMPT_CTRL(i915)) {
>  		/*
> FtrPerCtxtPreemptionGranularityControl:skl,bxt,kbl,cfl,cnl,icl,tgl */
>  		wa_masked_en(wal,
>  			     GEN7_FF_SLICE_CS_CHICKEN1,
> diff --git a/drivers/gpu/drm/i915/i915_drv.h
> b/drivers/gpu/drm/i915/i915_drv.h index 943267393ecb..afefb3bd2714
> 100644
> --- a/drivers/gpu/drm/i915/i915_drv.h
> +++ b/drivers/gpu/drm/i915/i915_drv.h
> @@ -1396,6 +1396,9 @@ IS_SUBPLATFORM(const struct drm_i915_private
> *i915,  #define HAS_GUC_DEPRIVILEGE(dev_priv) \
>  	(INTEL_INFO(dev_priv)->has_guc_deprivilege)
>=20
> +#define HAS_PERCTX_PREEMPT_CTRL(i915) \
> +	((GRAPHICS_VER(i915) >=3D 9) &&  GRAPHICS_VER_FULL(i915) <
> IP_VER(12,
> +55))
> +
>  static inline bool run_as_guest(void)
>  {
>  	return !hypervisor_is_type(X86_HYPER_NATIVE);
> --
> 2.34.1

