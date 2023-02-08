Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id D6B5668EAFD
	for <lists+dri-devel@lfdr.de>; Wed,  8 Feb 2023 10:18:54 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5106210E186;
	Wed,  8 Feb 2023 09:18:50 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ej1-x636.google.com (mail-ej1-x636.google.com
 [IPv6:2a00:1450:4864:20::636])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D34AF10E186;
 Wed,  8 Feb 2023 09:18:48 +0000 (UTC)
Received: by mail-ej1-x636.google.com with SMTP id ud5so49635849ejc.4;
 Wed, 08 Feb 2023 01:18:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=mime-version:references:in-reply-to:message-id:subject:cc:to:from
 :date:from:to:cc:subject:date:message-id:reply-to;
 bh=P7r18L9TJxzF6s0ATKVBHcJp6sFYaizl7MrVlQkLGrM=;
 b=VW+7CiaamZ4XzRfyKDUWIdW9MRJ8FkBSKxC4CXR81PDhaF/ReqUiy83ZDiBAIHNzVa
 Pz77cUqDNm775h9CZK/XbXXhdDkLO71MyYelERXPj2qoyR84yBNPWQydAs3X+BMnEXs9
 OhNisBfaUpXCLPKqjTCoJWxOSLM/DvatNPsL/L3vy7rqTyBMe2EqmMnKnaAUYNe/wK4o
 4Rg6dg8Ubcxwf2AhpuGNCibB9F6NqaLGYswSGpMFRlUOPCJxhBHeH8McWKHKWRxyZHwD
 t2myF2lLGKSk7aFr5Ux4ZNY50pGEu+bmIjKeH3DzwHbbpHi4Dz2rG4hqVqOKwae/cr+b
 uiGg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=mime-version:references:in-reply-to:message-id:subject:cc:to:from
 :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=P7r18L9TJxzF6s0ATKVBHcJp6sFYaizl7MrVlQkLGrM=;
 b=Cir3fIjcq70YCfEHgTdovbBwEsjgPk82oUvRwIYp27u18EFZ/zRpoCLtTZU+bagkpW
 wrOe9+olWP8hrTeVVbsajYiJ0Vv1Lpr7FcRwoz6ZTz1mhjoNmBOhb7mWaDCDBK/hjW9l
 Ryn9zZoHue26WuML6IIj+GqW0fodYx8vJxWadx/XYxXw5zIPCAg6TN2jbmOf98QXJG/v
 XSNQYm8MkHwX/G8DzJ/fAGTnyO5y3XbmTGBbXdBXk6CO+169MdrAr5vRoWwX4+kXHt0w
 ClbeFmaD8vD7AkNqcdBj6vm5riLRlYMG8nUD43y1DAAAgyEWAPYSHramlG8t/VKqOD1f
 zV4A==
X-Gm-Message-State: AO0yUKX/i8WT10yd3XPN+EAUjBW3EfnJTTMvnE+/Xso1xEzj/lFmB3PE
 YzCB9rKDq0qzREgH0J8L3o0=
X-Google-Smtp-Source: AK7set/5TptkYLfwuevF7JxbjkA5RZ4rqAUPQ6og6PVv5ZglusIkjlbrsrNYxpWnxqsThjCe9ELPkw==
X-Received: by 2002:a17:907:20cb:b0:87f:89f2:c012 with SMTP id
 qq11-20020a17090720cb00b0087f89f2c012mr7380474ejb.24.1675847927319; 
 Wed, 08 Feb 2023 01:18:47 -0800 (PST)
Received: from eldfell ([194.136.85.206]) by smtp.gmail.com with ESMTPSA id
 c15-20020a170906340f00b008778f177fbesm8173948ejb.11.2023.02.08.01.18.46
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 08 Feb 2023 01:18:46 -0800 (PST)
Date: Wed, 8 Feb 2023 11:18:42 +0200
From: Pekka Paalanen <ppaalanen@gmail.com>
To: Ville =?UTF-8?B?U3lyasOkbMOk?= <ville.syrjala@linux.intel.com>
Subject: Re: [PATCH 3/3] drm/connector: Deprecate split for BT.2020 in
 drm_colorspace enum
Message-ID: <20230208111842.4d7aacb2@eldfell>
In-Reply-To: <Y90UC43KouMRh8I2@intel.com>
References: <20230203020744.30745-1-joshua@froggi.es>
 <20230203020744.30745-3-joshua@froggi.es>
 <Y9zkef5FjtZ7guVS@intel.com>
 <CA+hFU4ymiOg06MQeKLcn5MSrR=BZnOLODdZCFvGUdWqt_ha61A@mail.gmail.com>
 <Y90NkvVabh+ue9hF@intel.com>
 <CA+hFU4xR_8=w=z=Jqs3sujTvnXfEQJVHAMFW-X4-55POF=Bu9g@mail.gmail.com>
 <Y90UC43KouMRh8I2@intel.com>
X-Mailer: Claws Mail 3.17.8 (GTK+ 2.24.33; x86_64-pc-linux-gnu)
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/erYYEaO25KIoo8mj+jLWaHG";
 protocol="application/pgp-signature"; micalg=pgp-sha256
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
Cc: Sebastian Wick <sebastian.wick@redhat.com>, amd-gfx@lists.freedesktop.org,
 Uma Shankar <uma.shankar@intel.com>, dri-devel@lists.freedesktop.org,
 Joshua Ashton <joshua@froggi.es>, Vitaly.Prosyak@amd.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

--Sig_/erYYEaO25KIoo8mj+jLWaHG
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

