Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 3688E4084AB
	for <lists+dri-devel@lfdr.de>; Mon, 13 Sep 2021 08:26:10 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B56996E0E9;
	Mon, 13 Sep 2021 06:26:06 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga05.intel.com (mga05.intel.com [192.55.52.43])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5502489FE3;
 Mon, 13 Sep 2021 06:26:05 +0000 (UTC)
X-IronPort-AV: E=McAfee;i="6200,9189,10105"; a="307137938"
X-IronPort-AV: E=Sophos;i="5.85,288,1624345200"; d="scan'208";a="307137938"
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
 by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Sep 2021 23:26:04 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.85,288,1624345200"; d="scan'208";a="543019897"
Received: from irsmsx603.ger.corp.intel.com ([163.33.146.9])
 by FMSMGA003.fm.intel.com with ESMTP; 12 Sep 2021 23:26:04 -0700
Received: from bgsmsx604.gar.corp.intel.com (10.67.234.6) by
 irsmsx603.ger.corp.intel.com (163.33.146.9) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2242.12; Mon, 13 Sep 2021 07:26:02 +0100
Received: from bgsmsx604.gar.corp.intel.com ([10.67.234.6]) by
 BGSMSX604.gar.corp.intel.com ([10.67.234.6]) with mapi id 15.01.2242.012;
 Mon, 13 Sep 2021 11:56:01 +0530
From: "Shankar, Uma" <uma.shankar@intel.com>
To: "Nikula, Jani" <jani.nikula@intel.com>, "intel-gfx@lists.freedesktop.org"
 <intel-gfx@lists.freedesktop.org>
CC: "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 "ville.syrjala@linux.intel.com" <ville.syrjala@linux.intel.com>, "Nikula,
 Jani" <jani.nikula@intel.com>
Subject: RE: [Intel-gfx] [PATCH v2 6/6] drm/i915/edp: use MSO pixel overlap
 from DisplayID data
Thread-Topic: [Intel-gfx] [PATCH v2 6/6] drm/i915/edp: use MSO pixel overlap
 from DisplayID data
Thread-Index: AQHXnnMRYfT60hCnxkmXHPx5ESPrdauhk2/A
Date: Mon, 13 Sep 2021 06:26:01 +0000
Message-ID: <5a3ed8934466442895654a9adb1af9f3@intel.com>
References: <cover.1630419362.git.jani.nikula@intel.com>
 <87d8d80ba205eb2ecb50f613219e0a821a842616.1630419362.git.jani.nikula@intel.com>
In-Reply-To: <87d8d80ba205eb2ecb50f613219e0a821a842616.1630419362.git.jani.nikula@intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
dlp-product: dlpe-windows
dlp-reaction: no-action
dlp-version: 11.5.1.3
x-originating-ip: [10.223.10.1]
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>



> -----Original Message-----
> From: Intel-gfx <intel-gfx-bounces@lists.freedesktop.org> On Behalf Of Ja=
ni Nikula
> Sent: Tuesday, August 31, 2021 7:48 PM
> To: intel-gfx@lists.freedesktop.org
> Cc: dri-devel@lists.freedesktop.org; ville.syrjala@linux.intel.com; Nikul=
a, Jani
> <jani.nikula@intel.com>
> Subject: [Intel-gfx] [PATCH v2 6/6] drm/i915/edp: use MSO pixel overlap f=
rom
> DisplayID data
>=20
> Now that we have MSO pixel overlap in display info, use it.
>=20

Looks ok to me.
Reviewed-by: Uma Shankar <uma.shankar@intel.com>

> Signed-off-by: Jani Nikula <jani.nikula@intel.com>
> ---
>  drivers/gpu/drm/i915/display/intel_dp.c | 9 ++++++---
>  1 file changed, 6 insertions(+), 3 deletions(-)
>=20
> diff --git a/drivers/gpu/drm/i915/display/intel_dp.c
> b/drivers/gpu/drm/i915/display/intel_dp.c
> index df402f63b741..baf21f9aa40e 100644
> --- a/drivers/gpu/drm/i915/display/intel_dp.c
> +++ b/drivers/gpu/drm/i915/display/intel_dp.c
> @@ -2420,6 +2420,8 @@ static void intel_edp_mso_mode_fixup(struct
> intel_connector *connector,  static void intel_edp_mso_init(struct intel_=
dp
> *intel_dp)  {
>  	struct drm_i915_private *i915 =3D dp_to_i915(intel_dp);
> +	struct intel_connector *connector =3D intel_dp->attached_connector;
> +	struct drm_display_info *info =3D &connector->base.display_info;
>  	u8 mso;
>=20
>  	if (intel_dp->edp_dpcd[0] < DP_EDP_14) @@ -2438,8 +2440,9 @@ static
> void intel_edp_mso_init(struct intel_dp *intel_dp)
>  	}
>=20
>  	if (mso) {
> -		drm_dbg_kms(&i915->drm, "Sink MSO %ux%u configuration\n",
> -			    mso, drm_dp_max_lane_count(intel_dp->dpcd) / mso);
> +		drm_dbg_kms(&i915->drm, "Sink MSO %ux%u configuration, pixel
> overlap %u\n",
> +			    mso, drm_dp_max_lane_count(intel_dp->dpcd) / mso,
> +			    info->mso_pixel_overlap);
>  		if (!HAS_MSO(i915)) {
>  			drm_err(&i915->drm, "No source MSO support,
> disabling\n");
>  			mso =3D 0;
> @@ -2447,7 +2450,7 @@ static void intel_edp_mso_init(struct intel_dp *int=
el_dp)
>  	}
>=20
>  	intel_dp->mso_link_count =3D mso;
> -	intel_dp->mso_pixel_overlap =3D 0; /* FIXME: read from DisplayID v2.0 *=
/
> +	intel_dp->mso_pixel_overlap =3D mso ? info->mso_pixel_overlap : 0;
>  }
>=20
>  static bool
> --
> 2.30.2

