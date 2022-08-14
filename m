Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 28E4259269C
	for <lists+dri-devel@lfdr.de>; Sun, 14 Aug 2022 23:25:38 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AC776A1F34;
	Sun, 14 Aug 2022 21:25:29 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pl1-f177.google.com (mail-pl1-f177.google.com
 [209.85.214.177])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8DB3FA1F60;
 Sun, 14 Aug 2022 21:25:23 +0000 (UTC)
Received: by mail-pl1-f177.google.com with SMTP id 17so4977306pli.0;
 Sun, 14 Aug 2022 14:25:23 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc;
 bh=Qo7JqMyBl98Dfi1GLWq2+D40THRpPwUbZg2FaTyray4=;
 b=cFhG4xYIP+QX6RE6oBOlBJt7FShVGUIhvqemVtyXg12LQBcw6qwwEkYhV53R7APjhH
 fA3HdUagkmC9XZyhfc5aM+6cf7ShDFWD7IF57vxt9pHDIrOF+/RpZ3Xpm0+3o9BnACmD
 j6BwLofD1rcxVGdvrckPiATUJeI0tAFBUNs/k/d2udnHbZDUhDUwxOE5KUE1VT2v9hJh
 EWAo5F+2YstMISlJt34mlaKAgTuBz+d5Pi8yaL1ipniBCeX6evDATE1X8MwCr/6+uDrF
 txOefl3KGLpJ9+nLYjEInsjxedlTyA7jgbY65/AuEKpiNFiD75bWLSyj9KU7yoVYDKyF
 xaiA==
X-Gm-Message-State: ACgBeo3MB1FPn4qaaea+XbvNqy+Jm5voQ+Qn2PZYeABUpIuayRvejjPP
 kmBp19e80JxhH68I029Iqw==
X-Google-Smtp-Source: AA6agR6CPtGSg5LrG2ATwGoXMf1RpAO/eKlw9Rdknyh9z164drqoQsdZs5vV+g2HhnZkK+fhVMn1Kw==
X-Received: by 2002:a17:90a:8808:b0:1f7:4bd3:3760 with SMTP id
 s8-20020a17090a880800b001f74bd33760mr15279401pjn.170.1660512322794; 
 Sun, 14 Aug 2022 14:25:22 -0700 (PDT)
Received: from robh.at.kernel.org ([2607:fb90:282b:ad51:2025:80dc:3a15:a2de])
 by smtp.gmail.com with ESMTPSA id
 a6-20020a170902710600b0016ed20eacd2sm5730887pll.150.2022.08.14.14.25.19
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 14 Aug 2022 14:25:22 -0700 (PDT)
Received: (nullmailer pid 736117 invoked by uid 1000);
 Sun, 14 Aug 2022 21:25:17 -0000
Date: Sun, 14 Aug 2022 15:25:17 -0600
From: Rob Herring <robh@kernel.org>
To: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Subject: Re: [PATCH 1/5] dt-bindings: display/msm: dpu-msm8998: add missing
 DPU opp-table
Message-ID: <20220814212517.GA716652-robh@kernel.org>
References: <20220811084331.83715-1-krzysztof.kozlowski@linaro.org>
 <20220811084331.83715-2-krzysztof.kozlowski@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220811084331.83715-2-krzysztof.kozlowski@linaro.org>
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
Cc: freedreno@lists.freedesktop.org, Loic Poulain <loic.poulain@linaro.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 devicetree@vger.kernel.org, David Airlie <airlied@linux.ie>,
 linux-arm-msm@vger.kernel.org, Abhinav Kumar <quic_abhinavk@quicinc.com>,
 dri-devel@lists.freedesktop.org, Stephen Boyd <swboyd@chromium.org>,
 Jami Kettunen <jami.kettunen@somainline.org>,
 Krishna Manikandan <quic_mkrishn@quicinc.com>,
 Del Regno <angelogioacchino.delregno@somainline.org>,
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
 Bjorn Andersson <bjorn.andersson@linaro.org>, Sean Paul <sean@poorly.run>,
 linux-kernel@vger.kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Thu, Aug 11, 2022 at 11:43:27AM +0300, Krzysztof Kozlowski wrote:
> The 'display-controller' child (DPU) of Display SubSystem (MDSS) uses
> opp-table, so reference it which allows restricting DPU schema to fixed
> list of properties.
> 
> Fixes: 6e986a8f1cf1 ("dt-bindings: display: msm: Add binding for msm8998 dpu")
> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
> 
> ---
> 
> Cc: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> Cc: Rob Clark <robdclark@gmail.com>
> Cc: Sean Paul <sean@poorly.run>
> Cc: Abhinav Kumar <quic_abhinavk@quicinc.com>
> ---
>  Documentation/devicetree/bindings/display/msm/dpu-msm8998.yaml | 3 +++
>  1 file changed, 3 insertions(+)
> 
> diff --git a/Documentation/devicetree/bindings/display/msm/dpu-msm8998.yaml b/Documentation/devicetree/bindings/display/msm/dpu-msm8998.yaml
> index 2df64afb76e6..7ed438bc7dce 100644
> --- a/Documentation/devicetree/bindings/display/msm/dpu-msm8998.yaml
> +++ b/Documentation/devicetree/bindings/display/msm/dpu-msm8998.yaml
> @@ -62,6 +62,7 @@ patternProperties:
>    "^display-controller@[0-9a-f]+$":
>      type: object
>      description: Node containing the properties of DPU.
> +    additionalProperties: false
>  
>      properties:
>        compatible:
> @@ -105,6 +106,8 @@ patternProperties:
>          maxItems: 1
>  
>        operating-points-v2: true
> +      opp-table: true

type: object

Otherwise, 'opp-table;' would be accepted.

> +
>        ports:
>          $ref: /schemas/graph.yaml#/properties/ports
>          description: |
> -- 
> 2.34.1
> 
> 
