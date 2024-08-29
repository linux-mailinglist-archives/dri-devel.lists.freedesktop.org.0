Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 402F4964A7D
	for <lists+dri-devel@lfdr.de>; Thu, 29 Aug 2024 17:48:29 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A9EF210E70D;
	Thu, 29 Aug 2024 15:48:27 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="HPvEdoNz";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-f53.google.com (mail-wr1-f53.google.com
 [209.85.221.53])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B78D810E70A
 for <dri-devel@lists.freedesktop.org>; Thu, 29 Aug 2024 15:48:26 +0000 (UTC)
Received: by mail-wr1-f53.google.com with SMTP id
 ffacd0b85a97d-37182eee02dso563699f8f.1
 for <dri-devel@lists.freedesktop.org>; Thu, 29 Aug 2024 08:48:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1724946505; x=1725551305; darn=lists.freedesktop.org;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=XRpLyEmngmNsO1BlLrJr9uLhRTF0emdGC9GU+ntEPy8=;
 b=HPvEdoNzebqz+zJX9+S7DJZouFCb71JjR5D3qVVe1R8VY/8snTwdJPDGaJUHuiOUUS
 iVg+kwyS3LaEsVprMHX/LeAyWdCxdKPI9PWrRiZf8RYS0W69VA9+GtFeZEsxQL3TIv8p
 EZUlzjpywfukBZd/XbeH4WIdcHCie9+ZyrpS6K+UTcXr5uM5F8pQCL0lcM+fiMSoBjqX
 PQGsacdwnW/p66Xoa8YoEhDeNDF7q84dqOE9N70/tQJd69Bj8f2wkTW+HKJdxU56Sl85
 v2Sj+AmTTB13ZUyDiMKW6xteqJ0xMCWJ6FfFkMGpgeByMks4YxgS4Pk9OFzKMzp5MovC
 xnVg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1724946505; x=1725551305;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=XRpLyEmngmNsO1BlLrJr9uLhRTF0emdGC9GU+ntEPy8=;
 b=w1trxyYO6XjndXLib1xRxMBxOWAacjrxgE1LMO8EvzALgsh43RfnKNhgx5R5fCPXhF
 h8yNpOtnBUpDx0VfvCvU83bGSX/qLz2lev5IMAJIlKr6eIMTuo3cJQSgg3vVHf4yz1lu
 8rjq7s2uSWvqac1Pq2MAl/Oui3MjPekd70+O+A7p78Uz+CPScbvr3+RuxtY0urF2SvVm
 AZ1xIo2dw4jSlRB+iITenyrWWBT9Zy8zfpJXqqhNjU6Wwv0fDfOVnLKdfvo6WZY7il6N
 MeVElWBu+svhD/h7+O/tEkhdPGnXYwqeDZEWJcGQeGEDf4DPDJw6hGZzjp/nyMvP/GyO
 GvOw==
X-Forwarded-Encrypted: i=1;
 AJvYcCVZqYIhGiGTkCTYqQWdN6BBhXVRLX9t15akKAAXc0SGXvipwcXn5Mg2yvK97Dksah7kTvWNPIfgHWY=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yz38GXdcO85Y+DEw46kQfeRbkwjwc76lcm3nE8QF3GGgYU+wfCK
 3VWla3/GxfoFKXq2BQGqp+byor8aLwtRVakRi1cOW3BP6NK3yCln
X-Google-Smtp-Source: AGHT+IGHCUQwA6BDdTVYfWxrUiljUYvRhArRrCkCd9PaG0NPrjy8Vb6jJpV0ZVxb4oWoGgNm4GroJA==
X-Received: by 2002:adf:f302:0:b0:362:23d5:3928 with SMTP id
 ffacd0b85a97d-3749c1da581mr1592529f8f.17.1724946504464; 
 Thu, 29 Aug 2024 08:48:24 -0700 (PDT)
