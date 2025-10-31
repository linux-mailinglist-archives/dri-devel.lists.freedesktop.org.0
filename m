Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id DE090C26686
	for <lists+dri-devel@lfdr.de>; Fri, 31 Oct 2025 18:40:14 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3132D10EBFB;
	Fri, 31 Oct 2025 17:40:13 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; secure) header.d=ffwll.ch header.i=@ffwll.ch header.b="dEhyezKY";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ej1-f45.google.com (mail-ej1-f45.google.com
 [209.85.218.45])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 73A4310EBFB
 for <dri-devel@lists.freedesktop.org>; Fri, 31 Oct 2025 17:40:11 +0000 (UTC)
Received: by mail-ej1-f45.google.com with SMTP id
 a640c23a62f3a-afcb7ae6ed0so544171166b.3
 for <dri-devel@lists.freedesktop.org>; Fri, 31 Oct 2025 10:40:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ffwll.ch; s=google; t=1761932410; x=1762537210; darn=lists.freedesktop.org; 
 h=in-reply-to:content-disposition:mime-version:references
 :mail-followup-to:message-id:subject:cc:to:from:date:from:to:cc
 :subject:date:message-id:reply-to;
 bh=g0MslenNMNRz9hncNuGH0nUy8fkx7bjabprrZbRn1I0=;
 b=dEhyezKYW/J1gm0GVXNuzIdwent+IDNfp14IgTsTE+nGaDHFmGpSfY3klrkFk1P6Nz
 fzbVoopON26K6ve7gB4tUwSTtk3VAVkqzlMe6OOW1qCxmCA5+gUgKTRL7mDH+fHvxjjx
 JYmV7EJ2+W78Fvm8XvI+yNq32tegkcenNk/4g=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1761932410; x=1762537210;
 h=in-reply-to:content-disposition:mime-version:references
 :mail-followup-to:message-id:subject:cc:to:from:date
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=g0MslenNMNRz9hncNuGH0nUy8fkx7bjabprrZbRn1I0=;
 b=BXO6G5BuxA4eHBhnUgrbXDgjN3q2JWy4IGxw+jlzoMPwHNc7TVL/NQzaXytK4QZVg4
 bhk1w5nM7pFuHUM+XOreJStyTKy+F+XQ0a5RBkLvEugfcRUoBusJc1cYLljmkj2yIusS
 6o15Vb09I+7yKFXneTzBvA4SDOt7iObaMnsRrf55mBdZ0eDmhbNiGHUd9bPi3TSzuPpc
 vLd1wpQor6LmpE9PApnBj2z3bKVVefmlCpkdUMsM2RrZsxZG2ggaSUzjlE1bRdPyr8h5
 6laf4QwnfRuplkBau65WE12MucEBUn4BpeSIFvegAfby950SRXeMw755+VYqisyZQ4Gc
 QEOA==
X-Forwarded-Encrypted: i=1;
 AJvYcCUlzy6J9nY7bHoGKzNbtvqDQ0ckFVAsLK4ADttUbEDD81YTEEU74AhR0l85muQgsNuy5YX2PIZ52xI=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YzbB3uEBG/Xv7xVSDpRODb7VaCiWGk+HK9bEcVY0eAjtpO3nEav
 lKsIr/hHDfUA1eeJSNE9Y0mjfLukCUrcZElU1lkCvgIHEpWa7T8+T7vJ9wFmkryeqaI=
X-Gm-Gg: ASbGncuFIoHvsPobiBBlkAL6T6eQ0qiqCd8rkzvzbRkY3MKsDXD2gaOCfTBdqcQVyCV
 MYmCSXdn3ZW1CtCrc7MZMjyjxvwSundKpKmawGkJboNJVK0SkhJbYdugbcvN9ZjgGyhdTBOrlxC
 QwSX4MjEBZtmC3G7wuQxwwLYPWTYWn8q0E1kNZtOd8MhkkvqlAHmP0iRpvhxGnFyuj+/DyH5BlN
 4AWGjniIG6JOtAEdNMZTtsfSVeYP7ufp9sCeKx9lEvyHi4rHL2+llN2vhFCI2jv9CGEvCSBITzk
 FQq8wHSPDpzXa/YueaLHtneleHsh89vYGCOjwl7/O7RECwa6jhdTUSfUupW24rkH10yCsPD8hY9
 EO8QyZjxeFEvJDdyyvtNd90tIgQBVA73FFsg8KiYcALoORSm4BZ+PQsFZ/ztp4TEH5GWbFV1ywH
 8g6gcWCPB6lwm3P0DBXM7nBg==
X-Google-Smtp-Source: AGHT+IFbOBwf98bBMLnyAAZrOMm+hJ35dRhtFe2UhgAlTZPlhjoRrNX+iSO04sWdZ50B8Ps8qRcs4g==
X-Received: by 2002:a17:907:7e8d:b0:b6f:198e:c348 with SMTP id
 a640c23a62f3a-b7070630cfcmr467732066b.46.1761932409693; 
 Fri, 31 Oct 2025 10:40:09 -0700 (PDT)
