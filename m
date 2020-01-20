Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id C102C14264D
	for <lists+dri-devel@lfdr.de>; Mon, 20 Jan 2020 09:58:30 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 00F786E858;
	Mon, 20 Jan 2020 08:58:26 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lj1-x241.google.com (mail-lj1-x241.google.com
 [IPv6:2a00:1450:4864:20::241])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B737D6E858;
 Mon, 20 Jan 2020 08:58:24 +0000 (UTC)
Received: by mail-lj1-x241.google.com with SMTP id j1so32941676lja.2;
 Mon, 20 Jan 2020 00:58:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=date:from:to:cc:subject:message-id:in-reply-to:references
 :mime-version; bh=Grea5Yl/X9sWRi3YTti/t+syG/I/moaJKqvJGBORKd4=;
 b=oho2bAZhhu9bDPgjqZ/4Q9P8w762RJsTPvGFkkTDDeRG/4NyhOI6N9CA1pJGTLhTBZ
 zNvZDSO4pahXD+Tcb/utc73ScY/Td5TGE5GdKhMFN0fWnSItTUhYQP4ef/pzScENC4kT
 EyyiqoN54f/n8OLWinvW5uftNzCntzYQPkAB2QBgx2ScbD3OJC1xBFNYEjxZhFeGC+J/
 LcDTN7THf7f9frmf3mEGpyMfA1M7S1GmubsBxZOwUplQhpgE3ws0BA4gLxsf/3JNu5RK
 m0Poa/9QH0pRddk1fWFYBVlLUoZ8yq9fzx0B5lZmvXeODhK1rn2e/HvCLE1oS6LzuETZ
 +SpQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:in-reply-to
 :references:mime-version;
 bh=Grea5Yl/X9sWRi3YTti/t+syG/I/moaJKqvJGBORKd4=;
 b=n4gnQZLjYqmqfhbQbpcV12GdzvvMyOB4wMtLdzQ5TFXY05SlFvomQNidYTPV3E70Lr
 sj9WLsUaukGbU0l3zWVsoUoR9F2WoH2ixJLx4wj765p1kt46VEl1zQsLWHBKCtbaq82e
 ZoHf+KQQFjRxKaoAONgfoRKT4JQn2ii/Fdq3wdlMr6S8o8xqdOcxfRow8CKEohO0bjnH
 /A/giM7qFBluAauap46sDFaN8T5RS1K8UpWTw4w0FCyIG30rZDZTyu9ssdVdYKd6xhro
 g+6TyVl+RxdTqY5ygeoQxwV1hfM1szEFbhnJ4cP71N0c2kB3aMyXxBlJXrhRvJ3Q/UU2
 hlAQ==
X-Gm-Message-State: APjAAAXuyp2Vf143O4h9bWeQ9rL9l1UE7brZZQ7JmjCTeZyH7C9sfbpU
 q4ZHKqPv/G1nzgxZT20lT24=
X-Google-Smtp-Source: APXvYqzz6Y+vQaI9agar1LBDQvgP4W5uI9PCdGlxvIv+gRJRx5tYIVQ4PU8bfiuUjUnTywhasUsWQQ==
X-Received: by 2002:a2e:b0f5:: with SMTP id h21mr13498459ljl.9.1579510703079; 
 Mon, 20 Jan 2020 00:58:23 -0800 (PST)
Received: from eldfell.localdomain ([194.136.85.206])
 by smtp.gmail.com with ESMTPSA id i1sm16361806lji.71.2020.01.20.00.58.21
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 20 Jan 2020 00:58:22 -0800 (PST)
Date: Mon, 20 Jan 2020 10:58:12 +0200
From: Pekka Paalanen <ppaalanen@gmail.com>
To: Matt Hoosier <matt.hoosier@gmail.com>
Subject: Re: backend-drm and scanning really large resolutions
Message-ID: <20200120105812.20c56b65@eldfell.localdomain>
In-Reply-To: <CAJgxT3-cJu54Rn-9CstjaRHHtaJB_WK+R0RzKsDoK4TttDNFOg@mail.gmail.com>
References: <CAJgxT3-cJu54Rn-9CstjaRHHtaJB_WK+R0RzKsDoK4TttDNFOg@mail.gmail.com>
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
Content-Type: multipart/mixed; boundary="===============0465298333=="
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

--===============0465298333==
Content-Type: multipart/signed; micalg=pgp-sha256;
 boundary="Sig_/4+U7XCeGFs5UsMy4qM+zkaG"; protocol="application/pgp-signature"

--Sig_/4+U7XCeGFs5UsMy4qM+zkaG
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

