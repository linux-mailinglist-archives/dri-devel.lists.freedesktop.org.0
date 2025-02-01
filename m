Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 7F807A24719
	for <lists+dri-devel@lfdr.de>; Sat,  1 Feb 2025 06:27:19 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 439E110E136;
	Sat,  1 Feb 2025 05:27:16 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="QHhHAgYA";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-yb1-f180.google.com (mail-yb1-f180.google.com
 [209.85.219.180])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 73CEB10E136
 for <dri-devel@lists.freedesktop.org>; Sat,  1 Feb 2025 05:27:14 +0000 (UTC)
Received: by mail-yb1-f180.google.com with SMTP id
 3f1490d57ef6-e5ae3fc15acso805093276.0
 for <dri-devel@lists.freedesktop.org>; Fri, 31 Jan 2025 21:27:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1738387633; x=1738992433; darn=lists.freedesktop.org;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=emzT1Kp7AzEwfFxKgwUWQ/uqx4Iw5IKg65hav48u4j4=;
 b=QHhHAgYAiuDIT7b5+6d1mpUpA5qIVvgEg7syGfM/u5aozsHPDKCoZzxPRxEiSRxlKY
 OmmERWw+FhTWnbY4lgpGl6YnLfnaGMeVI/1yocePk50eGaldj9sp3A8bWj/t0L6FUuDd
 pJFWK133GzKZqQd7Tssi5qCdsRjW78qiJCkFJYepbsQW7r5OZEaHwMjcMK+ZaAApwTxs
 zUBGV9Ix6mnRStTFO35IBozsk34yOg8qU4vJBM23tNZuCRx9eCZUTL/jhWxTl7krxUpr
 +5NJ6cHW9LJFiqLXT1vSgk4PMWpIvNIsulLkl3/5juzmZ3aNhXldEWkiFTq7HA40Wv2C
 hRYQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1738387633; x=1738992433;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=emzT1Kp7AzEwfFxKgwUWQ/uqx4Iw5IKg65hav48u4j4=;
 b=oFwHAkMoUXMFiruuvUzgBvKWz9ubkZa0+4O7DcQinCGW4YzoFR6adSSnF0Ai6RNuhJ
 RxA7VAlzV/jszPNSqVb3LhSfZvH7lJoj/BkQFlM8pJyMjney85P555QOc1016SNo2pCj
 gtIueiBg5iQY1k2ewC40sDODr+8N7fDbGVaW2gtjULspr9sU9NM8zFZVVYi/TurHYs6G
 2GDS+0lOkfj444erC3OFvQXPs4srqp0ZJoJYtHpDbwSaR1CgcIpvp1Rgf6LywATin5/n
 k+K17YoUup9aMdKSr05vOOFUcjhT2M2BhsXcdg0sNG6gnocsH3Xh592i6P9QQXD9u+kB
 8szA==
X-Forwarded-Encrypted: i=1;
 AJvYcCXZxqd4n9uhmQxaVOXqg87AJ+zUxa13Hd/fvcckVAbWdw2oqP8t+VhcMxG0EXH8ld0qy1raedI/YlM=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yy4NnfQL9aAc7LH8eEmjaJNzK02lWJNeigDZyC8IApeZEnU4W9+
 XpAaZD8nDXlIYofoy7yhE2SsKgHaPgIQ010JNJZV9P7fCJVkq/sRJR5h0BiWZHQ59dWPtgdG13P
 7D+IKW0+6vPMoP6c717MiB+oAg5I=
X-Gm-Gg: ASbGncv/qYzU+zeEv6i3GzCPoBRp+mBYIpRBO8hfzyEQnQ4K2dig+Ny1z4oNexQ9Gvn
 ses0mt7tZGdJBOyPdYRSYh7gmAHqQ4jOjI7dJL7wIjIfm6i/u1M0HLvEHXswAYL3w+GY5buACcI
 lsDnJDQWlZPDZM523nwaU9YJV4CmP3
X-Google-Smtp-Source: AGHT+IHsLPn+ZYUGj1al8pEm+g4HaWDEXW779heuQ0gvXB1oMVyKWHxqfJUAVVx0BNYF61JMajYUGle1gWdPn6wD4gE=
X-Received: by 2002:a05:6902:18c9:b0:e57:5f47:220e with SMTP id
 3f1490d57ef6-e58a4acefcemr10789790276.11.1738387633189; Fri, 31 Jan 2025
 21:27:13 -0800 (PST)
MIME-Version: 1.0
References: <20250131064354.4163579-1-kikuchan98@gmail.com>
 <20250131064354.4163579-2-kikuchan98@gmail.com>
 <20250131-whispering-ermine-of-wealth-d3d88c@krzk-bin>
