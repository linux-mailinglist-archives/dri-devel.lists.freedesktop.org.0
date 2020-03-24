Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 2FD87190CEA
	for <lists+dri-devel@lfdr.de>; Tue, 24 Mar 2020 12:59:18 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A0E4E6E137;
	Tue, 24 Mar 2020 11:59:14 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-qv1-xf43.google.com (mail-qv1-xf43.google.com
 [IPv6:2607:f8b0:4864:20::f43])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9A62F6E137
 for <dri-devel@lists.freedesktop.org>; Tue, 24 Mar 2020 11:59:13 +0000 (UTC)
Received: by mail-qv1-xf43.google.com with SMTP id v38so9012338qvf.6
 for <dri-devel@lists.freedesktop.org>; Tue, 24 Mar 2020 04:59:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to;
 bh=IzasdxRYqM7rOFN66DBG3h2VMkVrFQ3GhK1sACp5S8U=;
 b=Q5OL7hM7fhWYS7E1vvbqxwxRQU8X06B/qc/qoWD7sTquEt4AdWaJ1sJ2KH16uIw8P5
 JlylgRJqGl9LOMT+8ib1IR+jISmtrNuwj1cujpS+JjdlrGemau0YqDswan/GNG9gW4ul
 f3g8/tQJglQFuWT2C98zBaPwT/lxC5nd84FkPLpC8mlinjlf6xqdPGm30uOO29ZdCRSB
 9J7nvn2vrwACeElwn1eXKQfXZTRsIy92MHiaXyhDkOsWgowcqpYCD43Di3dQj8J5gRO6
 3CdGLfY7noTkcnXpNlnG0RQc2PLwEXZX06wRkIfiYcKJKFbRJJb5VV/j89Vw5UAS0Hrt
 JwPg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=IzasdxRYqM7rOFN66DBG3h2VMkVrFQ3GhK1sACp5S8U=;
 b=RrLii6IyZaTrgk1Gg/82+ejj1ffwmRPoKvcB2zVh1+lWrCy1Jx6wLLy6nSSwtf5HRL
 oqApV5GVV3BzHiTGmOW9OFkOsdpcBErwdvUaQJj6Nknix2iLW6TSEVHHEqjD8kHEmdSZ
 +NEBe60ibx2+jYUbALEmm04toH2OVtv8P9fVeMfP4WCLY4iAOmGbAiS4xRDJjHicmXnE
 oPk6yJZ27jFbXBR3NJnGy0TN/T3KQAnsHC/lkklvaacm7fZIFuSRnVSsCWjG9lfSvkFK
 LAtfpEEerY3uqr5CKSx2DkHxXEtTtuj6wvLuWISm9I2Vt46zmyfDJTPM9ShcawoU5FvB
 WAjQ==
X-Gm-Message-State: ANhLgQ0skir0WkYJbAWX9QnxGD4kM57I8E8tgDxjJpD24bhQMXp8xONa
 aIkVAZYn8Q3uxljEEKUq8l4=
X-Google-Smtp-Source: ADFU+vsRrRM8GomjFcPHutO/gZSvZ9pBrvIDKkaAb0+Vm+OeJtn1ews7WZEp9PklwYeqveQN1bHBCQ==
X-Received: by 2002:a0c:edca:: with SMTP id i10mr6735372qvr.130.1585051152710; 
 Tue, 24 Mar 2020 04:59:12 -0700 (PDT)
Received: from smtp.gmail.com ([2607:fea8:56a0:11a1::4])
 by smtp.gmail.com with ESMTPSA id x124sm2222237qkc.70.2020.03.24.04.59.08
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 24 Mar 2020 04:59:11 -0700 (PDT)
Date: Tue, 24 Mar 2020 07:59:05 -0400
From: Rodrigo Siqueira <rodrigosiqueiramelo@gmail.com>
To: Thomas Zimmermann <tzimmermann@suse.de>
Subject: Re: [PATCH 20/22] drm/vkms: Use simple encoder
Message-ID: <20200324115905.dp5jqzbmvhbmk2rn@smtp.gmail.com>
References: <20200305155950.2705-1-tzimmermann@suse.de>
 <20200305155950.2705-21-tzimmermann@suse.de>
MIME-Version: 1.0
In-Reply-To: <20200305155950.2705-21-tzimmermann@suse.de>
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
Cc: hamohammed.sa@gmail.com, alexandre.belloni@bootlin.com, airlied@linux.ie,
 linux@armlinux.org.uk, paul@crapouillou.net, thierry.reding@gmail.com,
 krzk@kernel.org, sam@ravnborg.org, sebastian.reichel@collabora.com,
 linux-samsung-soc@vger.kernel.org, jy0922.shim@samsung.com, hjc@rock-chips.com,
 abrodkin@synopsys.com, kong.kongxinwei@hisilicon.com, jonathanh@nvidia.com,
 xinliang.liu@linaro.org, ludovic.desroches@microchip.com, kgene@kernel.org,
 linux-imx@nxp.com, linux-rockchip@lists.infradead.org,
 virtualization@lists.linux-foundation.org, linux-tegra@vger.kernel.org,
 puck.chen@hisilicon.com, s.hauer@pengutronix.de, alison.wang@nxp.com,
 jsarha@ti.com, matthias.bgg@gmail.com, wens@csie.org, kernel@pengutronix.de,
 jernej.skrabec@siol.net, kraxel@redhat.com, tomi.valkeinen@ti.com,
 bbrezillon@kernel.org, jingoohan1@gmail.com, dri-devel@lists.freedesktop.org,
 sw0312.kim@samsung.com, nicolas.ferre@microchip.com, kyungmin.park@samsung.com,
 kieran.bingham+renesas@ideasonboard.com, zourongrong@gmail.com,
 linux-mediatek@lists.infradead.org, shawnguo@kernel.org,
 laurent.pinchart@ideasonboard.com
