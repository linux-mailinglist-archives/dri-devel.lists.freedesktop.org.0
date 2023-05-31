Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 06DAF7189CD
	for <lists+dri-devel@lfdr.de>; Wed, 31 May 2023 21:06:52 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3E48110E1E5;
	Wed, 31 May 2023 19:06:47 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ej1-x634.google.com (mail-ej1-x634.google.com
 [IPv6:2a00:1450:4864:20::634])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6873210E1E5
 for <dri-devel@lists.freedesktop.org>; Wed, 31 May 2023 19:06:44 +0000 (UTC)
Received: by mail-ej1-x634.google.com with SMTP id
 a640c23a62f3a-96f5d651170so282261166b.1
 for <dri-devel@lists.freedesktop.org>; Wed, 31 May 2023 12:06:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1685560002; x=1688152002;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=yR7IN/rJmbW/7sc8ydTiLPthUafqqH/Du1ORqrZgWWg=;
 b=o78KcazMr6xQ4rfYIG/MI2lJw3SPhYcP/anXxXwf/QirEg3eLc3JBqJEygjdozMb7T
 XMuj5WnUIXQWbN4bOrUXg89LTE5tOW/ueBje9/PlO/HCVoCoImvsiinSkYELAGzQ98fD
 Bjxs6XBXr1XXVIqtc4vHLr/UaV5Ye4W0GirbhdyWHMA2teayX/xQYH72cbQbjVdoCHSy
 dsbJsltwxpL1qnbq250cq/HzKvCtF7Fbr6Pg7/iHzFSMoRWOBGNfuJ33nyOyu2jDRwig
 IH4E+3idZlHhTmH2FQsN7NEvZv2e38wha9gZt9dSjToPxbHLyLZpxUNsI0fpArlzE8zs
 yiGw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1685560002; x=1688152002;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=yR7IN/rJmbW/7sc8ydTiLPthUafqqH/Du1ORqrZgWWg=;
 b=H2NQm/rCPDoAGnfzls5LMlNZt+d25FoBgCAiBdPh0pdTzwhb3L/5LJInOkkRzgx/Aj
 eWR4rIDP6DukNe2W0KjT3/4yU+reJB3MfHmJHIEbJ2ngW0tAyZWY5Y+AWdHwNTDXXbJ/
 6P+Uk5yDaqij3Zp+M4WXJ5gLgQZOmfqD6ZfXyTmJum5RZFxeQVbp/iKqkk+VLLJW9FKs
 QcRwD2p2vRoE6GBHYWEKM+WK7uYZxB4qL5zgNOj9cAljnSM7HVQo986qqcX+bjHP1FC/
 dphspvZNfACYeYEki83iUlgWHhzDb2hrzKJubUVL508VmQGOAePmsUd0fklrhCGa4Jf4
 Y8Yw==
X-Gm-Message-State: AC+VfDwEe0IN7HkSm0zmaC5mY2PwFK+5OL7keKnahCdbHDSulLISr3Xu
 RvzY8XNYYrXAMYwALNO7CSd71g==
X-Google-Smtp-Source: ACHHUZ6Gjg4u5HI2TPqwWF8w/xRRnBF6kJtCaMF4P1k+1aswfie5jogdRnQ0Qklx1CUCHyCnNq/pyg==
X-Received: by 2002:a17:907:2d27:b0:94e:4285:390c with SMTP id
 gs39-20020a1709072d2700b0094e4285390cmr6798209ejc.10.1685560002373; 
 Wed, 31 May 2023 12:06:42 -0700 (PDT)
Received: from [192.168.1.20] ([178.197.199.204])
 by smtp.gmail.com with ESMTPSA id
 md7-20020a170906ae8700b0094edbe5c7ddsm9404066ejb.38.2023.05.31.12.06.39
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 31 May 2023 12:06:41 -0700 (PDT)
Message-ID: <cfd657bc-59ba-e63b-beb9-1661b8195a95@linaro.org>
Date: Wed, 31 May 2023 21:06:38 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.11.0
Subject: Re: [PATCH v4 1/8] dt-bindings: display: mediatek: add MT8195 hdmi
 bindings
Content-Language: en-US
To: Guillaume Ranquet <granquet@baylibre.com>,
 Chunfeng Yun <chunfeng.yun@mediatek.com>,
 Kishon Vijay Abraham I <kishon@ti.com>, Vinod Koul <vkoul@kernel.org>,
 Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Matthias Brugger <matthias.bgg@gmail.com>,
 Chun-Kuang Hu <chunkuang.hu@kernel.org>,
 Philipp Zabel <p.zabel@pengutronix.de>, David Airlie <airlied@gmail.com>,
 Daniel Vetter <daniel@ffwll.ch>, CK Hu <ck.hu@mediatek.com>,
 Jitao shi <jitao.shi@mediatek.com>
References: <20220919-v4-0-687f09a06dd9@baylibre.com>
 <20220919-v4-1-687f09a06dd9@baylibre.com>
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20220919-v4-1-687f09a06dd9@baylibre.com>
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
 dri-devel@lists.freedesktop.org, mac.shen@mediatek.com,
 stuart.lee@mediatek.com, linux-mediatek@lists.infradead.org,
 linux-arm-kernel@lists.infradead.org,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 29/05/2023 16:30, Guillaume Ranquet wrote:
> Add mt8195 SoC bindings for hdmi and hdmi-ddc
> 
> On mt8195 the ddc i2c controller is part of the hdmi IP block and thus has no
> specific register range, power domain or interrupt, making it simpler
> than the legacy "mediatek,hdmi-ddc" binding.
> 
> Signed-off-by: Guillaume Ranquet <granquet@baylibre.com>


Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

Best regards,
Krzysztof