In-Reply-To: <20250131-whispering-ermine-of-wealth-d3d88c@krzk-bin>
From: Hironori KIKUCHI <kikuchan98@gmail.com>
Date: Sat, 1 Feb 2025 14:27:02 +0900
X-Gm-Features: AWEUYZmlC20fbFyF1NFI_utnTK3XdirCuJ97-yb3PuYVg8ICYPoatoThGkURPoo
Message-ID: <CAG40kxH8URoL655=2N3+PAjCGV8Dun7hNyDv=0Wpd1MSQYttGw@mail.gmail.com>
Subject: Re: [PATCH 1/2] dt-bindings: display: panel: Add generic MIPI-DSI/DPI
 panels
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: linux-kernel@vger.kernel.org, Neil Armstrong <neil.armstrong@linaro.org>, 
 Jessica Zhang <quic_jesszhan@quicinc.com>, David Airlie <airlied@gmail.com>,
 Simona Vetter <simona@ffwll.ch>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
 dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org
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

Hello Krzysztof,

Thank you for your feedback.

On Fri, Jan 31, 2025 at 4:47=E2=80=AFPM Krzysztof Kozlowski <krzk@kernel.or=
g> wrote:
>
> On Fri, Jan 31, 2025 at 03:43:53PM +0900, Hironori KIKUCHI wrote:
> > This is a binding for generic MIPI-DSI/DPI panels that require
> > initialization with a simple command sequence before use.
> >
> > Although the `panel-simple` binding exists for generic panels, it is no=
t
> > suitable for panels that require initialization via their communication
> > bus, as such panels cannot be considered "simple".
> >
> > While many dedicated bindings exist for such panels, the generic panels
> > are not complex enough to warrant a dedicated binding because they only
> > require a "simple" initialization before use.
>
> All hardware warrants a dedicated binding. I don't get from where did
> you take such rule that you can skip actual hardware specific aspects.
>
> >
> > This binding addresses that gap.
> >
> > Signed-off-by: Hironori KIKUCHI <kikuchan98@gmail.com>
> > ---
> >  .../bindings/display/panel/panel-mipi.yaml    | 244 ++++++++++++++++++
> >  1 file changed, 244 insertions(+)
> >  create mode 100644 Documentation/devicetree/bindings/display/panel/pan=
el-mipi.yaml
> >
> > diff --git a/Documentation/devicetree/bindings/display/panel/panel-mipi=
.yaml b/Documentation/devicetree/bindings/display/panel/panel-mipi.yaml
> > new file mode 100644
> > index 00000000000..681614333d8
> > --- /dev/null
> > +++ b/Documentation/devicetree/bindings/display/panel/panel-mipi.yaml
> > @@ -0,0 +1,244 @@
> > +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> > +%YAML 1.2
> > +---
> > +$id: http://devicetree.org/schemas/display/panel/panel-mipi.yaml#
> > +$schema: http://devicetree.org/meta-schemas/core.yaml#
> > +
> > +title: Generic MIPI-DSI/DPI Panels Requiring Initialization
> > +
> > +maintainers:
> > +  - Hironori KIKUCHI <kikuchan98@gmail.com>
> > +
> > +description:
> > +  This is a binding for generic MIPI-DSI/DPI panels that require
> > +  initialization with a simple command sequence before use.
> > +
> > +properties:
> > +  compatible:
> > +    oneOf:
> > +      - enum:
> > +          - panel-mipi-dsi
> > +          - panel-mipi-dpi-spi
>
> Missing device specific compatibles.
>
> > +      - items:
> > +          - {}
> > +          - enum:
> > +              - panel-mipi-dsi
> > +              - panel-mipi-dpi-spi
> > +
> > +  reg:
> > +    description: DSI / SPI channel used by that screen
> > +    maxItems: 1
> > +
> > +  power-supply: true
> > +
> > +  io-supply:
> > +    description: I/O system regulator.
> > +      No need to set if this is the same as polwer-supply.
> > +
> > +  dc-gpios:
> > +    maxItems: 1
> > +    description: Controller data/command selection (D/CX) in 4-line SP=
I mode.
> > +      If not set, the controller is in 3-line SPI mode.
> > +      Disallowed for DSI.
> > +
> > +  width-mm: true
> > +  height-mm: true
> > +  panel-timing: true
> > +  display-timings: true
> > +
> > +  reset-delay:
> > +    description: Delay (in ms) after the reset command
>
> So use proper unit suffixes. Everywhere.
>
>
> > +    $ref: /schemas/types.yaml#/definitions/uint32
> > +
> > +  init-delay:
> > +    description: Delay (in ms) for sending the initial command sequenc=
e
> > +    $ref: /schemas/types.yaml#/definitions/uint32
> > +
> > +  sleep-delay:
> > +    description: Delay (in ms) after the sleep command
> > +    $ref: /schemas/types.yaml#/definitions/uint32
> > +
> > +  backlight-delay:
> > +    description: Delay (in ms) for enabling the backlight
> > +    $ref: /schemas/types.yaml#/definitions/uint32
> > +
> > +  port: true
> > +  reset-gpios: true
> > +  rotation: true
> > +
> > +  backlight: true
> > +
> > +  init-sequence:
> > +    description: Encoded initial command sequence.
> > +    $ref: /schemas/types.yaml#/definitions/uint8-array
> > +
> > +  firmware-name:
> > +    maxItems: 1
> > +
> > +  dsi-mode-video:
> > +    description: Enable MIPI_DSI_MODE_VIDEO.
> > +      Disallowed for SPI.
> > +    type: boolean
> > +
> > +  dsi-mode-video-burst:
> > +    description: Enable MIPI_DSI_MODE_VIDEO_BURST.
> > +      Disallowed for SPI.
> > +    type: boolean
> > +
> > +  dsi-mode-video-sync-pulse:
> > +    description: Enable MIPI_DSI_MODE_VIDEO_SYNC_PULSE.
> > +      Disallowed for SPI.
> > +    type: boolean
> > +
> > +  dsi-mode-video-auto-vert:
> > +    description: Enable MIPI_DSI_MODE_VIDEO_AUTO_VERT.
> > +      Disallowed for SPI.
> > +    type: boolean
> > +
> > +  dsi-mode-video-hse:
> > +    description: Enable MIPI_DSI_MODE_VIDEO_HSE.
> > +      Disallowed for SPI.
> > +    type: boolean
> > +
> > +  dsi-mode-video-no-hfp:
> > +    description: Enable MIPI_DSI_MODE_VIDEO_NO_HFP.
> > +      Disallowed for SPI.
> > +    type: boolean
> > +
> > +  dsi-mode-video-no-hbp:
> > +    description: Enable MIPI_DSI_MODE_VIDEO_NO_HBP.
> > +      Disallowed for SPI.
> > +    type: boolean
> > +
> > +  dsi-mode-video-no-hsa:
> > +    description: Enable MIPI_DSI_MODE_VIDEO_NO_HSA.
> > +      Disallowed for SPI.
> > +    type: boolean
> > +
> > +  dsi-mode-vsync-flush:
> > +    description: Enable MIPI_DSI_MODE_VSYNC_FLUSH.
> > +      Disallowed for SPI.
> > +    type: boolean
> > +
> > +  dsi-mode-no-eot-packet:
> > +    description: Enable MIPI_DSI_MODE_NO_EOT_PACKET.
> > +      Disallowed for SPI.
> > +    type: boolean
> > +
> > +  dsi-clock-non-continuous:
> > +    description: Enable MIPI_DSI_CLOCK_NON_CONTINUOUS.
> > +      Disallowed for SPI.
> > +    type: boolean
> > +
> > +  dsi-mode-lpm:
> > +    description: Enable MIPI_DSI_MODE_LPM.
> > +      Disallowed for SPI.
> > +    type: boolean
> > +
> > +  dsi-hs-pkt-end-aligned:
>
> All this must be deduced from the compatible which makes this binding
> redundant.  This binding is a no-go for me for obvious reasons: is not
> specific and you try to bypass the exact rule of bindings to be specific
> about hardware.

