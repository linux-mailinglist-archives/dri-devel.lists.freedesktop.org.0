Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 0489E24982F
	for <lists+dri-devel@lfdr.de>; Wed, 19 Aug 2020 10:22:22 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E5FF96E204;
	Wed, 19 Aug 2020 08:22:17 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5E73D6E1F8;
 Wed, 19 Aug 2020 08:22:16 +0000 (UTC)
IronPort-SDR: o9NPu2fMb5GRVeglJz+DIDLloHbyGZ3SoxOFZgwsIrJJSgXRfZJ6McYQUY+Q+A1CT5Pj5EfGFA
 /lvat3KsnfuA==
X-IronPort-AV: E=McAfee;i="6000,8403,9717"; a="156138623"
X-IronPort-AV: E=Sophos;i="5.76,330,1592895600"; d="scan'208";a="156138623"
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga006.fm.intel.com ([10.253.24.20])
 by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 Aug 2020 01:22:15 -0700
IronPort-SDR: z/VtBZTDrcI6dFFoeJvZ80eJda0Vzuu/1Etx4MxzwmS35G5vCY9JR3LUlkPLY9L2Fx/uMsPRGd
 vVnSTfS/MIXA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.76,330,1592895600"; d="scan'208";a="497160905"
Received: from unknown (HELO fmsmsx604.amr.corp.intel.com) ([10.18.84.214])
 by fmsmga006.fm.intel.com with ESMTP; 19 Aug 2020 01:22:15 -0700
Received: from bgsmsx606.gar.corp.intel.com (10.67.234.8) by
 fmsmsx604.amr.corp.intel.com (10.18.126.84) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.1713.5; Wed, 19 Aug 2020 01:22:14 -0700
Received: from bgsmsx604.gar.corp.intel.com (10.67.234.6) by
 BGSMSX606.gar.corp.intel.com (10.67.234.8) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.1713.5; Wed, 19 Aug 2020 13:52:11 +0530
Received: from bgsmsx604.gar.corp.intel.com ([10.67.234.6]) by
 BGSMSX604.gar.corp.intel.com ([10.67.234.6]) with mapi id 15.01.1713.004;
 Wed, 19 Aug 2020 13:52:11 +0530
From: "Shankar, Uma" <uma.shankar@intel.com>
To: "Laxminarayan Bharadiya, Pankaj"
 <pankaj.laxminarayan.bharadiya@intel.com>, "jani.nikula@linux.intel.com"
 <jani.nikula@linux.intel.com>, "daniel@ffwll.ch" <daniel@ffwll.ch>,
 "intel-gfx@lists.freedesktop.org" <intel-gfx@lists.freedesktop.org>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 "ville.syrjala@linux.intel.com" <ville.syrjala@linux.intel.com>,
 "daniels@collabora.com" <daniels@collabora.com>, "Lattannavar, Sameer"
 <sameer.lattannavar@intel.com>, Joonas Lahtinen
 <joonas.lahtinen@linux.intel.com>, "Vivi, Rodrigo" <rodrigo.vivi@intel.com>,
 David Airlie <airlied@linux.ie>
Subject: RE: [PATCH v5 3/5] drm/i915: Introduce scaling filter related
 registers and bit fields.
Thread-Topic: [PATCH v5 3/5] drm/i915: Introduce scaling filter related
 registers and bit fields.
Thread-Index: AQHWaU911qfAxJH37E+ftJCNUZP2dqk/MMHg
Date: Wed, 19 Aug 2020 08:22:11 +0000
Message-ID: <6a5a978e9248425483866cb881461b56@intel.com>
References: <20200803042953.7626-1-pankaj.laxminarayan.bharadiya@intel.com>
 <20200803042953.7626-4-pankaj.laxminarayan.bharadiya@intel.com>
In-Reply-To: <20200803042953.7626-4-pankaj.laxminarayan.bharadiya@intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
dlp-product: dlpe-windows
dlp-reaction: no-action
dlp-version: 11.5.1.3
x-originating-ip: [10.223.10.1]
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
Cc: "Laxminarayan Bharadiya, Pankaj" <pankaj.laxminarayan.bharadiya@intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>



> -----Original Message-----
> From: dri-devel <dri-devel-bounces@lists.freedesktop.org> On Behalf Of Pankaj
> Bharadiya
> Sent: Monday, August 3, 2020 10:00 AM
> To: jani.nikula@linux.intel.com; daniel@ffwll.ch; intel-gfx@lists.freedesktop.org;
> dri-devel@lists.freedesktop.org; ville.syrjala@linux.intel.com;
> daniels@collabora.com; Lattannavar, Sameer <sameer.lattannavar@intel.com>;
> Joonas Lahtinen <joonas.lahtinen@linux.intel.com>; Vivi, Rodrigo
> <rodrigo.vivi@intel.com>; David Airlie <airlied@linux.ie>
> Cc: Laxminarayan Bharadiya, Pankaj
> <pankaj.laxminarayan.bharadiya@intel.com>
> Subject: [PATCH v5 3/5] drm/i915: Introduce scaling filter related registers and bit
> fields.

You can drop the "." from header.

Overall Changes look good to me.
Reviewed-by: Uma Shankar <uma.shankar@intel.com>

