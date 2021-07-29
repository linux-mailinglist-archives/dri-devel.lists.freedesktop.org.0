Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 84EEA3DA1AD
	for <lists+dri-devel@lfdr.de>; Thu, 29 Jul 2021 13:00:42 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A28396E0DF;
	Thu, 29 Jul 2021 11:00:38 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lj1-x229.google.com (mail-lj1-x229.google.com
 [IPv6:2a00:1450:4864:20::229])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 34DDE6E0DF
 for <dri-devel@lists.freedesktop.org>; Thu, 29 Jul 2021 11:00:37 +0000 (UTC)
Received: by mail-lj1-x229.google.com with SMTP id x7so6983141ljn.10
 for <dri-devel@lists.freedesktop.org>; Thu, 29 Jul 2021 04:00:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=date:from:to:cc:subject:message-id:in-reply-to:references
 :mime-version; bh=j6N7G5MRcha3Fj5Bk0os/bPVbYvLiNuDMePdv4Mv6jU=;
 b=KPirDI5m+4uNpkEbctbgBuyocz43s1tPSGc30ZLUQUsZo38yKPJv50JidR3cfAiaKX
 C972dvCYaH368cOsfkpMw4M6i9Ife8L2kO2kNsQyBKoj0hWjJnDXHyERLN39A5l5Sc3g
 LZhTAu1k4ae2EpxrgLp7lwSSUJv82dQDof61EaCC7Oa7z9Ubq9sfPbj5b0S+Ta7BnXbr
 U4oDrWftF2/mB2VtuxLTEtFpmEonKKHahBi0oQH+2kVzNo1rdtRxa6SpiCq10g11SscG
 dBM5p2IXUFzw1TouMkLpaSk1avDbk5Z5Px4wZ7HQ+jVDIE87b+kMz0LTrQglj0XYrB4B
 pQjA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:in-reply-to
 :references:mime-version;
 bh=j6N7G5MRcha3Fj5Bk0os/bPVbYvLiNuDMePdv4Mv6jU=;
 b=TBVT8mZDNb4UmPeRg3QhUjel/nZimgYl5BHblvOUKj6pL4HkxJOVhTceUgf7mYvDsE
 UGTLpbEC3f04wrFJ0vWPSlg6aR+gHVIPKqTQ/4lzGqcIfu78Z7xdtYFrLd4iqVABPqeV
 6Oe2ItDyb2x/vmtPpqThy3ONDZoqS/GXvEEEkHHn23Bex6MKjnPOD/jNls0l3vHFD+V1
 3JtQK8t3m2d7sq/UcDbx1M2qirv0rg6grPh1UgLowN8beypigBnE2njub6FpeGkGLkf3
 dzy3oM73UA436bWUj18J8zw/OI04ydWUZImHqXPl27HkxdPIbWoBHDePEqSh29BAYeet
 uF7Q==
X-Gm-Message-State: AOAM531XcNf1QjcMUQAt89CRdKVzbIEFLgfXQJRKSNlrx+X1eSl74nVw
 P5ohqrMowbsdfjX1MjRaJrk=
X-Google-Smtp-Source: ABdhPJwLz7bJjWzYeAq3Qel86CAVhEJVusnGZC4yM2zfYbw+RWExMrbfcwjdw2/3iJt3keAAM+vAxw==
X-Received: by 2002:a2e:9911:: with SMTP id v17mr2511244lji.392.1627556435355; 
 Thu, 29 Jul 2021 04:00:35 -0700 (PDT)
Received: from eldfell ([194.136.85.206])
 by smtp.gmail.com with ESMTPSA id c6sm269954lfp.196.2021.07.29.04.00.34
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 29 Jul 2021 04:00:34 -0700 (PDT)
Date: Thu, 29 Jul 2021 14:00:24 +0300
From: Pekka Paalanen <ppaalanen@gmail.com>
To: Christian =?UTF-8?B?S8O2bmln?= <ckoenig.leichtzumerken@gmail.com>
Subject: Re: [RFC 0/4] dma-fence: Deadline awareness
Message-ID: <20210729140024.6a635be4@eldfell>
In-Reply-To: <15cf73a8-eda4-3559-561a-a05a14f445d0@gmail.com>
References: <20210726233854.2453899-1-robdclark@gmail.com>
 <28ca4167-4a65-0ccc-36be-5fb017f6f49d@daenzer.net>
 <CAF6AEGuhQ2=DSDaGGVwBz5O+FoZEjpgoVJOcFecpd--a9yDY1w@mail.gmail.com>
 <99984703-c3ca-6aae-5888-5997d7046112@daenzer.net>
 <CAJs_Fx4O4w5djx3-q5zja51-ko_nQ0X2nEk3qoZB_axpBVSrKA@mail.gmail.com>
 <f6d73ec5-85f9-1b18-f2d2-a5f3b7333efa@gmail.com>
 <c9ee242e-542e-e189-a1ec-c1be34d66c93@daenzer.net>
 <04d44873-d8e6-6ae7-f0f9-17bcb484d697@amd.com>
 <9d5f4415-d470-3bc1-7d52-61ba739706ae@daenzer.net>
 <eedfdc75-72f8-9150-584b-c5e9d16db180@amd.com>
 <20210728165700.38c39cf8@eldfell>
 <74e310fa-e544-889f-2389-5abe06f80eb8@amd.com>
 <20210729112358.237651ff@eldfell>
 <3675d530-c9fc-7ec9-e157-b6abeeec7c2a@amd.com>
 <20210729121542.27d9b1cc@eldfell>
 <15cf73a8-eda4-3559-561a-a05a14f445d0@gmail.com>
