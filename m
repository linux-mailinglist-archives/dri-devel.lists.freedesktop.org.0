Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 183C36BE618
	for <lists+dri-devel@lfdr.de>; Fri, 17 Mar 2023 10:59:19 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B8A5D10EEB6;
	Fri, 17 Mar 2023 09:59:16 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-x132.google.com (mail-lf1-x132.google.com
 [IPv6:2a00:1450:4864:20::132])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 272F210EEB6;
 Fri, 17 Mar 2023 09:59:15 +0000 (UTC)
Received: by mail-lf1-x132.google.com with SMTP id g17so5800600lfv.4;
 Fri, 17 Mar 2023 02:59:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20210112; t=1679047153;
 h=mime-version:references:in-reply-to:message-id:subject:cc:to:from
 :date:from:to:cc:subject:date:message-id:reply-to;
 bh=GetE0CPIO0EH0AkPMpbbSlnaxclV0uWSKmcnJYv943A=;
 b=ZZWOhJjIHqhzSL0qXhFVIun4WL2FPoijpgQAvi8wvjx7KyMfzyti9VYxSm9l0+vSU6
 gSWQkukFk2DouvMob4c9tm/gfbF1lpdbgJW46r776B4J8AOVprqMtiDVvxp4K6AfOqdW
 GcgUsb/MqOLCrSEjCuCNeJZyAJEkQ9rbABF9jhJv5qScxrLTMsULlN82De/sA0h11kjk
 QzRToddsLtDtpyL68BMUG8KMNAicyX8BSPg1QbA1LcbXpwdtx//i/1vbekd8KX6ma1IO
 8FNAdG9Hasdom5beiPPd+Hr6XtMtiN1EEjeaHD6+C+TA74gbcmGp8l9fTC0G4v/eaBfJ
 E8Kg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1679047153;
 h=mime-version:references:in-reply-to:message-id:subject:cc:to:from
 :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=GetE0CPIO0EH0AkPMpbbSlnaxclV0uWSKmcnJYv943A=;
 b=iW4YCECtCh80VE1ax+6tO+nT4RxeKGA5DbgEXw52o2Lc3LBQmkMCQEG0F7M7toddz4
 HFTPyRm9X8FnXsMouitD0oEmQ7m0PBbI8rNl2M+Y9G3MoUWKSPsCfEP6rpQcTD5YA44o
 JaNqlrSypJoxxdMhoIWFgR4QMDuBkx5tR6+UTLMp3b2SffGLEtJ+1I3aH3dpO5cQUTiz
 vktlwIJ7jtCztoZ3hgQp2ykWi8HcebSd27E1jvkEDkUROQp154Gfmequ1cWFXY4aY79P
 SZ/fo6Vj8xjWPA4U1/ndtP8Us8rlEZmQ3sQJFHxLMe4Ri8akGbuxYaJ+c4ZXuOvZxlwd
 3RRQ==
X-Gm-Message-State: AO0yUKVjxPwvx+4/DZAWt8aj9scpe9YqaD9SN6MAiCA1pK/lk8eu8Rqv
 r6JP9A+2AW7lSnAw9YzX33k=
X-Google-Smtp-Source: AK7set9RZop77B4urwlU3xmOSywkaR53Mnt6mfkZx0B9jsN1lpPLw7BjM8mMGD2HTKb5Uof18XEVpw==
X-Received: by 2002:a05:6512:931:b0:4e8:4abf:f19d with SMTP id
 f17-20020a056512093100b004e84abff19dmr3891922lft.15.1679047153125; 
 Fri, 17 Mar 2023 02:59:13 -0700 (PDT)
Received: from eldfell ([194.136.85.206]) by smtp.gmail.com with ESMTPSA id
 u22-20020a2ea176000000b00295b9d903b7sm322981ljl.119.2023.03.17.02.59.12
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 17 Mar 2023 02:59:12 -0700 (PDT)
Date: Fri, 17 Mar 2023 11:59:08 +0200
From: Pekka Paalanen <ppaalanen@gmail.com>
To: Sebastian Wick <sebastian.wick@redhat.com>
Subject: Re: [PATCH v10 01/15] dma-buf/dma-fence: Add deadline awareness
Message-ID: <20230317115908.2559b5f6@eldfell>
In-Reply-To: <20230317111737.48702bca@eldfell>
References: <20230308155322.344664-1-robdclark@gmail.com>
 <20230308155322.344664-2-robdclark@gmail.com>
 <ZAtQspuFjPtGy7ze@gmail.com>
 <CAF6AEGsGOr5+Q10wX=5ttrWCSUJfn7gzHW8QhxFC0GDLgagMHg@mail.gmail.com>
 <ZBHNvT3BLgS3qvV5@gmail.com>
 <CAF6AEGu1S2CXzRxV_c5tE_H+XUGiO=n0tXjLZ_u_tW-eMqMsQw@mail.gmail.com>
 <ZBLg0t0tTVvuPuiJ@gmail.com>
 <CAF6AEGvV5arZThTyju_=xFFDWRbMaexgO_kkdKZuK-zeCxrN7Q@mail.gmail.com>
 <CA+hFU4xbssR+=Sf4ia5kPdsSb4y9SQUd4nx_2p1Szcbtna28CA@mail.gmail.com>
 <20230317110921.0862cc8b@eldfell> <20230317111737.48702bca@eldfell>
