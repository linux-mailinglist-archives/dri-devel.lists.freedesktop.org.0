Return-Path: <dri-devel-bounces@lists.freedesktop.org>
Delivered-To: lists+dri-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id SOTELOPKnmnEXQQAu9opvQ
	(envelope-from <dri-devel-bounces@lists.freedesktop.org>)
	for <lists+dri-devel@lfdr.de>; Wed, 25 Feb 2026 11:11:47 +0100
X-Original-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 2149D1958D6
	for <lists+dri-devel@lfdr.de>; Wed, 25 Feb 2026 11:11:47 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id ADC6010E357;
	Wed, 25 Feb 2026 10:11:44 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="Zj+lvS5Y";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from sea.source.kernel.org (sea.source.kernel.org [172.234.252.31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B903B10E229
 for <dri-devel@lists.freedesktop.org>; Wed, 25 Feb 2026 10:11:42 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sea.source.kernel.org (Postfix) with ESMTP id 630574364F;
 Wed, 25 Feb 2026 10:11:42 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id BAC4FC116D0;
 Wed, 25 Feb 2026 10:11:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1772014302;
 bh=Jbx5GGqMd2E6b2ZjyMeLVTjfKScq4nrq/KUgU6bjUCE=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=Zj+lvS5Y+00B0Fj39FquAhjKWkqYbaE61U5/IZSPgWXnFy7HiTa3uNnHHywfXCP8m
 ixEh6FTZMIzZXbi5LnrTB+qkHDX3tiYenX448XirD+t5O535TDh0kYtq2pdREcWGAe
 p031f9LHV2sgmnUsZjxPAeApzfhnt8edwyY4Fxbm/SefYnwpI8ghT27Id8RcGsJ5Rs
 XlMqcvBZ9/C34H9mpDxdKvByxWeLaOMZc32AAbzZDHQzcW99puYbWHlpGyOJft1kX0
 BO3pkbBDmpevoh2IgkpH3P6JpqKk4QsF2uJfm/22ZdtB0x9+9g7aWVQlPfEB2N6eej
 qKZd3CY/NOxog==
Date: Wed, 25 Feb 2026 11:11:39 +0100
From: Maxime Ripard <mripard@kernel.org>
To: Erick Karanja <karanja99erick@gmail.com>
Cc: Andrzej Hajda <andrzej.hajda@intel.com>, 
 Neil Armstrong <neil.armstrong@linaro.org>, Robert Foss <rfoss@kernel.org>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Thomas Zimmermann <tzimmermann@suse.de>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Jonas Karlman <jonas@kwiboo.se>, 
 Jernej Skrabec <jernej.skrabec@gmail.com>, Liu Ying <victor.liu@nxp.com>, 
 Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
 Luca Ceresoli <luca.ceresoli@bootlin.com>, 
 Shengjiu Wang <shengjiu.wang@nxp.com>, Andy Yan <andy.yan@rock-chips.com>, 
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH RFT] drm/bridge: dw-hdmi: Replace calls to deprecated
 HDMI/audio detection functions
Message-ID: <20260225-lush-dexterous-chimpanzee-ebdb6a@houat>
References: <20260225093051.12031-1-karanja99erick@gmail.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha384;
 protocol="application/pgp-signature"; boundary="ljelcul7uze7np3h"
Content-Disposition: inline
In-Reply-To: <20260225093051.12031-1-karanja99erick@gmail.com>
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
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-1.41 / 15.00];
	SIGNED_PGP(-2.00)[];
	SUSPICIOUS_RECIPS(1.50)[];
	MID_RHS_NOT_FQDN(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	MAILLIST(-0.20)[mailman];
	R_SPF_ALLOW(-0.20)[+ip4:131.252.210.177:c];
	MIME_GOOD(-0.20)[multipart/signed,text/plain];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	RWL_MAILSPIKE_GOOD(-0.10)[131.252.210.177:from];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_RECIPIENTS(0.00)[m:karanja99erick@gmail.com,m:andrzej.hajda@intel.com,m:neil.armstrong@linaro.org,m:rfoss@kernel.org,m:maarten.lankhorst@linux.intel.com,m:tzimmermann@suse.de,m:airlied@gmail.com,m:simona@ffwll.ch,m:Laurent.pinchart@ideasonboard.com,m:jonas@kwiboo.se,m:jernej.skrabec@gmail.com,m:victor.liu@nxp.com,m:dmitry.baryshkov@oss.qualcomm.com,m:luca.ceresoli@bootlin.com,m:shengjiu.wang@nxp.com,m:andy.yan@rock-chips.com,m:linux-kernel@vger.kernel.org,m:jernejskrabec@gmail.com,s:lists@lfdr.de];
	RCVD_COUNT_THREE(0.00)[4];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER(0.00)[mripard@kernel.org,dri-devel-bounces@lists.freedesktop.org];
	ARC_NA(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[18];
	FREEMAIL_TO(0.00)[gmail.com];
	MIME_TRACE(0.00)[0:+,1:+,2:~];
	FORWARDED(0.00)[dri-devel@lists.freedesktop.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[kernel.org:+];
	TO_DN_SOME(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[dri-devel@lists.freedesktop.org];
	NEURAL_HAM(-0.00)[-0.999];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_HAS_DN(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[mripard@kernel.org,dri-devel-bounces@lists.freedesktop.org];
	FREEMAIL_CC(0.00)[intel.com,linaro.org,kernel.org,linux.intel.com,suse.de,gmail.com,ffwll.ch,ideasonboard.com,kwiboo.se,nxp.com,oss.qualcomm.com,bootlin.com,rock-chips.com,lists.freedesktop.org,vger.kernel.org];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TAGGED_RCPT(0.00)[dri-devel];
	MISSING_XM_UA(0.00)[];
	ASN(0.00)[asn:6366, ipnet:131.252.0.0/16, country:US];
	DBL_BLOCKED_OPENRESOLVER(0.00)[gabe.freedesktop.org:helo,gabe.freedesktop.org:rdns]
X-Rspamd-Queue-Id: 2149D1958D6
X-Rspamd-Action: no action


--ljelcul7uze7np3h
Content-Type: text/plain; protected-headers=v1; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
Subject: Re: [PATCH RFT] drm/bridge: dw-hdmi: Replace calls to deprecated
 HDMI/audio detection functions
MIME-Version: 1.0

Hi,

On Wed, Feb 25, 2026 at 12:30:50PM +0300, Erick Karanja wrote:
> Replace calls to the deprecated drm_detect_hdmi_monitor() and
> drm_detect_monitor_audio() functions. Calling drm_edid_connector_update()
> updates connector->display_info.is_hdmi and connector->display_info.has_a=
udio.
> The driver should read these fields from connector->display_info instead =
of
> calling the deprecated functions directly.
>=20
> Signed-off-by: Erick Karanja <karanja99erick@gmail.com>
> ---
>  drivers/gpu/drm/bridge/synopsys/dw-hdmi.c | 17 +++--------------
>  1 file changed, 3 insertions(+), 14 deletions(-)
>=20
> diff --git a/drivers/gpu/drm/bridge/synopsys/dw-hdmi.c b/drivers/gpu/drm/=
bridge/synopsys/dw-hdmi.c
> index 3b77e73ac0ea..ddc4ae40d94e 100644
> --- a/drivers/gpu/drm/bridge/synopsys/dw-hdmi.c
> +++ b/drivers/gpu/drm/bridge/synopsys/dw-hdmi.c
> @@ -2472,7 +2472,6 @@ static const struct drm_edid *dw_hdmi_edid_read(str=
uct dw_hdmi *hdmi,
>  						struct drm_connector *connector)
>  {
>  	const struct drm_edid *drm_edid;
> -	const struct edid *edid;
> =20
>  	if (!hdmi->ddc)
>  		return NULL;
> @@ -2482,19 +2481,9 @@ static const struct drm_edid *dw_hdmi_edid_read(st=
ruct dw_hdmi *hdmi,
>  		dev_dbg(hdmi->dev, "failed to get edid\n");
>  		return NULL;
>  	}
> -
> -	/*
> -	 * FIXME: This should use connector->display_info.is_hdmi and
> -	 * connector->display_info.has_audio from a path that has read the EDID
> -	 * and called drm_edid_connector_update().
> -	 */
> -	edid =3D drm_edid_raw(drm_edid);
> -
> -	dev_dbg(hdmi->dev, "got edid: width[%d] x height[%d]\n",
> -		edid->width_cm, edid->height_cm);
> -
> -	hdmi->sink_is_hdmi =3D drm_detect_hdmi_monitor(edid);
> -	hdmi->sink_has_audio =3D drm_detect_monitor_audio(edid);
> +	drm_edid_connector_update(connector, drm_edid);
> +	hdmi->sink_is_hdmi =3D connector->display_info.is_hdmi;
> +	hdmi->sink_has_audio =3D connector->display_info.has_audio;

You should get rid of sink_is_hdmi and sink_has_audio, and you'll don't
need to call any function anymore, deprecated or otherwise.

Maxime

--ljelcul7uze7np3h
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iJUEABMJAB0WIQTkHFbLp4ejekA/qfgnX84Zoj2+dgUCaZ7K2gAKCRAnX84Zoj2+
djCvAXwJZPj4Z8NxSM3hG7+lpMa/QXpPdPtrtr9WZ8bpKzUDAEOxzaP2FughL6ZA
VFy8FfMBgNj8KNyWFKlN56axzc0sQga2XyqZ8bEfqRZmjjluie/Fm0kZBM26CsYG
GDzFG3mCFA==
=RjVs
-----END PGP SIGNATURE-----

--ljelcul7uze7np3h--
