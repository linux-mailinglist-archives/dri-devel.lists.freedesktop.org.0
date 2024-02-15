Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 1AF1A85646E
	for <lists+dri-devel@lfdr.de>; Thu, 15 Feb 2024 14:32:00 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9920610E802;
	Thu, 15 Feb 2024 13:31:55 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="WCrOGHzG";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-yb1-f172.google.com (mail-yb1-f172.google.com
 [209.85.219.172])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9097110E7BC
 for <dri-devel@lists.freedesktop.org>; Thu, 15 Feb 2024 13:31:49 +0000 (UTC)
Received: by mail-yb1-f172.google.com with SMTP id
 3f1490d57ef6-dcd94fb9e4dso739715276.2
 for <dri-devel@lists.freedesktop.org>; Thu, 15 Feb 2024 05:31:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1708003909; x=1708608709; darn=lists.freedesktop.org;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=yGh//nbX6ksAbjoH86pu+1OoxjeTYU/3tdUOfH2WwY4=;
 b=WCrOGHzGCSvZE3bDS1YnUwRLFEl+Ifp+43EOUK7bkgAjY3bhAzDz32MtFJMOpEFY24
 cDxrOSYj1a7M2ac2+ao6iYU4w1uVGepZWA3+/O7eDJfum7axnkNjlB8jAzB4ZviI5f7C
 SKY+lS6Bkh+lymWm7w31BxvSuPW9JRMm8j7JlgAeXetsr9CFu2sMVitaJblcO6SQ3JiP
 v3cs0MCy6zzYXpXvxoisgwNRl5EGeaxfde+PHYNI+Gj7l/uf7jtIhU8EfWGxqritk+eV
 4I3YwhF6O/BbOieRwVwxFcp/neAMjTIPojRSAkYDpxP5eybEI5/lDlD0cZC9nlu0epdP
 eLtQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1708003909; x=1708608709;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=yGh//nbX6ksAbjoH86pu+1OoxjeTYU/3tdUOfH2WwY4=;
 b=c6uZ0iOZ3zBdkJqLyZmVaQauT1mTlfgQGQf/S+4OZisMfHlBDOkbvfOp0U+JMqDP8W
 tA4/WzXgLfXpHRrUjCsvx4ZZ1G07rxDgjzKLWGydK69Vt6fhe3QgmjwaOShD+iVw9Au5
 hc6WL3C+mcSPWkMOU8vN9BOQUF4u5LiS9w6wu/W48T5k9uBssjQ5NEhBzjcjjQ6cOgNZ
 fcHr+LJEJ1xHNllVE/tWM3q49h8stiVq/gPplRxmVwUOa9ttxd4xsdwRpD6GgZemiYa8
 iQxqZpqc9BVHe6PC61UOSQ3UgyKE9+JSgRj0Mo5H91i98eNTy7AecD1KKvm8v7TbNzN+
 P0Kg==
X-Forwarded-Encrypted: i=1;
 AJvYcCXSieB81WonhHnn4wwRMFJTY0MQ5WSMV1ah+0kqI8/yzf0ZD/Ph3XaMxCcayjW0qOnTrQFph+o5k+x3aoGKHTk74nn1wSlAHAHJ6m8cbEIs
X-Gm-Message-State: AOJu0YxLss3P0YXtg3Z0pS+8Zd/NyUCbif94Ahp+Uqski8k14gbi0gRr
 yOLPm98kOHT68zBzCghCEt6GnILEvvAWwfbjQ+l7dg7HK1tHbnYBMegL7MWZnwFykZkomBWQITz
 gfIrkKlHAFco6L3jRGu2fBcZ63pu92Q7qK87zLw==
X-Google-Smtp-Source: AGHT+IHl3qgWvQCqRJMe39KHtu2wuTpCX4Lckf3lqFQQ+kVziMGrJ7Juv/tfm7isqbWZN8sE5IWX6zuYqEnZ+zYcRZE=
X-Received: by 2002:a25:b949:0:b0:dcb:b41c:77ef with SMTP id
 s9-20020a25b949000000b00dcbb41c77efmr1387473ybm.24.1708003908799; Thu, 15 Feb
 2024 05:31:48 -0800 (PST)
MIME-Version: 1.0
References: <20240213-ktd2801-deps-v1-1-7feb5385eb9a@skole.hr>
In-Reply-To: <20240213-ktd2801-deps-v1-1-7feb5385eb9a@skole.hr>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Thu, 15 Feb 2024 14:31:37 +0100
Message-ID: <CACRpkdYm0dNZZvzAZ-VQ+MaHeL7NmGCmCVw42WMx6BFf4Lw0Pw@mail.gmail.com>
Subject: Re: [PATCH] backlight: ktd2801: depend on GPIOLIB
To: =?UTF-8?Q?Duje_Mihanovi=C4=87?= <duje.mihanovic@skole.hr>
Cc: Lee Jones <lee@kernel.org>, Daniel Thompson <daniel.thompson@linaro.org>, 
 Jingoo Han <jingoohan1@gmail.com>, Helge Deller <deller@gmx.de>,
 Arnd Bergmann <arnd@kernel.org>, 
 Karel Balej <balejk@matfyz.cz>, dri-devel@lists.freedesktop.org, 
 linux-leds@vger.kernel.org, linux-fbdev@vger.kernel.org, 
 linux-kernel@vger.kernel.org
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

On Tue, Feb 13, 2024 at 7:13=E2=80=AFPM Duje Mihanovi=C4=87 <duje.mihanovic=
@skole.hr> wrote:

> LEDS_EXPRESSWIRE depends on GPIOLIB, and so must anything selecting it:
>
> WARNING: unmet direct dependencies detected for LEDS_EXPRESSWIRE
>   Depends on [n]: NEW_LEDS [=3Dy] && GPIOLIB [=3Dn]
>   Selected by [m]:
>   - BACKLIGHT_KTD2801 [=3Dm] && HAS_IOMEM [=3Dy] && BACKLIGHT_CLASS_DEVIC=
E [=3Dm]
>
> Fixes: 66c76c1cd984 ("backlight: Add Kinetic KTD2801 backlight support")
> Signed-off-by: Duje Mihanovi=C4=87 <duje.mihanovic@skole.hr>

Acked-by: Linus Walleij <linus.walleij@linaro.org>

Technically you can also select GPIOLIB, because it is available on
all platforms, so it may be easier for users, but then you never know
which GPIOs you get in practice.

Yours,
Linus Walleij