X-Mailer: Claws Mail 4.1.1 (GTK 3.24.24; x86_64-pc-linux-gnu)
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/ns=2iCi6874feZ5wvr=m5cb";
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
Cc: Rob Clark <robdclark@chromium.org>, DMA@freedesktop.org,
	Jonathan Corbet <corbet@lwn.net>,
	Christian =?UTF-8?B?S8O2bmln?= <ckoenig.leichtzumerken@gmail.com>,
	intel-gfx@lists.freedesktop.org,
	"open  list:DOCUMENTATION" <linux-doc@vger.kernel.org>,
	open list <linux-kernel@vger.kernel.org>,
	dri-devel@lists.freedesktop.org,
	Christian =?UTF-8?B?S8O2bmln?= <christian.koenig@amd.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

--Sig_/ns=2iCi6874feZ5wvr=m5cb
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

On Fri, 17 Mar 2023 11:17:37 +0200
Pekka Paalanen <ppaalanen@gmail.com> wrote:

> On Fri, 17 Mar 2023 11:09:21 +0200
> Pekka Paalanen <ppaalanen@gmail.com> wrote:
>=20
> > On Thu, 16 Mar 2023 23:22:24 +0100
> > Sebastian Wick <sebastian.wick@redhat.com> wrote: =20
>=20
> > > Vblank can be really long, especially with VRR where the additional
> > > time you get to finish the frame comes from making vblank longer. =20
>=20
> Btw. VRR extends front porch, not vblank.

Need to correct myself too. vblank includes front porch, vsync does not.

https://electronics.stackexchange.com/questions/166681/how-exactly-does-a-v=
ga-cable-work


Thanks,
pq

--Sig_/ns=2iCi6874feZ5wvr=m5cb
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEEJQjwWQChkWOYOIONI1/ltBGqqqcFAmQUOewACgkQI1/ltBGq
qqfISQ/8D20lVay+/4PbbioQiKn34OZSSgRSLuQjkLK3bCQ84cA0rv+Oz1aUGYV3
dsJ3YzqrEMJ61jeeBC+unA1LXaBnuHhlvjkU9AM+ToBreSuu2CoGkJuFGcZ22jSO
rpwSAKyeWKHOXkTrByH6CyuB5sM5IL+CBU77sJO/k8x14PwxPdCGu+kNx+YYf8FY
NXEhu/5X0KNUZ4rtpoY4sw0dSXPOvB7ZeCC0PfnMi4faokOLprd935td6Wl3zlOW
Oqf/x8/3vhfk/hZfr44+wRX0xGT45GK62HWVflGc6BMc3dnSetOmDJ5VNESDFSdZ
z07d9H0wBgk+FkmN3FNYk7GUKDSKO+X3c5Pee7Z1Fpz9lERDItmYsHMW+nESIdh4
7rKN8n4uvQH/dLS673ezoAcw0TAg0wvbBZFaAA00ehYQevfgPbq9uxMYiiFIaOQE
eq0osWfvsz7688j0PaQU0B33V9AYBIxoFWumfz/kVWpN25SBxiZcmocAQfkX7HBG
cIp5AGMriF+6XCdzYpmHBhRf068SvJZI4r3FSHGpA/kcE/ZyhUBdQgZDsLtdIPeG
G5+uSWGZ9JcCftfpPLiT6TEJVjhmByaO1WHQvTR75aczQFald5RlESucK2L89hDd
vS3SOL+JOPO1nJGPh+e340xzw9gZCstkeD7ajtZUELPnhvdDzDA=
=f9L1
-----END PGP SIGNATURE-----

--Sig_/ns=2iCi6874feZ5wvr=m5cb--
