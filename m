Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 27102CA2015
	for <lists+dri-devel@lfdr.de>; Thu, 04 Dec 2025 00:59:07 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7213810E836;
	Wed,  3 Dec 2025 23:58:50 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="GLrtC2q+";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pl1-f172.google.com (mail-pl1-f172.google.com
 [209.85.214.172])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7589610E1A2
 for <dri-devel@lists.freedesktop.org>; Wed,  3 Dec 2025 23:58:48 +0000 (UTC)
Received: by mail-pl1-f172.google.com with SMTP id
 d9443c01a7336-29568d93e87so3367785ad.2
 for <dri-devel@lists.freedesktop.org>; Wed, 03 Dec 2025 15:58:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1764806328; x=1765411128; darn=lists.freedesktop.org;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=GRvZmNocZChOaH+XMJgg9lf8vYT4BPfuN+xdAI+uCKk=;
 b=GLrtC2q+V0Pfx22c3ZFaglPxuL/qjChCorLeXyUMmFMQk9pk7dc6i+yaoXNLqoxGGH
 mC51v1ipvnycfx/fVPpYiNylLi6lYglqmkGAWL7wy/D8MABSWxZDYfbxwRdBpdUYsStN
 Qq5HhmPjwaasUefP2qlwds7m+inmIF9m+3SQRjoUQBKBa9EoTorC9NqCOtDSUZWMgIGz
 gJlHaId+P18UD/EoClYkIpmiPUMQgyoUic9RLJDoTulyyVGUF6b+OniB6YoFShoKg1P/
 TsWy8zKFrm2cD0kC5H1Wq8omKhKH7hvqvKwUu9r7GGt0Q2Z+LShCp00WWLPhPPjAUyhc
 HIvA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1764806328; x=1765411128;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=GRvZmNocZChOaH+XMJgg9lf8vYT4BPfuN+xdAI+uCKk=;
 b=fP1VIHoAGDGdLRuksdukmo4WOqh9W0HhHnTRhi2y/fmAnRAFa+YG8YD0qJ9zZQS/we
 TpftX4ZAOpZuYRvVzqr/pq5Ui3XovH8wfsTPnmYl97GkuPrfc5fpzklISFSmHGEAl/wk
 B588iI6BZsE2WnzY1mncvbTNDrppGmnZDwrYsVKkvkU0V1ABIWZBqWjMWWKMo4cKRlO1
 +1Okl7Ltq1cfGs5K4JhskuIpIHZcvbuvNjj9+SNgZAVLhFQu27Pj2Ilb5K5PLPnW5yFh
 CQ4XncqfikK/d5x6UWrsxGlGhYnhWsYgNDrQubcsqpggrZf1VQeWUnOCh02YrpSdIzCI
 efOw==
X-Forwarded-Encrypted: i=1;
 AJvYcCVjWEmWPYDq+rOGcq55BCZWgFmz/rdhUMfcSgM0xyI9KpR4Zm9jMNOVfP6C5C5XWaMitdyojOhVMys=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yx/OF9Kzy8OQk1XFTB+nYclM/b+Q+kybB91die7beUUXvYfM76u
 09f97QkEZLdCJd7RqTQP4tjyQNk2oNMTC+7E51CypUypm2SMxfLS03Vd
X-Gm-Gg: ASbGncvMOXm4VEJzPnK0qYAxzkkf5rXaVct07xTjD4dkpSAIHLP2v9WWC3VWHxBkYIT
 OPamAMkT+Xa09Eyp02jxMBDD9ysSAlhredTXqwoGbrilT0sx0g3gPrhHs0rh/etKMNHLVuEHjOm
 9dAgUrnEVT9f+Pkq+w1wMZBMDE1AxYv6zNJoatJ+H1CNrnCIx1hRq/igIOVlop1qoJeluh0vyaB
 wLvCV8Cuj2aFZOlvhb7VTi2gVOowhiYaQgPZaBsSDq5GrvwAWcQ7LRPbLraJ0nbtEpinW2CoUWw
 QGSbaKSuCtP0LHNXu2bpS84diYP0/gwo2WwNoFSmmvst8gRhVIQd+uoKIg6Aod4LWiH3BmBy6Mm
 1iYeUwtK6547slE2V4OccLjLzB9augzX/D3SnIUVQRPhTi6Ot/p0C501fvMLMx0TtRmohjezEAy
 hUQnE9ItKh0aw=
