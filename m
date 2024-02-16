Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E989D857A13
	for <lists+dri-devel@lfdr.de>; Fri, 16 Feb 2024 11:14:42 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3AB8210E556;
	Fri, 16 Feb 2024 10:14:40 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="m+mrCDGK";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ed1-f49.google.com (mail-ed1-f49.google.com
 [209.85.208.49])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B692310E530
 for <dri-devel@lists.freedesktop.org>; Fri, 16 Feb 2024 10:02:25 +0000 (UTC)
Received: by mail-ed1-f49.google.com with SMTP id
 4fb4d7f45d1cf-56399fb02b3so2335045a12.1
 for <dri-devel@lists.freedesktop.org>; Fri, 16 Feb 2024 02:02:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1708077744; x=1708682544; darn=lists.freedesktop.org;
 h=in-reply-to:references:to:from:subject:cc:message-id:date
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=iFO97t62l4dHWavxp7224ZFX2qc0rq1M7lJ4Sv8dxJY=;
 b=m+mrCDGKW50jfofB5wY3xAkVgbZHs5FIx691RnfPaMo8Jbvty3A2okiiRdmC1l9qzw
 sdtHH5n9GWTPPI4V4nujGul+1b0iEX+qOjG6AboPS0UkUi1FBerrnM+xcHSg3bIA1j3O
 H72JsTlChO30YuRepH7zDssf+1l9T6dZtPbXLY6TyLiD/qUL3mFjTVkZK2+BtJOA/QUV
 0UlUWkoya+vS7XrM6iUs62wyHQiNCOqxdsNnU+61UI8Jzg+MVkdx08GSIkycGbYNHwrY
 cQnn+azG1zCDG/P5/7uxBIjMN3xTy6mS61m0Er2r0m3F5DSBSMc2GKHDk9CRnUnBR2wn
 UGDg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1708077744; x=1708682544;
 h=in-reply-to:references:to:from:subject:cc:message-id:date
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=iFO97t62l4dHWavxp7224ZFX2qc0rq1M7lJ4Sv8dxJY=;
 b=QoHsMfH91JceQyIuyHjmeqj92KBm1b6/XyopTn9FBkxHJ+vNh9qcAJoU759NvvMHe4
 uu7c1pqwdQX94bYWo4GNB96G4cgjAC9gC2teUMXk0f1G7+0M1RmAN9bHw5MrgQfEsm7d
 iBonhnWxiRSAvBHU0+fmHz5sa+ywb9wxCcFct8lNWIfLOs7xopgOAYF5zs/ste9bddYQ
 /fQLOseePMIriGNBtpTMIKeEuBPAnIyNVA2HxMim1Cv3jNpTWUAJa09gMwR0Hh/cFz9u
 IIKHeLYdh7q7E6vryTpENe86lm5oBv+bUjn4IfYT90gjKdy9Xl9REre54rsHKxEtzbpe
 e9sA==
X-Forwarded-Encrypted: i=1;
 AJvYcCXkABTVVCM4W8HtBv8coumbiZshWmtsov4M5R41zfHQiSi2DdaHx0auLn4/9sDfAgDSQhp4qlOofOw7ollaRZCzKFppozKK48DeR0Km2UG3
X-Gm-Message-State: AOJu0YyOVIVkLZKafBvoNQs5DlRgF84M85qBPWv7mEVq7xgvV3pUWL0L
 Z9xIPs22ho1ri/CYipyvIdCfGEGeJ0x3lwhinyif1TCeWlFB/YA7PFSbyTKq
X-Google-Smtp-Source: AGHT+IHa5Y3wDSOPXWF8stpIoWaFLTHIB/MTDLHOIw6lBxwbSFE0Av6QFb+fAEy2Ph7nHwK1+2s7CA==
X-Received: by 2002:aa7:d812:0:b0:562:117d:2297 with SMTP id
 v18-20020aa7d812000000b00562117d2297mr3223763edq.36.1708077743770; 
 Fri, 16 Feb 2024 02:02:23 -0800 (PST)
