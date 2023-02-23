Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 60C276A0AB9
	for <lists+dri-devel@lfdr.de>; Thu, 23 Feb 2023 14:36:15 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 77D8510EB81;
	Thu, 23 Feb 2023 13:36:13 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-io1-xd2e.google.com (mail-io1-xd2e.google.com
 [IPv6:2607:f8b0:4864:20::d2e])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1745F10EB81
 for <dri-devel@lists.freedesktop.org>; Thu, 23 Feb 2023 13:36:11 +0000 (UTC)
Received: by mail-io1-xd2e.google.com with SMTP id t129so1880032iof.12
 for <dri-devel@lists.freedesktop.org>; Thu, 23 Feb 2023 05:36:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=PljBaFwsOSiSajmSlW90uY5IAqYtGowFmvaV1Snd28o=;
 b=aghVqa0j350UpMSo80F/OvikYrBe+DeIfqUhFuWit/Y3cFWt0d87987aGDYP1QY7th
 dLAh1IxLwAL2KoWKKyY84gApMjNO2hRhr3zJ5NDCbGUoZEQscH+0cxlWxRVuDOVk2uGE
 oGNmC97taMtCBsJJwx5X332w7LFW7fvpbxf1M=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=PljBaFwsOSiSajmSlW90uY5IAqYtGowFmvaV1Snd28o=;
 b=GF1NsEaZmJSp35i1WlEzeyPGcFgNiwTqTBS5YMTBGbEK9/W42EhZkJfrBZIQnslOlB
 mhXIYvEgupuG4lYCGJ2xIA830GbhQ53XD1/6hHt/C1FY1t4tbNBFo73+xmQ3/xiGAuM2
 bxbTPsPjwyPvpkg5EBih6Jevzw+bhBn7XGVC2Pzq6BxtvYivvKPL9pESg7Il6QrG0e/V
 hsW+up6fbMwlCnuzRPg20t3lp2bkTgHJOkj+xFUEGSi39Daso25KaGC3ZFjzjtowcaEN
 33992c8yfX92czregbn0LmKDx6gOF9NNLUNpETW19vLx8mI8Y39EO3d2g996NhxZFnbN
 rMGw==
X-Gm-Message-State: AO0yUKXm5sMn3zvrn0lboeW9fQSKyqssuPxpdg7JfEgRZnzLWNKeKS4v
 nzO6ZH82wzttcOyumfvU6PhI7kGQuNxqVReOgcTtRQ==
X-Google-Smtp-Source: AK7set/mpYjZt1gR0m0p7QIkrMVPg+zxHDJsHk5bPOYLBOek2gQrZmEZtY4dYkIvYNlcS5eykCYem+K5vAxatmG+zfU=
X-Received: by 2002:a6b:d205:0:b0:71a:5a1f:544c with SMTP id
 q5-20020a6bd205000000b0071a5a1f544cmr1188867iob.5.1677159370385; Thu, 23 Feb
 2023 05:36:10 -0800 (PST)
MIME-Version: 1.0
References: <20230218111712.2380225-1-treapking@chromium.org>
 <20230218111712.2380225-2-treapking@chromium.org>
 <20230221154124.GA2584323-robh@kernel.org>
In-Reply-To: <20230221154124.GA2584323-robh@kernel.org>
From: Pin-yen Lin <treapking@chromium.org>
Date: Thu, 23 Feb 2023 21:35:59 +0800
Message-ID: <CAEXTbpctOtgE8uQJ7Bb8-ZRSjEwzQcQDegm1AuWfMmtDV0EbwA@mail.gmail.com>
Subject: Re: [PATCH v3 1/5] dt-bindings: display: bridge: Add ddc-i2c-bus for
 anx7688
