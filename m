Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D5D2B147954
	for <lists+dri-devel@lfdr.de>; Fri, 24 Jan 2020 09:25:22 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 98F5F6FF53;
	Fri, 24 Jan 2020 08:25:18 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-x144.google.com (mail-lf1-x144.google.com
 [IPv6:2a00:1450:4864:20::144])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3291A6FF53;
 Fri, 24 Jan 2020 08:25:17 +0000 (UTC)
Received: by mail-lf1-x144.google.com with SMTP id c23so580210lfi.7;
 Fri, 24 Jan 2020 00:25:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=date:from:to:cc:subject:message-id:in-reply-to:references
 :mime-version; bh=5DLKk6gU0FC8uw8HjUV23kmaHM4elbziixtS1AYEZeo=;
 b=GecEV73mxkWch550JelUTS0xTNrKZNb8ZN+lavzRkRfafB396iZQj++WamiPtC8xP2
 I3xYdFdsBghxcfTS9A6BL5VCjljSCYOC6aIXZIXzPKVEHwNbiMfjkIp+Fb+P6obKcQ2g
 kv0/gYKYIaqwSf7JI7QLp1CvJhxd7LSYvaqdiMalHcAOligKGkjM+BAmgWJX+RDru9UE
 ffwMR0eKfBwAODlDlNpxx0DjP53wXAR49vlyEdMyFwI+f43Glej56Z9x2CpxYEOFAa72
 J52BvkBFZlBC7d0weLOeotal9IFVa0qRd17K1kId2AiKFrzdNdj4XsU02n57rfNnEPpF
 ju4w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:in-reply-to
 :references:mime-version;
 bh=5DLKk6gU0FC8uw8HjUV23kmaHM4elbziixtS1AYEZeo=;
 b=Yv+NlagaVlFOcMNNbtbGgFY9TpbO7TSI7Ah0ntn9j0xBi8J/Dye/26mqpBUfW7OTb7
 TTXgh37srNu3oLrXIkru8T/ZGGZQhO32K+c1QPpa9H8ABFPzZdJ3WxOHkj0uVqWTst0q
 GF7h4JbRrhM6QnVHICnlOZQLs4fnV44biU0Xfyi3cSB9LbOdpgZcqZ1zMscP/wIQf/bO
 rjpai5dQV+a75FMa8gmQOC1Tg0aSVDymJwyh2w0rANPzulkUy6uKFjQyGvvSrt026k67
 dF8rN41gU96tBuG3XBJPrLMOSEsYxPTGvTHQ7MWHmKITOeNxu0W1wBdNHSfjQcnFLhIF
 Gd0w==
X-Gm-Message-State: APjAAAWuVfau+TDwuoVwt8pX/Bvi5M96sj6synpI9Cj17qGQAE9wN81Y
 mytKiV2Wlqt558LnEtfOqho=
X-Google-Smtp-Source: APXvYqzPYro5/r7k1V26N+i8DOkorNXDUELOIetMzdJfvbXidwHZf3LM/WUa+pA7U5yBiNNCKt2YUw==
X-Received: by 2002:a19:c3ce:: with SMTP id t197mr869152lff.174.1579854315440; 
 Fri, 24 Jan 2020 00:25:15 -0800 (PST)
Received: from eldfell.localdomain ([194.136.85.206])
 by smtp.gmail.com with ESMTPSA id t10sm2627433lji.61.2020.01.24.00.25.14
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 24 Jan 2020 00:25:15 -0800 (PST)
Date: Fri, 24 Jan 2020 10:25:05 +0200
From: Pekka Paalanen <ppaalanen@gmail.com>
To: Matt Hoosier <matt.hoosier@gmail.com>
Subject: Re: backend-drm and scanning really large resolutions
Message-ID: <20200124102505.31baceb3@eldfell.localdomain>
In-Reply-To: <CAJgxT3-XVipi_k8LDaEjJjCj6ReBNLUyjF=xhkK1v0vceP_t6w@mail.gmail.com>
References: <CAJgxT3-cJu54Rn-9CstjaRHHtaJB_WK+R0RzKsDoK4TttDNFOg@mail.gmail.com>
 <20200120105812.20c56b65@eldfell.localdomain>
 <CAJgxT3-XVipi_k8LDaEjJjCj6ReBNLUyjF=xhkK1v0vceP_t6w@mail.gmail.com>
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
Cc: dri-devel <dri-devel@lists.freedesktop.org>,
 wayland mailing list <wayland-devel@lists.freedesktop.org>
