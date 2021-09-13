Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id C6A894084A6
	for <lists+dri-devel@lfdr.de>; Mon, 13 Sep 2021 08:25:00 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 00D9F89FD7;
	Mon, 13 Sep 2021 06:24:58 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EA52B89FE3;
 Mon, 13 Sep 2021 06:24:55 +0000 (UTC)
X-IronPort-AV: E=McAfee;i="6200,9189,10105"; a="221627923"
X-IronPort-AV: E=Sophos;i="5.85,288,1624345200"; d="scan'208";a="221627923"
Received: from fmsmga006.fm.intel.com ([10.253.24.20])
 by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Sep 2021 23:24:55 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.85,288,1624345200"; d="scan'208";a="696541805"
Received: from irsmsx605.ger.corp.intel.com ([163.33.146.138])
 by fmsmga006.fm.intel.com with ESMTP; 12 Sep 2021 23:24:45 -0700
Received: from bgsmsx604.gar.corp.intel.com (10.67.234.6) by
 IRSMSX605.ger.corp.intel.com (163.33.146.138) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2242.12; Mon, 13 Sep 2021 07:24:43 +0100
Received: from bgsmsx604.gar.corp.intel.com ([10.67.234.6]) by
 BGSMSX604.gar.corp.intel.com ([10.67.234.6]) with mapi id 15.01.2242.012;
 Mon, 13 Sep 2021 11:54:42 +0530
From: "Shankar, Uma" <uma.shankar@intel.com>
To: "Nikula, Jani" <jani.nikula@intel.com>, "intel-gfx@lists.freedesktop.org"
 <intel-gfx@lists.freedesktop.org>
CC: "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 "ville.syrjala@linux.intel.com" <ville.syrjala@linux.intel.com>, "Nikula,
 Jani" <jani.nikula@intel.com>
Subject: RE: [Intel-gfx] [PATCH v2 5/6] drm/i915/edp: postpone MSO init until
 after EDID read
Thread-Topic: [Intel-gfx] [PATCH v2 5/6] drm/i915/edp: postpone MSO init until
 after EDID read
Thread-Index: AQHXnnMOgaHoCccHdk6FUbLUUi720quhkxWA
Date: Mon, 13 Sep 2021 06:24:42 +0000
Message-ID: <36cfcb3765d8402798b96c60e20fcc91@intel.com>
References: <cover.1630419362.git.jani.nikula@intel.com>
 <7a360fca01be0f971337b3635f4e4752922ffebe.1630419362.git.jani.nikula@intel.com>
In-Reply-To: <7a360fca01be0f971337b3635f4e4752922ffebe.1630419362.git.jani.nikula@intel.com>
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
> Subject: [Intel-gfx] [PATCH v2 5/6] drm/i915/edp: postpone MSO init until=
 after EDID
> read
>=20
> MSO will require segment pixel overlap information from the EDID. Postpon=
e MSO
> init until after we've read and cached the EDID.
>=20

Looks ok to me.
Reviewed-by: Uma Shankar <uma.shankar@intel.com>

> Signed-off-by: Jani Nikula <jani.nikula@intel.com>
> ---
>  drivers/gpu/drm/i915/display/intel_dp.c | 5 +++--
>  1 file changed, 3 insertions(+), 2 deletions(-)
>=20
> diff --git a/drivers/gpu/drm/i915/display/intel_dp.c
> b/drivers/gpu/drm/i915/display/intel_dp.c
> index 64e8151d13a4..df402f63b741 100644
> --- a/drivers/gpu/drm/i915/display/intel_dp.c
> +++ b/drivers/gpu/drm/i915/display/intel_dp.c
> @@ -2536,8 +2536,6 @@ intel_edp_init_dpcd(struct intel_dp *intel_dp)
>  	 */
>  	intel_edp_init_source_oui(intel_dp, true);
>=20
> -	intel_edp_mso_init(intel_dp);
> -
>  	return true;
>  }
>=20
> @@ -4804,6 +4802,9 @@ static bool intel_edp_init_connector(struct intel_d=
p
> *intel_dp,
>  	if (fixed_mode)
>  		downclock_mode =3D intel_drrs_init(intel_connector, fixed_mode);
>=20
> +	/* MSO requires information from the EDID */
> +	intel_edp_mso_init(intel_dp);
> +
>  	/* multiply the mode clock and horizontal timings for MSO */
>  	intel_edp_mso_mode_fixup(intel_connector, fixed_mode);
>  	intel_edp_mso_mode_fixup(intel_connector, downclock_mode);
> --
> 2.30.2

