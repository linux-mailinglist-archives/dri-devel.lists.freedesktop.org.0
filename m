Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 678F6A5DF57
	for <lists+dri-devel@lfdr.de>; Wed, 12 Mar 2025 15:45:22 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B873510E788;
	Wed, 12 Mar 2025 14:45:20 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="AZXiM0xD";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.19])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 12BD710E788;
 Wed, 12 Mar 2025 14:45:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1741790720; x=1773326720;
 h=from:to:cc:subject:in-reply-to:references:date:
 message-id:mime-version:content-transfer-encoding;
 bh=Lufukeuh6LRnyPD639AmVQn9i9r2GgSM5XCvoxMf6cE=;
 b=AZXiM0xDOIfB2GignzEFF8CcX2WKyvq6r4fsopOq9KMbYnspkAg0vUEO
 Yj932hXVOTWjc27q7OjMsjesMysETjOWB2AnQDm993nxLpSfP+8W0npsX
 iIZa9cZiGJMhEKqr0qs9kl63hHoiP4TPorN0TQ536KlUcLMQGjCZO3fQU
 3z+egG/bCoN+tl3t9y0h3tZlS9xl3LCZzfPrJz5v1VBgek9CypnAQWxWp
 xmJNgUntjpkS+g/NURWcbi89LSQFzmiXXJ/EZPUnSEIrbDlvOCMqOCjx2
 YbNC8ZwQUc1/Mgbc0Nk0J4GbDGY8+qONltxnNEXYK+53v/TrTGdurfCG1 A==;
X-CSE-ConnectionGUID: W879hhcLQI6UQZjfKZrnmw==
X-CSE-MsgGUID: H4B6sI4rT/+uttslhcKfRg==
X-IronPort-AV: E=McAfee;i="6700,10204,11371"; a="42731973"
X-IronPort-AV: E=Sophos;i="6.14,242,1736841600"; d="scan'208";a="42731973"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
 by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Mar 2025 07:45:19 -0700
X-CSE-ConnectionGUID: e/PpfSnhR42TRVhiFN0knQ==
X-CSE-MsgGUID: Yaur4mZCRxKCXbRqFkNMRQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.14,242,1736841600"; d="scan'208";a="121170262"
Received: from klitkey1-mobl1.ger.corp.intel.com (HELO localhost)
 ([10.245.246.23])
 by fmviesa010-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Mar 2025 07:45:19 -0700
From: Jani Nikula <jani.nikula@linux.intel.com>
To: Ville Syrjala <ville.syrjala@linux.intel.com>,
 dri-devel@lists.freedesktop.org
Cc: intel-gfx@lists.freedesktop.org
Subject: Re: [PATCH v2 6/8] drm/client: s/new_crtc/crtc/
In-Reply-To: <20250228211454.8138-7-ville.syrjala@linux.intel.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
References: <20250228211454.8138-1-ville.syrjala@linux.intel.com>
 <20250228211454.8138-7-ville.syrjala@linux.intel.com>
Date: Wed, 12 Mar 2025 16:45:15 +0200
Message-ID: <8734fifguc.fsf@intel.com>
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Fri, 28 Feb 2025, Ville Syrjala <ville.syrjala@linux.intel.com> wrote:
> From: Ville Syrj=C3=A4l=C3=A4 <ville.syrjala@linux.intel.com>
>
> Rename the 'new_crtc' variable to just 'crtc' in
> drm_client_firmware_config(). We don't call any of the other
> stuff in here new or old so this feels out of place.
>
> v2: Rebase
>
> Signed-off-by: Ville Syrj=C3=A4l=C3=A4 <ville.syrjala@linux.intel.com>

Reviewed-by: Jani Nikula <jani.nikula@intel.com>

> ---
>  drivers/gpu/drm/drm_client_modeset.c | 12 ++++++------
>  1 file changed, 6 insertions(+), 6 deletions(-)
>
> diff --git a/drivers/gpu/drm/drm_client_modeset.c b/drivers/gpu/drm/drm_c=
lient_modeset.c
> index 4c64535fb82c..a0caa2b229dd 100644
> --- a/drivers/gpu/drm/drm_client_modeset.c
> +++ b/drivers/gpu/drm/drm_client_modeset.c
> @@ -658,7 +658,7 @@ static bool drm_client_firmware_config(struct drm_cli=
ent_dev *client,
>  	for (i =3D 0; i < count; i++) {
>  		struct drm_connector *connector;
>  		struct drm_encoder *encoder;
> -		struct drm_crtc *new_crtc;
> +		struct drm_crtc *crtc;
>  		const char *mode_type;
>=20=20
>  		connector =3D connectors[i];
> @@ -700,7 +700,7 @@ static bool drm_client_firmware_config(struct drm_cli=
ent_dev *client,
>=20=20
>  		num_connectors_enabled++;
>=20=20
> -		new_crtc =3D connector->state->crtc;
> +		crtc =3D connector->state->crtc;
>=20=20
>  		/*
>  		 * Make sure we're not trying to drive multiple connectors
> @@ -708,7 +708,7 @@ static bool drm_client_firmware_config(struct drm_cli=
ent_dev *client,
>  		 * match the BIOS.
>  		 */
>  		for (j =3D 0; j < count; j++) {
> -			if (crtcs[j] =3D=3D new_crtc) {
> +			if (crtcs[j] =3D=3D crtc) {
>  				drm_dbg_kms(dev, "[CONNECTOR:%d:%s] fallback: cloned configuration\n=
",
>  					    connector->base.id, connector->name);
>  				goto bail;
> @@ -735,7 +735,7 @@ static bool drm_client_firmware_config(struct drm_cli=
ent_dev *client,
>  		if (!modes[i]) {
>  			mode_type =3D "current";
>  			mode_replace(dev, &modes[i],
> -				     &new_crtc->state->mode);
> +				     &crtc->state->mode);
>  		}
>=20=20
>  		/*
> @@ -748,11 +748,11 @@ static bool drm_client_firmware_config(struct drm_c=
lient_dev *client,
>  			mode_replace(dev, &modes[i],
>  				     drm_connector_fallback_non_tiled_mode(connector));
>  		}
> -		crtcs[i] =3D new_crtc;
> +		crtcs[i] =3D crtc;
>=20=20
>  		drm_dbg_kms(dev, "[CONNECTOR::%d:%s] on [CRTC:%d:%s] using %s mode: %s=
\n",
>  			    connector->base.id, connector->name,
> -			    new_crtc->base.id, new_crtc->name,
> +			    crtc->base.id, crtc->name,
>  			    mode_type, modes[i]->name);
>=20=20
>  		fallback =3D false;

--=20
Jani Nikula, Intel
