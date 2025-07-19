Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 61DDFB0B112
	for <lists+dri-devel@lfdr.de>; Sat, 19 Jul 2025 19:23:52 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E981A10E06E;
	Sat, 19 Jul 2025 17:23:49 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=aol.com header.i=@aol.com header.b="nmXFED5O";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from sonic313-20.consmr.mail.gq1.yahoo.com
 (sonic313-20.consmr.mail.gq1.yahoo.com [98.137.65.83])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8243810E06E
 for <dri-devel@lists.freedesktop.org>; Sat, 19 Jul 2025 17:23:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=aol.com; s=a2048;
 t=1752945827; bh=HiJ3t2uVaCcZ9V24nlVEHev/PFQn63fvHBEDh/RDfhU=;
 h=Subject:From:To:Cc:Date:In-Reply-To:References:From:Subject:Reply-To;
 b=nmXFED5OkxIz7p/nISr+KlW99fAEtnagvvzhYm0pKTDI11olT3VVdWayphRxFZTg4yyP/06tPGR8wek/RS0CjdYSyRE3U1Amv5zrL2gmCijzRBiHZIQ1kICKcpnVwQAE2g1WFWlQ3j/WBK/3Q5bzvBFU7WA6YIJRYy7kmj6DDi2w4jVzyxhmB3dMpW/SX5200be3E/uFRzknKWhYd96ZdFII518Kj2gQihjEf3/+oLBeOYGe354dPZWKZ3MDic0pN0h045FZqTDTaDK0Fyfsus9/GwhqfO6uPambiqz3I6bfhoTobuuZUThicfXH/Ttk9OlI2EumR6aXDV0whHfm5w==
X-SONIC-DKIM-SIGN: v=1; a=rsa-sha256; c=relaxed/relaxed; d=yahoo.com; s=s2048;
 t=1752945827; bh=JSbjk2cVCNuPkhbsOOk/XBsKiFpM1bc8iOnLoPJTRXR=;
 h=X-Sonic-MF:Subject:From:To:Date:From:Subject;
 b=fNvuTWNLCGqQk0KiUB+XuCejpP/Q2K5p+FzXBS5qrggQ13BGz/1pgs4fjEBBYKaLpu44pVJl2lfjqcgI0E8As1XZRDSWkmeIIkaGkdY1YmOsHJBxoZnctW6dUulULjmupvIpMbPomXndVctFu8E7ifAx074RPQtqAmTvcdO+jGOS7Vfv7mWg2Fve2FTyevBo0Am2h3aa7ctnNXna9HUl085FLuWx8kIBUmR/dhHTeaKkF0T7UYQrrVdp8Bb3KBp0pdbBc6mSQWni7uVN2Ugv0PjyHnRB45tHbCVmZUH9odkiT4QjUK4RoKEOya3IE6GWIbFO6XkS4VbdBdAiA8/jUA==
