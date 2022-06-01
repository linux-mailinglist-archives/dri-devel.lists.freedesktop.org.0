Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id EBBEB539EB6
	for <lists+dri-devel@lfdr.de>; Wed,  1 Jun 2022 09:49:47 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E1AE4112ED1;
	Wed,  1 Jun 2022 07:49:45 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ej1-x636.google.com (mail-ej1-x636.google.com
 [IPv6:2a00:1450:4864:20::636])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9997C112EC9
 for <dri-devel@lists.freedesktop.org>; Wed,  1 Jun 2022 07:49:44 +0000 (UTC)
Received: by mail-ej1-x636.google.com with SMTP id q21so2035529ejm.1
 for <dri-devel@lists.freedesktop.org>; Wed, 01 Jun 2022 00:49:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:in-reply-to:content-transfer-encoding;
 bh=Sm++4DrzLTUG9tiCKNeXhjWxZd3ZyuWj0+VaaIO2niE=;
 b=AlhVW3/4AZpS+4A5mn2asiqsGH5B9GKGts+SgUbQhgG2g2gRqeB/phmXsUEiMut/0l
 D/bxWzkivGd/qgJhlef19SWv/8ksgYIiEoaKIKrBNyJ0EuwYOE/i5vcZFYCCPF0ioL+H
 3i4XxaboY/HACuxmNRzH7BFkH67KRvTzQzc6p6L/vdW1BP0WKA9ZSuVlmmIV+XIi1fG0
 XS6uR+D9SrjF7jtBmNDBa/cI7BcZBlvP5zwOdJhG4KsPDtRMvuDzDC/UE/KE3Ba48dPc
 cto03EKypG6CeWwFfIDLpS+XSnfuIACThgZGOSIv9d1zvcV7xv/weL9TrumYmCOwqDTQ
 mxJw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=Sm++4DrzLTUG9tiCKNeXhjWxZd3ZyuWj0+VaaIO2niE=;
 b=5Z8cSeq2st2CY5gqPCRVjhZOKLT7MTcOTbuHRbpS/slGcCFfyXCtJiGP/Luga33XYo
 xy4l3+A2WMDSXgfiHillEX+UlbjglWuBt3JNrvvbIxzjL4SR/Navg25OI7f84VOUUvzt
 0rQRA70JZwNGDdmLcf/ggDTp8wsNZwDQKCyehdyH4grU4El2otBLhpuDT4Q8XkQdMDy5
 k6E14T3NCw4mVRLIWFlEJ9VhkBW1Sz24a7sN4bil2SFb05ltcj1TE9vEVrfFzPqea4SW
 yI5WkO9d/YqwgzJ5bDH0qQ7CqR0ijNG9vYlQOty6Bd75ImbmcKvXpCa6qiBYau/HaC9A
 7lsQ==
X-Gm-Message-State: AOAM533xqLLmaBt+Lxp5TgkZiaOE9fFxAG5h4MEULOrIQLd3ULvMG+EN
 /zLgVumIC7k21cNx7MckRmZV1A==
X-Google-Smtp-Source: ABdhPJz7UFukrm2jvPWd/lGUDw/WsujyoWdPvF7XRSXo1gYSXArgywz05H3nKoE1XWX/K0U0YOt4pg==
X-Received: by 2002:a17:906:9c82:b0:6df:baa2:9f75 with SMTP id
 fj2-20020a1709069c8200b006dfbaa29f75mr56556870ejc.762.1654069783167; 
 Wed, 01 Jun 2022 00:49:43 -0700 (PDT)
Received: from [192.168.0.179] (xdsl-188-155-176-92.adslplus.ch.
 [188.155.176.92]) by smtp.gmail.com with ESMTPSA id
 d21-20020a056402001500b0042aa23fa93bsm537869edu.20.2022.06.01.00.49.41
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 01 Jun 2022 00:49:42 -0700 (PDT)
Message-ID: <33319cd8-b300-27de-1871-f12bc860330d@linaro.org>
Date: Wed, 1 Jun 2022 09:49:41 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.9.1
Subject: Re: [PATCH 2/3] dt-bindings: display: Add bindings for ClockworkPi
 CWD686
Content-Language: en-US
To: Max Fierke <max@maxfierke.com>, thierry.reding@gmail.com,
 sam@ravnborg.org, airlied@linux.ie, daniel@ffwll.ch, robh+dt@kernel.org,
 krzysztof.kozlowski+dt@linaro.org
References: <20220601051748.1305450-1-max@maxfierke.com>
 <20220601051748.1305450-3-max@maxfierke.com>
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20220601051748.1305450-3-max@maxfierke.com>
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
 dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 01/06/2022 07:17, Max Fierke wrote:

Subject: remove word "bindings" because you duplicate prefix, so
"dt-bindings: display: Add ClockworkPi CWD686 panel".


> +required:
> +  - compatible
> +  - reg
> +  - backlight
> +  - reset-gpios
> +
> +additionalProperties: false
> +
> +examples:
> +  - |
> +    #include <dt-bindings/gpio/gpio.h>
> +
> +    backlight: backlight {
> +        compatible = "gpio-backlight";
> +        gpios = <&gpio4 30 GPIO_ACTIVE_HIGH>;
> +    };

No need for backlight example, it is trivial/same for everyone.

With that removed:

Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

> +
> +    dsi {
> +        #address-cells = <1>;
> +        #size-cells = <0>;
> +
> +        panel@0 {
> +            compatible = "clockworkpi,cwd686";
> +            reg = <0>;
> +            backlight = <&backlight>;
> +            reset-gpios = <&gpio2 28 GPIO_ACTIVE_HIGH>;
> +            rotation = <90>;
> +        };
> +    };


Best regards,
Krzysztof
