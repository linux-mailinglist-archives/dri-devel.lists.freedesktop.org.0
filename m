Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 8669A4A4C8D
	for <lists+dri-devel@lfdr.de>; Mon, 31 Jan 2022 17:55:59 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1AE3510E1FD;
	Mon, 31 Jan 2022 16:55:57 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-il1-x12a.google.com (mail-il1-x12a.google.com
 [IPv6:2607:f8b0:4864:20::12a])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3FEE510E1FD
 for <dri-devel@lists.freedesktop.org>; Mon, 31 Jan 2022 16:55:56 +0000 (UTC)
Received: by mail-il1-x12a.google.com with SMTP id y17so11961905ilm.1
 for <dri-devel@lists.freedesktop.org>; Mon, 31 Jan 2022 08:55:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=2YAk2qmL1jvKsAvHFxP+29GfF6Oz1VRnK3+46u7RjKg=;
 b=l4jC6Fnvz4YWeocB1LDcxqIYS1XhOhwypDQk9XyVGOfwBi9dxSsAf/3+ql8devyalw
 1Ov0Ww3huiiRc9tzmqI2mpZ5w66MUcOHqg2RZvBVZNBKTfFWLGNJAFwyQ/BnEVWdXjMo
 6R1UPzgaiOgOMljHT1KBW9dC/G2EJvKqSpJXs=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=2YAk2qmL1jvKsAvHFxP+29GfF6Oz1VRnK3+46u7RjKg=;
 b=LUX0nZlelzdSIwileCDoGFxj4GqGAL7cOsyfCT1B9QtB47cB5HH1LAYicmoSx66SHg
 F725xZ36+oiKQGbSpuvRlXR/26Bg7pP8SAcrKm3YLb3wV15I/4S1oE+v/MaGUSidlwYx
 CUr7C2eEpGoPXI+3R8XEUga0syV7fLnCcHVhbGq9V8sIgS4ufUqyeAr8P6c/LCu2WBCh
 8nBvavg9MmAKiUjOeIuotUujvJnOU5Jhe6bHhUy5WCVzzJ4eRGcQMtmv8fhE7icBRj3e
 nD/1XfBlVXC61VAZ9kIx3gEkby5kGHeldQ7uaAAJAJYpbjiZvTluuYK5OV7UwDCTt9ku
 x/VA==
X-Gm-Message-State: AOAM530I24/JSglgv2uYdPd1znzbSaskmqgPmjBggvfl9abHx3NKZS9V
 QFn7rKRkDoJzcBukqLyETQBhz/cAOAEaG4o555wPzA==
X-Google-Smtp-Source: ABdhPJyd73gdzNkAKgPqoqagZosOcDjuFtL0VeW7Y8IsXZcflCr0xQ+DJqfmx/F4zZ5QP13j90ibe75mUlj2Y2lugZc=
X-Received: by 2002:a05:6e02:12e6:: with SMTP id
 l6mr12825345iln.10.1643648155481; 
 Mon, 31 Jan 2022 08:55:55 -0800 (PST)
MIME-Version: 1.0
References: <20220114091502.333083-1-allen.chen@ite.com.tw>
 <f4696a8d-5c1d-1007-7814-b2e6cbe334ae@collabora.com>
 <CAG3jFytN9iu0BteAxFCLVRorxM20Q3Zrfn1T4k8bnDYy5oL7bg@mail.gmail.com>
In-Reply-To: <CAG3jFytN9iu0BteAxFCLVRorxM20Q3Zrfn1T4k8bnDYy5oL7bg@mail.gmail.com>
From: Hsin-Yi Wang <hsinyi@chromium.org>
Date: Tue, 1 Feb 2022 00:55:29 +0800
Message-ID: <CAJMQK-i6M1hwESSA5OJ6TpdBBBEG8K9esSbLv-Xjb_zqCoB5ug@mail.gmail.com>
Subject: Re: [PATCH v11] drm/bridge: add it6505 driver
To: Robert Foss <robert.foss@linaro.org>
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
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
 Jau-Chih Tseng <Jau-Chih.Tseng@ite.com.tw>, David Airlie <airlied@linux.ie>,
 allen <allen.chen@ite.com.tw>, Hermes Wu <Hermes.Wu@ite.com.tw>,
 Neil Armstrong <narmstrong@baylibre.com>,
 open list <linux-kernel@vger.kernel.org>,
 Jernej Skrabec <jernej.skrabec@gmail.com>, Jonas Karlman <jonas@kwiboo.se>,
 "open list:DRM DRIVERS" <dri-devel@lists.freedesktop.org>,
 Andrzej Hajda <andrzej.hajda@intel.com>, Hsin-Yi Wang <hsinyi@google.com>,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Tue, Feb 1, 2022 at 12:37 AM Robert Foss <robert.foss@linaro.org> wrote:
>
> On Thu, 20 Jan 2022 at 16:25, AngeloGioacchino Del Regno
> <angelogioacchino.delregno@collabora.com> wrote:
> >
> > Il 14/01/22 10:14, allen ha scritto:
> > > This adds support for the iTE IT6505.
> > > This device can convert DPI signal to DP output.
> > >
> > > From: Allen Chen <allen.chen@ite.com.tw>
> > > Tested-by: Hsin-yi Wang <hsinyi@chromium.org>
> > > Signed-off-by: Hermes Wu <hermes.wu@ite.com.tw>
> > > Signed-off-by: Allen Chen <allen.chen@ite.com.tw>
> > > ---
> > > v10 -> v11 : remove drm_bridge_new_crtc_state
> > > ---
> > >   drivers/gpu/drm/bridge/Kconfig      |    8 +
> > >   drivers/gpu/drm/bridge/Makefile     |    1 +
> > >   drivers/gpu/drm/bridge/ite-it6505.c | 3352 +++++++++++++++++++++++++++
> > >   3 files changed, 3361 insertions(+)
> > >   create mode 100644 drivers/gpu/drm/bridge/ite-it6505.c
> > >
> >
> > ...snip...
> >
> > > +static const struct of_device_id it6505_of_match[] = {
> > > +     { .compatible = "ite,it6505" },
> > > +     { }
> > > +};
> >
> > If you want to have a DT compatible and DT properties, you have to also add
> > dt-bindings (yaml) for this driver, otherwise, any SoC/device DT will fail
> > the dt binding check.... So, please, add that.
>
> Let me second this. A dt-binding is needed for this driver to be
> complete, it functions as both documentation and a way to test the DTS
> that use this device, so it is really important.
>
The binding seems to be accepted before the driver:
https://elixir.bootlin.com/linux/v5.16.4/source/Documentation/devicetree/bindings/display/bridge/ite,it6505.yaml

> >
> > For the driver by itself, though:
> >
> > Acked-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
> >
> > > +
> > > +static struct i2c_driver it6505_i2c_driver = {
> > > +     .driver = {
> > > +             .name = "it6505",
> > > +             .of_match_table = it6505_of_match,
> > > +             .pm = &it6505_bridge_pm_ops,
> > > +     },
> > > +     .probe = it6505_i2c_probe,
> > > +     .remove = it6505_i2c_remove,
> > > +     .shutdown = it6505_shutdown,
> > > +     .id_table = it6505_id,
> > > +};
> > > +
> > > +module_i2c_driver(it6505_i2c_driver);
> > > +
> > > +MODULE_AUTHOR("Allen Chen <allen.chen@ite.com.tw>");
> > > +MODULE_DESCRIPTION("IT6505 DisplayPort Transmitter driver");
> > > +MODULE_LICENSE("GPL v2");
> > >
> >
