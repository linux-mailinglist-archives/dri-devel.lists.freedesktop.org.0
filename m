Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 389F4B5566B
	for <lists+dri-devel@lfdr.de>; Fri, 12 Sep 2025 20:39:16 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8CB7E10ECD0;
	Fri, 12 Sep 2025 18:39:14 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=collabora.com header.i=@collabora.com header.b="S/LzYiCZ";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from bali.collaboradmins.com (bali.collaboradmins.com
 [148.251.105.195])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0F1FD10ECD0
 for <dri-devel@lists.freedesktop.org>; Fri, 12 Sep 2025 18:39:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
 s=mail; t=1757702351;
 bh=KgxeHP35Q4Ax/Ay7JXElfPbhpnzulgHgT/xc9ptevu4=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=S/LzYiCZ2nOZi/xWrc/Dv+NkwOdempacWDtHamE1bc0OjgmX55DMHCURoGf+ZrPNS
 2cTXvJWT35OTIYuksa+D53ICWuvCVxSUB7DgNZvJxZGvyHDXWHXf/rBwlHLOqSWAwk
 EnXpHP8PCuiz0M1ruBGJcPfKdX9nNdq4wa/6i0HaG1DJvo8nMkpX8i16USQrsb0AOu
 J/Mq3aG9tgBALNWu/9EIxms83IlvD+Ye4K+/5werZFu73Nek1E/smQlbCQ/6CPEm0O
 CpSnQd21iCgDJzHfj9qduqcPLqALTszbOhKVz/8HKAg6XrrjzxYWTZxmrHuROA9O/N
 i0Yp9Dec9NiRA==
Received: from xpredator (unknown
 [IPv6:2a02:2f05:840b:7800:e88e:21ff:fe65:be18])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange ECDHE (prime256v1) server-signature RSA-PSS (4096 bits)
 server-digest SHA256) (No client certificate requested)
 (Authenticated sender: mvlad)
 by bali.collaboradmins.com (Postfix) with ESMTPSA id D670317E04D6;
 Fri, 12 Sep 2025 20:39:10 +0200 (CEST)
Date: Fri, 12 Sep 2025 21:39:09 +0300
From: Marius Vlad <marius.vlad@collabora.com>
To: Maxime Ripard <mripard@kernel.org>
Cc: dri-devel@lists.freedesktop.org, wse@tuxedocomputers.com,
 andri@yngvason.is, sebastian.wick@redhat.com,
 daniel.stone@collabora.com, jani.nikula@linux.intel.com,
 tzimmermann@suse.de, simona.vetter@ffwll.ch, harry.wentland@amd.com,
 christian.koenig@amd.com, derek.foreman@collabora.com
Subject: Re: [PATCH 2/8] hdmi: Add HDMI_COLORSPACE_AUTO enum option
Message-ID: <aMRoza-hOf29I4OH@xpredator>
References: <20250911130739.4936-1-marius.vlad@collabora.com>
 <20250911130739.4936-3-marius.vlad@collabora.com>
 <20250912-meaty-caracara-of-potency-ab81e7@penduick>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="x6nP6VMhMugqEWnk"
Content-Disposition: inline
In-Reply-To: <20250912-meaty-caracara-of-potency-ab81e7@penduick>
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


