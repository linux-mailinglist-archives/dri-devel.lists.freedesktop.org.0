Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id E019B6A83DF
	for <lists+dri-devel@lfdr.de>; Thu,  2 Mar 2023 14:53:52 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9DDA110E06D;
	Thu,  2 Mar 2023 13:53:48 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ed1-x532.google.com (mail-ed1-x532.google.com
 [IPv6:2a00:1450:4864:20::532])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EAC7C10E06D
 for <dri-devel@lists.freedesktop.org>; Thu,  2 Mar 2023 13:53:46 +0000 (UTC)
Received: by mail-ed1-x532.google.com with SMTP id o12so67823989edb.9
 for <dri-devel@lists.freedesktop.org>; Thu, 02 Mar 2023 05:53:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1677765225;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=RZof/087BHj/A7Di0Gk0ZvGDmMzbyQKiyv3HZhGN3xw=;
 b=eIrtPDV/cG8h0VLLmJcXXTWUO8Jg3Qo6HxP4dQkg9P3u0Fn6CodkeQxrfuFSWYlIoj
 tfIZfDFPjIHCEBAJzzbDOFKm9caoaq/ph9xh8bmKh8AyGlpjlFEvOV4rXrtiIVXTIrBR
 23vID2oLuqovDF5EzpYqFN2O8vmNHGs8LJ7+7O0SiDuLFKL1Z13H4GCKPiglMKmMxeT2
 l2qcAWfjunTGjvlsMDG+mzt5qlHNipEcD9etIEHdgO3jpbgPMjeOtDMzFsCabgzjWJXa
 ABCSsGkpWfAjylMv7OyQ3r2TBByagPRD7uKsOEQQ+FMjkDfpcTP/qXCroIW86e/r98Cq
 E4ug==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1677765225;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=RZof/087BHj/A7Di0Gk0ZvGDmMzbyQKiyv3HZhGN3xw=;
 b=KdlNZtLOnPbrfT4wy+iSuwfRLZ2StO2Xw1wRrP6SeBDmGAqM2c2hsSKZzhSq+F4sFJ
 ktiGFA4rvlg2+zCIeZErZUi8h01M8UUV/yqHvxo+Myqy6fO1faUC0ULXth3xDbkP1LCz
 oah37UY8r636udPHAZ8eBdlxIORoht1n3W+o3xV2p4DgZCPZ+bAKsmET1/OGaQfFZdyA
 Hb8ciC6HksFEJKX8sygo4mR4EYLxavltxjdFHY5PYhTPlSz9qtUIbJlisqzIOglDjfo+
 9vF81aYVxg67HifbkA1pmbH7mVjI1DJZd+sTKKIylA5bCWZoYNNlPx2Zw7kVVPQJuuik
 lr0Q==
X-Gm-Message-State: AO0yUKXGlzJyFlr3mycb9hxsSgbGFB0IILItgDBj32lgN8p1BgKCG8+d
 dj7Wg9VDuWKpZbI8Xm/zyZ3XHQ==
X-Google-Smtp-Source: AK7set8qp/TQ+HJrn0Ii4dY4rTO5h8nKaJSn7kxrv2Kr+qtuoSVN+2tgswoIzGGoQ+TvT/Nh/UeqMA==
X-Received: by 2002:a17:906:dc90:b0:888:5d34:dc79 with SMTP id
 cs16-20020a170906dc9000b008885d34dc79mr14548417ejc.40.1677765225322; 
 Thu, 02 Mar 2023 05:53:45 -0800 (PST)
Received: from [192.168.1.20] ([178.197.216.144])
 by smtp.gmail.com with ESMTPSA id
 z2-20020a5096c2000000b004bfc59042e5sm962328eda.61.2023.03.02.05.53.37
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 02 Mar 2023 05:53:41 -0800 (PST)
Message-ID: <33edb557-f5c6-6ce1-2914-bcab2eca23c3@linaro.org>
Date: Thu, 2 Mar 2023 14:53:36 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.8.0
Subject: Re: [PATCH] dt-bindings: display: mediatek: Compatible list cleanup
Content-Language: en-US
To: Yassine Oudjana <yassine.oudjana@gmail.com>,
 Chun-Kuang Hu <chunkuang.hu@kernel.org>,
 Philipp Zabel <p.zabel@pengutronix.de>, David Airlie <airlied@gmail.com>,
 Daniel Vetter <daniel@ffwll.ch>, Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Alexandre Torgue <alexandre.torgue@foss.st.com>,
 Matthias Brugger <matthias.bgg@gmail.com>,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
