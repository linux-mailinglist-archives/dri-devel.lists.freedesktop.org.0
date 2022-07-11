Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id BA3A2570E13
	for <lists+dri-devel@lfdr.de>; Tue, 12 Jul 2022 01:16:44 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2C24C91153;
	Mon, 11 Jul 2022 23:16:42 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-io1-f49.google.com (mail-io1-f49.google.com
 [209.85.166.49])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C7DEE91153;
 Mon, 11 Jul 2022 23:16:40 +0000 (UTC)
Received: by mail-io1-f49.google.com with SMTP id h200so6347099iof.9;
 Mon, 11 Jul 2022 16:16:40 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=ZuF76X4YU6JvnI68syJ5Md9tmj3eXB8XjFf0wgCrB4Q=;
 b=fg+IvD2xbtKqAQ918a+x8zf2Q22qE9hSnajx1etC/2d1pRqJHWqp/3vxnBMru8Cxtn
 4qSqx71X/fOz6MI0AChCI84/V8msHMC8NDBfIBBtzEB3lsBW8vPdq/QyZfKAT59LRqnn
 oidTRp5qufgfcuw+G5Hc1O2k9K50FaUhVoKko0+vNc4a1qon/xghmslg161Wy03R+gp7
 5Tsu2YD97izdz/GZ8TxMl/jD1EmPBmqO8go26cdBYqfrmT+6Cxxh12q6BYgBNf4spM6P
 /3WTMmODYjOuOUpbAP1aCE5aXPp/DPqV+MxckWi9LD6OoOdZrkgwLXghXYc2V8hlVEbI
 CJ+Q==
X-Gm-Message-State: AJIora8P51q0rpUDTrPh/Q63h9rS6EhHPZ3RGoBNDTBTACo0kz12JqN+
 Ys0DfEj5+sL/XH4nLpGz2w==
X-Google-Smtp-Source: AGRyM1sU451jGTNs+lIP9oT36bsvBr/mKWq8MTrg82xUx4ilv9OJhxoiFPZNt1ca/5UOJUxRv3rGeg==
X-Received: by 2002:a02:a890:0:b0:33f:22b8:cb0b with SMTP id
 l16-20020a02a890000000b0033f22b8cb0bmr12033107jam.136.1657581400017; 
 Mon, 11 Jul 2022 16:16:40 -0700 (PDT)
Received: from robh.at.kernel.org ([64.188.179.248])
 by smtp.gmail.com with ESMTPSA id
 n2-20020a056638120200b0033ebf04f624sm3433362jas.152.2022.07.11.16.16.38
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 11 Jul 2022 16:16:39 -0700 (PDT)
Received: (nullmailer pid 453057 invoked by uid 1000);
 Mon, 11 Jul 2022 23:16:38 -0000
Date: Mon, 11 Jul 2022 17:16:38 -0600
From: Rob Herring <robh@kernel.org>
To: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Subject: Re: [PATCH v2 8/9] dt-bindings: msm/dp: add missing properties
Message-ID: <20220711231638.GA449827-robh@kernel.org>
References: <20220710084133.30976-1-dmitry.baryshkov@linaro.org>
 <20220710084133.30976-9-dmitry.baryshkov@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220710084133.30976-9-dmitry.baryshkov@linaro.org>
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
Cc: devicetree@vger.kernel.org, David Airlie <airlied@linux.ie>,
 linux-arm-msm@vger.kernel.org, Kuogee Hsieh <quic_khsieh@quicinc.com>,
 Konrad Dybcio <konrad.dybcio@somainline.org>,
 Abhinav Kumar <quic_abhinavk@quicinc.com>, dri-devel@lists.freedesktop.org,
 Bjorn Andersson <bjorn.andersson@linaro.org>, freedreno@lists.freedesktop.org,
 Andy Gross <agross@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Stephen Boyd <swboyd@chromium.org>, Sean Paul <sean@poorly.run>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Sun, Jul 10, 2022 at 11:41:32AM +0300, Dmitry Baryshkov wrote:
> Document missing definitions for opp-table (DP controller OPPs), aux-bus
> (DP AUX BUS) and data-lanes (DP/eDP lanes mapping) properties.
> 
> Reviewed-by: Stephen Boyd <swboyd@chromium.org>
> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> ---
>  .../bindings/display/msm/dp-controller.yaml          | 12 ++++++++++++
>  1 file changed, 12 insertions(+)
> 
> diff --git a/Documentation/devicetree/bindings/display/msm/dp-controller.yaml b/Documentation/devicetree/bindings/display/msm/dp-controller.yaml
> index 391910d91e43..52cbf00df0ba 100644
> --- a/Documentation/devicetree/bindings/display/msm/dp-controller.yaml
> +++ b/Documentation/devicetree/bindings/display/msm/dp-controller.yaml
> @@ -70,9 +70,21 @@ properties:
>    operating-points-v2:
>      maxItems: 1
>  
> +  opp-table: true
> +
>    power-domains:
>      maxItems: 1
>  
> +  aux-bus:
> +    $ref: /schemas/display/dp-aux-bus.yaml#
> +
> +  data-lanes:

But this is the wrong location for 'data-lanes'. It belongs in an 
endpoint node.

> +    $ref: /schemas/types.yaml#/definitions/uint32-array
> +    minItems: 1
> +    maxItems: 4
> +    items:
> +      maximum: 3
> +
>    "#sound-dai-cells":
>      const: 0
>  
> -- 
> 2.35.1
> 
> 
