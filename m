Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 543FA5BF6B1
	for <lists+dri-devel@lfdr.de>; Wed, 21 Sep 2022 08:51:44 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A86E410E856;
	Wed, 21 Sep 2022 06:51:39 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lj1-x231.google.com (mail-lj1-x231.google.com
 [IPv6:2a00:1450:4864:20::231])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2533B10E85C
 for <dri-devel@lists.freedesktop.org>; Wed, 21 Sep 2022 06:51:37 +0000 (UTC)
Received: by mail-lj1-x231.google.com with SMTP id a10so5872840ljq.0
 for <dri-devel@lists.freedesktop.org>; Tue, 20 Sep 2022 23:51:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date;
 bh=hziJiWlbeCYWICaodrhq4f1lj++HNSjMPQsWEPa+eOA=;
 b=kCTf1MMrAex61yobwXGslBHLvi4vBqUY2QE00zM5Xy3EYYxMOL8lHR4g1zP3I6npCW
 g5QnhB6EhLSJ6i9lvgTblYAMduwNTPKAcKYXti6awGegiHNFZKkGHVnaUrxUj+zPXs8f
 rrlfyclVRC9+mJXhy1LH0K7BS+Y3xqXipHOIL3zyV+Tj/cy3bEKBmdpXRoYlA1+3y+2d
 h5vt+2hSVfxZZtXibKiPP6rKc/Ez5yw+pNqF8y3uayhTR/5BJwIcNoLiNJBSSq5KZUbu
 9TS3TZai9GS+sDsHBnQ2EjDbSdQ5UBF4C8Ga2mbZFV1Xr3rPW0h7elvydnB0zIji8zYx
 tL9g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date;
 bh=hziJiWlbeCYWICaodrhq4f1lj++HNSjMPQsWEPa+eOA=;
 b=YqlJqgq1QZopFiMwUOPeTu3A7IVoVN1DHXZ0u0Yj8Bh0p6Rr+azimIJrsnYSbP4wTD
 ixFaymW+kXxP7xRQWSJACJRRaSCrkcX48r+hw3jkabmJK1I/fjacEZwBaS4mujbybWmp
 xFk6L0ZwA8dsqMdPaLZJqmGITKyLJm9hPNTy4ZFDb2Vr/SajsCI8y2zDykVxgmlFEVlu
 WqioD2hQF7jeKiVDkuR8DqHl6Ype0OR1SjiiWnAfo7qd2bnp4OeIvrPeGX9lKc9MK/Io
 oo/lIUk70Dy7jCpni7xwcN6kUQekzqPxt8+CFMF41zDyeValuRbp+qPsNax/XU0yGqvx
 AtIA==
X-Gm-Message-State: ACrzQf3r+64/xpWNQpEZzGT9CetDES7taeuL9V9KjeesP0qnhjM405br
 UOCzoIf2inRcI1WXq3Kcg0M96A==
X-Google-Smtp-Source: AMsMyM4uSKYhrpYEdfKtFGQ4I85DvMwMEBxdptePTBLc/Ii+9JxJmgBnJrz7bOduw3W2oKr80pQjGQ==
X-Received: by 2002:a05:651c:33a:b0:26a:a0de:d6e3 with SMTP id
 b26-20020a05651c033a00b0026aa0ded6e3mr8437660ljp.397.1663743095471; 
 Tue, 20 Sep 2022 23:51:35 -0700 (PDT)
Received: from [192.168.0.21] (78-11-189-27.static.ip.netia.com.pl.
 [78.11.189.27]) by smtp.gmail.com with ESMTPSA id
 z12-20020a056512370c00b0048a8c907fe9sm304865lfr.167.2022.09.20.23.51.34
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 20 Sep 2022 23:51:34 -0700 (PDT)
Message-ID: <e5de0c74-3ece-56c6-6c31-042e1117c10a@linaro.org>
Date: Wed, 21 Sep 2022 08:51:34 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.13.0
Subject: Re: [PATCH V2 2/3] dt-bindings: display: panel: Add NewVision NV3051D
 bindings
Content-Language: en-US
To: Chris Morgan <macroalpha82@gmail.com>, dri-devel@lists.freedesktop.org
References: <20220920145905.20595-1-macroalpha82@gmail.com>
 <20220920145905.20595-3-macroalpha82@gmail.com>
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20220920145905.20595-3-macroalpha82@gmail.com>
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

On 20/09/2022 16:59, Chris Morgan wrote:
> From: Chris Morgan <macromorgan@hotmail.com>
> 
> Add documentation for the NewVision NV3051D panel bindings.
> Note that for the two expected consumers of this panel binding
> the underlying LCD model is unknown. Name "anbernic,rg353p-panel"
> is used because the hardware itself is known as "anbernic,rg353p".
> 
> Signed-off-by: Chris Morgan <macromorgan@hotmail.com>
> ---
>  .../display/panel/newvision,nv3051d.yaml      | 55 +++++++++++++++++++
>  1 file changed, 55 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/display/panel/newvision,nv3051d.yaml
> 
> diff --git a/Documentation/devicetree/bindings/display/panel/newvision,nv3051d.yaml b/Documentation/devicetree/bindings/display/panel/newvision,nv3051d.yaml
> new file mode 100644
> index 000000000000..d90bca4171c2
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/display/panel/newvision,nv3051d.yaml
> @@ -0,0 +1,55 @@
> +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/display/panel/newvision,nv3051d.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: NewVision NV3051D based LCD panel
> +
> +description: |
> +  The NewVision NV3051D is a driver chip used to drive DSI panels. For now,
> +  this driver only supports the 640x480 panels found in the Anbernic RG353
> +  based devices.
> +
> +maintainers:
> +  - Chris Morgan <macromorgan@hotmail.com>
> +
> +allOf:
> +  - $ref: panel-common.yaml#
> +
> +properties:
> +  compatible:
> +    items:
> +      - enum:
> +          - anbernic,rg353p-panel

Are these vendor prefixs documented?

> +          - anbernic,rg353v-panel
> +      - const: newvision,nv3051d

Blank line.

> +  reg: true
> +  backlight: true
> +  port: true
> +  reset-gpios: true
> +  vdd-supply:
> +    description: regulator that supplies the vdd voltage

Skip description and make it just "true". It's kind of obvious.

> +
> +required:
> +  - compatible
> +  - reg
> +  - backlight
> +  - vdd-supply

Best regards,
Krzysztof
