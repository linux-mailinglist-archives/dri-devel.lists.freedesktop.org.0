Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id B0474EE3AC
	for <lists+dri-devel@lfdr.de>; Mon,  4 Nov 2019 16:24:20 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 42E1C6E56D;
	Mon,  4 Nov 2019 15:24:18 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-x344.google.com (mail-wm1-x344.google.com
 [IPv6:2a00:1450:4864:20::344])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3155F6E56D;
 Mon,  4 Nov 2019 15:24:17 +0000 (UTC)
Received: by mail-wm1-x344.google.com with SMTP id v3so14291249wmh.1;
 Mon, 04 Nov 2019 07:24:17 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=TUGOHbxoXQJd5w11luPXYSDlmutnngVvGcLdpJiMrMs=;
 b=LNpL3gp9xopmB69NhLpdXVS5Dv/wB172qV+fTCdaTq9TauJMQaoWqGDte3rxEAuGZ5
 ydjnbvkkkZgxAojU28HtHImJxwrKfF9wb88BRTfvAXeO1dV8n9faPQjxJN9pr+b8IHaA
 FORybN8X2JBeYwHJZlA10z7ujoM42ieRR3JagmKWOTgI+Ixe+LV2IHDOZ4mbAFKve7aS
 NxyjhRGantRmWp2k3sr2jRBcB+wvVjkl3HAbMnVHyhuNbg3Da+cw+lPUbL0LrMQvk0M2
 xrtft1M42az6a/UnxU/DlTH/2ni2offN35nG53cbOmoVMFCl28T2gU81RG4+sCfMUBsJ
 6W/w==
X-Gm-Message-State: APjAAAU5fbiDO6bPTunDvOOeddVNPGVupVYxVgf+xTLMlLqvoUzVv1BC
 Z4hXl/JgN1p2CropSlOjrUs=
X-Google-Smtp-Source: APXvYqwuV8M14IBayfMuMz7YbpVA7EnCuqOt2qlTE+qFT3Sq+Pl8EghPRxjRM+R4EGQWw8hy/MwU8Q==
X-Received: by 2002:a1c:1d41:: with SMTP id d62mr22903659wmd.32.1572881055704; 
 Mon, 04 Nov 2019 07:24:15 -0800 (PST)
Received: from localhost (p2E5BE2CE.dip0.t-ipconnect.de. [46.91.226.206])
 by smtp.gmail.com with ESMTPSA id t29sm33697660wrb.53.2019.11.04.07.24.13
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 04 Nov 2019 07:24:13 -0800 (PST)
Date: Mon, 4 Nov 2019 16:24:11 +0100
From: Thierry Reding <thierry.reding@gmail.com>
To: Jani Nikula <jani.nikula@intel.com>
Subject: Re: [PATCH v2 2/5] drm/dsi: add missing DSI data types
Message-ID: <20191104152411.GB1602887@ulmo>
References: <20191028150047.22048-1-jani.nikula@intel.com>
 <20191028150047.22048-2-jani.nikula@intel.com>
MIME-Version: 1.0
In-Reply-To: <20191028150047.22048-2-jani.nikula@intel.com>
User-Agent: Mutt/1.12.2 (2019-09-21)
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20161025;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to:user-agent;
 bh=TUGOHbxoXQJd5w11luPXYSDlmutnngVvGcLdpJiMrMs=;
 b=cWuOrKA5KeB4ib0BYsJYQiIDgPRd6fVSBu6+2jLuymM/sOaUOTIR1+4Do2HSVKmb62
 rC6VCjyC4Haxn1vH7S3Nd+b/j5yWM9X0gnnC5vkok2Q+VKom/AKeDvrX+rV8i9+kH8e/
 PGFVBjojiUp+8GKQjWhOJdxo48EkK69dFUVcgIG8BtZXaZPVoJoJrRZPifVUQxP98y/A
 TZWzNbNmxTrd7LDkB60N2mR3g+4eG6eA1jb2881Bep1l3zDHb5xKL4PCt//ImeFImBYH
 /qvxsSrYTndUzmnCQEbDJUOcRBCqlHxRHOE68pFJKrRUHOGIl/SROtWsoKlS3N3Pf2Nq
 5GQQ==
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
Cc: Vandita Kulkarni <vandita.kulkarni@intel.com>,
 intel-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org
Content-Type: multipart/mixed; boundary="===============1632325686=="
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


--===============1632325686==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="NDin8bjvE/0mNLFQ"
Content-Disposition: inline