--x6nP6VMhMugqEWnk
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, Sep 12, 2025 at 05:17:56PM +0200, Maxime Ripard wrote:
> Hi,
Hi Maxime,
>=20
> On Thu, Sep 11, 2025 at 04:07:33PM +0300, Marius Vlad wrote:
> > diff --git a/drivers/video/hdmi.c b/drivers/video/hdmi.c
> > index 45b42f14a750..74fe925c69a2 100644
> > --- a/drivers/video/hdmi.c
> > +++ b/drivers/video/hdmi.c
> > @@ -1031,8 +1031,8 @@ static const char *hdmi_colorspace_get_name(enum =
hdmi_colorspace colorspace)
> >  		return "YCbCr 4:4:4";
> >  	case HDMI_COLORSPACE_YUV420:
> >  		return "YCbCr 4:2:0";
> > -	case HDMI_COLORSPACE_RESERVED4:
> > -		return "Reserved (4)";
> > +	case HDMI_COLORSPACE_AUTO:
> > +		return "Auto";
> >  	case HDMI_COLORSPACE_RESERVED5:
> >  		return "Reserved (5)";
> >  	case HDMI_COLORSPACE_RESERVED6:
> > diff --git a/include/linux/hdmi.h b/include/linux/hdmi.h
> > index 96bda41d9148..045402033763 100644
> > --- a/include/linux/hdmi.h
> > +++ b/include/linux/hdmi.h
> > @@ -82,7 +82,7 @@ enum hdmi_colorspace {
> >  	HDMI_COLORSPACE_YUV422,
> >  	HDMI_COLORSPACE_YUV444,
> >  	HDMI_COLORSPACE_YUV420,
> > -	HDMI_COLORSPACE_RESERVED4,
> > +	HDMI_COLORSPACE_AUTO,
> >  	HDMI_COLORSPACE_RESERVED5,
> >  	HDMI_COLORSPACE_RESERVED6,
> >  	HDMI_COLORSPACE_IDO_DEFINED,
>=20
> I'm not sure we can use hdmi_colorspace as is. This is the enum that
> represents the colorspace encoded in the AVI infoframe, so we can't
> change it, really.
I see. Was hoping I can re-use these as is when defining the color
format enum.

Should I just de-couple the color format entirely from the enum hdmi
colorspace? With the enum color format in it feels they sort of overlap,
with some drivers explicitly using the hdmi colorspace enum others the
color format enum. Feels a bit inconsistent but maybe that's just me
and folks do not see this as an issue.

Perhaps just handle 'Auto' distinctly but still re-use the hdmi
colorspace enum?=20

Any (strong) preference?=20
>=20
> Maxime



--x6nP6VMhMugqEWnk
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEEcDKHej6x6uPk3J379jQS5glH1u8FAmjEaMoACgkQ9jQS5glH
1u+98g//a4lEaX/vCy/2Og56i8bQfT2e6ifTUse83/bHULwVi5YMo8QJ7jF2XF6c
6U0sDios6PTryc9sZ8JesQSfxadzIHuLN15dnIN6WSZHkZmR+hoit6N054W4GVcF
hAmCSdH/oSbUk4zJnIFSvPbzmxfqFXPnccAVRwQXs5MgppNtwZE2Ls/USBH5T3Jf
Lzb8AVV9USUHBUCBz36wIL2rYYU4H3kWoJ+jGVtqt1buAghm37nCt4fJOE1hgZ94
oOPkAgVHVrNZNDaShmxIld/qV03rmF79Tzox1K0E5NnbZZ0TD8vn7H4CUVhsJMmS
LTQfSuG+3QUxEPJERix/jQOfjp67HVKyL68WVqKXXhJVi3lQHjFls0voKrnme/+t
YxXFtHqHMrA7nc/vK38DysMcLPjUKdXM2GxoxBjXD54IZsO3yzu+XiTuugadeBf4
tdCgPHMJ8N54VFSJ+ZeA48w0JWxZWy/ZBI/yv7W8ZkFsSxraPMxTRENB79SO8dmK
L7lmfh8/beLuOIVsKMI9BxkVR3WmBlzLLYos2hrHyuapqkNgTObecP2inKaZoLS0
+LsaOCcQrrXERm6GACpy3r/E54+5rG9n+WPLXggVkXzCXcda3m5h38d7IjLQJZzj
UQSt4MMMMHJO7aHozDuanK/+EeC2FEgXP+AjTvAipX5GeIb5kXU=
=IQ0C
-----END PGP SIGNATURE-----

--x6nP6VMhMugqEWnk--
