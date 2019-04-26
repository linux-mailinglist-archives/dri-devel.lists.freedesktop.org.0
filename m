Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 8638EDCD5
	for <lists+dri-devel@lfdr.de>; Mon, 29 Apr 2019 09:28:57 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A1C24891FB;
	Mon, 29 Apr 2019 07:28:46 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-out.m-online.net (mail-out.m-online.net [212.18.0.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7120D8925E
 for <dri-devel@lists.freedesktop.org>; Fri, 26 Apr 2019 12:29:44 +0000 (UTC)
Received: from frontend01.mail.m-online.net (unknown [192.168.8.182])
 by mail-out.m-online.net (Postfix) with ESMTP id 44rCzq1gvXz1rKJ2;
 Fri, 26 Apr 2019 14:29:43 +0200 (CEST)
Received: from localhost (dynscan1.mnet-online.de [192.168.6.70])
 by mail.m-online.net (Postfix) with ESMTP id 44rCzq0srYz1rgsF;
 Fri, 26 Apr 2019 14:29:43 +0200 (CEST)
X-Virus-Scanned: amavisd-new at mnet-online.de
Received: from mail.mnet-online.de ([192.168.8.182])
 by localhost (dynscan1.mail.m-online.net [192.168.6.70]) (amavisd-new,
 port 10024)
 with ESMTP id EtPR8mg4naQ2; Fri, 26 Apr 2019 14:29:41 +0200 (CEST)
X-Auth-Info: JR378xyCFvFZaeEMpWgbV8eHb06VDJFHGkEy9u1zg+s=
Received: from jawa (85-222-111-42.dynamic.chello.pl [85.222.111.42])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.mnet-online.de (Postfix) with ESMTPSA;
 Fri, 26 Apr 2019 14:29:41 +0200 (CEST)
Date: Fri, 26 Apr 2019 14:29:40 +0200
From: Lukasz Majewski <lukma@denx.de>
To: Daniel Vetter <daniel@ffwll.ch>, Rob Herring <robh+dt@kernel.org>, Mark
 Rutland <mark.rutland@arm.com>, Thierry Reding <thierry.reding@gmail.com>,
 David Airlie <airlied@linux.ie>
Subject: Re: [PATCH v3 2/2] drm/panel: simple: Add KOE tx14d24vm1bpa display
 support (320x240)
Message-ID: <20190426142940.12a13690@jawa>
In-Reply-To: <20190404112243.9473-2-lukma@denx.de>
References: <20180412143715.6828-1-lukma@denx.de>
 <20190404112243.9473-1-lukma@denx.de>
 <20190404112243.9473-2-lukma@denx.de>
Organization: denx.de
X-Mailer: Claws Mail 3.17.3 (GTK+ 2.24.31; x86_64-pc-linux-gnu)
MIME-Version: 1.0
X-Mailman-Approved-At: Mon, 29 Apr 2019 07:28:44 +0000
X-BeenThere: dri-devel@lists.freedesktop.org
X-Mailman-Version: 2.1.23
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
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org
Content-Type: multipart/mixed; boundary="===============1181163546=="
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

--===============1181163546==
Content-Type: multipart/signed; micalg=pgp-sha256;
 boundary="Sig_/cM3I7ZjyncRKGK2qJPxypAS"; protocol="application/pgp-signature"

--Sig_/cM3I7ZjyncRKGK2qJPxypAS
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Dear All,

> This commit adds support for KOE's 5.7" display.
>=20
> Signed-off-by: Lukasz Majewski <lukma@denx.de>
> Reviewed-by: Rob Herring <robh@kernel.org>
>=20
> ---
> Previous discussion (and Rob's Reviewed-by) about this patch
> https://patchwork.kernel.org/patch/10339595/
>=20
> It must have been lost during the development process, so
> I do resend it now.
>=20
> Changes for v3 :
> - Rebase this patch on top of newest kernel (5.1-rc3):
>   SHA1: 145f47c7381d43c789cbad55d4dbfd28fc6c46a4
> - Split this patch to have separate Documentation entry

Gentle ping on this patch...

> ---
>  drivers/gpu/drm/panel/panel-simple.c | 26 ++++++++++++++++++++++++++
>  1 file changed, 26 insertions(+)
>=20
> diff --git a/drivers/gpu/drm/panel/panel-simple.c
> b/drivers/gpu/drm/panel/panel-simple.c index
> 9e8218f6a3f2..196c6adf8168 100644 ---
> a/drivers/gpu/drm/panel/panel-simple.c +++
> b/drivers/gpu/drm/panel/panel-simple.c @@ -1549,6 +1549,29 @@ static
> const struct panel_desc innolux_zj070na_01p =3D { },
>  };
> =20
> +static const struct display_timing koe_tx14d24vm1bpa_timing =3D {
> +	.pixelclock =3D { 5580000, 5850000, 6200000 },
> +	.hactive =3D { 320, 320, 320 },
> +	.hfront_porch =3D { 30, 30, 30 },
> +	.hback_porch =3D { 30, 30, 30 },
> +	.hsync_len =3D { 1, 5, 17 },
> +	.vactive =3D { 240, 240, 240 },
> +	.vfront_porch =3D { 6, 6, 6 },
> +	.vback_porch =3D { 5, 5, 5 },
> +	.vsync_len =3D { 1, 2, 11 },
> +	.flags =3D DISPLAY_FLAGS_DE_HIGH,
> +};
> +
> +static const struct panel_desc koe_tx14d24vm1bpa =3D {
> +	.timings =3D &koe_tx14d24vm1bpa_timing,
> +	.num_timings =3D 1,
> +	.bpc =3D 6,
> +	.size =3D {
> +		.width =3D 115,
> +		.height =3D 86,
> +	},
> +};
> +
>  static const struct display_timing koe_tx31d200vm0baa_timing =3D {
>  	.pixelclock =3D { 39600000, 43200000, 48000000 },
>  	.hactive =3D { 1280, 1280, 1280 },
> @@ -2680,6 +2703,9 @@ static const struct of_device_id
> platform_of_match[] =3D { .compatible =3D "innolux,zj070na-01p",
>  		.data =3D &innolux_zj070na_01p,
>  	}, {
> +		.compatible =3D "koe,tx14d24vm1bpa",
> +		.data =3D &koe_tx14d24vm1bpa,
> +	}, {
>  		.compatible =3D "koe,tx31d200vm0baa",
>  		.data =3D &koe_tx31d200vm0baa,
>  	}, {




Best regards,

Lukasz Majewski

--

DENX Software Engineering GmbH,      Managing Director: Wolfgang Denk
HRB 165235 Munich, Office: Kirchenstr.5, D-82194 Groebenzell, Germany
Phone: (+49)-8142-66989-59 Fax: (+49)-8142-66989-80 Email: lukma@denx.de

--Sig_/cM3I7ZjyncRKGK2qJPxypAS
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEgAyFJ+N6uu6+XupJAR8vZIA0zr0FAlzC+bQACgkQAR8vZIA0
zr2/6wf9H3GNvFtUKSQUQj1Oc1GCu+sOA330kFyUF2gexM9x5zidzJsGz6UM0K3h
waJ7uWmJAZoALAejQTsVu5iqMGHk0oa8imHRCkWrokSZQeCtQOj37kVRnY+ugHE0
sk+Bk6lM5YyvQyUdR92V7JDd/8fZdz9AuNUezF4ffAN+nQb7OWJJREJuPR8Nxn7b
cPfoBT7DPRg5EAn8HKv8oaRm/5A9IMrkpVs+fhd4TNXz/daZnnX31N7MH24Z+4Je
9B4vI58y3j4bebNS26H2i+GTVTOaF4EuxF573EtzBNEKSRL/7Fdgo5qzJOtw4LYa
w2LzBJ1KqPlwiZYx6k42L+CaVOcSeA==
=Zg+N
-----END PGP SIGNATURE-----

--Sig_/cM3I7ZjyncRKGK2qJPxypAS--

--===============1181163546==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVs
IG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlz
dHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVs

--===============1181163546==--
