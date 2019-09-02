Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 2B821A5970
	for <lists+dri-devel@lfdr.de>; Mon,  2 Sep 2019 16:33:05 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 29E8589AAD;
	Mon,  2 Sep 2019 14:33:03 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x441.google.com (mail-wr1-x441.google.com
 [IPv6:2a00:1450:4864:20::441])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DDB7789AAD
 for <dri-devel@lists.freedesktop.org>; Mon,  2 Sep 2019 14:33:01 +0000 (UTC)
Received: by mail-wr1-x441.google.com with SMTP id g7so14288279wrx.2
 for <dri-devel@lists.freedesktop.org>; Mon, 02 Sep 2019 07:33:01 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=RSjj26PRkCP6zquABCF41VzZw7p0TMAe+jE5D+6Evzo=;
 b=LyhAYufDq68nRIZFgguiaYJcqiyE1DlT80RJXkMN9d+kIBL8DcLANNRejEri5nSO5Z
 QVTJWbKzxQNzFFclYOcxvbg+eBsuO2Wagrq6/gsG+C17y+eFeInFm2msqwRSb0wJQgHJ
 5w7z4osbr0IobnOpk8ZksbY+wOjqqusTcVET1eXlVAh6nor6RvYYN79RdkEnXwITcjim
 IlgYgaJ59LaWcpMG3YmJFSZQ7WnFKU1XxGVsi3Us8v8q4Tu5vWiNAr7u8AkFXM5sZj4T
 7hiYBFhjImn3uVSGYXqveKuRmXh1PMcPw/DGI8p969+PPMzzVOgoMwgY+EPBHDJtrcr2
 PmPQ==
X-Gm-Message-State: APjAAAU8Qju8bjpBHtQo86rNL+IPq0SisPGOXZiU1/Vn5K3RqLdGGkx9
 uwQb/GvXawkU56Vnh2p/HOE=
X-Google-Smtp-Source: APXvYqzletXmMmekFBZcDabmcAabtK7KjkWliET/zf/QlSiQb5U5QxOwI2Yx5xdpQFNYoMfIz2tXbg==
X-Received: by 2002:a5d:640f:: with SMTP id z15mr5182349wru.217.1567434780412; 
 Mon, 02 Sep 2019 07:33:00 -0700 (PDT)
Received: from localhost (pD9E51890.dip0.t-ipconnect.de. [217.229.24.144])
 by smtp.gmail.com with ESMTPSA id q25sm3206412wmq.27.2019.09.02.07.32.58
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 02 Sep 2019 07:32:58 -0700 (PDT)
Date: Mon, 2 Sep 2019 16:32:57 +0200
From: Thierry Reding <thierry.reding@gmail.com>
To: Linus Walleij <linus.walleij@linaro.org>
Subject: Re: [PATCH 2/2] drm/panel: Add driver for Sony ACX424AKP panel
Message-ID: <20190902143257.GA1445@ulmo>
References: <20190902090633.24239-1-linus.walleij@linaro.org>
 <20190902090633.24239-2-linus.walleij@linaro.org>
 <20190902103219.GB12946@ulmo>
 <CACRpkdYW3YNPSNMY3A44GQn8DqK-n9TLvr7uipF7LM_DHZ5=Lg@mail.gmail.com>
MIME-Version: 1.0
In-Reply-To: <CACRpkdYW3YNPSNMY3A44GQn8DqK-n9TLvr7uipF7LM_DHZ5=Lg@mail.gmail.com>
User-Agent: Mutt/1.12.1 (2019-06-15)
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20161025;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to:user-agent;
 bh=RSjj26PRkCP6zquABCF41VzZw7p0TMAe+jE5D+6Evzo=;
 b=EyqoxT9I/bUngOTn2iYtK64E2IIiwFnpktjUrv9dqGMBBH4SeC4Dc0EyIRaQTy4+QH
 kz/bHCXWLko00bRfxj5VDYdOVufP8WP1L3UtPPPAw50FBlxUDfHebmlyxEUeptZelMqb
 dQYyDaASYJ90VgdoaHgU0AENMbDi+4j4iXdaRHZiN9XEw3qgh+2+bT/3K3OCPwLAmDLK
 zfkY9t+qVPDTTiMXDgfCqAPqddVRNCZCH/IwkFGAtkKNbNnDA9pt992i+A68WxudeNkE
 raLe7kzshsmf6ntEODtwR9SP14+pvXLK973wZTsjkytjj8laD4hWvHdLXqPSLZscuTGL
 BWUA==
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
Cc: Sam Ravnborg <sam@ravnborg.org>,
 "open list:DRM PANEL DRIVERS" <dri-devel@lists.freedesktop.org>
