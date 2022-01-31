Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 4125A4A4E84
	for <lists+dri-devel@lfdr.de>; Mon, 31 Jan 2022 19:37:00 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 04C0110E2C8;
	Mon, 31 Jan 2022 18:36:55 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pj1-x102b.google.com (mail-pj1-x102b.google.com
 [IPv6:2607:f8b0:4864:20::102b])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9E11810E2C8
 for <dri-devel@lists.freedesktop.org>; Mon, 31 Jan 2022 18:36:53 +0000 (UTC)
Received: by mail-pj1-x102b.google.com with SMTP id
 s2-20020a17090ad48200b001b501977b23so626pju.2
 for <dri-devel@lists.freedesktop.org>; Mon, 31 Jan 2022 10:36:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=jVP1HoXA+fkjiP7dYZEx1JX7fEwo0mBNJ8T54jUWwpw=;
 b=XfhmwR2k8wqx6HUMq6ZupVxiE0Wdd7dCjnqYGD7rZZuDiyRZFhEpyT3IU+nyUz+Tge
 qPQCJxrP3ecoE6CXTV5vRrCVepB8RHbRptQtQf4d/GUg9z/3fpFD25W6GclQxbGIpkmf
 P4kYt8Xw+mhsiezNivRxgw1rhC63mmCkzWeRLJgKciEaPpsWmQNpJ9Bj/Z0es+p9rUfI
 5FZ7kFPCUwATfhF6oKx8iM7CM1Hn9Qo7776Vnjtil3VXt80RvtUziCWWkwHa1uonkDkc
 B8NioUeunqVoGvNGpm8YeeroaXqZ5ijGO5nHrcqIIs/Yf6RL/DOUlREz30cV1arb7fLl
 +T0g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=jVP1HoXA+fkjiP7dYZEx1JX7fEwo0mBNJ8T54jUWwpw=;
 b=qHsQS+m/ok78MsIeNYNGROhzLCu6OQMMHO49AzY1luJq9mgFmQJnYPQvwFR5Wv1RMD
 p2WuwrHq3YGZH1SzScCesBbebCLwzIhbLn9SHrpbzalA4rRwGZbCrEUOn+1dIryOTjsq
 M0sr8RAgccOLTXlOXb1CofWbblSLA5fXpE/U9xm0+S5D6bt+z3DBYB7wP2hnoQtUM+0M
 OmEUlS/ECbg3DhSPKJo16aj0l0VDKh8kne+nz/4B4rpyo3tCozKxoCfaiwH085Mdw8I5
 XcNLmiz1eL3HSwMrSbiCVzsw/nd9PlYhMTOua50j2GjpwNs8Ib+ZqHPUeVHmFSA8vxFK
 7IZA==
X-Gm-Message-State: AOAM531E1Bl1v4tOuoOkjRXeS0FdSHuI+LoDpMTlDQpDeHt9Ft01ncDS
 BDG+8jVpFNJxO+/GbFcRMTg6URKMoz4gBSfjpe2jnw==
X-Google-Smtp-Source: ABdhPJxCbA+UQG5DBRt46s+7C8j0EEXnshLl5hVCa52l6TVZnQPrsgHmMu98JhjPS4p0imQZYu4Q5i9X4KXBxLVSHgg=
X-Received: by 2002:a17:90b:1802:: with SMTP id
 lw2mr26223360pjb.232.1643654213164; 
 Mon, 31 Jan 2022 10:36:53 -0800 (PST)
MIME-Version: 1.0
References: <20220114091502.333083-1-allen.chen@ite.com.tw>
 <f4696a8d-5c1d-1007-7814-b2e6cbe334ae@collabora.com>
 <CAG3jFytN9iu0BteAxFCLVRorxM20Q3Zrfn1T4k8bnDYy5oL7bg@mail.gmail.com>
 <CAJMQK-i6M1hwESSA5OJ6TpdBBBEG8K9esSbLv-Xjb_zqCoB5ug@mail.gmail.com>
