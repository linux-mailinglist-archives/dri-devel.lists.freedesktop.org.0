Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 83BF15745E6
	for <lists+dri-devel@lfdr.de>; Thu, 14 Jul 2022 09:39:06 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3AFE7A25BB;
	Thu, 14 Jul 2022 07:39:04 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lj1-x232.google.com (mail-lj1-x232.google.com
 [IPv6:2a00:1450:4864:20::232])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9FFC2A2D17
 for <dri-devel@lists.freedesktop.org>; Thu, 14 Jul 2022 07:39:02 +0000 (UTC)
Received: by mail-lj1-x232.google.com with SMTP id w17so1176039ljh.6
 for <dri-devel@lists.freedesktop.org>; Thu, 14 Jul 2022 00:39:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=date:from:to:cc:subject:message-id:in-reply-to:references
 :mime-version; bh=58XzIaWTbaxl1bFUr/zxXYvnhH4uQQPMbpdHjlNK2Ao=;
 b=RwjcsXFSLU0KOxr4hIPBYTLJBjDLK6jTPj1JFCOG6CiZE7MP0N9Wsin0tM0m22f+D/
 BLiaWrpcpXDq0P+bmzP3cKuufAWwrGSBdLIxdBDTIAZk9KakTG/JE4bOqQZTlcrUM/A4
 q+UMl6LitubBENCfqnx++hegvxT/6lKhrsLqJpw4lMTrlheIcz5ira1NsHxf/ALjB9vY
 ulMVVznNdqL7xxpwIZfn1WksDAEBC8jXns1xC/n9i3m+4awKEqkNiDihhadlNO1PKx/G
 A8VLMLvqYjDrIDfv9b98+plnLSh63c/9L7LQE7Kt0nqg09y7oYIZvaPj4dEULqW30s02
 /FHA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:in-reply-to
 :references:mime-version;
 bh=58XzIaWTbaxl1bFUr/zxXYvnhH4uQQPMbpdHjlNK2Ao=;
 b=JD/3Rd1d7Fp7J9d6p2J0R51yf0h4TCun3Ic6ODfuuHaq2JiMYqE0aMyqTNVRgqkq3O
 HwOMQ9NmeiUbstn5HiuNgLHOxk8LoT8o94Y2KdQyJ2PvaIeBswKVPTcIGTeH/QGBUDAR
 4ChmBZs5vYQiCo8iSLbTOWJOCoaAI19RDNsoF4inCO+9fbBbNb4v5T0yWWEnM1NbPII3
 cs07rGQBfgBjTIoKp0zzQ4+GsICKrf9n1/bD32eEmLbJwMo/CgHiVBVidqvKiPm+M27D
 dG2KIMPqd2sezTz5aQ9YwufZYZXitno0BQjWTS4urMjLx3bxGFTvXNRGBuR2addYE779
 +LwQ==
X-Gm-Message-State: AJIora91XixgOC+LRhQJxUpPCcbNjIbOYr5TWvQwfZsb8JUY0I13uA0T
 APy2k37PEPQWb2kDtk7KDys=
X-Google-Smtp-Source: AGRyM1s2B4WM1qNCHiUdXrj2iGflY8DMuRc7AruTWU3FiJcQhRoCIxcX66TimEKQsyr20tXLuyGHDQ==
X-Received: by 2002:a05:651c:a12:b0:25d:9ab3:4b38 with SMTP id
 k18-20020a05651c0a1200b0025d9ab34b38mr1138376ljq.409.1657784340670; 
 Thu, 14 Jul 2022 00:39:00 -0700 (PDT)
Received: from eldfell ([194.136.85.206]) by smtp.gmail.com with ESMTPSA id
 f15-20020a05651c02cf00b0025d47112194sm133793ljo.131.2022.07.14.00.38.59
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 14 Jul 2022 00:39:00 -0700 (PDT)
Date: Thu, 14 Jul 2022 10:38:49 +0300
From: Pekka Paalanen <ppaalanen@gmail.com>
To: Zack Rusin <zackr@vmware.com>
Subject: Re: [PATCH v2 5/8] drm/vboxvideo: Use the hotspot properties from
 cursor planes
Message-ID: <20220714103849.7a8f3a11@eldfell>
In-Reply-To: <dec419841e594094949ea86d1fe2c017e1c6555d.camel@vmware.com>
References: <20220712033246.1148476-1-zack@kde.org>
 <20220712033246.1148476-6-zack@kde.org>
 <20220712105600.4a8592c1@eldfell>
 <50fd57193508f33a1e559ef74599c9e52764850d.camel@vmware.com>
 <20220713102036.13aa93ee@eldfell>
 <dec419841e594094949ea86d1fe2c017e1c6555d.camel@vmware.com>
X-Mailer: Claws Mail 3.17.8 (GTK+ 2.24.33; x86_64-pc-linux-gnu)
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/ddf26Jbv/SA.bdtdFd_zVbS";
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
Cc: Martin Krastev <krastevm@vmware.com>, "airlied@linux.ie" <airlied@linux.ie>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 "hdegoede@redhat.com" <hdegoede@redhat.com>,
 Maaz Mombasawala <mombasawalam@vmware.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