Content-Type: multipart/mixed; boundary="===============1650343941=="
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


--===============1650343941==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="vtzGhvizbBRQ85DL"
Content-Disposition: inline


--vtzGhvizbBRQ85DL
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Sep 02, 2019 at 02:57:25PM +0200, Linus Walleij wrote:
> On Mon, Sep 2, 2019 at 12:32 PM Thierry Reding <thierry.reding@gmail.com>=
 wrote:
> > On Mon, Sep 02, 2019 at 11:06:33AM +0200, Linus Walleij wrote:
>=20
> > > +     /*
> > > +      * This depends on the clocking HS vs LP rate, this value
> > > +      * is calculated as:
> > > +      * vrefresh =3D (clock * 1000) / (htotal*vtotal)
> > > +      */
> > > +     .vrefresh =3D 816,
> >
> > That's a bit odd. My understanding is that command mode can be done in
> > continuous mode or in non-continuous mode. In continuous mode you would
> > typically achieve a similar refresh rate as in video mode. For non-
> > continuous mode you basically have a variable refresh rate.
> >
> > For continuous mode you probably want 60 Hz here and for VRR there's
> > probably no sensible value to set this to. In the latter case, I don't
> > think it makes sense to set anything arbitrary like you have above.
> > Perhaps better to just set it to 0 as a way of signalling that this is
> > actually dependent on when the display hardware sends a new frame?
>=20
> I guess I should set it to 60.

Not sure, perhaps someone on the list has a good idea of what vrefresh
is set for VRR monitors. I think that'd be a good example to follow.

I'm also not sure your formula to compute the refresh rate is good for
command mode. You're assuming one pixel per clock cycle. I don't think
that's accurate. Shouldn't that at least depend also on the number of
lanes and the pixel format? 816 frames per second also seems a bit much
for any type of panel.

> > Have you actually run this is command mode?
>=20
> Yes that is what I am primarily using.
>=20
> > If so, what's the actual
> > refresh rate? Do you do on-demand updates or do you run in continuous
> > mode?
>=20
> I run continuous mode, so the refresh rate is essentially dependent on
> the HS frequency that the host uses. For command mode we use as
> fast as it can go which is 420MHz, backwards calculated to ~816Hz
> updates.
>=20
> I took some data from the system when running:
> 175608 "vblank" interrupts in 25 minutes, yielding
> 175608/(25*60) ~=3D 117 Hz so I guess that is the pace the
> hardware actually recieves it and triggers new updates.

That's a factor of almost 8, so I think there's something really wrong
in your refresh rate calculation, or you have an issue somewhere in the
code that computes the pixel clock and byte clock from the mode's clock
rate.