In-Reply-To: <CAJMQK-i6M1hwESSA5OJ6TpdBBBEG8K9esSbLv-Xjb_zqCoB5ug@mail.gmail.com>
From: Robert Foss <robert.foss@linaro.org>
Date: Mon, 31 Jan 2022 19:36:41 +0100
Message-ID: <CAG3jFyvgvfjo-HgL8wWWXtaoJvUupd2zJt=neVJZn5uVESyZFA@mail.gmail.com>
Subject: Re: [PATCH v11] drm/bridge: add it6505 driver
To: Hsin-Yi Wang <hsinyi@chromium.org>
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

On Mon, 31 Jan 2022 at 17:55, Hsin-Yi Wang <hsinyi@chromium.org> wrote:
>
> On Tue, Feb 1, 2022 at 12:37 AM Robert Foss <robert.foss@linaro.org> wrote:
> >
> > On Thu, 20 Jan 2022 at 16:25, AngeloGioacchino Del Regno
> > <angelogioacchino.delregno@collabora.com> wrote:
> > >
> > > Il 14/01/22 10:14, allen ha scritto:
> > > > This adds support for the iTE IT6505.
> > > > This device can convert DPI signal to DP output.
> > > >
> > > > From: Allen Chen <allen.chen@ite.com.tw>
> > > > Tested-by: Hsin-yi Wang <hsinyi@chromium.org>
> > > > Signed-off-by: Hermes Wu <hermes.wu@ite.com.tw>
> > > > Signed-off-by: Allen Chen <allen.chen@ite.com.tw>
> > > > ---
> > > > v10 -> v11 : remove drm_bridge_new_crtc_state
> > > > ---
> > > >   drivers/gpu/drm/bridge/Kconfig      |    8 +
> > > >   drivers/gpu/drm/bridge/Makefile     |    1 +
> > > >   drivers/gpu/drm/bridge/ite-it6505.c | 3352 +++++++++++++++++++++++++++
> > > >   3 files changed, 3361 insertions(+)
> > > >   create mode 100644 drivers/gpu/drm/bridge/ite-it6505.c
> > > >
> > >
> > > ...snip...
> > >
> > > > +static const struct of_device_id it6505_of_match[] = {
> > > > +     { .compatible = "ite,it6505" },
> > > > +     { }
> > > > +};
> > >
> > > If you want to have a DT compatible and DT properties, you have to also add
> > > dt-bindings (yaml) for this driver, otherwise, any SoC/device DT will fail
> > > the dt binding check.... So, please, add that.
> >
> > Let me second this. A dt-binding is needed for this driver to be
> > complete, it functions as both documentation and a way to test the DTS
> > that use this device, so it is really important.
> >
> The binding seems to be accepted before the driver:
> https://elixir.bootlin.com/linux/v5.16.4/source/Documentation/devicetree/bindings/display/bridge/ite,it6505.yaml

I completely missed that. In that case we're only missing the
reviewed-by tag from someone.

>
> > >
> > > For the driver by itself, though:
> > >
> > > Acked-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
> > >
> > > > +
> > > > +static struct i2c_driver it6505_i2c_driver = {
> > > > +     .driver = {
> > > > +             .name = "it6505",
> > > > +             .of_match_table = it6505_of_match,
> > > > +             .pm = &it6505_bridge_pm_ops,
> > > > +     },
> > > > +     .probe = it6505_i2c_probe,
> > > > +     .remove = it6505_i2c_remove,
> > > > +     .shutdown = it6505_shutdown,
> > > > +     .id_table = it6505_id,
> > > > +};
> > > > +
> > > > +module_i2c_driver(it6505_i2c_driver);
> > > > +
> > > > +MODULE_AUTHOR("Allen Chen <allen.chen@ite.com.tw>");
> > > > +MODULE_DESCRIPTION("IT6505 DisplayPort Transmitter driver");
> > > > +MODULE_LICENSE("GPL v2");
> > > >
> > >
