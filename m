Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 09498B10B4C
	for <lists+dri-devel@lfdr.de>; Thu, 24 Jul 2025 15:24:25 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 25FEB10E2B0;
	Thu, 24 Jul 2025 13:24:21 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="LKWKixLW";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-io1-f51.google.com (mail-io1-f51.google.com
 [209.85.166.51])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3ED1610E91A
 for <dri-devel@lists.freedesktop.org>; Thu, 24 Jul 2025 10:10:24 +0000 (UTC)
Received: by mail-io1-f51.google.com with SMTP id
 ca18e2360f4ac-879399faac9so65333639f.3
 for <dri-devel@lists.freedesktop.org>; Thu, 24 Jul 2025 03:10:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1753351823; x=1753956623; darn=lists.freedesktop.org;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=0+meAXBdOYjti/xHVnSu9+/vlo6BxGcgq1eAbTOjxvs=;
 b=LKWKixLWc2/HTPitlVTmloIkfefmnw6ipnXHvYOw2ffADmWL+nTOJgH9OjnIMND9yz
 PsCRt7nJcqXIU9FWSa5mP2QQHGHYG1b4Ya6v17z9jdtO+wX853IrYA5oyXaCNdRTvuSS
 73VSqCcEupvSWDnUs/ZCjrSvgrD9E+4wT+Obaf3ZNEmnPnLedCcaFOCbx+zHwwH2pa1/
 2gWnT1l9sOytrDJ+Q8wKdoBcKN6vkRJATMeGXGDkD3iSydbQczuETmZhp/LRqdr0ZuD8
 P+7al+gayXqFMcvRLSwRnp85KW3fLg0C8COtbuT4tfR7iPIET2xFG0DMAnV46P5/DIj/
 KwMQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1753351823; x=1753956623;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=0+meAXBdOYjti/xHVnSu9+/vlo6BxGcgq1eAbTOjxvs=;
 b=BAPXIP+SznBL4vLdHLpsw71m8FE84GIu9pea7hUmZy6aV3JQ6/5NGY/Hatkug+dl4Y
 8LnW26ta6pbUERo1mpMcSqp9Gv/dStg/J1U1dsBMNkolUdMqS1m6LQuLuQ+O9T1q+yDg
 fO0nRTHgSfn85goRQQ08j57A0wT0yzqWztzUOTljQSX8AJkEyh83GWPMG3IWsgnVCUxY
 jzPDPpXKpJT4ux3Mfnx/xUjmZw/FuU29dA5V/qc3tkZA06mjx9+0GMz8UK+eDexw+GlX
 gAEEyVuCc/FtjcrckqOw/iG/lCt2WXKC5D0CLyVSM/4CGYAkHU+/jJvGU/dU9MEkis1s
 fWlw==
X-Forwarded-Encrypted: i=1;
 AJvYcCUAQC7k14hQ6Up7cMas9OcuxzisCfXtz59ZU2+23/6w/yEJw3dSdSbeDwEWXKgOVb+ayD2YtkQiN4I=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YznVXxMNIn6sYeTzVqitH0GUsINE+jROAdlDx9H9OfWEX9xn5AP
 /1YgxnQk+MP+jjezN2wS/yfErMke7GjNrTwrGeT+r8lP/4+eAlr82CNwO7uWjx1uPPzuAOVrkJY
 /k+HWAtrTMWBGh91267mR62GdGBfL3u0=
X-Gm-Gg: ASbGncsStlanrO0MiCEsdNgQtHypVPb/yqliUkiz1r38iX4q+3F9GM/KyFcJjVtKIBM
 n3+U71dLqOxiGEHRKU7lM23lkqyU4wlmUSjPJfRmAyI4ZUq4Mq8K6W5p4wxziFwcIxjoReF7W5c
 7gSA0wY5ntvIGAsPPTE/TciCcEinjz+ngQ6aWVTGkIQbIQeolFA1d3/sz7lhaiqjorq/yLqsFeY
 xT/MXc=
