Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 06A5A53096C
	for <lists+dri-devel@lfdr.de>; Mon, 23 May 2022 08:25:22 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0935110E67D;
	Mon, 23 May 2022 06:25:09 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ej1-x633.google.com (mail-ej1-x633.google.com
 [IPv6:2a00:1450:4864:20::633])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DCF3F10E59C
 for <dri-devel@lists.freedesktop.org>; Fri, 20 May 2022 11:31:50 +0000 (UTC)
Received: by mail-ej1-x633.google.com with SMTP id m20so15025772ejj.10
 for <dri-devel@lists.freedesktop.org>; Fri, 20 May 2022 04:31:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bgdev-pl.20210112.gappssmtp.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=0NvptFqrj7j0InVdvvMmgqzBzN84J9LRB794rQxkFdY=;
 b=re4Sm8tWAvFHp6bKgAYMf09Z79Kgi3OEdhOIiBZ7/Rn2QXbgu5Ly14y4/nQN7Y/aTo
 VlgbB9yG7Rlr2cuoabCyBxc2bGDLVKK0lXBLnASl6zsHCcOeA+1KzIBeqFsR+y75i5XZ
 XvFFiPa9GJ2QyyaAdSmJuFi5RyYukwsFD78F77Gu/KxBhoXO8QeL/xhxXqgh8n2pVQ16
 5uSsdoWXuRrwj+2ip8smJzRExeR9DRqgQ7nZOdTto/19ei6AXbORk/Mx4Jr1TH0FheIZ
 Rjk53cTk2OReyJUGfCv97XHsZ5d+q5q5c0jA2xxlOnKUomCD8mRuslxc9zsWStq2ZrCv
 ptCw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=0NvptFqrj7j0InVdvvMmgqzBzN84J9LRB794rQxkFdY=;
 b=ZVAbQ4mBwtAYl0zXjtfqiU0P2Rj6SOnmBa+i/JK2IW8r6IZ6PVeKoS3nU16R6dHbI/
 BjaBd3WUbDOZtSFbpAU+1zz4n34x1dzJZXItMqD2gIo5A+JLkxjumyc4clMAGTLplp51
 9wCTmvemIboH5BR1qihaz7OnbePUlK9RhBx1bnbJ1QtqdeDVhSORL8Ceq4yGA0lAL/yd
 BtVCoL7ntUEPR2CQpiV1hqg555Pka9CKQe3qvaPqhTVti4TtrT9LiiLdz7txTMqXKUDe
 ntCM0RpRAeKqjIWH1/TZteJygHb2jHGbl68pDhuIBp6pxf4tbmrGRcN0FU7RmcP1hYk0
 nbyQ==
X-Gm-Message-State: AOAM531srjQCSUMS1qF6YXTLwq62bvHRQ70FkZf/a2tyaOEWo+EfozXg
 twT9EPUNs84G66fiRTuLYKVlVxS4ZJXv3cU2i1ikPg==
X-Google-Smtp-Source: ABdhPJyAADo7d4aXCmDNCVnTVXprJXf99iw8JPsCwtJN6tP2yH5Av5Yx22hVAD/QFIma8grUrwXZC/mCf6Av3T8PJbw=
X-Received: by 2002:a17:907:6eab:b0:6fe:b5e2:7b0e with SMTP id
 sh43-20020a1709076eab00b006feb5e27b0emr1053811ejc.736.1653046309443; Fri, 20
 May 2022 04:31:49 -0700 (PDT)
