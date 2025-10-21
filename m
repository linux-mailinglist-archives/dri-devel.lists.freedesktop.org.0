Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id BCDF1BF5216
	for <lists+dri-devel@lfdr.de>; Tue, 21 Oct 2025 10:02:12 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3488310E165;
	Tue, 21 Oct 2025 08:02:10 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; secure) header.d=ffwll.ch header.i=@ffwll.ch header.b="RJpcBCMc";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ed1-f48.google.com (mail-ed1-f48.google.com
 [209.85.208.48])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EBBA210E165
 for <dri-devel@lists.freedesktop.org>; Tue, 21 Oct 2025 08:02:07 +0000 (UTC)
Received: by mail-ed1-f48.google.com with SMTP id
 4fb4d7f45d1cf-63c523864caso6742446a12.1
 for <dri-devel@lists.freedesktop.org>; Tue, 21 Oct 2025 01:02:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ffwll.ch; s=google; t=1761033726; x=1761638526; darn=lists.freedesktop.org; 
 h=in-reply-to:content-disposition:mime-version:references
 :mail-followup-to:message-id:subject:cc:to:from:date:from:to:cc
 :subject:date:message-id:reply-to;
 bh=mmJ3kbCZYasBy1tdyPRhi15Hy8S31f6BJlgZcjYUhfI=;
 b=RJpcBCMch+nzQlSuX8Zkzee3nCcgFtl/756zxiWCS0Udss7uOGdwRlp2mwEvn05XO2
 PSIWFIOe76J4pUwAjTWATv5Be9jtW9gkGqVEFlWm/wivZGClqFM6Zqxsmt6UZZQjdjzP
 7vK5F41PgDAC8fpKB3J9m/6ERGA2hndvMjZAM=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1761033726; x=1761638526;
 h=in-reply-to:content-disposition:mime-version:references
 :mail-followup-to:message-id:subject:cc:to:from:date
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=mmJ3kbCZYasBy1tdyPRhi15Hy8S31f6BJlgZcjYUhfI=;
 b=tZWOyL2O4NmCbuCHOfu7MrsgjCO1xVBEYmh9McxvULv/PTBYtMfpXPS5ffD5jD4msV
 acgh1Hvjra28zy0dkCzMt3gw5zgf4mPt2QXjMhwyY0AwpmDfi9zMBssvs8STMKr//iu3
 uWLkCgnk5NjfIH6Zq76QrQiDfllv6DoKmRgCIUZ9O45vh1Hiw/QAWERbWsSE0OvMQTv0
 NTTnD3zrnvfLnwDnFuKP5B4y2WHCFGUNGUeXh2Rj7jbGwf0k6IFvdTKqW/JqwBjfRjk6
 zA2xH8fEKWCQLZPQfIg/JVyd5L7oUm3OhgI9lmaQetuRZzz/QVGg5FrrWuxRs/DNCbEz
 L2nw==
X-Forwarded-Encrypted: i=1;
 AJvYcCVAcIJsW1BEfkXDGseO/y9owG58V0OWfXBVSitQToE2QiuCgkZ/yt62lVW2KRPiTKqCf8ze/b3TiFo=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YwULyZK7EP3f9fqUgLvPtqEARYcIlaTSduf0jvHR4rdzrWDiFBs
 dh8jdTQqdAgOBbjQU5clqU0US4mNGSeRFQvZAnPnkwxjkLbCEA/QhkbE1Arz1kAp51s=
X-Gm-Gg: ASbGncuFiA4bCnSEB0nFIWP72OD3uNrYt8BqrjTxiuWONvzjb5mVwLC/xw6iNdl04LG
 6H7cuym03DuoyklzyMQ+IMIw/VsaYA6xIYDHqyPcDim9l4fAywl9SCZWnGaX0lJvbSWXJ4VFSf0
 4QBGLhRFCpdtRVcbd4XZbyoXZdsgIcwWbREiO4qXCPxx6LblzFktJw5cExqBoWnxBkqwEV96Ypc
 Os4Bmpm785YvQddtMfOiABorWtfePBeR/FcfjLPVDXV184LvaLQ7cH/ucjPbY3p3j0+YM1aMpg2
 dTG24b/dxKFNcmHpg07v/eaK0DuukZRo60MdRFq1bQHO9vDbj52UnPvhrLmTRkcbRb0ZP4gzz1X
 JXUp89eXPPT2xj+Dsj3Ozc0rmOWV662LdA1/ZhvSbQfpLUsp9KjI4riX9iBM/Zhn932Whd8m5Vz
 zBZOkdhwRmCQo+1du+alnQWA==
