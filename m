Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 337BD13D098
	for <lists+dri-devel@lfdr.de>; Thu, 16 Jan 2020 00:16:27 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 26E246E0DB;
	Wed, 15 Jan 2020 23:16:24 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-qv1-xf44.google.com (mail-qv1-xf44.google.com
 [IPv6:2607:f8b0:4864:20::f44])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 361676E0DB
 for <dri-devel@lists.freedesktop.org>; Wed, 15 Jan 2020 23:16:23 +0000 (UTC)
Received: by mail-qv1-xf44.google.com with SMTP id f16so8229088qvi.4
 for <dri-devel@lists.freedesktop.org>; Wed, 15 Jan 2020 15:16:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to;
 bh=b7oS6iFaZp5Ev3Rbe8D4qrhAo74337cdH5v48Sm6jFU=;
 b=lM1rKElNL28rd38MivjOHACtGPg9dQifIRXwXYYUp32C/+wYnF0RlrPzZr/WMwkfqQ
 a9XfUp/iWfYm2TKX2+ztPhOGgZTIVBv8jsXODS/u2132cYsZdmipsD8gwIip5M6xSHP2
 H7WDfh1+vTegHiyOtWyyGjkYk8QMASym8g81sxbgAosbM9bjaXW3Ep4AK5B6/giOkCO/
 /XPVdKKl2jXJzcaepH+mt2YqmXdfdxmIP2TbFdAle9XXq0NXYEg1FqMiYvHbXxUO/Xmn
 kDSXpZK3Weot6tpKeHKXJT1GXJZZEp8z4vfUQPwtI6o22UAXKBgyn7J/suTsR8Fuv6rC
 jmgA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=b7oS6iFaZp5Ev3Rbe8D4qrhAo74337cdH5v48Sm6jFU=;
 b=OZj223FdneId90xlddn+PYYhdh9Z/klRaE0cDQc2ppyIzqhrbs6z8MypltVI7y9VFR
 O07f92bQMBlwOybpzipzXnuJLSC+IdmAaVYWxw+pwSfJF1IAKfXpuqLy9mHX0ti9cq34
 As39FdDwKkW7J1lsvDbTTgmevg7WIfB2hhx3/v7EFhfHbUnZA9akUohxP04J9oPEpts0
 Mr9cNedwIjlZA6F1aUi8tC9yONPEu2n2Gqhy93XDSVI/kYH59toKNYMj5+lYkrQo9+UU
 sXPihOaJJTxStOyOSsFNuo3S8PkdijKGJQMm8pPXJhJa87bJaVP2fqnTHbMATy5PGlPx
 fiyQ==
X-Gm-Message-State: APjAAAWpPAPABXgdsWauKBXrnXY25EUnZ4lB5aPRFcnPxUFFCwjiLoht
 vdk1mMMeG8F5fToILr5mp4U=
X-Google-Smtp-Source: APXvYqxMYK+SWAlKfpj9uNSjYx8dr2oaQOkzmTmgtNOHCZr9XAqD+k9ZeAjHxzO2f49l77pq9xm/Qg==
X-Received: by 2002:a05:6214:162c:: with SMTP id
 e12mr23875459qvw.3.1579130182297; 
 Wed, 15 Jan 2020 15:16:22 -0800 (PST)
Received: from smtp.gmail.com ([165.204.55.250])
 by smtp.gmail.com with ESMTPSA id n7sm9321062qke.121.2020.01.15.15.16.21
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 15 Jan 2020 15:16:21 -0800 (PST)
Date: Wed, 15 Jan 2020 18:16:17 -0500
From: Rodrigo Siqueira <rodrigosiqueiramelo@gmail.com>
To: Sam Ravnborg <sam@ravnborg.org>
Subject: Re: [PATCH 09/10] drm/vkms: plane_state->fb iff plane_state->crtc
Message-ID: <20200115231617.pzx4fhfto42djzew@smtp.gmail.com>
References: <20191213172612.1514842-1-daniel.vetter@ffwll.ch>
 <20191213172612.1514842-9-daniel.vetter@ffwll.ch>
 <20200114235013.o6y2hgu6mzfpf6dx@smtp.gmail.com>
 <20200115012756.GA4129@ravnborg.org>
MIME-Version: 1.0
In-Reply-To: <20200115012756.GA4129@ravnborg.org>
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
Cc: Daniel Vetter <daniel.vetter@ffwll.ch>,
 Haneen Mohammed <hamohammed.sa@gmail.com>,
 DRI Development <dri-devel@lists.freedesktop.org>,
 Daniel Vetter <daniel.vetter@intel.com>
Content-Type: multipart/mixed; boundary="===============0676728260=="
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


--===============0676728260==
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="yr5htjyydq52lzcn"
Content-Disposition: inline


