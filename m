Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 8AC544E9D62
	for <lists+dri-devel@lfdr.de>; Mon, 28 Mar 2022 19:22:42 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 54EB610E726;
	Mon, 28 Mar 2022 17:22:33 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-x32d.google.com (mail-wm1-x32d.google.com
 [IPv6:2a00:1450:4864:20::32d])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4E41E10EDAD
 for <dri-devel@lists.freedesktop.org>; Mon, 28 Mar 2022 15:52:06 +0000 (UTC)
Received: by mail-wm1-x32d.google.com with SMTP id
 p12-20020a05600c430c00b0038cbdf52227so8840665wme.2
 for <dri-devel@lists.freedesktop.org>; Mon, 28 Mar 2022 08:52:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:in-reply-to:content-transfer-encoding;
 bh=GwP5ugk0tQduHftN8yL0lI1uYPDme19MV0QPD5H1y78=;
 b=arWhFvK2N7y5+CW4x51ZmDby82Ql23kNGRMi9uYrw1Cn13SAVJ07VNWWsyMqWmigJS
 p+I5GLteb7CmWLTs1zVORSuj0Sk/wcBrmkq/lO9aLiHtOMtrir04BDA9K918CKOhfWXq
 bzocvFVuU3o8hK+duUP7iMV4gdg7vjJ3b3xWLsIXAynNnn/L6+vuBU0Jdv12OZivb1u4
 5CCEytWu7yHvK52J/SUILF4y8456JdSsFQggVYsoajxFR+PW/AulYRv0YPJdnMx3g3Va
 ThzbvYWkBn0Jpv+DHFhQ515GNWJTMZvg0bj8LX6ji0IZUSEcD/cnszu3Ceku5BTNOYRm
 T6Cw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=GwP5ugk0tQduHftN8yL0lI1uYPDme19MV0QPD5H1y78=;
 b=caSt8GGguTTrA6Lv4weEfIOPgujlMt3en9qzQSu/XeCtgQCDd/T2GihS7UT9SPdSbr
 Rl5Sd69RoCFwev34ZmxGA+/IEbtkGiuHZi8ylfU8Fk6ewU6YRnSdjVlFJoN1sKPRYE02
 VkP5XO161oVmOZGs808FeA085ZJibJJ3p4rDtOJHk+VFC7Q0k5FG2f+iRI3UP3lzpOJX
 kwk7Iw4m+YrQgElXFj8mBe3x6+U5pRmbOSYvkgQkSS2OgIIlcNSIHCavBaJPR7gsKptr
 p+tEZ9iG76JALABJ0VtdVmBr3JOdX4vFY065Uq9amgr7a9DhHch2ZjDv4B81wv7LOm2V
 vyhg==
X-Gm-Message-State: AOAM533zb2qIo5MSSh1v6Qf95ty6EQN2EXlKZunYlZ0/URatcUofar5N
 OGQMGKlBpucPPsm0NcN9leOVvQ==
X-Google-Smtp-Source: ABdhPJyyUqsamosO4tTuybJr4KEp61RxvQgbNiyY0IkIVr55UV/cpGdkMnRiwYF0QSghJUBEDuttAA==
X-Received: by 2002:a05:600c:3546:b0:38c:a8ff:843b with SMTP id
 i6-20020a05600c354600b0038ca8ff843bmr27702630wmq.24.1648482724879; 
 Mon, 28 Mar 2022 08:52:04 -0700 (PDT)
Received: from [192.168.0.162] (xdsl-188-155-201-27.adslplus.ch.
 [188.155.201.27]) by smtp.gmail.com with ESMTPSA id
 m3-20020a5d6243000000b001e33760776fsm12628577wrv.10.2022.03.28.08.52.03
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 28 Mar 2022 08:52:04 -0700 (PDT)
Message-ID: <a43825b5-b7c7-e805-c9dc-0498d752d4f2@linaro.org>
Date: Mon, 28 Mar 2022 17:52:03 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.0
Subject: Re: [PATCH] dt-bindings: display: msm: dsi: remove address/size cells
Content-Language: en-US
To: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
 Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
 Abhinav Kumar <quic_abhinavk@quicinc.com>, David Airlie <airlied@linux.ie>,
 Daniel Vetter <daniel@ffwll.ch>, Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Krishna Manikandan <mkrishn@codeaurora.org>, linux-arm-msm@vger.kernel.org,
 dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20220328152923.90623-1-krzysztof.kozlowski@linaro.org>
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20220328152923.90623-1-krzysztof.kozlowski@linaro.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Mailman-Approved-At: Mon, 28 Mar 2022 17:22:31 +0000
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
Cc: Vinod Koul <vkoul@kernel.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 28/03/2022 17:29, Krzysztof Kozlowski wrote:
> The DSI node is not a bus and the children do not have unit addresses.

Eh, actually MIPI DSI is a serial bus, so address/size cells seem right
and my patch is not correct.

> 
> Reported-by: Vinod Koul <vkoul@kernel.org>
> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
> ---
>  .../bindings/display/msm/dsi-controller-main.yaml          | 7 -------
>  1 file changed, 7 deletions(-)
> 
> diff --git a/Documentation/devicetree/bindings/display/msm/dsi-controller-main.yaml b/Documentation/devicetree/bindings/display/msm/dsi-controller-main.yaml
> index 7095ec3c890d..57f238f72326 100644
> --- a/Documentation/devicetree/bindings/display/msm/dsi-controller-main.yaml
> +++ b/Documentation/devicetree/bindings/display/msm/dsi-controller-main.yaml
> @@ -51,10 +51,6 @@ properties:
>    phy-names:
>      const: dsi
>  
> -  "#address-cells": true
> -
> -  "#size-cells": true
> -
>    syscon-sfpb:
>      description: A phandle to mmss_sfpb syscon node (only for DSIv2).
>      $ref: "/schemas/types.yaml#/definitions/phandle"
> @@ -154,9 +150,6 @@ examples:
>             reg = <0x0ae94000 0x400>;
>             reg-names = "dsi_ctrl";
>  
> -           #address-cells = <1>;
> -           #size-cells = <0>;
> -
>             interrupt-parent = <&mdss>;
>             interrupts = <4>;
>  


Best regards,
Krzysztof
