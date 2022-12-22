Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id BD760653FFC
	for <lists+dri-devel@lfdr.de>; Thu, 22 Dec 2022 12:52:41 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3136810E0C2;
	Thu, 22 Dec 2022 11:52:09 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-x12d.google.com (mail-lf1-x12d.google.com
 [IPv6:2a00:1450:4864:20::12d])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 58C6E10E0C2
 for <dri-devel@lists.freedesktop.org>; Thu, 22 Dec 2022 11:52:07 +0000 (UTC)
Received: by mail-lf1-x12d.google.com with SMTP id bf43so2370349lfb.6
 for <dri-devel@lists.freedesktop.org>; Thu, 22 Dec 2022 03:52:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=M30y/3TxbO371CJNFGIt6ImCkcVESnuhbBT4xUOz+H4=;
 b=BZvKlfrnICVEkblXCG720FtFMEMhogYR+lUIo7UKozU5kskYXNCjGqbDX2DQduc9bJ
 3SJFqtwcKgerB0HCmvjxF3RufKGCqcp1U1zfB6qHZ8ucxb8tAM/EwqKQ7ye2G/4ZLngr
 Jfe+gdK1CTW0QUCi9QHwEI1hkrxc9tBZnpAu+lCmwndjpQWzrxLjKEgrzSVzDPPZbdya
 bxEs3iflfgI13yP0t6dmTaoihJSVYTWUV2wnjQflNJatJRzMvT9LtU0RJeCDv1UBYYQK
 QphUcLMtjoSNYiYUhV5q5XGKbSoBJvKxYyYoeCEeK+NmtfVu1pZoeaMRCmGZRIF6XGTF
 vRJQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=M30y/3TxbO371CJNFGIt6ImCkcVESnuhbBT4xUOz+H4=;
 b=IsTQ6Bk+IsobafaBtVnoBrUqh7/8VRD69/E3XVw/LlSs1XuOdMB3wJ/kmnlmfLqqfB
 FbM+CyU7O623bSTOeNGUHoQtNKEAdUWNCvndpFsKIBc8+CzeaosZjyB1N5I47hP4W8JK
 QRquiDEg+R58pPMH/AUqk9Vr6pOlNGOxfOrv/UFjrpo2GQkBXTaBYzAeQKJTcxg+Zeeh
 ySIJ9B49TO1r7FfQ1IRgeQo0tijtEXfBUxFLuyC+H5y6QYe1q+hNn6R/Z8gLfBhfUu8X
 nNlhLdoYOuT3+OUNMtUTCfKrnD8txmf2LUOGvpYI6hA7aJAz0ArkyCXoSMFgiuogdIJp
 DnNQ==
X-Gm-Message-State: AFqh2ko4hXiQU4SkVlV9KfFt6PmaSlBNK/Ak0iy4vdEK0+Vzduu88Lem
 uyk1TFL1ItZVL3tSG0Tf7/Gzyg==
X-Google-Smtp-Source: AMrXdXsDYcBW3ugj0qOFlwHwHKZiQ1w0s1KXbyUzMNViPONGJA9/7MRgcCx6WVU4EGLf4Zlr/CYoZQ==
X-Received: by 2002:a05:6512:3d2a:b0:4b4:b8fc:4aba with SMTP id
 d42-20020a0565123d2a00b004b4b8fc4abamr2100655lfv.25.1671709925720; 
 Thu, 22 Dec 2022 03:52:05 -0800 (PST)
Received: from [192.168.0.20]
 (088156142067.dynamic-2-waw-k-3-2-0.vectranet.pl. [88.156.142.67])
 by smtp.gmail.com with ESMTPSA id
 z14-20020ac24f8e000000b004b55cebdbd7sm47193lfs.120.2022.12.22.03.52.04
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 22 Dec 2022 03:52:05 -0800 (PST)
Message-ID: <42eec0d7-9c6d-108a-cb91-8cc069fc97e1@linaro.org>
Date: Thu, 22 Dec 2022 12:52:03 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.6.0
Subject: Re: [PATCH v5 06/21] dt-bindings: msm: dsi-controller-main: Document
 clocks on a per compatible basis
Content-Language: en-US
To: Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
 linux-arm-msm@vger.kernel.org, freedreno@lists.freedesktop.org,
 devicetree@vger.kernel.org
References: <20221220123634.382970-1-bryan.odonoghue@linaro.org>
 <20221220123634.382970-7-bryan.odonoghue@linaro.org>
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20221220123634.382970-7-bryan.odonoghue@linaro.org>
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
Cc: dri-devel@lists.freedesktop.org, krzysztof.kozlowski+dt@linaro.org,
 sean@poorly.run, andersson@kernel.org, konrad.dybcio@somainline.org,
 quic_abhinavk@quicinc.com, david@ixit.cz, dianders@chromium.org,
 robh+dt@kernel.org, agross@kernel.org, dmitry.baryshkov@linaro.org,
 swboyd@chromium.org, linux-kernel@vger.kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 20/12/2022 13:36, Bryan O'Donoghue wrote:
> Each compatible has a different set of clocks which are associated with it.
> Add in the list of clocks for each compatible.
> 
> Signed-off-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
> ---
>  .../display/msm/dsi-controller-main.yaml      | 189 +++++++++++++++++-
>  1 file changed, 179 insertions(+), 10 deletions(-)
> 
> diff --git a/Documentation/devicetree/bindings/display/msm/dsi-controller-main.yaml b/Documentation/devicetree/bindings/display/msm/dsi-controller-main.yaml
> index 98d54a7ee28d4..ce103e3ec4db3 100644
> --- a/Documentation/devicetree/bindings/display/msm/dsi-controller-main.yaml
> +++ b/Documentation/devicetree/bindings/display/msm/dsi-controller-main.yaml
> @@ -9,9 +9,6 @@ title: Qualcomm Display DSI controller
>  maintainers:
>    - Krishna Manikandan <quic_mkrishn@quicinc.com>
>  
> -allOf:
> -  - $ref: "../dsi-controller.yaml#"
> -
>  properties:
>    compatible:
>      oneOf:
> @@ -55,13 +52,8 @@ properties:
>        - description: Display AXI clock
>  
>    clock-names:
> -    items:
> -      - const: byte
> -      - const: byte_intf
> -      - const: pixel
> -      - const: core
> -      - const: iface
> -      - const: bus
> +    minItems: 3
> +    maxItems: 9
>  
>    phys:
>      maxItems: 1
> @@ -157,6 +149,183 @@ required:
>    - assigned-clock-parents
>    - ports
>  
> +allOf:
> +  - $ref: "../dsi-controller.yaml#"

Drop the quotes.

Add missing Ack.


Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

Best regards,
Krzysztof

