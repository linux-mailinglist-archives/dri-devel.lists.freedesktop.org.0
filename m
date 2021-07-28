Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 8D8273D8FDB
	for <lists+dri-devel@lfdr.de>; Wed, 28 Jul 2021 15:57:09 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 34D8E6E061;
	Wed, 28 Jul 2021 13:57:07 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lj1-x235.google.com (mail-lj1-x235.google.com
 [IPv6:2a00:1450:4864:20::235])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 875D16E061
 for <dri-devel@lists.freedesktop.org>; Wed, 28 Jul 2021 13:57:05 +0000 (UTC)
Received: by mail-lj1-x235.google.com with SMTP id x7so3169491ljn.10
 for <dri-devel@lists.freedesktop.org>; Wed, 28 Jul 2021 06:57:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=date:from:to:cc:subject:message-id:in-reply-to:references
 :mime-version; bh=CmKb72PChNszBOXTpOhlC2Z9gbluKznAxmwaxqGh1YY=;
 b=G7G2DULTNw+oWcBqMJgWRUSXrrQbl8/V0TEtdKmAyu/0UlX81IXL1X0G4X0JO5SAfW
 twSNh926fK4VJf5fADPu+wjcjeMqGiukz9eAAs5XO3TGEs+L895b1OMG/SDQhLwkSZdT
 vEZw2YsCv8eY/UeYS5MptQxXVltBsmaYYaH3GJ4FfGWI69S/nMg9bxAuIoCBbCor+/eI
 zDjxLYYzw5K2mCy9//cuiClHheiEQf6jTjcChbrJaM2CsR/TQBTgC8cHbyLYJ7qa5JDi
 CK+9v4VmH1AIyLoZ1HV4HvwGLT8OB9kT3aXPIjf7x+d3hVeVZS3fzJKaITUzGj36Rm/y
 QyBw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:in-reply-to
 :references:mime-version;
 bh=CmKb72PChNszBOXTpOhlC2Z9gbluKznAxmwaxqGh1YY=;
 b=X2FPHmE6Xov+psYCuoCM/qAiSqWRauo4qF5yCtRU1AcquTGb0PcCo+ipfaaeQNNtHA
 sEaAwifzx0zeZ8z4cPQtgQIWz5dWZTsB6iPiZckd4FONBMGvZlyy8FfVEucQjUizhGc6
 3urzZHPosq1eDdbXesjFMTX9V5rQa/Wd8RSdxiR8dXrUJYelPpZMGLqdRiCs/KT4E0u5
 AKAIt42zNMQt+87+J3+yyNGpsCisFqfrzLMYgRhjMdZ69ed3u2Ink51TXo2e1W0Ap0sP
 TeR5A/Gtay0OW0Dvvw4Npq2v6FsyU6p5fE1ynIxeTb8aWn6J+tD0FaS/her0OTWmtKTE
 RqAg==
X-Gm-Message-State: AOAM532jSCYRxdQe5DQg3qT8r8Cn8yQnhJ7Fjd0ONOnzo8dUBiLLHE0a
 8tIQm2Bol/9d81BJpa8ELco=
X-Google-Smtp-Source: ABdhPJzautqHB5Q6fQhaaynf3ycrb+1yDHMfuUiGzZ+EhvO97Jq0C8Rei9oUvj8aunA9cctjfXJxYw==
X-Received: by 2002:a2e:a78b:: with SMTP id c11mr19465601ljf.347.1627480623823; 
 Wed, 28 Jul 2021 06:57:03 -0700 (PDT)
Received: from eldfell ([194.136.85.206])
 by smtp.gmail.com with ESMTPSA id g33sm10198lfv.150.2021.07.28.06.57.02
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 28 Jul 2021 06:57:03 -0700 (PDT)
Date: Wed, 28 Jul 2021 16:57:00 +0300
From: Pekka Paalanen <ppaalanen@gmail.com>
To: Christian =?UTF-8?B?S8O2bmln?= <christian.koenig@amd.com>
Subject: Re: [RFC 0/4] dma-fence: Deadline awareness
Message-ID: <20210728165700.38c39cf8@eldfell>
In-Reply-To: <eedfdc75-72f8-9150-584b-c5e9d16db180@amd.com>
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
X-Mailer: Claws Mail 3.17.8 (GTK+ 2.24.33; x86_64-pc-linux-gnu)
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/0KAbxBfXFJqzhLgHL9cOc+2";
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
 Jack Zhang <Jack.Zhang1@amd.com>,
 Christian =?UTF-8?B?S8O2bmln?= <ckoenig.leichtzumerken@gmail.com>,
 Michel =?UTF-8?B?RMOkbnplcg==?= <michel@daenzer.net>,
 open list <linux-kernel@vger.kernel.org>,
 dri-devel <dri-devel@lists.freedesktop.org>,
 "moderated list:DMA BUFFER SHARING
 FRAMEWORK" <linaro-mm-sig@lists.linaro.org>,
 Luben Tuikov <luben.tuikov@amd.com>, Roy Sun <Roy.Sun@amd.com>,
 Gustavo Padovan <gustavo@padovan.org>,
 Alex Deucher <alexander.deucher@amd.com>, Tian Tao <tiantao6@hisilicon.com>,
 Lee Jones <lee.jones@linaro.org>,
 "open list:DMA BUFFER SHARING FRAMEWORK" <linux-media@vger.kernel.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

