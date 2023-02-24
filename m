Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 5DF2E6A19C5
	for <lists+dri-devel@lfdr.de>; Fri, 24 Feb 2023 11:16:07 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 10EFF10E84F;
	Fri, 24 Feb 2023 10:16:03 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-x32c.google.com (mail-wm1-x32c.google.com
 [IPv6:2a00:1450:4864:20::32c])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C114210E84F
 for <dri-devel@lists.freedesktop.org>; Fri, 24 Feb 2023 10:16:00 +0000 (UTC)
Received: by mail-wm1-x32c.google.com with SMTP id
 t25-20020a1c7719000000b003eb052cc5ccso1326580wmi.4
 for <dri-devel@lists.freedesktop.org>; Fri, 24 Feb 2023 02:16:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=EK/pgDUArBGDlWlhMCFaCK72bY1hOVuO3X2s45L1HUw=;
 b=XS8QLB4b2RJCaLW8agzMJqOk0+FJG90O6WobXXNccvnc5zyr7zB25DOu5qZRchPc0M
 ZZbmYY/+2XdvjHgZXPnF7Arl0/IOqd7U150pjvCJcyDBueSWS/FWN4YZrFdQvFGqjSxT
 s4+DWXzmXf9/muGQ9ZjWcD9UsxzXvAILT1/8ObNutwF9QRRVzBYVMJBOFqSvPD8qQ6aN
 n2jrTiAlK2/pO1aUqYLDjnwtECVm8nfcsl3Rnc9rbOBYoIqCWgj7RRBtu3ENHGNYO3GA
 la/L/wWYi/kimn0tiNeSAB5PlAnZwLde+xEfP6mkWLQxnfEm5Cy3MHpUPb8+B4Wttdp/
 vxyg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=EK/pgDUArBGDlWlhMCFaCK72bY1hOVuO3X2s45L1HUw=;
 b=KElzRsKpock4PXJMsys1gq8J7nvbcNG/LM5+Wxs7JWkpeOA6YkcTT7vdESX4Wt/H+X
 aDidKc1DBmj4wMEC7xVXQ4LRbRqlxB6btg9UBNWUfyIzWBXZS5fGoKKi5D9GN5Yz91nf
 8fM9SOjNb82QJfjmtKoh3YzUbafU63QsQhFNOwPAqe2aqHgMQc58qN/AvAvWWJJEqCSb
 MIP0YszSyVwKb8uoFJuuXaudiYeL9P4G/y2wpHzNoecp5uqrTvshfw3iCyGX2K9lvFIT
 5FP6Z5RZKFYgNwFsquK26Vj0tg9qIntR9bbVIl/GUVuQpfAuFBnhUnrbsXCU53DLXS4k
 KjKw==
X-Gm-Message-State: AO0yUKXMO1epetq/mr09XOvHSp5Os1kBuLzjVkp65FEfThd7xo5kcgOG
 LfD/QIpZ+j7Lh/1bRqpA5W6ekA==
X-Google-Smtp-Source: AK7set//sOeJ6yfMcZNqW9A5CgabKnheWeFJx+hUkJlWbpQd1DFPL8N1VUfsNnQ6RDhMmSaYyDmGuA==
X-Received: by 2002:a05:600c:13d4:b0:3eb:29fe:70df with SMTP id
 e20-20020a05600c13d400b003eb29fe70dfmr347817wmg.35.1677233759199; 
 Fri, 24 Feb 2023 02:15:59 -0800 (PST)
Received: from [192.168.1.20] ([178.197.216.144])
 by smtp.gmail.com with ESMTPSA id
 c16-20020a05600c0ad000b003e214803343sm2220728wmr.46.2023.02.24.02.15.57
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 24 Feb 2023 02:15:58 -0800 (PST)
Message-ID: <f754b5a3-3268-9e97-858c-8aa9e5b8c55c@linaro.org>
Date: Fri, 24 Feb 2023 11:15:56 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.8.0
Subject: Re: [PATCH v3 01/11] dt-bindings: gpu: mali-bifrost: Add
 power-domain-names to base schema
Content-Language: en-US
To: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
 airlied@gmail.com
References: <20230223133440.80941-1-angelogioacchino.delregno@collabora.com>
 <20230223133440.80941-2-angelogioacchino.delregno@collabora.com>
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20230223133440.80941-2-angelogioacchino.delregno@collabora.com>
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
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, steven.price@arm.com, robh+dt@kernel.org,
 linux-mediatek@lists.infradead.org, alyssa.rosenzweig@collabora.com,
 krzysztof.kozlowski+dt@linaro.org, wenst@chromium.org, matthias.bgg@gmail.com,
 linux-arm-kernel@lists.infradead.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 23/02/2023 14:34, AngeloGioacchino Del Regno wrote:
> From: Chen-Yu Tsai <wenst@chromium.org>
> 
> In commit a7a596cd3115 ("dt-bindings: gpu: mali-bifrost: Add Mediatek
> MT8183"), "power-domain-names" was added to the mt8183-mali sub-schema,
> but was not added to the base mali-bifrost schema. Because validation
> happens for the base schema and any sub-schemas separately, this causes
> errors to be emitted when validating the MT8183 device trees.
> 
> Add power-domain-names to the base schema to silence the error.
> 
> Fixes: a7a596cd3115 ("dt-bindings: gpu: mali-bifrost: Add Mediatek MT8183")
> Signed-off-by: Chen-Yu Tsai <wenst@chromium.org>
> Signed-off-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
> ---
>  Documentation/devicetree/bindings/gpu/arm,mali-bifrost.yaml | 3 +++
>  1 file changed, 3 insertions(+)
> 
> diff --git a/Documentation/devicetree/bindings/gpu/arm,mali-bifrost.yaml b/Documentation/devicetree/bindings/gpu/arm,mali-bifrost.yaml
> index 78964c140b46..02699d389be1 100644
> --- a/Documentation/devicetree/bindings/gpu/arm,mali-bifrost.yaml
> +++ b/Documentation/devicetree/bindings/gpu/arm,mali-bifrost.yaml
> @@ -65,6 +65,8 @@ properties:
>      minItems: 1
>      maxItems: 3
>  
> +  power-domain-names: true

Symmetric to power-domains, so min/maxItems.


Best regards,
Krzysztof

