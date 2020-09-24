Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id E75AD276B05
	for <lists+dri-devel@lfdr.de>; Thu, 24 Sep 2020 09:41:17 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4C488890DD;
	Thu, 24 Sep 2020 07:41:14 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-x144.google.com (mail-lf1-x144.google.com
 [IPv6:2a00:1450:4864:20::144])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2AE58890DD;
 Thu, 24 Sep 2020 07:41:13 +0000 (UTC)
Received: by mail-lf1-x144.google.com with SMTP id y2so2750674lfy.10;
 Thu, 24 Sep 2020 00:41:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=date:from:to:cc:subject:message-id:in-reply-to:references
 :mime-version; bh=IUouezrqm4ESjQtgsxdU3xLGChk+F5RQ6KTbv+Wlcj8=;
 b=e35FATRjWT8tLEofuX8f77wFBPjo5W4Gnty4nMMJ7vkyKWpj5/NiY8NQ/JNCQ93bSC
 PZ7qoEWud6upxpIWsPgB+o5ceA7iJ7LjrixbdLWY4NmRL61BKMOeUHGnc2ntwsVVXKUK
 PvQWBhgVxGRxjDTXSTfqDfK0R3eOpELSzRO/su1OMBbRQJD+1obaR3m20NCuzKStbl7C
 OEL/BjTlbxd+kKRK2jhj5n1owSFdfVQPnkcg1ZYdNHspYm4SY/NTiUQ+50o/9QQ94MNJ
 EPWyaM4HK5wlNr57yt3QPbNQmbOLIu8eTU3B6FqgeDOPP/eMqvdbdrCwNSjcUj5s2vxU
 ihDw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:in-reply-to
 :references:mime-version;
 bh=IUouezrqm4ESjQtgsxdU3xLGChk+F5RQ6KTbv+Wlcj8=;
 b=YxXem+AuwGULPGkgZs13REEJceGfdemsPeai5ErNcAcf7VL7mzi/m7bsmljF/+0urb
 B913Pmkohuupcvvd3L5qFyHULQ1YLx2+ZDwpg3J98l4+K/0yflgiuHYknA0I/OnuoheM
 p6ZDKzRDwBRo8GSkgeZVyS+osY+Vaq99NKT26C0Z7nipY4hjeKaxUGeoWYbdP9wJeRGR
 PscFGjBdA8GomTf4Gwn792ftClYMLNChtQhfpvRjYvwaNRzTjM3OGhDBDePvEIT2ku2C
 sQhTHvtKvl8f2h5nWYJmGpR7lcMzfZpq8LOk18OaESPoSscx2OgbOOPi+7M88+CU1Ud2
 TdCA==
X-Gm-Message-State: AOAM533woLnd5UPBj7vzvvUcAvGMVMnqHU98JlK/ZnbmS1UXxKRTgHUn
 VCkex0mFKbmoKlh2tIprKUo=
X-Google-Smtp-Source: ABdhPJzj1C8lHb2X/PdemWsMgRdPdPS5hl/9iHWyxgTrmJI63C4iGXr8tWru0S90+CSa5uaXLwmZUg==
X-Received: by 2002:a19:be0b:: with SMTP id o11mr1114527lff.117.1600933271457; 
 Thu, 24 Sep 2020 00:41:11 -0700 (PDT)
Received: from eldfell ([194.136.85.206])
 by smtp.gmail.com with ESMTPSA id c17sm1312517lfs.62.2020.09.24.00.41.10
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 24 Sep 2020 00:41:11 -0700 (PDT)
Date: Thu, 24 Sep 2020 10:41:01 +0300
From: Pekka Paalanen <ppaalanen@gmail.com>
To: Daniel Vetter <daniel.vetter@ffwll.ch>
Subject: Re: [PATCH] drm/atomic: document and enforce rules around
 "spurious" EBUSY
Message-ID: <20200924104101.63be1c13@eldfell>
In-Reply-To: <CAKMK7uH0WiEPP1H1DZPdE4mJdStTTtnZJQN5rjnkG_6va_1Tdg@mail.gmail.com>
References: <20200923105737.2943649-1-daniel.vetter@ffwll.ch>
 <20200923151852.2952812-1-daniel.vetter@ffwll.ch>
 <20200923191724.GA62596@xpredator>
 <CAKMK7uH0WiEPP1H1DZPdE4mJdStTTtnZJQN5rjnkG_6va_1Tdg@mail.gmail.com>
X-Mailer: Claws Mail 3.17.3 (GTK+ 2.24.32; x86_64-pc-linux-gnu)
MIME-Version: 1.0
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
Cc: Daniel Vetter <daniel.vetter@intel.com>,
 Intel Graphics Development <intel-gfx@lists.freedesktop.org>,
 Marius Vlad <marius.vlad@collabora.com>,
 DRI Development <dri-devel@lists.freedesktop.org>
Content-Type: multipart/mixed; boundary="===============1664347654=="
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

--===============1664347654==
Content-Type: multipart/signed; micalg=pgp-sha256;
 boundary="Sig_/cvmxGpomSOT0enGy/+lmsv="; protocol="application/pgp-signature"

--Sig_/cvmxGpomSOT0enGy/+lmsv=
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

