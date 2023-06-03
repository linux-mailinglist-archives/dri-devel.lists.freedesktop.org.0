Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 5040B7211B9
	for <lists+dri-devel@lfdr.de>; Sat,  3 Jun 2023 21:10:07 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 62C1B10E148;
	Sat,  3 Jun 2023 19:10:05 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ej1-x62c.google.com (mail-ej1-x62c.google.com
 [IPv6:2a00:1450:4864:20::62c])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B5D0510E148
 for <dri-devel@lists.freedesktop.org>; Sat,  3 Jun 2023 19:10:03 +0000 (UTC)
Received: by mail-ej1-x62c.google.com with SMTP id
 a640c23a62f3a-96fab30d1e1so702514966b.0
 for <dri-devel@lists.freedesktop.org>; Sat, 03 Jun 2023 12:10:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1685819401; x=1688411401;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=c/1fXZdlFrD4ZTMnSyIek5ravNGSg+bm7NeK4UcfZ5I=;
 b=XGWSGPhc+xt9lfYE3ElzKDuGrJr3WUc1F9NreSgchCvhk9+TGEXaB0X+FKeFhLa4Ul
 dBWwVA0PU7u3A9Gb/r9/YacGuXlVlqHEu42aPrlpEXXDzJscOc1SF0ShHSQse0Oj/chT
 QLovyIjmr92pscaSYQIt6uY5CA4K46N++1MwTW+XvEsqSbFTIBJVPKBUnQcFshqSmfQK
 AlKleHL2WPQjWo13ySdvQFAtO3k6DRkLK4/THrSTOZf+p2O7ixH3ctDfYqgLUS+Hg85I
 68k9+su4xAFbe2lICX5JB6tswOOT4SmDCXRpHWHpjtOEseiVoM9V54Gs8SlVtQ7YAqlA
 6tmA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1685819401; x=1688411401;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=c/1fXZdlFrD4ZTMnSyIek5ravNGSg+bm7NeK4UcfZ5I=;
 b=N3uQvxZM7M36cG0D5n6fh0kbIlMBhN25srkj75RPejk6yESP8K1La4ZzxyBzxEAdwU
 7cBG1nPJFHSAbroMWUY5uhhEfr90IL9GjZOwJlzimJWn7y1o8/C9jKKRrZOwkOIu6xWY
 t8zADQ6yvDIhPt5HkiaZ3Hr0NtDHpTFDqioOdVApU7BpSBs8raI/dScSxtcAH3f1CPPl
 +6GKm/cj8GtE6HYCQhJusmu0cRIqbYFJusbeyRhZqlbRJiZ8hlHSO9nbbSnR55tSpFmS
 UruKCAnIBfQRpBWGh2sjz8smNwbFobW8o4xNVj7fv/84aOjMOPuuwb0aB7RSm1RilcDG
 MW5w==
X-Gm-Message-State: AC+VfDym5B1ujTj/LSAnMxlFwSILB/PngMo6MJdfW4ToGb6b9jPXtW6b
 hlg5P8pn3c408SZA+JPVetkA1g==
X-Google-Smtp-Source: ACHHUZ4RopHcJJ7GF3SSU2ePLu5DlX+l9IkWhVj+EuFjvR5yyF0baMdpGCWtH8xOXILm4qx46Z8pUw==
X-Received: by 2002:a17:906:5d0a:b0:974:5bd2:1807 with SMTP id
 g10-20020a1709065d0a00b009745bd21807mr2096976ejt.24.1685819401691; 
 Sat, 03 Jun 2023 12:10:01 -0700 (PDT)
Received: from [192.168.1.20] ([178.197.199.204])
 by smtp.gmail.com with ESMTPSA id
 bi1-20020a170906a24100b009664cdb3fc5sm2218126ejb.138.2023.06.03.12.09.59
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sat, 03 Jun 2023 12:10:01 -0700 (PDT)
Message-ID: <d354734e-c8d1-2d75-fec4-e91bb322bbe2@linaro.org>
Date: Sat, 3 Jun 2023 21:09:58 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.11.2
Subject: Re: [PATCH v3 1/3] dt-bindings: phy: add PHY_TYPE_CDPHY definition
Content-Language: en-US
To: Julien Stephan <jstephan@baylibre.com>
References: <20230524083033.486490-1-jstephan@baylibre.com>
 <20230524083033.486490-2-jstephan@baylibre.com>
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20230524083033.486490-2-jstephan@baylibre.com>
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
Cc: Kishon Vijay Abraham I <kishon@kernel.org>,
 Chun-Kuang Hu <chunkuang.hu@kernel.org>, Conor Dooley <conor+dt@kernel.org>,
 devicetree@vger.kernel.org, khilman@baylibre.com, mkorpershoek@baylibre.com,
 Matthias Brugger <matthias.bgg@gmail.com>, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, linux-phy@lists.infradead.org,
 Vinod Koul <vkoul@kernel.org>, Rob Herring <robh+dt@kernel.org>,
 linux-mediatek@lists.infradead.org, Andy Hsieh <andy.hsieh@mediatek.com>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Chunfeng Yun <chunfeng.yun@mediatek.com>, linux-arm-kernel@lists.infradead.org,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 24/05/2023 10:30, Julien Stephan wrote:
> Add definition for CDPHY phy type that can be configured in either D-PHY
> mode or C-PHY mode
> 
> Signed-off-by: Julien Stephan <jstephan@baylibre.com>
> ---
>  include/dt-bindings/phy/phy.h | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/include/dt-bindings/phy/phy.h b/include/dt-bindings/phy/phy.h
> index 6b901b342348..a19d85dbbf16 100644
> --- a/include/dt-bindings/phy/phy.h
> +++ b/include/dt-bindings/phy/phy.h
> @@ -23,5 +23,6 @@
>  #define PHY_TYPE_DPHY		10
>  #define PHY_TYPE_CPHY		11
>  #define PHY_TYPE_USXGMII	12
> +#define PHY_TYPE_CDPHY		13

I don't think there is CD phy. It is D-PHY or C-PHY. This is not for all
possible combinations but just types of phy.

Best regards,
Krzysztof