Received: from localhost
 (p200300e41f147f00f22f74fffe1f3a53.dip0.t-ipconnect.de.
 [2003:e4:1f14:7f00:f22f:74ff:fe1f:3a53])
 by smtp.gmail.com with ESMTPSA id
 d22-20020a50cd56000000b0056387e8b63csm1419698edj.90.2024.02.16.02.02.22
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 16 Feb 2024 02:02:22 -0800 (PST)
Content-Type: multipart/signed;
 boundary=8798a49b6ecd34086d9a3ce9a9c124c00e8a431a4b0a170c89df5b98d57d;
 micalg=pgp-sha256; protocol="application/pgp-signature"
Mime-Version: 1.0
Date: Fri, 16 Feb 2024 11:02:22 +0100
Message-Id: <CZ6F0Y2S635X.1X4B2G0KT43NX@gmail.com>
Cc: "Mikko Perttunen" <mperttunen@nvidia.com>,
 <dri-devel@lists.freedesktop.org>, <linux-tegra@vger.kernel.org>
Subject: Re: [PATCH] gpu: host1x: Skip reset assert on Tegra186
From: "Thierry Reding" <thierry.reding@gmail.com>
To: "Mikko Perttunen" <cyndis@kapsi.fi>
X-Mailer: aerc 0.16.0-1-0-g560d6168f0ed-dirty
References: <20240214114049.1421463-1-cyndis@kapsi.fi>
In-Reply-To: <20240214114049.1421463-1-cyndis@kapsi.fi>
X-Mailman-Approved-At: Fri, 16 Feb 2024 10:14:39 +0000
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

--8798a49b6ecd34086d9a3ce9a9c124c00e8a431a4b0a170c89df5b98d57d
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8

On Wed Feb 14, 2024 at 12:40 PM CET, Mikko Perttunen wrote:
> From: Mikko Perttunen <mperttunen@nvidia.com>
>
> On Tegra186, other software components may rely on the kernel to
> keep Host1x operational even during suspend. As such, as a quirk,
> skip asserting Host1x's reset on Tegra186.

This all sounds a bit vague. What other software components rely on the
kernel to keep host1x operational during suspend? And why do they do so?
Why is this not a problem elsewhere?

Thierry

--8798a49b6ecd34086d9a3ce9a9c124c00e8a431a4b0a170c89df5b98d57d
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEEiOrDCAFJzPfAjcif3SOs138+s6EFAmXPMq4ACgkQ3SOs138+
s6FJLA//TLmO7NhFzAZ5dGJ0Bn9d0CzblHYDum0AOY9ZnoFl6kMUt60JGVUGPuan
2zum7+GKTW7R0z2EgBdkmqoPmF7usat9CUBTfQ/7SXjh8ZU/QUtZ6fvkICdf1X/E
ke/3n89axIXrXYicaC6BFaxdp1UiYL43NFouf7EjeXlm6Th5BplNNKhsjcK7OFeM
jpxMC9MPFI6kpfU1P26zi69sPU0Pi2wn5O2/7zyR4hWeQQ36cuRn7oEWsW9ANtEk
H30WgDoKKkqNcllqaxozbII0cRg+pPrRh79o1fXQn9TRqfqeTO665BWBvTAuvLQH
9wWLPMaBNYMr9RGZdYA7hYB4CfbFMJ2/vMgCpgZuhg4rB5Vd+2AG9b39gl1tk9cT
x2Oj3hf8ueHREHSuiz9AFRKyJwAxjrQeer5iImexTE1eUXqewZkq8X9eAySFQhYm
eO+vaO8/xJXDWCMw9a1UN+zyJjgm3mq1ZJa0uWf1IVT9Pcc42I1htDSkvB+ACvn3
NIPOd9MFuCsOchdzQm8R+M/hSjm5loG5lYH65NXi/L7Awl9cZgrR1znJCiMfU1IA
VTZlVt8fTS4mMxzom6o/N9k46gzdGOoaQaomYuRLWiY+so0UcMbAy0AvW0y0ecMm
cjUexxqJEHYHxD/r/rfkLzYcsQighTFidW8+VgEdjtfF7XF+jfI=
=/lsH
-----END PGP SIGNATURE-----

--8798a49b6ecd34086d9a3ce9a9c124c00e8a431a4b0a170c89df5b98d57d--
