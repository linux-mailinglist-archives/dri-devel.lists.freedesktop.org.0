Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id E21D554046D
	for <lists+dri-devel@lfdr.de>; Tue,  7 Jun 2022 19:12:10 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 77ABA10EDCE;
	Tue,  7 Jun 2022 17:12:07 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ed1-x536.google.com (mail-ed1-x536.google.com
 [IPv6:2a00:1450:4864:20::536])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 006B210EDCE
 for <dri-devel@lists.freedesktop.org>; Tue,  7 Jun 2022 17:12:05 +0000 (UTC)
Received: by mail-ed1-x536.google.com with SMTP id er5so23832994edb.12
 for <dri-devel@lists.freedesktop.org>; Tue, 07 Jun 2022 10:12:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:in-reply-to:content-transfer-encoding;
 bh=516c1ECeAdlTDYUv5SFW9WeHPEyFi2CPyVtGYdPkmAE=;
 b=dMWz8Fu3pnpw7EgoHQ8AoC3kGZ93ymrLgYNbUyChqTuJIaSdzlRMJYc2hThjfcvEwT
 xisRuno3peKuEKyqG+5tPELfFRBU2Y3AYcY56udOuCNl/HXC1GmQ44uxO5QgK53f83Ad
 jGFl9UVWsMqBujvYjmJ+ZL9zUiF2uoWE69PYXzH3dFDPvPYQtjKC21JkJLLCjPF9fcmP
 rJGzJo1Rh85V9h7gtjh0eSNaxu74ud8uzRJHGaIkkpDV2Q5u2UvTWGQKFUOHlQ9jGig4
 Z90ZJ6sS0msIRaYbPtWA/3DmV8Wg9rL3ldvq7sKcFIkCI4Y10GyX446hKN+OpDc4ETQP
 PP4A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=516c1ECeAdlTDYUv5SFW9WeHPEyFi2CPyVtGYdPkmAE=;
 b=U9Rd5VQV+9Or1//Rk96XFjOFV/fnVkZNAADFAEBCLF1qAihmKD5KliJACwv1sIvmZl
 +D3mKddWubcALlnSudSp2J4NW1mf95e0Jx7zfMXAgY2FYwWzeqXaqROylXmLpsnDXVSk
 3Y7cj/P6h7Ahc2AuIAIWBH148fR+QeiVi7MEj/LUB/vyrIGEz/EokqvnzvuittMiLHmM
 u7pc4UaKHsu/PLjLv846doHMlZkKwPVJOsdqiKnRA0ZyS27Lce9E/lqmzQzN/cxucUX2
 mJno1qVE17uxEOfT1iHjY3SCxo54elH6z0LBbFqezXQH7aKpFwXL26lFG31ZEunVt87z
 MO+Q==
X-Gm-Message-State: AOAM531dZQlNtd5JuZA9rg1+iRi38mrXPkm8hw8beR9oLFdi2LRBW764
 wi2iAzeCwZ6eJWwYG2Jzz0ZzeQ==
X-Google-Smtp-Source: ABdhPJzvpSk0Qjg661liVIKltScH0Q9G3bh+JG3VX3DkiOZwIcBf4+cWHgZ6prLeIuDfqneiTvvBwg==
X-Received: by 2002:a05:6402:35c9:b0:431:3b5f:ecc1 with SMTP id
 z9-20020a05640235c900b004313b5fecc1mr18641630edc.349.1654621924477; 
 Tue, 07 Jun 2022 10:12:04 -0700 (PDT)
Received: from [192.168.0.186] (xdsl-188-155-176-92.adslplus.ch.
 [188.155.176.92]) by smtp.gmail.com with ESMTPSA id
 d19-20020a056402145300b0043151e18630sm4521204edx.21.2022.06.07.10.12.02
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 07 Jun 2022 10:12:03 -0700 (PDT)
Message-ID: <cd9b1212-0950-9fd8-7481-e3ef14de2131@linaro.org>
Date: Tue, 7 Jun 2022 19:12:01 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.10.0
Subject: Re: [PATCH v4 1/3] dt-bindings: mediatek: add vdosys1 RDMA definition
 for mt8195
Content-Language: en-US
To: Bo-Chen Chen <rex-bc.chen@mediatek.com>, chunkuang.hu@kernel.org,
 p.zabel@pengutronix.de, robh+dt@kernel.org, krzysztof.kozlowski+dt@linaro.org
References: <20220606031818.13646-1-rex-bc.chen@mediatek.com>
 <20220606031818.13646-2-rex-bc.chen@mediatek.com>
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20220606031818.13646-2-rex-bc.chen@mediatek.com>
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
Cc: devicetree@vger.kernel.org, airlied@linux.ie, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org,
 Project_Global_Chrome_Upstream_Group@mediatek.com,
 "Nancy.Lin" <nancy.lin@mediatek.com>, linux-mediatek@lists.infradead.org,
 pavel@ucw.cz, matthias.bgg@gmail.com, linux-arm-kernel@lists.infradead.org,
 angelogioacchino.delregno@collabora.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 06/06/2022 05:18, Bo-Chen Chen wrote:
> From: "Nancy.Lin" <nancy.lin@mediatek.com>
> 
> Add vdosys1 RDMA definition.
> 
> Signed-off-by: Nancy.Lin <nancy.lin@mediatek.com>
> Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
> Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
> Tested-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
> Signed-off-by: Bo-Chen Chen <rex-bc.chen@mediatek.com>
> ---
>  .../display/mediatek/mediatek,mdp-rdma.yaml   | 88 +++++++++++++++++++
>  1 file changed, 88 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/display/mediatek/mediatek,mdp-rdma.yaml
> 
> diff --git a/Documentation/devicetree/bindings/display/mediatek/mediatek,mdp-rdma.yaml b/Documentation/devicetree/bindings/display/mediatek/mediatek,mdp-rdma.yaml
> new file mode 100644
> index 000000000000..678abb321cc2
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/display/mediatek/mediatek,mdp-rdma.yaml
> @@ -0,0 +1,88 @@
> +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/display/mediatek/mediatek,mdp-rdma.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: MediaTek MDP RDMA
> +
> +maintainers:
> +  - Chun-Kuang Hu <chunkuang.hu@kernel.org>
> +  - Philipp Zabel <p.zabel@pengutronix.de>
> +
> +description:
> +  The MediaTek MDP RDMA stands for Read Direct Memory Access.
> +  It provides real time data to the back-end panel driver, such as DSI,
> +  DPI and DP_INTF.
> +  It contains one line buffer to store the sufficient pixel data.
> +  RDMA device node must be siblings to the central MMSYS_CONFIG node.
> +  For a description of the MMSYS_CONFIG binding, see
> +  Documentation/devicetree/bindings/arm/mediatek/mediatek,mmsys.yaml for details.
> +
> +properties:
> +  compatible:
> +    - const: mediatek,mt8195-vdo1-rdma

During my review I missed that part. But your testing should not miss it
- please always run `make dt_bindings_check` and do not send code which
fails.

Best regards,
Krzysztof