--NDin8bjvE/0mNLFQ
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Oct 28, 2019 at 05:00:44PM +0200, Jani Nikula wrote:
> Add execute queue and compressed pixel stream packet data types for
> completeness.
>=20
> Cc: Vandita Kulkarni <vandita.kulkarni@intel.com>
> Signed-off-by: Jani Nikula <jani.nikula@intel.com>
> ---
>  drivers/gpu/drm/drm_mipi_dsi.c | 2 ++
>  include/video/mipi_display.h   | 2 ++
>  2 files changed, 4 insertions(+)
>=20
> diff --git a/drivers/gpu/drm/drm_mipi_dsi.c b/drivers/gpu/drm/drm_mipi_ds=
i.c
> index f237d80828c3..3f33f02571fd 100644
> --- a/drivers/gpu/drm/drm_mipi_dsi.c
> +++ b/drivers/gpu/drm/drm_mipi_dsi.c
> @@ -388,6 +388,7 @@ bool mipi_dsi_packet_format_is_short(u8 type)
>  	case MIPI_DSI_DCS_SHORT_WRITE:
>  	case MIPI_DSI_DCS_SHORT_WRITE_PARAM:
>  	case MIPI_DSI_DCS_READ:
> +	case MIPI_DSI_EXECUTE_QUEUE:
>  	case MIPI_DSI_SET_MAXIMUM_RETURN_PACKET_SIZE:
>  		return true;
>  	}
> @@ -411,6 +412,7 @@ bool mipi_dsi_packet_format_is_long(u8 type)
>  	case MIPI_DSI_GENERIC_LONG_WRITE:
>  	case MIPI_DSI_DCS_LONG_WRITE:
>  	case MIPI_DSI_PICTURE_PARAMETER_SET:
> +	case MIPI_DSI_COMPRESSED_PIXEL_STREAM:
>  	case MIPI_DSI_LOOSELY_PACKED_PIXEL_STREAM_YCBCR20:
>  	case MIPI_DSI_PACKED_PIXEL_STREAM_YCBCR24:
>  	case MIPI_DSI_PACKED_PIXEL_STREAM_YCBCR16:
> diff --git a/include/video/mipi_display.h b/include/video/mipi_display.h
> index 79fd71cf4934..6b6390dfa203 100644
> --- a/include/video/mipi_display.h
> +++ b/include/video/mipi_display.h
> @@ -37,6 +37,7 @@ enum {
>  	MIPI_DSI_DCS_SHORT_WRITE_PARAM			=3D 0x15,
> =20
>  	MIPI_DSI_DCS_READ				=3D 0x06,
> +	MIPI_DSI_EXECUTE_QUEUE				=3D 0x16,
> =20
>  	MIPI_DSI_SET_MAXIMUM_RETURN_PACKET_SIZE		=3D 0x37,
> =20
> @@ -46,6 +47,7 @@ enum {
>  	MIPI_DSI_DCS_LONG_WRITE				=3D 0x39,
> =20
>  	MIPI_DSI_PICTURE_PARAMETER_SET			=3D 0x0a,
> +	MIPI_DSI_COMPRESSED_PIXEL_STREAM		=3D 0x0b,
> =20
>  	MIPI_DSI_LOOSELY_PACKED_PIXEL_STREAM_YCBCR20	=3D 0x0c,
>  	MIPI_DSI_PACKED_PIXEL_STREAM_YCBCR24		=3D 0x1c,

Actually, it looks like the ordering is by lowest-significant nibble
first, then by highest-significant nibble, so maybe there's some logic
to this after all.

Hmm... that's mostly true, except for 0x07 and 0x08... anyway, the new
enumeration values and names match the specification, so:

Reviewed-by: Thierry Reding <treding@nvidia.com>

--NDin8bjvE/0mNLFQ
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEEiOrDCAFJzPfAjcif3SOs138+s6EFAl3AQpsACgkQ3SOs138+
s6EqJg//V4ou45jO8qy3/RPAj0Hjuz4x6aHFyTOAuPMXJfJxX7e1lEvACqJcWsDA
699DHG4KZdOp1Lv8ZBiFBxe9BnO2NXEOE+b51REPh9rvqJZTGwgSXXRrluDxxoOs
eDNxKfng0HFfHQFn3lHe+eGgNAN2QKa1L4b4/ujpvNIk4TM+dk6AkaFY1Yfvjvbx
2ow+JuE3YBZoyp4nDuSVj6afGnyTqUQ9+K3XnfvhJamnoSVfgbaln67Tr8Jv7m4I
N2bcGwd0wHqKIBPF5d5qQjwOmirp/KYrOlpYeR1BvuU6M2WPCS/+eMZkQeOKNY/l
q3qOgWVfa6nzDUcJBJg/9cmqi+FsyxQF10PQP+2/Oyiouq9a2VR9xzp5mR0T/c3V
yh9gAnlXv5o+pBxY1WhX7fuqpIHDYijgqDjiO0CwoBVukSuVEWDKahkoLo4A4510
ZyPAqNCQfX+TXyvnqSLrWBnf+m6WGav6Tlh8vWMarS5wCqt4hROkEwxHSJbGNuP4
qGL9ki1JobAWpumh4/HB0iED2VZwOn0NolUJX3SZcT326yk92q338k4o/VED1aW1
8h6tuac1uylUcG8DtQSewyrRJNMECNIcYeia9m++pRHRdb835Hz5Zf2y+7gR+Hxz
lgVJKibNdELaWqP8V8BVBXT+90rHaV+f5nNKmIlhmXsBrUupSiY=
=raOG
-----END PGP SIGNATURE-----

--NDin8bjvE/0mNLFQ--

--===============1632325686==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVs
IG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlz
dHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVs

--===============1632325686==--
