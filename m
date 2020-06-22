Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C72A7203970
	for <lists+dri-devel@lfdr.de>; Mon, 22 Jun 2020 16:28:30 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3CA6F6E804;
	Mon, 22 Jun 2020 14:28:26 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lj1-x241.google.com (mail-lj1-x241.google.com
 [IPv6:2a00:1450:4864:20::241])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6647C6E0EB;
 Mon, 22 Jun 2020 14:28:24 +0000 (UTC)
Received: by mail-lj1-x241.google.com with SMTP id n23so19519992ljh.7;
 Mon, 22 Jun 2020 07:28:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=date:from:to:cc:subject:message-id:in-reply-to:references
 :mime-version; bh=P5gBKjnB1OsXDdzy1+PQDW2YHOnzPHmavQRkrhB8/ks=;
 b=pmYe8CFrf/1oTHQD7/8NK7Q3f8a2RLFe5qOEE56ftVtE91mg1r2qJXrzxiQz5HgII3
 ihM+eO3QwqPiKlCN71XPpxkiXGOYE8GOtlXP7tgK629Ia435CXRdn6CFmj7g2G1rdZNN
 lJYjgJ4VrMtwa+vbYb5093qepsquLGbljQEdGVUoYWGCh7/kvK8m0U/R+/FYPc/kh+cK
 svtL71wHV+TxPd/2ZUet635lNM9xYvr4+LJdUmIo0/DM8TCQYMu/dvdu1yUhU/RXMXm9
 7YMzqztx0g56ySAQ7atK2bM9P+1z1RLz7lXSy1uxIoW5pl4CGfwTRZ3DMMq7qd52z+fs
 hO/w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:in-reply-to
 :references:mime-version;
 bh=P5gBKjnB1OsXDdzy1+PQDW2YHOnzPHmavQRkrhB8/ks=;
 b=lJx6wOjaJthTXgEhe30DQyiRfiGseNaTyp3hSqqWaXU95U/8fu4QIurUWZHOUVU4vc
 KLXl2fy9pFk7kFWLYhDcpYg1z/IlparY4mk5E2Qwh4ZW+w8JpsWhwjwbepu3FeMPWpt1
 DL0ji7OCai8t5MXzRHM7hjhDXfVDa4I05qq6mF+iZc447xoWqg7R1LJI5h90uwkDcASC
 69LaOy0SpHUQJe1A1p6ShCkLG9/ktDtC6lXdkZVbNAthbmRp7p60/mausD/EVMJLFMXu
 sinzBjVRyqcpzb6HUzMQwQF/UWt3wYBN2OkQ0w+w+gry0s0AgTZCoTR9MsxenAUHVKsN
 ejSg==
X-Gm-Message-State: AOAM5328818D6wtwSkJWSwz9pigL11Nguhs4Rd/5vcCPbkeqgR2NP5SJ
 RdlU9XKr5l/ucJa7Hopw6cY=
X-Google-Smtp-Source: ABdhPJyeuLaNYxxmzjgf+lD2RopbCcx+47YCVlE8qX0wgtkcnCQ8Lb3EfE5uStg7ADgeuGgn61xDzw==
X-Received: by 2002:a2e:5758:: with SMTP id r24mr338992ljd.203.1592836102483; 
 Mon, 22 Jun 2020 07:28:22 -0700 (PDT)
Received: from eldfell ([194.136.85.206])
 by smtp.gmail.com with ESMTPSA id s17sm2744431ljd.51.2020.06.22.07.28.21
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 22 Jun 2020 07:28:22 -0700 (PDT)
Date: Mon, 22 Jun 2020 17:28:18 +0300
From: Pekka Paalanen <ppaalanen@gmail.com>
To: Daniel Vetter <daniel@ffwll.ch>
Subject: Re: [PATCH v2 1/8] drm: Add dummy page per device or GEM object
Message-ID: <20200622172818.307f626b@eldfell>
In-Reply-To: <CAKMK7uG+RTRZ39na3GO7OWiUASokEhe0Ndkex9vNOMj7R34Dwg@mail.gmail.com>
References: <1592719388-13819-1-git-send-email-andrey.grodzovsky@amd.com>
 <1592719388-13819-2-git-send-email-andrey.grodzovsky@amd.com>
 <20200622093501.GZ20149@phenom.ffwll.local>
 <20200622172157.49b835ca@eldfell>
 <CAKMK7uG+RTRZ39na3GO7OWiUASokEhe0Ndkex9vNOMj7R34Dwg@mail.gmail.com>
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
Cc: Christian =?UTF-8?B?S8O2bmln?= <ckoenig.leichtzumerken@gmail.com>,
 Michel =?UTF-8?B?RMOkbnplcg==?= <michel@daenzer.net>,
 dri-devel <dri-devel@lists.freedesktop.org>,
 amd-gfx list <amd-gfx@lists.freedesktop.org>
Content-Type: multipart/mixed; boundary="===============1109442430=="
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

