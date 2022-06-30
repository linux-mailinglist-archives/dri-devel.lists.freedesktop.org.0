Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 3EF1B562291
	for <lists+dri-devel@lfdr.de>; Thu, 30 Jun 2022 21:05:39 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 96EA112A72D;
	Thu, 30 Jun 2022 19:05:36 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ed1-x535.google.com (mail-ed1-x535.google.com
 [IPv6:2a00:1450:4864:20::535])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E695212A72D
 for <dri-devel@lists.freedesktop.org>; Thu, 30 Jun 2022 19:05:34 +0000 (UTC)
Received: by mail-ed1-x535.google.com with SMTP id c65so120820edf.4
 for <dri-devel@lists.freedesktop.org>; Thu, 30 Jun 2022 12:05:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:in-reply-to:content-transfer-encoding;
 bh=BI7o2m1di6Fxr92zjHH1ilkSrPXUQ3qpxAvHzx7wmus=;
 b=oz5ApcXuQDAXd2XbGxM/vUAHxUTjHoVRqVmbQpDAGZBK/V3aJSoBkM1iAUaCmkIjrF
 9DkHz+9N/kE5wrBdZj57M86eCbKM7BHq4kbVql4nHqKlOfuzzDgsD9BKDXBjjqplGuFY
 j0vjHDY+5E5yQl5GkwUFK8IrUt7VpKnnltcfgTlMvH4i0BxNwTFssXmKZHkleXE6JCAL
 Fd0wXL9kddD/oLQ/hh+kkcXtCb9nHlRhdpA5qFyIDKfyTv/QvwtM5i3oBytiNLqdrq0j
 Kyt6WavcwV7ExmnHbNfWovEEeXzby6bsrRS3pjWwL9k5wXPRDzmVIxCkjqcEjwPOnYKK
 6LEA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=BI7o2m1di6Fxr92zjHH1ilkSrPXUQ3qpxAvHzx7wmus=;
 b=44UlYYOkrwBs2JUHEirmuo0czgSRYXcJ9jg2PqRX0ihuAEXQuDgllhKXbHkdFBVO6O
 8GVsWoDlqb/tkGyEK7pl4GIH51s+pwtlhTk0eoXHZ6IKupQZ8DXBMGPPRJRk3MXCaKmY
 OzYMH4INdumb/V5HfOQpP1tTG1s9h7R7CilztsCupgVlhz0F6tNHkKYQZ6/DKf/5bpG0
 WNe0nIgb4tYkvCQmedmV1W2EGS2C1Yl8NV7HLcafxj427tp8esb1kmxyHOygGh9t+5tu
 XcmvpFdJ8QY13rCwnGy4KeO8+9DNJcJuw2dV5uMNf34tDBcAqhC0EuhgBqVfg3I0bwSK
 hzHQ==
X-Gm-Message-State: AJIora+ylSJB0d1o41fmGI28UUpRemvkEUzrxazRvZBO0P66WQcxxnDv
 +9Z/Yt2HaJkksDXYSkxVjbU+gA==
X-Google-Smtp-Source: AGRyM1svQ2NWTOnGnICy5xYjN71LdS2ntjY8DixHgoD8DTC5FyP/Rb299CgUbEwsTQOXBlnU1iezpQ==
X-Received: by 2002:a05:6402:320f:b0:435:7236:e312 with SMTP id
 g15-20020a056402320f00b004357236e312mr13625868eda.115.1656615933507; 
 Thu, 30 Jun 2022 12:05:33 -0700 (PDT)
Received: from [192.168.0.190] (xdsl-188-155-176-92.adslplus.ch.
 [188.155.176.92]) by smtp.gmail.com with ESMTPSA id
 pv1-20020a170907208100b00726abf9cd8esm5163144ejb.125.2022.06.30.12.05.31
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 30 Jun 2022 12:05:32 -0700 (PDT)
Message-ID: <51e23956-08b3-d6f6-61e9-be4c5020831c@linaro.org>
Date: Thu, 30 Jun 2022 21:05:31 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.10.0
Subject: Re: [PATCH 6/7] dt-bindings: msm: dsi: Add missing clocks to 28nm DSI
 PHY YAML
Content-Language: en-US
To: Bryan O'Donoghue <bryan.odonoghue@linaro.org>, robdclark@gmail.com,
 quic_abhinavk@quicinc.com, dmitry.baryshkov@linaro.org, sean@poorly.run,
 airlied@linux.ie, daniel@ffwll.ch, robh+dt@kernel.org,
 krzysztof.kozlowski+dt@linaro.org
References: <20220630120845.3356144-1-bryan.odonoghue@linaro.org>
 <20220630120845.3356144-7-bryan.odonoghue@linaro.org>
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20220630120845.3356144-7-bryan.odonoghue@linaro.org>
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
> Add in missing clock and clock-names declarations to the 28nm DSI PHY.
> When converting from .txt to .yaml we missed these.
> 
> Fixes: 4dbe55c97741 ("dt-bindings: msm: dsi: add yaml schemas for DSI bindings")
> Signed-off-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
> ---
>  .../bindings/display/msm/dsi-phy-28nm.yaml      | 17 +++++++++++++++++

You need to fix all your subject prefixes. It's confusing to see again
clocks being fixed for the DSI bindings.

 dt-bindings: msm: dsi-phy-28nm:

and similarly for other cases.


>  1 file changed, 17 insertions(+)
> 
> diff --git a/Documentation/devicetree/bindings/display/msm/dsi-phy-28nm.yaml b/Documentation/devicetree/bindings/display/msm/dsi-phy-28nm.yaml
> index 3d8540a06fe22..9ecd513d93661 100644
> --- a/Documentation/devicetree/bindings/display/msm/dsi-phy-28nm.yaml
> +++ b/Documentation/devicetree/bindings/display/msm/dsi-phy-28nm.yaml
> @@ -19,6 +19,21 @@ properties:
>        - qcom,dsi-phy-28nm-lp
>        - qcom,dsi-phy-28nm-8960
>  
> +  clocks:
> +    minItems: 1
> +    maxItems: 2
> +
> +  clock-names:
> +    items:
> +      - const: iface
> +        description: AHB clock

Descriptions goes to clocks.

> +      - const: iface_clk
> +        description: AHB clock
> +      - const: ref
> +        description: Block reference clock
> +    minItems: 1
> +    maxItems: 2

Did you test it? Three items vs maxItems:2?

> +
>    reg:
>      items:
>        - description: dsi pll register set
> @@ -36,6 +51,8 @@ properties:
>  
>  required:
>    - compatible
> +  - clocks
> +  - clock-names
>    - reg
>    - reg-names
>    - vddio-supply


Best regards,
Krzysztof
