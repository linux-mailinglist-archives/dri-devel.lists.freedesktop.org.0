Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id B376281CC40
	for <lists+dri-devel@lfdr.de>; Fri, 22 Dec 2023 16:32:26 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B208710E7C7;
	Fri, 22 Dec 2023 15:32:22 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ed1-x535.google.com (mail-ed1-x535.google.com
 [IPv6:2a00:1450:4864:20::535])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EA21F10E7C7
 for <dri-devel@lists.freedesktop.org>; Fri, 22 Dec 2023 15:32:21 +0000 (UTC)
Received: by mail-ed1-x535.google.com with SMTP id
 4fb4d7f45d1cf-552d39ac3ccso5541442a12.0
 for <dri-devel@lists.freedesktop.org>; Fri, 22 Dec 2023 07:32:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1703259140; x=1703863940; darn=lists.freedesktop.org;
 h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
 :to:content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=zMRkAeKfHrZuYkVxxN26vAqPNImWhPuXB0Myojylx8E=;
 b=nhsqLLGDfZhEznVaBlKSweUaBzOmVv7E9/AvDymkiORitSeTF3jYL9i0nOO5kXL9Gc
 x/Ns0+Kfs09Kkvy3FgDlIuTK/kcBA9tYH3vBVM61W+R8V4zqYT5Lt8nvVnyPA8rEMhYt
 x9QDKmNLlf5k07yZiTUkVjZTlK5cZjYaAdnF6F52PH+jMSK10OCPZxzmefEWhGbhwkgA
 IKKcT7b74SsYA8NeHMW5ItugxMAF+l2Gcii5PVqdwb8hUsODaGDOskH2m0Y8UQ06zQkk
 uWipmTSXNJPGzs+T6jpgnoW3dN5f+Euz9aVsJR1njmmao9/n5HVmzDA6ZQeo8nydX0sR
 S9ww==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1703259140; x=1703863940;
 h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
 :to:content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=zMRkAeKfHrZuYkVxxN26vAqPNImWhPuXB0Myojylx8E=;
 b=HGC7WaTUFwbGbhfSDzm1ElW1CEzL6aQ8iPWeY//U4sh8C1SxFjmGelT2/6V7a8pdDB
 uXZjQmaR42TKwXKRUQyuvmSZITOO+mwpmQ+H2xZU/yYbz4gqtmmslmyMbhTR3WwH3IQq
 1Nlfey4HkVKec1CzXslJRwP4C1JdLCDc9Dd7Iot0WA4W0D6X2KY1lfLq8uym33+OItY8
 EPCXl6XXlCmxXhdeDyJEw0kM5oOi+/7ZB7aPW0bC6fGZe7qQBjoyM6bSiYiGWfrIeeug
 u7hRVLf7e/HrZ51vggQjyWEjJ6PqJdnmhXZKhKN4+9xX/pr9rKn2paL58qkeySPngt7e
 0k8g==
X-Gm-Message-State: AOJu0YyuDRy3ifNFJ2S3lr8DzBYVzm2/oMsrd7kq/fpZR6uNeXvEcOHc
 uo++/sIv2DOZeLQthyh1FUm6gImMtilwpA==
X-Google-Smtp-Source: AGHT+IEE3ixLwgoDRzlpSJNNryzeZB7PRZZq5OQYRU60Mnjl3tdxnbdeR+7YUZurYuvoakpWEmQMmg==
X-Received: by 2002:a17:906:1d6:b0:a26:968c:b4a8 with SMTP id
 22-20020a17090601d600b00a26968cb4a8mr1358465ejj.2.1703259140277; 
 Fri, 22 Dec 2023 07:32:20 -0800 (PST)
Received: from [192.168.0.22] ([78.10.206.178])
 by smtp.gmail.com with ESMTPSA id
 lx26-20020a170906af1a00b00a235b087526sm2131137ejb.217.2023.12.22.07.32.18
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 22 Dec 2023 07:32:19 -0800 (PST)
Message-ID: <34254cf6-346c-4b2b-a429-d9df153a58a5@linaro.org>
Date: Fri, 22 Dec 2023 16:32:17 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [v1 1/2] dt-bindings: display: panel: Add Truly NT36672E LCD DSI
 panel
Content-Language: en-US
To: Ritesh Kumar <quic_riteshk@quicinc.com>, dri-devel@lists.freedesktop.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20231222110710.19397-1-quic_riteshk@quicinc.com>
 <20231222110710.19397-2-quic_riteshk@quicinc.com>
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Autocrypt: addr=krzysztof.kozlowski@linaro.org; keydata=
 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
 D2GYIS41Kv4Isx2dEFh+/Q==
In-Reply-To: <20231222110710.19397-2-quic_riteshk@quicinc.com>
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
Cc: neil.armstrong@linaro.org, conor+dt@kernel.org,
 krzysztof.kozlowski+dt@linaro.org, quic_vproddut@quicinc.com,
 airlied@gmail.com, quic_abhinavk@quicinc.com, mripard@kernel.org,
 robh+dt@kernel.org, tzimmermann@suse.de, quic_rajeevny@quicinc.com,
 quic_jesszhan@quicinc.com, sam@ravnborg.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 22/12/2023 12:07, Ritesh Kumar wrote:
> Document Truly NT36672E FHD+ LCD DSI panel.
> 
> Signed-off-by: Ritesh Kumar <quic_riteshk@quicinc.com>
> ---
>  .../display/panel/truly,nt36672e.yaml         | 66 +++++++++++++++++++
>  1 file changed, 66 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/display/panel/truly,nt36672e.yaml
> 
> diff --git a/Documentation/devicetree/bindings/display/panel/truly,nt36672e.yaml b/Documentation/devicetree/bindings/display/panel/truly,nt36672e.yaml
> new file mode 100644
> index 000000000000..39ab05c5b103
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/display/panel/truly,nt36672e.yaml
> @@ -0,0 +1,66 @@
> +# SPDX-License-Identifier: GPL-2.0-only OR BSD-2-Clause
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/display/panel/truly,nt36672e.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: Truly NT36672E LCD DSI Panel
> +
> +maintainers:
> +  - Ritesh Kumar <quic_riteshk@quicinc.com>
> +
> +allOf:
> +  - $ref: panel-common.yaml#
> +
> +properties:
> +  compatible:
> +    const: truly,nt36672e

Eee? This is existing Novatek, isn't it?

> +
> +  reg:
> +    maxItems: 1
> +    description: DSI virtual channel
> +
> +  vddi-supply: true
> +  avdd-supply: true
> +  avee-supply: true
> +  port: true
> +  reset-gpios: true
> +  backlight: true
> +
> +additionalProperties: false


This goes after required:.


Best regards,
Krzysztof

