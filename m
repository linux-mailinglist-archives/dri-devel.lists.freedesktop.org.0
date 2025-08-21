Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 6AF7AB2EC56
	for <lists+dri-devel@lfdr.de>; Thu, 21 Aug 2025 05:50:26 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 79DBF10E866;
	Thu, 21 Aug 2025 03:50:23 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="VEVB4NAc";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pl1-f175.google.com (mail-pl1-f175.google.com
 [209.85.214.175])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8B18310E866;
 Thu, 21 Aug 2025 03:50:22 +0000 (UTC)
Received: by mail-pl1-f175.google.com with SMTP id
 d9443c01a7336-24458242b33so5679235ad.3; 
 Wed, 20 Aug 2025 20:50:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1755748222; x=1756353022; darn=lists.freedesktop.org;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=qvOdk0AP5U47eysIi+b3LD+8lXXJgu36NwM+OWoufEU=;
 b=VEVB4NAcYaqoWAhzZlt08TVogkkYXisp8Tv1bNN4kebd8TAuTBgHxmtpvrZ79ryMem
 /Pt7dLgS2aV10XFCWKSw/uWLJgTC478CaXLz3uWq4nmCbsJ9/aDmRNazXLGilKPNJ4ri
 v+EELViO+1Tv3zOjp2CyEXi69kALwki63y4C9ze0lTz0hQAlWzpWNzQ6A9gf10KwP3tW
 x3Yc72EqB0w5tz4qNiYi3yMVtU+/DeF+oIkFpLsARQJ/MQPlichZ2+xUzN4F6WSkMZrl
 aNF2mNe04SAFhkbwlRdalAfuqMor4bKEhV8Lxho/QOB49MLAg2W90dyJ5HUDhPQOAATc
 QXRA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1755748222; x=1756353022;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=qvOdk0AP5U47eysIi+b3LD+8lXXJgu36NwM+OWoufEU=;
 b=A1p4TKiCvWRd+0vOUZ/zndKjRVqgqqAwGod+cWSnZ1Ix3blBBvwMaHlPw2ynPrZlJ+
 3GKlUU0Fd2RzZ60X2wxDf2ZkRCsPx6TJRJ9MnwTUeGW+9MbKdwxQww1HTq/1DPb8JNhp
 tNlN+/dZkj4mGMqjkffMYTraVjQxDvmKfV5eLFlEdmSgs0uA4yTAEAjCBg9H+tCkHfu5
 3c4kXD0ayKPClnkKEsBScYtY4WPF7nttGFP+mnQJhUiKb89sl0iVMfJlqT4Be9zNT9MC
 0KuXYF9uBCueEhyF5XoMRMuaquCGRAaG3b5GZ3mZHDYDVWPN2G6ZxQtvnT6V9XjeR+Nu
 EdIg==
X-Forwarded-Encrypted: i=1;
 AJvYcCUh7Q0lqcshzEChytWefD2ZR4XrSKjWpejQgE/G34BxNHXat4AIaR0y08/XCMIqYWN9zAARvHyGh2Ni@lists.freedesktop.org,
 AJvYcCVmUbx59CVjHaw+RVN+r/hkpvkniquBsy9ioQUBRWwj30vpgalLsocjBHRYrPOr8nKYYEaCA2O1zgw=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yxu9ciW3dcWQzLN0QVd4RNT4F8zZFJaDjQ5yFbk7ovbST/kNaWj
 DyF24ICnz/4PiJMNjXy3T26jrsA/AamJJxcfOmtSgFWy0HeZVIAcQ4nM
X-Gm-Gg: ASbGnctc6wecOJjH8N75aM6relZgZXjlZOtUcwuFdGFGPWcSUkREpdhNWkOMcxLxw6a
 TCxG9lgKrlh7rsbjqVsw2sKoB+o0wwILoADu2uRM7gzcuwQe0iYFGjz9Y7X9HNz6cJ6BZ5UPZIO
 vu+e+qO/XtjpaZv0gY35ZXLlEAocyR0tzL///UAoTPXOzaPNQNY2Vu8jZTVqfR8567GDVptZ38C
 KnQsr2990qXsjZytatpckqdVgRnORCZI+9tR0NfQh+0E6TJRsn8XNOO3u2Z3HAWiVLuqjlKEOi7
 8g0R1N53yHjGgs8r3VPX9QQJxBD6RvRMLOUwOcnfJKvndAmGYdSFcbhKR3kXpiKZsdFgCSXpQ1O
 iM5nJiaHWI1mnzcKyVNfNXg==