Received: from phenom.ffwll.local ([2a02:168:57f4:0:5485:d4b2:c087:b497])
 by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-b7077c82ef6sm227660766b.52.2025.10.31.10.40.08
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 31 Oct 2025 10:40:08 -0700 (PDT)
Date: Fri, 31 Oct 2025 18:40:06 +0100
From: Simona Vetter <simona.vetter@ffwll.ch>
To: Liu Ying <victor.liu@nxp.com>
Cc: Shengjiu Wang <shengjiu.wang@nxp.com>, andrzej.hajda@intel.com,
 neil.armstrong@linaro.org, rfoss@kernel.org,
 Laurent.pinchart@ideasonboard.com, jonas@kwiboo.se,
 jernej.skrabec@gmail.com, maarten.lankhorst@linux.intel.com,
 mripard@kernel.org, tzimmermann@suse.de, airlied@gmail.com,
 simona@ffwll.ch, lumag@kernel.org, dianders@chromium.org,
 cristian.ciocaltea@collabora.com, luca.ceresoli@bootlin.com,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 shawnguo@kernel.org, s.hauer@pengutronix.de, kernel@pengutronix.de,
 festevam@gmail.com, imx@lists.linux.dev,
 linux-arm-kernel@lists.infradead.org, robh@kernel.org,
 krzk+dt@kernel.org, conor+dt@kernel.org, p.zabel@pengutronix.de,
 devicetree@vger.kernel.org, l.stach@pengutronix.de,
 shengjiu.wang@gmail.com, perex@perex.cz, tiwai@suse.com,
 linux-sound@vger.kernel.org
Subject: Re: [PATCH v7 1/7] dt-bindings: display: imx: add HDMI PAI for i.MX8MP
Message-ID: <aQT0dlZ88jDVptLF@phenom.ffwll.local>
Mail-Followup-To: Liu Ying <victor.liu@nxp.com>,
 Shengjiu Wang <shengjiu.wang@nxp.com>, andrzej.hajda@intel.com,
 neil.armstrong@linaro.org, rfoss@kernel.org,
 Laurent.pinchart@ideasonboard.com, jonas@kwiboo.se,
 jernej.skrabec@gmail.com, maarten.lankhorst@linux.intel.com,
 mripard@kernel.org, tzimmermann@suse.de, airlied@gmail.com,
 simona@ffwll.ch, lumag@kernel.org, dianders@chromium.org,
 cristian.ciocaltea@collabora.com, luca.ceresoli@bootlin.com,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 shawnguo@kernel.org, s.hauer@pengutronix.de, kernel@pengutronix.de,
 festevam@gmail.com, imx@lists.linux.dev,
 linux-arm-kernel@lists.infradead.org, robh@kernel.org,
 krzk+dt@kernel.org, conor+dt@kernel.org, p.zabel@pengutronix.de,
 devicetree@vger.kernel.org, l.stach@pengutronix.de,
 shengjiu.wang@gmail.com, perex@perex.cz, tiwai@suse.com,
 linux-sound@vger.kernel.org
References: <20250923053001.2678596-1-shengjiu.wang@nxp.com>
 <20250923053001.2678596-2-shengjiu.wang@nxp.com>
 <aPc9-wYxGB1KYPyQ@phenom.ffwll.local>
 <7e0fb617-088b-4075-9631-e37645b4c40d@nxp.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <7e0fb617-088b-4075-9631-e37645b4c40d@nxp.com>
X-Operating-System: Linux phenom 6.12.38+deb13-amd64 
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

On Tue, Oct 21, 2025 at 04:51:40PM +0800, Liu Ying wrote:
> Hi Sima,
> 
> On 10/21/2025, Simona Vetter wrote:
> > On Tue, Sep 23, 2025 at 01:29:55PM +0800, Shengjiu Wang wrote:
> >> Add binding for the i.MX8MP HDMI parallel Audio interface block.
> >>
> >> The HDMI TX Parallel Audio Interface (HTX_PAI) is a digital module that
> >> acts as the bridge between the Audio Subsystem to the HDMI TX Controller.
> >> This IP block is found in the HDMI subsystem of the i.MX8MP SoC.
> >>
> >> Aud2htx module in Audio Subsystem, HDMI PAI module and HDMI TX
> >> Controller compose the HDMI audio pipeline.
> >>
> >> In fsl,imx8mp-hdmi-tx.yaml, add port@2 that is linked to pai_to_hdmi_tx.
> >>
> >> Signed-off-by: Shengjiu Wang <shengjiu.wang@nxp.com>
> >> Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
> >> Tested-by: Alexander Stein <alexander.stein@ew.tq-group.com>
> > 
> > dt patches need an ack from dt maintainers before you push them, please
> > make sure you follow that for the next changes.
> 
> Just want to make sure I may follow that correctly in the future.
> As Krzysztof is one of DT binding maintainers and this patch has
> Krzysztof's R-b tag, need more ack from DT maintainers?

Sorry for the late reply, caught a cold :-/