X-Google-Smtp-Source: AGHT+IEQBbHU46zJp3I8qzuqYSyvo8c+5/g/4Db1HXzfzGIE1r78chLA2+YlpgeKvqwNE6fWnrQZTA==
X-Received: by 2002:a05:6402:1471:b0:62e:e722:a3c7 with SMTP id
 4fb4d7f45d1cf-63c1f6345ccmr16006744a12.9.1761033725994; 
 Tue, 21 Oct 2025 01:02:05 -0700 (PDT)
Received: from phenom.ffwll.local ([2a02:168:57f4:0:5485:d4b2:c087:b497])
 by smtp.gmail.com with ESMTPSA id
 4fb4d7f45d1cf-63c494301aasm8934112a12.24.2025.10.21.01.02.04
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 21 Oct 2025 01:02:05 -0700 (PDT)
Date: Tue, 21 Oct 2025 10:02:03 +0200
From: Simona Vetter <simona.vetter@ffwll.ch>
To: Shengjiu Wang <shengjiu.wang@nxp.com>
Cc: andrzej.hajda@intel.com, neil.armstrong@linaro.org, rfoss@kernel.org,
 Laurent.pinchart@ideasonboard.com, jonas@kwiboo.se,
 jernej.skrabec@gmail.com, maarten.lankhorst@linux.intel.com,
 mripard@kernel.org, tzimmermann@suse.de, airlied@gmail.com,
 simona@ffwll.ch, lumag@kernel.org, dianders@chromium.org,
 cristian.ciocaltea@collabora.com, luca.ceresoli@bootlin.com,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 victor.liu@nxp.com, shawnguo@kernel.org, s.hauer@pengutronix.de,
 kernel@pengutronix.de, festevam@gmail.com, imx@lists.linux.dev,
 linux-arm-kernel@lists.infradead.org, robh@kernel.org,
 krzk+dt@kernel.org, conor+dt@kernel.org, p.zabel@pengutronix.de,
 devicetree@vger.kernel.org, l.stach@pengutronix.de,
 shengjiu.wang@gmail.com, perex@perex.cz, tiwai@suse.com,
 linux-sound@vger.kernel.org
Subject: Re: [PATCH v7 1/7] dt-bindings: display: imx: add HDMI PAI for i.MX8MP
Message-ID: <aPc9-wYxGB1KYPyQ@phenom.ffwll.local>
Mail-Followup-To: Shengjiu Wang <shengjiu.wang@nxp.com>,
 andrzej.hajda@intel.com, neil.armstrong@linaro.org,
 rfoss@kernel.org, Laurent.pinchart@ideasonboard.com,
 jonas@kwiboo.se, jernej.skrabec@gmail.com,
 maarten.lankhorst@linux.intel.com, mripard@kernel.org,
 tzimmermann@suse.de, airlied@gmail.com, simona@ffwll.ch,
 lumag@kernel.org, dianders@chromium.org,
 cristian.ciocaltea@collabora.com, luca.ceresoli@bootlin.com,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 victor.liu@nxp.com, shawnguo@kernel.org, s.hauer@pengutronix.de,
 kernel@pengutronix.de, festevam@gmail.com, imx@lists.linux.dev,
 linux-arm-kernel@lists.infradead.org, robh@kernel.org,
 krzk+dt@kernel.org, conor+dt@kernel.org, p.zabel@pengutronix.de,
 devicetree@vger.kernel.org, l.stach@pengutronix.de,
 shengjiu.wang@gmail.com, perex@perex.cz, tiwai@suse.com,
 linux-sound@vger.kernel.org
References: <20250923053001.2678596-1-shengjiu.wang@nxp.com>
 <20250923053001.2678596-2-shengjiu.wang@nxp.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250923053001.2678596-2-shengjiu.wang@nxp.com>
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

On Tue, Sep 23, 2025 at 01:29:55PM +0800, Shengjiu Wang wrote:
> Add binding for the i.MX8MP HDMI parallel Audio interface block.
> 
> The HDMI TX Parallel Audio Interface (HTX_PAI) is a digital module that
> acts as the bridge between the Audio Subsystem to the HDMI TX Controller.
> This IP block is found in the HDMI subsystem of the i.MX8MP SoC.
> 
> Aud2htx module in Audio Subsystem, HDMI PAI module and HDMI TX
> Controller compose the HDMI audio pipeline.
> 
> In fsl,imx8mp-hdmi-tx.yaml, add port@2 that is linked to pai_to_hdmi_tx.
> 
> Signed-off-by: Shengjiu Wang <shengjiu.wang@nxp.com>
> Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
> Tested-by: Alexander Stein <alexander.stein@ew.tq-group.com>

