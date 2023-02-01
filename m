Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id ADDD56866D0
	for <lists+dri-devel@lfdr.de>; Wed,  1 Feb 2023 14:26:46 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2B94A10E030;
	Wed,  1 Feb 2023 13:26:42 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from metis.ext.pengutronix.de (metis.ext.pengutronix.de
 [IPv6:2001:67c:670:201:290:27ff:fe1d:cc33])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 32F9E10E030
 for <dri-devel@lists.freedesktop.org>; Wed,  1 Feb 2023 13:26:39 +0000 (UTC)
Received: from ptz.office.stw.pengutronix.de ([2a0a:edc0:0:900:1d::77]
 helo=[IPv6:::1]) by metis.ext.pengutronix.de with esmtps
 (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256) (Exim 4.92)
 (envelope-from <l.stach@pengutronix.de>)
 id 1pND8G-0004gk-MX; Wed, 01 Feb 2023 14:26:36 +0100
Message-ID: <b3fe19c040de21da220164955fdd679f9c17d80c.camel@pengutronix.de>
Subject: Re: [PATCH v5 7/7] drm/etnaviv: add HWDB entry for
 VIPNano-QI.7120.0055
From: Lucas Stach <l.stach@pengutronix.de>
To: Tomeu Vizoso <tomeu.vizoso@collabora.com>
Date: Wed, 01 Feb 2023 14:26:34 +0100
In-Reply-To: <20221201103026.53234-8-tomeu.vizoso@collabora.com>
References: <20221201103026.53234-1-tomeu.vizoso@collabora.com>
 <20221201103026.53234-8-tomeu.vizoso@collabora.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.46.3 (3.46.3-1.fc37) 
MIME-Version: 1.0
X-SA-Exim-Connect-IP: 2a0a:edc0:0:900:1d::77
X-SA-Exim-Mail-From: l.stach@pengutronix.de
X-SA-Exim-Scanned: No (on metis.ext.pengutronix.de);
 SAEximRunCond expanded to false
X-PTX-Original-Recipient: dri-devel@lists.freedesktop.org
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
Cc: italonicola@collabora.com, "moderated list:DRM DRIVERS FOR VIVANTE GPU
 IP" <etnaviv@lists.freedesktop.org>, "open list:DRM DRIVERS FOR VIVANTE GPU
 IP" <dri-devel@lists.freedesktop.org>, open list <linux-kernel@vger.kernel.org>,
 Russell King <linux+etnaviv@armlinux.org.uk>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Tomeu,

Am Donnerstag, dem 01.12.2022 um 11:30 +0100 schrieb Tomeu Vizoso:
> This is a compute-only module marketed towards AI and vision
> acceleration. This particular version can be found on the Amlogic A311D
> SoC.
>=20
> The feature bits are taken from the Khadas downstream kernel driver
> 6.4.4.3.310723AAA.
>=20
I just noticed that you seem to have dropped the nn_core_count property
from this HWDB entry when reworking the series according to my
feedback. I assume that you are fine with me fixing this up in the
etnaviv tree by using the hunk from your previous patch "[PATCH v4 6/7]
drm/etnaviv: Add nn_core_count to chip feature struct".

If you see any issue with that, please let me know.

Regards,
Lucas

> Signed-off-by: Tomeu Vizoso <tomeu.vizoso@collabora.com>
> ---
>  drivers/gpu/drm/etnaviv/etnaviv_hwdb.c | 31 ++++++++++++++++++++++++++
>  1 file changed, 31 insertions(+)
>=20
> diff --git a/drivers/gpu/drm/etnaviv/etnaviv_hwdb.c b/drivers/gpu/drm/etn=
aviv/etnaviv_hwdb.c
> index 44df273a5aae..66b8ad6c7d26 100644
> --- a/drivers/gpu/drm/etnaviv/etnaviv_hwdb.c
> +++ b/drivers/gpu/drm/etnaviv/etnaviv_hwdb.c
> @@ -134,6 +134,37 @@ static const struct etnaviv_chip_identity etnaviv_ch=
ip_identities[] =3D {
>  		.minor_features10 =3D 0x90044250,
>  		.minor_features11 =3D 0x00000024,
>  	},
> +	{
> +		.model =3D 0x8000,
> +		.revision =3D 0x7120,
> +		.product_id =3D 0x45080009,
> +		.customer_id =3D 0x88,
> +		.eco_id =3D 0,
> +		.stream_count =3D 8,
> +		.register_max =3D 64,
> +		.thread_count =3D 256,
> +		.shader_core_count =3D 1,
> +		.vertex_cache_size =3D 16,
> +		.vertex_output_buffer_size =3D 1024,
> +		.pixel_pipes =3D 1,
> +		.instruction_count =3D 512,
> +		.num_constants =3D 320,
> +		.buffer_size =3D 0,
> +		.varyings_count =3D 16,
> +		.features =3D 0xe0287cac,
> +		.minor_features0 =3D 0xc1799eff,
> +		.minor_features1 =3D 0xfefbfadb,
> +		.minor_features2 =3D 0xeb9d6fbf,
> +		.minor_features3 =3D 0xedfffced,
> +		.minor_features4 =3D 0xd30dafc7,
> +		.minor_features5 =3D 0x7b5ac333,
> +		.minor_features6 =3D 0xfc8ee200,
> +		.minor_features7 =3D 0x03fffa6f,
> +		.minor_features8 =3D 0x00fe0ef0,
> +		.minor_features9 =3D 0x0088003c,
> +		.minor_features10 =3D 0x108048c0,
> +		.minor_features11 =3D 0x00000010,
> +	},
>  };
> =20
>  bool etnaviv_fill_identity_from_hwdb(struct etnaviv_gpu *gpu)

