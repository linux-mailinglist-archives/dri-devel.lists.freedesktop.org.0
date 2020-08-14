Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E76E3244C03
	for <lists+dri-devel@lfdr.de>; Fri, 14 Aug 2020 17:24:43 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7A9DB6EB79;
	Fri, 14 Aug 2020 15:24:39 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-x32c.google.com (mail-wm1-x32c.google.com
 [IPv6:2a00:1450:4864:20::32c])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D85176EB79
 for <dri-devel@lists.freedesktop.org>; Fri, 14 Aug 2020 15:24:38 +0000 (UTC)
Received: by mail-wm1-x32c.google.com with SMTP id x5so7786147wmi.2
 for <dri-devel@lists.freedesktop.org>; Fri, 14 Aug 2020 08:24:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to:user-agent;
 bh=Ci6C8eDRDad+nm5gdVGEi1ez3dc29dYSX/32U3Yl/u8=;
 b=IxvF7/4EIDGY6IhlZompznDAigjjAR7hmdNImwVs5pUwOCtU1gVuYHWSKyX33v7aGy
 UfiJWzBtgmC2u8a55YFoU5712cD5MuMQeXLeotvqoRpDpLjQLr3fWgqkTiN2HETMlJiS
 5gRQ7oLOFI6pE+wXoaUlY2O14eo1/gE5q5V0B9S7iukv+UWiDgbwlWPbrRbWO9YyqtpC
 F0FvExGyj567mkXLudFePl+m0HL5EdwJSr/HGw33fwfYeRQZpGMbNr/f2OT6R0jTy22y
 8v60u/Ib7T6fO+0jXXV5GdczVFNm9slZIG4qFZrchwl/mm5uTV4/H5MufnNsRj4r6Y/h
 6HIg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=Ci6C8eDRDad+nm5gdVGEi1ez3dc29dYSX/32U3Yl/u8=;
 b=hT/v1P20ackspCYUaByfoZo2LRat9yg1l7kOkqxfWDCRHAkm88LFVxTmSlG4inj1T+
 HhsWE8xHZXxihuCp4MN5vqNej942XGVkv73QqG5NIqo+MNppE2FtJFtGcELk9jSgv6bP
 VBVr1cV0ed35wUVva5BBa6l1Z4Y/GkZWZCZJmLFgndvQByk1XI8IN4WVlkpnJVwUyYuC
 CN3H+G8dF82dvSkHu5PSmXIJJjTWt1EcW/zktqm1ZGjHKHs1YCF4Co+TekcxxV76QuPx
 7PuRtuubebpXieTp9c8HeoxMRtSyiuZLAKj6KI/h+ai+6IKSbmoWwMdNrm206+aCVB+v
 DmMg==
X-Gm-Message-State: AOAM530wgDeoL5FCyvqONyb6BqUVcqofG5EOGhulh6tJ0p7Rg9gbufz6
 Csy8bRvmucHrbY6lLv9Y6v+C3xNpFEQ=
X-Google-Smtp-Source: ABdhPJw9CbrXHYfryPC6VngeLyg2yS3ZDREtmytWizt8yYEUO23muMopP7RoeadBS2cP21H2YGJKHA==
X-Received: by 2002:a1c:6557:: with SMTP id z84mr2924900wmb.19.1597418676461; 
 Fri, 14 Aug 2020 08:24:36 -0700 (PDT)
Received: from localhost
 (p200300e41f10ca00f451c56750ebc625.dip0.t-ipconnect.de.
 [2003:e4:1f10:ca00:f451:c567:50eb:c625])
 by smtp.gmail.com with ESMTPSA id k10sm16779834wrm.74.2020.08.14.08.24.34
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 14 Aug 2020 08:24:34 -0700 (PDT)
Date: Fri, 14 Aug 2020 17:24:33 +0200
From: Thierry Reding <thierry.reding@gmail.com>
To: Karol Herbst <kherbst@redhat.com>
Subject: Re: [git pull] drm for 5.8-rc1
Message-ID: <20200814152433.GG556087@ulmo>
References: <0e882aa7-d0ea-19b0-a13d-4f7bc0d384aa@nvidia.com>
 <CACO55ttP_J8riS_PhCG+-Br+AvsYKRTLg_+wn2pXF9kgXkmjeQ@mail.gmail.com>
 <785eb70c-d9e7-dbdf-b044-337618fcea1a@nvidia.com>
 <20200812174005.GA1705@kevin>
 <2c5cf2e8-afd2-446d-1f27-2c225c65d447@nvidia.com>
 <CACO55tto89kT-_QKGjQ50Ht8U-4Dop6sTjNsbr1qHXhgNuDHEA@mail.gmail.com>
 <CACO55tu1RWZ0ZGcMcrU-snT3CkJtwxawwJ9990-5a+hpByh-Hw@mail.gmail.com>
 <CACO55tsfV9pGijOF5F=dLqFhpXgPSArGHXa44Mt3eRBk7z-X=g@mail.gmail.com>
 <20200814140811.GE556087@ulmo>
 <CACO55tvz1_cp=qrF9M8RtyifLJ3N-ZdLM5O6wR=hy2o5TvSRpg@mail.gmail.com>
