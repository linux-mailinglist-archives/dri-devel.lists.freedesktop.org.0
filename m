Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 2CD5F64F1FB
	for <lists+dri-devel@lfdr.de>; Fri, 16 Dec 2022 20:49:21 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 874C410E634;
	Fri, 16 Dec 2022 19:49:14 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lj1-x231.google.com (mail-lj1-x231.google.com
 [IPv6:2a00:1450:4864:20::231])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EE6A510E620
 for <dri-devel@lists.freedesktop.org>; Fri, 16 Dec 2022 19:49:09 +0000 (UTC)
Received: by mail-lj1-x231.google.com with SMTP id s10so3272445ljg.1
 for <dri-devel@lists.freedesktop.org>; Fri, 16 Dec 2022 11:49:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=6z9OvKI51ihySsgu93liVf6+X1We62nP+OEGmpfLqbY=;
 b=fqe6OZr4BK1cJGFNLwq7ZfnbVfw7pE1NnMU/JaCOq6aNEAhaKopG1a5VaBHBUAaZKQ
 TLf4y1u9f6yQjYM18vKbj15CKtWeuLFbKm4+FJoypzbQweGHY+Q3OvJdqxhwUEcNwn8X
 I3sCSqMekAImG75HER1U8aFaO1+KFS08Ilr4TKwq79ef6ZcSTIJzfXWYhCGYGHHEMF57
 p+SZ078o5fL56L6Pue6cgyeu2R0tnIPOlHYNbGn65YaT5rEzdVAKFPloKbveTBdjQeNK
 5BRRoiJB11+DwiUjFZK1t9nIHyV6TqLmgm/6cf5xjqn4mHYeIvH8Kw74KdH23Ws8ay71
 +6fw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=6z9OvKI51ihySsgu93liVf6+X1We62nP+OEGmpfLqbY=;
 b=XQbO7iyhZBKYrjYxW1ePWWpDTik7j8Rvm0HfJZOpDW8wfp5RwISC1jtXuYQKVc0ssE
 1mqfYIJBQxQXkTvybjv7zJ64G0Ol/e4tVMeVMvGc4HDrCAEXPYOSR3/d6QDqNOYLhwpp
 AjCvKItqMklZ83zQgeeLa9MzxsVfBs+vFzeUNgnZUbNPH21tYZdD1PYr5DmJ+0rhGxBH
 ZZP48y/II0PfhIuvbGXWTki3pcPBwMTmLF3/kc0xtsLk5f+lppgksD4Yk5K/iMOvwSZh
 6z0fGMLluGvnZKqnbHEWjay2R0d9WBEeDb0cFX+I5VhvWpLaa6BlyR8sqkIGmVfDeQlB
 aPFA==
X-Gm-Message-State: ANoB5pnBW9gpcneS/HEzUJXxlf163GhtvWGEnaSHJ+qA+89WTkByqgSh
 QAvm4qG3f0OsaEtnnqk1WhGKaA==
X-Google-Smtp-Source: AA0mqf43nHEgnTKkJx8PkGAY9Wz0D+UjxFUfVyEoYTgUfRFTw+weO1PR9gXva6El7Qb+jnUwh8hm5A==
X-Received: by 2002:a05:651c:1144:b0:277:1888:cfb3 with SMTP id
 h4-20020a05651c114400b002771888cfb3mr8207285ljo.16.1671220148357; 
 Fri, 16 Dec 2022 11:49:08 -0800 (PST)
Received: from ?IPV6:2001:14ba:a085:4d00::8a5?
 (dzccz6yyyyyyyyyyybcwt-3.rev.dnainternet.fi. [2001:14ba:a085:4d00::8a5])
 by smtp.gmail.com with ESMTPSA id
 p5-20020a2eb985000000b0027a00aab48fsm220337ljp.66.2022.12.16.11.49.07
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 16 Dec 2022 11:49:07 -0800 (PST)
Message-ID: <acbdfbf6-f0e7-7c89-e5a3-effcc4e3e453@linaro.org>
Date: Fri, 16 Dec 2022 21:49:07 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.5.1
Subject: Re: [PATCH v14 2/5] dt-bindings: msm/dp: add data-lanes and
 link-frequencies property