--Sig_/ddf26Jbv/SA.bdtdFd_zVbS
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

On Wed, 13 Jul 2022 13:35:56 +0000
Zack Rusin <zackr@vmware.com> wrote:

> On Wed, 2022-07-13 at 10:20 +0300, Pekka Paalanen wrote:
> > On Wed, 13 Jul 2022 03:35:57 +0000
> > Zack Rusin <zackr@vmware.com> wrote:
> >  =20
> > > On Tue, 2022-07-12 at 10:56 +0300, Pekka Paalanen wrote: =20
> > > > On Mon, 11 Jul 2022 23:32:43 -0400
> > > > Zack Rusin <zack@kde.org> wrote:
> > > >    =20
> > > > > From: Zack Rusin <zackr@vmware.com>
> > > > >=20
> > > > > Atomic modesetting got support for mouse hotspots via the hotspot
> > > > > properties. Port the legacy kms hotspot handling to the new prope=
rties
> > > > > on cursor planes.
> > > > >=20
> > > > > Signed-off-by: Zack Rusin <zackr@vmware.com>
> > > > > Cc: Hans de Goede <hdegoede@redhat.com>
> > > > > Cc: David Airlie <airlied@linux.ie>
> > > > > Cc: Daniel Vetter <daniel@ffwll.ch>
> > > > > ---
> > > > >  drivers/gpu/drm/vboxvideo/vbox_mode.c | 4 ++--
> > > > >  1 file changed, 2 insertions(+), 2 deletions(-)
> > > > >=20
> > > > > diff --git a/drivers/gpu/drm/vboxvideo/vbox_mode.c b/drivers/gpu/=
drm/vboxvideo/vbox_mode.c
> > > > > index fa0d73ce07bc..ca3134adb104 100644
> > > > > --- a/drivers/gpu/drm/vboxvideo/vbox_mode.c
> > > > > +++ b/drivers/gpu/drm/vboxvideo/vbox_mode.c
> > > > > @@ -429,8 +429,8 @@ static void vbox_cursor_atomic_update(struct =
drm_plane *plane,
> > > > >  	flags =3D VBOX_MOUSE_POINTER_VISIBLE | VBOX_MOUSE_POINTER_SHAPE=
 |
> > > > >  		VBOX_MOUSE_POINTER_ALPHA;
> > > > >  	hgsmi_update_pointer_shape(vbox->guest_pool, flags,
> > > > > -				   min_t(u32, max(fb->hot_x, 0), width),
> > > > > -				   min_t(u32, max(fb->hot_y, 0), height),
> > > > > +				   min_t(u32, max(new_state->hotspot_x, 0), width),
> > > > > +				   min_t(u32, max(new_state->hotspot_y, 0), height),
> > > > >  				   width, height, vbox->cursor_data, data_size);
> > > > > =20
> > > > >  	mutex_unlock(&vbox->hw_mutex);   =20
> > > >=20
> > > > Hi,
> > > >=20
> > > > this looks like silent clamping of the hotspot coordinates.
> > > >=20
> > > > Should the DRM core perhaps already ensure that the hotspot must re=
side
> > > > inside the plane (fb) boundaries and reject the atomic (TEST_ONLY)
> > > > commit when it's outside?
> > > >=20
> > > > Or if this restriction is not universal, maybe this driver should
> > > > reject invalid hotspots rather than silently mangle them?   =20
> > >=20
> > > TBH, I'm not really sure why vboxvideo is clamping those values. I di=
dn't want to
> > > introduce any regressions by changing it here, but the hotspot code n=
ever specified
> > > that the hotspot offsets have to be positive or even within the plane=
. In a quick
> > > search I couldn't find real world cursors that were doing anything li=
ke that though
> > > so I just left it.
> > >  =20
> > > > Also, if supports_virtual_cursor_plane is false, should there not be
> > > > somewhere code that will ignore the values set to the atomic hotspot
> > > > properties?   =20
> > >=20
> > > Hmm, good question. I'm not sure if there's a case where that could b=
e possible:
> > > without supports_virtual_cursor we either won't have a cursor plane o=
r the client
> > > won't be atomic and will only be allowed to use the old legacy kms io=
ctl's, i.e.
> > > drmModeSetCursor2.
> > >  =20
> > > > When one KMS client switches to another, the first one being hotspot
> > > > aware and the latter not, and both atomic, then the latter KMS clie=
nt
> > > > who doesn't know to drive the hotspot will inherit potentially inva=
lid
> > > > hotspot from the previous KMS client. Does something prevent that f=
rom
> > > > being a problem?   =20
> > >=20
> > > That switch will result in plane state reset, ending in
> > > __drm_atomic_helper_plane_state_reset which will reset both hotspot p=
roperties (set
> > > them to 0). =20
> >=20
> > It will?
> >=20
> > To my knowledge, KMS has never reset anything when one KMS client
> > switches to the next, so that's new.
> >=20
> > What triggers it?
> >=20
> > Only if you actually switch to fbdev/fbcon instead of another userspace
> > KMS client, the fbdev code might reset some things, but not all.
> >  =20
> > > > The old KMS client may have left the virtual cursor plane visible, =
and
> > > > the new KMS client doesn't even know the virtual cursor plane exists
> > > > because it doesn't set the DRM client cap. Something should probably
> > > > ensure the virtual cursor plane gets disabled, right?   =20
> > >=20
> > > Hah, that's also a good question. I *think* the same code to above wo=
uld be ran,
> > > i.e. plane reset which should result in the plane disappearing and th=
e new client
> > > not being able to drive it anymore. At least when running gnome-shell=
, switching to
> > > weston and then switching to gnome-shell things look ok, but I haven'=
t tried running
> > > such clients at the same time. =20
> >=20
> > That's an interesting experiment, but how is "at the same time"
> > different from what you tested?
> >=20
> > As i mentioned above, if you switch to fbcon in between, then you are
> > not switching from one userspace KMS client to the next. =20
>=20
> FWIW, running weston inside gnome-shell as a window also works fine.

Of course it does. :-)

