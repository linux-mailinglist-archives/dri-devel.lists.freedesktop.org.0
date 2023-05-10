Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id E9F946FD9E5
	for <lists+dri-devel@lfdr.de>; Wed, 10 May 2023 10:49:06 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EE86110E465;
	Wed, 10 May 2023 08:49:02 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lj1-x22c.google.com (mail-lj1-x22c.google.com
 [IPv6:2a00:1450:4864:20::22c])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4D85A10E475;
 Wed, 10 May 2023 08:49:01 +0000 (UTC)
Received: by mail-lj1-x22c.google.com with SMTP id
 38308e7fff4ca-2ad1ba5dff7so48395071fa.3; 
 Wed, 10 May 2023 01:49:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20221208; t=1683708539; x=1686300539;
 h=mime-version:references:in-reply-to:message-id:subject:cc:to:from
 :date:from:to:cc:subject:date:message-id:reply-to;
 bh=fxMz9fznNiYdXh9OFNZwr9O6+PGQB1genL/wDM5X9no=;
 b=G5RKP0K0+RbOWShApMRxi/d3Vmqobr286uizFOEgyf9vdfgKlqHQ4qQDi24mLviDZz
 rs7dUAXELG10+LtBlIUbzymrTqVZWJLLWnBUaSBSh8Kr0Ht8BdVC2Q2z8dTjELZxK3a5
 DMN3eHcfTDOzLSOowCj9Ggi73QD+c9X/7MazUHjVjoAXidWQ0v+cZses0FUvOv+E5cZp
 L3/qacQ1bhRGbsewYbkD994e2+efbn+V2WDjLfQHbiUmpt2odx6Q8m0UNt+Z0FNR41Tm
 65ZtiXKxshraBSaXSfZKmEOF7asji6irWsE6hMH9IL/pAyHbAVWwhMUV3EecgHcp5k2R
 YFtg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1683708539; x=1686300539;
 h=mime-version:references:in-reply-to:message-id:subject:cc:to:from
 :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=fxMz9fznNiYdXh9OFNZwr9O6+PGQB1genL/wDM5X9no=;
 b=ctfPQXatZfyXjbUz3o9Yxj/AVenOQtMsavqZ8YbkN/8zJwMyiuR8dTMQYNxSK4URjM
 nkpc2G2AfBe4lmzKvUR8WiC/hxDffrFSsnp8btki9KRng6WmIjMOgAmORWvLcnfATLIY
 9Sv9vzoITBpO0X1RfISGrBmoHKvZN25h3z0ANpPJ4iXrIWsGZigHWY3uHb0pVK2fdc7/
 RVih2zW15mvSF1QHMpHGe1LVxKQILYke+3bVPejzCRU1uybgLfKHeNa/c59SE/mKw6zl
 oSJgxlgL4bHAYhuv4hS9/z6q1vatIFftZ35fmcONRYOf5EJ7xbPRNo22TRSjTVQJYDGx
 5Ffw==
X-Gm-Message-State: AC+VfDyBY4uYrdlye6dFcwzVbAdP5zqOzjCEPA5gAEeGK/+mNG3zlsK9
 HrOlQr+ObOa1DIbBfcHLCMc=
X-Google-Smtp-Source: ACHHUZ7819zAB4c0jhwBwMrmvStLpkhu00YWBLkh04WElx00hk/irlzOrAtdlxggnPz/btUq6Wcpyg==
X-Received: by 2002:ac2:51b9:0:b0:4ec:8d71:e997 with SMTP id
 f25-20020ac251b9000000b004ec8d71e997mr1268017lfk.19.1683708538573; 
 Wed, 10 May 2023 01:48:58 -0700 (PDT)
