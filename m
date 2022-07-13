Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 5DBB0572EF5
	for <lists+dri-devel@lfdr.de>; Wed, 13 Jul 2022 09:20:55 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D37FB90711;
	Wed, 13 Jul 2022 07:20:51 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-x12c.google.com (mail-lf1-x12c.google.com
 [IPv6:2a00:1450:4864:20::12c])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 968B0905B0
 for <dri-devel@lists.freedesktop.org>; Wed, 13 Jul 2022 07:20:50 +0000 (UTC)
Received: by mail-lf1-x12c.google.com with SMTP id bp17so9799599lfb.3
 for <dri-devel@lists.freedesktop.org>; Wed, 13 Jul 2022 00:20:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=date:from:to:cc:subject:message-id:in-reply-to:references
 :mime-version; bh=dY+kisnfBlAr+FIDYfHMC1ZausAXdWLtZ3vThKkwYFQ=;
 b=Sp01VwW/xUpu6KkcunPj0PgYm+m+sT/ZJU3GoJisxzXWLYtNLBnTLSqAALP7U77meI
 CKplUGk7nSmv4F+4/JnDuo4VWMeBYZFttTsgk4yR5O44tXtoNccXe+USuE6Calh7SUsj
 wJ5ckJxvW6IB2E9XicM1eQhv08VtL1WNgpgnJloZ5GwajT2WnpI5gWtOX1KdZOK5geOg
 m0MIq4IczS0XQyM6RSM9O8Jt4Z2ik7LBx9DSn1LzOVGX8ffQBgBaWvrxNS6lzzgAp7kg
 4pEQUL2nKNrzFCETz+46SNTSVFPLzkZtfP6tCTuUBes+XgLtwcN9PDDM60FQdG8RXbMu
 uiig==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:in-reply-to
 :references:mime-version;
 bh=dY+kisnfBlAr+FIDYfHMC1ZausAXdWLtZ3vThKkwYFQ=;
 b=lBMB0GKYPYpcIY5n0wmNn/tnN7JxqYlH7l+8lWp6+NVpgKQazKoMPCC6QqoMo8g7aC
 lSlTreTQZvGCGwTgVUKOTOjTJ8IPSn2ujB0oeEjtV5gMyYDiiBiKcKlWDcrAtoy1dJ/t
 zJ6cLOTBz7RJffIFuOE/6KKaMjW32Gv2SoXz1f62f+yDJcH/1ob0GizsNpnIhWcQ6qRd
 zYr+IxkMJJvJcMEaB6fGxRTIIUJ/3939GcGCzEyfGOg1/XA3itYrkhr8MWofwvHYA6f1
 ZKb56AaXeZ4+4/BbjGRYR4aMFwpsAD7ZNrvTFm5Q6ey8tkMArjSajw7QRaYPLcIF4TVE
 7Vkg==
X-Gm-Message-State: AJIora8+a48og3ca0GIhVzqFSblEqUAkp75YqJJtHDmri3VvHIzZXm7k
 LSAnnczaq+Ou2DrMIXhOfBg=
X-Google-Smtp-Source: AGRyM1vWW03sl0VgYDMPfRKt9EgVjzWXr5tbo4UoYXgW6ibh2QDBOvrKYxa2bvhKVksXxS55E7u6qA==
X-Received: by 2002:ac2:4e14:0:b0:489:ea00:9c8c with SMTP id
 e20-20020ac24e14000000b00489ea009c8cmr1085794lfr.201.1657696848713; 
 Wed, 13 Jul 2022 00:20:48 -0700 (PDT)
Received: from eldfell ([194.136.85.206]) by smtp.gmail.com with ESMTPSA id
 a11-20020a05651c030b00b0025bd4ec3ef2sm2953958ljp.81.2022.07.13.00.20.47
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 13 Jul 2022 00:20:47 -0700 (PDT)
Date: Wed, 13 Jul 2022 10:20:36 +0300
From: Pekka Paalanen <ppaalanen@gmail.com>
To: Zack Rusin <zackr@vmware.com>
Subject: Re: [PATCH v2 5/8] drm/vboxvideo: Use the hotspot properties from
 cursor planes
