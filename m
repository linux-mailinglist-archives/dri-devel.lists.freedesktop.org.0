Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 4E8EDEF86F
	for <lists+dri-devel@lfdr.de>; Tue,  5 Nov 2019 10:18:10 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8E4A16E944;
	Tue,  5 Nov 2019 09:18:07 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-x342.google.com (mail-wm1-x342.google.com
 [IPv6:2a00:1450:4864:20::342])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B3CA76E941;
 Tue,  5 Nov 2019 09:18:05 +0000 (UTC)
Received: by mail-wm1-x342.google.com with SMTP id t26so15145957wmi.4;
 Tue, 05 Nov 2019 01:18:05 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=NgeFOXmcMb1cRqZHuYDm9yp+yHng7Ih1kOOmU8LVwUI=;
 b=TSjfglPUv7s3Foq2/KaC8cMmS717LBTuinqhL/SZm1O/ogsHg2ZeTIxFs1sjtmvjea
 zWzwV1j5ZuZdDvPKvT17rf/l1xFO0t8I4cicxvuEtu0ujawfz0bqQMRNBq8ohBJiF2Tj
 a3b3GqfhbBJoRB1F8OOvYzNyevIt5Na1zVX5VpLJcVmYfppDLbe6JZlofSV3fuDr68CE
 WzrHwJVIu+P32R2HutELz7GuV0lwdqeJEbk0vGk1yBlVadW65atZvBvQWohLyvZ0vqmj
 SnIdaAW//oCDsu30atvxwNJimh4jqm+xCFeNUs5O0F7iVMt5zSl3DYREziSD8/NCnaS8
 sDkg==
X-Gm-Message-State: APjAAAUEvak5yx0/9EYoGZxAr1hppi0PgSlSe4QGSQTYbglkFrybMRek
 mz0CAz2vD2qyWYTKB3Lunej8d4yJ
X-Google-Smtp-Source: APXvYqzDV6OjAzO41sAUrCEOwqP0HscHSsMrG3TNcu1EaZwsCE77t9sphuacyEgJA4nptBx4142geA==
X-Received: by 2002:a05:600c:295:: with SMTP id
 21mr3051453wmk.43.1572945484193; 
 Tue, 05 Nov 2019 01:18:04 -0800 (PST)
Received: from localhost (p2E5BE2CE.dip0.t-ipconnect.de. [46.91.226.206])
 by smtp.gmail.com with ESMTPSA id m3sm21060127wrb.67.2019.11.05.01.18.02
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 05 Nov 2019 01:18:02 -0800 (PST)
Date: Tue, 5 Nov 2019 10:18:01 +0100
From: Thierry Reding <thierry.reding@gmail.com>
To: Jani Nikula <jani.nikula@intel.com>
Subject: Re: [Intel-gfx] [PATCH v2 3/5] drm/dsi: add missing DSI DCS commands
Message-ID: <20191105091801.GA1607358@ulmo>
References: <20191028150047.22048-1-jani.nikula@intel.com>
 <20191028150047.22048-3-jani.nikula@intel.com>
MIME-Version: 1.0
In-Reply-To: <20191028150047.22048-3-jani.nikula@intel.com>
User-Agent: Mutt/1.12.2 (2019-09-21)
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20161025;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to:user-agent;
 bh=NgeFOXmcMb1cRqZHuYDm9yp+yHng7Ih1kOOmU8LVwUI=;
 b=jO2cggmNR+ZhoqHaOKYu5rbh+1Z0QG/p7U2HQbLdgn34VG1Nntp3k75/9QvEJMiAJW
 sUK46GnQ82qifTX97hacJrbZUWsUD4Q8b5bFXfLKefB5xJOUnP+wDeYVQKz3XDth6A0O
 EF0+7mm34SuAkawvapX685MBkf8ZDdE9vC6fzPmunL02JL8HW9P1zs68h29evEoJJgm8
 AXYn+DZnr9VEEWPDu8fIiRY9q6ZVk38lxAlKJOhOXIux0NbdHAXmtddHG///rzTRCCcn
 oOFvGT5eBgdppskfr07l3zsIvhRHrZntXPoUw/dt9HK82C4SPRfgUtCgdShp3Er0TVW+
 7M+A==
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
Cc: intel-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org
Content-Type: multipart/mixed; boundary="===============1517368421=="
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


--===============1517368421==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="KsGdsel6WgEHnImy"
Content-Disposition: inline


