Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 26FD0A54C5F
	for <lists+dri-devel@lfdr.de>; Thu,  6 Mar 2025 14:39:46 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6D4B610E9C2;
	Thu,  6 Mar 2025 13:39:44 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="YKaRavb/";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EC2D610E9A1
 for <dri-devel@lists.freedesktop.org>; Thu,  6 Mar 2025 13:39:42 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by dfw.source.kernel.org (Postfix) with ESMTP id 9043E5C554D;
 Thu,  6 Mar 2025 13:37:25 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B444EC4CEE0;
 Thu,  6 Mar 2025 13:39:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1741268382;
 bh=K4/hdpIbFx69y1y3Wf2LESaK6c/oxn9gWD5a5He+I8U=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=YKaRavb/SpAjmOjWhoPgTIY1DTOJttwkomTHRyGcQzPo1DwZyZ/lmgroIdWggiLzT
 cm0lLk0Zsc5/rt0qrGcmMOwM/Dw01NzO8mz+JsuyFF3geFAy+19qjlpFPvEzI1evSz
 ZtUqoK15oVBuBJ/hXq+KsOONzZpYwGBpRK2Hd/oetkWK+2Gv6Ad/8ylc8nNXMFfzBc
 WqrgI9YK+jm0sPHB/eXs75C00tI503hUTd7lbwxqPM9Ibt5DkLv1yOyDuMumnRUbCb
 fjK4qTn+y+4Tei/0hcYUfFco5FiwOCHXr1uswDntDzubaNe4Xk7Makqu4vGgFj5/dp
 Hp25XezeSLfsw==
Date: Thu, 6 Mar 2025 14:39:39 +0100
From: Maxime Ripard <mripard@kernel.org>
To: Stefan Wahren <wahrenst@gmx.net>
Cc: Dave Stevenson <dave.stevenson@raspberrypi.com>, 
 =?utf-8?B?TWHDrXJh?= Canal <mcanal@igalia.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Thomas Zimmermann <tzimmermann@suse.de>,
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>, 
 David Turner <david.turner@raspberrypi.com>, David Airlie <airlied@gmail.com>, 
 Simona Vetter <simona@ffwll.ch>, dri-devel@lists.freedesktop.org,
 kernel-list@raspberrypi.com, linux-sound@vger.kernel.org
Subject: Re: [PATCH V2 2/2] drm/vc4: hdmi: Add jack detection to HDMI audio
 driver
Message-ID: <20250306-delectable-quixotic-polecat-ecd2c3@houat>
References: <20250304193912.5696-1-wahrenst@gmx.net>
 <20250304193912.5696-3-wahrenst@gmx.net>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha384;
 protocol="application/pgp-signature"; boundary="yd3xbr2u6o4hpj7d"
Content-Disposition: inline
In-Reply-To: <20250304193912.5696-3-wahrenst@gmx.net>
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


--yd3xbr2u6o4hpj7d
Content-Type: text/plain; protected-headers=v1; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
Subject: Re: [PATCH V2 2/2] drm/vc4: hdmi: Add jack detection to HDMI audio
 driver
MIME-Version: 1.0

Hi,

