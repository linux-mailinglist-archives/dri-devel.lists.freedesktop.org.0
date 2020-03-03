Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 5D996177A7D
	for <lists+dri-devel@lfdr.de>; Tue,  3 Mar 2020 16:33:51 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7DEC76E44F;
	Tue,  3 Mar 2020 15:33:47 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-x144.google.com (mail-lf1-x144.google.com
 [IPv6:2a00:1450:4864:20::144])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D1DF16E44F
 for <dri-devel@lists.freedesktop.org>; Tue,  3 Mar 2020 15:33:46 +0000 (UTC)
Received: by mail-lf1-x144.google.com with SMTP id x22so2080565lff.5
 for <dri-devel@lists.freedesktop.org>; Tue, 03 Mar 2020 07:33:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=date:from:to:cc:subject:message-id:in-reply-to:references
 :mime-version; bh=XytWu3r+dyU0/pBn+bsdKdNhWgIQTzaFhBsjgsKZH6w=;
 b=OM4XifN+M6+A2PZ9MzioR4F2cYY82qVtoiwI5RXGtYAs5NkggLnfT1CPA2bm/3wRLM
 mlMrIdcFk8AWRZHTqqjk7UNTGQtDsEvkn/OP/zeMw6l6qz+dddPOrc+qyI8KE9KkESFP
 qqGnqXabEjyd1UmBfvDjivPTWTfGshIsxo/8uq0iJY9bWAYW2t1rxUJDuDtXq7HDQ7hb
 3ngv5LeBAZyA4pSL+EsIc2qgeoTRXtiFNzyZJXK02trUK52/klNOBWUM1/kFeAsRnWph
 bpynirb4f009m0s1GWjQMz+d20R1GyxrovTlOtGnUwc9GD5ExCE3KwOGaFnWKqPK0RKQ
 xEzQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:in-reply-to
 :references:mime-version;
 bh=XytWu3r+dyU0/pBn+bsdKdNhWgIQTzaFhBsjgsKZH6w=;
 b=uOcVIkDv/ubRJkuoyyzugBaaIaqUbX/RX/bxEyimdRqrT+17utDL2Fbc/1JKjlRkQ1
 qOwWHs/HQ+bdBU0Ab2Es2LJ2Ipa0ZQ4EgVSxlhagPBCwP0AFzK7eT9Del/NMaYQ9ouqc
 cdCQtc2n8CL1hrJSUpEHdlpfhQn5iOpaS4T8ZKfFJFnVjOUgh6yzUcEEInekKwBTalcQ
 SXYerJlxPbmNjvheLMs0wAZnyiq1arSy3RN1v6ASeaXqyVFvWDDvPnWP3O7OZoU4Eb7Z
 e2ghmgRI6ztir/TChvzoevDEo9fVx3A228UDl/+MqTVX/JHPDxDTM9kkFZN0tKISBWQe
 nU7Q==
X-Gm-Message-State: ANhLgQ0J+Nw7saRjuUaQ3ipeTzB7P5quKp/BBPN/HQlXu6gRFwX6VCh3
 ZGe7bJPMJH0baVtzqPxoteI=
X-Google-Smtp-Source: ADFU+vslCx/lECf3x2KeBaVe02BXfwEXpJUB9Z6hR0mPse2M4runJ7vPXLJpkcx8fGxX1wGryt40OA==
X-Received: by 2002:ac2:58ee:: with SMTP id v14mr1297311lfo.62.1583249625234; 
 Tue, 03 Mar 2020 07:33:45 -0800 (PST)
Received: from eldfell.localdomain ([194.136.85.206])
 by smtp.gmail.com with ESMTPSA id 19sm12036899lfp.86.2020.03.03.07.33.43
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 03 Mar 2020 07:33:44 -0800 (PST)
Date: Tue, 3 Mar 2020 17:33:32 +0200
From: Pekka Paalanen <ppaalanen@gmail.com>
To: Daniel Vetter <daniel@ffwll.ch>
Subject: Re: [PATCH 1/4] drm/fourcc: Add modifier definitions for describing
 Amlogic Video Framebuffer Compression
Message-ID: <20200303173332.1c6daa09@eldfell.localdomain>
In-Reply-To: <20200303152541.68ab6f3d@eldfell.localdomain>
References: <20200221090845.7397-1-narmstrong@baylibre.com>
 <20200221090845.7397-2-narmstrong@baylibre.com>
 <20200303121029.5532669d@eldfell.localdomain>
 <20200303105325.bn4sob6yrdf5mwrh@DESKTOP-E1NTVVP.localdomain>
 <CAKMK7uFgQGrnEkXyac15Wz8Opg43RTa=5cX0nN5=E_omb8oY8Q@mail.gmail.com>
 <20200303152541.68ab6f3d@eldfell.localdomain>
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
Content-Type: multipart/mixed; boundary="===============1149977619=="
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

--===============1149977619==
Content-Type: multipart/signed; micalg=pgp-sha256;
 boundary="Sig_/20t=Q+C95R6JGDJv5djFJCC"; protocol="application/pgp-signature"

--Sig_/20t=Q+C95R6JGDJv5djFJCC
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

On Tue, 3 Mar 2020 15:25:41 +0200
Pekka Paalanen <ppaalanen@gmail.com> wrote:

