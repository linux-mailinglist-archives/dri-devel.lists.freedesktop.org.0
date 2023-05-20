Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 4410270A863
	for <lists+dri-devel@lfdr.de>; Sat, 20 May 2023 15:51:13 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2CD5C10E16E;
	Sat, 20 May 2023 13:51:08 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pj1-x1036.google.com (mail-pj1-x1036.google.com
 [IPv6:2607:f8b0:4864:20::1036])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4B52110E16E;
 Sat, 20 May 2023 13:51:05 +0000 (UTC)
Received: by mail-pj1-x1036.google.com with SMTP id
 98e67ed59e1d1-2533d74895bso3330694a91.0; 
 Sat, 20 May 2023 06:51:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20221208; t=1684590664; x=1687182664;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=v1DjKkNqJxAe4f+qRtBPeAc8nITQor5FKijXM6qfCso=;
 b=NzJBUaOZA5G1WnPV+WkVooIG9lLQAVrTDQ16cKheCsE9jy1VAvjCpC0Ba3XyIfi5nJ
 9LWlk3IfKgjqEO4ErgqOTA7eUeTruF13mNro9mGxjz6BpwJuTy4KingJNL3PAERWhjPJ
 Lp69ICG7lxaJHwR5gShqUY3CusIgX8JXm7z94Y7R/qzg71wOZS8xOxMRBgB5+xY6hsSu
 S0+uAvAlOgIj8mdKIg2mijFPg8rNL8YGSPFia0FMvZgaKYyS2tFtaFbghIPu5iPjCoo0
 SqCtsiNMKPJ136R/5CZ72mmPxUDpG8zgYSevDFpqxFBSbHNuHF5lm1KvNEmmygCOfQyN
 guJg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1684590664; x=1687182664;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=v1DjKkNqJxAe4f+qRtBPeAc8nITQor5FKijXM6qfCso=;
 b=TchRhxTl5qCqYf9rE2jxYksYqCQou/0vXQ2oWmep9s1Q5sy5gTryQoF5QySI/Dt44T
 8CcoZHaORH7eyQREA6k15tn14NpWVdSe2UIdm8ekhIwLyZYXOmBayheNnUV8Vf2D8Yqq
 XeeKcd4ZCZ1L/u6He9/9mAmHwURGFWxUurgyQSe/AUuitMKK37APQNR93NL2QiR62Ht8
 ISnMh25LLjNxz4BivUgYJei5UAZr1WfbdTLM9PjoSFX0J7ECCLGMESUy54IHH5Kevc2R
 vDvadF9XcxGqpzRB8s+Jt+VHyjjqYmCY7BMLClUSGWAdUbKAchpbcY9diZsa7oo+pn2C
 NQQw==
X-Gm-Message-State: AC+VfDwdhurjrsO0iTCC/P3IcLIU29nRSLE/MWJFnaOF46zNYIAEEHAV
 MwKbAkzi1tG2Id1VdTZQT1qRQo7RM2U=
X-Google-Smtp-Source: ACHHUZ6GaD8+abD+X/MQmS2hqD4IMHqYPqXScSS516EF/bZdrcHeYGnN0LSVRqnmFGvDnJ/0sqS3Uw==
X-Received: by 2002:a17:90b:400a:b0:253:8e47:40b8 with SMTP id
 ie10-20020a17090b400a00b002538e4740b8mr4286223pjb.1.1684590664240; 
 Sat, 20 May 2023 06:51:04 -0700 (PDT)
Received: from debian.me (subs09a-223-255-225-69.three.co.id. [223.255.225.69])
 by smtp.gmail.com with ESMTPSA id
 i7-20020a17090aee8700b0023a84911df2sm1283255pjz.7.2023.05.20.06.51.03
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 20 May 2023 06:51:03 -0700 (PDT)
Received: by debian.me (Postfix, from userid 1000)
 id 21CFB105634; Sat, 20 May 2023 20:50:52 +0700 (WIB)
Date: Sat, 20 May 2023 20:50:52 +0700
From: Bagas Sanjaya <bagasdotme@gmail.com>
To: Alex Deucher <alexander.deucher@amd.com>,
 Christian =?utf-8?B?S8O2bmln?= <christian.koenig@amd.com>,
 "Pan, Xinhui" <Xinhui.Pan@amd.com>,
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>,
 Hawking Zhang <Hawking.Zhang@amd.com>, Le Ma <le.ma@amd.com>,
 Tao Zhou <tao.zhou1@amd.com>, YiPeng Chai <YiPeng.Chai@amd.com>,
 "Jiadong.Zhu" <Jiadong.Zhu@amd.com>,
 Yang Wang <KevinYang.Wang@amd.com>, Candice Li <candice.li@amd.com>,
 Xiaojian Du <Xiaojian.Du@amd.com>, Likun Gao <Likun.Gao@amd.com>,
 Linux AMDGPU <amd-gfx@lists.freedesktop.org>,
 Linux DRI Development <dri-devel@lists.freedesktop.org>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 Linux Regressions <regressions@lists.linux.dev>
Subject: Re: Fwd: Kernel 5.11 crashes when it boots, it produces black screen.
Message-ID: <ZGjQPFvnAvN6MJnc@debian.me>
References: <c2168e4f-4d47-0d5d-a1b7-d237f0760df8@gmail.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
 protocol="application/pgp-signature"; boundary="BrcuXWEws5Ub7YHG"
Content-Disposition: inline
In-Reply-To: <c2168e4f-4d47-0d5d-a1b7-d237f0760df8@gmail.com>
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
Cc: "Azamat S. Kalimoulline" <turtle@bazon.ru>,
 max <kernel-ODwfxu5zp4@maxxor.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


--BrcuXWEws5Ub7YHG
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, May 10, 2023 at 03:26:56PM +0700, Bagas Sanjaya wrote:
> Anyway, let me add this regression to regzbot:
>=20
> #regzbot introduced: v5.10..v5.11 https://bugzilla.kernel.org/show_bug.cg=
i?id=3D212579
> #regzbot title: Booting kernel on AMD Ryzen 5 PRO stucks in loading initrd

Resolving...

#regzbot resolve: reporter found a workaround to the presumably firmware bug

See [1] for the precise workaround.

[1]: https://bugzilla.kernel.org/show_bug.cgi?id=3D216340#c53

--=20
An old man doll... just what I always wanted! - Clara

--BrcuXWEws5Ub7YHG
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQSSYQ6Cy7oyFNCHrUH2uYlJVVFOowUCZGjQNQAKCRD2uYlJVVFO
ow8xAP95LId80yotLjJuCqAvScT3zVqlzU3jw0za7laxNjvTOAD+IoX87VSLE1u5
TGII8nt/cEhCPC6HB1p6JcsDu48a3Ag=
=cXnc
-----END PGP SIGNATURE-----

--BrcuXWEws5Ub7YHG--
