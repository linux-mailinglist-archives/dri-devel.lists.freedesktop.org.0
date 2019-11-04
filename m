Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 919EAEE38E
	for <lists+dri-devel@lfdr.de>; Mon,  4 Nov 2019 16:21:04 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8DC266E558;
	Mon,  4 Nov 2019 15:21:02 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-x341.google.com (mail-wm1-x341.google.com
 [IPv6:2a00:1450:4864:20::341])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2B3D16E554;
 Mon,  4 Nov 2019 15:21:00 +0000 (UTC)
Received: by mail-wm1-x341.google.com with SMTP id q130so16466057wme.2;
 Mon, 04 Nov 2019 07:21:00 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=8//QPsiXozAk0ZrkkYSNZnhePUgQqnjfFeD3DcE5WzE=;
 b=GFccmj7Mxe4DSQE8yPDGENzUbDhWBZOwoSJ+zwz/+M6Qn5NQpcYs6ZAUdS1WRI+H91
 5YjXhAyEtrylRcsEgLFs3m5K3fFNF9R3Ro2y710aOoeFjDopNo7F+blH/dz6dv+bWx9s
 Un7Uhot4e9Lrd1KP6Si8gLeTTr+Qeur7MqFyyJVkmMY9Esp1rNr/PcxYp/oalFBgBeVH
 pYxPRkxcNSw3z+/14XFC4BdAaC42hD0l2s1oIk2+DkEI3UhSSrRvM+n1FtBgJHQhKmU4
 FZQ5TqJ0/YgdLiibFWgzCMW34Di/4DXihyPrib3oUgkqHxJ4Di9hmGI6WQgeq9pXKHMv
 dpQA==
X-Gm-Message-State: APjAAAUNcTkhJKjtBpubDS0RA+RQWZVLOraP99GaxjkwPztoivwCtVEj
 wRelMvhZkk/83XsmSjQvb1XFcmn0
X-Google-Smtp-Source: APXvYqyl0jFgx13wt4HTV0WGyjRZ8QbOXXbtY1ob1/iTxSR+XerQoA0wy6HOvfO4ZPBPA5ECzP5ROA==
X-Received: by 2002:a1c:b4c1:: with SMTP id d184mr21707822wmf.37.1572880858577; 
 Mon, 04 Nov 2019 07:20:58 -0800 (PST)
Received: from localhost (p2E5BE2CE.dip0.t-ipconnect.de. [46.91.226.206])
 by smtp.gmail.com with ESMTPSA id v10sm21659838wmg.48.2019.11.04.07.20.56
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 04 Nov 2019 07:20:56 -0800 (PST)
Date: Mon, 4 Nov 2019 16:20:54 +0100
From: Thierry Reding <thierry.reding@gmail.com>
To: Jani Nikula <jani.nikula@intel.com>
Subject: Re: [Intel-gfx] [PATCH v2 1/5] drm/dsi: clean up DSI data type
 definitions
Message-ID: <20191104152054.GA1602887@ulmo>
References: <20191028150047.22048-1-jani.nikula@intel.com>
MIME-Version: 1.0
In-Reply-To: <20191028150047.22048-1-jani.nikula@intel.com>
User-Agent: Mutt/1.12.2 (2019-09-21)
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20161025;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to:user-agent;
 bh=8//QPsiXozAk0ZrkkYSNZnhePUgQqnjfFeD3DcE5WzE=;
 b=EzUPjt7Mzy8UJ0TbT7jCjYh/NRrgBIIRkY6Sr5QIoKqHjFdb74ZyeyRIwxAkhGajN3
 YOX4V13zqoVc7Cjb4nDGmId8SmTBkIz3Nx5MowdIWvcx5/6CykkKAey+n/CQPC3vLyCe
 MGbTnvMZQr8Xy5cn4exjylAvdpanl0mU0jVB2Be9YJzn4d8ii0iTRUESzkG9r626eiI+
 i3mbb//gtctiFziAL9xuY7PTD+o3wxXg8MtodUbikyksEfY7RisIiYgRXFetZjh6HVx0
 9NwrHKjth9apWCxcf0CX5Rk9sQjNvQBGUvIEHDjuIcmcayeXtiGwpMXcN3HnhdiHlZ3F
 VqYw==
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
Content-Type: multipart/mixed; boundary="===============1533220872=="
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


