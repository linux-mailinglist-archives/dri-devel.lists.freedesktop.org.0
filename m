Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 55F62562275
	for <lists+dri-devel@lfdr.de>; Thu, 30 Jun 2022 21:01:37 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 628B811BFB0;
	Thu, 30 Jun 2022 19:01:35 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ej1-x62e.google.com (mail-ej1-x62e.google.com
 [IPv6:2a00:1450:4864:20::62e])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 336D211BFB0
 for <dri-devel@lists.freedesktop.org>; Thu, 30 Jun 2022 19:01:34 +0000 (UTC)
Received: by mail-ej1-x62e.google.com with SMTP id lw20so40823510ejb.4
 for <dri-devel@lists.freedesktop.org>; Thu, 30 Jun 2022 12:01:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:in-reply-to:content-transfer-encoding;
 bh=7R3EeNPzdygH8nRe9+P7GLctFQM9EBB/aI4yYSr62I4=;
 b=NK+H2mBjbhrWNGMYPJwaM/UHjXkznSmyep+1uI0lkd61j8Eeo8TvvpLs5O+TpckPgv
 OQu+vScJWmOCnEwaeCPNzkaJnpJidORQR5VH7pgnuVjiScU1KPwBObtMPE6C1wYltcfN
 t+eRAeRssEmEi1eskMxRxKRrVnb9hvBGPAG7IdII/ay/FdjdfU20K5LV61zNZ604TE00
 c46G3XljCYCICuHECSgxyaEXYRJTnan82+EEWpDjHLea6wkKvluzMYuuySdvetIvQrjS
 duf2DLErmwyqM2Q926r3n3eXOYHoybx8P85V5oKk3GYOBmRU70TDdD69igREWLT/j7pV
 +t9g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=7R3EeNPzdygH8nRe9+P7GLctFQM9EBB/aI4yYSr62I4=;
 b=5q+ymVXKNMhJP2PoKQgqhTqmf8aRYQXRm/oKH1N8BVR6XCgonLthfgjYo8ZKur9u1b
 3MCE0z//q8gYiGLAfkuYqMFfk14c4Wde71w6HVnoih40LCkMySjsbqONGROM+gnFHCYK
 rb174Ld4zTdT6gM51bV4W7nOM4A9T4IRLMq+bqjsUDH7gDPHboIcVezemv0dEPpi7/mi
 o6562sHTZzqqV4y6jVV/Xg9T0krQguJIM57rWPGrDVJXHWUCCETREZhESz1jg/BRfHQF
 AgyKcNgYcEj3Yd9uZvwH3RueepSUnDQLJcoCxqwtGLTE/ZufGgJI7ZGZ7/QPmyJikD3J
 1Ang==
X-Gm-Message-State: AJIora9QjnIms5H5rcYebeOcaFf32VEkioP0qLM7aAAdq767XBpLkKak
 ZtStFkJTjRzZZM7XISFE3FPnXA==
X-Google-Smtp-Source: AGRyM1vhswn16NyT0InBsZNwoGOr4FxxTju8XfhZuAiehPGyXIC6OjtkJ+rmHAOxYVgb7LzdHv6Tgg==
X-Received: by 2002:a17:907:1608:b0:726:a7b7:cd7a with SMTP id
 hb8-20020a170907160800b00726a7b7cd7amr9827374ejc.682.1656615692696; 
 Thu, 30 Jun 2022 12:01:32 -0700 (PDT)
Received: from [192.168.0.190] (xdsl-188-155-176-92.adslplus.ch.
 [188.155.176.92]) by smtp.gmail.com with ESMTPSA id
 jz27-20020a17090775fb00b006fecf74395bsm9485367ejc.8.2022.06.30.12.01.31
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 30 Jun 2022 12:01:31 -0700 (PDT)
Message-ID: <225e70ec-553d-4d44-fc61-543128b2ad67@linaro.org>
Date: Thu, 30 Jun 2022 21:01:30 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.10.0
Subject: Re: [PATCH 3/7] dt-bindings: msm: dsi: Fix power-domains constraint
Content-Language: en-US
To: Bryan O'Donoghue <bryan.odonoghue@linaro.org>, robdclark@gmail.com,
 quic_abhinavk@quicinc.com, dmitry.baryshkov@linaro.org, sean@poorly.run,
 airlied@linux.ie, daniel@ffwll.ch, robh+dt@kernel.org,
 krzysztof.kozlowski+dt@linaro.org
References: <20220630120845.3356144-1-bryan.odonoghue@linaro.org>
 <20220630120845.3356144-4-bryan.odonoghue@linaro.org>
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20220630120845.3356144-4-bryan.odonoghue@linaro.org>
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
Cc: devicetree@vger.kernel.org, linux-arm-msm@vger.kernel.org,
 dri-devel@lists.freedesktop.org, bjorn.andersson@linaro.org,
 quic_mkrishn@quicinc.com, swboyd@chromium.org, freedreno@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 30/06/2022 14:08, Bryan O'Donoghue wrote:
> The existing msm8916.dtsi does not depend on nor require power-domains.
> Drop from the list of required.

That's not good reason. The bindings are about hardware so the question
is whether being a part of power domain or toggling power domain on/off
is considered required for the DSI.

> 
> Fixes: 4dbe55c97741 ("dt-bindings: msm: dsi: add yaml schemas for DSI bindings")> Signed-off-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
> ---
>  .../devicetree/bindings/display/msm/dsi-controller-main.yaml     | 1 -
>  1 file changed, 1 deletion(-)
> 
> diff --git a/Documentation/devicetree/bindings/display/msm/dsi-controller-main.yaml b/Documentation/devicetree/bindings/display/msm/dsi-controller-main.yaml
> index 101adec8d9152..91324f0828448 100644
> --- a/Documentation/devicetree/bindings/display/msm/dsi-controller-main.yaml
> +++ b/Documentation/devicetree/bindings/display/msm/dsi-controller-main.yaml
> @@ -136,7 +136,6 @@ required:
>    - phy-names
>    - assigned-clocks
>    - assigned-clock-parents
> -  - power-domains
>    - ports
>  
>  additionalProperties: false


Best regards,
Krzysztof