Received: from eldfell ([194.136.85.206]) by smtp.gmail.com with ESMTPSA id
 q19-20020ac24a73000000b004eff6dd9072sm655954lfp.111.2023.05.10.01.48.57
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 10 May 2023 01:48:58 -0700 (PDT)
Date: Wed, 10 May 2023 11:48:45 +0300
From: Pekka Paalanen <ppaalanen@gmail.com>
To: Simon Ser <contact@emersion.fr>
Subject: Re: [RFC] Plane color pipeline KMS uAPI
Message-ID: <20230510114845.669a2e13@eldfell>
In-Reply-To: <QL28tg_ZcXPQ1W5l8Hp3rDlvyKuMh09kjGHpj1GRKVrMqlB-hNI2F6FzRSP-NyfkMpk6tsO55t8UYF6Uk9b7IF1O1BHH1WKc88kNTgY2Ugk=@emersion.fr>
References: <QMers3awXvNCQlyhWdTtsPwkp5ie9bze_hD5nAccFW7a_RXlWjYB7MoUW_8CKLT2bSQwIXVi5H6VULYIxCdgvryZoAoJnC5lZgyK1QWn488=@emersion.fr>
 <CAPM=9tz54Jc1HSjdh5A7iG4X8Gvgg46qu7Ezvgnmj4N6gbY+Kw@mail.gmail.com>
 <CA+hFU4x++RDOxkc-_ZvDtQs3DtupwDV0KJyD3YAgrdh4daLotA@mail.gmail.com>
 <CAPM=9twjPr9fiJwbyNS9j=mCKmLhxbTjB5Vzq9F+Du8sdHac-A@mail.gmail.com>
 <e903d920-788f-7d70-c6f0-1faaac3c9843@amd.com>
 <CAPM=9tyOFhE0zC8540KBOkDaZE1c3zTtke_vX=DEkMTmo04A4Q@mail.gmail.com>
 <QL28tg_ZcXPQ1W5l8Hp3rDlvyKuMh09kjGHpj1GRKVrMqlB-hNI2F6FzRSP-NyfkMpk6tsO55t8UYF6Uk9b7IF1O1BHH1WKc88kNTgY2Ugk=@emersion.fr>
X-Mailer: Claws Mail 4.1.1 (GTK 3.24.24; x86_64-pc-linux-gnu)
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/FStccC9b3yktNWISa=rOaNi";
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
Cc: Sebastian Wick <sebastian.wick@redhat.com>,
 "xaver.hugl@gmail.com" <xaver.hugl@gmail.com>,
 DRI Development <dri-devel@lists.freedesktop.org>,
 wayland-devel <wayland-devel@lists.freedesktop.org>,
 Melissa Wen <mwen@igalia.com>, Jonas =?UTF-8?B?w4VkYWhs?= <jadahl@redhat.com>,
 Uma Shankar <uma.shankar@intel.com>,
 Victoria Brekenfeld <victoria@system76.com>,
 Michel =?UTF-8?B?RMOkbnplcg==?= <mdaenzer@redhat.com>,
 Aleix Pol <aleixpol@kde.org>, Joshua Ashton <joshua@froggi.es>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

--Sig_/FStccC9b3yktNWISa=rOaNi
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

On Tue, 09 May 2023 20:22:30 +0000
Simon Ser <contact@emersion.fr> wrote:

> On Tuesday, May 9th, 2023 at 21:53, Dave Airlie <airlied@gmail.com> wrote:
>=20
> > There are also other vendor side effects to having this in userspace.
> >=20
> > Will the library have a loader?
> > Will it allow proprietary plugins?
> > Will it allow proprietary reimplementations?
> > What will happen when a vendor wants distros to ship their
> > proprietary fork of said library?
> >=20
> > How would NVIDIA integrate this with their proprietary stack? =20
>=20
> Since all color operations exposed by KMS are standard, the library
> would just be a simple one: no loader, no plugin, no proprietary pieces,
> etc.

Hi,

that's certainly the long term goal, and *if* Linux software can in any
way guide hardware design, then I believe it is an achievable goal. I
understand "standard" as something that is widely implemented in
various hardware rather than only "well-defined and documented and
free to implement in any hardware if its vendor cared".

However, like I mentioned in my other reply to Steven, I expect there
will be a time period when each hardware has custom processing blocks
no other hardware (same or different vendor) has. I might not call them
outright proprietary though, because in order have them exposed via
UAPI, the mathematical model of the processing block must be documented
with its UAPI. This means there cannot be secrets on what the hardware
does, which means there cannot be a requirement for secret sauce in
userspace either.

