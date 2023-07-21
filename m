Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 3AE0875C1DE
	for <lists+dri-devel@lfdr.de>; Fri, 21 Jul 2023 10:42:23 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1D02B10E638;
	Fri, 21 Jul 2023 08:42:19 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-x133.google.com (mail-lf1-x133.google.com
 [IPv6:2a00:1450:4864:20::133])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BD51A10E638
 for <dri-devel@lists.freedesktop.org>; Fri, 21 Jul 2023 08:42:17 +0000 (UTC)
Received: by mail-lf1-x133.google.com with SMTP id
 2adb3069b0e04-4fb77f21c63so2664639e87.2
 for <dri-devel@lists.freedesktop.org>; Fri, 21 Jul 2023 01:42:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1689928936; x=1690533736;
 h=content-transfer-encoding:in-reply-to:from:references:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=W6TNcuJ6KKeyZP2Qc4jlyhOYba3uwyITx3koQ5jSwOo=;
 b=HXARkpRe+Woy704jzyCB1PGGko82xLt9OG7PhRKVf+T/dDXg/HTeom6C04EO5/KTSg
 uYLQjum3/vFCHKVQR/H42P89Zp/H7rCobL+opuva5lCb6QODJZtrBr5CReJQt3lPWrD5
 lLWX+0+ZvOmqlBw/qvFGk1Id30q4dTNFPr6hEvPjGk3QZkp0Py47WpAKQ/l2ewGR7MOu
 gkxtsCSWZ9TYYIe4Z421Q1FxfjHKeyD8G2RorBxM+RSGqU/auqsWMhmL0AYVhcKUBZzC
 dcBGpsNMQ6LpJ6pPfof+QKchRCWK+Gt7CtMGjuIK8PfhnA9t39mQspBKhPJumjSVwNJr
 1p1w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1689928936; x=1690533736;
 h=content-transfer-encoding:in-reply-to:from:references:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=W6TNcuJ6KKeyZP2Qc4jlyhOYba3uwyITx3koQ5jSwOo=;
 b=TKo668fuxghU0mjuVp57HhMNKJQTUncL0OKjuZGM78zo3yeu0IY36EWpMFtDFT43Qe
 vChCKXQ0nbIEkC3WfF0dQaExdBUl8khpVpkqrPxduusjYc+qIi6ZF/23SNr4WBayQdRl
 d8KmjXmZ6Hg+zC4nOyLanZ9X51RTADjsZJ909s2PTP1AZuhIwgGtjDHIVSG6UL2/FyJy
 usNrwFFmUug09zuymT4+ndQhs96VWKg1aSecaQjhkjLuecjcdonrAIKXey91Jms/Ek/o
 PxJQjKzLSEAVtaTXVTodzoUigqDzL/42ennffllXrdBlU7viOcTiIVFymvXR9TWP13Sv
 3qCA==
X-Gm-Message-State: ABy/qLYpy3vp3qjEvPNaxcyMotL+4jtgN0fFLn94FG+9M96N1wGzfJf+
 /ROmOpj5XX0ReLm5sa40RJV9+Q==
X-Google-Smtp-Source: APBJJlGKtETxxAKILcgSa+Bf4sk10TjgrNYisDXsNrKRx2MGlhPI/YEZW67N87KY8IC80WmfTGivlQ==
X-Received: by 2002:ac2:5225:0:b0:4f8:711b:18b0 with SMTP id
 i5-20020ac25225000000b004f8711b18b0mr866706lfl.3.1689928935769; 
 Fri, 21 Jul 2023 01:42:15 -0700 (PDT)
Received: from [192.168.1.20] ([178.197.223.104])
 by smtp.gmail.com with ESMTPSA id
 d15-20020a5d644f000000b003143c06135bsm3570899wrw.50.2023.07.21.01.42.14
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 21 Jul 2023 01:42:15 -0700 (PDT)
Message-ID: <5b9ceb0e-b7e4-d4b3-461e-c70f4a01fa5e@linaro.org>
Date: Fri, 21 Jul 2023 10:42:13 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.13.0
Subject: Re: [PATCH v3 1/2] dt-bindings: display: add bindings for pcd8544
 displays
Content-Language: en-US
To: Viktar Simanenka <viteosen@gmail.com>, David Airlie <airlied@gmail.com>,
 Daniel Vetter <daniel@ffwll.ch>, Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Conor Dooley <conor+dt@kernel.org>, dri-devel@lists.freedesktop.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20230720124026.356603-1-viteosen@gmail.com>
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20230720124026.356603-1-viteosen@gmail.com>
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 20/07/2023 14:40, Viktar Simanenka wrote:
> Add device tree binding documentation for PCD8544 LCD display controller.
> 
> Signed-off-by: Viktar Simanenka <viteosen@gmail.com>
> ---
> v3:add a little more description to the exposed vendor properties
>    add commit message finally
> v2 link: https://lore.kernel.org/linux-devicetree/20230719154450.620410-1-viteosen@gmail.com/
> 
>  .../bindings/display/nxp,pcd8544.yaml         | 95 +++++++++++++++++++
>  1 file changed, 95 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/display/nxp,pcd8544.yaml
> 
> diff --git a/Documentation/devicetree/bindings/display/nxp,pcd8544.yaml b/Documentation/devicetree/bindings/display/nxp,pcd8544.yaml
> new file mode 100644
> index 000000000000..bacdeff9776e
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/display/nxp,pcd8544.yaml
> @@ -0,0 +1,95 @@
> +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/display/nxp,pcd8544.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: Philips Semiconductors PCD8544 LCD Display Controller
> +
> +maintainers:
> +  - Viktar Simanenka <viteosen@gmail.com>
> +
> +description: |
> +  Philips Semiconductors PCD8544 LCD Display Controller with SPI control bus.
> +  Designed to drive a graphic display of 48 rows and 84 columns,
> +  such as Nokia 5110/3310 LCDs.
> +
> +allOf:
> +  - $ref: panel/panel-common.yaml#

This is not a panel, is it?

> +  - $ref: /schemas/spi/spi-peripheral-props.yaml#
> +

Best regards,
Krzysztof

