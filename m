Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 5978661984A
	for <lists+dri-devel@lfdr.de>; Fri,  4 Nov 2022 14:42:16 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8780C10E7D5;
	Fri,  4 Nov 2022 13:42:11 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-qv1-xf2b.google.com (mail-qv1-xf2b.google.com
 [IPv6:2607:f8b0:4864:20::f2b])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B04AF10E7D5
 for <dri-devel@lists.freedesktop.org>; Fri,  4 Nov 2022 13:42:07 +0000 (UTC)
Received: by mail-qv1-xf2b.google.com with SMTP id lf15so2757737qvb.9
 for <dri-devel@lists.freedesktop.org>; Fri, 04 Nov 2022 06:42:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=MMyaU86qb4lTKUtNgTOCQdes/+rIt6nWq/bdQaeuknw=;
 b=y5AvJPLRIMXwWZKc9jQP4A0V2azYRNxYIGFEBK6zxdr0llR3PO3cPe/5eJ242K4uwN
 Zij0h6pVcg8wDkxm/WOE2YmaUdosKO8QFIViEDlUSgL/ajC76Gis3Uucn6gh2HB2EsnE
 N6TxBBJeG3bE1h0x6XvIa9lGfNzPPyEJVPHE84Tz/c10mQsqVWwhoV79GhsKCLruBeR9
 P3tPgh0HNehK2u2SiUZss624PlZ+p6XN9Hq1EjOE5vzb0sTfFqiegqYbj4pANSlbAjEh
 lhIlE2elDDn3CWXjewkAid0fDSPzj3Q7Gwjs4vt3UqR1MoXw/l8enGaDxV+i8XeBe9ym
 zhYw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=MMyaU86qb4lTKUtNgTOCQdes/+rIt6nWq/bdQaeuknw=;
 b=JhROUgx2cbXgxp+Hb6tahUyqCIJHL8LJXZDqRKdGliaRgVahq+AAelGOUUKiHIARjJ
 C3ISsTopsxwFy1OaIjdKnA+WyrQV2MqJE6sDUIlKMSFGctihOceGJFwbFRyCWBWUUhy0
 vFssQdCS0kr8UzIsltvnOD3T52VBO6YTgxhJWkbwH1FFkQ/TDUCZ15lBFT39P79pLD/2
 49KcKMknpAjANWqzCchJi/dwa9u+JGgTodq5FsOAFN+9SGdBM9bsqU1L1fSwhC78Pp9T
 xDiXxky8Y7YtiZeAZ1OCGLVAXNFlsZxWM16VoTa4pbnT0zDU27OUKdEtq3hO/qCCMYO+
 BRHQ==
X-Gm-Message-State: ACrzQf3SUhGXnhKXnpMM3iWgXYSt8FZp5hzkaUlrCImtRdgA0ieWT5Ef
 oTedIMXuZ2bSMUziNtCaPpY5yA==
X-Google-Smtp-Source: AMsMyM6KTCIg67folrXpvHf9QQEoGa69VsGoeBFBv55wj82oFzf8ryegyUV4HWZc24EW2s7OFcWAuA==
X-Received: by 2002:a05:6214:d0e:b0:4bb:f5db:76ec with SMTP id
 14-20020a0562140d0e00b004bbf5db76ecmr24823843qvh.9.1667569326779; 
 Fri, 04 Nov 2022 06:42:06 -0700 (PDT)
Received: from ?IPV6:2601:586:5000:570:aad6:acd8:4ed9:299b?
 ([2601:586:5000:570:aad6:acd8:4ed9:299b])
 by smtp.gmail.com with ESMTPSA id
 q3-20020a05620a2a4300b006eed47a1a1esm2909548qkp.134.2022.11.04.06.42.04
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 04 Nov 2022 06:42:05 -0700 (PDT)
Message-ID: <d5fb79bc-c05c-8de1-e8a4-9e19cc5c8e1a@linaro.org>
Date: Fri, 4 Nov 2022 09:42:03 -0400
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.4.2
Subject: Re: [v2 02/10] dts-bingings: display: bridge: Add MHDP HDMI bindings
 for i.MX8MQ