X-Google-Smtp-Source: AGHT+IESyXP60yojJSwB/BTpNaC7x3d6j2ALNBEcDquONeqhjsdAMoP+f17OWzW21YE6xh8IIHlfag==
X-Received: by 2002:a17:902:f68f:b0:234:cf24:3be8 with SMTP id
 d9443c01a7336-245fed88b5cmr14749475ad.28.1755748221986; 
 Wed, 20 Aug 2025 20:50:21 -0700 (PDT)
Received: from archie.me ([103.124.138.155]) by smtp.gmail.com with ESMTPSA id
 d9443c01a7336-245ed33cac4sm41437255ad.16.2025.08.20.20.50.20
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 20 Aug 2025 20:50:20 -0700 (PDT)
Received: by archie.me (Postfix, from userid 1000)
 id C404C419B2AB; Thu, 21 Aug 2025 10:50:15 +0700 (WIB)
Date: Thu, 21 Aug 2025 10:50:15 +0700
From: Bagas Sanjaya <bagasdotme@gmail.com>
To: Bala-Vignesh-Reddy <reddybalavignesh9979@gmail.com>
Cc: dakr@kernel.org, dri-devel@lists.freedesktop.org,
 intel-gfx@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 linux-next@vger.kernel.org, rampxxxx@gmail.com, robdclark@gmail.com,
 robin.clark@oss.qualcomm.com, seanpaul@chromium.org,
 sfr@canb.auug.org.au, simona.vetter@ffwll.ch
Subject: Re: linux-next: build warnings after merge of the drm-misc-fixes tree
Message-ID: <aKaXd-du1Zp9soSZ@archie.me>
References: <aKLAc27XGAadB8n5@archie.me>
 <20250820183507.84200-1-reddybalavignesh9979@gmail.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
 protocol="application/pgp-signature"; boundary="oywEq8yWt8FUYt59"
Content-Disposition: inline
In-Reply-To: <20250820183507.84200-1-reddybalavignesh9979@gmail.com>
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


--oywEq8yWt8FUYt59
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Aug 21, 2025 at 12:05:07AM +0530, Bala-Vignesh-Reddy wrote:
> Hi all,
>=20
> Those htmldocs warnings come from missing Sphinx markup in=20
> `drm_gpuvm_sm_map_exec_lock()`.
>=20
> This is already addressed by my patch:
>=20
> [PATCH] drm/gpuvm: Fix kernel-doc formatting and typo in
> drm_gpuvm_sm_map_exec_lock
>=20
> Link: https://lore.kernel.org/lkml/20250803092622.27532-1-reddybalavignes=
h9979@gmail.com/
>=20
> The patch inserts the required directive and corrects the return-value ty=
po.
> I have verified this.
>=20
> Could anyone please pick this up or keep it queued, so=20
> warnings disappear from -next.

I think this has been already addressed by Javier's patch and mine (see the
full thread). However, one of them must be in mainline.

Thanks.

--=20
An old man doll... just what I always wanted! - Clara

--oywEq8yWt8FUYt59
Content-Type: application/pgp-signature; name=signature.asc

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQSSYQ6Cy7oyFNCHrUH2uYlJVVFOowUCaKaXcwAKCRD2uYlJVVFO
o8CxAP9wSOuncLRV/qBS+79W+TL5XvHSvJ06ibw5ZB9BjExK/gD/bnV4q4ziawpc
ZpEYmZuxaK8G92zSF6t57XAlVVlY+w4=
=HLyE
-----END PGP SIGNATURE-----

--oywEq8yWt8FUYt59--
