Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 6DECB4A4C46
	for <lists+dri-devel@lfdr.de>; Mon, 31 Jan 2022 17:37:19 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F27E810E5A2;
	Mon, 31 Jan 2022 16:37:16 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pf1-x433.google.com (mail-pf1-x433.google.com
 [IPv6:2607:f8b0:4864:20::433])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 83BB510E5A2
 for <dri-devel@lists.freedesktop.org>; Mon, 31 Jan 2022 16:37:15 +0000 (UTC)
Received: by mail-pf1-x433.google.com with SMTP id 192so13320860pfz.3
 for <dri-devel@lists.freedesktop.org>; Mon, 31 Jan 2022 08:37:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=pq2lioXdRgfbbAgrjb+0HwzuycY8mIpT20OJghTqzwk=;
 b=TV/ZHqyoB8BfyZubWHTiSyaTd4Bua2KKp6Wgz7Rx3QwKn5TZ06c6vsokHA3UGOLxZL
 qWV/9fXEn3FqJLBb3Qro2sPIGrnMgLRjPXlsEu8tbjg4Ou23uszuDYI7LvzZ3aF6LON4
 WrjsyTSo3K4SZESxazXNyefQwMNEhKeNcgT6KZcuwzUeOiver0zXC9qBU/iDjf7xq/mA
 Ljl1sNSX07CLemNmdnB9vnLl3icovO3JsF/Tuj4xu/FRcgBIxeKyuonmWfJCDHiJIs8q
 L6XgOVvpf3m15iqIe762QVHp/+IDzYUDntA2QuUVFV+fW9BttgARPXmkbW3SYIcp/AmN
 C3AA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=pq2lioXdRgfbbAgrjb+0HwzuycY8mIpT20OJghTqzwk=;
 b=vM2v4f1fHdX8PjVq1w7rNagTeHxf05tb1o+S99lxsUpfP0SCwKmcZCpZW2/Lwp93D0
 IZTCDjjCBeQh/ldaqlyRau0HBSmH5SG4/I3WUJJNYhcKfDnUJLlaJA+aZjoz/592ebl9
 tBDL9VNwpqIZMUwZ14NAu8JhgsZ1o3AoJQbdsyd9H3nDERwG7gklcQtzCjK5+kp8cLxx
 9MFuvrOA1qUyPaXusFxexXDuqD+xhkTUQnnrJdGI+3JRCvhiUgvLdrIfo0dZrgxqNBNN
 x9kteZG56eHGRC7f7bMgz4gMQZ+MIqo05eKcr8mvuGBKYNuMCOxMUX2kmNnPazEZDaNl
 KZEQ==
X-Gm-Message-State: AOAM532AHaiEkzZMbG028rorXCD2QeyI+Ky4rgWWqnG5SapA3B8YMMsQ
 ccnGR5ObqXRYdTPd5LuIN28SYfUTHSVGXZd9DcHWlA==
X-Google-Smtp-Source: ABdhPJxCVjGCmcB+SRLMnrxP4w9hsLJuDvvvXUNn/mVl7jcD6wQqJ/j68/Ao/S71VIOvwOEhPqZ6xemhbuhfGR2YRb4=
X-Received: by 2002:aa7:8490:: with SMTP id u16mr20859502pfn.1.1643647035064; 
 Mon, 31 Jan 2022 08:37:15 -0800 (PST)
MIME-Version: 1.0
References: <20220114091502.333083-1-allen.chen@ite.com.tw>
 <f4696a8d-5c1d-1007-7814-b2e6cbe334ae@collabora.com>
In-Reply-To: <f4696a8d-5c1d-1007-7814-b2e6cbe334ae@collabora.com>
From: Robert Foss <robert.foss@linaro.org>
Date: Mon, 31 Jan 2022 17:37:03 +0100
Message-ID: <CAG3jFytN9iu0BteAxFCLVRorxM20Q3Zrfn1T4k8bnDYy5oL7bg@mail.gmail.com>
Subject: Re: [PATCH v11] drm/bridge: add it6505 driver
To: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
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
Cc: Kenneth Hung <Kenneth.Hung@ite.com.tw>,
 Jau-Chih Tseng <Jau-Chih.Tseng@ite.com.tw>, David Airlie <airlied@linux.ie>,
 allen <allen.chen@ite.com.tw>, Hermes Wu <Hermes.Wu@ite.com.tw>,
 Neil Armstrong <narmstrong@baylibre.com>,
 open list <linux-kernel@vger.kernel.org>,
 "open list:DRM DRIVERS" <dri-devel@lists.freedesktop.org>,
 Jonas Karlman <jonas@kwiboo.se>, Jernej Skrabec <jernej.skrabec@gmail.com>,
 Andrzej Hajda <andrzej.hajda@intel.com>, Hsin-yi Wang <hsinyi@chromium.org>,
 Hsin-Yi Wang <hsinyi@google.com>,
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Thu, 20 Jan 2022 at 16:25, AngeloGioacchino Del Regno
<angelogioacchino.delregno@collabora.com> wrote:
>
> Il 14/01/22 10:14, allen ha scritto:
> > This adds support for the iTE IT6505.
> > This device can convert DPI signal to DP output.
> >
> > From: Allen Chen <allen.chen@ite.com.tw>
> > Tested-by: Hsin-yi Wang <hsinyi@chromium.org>
> > Signed-off-by: Hermes Wu <hermes.wu@ite.com.tw>
> > Signed-off-by: Allen Chen <allen.chen@ite.com.tw>
> > ---
> > v10 -> v11 : remove drm_bridge_new_crtc_state
> > ---
> >   drivers/gpu/drm/bridge/Kconfig      |    8 +
> >   drivers/gpu/drm/bridge/Makefile     |    1 +
> >   drivers/gpu/drm/bridge/ite-it6505.c | 3352 +++++++++++++++++++++++++++
> >   3 files changed, 3361 insertions(+)
> >   create mode 100644 drivers/gpu/drm/bridge/ite-it6505.c
> >
>
> ...snip...
>
> > +static const struct of_device_id it6505_of_match[] = {
> > +     { .compatible = "ite,it6505" },
> > +     { }
> > +};
>
> If you want to have a DT compatible and DT properties, you have to also add
> dt-bindings (yaml) for this driver, otherwise, any SoC/device DT will fail
> the dt binding check.... So, please, add that.

Let me second this. A dt-binding is needed for this driver to be
complete, it functions as both documentation and a way to test the DTS
that use this device, so it is really important.

>
> For the driver by itself, though:
>
> Acked-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
>
> > +
> > +static struct i2c_driver it6505_i2c_driver = {
> > +     .driver = {
> > +             .name = "it6505",
> > +             .of_match_table = it6505_of_match,
> > +             .pm = &it6505_bridge_pm_ops,
> > +     },
> > +     .probe = it6505_i2c_probe,
> > +     .remove = it6505_i2c_remove,
> > +     .shutdown = it6505_shutdown,
> > +     .id_table = it6505_id,
> > +};
> > +
> > +module_i2c_driver(it6505_i2c_driver);
> > +
> > +MODULE_AUTHOR("Allen Chen <allen.chen@ite.com.tw>");
> > +MODULE_DESCRIPTION("IT6505 DisplayPort Transmitter driver");
> > +MODULE_LICENSE("GPL v2");
> >
>
