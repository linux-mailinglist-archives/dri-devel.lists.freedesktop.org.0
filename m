Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D51D56CFD3A
	for <lists+dri-devel@lfdr.de>; Thu, 30 Mar 2023 09:46:07 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 65FA510ED17;
	Thu, 30 Mar 2023 07:46:03 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lj1-x22f.google.com (mail-lj1-x22f.google.com
 [IPv6:2a00:1450:4864:20::22f])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E0DD910ED17
 for <dri-devel@lists.freedesktop.org>; Thu, 30 Mar 2023 07:46:01 +0000 (UTC)
Received: by mail-lj1-x22f.google.com with SMTP id z42so18657097ljq.13
 for <dri-devel@lists.freedesktop.org>; Thu, 30 Mar 2023 00:46:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1680162360;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=nlsAIfgz3tNTbPcSJOM8AmcV3t9QarxssZviO5N+nsQ=;
 b=S5wnc0YoQzIgL60odhcYMAoXYa14GT02S5K/7LM9L/2/R1PP2Jz6cMrr30/vxuzL7R
 54p2VL6niA3uEoI9YokXmaNKW5nAbBWdywFzb72H/JIwapN1Vn5NrNznzEfAMRw2jp9/
 lj3koyPJjzbO9r+jZxtFqLFnXOkCau91qTTN19e2Y0PjJoVcoRxLw+O7AuKfeGGRdAQW
 lzKeTCAvfFzdD+lNW923CyryT9zcWqIruAEvGHEI8gQfV8ke2z9PKn/WHLFnMP5vFXAI
 1X40cELZXZVki2KTNnaDaeXB7nGEhGz4eKZ++gAz6N9qPqRbQJwN5d13lIv9OK5JdWGj
 w9Aw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1680162360;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=nlsAIfgz3tNTbPcSJOM8AmcV3t9QarxssZviO5N+nsQ=;
 b=8P6OuKe/EM1LraMFXvh51A02t63aM3xXc5A3Co+iun9L8O0siLJYg+lCmRrzEDq00i
 gte+1TBJnxoDaZMlTeqoSWtO4Hc4FM51PKJvnTlLLJ90bd+07jjStK4RaoA/uSnFt6j7
 s6V/TAdBh4PCCVIKtWvjBzZmsBFWjic6DGOD1eLBrqn8/a4aJn0b9xwsQTVnM+0AE05q
 Xle5peHmA9/JT0x8deHpNVs8npKCOcZWXHS60AHjJ74xQDuy6GtTwoL/E7d3PXTEPWUu
 25TFm26s5fdCyEgUMEOzxO2a7ZMsAWjtaE3byhzW8vZqbanWXbyBbJEyZgO1qfsHpXYg
 7kYg==
X-Gm-Message-State: AAQBX9cZTgb9UqZD00kFaPsVjl0KZXYizbhtyLR9xnbSkNEVsNl5BaMl
 OYJhUV/oiZEckuDdkfnc9Yfbj+wLv3fJr+yx6L0=
X-Google-Smtp-Source: AKy350aJ8AR1pqF97tn3ofOCqbVV2j8G8SZ2N39MfQguUMvlMkfditHbHyz+GCHiVsIw9vbkPDCYjw==
X-Received: by 2002:a2e:9c01:0:b0:29b:964e:693d with SMTP id
 s1-20020a2e9c01000000b0029b964e693dmr7001118lji.42.1680162359814; 
 Thu, 30 Mar 2023 00:45:59 -0700 (PDT)
Received: from [192.168.0.21] (78-11-189-27.static.ip.netia.com.pl.
 [78.11.189.27]) by smtp.gmail.com with ESMTPSA id
 k23-20020a2e92d7000000b002a5f38ef2e1sm1787152ljh.59.2023.03.30.00.45.59
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 30 Mar 2023 00:45:59 -0700 (PDT)
Message-ID: <70959d98-f205-4bd6-4ab4-d14f45ab0542@linaro.org>
Date: Thu, 30 Mar 2023 09:45:58 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.9.0
Subject: Re: [PATCH 1/2] dt-bindings: display: bridge: ldb: Add i.MX6SX support
Content-Language: en-US
To: Fabio Estevam <festevam@gmail.com>, neil.armstrong@linaro.org
References: <20230329130413.683636-1-festevam@gmail.com>
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20230329130413.683636-1-festevam@gmail.com>
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
Cc: marex@denx.de, devicetree@vger.kernel.org, Fabio Estevam <festevam@denx.de>,
 dri-devel@lists.freedesktop.org, robh+dt@kernel.org,
 krzysztof.kozlowski+dt@linaro.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 29/03/2023 15:04, Fabio Estevam wrote:
> From: Fabio Estevam <festevam@denx.de>
> 
> i.MX6SX has a single LVDS port and share a similar LDB_CTRL register
> layout with i.MX8MP and i.MX93.
> 
> Signed-off-by: Fabio Estevam <festevam@denx.de>
> ---
>  .../devicetree/bindings/display/bridge/fsl,ldb.yaml   | 11 +++++++++++
>  1 file changed, 11 insertions(+)
> 
> diff --git a/Documentation/devicetree/bindings/display/bridge/fsl,ldb.yaml b/Documentation/devicetree/bindings/display/bridge/fsl,ldb.yaml
> index 6e0e3ba9b49e..4f842bcfba1a 100644
> --- a/Documentation/devicetree/bindings/display/bridge/fsl,ldb.yaml
> +++ b/Documentation/devicetree/bindings/display/bridge/fsl,ldb.yaml
> @@ -17,6 +17,7 @@ description: |
>  properties:
>    compatible:
>      enum:
> +      - fsl,imx6sx-ldb
>        - fsl,imx8mp-ldb
>        - fsl,imx93-ldb
>  
> @@ -60,6 +61,16 @@ required:
>    - ports
>  
>  allOf:
> +  - if:
> +      properties:
> +        compatible:
> +          contains:
> +            const: fsl,imx6sx-ldb
> +    then:
> +      properties:
> +        ports:
> +          properties:
> +            port@2: false

Don't duplicate entire if needlessly. It's the same as other one, so add
your compatible there.

Best regards,
Krzysztof

