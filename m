Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 004FEEE3C3
	for <lists+dri-devel@lfdr.de>; Mon,  4 Nov 2019 16:29:41 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D8AB36E593;
	Mon,  4 Nov 2019 15:29:38 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x441.google.com (mail-wr1-x441.google.com
 [IPv6:2a00:1450:4864:20::441])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4F9EE6E588;
 Mon,  4 Nov 2019 15:29:37 +0000 (UTC)
Received: by mail-wr1-x441.google.com with SMTP id o28so17564129wro.7;
 Mon, 04 Nov 2019 07:29:37 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=K2KxcuvMsR79mkzjRZlmgg9V8DgWtD2GqEBNjfB88vQ=;
 b=pts7KXUVnL586rxyvQAGymqehC/VpsDrEGWXKKvYH0wq5eGtSWk3n/ZQKRP4R0slKh
 n2Xy63JDDJKSEecNrb8eTD3limQPD0FKMD2irgc/bQD7ExdI3nfsY4wPQBhe5unkRbE2
 kLgXjKMvCcNGNWCx8tNSYW3RvQ+V22nCGm2GH/OM0Q0okETiHg2MUUB7ockBf9FKQCrs
 SRNhplamJT6jFWXs3xEOGqqZQz+G56vbK0kFEoR57fyiroB4CefGfoO9J3FaTDCRfxY0
 mzRyf2kVRJq4DDUCRU0lhlxoKmmDXziQXtmhhuWccvSkZjwSoCQdwjaKtLN3yuWyELB5
 TjFg==
X-Gm-Message-State: APjAAAXJj9s7OwCScf7Qqz6pYTaU92UiolvjssY3m3JO8sz86+fsovyO
 TR0KtrbjfGqDLeroa25B67ZSLGtm
X-Google-Smtp-Source: APXvYqxdWkQ4ypgSqC6RF/+F5/y5jgc9wmmx+Q7gv1dokKT0TegwDL7FUGRcmlg3vR+5bj3kjIw3gA==
X-Received: by 2002:a5d:55c7:: with SMTP id i7mr24817818wrw.371.1572881375833; 
 Mon, 04 Nov 2019 07:29:35 -0800 (PST)
Received: from localhost (p2E5BE2CE.dip0.t-ipconnect.de. [46.91.226.206])
 by smtp.gmail.com with ESMTPSA id r3sm36481613wre.29.2019.11.04.07.29.34
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 04 Nov 2019 07:29:34 -0800 (PST)
Date: Mon, 4 Nov 2019 16:29:33 +0100
From: Thierry Reding <thierry.reding@gmail.com>
To: Jani Nikula <jani.nikula@intel.com>
Subject: Re: [Intel-gfx] [PATCH v2 3/5] drm/dsi: add missing DSI DCS commands
Message-ID: <20191104152933.GC1602887@ulmo>
References: <20191028150047.22048-1-jani.nikula@intel.com>
 <20191028150047.22048-3-jani.nikula@intel.com>
MIME-Version: 1.0
In-Reply-To: <20191028150047.22048-3-jani.nikula@intel.com>
User-Agent: Mutt/1.12.2 (2019-09-21)
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20161025;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to:user-agent;
 bh=K2KxcuvMsR79mkzjRZlmgg9V8DgWtD2GqEBNjfB88vQ=;
 b=XyvIRZ2yv9az2z+pMDfCLPZHv0zj1U25TsGYRKOjKQsD5Poq5aV6B9S3Rfe0BVOsro
 aqvXrCyMzLSs5ql6LM/x4nsZqI8buBt8NaweJJrShJ6bPpVc5H4koUNWc56Jo7cxLaGS
 eHiTFJ0SRT0l3DGPpOFbbuqWTChsfJA+nh79+qKtJ3Kw1kzF/KF1OILNYzSxSGrIIuaO
 lWqLW/MRAlWi3Ck0DaM2AicXLgy9GOhzNTlSU5/mqrrG0jFqzogs/d24DKvdzA7Pcy11
 RWef6EibUobCtuNuaKBenB+kPKdnHYevHxO6OmeEPPhT0Jo/hxPCxExz4IExfBoME1Il
 LDQw==
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
Content-Type: multipart/mixed; boundary="===============1220678440=="
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


--===============1220678440==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="Fig2xvG2VGoz8o/s"
Content-Disposition: inline


--Fig2xvG2VGoz8o/s
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
> --=20
> 2.20.1

I only have a copy of DCS 1.2, which doesn't seem to have these values.
Let me see if I can find a more updated version.

Thierry

--Fig2xvG2VGoz8o/s
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEEiOrDCAFJzPfAjcif3SOs138+s6EFAl3AQ90ACgkQ3SOs138+
s6GN0A/+MT8SM17Trcby7MBsnDtUZ/YfcYgZr+gVQ5oWS4sOs7bAAO7HcZPGokQi
BMsX5sNj0KYPaHVf9S2LCOK6zQusdxBmUXPkSYEC0WatfpQXQHWmCOZIxaOiBSB2
GCH8ayRw1J9UCYaaQOMqXgwmDpNo3ZGk9IT0NlUJRMOjOShoFcjUUYclbT8RqwKm
JoRf+IQcF6WrzVibIsK0UNLv3nMyhnA9yTKf9L+Li/FSg2DB+EImlHTERq9oNYvK
M8i498C7UM4Gw3g5XByMgIK3S+egYsrYKW5m4xJhhHe1rq32lCzoZIJeEb9Gr7ES
4QKfcftl0eZ7PCsSmojCtJRB5dOcVk8RWfTr/hf0qJZM35E2ne65g5lUdSIInMmW
SAzIriZ/XsACmGtQWKuhtrlwHJ2LUTxMthxdIGzAdxJNHCv7IZk8bLcjafRwy/2t
wVHCnLSonz/UZlvoeHJFWyc2G0BADULi3sZkO4UCIXot3O85mNycZW3//OgGECG3
Y3rCFmn0KEo7N+SZLIK8r509BI7cLjDe8u/wbqy1W3YXCyq7QFCA7HwDs+AcXqmQ
ew9S0mFn8Xcat08c2lY/91RKraBLUbxRNxWQDCSM+CGTyBYRVsrWWt3EQomcrZcd
wi7nV/9OF/xw+nKfpJr7C6vpDO1zirGSPP7lLWfyJ05Q3e1nsl8=
=xGHW
-----END PGP SIGNATURE-----

--Fig2xvG2VGoz8o/s--

--===============1220678440==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVs
IG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlz
dHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVs

--===============1220678440==--