Content-Type: multipart/mixed; boundary="===============0227958719=="
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

--===============0227958719==
Content-Type: multipart/signed; micalg=pgp-sha256;
 boundary="Sig_/O1qRYexNRWU23AP2NRb3IDm"; protocol="application/pgp-signature"

--Sig_/O1qRYexNRWU23AP2NRb3IDm
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

On Tue, 21 Jan 2020 08:51:26 -0600
Matt Hoosier <matt.hoosier@gmail.com> wrote:

> On Mon, Jan 20, 2020 at 2:58 AM Pekka Paalanen <ppaalanen@gmail.com> wrot=
e:
>=20
> > On Fri, 17 Jan 2020 10:51:45 -0600
> > Matt Hoosier <matt.hoosier@gmail.com> wrote:
> > =20
> > > Hi all,
> > >
> > > I'm confronting a situation where the hardware with which I work is =
=20
> > capable =20
> > > of driving connectors at 4K or 8K, but doing so requires bonding the
> > > scanning of multiple planes together.
> > >
> > > The scenario is that you'd have a big primary framebuffer whose size =
is =20
> > too =20
> > > large for an individual hardware scanning pipeline on the display
> > > controller to traverse within its maximum allowed clock rate.
> > >
> > > The hardware supplier's approach is to assign multiple planes, which =
in =20
> > the =20
> > > KMS driver map to hardware scanning pipelines, to each be responsible=
 for
> > > scanning a smaller section of the framebuffer. The planes are all =20
> > assigned =20
> > > to the same CRTC, and in concert with each other they cover the whole=
 =20
> > area =20
> > > of the framebuffer and CRTC.
> > >
> > > This sounds a little bit wild to me. I hadn't been aware it's even le=
gal =20
> > to =20
> > > have more than one plane treated a the source of scanout for a single
> > > framebuffer. Maybe that distinction isn't really relevant nowadays wi=
th
> > > universal plane support.
> > >
> > > I'm wondering if anybody here knows whether this a legit approach for=
 a
> > > compositor's DRM backend to take? =20
> > =20
>=20
> Hi Pekka; thanks for the reply.
>=20
>=20
> >
> > Hi,
> >
> > I was aware of tiled monitors that need two connectors driven by two
> > CRTCs to cover the whole display, but that sounds new to me.
> > Libweston/DRM still doesn't support tiled monitors.
> >
> > What a compositor's DRM-backend can or should do must be generic. It
> > cannot be driver or hardware dependent, so handling your case specially
> > in userspace would need KMS UAPI to communicate the need in the first
> > place. (There is no shared library for "KMS userspace drivers", yet at
> > least.)
> >
> > I am not aware of any KMS UAPI that would indicate the need to use two
> > primary planes in a specific configuration for a specific video mode.
> > I'm saying two primary planes, because that is the only way I can see
> > this situation even hinted at userspace with the current UAPI. I also
> > don't know if multiple primary planes is allowed, but it certainly is
> > not expected by userspace, so userspace can't make use of it as is.
> > =20
>=20
> Just to double-check: I think we're still talking here about
> universal-plane mode, so we only mean "primary plane" in an informal sens=
e?

Hi,

I'm talking in both universal-planes and atomic modesetting mode. I
always talk from the userspace point of view as I'm not a kernel
developer. In my mind, the concept of "primary plane" does not exist
before universal planes. There is only drmModeSetCrtc() in the
pre-atomic world and that acts on a CRTC, not a plane, and assumes
the FB must cover the whole CRTC area exactly and without scaling.

IOW, there is no legacy UAPI that you could even use to poke more than
one (primary) plane AFAIU.

> This problem would crop up on any attempt to attach a huge framebuffer to=
 a
> single plane (whether it happened to be the bottom z-sorted one or a
> something used as an overlay).

Traditionally hardware has required that a CRTC must have exactly one
primary plane enabled and that plane must cover the whole CRTC area
exactly. Otherwise the CRTC will not light up. Therefore userspace has
been written with this assumption, so it special-cases the primary
plane. Some KMS programs might try other things first, but this is the
baseline they expect to be the right thing to do when nothing else
works.

Non-primary planes, that is overlays and underlays (both as type
"overlay" in universal planes), and cursors kind of, are traditionally
much more flexible, but I don't know of any userspace that would
attempt to use more than one plane to present one FB. If using a
non-primary plane fails on the first try, userspace doesn't know why -
there are a million things it could attempt to change, so it probably
just doesn't bother. Documenting what fallback strategies to try would
be nice on one hand, but OTOH the more strategies there are, the more
time it will take for userspace to search that solution space.

