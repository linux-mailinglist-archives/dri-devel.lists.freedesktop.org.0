Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 9D44E91A0D2
	for <lists+dri-devel@lfdr.de>; Thu, 27 Jun 2024 09:52:02 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8BD1910EA5C;
	Thu, 27 Jun 2024 07:51:57 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="m7iOS7bM";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-f44.google.com (mail-wm1-f44.google.com
 [209.85.128.44])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F037A10EA5C
 for <dri-devel@lists.freedesktop.org>; Thu, 27 Jun 2024 07:51:55 +0000 (UTC)
Received: by mail-wm1-f44.google.com with SMTP id
 5b1f17b1804b1-42562a984d3so7340995e9.3
 for <dri-devel@lists.freedesktop.org>; Thu, 27 Jun 2024 00:51:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1719474714; x=1720079514; darn=lists.freedesktop.org;
 h=in-reply-to:references:to:from:subject:cc:message-id:date
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=ROk/aJkmGUASb3klzYJnyvP/GH2Dz+GTWC37DGRBecY=;
 b=m7iOS7bMybpaIAeFx8vUXYcZgRhRSYNRqmzbmCmFDMHngfN0In4bvK+lGS7quqwslz
 1HBx5Qyv4LB/H35wd4S61/HKCiDDOumdspe2x7BaIke220Aouau35E5+B2my73LwcPkb
 fGyh9HdCPRjKfkWXl7pvCPBlWV3MSijwR7rjNRh2y3eBLJXrZlbZ/YTAOuMagZLr01tT
 jJsWMmCERjF+b12mit4YQ014lds0CWYEiz3Et0Se4v0y/AoK6gvcBJf3DNq2V4W2rebD
 XsTMyUpxWz/oR9B/F4iAK2WQcGsMgpUgCtyz0X04OIFw4miDEwGkPcSr6fHW2/R+IxdV
 19PA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1719474714; x=1720079514;
 h=in-reply-to:references:to:from:subject:cc:message-id:date
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=ROk/aJkmGUASb3klzYJnyvP/GH2Dz+GTWC37DGRBecY=;
 b=mAAhZOb7cpd2oyf6dAIQnk1EV8sE5bfD4r0NW2MWey8Lmow4Uy6aRtLWZZxIPzlAe9
 sIHawoaESVlFusIhfzYnLPMaczgjaxIKqMBirxyTrGw5tKt74vvRRfubQbO3i//yllPB
 cBtF2EMQZ64qZ7M60Us2Cx3Eo/8wT4tH1KLMytQpGHooGpLy7zU8Y594drZuNYcS/Wub
 wa+7MPdE38IJF10+1lw78z5gQ/C8ayqleTcgvphsYGpqxNxkW/WiIAMBGRTixFiY+GjM
 IvhoQu2q4mzZbBLunR9df28OXbq47s9Ip+jB65lFbuBsu1axaW7kV5k+ZhVhNg6mK7MP
 MAWg==
X-Gm-Message-State: AOJu0YxHvPn5tGPMHVlR/hlft72+LU9UHA6liwff81HMLZx6M/gSFy5s
 HRwubOmvsNViJNG5rizvuMgix+h/Oqc1260N2EGwKQdlUGB/EspR
X-Google-Smtp-Source: AGHT+IGgKOinmDtHcLbWIaf7rpqzsOj4IbJCl17XQsknsweGY2b4FVYbzOf6xDbYyRi6TNAHX0EESw==
X-Received: by 2002:a05:600c:4d98:b0:424:a2d8:5fe9 with SMTP id
 5b1f17b1804b1-424a2d8601cmr43300315e9.38.1719474713555; 
 Thu, 27 Jun 2024 00:51:53 -0700 (PDT)