dt patches need an ack from dt maintainers before you push them, please
make sure you follow that for the next changes.
-Sima

> ---
>  .../display/bridge/fsl,imx8mp-hdmi-tx.yaml    | 12 ++++
>  .../display/imx/fsl,imx8mp-hdmi-pai.yaml      | 69 +++++++++++++++++++
>  2 files changed, 81 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/display/imx/fsl,imx8mp-hdmi-pai.yaml
> 
> diff --git a/Documentation/devicetree/bindings/display/bridge/fsl,imx8mp-hdmi-tx.yaml b/Documentation/devicetree/bindings/display/bridge/fsl,imx8mp-hdmi-tx.yaml
> index 05442d437755..6211ab8bbb0e 100644
> --- a/Documentation/devicetree/bindings/display/bridge/fsl,imx8mp-hdmi-tx.yaml
> +++ b/Documentation/devicetree/bindings/display/bridge/fsl,imx8mp-hdmi-tx.yaml
> @@ -49,6 +49,10 @@ properties:
>          $ref: /schemas/graph.yaml#/properties/port
>          description: HDMI output port
>  
> +      port@2:
> +        $ref: /schemas/graph.yaml#/properties/port
> +        description: Parallel audio input port
> +
>      required:
>        - port@0
>        - port@1
> @@ -98,5 +102,13 @@ examples:
>                      remote-endpoint = <&hdmi0_con>;
>                  };
>              };
> +
> +            port@2 {
> +                reg = <2>;
> +
> +                endpoint {
> +                    remote-endpoint = <&pai_to_hdmi_tx>;
> +                };
> +            };
>          };
>      };
> diff --git a/Documentation/devicetree/bindings/display/imx/fsl,imx8mp-hdmi-pai.yaml b/Documentation/devicetree/bindings/display/imx/fsl,imx8mp-hdmi-pai.yaml
> new file mode 100644
> index 000000000000..4f99682a308d
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/display/imx/fsl,imx8mp-hdmi-pai.yaml
> @@ -0,0 +1,69 @@
> +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/display/imx/fsl,imx8mp-hdmi-pai.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: Freescale i.MX8MP HDMI Parallel Audio Interface
> +
> +maintainers:
> +  - Shengjiu Wang <shengjiu.wang@nxp.com>
> +
> +description:
> +  The HDMI TX Parallel Audio Interface (HTX_PAI) is a bridge between the
> +  Audio Subsystem to the HDMI TX Controller.
> +
> +properties:
> +  compatible:
> +    const: fsl,imx8mp-hdmi-pai
> +
> +  reg:
> +    maxItems: 1
> +
> +  interrupts:
> +    maxItems: 1
> +
> +  clocks:
> +    maxItems: 1
> +
> +  clock-names:
> +    const: apb
> +
> +  power-domains:
> +    maxItems: 1
> +
> +  port:
> +    $ref: /schemas/graph.yaml#/properties/port
> +    description: Output to the HDMI TX controller.
> +
> +required:
> +  - compatible
> +  - reg
> +  - interrupts
> +  - clocks
> +  - clock-names
> +  - power-domains
> +  - port
> +
> +additionalProperties: false
> +
> +examples:
> +  - |
> +    #include <dt-bindings/clock/imx8mp-clock.h>
> +    #include <dt-bindings/power/imx8mp-power.h>
> +
> +    audio-bridge@32fc4800 {
> +        compatible = "fsl,imx8mp-hdmi-pai";
> +        reg = <0x32fc4800 0x800>;
> +        interrupt-parent = <&irqsteer_hdmi>;
> +        interrupts = <14>;
> +        clocks = <&clk IMX8MP_CLK_HDMI_APB>;
> +        clock-names = "apb";
> +        power-domains = <&hdmi_blk_ctrl IMX8MP_HDMIBLK_PD_PAI>;
> +
> +        port {
> +            pai_to_hdmi_tx: endpoint {
> +                remote-endpoint = <&hdmi_tx_from_pai>;
> +            };
> +        };
> +    };
> -- 
> 2.34.1
> 

-- 
Simona Vetter
Software Engineer
http://blog.ffwll.ch