Content-Type: multipart/mixed; boundary="===============0440981858=="
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


--===============0440981858==
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="xyxw5g6b72ps7vfq"
Content-Disposition: inline


--xyxw5g6b72ps7vfq
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi Thomas,

First of all, thanks for your patch!

I applied all your series, compiled it, and when I tried
`make INSTALL_MOD_PATH=3D/PATH/ modules_instal` I got the following
message:

 depmod: ERROR: Cycle detected: drm_kms_helper -> drm -> drm_kms_helper
 depmod: ERROR: Found 2 modules in dependency cycles!
 make: *** [Makefile:1317: _modinst_post] Error 1

I cleaned up my local files and tried again, but I got the same error;
If I just use `drm-misc-next` everything is fine.  Did I miss something?

Thanks

On 03/05, Thomas Zimmermann wrote:
> The vkms driver uses an empty implementation for its encoder. Replace
> the code with the generic simple encoder.
>=20
> Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
> ---
>  drivers/gpu/drm/vkms/vkms_output.c | 8 ++------
>  1 file changed, 2 insertions(+), 6 deletions(-)
>=20
> diff --git a/drivers/gpu/drm/vkms/vkms_output.c b/drivers/gpu/drm/vkms/vk=
ms_output.c
> index fb1941a6522c..85afb77e97f0 100644
> --- a/drivers/gpu/drm/vkms/vkms_output.c
> +++ b/drivers/gpu/drm/vkms/vkms_output.c
> @@ -3,6 +3,7 @@
>  #include "vkms_drv.h"
>  #include <drm/drm_atomic_helper.h>
>  #include <drm/drm_probe_helper.h>
> +#include <drm/drm_simple_kms_helper.h>
> =20
>  static void vkms_connector_destroy(struct drm_connector *connector)
>  {
> @@ -17,10 +18,6 @@ static const struct drm_connector_funcs vkms_connector=
_funcs =3D {
>  	.atomic_destroy_state =3D drm_atomic_helper_connector_destroy_state,
>  };
> =20
> -static const struct drm_encoder_funcs vkms_encoder_funcs =3D {
> -	.destroy =3D drm_encoder_cleanup,
> -};
> -
>  static int vkms_conn_get_modes(struct drm_connector *connector)
>  {
>  	int count;
> @@ -70,8 +67,7 @@ int vkms_output_init(struct vkms_device *vkmsdev, int i=
ndex)
> =20
>  	drm_connector_helper_add(connector, &vkms_conn_helper_funcs);
> =20
> -	ret =3D drm_encoder_init(dev, encoder, &vkms_encoder_funcs,
> -			       DRM_MODE_ENCODER_VIRTUAL, NULL);
> +	ret =3D drm_simple_encoder_init(dev, encoder, DRM_MODE_ENCODER_VIRTUAL);
>  	if (ret) {
>  		DRM_ERROR("Failed to init encoder\n");
>  		goto err_encoder;
> --=20
> 2.25.1
>=20

--=20
Rodrigo Siqueira
https://siqueira.tech

--xyxw5g6b72ps7vfq
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEE4tZ+ii1mjMCMQbfkWJzP/comvP8FAl559gMACgkQWJzP/com
vP9BEQ//bENFpSJc2y0XTYIOh3A9lmWbJYMBLW1j5T3uUJJu8x0lC0hqd0fJW3V8
iT1Pedxmmf7duluAn7uKjUQ1sPztm2PcJB8F9ADs+bJdKN2CqmsL3kB4Ip1Q+US7
t7cptBTF6FrLPo4e1WpZAEEu4UdyVsq16+0v3+8icC0YSX6KMQdI9QNvvp/5PmXF
xYc6wwyGGqNZhmVRyLu0Im+zG5TvscTmK3iIu1BOMEubsgZD/BP8ZSx0efQJKRhA
aPhzGs8S7Sp+EnE4wiTU6iZch3+KUw6D0lc398rdlvbZXmvxSxe8WxCwciMksgu5
c+A/+oJ80KIhkjWCQNpF5oddWXUUqy6yHZrzIWzkPAj9oVxQa0jr7EwAkT1h+Zp1
wUDLrQw9ZRw/GHv6awiSFDukLpHIabDgN9F0fsvx9aa/PJ53FOR6hilCOn8tIVnJ
oZabUjqa7pV3L8N5CFott+8EV2y4GZK5R+VW6MX8px2bfa7SaJl+9HgeKssOYOkF
6cwm+IquaD3wz9h7elWGmEQgqj3jOviny3HT7I8U+ZlmMa6+JCMt4iq5e1R9q4du
PP4mh695VhSas/mbB3qjZFy/FCj1bvJ8J6AdHOoNDmjM4JVv9F5S5yi3UN5uEBXC
ZtKmSxghh2GJS2LFK6b88yxVNVNYrCX6bYWSyfovToU6C0QzbKs=
=srDw
-----END PGP SIGNATURE-----

--xyxw5g6b72ps7vfq--

--===============0440981858==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel

--===============0440981858==--
