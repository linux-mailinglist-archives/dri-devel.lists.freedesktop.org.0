Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 9FFCF8FEFA3
	for <lists+dri-devel@lfdr.de>; Thu,  6 Jun 2024 16:58:32 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9085410E071;
	Thu,  6 Jun 2024 14:58:30 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="jwwb5eD+";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from sin.source.kernel.org (sin.source.kernel.org [145.40.73.55])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 44DD110E9A6
 for <dri-devel@lists.freedesktop.org>; Thu,  6 Jun 2024 14:58:29 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sin.source.kernel.org (Postfix) with ESMTP id BE518CE1BAF
 for <dri-devel@lists.freedesktop.org>; Thu,  6 Jun 2024 14:58:25 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id CB7A3C4AF09
 for <dri-devel@lists.freedesktop.org>; Thu,  6 Jun 2024 14:58:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1717685904;
 bh=+5bxvf0v2FVyUXIrKPcUNq52cRGrHBpwGeGDJnmbnJ0=;
 h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
 b=jwwb5eD+l+DurInLJxKAXBTR2YMVm4VmopGfGFizR8mXdCKqiPdfloiAOFmPMus8k
 8G+lVTgL3sV8BQ1N0apW5QU+JMAroRFG33TofmE27PH5wwHeFn4RTmmmGS9jmMDjgW
 tKLEhVjCV8SuaejQpW9PTq8z4Sqy1x/ID0SHddsXb+TK51bgTj95W5s2I0AQObthSr
 VAEHKlbwd1B9XbToSFFdk0uWHGvibpOcOPRIZ9ApWAgfG9m2IIrAliyXar18usnfUl
 TEtZDxJI5RnDH+K5pIW3OotMauefv4GAsJ0kEDGt/RFyVLMtI78DGi1Y5H8/MznmgF
 AmPA4Cec7BEzw==
Received: by mail-lf1-f51.google.com with SMTP id
 2adb3069b0e04-52b840cfecdso1260529e87.3
 for <dri-devel@lists.freedesktop.org>; Thu, 06 Jun 2024 07:58:24 -0700 (PDT)
X-Forwarded-Encrypted: i=1;
 AJvYcCV90e9Q+psBlujGcGUkRDZb1KpysGFsZH+YisW2Pj1Lwl3CFUQ3tXLqNTNV84LA/JRSw5O0BrMKXzp9m5pJ53CB6EHno1hUOPYF1+eV3gbr
X-Gm-Message-State: AOJu0Yz9eo+T9eD/TSRHJ9eer+LIPDIoW5o1U24eBRtB3SjoI1E+03tV
 rf6D3UhtBKXshj3nWtvx9keIZE+wsO69kP2XqCwz+rJCxPEpLuKHTIrsRMKP0ft/C/IPumPiTSW
 xFxA4nkkpc3DgAD4Ck5jQnrVzGg==
X-Google-Smtp-Source: AGHT+IEI/HzrYwCNH+fgv5QUK3X6q1WLoehrFnvaSYS+6bZQTY8kCtZZFy9elFAgM+jtrBoVoTj5yw4L49fT/gXDhws=
X-Received: by 2002:ac2:42cd:0:b0:52b:9c8a:7356 with SMTP id
 2adb3069b0e04-52bab4fb431mr3412448e87.49.1717685903060; Thu, 06 Jun 2024
 07:58:23 -0700 (PDT)
MIME-Version: 1.0
References: <20240601-b4-rk3588-bridge-upstream-v1-0-f6203753232b@collabora.com>
 <20240601-b4-rk3588-bridge-upstream-v1-12-f6203753232b@collabora.com>
 <20240605232206.GA3345910-robh@kernel.org>
 <260aa607-099a-4f65-ae59-c4b6ea2256f1@collabora.com>
