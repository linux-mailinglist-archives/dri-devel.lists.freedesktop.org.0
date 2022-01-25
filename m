Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 59F1049ACD3
	for <lists+dri-devel@lfdr.de>; Tue, 25 Jan 2022 08:02:26 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id ABEEC10ECCC;
	Tue, 25 Jan 2022 07:02:21 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E009F10ECCC;
 Tue, 25 Jan 2022 07:02:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1643094140; x=1674630140;
 h=from:to:cc:subject:in-reply-to:references:date:
 message-id:mime-version:content-transfer-encoding;
 bh=yGV7YtKAgiBGeCNiwRFnIigFHqGr5li2VVz16Ut0GkA=;
 b=YtmTeL0sd9BQ/kwE/4B0IVEaHauMpwjwi2HmzYJkRJtln1jVil/mT8t+
 YZlrFYpTXLqUBtjA+jqeX6Yo7yZdlwg+5DCOsN8Qtun/QRkRneZ8bBihe
 nFiSMlwXvWYCTPgk8541gKxtJ+1fVZ2YER2zlp5y1Oz7pW4AaFdwqomwU
 v2auTLQnWDpIkKm3d51OjaTbyvEMuS8D/zFfd2zHH3Zu+No7QV8uEpbWI
 qyZcXgLwPCwO7fDybGrSl4baa1SNPy4DEtQTV8lvjIi1QJpJyXaQQLn6j
 4BpZeoPPmTaM4YU/vTaMO3aCW2a/vIK7Q630p/GPPVsaI3EZHOf8tGEHJ Q==;
X-IronPort-AV: E=McAfee;i="6200,9189,10237"; a="270681078"
X-IronPort-AV: E=Sophos;i="5.88,314,1635231600"; d="scan'208";a="270681078"
Received: from orsmga008.jf.intel.com ([10.7.209.65])
 by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 24 Jan 2022 23:02:19 -0800
X-IronPort-AV: E=Sophos;i="5.88,314,1635231600"; d="scan'208";a="534599476"
Received: from skirillo-mobl1.ccr.corp.intel.com (HELO localhost)
 ([10.252.32.77])
 by orsmga008-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 24 Jan 2022 23:02:15 -0800
From: Jani Nikula <jani.nikula@linux.intel.com>
To: Yaroslav Bolyukin <iam@lach.pw>, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org
Subject: Re: [PATCH v2] drm/edid: Support type 7 timings
In-Reply-To: <20220123191955.57994-1-iam@lach.pw>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
References: <20220118215956.17229-1-iam@lach.pw>
 <20220123191955.57994-1-iam@lach.pw>
Date: Tue, 25 Jan 2022 09:02:00 +0200
Message-ID: <87lez41eon.fsf@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
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
Cc: David Airlie <airlied@linux.ie>, intel-gfx@lists.freedesktop.org,
 Thomas Zimmermann <tzimmermann@suse.de>, Yaroslav Bolyukin <iam@lach.pw>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Sun, 23 Jan 2022, Yaroslav Bolyukin <iam@lach.pw> wrote:
> Per VESA DisplayID Standard v2.0: Type VII Timing =E2=80=93 Detailed Timi=
ng Data
>
> Definitions were already provided as type I, but not used
>
> Signed-off-by: Yaroslav Bolyukin <iam@lach.pw>

Reviewed-by: Jani Nikula <jani.nikula@intel.com>

> ---
>  drivers/gpu/drm/drm_edid.c | 12 ++++++++----
>  1 file changed, 8 insertions(+), 4 deletions(-)
>
> diff --git a/drivers/gpu/drm/drm_edid.c b/drivers/gpu/drm/drm_edid.c
> index 12893e7be..5f2ae5bfa 100644
> --- a/drivers/gpu/drm/drm_edid.c
> +++ b/drivers/gpu/drm/drm_edid.c
> @@ -5405,7 +5405,8 @@ u32 drm_add_display_info(struct drm_connector *conn=
ector, const struct edid *edi
>  }
>=20=20
>  static struct drm_display_mode *drm_mode_displayid_detailed(struct drm_d=
evice *dev,
> -							    struct displayid_detailed_timings_1 *timings)
> +							    struct displayid_detailed_timings_1 *timings,
> +							    bool type_7)
>  {
>  	struct drm_display_mode *mode;
>  	unsigned pixel_clock =3D (timings->pixel_clock[0] |
> @@ -5426,7 +5427,8 @@ static struct drm_display_mode *drm_mode_displayid_=
detailed(struct drm_device *d
>  	if (!mode)
>  		return NULL;
>=20=20
> -	mode->clock =3D pixel_clock * 10;
> +	/* resolution is kHz for type VII, and 10 kHz for type I */
> +	mode->clock =3D type_7 ? pixel_clock : pixel_clock * 10;
>  	mode->hdisplay =3D hactive;
>  	mode->hsync_start =3D mode->hdisplay + hsync;
>  	mode->hsync_end =3D mode->hsync_start + hsync_width;
> @@ -5457,6 +5459,7 @@ static int add_displayid_detailed_1_modes(struct dr=
m_connector *connector,
>  	int num_timings;
>  	struct drm_display_mode *newmode;
>  	int num_modes =3D 0;
> +	bool type_7 =3D block->tag =3D=3D DATA_BLOCK_2_TYPE_7_DETAILED_TIMING;
>  	/* blocks must be multiple of 20 bytes length */
>  	if (block->num_bytes % 20)
>  		return 0;
> @@ -5465,7 +5468,7 @@ static int add_displayid_detailed_1_modes(struct dr=
m_connector *connector,
>  	for (i =3D 0; i < num_timings; i++) {
>  		struct displayid_detailed_timings_1 *timings =3D &det->timings[i];
>=20=20
> -		newmode =3D drm_mode_displayid_detailed(connector->dev, timings);
> +		newmode =3D drm_mode_displayid_detailed(connector->dev, timings, type_=
7);
>  		if (!newmode)
>  			continue;
>=20=20
> @@ -5484,7 +5487,8 @@ static int add_displayid_detailed_modes(struct drm_=
connector *connector,
>=20=20
>  	displayid_iter_edid_begin(edid, &iter);
>  	displayid_iter_for_each(block, &iter) {
> -		if (block->tag =3D=3D DATA_BLOCK_TYPE_1_DETAILED_TIMING)
> +		if (block->tag =3D=3D DATA_BLOCK_TYPE_1_DETAILED_TIMING ||
> +		    block->tag =3D=3D DATA_BLOCK_2_TYPE_7_DETAILED_TIMING)
>  			num_modes +=3D add_displayid_detailed_1_modes(connector, block);
>  	}
>  	displayid_iter_end(&iter);
>
> base-commit: 99613159ad749543621da8238acf1a122880144e

--=20
Jani Nikula, Intel Open Source Graphics Center