No, that's enough, I wasn't entirely awake when I processed the PR
containing these patches. I only noticed because of a a new check in dim
for maintainer actions like merging a PR, which misfired on these two
patches - the r-b should have been counted as an ack (even though strictly
it's better to record both).

Apologies for the noise.
-Sima

> 
> > -Sima
> > 
> >> ---
> >>  .../display/bridge/fsl,imx8mp-hdmi-tx.yaml    | 12 ++++
> >>  .../display/imx/fsl,imx8mp-hdmi-pai.yaml      | 69 +++++++++++++++++++
> >>  2 files changed, 81 insertions(+)
> >>  create mode 100644 Documentation/devicetree/bindings/display/imx/fsl,imx8mp-hdmi-pai.yaml
> >>
> >> diff --git a/Documentation/devicetree/bindings/display/bridge/fsl,imx8mp-hdmi-tx.yaml b/Documentation/devicetree/bindings/display/bridge/fsl,imx8mp-hdmi-tx.yaml
> >> index 05442d437755..6211ab8bbb0e 100644
> >> --- a/Documentation/devicetree/bindings/display/bridge/fsl,imx8mp-hdmi-tx.yaml
> >> +++ b/Documentation/devicetree/bindings/display/bridge/fsl,imx8mp-hdmi-tx.yaml
> >> @@ -49,6 +49,10 @@ properties:
> >>          $ref: /schemas/graph.yaml#/properties/port
> >>          description: HDMI output port
> >>  
> >> +      port@2:
> >> +        $ref: /schemas/graph.yaml#/properties/port
> >> +        description: Parallel audio input port
> >> +
> >>      required:
> >>        - port@0
> >>        - port@1
> >> @@ -98,5 +102,13 @@ examples:
> >>                      remote-endpoint = <&hdmi0_con>;
> >>                  };
> >>              };
> >> +
> >> +            port@2 {
> >> +                reg = <2>;
> >> +
> >> +                endpoint {
> >> +                    remote-endpoint = <&pai_to_hdmi_tx>;
> >> +                };
> >> +            };
> >>          };
> >>      };
> >> diff --git a/Documentation/devicetree/bindings/display/imx/fsl,imx8mp-hdmi-pai.yaml b/Documentation/devicetree/bindings/display/imx/fsl,imx8mp-hdmi-pai.yaml
> >> new file mode 100644
> >> index 000000000000..4f99682a308d
> >> --- /dev/null
> >> +++ b/Documentation/devicetree/bindings/display/imx/fsl,imx8mp-hdmi-pai.yaml
> >> @@ -0,0 +1,69 @@
> >> +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> >> +%YAML 1.2
> >> +---
> >> +$id: http://devicetree.org/schemas/display/imx/fsl,imx8mp-hdmi-pai.yaml#
> >> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> >> +
> >> +title: Freescale i.MX8MP HDMI Parallel Audio Interface
> >> +
> >> +maintainers:
> >> +  - Shengjiu Wang <shengjiu.wang@nxp.com>
> >> +
> >> +description:
> >> +  The HDMI TX Parallel Audio Interface (HTX_PAI) is a bridge between the
> >> +  Audio Subsystem to the HDMI TX Controller.
> >> +
> >> +properties:
> >> +  compatible:
> >> +    const: fsl,imx8mp-hdmi-pai
> >> +
> >> +  reg:
> >> +    maxItems: 1
> >> +
> >> +  interrupts:
> >> +    maxItems: 1
> >> +
> >> +  clocks:
> >> +    maxItems: 1
> >> +
> >> +  clock-names:
> >> +    const: apb
> >> +
> >> +  power-domains:
> >> +    maxItems: 1
> >> +
> >> +  port:
> >> +    $ref: /schemas/graph.yaml#/properties/port
> >> +    description: Output to the HDMI TX controller.
> >> +
> >> +required:
> >> +  - compatible
> >> +  - reg
> >> +  - interrupts
> >> +  - clocks
> >> +  - clock-names
> >> +  - power-domains
> >> +  - port
> >> +
> >> +additionalProperties: false
> >> +
> >> +examples:
> >> +  - |
> >> +    #include <dt-bindings/clock/imx8mp-clock.h>
> >> +    #include <dt-bindings/power/imx8mp-power.h>
> >> +
> >> +    audio-bridge@32fc4800 {
> >> +        compatible = "fsl,imx8mp-hdmi-pai";
> >> +        reg = <0x32fc4800 0x800>;
> >> +        interrupt-parent = <&irqsteer_hdmi>;
> >> +        interrupts = <14>;
> >> +        clocks = <&clk IMX8MP_CLK_HDMI_APB>;
> >> +        clock-names = "apb";
> >> +        power-domains = <&hdmi_blk_ctrl IMX8MP_HDMIBLK_PD_PAI>;
> >> +
> >> +        port {
> >> +            pai_to_hdmi_tx: endpoint {
> >> +                remote-endpoint = <&hdmi_tx_from_pai>;
> >> +            };
> >> +        };
> >> +    };
> >> -- 
> >> 2.34.1
> >>
> > 
> 
> 
> -- 
> Regards,
> Liu Ying

-- 
Simona Vetter
Software Engineer
http://blog.ffwll.ch
