Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 6D3B3559347
	for <lists+dri-devel@lfdr.de>; Fri, 24 Jun 2022 08:23:44 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C6545112552;
	Fri, 24 Jun 2022 06:23:39 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-yw1-x1131.google.com (mail-yw1-x1131.google.com
 [IPv6:2607:f8b0:4864:20::1131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5A1CF112552
 for <dri-devel@lists.freedesktop.org>; Fri, 24 Jun 2022 06:23:38 +0000 (UTC)
Received: by mail-yw1-x1131.google.com with SMTP id
 00721157ae682-3177e60d980so14956927b3.12
 for <dri-devel@lists.freedesktop.org>; Thu, 23 Jun 2022 23:23:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=1pWYuiEty7n8qfKXbe+MlxripfjF42zMy4YaNonGDYE=;
 b=LWlf67Kpn5DO70LzfZDzY/86k3RghUlz3LHvmFCRfp9vgWrB54PqfNu2vRF/Bdm7wc
 ap99VK+4MQUQ+6cin3CVK00IbKjFwKj9hJY00FJWKZ+T6+Tsx1JzMXtnbwqHGT3mulUt
 H0L5JKLz7ywUjS16o9iBqqT0TcachObVtQ0ucF3TSwp90e9HmJH9RNV0ZQ6J68d/kYAX
 nEwFuUDUzDBezOwyq+6kVSYL3YCsnU3Px78klL9yrKaUWJlgIKUKeZJtWjG29iFkSFiR
 pek0U91njY9MeCQ1UyKutB0l8JPIg8lysMDZ0xBMr3cTNS7GpTVSDFQe1FKYX2yHrOFZ
 WIvg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=1pWYuiEty7n8qfKXbe+MlxripfjF42zMy4YaNonGDYE=;
 b=E81hRtKaBz60q/8/dZTvjFoR/mhTJeQSHsOIVuihpcifA1d5Fc6xRhqzsrom2Y5UZM
 YUx4s+EHUqcfMV8do83RkudyHjbP7zBzB8PZ8IX94ajx6KRZZAP+PcDLleoAWZ3GridN
 NhuA4wFS4/8otGTY1jL8FJ5CzT2w7JLUqpOgv8BNCI2jrf7+ondiz0/al95FR2sEMH9E
 8yr2ty0LFDAeXEQ7miz3Hy7QAf/kwryOhdrSc7tL/2rb/tu4eu+NJEwfcHLfc2KPfjML
 qxwM2/gQEgt6b6DmRNPYTZndjlKJkSRN4BSHJ9dBVVxeWFHKR3raeF0pdz67xbuCSide
 bmVQ==
X-Gm-Message-State: AJIora9ZRl1kus9Asi7RLVhNIVBzqGK5JeF8MxfnAG/q2tH9rSOSPM+2
 idfQcckGHUKhFsrDviG2hlJjLcgPktfFxr5OaChjxA==
X-Google-Smtp-Source: AGRyM1ugT6Af5nX5Ixp3Ow5c+O9Je/TdD9Y/945uEnJCiYAwQr3zWQy2YOg5odN0QU1EceYIiYefh3gmTCwAPJv1mBE=
X-Received: by 2002:a81:6587:0:b0:318:38c2:2fb1 with SMTP id
 z129-20020a816587000000b0031838c22fb1mr14986240ywb.118.1656051817552; Thu, 23
 Jun 2022 23:23:37 -0700 (PDT)
MIME-Version: 1.0
References: <20220623115631.22209-1-peterwu.pub@gmail.com>
 <20220623115631.22209-13-peterwu.pub@gmail.com>
In-Reply-To: <20220623115631.22209-13-peterwu.pub@gmail.com>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Fri, 24 Jun 2022 08:23:26 +0200
Message-ID: <CACRpkdZatfOFmeGXepTrjAk1or4W6KNUEaXnP+srRebfM=52AA@mail.gmail.com>
Subject: Re: [PATCH v3 12/14] leds: mt6370: Add Mediatek MT6370 current sink
 type LED Indicator support
To: ChiaEn Wu <peterwu.pub@gmail.com>
Content-Type: text/plain; charset="UTF-8"
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
Cc: linux-fbdev@vger.kernel.org, heikki.krogerus@linux.intel.com,
 krzysztof.kozlowski+dt@linaro.org, alice_chen@richtek.com,
 linux-iio@vger.kernel.org, dri-devel@lists.freedesktop.org,
 lgirdwood@gmail.com, cy_huang@richtek.com, pavel@ucw.cz, lee.jones@linaro.org,
 linux-leds@vger.kernel.org, daniel.thompson@linaro.org, deller@gmx.de,
 chunfeng.yun@mediatek.com, linux@roeck-us.net, devicetree@vger.kernel.org,
 linux-pm@vger.kernel.org, szunichen@gmail.com, chiaen_wu@richtek.com,
 broonie@kernel.org, linux-mediatek@lists.infradead.org, matthias.bgg@gmail.com,
 linux-arm-kernel@lists.infradead.org, jingoohan1@gmail.com,
 linux-usb@vger.kernel.org, sre@kernel.org, linux-kernel@vger.kernel.org,
 robh+dt@kernel.org, gregkh@linuxfoundation.org, jic23@kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi ChiaEn!

Thanks for your patch!

On Thu, Jun 23, 2022 at 1:58 PM ChiaEn Wu <peterwu.pub@gmail.com> wrote:

> From: ChiYuan Huang <cy_huang@richtek.com>
>
> Add Mediatek MT6370 current sink type LED Indicator driver.
>
> Signed-off-by: ChiYuan Huang <cy_huang@richtek.com>
(...)
>  drivers/leds/Kconfig       |  11 +
>  drivers/leds/Makefile      |   1 +
>  drivers/leds/leds-mt6370.c | 989 +++++++++++++++++++++++++++++++++++++++++++++

There is a drivers/leds/flash subdirectory these days, put the driver
in that directory instead.

Yours,
Linus Walleij