References: <20230302133528.124113-1-y.oudjana@protonmail.com>
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20230302133528.124113-1-y.oudjana@protonmail.com>
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
Cc: devicetree@vger.kernel.org, Yassine Oudjana <y.oudjana@protonmail.com>,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 linux-mediatek@lists.infradead.org, linux-stm32@st-md-mailman.stormreply.com,
 linux-arm-kernel@lists.infradead.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 02/03/2023 14:35, Yassine Oudjana wrote:
> From: Yassine Oudjana <y.oudjana@protonmail.com>
> 
> Several DT bindings of MediaTek display blocks make unnecessary use of
> "oneOf" and "items", and have some enums with only 1 element. Remove
> unnecessary "oneOf" and "items", and replace enums that have 1 element
> with "const".	
> 
> Signed-off-by: Yassine Oudjana <y.oudjana@protonmail.com>
> ---
>  .../bindings/display/mediatek/mediatek,aal.yaml  |  3 +--
>  .../display/mediatek/mediatek,ccorr.yaml         | 10 ++++------
>  .../display/mediatek/mediatek,color.yaml         | 10 ++++------
>  .../display/mediatek/mediatek,dither.yaml        |  3 +--
>  .../bindings/display/mediatek/mediatek,dsc.yaml  |  4 +---
>  .../display/mediatek/mediatek,gamma.yaml         |  7 +++----
>  .../display/mediatek/mediatek,merge.yaml         |  8 +++-----
>  .../bindings/display/mediatek/mediatek,od.yaml   |  8 +++-----
>  .../display/mediatek/mediatek,ovl-2l.yaml        | 10 ++++------
>  .../bindings/display/mediatek/mediatek,ovl.yaml  | 16 ++++++----------
>  .../display/mediatek/mediatek,postmask.yaml      |  3 +--
>  .../bindings/display/mediatek/mediatek,rdma.yaml | 13 +++++--------
>  .../display/mediatek/mediatek,split.yaml         |  4 +---
>  .../bindings/display/mediatek/mediatek,ufoe.yaml |  4 +---
>  .../bindings/display/mediatek/mediatek,wdma.yaml |  4 +---
>  15 files changed, 39 insertions(+), 68 deletions(-)
> 
> diff --git a/Documentation/devicetree/bindings/display/mediatek/mediatek,aal.yaml b/Documentation/devicetree/bindings/display/mediatek/mediatek,aal.yaml
> index 92741486c24d..d8d78abd6c6c 100644
> --- a/Documentation/devicetree/bindings/display/mediatek/mediatek,aal.yaml
> +++ b/Documentation/devicetree/bindings/display/mediatek/mediatek,aal.yaml
> @@ -25,8 +25,7 @@ properties:
>            - mediatek,mt8173-disp-aal
>            - mediatek,mt8183-disp-aal
>        - items:
> -          - enum:
> -              - mediatek,mt2712-disp-aal
> +          - const: mediatek,mt2712-disp-aal

This was I think intentional - it will grow. The same in all other
one-enum cases, it might be unnecessary change which soon will be
reverted converting back to enum.

>            - const: mediatek,mt8173-disp-aal
>        - items:
>            - enum:
> diff --git a/Documentation/devicetree/bindings/display/mediatek/mediatek,ccorr.yaml b/Documentation/devicetree/bindings/display/mediatek/mediatek,ccorr.yaml
> index b04820c95b22..e72d2884bb49 100644
> --- a/Documentation/devicetree/bindings/display/mediatek/mediatek,ccorr.yaml
> +++ b/Documentation/devicetree/bindings/display/mediatek/mediatek,ccorr.yaml
> @@ -21,18 +21,16 @@ description: |
>  properties:
>    compatible:
>      oneOf:
> -      - items:
> -          - const: mediatek,mt8183-disp-ccorr
> -      - items:
> -          - const: mediatek,mt8192-disp-ccorr
> +      - enum:
> +          - mediatek,mt8183-disp-ccorr
> +          - mediatek,mt8192-disp-ccorr

Such changes are fine.



Best regards,
Krzysztof