>=20
> > > +     ret =3D mipi_dsi_dcs_read(dsi, 0xda, &id1, len);
> > > +     if (ret < 0) {
> > > +             DRM_DEV_ERROR(acx->dev, "could not read device ID byte =
1\n");
> > > +             return ret;
> > > +     }
> > > +     ret =3D mipi_dsi_dcs_read(dsi, 0xdb, &id2, len);
> > > +     if (ret < 0) {
> > > +             DRM_DEV_ERROR(acx->dev, "could not read device ID byte =
2\n");
> > > +             return ret;
> > > +     }
> > > +     ret =3D mipi_dsi_dcs_read(dsi, 0xdc, &id3, len);
> > > +     if (ret < 0) {
> > > +             DRM_DEV_ERROR(acx->dev, "could not read device ID byte =
3\n");
> > > +             return ret;
> > > +     }
> > > +
> > > +     val =3D (id3 << 8) | id2;
> >
> > Don't you want to OR in id1 here as well? Seems a bit odd to read it but
> > then not use it.
>=20
> The way I have understood these "MTP IDs" is that the first byte
> should just be checked for not being 0 so I will add a check like that.
>=20
> The only other DSI panel doing this is panel-samsung-s6e8aa0.c function
> s6e8aa0_read_mtp_id() which also reads three bytes and ignores the
> first byte, also the second byte being version and the third ID matches
> the data this display returns.
>=20
> I'll try to make it a bit clearer and inspect the individual bytes since =
they
> seem to have individual meanings.

I vaguely recall MTP IDs. It's a little funny that both S6E8AA0 and this
new driver seem to be reading the same type of ID, but using different
DCS register offsets. I had hoped that these would be somewhat
standardized. Or perhaps these are standardized as part of a larger type
of descriptor to which an offset is read from somewhere else?

> > > +     struct device *dev =3D &dsi->dev;
> > > +     struct acx424akp *acx;
> > > +     int ret;
> > > +     int i;
> >
> > unsigned int?
>=20
> Just following the common idiom for integer enumerator i to be a
> plain int but sure, if you prefer :)

The common idiom is wrong. =3D)

Jokes aside, why worry about the sign if you know up front that your
values are never going to be negative? If you consistently use unsigned
types for values that can never be negative, the compiler will even be
able to point out inconsistent usage, etc.

Thierry

> > > +     /* Read device ID */
> > > +     i =3D 0;
> > > +     do {
> > > +             ret =3D acx424akp_read_id(acx);
> > > +             if (ret)
> > > +                     continue;
> > > +     } while (ret && i++ < 5);
> >
> > Seems rather redundant to have both an "if (ret) continue;" and the ret
> > check in the while's condition. A more idiomatic way to write this would
> > be:
> >
> >         for (i =3D 0; i < 5; i++) {
> >                 ret =3D acx424akp_read_id(acx);
> >                 if (!ret)
> >                         break;
> >         }
>=20
> OK! I fix.
>=20
> Yours,
> Linus Walleij

--vtzGhvizbBRQ85DL
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEEiOrDCAFJzPfAjcif3SOs138+s6EFAl1tKBYACgkQ3SOs138+
s6GblA/9G5A/H4E0Ffu/OzVu+KObo4Rm7Pby4aneyNHtqu6HrUUZz59YdY1MWKlu
Vaqc8YHOsHD4FSz36cqVTJR+N0YNz9smjdurPS1z7tfBve9Ws3jajHqDpvFd1j2d
Wcmjq189NsevlDcOsIt7W1M2lxcTjp55inNifY1KT8XhtS/iVg0zeP7tb6WXIBwA
F2an8S8gsc4KrWavTTo2WC572nnvzQZAPJTbVGiXYUeBKKyyaSl2HJ1HfOl95laq
avpLqaKZIywqEnvt5p1RHALTTwaHT3FQ4hzPjID+R+WMhWVg4g6Bf6xwQCf8mRKF
DurEiaiugSHsF5G9BM3DcvArLb+NiO8SdNzQ+abr+i4727T+lj9KwZhv6sYoZf9f
v0iRxHqwONs5vH+6HPtuDelrqNJHa63Vs0ElEFqefyFS8BD12jDe/UHVxAFrQx4O
LVOSBh6Pg6GakrzWDkTYS+ai0TTT/Qci01FMWcMVP/OwbffXh+ZaMP16TlHS2rmw
ecBpPZ6sR41IbL8LF01IKJNk7Qy4LblC9J6ssUbcWwuZjsJn+E88AHJ7pHwEDd7G
lOdWLeXh07ybO8dY9rt0ZyDVM5v5i2Ov48Yf+oSoxmSx+3JPpIgBU8WeJi3MCRPx
F8v/WgBdaOywA5GF2H4cfIveVeoaRKrQAoFj2KF/+aFdokhvU1c=
=do+2
-----END PGP SIGNATURE-----

--vtzGhvizbBRQ85DL--

--===============1650343941==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVs
IG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlz
dHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVs

--===============1650343941==--
