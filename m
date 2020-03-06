Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 8F51E17BCC4
	for <lists+dri-devel@lfdr.de>; Fri,  6 Mar 2020 13:31:20 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5FDD26ECFD;
	Fri,  6 Mar 2020 12:31:10 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lj1-x242.google.com (mail-lj1-x242.google.com
 [IPv6:2a00:1450:4864:20::242])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 54BB06ECF9
 for <dri-devel@lists.freedesktop.org>; Fri,  6 Mar 2020 12:31:09 +0000 (UTC)
Received: by mail-lj1-x242.google.com with SMTP id q19so2016695ljp.9
 for <dri-devel@lists.freedesktop.org>; Fri, 06 Mar 2020 04:31:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=date:from:to:cc:subject:message-id:in-reply-to:references
 :mime-version; bh=to7bU+MtbuWq2zSmrshAa2RS+7lmc+xLVoJxUf+INQ0=;
 b=l0EQ6qPcS14s2kGTIH/cVFg+M+r1om0oVHrp2ziFTs3W5dZo7pIDCpOuV3oEpxwQKI
 FEaAttqwy0EDA2gpyd6VO4XVaFUXSJ2Piiwn0K/lkpbfgJfIfdFrNxwqpGGlsqKnjuE1
 brEh3Lcq4oQ+ApN96M2bp4SkOCiW0hElG2AJUIyA4cKIjPFvyOiz2ox1AucBB3FDunAI
 Q4TZ1fR8oyRRaOAyvrf7JmCEdx7t0SdR1dtQEjJYHnOJxhoHdiYybr/KZfusEKlnnq/i
 zgGlREj08Ql/Pi+N6uAseYkxvj+szMrdMSWnKhZCfjfrzpHzEFTL1tMAjUFlIPGVqaz7
 ldWA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:in-reply-to
 :references:mime-version;
 bh=to7bU+MtbuWq2zSmrshAa2RS+7lmc+xLVoJxUf+INQ0=;
 b=XTonbedPrOuso0KO1Sdn+JhGbrfLDg6pOHAg1Znf8M/oACk8N5bmmaHGTAM4YBiTtr
 5r1lwOs+6tTrzdTvq2g5KBS0Jkdi0ZVAgFtcNsNtl8KVFcup1dOwC3J01dc5AuhILxVd
 FxixFw6KTb9EUGXjnDdZl6cJJBgI8BA6FjJ00psaLg2e8AtOG8FNSDGbmJ3lCPNnUG4u
 Ta6NUAqpINSFVAI+cQ/rsH1V4rff0ppeH+kFr1H0JIEctsCvl8Jo10EVLiQY2J3Wia5e
 5bF7CKHf+2NGaC/YO+M2edOMvhe8ivUnQuU9o8iTfBYNceAPK9hczBrE/wAbPh5J8Che
 v8yw==
X-Gm-Message-State: ANhLgQ1veCgRFPWwA4/ovxZU3MTSlnF4dDm8lxiycUkWbaFddGJ+1bxw
 dQ+gWMnXIo6AtoqulUastkg=
X-Google-Smtp-Source: ADFU+vt4dBzbnq/Y0wVdLf39g1+fsGA0GgRTLzQx8tXoVUYdyq9dw+lDMisETRdewWX4xZ+IbYqubw==
X-Received: by 2002:a2e:9008:: with SMTP id h8mr1902762ljg.217.1583497867526; 
 Fri, 06 Mar 2020 04:31:07 -0800 (PST)
Received: from eldfell.localdomain ([194.136.85.206])
 by smtp.gmail.com with ESMTPSA id u4sm2691157lfo.79.2020.03.06.04.31.06
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 06 Mar 2020 04:31:07 -0800 (PST)
Date: Fri, 6 Mar 2020 14:30:57 +0200
From: Pekka Paalanen <ppaalanen@gmail.com>
To: Daniel Vetter <daniel@ffwll.ch>
Subject: Re: [PATCH 1/4] drm/fourcc: Add modifier definitions for describing
 Amlogic Video Framebuffer Compression
