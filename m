Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E24EC5F094E
	for <lists+dri-devel@lfdr.de>; Fri, 30 Sep 2022 12:49:41 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DE4DD10E144;
	Fri, 30 Sep 2022 10:49:37 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lj1-x236.google.com (mail-lj1-x236.google.com
 [IPv6:2a00:1450:4864:20::236])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6CB4310E144
 for <dri-devel@lists.freedesktop.org>; Fri, 30 Sep 2022 10:49:34 +0000 (UTC)
Received: by mail-lj1-x236.google.com with SMTP id b24so4374282ljk.6
 for <dri-devel@lists.freedesktop.org>; Fri, 30 Sep 2022 03:49:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date;
 bh=LQmSfvmdYcsQ3TJepFnKd/I61iUETxbyLBYaG0YvPbI=;
 b=Y+JUJPVygm/ITXHKeSfUaFFgpAaI72Jh2PqOZmcQbr7wEp/T21V1m1zqkb7bdugTVK
 zVG/Ozek+Mr1dlouceNXls+BAU5UiECu/CgM0WtVvmeR/QJ3rlRuI7vVGgpmn8LOQQ8f
 Ndfs34MSlH6zNitvV4S5VBKBARAUvcqT6J31HXC0rxISSqZnAq7KXyyOyZUmU8QfeNnW
 Yk/3yUBxsPhKkdhpJ5hjvPPGt07fYg1kc3TKX5JsLbgXqKleWz2ouwU+vIKk+W8ffCR7
 odxsWCkgiCLk77IjVeadGAgft4V82TUO+QfaO9ydbejomjCQ7bBsIMKjdI+ixkFTd43K
 kYjQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date;
 bh=LQmSfvmdYcsQ3TJepFnKd/I61iUETxbyLBYaG0YvPbI=;
 b=pkHJTzoJsle6hizB9q2SoeY8BT2toIH36RsEVPt4c6ruBYYmm+bvVpHdOPOUDszUh1
 LhusCpsNtBSoRwjymMk+NqTrmu/t15bPmOU3NhLL9r16DMA09biv1fjefnUsFCexQK0V
 bL2hzVPwTctC46Bcra2QwAJnvrD71YpwcYjXEOz/VmoBKAQ5X3PtualuG+X5FgkulYAm
 HFdyshwq+12nam6U+sfTkcdtq3K3/7du9uDw+ehGFgZd6se36XkX04KbnDyRPKkbQ683
 da1WMd4BZDcf8xlAqlGxwBXLrMXA+rQ+8QyjRP1RoM9YDwAOZRGq01kj+c42+YQYASl4
 eozw==
X-Gm-Message-State: ACrzQf3jwdaPKiyg1QNVfxuSPXlSEFyQtcYBqpPj97sxVIETDhSvOz8g
 CFDo6eKKDxYbOOvepNlXdj1Dvg==
X-Google-Smtp-Source: AMsMyM7iRCfgwHnj4h/qw1Yb45TDQhUYhGG/iT/OtytoacNNDFFRxQ8wUpFxhvqSHgxpX4K25dcMfg==
X-Received: by 2002:a2e:86cf:0:b0:26b:fe50:8c4c with SMTP id
 n15-20020a2e86cf000000b0026bfe508c4cmr2557212ljj.17.1664534972789; 
 Fri, 30 Sep 2022 03:49:32 -0700 (PDT)
Received: from [192.168.0.21] (78-11-189-27.static.ip.netia.com.pl.
 [78.11.189.27]) by smtp.gmail.com with ESMTPSA id
 q12-20020ac246ec000000b004945c1c5cccsm253083lfo.268.2022.09.30.03.49.31
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 30 Sep 2022 03:49:32 -0700 (PDT)
Message-ID: <efa2f644-0a1d-00f7-970c-f17ceb0cc550@linaro.org>
Date: Fri, 30 Sep 2022 12:49:31 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.3.0
Subject: Re: [PATCH 1/4] dt-bindings: display: Add bindings for JDI LPM102A188A
Content-Language: en-US
To: Diogo Ivo <diogo.ivo@tecnico.ulisboa.pt>
References: <20220929170502.1034040-1-diogo.ivo@tecnico.ulisboa.pt>
 <20220929170502.1034040-2-diogo.ivo@tecnico.ulisboa.pt>
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20220929170502.1034040-2-diogo.ivo@tecnico.ulisboa.pt>
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
Cc: devicetree@vger.kernel.org, arnd@arndb.de, airlied@linux.ie,
 dri-devel@lists.freedesktop.org, jonathanh@nvidia.com, robh+dt@kernel.org,
 thierry.reding@gmail.com, krzysztof.kozlowski+dt@linaro.org,
 linux-tegra@vger.kernel.org, sam@ravnborg.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 29/09/2022 19:04, Diogo Ivo wrote:
> The LPM102A188A is a 10.2" 2560x1800 IPS panel found in
> the Google Pixel C.
> 


Thank you for your patch. There is something to discuss/improve.

> +  Each of the DSI channels controls a separate DSI peripheral. The peripheral
> +  driven by the first link (DSI-LINK1) is considered the primary peripheral
> +  and controls the device. The 'link2' property contains a phandle to the
> +  peripheral driven by the second link (DSI-LINK2).
> +
> +allOf:
> +  - $ref: panel-common.yaml#
> +
> +properties:
> +  compatible:
> +    const: jdi,lpm102a188a
> +
> +  reg: true
> +  enable-gpios: true
> +  reset-gpios: true
> +  power-supply: true
> +  backlight: true
> +
> +  ts-reset-gpios:
> +    maxItems: 1
> +    description: |
> +      Specifier for a GPIO connected to the touchscreen reset control signal.
> +      The reset signal is active low.

Isn't touchscreen a separate (input) device?

> +
> +  ddi-supply:
> +    description: The regulator that provides IOVCC (1.8V).
> +
> +  link2:
> +    $ref: /schemas/types.yaml#/definitions/phandle
> +    description: |
> +      phandle to the DSI peripheral on the secondary link. Note that the
> +      presence of this property marks the containing node as DSI-LINK1.

Best regards,
Krzysztof

