Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 6B11E4EEE5E
	for <lists+dri-devel@lfdr.de>; Fri,  1 Apr 2022 15:43:10 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1FF7010E11B;
	Fri,  1 Apr 2022 13:43:08 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ej1-x62a.google.com (mail-ej1-x62a.google.com
 [IPv6:2a00:1450:4864:20::62a])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 77AD610E11B
 for <dri-devel@lists.freedesktop.org>; Fri,  1 Apr 2022 13:43:07 +0000 (UTC)
Received: by mail-ej1-x62a.google.com with SMTP id p15so5942766ejc.7
 for <dri-devel@lists.freedesktop.org>; Fri, 01 Apr 2022 06:43:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:in-reply-to:content-transfer-encoding;
 bh=kRGQSHbNrQ56sbIjo0fVlJQ0u1ahcNvK7/rx7vN//fU=;
 b=POSigfPFudfJz+V4egSDKxGTnB5HpDAVi2PWRCIkSCMe6zHwz+M1g2gVx3gDoH+OfO
 fU3SrAFaU8TidUv3pLDTkLhlwi1F9PmR2bB0JD5cfPUBRVzdeldYspsi8SrqDWfW+qrf
 IiWaQ05EIeb4DFNYZr8fd9YxkJw+tHSkl1D4U/suibOuTuJoQ7RXlpBtpMhKCnjXOTKA
 c3Mjh6YF4Ic3cMf6WxFZ90yY8HmxJwu4dShVCPM3sVrieRAZLtAznwI8CRWzpH8ntGA0
 jlftKvgtiosy569jtbzNttfcORzAKdvnMHsSIOPWRjeKJN2RbfLZPi2KdPWBLSe0tarE
 ZkzQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=kRGQSHbNrQ56sbIjo0fVlJQ0u1ahcNvK7/rx7vN//fU=;
 b=VBz+udssuQ1NFr1LWJwDX78+xay54TVZNF0qLLS3aOfdrnb8I8g4aCHiJBFApFDibi
 D7ODn82KcBLNHnVeOWXzR3V8rOV0GzUbwD4TPnTHpymlU15yxwF2ZrnMgFvHGbZjKDG3
 7RzWP99lfzZu+dclchgxAlXtTR6YrmCjPLcu5+Fpop7MZFdy85sQQrfEYmcty3/Z43kX
 z5lW/HFbLH4ha94ZsITL4TLZrPl39PkiF3CVl8ftm8ekCIRYmItoQoMO5Ia5wyQm2ToS
 40yTtXPoVumimZRot4KrVosX3S1b6Rz1f/CHLfI6IgzpyrqlW67QJB1j7Pw5fvHuGEHU
 yKgQ==
X-Gm-Message-State: AOAM531zzQ+smwq2aBd9LTRcp+JgN2HD88rH/PHPs6ZqwxhTs8mvZCh6
 /mkSOAI9IYKFze9ASFKS8hKlbg==
X-Google-Smtp-Source: ABdhPJwQ1HtREvWS1HonL2xj33ywp4DkIJSz+zdns6tFyQ93YEsSmnal+eYCLtgrddAv08r12QNvTA==
X-Received: by 2002:a17:907:3f07:b0:6e0:2fa0:2482 with SMTP id
 hq7-20020a1709073f0700b006e02fa02482mr9289837ejc.766.1648820585959; 
 Fri, 01 Apr 2022 06:43:05 -0700 (PDT)
Received: from [192.168.0.170] (xdsl-188-155-201-27.adslplus.ch.
 [188.155.201.27]) by smtp.gmail.com with ESMTPSA id
 q16-20020a170906145000b006bdaf981589sm1046344ejc.81.2022.04.01.06.43.04
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 01 Apr 2022 06:43:05 -0700 (PDT)
Message-ID: <3d03bc18-dd42-002d-739b-230b4134b866@linaro.org>
Date: Fri, 1 Apr 2022 15:43:03 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.7.0
Subject: Re: [PATCH 1/4] dt-bindings: vendor-prefixes: Add prefix for SINO
 WEALTH Eletronics Ltd.
Content-Language: en-US
To: Chen-Yu Tsai <wens@kernel.org>,
 Javier Martinez Canillas <javierm@redhat.com>,
 Maxime Ripard <mripard@kernel.org>, Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, David Airlie <airlied@linux.ie>,
 Daniel Vetter <daniel@ffwll.ch>
References: <20220330190846.13997-1-wens@kernel.org>
 <20220330190846.13997-2-wens@kernel.org>
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20220330190846.13997-2-wens@kernel.org>
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
Cc: devicetree@vger.kernel.org, Chen-Yu Tsai <wens@csie.org>,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 30/03/2022 21:08, Chen-Yu Tsai wrote:
> From: Chen-Yu Tsai <wens@csie.org>
> 
> Add a vendor prefix entry for SINO WEALTH Eletronics Ltd.
> (http://www.sinowealth.com).
> 
> Signed-off-by: Chen-Yu Tsai <wens@csie.org>
> ---
>  Documentation/devicetree/bindings/vendor-prefixes.yaml | 2 ++
>  1 file changed, 2 insertions(+)
> 
> diff --git a/Documentation/devicetree/bindings/vendor-prefixes.yaml b/Documentation/devicetree/bindings/vendor-prefixes.yaml
> index 01430973ecec..bb4ae59a3c89 100644
> --- a/Documentation/devicetree/bindings/vendor-prefixes.yaml
> +++ b/Documentation/devicetree/bindings/vendor-prefixes.yaml
> @@ -1128,6 +1128,8 @@ patternProperties:
>      description: Cypress Semiconductor Corporation (Simtek Corporation)
>    "^sinlinx,.*":
>      description: Sinlinx Electronics Technology Co., LTD
> +  "^sinowealth,.*":

Alphabetical order, so after sinovoip

> +    description: SINO WEALTH Electronic Ltd.
>    "^sinovoip,.*":
>      description: SinoVoip Co., Ltd
>    "^sipeed,.*":


Best regards,
Krzysztof