Received: from localhost
 (p200300e41f162000f22f74fffe1f3a53.dip0.t-ipconnect.de.
 [2003:e4:1f16:2000:f22f:74ff:fe1f:3a53])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-42564b7b7a5sm13632205e9.24.2024.06.27.00.51.52
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 27 Jun 2024 00:51:53 -0700 (PDT)
Mime-Version: 1.0
Content-Type: multipart/signed;
 boundary=4c86c22c78578bbaeae325e209d8920954343bc244ccdcf05116e315b3a6;
 micalg=pgp-sha256; protocol="application/pgp-signature"
Date: Thu, 27 Jun 2024 09:51:52 +0200
Message-Id: <D2AMWY1MS3UJ.2GTU7S0UQG8KZ@gmail.com>
Cc: <dri-devel@lists.freedesktop.org>, <linux-tegra@vger.kernel.org>,
 <linux-kernel@vger.kernel.org>, <baijiaju1990@gmail.com>
Subject: Re: [PATCH V2] drm/tegra: fix a possible null pointer dereference
From: "Thierry Reding" <thierry.reding@gmail.com>
To: "Huai-Yuan Liu" <qq810974084@gmail.com>, <mperttunen@nvidia.com>,
 <airlied@gmail.com>, <daniel@ffwll.ch>, <jonathanh@nvidia.com>
X-Mailer: aerc 0.17.0-167-g7c5a1afbda60-dirty
References: <20240602084613.220931-1-qq810974084@gmail.com>
In-Reply-To: <20240602084613.220931-1-qq810974084@gmail.com>
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

--4c86c22c78578bbaeae325e209d8920954343bc244ccdcf05116e315b3a6
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8

On Sun Jun 2, 2024 at 10:46 AM CEST, Huai-Yuan Liu wrote:
> In malidp_tegra_crtc_reset, new memory is allocated with kzalloc, but
> no check is performed. Before calling __drm_atomic_helper_crtc_reset,
> mw_state should be checked to prevent possible null pointer dereference.

The commit message here still references variables that don't exist in
this driver. Looks like copy/paste leftovers from a similar patch?

Thierry

--4c86c22c78578bbaeae325e209d8920954343bc244ccdcf05116e315b3a6
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEEiOrDCAFJzPfAjcif3SOs138+s6EFAmZ9GhkACgkQ3SOs138+
s6GdEw//Z4Dt/JJ9RugLNZqFmPjyu6cV9BTYNS8C+i+Z5qVSJKAlU17QXEtgao0v
9udOalpTa2st4fVsCXetfL1k2XJP5A1lzokPxst1Ln2YY1bb/sySoR9IMKHjsVPu
YWKM7gqd2gKfoQvxpeqswAKXcV+GB/EkwWOBFoKRvM62U4K/Vr6KGAYWr0eLxqP7
nZI2QPWEWrL/IB5Z/bNtSbwtkAa/kzQi29dnIgJJo6Hz6o7n84rHsQE5wtNkApL7
kr5UT9+yKv1dVA2OPeF+PjbZKDjhaBFRYeEgb5Ok0f0DAN2/ukX0UynpFxkAosi3
ESyDYi1aTwTUBUIvddzjtqs3HrhOM/g83gF3HSNXaqCh1OXjZ4OGJIDlAJhmBoTB
p/CfvfrbJdlz7zkEoi0I1DoM6tZb2QKoAaH7W7S9ckmsAUtuXQFCxJluLMP04+Lp
lylchxY7Fkxk7off5hcSzVW0VQ2uuO9IMLwG26/TPKT/P5krgd7KN+GuYSi1SbIv
qV5NysCmwWuXZh8cyEiuK1cV2FCZwYQyvHDtoSZECHCymzuYOPrnqJ2z/wkV6uJO
9T0uJh4MOJizJfwLtqRTuy9/416fN26QboFfpgvaWABHIlojULEbaA9AQ1Pa1Dss
NhNTU4lfgWY05qgthujOyYEGTFZnnw9ARRkXnsiPAWf47Ndx3W8=
=h1m7
-----END PGP SIGNATURE-----

--4c86c22c78578bbaeae325e209d8920954343bc244ccdcf05116e315b3a6--
