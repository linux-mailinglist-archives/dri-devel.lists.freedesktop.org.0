Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 8A3348B3BB1
	for <lists+dri-devel@lfdr.de>; Fri, 26 Apr 2024 17:35:49 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 39D001124C4;
	Fri, 26 Apr 2024 15:35:47 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="OV4lDaiU";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ed1-f50.google.com (mail-ed1-f50.google.com
 [209.85.208.50])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 82D801124C4
 for <dri-devel@lists.freedesktop.org>; Fri, 26 Apr 2024 15:35:45 +0000 (UTC)
Received: by mail-ed1-f50.google.com with SMTP id
 4fb4d7f45d1cf-571be483ccaso2792301a12.2
 for <dri-devel@lists.freedesktop.org>; Fri, 26 Apr 2024 08:35:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1714145744; x=1714750544; darn=lists.freedesktop.org;
 h=in-reply-to:references:to:from:subject:message-id:date:mime-version
 :from:to:cc:subject:date:message-id:reply-to;
 bh=9I5S2+S0bvqZ7UVU6beR6Uqu4fLT1g89R1N7x2rc2tw=;
 b=OV4lDaiUXb8Lnh97CvqC5dKdwOX3j/BfBm1DxrKV3oUOYfRDalMz2hZWiEofOb9p/g
 h7B1T4XPlPJCtvwlYPvbXfKdMwcW8eUXP8ji4YHj2G04E64W/bFVLAi7ZcXSRu+FjA94
 O6UB3LpCOil78kYVOK368jnfeQCGoSt1sPhJW/RIq2GAWwyHYedUs4Wmx3UPQ7+ZYKIm
 QfAl32ifnuu2/bVBu9dg0t9L6BcdPo48+I8qtJUiOdTpId58r9J2kbCXiUuHRO4dPmDf
 R3hRKeR3N2KUoNDbnf3YYz8O+coFWpveVrFucf4m/mk0TBZphEJh1o0k8lTUYad9QQva
 N4XQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1714145744; x=1714750544;
 h=in-reply-to:references:to:from:subject:message-id:date:mime-version
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=9I5S2+S0bvqZ7UVU6beR6Uqu4fLT1g89R1N7x2rc2tw=;
 b=DdtbaZYGBzE4QPrwhfIX5vfnJYEoffX6bCK1G0udwRzh3wVlM2Kp3++4DbEJuDl1Mg
 aO3EMBv1keNh0gP85f6Dmp3cQ31mTn7l3vSjBr7AKbuDZ8aMOLuKCS3JsInXGvRy5/qm
 80xsiIBKompwMtdHP77P3IB4CkXKDeIKtJn2D6OUB7bfYz+doEhmz0wrKnvVbA+3xZmq
 kC81t7o1y9dPxjhAyQDBQ8KM9sWkrdAWwY6ze8NBI8PLfVa3y2KOW7MCNcHLL9he/4lq
 TqgWXP+4rFcvhUi5gFemN7VUjqleruP0Y7Lz64Gtx4PF5+AtleO17xzO2LznRfxp6Ybo
 WfTg==
X-Forwarded-Encrypted: i=1;
 AJvYcCX4jAsnK+DUb3Kdxex0R+CbTrPaZrnDS3TIANisXYQrsjt/luxqG1rm5ITZfJAOmUh+DSMqlyhyVLz0GiTVAkZDQ5mY4SmL96912kGXSoir
X-Gm-Message-State: AOJu0YxWYpJHLyLIB0PGvcu9qKKsG9EQpLQ4DE+Mh6DB3391QTqpRC7O
 OrAz/oRmGG3nEmHV9lMSa5/zz2iVIIrZX9PVqw94wLQNLaKDkwYH
X-Google-Smtp-Source: AGHT+IF2wr8JiWj649TyQijnZJdEN1UK94JbX5L5JoJn/TCKNcaGYJRv/EOu+cxV7gOiqcJ3+t0WFw==
X-Received: by 2002:a50:9b5b:0:b0:56b:ed78:f58 with SMTP id
 a27-20020a509b5b000000b0056bed780f58mr1969434edj.33.1714145743428; 
 Fri, 26 Apr 2024 08:35:43 -0700 (PDT)
Received: from localhost
 (p200300e41f162000f22f74fffe1f3a53.dip0.t-ipconnect.de.
 [2003:e4:1f16:2000:f22f:74ff:fe1f:3a53])
 by smtp.gmail.com with ESMTPSA id
 fd25-20020a056402389900b00572678527e6sm30568edb.59.2024.04.26.08.35.42
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 26 Apr 2024 08:35:43 -0700 (PDT)
Content-Type: multipart/signed;
 boundary=8db9efe2193992169f1855e727000475caf92fc020254d3d8060c6c4c68a;
 micalg=pgp-sha256; protocol="application/pgp-signature"
