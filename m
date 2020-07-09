Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id BCDE221AB0A
	for <lists+dri-devel@lfdr.de>; Fri, 10 Jul 2020 00:58:07 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A90556EB4A;
	Thu,  9 Jul 2020 22:58:03 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-il1-f195.google.com (mail-il1-f195.google.com
 [209.85.166.195])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 34FC16EB4A
 for <dri-devel@lists.freedesktop.org>; Thu,  9 Jul 2020 22:58:02 +0000 (UTC)
Received: by mail-il1-f195.google.com with SMTP id t27so3455234ill.9
 for <dri-devel@lists.freedesktop.org>; Thu, 09 Jul 2020 15:58:02 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=EUysYX5gx8v+ALLFOwqd441nucMw0JC5sr5in7urozA=;
 b=mpF4KDcxAKAhf9X/E84n668l6wztTYJ0Mh5tcGuYp+WV3zDQd5LBEZJIsV0rq7gf+o
 jh557eNLTLkWjEsuNMVXY0L3hNprfilf6e/FXAMJILnPT/QOPuqQ9bPSxOZsMW5OIl8w
 aBPizP9XyGi+U7R5uxhCys35Mgq4wyjfrVph9mQ5VRgPnCCR6QxfV7nIM7laPVP+grM7
 75XG8kSNKGsAXIWOS63ScDhDh8DZh18WoFHb+cwUO1Q16fCgWcARI35S/Rsty82ntldt
 4YADPvv6XDrlXPndTe2nGCef47euQBPtVKwzyD2+7FttHhEo8OXmjtt0puCzWdbD727K
 2V1Q==
X-Gm-Message-State: AOAM532m49d3fBjc3YZ6ndWJ89B2XHulJmsBgvAn6SRI92ZnRQLjsbkq
 evs0mlB7l4NsPzZWPjN5Gg==
X-Google-Smtp-Source: ABdhPJwK7B+LuXVaPNciMiac694dleIoNATkdJfhjt6w+WeI4pE+/FDfEN/0wJ7P19KC1zRRRaGygw==
X-Received: by 2002:a92:4101:: with SMTP id o1mr38094648ila.53.1594335481573; 
 Thu, 09 Jul 2020 15:58:01 -0700 (PDT)
Received: from xps15 ([64.188.179.254])
 by smtp.gmail.com with ESMTPSA id v5sm2837555ios.54.2020.07.09.15.58.00
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 09 Jul 2020 15:58:00 -0700 (PDT)
Received: (nullmailer pid 1047705 invoked by uid 1000);
 Thu, 09 Jul 2020 22:57:59 -0000
Date: Thu, 9 Jul 2020 16:57:59 -0600
From: Rob Herring <robh@kernel.org>
To: Laurentiu Palcu <laurentiu.palcu@oss.nxp.com>
Subject: Re: [PATCH v5 4/5] dt-bindings: display: imx: add bindings for DCSS
Message-ID: <20200709225759.GA1040142@bogus>
References: <20200709164736.18291-1-laurentiu.palcu@oss.nxp.com>
 <20200709164736.18291-5-laurentiu.palcu@oss.nxp.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200709164736.18291-5-laurentiu.palcu@oss.nxp.com>
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
Cc: devicetree@vger.kernel.org, Shawn Guo <shawnguo@kernel.org>,
 Sascha Hauer <s.hauer@pengutronix.de>, lukas@mntmn.com,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 NXP Linux Team <linux-imx@nxp.com>,
 Pengutronix Kernel Team <kernel@pengutronix.de>,
 Laurentiu Palcu <laurentiu.palcu@nxp.com>, agx@sigxcpu.org,
 linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Thu, Jul 09, 2020 at 07:47:32PM +0300, Laurentiu Palcu wrote:
> From: Laurentiu Palcu <laurentiu.palcu@nxp.com>
> 
> Add bindings for iMX8MQ Display Controller Subsystem.
> 
> Signed-off-by: Laurentiu Palcu <laurentiu.palcu@nxp.com>
> ---
>  .../bindings/display/imx/nxp,imx8mq-dcss.yaml | 84 +++++++++++++++++++
>  1 file changed, 84 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/display/imx/nxp,imx8mq-dcss.yaml
> 
> diff --git a/Documentation/devicetree/bindings/display/imx/nxp,imx8mq-dcss.yaml b/Documentation/devicetree/bindings/display/imx/nxp,imx8mq-dcss.yaml
> new file mode 100644
> index 000000000000..a951409cf76d
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/display/imx/nxp,imx8mq-dcss.yaml
> @@ -0,0 +1,84 @@
> +# SPDX-License-Identifier: (GPL-2.0 OR BSD-2-Clause)
> +# Copyright 2019 NXP
> +%YAML 1.2
> +---
> +$id: "http://devicetree.org/schemas/display/imx/nxp,imx8mq-dcss.yaml#"
> +$schema: "http://devicetree.org/meta-schemas/core.yaml#"
> +
> +title: iMX8MQ Display Controller Subsystem (DCSS)
> +
> +maintainers:
> +  - Laurentiu Palcu <laurentiu.palcu@nxp.com>
> +
> +description:
> +
> +  The DCSS (display controller sub system) is used to source up to three
> +  display buffers, compose them, and drive a display using HDMI 2.0a(with HDCP
> +  2.2) or MIPI-DSI. The DCSS is intended to support up to 4kp60 displays. HDR10
> +  image processing capabilities are included to provide a solution capable of
> +  driving next generation high dynamic range displays.
> +
> +properties:
> +  compatible:
> +    const: nxp,imx8mq-dcss
> +
> +  reg:
> +    items:
> +      - description: DCSS base address and size, up to IRQ steer start
> +      - description: DCSS BLKCTL base address and size
> +
> +  interrupts:
> +    items:
> +      - description: Context loader completion and error interrupt
> +      - description: DTG interrupt used to signal context loader trigger time
> +      - description: DTG interrupt for Vblank
> +
> +  interrupt-names:
> +    items:
> +      - const: ctxld
> +      - const: ctxld_kick
> +      - const: vblank
> +
> +  clocks:
> +    items:
> +      - description: Display APB clock for all peripheral PIO access interfaces
> +      - description: Display AXI clock needed by DPR, Scaler, RTRAM_CTRL
> +      - description: RTRAM clock
> +      - description: Pixel clock, can be driver either by HDMI phy clock or MIPI
> +      - description: DTRC clock, needed by video decompressor
> +
> +  clock-names:
> +    items:
> +      - const: apb
> +      - const: axi
> +      - const: rtrm
> +      - const: pix
> +      - const: dtrc
> +
> +  port:
> +    type: object
> +    description:
> +      A port node pointing to the input port of a HDMI/DP or MIPI display bridge.

additionalProperties: false

With that,

Reviewed-by: Rob Herring <robh@kernel.org>
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