X-Google-Smtp-Source: AGHT+IF7M0baFlK3062K6BXEoa8kOdw9KDdHsQbjFyV5neQ+2sKDdzPXmbuSGlkwEtGraleUJvxc24KLjX8I3/Jqb8w=
X-Received: by 2002:a92:cd8d:0:b0:3dd:d321:79ab with SMTP id
 e9e14a558f8ab-3e335535dc5mr117038895ab.18.1753351822074; Thu, 24 Jul 2025
 03:10:22 -0700 (PDT)
MIME-Version: 1.0
References: <20250724072248.1517569-1-shengjiu.wang@nxp.com>
 <20250724072248.1517569-2-shengjiu.wang@nxp.com>
 <20250724-straight-lorikeet-of-novelty-9124f8@kuoka>
In-Reply-To: <20250724-straight-lorikeet-of-novelty-9124f8@kuoka>
From: Shengjiu Wang <shengjiu.wang@gmail.com>
Date: Thu, 24 Jul 2025 18:10:10 +0800
X-Gm-Features: Ac12FXwoUiu0ZopeKo51pKtd4fVW0e5JyUbFY0Gq7Yw0jp0bxpzJja68FGRxr2Q
Message-ID: <CAA+D8ANV74k1=_m7HfCO2n7nCU7mH=QMrd0CS5eMqGqDHn9HEw@mail.gmail.com>
Subject: Re: [PATCH v2 1/6] dt-bindings: display: imx: add HDMI PAI for i.MX8MP
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: Shengjiu Wang <shengjiu.wang@nxp.com>, andrzej.hajda@intel.com, 
 neil.armstrong@linaro.org, rfoss@kernel.org, 
 Laurent.pinchart@ideasonboard.com, jonas@kwiboo.se, jernej.skrabec@gmail.com, 
 maarten.lankhorst@linux.intel.com, mripard@kernel.org, tzimmermann@suse.de, 
 airlied@gmail.com, simona@ffwll.ch, lumag@kernel.org, dianders@chromium.org, 
 cristian.ciocaltea@collabora.com, luca.ceresoli@bootlin.com, 
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org, 
 victor.liu@nxp.com, shawnguo@kernel.org, s.hauer@pengutronix.de, 
 kernel@pengutronix.de, festevam@gmail.com, imx@lists.linux.dev, 
 linux-arm-kernel@lists.infradead.org, robh@kernel.org, krzk+dt@kernel.org, 
 conor+dt@kernel.org, p.zabel@pengutronix.de, devicetree@vger.kernel.org, 
 l.stach@pengutronix.de, perex@perex.cz, tiwai@suse.com, 
 linux-sound@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Mailman-Approved-At: Thu, 24 Jul 2025 13:24:19 +0000
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

On Thu, Jul 24, 2025 at 4:52=E2=80=AFPM Krzysztof Kozlowski <krzk@kernel.or=
g> wrote:
>
> On Thu, Jul 24, 2025 at 03:22:43PM +0800, Shengjiu Wang wrote:
> > Add binding for the i.MX8MP HDMI parallel Audio interface block.
> >
> > In fsl,imx8mp-hdmi-tx.yaml, add port@2 that linked to pai_to_hdmi_tx.
> >
> > Signed-off-by: Shengjiu Wang <shengjiu.wang@nxp.com>
> > ---
> >  .../display/bridge/fsl,imx8mp-hdmi-tx.yaml    | 12 ++++
> >  .../display/imx/fsl,imx8mp-hdmi-pai.yaml      | 69 +++++++++++++++++++
> >  2 files changed, 81 insertions(+)
> >  create mode 100644 Documentation/devicetree/bindings/display/imx/fsl,i=
mx8mp-hdmi-pai.yaml
> >
> > diff --git a/Documentation/devicetree/bindings/display/bridge/fsl,imx8m=
p-hdmi-tx.yaml b/Documentation/devicetree/bindings/display/bridge/fsl,imx8m=
p-hdmi-tx.yaml
> > index 05442d437755..6211ab8bbb0e 100644
> > --- a/Documentation/devicetree/bindings/display/bridge/fsl,imx8mp-hdmi-=
tx.yaml
> > +++ b/Documentation/devicetree/bindings/display/bridge/fsl,imx8mp-hdmi-=
tx.yaml
> > @@ -49,6 +49,10 @@ properties:
> >          $ref: /schemas/graph.yaml#/properties/port
> >          description: HDMI output port
> >
> > +      port@2:
> > +        $ref: /schemas/graph.yaml#/properties/port
> > +        description: Parallel audio input port
>
> Which data path this represents? Feels like you are duplicating ASoC
> dai-links/cells...