Message-ID: <20200306143057.1506cac3@eldfell.localdomain>
In-Reply-To: <20200306101328.GR2363188@phenom.ffwll.local>
References: <20200221090845.7397-1-narmstrong@baylibre.com>
 <20200221090845.7397-2-narmstrong@baylibre.com>
 <20200303121029.5532669d@eldfell.localdomain>
 <20200303105325.bn4sob6yrdf5mwrh@DESKTOP-E1NTVVP.localdomain>
 <CAKMK7uFgQGrnEkXyac15Wz8Opg43RTa=5cX0nN5=E_omb8oY8Q@mail.gmail.com>
 <20200303152541.68ab6f3d@eldfell.localdomain>
 <20200303173332.1c6daa09@eldfell.localdomain>
 <20200306101328.GR2363188@phenom.ffwll.local>
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
Cc: Neil Armstrong <narmstrong@baylibre.com>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 dri-devel <dri-devel@lists.freedesktop.org>, linux-amlogic@lists.infradead.org,
 nd <nd@arm.com>, Linux ARM <linux-arm-kernel@lists.infradead.org>
Content-Type: multipart/mixed; boundary="===============1410089484=="
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

--===============1410089484==
Content-Type: multipart/signed; micalg=pgp-sha256;
 boundary="Sig_/r_fP+nfVOoASHK7UVgVRJ0U"; protocol="application/pgp-signature"

--Sig_/r_fP+nfVOoASHK7UVgVRJ0U
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

On Fri, 6 Mar 2020 11:13:28 +0100
Daniel Vetter <daniel@ffwll.ch> wrote:

> On Tue, Mar 03, 2020 at 05:33:32PM +0200, Pekka Paalanen wrote:
> > On Tue, 3 Mar 2020 15:25:41 +0200
> > Pekka Paalanen <ppaalanen@gmail.com> wrote:
> >  =20
> > > On Tue, 3 Mar 2020 12:37:16 +0100
> > > Daniel Vetter <daniel@ffwll.ch> wrote:
> > >  =20
> > > > On Tue, Mar 3, 2020 at 11:53 AM Brian Starkey <brian.starkey@arm.co=
m> wrote:   =20
> > > > >
> > > > > Hi,
> > > > >
> > > > > On Tue, Mar 03, 2020 at 12:10:29PM +0200, Pekka Paalanen wrote:  =
   =20
