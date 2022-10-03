Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id C40C95F2C55
	for <lists+dri-devel@lfdr.de>; Mon,  3 Oct 2022 10:49:14 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9086910E27C;
	Mon,  3 Oct 2022 08:48:59 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-x136.google.com (mail-lf1-x136.google.com
 [IPv6:2a00:1450:4864:20::136])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6CDDC10E27A;
 Mon,  3 Oct 2022 08:48:54 +0000 (UTC)
Received: by mail-lf1-x136.google.com with SMTP id 25so5303406lft.9;
 Mon, 03 Oct 2022 01:48:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=mime-version:references:in-reply-to:message-id:subject:cc:to:from
 :date:from:to:cc:subject:date;
 bh=XJuxdLtMzZgdeDGwXBg8KO2MAjByLw/Th/IxugrKiaY=;
 b=MubUDGN5MOKh387rWtQRqfig7TDM6eKw7vikyczLS4BG/K5bK82mxvoKEQ0ozvxva0
 0PHShnYrZEkO1Pmh6apy6NqCDkcFUzqfNzzz4AHV64U4WRAwuSHrSuVqrWm2XTxl2KAs
 Uw8wZPYuURymp31B8rFaKsfAZjqhWNWC0J/tr0xY8719XYbdwiwI6hDo6iw0oPRcFZnb
 3A6W6WcOCRf9+bxvukR7WNr2M7PwWhYSNLlHIVC6zo80Y/A+Y/fFDRwiWZvQukp5ApKB
 hkzC4PIxRy0ySZS5gXWNuHnZ6nvYuZvK1NGHzje+gSTUOuFIG8OWkn2Xqzblv+K8I087
 PD1A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=mime-version:references:in-reply-to:message-id:subject:cc:to:from
 :date:x-gm-message-state:from:to:cc:subject:date;
 bh=XJuxdLtMzZgdeDGwXBg8KO2MAjByLw/Th/IxugrKiaY=;
 b=t6qWGTUhFovmDJ6M4MpakZjDM6Zazh9Z9LkwfhlXyLSa88cRama9ed5JQJ5fAD9HpF
 mB7H7vJwJZydUm655g+hvfqT6CwLgIbzYN+GVAP6jzCANBtvYh7tI8g9mSsCIkZ/j8jg
 iW1zdSalwBlRcY9TdnicGknVJTQjMubLhPVirMceLStjObpmP+np+IpkB3409/fMFQK6
 OoLoGuf1heb26l/AaqhQCHHqXdN9QxPK4fi4rMChJxS6GieWWXKjjuVY5CE0CWndywtU
 YPBy587AI5XLw8Aj9oqHa6j1imjAcDDDpfb3BKbJiXsFmHvtLbZTud6eYJDZJ/ecctnL
 9yfA==
X-Gm-Message-State: ACrzQf1wKjZNr+sFwh7U2XVBLmkPbcf1Hy0/zzlh9RAEXwRbM2fQF+pd
 EDkw7/zSRKkeFwPeqL8XPeM=
X-Google-Smtp-Source: AMsMyM4MwN1HzZpFR+Jm8VBayrkVHNd1BN7GDZ6eJ+ZO2Xfy7KsDdnGW18aDsr+bwRj3HvjCxtJQlw==
X-Received: by 2002:a05:6512:a86:b0:499:f794:5cc2 with SMTP id
 m6-20020a0565120a8600b00499f7945cc2mr6517108lfu.100.1664786932630; 
 Mon, 03 Oct 2022 01:48:52 -0700 (PDT)
Received: from eldfell ([194.136.85.206]) by smtp.gmail.com with ESMTPSA id
 f4-20020a05651c02c400b0026dcf238c50sm473428ljo.127.2022.10.03.01.48.52
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 03 Oct 2022 01:48:52 -0700 (PDT)
Date: Mon, 3 Oct 2022 11:48:49 +0300
From: Pekka Paalanen <ppaalanen@gmail.com>
To: Ville =?UTF-8?B?U3lyasOkbMOk?= <ville.syrjala@linux.intel.com>
Subject: Re: KMS atomic state sets, full vs. minimal (Re: [PATCH v3 0/6] Add
 support for atomic async page-flips)
Message-ID: <20221003114849.09265089@eldfell>
In-Reply-To: <YzcPBfLBNzfbHG5W@intel.com>
References: <20220929184307.258331-1-contact@emersion.fr>
 <Yzb0uNjB5FpjCIjq@intel.com> <Yzb6203nHF8fVH/W@intel.com>
 <YzcGw9myJotLRTVl@intel.com> <20220930183700.6cf64900@eldfell>
 <YzcPBfLBNzfbHG5W@intel.com>
