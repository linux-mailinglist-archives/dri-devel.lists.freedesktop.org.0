Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 60A26746AE5
	for <lists+dri-devel@lfdr.de>; Tue,  4 Jul 2023 09:43:16 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5B6D010E2A4;
	Tue,  4 Jul 2023 07:43:10 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-x143.google.com (mail-lf1-x143.google.com
 [IPv6:2a00:1450:4864:20::143])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9874410E2A3;
 Tue,  4 Jul 2023 07:43:08 +0000 (UTC)
Received: by mail-lf1-x143.google.com with SMTP id
 2adb3069b0e04-4fb9ae4cef6so8280623e87.3; 
 Tue, 04 Jul 2023 00:43:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20221208; t=1688456586; x=1691048586;
 h=mime-version:references:in-reply-to:message-id:subject:cc:to:from
 :date:from:to:cc:subject:date:message-id:reply-to;
 bh=8PNt5BONlCpcQDBGJ6fMDygaaIUGiLYcCMkBrinaEjg=;
 b=KDifR/7Eq6Pi2rfuDKb19tFkyikOfvSsNc64b0XCFmA1+T87fADOCDH++DdkkDerLu
 DJgVoMhd6R7/09kp7W4MyvMqKzCMvsSHMdDMjvq2fk10P1RqDSJRyT6xHZmE/VZA4Yvo
 L6DwLhnlR2IoA/lw4nMiBcFQCHfiMidfDQQO9AIAurFnw75+wAB2Lv+LjjvKsDe+D4+q
 Rpyex70sADadsXR6sHOV3korXf9ejHdqnXEr5mulVkF3NdQH9yAXgDKZpGUr3kuLBLi3
 AwjHZx2qpxU+Fx9s1RynQOf7Hp+kA7OrAz6TrIIXLG32f3DLNC40fJLpTBr0CIkaikkx
 43gw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1688456586; x=1691048586;
 h=mime-version:references:in-reply-to:message-id:subject:cc:to:from
 :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=8PNt5BONlCpcQDBGJ6fMDygaaIUGiLYcCMkBrinaEjg=;
 b=Zf7bPl0yrvcStCFMLL2YFi0cSc+XTzCQ52KmBgOPIpG7K+mgt08Q+e8Oj6oXnhJpe5
 wiFkGOZ/nZNn7xbcjptYHVDCAJD7TUgGjjfmxxBg2r+UZWOLOhQ1zlvzlv353LAOLcYm
 btYAFzkZzw/LbbCSFSHaFmMuQPPxgobjHqB8cmwIJUbvvJBKOZ11wX5m5/ACD/KTU/Ou
 xGpFkgdHbXDcwl4zkJL61h6qmXB1Xyv9oQv2VQaQV7HkuqOodoUhafSyajOUcmOaWM4C
 536gzzWle5wiPAU2ilCPLruFeA9RkYZZU4P80xTAMNBY7aZERSMLbv2+BCmd5sIButSO
 H3qA==
X-Gm-Message-State: ABy/qLYWxJWgMOKwsdHt0Ke2K5lLBfOZX5wJOSWVas7xQq8r2SNDeRXp
 dAn5r8JIFV/aljHSJbCIxKk=
X-Google-Smtp-Source: APBJJlFh5ji9Dq9VEO/P5f7uoSN10XuXyXbVYqgR4BUEqh5rMo0qV/rxvDto94Xk/ltn0LgvufUvkQ==
X-Received: by 2002:a05:6512:4028:b0:4f9:69b8:1e7c with SMTP id
 br40-20020a056512402800b004f969b81e7cmr9738387lfb.46.1688456585748; 
 Tue, 04 Jul 2023 00:43:05 -0700 (PDT)
Received: from eldfell ([194.136.85.206]) by smtp.gmail.com with ESMTPSA id
 f27-20020ac2533b000000b004fb2244563fsm4570530lfh.289.2023.07.04.00.43.05
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 04 Jul 2023 00:43:05 -0700 (PDT)
Date: Tue, 4 Jul 2023 10:42:56 +0300
From: Pekka Paalanen <ppaalanen@gmail.com>
To: =?UTF-8?B?QW5kcsOp?= Almeida <andrealmeid@igalia.com>
Subject: Re: [PATCH v5 1/1] drm/doc: Document DRM device reset expectations
Message-ID: <20230704104256.658b259d@eldfell>
In-Reply-To: <cedc57a5-779a-3ec6-cfbd-f51dfb17f2dc@igalia.com>
References: <20230627132323.115440-1-andrealmeid@igalia.com>
 <CA+hFU4z1pc=KUVVqyqfXEceUqMXQgh-qUnuB=1nkPELghvQO7w@mail.gmail.com>
 <CADnq5_MNVdtdcWKSz6dgmsjg+kEu8p5FVE+fkw_5BaXeG3QGow@mail.gmail.com>
 <afab1f5a-e581-3416-e2c2-238ea120655b@mailbox.org>
 <CAAxE2A5C96k5ua+r938VA_+w7gHHNTdF3n8LwDb98W0Bf9wCVA@mail.gmail.com>
 <7c1e6df5-1ad4-be3c-b95d-92dc62a8c537@mailbox.org>
 <20230703114949.796c7498@eldfell>
 <cedc57a5-779a-3ec6-cfbd-f51dfb17f2dc@igalia.com>
