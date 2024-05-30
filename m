Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 3BACE8D51C5
	for <lists+dri-devel@lfdr.de>; Thu, 30 May 2024 20:28:33 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C083810EB56;
	Thu, 30 May 2024 18:28:27 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="F6w8BU7R";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-f52.google.com (mail-lf1-f52.google.com
 [209.85.167.52])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 86B9910E3CD;
 Thu, 30 May 2024 18:28:21 +0000 (UTC)
Received: by mail-lf1-f52.google.com with SMTP id
 2adb3069b0e04-52a54d664e3so392756e87.0; 
 Thu, 30 May 2024 11:28:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1717093699; x=1717698499; darn=lists.freedesktop.org;
 h=in-reply-to:references:subject:cc:to:from:message-id:date
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=9xvggD5zyG5hkDkxWfILJwXhYiELErkkmtBD0MYsbXM=;
 b=F6w8BU7RxLuDzAuxvw5HKp+JaKCpKq3Vc0V/Xof31f/QJOrwDJpjjdaRA5QimnTvEf
 Pp37PMBAjnt+bzC2US+sX4/+JSUnERc9xyb00bvVD/VhY6aYPqcFAsSA7sqqBr/fWOA/
 23GKX9gPk5Kd+9NabQp/N7ec/Rl/Ki7nVq++kVckjkC4bRkzVY0UoUu5sEJiHxiRFZp1
 hd6QRiRqF39Xj0bkOeUTAda1+fxSdlRNK66/G1FGYrYbEtklyC5g+CIyAknu2HoDg4lR
 EvIm/y8IIZbWV4ZEnse2QGh+z4k1/E4ikqXYI3OOxbMDDyN22xSWIZ9VE72vIdQ3lAxp
 r0vg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1717093699; x=1717698499;
 h=in-reply-to:references:subject:cc:to:from:message-id:date
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=9xvggD5zyG5hkDkxWfILJwXhYiELErkkmtBD0MYsbXM=;
 b=Vwo1DZ31Rjw7cQgCG9F6lkuByKk1iA6ifMg0sUTPGbx4IEylhN28srSv7MU+rxxlpS
 NVc7vK01MfUZnvZbUzbSh+McL+zr/7Nv9iGQH8lyD7rthusA2IVETWaqKcB+d6iCTxBt
 4kUjxH37NP3PhRsf/MZ/Y1v4ZDudWLSFBy6T/vrGmzqwbzT4lVRZPvnvae8yZFRJvfbb
 fHNCX6HCCNd83pQ6ra0VZtkldLhqeNk3nzu/Xqr1TogSLU/qUUVgL4kjdpmNPU5d2WkL
 dEZftFqQ+O0slozwcb4KknWHcAooIEGThAIeVkSs+K9QyQQOJY0lHD8tM23UVbMHHJ7T
 fx2w==
X-Forwarded-Encrypted: i=1;
 AJvYcCXYA5YKVOkVi0NATDUedNEmLwVZaXjPNqcIDqR+JLdOZSRWJWw6tMev0EYHTqcQcYt+Ff3iNYb2HzrNG4NMxGHZaLLaBRgLVPiiKuLCIk7tCYe/Ec6NXfYE4VPG0sTK6rD48dSMb0E704k8iUy80Sfn
X-Gm-Message-State: AOJu0YxNo+UrULYAVLtIqEN2or1eV5DHcxGTHhykAKfrkL6cWCbU9w58
 iRNNiKg02YB8BhxB3c220qfbYffHCzjDTVH51JPxDT02e3jNni9g
X-Google-Smtp-Source: AGHT+IEQ0HOg2nVCclhwyMBh137n9XiHsinuwEbUK5FBdZaY8TZg5QzJKYc6yUFpiMsZXoVqvHEN7Q==
X-Received: by 2002:ac2:54ba:0:b0:529:adc0:2129 with SMTP id
 2adb3069b0e04-52b7d4186eemr1751587e87.11.1717093698952; 
 Thu, 30 May 2024 11:28:18 -0700 (PDT)
Received: from localhost
 (p200300e41f162000f22f74fffe1f3a53.dip0.t-ipconnect.de.
 [2003:e4:1f16:2000:f22f:74ff:fe1f:3a53])
 by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-a67eab85e98sm2416566b.176.2024.05.30.11.28.17
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 30 May 2024 11:28:18 -0700 (PDT)
Content-Type: multipart/signed;
 boundary=3c63f374e1b0ea791262a8278936583225c80209dd68e31d90030b5f68c0;
 micalg=pgp-sha256; protocol="application/pgp-signature"
Mime-Version: 1.0
Date: Thu, 30 May 2024 20:28:17 +0200
Message-Id: <D1N6WYWR463J.3UVC2PP2CUIY4@gmail.com>
From: "Thierry Reding" <thierry.reding@gmail.com>
To: <paulmck@kernel.org>, "Abhinav Kumar" <quic_abhinavk@quicinc.com>
Cc: <sfr@canb.auug.org.au>, "Rob Clark" <robdclark@gmail.com>, "Dmitry
 Baryshkov" <dmitry.baryshkov@linaro.org>, "Sean Paul" <sean@poorly.run>,
 "Marijn Suijten" <marijn.suijten@somainline.org>, "David Airlie"
 <airlied@gmail.com>, "Daniel Vetter" <daniel@ffwll.ch>, "Jon Hunter"
 <jonathanh@nvidia.com>, <linux-arm-msm@vger.kernel.org>,
 <dri-devel@lists.freedesktop.org>, <freedreno@lists.freedesktop.org>,
 <linux-kernel@vger.kernel.org>