Here it means from HDMI PAI to HDMI TX controller. not the ASoC dai link.

On i.MX8MP, for HDMI audio, it is separated into several hardware modules:
1. Aud2HTX
   driver:  sound/soc/fsl/fsl_aud2htx.c
2. HDMI PAI
   driver:  this patch set
3. HDMI TX controller audio part
    driver: drivers/gpu/drm/bridge/synopsys/dw-hdmi-gp-audio.c

Aud2HTX is in the Audio subsystem,  HDMI PAI and HDMI TX are in the
HDMI subsystem. The full data path is
Aud2htx -> HDMI PAI -> HDMI TX controller.

>
>
> > +
> >      required:
> >        - port@0
> >        - port@1
> > @@ -98,5 +102,13 @@ examples:
> >                      remote-endpoint =3D <&hdmi0_con>;
> >                  };
> >              };
> > +
> > +            port@2 {
> > +                reg =3D <2>;
> > +
> > +                endpoint {
> > +                    remote-endpoint =3D <&pai_to_hdmi_tx>;
> > +                };
> > +            };
> >          };
> >      };
> > diff --git a/Documentation/devicetree/bindings/display/imx/fsl,imx8mp-h=
dmi-pai.yaml b/Documentation/devicetree/bindings/display/imx/fsl,imx8mp-hdm=
i-pai.yaml
> > new file mode 100644
> > index 000000000000..4f99682a308d
> > --- /dev/null
> > +++ b/Documentation/devicetree/bindings/display/imx/fsl,imx8mp-hdmi-pai=
.yaml
> > @@ -0,0 +1,69 @@
> > +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> > +%YAML 1.2
> > +---
> > +$id: http://devicetree.org/schemas/display/imx/fsl,imx8mp-hdmi-pai.yam=
l#
> > +$schema: http://devicetree.org/meta-schemas/core.yaml#
> > +
> > +title: Freescale i.MX8MP HDMI Parallel Audio Interface
> > +
> > +maintainers:
> > +  - Shengjiu Wang <shengjiu.wang@nxp.com>
> > +
> > +description:
> > +  The HDMI TX Parallel Audio Interface (HTX_PAI) is a bridge between t=
he
> > +  Audio Subsystem to the HDMI TX Controller.
>
> What is Audio Subsystem? Like Linux Audio or some name matching actual
> hardware?

Audio subsystem is the name for hardware.

>
>
> > +
> > +properties:
> > +  compatible:
> > +    const: fsl,imx8mp-hdmi-pai
> > +
> > +  reg:
> > +    maxItems: 1
> > +
> > +  interrupts:
> > +    maxItems: 1
> > +
> > +  clocks:
> > +    maxItems: 1
> > +
> > +  clock-names:
> > +    const: apb
> > +
> > +  power-domains:
> > +    maxItems: 1
> > +
> > +  port:
> > +    $ref: /schemas/graph.yaml#/properties/port
> > +    description: Output to the HDMI TX controller.
>
> And how do you plug it into sound card? Where are any DAI links?

The hardware data path is Aud2htx -> HDMI PAI -> HDMI TX controller.

From a software point of view. the path is
Aud2htx -> hdmi_codec  (ALSA sound card)
hdmi_codec -> dw-hdmi-gp-audio -> hdmi_pai

hdmi_codec is registered by dw-hdmi-gp-audio.c,  hdmi_codec will call
the function in dw-hdmi-gp-audio.c, dw-hdmi-gp-audio.c will call the
function in hdmi pai driver.

Aud2htx is cpu dai in ALSA
hdmi-codec.c is the codec dai in ALSA
Above is the dai link for ALSA, they already exist in the kernel.

The HDMI PAI is the bridge, which is covered by this patch set.

Best regards
Shengjiu Wang
>
> Best regards,
> Krzysztof
>
