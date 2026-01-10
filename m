Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 16C74D0D94F
	for <lists+dri-devel@lfdr.de>; Sat, 10 Jan 2026 17:55:33 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 546DA10E207;
	Sat, 10 Jan 2026 16:55:24 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=tomeuvizoso-net.20230601.gappssmtp.com header.i=@tomeuvizoso-net.20230601.gappssmtp.com header.b="XpCBCa8j";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-yx1-f47.google.com (mail-yx1-f47.google.com
 [74.125.224.47])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A226A10E207
 for <dri-devel@lists.freedesktop.org>; Sat, 10 Jan 2026 16:55:23 +0000 (UTC)
Received: by mail-yx1-f47.google.com with SMTP id
 956f58d0204a3-640d4f2f13dso5130631d50.1
 for <dri-devel@lists.freedesktop.org>; Sat, 10 Jan 2026 08:55:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=tomeuvizoso-net.20230601.gappssmtp.com; s=20230601; t=1768064123;
 x=1768668923; darn=lists.freedesktop.org; 
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=Y/o1xqvbJ45vGrFZHnF5jBvuEbHXNcCQ1ufW03hbPtI=;
 b=XpCBCa8jvG7XSEOu9cKJ+wDco6XnmW4pHOyNdmnd0rwphXDIaubZHNV11JAk+U8zRc
 RofiVP/4vh5OlRnwQVUT8Ro0UG4ERCOHsyYfTqH3RD8Dv+UEu5GMfTXZKsUqkr1F7VH3
 KBEiqsSWOvCazF8q3EvJJ9q08P0isPJw1xSUO5JNRSsnqWbWfq4TabSa5FSlby2I8ebp
 cTuwk4e/tuIATS8DLFZjCB1dht7V5LAb6jXOu7tzOyqN4mcjovKhSJpMq3yFKFL4768P
 4MPopDwHI4QfAM6nFCgzMY29bQZ1DhJ/wlFwaXXpL1us6qHFKYkRltNOMY6sKVpR1y1i
 i7rQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1768064123; x=1768668923;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=Y/o1xqvbJ45vGrFZHnF5jBvuEbHXNcCQ1ufW03hbPtI=;
 b=W2KUAItAlsftg1dSsIxz6EWjsCp8VCdvajgQU7aSHsc3Ab7ZQDPhpSCNNJByCOQM+u
 VUQPHFos2seY1uJ+5gvAJKlwIC1dxIPjXqtp+Y/0ICK59dv5xID/uwzd6Bi+9YKoL4nT
 XYBLoz91znoZumaTgT4WMmrzIdg1L+oUWt+fewkJ1iCLufByEe+xMMdSK/Kh15N2qYkG
 WRYcOq/IP10piI+TxLsI5gMxmPbGpd6oKbQh2HoH/3PSZN46ndoym2+RSV/z1Hbpni+T
 fTqQN4Y1kMlQZMRdOe/rrgzr9meelDkTgM1INVQY79o5Q1zuvd6Z36rI0O+9MK8zOKIa
 6Yeg==
X-Forwarded-Encrypted: i=1;
 AJvYcCUvD4FWEl8suz4lLdeVFD1StTHVP23RQHXULK1M/oC3NbhHWxUynNSfp1V6EdoFAW8jtCQ3q513Mj8=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YxG4j5cl+WiKDWHCHpCYLF9sh5AyEn56Gk3Si+Kfa7EmbsHo9z9
 luzBFoHblVI2z9l/JgYOEL5NyAD1DNpddOL77BDJUQ3ZNYSWdpjESRvRW5/mqfiO/KEawosad11
 Nz7ZJJdA=
X-Gm-Gg: AY/fxX4YEipCjwWgGMQc5LO5SqJ0bUVPtdXOCeJbtWSWxxmSFDcbiwvVEZ+sAaLkaKJ
 Vh7NEXNiwDAm7N2AjD9sd2QtWPd58tF6L8XaPQ7DROk3/pIXwptOjINc8It32iRU0kmTPKuFvGG
 vFhCsMckUd2rc7qAD10ib1RMkHCdWl+mIZ5w6HogMttL0E3nL6ulowIj8oyoCR/K4Aegm6PXjy2
 OLIjdIssiwN/TmtfZqLo3lsyQwtIzjiCYIa/+SqN5UhqIes/lkikgj6GlYSnvAtKe576I8GWnT0
 Y4Et4v6/ps8GWD0AaT+gfmc/+vgDyA3wr9LEzvLA2dUxuXqQrpu+Iw2gp3/OGtoEM9zncAuq7nQ
 8iLuq8YksvQlk8B1EZ7ZHvlDsOmd4JF950FXvQ5CQ4BKDSzGRd2A+rUT4y/pHaRzK1dVEZ331aR
 Ij9ic3kOwXq6I1tHIGXCJn99WmQ9hwr+94LDjO5BuIwLVkY/m6mw==
X-Google-Smtp-Source: AGHT+IG1WqMR1y34BxO5Kd55MiCZ4TKU69zCcHkla/6MNTnrPDwLXP7b2ICSgfovA4FYnHqH66rwXg==
X-Received: by 2002:a05:690e:191d:b0:640:d038:fb02 with SMTP id
 956f58d0204a3-64716b8c63emr10968092d50.25.1768064122629; 
 Sat, 10 Jan 2026 08:55:22 -0800 (PST)
