Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 792897C6B50
	for <lists+dri-devel@lfdr.de>; Thu, 12 Oct 2023 12:40:02 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9BA0F10E4AA;
	Thu, 12 Oct 2023 10:39:58 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-x12e.google.com (mail-lf1-x12e.google.com
 [IPv6:2a00:1450:4864:20::12e])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CDE3C10E4AA;
 Thu, 12 Oct 2023 10:39:56 +0000 (UTC)
Received: by mail-lf1-x12e.google.com with SMTP id
 2adb3069b0e04-503f39d3236so1125589e87.0; 
 Thu, 12 Oct 2023 03:39:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1697107195; x=1697711995; darn=lists.freedesktop.org;
 h=mime-version:references:in-reply-to:message-id:subject:cc:to:from
 :date:from:to:cc:subject:date:message-id:reply-to;
 bh=8S0X95eosKBQe6vHh4E9A2FwpV5neLU3p1lN+rp2jw0=;
 b=fBt2LRIQ/1UP8uulP7Joc2ecJTqlPb554FcKhuNIJCk6MzDE49D1e9v2RbleAXhnEG
 DvH0XNGp8U1hLbeKAjKBViGzrAqqP6WbFG73nnSyR47L7mIDleppPCIF7s9dJTKVr00X
 PFq4TUaRLzrgZa4wCKiOBHp8Ymf/JI375GIHBtiRx73K77NX0a55XOX2EMaGFv+Xde7x
 V9KzHqr1CJ/DSu7R6tfxwDT/j+dkMX1HFw8d5esRDKLKwkV2OIGZNCBhsZkOTYraAxcT
 TUz+Tc+wFG9emNJ51pO8BgJeCn/WEMDWzEpDOst4fEZCmirMlVGhTKDWsK2slasn8gQ8
 RWJA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1697107195; x=1697711995;
 h=mime-version:references:in-reply-to:message-id:subject:cc:to:from
 :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=8S0X95eosKBQe6vHh4E9A2FwpV5neLU3p1lN+rp2jw0=;
 b=s1DHgnf+fupFnRgzin+NRCcLbGMYw92dtKzSM6aeQQYFqe5LpTEJEcL+UY0s9rq6VV
 N9vNlWOsZvcsWEr7IgNbaJbXEOJ4qNNYGzb2jbjdFGAk/A/TLjWpH/sBMiTE4DWaApTN
 pwq9G/AcK0/RRGR1++ecW9CpYZxwUZ7/je14fWo5WxF8F7U1/sNNbZi3XyA7YtW4oJJt
 Zfjk9sMrvT4uvceVRLWpbV8hjLRppDdUCigr5OPydagzCTaECNKjMuzPIAAtBOBIH/Ww
 Exizy1TmGYTgnaPinpZwDO4SFkHEYpOOfAhfuPZhJNGljkXlrZlEZBZjkaq6wzx1Cm3Q
 Iv8w==
X-Gm-Message-State: AOJu0Yy7aWdScn9Q2anZ7l+fbb2cgXDRkE/Ta1qhAgD42zn7ihf/ypBS
 ReAGi+XhwfqAgkqoweGQ/IU=
X-Google-Smtp-Source: AGHT+IG9j9Sef0jOnx8+q/I355j3Y4eMK2YOk23TwjYRGbGkKvFGZVbSAsV7zfzEP2fETYb2QSEplg==
X-Received: by 2002:a05:6512:3da0:b0:500:7c51:4684 with SMTP id
 k32-20020a0565123da000b005007c514684mr24744248lfv.56.1697107194617; 
 Thu, 12 Oct 2023 03:39:54 -0700 (PDT)
Received: from eldfell ([194.136.85.206]) by smtp.gmail.com with ESMTPSA id
 q9-20020a19a409000000b00501b9fc977csm2709857lfc.37.2023.10.12.03.39.53
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 12 Oct 2023 03:39:54 -0700 (PDT)
Date: Thu, 12 Oct 2023 13:39:44 +0300
From: Pekka Paalanen <ppaalanen@gmail.com>
To: Daniel Vetter <daniel@ffwll.ch>
Subject: Re: [PATCH v1] dynamic_debug: add support for logs destination
Message-ID: <20231012133944.69711822@eldfell>
In-Reply-To: <ZSfCMBXOOi9Luc6F@phenom.ffwll.local>
References: <20231003155810.6df9de16@gandalf.local.home>
 <CAJfuBxyJyFbFEhRxrtxJ_RazaTODV6Gg64b1aiNEzt6_iE4=Og@mail.gmail.com>
 <CAK8ByeLNc9UbTNG4x=40AxYqjjRCsvBNtNFai0PMveM2X4XCow@mail.gmail.com>
 <CAJfuBxyRF4q_T8LmHwR=-PKKDDpiFg2nO03uLnL8aGpRyBByKw@mail.gmail.com>
 <CAK8ByeLpkSV6o6gPw8eJVqq5+ynQrSDjemY7mXkO1ZmA0rYKfQ@mail.gmail.com>
 <CAJfuBxw+ANLwssAGWpkn5PeJb8ZKn4LXQkk2Gfv3aGsSN=S55Q@mail.gmail.com>
 <CAJfuBxy9qn-4i3SteTL1LBbBxPrFM52KkBd=1UhcKV3S_KdQvw@mail.gmail.com>
 <20231011114816.19d79f43@eldfell>
 <ZSZuACLwt5_XAL2n@phenom.ffwll.local>
 <20231012115548.292fa0bb@eldfell>
 <ZSfCMBXOOi9Luc6F@phenom.ffwll.local>
