Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 8CF825B0466
	for <lists+dri-devel@lfdr.de>; Wed,  7 Sep 2022 14:54:11 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6C03B10E754;
	Wed,  7 Sep 2022 12:54:03 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-x129.google.com (mail-lf1-x129.google.com
 [IPv6:2a00:1450:4864:20::129])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 59F5B10E75D
 for <dri-devel@lists.freedesktop.org>; Wed,  7 Sep 2022 12:53:59 +0000 (UTC)
Received: by mail-lf1-x129.google.com with SMTP id q21so8052562lfo.0
 for <dri-devel@lists.freedesktop.org>; Wed, 07 Sep 2022 05:53:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date;
 bh=QdfsKhvFKhFoGHzsk/BoyO/Tmgkam11t7YqMDdkDMvA=;
 b=cfabybZRUHSTAN4CYZIqf5lWbwbUv80aicTWbp1K/+qlLzOg80739TUsdt/K1Kzv9/
 Tk2EZ671p89mbJ7bdrPoTDBsXrdFbYGzcpbmGJGw/wA+H3Y1WC1eZAXezu6AU8beLRN1
 6vsmAlxgwFjRn+HFmRxPGGFHA8FhaMp9XuB2NdJ6yeKV/c70Pt8J2EyDxvM6WUxOKD/v
 YNyxqSM7mKzzxVcr6R5hGR5XOVWO6CYFnO5PzLE5wlPdXoZq9Y9c4kqSg74N66BSnnwH
 5rsoQfOGR9N7PMsRrJbJ/yyqSQlSRWyzRZ9LWJIyvXqNrJ801ywCuAnanXRsILWQ+J2c
 1J1A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date;
 bh=QdfsKhvFKhFoGHzsk/BoyO/Tmgkam11t7YqMDdkDMvA=;
 b=YwY+AKTENp+OOj0McHbUetAwNR38j61e0cfdeXoBDuY6vzV0/alnBYHHJ0vx7NZLrU
 xLdBmw5E0LvkUuAF/tIE3LZsKZxgo5hyQqwfJdG6mWnBUvOgcciAlE8c1pikK2HkxcJN
 mhuHNQcVNy8zZi7pGOU0NqRP7Yj5jiqVc9WAeHR4nufOGw1NyparED8jLJlv8TsbNlKf
 OMZ0MH6r+fEufRGcrRimIfsQR3JBFtIo9dh7a+yosVf7HtWuZrMYCcsnaIIf0QOsD5MS
 lv0JGVct7vHk23/D6jfuexVaBjN1lvcfj/KxVAqCbNwLxJ3RXy3YDJjZOnvPgCHpkdk6
 dC9Q==
X-Gm-Message-State: ACgBeo0FI//vNPzysPXlRQtgAjlR7ycn8frYd5TiLyeI39hG+vBCcKp9
 FeYZaNyGktKgLpvTlHmZQomQXg==
X-Google-Smtp-Source: AA6agR4BwFb6nsuEJdos9OnnfDEhzv5czyPoYnsaY6U4L9wyIe5/4sEYDJrmkZX+UZi6V/friXgSQw==
X-Received: by 2002:a05:6512:159c:b0:48a:efee:6f84 with SMTP id
 bp28-20020a056512159c00b0048aefee6f84mr978713lfb.627.1662555237699; 
 Wed, 07 Sep 2022 05:53:57 -0700 (PDT)
Received: from [192.168.0.21] (78-11-189-27.static.ip.netia.com.pl.
 [78.11.189.27]) by smtp.gmail.com with ESMTPSA id
 l18-20020a2e7012000000b00261ca0f940esm2532315ljc.62.2022.09.07.05.53.56
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 07 Sep 2022 05:53:57 -0700 (PDT)
Message-ID: <cbdbc7d8-a3b9-d960-68c7-457c947e4285@linaro.org>
Date: Wed, 7 Sep 2022 14:53:56 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.13.0
Subject: Re: [PATCH 1/2] dt-bindings: display: panel: Add NewVision NV3051D
 panel bindings
Content-Language: en-US
To: Chris Morgan <macroalpha82@gmail.com>, dri-devel@lists.freedesktop.org
References: <20220906185208.13395-1-macroalpha82@gmail.com>
 <20220906185208.13395-2-macroalpha82@gmail.com>
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20220906185208.13395-2-macroalpha82@gmail.com>
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
Cc: devicetree@vger.kernel.org, krzysztof.kozlowski+dt@linaro.org,
 airlied@linux.ie, Chris Morgan <macromorgan@hotmail.com>, robh+dt@kernel.org,
 thierry.reding@gmail.com, sam@ravnborg.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 06/09/2022 20:52, Chris Morgan wrote:
> From: Chris Morgan <macromorgan@hotmail.com>
> 
> Add documentation for the NewVision NV3051D panel bindings.
> Note that for the two expected consumers of this panel binding
> the underlying LCD model is unknown.
> 
> Signed-off-by: Chris Morgan <macromorgan@hotmail.com>
> ---
>  .../display/panel/newvision,nv3051d.yaml      | 48 +++++++++++++++++++
>  1 file changed, 48 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/display/panel/newvision,nv3051d.yaml
> 
> diff --git a/Documentation/devicetree/bindings/display/panel/newvision,nv3051d.yaml b/Documentation/devicetree/bindings/display/panel/newvision,nv3051d.yaml
> new file mode 100644
> index 000000000000..016168d8d7b2
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/display/panel/newvision,nv3051d.yaml
> @@ -0,0 +1,48 @@
> +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/display/panel/newvision,nv3051d.yaml#

You need to document vendor prefix... but the filename does not match
compatible.

> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: NewVision NV3051D based DSI panel driver

This is confusing - compatibles say something else.

> +
> +maintainers:
> +  - Chris Morgan <macromorgan@hotmail.com>
> +
> +allOf:
> +  - $ref: panel-common.yaml#
> +
> +properties:
> +  compatible:
> +    enum:
> +      - anbernic,rg353p-panel
> +      - anbernic,rg353v-panel

Missing space, missing documentation for vendor prefix.

Strip "panel" suffix unless device is multifunctional.

> +  reg: true
> +  backlight: true


Best regards,
Krzysztof