MIME-Version: 1.0
References: <20220519211411.2200720-1-robh@kernel.org>
In-Reply-To: <20220519211411.2200720-1-robh@kernel.org>
From: Bartosz Golaszewski <brgl@bgdev.pl>
Date: Fri, 20 May 2022 13:31:38 +0200
Message-ID: <CAMRc=McjvTE27BMbN-_W+Fdd7CJcswZQYsB-4N8cj=WfAQ9QOQ@mail.gmail.com>
Subject: Re: [PATCH] dt-bindings: Fix properties without any type
To: Rob Herring <robh@kernel.org>
Content-Type: text/plain; charset="UTF-8"
X-Mailman-Approved-At: Mon, 23 May 2022 06:25:06 +0000
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
Cc: Linux-ALSA <alsa-devel@alsa-project.org>,
 "open list:USB SUBSYSTEM" <linux-usb@vger.kernel.org>,
 linux-pci@vger.kernel.org,
 "open list:DRM PANEL DRIVERS" <dri-devel@lists.freedesktop.org>,
 Thierry Reding <thierry.reding@gmail.com>, Guenter Roeck <groeck@chromium.org>,
 Sam Ravnborg <sam@ravnborg.org>, chrome-platform@lists.linux.dev,
 Herbert Xu <herbert@gondor.apana.org.au>, linux-serial@vger.kernel.org,
 Linux Input <linux-input@vger.kernel.org>, Jakub Kicinski <kuba@kernel.org>,
 Paolo Abeni <pabeni@redhat.com>,
 Linux Media Mailing List <linux-media@vger.kernel.org>,
 devicetree <devicetree@vger.kernel.org>,
 Linux PM list <linux-pm@vger.kernel.org>, Kalle Valo <kvalo@kernel.org>,
 "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
 Mark Brown <broonie@kernel.org>, Matt Mackall <mpm@selenic.com>,
 Bjorn Helgaas <bhelgaas@google.com>,
 Mauro Carvalho Chehab <mchehab@kernel.org>,
 Linux ARM <linux-arm-kernel@lists.infradead.org>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Dmitry Torokhov <dmitry.torokhov@gmail.com>,
 Sebastian Reichel <sre@kernel.org>, Peter Rosin <peda@axentia.se>,
 "open list:HARDWARE RANDOM NUMBER GENERATOR CORE"
 <linux-crypto@vger.kernel.org>, netdev <netdev@vger.kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>,
 "David S. Miller" <davem@davemloft.net>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Thu, May 19, 2022 at 11:14 PM Rob Herring <robh@kernel.org> wrote:
>
> Now that the schema tools can extract type information for all
> properties (in order to decode dtb files), finding properties missing
> any type definition is fairly trivial though not yet automated.
>
> Fix the various property schemas which are missing a type. Most of these
> tend to be device specific properties which don't have a vendor prefix.
> A vendor prefix is how we normally ensure a type is defined.
>
> Signed-off-by: Rob Herring <robh@kernel.org>
> ---
>  .../arm/hisilicon/controller/hip04-bootwrapper.yaml       | 5 +++--
>  .../bindings/display/bridge/toshiba,tc358768.yaml         | 1 +
>  .../devicetree/bindings/display/panel/panel-timing.yaml   | 5 +++++
>  .../bindings/display/panel/raydium,rm67191.yaml           | 1 +
>  .../bindings/display/panel/samsung,s6e8aa0.yaml           | 1 +
>  .../devicetree/bindings/gpio/fairchild,74hc595.yaml       | 1 +
>  .../devicetree/bindings/input/google,cros-ec-keyb.yaml    | 1 +
>  .../devicetree/bindings/input/matrix-keymap.yaml          | 4 ++++
>  Documentation/devicetree/bindings/media/i2c/adv7604.yaml  | 3 ++-
>  Documentation/devicetree/bindings/mux/reg-mux.yaml        | 8 ++++++--
>  Documentation/devicetree/bindings/net/cdns,macb.yaml      | 1 +
>  Documentation/devicetree/bindings/net/ingenic,mac.yaml    | 1 +
>  .../devicetree/bindings/net/ti,davinci-mdio.yaml          | 1 +
>  .../devicetree/bindings/net/wireless/ti,wlcore.yaml       | 2 ++
>  .../devicetree/bindings/pci/snps,dw-pcie-ep.yaml          | 6 ++++--
>  Documentation/devicetree/bindings/pci/snps,dw-pcie.yaml   | 2 ++
>  .../devicetree/bindings/pinctrl/canaan,k210-fpioa.yaml    | 2 ++
>  Documentation/devicetree/bindings/power/avs/qcom,cpr.yaml | 1 +
>  .../devicetree/bindings/power/supply/battery.yaml         | 7 ++++++-
>  .../devicetree/bindings/power/supply/charger-manager.yaml | 1 +
>  Documentation/devicetree/bindings/rng/st,stm32-rng.yaml   | 1 +
>  Documentation/devicetree/bindings/serial/8250.yaml        | 1 +
>  .../devicetree/bindings/sound/audio-graph-card2.yaml      | 3 +++
>  .../devicetree/bindings/sound/imx-audio-hdmi.yaml         | 3 +++
>  Documentation/devicetree/bindings/usb/smsc,usb3503.yaml   | 1 +
>  25 files changed, 55 insertions(+), 8 deletions(-)
>

For GPIO:

Acked-by: Bartosz Golaszewski <brgl@bgdev.pl>