> > The idea that comes to my mind is to hide all the details in the
> > driver. Expose just one primary plane as usual, and if the video mode
> > and FB actually need two scanout units, then steal one under the hood
> > in the driver. If that makes another KMS plane (exposed to userspace)
> > unusable, that is fine. Userspace with atomic modesetting needs to be
> > checking with TEST_ONLY to see if a configuration is possible, and will
> > fall back to something else.
> > =20
>=20
> I think that's about the only approach that would make sense. Who would be
> a good person to sanity-check that with? Daniel V? Daniel S?

Daniel Vetter is an authority to me in these matters.

> I suppose in principle that if this is a valid corner-case of the KMS api,
> then maybe it wouldn't be wrong to enhance compositors DRM backends to
> progressively attempt attaching more and more planes to scan a framebuffer
> if the drmModeAtomicCommit(DRM_MODE_ATOMIC_TEST_ONLY) fails for the base
> case. But whether anybody in the Weston world would want that patch is
> probably another story...

I suspect that would lead to a mess on both kernel and userspace sides,
since once you establish something like that, you cannot get rid of it.
You would need to document it as UAPI that if userspace fails to enable
the primary plane in isolation, then it needs to try with more primary
planes splitting the FB among them in a specific way. What way?
Horizontally? Vertically? Both? How future-proof is that?

Besides, Weston is not at all the only display server you'd have to
patch. There is Xorg/modesetting, every single DE that runs with
Wayland, and all apps written for KMS directly. Even more, you also get
to fix all apps that use DRM leases, which likely includes things like
VR compositors.

Hiding all this inside your driver in the kernel is a much more
attractive approach to me. Userspace will always be shooting in the
dark, but the driver knows its constraints. I don't see the use of
multiple hwpipes or whatever as something the userspace would want to
control explicitly. Userspace just wants the hardware to work, it
doesn't care how.


Thanks,
pq

> > For legacy modesetting I guess you would need to pick between
> > supporting the really large video modes vs. exposing all planes. But
> > that's a no-brainer, since the legacy API for planes is practically
> > unusable. Then again, I don't know if the kernel DRM core allows you to
> > make such distinction.
> >
> > Btw. AFAIK there is nothing wrong with using the exact same FB on
> > multiple planes simultaneously.
> >
> >
> > Thanks,
> > pq
> > =20


--Sig_/O1qRYexNRWU23AP2NRb3IDm
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEEJQjwWQChkWOYOIONI1/ltBGqqqcFAl4qqeEACgkQI1/ltBGq
qqfH0A/+LGrJT0+Op9hU8F2Y5NW/5vLfDaAEO7jk5bWvo2P6bAf8Ik5QS6pmImgg
Faj3Jnb/qKRHo7JRRxAexgn9UcedSc1ifbp1fddXpSUXfVMDU7yZJZxhfJgJb/wR
B46GaN+RMYKE3LcAhwf4E6ycYeuXikwUX6uVafqDxC8sya19HlvBefk8jmdKG848
er253Bb3aEzpY9CDxGpRMcasoxzRwehYJPTIW3uCyETbVEz1o7UnkNFIeF623tHk
IWUWWi053HWnuiYMt2oWG3X1/nYYQniKMxKufJ3TgdcixT1BBSQbtnmrm0DlEsdU
VoScPOrorLo4beEPpy0Qtm9UW9m1RC1JeEn++FJ5c+C9zY6NNhnpcphOvfkPyiFN
Ts5MZTNVoDpn4vbmzlb/7lAiYNAGm50NACZIc0yuO8Fq3ISB02B0f0xoQiwK3TBR
YYr8y9nlcqVXMERiCxMuf6ezqXqiQ2oIwFzGzk6cdwz1YQ1+SIhDkOemA24ExVUM
kb4HCdC1QHEBSWAZrGqfXv3Ebc2IVcFVuvLoOH/CxHZzc1JX54KypzZJRWbshrP6
lOsNeRmxktIxCsyhnOkGh4wqWHh/m+vQ20dtRQy8dAsPV5Waxasm24FpaAjCu9cg
w4/jEpS08T8HzqB45KCFrik1CTsHKflSVQ1aoRBuWKjkqhrRE2I=
=rA+1
-----END PGP SIGNATURE-----

--Sig_/O1qRYexNRWU23AP2NRb3IDm--

--===============0227958719==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel

--===============0227958719==--