In-Reply-To: <260aa607-099a-4f65-ae59-c4b6ea2256f1@collabora.com>
From: Rob Herring <robh@kernel.org>
Date: Thu, 6 Jun 2024 08:58:09 -0600
X-Gmail-Original-Message-ID: <CAL_JsqKsVE1VgoYGe7qPaAV82dbs5UMGPG843mz26Opv0Y7Hxg@mail.gmail.com>
Message-ID: <CAL_JsqKsVE1VgoYGe7qPaAV82dbs5UMGPG843mz26Opv0Y7Hxg@mail.gmail.com>
Subject: Re: [PATCH 12/14] dt-bindings: display: rockchip,dw-hdmi: Add
 compatible for RK3588
To: Cristian Ciocaltea <cristian.ciocaltea@collabora.com>
Cc: Andrzej Hajda <andrzej.hajda@intel.com>,
 Neil Armstrong <neil.armstrong@linaro.org>, 
 Robert Foss <rfoss@kernel.org>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>, 
 Jonas Karlman <jonas@kwiboo.se>, Jernej Skrabec <jernej.skrabec@gmail.com>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, 
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>,
 Daniel Vetter <daniel@ffwll.ch>, Sandy Huang <hjc@rock-chips.com>,
 =?UTF-8?Q?Heiko_St=C3=BCbner?= <heiko@sntech.de>, 
 Andy Yan <andy.yan@rock-chips.com>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Mark Yao <markyao0591@gmail.com>, 
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-rockchip@lists.infradead.org, 
 devicetree@vger.kernel.org, kernel@collabora.com, 
 Alexandre ARNOUD <aarnoud@me.com>, Luis de Arquer <ldearquer@gmail.com>
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

On Thu, Jun 6, 2024 at 5:51=E2=80=AFAM Cristian Ciocaltea
<cristian.ciocaltea@collabora.com> wrote:
>
> On 6/6/24 2:22 AM, Rob Herring wrote:
> > On Sat, Jun 01, 2024 at 04:12:34PM +0300, Cristian Ciocaltea wrote:
> >> Document the Synopsys DesignWare HDMI 2.1 Quad-Pixel (QP) TX controlle=
r
> >> found on Rockchip RK3588 SoC family.
> >>
> >> Since RK3588 uses different clocks than previous Rockchip SoCs and als=
o
> >> requires a couple of reset lines and some additional properties, provi=
de
> >> the required changes in the binding to accommodate all variants.
> >>
> >> Signed-off-by: Cristian Ciocaltea <cristian.ciocaltea@collabora.com>
> >> ---
> >>  .../display/rockchip/rockchip,dw-hdmi.yaml         | 127 ++++++++++++=
+++------
> >>  1 file changed, 90 insertions(+), 37 deletions(-)
> >>
> >> diff --git a/Documentation/devicetree/bindings/display/rockchip/rockch=
ip,dw-hdmi.yaml b/Documentation/devicetree/bindings/display/rockchip/rockch=
ip,dw-hdmi.yaml
> >> index 2aac62219ff6..60d6b815227f 100644
> >> --- a/Documentation/devicetree/bindings/display/rockchip/rockchip,dw-h=
dmi.yaml
> >> +++ b/Documentation/devicetree/bindings/display/rockchip/rockchip,dw-h=
dmi.yaml
> >> @@ -10,12 +10,10 @@ maintainers:
> >>    - Mark Yao <markyao0591@gmail.com>
> >>
> >>  description: |
> >> -  The HDMI transmitter is a Synopsys DesignWare HDMI 1.4 TX controlle=
r IP
> >> -  with a companion PHY IP.
> >> -
> >> -allOf:
> >> -  - $ref: ../bridge/synopsys,dw-hdmi.yaml#
> >> -  - $ref: /schemas/sound/dai-common.yaml#
> >> +  For SoCs up to RK3568, the HDMI transmitter is a Synopsys DesignWar=
e
> >> +  HDMI 1.4 TX controller IP with a companion PHY IP.
> >> +  The RK3588 SoC integrates the Synopsys DesignWare HDMI 2.1 Quad-Pix=
el (QP)
> >> +  TX controller IP and a HDMI/eDP TX Combo PHY based on a Samsung IP =
block.
> >>
> >>  properties:
> >>    compatible:
> >> @@ -25,6 +23,7 @@ properties:
> >>        - rockchip,rk3328-dw-hdmi
> >>        - rockchip,rk3399-dw-hdmi
> >>        - rockchip,rk3568-dw-hdmi
> >> +      - rockchip,rk3588-dw-hdmi
> >>
> >>    reg-io-width:
> >>      const: 4
> >> @@ -40,36 +39,6 @@ properties:
> >>        A 1.8V supply that powers up the SoC internal circuitry. The pi=
n name on the
> >>        SoC usually is HDMI_TX_AVDD_1V8.
> >>
> >> -  clocks:
> >> -    minItems: 2
> >> -    items:
> >> -      - {}
> >> -      - {}
> >> -      # The next three clocks are all optional, but shall be specifie=
d in this
> >> -      # order when present.
> >> -      - description: The HDMI CEC controller main clock
> >> -      - description: Power for GRF IO
> >> -      - description: External clock for some HDMI PHY (old clock name=
, deprecated)
> >> -      - description: External clock for some HDMI PHY (new name)
> >> -
> >> -  clock-names:
> >> -    minItems: 2
> >> -    items:
> >> -      - {}
> >> -      - {}
> >> -      - enum:
> >> -          - cec
> >> -          - grf
> >> -          - vpll
> >> -          - ref
> >> -      - enum:
> >> -          - grf
> >> -          - vpll
> >> -          - ref
> >> -      - enum:
> >> -          - vpll
> >> -          - ref
> >> -
> >>    ddc-i2c-bus:
> >>      $ref: /schemas/types.yaml#/definitions/phandle
> >>      description:
> >> @@ -131,13 +100,97 @@ properties:
> >>  required:
> >>    - compatible
> >>    - reg
> >> -  - reg-io-width
> >>    - clocks
> >>    - clock-names
> >>    - interrupts
> >>    - ports
> >>    - rockchip,grf
> >>
> >> +allOf:
> >> +  - $ref: /schemas/sound/dai-common.yaml#
> >> +  - if:
> >> +      properties:
> >> +        compatible:
> >> +          contains:
> >> +            enum:
> >> +              - rockchip,rk3588-dw-hdmi
> >> +    then:
> >> +      properties:
> >> +        reg:
> >> +          maxItems: 1
> >> +
> >> +        clocks:
> >> +          minItems: 1
> >> +          items:
> >> +            - description: APB system interface clock
> >> +            # The next clocks are optional, but shall be specified in=
 this