--Sig_/0KAbxBfXFJqzhLgHL9cOc+2
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

On Wed, 28 Jul 2021 15:31:41 +0200
Christian K=C3=B6nig <christian.koenig@amd.com> wrote:

> Am 28.07.21 um 15:24 schrieb Michel D=C3=A4nzer:
> > On 2021-07-28 3:13 p.m., Christian K=C3=B6nig wrote: =20
> >> Am 28.07.21 um 15:08 schrieb Michel D=C3=A4nzer: =20
> >>> On 2021-07-28 1:36 p.m., Christian K=C3=B6nig wrote: =20

> >>>> At least AMD hardware is already capable of flipping frames on GPU e=
vents like finishing rendering (or uploading etc).
> >>>>
> >>>> By waiting in userspace on the CPU before send the frame to the hard=
ware you are completely killing of such features.
> >>>>
> >>>> For composing use cases that makes sense, but certainly not for full=
 screen applications as far as I can see. =20
> >>> Even for fullscreen, the current KMS API only allows queuing a single=
 page flip per CRTC, with no way to cancel or otherwise modify it. Therefor=
e, a Wayland compositor has to set a deadline for the next refresh cycle, a=
nd when the deadline passes, it has to select the best buffer available for=
 the fullscreen surface. To make sure the flip will not miss the next refre=
sh cycle, the compositor has to pick an idle buffer. If it picks a non-idle=
 buffer, and the pending rendering does not finish in time for vertical bla=
nk, the flip will be delayed by at least one refresh cycle, which results i=
n visible stuttering.
> >>>
> >>> (Until the deadline passes, the Wayland compositor can't even know if=
 a previously fullscreen surface will still be fullscreen for the next refr=
esh cycle) =20
> >> Well then let's extend the KMS API instead of hacking together workaro=
unds in userspace. =20
> > That's indeed a possible solution for the fullscreen / direct scanout c=
ase.
> >
> > Not for the general compositing case though, since a compositor does no=
t want to composite multiple output frames per display refresh cycle, so it=
 has to make sure the one frame hits the target. =20
>=20
> Yeah, that's true as well.
>=20
> At least as long as nobody invents a mechanism to do this decision on=20
> the GPU instead.

That would mean putting the whole window manager into the GPU.


Thanks,
pq

--Sig_/0KAbxBfXFJqzhLgHL9cOc+2
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEEJQjwWQChkWOYOIONI1/ltBGqqqcFAmEBYiwACgkQI1/ltBGq
qqdTlw//XiANshLNmu+nt+NpwbKtkBMqYDdcTWfhPJe8Ip9HhRA6WWzaVugXYwKU
QgT3BNJiE+0b0fnVvLjdjVlmm3351f6CzG5QcYHDDqckG8p1a2aehkPuUKOAsdyC
JJuZHBLw7nFFIa8t0WV3PHIwAaD+dWRcALMuKFkwBp574dSoCti2hiLHzEUxhgj9
URxYBoHECn5+sFUZJngh2kUSrjhjSmM00NN5yFowA81zzaE7UAWjixC47AT+J7ey
MAqWXNk8ltuM8F4tqavlKttKpdwmyqDBfUvrS10HyHee2VXOrWCQJTbcw2+oZZRt
wAjcDX64bIHgcU72okVfA7A5ROMBQW/GTqFO/MfKp1g9CBbg/5vcSlI6KCSiOWyX
5AtEUPNXDN2BoTtMAGNFcSBBI3QOakJfEuPCCj+vwZdj31Bjeu6lOjTlxQ71cGLv
PzCfm5Uei0mVRMwFcNwYVUgnJvDAx5s9Agodutcod7tsQPEkIfSyJaMuD9L/vTpa
gmPlEnJ+nwcskDcniReF9OXwyAEcTG6M0lyM2qPP6zjHfSwZW1lHkoVGxNdrHd7m
xZ6SuYFAsssJBIRyQl/6mHNnsuD+NjzzhCEGlaIcqe3eehPL0gb+SKEwYKBByp7W
IqQM25v5Ni7oD3fgjkCHCfz6JTNUL2v+JY2ZBHeFWRxROxKMiTE=
=fn1r
-----END PGP SIGNATURE-----

--Sig_/0KAbxBfXFJqzhLgHL9cOc+2--
