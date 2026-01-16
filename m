Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id EE530D30852
	for <lists+dri-devel@lfdr.de>; Fri, 16 Jan 2026 12:39:29 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9EDD610E1FA;
	Fri, 16 Jan 2026 11:39:27 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="auL3AOui";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from sea.source.kernel.org (sea.source.kernel.org [172.234.252.31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7EDC510E1FA
 for <dri-devel@lists.freedesktop.org>; Fri, 16 Jan 2026 11:39:26 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sea.source.kernel.org (Postfix) with ESMTP id 1475140D68
 for <dri-devel@lists.freedesktop.org>; Fri, 16 Jan 2026 11:39:26 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E86E5C4AF09
 for <dri-devel@lists.freedesktop.org>; Fri, 16 Jan 2026 11:39:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1768563565;
 bh=CXQQOwA/eEzIPCuqAzSZiZzBLITSZmnC2lVuqjTxJ44=;
 h=From:In-Reply-To:References:Date:Subject:To:Cc:From;
 b=auL3AOuiP+N26wR936YDLZ9EaNW2Oiv0XrsCGrONCSFGKykEKEb8paYsSeQMMqUtf
 SgUGPZPxMVu00Lg/WD8D2KjfXJeSqjYP+jEkzYOL8Gmj9/pcaS3VoWuSOafk4ZtTqh
 UQdIEV32ciDpr+GwuqGy9qsbzKFP7Y3eSnv4krXVRyeqE+mdNMo+w0I32AGwG7h1pJ
 xraNQAD/fv2Fr6K7xhKl0ROQltHl7YzjI03k757Lt6LCMnlaVsGrqXJgcZcIwyWSLq
 2vPNEWeKgbsBJ6TCCWuP93QifM4TAwAXGYfjwazJIZORGPYTMv0DHO4NpIIfsDomCr
 n9/uNqjNrpUOQ==
Received: by mail-lf1-f46.google.com with SMTP id
 2adb3069b0e04-59b6d5bd575so1990477e87.1
 for <dri-devel@lists.freedesktop.org>; Fri, 16 Jan 2026 03:39:25 -0800 (PST)
X-Forwarded-Encrypted: i=1;
 AJvYcCWKBa9e3u54Yov4szvuLSr+MZLxF27xf2p16P1QxAbBDtzjRZbaKtNt1XMAVrQpsFBJcQfrHvl5noo=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yz39u/rWksQh6+qGMP4pQ6fthwrRreaPQhffsc+PgXOAoX9NzE8
 mRQkkYMKw6B/FWjArdLGZNQbVmykZIk6dfc0Tc0+y4VZ84C9SXqTO3KCFfa/t01PKLBR4zuGkiV
 5HZbUKo665yiDWK61DcNH320uE0NDCjjq4ao4J3evIg==
X-Received: by 2002:a05:6512:3192:b0:59b:6ff4:195a with SMTP id
 2adb3069b0e04-59baef0063fmr793808e87.43.1768563564596; Fri, 16 Jan 2026
 03:39:24 -0800 (PST)
Received: from 969154062570 named unknown by gmailapi.google.com with
 HTTPREST; Fri, 16 Jan 2026 11:39:22 +0000
Received: from 969154062570 named unknown by gmailapi.google.com with
 HTTPREST; Fri, 16 Jan 2026 11:39:22 +0000
From: Bartosz Golaszewski <brgl@kernel.org>
In-Reply-To: <20260115165055.1739004-2-ukleinek@kernel.org>
MIME-Version: 1.0
References: <20260115165055.1739004-2-ukleinek@kernel.org>
Date: Fri, 16 Jan 2026 11:39:22 +0000
X-Gmail-Original-Message-ID: <CAMRc=MeZmROA5E+X0eHXnFuDqG+fiRBddJFCS3kRndJ+sZLuag@mail.gmail.com>
X-Gm-Features: AZwV_QgHn3Bgp42Zs07ODYXzLhE6d627qXzY16pFTZhBrCnGBRlTiCDDTXaHCms
Message-ID: <CAMRc=MeZmROA5E+X0eHXnFuDqG+fiRBddJFCS3kRndJ+sZLuag@mail.gmail.com>
Subject: Re: [PATCH] pwm: Update MAINTAINER entry
To: =?UTF-8?Q?Uwe_Kleine=2DK=C3=B6nig?= <ukleinek@kernel.org>
Cc: Linus Walleij <linusw@kernel.org>, Bartosz Golaszewski <brgl@kernel.org>,
 Lee Jones <lee@kernel.org>, 
 Daniel Thompson <danielt@kernel.org>, Jingoo Han <jingoohan1@gmail.com>,
 linux-gpio@vger.kernel.org, 
 dri-devel@lists.freedesktop.org, linux-pwm@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
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

On Thu, 15 Jan 2026 17:50:54 +0100, "Uwe Kleine-K=C3=B6nig"
<ukleinek@kernel.org> said:
> There is little sense in having gpio-mvebu and pwm-backlight explicitly
> listed in the PWM entry. Drop these and add the keywords that actually
> identify a driver as PWM related.
>
> Signed-off-by: Uwe Kleine-K=C3=B6nig <ukleinek@kernel.org>
> ---
>  MAINTAINERS | 6 ++----
>  1 file changed, 2 insertions(+), 4 deletions(-)
>
> diff --git a/MAINTAINERS b/MAINTAINERS
> index 5b11839cba9d..1ab3b6a2c29b 100644
> --- a/MAINTAINERS
> +++ b/MAINTAINERS
> @@ -21070,16 +21070,14 @@ L:	linux-pwm@vger.kernel.org
>  S:	Maintained
>  Q:	https://patchwork.ozlabs.org/project/linux-pwm/list/
>  T:	git https://git.kernel.org/pub/scm/linux/kernel/git/ukleinek/linux.gi=
t
> -F:	Documentation/devicetree/bindings/gpio/gpio-mvebu.yaml
>  F:	Documentation/devicetree/bindings/pwm/
>  F:	Documentation/driver-api/pwm.rst
> -F:	drivers/gpio/gpio-mvebu.c
>  F:	drivers/pwm/
> -F:	drivers/video/backlight/pwm_bl.c
>  F:	include/dt-bindings/pwm/
>  F:	include/linux/pwm.h
> -F:	include/linux/pwm_backlight.h
>  K:	pwm_(config|apply_might_sleep|apply_atomic|ops)
> +K:	(devm_)?pwmchip_(add|alloc|remove)
> +K:	pwm_(round|get|set)_waveform
>
>  PWM SUBSYSTEM BINDINGS [RUST]
>  M:	Michal Wilczynski <m.wilczynski@samsung.com>
>
> base-commit: 8f0b4cce4481fb22653697cced8d0d04027cb1e8
> --
> 2.47.3
>
>

Reviewed-by: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