On Wed, 23 Sep 2020 22:01:25 +0200
Daniel Vetter <daniel.vetter@ffwll.ch> wrote:

> On Wed, Sep 23, 2020 at 9:17 PM Marius Vlad <marius.vlad@collabora.com> w=
rote:
> >
> > On Wed, Sep 23, 2020 at 05:18:52PM +0200, Daniel Vetter wrote: =20
> > > When doing an atomic modeset with ALLOW_MODESET drivers are allowed to
> > > pull in arbitrary other resources, including CRTCs (e.g. when
> > > reconfiguring global resources).

...

> > > @@ -1313,6 +1322,26 @@ int drm_atomic_check_only(struct drm_atomic_st=
ate *state)
> > >               }
> > >       }
> > >
> > > +     for_each_new_crtc_in_state(state, crtc, old_crtc_state, i)
> > > +             affected_crtc |=3D drm_crtc_mask(crtc);
> > > +
> > > +     /*
> > > +      * For commits that allow modesets drivers can add other CRTCs =
to the
> > > +      * atomic commit, e.g. when they need to reallocate global reso=
urces.
> > > +      * This can cause spurious EBUSY, which robs compositors of a v=
ery
> > > +      * effective sanity check for their drawing loop. Therefor only=
 allow
> > > +      * drivers to add unrelated CRTC states for modeset commits.
> > > +      *
> > > +      * FIXME: Should add affected_crtc mask to the ATOMIC IOCTL as =
an output
> > > +      * so compositors know what's going on.
> > > +      */
> > > +     if (affected_crtc !=3D requested_crtc) {
> > > +             DRM_DEBUG_ATOMIC("driver added CRTC to commit: requeste=
d 0x%x, affected 0x%0x\n",
> > > +                              requested_crtc, affected_crtc);
> > > +             WARN(!state->allow_modeset, "adding CRTC not allowed wi=
thout modesets: requested 0x%x, affected 0x%0x\n",
> > > +                  requested_crtc, affected_crtc); =20
> > Previous patch had the warn on state->allow_modeset now is
> > !state->allow_modeset. Is that correct? =20
>=20
> We need to fire a warning when allow_modeset is _not_ set. An earlier
> version got that wrong, and yes that would have caused a _ton_ of
> warnings on any fairly new intel platform.
>=20
> > I haven't followed the entire thread on this matter, but I guess the id=
ea
> > is that somehow the kernel would pass to userspace a CRTC mask of
> > affected_crtc (somehow, we don't know how atm) and with it, userspace
> > can then issue a new commit (this commit blocking) with those? =20
>=20
> Either that, or just use that to track all the in-flight drm events.
> Userspace will get events for all the crtc, not just the one it asked
> to update.

Wait, does that happen already? Getting CRTC events for CRTCs userspace
didn't include in the atomic commit?

That could explain why Weston freaks out in
https://gitlab.freedesktop.org/wayland/weston/-/issues/435


Thanks,
pq


> If that's easier to do by re-issuing the commit with the
> full set of crtc, then I guess that's an option. But not required (I
> think at least, would need to test that to make sure).
> -Daniel
>=20
> > > +     }
> > > +
> > >       return 0;
> > >  }
> > >  EXPORT_SYMBOL(drm_atomic_check_only);

--Sig_/cvmxGpomSOT0enGy/+lmsv=
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEEJQjwWQChkWOYOIONI1/ltBGqqqcFAl9sTY0ACgkQI1/ltBGq
qqf80A//UMvRMHtycw0L/MKdHzQcvXN0dit7EUn5NRhOxqQUWs2v66t2VNMVbQ5i
p4PtPbgXUMPh1W3ZtyZxWzD8aJQfgRq2G3DY3EWO5nZcYf8HDWApBx2WcmoyqCND
6lo1b6keaT1RuKyHQ7dQ4EhO97tWDqxcadeXt8WXG3EAdclN5MWoNrf+af97RKwu
LGFncy+m/ghAaKvDVhxcHsRNakqFEH9AzIsru3LtpQpy+I4HTK/rvzzBJ2+Bt8Wm
x1jRcy2Gs4XkVyUY8+BnU/P3mB4NBid7QEbeiT8aESIkH5y9vmkFUOqP81FIpx8m
l8Y+HDA67vQ56XY1XcQmpl9lezVMxwgKdSdUUOQc4o0jJPOLSBBKlsloiEtw9PDn
LOrlKotII2wn0XjImR6zHHAwjSo42gjLE4NgKepNNK3HdG/FpfaaqSfpOq8bqkpH
zxTPYEXuv1we2/WQIhSyF/rHt09XOTV3IgFNFdp779aD91DqKyAPGsN931lc2l9F
q9mtpJbqaQyHjPdnq2ZiwGmZTcm85DVIhdOnwnMWjeMJn6v2gDIdGoSXcLotn3FD
TPRCVXLWSmhQTgngZWtckLBrozbW3CQpchPwM0vGaTyyo5USU+svWWK00amF0YeP
MWpn/7B5N9VaCTvBvOjrsfI7RBwiyEEnrYG6mk3zS/lXXPwTwmw=
=BBJP
-----END PGP SIGNATURE-----

--Sig_/cvmxGpomSOT0enGy/+lmsv=--

--===============1664347654==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel

--===============1664347654==--