Message-ID: <20220713102036.13aa93ee@eldfell>
In-Reply-To: <50fd57193508f33a1e559ef74599c9e52764850d.camel@vmware.com>
References: <20220712033246.1148476-1-zack@kde.org>
 <20220712033246.1148476-6-zack@kde.org>
 <20220712105600.4a8592c1@eldfell>
 <50fd57193508f33a1e559ef74599c9e52764850d.camel@vmware.com>
X-Mailer: Claws Mail 3.17.8 (GTK+ 2.24.33; x86_64-pc-linux-gnu)
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/oFWFYRzd5+eCT2azKj2BCnF";
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

--Sig_/oFWFYRzd5+eCT2azKj2BCnF
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

On Wed, 13 Jul 2022 03:35:57 +0000
Zack Rusin <zackr@vmware.com> wrote:

> On Tue, 2022-07-12 at 10:56 +0300, Pekka Paalanen wrote:
> > On Mon, 11 Jul 2022 23:32:43 -0400
> > Zack Rusin <zack@kde.org> wrote:
> >  =20
> > > From: Zack Rusin <zackr@vmware.com>
> > >=20
> > > Atomic modesetting got support for mouse hotspots via the hotspot
> > > properties. Port the legacy kms hotspot handling to the new properties
> > > on cursor planes.
> > >=20
> > > Signed-off-by: Zack Rusin <zackr@vmware.com>
> > > Cc: Hans de Goede <hdegoede@redhat.com>
> > > Cc: David Airlie <airlied@linux.ie>
> > > Cc: Daniel Vetter <daniel@ffwll.ch>
> > > ---
> > >  drivers/gpu/drm/vboxvideo/vbox_mode.c | 4 ++--
> > >  1 file changed, 2 insertions(+), 2 deletions(-)
> > >=20
> > > diff --git a/drivers/gpu/drm/vboxvideo/vbox_mode.c b/drivers/gpu/drm/=
vboxvideo/vbox_mode.c
> > > index fa0d73ce07bc..ca3134adb104 100644
> > > --- a/drivers/gpu/drm/vboxvideo/vbox_mode.c
> > > +++ b/drivers/gpu/drm/vboxvideo/vbox_mode.c
> > > @@ -429,8 +429,8 @@ static void vbox_cursor_atomic_update(struct drm_=
plane *plane,
> > >  	flags =3D VBOX_MOUSE_POINTER_VISIBLE | VBOX_MOUSE_POINTER_SHAPE |
> > >  		VBOX_MOUSE_POINTER_ALPHA;
> > >  	hgsmi_update_pointer_shape(vbox->guest_pool, flags,
> > > -				   min_t(u32, max(fb->hot_x, 0), width),
> > > -				   min_t(u32, max(fb->hot_y, 0), height),
> > > +				   min_t(u32, max(new_state->hotspot_x, 0), width),
> > > +				   min_t(u32, max(new_state->hotspot_y, 0), height),
> > >  				   width, height, vbox->cursor_data, data_size);
> > > =20
> > >  	mutex_unlock(&vbox->hw_mutex); =20
> >=20
> > Hi,
> >=20
> > this looks like silent clamping of the hotspot coordinates.
> >=20
> > Should the DRM core perhaps already ensure that the hotspot must reside
> > inside the plane (fb) boundaries and reject the atomic (TEST_ONLY)
> > commit when it's outside?
> >=20
> > Or if this restriction is not universal, maybe this driver should
> > reject invalid hotspots rather than silently mangle them? =20
>=20
> TBH, I'm not really sure why vboxvideo is clamping those values. I didn't=
 want to
> introduce any regressions by changing it here, but the hotspot code never=
 specified
> that the hotspot offsets have to be positive or even within the plane. In=
 a quick
> search I couldn't find real world cursors that were doing anything like t=
hat though
> so I just left it.
>=20
> > Also, if supports_virtual_cursor_plane is false, should there not be
> > somewhere code that will ignore the values set to the atomic hotspot
> > properties? =20
>=20
> Hmm, good question. I'm not sure if there's a case where that could be po=
ssible:
> without supports_virtual_cursor we either won't have a cursor plane or th=
e client
> won't be atomic and will only be allowed to use the old legacy kms ioctl'=
s, i.e.
> drmModeSetCursor2.
>=20
> > When one KMS client switches to another, the first one being hotspot
> > aware and the latter not, and both atomic, then the latter KMS client
> > who doesn't know to drive the hotspot will inherit potentially invalid
> > hotspot from the previous KMS client. Does something prevent that from
> > being a problem? =20
>=20
> That switch will result in plane state reset, ending in
> __drm_atomic_helper_plane_state_reset which will reset both hotspot prope=
rties (set
> them to 0).

It will?

To my knowledge, KMS has never reset anything when one KMS client
switches to the next, so that's new.

What triggers it?

Only if you actually switch to fbdev/fbcon instead of another userspace
KMS client, the fbdev code might reset some things, but not all.

> > The old KMS client may have left the virtual cursor plane visible, and
> > the new KMS client doesn't even know the virtual cursor plane exists
> > because it doesn't set the DRM client cap. Something should probably
> > ensure the virtual cursor plane gets disabled, right? =20
>=20
> Hah, that's also a good question. I *think* the same code to above would =
be ran,
> i.e. plane reset which should result in the plane disappearing and the ne=
w client
> not being able to drive it anymore. At least when running gnome-shell, sw=
itching to
> weston and then switching to gnome-shell things look ok, but I haven't tr=
ied running
> such clients at the same time.

That's an interesting experiment, but how is "at the same time"
different from what you tested?

As i mentioned above, if you switch to fbcon in between, then you are
not switching from one userspace KMS client to the next.


Thanks,
pq

--Sig_/oFWFYRzd5+eCT2azKj2BCnF
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEEJQjwWQChkWOYOIONI1/ltBGqqqcFAmLOckQACgkQI1/ltBGq
qqffKw//SoSSq8GwUoktwLilHujKfWX6SSMcFTh+aks8dz2h99Eu3o68QgTOwri4
+PLVogvZ98p19Du/P3l/3sZQopxAt6UX4g5uVMgPxNnfFG15AP8/HL74/xNYjTl3
eCxot84GBoyGfAhCQgcMg6BPyAnAr2GJ5aGuabNnw3Dqf0NZxtuluNUW1UcBWWE2
8jUPiAtxoDaB4hJ2OZntZV30zWVvDz6DFnDW6jf03jHV83qDXPuqHT1ljytQwDIX
65vRTlqrGhT1P7X+8XaAyTqrVYoug0HbvJF2SAxOiSASIvm8wUDGYSHRdRdiBHMA
p2OTWf1xz34K0Ve1vbxX3Vr5B5YHJxrCbp6nsNUnaq/pletnGgVHPODf8C/C7uqF
/8nliSnXExXzNrJpG07nr71Q8uuDgklWPnS4FksNw+IV49c6PHW+232tdexmim5N
tj71dgAsFxpL1ICYqf00zmeIFojodEQn2n9pnTD0nKeAR127ScABsWTz7Y7iggpU
QkZf0tKrsMpw8efBzZ8BawSjHbu2o7I15Jg+V6PQjeDL2Ziu2c1MlNtbNHngoiqz
+kKBxkMay+/QVR1sEN7u+tpIf4PncqC9OXw+0xjbFsMoOp6ngfFU195GHuKwRtCr
FYJvGkTmtYVdb9Bfwt3m53ZsDdTVnPpXjmKzbq92Tb/DjFLg8tU=
=uXKU
-----END PGP SIGNATURE-----

--Sig_/oFWFYRzd5+eCT2azKj2BCnF--
