Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A9F08647A04
	for <lists+dri-devel@lfdr.de>; Fri,  9 Dec 2022 00:33:26 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 62E2E10E202;
	Thu,  8 Dec 2022 23:33:22 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-x130.google.com (mail-lf1-x130.google.com
 [IPv6:2a00:1450:4864:20::130])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A75EB10E205
 for <dri-devel@lists.freedesktop.org>; Thu,  8 Dec 2022 23:33:18 +0000 (UTC)
Received: by mail-lf1-x130.google.com with SMTP id b3so4447148lfv.2
 for <dri-devel@lists.freedesktop.org>; Thu, 08 Dec 2022 15:33:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=WKLCGPGfVZh6K4P5LObd29YMXv67XFhw120dHjFqUZo=;
 b=Gaqs+aAobAs+lOUTPXm908H7oa0DBenVVlakNRzRT5qX22jZDr2hE/G0iMP7Fd8cSk
 BeZUT0pmmPqyjFN5L+BAM85LoJsxtjYAleaSEWd0dIR6Ks2gkyXiSYW27lFoMy0BBZQv
 o/vJ2ZMzI4xsVd+kNvwXv0bfzHFZYjM8O+8TA2cmLM7SvHInimLkUqq87fTR2ueC5dy1
 /cW09r4JuHeW8yWLxGZe+Izdn2V2pid/FJHXhMFhRoDQRCpYpwXjU2u/8uFxNKxKY5J7
 nfoowsTC4oZyEVspoivUI2WLoMs73bA23yEgnq0qzGGpvZCnLo7rN/A2QDWdJZaUUixp
 j4IA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=WKLCGPGfVZh6K4P5LObd29YMXv67XFhw120dHjFqUZo=;
 b=wyWPW5UXDFfLoO8DpPS1v3gEVV0kJMh/cSPpIbKzn0G9HSYjtThpR7uKYDMkIDJbiT
 /TAZZ5D6QhWqd9tSKFyjhscG9+Vtaq67yzqxwg99lKD/IqO/bpSlyHedUNiyCN8V800K
 1fF29CU7gQIPJ0P0F+AJUv8fH7ZXgc/q9wyCNJaFOrCmPxC5PQGUv1n9hKwLH+NFpu0l
 r7FAQKKw9H3NBEQRV6MWNLkpvJJY4YhT6Jktz5ILU59Frh1KmgykOKaRZJoKcarme+M5
 iYef2R97wBQvckT6Pa0Qr96qv8EQlDtHvIgHUGWjEsZ8U65rFR/dEcRwXE1rNUKpxol0
 P9Tg==
X-Gm-Message-State: ANoB5pm22AJnNF3rau5d51xPDDUyziGufAZW/jmI5sgLhMtiEcLe13V2
 iGHJa34kkGDUkkDftb0L9Hp/Sw==
X-Google-Smtp-Source: AA0mqf4ttdrlIL415TFzJIJKvMPqmL4hzylAmJ4ddxoVWA9pCJpeG9f1mln1+c2kxMD18c/zKp6O1w==
X-Received: by 2002:ac2:5a43:0:b0:4b5:90c5:281c with SMTP id
 r3-20020ac25a43000000b004b590c5281cmr926818lfn.19.1670542397012; 
 Thu, 08 Dec 2022 15:33:17 -0800 (PST)
Received: from ?IPV6:2001:14ba:a085:4d00::8a5?
 (dzccz6yyyyyyyyyyybcwt-3.rev.dnainternet.fi. [2001:14ba:a085:4d00::8a5])
 by smtp.gmail.com with ESMTPSA id
 w26-20020ac2443a000000b004b1892aa5c8sm2823lfl.56.2022.12.08.15.33.16
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 08 Dec 2022 15:33:16 -0800 (PST)
Message-ID: <5a3865ed-8847-db04-3d60-f35438250bef@linaro.org>
Date: Fri, 9 Dec 2022 01:33:15 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.5.1
Subject: Re: [PATCH v11 2/5] dt-bindings: msm/dp: add data-lanes and
 link-frequencies property
