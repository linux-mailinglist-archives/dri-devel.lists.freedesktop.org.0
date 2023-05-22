Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 51DC070B7BB
	for <lists+dri-devel@lfdr.de>; Mon, 22 May 2023 10:35:21 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3937A10E277;
	Mon, 22 May 2023 08:35:19 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-x333.google.com (mail-wm1-x333.google.com
 [IPv6:2a00:1450:4864:20::333])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CDCC210E277
 for <dri-devel@lists.freedesktop.org>; Mon, 22 May 2023 08:35:16 +0000 (UTC)
Received: by mail-wm1-x333.google.com with SMTP id
 5b1f17b1804b1-3f606912ebaso4281605e9.3
 for <dri-devel@lists.freedesktop.org>; Mon, 22 May 2023 01:35:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1684744515; x=1687336515;
 h=content-transfer-encoding:in-reply-to:organization:references:cc:to
 :content-language:subject:reply-to:from:user-agent:mime-version:date
 :message-id:from:to:cc:subject:date:message-id:reply-to;
 bh=e3tVOFl92w/Aats7SUyqS11ecUZr32zKmXoR5aDU0FQ=;
 b=LcCTXXQT6z7OaTVvtdcWd+gdStz/McjofcWAae7bXagbzGa3mK588td7XZSooWk+Ky
 UL6sMrvgLyKZv9Lgt+2/9DJMf+VVcRRnSoIWDNN2O6aL4Asgz20FFWTcPFgl+i1yTn2m
 BpdSt7o4rwM+9OX7XiJF28arZSrcN5qivZkITDHAW69yTazpw/QaLqFCKB45I1rxJwbM
 MOSXCwd5aZBuP/J6mtmKK44nEXkAFm12RMOe+ylVzGCSyH5wl9LY9PdLx4SGLWqY3Km3
 fxx4R0dZaXOxh3M1Pi/wl2dnHDSEVV3wMlIcNbKv186yeocSerUcYqne0yl6rvfZpjpb
 YWlw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1684744515; x=1687336515;
 h=content-transfer-encoding:in-reply-to:organization:references:cc:to
 :content-language:subject:reply-to:from:user-agent:mime-version:date
 :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=e3tVOFl92w/Aats7SUyqS11ecUZr32zKmXoR5aDU0FQ=;
 b=SQqQzWnJYbxJ08YF0IirLsH3YV0f7+AT2mPItiKbbl3oPbLbC3rzEoJOzFL8eWKhpb
 BmvAQt+n/MvA767+Fqk3fka0Ji4wcw+E8N5fR5YAsCCX8R6tgXmRIkZ3X/EU+Z1kD4fz
 KVVHvLdQLPdxZ98lI9DXVJXN1clTjR/trclCxj52Q9irpvwFmcsGbJYtG6O0tjhIShJg
 fckDYS6qimb9dSTu5ejprzbqN0LdaoBQ+IVJOM0aYWSwdpMb62PVK+wWJQhzTHk8H/lL
 JrvlfzedAHa9alXTEQAElChJXof3XYuru+h1haLdTSc2rn4dGn0jA9+yxE0Qj2Q87hef
 rDFA==
X-Gm-Message-State: AC+VfDwiE+WUq3gi1ybYp6VNhkY0K3HUr89SeJ4Vqd+dec2qHdcIt22t
 ufWDm/eqB/fWJ2LiKqR+tpAdNA==
X-Google-Smtp-Source: ACHHUZ55BP+E57nsrIAO7O5I8JSLhwoBLbZLECluHO0SzLv1LozWrfuMfgkyET3w+FSHt26IgvMr/g==
X-Received: by 2002:a1c:7415:0:b0:3f6:244:55df with SMTP id
 p21-20020a1c7415000000b003f6024455dfmr2723806wmc.29.1684744514921; 
 Mon, 22 May 2023 01:35:14 -0700 (PDT)
Received: from [192.168.27.65] (home.beaume.starnux.net. [82.66.176.246])
 by smtp.gmail.com with ESMTPSA id
 j5-20020adfea45000000b0030629536e64sm6949188wrn.30.2023.05.22.01.35.13
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 22 May 2023 01:35:14 -0700 (PDT)
Message-ID: <a16f99b2-15dc-81ad-fc9c-d919689dce30@linaro.org>
Date: Mon, 22 May 2023 10:35:12 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.10.1
From: Neil Armstrong <neil.armstrong@linaro.org>
Subject: Re: [PATCH v5 3/3] MAINTAINERS: Add entry for Samsung S6D7AA0 LCD
 panel controller driver
Content-Language: en-US
To: Artur Weber <aweber.kernel@gmail.com>, thierry.reding@gmail.com
References: <20230519170354.29610-1-aweber.kernel@gmail.com>
 <20230519170354.29610-4-aweber.kernel@gmail.com>
Organization: Linaro Developer Services
In-Reply-To: <20230519170354.29610-4-aweber.kernel@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
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
Reply-To: neil.armstrong@linaro.org
Cc: devicetree@vger.kernel.org, Conor Dooley <conor+dt@kernel.org>,
 Sam Ravnborg <sam@ravnborg.org>, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, Rob Herring <robh+dt@kernel.org>,
 ~postmarketos/upstreaming@lists.sr.ht,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Nikita Travkin <nikita@trvn.ru>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 19/05/2023 19:03, Artur Weber wrote:
> Add myself as maintainer of the Samsung S6D7AA0 panel driver.
> 
> Signed-off-by: Artur Weber <aweber.kernel@gmail.com>
> ---
>   MAINTAINERS | 6 ++++++
>   1 file changed, 6 insertions(+)
> 
> diff --git a/MAINTAINERS b/MAINTAINERS
> index 402e26d0cdbc..7cc2bfa4af6f 100644
> --- a/MAINTAINERS
> +++ b/MAINTAINERS
> @@ -6663,6 +6663,12 @@ S:	Maintained
>   F:	Documentation/devicetree/bindings/display/panel/samsung,s6d27a1.yaml
>   F:	drivers/gpu/drm/panel/panel-samsung-s6d27a1.c
>   
> +DRM DRIVER FOR SAMSUNG S6D7AA0 PANELS
> +M:	Artur Weber <aweber.kernel@gmail.com>
> +S:	Maintained
> +F:	Documentation/devicetree/bindings/display/panel/samsung,s6d7aa0.yaml
> +F:	drivers/gpu/drm/panel/panel-samsung-s6d7aa0.c
> +
>   DRM DRIVER FOR SITRONIX ST7703 PANELS
>   M:	Guido Günther <agx@sigxcpu.org>
>   R:	Purism Kernel Team <kernel@puri.sm>

Reviewed-by: Neil Armstrong <neil.armstrong@linaro.org>
