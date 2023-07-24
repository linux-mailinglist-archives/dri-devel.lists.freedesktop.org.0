Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id C677275FE40
	for <lists+dri-devel@lfdr.de>; Mon, 24 Jul 2023 19:46:30 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7924610E0E8;
	Mon, 24 Jul 2023 17:46:26 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-yb1-xb33.google.com (mail-yb1-xb33.google.com
 [IPv6:2607:f8b0:4864:20::b33])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D95C710E0E8
 for <dri-devel@lists.freedesktop.org>; Mon, 24 Jul 2023 17:46:23 +0000 (UTC)
Received: by mail-yb1-xb33.google.com with SMTP id
 3f1490d57ef6-d074da73c7dso3075358276.1
 for <dri-devel@lists.freedesktop.org>; Mon, 24 Jul 2023 10:46:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1690220783; x=1690825583;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=jGALWlWRmNXsoEbN3b+Tsx/4LBd65om9fdbI43IPJSQ=;
 b=yPju5M+Iv8zlSqSRN8NkZ/yaY4qNd5PEyKZ6GihXBTYJu4Oi5zHjrSx9mDNXxXBubD
 JAPRwFk+gjIMK8tmIdZCD2E/ZFej3XpUtcL29RiU9C9+RvxF/J0GwvqaWC7exge3Gy/e
 pH7xd9OpQt5T+s0ev/unKrdhzaX0O0uvsA9QTg3gMUo+dzD3gIsAobi0UPld+cdbsVhu
 kBykcbwzT5oFROLwGEFhbuKKF7A+tzce+wWvDetiQ6MRSK03TBFJVS1yx0QCz+nD0rgQ
 mIstMK31i5aMMLm6xu1I2Brtj8G5E0X+XOyLZIxfQYmVu4hZYGNQrDQE5sprT/8CBmsi
 kE2Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1690220783; x=1690825583;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=jGALWlWRmNXsoEbN3b+Tsx/4LBd65om9fdbI43IPJSQ=;
 b=d9fTKhCL+PCQlr61NazDWgptWaLbBN5ne2QzJBNBYUNdDr62DXLGjMD/RaDvKQFm5d
 vP5z75gFq2H6A7n1hQT7/QjnhlBT0NN2V7LDQlzICUKnimd/6LboUMEhz/EeDsEh6ByE
 z79xVIgATRzB93K4HTy6pVsKOa11+rIS92wRYELGaYYSBhi0o06LSbqSNOSc1FOBdZ7H
 +VEpCE+x42yVtIxkI0Er2m15gpeGhgA3RlBhUo7woUgCq0ucOSCw1UJdexG97JurX/T5
 tbX2DY2FHlYpxDDaR3N5fLoUStCVthUI8cYAt6D8T1E0ShFG1OfY2k97F+E4RnQDxAhl
 TgJA==
X-Gm-Message-State: ABy/qLbmGZwwPiwGC5C6r/FVGMew0eeq/OZPUZK1H+bapaI2ieI3TM77
 LV5fKz8deUmMypk55zf1tFIK1WpMZhyOnKHvS/sJIQ==
X-Google-Smtp-Source: APBJJlH8543Uiuv9stapIH1RgQRbeQXKG/JYL5CYIdoKUw61G/5g7iNnYPJzhBnZUIogAwXmNNV751ON/7/ITO3he7o=
X-Received: by 2002:a25:ab12:0:b0:d12:3108:f90f with SMTP id
 u18-20020a25ab12000000b00d123108f90fmr2934909ybi.24.1690220782953; Mon, 24
 Jul 2023 10:46:22 -0700 (PDT)
MIME-Version: 1.0
References: <20230721093342.1532531-1-victor.liu@nxp.com>
In-Reply-To: <20230721093342.1532531-1-victor.liu@nxp.com>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Mon, 24 Jul 2023 19:46:10 +0200
Message-ID: <CACRpkda+kWcaeF1WMetDp3ppbrbQmuFEiUbpTdq2kH7o7wN68Q@mail.gmail.com>
Subject: Re: [PATCH v4] backlight: gpio_backlight: Drop output GPIO direction
 check for initial power state
To: Ying Liu <victor.liu@nxp.com>
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
Cc: "andy@kernel.org" <andy@kernel.org>,
 "daniel.thompson@linaro.org" <daniel.thompson@linaro.org>,
 "jingoohan1@gmail.com" <jingoohan1@gmail.com>, "deller@gmx.de" <deller@gmx.de>,
 "lee@kernel.org" <lee@kernel.org>,
 "linux-fbdev@vger.kernel.org" <linux-fbdev@vger.kernel.org>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "brgl@bgdev.pl" <brgl@bgdev.pl>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Fri, Jul 21, 2023 at 11:29=E2=80=AFAM Ying Liu <victor.liu@nxp.com> wrot=
e:

> If GPIO pin is in input state but backlight is currently off due to
> default pull downs,

Oh what an interesting corner case!

> then initial power state is set to FB_BLANK_UNBLANK
> in DT boot mode with phandle link and the backlight is effectively
> turned on in gpio_backlight_probe(), which is undesirable according to
> patch description of commit ec665b756e6f ("backlight: gpio-backlight:
> Correct initial power state handling").
>
> Quote:
> ---8<---
> If in DT boot we have phandle link then leave the GPIO in a state which t=
he
> bootloader left it and let the user of the backlight to configure it furt=
her.
> ---8<---
>
> So, let's drop output GPIO direction check and only check GPIO value to s=
et
> the initial power state.
>
> Fixes: 706dc68102bc ("backlight: gpio: Explicitly set the direction of th=
e GPIO")
> Signed-off-by: Liu Ying <victor.liu@nxp.com>

The solutions seems fine.
Acked-by: Linus Walleij <linus.walleij@linaro.org>

Yours,
Linus Walleij
