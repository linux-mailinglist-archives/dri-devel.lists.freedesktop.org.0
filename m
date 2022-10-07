Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 1AEDF5F77AF
	for <lists+dri-devel@lfdr.de>; Fri,  7 Oct 2022 13:52:11 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AF0D110E030;
	Fri,  7 Oct 2022 11:52:03 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pg1-x52d.google.com (mail-pg1-x52d.google.com
 [IPv6:2607:f8b0:4864:20::52d])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B3C4410E94E
 for <dri-devel@lists.freedesktop.org>; Fri,  7 Oct 2022 11:52:00 +0000 (UTC)
Received: by mail-pg1-x52d.google.com with SMTP id j71so4487696pge.2
 for <dri-devel@lists.freedesktop.org>; Fri, 07 Oct 2022 04:52:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=US3Gb047SY8Dq4+eZYrFm7pCYLCCqm5ow/t9m2ICNWQ=;
 b=SAknEYDrNdrqAMzs7OhKIzQZfKbR2T+lY36/60vHTGYv9PIKFpzA+Acn/I0djXEHbu
 mKkq6CPFcqt50Zn5OHGXU16oDhZ+rNajeqCypfD0nrbOBln5h/b66KWQkMf7npSYmX4Y
 1gUUluiiQ1fA7d7gb6HQ2Y7q4FVGhRfGYtImTAuIZplJEGCFkdslARV8OcKTCqwDb+ii
 C2bnc6dZ1qAQ3EvHEE9Rri62nx1t0FOKxXAwf90irjfNYuDsA4ehy19894ohiCTC6xj/
 hYnWGTDXxBYjo1B3YOGm2zYpWUH0cdYOJRwpKOSjoCQ9Wrzq3MamEO7wed/d8x/q8BaJ
 Dtrw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=US3Gb047SY8Dq4+eZYrFm7pCYLCCqm5ow/t9m2ICNWQ=;
 b=BAAMpTyF5hj4sLALH8+G0MmYS2Ez6S3nmyewrUjOQzNVwlXQHln+mKYBNccGwB7TuV
 kWQ/96Dnha0FRod0LgCm6a1ZPdee/G4Mij1flOyg78B3rsUb45VRFpqi8JCcnr7pVQ6c
 76IALJzQF1gqpKoBz4ch/y8C4QSFiIY6v0biMTtQJ5phIsiTx9WL5ariXevsT64M43Tq
 bMNaET0j+g6zut9K4FpgBCTzBMZij8tij9uSjHczaNvap0B1IzZQ8OpEanpJv5LhQpHX
 MZk0/pmZlSe0yIXd1FS8sESSkVLx+IHJU0kK3lJr93vnkJBhpZr8De2NZFOd9q5VjQ9N
 BYAg==
X-Gm-Message-State: ACrzQf0tlLfkg9q1jGJV6IQUG0bIjaZpXgipBNH4h/4pICxOgHmGD7qi
 N5uE7COCS4lenui0rL/GSmBMS7TNlO2THEou/zY=
X-Google-Smtp-Source: AMsMyM5bKM2n6T9R0fdy+E1igkb+3XmtmmLUSaAs2cCs5UN+499nLVCEvgNIqFTs88aNq59nky0o/a3tEdudon8s7+4=
X-Received: by 2002:a62:144b:0:b0:562:38de:9a0e with SMTP id
 72-20020a62144b000000b0056238de9a0emr4845862pfu.78.1665143520248; Fri, 07 Oct
 2022 04:52:00 -0700 (PDT)
MIME-Version: 1.0
References: <20221007111442.51481-1-a5b6@riseup.net>
 <20221007111442.51481-2-a5b6@riseup.net>
In-Reply-To: <20221007111442.51481-2-a5b6@riseup.net>
From: Fabio Estevam <festevam@gmail.com>
Date: Fri, 7 Oct 2022 08:51:45 -0300
Message-ID: <CAOMZO5C3PgvV6uoOZ_2iO8=QpE6bHzquo-hxNV4QgX6EmpcUGQ@mail.gmail.com>
Subject: Re: [PATCH v2 1/2] drivers: gpu: drm: add driver for samsung
 s6e3fc2x01 cmd mode panel
To: Nia Espera <a5b6@riseup.net>
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
Cc: David Airlie <airlied@linux.ie>, linux-arm-msm@vger.kernel.org,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 Caleb Connolly <caleb@connolly.tech>,
 Thierry Reding <thierry.reding@gmail.com>,
 ~postmarketos/upstreaming@lists.sr.ht, phone-devel@vger.kernel.org,
 Sam Ravnborg <sam@ravnborg.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Nia,

On Fri, Oct 7, 2022 at 8:16 AM Nia Espera <a5b6@riseup.net> wrote:

> +static int samsung_s6e3fc2x01_prepare(struct drm_panel *panel)
> +{
> +       struct samsung_s6e3fc2x01 *ctx = to_samsung_s6e3fc2x01(panel);
> +       struct device *dev = &ctx->dsi->dev;
> +       int ret;
> +
> +       if (ctx->prepared)
> +               return 0;
> +
> +       ret = regulator_enable(ctx->supply);
> +       if (ret < 0) {
> +               dev_err(dev, "Failed to enable regulator: %d\n", ret);
> +               return ret;
> +       }
> +
> +       samsung_s6e3fc2x01_reset(ctx);
> +
> +       ret = samsung_s6e3fc2x01_on(ctx);
> +       if (ret < 0) {
> +               dev_err(dev, "Failed to initialize panel: %d\n", ret);
> +               gpiod_set_value_cansleep(ctx->reset_gpio, 1);

You should also call regulator_disable() here in the case of failure.

> +static int samsung_s6e3fc2x01_unprepare(struct drm_panel *panel)
> +{
> +       struct samsung_s6e3fc2x01 *ctx = to_samsung_s6e3fc2x01(panel);
> +       struct device *dev = &ctx->dsi->dev;
> +       int ret;
> +
> +       if (!ctx->prepared)
> +               return 0;
> +
> +       ret = samsung_s6e3fc2x01_off(ctx);
> +       if (ret < 0)
> +               dev_err(dev, "Failed to un-initialize panel: %d\n", ret);
> +
> +       gpiod_set_value_cansleep(ctx->reset_gpio, 1);

regulator_disable() should be called here as well.