Content-Language: en-GB
To: Kuogee Hsieh <quic_khsieh@quicinc.com>, dri-devel@lists.freedesktop.org,
 robdclark@gmail.com, sean@poorly.run, swboyd@chromium.org,
 dianders@chromium.org, vkoul@kernel.org, daniel@ffwll.ch, agross@kernel.org,
 andersson@kernel.org, konrad.dybcio@somainline.org, robh+dt@kernel.org,
 krzysztof.kozlowski+dt@linaro.org, devicetree@vger.kernel.org,
 airlied@gmail.com
References: <1671217893-17496-1-git-send-email-quic_khsieh@quicinc.com>
 <1671217893-17496-3-git-send-email-quic_khsieh@quicinc.com>
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
In-Reply-To: <1671217893-17496-3-git-send-email-quic_khsieh@quicinc.com>
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

On 16/12/2022 21:11, Kuogee Hsieh wrote:
> To increase the flexibility of supporting different DP main link configuration
> at different platform, add both data-lanes and link-frequencies property
> into endpoint so that different platform can specify its own main link
> combination of both data lanes and max supported link rate.
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
> Changes in v12:
> -- use enum for item at data-lanes and link-frequencies
> 
> Changes in v13:
> -- revised changes at port@0
> -- use correct ref schemas for both port@0 and port@1
> -- mark both port@0 and port@1 are required
> -- add line between data-lanes and link-frequencies properties
> 
> Changes in v14:
> -- add "unevaluatedProperties: false: to endpoint at port@1
> -- remove unnecessary quote to $ref
> -- re store "$ref: /schemas/graph.yaml#/properties/port" to port@0
> 
> Signed-off-by: Kuogee Hsieh <quic_khsieh@quicinc.com>
> ---
>   .../bindings/display/msm/dp-controller.yaml        | 26 ++++++++++++++++++++--
>   1 file changed, 24 insertions(+), 2 deletions(-)
> 
> diff --git a/Documentation/devicetree/bindings/display/msm/dp-controller.yaml b/Documentation/devicetree/bindings/display/msm/dp-controller.yaml
> index f2515af..1f008ca 100644
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
> @@ -99,11 +100,30 @@ properties:
>       properties:
>         port@0:
>           $ref: /schemas/graph.yaml#/properties/port
> -        description: Input endpoint of the controller

Why?

>   
>         port@1:
> -        $ref: /schemas/graph.yaml#/properties/port
> +        $ref: /schemas/graph.yaml#/$defs/port-base
>           description: Output endpoint of the controller
> +        properties:
> +          endpoint:
> +            $ref: /schemas/media/video-interfaces.yaml#
> +            unevaluatedProperties: false
> +            properties:
> +              data-lanes:
> +                minItems: 1
> +                maxItems: 4
> +                items:
> +                  enum: [ 0, 1, 2, 3 ]
> +
> +              link-frequencies:
> +                minItems: 1
> +                maxItems: 4
> +                items:
> +                  enum: [ 1620000000, 2700000000, 5400000000, 8100000000 ]
> +
> +    required:
> +      - port@0
> +      - port@1
>   
>   required:
>     - compatible
> @@ -193,6 +213,8 @@ examples:
>                   reg = <1>;
>                   endpoint {
>                       remote-endpoint = <&typec>;
> +                    data-lanes = <0 1>;
> +                    link-frequencies = /bits/ 64 <1620000000 2700000000 5400000000 8100000000>;

Is the alignment correct in the patch above? It might be my client not 
displaying the patch correctly, but it doesn't look correct.

>                   };
>               };
>           };

-- 
With best wishes
Dmitry

