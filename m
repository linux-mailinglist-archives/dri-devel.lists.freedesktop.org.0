Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 660CD418050
	for <lists+dri-devel@lfdr.de>; Sat, 25 Sep 2021 10:26:11 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4BDC96E3CE;
	Sat, 25 Sep 2021 08:26:03 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pj1-x102f.google.com (mail-pj1-x102f.google.com
 [IPv6:2607:f8b0:4864:20::102f])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2C6A76E2BC
 for <dri-devel@lists.freedesktop.org>; Sat, 25 Sep 2021 00:45:22 +0000 (UTC)
Received: by mail-pj1-x102f.google.com with SMTP id
 pf3-20020a17090b1d8300b0019e081aa87bso8871817pjb.0
 for <dri-devel@lists.freedesktop.org>; Fri, 24 Sep 2021 17:45:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to;
 bh=A34kxhv/etK3wlwWRi1DywwnkZHmEcyZ1C2q6fi5XAU=;
 b=ICNkqnqUlv5hERimVxDjb3oQbbEiO7fXtn9zgjuaWYI0H2A4qgXxpNqY2Yf4QJBK33
 RiGGBQx0nN4o9u3yWUgqvwP6BdRIOEdmjhRJH51U/QWxZQlS7LF13CgqT1LecAtVNjWl
 1zFlYbZJ4gMtFtfB3irI0/nZl3PCUlGQrwA1Ur2J9HGYb3ykOqhppwVSstLsdEFpqBwH
 3T/m6CANcMY2iGO+ZLCpc4DPlSfqIi08mOULTa5OMSmqucD+st5k3XgHU96eYd5iyuTX
 68hf0xG/SsM2MilXhjqC1Thz2dODDO7guTRKTjJ6uvV7lYXbaQz7F6DGXfUfFjEnzB9U
 hCHA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=A34kxhv/etK3wlwWRi1DywwnkZHmEcyZ1C2q6fi5XAU=;
 b=1A2GBwGCIrvX0MOKtqRiTgRq4ss0asHsSF9+gqOvWVIC4HvMa/LWJU2yXM2BFb/keC
 y2e3iBERM20Jm3eZlvx2hE+TJ4Cpj/b5iQQxigaIdZkkWb+H7JNvnA5+mPYDZiCy2VGE
 FUhEeuxNE/VpaQJJMhFl4ZpiR3NJeA02U8fhcfnQuCs5hU8xX3y32MXp82ajleENnm4r
 Baqki4B3bI/ol8p7nWhISRSb9g+tA3bCelAj6jiGuEXfAkA1bdBvTW9cprPSyVsbHWRd
 5Q/6/3Gixd/Uu3vjtwc33ZI8leS40CJ8fEHPabvxLdvNmZDd5HX2ox1Co6K/vhYnBd76
 Xujg==
X-Gm-Message-State: AOAM533O99z+cFi6VFECoceOucRDY1wxsmxAsLLHceRdK5SyHBwbjXwm
 d71+y9rIA4x9VF7KMgwiyIY=
X-Google-Smtp-Source: ABdhPJzTCBqJ9nKP4Rv8o/4nf9E3U3gCroLCOtIXrFjKsJHEqnOTGau5dHOSwNTO+9gMmWB36Dp1YQ==
X-Received: by 2002:a17:90a:a585:: with SMTP id
 b5mr5518315pjq.201.1632530721593; 
 Fri, 24 Sep 2021 17:45:21 -0700 (PDT)
Received: from shinobu ([156.146.35.76])
 by smtp.gmail.com with ESMTPSA id kt19sm12645460pjb.52.2021.09.24.17.45.17
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 24 Sep 2021 17:45:20 -0700 (PDT)
Date: Sat, 25 Sep 2021 09:45:14 +0900
From: William Breathitt Gray <vilhelm.gray@gmail.com>
To: Tim Gardner <tim.gardner@canonical.com>
Cc: dri-devel@lists.freedesktop.org, Syed Nayyar Waris <syednwaris@gmail.com>,
 Andrzej Hajda <a.hajda@samsung.com>,
 Neil Armstrong <narmstrong@baylibre.com>,
 Robert Foss <robert.foss@linaro.org>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Jonas Karlman <jonas@kwiboo.se>, Jernej Skrabec <jernej.skrabec@gmail.com>,
 David Airlie <airlied@linux.ie>, Daniel Vetter <daniel@ffwll.ch>,
 linux-iio@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] drm/bridge: parade-ps8640: check return values in
 ps8640_aux_transfer()