To: Rob Herring <robh@kernel.org>
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
Cc: Neil Armstrong <neil.armstrong@linaro.org>,
 Nicolas Boichat <drinkcat@chromium.org>, Robert Foss <rfoss@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Jonas Karlman <jonas@kwiboo.se>, Benson Leung <bleung@chromium.org>,
 dri-devel@lists.freedesktop.org, linux-mediatek@lists.infradead.org,
 linux-kernel@vger.kernel.org, Jernej Skrabec <jernej.skrabec@gmail.com>,
 Guenter Roeck <groeck@chromium.org>, devicetree@vger.kernel.org,
 Matthias Brugger <matthias.bgg@gmail.com>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Andrzej Hajda <andrzej.hajda@intel.com>,
 Chun-Kuang Hu <chunkuang.hu@kernel.org>, chrome-platform@lists.linux.dev,
 linux-arm-kernel@lists.infradead.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

(Resend this with plaintext mode. Sorry for the previous spam.)

Hi Rob,

After some internal discussions, we decided to drop this series
because the driver is trying to do runtime routing of the display
signals, which is not supported by the current DRM system, even if we
can describe the design in the device tree. I'm explaining our use
case as a record, and I can follow up on the mtk_hdmi.c change if
anyone is interested.

The more detailed schematics looks like:
   +----------+    +----------------+    +-----------+
   |   MTK    |    |                |    |   HDMI    |
   |   HDMI   +--->|    TS3DV642    +--->| connector |
   |  bridge  |    |                |    +-----------+
   +----------+    |                |
                   |    HDMI MUX    |    +-------------+
                   |                |    |  anx7688    |   +-----------+
   +----------+    |                |    |  HDMI to DP |   |  USB-C    |
   | cros EC  +--->|                +--->|  bridge     +-->| connector |
   +----------+    +----------------+    +-------------+   +-----------+

The TS3DV642 HDMI MUX is controlled by the CrOS EC to switch the HDMI
signal between two output ports, and the generic-display-mux driver
was trying to control the downstream bridges according to the GPIO
status reported by EC. However, as far as I know, this kind of runtime
routing is not supported by DRM.

And, it can work fine if we only describe the following design in DT:

  +---------+   +-------------+   +-----------+
  |  MTK    |   |  anx7688    |   |  USB-C    |
  |  HDMI   +-->|  HDMI to DP +-->| connector |
  |  bridge |   |  bridge     |   +-----------+
  +---------+   +-------------+

This can work because the anx7688 driver won't reject any display
modes when the DP lane count is 0 ([1]), which is true when the HDMI
connector is used.

Thanks for your time for reviewing this series and sorry for not
explaining everything clearly at the beginning.

[1]: https://elixir.bootlin.com/linux/v6.2/source/drivers/gpu/drm/bridge/cros-ec-anx7688.c#L87

Regards,
Pin-yen


On Tue, Feb 21, 2023 at 11:41 PM Rob Herring <robh@kernel.org> wrote:
>
> On Sat, Feb 18, 2023 at 07:17:08PM +0800, Pin-yen Lin wrote:
> > Introduce a optional "ddc-i2c-bus" property for anx7688 bridge. This
> > allows the bridge to register a .get_edid callback.
>
> What's .get_edid? This is a binding and is independent of Linux.
>
> >
> > Signed-off-by: Pin-yen Lin <treapking@chromium.org>
> > ---
> >
> > Changes in v3:
> > - New in v3
> >
> >  .../bindings/display/bridge/google,cros-ec-anx7688.yaml      | 5 +++++
> >  1 file changed, 5 insertions(+)
> >
> > diff --git a/Documentation/devicetree/bindings/display/bridge/google,cros-ec-anx7688.yaml b/Documentation/devicetree/bindings/display/bridge/google,cros-ec-anx7688.yaml
> > index a44d025d33bd..9d5ce8172e88 100644
> > --- a/Documentation/devicetree/bindings/display/bridge/google,cros-ec-anx7688.yaml
> > +++ b/Documentation/devicetree/bindings/display/bridge/google,cros-ec-anx7688.yaml
> > @@ -25,6 +25,10 @@ properties:
> >      maxItems: 1
> >      description: I2C address of the device.
> >
> > +  ddc-i2c-bus:
> > +    description: phandle link to the I2C controller used for DDC EDID probing
> > +    $ref: /schemas/types.yaml#/definitions/phandle
> > +
>
> No, this belongs in the connector node. The DDC signals are routed to
> the connector, not the bridge chip.
>
> Rob