On Tue, Mar 04, 2025 at 08:39:12PM +0100, Stefan Wahren wrote:
> From: David Turner <david.turner@raspberrypi.com>
>=20
> Add ALSA jack detection to the vc4-hdmi audio driver so userspace knows
> when to add/remove HDMI audio devices.
>=20
> Signed-off-by: David Turner <david.turner@raspberrypi.com>
> Signed-off-by: Stefan Wahren <wahrenst@gmx.net>
> ---
>  drivers/gpu/drm/vc4/vc4_hdmi.c | 18 ++++++++++++++++++
>  drivers/gpu/drm/vc4/vc4_hdmi.h |  7 +++++++
>  2 files changed, 25 insertions(+)
>=20
> diff --git a/drivers/gpu/drm/vc4/vc4_hdmi.c b/drivers/gpu/drm/vc4/vc4_hdm=
i.c
> index e4b027616d04..f46a135568b2 100644
> --- a/drivers/gpu/drm/vc4/vc4_hdmi.c
> +++ b/drivers/gpu/drm/vc4/vc4_hdmi.c
> @@ -51,6 +51,7 @@
>  #include <linux/reset.h>
>  #include <sound/dmaengine_pcm.h>
>  #include <sound/hdmi-codec.h>
> +#include <sound/jack.h>
>  #include <sound/pcm_drm_eld.h>
>  #include <sound/pcm_params.h>
>  #include <sound/soc.h>
> @@ -2203,6 +2204,22 @@ static const struct drm_connector_hdmi_audio_funcs=
 vc4_hdmi_audio_funcs =3D {
>  	.shutdown =3D vc4_hdmi_audio_shutdown,
>  };
>=20
> +static int vc4_hdmi_codec_init(struct snd_soc_pcm_runtime *rtd)
> +{
> +	struct vc4_hdmi *vc4_hdmi =3D snd_soc_card_get_drvdata(rtd->card);
> +	struct snd_soc_component *component =3D snd_soc_rtd_to_codec(rtd, 0)->c=
omponent;
> +	int ret;
> +
> +	ret =3D snd_soc_card_jack_new(rtd->card, "HDMI Jack", SND_JACK_LINEOUT,
> +				    &vc4_hdmi->hdmi_jack);
> +	if (ret) {
> +		dev_err(rtd->dev, "HDMI Jack creation failed: %d\n", ret);
> +		return ret;
> +	}
> +
> +	return snd_soc_component_set_jack(component, &vc4_hdmi->hdmi_jack, NULL=
);
> +}
> +
>  static int vc4_hdmi_audio_init(struct vc4_hdmi *vc4_hdmi)
>  {
>  	const struct vc4_hdmi_register *mai_data =3D
> @@ -2316,6 +2333,7 @@ static int vc4_hdmi_audio_init(struct vc4_hdmi *vc4=
_hdmi)
>  	dai_link->cpus->dai_name =3D dev_name(dev);
>  	dai_link->codecs->name =3D dev_name(&vc4_hdmi->connector.hdmi_audio.cod=
ec_pdev->dev);
>  	dai_link->platforms->name =3D dev_name(dev);
> +	dai_link->init =3D vc4_hdmi_codec_init;
>=20
>  	card->dai_link =3D dai_link;
>  	card->num_links =3D 1;
> diff --git a/drivers/gpu/drm/vc4/vc4_hdmi.h b/drivers/gpu/drm/vc4/vc4_hdm=
i.h
> index e3d989ca302b..a31157c99bee 100644
> --- a/drivers/gpu/drm/vc4/vc4_hdmi.h
> +++ b/drivers/gpu/drm/vc4/vc4_hdmi.h
> @@ -4,6 +4,7 @@
>  #include <drm/drm_connector.h>
>  #include <media/cec.h>
>  #include <sound/dmaengine_pcm.h>
> +#include <sound/hdmi-codec.h>
>  #include <sound/soc.h>
>=20
>  #include "vc4_drv.h"
> @@ -211,6 +212,12 @@ struct vc4_hdmi {
>  	 * KMS hooks. Protected by @mutex.
>  	 */
>  	enum hdmi_colorspace output_format;
> +
> +	/**
> +	 * @hdmi_jack: Represents the connection state of the HDMI plug, for
> +	 * ALSA jack detection.
> +	 */
> +	struct snd_soc_jack hdmi_jack;
>  };

It looks fairly generic to me. Is there any reason you didn't put it in
the HDMI audio helpers?

Maxime

--yd3xbr2u6o4hpj7d
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iJUEABMJAB0WIQTkHFbLp4ejekA/qfgnX84Zoj2+dgUCZ8mlmgAKCRAnX84Zoj2+
djILAYD9MIVZXZkwRijRi9h6Dp09bqeXFxhF0uWvsICO7hrd8ID2mmBH8OM+bJX/
kyjl6Y8BgPf5YOcAvKKNhxJsj1nonq5aqW+ghdR8OXW+uIPxZjh03zfATDJuQFvF
3hANSZCiOQ==
=iwPG
-----END PGP SIGNATURE-----

--yd3xbr2u6o4hpj7d--
