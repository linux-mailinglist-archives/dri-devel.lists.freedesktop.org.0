Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id D634D7421BA
	for <lists+dri-devel@lfdr.de>; Thu, 29 Jun 2023 10:04:01 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6174D10E3BB;
	Thu, 29 Jun 2023 08:03:57 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-x135.google.com (mail-lf1-x135.google.com
 [IPv6:2a00:1450:4864:20::135])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 23BED10E3BB
 for <dri-devel@lists.freedesktop.org>; Thu, 29 Jun 2023 08:03:55 +0000 (UTC)
Received: by mail-lf1-x135.google.com with SMTP id
 2adb3069b0e04-4fb96e2b573so591458e87.3
 for <dri-devel@lists.freedesktop.org>; Thu, 29 Jun 2023 01:03:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20221208; t=1688025833; x=1690617833;
 h=mime-version:references:in-reply-to:message-id:subject:cc:to:from
 :date:from:to:cc:subject:date:message-id:reply-to;
 bh=eq53CIFTLhRmjx5KrPYU9iiyTMEaDQf8XoKrYr20ffo=;
 b=LxBzdE/0zH7h1xiESO9PHtTGjj+4DrBFI4rdO/pHKHlzVtbeaooXfvvlsKsUt2MRbX
 CnOQ4lX13TAZR80flwctWuM2uhHxHJaNhIu1kghFWVVuE1EHFy9hiMP0Zigd7ZEE5XMB
 0ULdX4SwrhsiO+AE7v8KMTNV/KTg3VqUHY1OUth2MZ5B7FdGD/9uFLrxU09USsSe2OuJ
 mjy4TyFISrzC3ZGqEMc1i5DiXV5j5ldpLsVHK+xGuWsfGiShWGzyhb0tViZm0nQj5z/q
 jAKkDqpAV6T32BoM+L767KjEAzjnjZkNF6FssPjcmmTARO14SJPdJOIa/JVBMUA0tLRE
 YO3Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1688025833; x=1690617833;
 h=mime-version:references:in-reply-to:message-id:subject:cc:to:from
 :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=eq53CIFTLhRmjx5KrPYU9iiyTMEaDQf8XoKrYr20ffo=;
 b=eBE1p/PApR8ckbHrIOx7THcpk09f14bUieoyVaSDyRftTJptr9+slQ4M0xmgJxVlFN
 Lc02G4Haxwsn9mgX6QsyjZxmnLT8GaDOnnpPFgc4IOTYijo6D96v2R4shYVHOpm/wBXN
 7n1GWHiVi9RupxT6tFJ1M/odgWM6B7VddHj2JI/ZhUnHt7xgrr7sNR9ivzLB1FmBTrJ3
 rJXptjffIIlkHXui1UwY+gl2seAcpeIZY1JxlAVWLE4gGdtFyguKd+uKfSrRssnuBKi2
 oEPZQrgDJRHP6sO8dVUKxDBwS2QV/BOurM1H8T7GjscFxCe8aV/xEDOzQ9guOaiXsUf6
 qqdQ==
X-Gm-Message-State: AC+VfDyivPA2TisfRjulR62nlYizNF7xQ147R0JU0W3220c7WCm8iyMZ
 wZpmAEKDop5w3Fl/b+AAJNc=
X-Google-Smtp-Source: ACHHUZ7prPCQoAnvahKRXOi1/W0vZoBh9+igC/IWqIGETEpOAHY3/6laB23vbjaozqudPgVR82EWzA==
X-Received: by 2002:a05:6512:3ba5:b0:4fb:8fde:f60d with SMTP id
 g37-20020a0565123ba500b004fb8fdef60dmr3878403lfv.22.1688025832471; 
 Thu, 29 Jun 2023 01:03:52 -0700 (PDT)
Received: from eldfell ([194.136.85.206]) by smtp.gmail.com with ESMTPSA id
 p24-20020ac246d8000000b004fb7848bacbsm1372426lfo.46.2023.06.29.01.03.51
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 29 Jun 2023 01:03:52 -0700 (PDT)
Date: Thu, 29 Jun 2023 11:03:48 +0300
From: Pekka Paalanen <ppaalanen@gmail.com>
To: Zack Rusin <zackr@vmware.com>
Subject: Re: [PATCH v4 2/8] drm/atomic: Add support for mouse hotspots
Message-ID: <20230629110348.3530f427@eldfell>
In-Reply-To: <2fb2f3985df4d6710e5ad33f6e618a52004714df.camel@vmware.com>
References: <20230628052133.553154-1-zack@kde.org>
 <20230628052133.553154-3-zack@kde.org>
 <20230628104106.30360b55@eldfell> <20230628105424.11eb45ec@eldfell>
 <2fb2f3985df4d6710e5ad33f6e618a52004714df.camel@vmware.com>