X-Mailer: Claws Mail 3.17.8 (GTK+ 2.24.33; x86_64-pc-linux-gnu)
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/7rTc+thoKbe+plQ2QWwlKpN";
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
Cc: andrealmeid@igalia.com, dri-devel@lists.freedesktop.org,
 wayland-devel@lists.freedesktop.org, mwen@igalia.com,
 amd-gfx@lists.freedesktop.org, daniel.vetter@ffwll.ch,
 alexander.deucher@amd.com, hwentlan@amd.com, nicholas.kazlauskas@amd.com,
 joshua@froggi.es
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

--Sig_/7rTc+thoKbe+plQ2QWwlKpN
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

On Fri, 30 Sep 2022 18:45:09 +0300
Ville Syrj=C3=A4l=C3=A4 <ville.syrjala@linux.intel.com> wrote:

> On Fri, Sep 30, 2022 at 06:37:00PM +0300, Pekka Paalanen wrote:
> > On Fri, 30 Sep 2022 18:09:55 +0300
> > Ville Syrj=C3=A4l=C3=A4 <ville.syrjala@linux.intel.com> wrote:
> >  =20
> > > That would actively discourage people from even attempting the
> > > "just dump all the state into the ioctl" approach with async flips
> > > since even the props whose value isn't even changing would be rejecte=
d. =20
> >=20
> > About that.
> >=20
> > To me it looks like just a classic case of broken communication.
> >=20
> > The kernel developers assume that of course userspace will minimize the
> > state set to only those properties that change, because...?
> >=20
> > Userspace developers think that of course the kernel will optimize the
> > state set into minimal changes, because the kernel actually has the
> > authoritative knowledge of what the current state is, and the driver
> > actually knows which properties are costly and need to be optimized and
> > which ones don't matter. It has never even occurred to me that the
> > kernel would not compare next state to current state.
> >=20
> > No-one ever documented any expectations, did they? =20
>=20
> Do you really want that for async flips? Async flips can't be
> done atomically with anything else, so why are you even asking
> the kernel to do that?

I'm not talking about async flips only.

I'm talking about atomic commits in general. I don't think it's a good
idea to make async atomic commits behave fundamentally different from
sync atomic commits wrt. what non-changing state you are allowed to
list in your state set or not.

Isn't there common DRM code to convert an atomic commit state set into
state objects? It probably starts by copying the current state, and
then playing through the commit state set, setting all listed
properties to their new values? Why wouldn't that loop maintain the
knowledge of what actually changed?

When you copy the current data, reset all changed-flags to false. When
you apply each property from the commit set, compare the value and set
the changed-flag only if the value changes.

This manufacturing of the new tentative state set happens at atomic
commit ioctl time before the ioctl returns, right? So the current state
is well-defined: any previous atomic sync or async commit can be assumed to
have succeeded even if it hasn't applied in hardware yet if the commit
ioctl for it succeeded, right?


Thanks,
pq

--Sig_/7rTc+thoKbe+plQ2QWwlKpN
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEEJQjwWQChkWOYOIONI1/ltBGqqqcFAmM6ofEACgkQI1/ltBGq
qqfzyxAAjNAvVIu5FAC3mNBWBNLaX4HciKodv1pyjk2n8JMLXa16NonnXvxeVot0
G9bshOFU/6nsb8h9Y1RxJ9HLpuizGSSKLhnDKIsnKqtIZ8+wC5mnqYMRvJMCWGCa
c4ASb9947rvK4zCM3n5R8PoQnzD1F6+/mHzQ5qkDUI8e0uCpyYj3TeVDZ3e8O0Pe
S2I2NoSGRpD/uDObILXcgO6KjJ0XEUKw8fNLwNgrbHxFOuw8goPiiaOwnjYEU9W0
vKvfWXJpxuMBqitx8XtkjR6jSKzYxgQeua3alL0N3hJPyvstDsArHLtEzKcMcUwG
62o7crKB6Yoqnm/voXATax58bu2aEOcikvxaka16J3WJBtnlGoqu28uRwTKPZzna
/TYZzp+uCunxyfYePzWaBxHpaGNvhshKl3yvIVh1NMu75VKXIsO6aS4qfm/nvdmF
1CdgatPqV9EWvq6QUE/eD0RiG7fvhsaNW95PnM9W4QezX0ybpg8vDV5yskfQDrpd
+01T0qsMbLxRFxe7QHInPMkdTwrAHdOuBBu31dlHW18zmo792+qkWD/cymDRvzrf
swLJiRScZ/70gA7/ribrbNUhYxqi7MbLdBhIKnyQUgJ9KdCvkWwbPIxXbXoqyWKW
JKF+5uRSJa/4FunGr/96J9Eh1WA8QZdqvYM7VzjwmRf2aLsUv8k=
=Iuve
-----END PGP SIGNATURE-----

--Sig_/7rTc+thoKbe+plQ2QWwlKpN--