X-YMail-OSG: 10IONAsVM1m3sVe1jaGfR.ka2W08L_cRLdJtGei.enG3uD0wkpN0DX5AZSy4syB
 jb8dnIvFFkmQ2OYRaAvZ7eg3zJksq7dPQre7HTUpAA48GPlZOXuKdXPRZwbBgSYcnwBeIqy1vcQz
 sgp1WLNANzt1k9JYAj6BdCQKhCyYaAoeHNjfsiWGd9iGHoos_GmfnYshqRmC3WHqfEIp6rHUmo5k
 hw7iZYqEV7SrXpA2Q0M8qQiadH0nSrZv0saEYQ76zyGIasKuhtAfD9NztvvQ_YipkL730fcCZBLY
 gzABP3AwcFKxZSNPmgJFYLEp35W9YofH.5zXd1iri8yBAbikpwJhNEWz.bWW9TvHzTbWHnsvCeLp
 ACXq1tm2_IQFKvb0eqdSGwB0afBFT_S3uB3gA7sXZqnybPcVx.bHJTPLWAmA852dzP6hIIHlJtWR
 km1bf.yw0ECt6y0IC_K7qMO.qf_.MjNBe2RphyxoK2osZ2v7MDhGavznkJXCJ20OU5hA.3quQK0X
 PpHBOcEx3M1BuNSJ75h0LYDTOyv5u6baH36el5mxJgkRi.A1r4rdYmy_LwHLR.lHbNDPP7KlEqwL
 dptWvuu0dgNRtJRf0GQJXVMqNVnC6PwIm5W1lhgZK4.rX5k2rR8Sb3HdH24FXKYspIgGUShX1JJt
 Tv_ewUjEtxHNVBZazvN3kzZlJfXBsTTseu1oq1pKS093fuJtLKUIT8EXB4K4AyF6IWxU3oMY6AzF
 iwjLipq.lKQAfRuoSQRTK8sjMaBn92h0a.rOB5NS2qUjp7PsjtEyMwzX5fujxj5cHULssYKm7Rfk
 reUkgipkiLpJwP4P4bvQy2w86qlnMjGiK4XRDqDS_8pzcCWmOTmt5gpUt2v8JcBghIA4i8D0gTIl
 ass626iCgL1EIhsf3nvxYFT4Ihcj75vHJ2WFKA0kQVdKQa49TpWumYMSOyVSPuB4NdLCU57ytmPo
 J2hPNVwKSY22GicT9r77tV5W4WfzlJHR070fV5rlH7AUpgs8yW_IZd2ds0jcNBLA6MDWKLj0M6JY
 cz7qIp59SoBfmfgMXheCAavkJF2qzQkJZACZ0F_t357QRAyL3HJx0TCRKwd66GT_XScQu7mQk_nl
 i9IZamt87dNRok_.Tw31C8zCdXZDzhN7We_5sScu7slPaapJ95yBONWS.rlDnh4gDV3CXxeFzXjs
 1LTt0VgzOxsbqaD_FMonp0d2VKk8H3aK7ph30EgzsJCrVQZzlf5PQHRS7fKu949ybfdcD48Ao940
 Dq.fqP49nIohVqAjy0ErP_AS9LULjQG2ffqDjIabr3J5QhRPD_HpsF7HMCmFDnYBke1pDMU4vBMQ
 TrgkmVRg3yaM__Ubik27A2ZQAp5a4K0SQBp4p.uAquVYiVpSnCUPS5d_2AhG1FkeAnzI1xQcszBZ
 kNJk1QMQj6HBsptWmdrqwsHHu6OhQO8ug3RD32JABt3nQT8fjY555slU31.SMqlgBfzEnTeH4oNG
 3.UkZfeqrphClRAIXPTlSm7WXAQG6iJHPLAhbY9coIApPECEmbF1hTORgkb0MqKrQK2V9YClM3C6
 gLxEjD.Ggz7ikYQxvlYm1DDmhLCWJVBd8MyolDmNldqVrgSHRWsLmvhEDDH_56OkRx8H1Moy1TRa
 sz5mSo0LnW9R10MnzPgXNrvohThp9p4xHJhPi1utmH9qjXzKdkgCCeMJeMZEUrlNgjp81cnQq7GV
 UymaOWaWlDDfymaiscKMkyRcFJyNvJP2HSclEixaqGOZDP0DVMppLbm4_i4AEs4Eh4pSKFQCyDrs
 hw78znoTXodSYz0Q542JKimOdD22GJh6hZeNum.vy.SJZ7iNLvD19aU01wrblX6wKJLLYzRxwO5K
 ryeHguHBgf7PPzYk98outuPNcLHHC1VdQb8ATs5jbTtv6sNKZri0L.GvhqaQEO9GjfpNtRJm1n9O
 wf3vyuwoYeCTP5pqIYynt3N2Agq.vzAJZSFExLl27YcJDGFVOhGZJwrvj9E7anMOCXBXktJrNxf_
 qMBTVCH3j91OzLs1oeetMvUSYy_t56kNY4Q7RBKU4xhMlsNuLLEQYJmWOiau476V6caHOBhC5o_L
 C1S.P_HgKKDvdTimqUZ5ISoIhKVJkNw0MAbzOFFyMBXXQj_EZnBzo79B1z2ReQA8GS3oydF_KPXb
 ScfmwdcWZnSRCGWYD2lzaJpr_0I0ziRKKXNXUc7BVC3BLcdztsyTgyp4PUT27loU6hR46tq3vNI5
 87Mn_QrfBzT_Zgkj7dsagiNtb1G.ybZ.h4bz10.n2dKjjUvHxHpRx.tuL6UEqJHUO4Q--
X-Sonic-MF: <rubenru09@aol.com>
X-Sonic-ID: 3e0f2233-44ca-431c-b940-4832ccbd6731
Received: from sonic.gate.mail.ne1.yahoo.com by
 sonic313.consmr.mail.gq1.yahoo.com with HTTP; Sat, 19 Jul 2025 17:23:47 +0000