X-Mailer: Claws Mail 4.1.1 (GTK 3.24.37; x86_64-pc-linux-gnu)
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/Z6VhLfhCdcXjb7A_CE/n9A0";
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
Cc: "mripard@kernel.org" <mripard@kernel.org>,
 "airlied@linux.ie" <airlied@linux.ie>,
 "javierm@redhat.com" <javierm@redhat.com>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 Martin Krastev <krastevm@vmware.com>, Michael Banack <banackm@vmware.com>,
 "tzimmermann@suse.de" <tzimmermann@suse.de>, Ian Forbes <iforbes@vmware.com>,
 Maaz Mombasawala <mombasawalam@vmware.com>, "zack@kde.org" <zack@kde.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

--Sig_/Z6VhLfhCdcXjb7A_CE/n9A0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

On Wed, 28 Jun 2023 19:54:49 +0000
Zack Rusin <zackr@vmware.com> wrote:

> On Wed, 2023-06-28 at 10:54 +0300, Pekka Paalanen wrote:
> > On Wed, 28 Jun 2023 10:41:06 +0300
> > Pekka Paalanen <ppaalanen@gmail.com> wrote:
> >  =20
> > > On Wed, 28 Jun 2023 01:21:27 -0400
> > > Zack Rusin <zack@kde.org> wrote:
> > >  =20
> > > > From: Zack Rusin <zackr@vmware.com>
> > > >=20
> > > > Atomic modesetting code lacked support for specifying mouse cursor
> > > > hotspots. The legacy kms DRM_IOCTL_MODE_CURSOR2 had support for set=
ting
> > > > the hotspot but the functionality was not implemented in the new at=
omic
> > > > paths.
> > > >=20
> > > > Due to the lack of hotspots in the atomic paths userspace composito=
rs
> > > > completely disable atomic modesetting for drivers that require it (=
i.e.
> > > > all paravirtualized drivers).
> > > >=20
> > > > This change adds hotspot properties to the atomic codepaths through=
tout
> > > > the DRM core and will allow enabling atomic modesetting for virtual=
ized
> > > > drivers in the userspace.
> > > >=20
> > > > Signed-off-by: Zack Rusin <zackr@vmware.com>
> > > > Cc: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>
> > > > Cc: Maxime Ripard <mripard@kernel.org>
> > > > Cc: Thomas Zimmermann <tzimmermann@suse.de>
> > > > Cc: David Airlie <airlied@linux.ie>
> > > > Cc: Daniel Vetter <daniel@ffwll.ch>
> > > > Reviewed-by: Javier Martinez Canillas <javierm@redhat.com>=C2=A0  =
=20
> > >=20
> > > Hi Zack,
> > >=20
> > > I still do not see any UAPI docs for the new properties in this patch=
? =20
> >=20
> > If you are wondering what there could be to write about, maybe this can
> > give a good mindset:
> >=20
> > Let's assume that I am a Wayland compositor developer who has never used
> > "hotspots" with KMS UAPI before. As I have never tested anything in a
> > VM, I have no idea why the kernel would ever want to know about cursor
> > hotspots. Display hardware never does anything with that, it just puts
> > the cursor plane where I tell it to and composes a single image to be
> > sent to the sink. The virtual driver VKMS does the same. To me, a
> > cursor plane is just another universal plane that may have weird
> > stacking order, pixel format, and size limitations.
> >=20
> > Ideally the doc for HOTSPOT_X and HOTSPOT_Y documents not only their
> > possible existence and allowed/expected values, but also the reasons
> > to have them and what they are used for, and that if the properties
> > are exposed they are mandatory to program in order to use the plane. =20
>=20
> Instead of resending the entire series maybe I can draft a possible doc b=
elow and
> see if we like it (once we're ok with I'll send out v5 which hopefully wi=
ll be
> good). How about:

Hi Zack,

cool!