Subject: Re: [BUG] Build failure and alleged fix for next-20240523
X-Mailer: aerc 0.16.0-1-0-g560d6168f0ed-dirty
References: <287206c0-b53d-4aa1-b35c-0725adc5e9ef@paulmck-laptop>
 <28db820c-860d-be1c-bb94-ed534622fdc8@quicinc.com>
 <4f821c7f-6201-470f-b39d-ba689ca027d9@paulmck-laptop>
In-Reply-To: <4f821c7f-6201-470f-b39d-ba689ca027d9@paulmck-laptop>
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

--3c63f374e1b0ea791262a8278936583225c80209dd68e31d90030b5f68c0
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8

On Thu May 30, 2024 at 6:55 PM CEST, Paul E. McKenney wrote:
> On Fri, May 24, 2024 at 12:57:58PM -0700, Abhinav Kumar wrote:
> > Hello
> >=20
> > On 5/24/2024 12:55 PM, Paul E. McKenney wrote:
> > > Hello!
> > >=20
> > > I get the following allmodconfig build error on x86 in next-20240523:
> > >=20
> > > Traceback (most recent call last):
> > >  =C2=A0=C2=A0File "drivers/gpu/drm/msm/registers/gen_header.py", line=
 970, in <module>
> > >  =C2=A0=C2=A0=C2=A0=C2=A0main()
> > >  =C2=A0=C2=A0File "drivers/gpu/drm/msm/registers/gen_header.py", line=
 951, in main
> > >  =C2=A0=C2=A0=C2=A0=C2=A0parser.add_argument('--validate', action=3Da=
rgparse.BooleanOptionalAction)
> > > AttributeError: module 'argparse' has no attribute 'BooleanOptionalAc=
tion'
> > >=20
> > > The following patch allows the build to complete successfully:
> > >=20
> > > https://patchwork.kernel.org/project/dri-devel/patch/20240508091751.3=
36654-1-jonathanh@nvidia.com/#25842751
> > >=20
> > > As to whether this is a proper fix, I must defer to the DRM folks on =
CC.
> >=20
> > Thanks for the report.
> >=20
> > I have raised a merge request for
> > https://patchwork.freedesktop.org/patch/593057/ to make it available fo=
r the
> > next fixes release for msm.
>
> Thank you!
>
> This still is not in -next, so I am putting it into -rcu just to silence
> the diagnostic.  Or should I push this to mainline via -rcu?

I pushed this to drm-misc-fixes earlier today, so should show up in
linux-next soon and hopefully in v6.10-rc2.

Thierry

--3c63f374e1b0ea791262a8278936583225c80209dd68e31d90030b5f68c0
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEEiOrDCAFJzPfAjcif3SOs138+s6EFAmZYxUIACgkQ3SOs138+
s6EtthAAp41m3IJzGSaKe1+TCFp5MCBxweTKfght0Ks+7Djtk1yp0Nek6he8G8YO
f5GWHEizfKgfdQO8NLGt9qw3ENJJOTgiG+TdjQAg/p4Z3uNN5EUqB17l4HR/+ph8
cXB5ZrHqS5nb2jrDGHc4ZJGW/4drN4D246LepgcudAuLD9jy6P9oU5V5tLQMJk3g
d/f24vawHEgVb+IC1q4kyz1rYyFhKOGuLs8KDAUSgR2SN2SQwiA8733mzpjULjCG
dAjSUKFun7EIhEwGTijkwUTVOps4VM6Ya0qHmJSlFbmrRQ37NgUB8A9UGDy7wGiC
yxBM4d4qhbfdyux/NXxSi9xQ0iGHpzi22JlPUFHLp3x9yRmVp4YwQe1gsTtSWHWH
FLW1NdJutUg7L4HQC0roSxwbGgTcEzoMkXD5AJz7OCA8WIG20VidVkAgjUu/qEyk
ZjGofu4Trkr7n0B7TuQtHiJsaCaZ5fPtlqhXYVuo682bcqDqwwWgBVlTBByA9LYY
kAtOYkYWtBAAdQT7r2VeLh5MNiA9o8hbC+dehtickVC+RDWlbAo/M+CZl8rhcDEj
8PY2iRdOtpmOB1KwuVUVzCQSOio8l0B0CTWz92S0Y9vae75uT0wWNAVqskDyK0eN
UgrYLijKMWhHtxKPbnmpQyo0o8FXJSrpPApR2r7ox67VDZRX4P0=
=rMdd
-----END PGP SIGNATURE-----

--3c63f374e1b0ea791262a8278936583225c80209dd68e31d90030b5f68c0--
