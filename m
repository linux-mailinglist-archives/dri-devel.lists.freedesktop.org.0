Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 94118691BBE
	for <lists+dri-devel@lfdr.de>; Fri, 10 Feb 2023 10:44:20 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0860B10ECB9;
	Fri, 10 Feb 2023 09:44:14 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ej1-x62b.google.com (mail-ej1-x62b.google.com
 [IPv6:2a00:1450:4864:20::62b])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A7D6410ECB5;
 Fri, 10 Feb 2023 09:44:10 +0000 (UTC)
Received: by mail-ej1-x62b.google.com with SMTP id ud5so14277278ejc.4;
 Fri, 10 Feb 2023 01:44:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=mime-version:references:in-reply-to:message-id:subject:cc:to:from
 :date:from:to:cc:subject:date:message-id:reply-to;
 bh=3lBEUZ9lJjAhE0sUccuHEi7fawzpKMy3k/SGartQp4k=;
 b=QdEfYQay4PXawye6R1hUY2jGyY5ygom0aEQB3ltzyhp0+CGpElSvUqif2btfa5M8LB
 ErsKKTNOhY7T6kN/JXP0B3fIquFIglC8TgMDfdJF/ikQjmVmEyW8K20uFVLEhZpDZnj7
 VJ5bCRrzlglletwg5jWMWN/P6g565eNcEIjs6343SyB/LnlfvTNSs/59/psYd+kaafQ8
 NojdA+PEXMsR8sAPYkyAKF3W3sk3tdzbsNHD/WMKVRlJ6cJCzvq4nJpLqttbPrnGSDmq
 e33mcExsWKSshSKbB8uxM/Rcarmrw3bZvCGxeRQjoYRSki1Iox6Kh04cp7Ff+PPa80en
 VC2Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=mime-version:references:in-reply-to:message-id:subject:cc:to:from
 :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=3lBEUZ9lJjAhE0sUccuHEi7fawzpKMy3k/SGartQp4k=;
 b=Sf0hQpX1AL10WB3jT0asMTWeJvcpSJwdAtx1mC9COqHu/BDgd36KrzLWmV78HdmOG/
 iPdm2Qkak4KvcP4tqOdY4OCq+tcyCE9Nkkb6J+dWQMwvFSYmz89JByxc+DiQHSNjViWK
 Had/seLA5rqmqmFIiTrkS034JdmaEmPFOPgIyOJdtya0BFlPNe5vkVjYG2mGCbaJiLsM
 o1eLI9UNreJHAtWnD70ysK08wg+HXbuUaTiHGA0a8k9sHTmG423V3rFMjYgWWS4SAd5V
 kV5FwVusjDgULoAQwdCfoZK8412rHxl04Z25rCndMM6u5hhYCiATNqVW44TMP76Ki00s
 8sUg==
X-Gm-Message-State: AO0yUKXUHRvEFSYIfN2bsKjY8qN8R4NhjabKfy11SU8uWrpff9jdVr+r
 hUM2dt8cbwDsJWQ2RMt0TzM=
X-Google-Smtp-Source: AK7set87ygszO5UugbzU14PsHQ7QUiiNL6DrxFI28xNI1Ynd9Go237/18xzbqAlEXPI2IEvJQAPSRg==
X-Received: by 2002:a17:907:7d93:b0:8af:33d2:787c with SMTP id
 oz19-20020a1709077d9300b008af33d2787cmr6478411ejc.13.1676022249109; 
 Fri, 10 Feb 2023 01:44:09 -0800 (PST)
Received: from eldfell ([194.136.85.206]) by smtp.gmail.com with ESMTPSA id
 9-20020a17090601c900b007ad69e9d34dsm2145682ejj.54.2023.02.10.01.44.08
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 10 Feb 2023 01:44:08 -0800 (PST)
Date: Fri, 10 Feb 2023 11:44:05 +0200
From: Pekka Paalanen <ppaalanen@gmail.com>
To: Ville =?UTF-8?B?U3lyasOkbMOk?= <ville.syrjala@linux.intel.com>
Subject: Re: [PATCH v2 1/2] drm: Introduce plane SIZE_HINTS property
Message-ID: <20230210114405.3f334879@eldfell>
In-Reply-To: <Y+TwzhRCkFlo5U6S@intel.com>
References: <20230208040911.12590-2-ville.syrjala@linux.intel.com>
 <20230208211016.7034-1-ville.syrjala@linux.intel.com>
 <20230209135855.22cf1b32.pekka.paalanen@collabora.com>
 <Y+TwzhRCkFlo5U6S@intel.com>