> >> +            # order when present.
> >> +            - description: TMDS/FRL link clock
> >> +            - description: EARC RX biphase clock
> >> +            - description: Reference clock
> >> +            - description: Audio interface clock
> >> +            - description: Video datapath clock
> >> +
> >> +        clock-names:
> >> +          minItems: 1
> >> +          items:
> >> +            - const: pclk
> >> +            - enum: [hdp, earc, ref, aud, hclk_vo1]
> >> +            - enum: [earc, ref, aud, hclk_vo1]
> >> +            - enum: [ref, aud, hclk_vo1]
> >> +            - enum: [aud, hclk_vo1]
> >> +            - const: hclk_vo1
> >> +
> >> +        resets:
> >> +          minItems: 2
> >> +          maxItems: 2
> >> +
> >> +        reset-names:
> >> +          items:
> >> +            - const: ref
> >> +            - const: hdp
> >> +
> >> +        interrupts:
> >> +          minItems: 1
> >> +          maxItems: 5
> >> +
> >> +        rockchip,vo1_grf:
> >> +          $ref: /schemas/types.yaml#/definitions/phandle
> >> +          description: Some QP related data is accessed through VO1 G=
RF regs
> >> +
> >> +      required:
> >> +        - resets
> >> +        - reset-names
> >> +        - rockchip,vo1_grf
> >> +
> >> +    else:
> >> +      $ref: ../bridge/synopsys,dw-hdmi.yaml#
> >
> > This is odd... With this plus the amount of conditional schema, I think
> > this should be a new schema doc. Doesn't have to have a common
> > schema. You can let the 2nd user of this IP block do that.
>
> Yes, v2 is going to be a completely separated driver implementation.

That actually has nothing to do with the decision here. Bindings are
separate from drivers.

Rob
