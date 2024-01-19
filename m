Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B09AC832621
	for <lists+dri-devel@lfdr.de>; Fri, 19 Jan 2024 10:03:52 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 806DF10E98C;
	Fri, 19 Jan 2024 09:03:47 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-yw1-f170.google.com (mail-yw1-f170.google.com
 [209.85.128.170])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C4EC410E98C
 for <dri-devel@lists.freedesktop.org>; Fri, 19 Jan 2024 09:03:46 +0000 (UTC)
Received: by mail-yw1-f170.google.com with SMTP id
 00721157ae682-5ff7a098ab8so4900377b3.3
 for <dri-devel@lists.freedesktop.org>; Fri, 19 Jan 2024 01:03:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1705654966; x=1706259766; darn=lists.freedesktop.org;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=vXly0SHrTSjZSuXQftpHAjjIbPZkzzkklwoOCCBALEY=;
 b=UkAqQssjUayk17lkqZp5Elur/Q1ryIUi48uSaBIFafga75fmKSfpqpiVqx5Bu3Mrn3
 Jg382pAna8487v4m0/wGkpLKJzk5VqD3wZA5+USwpxefiJbY6DKvw5lAXBhDu3D5wwJn
 Kjgw9pIGT226n4m/xoX6iqiJJYLqEfnRBMJuXbqK8ZBNT97umLLE0Mljwm2K8ECDeo/e
 /1Cj+1y2rAxgJBCPL710psT168yzSlY2PDV5yCK316FlvwvxtgGp0wtH3fFNr4YBRDYm
 JMrLt8aLfCIbiHZA4r1o/PbO4sAHJ+SiL9ylreb31gXStpVmMRKYOjeeP3Ki3Ru/aAFk
 DVlA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1705654966; x=1706259766;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=vXly0SHrTSjZSuXQftpHAjjIbPZkzzkklwoOCCBALEY=;
 b=cmlUlnsbO0fXLyxythsVZE1temUx1uudJ1IFlFeLfQxglxsHgn2n3AibpDCzUJ20o9
 PY3Qd+jyVrFrW6laZ5ih/iWIv/zPnPIANSz2KDtK3nzsed7pibw6SD8I0esEs1d5KmUS
 Th485KrmiQrM0Vr5oC1adNL2uagV4Mg9NcJwHaMxBsB8tQf9uSyV5ddeY5eGLojqktQs
 jNjqhkZ++RIL2k/1K7jhO8J9WqwBXOMXbB3WhgrX6woZ4ALfnFNUYD+Yz+Qb/KA54gF6
 +9CZPybV5ndxjBxaZ2nQ/pX2zHXEIg5U2V6tvK6kL86fLSZ0tFfZrSW1DkL8cIqVzf+7
 99Xg==
X-Gm-Message-State: AOJu0Yy1DHMBWmBjthZvSvzu2sGDSCLVy0YzGFToVo1m18txcUit3/Ls
 qxYas6JW6YittAYE8FBB10nclHeOJdLHF9qayE3TEKxLdMG9kEh9Kj0dScnpurvir8e7bDSA6sw
 eS8ZiWvt4eyc08bp4UjfS5dFTrk6W2z3JD4SiFg==
X-Google-Smtp-Source: AGHT+IGH1HSlU2Qbeu2oYJg1QQ66XV+gD85BDZ/Gx+YWlz8o2e1bGKpsP6SO+/FVBt2P1/njmI/71ZCnpvbytP0Ju9U=
X-Received: by 2002:a81:6941:0:b0:5ff:50c2:e120 with SMTP id
 e62-20020a816941000000b005ff50c2e120mr2342756ywc.36.1705654964498; Fri, 19
 Jan 2024 01:02:44 -0800 (PST)
MIME-Version: 1.0
References: <20240118-ktd2801-v2-0-425cf32e0769@skole.hr>
 <20240118-ktd2801-v2-2-425cf32e0769@skole.hr>
In-Reply-To: <20240118-ktd2801-v2-2-425cf32e0769@skole.hr>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Fri, 19 Jan 2024 10:02:33 +0100
Message-ID: <CACRpkdaUvmmbGUyQ-L_u8c73=Oz+qE88GXd1=cUY7r+PPttJbw@mail.gmail.com>
Subject: Re: [PATCH v2 2/2] backlight: Add Kinetic KTD2801 driver
To: =?UTF-8?Q?Duje_Mihanovi=C4=87?= <duje.mihanovic@skole.hr>
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
Cc: devicetree@vger.kernel.org, Daniel Thompson <daniel.thompson@linaro.org>,
 Pavel Machek <pavel@ucw.cz>, Jingoo Han <jingoohan1@gmail.com>,
 Helge Deller <deller@gmx.de>, Lee Jones <lee@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, linux-fbdev@vger.kernel.org,
 Rob Herring <robh+dt@kernel.org>, ~postmarketos/upstreaming@lists.sr.ht,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Karel Balej <balejk@matfyz.cz>, linux-leds@vger.kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Duje,

thanks for your patch!

On Thu, Jan 18, 2024 at 6:33=E2=80=AFPM Duje Mihanovi=C4=87 <duje.mihanovic=
@skole.hr> wrote:

> Add driver for the Kinetic KTD2801 backlight driver.>
> Signed-off-by: Duje Mihanovi=C4=87 <duje.mihanovic@skole.hr>

Add some commit message?

> +#include <linux/backlight.h>
> +#include <linux/delay.h>
> +#include <linux/gpio/consumer.h>
> +#include <linux/of.h>

I don't think you need <linux/of.h>, the compatible table works without
that (is in the device driver core).

> +/* These values have been extracted from Samsung's driver. */
> +#define KTD2801_EXPRESSWIRE_DETECT_DELAY_US    150
> +#define KTD2801_EXPRESSWIRE_DETECT_US          270
> +#define KTD2801_LOW_BIT_HIGH_TIME_US           5
> +#define KTD2801_LOW_BIT_LOW_TIME_US            (4 * KTD2801_HIGH_BIT_LOW=
_TIME_US)
> +#define KTD2801_HIGH_BIT_LOW_TIME_US           5
> +#define KTD2801_HIGH_BIT_HIGH_TIME_US          (4 * KTD2801_HIGH_BIT_LOW=
_TIME_US)
> +#define KTD2801_DATA_START_US                  5
> +#define KTD2801_END_OF_DATA_LOW_US             10
> +#define KTD2801_END_OF_DATA_HIGH_US            350
> +#define KTD2801_PWR_DOWN_DELAY_US              2600
> +
> +#define KTD2801_DEFAULT_BRIGHTNESS     100
> +#define KTD2801_MAX_BRIGHTNESS         255
> +
> +struct ktd2801_backlight {
> +       struct backlight_device *bd;
> +       struct gpio_desc *gpiod;
> +       bool was_on;
> +};
> +
> +static int ktd2801_update_status(struct backlight_device *bd)
> +{
> +       struct ktd2801_backlight *ktd2801 =3D bl_get_data(bd);
> +       u8 brightness =3D (u8) backlight_get_brightness(bd);
> +
> +       if (backlight_is_blank(bd)) {
> +               gpiod_set_value(ktd2801->gpiod, 0);
> +               udelay(KTD2801_PWR_DOWN_DELAY_US);

That's 2600 us, a pretty long delay in a hard loop or delay timer!

Can you use usleep_range() instead, at least for this one?

> +       for (int i =3D 0; i < 8; i++) {
> +               u8 next_bit =3D (brightness & 0x80) >> 7;

I would just:

#include <linux/bits.h>

bool next_bit =3D !!(brightness & BIT(7));

Yours,
Linus Walleij
