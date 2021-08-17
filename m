Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 50C543EEE9D
	for <lists+dri-devel@lfdr.de>; Tue, 17 Aug 2021 16:36:15 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 670A46E1BC;
	Tue, 17 Aug 2021 14:36:13 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x429.google.com (mail-wr1-x429.google.com
 [IPv6:2a00:1450:4864:20::429])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A1C996E1BE
 for <dri-devel@lists.freedesktop.org>; Tue, 17 Aug 2021 14:36:12 +0000 (UTC)
Received: by mail-wr1-x429.google.com with SMTP id q6so17480684wrv.6
 for <dri-devel@lists.freedesktop.org>; Tue, 17 Aug 2021 07:36:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to:user-agent;
 bh=32BbilmGfCuDF7W5py1DJuk1LLN3QBDSYH1TFrCq2mY=;
 b=tMdjbJwxYEWdeWbPLcwYNALlygjm2QlQHFvwi4gCaiEMX3BJFag1ODnieOVDergbxA
 ZQisYfqm+roT57FJvJr6OqNGlq+bj/t7t2ZBwEV87/7c1VjuS5ZkiLQyp3OBO5SQamDg
 xaAgnjxxjOaPSR1LAqP4nGOeNhRqz1YuFqpspocvpbY+LIt1arW/vbuwDsyz2pJm7fYC
 l3mkiNBuwvKsm2IQkkENdCbmzZ2mbUOaelwKgKe0y6GCfwvpZm4QCETG92VmLhaqp93I
 VnqAET/LKoFGjN0CvUQoibs9YDBdGrwrla7wfeyLECd6MSH4HUFAE1NxQndZ1ZxJYnVT
 lCUg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=32BbilmGfCuDF7W5py1DJuk1LLN3QBDSYH1TFrCq2mY=;
 b=GyERwEn6HWw5t8ehZ1EBpfnbuTtEjwc56xP6b8iCKiwdwuuXnkJ5unTC8CHbFUzrvZ
 yEr0HCqr2qdRN4JX0t63bfoLHoov4Aah5gNjFR+R/e9rD6jD2RJx6FaLm1Nf9xO5Pl++
 q7vOs1PY9fL6WFliNJM0W8+9Em6ebjvzC+g06zgEWM5hEyt6kvPcdeeIBaZIqEKaKkqs
 4w9X8zdwvwBs4zueN0rghtPLM4tMQjcdMhV4fcw4/JZUjveM/ABzsAvr2Ilm1IPO86EV
 0/SHezg0cEAxkc2cN9AlR/BGkqSe/5tmVXb6o8Egwh8xkHcxK4aU7ERmsXubwkfiKldf
 4Q1g==
X-Gm-Message-State: AOAM532U6poDofZCMAD86CTXFP21q2Xj6qDREF4sLV2iFmdPvoU4v2Lh
 ypaQqkoxUhJSdnmnCkbIpJM=
X-Google-Smtp-Source: ABdhPJyn+VAp03/TboZuAJqZd2Ko2/a9yx+awX3ZxvVLZkxqHDnFSJZQtHJxiP5wf2+lwRoucixblA==
X-Received: by 2002:adf:df08:: with SMTP id y8mr4640628wrl.124.1629210971225; 
 Tue, 17 Aug 2021 07:36:11 -0700 (PDT)
Received: from localhost ([217.111.27.204])
 by smtp.gmail.com with ESMTPSA id l38sm2171675wmp.15.2021.08.17.07.36.09
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 17 Aug 2021 07:36:09 -0700 (PDT)
Date: Tue, 17 Aug 2021 16:36:08 +0200
From: Thierry Reding <thierry.reding@gmail.com>
To: Nikola Pavlica <pavlica.nikola@gmail.com>
Cc: dri-devel@lists.freedesktop.org, sam@ravnborg.org, airlied@linux.ie,
 daniel@ffwll.ch, linux-arm-kernel@lists.infradead.org,
 linux-sunxi@googlegroups.com, linux-sunxi@lists.linux.dev,
 linux-kernel@vger.kernel.org
Subject: Re: [PATCH] drm/panel-simple: Add Vivax TPC-9150 panel
Message-ID: <YRvJWKwfCWLSdroy@orome.fritz.box>
References: <20210817083201.675133-1-pavlica.nikola@gmail.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="b7dhfi5BpguSqJ8j"
Content-Disposition: inline
In-Reply-To: <20210817083201.675133-1-pavlica.nikola@gmail.com>
User-Agent: Mutt/2.1.1 (e2a89abc) (2021-07-12)
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