X-Mailer: Claws Mail 3.17.8 (GTK+ 2.24.33; x86_64-pc-linux-gnu)
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/nqi6Jb09Z/XE_r2SnyKCbbs";
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
Cc: intel-gfx@lists.freedesktop.org,
 Jonas =?UTF-8?B?w4VkYWhs?= <jadahl@redhat.com>,
 dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

--Sig_/nqi6Jb09Z/XE_r2SnyKCbbs
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

On Thu, 9 Feb 2023 15:10:38 +0200
Ville Syrj=C3=A4l=C3=A4 <ville.syrjala@linux.intel.com> wrote:

> On Thu, Feb 09, 2023 at 01:58:55PM +0200, Pekka Paalanen wrote:
> > On Wed,  8 Feb 2023 23:10:16 +0200
> > Ville Syrjala <ville.syrjala@linux.intel.com> wrote:
> >  =20
> > > From: Ville Syrj=C3=A4l=C3=A4 <ville.syrjala@linux.intel.com>
> > >=20
> > > Add a new immutable plane property by which a plane can advertise
> > > a handful of recommended plane sizes. This would be mostly exposed
> > > by cursor planes as a slightly more capable replacement for
> > > the DRM_CAP_CURSOR_WIDTH/HEIGHT caps, which can only declare
> > > a one size fits all limit for the whole device.
> > >=20
> > > Currently eg. amdgpu/i915/nouveau just advertize the max cursor
> > > size via the cursor size caps. But always using the max sized
> > > cursor can waste a surprising amount of power, so a better
> > > stragey is desirable.
> > >=20
> > > Most other drivers don't specify any cursor size at all, in
> > > which case the ioctl code just claims that 64x64 is a great
> > > choice. Whether that is actually true is debatable.
> > >=20
> > > A poll of various compositor developers informs us that
> > > blindly probing with setcursor/atomic ioctl to determine
> > > suitable cursor sizes is not acceptable, thus the
> > > introduction of the new property to supplant the cursor
> > > size caps. The compositor will now be free to select a
> > > more optimal cursor size from the short list of options.
> > >=20
> > > Note that the reported sizes (either via the property or the
> > > caps) make no claims about things such as plane scaling. So
> > > these things should only really be consulted for simple
> > > "cursor like" use cases.
> > >=20
> > > v2: Try to add some docs
> > >=20
> > > Cc: Simon Ser <contact@emersion.fr>
> > > Cc: Jonas =C3=85dahl <jadahl@redhat.com>
> > > Cc: Daniel Stone <daniel@fooishbar.org>
> > > Cc: Pekka Paalanen <pekka.paalanen@collabora.com>
> > > Acked-by: Harry Wentland <harry.wentland@amd.com>
> > > Signed-off-by: Ville Syrj=C3=A4l=C3=A4 <ville.syrjala@linux.intel.com>
> > > ---
> > >  drivers/gpu/drm/drm_mode_config.c |  7 +++++
> > >  drivers/gpu/drm/drm_plane.c       | 48 +++++++++++++++++++++++++++++=
++
> > >  include/drm/drm_mode_config.h     |  5 ++++
> > >  include/drm/drm_plane.h           |  4 +++
> > >  include/uapi/drm/drm_mode.h       | 11 +++++++
> > >  5 files changed, 75 insertions(+)
> > >=20
> > > diff --git a/drivers/gpu/drm/drm_mode_config.c b/drivers/gpu/drm/drm_=
mode_config.c
> > > index 87eb591fe9b5..21860f94a18c 100644
> > > --- a/drivers/gpu/drm/drm_mode_config.c
> > > +++ b/drivers/gpu/drm/drm_mode_config.c
> > > @@ -374,6 +374,13 @@ static int drm_mode_create_standard_properties(s=
truct drm_device *dev)
> > >  		return -ENOMEM;
> > >  	dev->mode_config.modifiers_property =3D prop;
> > > =20
> > > +	prop =3D drm_property_create(dev,
> > > +				   DRM_MODE_PROP_IMMUTABLE | DRM_MODE_PROP_BLOB,
> > > +				   "SIZE_HINTS", 0);
> > > +	if (!prop)
> > > +		return -ENOMEM;
> > > +	dev->mode_config.size_hints_property =3D prop;
> > > +
> > >  	return 0;
> > >  }
> > > =20
> > > diff --git a/drivers/gpu/drm/drm_plane.c b/drivers/gpu/drm/drm_plane.c
> > > index 24e7998d1731..ae51b1f83755 100644
> > > --- a/drivers/gpu/drm/drm_plane.c
> > > +++ b/drivers/gpu/drm/drm_plane.c
> > > @@ -140,6 +140,21 @@
> > >   *     DRM_FORMAT_MOD_LINEAR. Before linux kernel release v5.1 there=
 have been