Message-ID: <YU5xGn6i2a7vjajI@shinobu>
References: <20210924152607.28580-1-tim.gardner@canonical.com>
 <8cdae251-f75e-bde8-a53d-27c77ac624c3@canonical.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
 protocol="application/pgp-signature"; boundary="6zLPgRHrhTXniU0e"
Content-Disposition: inline
In-Reply-To: <8cdae251-f75e-bde8-a53d-27c77ac624c3@canonical.com>
X-Mailman-Approved-At: Sat, 25 Sep 2021 08:25:39 +0000
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


--6zLPgRHrhTXniU0e
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, Sep 24, 2021 at 10:03:27AM -0600, Tim Gardner wrote:
>=20
>=20
> On 9/24/21 9:26 AM, Tim Gardner wrote:
> > Coverity complains of an unused return code:
> >=20
> > CID 120459 (#1 of 1): Unchecked return value (CHECKED_RETURN)
> > 7. check_return: Calling regmap_bulk_write without checking return valu=
e (as is
> > done elsewhere 199 out of 291 times).
> > 204        regmap_bulk_write(map, PAGE0_SWAUX_ADDR_7_0, addr_len,
> > 205                          ARRAY_SIZE(addr_len));
> >=20
> > While I was at it I noticed 2 other places where return codes were not =
being
> > used, or used incorrectly (which is a real bug).
> >=20
> > Fix these errors by correctly using the returned error codes.
> >=20
> > Cc: William Breathitt Gray <vilhelm.gray@gmail.com>
> > Cc: Syed Nayyar Waris <syednwaris@gmail.com>
> > Cc: Andrzej Hajda <a.hajda@samsung.com>
> > Cc: Neil Armstrong <narmstrong@baylibre.com>
> > Cc: Robert Foss <robert.foss@linaro.org>
> > Cc: Laurent Pinchart <Laurent.pinchart@ideasonboard.com>
> > Cc: Jonas Karlman <jonas@kwiboo.se>
> > Cc: Jernej Skrabec <jernej.skrabec@gmail.com>
> > Cc: David Airlie <airlied@linux.ie>
> > Cc: Daniel Vetter <daniel@ffwll.ch>
> > Cc: linux-iio@vger.kernel.org
> > Cc: linux-kernel@vger.kernel.org
> > Cc: dri-devel@lists.freedesktop.org
> > Signed-off-by: Tim Gardner <tim.gardner@canonical.com>
> > ---
> >   drivers/gpu/drm/bridge/parade-ps8640.c | 14 +++++++++++---
> >   1 file changed, 11 insertions(+), 3 deletions(-)
> >=20
> > diff --git a/drivers/gpu/drm/bridge/parade-ps8640.c b/drivers/gpu/drm/b=
ridge/parade-ps8640.c
> > index 3aaa90913bf8..591da962970a 100644
> > --- a/drivers/gpu/drm/bridge/parade-ps8640.c
> > +++ b/drivers/gpu/drm/bridge/parade-ps8640.c
> > @@ -201,8 +201,12 @@ static ssize_t ps8640_aux_transfer(struct drm_dp_a=
ux *aux,
> >   	addr_len[PAGE0_SWAUX_LENGTH - base] =3D (len =3D=3D 0) ? SWAUX_NO_PA=
YLOAD :
> >   					      ((len - 1) & SWAUX_LENGTH_MASK);
> >  =20
> > -	regmap_bulk_write(map, PAGE0_SWAUX_ADDR_7_0, addr_len,
> > +	ret =3D regmap_bulk_write(map, PAGE0_SWAUX_ADDR_7_0, addr_len,
> >   			  ARRAY_SIZE(addr_len));
> > +	if (ret) {
> > +		DRM_DEV_ERROR(dev, "failed to bulk write ADDR_7_0: %d\n", ret);
> > +		return ret;
> > +	}
> >  =20
> >   	if (len && (request =3D=3D DP_AUX_NATIVE_WRITE ||
> >   		    request =3D=3D DP_AUX_I2C_WRITE)) {
> > @@ -218,13 +222,17 @@ static ssize_t ps8640_aux_transfer(struct drm_dp_=
aux *aux,
> >   		}
> >   	}
> >  =20
> > -	regmap_write(map, PAGE0_SWAUX_CTRL, SWAUX_SEND);
> > +	ret =3D regmap_write(map, PAGE0_SWAUX_CTRL, SWAUX_SEND);
> > +	if (ret) {
> > +		DRM_DEV_ERROR(dev, "failed to write SEND: %d\n", ret);
> > +		return ret;
> > +	}
> >  =20
> >   	/* Zero delay loop because i2c transactions are slow already */
> >   	regmap_read_poll_timeout(map, PAGE0_SWAUX_CTRL, data,
> >   				 !(data & SWAUX_SEND), 0, 50 * 1000);
> >  =20
> > -	regmap_read(map, PAGE0_SWAUX_STATUS, &data);
> > +	ret =3D regmap_read(map, PAGE0_SWAUX_STATUS, &data);
> >   	if (ret) {
> >   		DRM_DEV_ERROR(dev, "failed to read PAGE0_SWAUX_STATUS: %d\n",
> >   			      ret);
> >=20
>=20
> I forgot to mention this patch is for linux-next next-20210924.
>=20
> -----------
> Tim Gardner
> Canonical, Inc

Hi Tim,

For future patches, the git format-patch command has a useful option
'--base'. It will allow you to provide the base tree information for
users and maintainers so that they know where to apply the patch:
https://git-scm.com/docs/git-format-patch#_base_tree_information

Sincerely,

William Breathitt Gray

--6zLPgRHrhTXniU0e
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEk5I4PDJ2w1cDf/bghvpINdm7VJIFAmFOcQ4ACgkQhvpINdm7
VJJVNhAAl6xPD0ZJlPNVKYfjReKsALL2FGB6dGmh/05xr0RJePAV2lBIaN1zjluS
O4mOH4ysNckLY4klB9zaMoVOaNqzVEJ6X4s0EbMpu3kPmyTcPaQzFdib4EO5WQk6
a/TUaswXr+PaEaM8/0GhcNuqUDIqWtwLkFNC9/LjO1VJ82vzNFOcy+DopUfdRc4q
IidzUYYZFG8F36WuYYEw0QNF2mOjityK2A05jj5TfgFMbt3f68JEovvy6LhpoIHY
w7XAJK3WjRJh29B72IN7agB3BbCG5k1gM6PdI12MCfmBRu4irEqox03JyWPR6ZUz
FhueXo/bQg/8n7xiQXXLEJxxmxGxhGVawolg2Myc35PkgO/6JMCmNwVxqRj149BS
MuVUXRwF2gh741p8rT8cgW4Qn4INTJzWEikIFSTwO1YuIO885+S+NJvfU6hTXYRr
yP+vUYpD+txKkezBRa3jWDqIT2nYTAD3U4NmR09fmhQODDa/rIYW5cgghXyV32mH
GZn15Neu7MKe6o/XbDYyQp/OF83v57lhLTcCCOUy73LmjGYfQ1Ddyy5YLAbHB0IA
ypq44HC3iBuN79T7cd5pVNnfMDbtJHxz24EZK4+kySIqvoeHc2oTF/nH6yxG/pCN
aS7nDh37fXrLvDhDACu8uC7z6aDhyDpxsI5l7Er3P0trXxuxGb8=
=ARVo
-----END PGP SIGNATURE-----

--6zLPgRHrhTXniU0e--