Mime-Version: 1.0
Date: Fri, 26 Apr 2024 17:35:42 +0200
Message-Id: <D0U5YAWTAEXO.1GLSZDY2XKKRV@gmail.com>
Subject: Re: (subset) [PATCH v7 0/5] Add Tegra Security Engine driver
From: "Thierry Reding" <thierry.reding@gmail.com>
To: "Thierry Reding" <thierry.reding@gmail.com>,
 <herbert@gondor.apana.org.au>, <davem@davemloft.net>, <robh@kernel.org>,
 <krzysztof.kozlowski+dt@linaro.org>, <conor+dt@kernel.org>,
 <jonathanh@nvidia.com>, <catalin.marinas@arm.com>, <will@kernel.org>,
 <mperttunen@nvidia.com>, <airlied@gmail.com>, <daniel@ffwll.ch>,
 <linux-crypto@vger.kernel.org>, <devicetree@vger.kernel.org>,
 <linux-tegra@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
 <linux-arm-kernel@lists.infradead.org>, <dri-devel@lists.freedesktop.org>,
 "Akhil R" <akhilrajeev@nvidia.com>
X-Mailer: aerc 0.16.0-1-0-g560d6168f0ed-dirty
References: <20240403100039.33146-1-akhilrajeev@nvidia.com>
 <171414552137.2298337.4837480787385115790.b4-ty@nvidia.com>
In-Reply-To: <171414552137.2298337.4837480787385115790.b4-ty@nvidia.com>
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

--8db9efe2193992169f1855e727000475caf92fc020254d3d8060c6c4c68a
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8

On Fri Apr 26, 2024 at 5:32 PM CEST, Thierry Reding wrote:
> From: Thierry Reding <treding@nvidia.com>
>
>
> On Wed, 03 Apr 2024 15:30:34 +0530, Akhil R wrote:
> > Add support for Tegra Security Engine which can accelerates various
> > crypto algorithms. The Engine has two separate instances within for
> > AES and HASH algorithms respectively.
> >=20
> > The driver registers two crypto engines - one for AES and another for
> > HASH algorithms and these operate independently and both uses the host1=
x
> > bus. Additionally, it provides  hardware-assisted key protection for up=
 to
> > 15 symmetric keys which it can use for the cipher operations.
> >=20
> > [...]
>
> Applied, thanks!
>
> [4/5] arm64: defconfig: Enable Tegra Security Engine
>       commit: 4d4d3fe6b3cc2a0b2a334a08bb9c64ba1dcbbea4

For the record, I've also applied patch 5/5 but it didn't apply cleanly
and so b4 didn't track it properly.

Thanks,
Thierry

--8db9efe2193992169f1855e727000475caf92fc020254d3d8060c6c4c68a
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEEiOrDCAFJzPfAjcif3SOs138+s6EFAmYryc4ACgkQ3SOs138+
s6EV+g//fbg/7yejJ9Q0Vzf2k0pRHwe88E8Ih0sg9lYjOErhooz3HfGkb3TxbFDD
DJEoSBRHEdja4WUZ2x3uCjvuw3S7tF/w8LU6goDRnS92uGuPkgt0O+rtoSmaKLfi
MIZRVkJWtBVbrH9/6Vlvf9TRFq1xCzOunVqByMjFskeZKYxCEHEcfbbDPKfyqwR4
GChoZzcUc826b1heCZUU+E/fU1WeHBXruo2i3KRtUVQKHwjdjZ+FffLyuUZ3z6RU
xcqW8hG/PFsMJGDutWJkl5vw9o1ULHv0utkaXJ1zYBIu61pG+SqZpOw7TfAmQ8st
N7Ga6sf9++3Cmt7b7cR8+0waqdW1pYAVv+jw+c/GYM40n3C8owhSPbQjE5rxxxTS
7Wy5tvSsURjKsBXOlELeJL9ANI6/nreSrLXVBXfOeBx/+2o6tiyOhOnmW+Asml6u
PfZvMxj+BW48UETZX/01o0ABmPE+Xibb70igRKdJG/UznWpw/U8wyZcnu65Ac+9a
R5BMswVYYGJ+iaTCsrJJekr6Oam+LeIei+CQ9sigKEVAN8efZHSY/KbVicLPxFwJ
QJGOiGl2xuqejC5v6BCmdtMWh3KImuH3gHafe8v98aCc7p5Y1S4q8nBHF0iiti6L
cZk85PnTaqxFH47Dk/GlyBwCPGm2klmKQN5r85nGVFLUx1Z38yc=
=AFyx
-----END PGP SIGNATURE-----

--8db9efe2193992169f1855e727000475caf92fc020254d3d8060c6c4c68a--
