Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 680B873FA40
	for <lists+dri-devel@lfdr.de>; Tue, 27 Jun 2023 12:31:17 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1C49A10E14F;
	Tue, 27 Jun 2023 10:31:13 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-x12a.google.com (mail-lf1-x12a.google.com
 [IPv6:2a00:1450:4864:20::12a])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 693CE10E14F
 for <dri-devel@lists.freedesktop.org>; Tue, 27 Jun 2023 10:31:11 +0000 (UTC)
Received: by mail-lf1-x12a.google.com with SMTP id
 2adb3069b0e04-4f865f0e16cso5912420e87.3
 for <dri-devel@lists.freedesktop.org>; Tue, 27 Jun 2023 03:31:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20221208; t=1687861869; x=1690453869;
 h=mime-version:references:in-reply-to:message-id:subject:cc:to:from
 :date:from:to:cc:subject:date:message-id:reply-to;
 bh=DckDxEsx7nkit1HmycSxZwMQct0OfOCWzs+xT4xbZJA=;
 b=eQAoNcpqQadC//Ryx8nKc7vlYs22npU6wKYpMAKQkKswgnqVCJy0Nu14xzpGYZrXEF
 ZSmT4De3mTPiuO0P7JokU/pUxrHP+4iZamkjjy1rNQ709IGTF3pHriksJ1LXwA6HTdo1
 S9FDYfdjYOgrTqWcW9N48HZCrTc0rNiXQdhu019LDH7aKO3x6FfttI4LVTgAPmwd37ce
 gguPA/dJRZCGlddEKtm4kU9GAzEzXDnacEWkEVW37itsQ154RbGUl3d79S0x2NYiyP1m
 LIbKH6Z2jbaTItyMYBubkGKEXilkRLDFy7xd7mniwV4MSyhLSFgWGmYn/VrIs9d4jdxd
 C1fg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1687861869; x=1690453869;
 h=mime-version:references:in-reply-to:message-id:subject:cc:to:from
 :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=DckDxEsx7nkit1HmycSxZwMQct0OfOCWzs+xT4xbZJA=;
 b=S2+Fhhe6SyioZBCWQk9rcRIBZTkzesNvqS8keRZ+48nASE2bZ3Ye/7bWCfvVW7nvA3
 1hSVe/2quM0ZmFpDiS6dhibYX0N9S5rMD33wpyCEaz4j9cYAsJMThKs8BnnH+TSqc5l2
 4NiTK9MuuC4LuoWCVdER6dPl4I1P792R0Cn3irkcnu8tjuXIgfUgFbo9yoGUnevZ0Rdk
 NJgJXTyor5gmARaK4rWXvYEG5O+tHRJY1gFKpzYnzVTmH9sUjAGObYYeqiU/4YMogXW0
 bbdBkoG4EX+RDbZF4NolDHvPqiY8qNEOQQ6kIAuQn1zScBJj/DAtYLKiDbsy+RoHnLit
 p8iw==
X-Gm-Message-State: AC+VfDzlsC3SnsLezMUOqolBhxkS+8CYVdy1Au7V+GibQ3xLJ261NB8F
 P4MPrDhEXJ9Yk6SlkoEcAjU=
X-Google-Smtp-Source: ACHHUZ4liM92p9fZJxp2Hb0uv5nD52XuV6MznPY2zAhD0LHqRAh0joYGlqBZqXTRd/TitOz8OPavlg==
X-Received: by 2002:a05:6512:401e:b0:4f9:b31b:db6 with SMTP id
 br30-20020a056512401e00b004f9b31b0db6mr5018733lfb.9.1687861868492; 
 Tue, 27 Jun 2023 03:31:08 -0700 (PDT)
Received: from eldfell ([194.136.85.206]) by smtp.gmail.com with ESMTPSA id
 t10-20020a19ad0a000000b004f85628ec34sm1466604lfc.33.2023.06.27.03.31.07
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 27 Jun 2023 03:31:08 -0700 (PDT)
Date: Tue, 27 Jun 2023 13:30:57 +0300
From: Pekka Paalanen <ppaalanen@gmail.com>
To: Javier Martinez Canillas <javierm@redhat.com>
Subject: Re: [PATCH v3 2/8] drm/atomic: Add support for mouse hotspots
Message-ID: <20230627133057.1ae7d357@eldfell>
In-Reply-To: <87zg4l2shk.fsf@minerva.mail-host-address-is-not-set>
References: <20230627035839.496399-1-zack@kde.org>
 <20230627035839.496399-3-zack@kde.org>
 <20230627112647.175ec323@eldfell>
 <87zg4l2shk.fsf@minerva.mail-host-address-is-not-set>
X-Mailer: Claws Mail 4.1.1 (GTK 3.24.37; x86_64-pc-linux-gnu)
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/A76sBq2HzVEBvH2GkjjbOM7";
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
Cc: Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@linux.ie>, banackm@vmware.com, krastevm@vmware.com,
 dri-devel@lists.freedesktop.org, iforbes@vmware.com, mombasawalam@vmware.com,
 Zack Rusin <zack@kde.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

