Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 9E9686D270D
	for <lists+dri-devel@lfdr.de>; Fri, 31 Mar 2023 19:51:43 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8596910E31C;
	Fri, 31 Mar 2023 17:51:41 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-x32c.google.com (mail-wm1-x32c.google.com
 [IPv6:2a00:1450:4864:20::32c])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 009BB10E31C
 for <dri-devel@lists.freedesktop.org>; Fri, 31 Mar 2023 17:51:37 +0000 (UTC)
Received: by mail-wm1-x32c.google.com with SMTP id
 r19-20020a05600c459300b003eb3e2a5e7bso14411461wmo.0
 for <dri-devel@lists.freedesktop.org>; Fri, 31 Mar 2023 10:51:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20210112; t=1680285096;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=QOsJVLNV3+8fzg2WVgYT6QH9y+i4e/+1YV4NKgsfyIU=;
 b=UQfsgOE9zWKSVm7VgqAUlMS6A5K0moAw7rhqbNGiP69ZoKSDDhgZXqEPnSsMQ68IJ7
 uWaRpgAIUiC9qAJqNAhYdVzfwr0h3JTrAtRrRFMh5YAzqTqGdOHZzKYQ9v+ZLFishvip
 b71sXRpxuQ2rEgDfYNljsi3yaGW3CbBDyHAz+hp7tq/EsoRZ0qwDVS0L5mAUAnUrHT1E
 g73XdSJ4NgCL5/1tnz8f+9e5oX1fNkp/uJtIN76/COQSV/tIO/avQYtEtbx0EA5px9ik
 wfAm7JraN/IiTaf+v6BJ4axOVJ/aC4DnzyyYTV17ZdHRSyp/oCx1zt/CHvhGlm2CKVpg
 h+3g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1680285096;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=QOsJVLNV3+8fzg2WVgYT6QH9y+i4e/+1YV4NKgsfyIU=;
 b=w701d92kkcme4baaHT4mCebl7ASA8Z//2/AXl1vQRx23XNvvS88XZpOkphMdZ5/E/s
 JTuKJVy4S0RNjcxcp2l1s8oLIsui7ARuv2Zxq4Q24kFASJ6d3GTC/0HaVz469Forixhe
 u46zazJ/dHOc7ovEpx5jMZ+ygp2lVTKvjLMCSRc1Op1Z63SlZS376TIu+g4zbLGk9pOo
 +h6lBLz5BXq16+d/c2E9qkvrL1hU9VhV1qT47/ijEGCCqIL4dGwjxTxnDlYAQJRcOGKf
 PSocBMDcoQ6zhk9dUS4d9ajJukEXFQ9ROO0vH7Xj3fT7l/cV31s8Z+o2saPQa62TtDHm
 8ZgQ==
X-Gm-Message-State: AO0yUKVV9e/MZrn5ifK2ZUds/wleK6rx+QY2e9ZR2JV29i+OWb9ItQxy
 74PZgeCnENbwwAjndSQB7Ig=
X-Google-Smtp-Source: AK7set9qL57gN72OV9S+5J0UH2Mo0pOzFKVUyACDaKG9cENwMUTAiW0fK4UhZJR7VMOAvyIF4sA6Qg==
X-Received: by 2002:a7b:c850:0:b0:3ee:93c8:4a6f with SMTP id
 c16-20020a7bc850000000b003ee93c84a6fmr21425955wml.32.1680285096304; 
 Fri, 31 Mar 2023 10:51:36 -0700 (PDT)
Received: from [192.168.2.177] ([207.188.167.132])
 by smtp.gmail.com with ESMTPSA id
 p12-20020a05600c358c00b003ef6f87118dsm10827597wmq.42.2023.03.31.10.51.33
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 31 Mar 2023 10:51:35 -0700 (PDT)
Message-ID: <42193fd5-b1f3-81ff-f76f-b11490ef2a94@gmail.com>
Date: Fri, 31 Mar 2023 19:51:33 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.6.1
Subject: Re: [PATCH 15/21] dt-bindings: soc: mediatek: add display mutex for
 MT8365 SoC
Content-Language: en-US
To: Alexandre Mergnat <amergnat@baylibre.com>, Daniel Vetter
 <daniel@ffwll.ch>, CK Hu <ck.hu@mediatek.com>,
 Jitao Shi <jitao.shi@mediatek.com>, Thierry Reding
 <thierry.reding@gmail.com>, Philipp Zabel <p.zabel@pengutronix.de>,
 Sam Ravnborg <sam@ravnborg.org>, Rob Herring <robh+dt@kernel.org>,
 =?UTF-8?Q?Uwe_Kleine-K=c3=b6nig?= <u.kleine-koenig@pengutronix.de>,
 Chun-Kuang Hu <chunkuang.hu@kernel.org>, David Airlie <airlied@gmail.com>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Xinlei Lee <xinlei.lee@mediatek.com>
References: <20230220-display-v1-0-45cbc68e188b@baylibre.com>
 <20230220-display-v1-15-45cbc68e188b@baylibre.com>
From: Matthias Brugger <matthias.bgg@gmail.com>
In-Reply-To: <20230220-display-v1-15-45cbc68e188b@baylibre.com>
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
Cc: Neil Armstrong <neil.armstrong@linaro.org>, linux-pwm@vger.kernel.org,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 Fabien Parent <fparent@baylibre.com>, devicetree@vger.kernel.org,
 linux-mediatek@lists.infradead.org, Guillaume La Roque <glaroque@baylibre.com>,
 linux-arm-kernel@lists.infradead.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>



On 09/03/2023 15:23, Alexandre Mergnat wrote:
> Add compatible for the MT8365 SoC.
> 
> Signed-off-by: Alexandre Mergnat <amergnat@baylibre.com>

Applied, thanks!

> ---
>   Documentation/devicetree/bindings/soc/mediatek/mediatek,mutex.yaml | 1 +
>   1 file changed, 1 insertion(+)
> 
> diff --git a/Documentation/devicetree/bindings/soc/mediatek/mediatek,mutex.yaml b/Documentation/devicetree/bindings/soc/mediatek/mediatek,mutex.yaml
> index ca0ca549257d..931d66893dff 100644
> --- a/Documentation/devicetree/bindings/soc/mediatek/mediatek,mutex.yaml
> +++ b/Documentation/devicetree/bindings/soc/mediatek/mediatek,mutex.yaml
> @@ -34,6 +34,7 @@ properties:
>         - mediatek,mt8186-mdp3-mutex
>         - mediatek,mt8192-disp-mutex
>         - mediatek,mt8195-disp-mutex
> +      - mediatek,mt8365-disp-mutex
>   
>     reg:
>       maxItems: 1
> 