X-Mailer: Claws Mail 4.1.1 (GTK 3.24.37; x86_64-pc-linux-gnu)
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/RCI7vH8+GJgozl35i2VP416";
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
Cc: pierre-eric.pelloux-prayer@amd.com,
 Sebastian Wick <sebastian.wick@redhat.com>,
 Randy Dunlap <rdunlap@infradead.org>,
 Marek =?UTF-8?B?T2zFocOhaw==?= <maraeo@gmail.com>,
 Timur =?UTF-8?B?S3Jpc3TDs2Y=?= <timur.kristof@gmail.com>,
 Michel =?UTF-8?B?RMOkbnplcg==?= <michel.daenzer@mailbox.org>,
 linux-kernel@vger.kernel.org, amd-gfx@lists.freedesktop.org,
 Samuel Pitoiset <samuel.pitoiset@gmail.com>, dri-devel@lists.freedesktop.org,
 kernel-dev@igalia.com, alexander.deucher@amd.com, christian.koenig@amd.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

--Sig_/RCI7vH8+GJgozl35i2VP416
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

On Mon, 3 Jul 2023 12:00:22 -0300
Andr=C3=A9 Almeida <andrealmeid@igalia.com> wrote:

> Em 03/07/2023 05:49, Pekka Paalanen escreveu:

> > If an application freezes, that's "no problem"; the end user can just
> > continue using everything else. Alt-tab away etc. if the app was
> > fullscreen. I do that already with games on even Xorg.
> >=20
> > If a display server freezes, that's a desktop-wide problem, but so is
> > killing it.
> >  =20
>=20
> Interesting, what GPU do you use? In my experience (AMD RX 5600 XT),=20
> hanging the GPU usually means that the rest of applications/compositor=20
> can't use the GPU either, freezing all user interactions. So killing the=
=20
> guilty app is one effective solution currently, but ignoring calls may=20
> help as well.

I don't know if what I'm seeing is a GPU hang or just e.g. Proton
getting somehow stuck, all I see is a game freezing. I just Alt+tab
back to Steam, force-stop it, and then all is fine again. This is how
it should work regardless of why a game freezes.

However, even if it was a GPU hang, if I am on a display server that
actually handles GPU resets, I don't see why the rest of the desktop
would not be able to recover. Individual apps are each to their own,
but at the very least non-GPU apps and the DE itself should not have
any problem (DE components can simply be restarted automatically).


Thanks,
pq

--Sig_/RCI7vH8+GJgozl35i2VP416
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEEJQjwWQChkWOYOIONI1/ltBGqqqcFAmSjzYAACgkQI1/ltBGq
qqf57A/+J9tI4ULUUgQi0CJRxT3WNlOsijGRclBAEoWzrasxH0/0DgqoITAq9ne4
Jbsk87BP90f1h8m6c3Y/sVN13jf7tA6v2PmPs7oxGp1c4tfaNq12I9a9/+eQTCwy
LW4/S+WN32sYXkf1pEcEd+wNav/MpmGu+LlxEUy7pGZYKP3FHJgScBBqzUnlapzJ
QM+I8VeAAyvQIUm8+PgAPjdOueBk8oGXNitShieCH3Y2foxFTG/Uc5s7dOduZ60z
vPOMdsSfCp276P759G94rg+RlQSsfrjmXTurFOvrdozQRdBAGR4aQQbCN8czmGAD
e3PFKY/Cl7vpJI31wyt+r0CzB28eBm6lEsmDKcLzrX9AhywyWTlmCK48bzb+076L
7fwsjZdEm6zsAtmNv4QvGj91UHDd2G9nQpPiSzWudLM5KTBA2zLSfgQXUrcbsQzh
euVwnBi0tIQgdXZBmMF0+xLiFmBke9+UfrIMZZNLyW/crVxKVvkma6qn7VUVrmCk
5IES1FCoQ9C3uqTneBKnLs3nxgKuQsynFP6UEzjU46EQjC5WN/8gdl0nrpRAKVa0
+KKsLE2j5m9+B4nE6BX0iavPSGVSM6DQjQl5hIsHE0x4hfLfmd5AnXxPzaAKGd8T
cdb+nEpiJrEvOFpNN7RlW/FdaD54aO2U0lcGyfIe0vKiGSeXXzw=
=VVvG
-----END PGP SIGNATURE-----

--Sig_/RCI7vH8+GJgozl35i2VP416--