--Sig_/A76sBq2HzVEBvH2GkjjbOM7
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

On Tue, 27 Jun 2023 10:56:39 +0200
Javier Martinez Canillas <javierm@redhat.com> wrote:

> Pekka Paalanen <ppaalanen@gmail.com> writes:
>=20
> > On Mon, 26 Jun 2023 23:58:33 -0400
> > Zack Rusin <zack@kde.org> wrote:
> > =20
> >> From: Zack Rusin <zackr@vmware.com>
> >>=20
> >> Atomic modesetting code lacked support for specifying mouse cursor
> >> hotspots. The legacy kms DRM_IOCTL_MODE_CURSOR2 had support for setting
> >> the hotspot but the functionality was not implemented in the new atomic
> >> paths.
> >>=20
> >> Due to the lack of hotspots in the atomic paths userspace compositors
> >> completely disable atomic modesetting for drivers that require it (i.e.
> >> all paravirtualized drivers).
> >>=20
> >> This change adds hotspot properties to the atomic codepaths throughtout
> >> the DRM core and will allow enabling atomic modesetting for virtualized
> >> drivers in the userspace.
> >>=20
> >> Signed-off-by: Zack Rusin <zackr@vmware.com>
> >> Cc: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>
> >> Cc: Maxime Ripard <mripard@kernel.org>
> >> Cc: Thomas Zimmermann <tzimmermann@suse.de>
> >> Cc: David Airlie <airlied@linux.ie>
> >> Cc: Daniel Vetter <daniel@ffwll.ch>
> >> ---
> >>  drivers/gpu/drm/drm_atomic_state_helper.c | 14 +++++++
> >>  drivers/gpu/drm/drm_atomic_uapi.c         | 20 +++++++++
> >>  drivers/gpu/drm/drm_plane.c               | 51 +++++++++++++++++++++++
> >>  include/drm/drm_plane.h                   | 15 +++++++
> >>  4 files changed, 100 insertions(+) =20
> >
> > Hi Zack,
> >
> > where is the UAPI documentation for these new properties? I mean
> > something ending up in the HTML docs like what other properties have in
> > e.g. https://www.kernel.org/doc/html/latest/gpu/drm-kms.html#plane-comp=
osition-properties
> >
> > Otherwise looks fine to me. Could drm_plane_create_hotspot_properties()
> > perhaps assert that the plane type is CURSOR?
> > =20
>=20
> I thought the same when reviewing but then I noticed this function is only
> called from __drm_universal_plane_init() if type is DRM_PLANE_TYPE_CURSOR.

Right, so why bother checking for DRIVER_CURSOR_HOTSPOT either?
Shouldn't the function be 'static' too, not exported, and not added to
a header?


Thanks,
pq

--Sig_/A76sBq2HzVEBvH2GkjjbOM7
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEEJQjwWQChkWOYOIONI1/ltBGqqqcFAmSaumEACgkQI1/ltBGq
qqeUCRAAnR033nBw6KkClM0ujAgx00w5kFqWVhX2Gpgu++Qz3xxhntW9vpqLFF9F
N2MQnJuiEZv7NLzy9A9LoYIxgFmEN0v1sNp94XhUDrQ5DYmSxsFphcBR1Etvh5fL
XF8pdUpbpci1n0q21PfTadekk0HPQoFwspXEjeinlP7HT+QczufOke+NBzCwIlHr
13MYbxCwj4zgaNn+vBPdawCVUt9acnC92n0Nm0wxxwT29qpdNvJ6zZKCsRmar8KO
fDzBZ/tmWAa9vjzN/HZZ0h+au+Xtc896MFFWXBMvVdq2a9NaFVxM2ruLMTTvfjSP
QsWQx9FSqw8GHlEmROKFR49HjObwpoReOvPfxUrigHXZz6MphqxJFJEqO5kORrWt
g1I/beMr6KSS2uFwhaK3aMfkIgXcAgbB/+Yb+ymQVkqOfV7SOa7w2pgGZ+TTszkx
rb58Wln6f2V4ZbV4BkuNBmDFPIylaDvGZHZVl5Cz5QpqUNEwBjgH6Ox3Ili5cIBk
N4xCjng2LmEXgOELz24lvnmhsicHYY84UFq7kMSs/tKil2bFj3EEaPLXoMrNNWdJ
eptaw98SSumU5rYwbp+iGa/Vee7REo0VL4QOpGVRRRT4/AgmwDe1uFHswoUhYTGp
pKunB9C7rTNK2ySexSPaMCk/r/tQgojJltt6Xk98DwP5u1Jt57c=
=tU8x
-----END PGP SIGNATURE-----

--Sig_/A76sBq2HzVEBvH2GkjjbOM7--