--===============1109442430==
Content-Type: multipart/signed; micalg=pgp-sha256;
 boundary="Sig_/GZ6mKcFtfhRl.t+Qvy7Pj+y"; protocol="application/pgp-signature"

--Sig_/GZ6mKcFtfhRl.t+Qvy7Pj+y
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

On Mon, 22 Jun 2020 16:24:38 +0200
Daniel Vetter <daniel@ffwll.ch> wrote:

> On Mon, Jun 22, 2020 at 4:22 PM Pekka Paalanen <ppaalanen@gmail.com> wrot=
e:
> >
> > On Mon, 22 Jun 2020 11:35:01 +0200
> > Daniel Vetter <daniel@ffwll.ch> wrote:
> > =20
> > > On Sun, Jun 21, 2020 at 02:03:01AM -0400, Andrey Grodzovsky wrote: =20
> > > > Will be used to reroute CPU mapped BO's page faults once
> > > > device is removed.
> > > >
> > > > Signed-off-by: Andrey Grodzovsky <andrey.grodzovsky@amd.com>
> > > > ---
> > > >  drivers/gpu/drm/drm_file.c  |  8 ++++++++
> > > >  drivers/gpu/drm/drm_prime.c | 10 ++++++++++
> > > >  include/drm/drm_file.h      |  2 ++
> > > >  include/drm/drm_gem.h       |  2 ++
> > > >  4 files changed, 22 insertions(+) =20
> >
> > ...
> > =20
> > > > diff --git a/include/drm/drm_gem.h b/include/drm/drm_gem.h
> > > > index 0b37506..47460d1 100644
> > > > --- a/include/drm/drm_gem.h
> > > > +++ b/include/drm/drm_gem.h
> > > > @@ -310,6 +310,8 @@ struct drm_gem_object {
> > > >      *
> > > >      */
> > > >     const struct drm_gem_object_funcs *funcs;
> > > > +
> > > > +   struct page *dummy_page;
> > > >  }; =20
> > >
> > > I think amdgpu doesn't care, but everyone else still might care somew=
hat
> > > about flink. That also shares buffers, so also needs to allocate the
> > > per-bo dummy page. =20
> >
> > Do you really care about making flink not explode on device
> > hot-unplug? Why not just leave flink users die in a fire?
> > It's not a regression. =20
>=20
> It's not about exploding, they won't. With flink you can pass a buffer
> from one address space to the other, so imo we should avoid false
> sharing. E.g. if you happen to write something $secret into a private
> buffer, but only $non-secret stuff into shared buffers. Then if you
> unplug, your well-kept $secret might suddenly be visible by lots of
> other processes you never intended to share it with.
>=20
> Just feels safer to plug that hole completely.

Ah! Ok, I clearly didn't understand the consequences.


Thanks,
pq

--Sig_/GZ6mKcFtfhRl.t+Qvy7Pj+y
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEEJQjwWQChkWOYOIONI1/ltBGqqqcFAl7wwAIACgkQI1/ltBGq
qqcE9A//Z3UNEnWcqO8aJ0C7ncKWgq8M8BVs9oU78I/4P4lQLK0lpw+zQYKlgzWY
LUc53AqymxN/BWsm+8c8AuKmu6r7plkigZzu1Ee77YKIshEQiblMhyKG6MIC+wwH
jhTtB45p8BbRjpBuO2v1Il9aEd1r9FENxbY1S0AU2arCntoAlg1kaGgTilRiPrsr
NAVqxuwOLCcD+uI/1w6BFAvU1OYmfOcc41lB/UJHc84ftAfHzuRqjrIqHQbpLvkV
OtBHHHAQEWsVkW5G2BUes7Umh8zwmUBOUwwy1hXaWg/sOI1TID6NzVVqYlIY/jXw
SVWiPPB8/lBGSyYBA5IEyxO+1ijMHchvpn9vqWz/3NU6ibpcReN0i0JBUhEDPWIm
uQzYWJy2I2j3Sai4hiz0b4m3JRx1TOrg0ysbPDON48Rlq8lZxRMGaA8P1qmtcuwv
6l7deV5C9uCy8jmx9p0WXoR8RBS1WDm/JFhrGXk8Sw1HZBpv1/Bp6mrPqiIcxFyG
S7bm8UgklOHOHQXgXHe6XgME5hD6D3Kw+Sl/CBv9Ac/f5Sz2EX7I7MGop3XzPZzi
/ut1tcFJL5mJowNR3vUJXVDmh5pKvBC0qITkMs3KPChdNQNObNdAgFjl8vO8kqeC
7BxaVkcHVKEJ6BzddPwsRQmNieoeBOPwxYG0FQYFY4/wvcVQBAg=
=PNHM
-----END PGP SIGNATURE-----

--Sig_/GZ6mKcFtfhRl.t+Qvy7Pj+y--

--===============1109442430==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel

--===============1109442430==--