On Fri, 3 Feb 2023 16:02:51 +0200
Ville Syrj=C3=A4l=C3=A4 <ville.syrjala@linux.intel.com> wrote:

> On Fri, Feb 03, 2023 at 02:52:50PM +0100, Sebastian Wick wrote:
> > On Fri, Feb 3, 2023 at 2:35 PM Ville Syrj=C3=A4l=C3=A4
> > <ville.syrjala@linux.intel.com> wrote: =20
> > >
> > > On Fri, Feb 03, 2023 at 01:59:07PM +0100, Sebastian Wick wrote: =20
> > > > On Fri, Feb 3, 2023 at 11:40 AM Ville Syrj=C3=A4l=C3=A4
> > > > <ville.syrjala@linux.intel.com> wrote: =20
> > > > >
> > > > > On Fri, Feb 03, 2023 at 02:07:44AM +0000, Joshua Ashton wrote: =20
> > > > > > Userspace has no way of controlling or knowing the pixel encodi=
ng
> > > > > > currently, so there is no way for it to ever get the right valu=
es here. =20
> > > > >
> > > > > That applies to a lot of the other values as well (they are
> > > > > explicitly RGB or YCC). The idea was that this property sets the
> > > > > infoframe/MSA/SDP value exactly, and other properties should be
> > > > > added to for use userspace to control the pixel encoding/colorspa=
ce
> > > > > conversion(if desired, or userspace just makes sure to
> > > > > directly feed in correct kind of data). =20
> > > >
> > > > I'm all for getting userspace control over pixel encoding but even
> > > > then the kernel always knows which pixel encoding is selected and
> > > > which InfoFrame has to be sent. Is there a reason why userspace wou=
ld
> > > > want to control the variant explicitly to the wrong value? =20
> > >
> > > What do you mean wrong value? Userspace sets it based on what
> > > kind of data it has generated (or asked the display hardware
> > > to generate if/when we get explicit control over that part). =20
> >=20
> > Wrong in the sense of sending the YCC variant when the pixel encoding
> > is RGB for example.
> >=20
> > Maybe I'm missing something here but my assumption is that the kernel
> > always has to know the pixel encoding anyway. The color pipeline also
> > assumes that the pixel values are RGB. User space might be able to
> > generate YCC content but for subsampling etc the pixel encoding still
> > has to be explicitly set. =20
>=20
> The kernel doesn't really know much atm. In theory you can just
> configure the thing to do a straight passthough and put anything you
> want into your pixels.

But it's impossible to use a YCbCr framebuffer and have that *not*
converted to RGB for the KMS color pipeline even if userspace wanted it
to be strictly pass-through, only to be converted again to YCbCr for
the cable, is it not?

Even more so with 4:2:0.

How could it be possible to stop the driver from doing those two
YUV-to-RGB and RGB-to-YCbCr conversions at the beginning and at the end
of the KMS color pipeline?

=46rom uAPI point of view:

"Colorspace" currently defines (or does it? see my patch 2 review) the
colorimetry and the color model encoding. If a driver chooses the cable
encoding independently, the "Colorspace" color model encoding is often
wrong. If we have another KMS property to choose the cable encoding,
then it is possible to still set "Colorspace" to disagree with the
actual cable encoding. What's the use of that possibility to configure
things wrong?


Thanks,
pq

>=20
> >=20
> > So with the kernel always knowing exactly what pixel encoding is sent,
> > why do we need those variants? I just don't see why this is necessary.
> >  =20
> > >
> > > --
> > > Ville Syrj=C3=A4l=C3=A4
> > > Intel
> > > =20
>=20


--Sig_/erYYEaO25KIoo8mj+jLWaHG
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEEJQjwWQChkWOYOIONI1/ltBGqqqcFAmPjaPMACgkQI1/ltBGq
qqc2SQ//RHkU4zBPB71M/CPgwnOHYWlLay2FLD2C47i7YX23RQZa8Ccuw/YZaGtF
a/FKgl5u6QlkjkqQXyAsHqtKSGvgA00ONmS9iniJcr+9RuelezEY2yjS8jAh/VSy
ztDGBWxkpq8jtd7d08L9i7Ux6nFipvy5GInEaZsWknwJuOOpTFzkUvEqm/Q/4pLk
erKG9ieFyqN/Yc+bMO5e6wSLy9ZMM9hifErmSZwICHLBBUy3HKOc5eujH0amOnVh
TC/fMlPaQIEtaLM/l4BEjwaq1MyBUdZiiEEeDsAC2UuybdehVhOmDWskMopQ0wI6
Xzk5oEjleK6iPY55DOnfXtlYoZ1nlrzd59hUnHWFvtu6FZl4ag0oBh0cMSku6+19
4JwC8LHdJ3EOqGHgQjyu3BjzSoveV+IHsU4eTvcEJwnk589qKjkYz9zyp0LCskRG
tFAuMjiJj5LcgXa+9/Urd+a+CFBjbpTZajY3gUhH5YDAWc++GX2SqZuwFL8xqGkV
kfwcVw6m4OKiepPNzxmxVV46MG5/UvegFgLIFPvtVy71qjKxJh9sCPKqzSEv9p+8
1VODdT847FWK3hjiSsRH8q4UfyAOp1SzmlvKMxp5pgS6zSAQG4uT5Ts0lUHsA3FU
+2NLOQbnVsgxXozBiDqYFaYf7UtE5cP4P9uFf8d/+mUOSODtacE=
=tgJp
-----END PGP SIGNATURE-----

--Sig_/erYYEaO25KIoo8mj+jLWaHG--