> Introduce scaler registers and bit fields needed to configure the scaling filter in
> prgrammed mode and configure scaling filter coefficients.
> 
> changes since v3:
> * None
> changes since v2:
> * Change macro names to CNL_* and  use +(set)*8 instead of adding
>   another trip through _PICK_EVEN (Ville).
> changes since v1:
> * None
> changes since RFC:
> * Parametrize scaler coeffient macros by 'set' (Ville)
> 
> Signed-off-by: Shashank Sharma <shashank.sharma@intel.com>
> Signed-off-by: Ankit Nautiyal <ankit.k.nautiyal@intel.com>
> Signed-off-by: Pankaj Bharadiya <pankaj.laxminarayan.bharadiya@intel.com>
> ---
>  drivers/gpu/drm/i915/i915_reg.h | 22 ++++++++++++++++++++++
>  1 file changed, 22 insertions(+)
> 
> diff --git a/drivers/gpu/drm/i915/i915_reg.h b/drivers/gpu/drm/i915/i915_reg.h
> index 5eae593ee784..e582021cc208 100644
> --- a/drivers/gpu/drm/i915/i915_reg.h
> +++ b/drivers/gpu/drm/i915/i915_reg.h
> @@ -7391,6 +7391,7 @@ enum {
>  #define PS_PLANE_SEL(plane) (((plane) + 1) << 25)
>  #define PS_FILTER_MASK         (3 << 23)
>  #define PS_FILTER_MEDIUM       (0 << 23)
> +#define PS_FILTER_PROGRAMMED   (1 << 23)
>  #define PS_FILTER_EDGE_ENHANCE (2 << 23)
>  #define PS_FILTER_BILINEAR     (3 << 23)
>  #define PS_VERT3TAP            (1 << 21)
> @@ -7405,6 +7406,10 @@ enum {
>  #define PS_VADAPT_MODE_MOST_ADAPT  (3 << 5)  #define
> PS_PLANE_Y_SEL_MASK  (7 << 5)  #define PS_PLANE_Y_SEL(plane) (((plane) + 1)
> << 5)
> +#define PS_Y_VERT_FILTER_SELECT(set)   ((set) << 4)
> +#define PS_Y_HORZ_FILTER_SELECT(set)   ((set) << 3)
> +#define PS_UV_VERT_FILTER_SELECT(set)  ((set) << 2) #define
> +PS_UV_HORZ_FILTER_SELECT(set)  ((set) << 1)
> 
>  #define _PS_PWR_GATE_1A     0x68160
>  #define _PS_PWR_GATE_2A     0x68260
> @@ -7467,6 +7472,17 @@ enum {
>  #define _PS_ECC_STAT_2B     0x68AD0
>  #define _PS_ECC_STAT_1C     0x691D0
> 
> +#define _PS_COEF_SET0_INDEX_1A	   0x68198
> +#define _PS_COEF_SET0_INDEX_2A	   0x68298
> +#define _PS_COEF_SET0_INDEX_1B	   0x68998
> +#define _PS_COEF_SET0_INDEX_2B	   0x68A98
> +#define PS_COEE_INDEX_AUTO_INC	   (1 << 10)
> +
> +#define _PS_COEF_SET0_DATA_1A	   0x6819C
> +#define _PS_COEF_SET0_DATA_2A	   0x6829C
> +#define _PS_COEF_SET0_DATA_1B	   0x6899C
> +#define _PS_COEF_SET0_DATA_2B	   0x68A9C
> +
>  #define _ID(id, a, b) _PICK_EVEN(id, a, b)
>  #define SKL_PS_CTRL(pipe, id) _MMIO_PIPE(pipe,        \
>  			_ID(id, _PS_1A_CTRL, _PS_2A_CTRL),       \
> @@ -7495,7 +7511,13 @@ enum {
>  #define SKL_PS_ECC_STAT(pipe, id)  _MMIO_PIPE(pipe,     \
>  			_ID(id, _PS_ECC_STAT_1A, _PS_ECC_STAT_2A),   \
>  			_ID(id, _PS_ECC_STAT_1B, _PS_ECC_STAT_2B))
> +#define CNL_PS_COEF_INDEX_SET(pipe, id, set)  _MMIO_PIPE(pipe,    \
> +			_ID(id, _PS_COEF_SET0_INDEX_1A,
> _PS_COEF_SET0_INDEX_2A) + (set) * 8, \
> +			_ID(id, _PS_COEF_SET0_INDEX_1B,
> _PS_COEF_SET0_INDEX_2B) + (set) * 8)
> 
> +#define CNL_PS_COEF_DATA_SET(pipe, id, set)  _MMIO_PIPE(pipe,     \
> +			_ID(id, _PS_COEF_SET0_DATA_1A,
> _PS_COEF_SET0_DATA_2A) + (set) * 8, \
> +			_ID(id, _PS_COEF_SET0_DATA_1B,
> _PS_COEF_SET0_DATA_2B) + (set) * 8)
>  /* legacy palette */
>  #define _LGC_PALETTE_A           0x4a000
>  #define _LGC_PALETTE_B           0x4a800
> --
> 2.23.0
> 
> _______________________________________________
> dri-devel mailing list
> dri-devel@lists.freedesktop.org
> https://lists.freedesktop.org/mailman/listinfo/dri-devel
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