I wonder if we can also require new COLOROP elements to be freely
implementable by anyone anywhere in any way one wants? Or do kernel
maintainers just need to NAK proposals for elements that might not be
that free?

Anything that is driver-chosen or automatic can also be proprietary,
because today's KMS UAPI rules do not require documenting how automatic
features work, e.g. the existing YUV-to-RGB conversion. Hardware could
have whatever wild skin tone improvement algorithms hidden in there for
example. In this new proposal, there cannot be undocumented behaviour.

Dave, if we went with a descriptive UAPI model, everything behind it
could be proprietary and secret. That's not open in the least.

On Wed, 10 May 2023 at 00:31, Harry Wentland <harry.wentland@amd.com> wrote:
>
> I am debating whether we need to be serious about a userspace library
> (or maybe a user-mode driver) to provide an abstraction from the
> descriptive to the prescriptive model. HW vendors need a way to provide
> timely support for new HW generations without requiring updates to a
> large number of compositors. =20

Drivers can always map old COLOROP elements to new style hardware
blocks if they can achieve the same mathematical operation up to
whatever precision was promised before. I think that should be the main
form of supporting hardware evolution. Then also add new alternative
COLOROP elements that can better utilize the hardware block.

Naturally that means that COLOROP elements must be designed to be
somewhat generic to have a reasonable life time. They cannot be
extremely tightly married to the hardware implementation that might
cease to exist in the very next hardware revision.

Let's say some vendor has a hardware block that does a series of
operations in an optimized fashion, perhaps with hardwired constants.
This is exposed as a custom COLOROP element. The next hardware revision
no longer has this block, but it has a bunch of new blocks that can
produce the exact same result. The driver for this hardware can expose
two different pipelines: one using the old COLOROP element, and another
using a bunch of other COLOROP elements which exposes the new
flexibility of the hardware design better. If userspace chooses the
former pipeline, the driver just programs the bunch of blocks to behave
accordingly. Hopefully the other COLOROP elements will be more standard
than the old element.

Over time, I hope this causes an evolution where hardware implements
only the most standard COLOROP elements, and special-case compound
elements will eventually fall out of use over the decades.


Thanks,
pq

--Sig_/FStccC9b3yktNWISa=rOaNi
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEEJQjwWQChkWOYOIONI1/ltBGqqqcFAmRbWm0ACgkQI1/ltBGq
qqdguQ//ZUsB2jj/pn5IceDU6n7vDTAuK8p2PSmE+BCzLiVSgO884z9I92qjbYuz
+te7ovnNqNWe9j9hFqHAk5drGU/lBl5Gm0dx+traJCuzrxwNJairQirgn7rScjNL
dckJqCQHh33zCmwpBhotwKzmjkHsjjdQwFE5D/WqJ3A2srsF/tkgQRaPuKmg+43g
jBLer2ePL+ktDXPu4pdtjFk4oOJCKRSIbNgW6BP4VMJswOd0UEp/HBj8c2LE8cDK
zg5cb+HIisyvTpYiaW9K6Px8QCmoiPC6AMxxD1Ml8yLyTIHmUYAO/OnPfqLFZliS
N/aexCuvYB+IevODjt/9n/6DmWIY9xaw7y3YZ/PyC0DrsCrZ/iSfVWcslPxwtBzV
zSBXak9fp0rFbwZm3idLebVohz7+mmmiHwaS9NJVMxTrvD9ZjAXGVHKnSCxRfth6
aaQmL8SioY0GQaEntsHAdYkctgU0qOhmjByPBnmWbdU5EGoq//6Bu4VnCT++x7j1
hmfFLNJXjyFlsikjxvwZ4tGC6k1FXVtUswWeGCYLWYNxGKByiY6HCu3dv6WwgW/W
DCpfHiMS5HtnDHkLU27S1QAsEaPoCMdvLqLIIfFngWLvZOiJQ/S/tmDOqa7Tg0fg
bOk1gO6LG98p2mi3yERtPBLgTytYndO0t9+q3R5J9ZN7sSIHwho=
=/cV8
-----END PGP SIGNATURE-----

--Sig_/FStccC9b3yktNWISa=rOaNi--