On Fri, 17 Jan 2020 10:51:45 -0600
Matt Hoosier <matt.hoosier@gmail.com> wrote:

> Hi all,
>=20
> I'm confronting a situation where the hardware with which I work is capab=
le
> of driving connectors at 4K or 8K, but doing so requires bonding the
> scanning of multiple planes together.
>=20
> The scenario is that you'd have a big primary framebuffer whose size is t=
oo
> large for an individual hardware scanning pipeline on the display
> controller to traverse within its maximum allowed clock rate.
>=20
> The hardware supplier's approach is to assign multiple planes, which in t=
he
> KMS driver map to hardware scanning pipelines, to each be responsible for
> scanning a smaller section of the framebuffer. The planes are all assigned
> to the same CRTC, and in concert with each other they cover the whole area
> of the framebuffer and CRTC.
>=20
> This sounds a little bit wild to me. I hadn't been aware it's even legal =
to
> have more than one plane treated a the source of scanout for a single
> framebuffer. Maybe that distinction isn't really relevant nowadays with
> universal plane support.
>=20
> I'm wondering if anybody here knows whether this a legit approach for a
> compositor's DRM backend to take?

Hi,

I was aware of tiled monitors that need two connectors driven by two
CRTCs to cover the whole display, but that sounds new to me.
Libweston/DRM still doesn't support tiled monitors.

What a compositor's DRM-backend can or should do must be generic. It
cannot be driver or hardware dependent, so handling your case specially
in userspace would need KMS UAPI to communicate the need in the first
place. (There is no shared library for "KMS userspace drivers", yet at
least.)

I am not aware of any KMS UAPI that would indicate the need to use two
primary planes in a specific configuration for a specific video mode.
I'm saying two primary planes, because that is the only way I can see
this situation even hinted at userspace with the current UAPI. I also
don't know if multiple primary planes is allowed, but it certainly is
not expected by userspace, so userspace can't make use of it as is.

The idea that comes to my mind is to hide all the details in the
driver. Expose just one primary plane as usual, and if the video mode
and FB actually need two scanout units, then steal one under the hood
in the driver. If that makes another KMS plane (exposed to userspace)
unusable, that is fine. Userspace with atomic modesetting needs to be
checking with TEST_ONLY to see if a configuration is possible, and will
fall back to something else.

For legacy modesetting I guess you would need to pick between
supporting the really large video modes vs. exposing all planes. But
that's a no-brainer, since the legacy API for planes is practically
unusable. Then again, I don't know if the kernel DRM core allows you to
make such distinction.

Btw. AFAIK there is nothing wrong with using the exact same FB on
multiple planes simultaneously.


Thanks,
pq

--Sig_/4+U7XCeGFs5UsMy4qM+zkaG
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEEJQjwWQChkWOYOIONI1/ltBGqqqcFAl4la6QACgkQI1/ltBGq
qqcS0w//RRpH+O6OOjNk2HO+A7ZndOH2hzviBZ1H8HEMzPMpeGQd9vz8/VsCEWlA
u01z4aSdD1jSJidOuCAVRgeSg0nli3hoAdPrXWcAyJL+SRKT8D3wwkNUXraM05rT
kMhOVWV212cIrM2k9dka8cW+exXgv2J+4EgxMZtU6zydAny6extsNiJaIJIJFx2p
jBtn0t8gPwUAfQuRy/t6QMEOEq6BWC4d58OFfDE0EAAAxWuFwSS8xrpsPcH0Jgvi
k2h6f7N/NOBqjAw10uyU2HUmzhXLeEPkX7FRy4QTBPA6XX0YfXPAXOTtBhDVtxyR
d/bUmWLYqrMxb2rLxbi1rE8SZdltC3n/nKTylzDKHUhhLEoD47gZk2YhqMnCJPG+
zzW0GxvpZF8EYD97VkzaR+CBj53EXopUYT1cIw5hc/YBOuARmy5mXW6oTRWtoYlU
+BP6y3R8C7XMwMS0pFbMkGZm3bASdhpx6TeUb+3TyQUzkkmYS6UjYpm0dtyAZpBQ
dnjUFIYqzHa+4FfTWaapxR5wKAQfYjr28kqZp4SpWtuvfvMrPoMyvwYMyFMhMLUD
HWJ+DbMt784hcFL+RLrQsmFXArfEPyqWQXQ3Ur/eNkBt3oZ31uTOnLYibHgfFC5K
B7+/UbXoWcUf6lXDhS65jLSYgbRue01CA953PK82YC5g9y/I3A0=
=2dtc
-----END PGP SIGNATURE-----

--Sig_/4+U7XCeGFs5UsMy4qM+zkaG--

--===============0465298333==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel

--===============0465298333==--
