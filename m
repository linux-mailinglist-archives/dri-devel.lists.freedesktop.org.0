Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id BD1E4701CD1
	for <lists+dri-devel@lfdr.de>; Sun, 14 May 2023 12:05:59 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EDF0810E0A9;
	Sun, 14 May 2023 10:05:53 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ed1-x534.google.com (mail-ed1-x534.google.com
 [IPv6:2a00:1450:4864:20::534])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3D5BE10E0A9
 for <dri-devel@lists.freedesktop.org>; Sun, 14 May 2023 10:05:51 +0000 (UTC)
Received: by mail-ed1-x534.google.com with SMTP id
 4fb4d7f45d1cf-50bc1612940so20987069a12.2
 for <dri-devel@lists.freedesktop.org>; Sun, 14 May 2023 03:05:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1684058749; x=1686650749;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=AEESkSmM2yg5voafFPesEW8VArx2oSNLqjShFMs/DuM=;
 b=OyLcn1Yv30MUfI8z9ssANMpeZZts+OprdcA/iasJMb1DMpuk1R5D101T5Yu1rj/Zt4
 7a2n5wCr0ZBcql6hmpuMzw/R+9iNvyBs4Ae0DnBhr/UJWMWiICKFdgJQtixVz7Aj93AH
 TzBms5ISW5vsqLODzC/ul2SxCrouPD7n804OjnQQQuXxIgloyac5ehD9/hRQebBF2SHl
 0SOLTEpFq8Owh87R9grGOOecAuj9+ZHHwvGnJqKzbQbwihax+W/IEu8BEyXAnn/i3MiN
 +ElxCKV/NLh49jtFFYTn0rrYFCNmEj6aR+QKMy9V7WlluQt61sW4OA23c8N4mzIhyC1O
 C8Lw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1684058749; x=1686650749;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=AEESkSmM2yg5voafFPesEW8VArx2oSNLqjShFMs/DuM=;
 b=ha3Bp3VlYzZ2ZQ4AZFUkcXxdwFc44e0cO/kyMCr61hCHU6FK7rh4vUhz8CCHuHGf5E
 Lcsu06Tl3430hvlqJ7dbu0HrsVWAiPi1knZYk7OI/tuhVTIXiigcZc+2+3jHLmL4QfoD
 zgIlNogO/jUxuyTD22lFszeJ8wTaPrsrC0n7Aqvu7odBcQMD8hSStgvCOVMRjgikd994
 uOEsPOPeXVKsZPTUxYcyn0kgtYHjhWKX3QUkI4rkGH3dyFwDET8W24DqQu8q6jRx/fKG
 qBT7fBth3MGtfGNaxh7c63jq8lSeaDQwXaSKDAxQF4J00j51ptbuLcyo4VkHC70+d2EJ
 t28g==
X-Gm-Message-State: AC+VfDz7sYxzLCER/9HJsMjbKcPeXztIakqeBHNA+mCra1qpGDREGbxL
 x1nD0SfhUe96F+Vjkx2PFF//RQ==
X-Google-Smtp-Source: ACHHUZ5SOGjQ1VP1duapR1kvjIiip6JZnD1Ud80MrMaoNp6c05dBBuvaom4AcL6CYJlc978ETuJfaQ==
X-Received: by 2002:a17:907:720e:b0:966:5a6c:752d with SMTP id
 dr14-20020a170907720e00b009665a6c752dmr21669896ejc.20.1684058749230; 
 Sun, 14 May 2023 03:05:49 -0700 (PDT)
Received: from ?IPV6:2a02:810d:15c0:828:715f:ddce:f2ba:123b?
 ([2a02:810d:15c0:828:715f:ddce:f2ba:123b])
 by smtp.gmail.com with ESMTPSA id
 w13-20020a170907270d00b0095fbb1b72c2sm7974519ejk.63.2023.05.14.03.05.47
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sun, 14 May 2023 03:05:48 -0700 (PDT)
Message-ID: <b53ffbf3-68c0-244f-0d0b-62a671d0aaef@linaro.org>
Date: Sun, 14 May 2023 12:05:47 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.11.0
Subject: Re: [PATCH v3 1/2] dt-bindings: samsung,mipi-dsim: Add
 'lane-polarities'
Content-Language: en-US
To: Fabio Estevam <festevam@gmail.com>, neil.armstrong@linaro.org
References: <20230509191059.3327960-1-festevam@gmail.com>
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20230509191059.3327960-1-festevam@gmail.com>
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
Cc: devicetree@vger.kernel.org, Fabio Estevam <festevam@denx.de>,
 dri-devel@lists.freedesktop.org, robh+dt@kernel.org,
 jagan@amarulasolutions.com, krzysztof.kozlowski+dt@linaro.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 09/05/2023 21:10, Fabio Estevam wrote:
> From: Fabio Estevam <festevam@denx.de>
> 
> The Samsung DSIM IP block allows the inversion of the clock and
> data lanes.
> 
> Add an optional property called 'lane-polarities' that describes the
> polarities of the MIPI DSI clock and data lanes.
> 
> This property is useful for properly describing the hardware when the
> board designer decided to switch the polarities of the MIPI DSI
> clock and/or data lanes.
> 
> Signed-off-by: Fabio Estevam <festevam@denx.de>
> ---
> Changes since v2:
> - Use video-interfaces.yaml (Rob).
> 
>  .../display/bridge/samsung,mipi-dsim.yaml     | 29 +++++++++++++++++++
>  1 file changed, 29 insertions(+)
> 
> diff --git a/Documentation/devicetree/bindings/display/bridge/samsung,mipi-dsim.yaml b/Documentation/devicetree/bindings/display/bridge/samsung,mipi-dsim.yaml
> index e841659e20cd..dad6d06fbdd9 100644
> --- a/Documentation/devicetree/bindings/display/bridge/samsung,mipi-dsim.yaml
> +++ b/Documentation/devicetree/bindings/display/bridge/samsung,mipi-dsim.yaml
> @@ -105,6 +105,35 @@ properties:
>            DSI output port node to the panel or the next bridge
>            in the chain.
>  
> +        properties:
> +          endpoint:
> +            $ref: /schemas/media/video-interfaces.yaml#
> +            unevaluatedProperties: false
> +
> +            properties:
> +              data-lanes:
> +                oneOf:

Drop oneOf, no need for it.

> +                  - minItems: 1
> +                    maxItems: 4
> +                    uniqueItems: true
> +                    items:
> +                      enum: [ 1, 2, 3, 4 ]
> +                    description:
> +                      See ../../media/video-interfaces.yaml for details.

Drop description, it's obvious.

> +
> +              lane-polarities:
> +                minItems: 1
> +                maxItems: 5
> +                items:
> +                  enum: [ 0, 1 ]

Drop items, it's already in video-interfaces.

> +                description:
> +                  See ../../media/video-interfaces.yaml for details.

Drop this piece.

> +                  The Samsung MIPI DSI IP requires that all the data lanes have
> +                  the same polarity.
> +
> +            dependencies:
> +              lane-polarities: [data-lanes]
> +
>  required:
>    - clock-names
>    - clocks

Best regards,
Krzysztof