--b7dhfi5BpguSqJ8j
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Aug 17, 2021 at 10:32:01AM +0200, Nikola Pavlica wrote:
> The model and make of the LCD panel of the Vivax TPC-9150 is unknown,
> hence the panel settings that were retrieved with a FEX dump are named
> after the device NOT the actual panel.
>=20
> The LCD in question is a 50 pin MISO TFT LCD panel of the resolution
> 1024x600 used by the aforementioned device.
>=20
> Signed-off-by: Nikola Pavlica <pavlica.nikola@gmail.com>
> ---
>  drivers/gpu/drm/panel/panel-simple.c | 26 ++++++++++++++++++++++++++
>  1 file changed, 26 insertions(+)
>=20
> diff --git a/drivers/gpu/drm/panel/panel-simple.c b/drivers/gpu/drm/panel=
/panel-simple.c
> index 4e2dad314c79..97fc3c5740bb 100644
> --- a/drivers/gpu/drm/panel/panel-simple.c
> +++ b/drivers/gpu/drm/panel/panel-simple.c
> @@ -4090,6 +4090,29 @@ static const struct panel_desc arm_rtsm =3D {
>  	.bus_format =3D MEDIA_BUS_FMT_RGB888_1X24,
>  };
> =20
> +static const struct drm_display_mode vivax_tpc9150_panel_mode =3D {
> +	.clock =3D 60000,
> +	.hdisplay =3D 1024,
> +	.hsync_start =3D 1024 + 160,
> +	.hsync_end =3D 1024 + 160 + 100,
> +	.htotal =3D 1024 + 160 + 100 + 60,
> +	.vdisplay =3D 600,
> +	.vsync_start =3D 600 + 12,
> +	.vsync_end =3D 600 + 12 + 10,
> +	.vtotal =3D 600 + 12 + 10 + 13,
> +};
> +
> +static const struct panel_desc vivax_tpc9150_panel =3D {
> +	.modes =3D &vivax_tpc9150_panel_mode,
> +	.num_modes =3D 1,
> +	.size =3D {
> +		.width =3D 223,
> +		.height =3D 125,
> +	},
> +	.bus_format =3D MEDIA_BUS_FMT_RGB888_1X24,
> +	.bus_flags =3D DRM_BUS_FLAG_DE_HIGH,
> +};
> +

These were originally supposed to be alphabetically ordered by
compatible string, though it looks like at least the data structures for
ARM RTSM weren't properly ordered.

Perhaps you can prepend a patch correcting that order and then make sure
your patch keeps the alphabetical ordering, too?

>  static const struct of_device_id platform_of_match[] =3D {
>  	{
>  		.compatible =3D "ampire,am-1280800n3tzqw-t00h",
> @@ -4103,6 +4126,9 @@ static const struct of_device_id platform_of_match[=
] =3D {
>  	}, {
>  		.compatible =3D "arm,rtsm-display",
>  		.data =3D &arm_rtsm,
> +	}, {
> +		.compatible =3D "vivax,tpc9150-panel",
> +		.data =3D &vivax_tpc9150_panel,

Also make sure to keep the alphabetical order here.

Thierry

--b7dhfi5BpguSqJ8j
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEEiOrDCAFJzPfAjcif3SOs138+s6EFAmEbyVgACgkQ3SOs138+
s6ErjRAAmZHoChhXTJUJZc+v0XU6iXsi3V4+q299AH8/BWEzn2a/9Mi3mU0tijtV
fNV11F63jT9JDDEzBFlDfo4xPzBmYK+4yFovu7TCrbVxKRRTKKHo6hOJkNMAXMFy
Ieu8XitQe1m23AY36VnoHD57xeFAemwQqDmBL9c5tNO/MnSAtbb764IBHMESxuvV
pJQau1OJMB4oDJCoOP2u5aAWleEQoYzmkXUs2DcVrzfEZdJUHE1Svl3b0R7Onf13
XERC5CmlMId0+uJK2d/DED9aBSTvcLbwqGioZdHtGN6WSgXHAIBneYZr/F7sy+vP
GQuBlYVmq04biulqAPBESicTtwA34WH+RKuktHE12PxssYGAZfjNZTGgUZgJ+AF7
NBH+kFFtjCT+p/XYg1ComDPc6zGyYx/f5560W9NOlI7DnHKRCWSs7xKV7kfDivs+
0x2sqP9w3DpFog0RWjdtmU+UTnAYiyw57TcOFgKwa2gaBSSi3KX4D7JXn74V4Vz1
6pESNYIqqHRZyTrVE+kxw4MM8WFO1iZSX7b4j4bjXymx1td7vC1ux1GOPu32hHS+
tb+oExlrl2hPv6Ei7NTPbmesARcVGIIN5u3Zpn2vqGWcf+OJ+eRaL1DMtPG1TNHK
kFli7R0ekIbwKr9v8c2coj6YLszO5UBbd1YX3qZtK1O1axFGnWU=
=ffYx
-----END PGP SIGNATURE-----

--b7dhfi5BpguSqJ8j--
