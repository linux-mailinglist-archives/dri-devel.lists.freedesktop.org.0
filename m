Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id E472D563A53
	for <lists+dri-devel@lfdr.de>; Fri,  1 Jul 2022 22:08:17 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7356C14A7E3;
	Fri,  1 Jul 2022 20:08:14 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-il1-f174.google.com (mail-il1-f174.google.com
 [209.85.166.174])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 93B8114A7E2;
 Fri,  1 Jul 2022 20:08:13 +0000 (UTC)
Received: by mail-il1-f174.google.com with SMTP id p9so2059673ilj.7;
 Fri, 01 Jul 2022 13:08:13 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=4cmnyqPkxRKsOWfhu6C2d1GUwRFJleTnc3K78+DNh4Q=;
 b=I3AiguD/rEYen2VOAlrUhD92Lqi2hX1zJVW/oXy29hze1bvzoMq/wTgSBW3HIROoqM
 163U51K9k9w25i7wXLsu3tk7HKYZzRJ7mKlyqgnI2WjEwNyPcWbYtBQ4gg+WS3fgQzUt
 Y6GoRCWyqGpHLN8qX3KBy5EgHlDHqnTexNxy7pR6keLlak+xKQxqFwOGyLutD144i6cy
 ZNh1CD2xHLsM28TvJn34AhCiEtICNTLLfScdxN3f9KkntckSA+vLM0CeTFXVISCD1oEw
 DJleaZgrXjdTvEGdgfu7IdMPSjz8XogSbx6bmhmgz2Gg/lZcU/D8exL6BAePsMFJuvFf
 JBGg==
X-Gm-Message-State: AJIora/Mjw2Hcz1MzlQVejTJ4eJjHfcz7vJ/mw4qbZkH7aMBwS/fKW0j
 ujKnSYbXUEVzPvwz92iyra9Z7PM4VQ==
X-Google-Smtp-Source: AGRyM1t7QhI/co6WT+YVr0GACSS5wqpKqx2bIyp4sLjEcTPc+AkfkcpJUsWupz4KPq9xMx3pGwFSzA==
X-Received: by 2002:a05:6e02:1686:b0:2da:9ac2:ea85 with SMTP id
 f6-20020a056e02168600b002da9ac2ea85mr9840480ila.108.1656706092762; 
 Fri, 01 Jul 2022 13:08:12 -0700 (PDT)
Received: from robh.at.kernel.org ([64.188.179.248])
 by smtp.gmail.com with ESMTPSA id
 v6-20020a92d246000000b002d921e1abf2sm9314367ilg.85.2022.07.01.13.08.10
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 01 Jul 2022 13:08:12 -0700 (PDT)
Received: (nullmailer pid 1434390 invoked by uid 1000);
 Fri, 01 Jul 2022 20:08:09 -0000
Date: Fri, 1 Jul 2022 14:08:09 -0600
From: Rob Herring <robh@kernel.org>
To: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
Subject: Re: [PATCH 1/7] dt-bindings: msm: dsi: Fix phy-name binding
Message-ID: <20220701200809.GA1433418-robh@kernel.org>
References: <20220630120845.3356144-1-bryan.odonoghue@linaro.org>
 <20220630120845.3356144-2-bryan.odonoghue@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220630120845.3356144-2-bryan.odonoghue@linaro.org>
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
Cc: freedreno@lists.freedesktop.org, krzysztof.kozlowski+dt@linaro.org,
 devicetree@vger.kernel.org, airlied@linux.ie, linux-arm-msm@vger.kernel.org,
 quic_abhinavk@quicinc.com, dri-devel@lists.freedesktop.org,
 swboyd@chromium.org, quic_mkrishn@quicinc.com, dmitry.baryshkov@linaro.org,
 bjorn.andersson@linaro.org, sean@poorly.run
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Thu, Jun 30, 2022 at 01:08:39PM +0100, Bryan O'Donoghue wrote:
> The driver doesn't care about the name of the phy in DTS. msm8916 has since
> 2016 named the phy "dsi-phy" with later SoCs taking the name "dsi".

Also, for the subject, it's 'phy-names' not 'phy-name'.

> There's no reason to have a constraint on the name here, simply to have a
> name. Remove the redundant const in favour of maxItems: 1.
> 
> Fixes: 4dbe55c97741 ("dt-bindings: msm: dsi: add yaml schemas for DSI bindings")
> Signed-off-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
> ---
>  .../devicetree/bindings/display/msm/dsi-controller-main.yaml    | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/Documentation/devicetree/bindings/display/msm/dsi-controller-main.yaml b/Documentation/devicetree/bindings/display/msm/dsi-controller-main.yaml
> index 880bfe930830c..717a5d255ffe4 100644
> --- a/Documentation/devicetree/bindings/display/msm/dsi-controller-main.yaml
> +++ b/Documentation/devicetree/bindings/display/msm/dsi-controller-main.yaml
> @@ -49,7 +49,7 @@ properties:
>      maxItems: 1
>  
>    phy-names:
> -    const: dsi
> +    maxItems: 1
>  
>    "#address-cells": true
>  
> -- 
> 2.36.1
> 
> 