X-Mailer: Claws Mail 3.17.8 (GTK+ 2.24.33; x86_64-pc-linux-gnu)
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/SgW_5szpi5zzf=zDE.O9N/Y";
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
Cc: Rob Clark <robdclark@chromium.org>, Matthew Brost <matthew.brost@intel.com>,
 Jack Zhang <Jack.Zhang1@amd.com>, Gustavo Padovan <gustavo@padovan.org>,
 Michel =?UTF-8?B?RMOkbnplcg==?= <michel@daenzer.net>,
 open list <linux-kernel@vger.kernel.org>,
 dri-devel <dri-devel@lists.freedesktop.org>,
 "moderated list:DMA BUFFER SHARING
 FRAMEWORK" <linaro-mm-sig@lists.linaro.org>,
 Luben Tuikov <luben.tuikov@amd.com>, Roy Sun <Roy.Sun@amd.com>,
 Alex Deucher <alexander.deucher@amd.com>, Tian Tao <tiantao6@hisilicon.com>,
 Lee Jones <lee.jones@linaro.org>,
 Christian =?UTF-8?B?S8O2bmln?= <christian.koenig@amd.com>,
 "open list:DMA BUFFER SHARING FRAMEWORK" <linux-media@vger.kernel.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

--Sig_/SgW_5szpi5zzf=zDE.O9N/Y
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

On Thu, 29 Jul 2021 12:14:18 +0200
Christian K=C3=B6nig <ckoenig.leichtzumerken@gmail.com> wrote:

> Am 29.07.21 um 11:15 schrieb Pekka Paalanen:
> >
> > If the app happens to be frozen (e.g. some weird bug in fence handling
> > to make it never ready, or maybe it's just bugged itself and never
> > drawing again), then the app is frozen, and all the rest of the desktop
> > continues running normally without a glitch. =20
>=20
> But that is in contradict to what you told me before.
>=20
> See when the window should move but fails to draw it's new content what=20
> happens?
>=20
> Are the other windows which would be affected by the move not drawn as we=
ll?

No, all the other windows will continue behaving normally just like
they always did. It's just that one frozen window there that won't
update; it won't resize, so there is no reason to move that other
window either.

Everything continues as if the frozen window never even sent anything
to the compositor after its last good update.

We have a principle in Wayland: the compositor cannot afford to wait
for clients, the desktop as a whole must remain responsive. So there is
always a backup plan even for cases where the compositor expects the
client to change something. For resizes, in a floating-window manager
it's easy: just let things continue as they are; in a tiling window
manager they may have a timeout after which... whatever is appropriate.

Another example: If a compositor decides to make a window maximized, it
tells the client the new size and state it must have. Until the client
acks that specific state change, the compositor will continue managing
that window as if nothing changed. Given the asynchronous nature of
Wayland, the client might even continue submitting updates
non-maximized for a while, and that will go through as if the
compositor didn't ask for maximized. But at some point the client acks
the window state change, and from that point on if it doesn't behave
like maximized state requires, it will get a protocol error and be
disconnected.


Thanks,
pq

--Sig_/SgW_5szpi5zzf=zDE.O9N/Y
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEEJQjwWQChkWOYOIONI1/ltBGqqqcFAmECikgACgkQI1/ltBGq
qqdSag/8C5fOmZEzDR5htlo5q1ltdK6TzHREtqM2DS7vnN1oSHAyVpBFk3K3r1dL
cYihzRRzkSzKaG2sNTUBoT2LXR9Xu+nrEU5UbRaEPepPXpBgzDMXVb/KZR1XlsNU
XigotpFNhwJ9vAyT6WV0FDa/gLP9hlPDPztcrYafxJCcy/MyJByUEz/RtLWOppV3
BWFjB3SHKwolqP0+R8HwtWeaf5CpUkcrMqfXZBoUO8FNrPnjobsBuwlxOlP+Eihi
8TkwRGcauMDGBQXSBpdIldWcNtf4VLsVNtuFpyRfb9lGMCh2LvKfjCD858sltLaB
g72XS3b9GAXJrXhKxRuURCIfnrvYWXkx+WbBpHP12JuqHLrEK+YFRSHUdIox9K5P
1PE2BhAeybsV9od8RDBDYCwM4eRsKp7Z6DESU/xVH0kGiFWp3r+naa/ahMTNe2p4
5The58A5VQSHuW+MlUxkYfepuX3C707/Y1EB8yBU+V/y4AZPDDGCngB9RemDIeAl
HPBOGfQIfmihVHBPFBfaX2T04BLXKUekjCiwMMKv0DC4+gvzajggVnkXbNntLniC
92qfMWCIAPQS4yu2+9y+ziz8t6DUwVS9fVz7IFWqa/bjrL/btMPHjcj4Fa2cHM6S
ox8gBlsF+XnBxYYbXXgbM8cMA+DPSKVxdeAeByLKegvT/9VyIJA=
=HvfU
-----END PGP SIGNATURE-----

--Sig_/SgW_5szpi5zzf=zDE.O9N/Y--