It won't be using DRM or KMS at all in that case. Weston acts as a
Wayland or X11 client in that case (while also being a Wayland
compositor towards its own clients).

> And running=20
> weston-simple-damage --width=3D60 --height=3D60 which, currently would ma=
ke that client
> pop up in the cursor plane, while running weston in a window inside gnome=
-shell also
> works. I'm not sure what are the paths clients are taking in those cases =
so I don't
> want to speculate but I'd be happy to try any other experiments or cases =
you think
> might break.

Right, I do believe that case is solved. The switching case is
different though.

The test for the switching case would be something like this:

- patch Mutter to set CAP_VIRTUAL_CURSOR, drop the blacklisting, set
  hotspot properties correctly, and make sure it uses the virtual
  cursor plane when possible

- launch GNOME on one VT

- launch Weston on another VT, make sure it uses drm-backend.so and not
  e.g. wayland-backend.so (the logs tell you, defaulting to stdout or
  stderr, I never remember which)

- switch to GNOME VT, check the cursor plane is used, switch to Weston VT

- observe if you have a dead cursor sprite on screen left over from GNOME

- Make sure Mutter or GDM did not "sanitize" KMS state before releasing
  DRM master for Weston

The last part is important, because the kernel must not rely on
userspace to sanitize KMS state on its way out. E.g. forced session
switching will not give the chance even, and I suppose most KMS clients
also don't bother. Sanitizing KMS on switch-out is also generally
avoided to avoid unnecessary modesets which take time and cause more
flicker, even if you're not aiming for seamless handover.

Since Weston never sees the virtual cursor plane even exists, there is
no way Weston could reset it. That's why it is important for the kernel
to reset the virtual cursor plane in this case. It is the fact that the
kernel does not expose the cursor plane at all to Weston that makes
this situation unprecedented, needing something completely new in the
kernel.

Maybe it's easier to patch some other compositor like Sway than Mutter
to use the new virtual cursor stuff, and then test between the two
compositor instances, one with the CAP and one without, and see how
VT-switching between them works.



Thanks,
pq

--Sig_/ddf26Jbv/SA.bdtdFd_zVbS
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEEJQjwWQChkWOYOIONI1/ltBGqqqcFAmLPyAkACgkQI1/ltBGq
qqf2vw/9Fl0u2zRAGWLvq3ZomcSMk7PhWVLCpgNE4SjwrosvIAFHvc9s3/cFG8bH
qmAyx4PVUSb5xnnvs7aQqtRwzdTjWrrPP0Z78zcOO8YbtYDpXYRRg31f3Z9nPURd
USDrKBdtQuS3bS6WJKAJqb9b08NpCFfi3WkuHTgJGwg9JqqW8W/KrwgADsl8JjS5
cpOxvDX9ribvCJih+zBlrZTZRWb4tKDcomrpCufsmknMceFpWkpMqjTs3BU2/W27
uAfIzZXPrwO83QZo/21WBl6ZzNlP+IDngbGrXUdT8K1cNvmAmyRxDla2S7JqDqOQ
/mYHXR8HDzcRnN8yn1xN6XRh9gR8yUYduNltmPm/hjOscw7hFCIAgcQO6cb5+5GV
kHBVTbtTcRW+vObJxxsnTJYJ/XZfniETMWalbdNTQwdmHIHOEURMP7497tl8xoa6
ba7e68mgb6kdhEWmccEUvPRXxuXU2eGOQWBFKv0BmqQKWfuvARuDZ0V1ZPSbHsmr
LTg9+hSBtobC0ex6yMdTx9psMy5zOQ5P8XU0jZIH4xpn/8helhVxQFhuzUVY5crE
vDqzaKi3I233Fy4OfWE4KV1m2ZN31OFxWduNA4wZKy03i+AP5mFbXpscW56O+RA8
+SqZd2bN6yz2xJAiHO2P/DunszUwkE+6P8ryU3V9ofRaFEhY0f8=
=4+os
-----END PGP SIGNATURE-----

--Sig_/ddf26Jbv/SA.bdtdFd_zVbS--