To: Kuogee Hsieh <quic_khsieh@quicinc.com>, dri-devel@lists.freedesktop.org,
 robdclark@gmail.com, sean@poorly.run, swboyd@chromium.org,
 dianders@chromium.org, vkoul@kernel.org, daniel@ffwll.ch, airlied@linux.ie,
 agross@kernel.org, andersson@kernel.org, konrad.dybcio@somainline.org,
 robh+dt@kernel.org, krzysztof.kozlowski+dt@linaro.org,
 devicetree@vger.kernel.org, airlied@gmail.com
References: <1670539015-11808-1-git-send-email-quic_khsieh@quicinc.com>
 <1670539015-11808-3-git-send-email-quic_khsieh@quicinc.com>
Content-Language: en-GB
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
In-Reply-To: <1670539015-11808-3-git-send-email-quic_khsieh@quicinc.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
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
Cc: linux-arm-msm@vger.kernel.org, quic_sbillaka@quicinc.com,
 freedreno@lists.freedesktop.org, quic_abhinavk@quicinc.com,
 linux-kernel@vger.kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 09/12/2022 00:36, Kuogee Hsieh wrote:
> Add both data-lanes and link-frequencies property into endpoint
> 
> Changes in v7:
> -- split yaml out of dtsi patch
> -- link-frequencies from link rate to symbol rate
> -- deprecation of old data-lanes property
> 
> Changes in v8:
> -- correct Bjorn mail address to kernel.org
> 
> Changes in v10:
> -- add menu item to data-lanes and link-frequecnis
> 
> Changes in v11:
> -- add endpoint property at port@1
> 
> Signed-off-by: Kuogee Hsieh <quic_khsieh@quicinc.com>`

Applying: dt-bindings: msm/dp: add data-lanes and link-frequencies property
.git/rebase-apply/patch:47: trailing whitespace.

.git/rebase-apply/patch:51: trailing whitespace.


Also the dt_binding_check fails with an error for this schema. And after 
fixing the error in the schema I faced an example validation error. Did 
you check that the schema is correct and that the example validates 
against the schema?

> ---
>   .../bindings/display/msm/dp-controller.yaml        | 27 ++++++++++++++++++++++
>   1 file changed, 27 insertions(+)
> 
> diff --git a/Documentation/devicetree/bindings/display/msm/dp-controller.yaml b/Documentation/devicetree/bindings/display/msm/dp-controller.yaml
> index f2515af..2a7fdef8 100644
> --- a/Documentation/devicetree/bindings/display/msm/dp-controller.yaml
> +++ b/Documentation/devicetree/bindings/display/msm/dp-controller.yaml
> @@ -81,6 +81,7 @@ properties:
>   
>     data-lanes:
>       $ref: /schemas/types.yaml#/definitions/uint32-array
> +    deprecated: true
>       minItems: 1
>       maxItems: 4
>       items:
> @@ -96,6 +97,7 @@ properties:
>   
>     ports:
>       $ref: /schemas/graph.yaml#/properties/ports
> +
>       properties:
>         port@0:
>           $ref: /schemas/graph.yaml#/properties/port
> @@ -105,6 +107,29 @@ properties:
>           $ref: /schemas/graph.yaml#/properties/port
>           description: Output endpoint of the controller
>   
> +        properties:
> +          endpoint:
> +            $ref: /schemas/media/video-interfaces.yaml#
> +
> +            properties:
> +              remote-endpoint: true

PLease add empty lines between the property definitions

> +              data-lanes:
> +                $ref: /schemas/types.yaml#/definitions/uint32-array

This is already a part of video-interfaces, so you don't need $ref

> +                minItems: 1
> +                maxItems: 4
> +                items:
> +                  maximum: 3

enum: [0, 1, 2, 3]

> +              link-frequencies:
> +                $ref: /schemas/types.yaml#/definitions/uint64-array
> +                minItems: 1
> +                maxItems: 4
> +                items:
> +                  maximum: 8100000000

I think we can have enum here too.

> +
> +  required:
> +    - port@0
> +    - port@1
> +
>   required:
>     - compatible
>     - reg
> @@ -193,6 +218,8 @@ examples:
>                   reg = <1>;
>                   endpoint {
>                       remote-endpoint = <&typec>;
> +                    data-lanes = <0 1>;
> +                    link-frequencies = /bits/ 64 <1620000000 2700000000 5400000000 8100000000>;
>                   };
>               };
>           };

-- 
With best wishes
Dmitry