--KsGdsel6WgEHnImy
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Oct 28, 2019 at 05:00:45PM +0200, Jani Nikula wrote:
> Update from the DCS specification.
>=20
> Cc: Vandita Kulkarni <vandita.kulkarni@intel.com>
> Signed-off-by: Jani Nikula <jani.nikula@intel.com>
> ---
>  include/video/mipi_display.h | 10 ++++++++++
>  1 file changed, 10 insertions(+)
>=20
> diff --git a/include/video/mipi_display.h b/include/video/mipi_display.h
> index 6b6390dfa203..928f8c4b6658 100644
> --- a/include/video/mipi_display.h
> +++ b/include/video/mipi_display.h
> @@ -79,7 +79,9 @@ enum {
>  enum {
>  	MIPI_DCS_NOP			=3D 0x00,
>  	MIPI_DCS_SOFT_RESET		=3D 0x01,
> +	MIPI_DCS_GET_COMPRESSION_MODE	=3D 0x03,
>  	MIPI_DCS_GET_DISPLAY_ID		=3D 0x04,
> +	MIPI_DCS_GET_ERROR_COUNT_ON_DSI	=3D 0x05,
>  	MIPI_DCS_GET_RED_CHANNEL	=3D 0x06,
>  	MIPI_DCS_GET_GREEN_CHANNEL	=3D 0x07,
>  	MIPI_DCS_GET_BLUE_CHANNEL	=3D 0x08,
> @@ -94,6 +96,8 @@ enum {
>  	MIPI_DCS_EXIT_SLEEP_MODE	=3D 0x11,
>  	MIPI_DCS_ENTER_PARTIAL_MODE	=3D 0x12,
>  	MIPI_DCS_ENTER_NORMAL_MODE	=3D 0x13,
> +	MIPI_DCS_GET_IMAGE_CHECKSUM_RGB	=3D 0x14,
> +	MIPI_DCS_GET_IMAGE_CHECKSUM_CT	=3D 0x15,
>  	MIPI_DCS_EXIT_INVERT_MODE	=3D 0x20,
>  	MIPI_DCS_ENTER_INVERT_MODE	=3D 0x21,
>  	MIPI_DCS_SET_GAMMA_CURVE	=3D 0x26,
> @@ -105,6 +109,7 @@ enum {
>  	MIPI_DCS_WRITE_LUT		=3D 0x2D,
>  	MIPI_DCS_READ_MEMORY_START	=3D 0x2E,
>  	MIPI_DCS_SET_PARTIAL_AREA	=3D 0x30,
> +	MIPI_DCS_SET_PARTIAL_COLUMNS	=3D 0x31,
>  	MIPI_DCS_SET_SCROLL_AREA	=3D 0x33,
>  	MIPI_DCS_SET_TEAR_OFF		=3D 0x34,
>  	MIPI_DCS_SET_TEAR_ON		=3D 0x35,
> @@ -114,7 +119,10 @@ enum {
>  	MIPI_DCS_ENTER_IDLE_MODE	=3D 0x39,
>  	MIPI_DCS_SET_PIXEL_FORMAT	=3D 0x3A,
>  	MIPI_DCS_WRITE_MEMORY_CONTINUE	=3D 0x3C,
> +	MIPI_DCS_SET_3D_CONTROL		=3D 0x3D,
>  	MIPI_DCS_READ_MEMORY_CONTINUE	=3D 0x3E,
> +	MIPI_DCS_GET_3D_CONTROL		=3D 0x3F,
> +	MIPI_DCS_SET_VSYNC_TIMING	=3D 0x40,
>  	MIPI_DCS_SET_TEAR_SCANLINE	=3D 0x44,
>  	MIPI_DCS_GET_SCANLINE		=3D 0x45,
>  	MIPI_DCS_SET_DISPLAY_BRIGHTNESS =3D 0x51,		/* MIPI DCS 1.3 */
> @@ -126,7 +134,9 @@ enum {
>  	MIPI_DCS_SET_CABC_MIN_BRIGHTNESS =3D 0x5E,	/* MIPI DCS 1.3 */
>  	MIPI_DCS_GET_CABC_MIN_BRIGHTNESS =3D 0x5F,	/* MIPI DCS 1.3 */
>  	MIPI_DCS_READ_DDB_START		=3D 0xA1,
> +	MIPI_DCS_READ_PPS_START		=3D 0xA2,
>  	MIPI_DCS_READ_DDB_CONTINUE	=3D 0xA8,
> +	MIPI_DCS_READ_PPS_CONTINUE	=3D 0xA9,
>  };
> =20
>  /* MIPI DCS pixel formats */

Okay, found a copy of DCS v1.4 and the above matches the specification,
so:

Reviewed-by: Thierry Reding <treding@nvidia.com>

Does it perhaps make sense to add comments about the version number that
these were introduced with?

Thierry

--KsGdsel6WgEHnImy
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEEiOrDCAFJzPfAjcif3SOs138+s6EFAl3BPj8ACgkQ3SOs138+
s6Gl5A//WP8vPygrsK6Psc7SQq6VaGta/c0tpKaBj7cqSXtcdRVzNvTMnkKFi55a
maJkt4ZFnC2QMOwy6QEaOBcu+bor4cOGadU6u5YbuU2NUq+dwCVm2GaaEntPCSXR
zuc+uaTwGWK53krKcKyAYe1vl8GllKUQ8U7JCMi4hHBVTQAbbrxuMQlCkW/m20ba
iaX9g/9ieUbEsnU5tTTakMr0cqUTQg8oYgBCHyjUGXEqIHKwdp8bN5mXv7836Npr
gd7F463d1Fsv9vafx6Vi2xanFeR56V7vKgMD2av5H8xNfWoMRP/6RBbuET86+kwX
M1vmY/Ju7PHM/clxlX0veHftq2m3E3r48p7yb3Pmua+0Scpz+6IZUfeQKrBqdXFv
ng0WOA+GdPkjy8w3ZZcru/lribjC6ofTMxIVjMj2Ximj7lhrTqUXoRaNlwd6sXVp
Zl5My5gVDvim9rpfm/NbtXpaVel2J8asxoXqIhigJPcoRMK0z/PGwjv8bwXKBBYM
XhWoSLljIan3feXWXARYveETBLeOs8lX12gUdKRv2z3vuWTuUJcMRjfIdZ3Rf670
aABp3kHvyx0bzx4iMA2vmuRUITajQ7dI9pKjt2xIubczcBLAVsE1Alu1vbqYKgMo
2ldG3Da5cihUQhmOhJw3A1Gh6NOjS8rCQDxRJWLRsCLD6PBIwAg=
=zDRI
-----END PGP SIGNATURE-----

--KsGdsel6WgEHnImy--

--===============1517368421==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVs
IG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlz
dHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVs

--===============1517368421==--
