Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id F3F1F7F9F7B
	for <lists+dri-devel@lfdr.de>; Mon, 27 Nov 2023 13:23:51 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 494D310E250;
	Mon, 27 Nov 2023 12:23:50 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ej1-x62c.google.com (mail-ej1-x62c.google.com
 [IPv6:2a00:1450:4864:20::62c])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7C35210E250
 for <dri-devel@lists.freedesktop.org>; Mon, 27 Nov 2023 12:23:48 +0000 (UTC)
Received: by mail-ej1-x62c.google.com with SMTP id
 a640c23a62f3a-a0b7f793b8aso239272066b.2
 for <dri-devel@lists.freedesktop.org>; Mon, 27 Nov 2023 04:23:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1701087827; x=1701692627; darn=lists.freedesktop.org;
 h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
 :to:content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=M7CygS/PO90G4qc/2mRV1YYszBcCYh2ZWUTNhxvwvtc=;
 b=JDzZXwO7tLn0g+iqN9c/WRgpbC3H/u8A6ATIJPipSA2ni9y3IszUbgi1OMh5rEG/5n
 HnLu563dUKFUFAPZAl5OfQ0ufOt429Trd0dICxSeunYJlVVqPYs8c/1Wd3czhAL85osU
 Yz79G0loAqoR+TGZkzzdafjKPhhkLz1vWSTJ2i8h1teHgFkvJqPMpHb6s6Jqr0mPtJuW
 j7yUQfa5lJ6N0TjrsKsmZg/Ee5wSO960DBE9X96YdxlbODvC/e1hCdIJ6vlGfnkrV6FU
 Bb+hUh+hT79AsehMuTrqHHWrD0oBXTDRa8UqNnBUQq53zYdDGnh2wepte9FlGP1ZJhNi
 vhwg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1701087827; x=1701692627;
 h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
 :to:content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=M7CygS/PO90G4qc/2mRV1YYszBcCYh2ZWUTNhxvwvtc=;
 b=b5p9dNTzn1m3tpqrRTJgoR46jEDfM7AqKjVDDIeaZRag+579uSZKGMq4x4FvJW+vxl
 qVnhN6wNL495de5bNONEMIYszsOHCWjIAaSpTmLoMDx7C3mRoP+SxHYas7chFOmbcqY6
 vcUe2efSqu+iS8mkUNFTU/Sby5DCn5XbGZjbUB2jS05ohTBHnhp+Jx9lS9YWrM1pkphy
 S3xROlmgGRavFUn3lPjy3MIPZC7BsfXD6asV6fh+vUR7TSjo9JLYsFRd3rmKxpZxgXRn
 OU0CcpwhsnzNsgWH9p3pv55nUB+LVkjeBzUvHswgeUPI+xxAML/9oLQXwJNj9yptdUnv
 3FYg==
X-Gm-Message-State: AOJu0YyexbVqtr7WyssgJn5WHC4pjKHqpJc90+di2BZzphl0U4XFPONM
 LlZcxhiNXPRr6jqikPLWa7LuUA==
X-Google-Smtp-Source: AGHT+IFbTET+o7uLkv685HeoQk9Gn2PXTnWD7L7z89QwhnGciSV+re+d+ZcJ8XhQAbxJZs8QalRXNQ==
X-Received: by 2002:a17:906:194f:b0:a01:3df:a93a with SMTP id
 b15-20020a170906194f00b00a0103dfa93amr9299948eje.23.1701087826795; 
 Mon, 27 Nov 2023 04:23:46 -0800 (PST)
Received: from [192.168.1.20] ([178.197.223.109])
 by smtp.gmail.com with ESMTPSA id
 x24-20020a170906135800b009fc8233fb66sm5625190ejb.36.2023.11.27.04.23.44
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 27 Nov 2023 04:23:46 -0800 (PST)
Message-ID: <7bba5723-97c2-4301-9864-353d8bfda752@linaro.org>
Date: Mon, 27 Nov 2023 13:23:43 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v1 1/2] dt-bindings: display: bridge: cdns: Add properties
 to support StarFive JH7110 SoC
Content-Language: en-US
To: Shengyang Chen <shengyang.chen@starfivetech.com>,
 devicetree@vger.kernel.org, dri-devel@lists.freedesktop.org
References: <20231127113436.57361-1-shengyang.chen@starfivetech.com>
 <20231127113436.57361-2-shengyang.chen@starfivetech.com>
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Autocrypt: addr=krzysztof.kozlowski@linaro.org; keydata=
 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
 D2GYIS41Kv4Isx2dEFh+/Q==
In-Reply-To: <20231127113436.57361-2-shengyang.chen@starfivetech.com>
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
Cc: andrzej.hajda@intel.com, tomi.valkeinen@ideasonboard.com,
 Laurent.pinchart@ideasonboard.com, krzysztof.kozlowski+dt@linaro.org,
 r-ravikumar@ti.com, rfoss@kernel.org, jernej.skrabec@gmail.com,
 u.kleine-koenig@pengutronix.de, conor+dt@kernel.org, jonas@kwiboo.se,
 mripard@kernel.org, robh+dt@kernel.org, neil.armstrong@linaro.org,
 keith.zhao@starfivetech.com, bbrezillon@kernel.org, rdunlap@infradead.org,
 linux-kernel@vger.kernel.org, jack.zhu@starfivetech.com, tzimmermann@suse.de,
 changhuang.liang@starfivetech.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 27/11/2023 12:34, Shengyang Chen wrote:
> From: Keith Zhao <keith.zhao@starfivetech.com>
> 
> Add properties in CDNS DSI yaml file to match with
> CDNS DSI module in StarFive JH7110 SoC.
> 
> Signed-off-by: Keith Zhao <keith.zhao@starfivetech.com>
> ---
>  .../bindings/display/bridge/cdns,dsi.yaml     | 38 ++++++++++++++++++-
>  1 file changed, 36 insertions(+), 2 deletions(-)
> 
> diff --git a/Documentation/devicetree/bindings/display/bridge/cdns,dsi.yaml b/Documentation/devicetree/bindings/display/bridge/cdns,dsi.yaml
> index 23060324d16e..3f02ee383aad 100644
> --- a/Documentation/devicetree/bindings/display/bridge/cdns,dsi.yaml
> +++ b/Documentation/devicetree/bindings/display/bridge/cdns,dsi.yaml
> @@ -17,6 +17,7 @@ properties:
>      enum:
>        - cdns,dsi
>        - ti,j721e-dsi
> +      - starfive,cdns-dsi

BTW, one more thing, I really doubt that starfive created "cdns" block.
"cdns" is vendor prefix. Use SoCs-specific compatibles.

Best regards,
Krzysztof