> > > > > > On Fri, 21 Feb 2020 10:08:42 +0100
> > > > > > Neil Armstrong <narmstrong@baylibre.com> wrote:
> > > > > >     =20
> > ... =20
> > > > > > > +/*
> > > > > > > + * Amlogic Video Framebuffer Compression modifiers
> > > > > > > + *
> > > > > > > + * Amlogic uses a proprietary lossless image compression pro=
tocol and format
> > > > > > > + * for their hardware video codec accelerators, either video=
 decoders or
> > > > > > > + * video input encoders.
> > > > > > > + *
> > > > > > > + * It considerably reduces memory bandwidth while writing an=
d reading
> > > > > > > + * frames in memory.
> > > > > > > + * Implementation details may be platform and SoC specific, =
and shared
> > > > > > > + * between the producer and the decoder on the same platform=
.     =20
> > > > > >
> > > > > > Hi,
> > > > > >
> > > > > > after a lengthy IRC discussion on #dri-devel, this "may be plat=
form and
> > > > > > SoC specific" is a problem.
> > > > > >
> > > > > > It can be an issue in two ways:
> > > > > >
> > > > > > - If something in the data acts like a sub-modifier, then adver=
tising
> > > > > >   support for one modifier does not really tell if the data lay=
out is
> > > > > >   supported or not.
> > > > > >
> > > > > > - If you need to know the platform and/or SoC to be able to int=
erpret
> > > > > >   the data, it means the modifier is ill-defined and cannot be =
used in
> > > > > >   inter-machine communication (e.g. Pipewire).
> > > > > >     =20
> > > > >
> > > > > Playing devil's advocate, the comment sounds similar to
> > > > > I915_FORMAT_MOD_{X,Y}_TILED:
> > > > >
> > > > >  * This format is highly platforms specific and not useful for cr=
oss-driver
> > > > >  * sharing. It exists since on a given platform it does uniquely =
identify the
> > > > >  * layout in a simple way for i915-specific userspace.     =20
> > > >=20
> > > > Yeah which we regret now. We need to now roll out a new set of
> > > > modifiers for at least some of the differences in these on the
> > > > modern-ish chips (the old crap is pretty much lost cause anyway).
> > > >=20
> > > > This was kinda a nasty hack to smooth things over since we have epic
> > > > amounts of userspace, but it's really not a great idea (and no one
> > > > else really has epic amounts of existing userspace that uses tiling
> > > > flags everywhere, this is all new code).
> > > > -Daniel
> > > >    =20
> > > > > Isn't the statement that this for sharing between producer and de=
coder
> > > > > _on the same platform_ a similar clause with the same effect?
> > > > >
> > > > > What advantage is there to exposing the gory details? For Arm AFBC
> > > > > it's necessary because IP on the SoC can be (likely to be) from
> > > > > different vendors with different capabilities.
> > > > >
> > > > > If this is only for talking between Amlogic IP on the same SoC, a=
nd
> > > > > those devices support all the same "flavours", I don't see what is
> > > > > gained by making userspace care about internals.     =20
> > > >=20
> > > > The trouble is if you mix&match IP cores, and one of them supports
> > > > flavours A, B, C and the other C, D, E. But all you have is a single
> > > > magic modifier for "whatever the flavour is that soc prefers". So
> > > > someone gets to stuff this in DT.
> > > >=20
> > > > Also eventually, maybe, perhaps ARM does grow up into the
> > > > client/server space with add-on pcie graphics, and at least for cli=
ent
> > > > you very often end up with integrated + add-in pcie gpu. At that po=
int
> > > > you really can't have magic per-soc modifiers anymore.   =20
> > >=20
> > > Hi,
> > >=20
> > > I also heard that Pipewire will copy buffers and modifiers verbatim
> > > from one machine to another when streaming across network, assuming
> > > that the same modifier means the same thing on all machines.[Citation=
 needed]
> > >=20
> > > If that is something that must not be done with DRM modifiers, then
> > > please contact them and document that. =20
> >=20
> > Sorry, it's waypipe, not pipewire:
> > https://gitlab.freedesktop.org/mstoeckl/waypipe/ =20
>=20
> I do think this is very much something we want to make possible. They
> might pick a silly modifier (compression modifiers only compress bw, by
> necessity the lossless ones have to increase storage space so kinda dumb
> thing to push over the network if you don't add .xz or whatever on top).
>=20
> I'm also hoping that intel's modifiers are definitely the one and only
> that we ever screwed up, and we should be getting those fixed in the near
> future too.
>=20
> So maybe what we should do instead is add a comment to the modifier docs
> that this stuff _is_ supposed to be transferrable over networks and work.

Personally I was not sure if it was so. Good to hear it is. Writing it
down would be much appreciated.

While at it, could you also write down something about the requirements
of memory layout documentation? What I mean is, is it required that the
memory layout is publicly specified *somewhere* if not in the modifier
doc itself?

It's not necessary for anyone to actually know the memory layout when
the use cases only involve hardware access, but if there is no public
spec I fear it would be easy to adapt an incompatible layout somewhere
and never be able to notice until some rare case of interoperability
mysteriously produces garbage.


Thanks,
pq

--Sig_/r_fP+nfVOoASHK7UVgVRJ0U
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEEJQjwWQChkWOYOIONI1/ltBGqqqcFAl5iQoEACgkQI1/ltBGq
qqfCGxAAox4nO+w/VXB7GvaaUnfq9XR88+4sxGBKVIkfOVSsxxnE7oA+DAPrzq3C
FqWKzbVYJhYTD84jea8tM029FeGPAlQbxZAph4YRM1kfCKqduxoPwoLOqR5k3W9X
vkLo0T0m6oKslV2Gico/FFIRwCMZjHPh++ye8Ka9e/b+cNTTsYFH03gyAmyfiHa5
wmt91K/ubByRZTmY9QoihQto4M1W7t5V76hl2yjVRDkU6BVM1K8DB0K1VhPBTDfZ
ratG+r1scmAM2bsbsFWwxaTiv1zF9Z1zvUZcSSKFkWbbsU+AF+rmdYBs+M9/Wnny
INwPZIMg7GqzwV4z6J++E4TajjFLeku/pqmZSX2ITGu7f4WtOV64m5+aQDdohNuh
kUepGl2CCFtWaAOLUwdpwfGw8SFA74g4ac1xTyBGgNECewmt44fkP785imtmtYAn
BiTchituR4jNrOTEo9WiZ4+bDC5dgjhp9dfZdWSEe7l0r3HgDOdFYcNbaCap3tKt
5PE6MqyXXOD6yxqwfgpuFp/hja0T73RfzutNi6s84Bdx7M00lAg0owl3JrHx2Zou
buqgRbNYYUYD7qmoYMUvpYlEsTCXClURVawf9G+Gh5Uc3bW5lGIR/DdzAw3tdPwW
9TkR0C7rUWVWIotYUxwUujYoq4FXWv1mD4C2t/F2FXD8WAiVBqs=
=eeJ1
-----END PGP SIGNATURE-----

--Sig_/r_fP+nfVOoASHK7UVgVRJ0U--

--===============1410089484==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel

--===============1410089484==--