Received: by hermes--production-ir2-858bd4ff7b-p7k8x (Yahoo Inc. Hermes SMTP
 Server) with ESMTPA ID db3e695307cb42834ada22e727cb014a; 
 Sat, 19 Jul 2025 17:23:45 +0000 (UTC)
Message-ID: <e839e9c3147746ec1e004eaee632c8d0bcd56bc9.camel@aol.com>
Subject: Re: DRM GUD driver debug logging
From: Ruben Wauters <rubenru09@aol.com>
To: Thomas Zimmermann <tzimmermann@suse.de>, Maarten Lankhorst
 <maarten.lankhorst@linux.intel.com>, Maxime Ripard <mripard@kernel.org>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>
Cc: dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org
Date: Sat, 19 Jul 2025 18:23:42 +0100
In-Reply-To: <ffbc01f2-5571-4fba-ae73-86f959922bcb@suse.de>
References: <2a6afe3532235c7b76758163e2439e55c93df241.camel.ref@aol.com>
 <2a6afe3532235c7b76758163e2439e55c93df241.camel@aol.com>
 <ffbc01f2-5571-4fba-ae73-86f959922bcb@suse.de>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.56.2 
MIME-Version: 1.0
X-Mailer: WebService/1.1.24187
 mail.backend.jedi.jws.acl:role.jedi.acl.token.atz.jws.hermes.aol
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Sat, 2025-07-19 at 18:44 +0200, Thomas Zimmermann wrote:
> Hi
>=20
> Am 17.07.25 um 17:02 schrieb Ruben Wauters:
> > Hello
> >=20
> > I was taking a look at the code for the gud driver. I am aware this
> > driver was recently orphaned and I wish to get up to speed on it,
> > and
> > maybe with enough learning and work I can take over maintainance of
> > it
> > in the future.
>=20
> That's fantastic!
>=20
> There's https://github.com/notro/gud?tab=3Dreadme-ov-file=C2=A0and=20
> https://github.com/notro/gud/wiki=C2=A0for more information about the gud=
=20
> protocol and driver.

Thank you! I will take a look at it

I'm not sure how much experience exactly I'll need to be confident in
taking over maintainership, but I'll take it as it comes, and hopefully
learn on the way :)
>=20
> >=20
> > I noticed that in the function gud_disconnect in gud_driv.c on like
> > 623
> > there is the following code
> >=20
> > 	drm_dbg(drm, "%s:\n", __func__);
> >=20
> > checkpatch.pl marks this as unnecessary ftrace like logging, and
> > suggests to use ftrace instead. Since (as far as I can tell) this
> > effectively just prints the function name, would it not be better
> > to
> > just use ftrace for debugging and remove this call all together?
>=20
> I'm not a great fan of these types of debugging code. We already have
> this in the DRM core/helpers. Whatever drivers print for debugging=20
> should be more helpful than just the function name. So IMHO this can
> be=20
> removed.
>=20
OK, first patch I'll send will probably remove this

> >=20
> > While it isn't actively *harming* the code as such, it does seem a
> > bit
> > unnecessary.
> >=20
> > I'd like to know the DRM maintainers opinions. I know this
> > particular
> > driver does not have a maintainer dedicated to it, so I'd like to
> > know
> > the opinion of those that maintain the subsystem, and anyone else
> > that
> > has any opinion.
>=20
> If you want to do meaningful work on the driver, you could replace=20
> struct drm_simple_display_pipe with the real DRM helpers.=C2=A0 The struc=
t
> is=20
> an artifact from older driver designs, but is now obsolete. Drivers
> are=20
> supposed to be converted to DRM atomic helpers. For an experienced
> dev,=20
> it's a copy-past job. For a newcomer, it's a nice introduction to the
> DRM code. If you want to take a look, you can study commit
> 4963049ea1ae=20
> ("drm/hyperv: Replace simple-KMS with regular atomic helpers"), which
> recently did this conversion for the hyperv driver.

This is very helpful, thank you. One of the problems I've had with
kernel dev is knowing where to start with making meaningful changes.
I've been mainly sticking to cleanup and janitor tasks since, so having
this pinpointed to me is extremely helpful.
>=20
> Best regards
> Thomas
>=20
> >=20
> > Thank you
> >=20
> > Ruben Wauters