MIME-Version: 1.0
In-Reply-To: <CACO55tvz1_cp=qrF9M8RtyifLJ3N-ZdLM5O6wR=hy2o5TvSRpg@mail.gmail.com>
User-Agent: Mutt/1.14.6 (2020-07-11)
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
Cc: James Jones <jajones@nvidia.com>, Thierry Reding <treding@nvidia.com>,
 Alyssa Rosenzweig <alyssa.rosenzweig@collabora.com>,
 dri-devel <dri-devel@lists.freedesktop.org>
Content-Type: multipart/mixed; boundary="===============0807368846=="
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


--===============0807368846==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="XaUbO9McV5wPQijU"
Content-Disposition: inline


--XaUbO9McV5wPQijU
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, Aug 14, 2020 at 04:45:39PM +0200, Karol Herbst wrote:
> On Fri, Aug 14, 2020 at 4:08 PM Thierry Reding <thierry.reding@gmail.com>=
 wrote:
> >
> > On Thu, Aug 13, 2020 at 05:39:39PM +0200, Karol Herbst wrote:
> > > btw, I just noticed that wayland with gnome-shell is totally busted.
> > > With this MR it at least displays something, but without it doesn't
> > > work at all.
> >
> > Interesting, one of my typical test cases is to run Weston with a couple
> > of test programs (like weston-simple-egl). Those usually work. I'll go
> > run a few more tests to see where we are.
> >
> > To clarify, is this gnome-shell/wayland issue happening with Mesa's
> > mainline, or with James' patches already applied?
> >
>=20
> mainline. It does work for me on weston, but that's because weston is
> always modifier aware afaik. For gnome-shell/wayland we have to enable
> it to make it work.

For some reason I can't get my mouse to work in Weston and it seems like
that's the only way to start a terminal... But sounds like that wouldn't
be any good anyway since it's different from that use-case. Apart from
building gnome-shell, which I recall has a large number of dependencies,
are you aware of another use-case that would allow testing the code
paths with no modifiers?

Sounds like perhaps that would be interesting to add to Weston as a knob
to test these somewhat legacy paths.

Thierry

--XaUbO9McV5wPQijU
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEEiOrDCAFJzPfAjcif3SOs138+s6EFAl82rK8ACgkQ3SOs138+
s6GnxQ//TwJDOUcwFcbZFYy9B5bU+f0TrSYuRcrecTrNrJuDsnf3DJyIcujPlqA9
jIdNNAPk/qKQDiNRj61cWBdy39ryy9kTvLzKSWiZ6DCXBrQIWS6fTWl6Mk79hpW6
MGA/CRNT7ToFZokG+ydO19QGvJ2Jts1DEp7QqO7dbrcEGE7fVwVWLOIpi16jrizt
9LulDbi695CwnsMKO3fDBdFoguQYjKTtF5ywhAxAyzuS06Xwde1xSYZOKdhEsS7u
nNlG7jdnNCj4jMjw2p9Kq6fWzz3dB9FBI6K1A6dTpcnxDG2NvnnBEu2wNo+uMj5u
+eux5wRAZBA2p9NlFBUD3huRCplxEzU+WZgJjOuINJDpMqrDxE94ctbOtumupcEb
FGJMXifINQZkD9j6hCR09NZwnPMWgOrR5r8P1nrgypM8ZjSxA0ZXiBw50PyEt56e
0AZSNWu0kFftzT78AACysK6nQKuZUma65ghGjamFvxui6nPy9SlMvRDw8Pq4Dcmv
OhPliCdAp8QoriVdkVFrbeTmNdSbLghQMo1pWT+OCV4DBdcRv3Knih3Ub63mD44I
0II0EQu89lVNfczVRCTu7obnrjLo2Pf2+NrQ+XKYaS2bleyIjsMxONDS35cHT+Ab
gqDuk56dJMzmPy+S36QxxuLd7VoCoVnga/rgWEAFdTkXsCXW8Wc=
=8hu1
-----END PGP SIGNATURE-----

--XaUbO9McV5wPQijU--

--===============0807368846==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel

--===============0807368846==--
