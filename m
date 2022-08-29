Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 7C9F25A5512
	for <lists+dri-devel@lfdr.de>; Mon, 29 Aug 2022 21:57:17 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D5B1410E99C;
	Mon, 29 Aug 2022 19:57:13 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-oa1-f46.google.com (mail-oa1-f46.google.com
 [209.85.160.46])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C1B9A10E5F1
 for <dri-devel@lists.freedesktop.org>; Mon, 29 Aug 2022 19:57:03 +0000 (UTC)
Received: by mail-oa1-f46.google.com with SMTP id
 586e51a60fabf-11f0fa892aeso3516969fac.7
 for <dri-devel@lists.freedesktop.org>; Mon, 29 Aug 2022 12:57:03 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc;
 bh=GLVAQhP67GqpGtvEpnaqWTR1PDtHdyGTARxFHlVUfXI=;
 b=DR9ES11+MwZ+1j4uFF2RJ+cw5wjDekyB2rBZptVy+svEwcrKKE034cO3AcCagao8ds
 I/zPW8IPOzZqeopVQeHK36ZVyHoUFTGo0kz9HivZr4XJb8rHsj17UODayXQQPOxvTaqL
 CPxfqg5gu/fWF11yPRhmu+HqEntxTREB+fuafTbA7fJcHgFzg/aIHtAz2s5SwgwH3zt/
 S7j/IyHU/DwyqaKwOsJGTGau06J93ONbQcCdkgjCqGAxOsGlGruSzCIQ/AE8AJllILNN
 wdFBDcVJOmROqXsuj+cgnPP6R9i6h9IZq868xDR1tyTRayM+tzmm1M+UxVn+lA3Qngik
 CuWQ==
X-Gm-Message-State: ACgBeo39zs+fZqSLjmkyy9Td+Sa77IF1usdIL3wV5dgzy7Q2rWS5wDWc
 l2P4VZa/ADtxpc+MhZdmfw==
X-Google-Smtp-Source: AA6agR6eBhT1zUHqrOJZ/uUEbZLGeR5414KMfQ2WDOIIjfxxzxd629WqjvbKt3zCzPNSGvrXcGtFKg==
X-Received: by 2002:a05:6808:99b:b0:345:d1f7:b42a with SMTP id
 a27-20020a056808099b00b00345d1f7b42amr4824869oic.79.1661803023011; 
 Mon, 29 Aug 2022 12:57:03 -0700 (PDT)
Received: from robh.at.kernel.org (66-90-144-107.dyn.grandenetworks.net.
 [66.90.144.107]) by smtp.gmail.com with ESMTPSA id
 p10-20020a4aa24a000000b0044897475dd0sm5559769ool.43.2022.08.29.12.57.02
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 29 Aug 2022 12:57:02 -0700 (PDT)
Received: (nullmailer pid 2314237 invoked by uid 1000);
 Mon, 29 Aug 2022 19:57:00 -0000
Date: Mon, 29 Aug 2022 14:57:00 -0500
From: Rob Herring <robh@kernel.org>
To: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Subject: Re: [PATCH RESEND - dt 1/2] dt-bindings: nvmem: qfprom: add IPQ8064
 and SDM630 compatibles
Message-ID: <20220829195700.GA2314199-robh@kernel.org>
References: <20220825125410.232377-1-krzysztof.kozlowski@linaro.org>
 <20220825125410.232377-2-krzysztof.kozlowski@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220825125410.232377-2-krzysztof.kozlowski@linaro.org>
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
Cc: devicetree@vger.kernel.org, Daniel Thompson <daniel.thompson@linaro.org>,
 Kiran Gunda <kgunda@codeaurora.org>, Pavel Machek <pavel@ucw.cz>,
 linux-arm-msm@vger.kernel.org, Lee Jones <lee@kernel.org>,
 Konrad Dybcio <konrad.dybcio@somainline.org>, Andy Gross <agross@kernel.org>,
 dri-devel@lists.freedesktop.org, Bjorn Andersson <bjorn.andersson@linaro.org>,
 Rob Herring <robh+dt@kernel.org>,
 Srinivas Kandagatla <srinivas.kandagatla@linaro.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Jingoo Han <jingoohan1@gmail.com>, linux-kernel@vger.kernel.org,
 linux-leds@vger.kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Thu, 25 Aug 2022 15:54:09 +0300, Krzysztof Kozlowski wrote:
> Document compatibles for QFPROM used on IPQ8064 and SDM630.  They are
> compatible with generic QFPROM fallback.
> 
> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
> ---
>  Documentation/devicetree/bindings/nvmem/qcom,qfprom.yaml | 2 ++
>  1 file changed, 2 insertions(+)
> 

Applied, thanks!