--yr5htjyydq52lzcn
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi Sam,

On 01/15, Sam Ravnborg wrote:
> Hi Rodrigo.
>=20
> On Tue, Jan 14, 2020 at 06:50:13PM -0500, Rodrigo Siqueira wrote:
> > On 12/13, Daniel Vetter wrote:
> > > Checking both is one too much, so wrap a WARN_ON around it to stope
> > > the copypasta.
> > >=20
> > > Signed-off-by: Daniel Vetter <daniel.vetter@intel.com>
> > > Cc: Rodrigo Siqueira <rodrigosiqueiramelo@gmail.com>
> > > Cc: Haneen Mohammed <hamohammed.sa@gmail.com>
> > > Cc: Daniel Vetter <daniel@ffwll.ch>
> > > ---
> > >  drivers/gpu/drm/vkms/vkms_plane.c | 2 +-
> > >  1 file changed, 1 insertion(+), 1 deletion(-)
> > >=20
> > > diff --git a/drivers/gpu/drm/vkms/vkms_plane.c b/drivers/gpu/drm/vkms=
/vkms_plane.c
> > > index 5fc8f85aaf3d..6d31265a2ab7 100644
> > > --- a/drivers/gpu/drm/vkms/vkms_plane.c
> > > +++ b/drivers/gpu/drm/vkms/vkms_plane.c
> > > @@ -117,7 +117,7 @@ static int vkms_plane_atomic_check(struct drm_pla=
ne *plane,
> > >  	bool can_position =3D false;
> > >  	int ret;
> > > =20
> > > -	if (!state->fb | !state->crtc)
> > > +	if (!state->fb || WARN_ON(!state->crtc))
> > >  		return 0;
> > > =20
> > >  	crtc_state =3D drm_atomic_get_crtc_state(state->state, state->crtc);
> > > --=20
> > > 2.24.0
> > >
> >=20
> > Hi,
> >=20
> > Sorry, the delay in taking a look at this patch.
> >=20
> > I tried to find the whole series for getting the context related to this
> > patch, but I could not find it in my mailbox. Could you shed some light
> > here? Why check fb and crtc is too much? How the WARN_ON fix the issue?
>=20
> You can find some background in the first patch:
> https://lists.freedesktop.org/archives/dri-devel/2019-December/248981.html

Thanks for the link.

Reviewed-by: Rodrigo Siqueira <rodrigosiqueira@gmail.com>
Tested-by: Rodrigo Siqueira <rodrigosiqueira@gmail.com>

Best Regards
=20
> Hope this sched enough light on the topic.
>=20
> 	Sam

--=20
Rodrigo Siqueira
Software Engineer, Advanced Micro Devices (AMD)
https://siqueira.tech

--yr5htjyydq52lzcn
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCgAdFiEE4tZ+ii1mjMCMQbfkWJzP/comvP8FAl4fnTwACgkQWJzP/com
vP8b8w/+PpLUB+msxm28RNBMnfyJGfDuhiVGgVu/Cqd7Ipzq7xyhrt6bMSV8Wo9S
2nXYZYLbOlgTw17uH0vhwsnBJwKWmqVHY0XwEpVFPkvADRNyGCHsGubUf8to5z4x
c6ZXXi+jl7l1LZdkx1jpeB4eZSbnXsMEENsqNooDkjixlMpbzX7/0AeDDomy1vbc
EJJDvgmZxWqZcNR6J2IO6kd4PIDiz2UOm1M5kE8vM7c9mK5mGr5x0BdSpz0VX1dT
MXy8LFi2gueiwBmTH31qywnoK6DVItmE1LAyja+5FOM421k5710bxq8McPG3id/Z
1WdsdW/Oz+OFDp+1CKL1RcqXlxSUAu+7uDlpjeARQ17zlzvw0zqpeUmUKLjiC2HD
cYMtJTx1IeN6DA9Dwl7hIJBMOquDr4cy9xivQDB//i2hn8SviMZqOsRXN4hGtWDa
Ql4LtwgA4jeG72NkFKHkkLmrhWvXIq+qWRVXt1oGtIixzMB1/nG4/cgC94qV7/IQ
OOG2XPFigrqmUIs7W8SMqkpYFjz0ak+fLMIPmq8cHKJeHV3iTivnAbic3smLOOTh
rTu4NxfYKxjwpwnanyNiiF7NoOs6ox86xGYDKeHdCVlBccYYUoUqlybXFloEx1hY
MhTRGITFj4wkix4TrlL9y/EkKC8blDMDFFBrHp1G8bh0gL+sJNk=
=gH5+
-----END PGP SIGNATURE-----

--yr5htjyydq52lzcn--

--===============0676728260==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel

--===============0676728260==--