> > >   *     various bugs in this area with inconsistencies between the ca=
pability
> > >   *     flag and per-plane properties.
> > > + *
> > > + * SIZE_HINTS:
> > > + *     Blob property which contains the set of recommended plane size
> > > + *     which can used for simple "cursor like" use cases (eg. no sca=
ling).
> > > + *     Using these hints frees userspace from extensive probing of
> > > + *     supported plane sizes through atomic/setcursor ioctls.
> > > + *
> > > + *     For optimal usage userspace should pick the smallest size
> > > + *     that satisfies its own requirements.
> > > + *
> > > + *     The blob contains an array of struct drm_plane_size_hint.
> > > + *
> > > + *     Drivers should only attach this property to planes that
> > > + *     support a very limited set of sizes (eg. cursor planes
> > > + *     on typical hardware). =20
> >=20
> > Hi Ville,
> >=20
> > sounds good. Maybe a minor nit about "typical hardware". Would e.g.
> > "legacy PC hardware" be more accurate? =20
>=20
> "legacy" doesn't feel quite right for current and upcoming hardware.

It's an example, not everything. Although, I didn't expect current and
upcoming hardware to keep such limitations either but to move towards
universal rather than specialized planes.

Maybe just drop the whole "(eg. ...)"?


Thanks,
pq

--Sig_/nqi6Jb09Z/XE_r2SnyKCbbs
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEEJQjwWQChkWOYOIONI1/ltBGqqqcFAmPmEeUACgkQI1/ltBGq
qqflQQ/8DnqpRwRpQWYFsgvSgGrJSdOgTCASwWF51q6D8y9R9yHDaOZFeEcnbnrL
IC/EEq7ksRqihjqTrtbpqDkofqgIxYnkREII0euPfY6/00sfYcBfI0a2GL4RUq+n
fg9DbxhbRB5rS4o+U57ZbOZJLQgyaDC7H3s96v9MIobSRrxnefa6reG9PBs7nF1Y
JPvhCJFJclK8mDdC68kN649aqJDVGLsWZxAny1oju1aZ0LJhzQb2K7Eom/hazRU/
RvQLP0Dz4xhGBNKc1d2rBTTxXbHB/XTV38TWjt2evr78JK6f/cssVs53GxkC3KOE
pQPv+0QVDsyTjNHL5WMX9LVPdRZASVaE88fjHi46pTmQIe5SdVJLSYF4V1An6SIc
CzxIqEA0n18L4LgbVc+by7M7C1cxPWsLQMv5T3LypxoGinbdaLmoePtBMsAx+hPP
/k+W7aPbvT51kNzOg9k47D7DE4m2gtitV3YPNZjH2NKguexaeK2fWc+5ZMsuPdI2
ok9jYBOGjiTC69MBtHN8hWp8aRf2Tn8ZglY46NmpDF1Q3S+3h2ZDkQRJtVvFNyUj
jiBEpVYCIcbsryqpJm9/PuWY0rrtuNf1JeXn0motEHrKMHv7uZ4JIZHJUjWt02bS
ljf53TqhpZPGK0YC8Lc8EQ2s0ONsRbkDYAKCWKe/y1GBTcHTchc=
=fgbr
-----END PGP SIGNATURE-----

--Sig_/nqi6Jb09Z/XE_r2SnyKCbbs--