X-Mailer: Claws Mail 4.1.1 (GTK 3.24.37; x86_64-pc-linux-gnu)
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/V8y/wlfhGWh8m+OH4pSW+7u";
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
Cc: =?UTF-8?B?xYF1a2Fzeg==?= Bartosik <lb@semihalf.com>,
 linux-kernel@vger.kernel.org, Steven Rostedt <rostedt@goodmis.org>,
 "wayland-devel@lists.freedesktop.org" <wayland-devel@lists.freedesktop.org>,
 Sean Paul <seanpaul@chromium.org>, dri-devel <dri-devel@lists.freedesktop.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

--Sig_/V8y/wlfhGWh8m+OH4pSW+7u
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

On Thu, 12 Oct 2023 11:53:52 +0200
Daniel Vetter <daniel@ffwll.ch> wrote:

> On Thu, Oct 12, 2023 at 11:55:48AM +0300, Pekka Paalanen wrote:
> > On Wed, 11 Oct 2023 11:42:24 +0200
> > Daniel Vetter <daniel@ffwll.ch> wrote:
> >  =20
> > > On Wed, Oct 11, 2023 at 11:48:16AM +0300, Pekka Paalanen wrote: =20

...

> > > > - all selections tailored separately for each userspace subscriber
> > > > (- per open device file description selection of messages)   =20
> > >=20
> > > Again this feels like a userspace problem. Sessions could register wh=
at
> > > kind of info they need for their session, and something like journald=
 can
> > > figure out how to record it all. =20
> >=20
> > Only if the kernel actually attaches all the required information to
> > the debug messages *in machine readable form* so that userspace
> > actually can do the filtering. And that makes *that* information UABI.
> > Maybe that's fine? I wouldn't know. =20
>=20
> Well if you configure the filters to go into separate ringbuffers for each
> session (or whatever you want to split) it also becomes uapi.

It's a different UAPI: filter configuration vs. message structure. I
don't mind which it is, I just suspect one is easier to maintain and
extend than the other.

> Also I'd say that for the first cut just getting the logs out on demand
> should be good enough, multi-gpu (or multi-compositor) systems are a step
> further. We can figure those out when we get there.

This reminds me of what you recently said in IRC about a very different
topic:

	<sima> swick[m], tell this past me roughly 10 years ago, would
	have been easy to add into the design back when there was no
	driver code yet=20

I just want to mention today everything I can see as useful. It's up to
the people doing the actual work to decide what they include and how.


Thanks,
pq

--Sig_/V8y/wlfhGWh8m+OH4pSW+7u
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEEJQjwWQChkWOYOIONI1/ltBGqqqcFAmUnzPAACgkQI1/ltBGq
qqcgOBAAkNg/qe5usX57owmljxA5OMxQ9zGY9LO58+UbrVSeYOQgr087FZpIf2LJ
0AKOGqgH9aa6jVPTncN8i3DdfB3wKdrYO0VUDLg2jkzXq57FsD2XUL1OdxirtI9r
WPAYEkzQLwaoI6Dc/VfTWgcHpQ9i5Z0pVqJZ5SMn0s6HDKoLxLOWNq75NPNV6eLG
6LBWICQPT0WoocsF1G747/RsdmDxHihv3zs9+YnrZU7AYrok+VxIcw+ze81guWpt
XtqHP7Lfngu8qDmQFuG2U6JG75R4oKc+Nzmvoyr8n0bE66EkUeA/Lw+dEJvr5KB5
wvPQP4kHdPblnATAak5EencXSPm4vsmWpJymr24zy6FYJmM20hR1H6x0TTgv8eux
CWC02+vgweXnIVktJuwQHHoWVe0i+CPdcPQx+etAodicoHMr8JVcrfLgijFkLyME
Qg865bepY2hxJuVIqPkW2OFfzdludfUlPE8QaVM56sakfzB3rXcmwmsIBaPiuJ5P
9Vdxtl03SuoHbPj09jYOXf/ldizPjVG2U8McQ/tQBRnJzUCBGnWETGsZa1SP5mXs
Nzj2XvD+LdjsBOVLVxZyYaSRjnRJ/+WF1J7BfqqPww6g8p5ZxZuGQ8gds0TE9Pyj
7ITB9OLv9f7SN1eN/Pg8qCNlOFwf9cC8h3g/O0Em39+JWZ8HDBw=
=fzw5
-----END PGP SIGNATURE-----

--Sig_/V8y/wlfhGWh8m+OH4pSW+7u--