Ok, I'll delete these redundant properties, and deduce from the compatible.

>
> > +    description: Enable MIPI_DSI_HS_PKT_END_ALIGNED.
> > +      Disallowed for SPI.
> > +    type: boolean
> > +
> > +required:
> > +  - compatible
> > +  - reg
> > +
> > +allOf:
> > +  - $ref: panel-common.yaml#
> > +  - if:
> > +      properties:
> > +        compatible:
> > +          contains:
> > +            enum:
> > +              - panel-mipi-dpi-spi
> > +    then:
> > +      # SPI mode
> > +      $ref: /schemas/spi/spi-peripheral-props.yaml#
> > +      properties:
> > +        dsi-mode-video: false
> > +        dsi-mode-video-burst: false
> > +        dsi-mode-video-sync-pulse: false
> > +        dsi-mode-video-auto-vert: false
> > +        dsi-mode-video-hse: false
> > +        dsi-mode-video-no-hfp: false
> > +        dsi-mode-video-no-hbp: false
> > +        dsi-mode-video-no-hsa: false
> > +        dsi-mode-vsync-flush: false
> > +        dsi-mode-no-eot-packet: false
> > +        dsi-clock-non-continuous: false
> > +        dsi-mode-lpm: false
> > +        dsi-hs-pkt-end-aligned: false
> > +
> > +  - if:
> > +      properties:
> > +        compatible:
> > +          contains:
> > +            enum:
> > +              - panel-mipi-dsi
> > +    then:
> > +      # DSI mode
> > +      properties:
> > +        dc-gpios: false
> > +
> > +unevaluatedProperties: false
> > +
> > +examples:
> > +  - |
> > +    dsi {
> > +        #address-cells =3D <1>;
> > +        #size-cells =3D <0>;
> > +
> > +        panel@0 {
> > +            compatible =3D "vendor,some-panel", "panel-mipi-dsi";
>
> Undocumented compatible.
>
> Best regards,
> Krzysztof
>

Regards,
kikuchan.