> On Tue, 3 Mar 2020 12:37:16 +0100
> Daniel Vetter <daniel@ffwll.ch> wrote:
>=20
> > On Tue, Mar 3, 2020 at 11:53 AM Brian Starkey <brian.starkey@arm.com> w=
rote: =20
> > >
> > > Hi,
> > >
> > > On Tue, Mar 03, 2020 at 12:10:29PM +0200, Pekka Paalanen wrote:   =20
> > > > On Fri, 21 Feb 2020 10:08:42 +0100
> > > > Neil Armstrong <narmstrong@baylibre.com> wrote:
> > > >   =20
...
> > > > > +/*
> > > > > + * Amlogic Video Framebuffer Compression modifiers
> > > > > + *
> > > > > + * Amlogic uses a proprietary lossless image compression protoco=
l and format
> > > > > + * for their hardware video codec accelerators, either video dec=
oders or
> > > > > + * video input encoders.
> > > > > + *
> > > > > + * It considerably reduces memory bandwidth while writing and re=
ading
> > > > > + * frames in memory.
> > > > > + * Implementation details may be platform and SoC specific, and =
shared
> > > > > + * between the producer and the decoder on the same platform.   =
=20
> > > >
> > > > Hi,
> > > >
> > > > after a lengthy IRC discussion on #dri-devel, this "may be platform=
 and
> > > > SoC specific" is a problem.
> > > >
> > > > It can be an issue in two ways:
> > > >
> > > > - If something in the data acts like a sub-modifier, then advertisi=
ng
> > > >   support for one modifier does not really tell if the data layout =
is
> > > >   supported or not.
> > > >
> > > > - If you need to know the platform and/or SoC to be able to interpr=
et
> > > >   the data, it means the modifier is ill-defined and cannot be used=
 in
> > > >   inter-machine communication (e.g. Pipewire).
> > > >   =20
> > >
> > > Playing devil's advocate, the comment sounds similar to
> > > I915_FORMAT_MOD_{X,Y}_TILED:
> > >
> > >  * This format is highly platforms specific and not useful for cross-=
driver
> > >  * sharing. It exists since on a given platform it does uniquely iden=
tify the
> > >  * layout in a simple way for i915-specific userspace.   =20
> >=20
> > Yeah which we regret now. We need to now roll out a new set of
> > modifiers for at least some of the differences in these on the
> > modern-ish chips (the old crap is pretty much lost cause anyway).
> >=20
> > This was kinda a nasty hack to smooth things over since we have epic
> > amounts of userspace, but it's really not a great idea (and no one
> > else really has epic amounts of existing userspace that uses tiling
> > flags everywhere, this is all new code).
> > -Daniel
> >  =20
> > > Isn't the statement that this for sharing between producer and decoder
> > > _on the same platform_ a similar clause with the same effect?
> > >
> > > What advantage is there to exposing the gory details? For Arm AFBC
> > > it's necessary because IP on the SoC can be (likely to be) from
> > > different vendors with different capabilities.
> > >
> > > If this is only for talking between Amlogic IP on the same SoC, and
> > > those devices support all the same "flavours", I don't see what is
> > > gained by making userspace care about internals.   =20
> >=20
> > The trouble is if you mix&match IP cores, and one of them supports
> > flavours A, B, C and the other C, D, E. But all you have is a single
> > magic modifier for "whatever the flavour is that soc prefers". So
> > someone gets to stuff this in DT.
> >=20
> > Also eventually, maybe, perhaps ARM does grow up into the
> > client/server space with add-on pcie graphics, and at least for client
> > you very often end up with integrated + add-in pcie gpu. At that point
> > you really can't have magic per-soc modifiers anymore. =20
>=20
> Hi,
>=20
> I also heard that Pipewire will copy buffers and modifiers verbatim
> from one machine to another when streaming across network, assuming
> that the same modifier means the same thing on all machines.[Citation nee=
ded]
>=20
> If that is something that must not be done with DRM modifiers, then
> please contact them and document that.

Sorry, it's waypipe, not pipewire:
https://gitlab.freedesktop.org/mstoeckl/waypipe/


Thanks,
pq

--Sig_/20t=Q+C95R6JGDJv5djFJCC
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEEJQjwWQChkWOYOIONI1/ltBGqqqcFAl5eeMwACgkQI1/ltBGq
qqf/Fg//cGf3Jl24cG2786dCZ6HUCq1M9Y8RBH9FF1vf3OKM+cc+1L4WTQSeMyBl
mrIx/SCALVu00WoTKDL3raIX50dBnhx5jXp02bEQYpPVSvS4a9YD1DmgoqogGU6R
2mq9M//HkRSUkM6bqSoHPUvyuhGnPSj99mEJ4nl/yaiUMLsgF/HLtwLB4i9lGtMo
Ecdjd47ds/uMOFT6kBwwWvDDmSNbSGDtXFLbd5bGGZ4IAwue2BtHcEkZpwEIYB0w
0Ckd0Cbx7Fw8Pz4/trYm8gmRrQRJg0d7uQK073O+gle8oqam/2Sldy4UQv7SuSLC
sFW7dZWQ/M1B5s0hlnsXn17Vg/PAfu/iDbVwnIEtjEeCX3N26Kmh7yqeeuJnxaci
+ULCDxDjXUVcoWKzP8hj/savLLgPWsHNg6M27CRwp3rcWW2I7hAzYK8cqc7ym5bW
fEBdAJ2l81ciF/q7mLcch1zjVtmBtOwGWdVlBxZwsx7P+mwLOIOIa8jByYKvHh5R
ObIQlo9fjg+001No3rIXwUHjYqLuXsKMM3qIZ9wNzFPRYf3y6nAaJFFLGMMcIVX7
oeyppX/R7Shaj4x2O3b7ryEc7YKHxWMw1FneHYYP7tuWkz76e2OyLRB+x5XmEDe7
qCcQN8MD/yaWaZDsns6GmmpV1k20V8iLqgKNXTyoSHYv8bNgrlg=
=N4Y2
-----END PGP SIGNATURE-----

--Sig_/20t=Q+C95R6JGDJv5djFJCC--

--===============1149977619==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel

--===============1149977619==--