--===============1533220872==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="4Ckj6UjgE2iN1+kY"
Content-Disposition: inline


--4Ckj6UjgE2iN1+kY
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Oct 28, 2019 at 05:00:43PM +0200, Jani Nikula wrote:
> Rename picture parameter set (it's a long packet, not a long write) and
> compression mode (it's not a DCS command) enumerations according to the
> DSI specification. Order the types according to the spec. Use tabs
> instead of spaces for indentation. Use all lower case for hex.
>=20
> Cc: Vandita Kulkarni <vandita.kulkarni@intel.com>
> Reviewed-by: Vandita Kulkarni <vandita.kulkarni@intel.com>
> Signed-off-by: Jani Nikula <jani.nikula@intel.com>
> ---
>  drivers/gpu/drm/drm_mipi_dsi.c |  4 ++--
>  include/video/mipi_display.h   | 10 +++++-----
>  2 files changed, 7 insertions(+), 7 deletions(-)
>=20
> diff --git a/drivers/gpu/drm/drm_mipi_dsi.c b/drivers/gpu/drm/drm_mipi_ds=
i.c
> index bd2498bbd74a..f237d80828c3 100644
> --- a/drivers/gpu/drm/drm_mipi_dsi.c
> +++ b/drivers/gpu/drm/drm_mipi_dsi.c
> @@ -373,6 +373,7 @@ bool mipi_dsi_packet_format_is_short(u8 type)
>  	case MIPI_DSI_V_SYNC_END:
>  	case MIPI_DSI_H_SYNC_START:
>  	case MIPI_DSI_H_SYNC_END:
> +	case MIPI_DSI_COMPRESSION_MODE:
>  	case MIPI_DSI_END_OF_TRANSMISSION:
>  	case MIPI_DSI_COLOR_MODE_OFF:
>  	case MIPI_DSI_COLOR_MODE_ON:
> @@ -387,7 +388,6 @@ bool mipi_dsi_packet_format_is_short(u8 type)
>  	case MIPI_DSI_DCS_SHORT_WRITE:
>  	case MIPI_DSI_DCS_SHORT_WRITE_PARAM:
>  	case MIPI_DSI_DCS_READ:
> -	case MIPI_DSI_DCS_COMPRESSION_MODE:
>  	case MIPI_DSI_SET_MAXIMUM_RETURN_PACKET_SIZE:
>  		return true;
>  	}
> @@ -406,11 +406,11 @@ EXPORT_SYMBOL(mipi_dsi_packet_format_is_short);
>  bool mipi_dsi_packet_format_is_long(u8 type)
>  {
>  	switch (type) {
> -	case MIPI_DSI_PPS_LONG_WRITE:
>  	case MIPI_DSI_NULL_PACKET:
>  	case MIPI_DSI_BLANKING_PACKET:
>  	case MIPI_DSI_GENERIC_LONG_WRITE:
>  	case MIPI_DSI_DCS_LONG_WRITE:
> +	case MIPI_DSI_PICTURE_PARAMETER_SET:
>  	case MIPI_DSI_LOOSELY_PACKED_PIXEL_STREAM_YCBCR20:
>  	case MIPI_DSI_PACKED_PIXEL_STREAM_YCBCR24:
>  	case MIPI_DSI_PACKED_PIXEL_STREAM_YCBCR16:
> diff --git a/include/video/mipi_display.h b/include/video/mipi_display.h
> index cba57a678daf..79fd71cf4934 100644
> --- a/include/video/mipi_display.h
> +++ b/include/video/mipi_display.h
> @@ -17,6 +17,9 @@ enum {
>  	MIPI_DSI_H_SYNC_START				=3D 0x21,
>  	MIPI_DSI_H_SYNC_END				=3D 0x31,
> =20
> +	MIPI_DSI_COMPRESSION_MODE			=3D 0x07,
> +	MIPI_DSI_END_OF_TRANSMISSION			=3D 0x08,
> +
>  	MIPI_DSI_COLOR_MODE_OFF				=3D 0x02,
>  	MIPI_DSI_COLOR_MODE_ON				=3D 0x12,
>  	MIPI_DSI_SHUTDOWN_PERIPHERAL			=3D 0x22,
> @@ -35,18 +38,15 @@ enum {
> =20
>  	MIPI_DSI_DCS_READ				=3D 0x06,
> =20
> -	MIPI_DSI_DCS_COMPRESSION_MODE                   =3D 0x07,
> -	MIPI_DSI_PPS_LONG_WRITE                         =3D 0x0A,
> -
>  	MIPI_DSI_SET_MAXIMUM_RETURN_PACKET_SIZE		=3D 0x37,
> =20
> -	MIPI_DSI_END_OF_TRANSMISSION			=3D 0x08,
> -
>  	MIPI_DSI_NULL_PACKET				=3D 0x09,
>  	MIPI_DSI_BLANKING_PACKET			=3D 0x19,
>  	MIPI_DSI_GENERIC_LONG_WRITE			=3D 0x29,
>  	MIPI_DSI_DCS_LONG_WRITE				=3D 0x39,
> =20
> +	MIPI_DSI_PICTURE_PARAMETER_SET			=3D 0x0a,
> +
>  	MIPI_DSI_LOOSELY_PACKED_PIXEL_STREAM_YCBCR20	=3D 0x0c,
>  	MIPI_DSI_PACKED_PIXEL_STREAM_YCBCR24		=3D 0x1c,
>  	MIPI_DSI_PACKED_PIXEL_STREAM_YCBCR16		=3D 0x2c,

Looks good to me. I haven't specifically checked that the order matches
that in the specification, but given that it's not really ordered in any
sane way in the first place (or perhaps I'm too stupid to see the logic)
I don't really mind about the order.

Took me a while to find the specification. You might want to mention in
the commit message that some of these enumerations are only available in
the DSI 2 specification because I was looking at 1.2 first. Anyway, the
enumerations and names match what's in the spec, so:

Reviewed-by: Thierry Reding <treding@nvidia.com>

--4Ckj6UjgE2iN1+kY
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEEiOrDCAFJzPfAjcif3SOs138+s6EFAl3AQdMACgkQ3SOs138+
s6GZFQ//RvZ08pxbOULjyHP9PkVQ3zSKnolJQdlEqbrA7uqH5neGnDb1YDFxf9X5
WdzuL/GchUg+u9MMDZL2bRilGLY9fSKG1KCvvzu8V1AKm6MbfXSYVjk5k24+6OKF
9kEX6G8AporfS9QP6+pgCjSzuSbbjMjDHHL7XxBwj/uzZ1SiOYds9CI9qNU580HA
klUeK0kWZvbY2L7r0YBd4GRYJYkDRutoHi0oc765mFkA+51P8ZBsEH1++w7D4XfZ
yD72Yf8Tsm6ZQMULRkSegIt2JSK9nnroD6jvlNfWDoytKAeAmv6z41n2W2gXuqrJ
u/m2fE3AQwOqHoO41zmS/MzMfpQTYrzD40FdOJ0zc8spjN0VhhsWiTjM4TM8zRFB
G55wbuRDHffDmSI0WmUvay1dj9g8OQMR5p8bzI2OkPjYcKtP9tPTX4vEcEhpg5eA
ZBx5fx/ag26xASv65hqVCTbjyI3+38aCdZBm4c7VPqmE0i9HefSGR7v1xqReU36V
1Yl/0PXCWzrJbj6n9O8PLra+BnHFSCZRkr8Ihkk3R/omj2eQCZdidfJwFGKhC42k
Q9ZI6+3BI4oUTdFefj47HsIDus6B/r11Rd9ldQBvXB09uip0cJysisOVd3ybmff0
M8eF+uoRqC8ua43ntvo8BtAP0dWyU3DLdu/HhszY3zzZo4YiBNw=
=UzJD
-----END PGP SIGNATURE-----

--4Ckj6UjgE2iN1+kY--

--===============1533220872==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVs
IG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlz
dHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVs

--===============1533220872==--