Content-Language: en-US
To: Sandor Yu <Sandor.yu@nxp.com>, dri-devel@lists.freedesktop.org,
 devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org, linux-phy@lists.infradead.org,
 andrzej.hajda@intel.com, neil.armstrong@linaro.org, robert.foss@linaro.org,
 Laurent.pinchart@ideasonboard.com, jonas@kwiboo.se,
 jernej.skrabec@gmail.com, kishon@ti.com, vkoul@kernel.org
References: <cover.1667463263.git.Sandor.yu@nxp.com>
 <0e1f631c22207c6af41ea512be85213b3953b44f.1667463263.git.Sandor.yu@nxp.com>
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <0e1f631c22207c6af41ea512be85213b3953b44f.1667463263.git.Sandor.yu@nxp.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
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
Cc: oliver.brown@nxp.com, krzysztof.kozlowski+dt@linaro.org, sam@ravnborg.org,
 jani.nikula@intel.com, tzimmermann@suse.de, s.hauer@pengutronix.de,
 javierm@redhat.com, penguin-kernel@I-love.SAKURA.ne.jp, robh+dt@kernel.org,
 linux-imx@nxp.com, kernel@pengutronix.de, shawnguo@kernel.org, p.yadav@ti.com,
 maxime@cerno.tech
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 04/11/2022 02:44, Sandor Yu wrote:
> Add bindings for i.MX8MQ MHDP HDMI.

Typo in subject - bindings.

Also in the subject - drop redundant second word "bindings".

> 
> Signed-off-by: Sandor Yu <Sandor.yu@nxp.com>
> ---
>  .../display/bridge/cdns,mhdp-imx8mq-hdmi.yaml | 67 +++++++++++++++++++
>  1 file changed, 67 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/display/bridge/cdns,mhdp-imx8mq-hdmi.yaml
> 
> diff --git a/Documentation/devicetree/bindings/display/bridge/cdns,mhdp-imx8mq-hdmi.yaml b/Documentation/devicetree/bindings/display/bridge/cdns,mhdp-imx8mq-hdmi.yaml
> new file mode 100644
> index 000000000000..b2a769d4cb82
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/display/bridge/cdns,mhdp-imx8mq-hdmi.yaml
> @@ -0,0 +1,67 @@
> +# SPDX-License-Identifier: (GPL-2.0 OR BSD-2-Clause)
> +%YAML 1.2
> +---
> +$id: "http://devicetree.org/schemas/display/bridge/cdns,mhdp-imx8mq-hdmi.yaml#"
> +$schema: "http://devicetree.org/meta-schemas/core.yaml#"
> +
> +title: Cadence MHDP HDMI bridge
> +
> +maintainers:
> +  - Sandor Yu <Sandor.yu@nxp.com>
> +
> +description:
> +  The Cadence MHDP TX HDMI interface.
> +
> +properties:
> +  compatible:
> +    enum:
> +      - cdns,mhdp-imx8mq-hdmi
> +
> +  reg:
> +    items:
> +      - description:
> +          Memory mapped base address and length of mhdptx apb registers.

Drop items and descripion and just "maxItems: 1"

> +
> +  phys:
> +    description:
> +      phandle to the HDMI PHY.

Drop description, but instead "maxItems: 1"

> +
> +  phy-names:
> +    items:
> +      - const: hdmiphy

Drop entire phy-names, not useful with one entry matching the name of
theh block.

> +
> +  interrupts:
> +    items:
> +      - description: Hotplug detect interrupter for cable plugin event.
> +      - description: Hotplug detect interrupter for cable plugout event.
> +
> +  interrupt-names:
> +    items:
> +      - const: plug_in
> +      - const: plug_out
> +
> +  port:
> +    $ref: /schemas/graph.yaml#/properties/port
> +    description:
> +      A port node pointing to the output port of a display controller..

Just one '.' at the end.

> +
> +additionalProperties: false
> +
> +examples:
> +  - |
> +    #include <dt-bindings/interrupt-controller/arm-gic.h>
> +    mhdp: mhdp@32c00000 {

Node names should be generic, so hdmi-bridge, display-controller or just
"hdmi"
https://devicetree-specification.readthedocs.io/en/latest/chapter2-devicetree-basics.html#generic-names-recommendation


> +        compatible = "cdns,mhdp-imx8mq-hdmi";
> +        reg = <0x32c00000 0x100000>;


Best regards,
Krzysztof

