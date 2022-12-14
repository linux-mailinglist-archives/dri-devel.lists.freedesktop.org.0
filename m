Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 393DE64CDD7
	for <lists+dri-devel@lfdr.de>; Wed, 14 Dec 2022 17:20:10 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 88AF510E42E;
	Wed, 14 Dec 2022 16:20:04 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-oa1-f52.google.com (mail-oa1-f52.google.com
 [209.85.160.52])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EB22310E429;
 Wed, 14 Dec 2022 16:19:58 +0000 (UTC)
Received: by mail-oa1-f52.google.com with SMTP id
 586e51a60fabf-1442977d77dso17229799fac.6; 
 Wed, 14 Dec 2022 08:19:58 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=pmxnkBtZ4+9GBAc6tSJuQtB+ybkrmuXMMJ4mdgofo5Q=;
 b=Eh6PGELkNvp5+fB9AXwncO0BfNF/uK8mN1UXraDwsEd/M7iZKg4MgA4ThGGA3XfX4+
 yrSI0PvrLP7XG/SmQkmUS+E71v0IscOFEE5oysKofgW5iA8nrwZg1ArSpjP2mKbYCEP4
 f5X8JOWfuW4aJ/1wgdopjNrUTEsX8DyLdU5z8AnIn0/PkoZ2a6yGiIHUF+ppQZfAQGHZ
 9e6ypvdBcL4SBukoETi9vVREuW6jVjsya4Z6wbTY/PZVLGoMDGq1YG/0wv5wC/iyScH7
 AxSIy1P0Lyy8p0SDp+ASWVrKcbXQs4Ie5MVwdbhSSCwLIcuYHyYQNTKbZ6FIWyGd+K77
 K+IA==
X-Gm-Message-State: ANoB5pnWbQfh/xk3uRjwELgb8MoYVz1jn+s7a+VxHlQLHUSH4P5i3mIn
 2plKIrSgATNyB8ZFVN8eGA==
X-Google-Smtp-Source: AA0mqf6e3VGZKdUfXLywAorV3vsZOOgy1lwiko6BtumOLTx0JRi0nVu+raQ/iZcLaTVqcLb++8wnEw==
X-Received: by 2002:a05:6871:213:b0:142:9258:b78d with SMTP id
 t19-20020a056871021300b001429258b78dmr12829578oad.12.1671034798148; 
 Wed, 14 Dec 2022 08:19:58 -0800 (PST)
Received: from robh_at_kernel.org (rrcs-98-6-157-194.sw.biz.rr.com.
 [98.6.157.194]) by smtp.gmail.com with ESMTPSA id
 h4-20020a056870170400b0011f22e74d5fsm2888651oae.20.2022.12.14.08.19.45
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 14 Dec 2022 08:19:56 -0800 (PST)
Received: (nullmailer pid 1168312 invoked by uid 1000);
 Wed, 14 Dec 2022 16:19:38 -0000
Date: Wed, 14 Dec 2022 10:19:38 -0600
From: Rob Herring <robh@kernel.org>
To: Kuogee Hsieh <quic_khsieh@quicinc.com>
Subject: Re: [PATCH v13 2/5] dt-bindings: msm/dp: add data-lanes and
 link-frequencies property
Message-ID: <20221214161938.GA1164047-robh@kernel.org>
References: <1670972181-4961-1-git-send-email-quic_khsieh@quicinc.com>
 <1670972181-4961-3-git-send-email-quic_khsieh@quicinc.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1670972181-4961-3-git-send-email-quic_khsieh@quicinc.com>
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
Cc: devicetree@vger.kernel.org, quic_sbillaka@quicinc.com,
 krzysztof.kozlowski+dt@linaro.org, quic_abhinavk@quicinc.com,
 andersson@kernel.org, konrad.dybcio@somainline.org,
 dri-devel@lists.freedesktop.org, dianders@chromium.org,
 freedreno@lists.freedesktop.org, vkoul@kernel.org, agross@kernel.org,
 linux-arm-msm@vger.kernel.org, dmitry.baryshkov@linaro.org,
 swboyd@chromium.org, sean@poorly.run, linux-kernel@vger.kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Tue, Dec 13, 2022 at 02:56:18PM -0800, Kuogee Hsieh wrote:
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
> Changes in v12:
> -- use enum for item at data-lanes and link-frequencies
> 
> Changes in v13:
> -- revised changes at port@0
> -- use correct ref schemas for both port@0 and port@1
> -- mark both port@0 and port@1 are required
> -- add line between data-lanes and link-frequencies properties
> 
> Signed-off-by: Kuogee Hsieh <quic_khsieh@quicinc.com>`
> ---
>  .../bindings/display/msm/dp-controller.yaml        | 26 ++++++++++++++++++++--
>  1 file changed, 24 insertions(+), 2 deletions(-)
> 
> diff --git a/Documentation/devicetree/bindings/display/msm/dp-controller.yaml b/Documentation/devicetree/bindings/display/msm/dp-controller.yaml
> index f2515af..9d002de 100644
> --- a/Documentation/devicetree/bindings/display/msm/dp-controller.yaml
> +++ b/Documentation/devicetree/bindings/display/msm/dp-controller.yaml
> @@ -81,6 +81,7 @@ properties:
>  
>    data-lanes:
>      $ref: /schemas/types.yaml#/definitions/uint32-array
> +    deprecated: true
>      minItems: 1
>      maxItems: 4
>      items:
> @@ -98,12 +99,31 @@ properties:
>      $ref: /schemas/graph.yaml#/properties/ports
>      properties:
>        port@0:
> -        $ref: /schemas/graph.yaml#/properties/port
> +        $ref: "/schemas/graph.yaml#/$defs/port-base"

This means you have extra properties to add in the endpoint, but you 
didn't define any.

>          description: Input endpoint of the controller
>  
>        port@1:
> -        $ref: /schemas/graph.yaml#/properties/port
> +        $ref: "/schemas/graph.yaml#/$defs/port-base"

Don't need quotes. Why did you add them?

>          description: Output endpoint of the controller
> +        properties:
> +          endpoint:
> +            $ref: /schemas/media/video-interfaces.yaml#
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
>  required:
>    - compatible
> @@ -193,6 +213,8 @@ examples:
>                  reg = <1>;
>                  endpoint {
>                      remote-endpoint = <&typec>;
> +                    data-lanes = <0 1>;
> +                    link-frequencies = /bits/ 64 <1620000000 2700000000 5400000000 8100000000>; 
>                  };
>              };
>          };
> -- 
> The Qualcomm Innovation Center, Inc. is a member of the Code Aurora Forum,
> a Linux Foundation Collaborative Project
> 
> 