Received: from mail-yx1-f42.google.com (mail-yx1-f42.google.com.
 [74.125.224.42]) by smtp.gmail.com with ESMTPSA id
 00721157ae682-790aa670b21sm52848327b3.33.2026.01.10.08.55.22
 for <dri-devel@lists.freedesktop.org>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sat, 10 Jan 2026 08:55:22 -0800 (PST)
Received: by mail-yx1-f42.google.com with SMTP id
 956f58d0204a3-647374e4cccso2137997d50.3
 for <dri-devel@lists.freedesktop.org>; Sat, 10 Jan 2026 08:55:22 -0800 (PST)
X-Forwarded-Encrypted: i=1;
 AJvYcCWo+iauHJAiGP1DspMtCBDUSPRtr11P/ZyBHWUXLk6H3lZX4tOouhhwushzcFS2U+LhRGPOMfgz3mI=@lists.freedesktop.org
X-Received: by 2002:a05:690e:1c08:b0:640:d119:d339 with SMTP id
 956f58d0204a3-64716ba37camr10747408d50.33.1768064121923; Sat, 10 Jan 2026
 08:55:21 -0800 (PST)
MIME-Version: 1.0
References: <20251215-rocket-reuse-find-core-v1-1-be86a1d2734c@cherry.de>
In-Reply-To: <20251215-rocket-reuse-find-core-v1-1-be86a1d2734c@cherry.de>
From: Tomeu Vizoso <tomeu@tomeuvizoso.net>
Date: Sat, 10 Jan 2026 17:55:10 +0100
X-Gmail-Original-Message-ID: <CAAObsKDqv6Df15xrPpNYe3QP5AcwATM5EwpX4Ny7HSYNwAUpZQ@mail.gmail.com>
X-Gm-Features: AQt7F2r6hrO0wDYQpOUYquIFuvYoTOGI9f8Gm9_u7eurcCDn3ycXpkBly2nAGDU
Message-ID: <CAAObsKDqv6Df15xrPpNYe3QP5AcwATM5EwpX4Ny7HSYNwAUpZQ@mail.gmail.com>
Subject: Re: [PATCH] accel/rocket: factor out code with find_core_for_dev in
 rocket_remove
To: Quentin Schulz <foss+kernel@0leil.net>
Cc: Oded Gabbay <ogabbay@kernel.org>, dri-devel@lists.freedesktop.org, 
 linux-kernel@vger.kernel.org, linux-rockchip@lists.infradead.org, 
 Quentin Schulz <quentin.schulz@cherry.de>
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

On Mon, Dec 15, 2025 at 6:07=E2=80=AFPM Quentin Schulz <foss+kernel@0leil.n=
et> wrote:
>
> From: Quentin Schulz <quentin.schulz@cherry.de>
>
> There already is a function to return the offset of the core for a given
> struct device, so let's reuse that function instead of reimplementing
> the same logic.
>
> There's one change in behavior when a struct device is passed which
> doesn't match any core's. Before, we would continue through
> rocket_remove() but now we exit early, to match what other callers of
> find_core_for_dev() (rocket_device_runtime_resume/suspend()) are doing.
> This however should never happen. Aside from that, no intended change in
> behavior.
>
> Signed-off-by: Quentin Schulz <quentin.schulz@cherry.de>

Thank you, pushed it to drm-misc-next.

Best regards,

Tomeu Vizoso

> ---
>  drivers/accel/rocket/rocket_drv.c | 15 ++++++++-------
>  1 file changed, 8 insertions(+), 7 deletions(-)
>
> diff --git a/drivers/accel/rocket/rocket_drv.c b/drivers/accel/rocket/roc=
ket_drv.c
> index 5c0b63f0a8f00..28bf6c602f802 100644
> --- a/drivers/accel/rocket/rocket_drv.c
> +++ b/drivers/accel/rocket/rocket_drv.c
> @@ -180,17 +180,18 @@ static int rocket_probe(struct platform_device *pde=
v)
>         return rocket_core_init(&rdev->cores[core]);
>  }
>
> +static int find_core_for_dev(struct device *dev);
> +
>  static void rocket_remove(struct platform_device *pdev)
>  {
>         struct device *dev =3D &pdev->dev;
> +       int core =3D find_core_for_dev(dev);
>
> -       for (unsigned int core =3D 0; core < rdev->num_cores; core++) {
> -               if (rdev->cores[core].dev =3D=3D dev) {
> -                       rocket_core_fini(&rdev->cores[core]);
> -                       rdev->num_cores--;
> -                       break;
> -               }
> -       }
> +       if (core < 0)
> +               return;
> +
> +       rocket_core_fini(&rdev->cores[core]);
> +       rdev->num_cores--;
>
>         if (rdev->num_cores =3D=3D 0) {
>                 /* Last core removed, deinitialize DRM device. */
>
> ---
> base-commit: a619746d25c8adafe294777cc98c47a09759b3ed
> change-id: 20251215-rocket-reuse-find-core-8ecb7ed24cab
>
> Best regards,
> --
> Quentin Schulz <quentin.schulz@cherry.de>
>