X-Google-Smtp-Source: AGHT+IGLmOh6OQdBHx4G5q4S6N/1ExJ2TdxuwD40xz88RA8jLaB2hG2Ymfw2hokNgJs/XVsvYbEIzg==
X-Received: by 2002:a17:903:2ac6:b0:295:507c:4b80 with SMTP id
 d9443c01a7336-29da1f20fb3mr11557625ad.61.1764806327742; 
 Wed, 03 Dec 2025 15:58:47 -0800 (PST)
Received: from archie.me ([210.87.74.117]) by smtp.gmail.com with ESMTPSA id
 d9443c01a7336-29dae99f223sm236425ad.62.2025.12.03.15.58.46
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 03 Dec 2025 15:58:46 -0800 (PST)
Received: by archie.me (Postfix, from userid 1000)
 id 86DA441E8D3F; Thu, 04 Dec 2025 06:58:44 +0700 (WIB)
Date: Thu, 4 Dec 2025 06:58:44 +0700
From: Bagas Sanjaya <bagasdotme@gmail.com>
To: Shuah Khan <skhan@linuxfoundation.org>, Guenter Roeck <linux@roeck-us.net>
Cc: Alexander Deucher <Alexander.Deucher@amd.com>,
 Linus Torvalds <torvalds@linux-foundation.org>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 amd-gfx@lists.freedesktop.org, dri-devel <dri-devel@lists.freedesktop.org>
Subject: Re: Linux 6.18 amdgpu build error
Message-ID: <aTDOtCpsnfHZIJLm@archie.me>
References: <74032153-813a-4a40-8363-cce264f4d5ea@linuxfoundation.org>
 <1eb24816-530b-4470-8e58-ce7d8297996c@roeck-us.net>
 <0425d7b4-76e4-4057-83a5-a7b17a051c54@linuxfoundation.org>
 <ec77d11a-7613-4b75-8c9e-f2bba1595f0f@roeck-us.net>
 <9d520a1d-0b8d-4d30-b29f-230fc0f92b8a@linuxfoundation.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
 protocol="application/pgp-signature"; boundary="erbTTBANn0MwVJLS"
Content-Disposition: inline
In-Reply-To: <9d520a1d-0b8d-4d30-b29f-230fc0f92b8a@linuxfoundation.org>
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


--erbTTBANn0MwVJLS
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Dec 03, 2025 at 03:16:24PM -0700, Shuah Khan wrote:
> I am also seeing issues with cloning kernel.org repos on my system after
> a recent update:
>=20
> remote: Enumerating objects: 11177736, done.
> remote: Counting objects: 100% (1231/1231), done.
> remote: Compressing objects: 100% (624/624), done.
> remote: Total 11177736 (delta 855), reused 781 (delta 606), pack-reused 1=
1176505 (from 1)
> Receiving objects: 100% (11177736/11177736), 3.01 GiB | 7.10 MiB/s, done.
> Resolving deltas: 100% (9198323/9198323), done.
> fatal: did not receive expected object 0002003e951b5057c16de5a39140abcbf6=
e44e50
> fatal: fetch-pack: invalid index-pack output

I have no problem on my system (running Arch Linux) when cloning sparse.git
repo (also hosted on git.kernel.org) [1].

Thanks.

[1]: https://git.kernel.org/pub/scm/devel/sparse/sparse.git/

--=20
An old man doll... just what I always wanted! - Clara

--erbTTBANn0MwVJLS
Content-Type: application/pgp-signature; name=signature.asc

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQSSYQ6Cy7oyFNCHrUH2uYlJVVFOowUCaTDOsAAKCRD2uYlJVVFO
o6b+AQD5uSCz5nOd54BudHosSWoAiEPzzQFwHE2XFagnsG3HSgEA4HpLgkS7ZAM4
HrYlOF4SRvIYztoJrs15CyANGFpAtQA=
=IrVl
-----END PGP SIGNATURE-----

--erbTTBANn0MwVJLS--