>=20
> /**
>  * @hotspot_x_property: property to set mouse hotspot x offset.

Hmm, this does not look like the style of
https://www.kernel.org/doc/html/latest/gpu/drm-kms.html#plane-composition-p=
roperties

I suspect it's a .rst file somewhere.

It is important to use the userspace visible concepts and names, like
the property name being "HOTSPOT_X", not hotspot_x_property. After all,
"HOTSPOT_X" is the string that userspace must use to find this
property. That's the UAPI.

>  *
>  * Hotspot is the point within the cursor image that's activating
>  * the click e.g. imagine an arrow cursor pointing to bottom right -
>  * the origin coordinate for that image would be top left
>  * but the point which would be propagating the click would be
>  * the bottom right cursor position (crtc_x, crtc_y) + hotspot
>  * coordinates which for bottom right facing arrow would probably
>  * be (cursor_width, cursor_height).

Is it really required that the hotspot coordinates fall inside the
cursor plane? Will the atomic commit be rejected otherwise?

Are they given with respect to the cursor plane top-left corner,
positive directions being right/down? Is the unit in CRTC pixels or FB
pixels? The example does give an indirect answer, but my personal taste
would like it to be more explicit.

>  *
>  * This information is only relevant for drivers working on top
>  * of para-virtualized hardware. The reason for that is that
>  * the hotspot is fairly encapsulated in the system but imagine having
>  * multiple windows with virtual machines running on servers
>  * across the globe, as you move the mouse across the screen
>  * and the cursor moves over those multiple windows you wouldn't
>  * want to be sending those mouse events to those machines, so virtual
>  * machine monitors implement an optimization where unless the mouse
>  * is locked to the VM window (e.g. via a click) instead of propagating
>  * those mouse events to those VM's they change the image of the native
>  * cursor to what's inside the mouse cursor plane and do not interact
>  * with the VM window until mouse is clicked in it.

Surely the mouse events are sent to those machines across the globe
regardless?

The point I believe you want to make is that in addition that, a
virtual machine viewer application independently moves the cursor image
on the viewer window to avoid the roundtrip latency across the globe
between mouse movement and cursor movement.

Why is the locking you mention relevant? Wouldn't you do this
optimization always if there is any cursor plane image set?

Or if you literally do mean that no input is sent to the VM at all
until the pointer is locked to that window, then why bother using the
guest cursor image without locking?

I suppose different viewers could do different things, so maybe it's
not necessary to go into those details. Just the idea of the viewer
independently moving the cursor image to reduce hand-eye latency is
important, right?

>  *
>  * In order for that click to correctly and seamlessly propagate
>  * between the native and virtual machine, not only the cursor image
>  * but also the hotspot information has to match between them.
>  *
>  * Make sure to set this property on the cursor plane if you'd like
>  * your application to behave correctly when running on
>  * para-virtualized drivers (qxl, vbox, virtio or vmwgfx).
>  * /

I think you could be more strict here. If these properties exist, then
userspace must set them appropriately and use the cursor plane only for
an actual input controlled cursor image. I might even leave the driver
list out here, because they are mentioned at
DRM_CLIENT_CAP_CURSOR_PLANE_HOTSPOT doc, and userspace should not base
anything on "if driver is X or Y".

This doc should also link to DRM_CLIENT_CAP_CURSOR_PLANE_HOTSPOT.

The question of which input device corresponds to which cursor plane
might be good to answer too. I presume the VM runner is configured to
expose exactly one of each, so there can be only one association?

Btw. for my own curiosity, what happens if there are two simultaneous
viewer instances open to the same VM/guest instance? Will they fight
over controlling the same pointer?


Thanks,
pq

--Sig_/Z6VhLfhCdcXjb7A_CE/n9A0
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEEJQjwWQChkWOYOIONI1/ltBGqqqcFAmSdOuQACgkQI1/ltBGq
qqesdA//TyHYL8QzYlH9/ZupaONLeG89EtwA1ensRqSKDhqSooRucbce7L2rpjtN
OLm7KjMQs/XP3sx+gmuUITNRCmMdb3x1L2+ZPHlvl64bJdojTlBtHQtVNge5vi/w
lGTIEfMWrhjOY9JL6m329KHobgG7t8tGzd3PRaideOKfTXpLmH+76Emb9Sxvw+wY
uWmRoSa7G97UTxic1vH/y2+i+1/EVejYYjHpLEGB0SeoO75DKoWPl5LIvJs4dZoW
D5EbhQ2u6d5pzC/02xdkovjfJ6Z+gIJY3ZuXA6uJ8UcBemhAiJwuh12v9+e0nk+v
OOfAZQLvANW/wGPz1Bw/MgzqFIPyIHAWWkXoCAimwdxEarBk70nH1gLpZueFLuR2
owfYCeXwxHwan6rGs01qQcU6iiEAKAL1g+l3uMVJol7wdB8LqNsMizfMTYDcIYey
HlrEkKyq92e+HwW6bpcO/UB6/0KJ8WxeMXpgLR5yvLHB/gFWrs/cip5to7Y5SMN2
BhoVEOKxWmZzT6vB66KNqidYAvyFaSloSGZY5Yd5322T0B92p+ZVGByz+YPFG/eX
HyaR3J9FhBSOeVHfcwPU+29VebLYrwLpOSmvy6vhSjhIBt5jg1fxa44es2S7ogRX
M573tYD0dZYkP7MpkAfMKVAD55UlII5NzivGDXzx4psFjW9p1GU=
=ll1L
-----END PGP SIGNATURE-----

--Sig_/Z6VhLfhCdcXjb7A_CE/n9A0--