Received: from orome (p200300e41f29d300f22f74fffe1f3a53.dip0.t-ipconnect.de.
 [2003:e4:1f29:d300:f22f:74ff:fe1f:3a53])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-42ba63abe97sm54625005e9.24.2024.08.29.08.48.23
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 29 Aug 2024 08:48:24 -0700 (PDT)
Date: Thu, 29 Aug 2024 17:48:22 +0200
From: Thierry Reding <thierry.reding@gmail.com>
To: Kunwu Chan <kunwu.chan@linux.dev>
Cc: mperttunen@nvidia.com, airlied@gmail.com, daniel@ffwll.ch, 
 dri-devel@lists.freedesktop.org, linux-tegra@vger.kernel.org,
 linux-kernel@vger.kernel.org, Kunwu Chan <chentao@kylinos.cn>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Subject: Re: [PATCH] gpu: host1x: Make host1x_context_device_bus_type constant
Message-ID: <7lfoxxbtscgfsy6rttfea2vfmv6nf3xzzfv3tczd5sd27utwyv@vmrhr5j4ng4f>
References: <20240823080724.148423-1-kunwu.chan@linux.dev>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="5discxhm4f5xyvaj"
Content-Disposition: inline
In-Reply-To: <20240823080724.148423-1-kunwu.chan@linux.dev>
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


--5discxhm4f5xyvaj
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, Aug 23, 2024 at 04:07:24PM GMT, Kunwu Chan wrote:
> From: Kunwu Chan <chentao@kylinos.cn>
>=20
> Since commit d492cc2573a0 ("driver core: device.h: make struct
> bus_type a const *"), the driver core can properly handle constant
> struct bus_type, move the host1x_context_device_bus_type variable
> to be a constant structure as well, placing it into read-only memory
> which can not be modified at runtime.
>=20
> Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
> Suggested-by: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
> Signed-off-by: Kunwu Chan <chentao@kylinos.cn>
> ---
>  drivers/gpu/host1x/context_bus.c   | 2 +-
>  include/linux/host1x_context_bus.h | 2 +-
>  2 files changed, 2 insertions(+), 2 deletions(-)

Applied, thanks.

Thierry

--5discxhm4f5xyvaj
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEEiOrDCAFJzPfAjcif3SOs138+s6EFAmbQmEYACgkQ3SOs138+
s6EysxAArYfkVMvVVYkvw+kpGNUhX00DpSW9J4CclmMg2h0PH57jkGiYPx9H5IGF
m/WyoeY+RVH12s7H6BOhnEKRcNKxurXUBztLZt9R3KQQVwiLt+EqhoHALqGp6C+N
vpZGnCUpSkUa7tHz3iAaxd8H1GRLinlmnLK8zCDSXnYNcRc4M5S2CjmOYK2WKyaF
KJFtrn4WVQqH1zqQCX2bINPlnVq5lw7S5Lr4qMwHjwM1CvnmHfuEgH8tTLT7AllG
6N+nxtnvgKol4ETOSFMvFk85wiIyrxsQqgg51xdfp0cFDRzdyBmV7ogyAlOI1p07
9h7Jd5l4XuaTGPBhEnpnShUutL9YQoDOylHI+ylC/ZObe7HDj/gj1O1ORae43zRe
G5bi6fG6Cmi03WnKQSjRniTl+ROLBdodVkfx8xqDhiixC8dqxAbV3HK9jJb9c0Bs
PBV4Pq2B47GFSF73Z5YpsU3y6jfzLPX5ySV9KRWLBCatnEMpcg/GXHeIh+vNoTNf
eiS644a2C6Zln+b4zaMMlQKjp0pknEFc1JCCW3TUzSmvegZkhLVkewNub624iT0b
i707owNNxXf1jx7qQ2YPUSM1JhDFiiJ7VcaD+LrzHmjxQTde8kd0+7laEGpGFxSB
yaMY0hd+mDtshIqzv9WLfJQV4+9wyzqW1Zkoh3fMztdeJCkgfGI=
=kU8E
-----END PGP SIGNATURE-----

--5discxhm4f5xyvaj--
