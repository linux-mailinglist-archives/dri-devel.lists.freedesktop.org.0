Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id B4A44629A22
	for <lists+dri-devel@lfdr.de>; Tue, 15 Nov 2022 14:28:02 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8F1E410E3D9;
	Tue, 15 Nov 2022 13:27:58 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lj1-x22b.google.com (mail-lj1-x22b.google.com
 [IPv6:2a00:1450:4864:20::22b])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2932A10E3D9
 for <dri-devel@lists.freedesktop.org>; Tue, 15 Nov 2022 13:27:55 +0000 (UTC)
Received: by mail-lj1-x22b.google.com with SMTP id u2so17491656ljl.3
 for <dri-devel@lists.freedesktop.org>; Tue, 15 Nov 2022 05:27:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=4CAGamBCwJlvXGLjsJzY/wgNzAR0V/YSmcsK0zwqq8s=;
 b=eOK41ApNBaa1GYLru+QjrijP97HhH673awTACRDo3sALtzQSYyrsfwshQB5pe/xFov
 mvDrfBKEX1V9nCTI9dovVaGRj3X5q6dcQs+aPxwrVBF08OwN+oy9Lm06DABE84im/FxT
 DSKzd+ciO7KT6G2KaLdoRYOc34B0PYts1TZBsAWmbs78ZJH2mNAXFL/3fAOBacsb6oDu
 W7y0qDdtcQ/Bho5unyaESb2EWaEg1f67d3MH7DRtPw75HDMihLJxKb+iImDSiqkLEwmB
 E/CVJKY/dnZqeY9FOxaKBte0IPJjOVxYQf7ORRb6xrcknSYI1dbuyWWk2XmgCo/tDDq+
 c2mg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=4CAGamBCwJlvXGLjsJzY/wgNzAR0V/YSmcsK0zwqq8s=;
 b=itL4C2AW1CslKKCJK3pZABUVrNpyp4VYxZPIwn72upv6zIREhNXxe05X5mq1hNW5a8
 FskVzUL6kIEWNgpxPuunCjyrLT+0otlHtTUQCf3xLiPThu21f6CxwvoGKWH4Q8QbI5g2
 4NJSlH13m5Ys/BgKQPzeyIu4y43afglxOvOo0ORiFoZXJ2AS4u6EwLpeEhv4rCpHIwye
 DVbO+p8XBFlZifmHj+kBg8zxbQ++h413oD80lGEwYrtJ7wHazpMthFzEDupuvqrXqwYm
 bOdkZV3Ifj6bxaZgkpbo0bZXYFrHzaZV7OsNqqnjYQs+7PvVpM7EW7N2B2fpRZM1ZBUa
 OlGQ==
X-Gm-Message-State: ANoB5pnDR8z17w4kcaJuLAOuWjKFbjYRAmcW4VgLvUcTKfQbtmJ2bYg9
 WDgIIGZ1PpbcoyyWplR+0nPBrw==
X-Google-Smtp-Source: AA0mqf6fJcy47gcfAUV27JcgRnri6g7fOH0qrvTrYn9j65yLVWJYl+kJXAMipdsNznLO/OeMb88E6A==
X-Received: by 2002:a2e:b1c7:0:b0:277:794:cb84 with SMTP id
 e7-20020a2eb1c7000000b002770794cb84mr6071216lja.7.1668518873539; 
 Tue, 15 Nov 2022 05:27:53 -0800 (PST)
Received: from [192.168.0.20]
 (088156142067.dynamic-2-waw-k-3-2-0.vectranet.pl. [88.156.142.67])
 by smtp.gmail.com with ESMTPSA id
 t10-20020a195f0a000000b0049c86ca95bfsm2205747lfb.52.2022.11.15.05.27.51
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 15 Nov 2022 05:27:52 -0800 (PST)
Message-ID: <5deca781-90e6-4f72-1abc-cb0bd4777187@linaro.org>
Date: Tue, 15 Nov 2022 14:27:51 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.4.2
Subject: Re: [PATCH v3 09/10] dt-bindings: phy: Add Cadence HDP-TX HDMI PHY
Content-Language: en-US
To: Sandor Yu <Sandor.yu@nxp.com>, dri-devel@lists.freedesktop.org,
 devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org, linux-phy@lists.infradead.org,
 andrzej.hajda@intel.com, neil.armstrong@linaro.org, robert.foss@linaro.org,
 Laurent.pinchart@ideasonboard.com, jonas@kwiboo.se,
 jernej.skrabec@gmail.com, vkoul@kernel.org
References: <cover.1667911321.git.Sandor.yu@nxp.com>
 <a88409e6003fbb2a57df36ef4116a2cdb1c1eec1.1667911321.git.Sandor.yu@nxp.com>
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <a88409e6003fbb2a57df36ef4116a2cdb1c1eec1.1667911321.git.Sandor.yu@nxp.com>
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
 linux-imx@nxp.com, kernel@pengutronix.de, shawnguo@kernel.org,
 maxime@cerno.tech
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 08/11/2022 14:00, Sandor Yu wrote:
> Add bindings for Cadence HDP-TX HDMI PHY.
> 
> Signed-off-by: Sandor Yu <Sandor.yu@nxp.com>
> ---
>  .../bindings/phy/cdns,hdptx-hdmi-phy.yaml     | 50 +++++++++++++++++++
>  1 file changed, 50 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/phy/cdns,hdptx-hdmi-phy.yaml
> 
> diff --git a/Documentation/devicetree/bindings/phy/cdns,hdptx-hdmi-phy.yaml b/Documentation/devicetree/bindings/phy/cdns,hdptx-hdmi-phy.yaml
> new file mode 100644
> index 000000000000..c2ed17ffe6ef
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/phy/cdns,hdptx-hdmi-phy.yaml
> @@ -0,0 +1,50 @@
> +# SPDX-License-Identifier: (GPL-2.0 OR BSD-2-Clause)
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/phy/cdns,hdptx-hdmi-phy.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: Cadence HDP-TX(HDMI/DisplayPort) PHY for HDMI protocol
> +
> +maintainers:
> +  - Sandor Yu <sandor.yu@nxp.com>
> +
> +properties:
> +  compatible:
> +    enum:
> +      - cdns,hdptx-hdmi-phy
> +
> +  reg:
> +    maxItems: 1
> +
> +  clocks:
> +    items:
> +      description:

Same problem.


Best regards,
Krzysztof

