Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 32C50673EE3
	for <lists+dri-devel@lfdr.de>; Thu, 19 Jan 2023 17:32:23 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2422B10E9B5;
	Thu, 19 Jan 2023 16:32:20 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-x333.google.com (mail-wm1-x333.google.com
 [IPv6:2a00:1450:4864:20::333])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E67D410E9B7
 for <dri-devel@lists.freedesktop.org>; Thu, 19 Jan 2023 16:32:16 +0000 (UTC)
Received: by mail-wm1-x333.google.com with SMTP id
 m5-20020a05600c4f4500b003db03b2559eso1671754wmq.5
 for <dri-devel@lists.freedesktop.org>; Thu, 19 Jan 2023 08:32:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=kISsw3ka351W71cdTlHfeqvj1tDvB34A5YrxX8eaPhY=;
 b=NSkj7iMOP2CnoZNIaPDjSKL+KKbshuGz1XlGid8CesKFWQes8jnfg7LV5VtSmrraMS
 4tR3Ms9c3Ea8vM5JnC4FPTfui6ag0x7JhjwkdG+EhvtZlddPLFr1VYagyWzDyxLJX/NV
 OgWCLU8qqBpnGmAvPLyEXPJbtgPiSsXtFDwcggKhzVYAYHGbYubjEkp12f0WK1NNymvv
 /jvkTZr+i5oi9sYME7TkSchyaT/pOjy5TG0ciQRQwiLiHXeeMY7268YO+ZosuXuq1tGA
 mpUg42XC2S12FRBRwFo81tmmkDCFCLzwniZxI/NU4Y2gDmmrWvefRcxBFnqkWDRFiNR9
 q60Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=kISsw3ka351W71cdTlHfeqvj1tDvB34A5YrxX8eaPhY=;
 b=yg+NWcP8B8lvzwoF5AO8SBb6p8TdUESgsYHXbRDonFeLAXXTBYFXiS6tW0Y1H9YDtt
 CfXl9t1wl6DCK9HbWQHSWNYdGPl7GpwCTOMU96h1Pf3wrfaeI7bdNltdF7a2J4cGbaPR
 ugotQ0WfYTgYhVs/nWvvoQ6pwXPFzIlaURY3om0D2qa39hG10JZMsK1Uzs1wV1uNXLlc
 xSndwqW7A+qQiKeEW9LwiwVnuff5X5IMju+734apmoR4dgDKCDd95/sEsJB+KCNsdXMm
 dbc8Dj12Fa2ZrtbZj4B4IbISHB6mb/m+NElGGMVs4IyKk0iFf8e3biiktBn0fd30fr7l
 GsNg==
X-Gm-Message-State: AFqh2kqYRimH7uv+3evUlGcivItfOBby+isRO3xWHcKX2CH9gRCK3Luj
 fOS0JKuPfW5p6JX8B/oTjQI=
X-Google-Smtp-Source: AMrXdXv9EBtbXnsYULYPFoJNloy6O/ErN/hAcWIoch5i2nj40w/DPTMPhwgaX6fLP3mKWsam8/XI7A==
X-Received: by 2002:a05:600c:c16:b0:3da:26e5:10b6 with SMTP id
 fm22-20020a05600c0c1600b003da26e510b6mr11197814wmb.30.1674145935484; 
 Thu, 19 Jan 2023 08:32:15 -0800 (PST)
Received: from [192.168.2.177] ([207.188.167.132])
 by smtp.gmail.com with ESMTPSA id
 fk6-20020a05600c0cc600b003a84375d0d1sm5193380wmb.44.2023.01.19.08.32.14
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 19 Jan 2023 08:32:15 -0800 (PST)
Message-ID: <c0026ce0-caca-1ca2-dc4c-72d14078de6f@gmail.com>
Date: Thu, 19 Jan 2023 17:32:13 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.6.1
Subject: Re: [PATCH v2 8/9] dt-bindings: display: mediatek: Fix the fallback
 for mediatek,mt8186-disp-ccorr
Content-Language: en-US
To: Allen-KH Cheng <allen-kh.cheng@mediatek.com>,
 Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Chun-Kuang Hu <chunkuang.hu@kernel.org>,
 Philipp Zabel <p.zabel@pengutronix.de>, David Airlie <airlied@gmail.com>,
 Daniel Vetter <daniel@ffwll.ch>, Stephen Boyd <sboyd@kernel.org>,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
 dri-devel@lists.freedesktop.org
References: <20230118091829.755-1-allen-kh.cheng@mediatek.com>
 <20230118091829.755-9-allen-kh.cheng@mediatek.com>
From: Matthias Brugger <matthias.bgg@gmail.com>
In-Reply-To: <20230118091829.755-9-allen-kh.cheng@mediatek.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
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
 Project_Global_Chrome_Upstream_Group@mediatek.com,
 linux-mediatek@lists.infradead.org, hsinyi@chromium.org,
 linux-arm-kernel@lists.infradead.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>



On 18/01/2023 10:18, Allen-KH Cheng wrote:
> The mt8186-disp-ccorr is not fully compatible with the mt8183-disp-ccorr
> implementation. It causes a crash when system resumes if it binds to the
> device.
> 
> We should use mt8192-disp-ccorr as fallback of mt8186-disp-ccorr.
> 
> Fixes: 8a26ea19d4dc ("dt-bindings: display: mediatek: add MT8186 SoC binding")
> Signed-off-by: Allen-KH Cheng <allen-kh.cheng@mediatek.com>
> Reviewed-by: Rob Herring <robh@kernel.org>

Reviewed-by: Matthias Brugger <matthias.bgg@gmail.com>

> ---
>   .../devicetree/bindings/display/mediatek/mediatek,ccorr.yaml    | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/Documentation/devicetree/bindings/display/mediatek/mediatek,ccorr.yaml b/Documentation/devicetree/bindings/display/mediatek/mediatek,ccorr.yaml
> index 63fb02014a56..117e3db43f84 100644
> --- a/Documentation/devicetree/bindings/display/mediatek/mediatek,ccorr.yaml
> +++ b/Documentation/devicetree/bindings/display/mediatek/mediatek,ccorr.yaml
> @@ -32,7 +32,7 @@ properties:
>         - items:
>             - enum:
>                 - mediatek,mt8186-disp-ccorr
> -          - const: mediatek,mt8183-disp-ccorr
> +          - const: mediatek,mt8192-disp-ccorr
>   
>     reg:
>       maxItems: 1
