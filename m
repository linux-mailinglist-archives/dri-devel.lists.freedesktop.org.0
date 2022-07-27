Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 85888582428
	for <lists+dri-devel@lfdr.de>; Wed, 27 Jul 2022 12:24:40 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A3745C4A18;
	Wed, 27 Jul 2022 10:24:37 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-x129.google.com (mail-lf1-x129.google.com
 [IPv6:2a00:1450:4864:20::129])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5AACBC4A18
 for <dri-devel@lists.freedesktop.org>; Wed, 27 Jul 2022 10:24:36 +0000 (UTC)
Received: by mail-lf1-x129.google.com with SMTP id p11so21620248lfu.5
 for <dri-devel@lists.freedesktop.org>; Wed, 27 Jul 2022 03:24:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:in-reply-to:content-transfer-encoding;
 bh=pwRSwcrjoF7t2bTpsHDxTeVcAQajNb7y0PUjCxzEDfI=;
 b=LS+Iq/WMoD7g4rTSAOFGbQRQsJrbsmMhE3QRamPOWaFluRlH83NztRwKKklCzLTC8V
 6k07KZyafk3PY9EMqAGNQmuPpzd/s33fd8UYM/WMho6YDmroalSHyZiDigk+AQH4iJNh
 wovh7QgkQCfvPkibvISyxjfZD5NR7FqPEDTJAwUsTCN1OasSb8WfLVT0ZET59CW1ZZjZ
 Fzc/6hs2f/d0/6PbS7ewKiwEvzDzLriAjfS81OlT32ybDtt5C5z0y4K88Avoxbg0qxZj
 kNWgJjzJEjKxJDjfKA+pDEznOoKegQRPULWet0Gs183MQAPGq8/FbztxLC5jjACU2/ID
 eeXw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=pwRSwcrjoF7t2bTpsHDxTeVcAQajNb7y0PUjCxzEDfI=;
 b=xCCFANPwttHT3scSP1Hy3gNsEMWKyTkHcndUW8fYICbVTr+I+GXge+j5YaarLkLePc
 QDa12AmnuhumB4qAgC4pTN5+dU92oWz6KYP4oE7Pyj23qzqT8KcB3bRCSXMCYl0wpGE1
 0owCM4/FQ2cREwLD/B5EcbmmgObrmka27lMgjGvT9W07+im9CzqZcjxq6mrrf3qYQoUc
 AMTmmPg7NzeQ+WGu459b7aPVWdsfp7xB+zfl/yRnB9TdztNfWMbf/BgElVHrOb86JrR8
 hZF+If36dvJjE16zpd8s7Gfv6Yv/GXp4nU93tTFIszGJYhn8GcrbTaKeoBPBPLQFW9Dk
 /Z2Q==
X-Gm-Message-State: AJIora9XhSXXBc6W/x1tCeNj4a5OBghSVXyLgIbESiBuJ1zfdW6XdRQT
 ZQduIChlXciVd+BaELdswT9m5Q==
X-Google-Smtp-Source: AGRyM1tyXHCoDrQOD8dUuUL8NnbQqSpli/fmf0tsGDrueYdv2MU7LL5eZyMmjTbTitUO3XThHNJMOQ==
X-Received: by 2002:a05:6512:114a:b0:48a:39e6:ff7d with SMTP id
 m10-20020a056512114a00b0048a39e6ff7dmr7678289lfg.338.1658917474613; 
 Wed, 27 Jul 2022 03:24:34 -0700 (PDT)
Received: from [192.168.3.197] (78-26-46-173.network.trollfjord.no.
 [78.26.46.173]) by smtp.gmail.com with ESMTPSA id
 u7-20020ac258c7000000b0048a83ab2d32sm2251051lfo.0.2022.07.27.03.24.33
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 27 Jul 2022 03:24:34 -0700 (PDT)
Message-ID: <809e9c7d-7634-f690-675d-9eccac8c8de8@linaro.org>
Date: Wed, 27 Jul 2022 12:24:32 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.12.0
Subject: Re: [PATCH v3 1/2] dt-bindings: display: panel: Add Novatek NT35596S
 panel bindings
Content-Language: en-US
To: Molly Sophia <mollysophia379@gmail.com>,
 Sumit Semwal <sumit.semwal@linaro.org>,
 Thierry Reding <thierry.reding@gmail.com>, Sam Ravnborg <sam@ravnborg.org>,
 David Airlie <airlied@linux.ie>, Daniel Vetter <daniel@ffwll.ch>,
 Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org
References: <20220726101513.66988-1-mollysophia379@gmail.com>
 <20220726101513.66988-2-mollysophia379@gmail.com>
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20220726101513.66988-2-mollysophia379@gmail.com>
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
Cc: phone-devel@vger.kernel.org, ~postmarketos/upstreaming@lists.sr.ht
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 26/07/2022 12:15, Molly Sophia wrote:
> Add documentation for "novatek,nt35596s" panel.
> 
> Changes in v3:
> - Embed the documentation into existing one (novatek,nt36672a).
> 
> Signed-off-by: Molly Sophia <mollysophia379@gmail.com>
> ---
>  .../display/panel/novatek,nt36672a.yaml       | 20 ++++++++++++-------
>  1 file changed, 13 insertions(+), 7 deletions(-)
> 
> diff --git a/Documentation/devicetree/bindings/display/panel/novatek,nt36672a.yaml b/Documentation/devicetree/bindings/display/panel/novatek,nt36672a.yaml
> index 563766d283f6..560fb66d0e5a 100644
> --- a/Documentation/devicetree/bindings/display/panel/novatek,nt36672a.yaml
> +++ b/Documentation/devicetree/bindings/display/panel/novatek,nt36672a.yaml
> @@ -20,14 +20,20 @@ allOf:
>  
>  properties:
>    compatible:
> -    items:
> -      - enum:
> -          - tianma,fhd-video
> -      - const: novatek,nt36672a
> +    oneOf:
> +      - items:
> +          - enum:
> +              - tianma,fhd-video
> +          - const: novatek,nt36672a
> +
> +      - items:
> +          - enum:
> +              - jdi,fhd-nt35596s
> +          - const: novatek,nt35596s

This entire entry should be rather before nt36672a judging by numbers:

+    oneOf:
+      - items:
+          - enum:
+              - jdi,fhd-nt35596s
+          - const: novatek,nt35596s
+
+      - items:
+          - enum:
+              - tianma,fhd-video
+          - const: novatek,nt36672a


Best regards,
Krzysztof
