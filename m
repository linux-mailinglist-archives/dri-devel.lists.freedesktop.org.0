Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E1A453A1F87
	for <lists+dri-devel@lfdr.de>; Wed,  9 Jun 2021 23:57:32 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F27976EB1C;
	Wed,  9 Jun 2021 21:57:28 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ot1-f42.google.com (mail-ot1-f42.google.com
 [209.85.210.42])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 541DF6EB1C;
 Wed,  9 Jun 2021 21:57:27 +0000 (UTC)
Received: by mail-ot1-f42.google.com with SMTP id
 j11-20020a9d738b0000b02903ea3c02ded8so11877912otk.5; 
 Wed, 09 Jun 2021 14:57:27 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=c7WxSL952AsDBW+4Q+slVrXXE4mBT22/Jigijej7zVs=;
 b=egu7o+7oCColcyiMdHHhAAGwcdc5plx5YMeH39r7A1s3A/L6GdTGsVsvBjinEYMTQ2
 ctFG0QaIpA2VMWhl6c5znu6aoOEoGtFgIxyYXQ/7HS7K6RxO/74bFseQAzskTvI6WDJI
 Hjsq1wdFjKvKzAXI4XHHaHoX6jagIx2vURSfa2CbjrMQ/C+K5Unoz+do271aA4WzMC5+
 un5MyTg9TuOcT1oY9pdVwn295KpQbRZLkh9EKge3tnTtPDSycZCWZQe0wO0sKXmQ0BpJ
 y7b7lYnLgReFoCtD81TrkZ5MZAjbMgz7inFKKl+BVQFw3uhFXhPO5gbzirVzW/zZQ3/6
 3qyA==
X-Gm-Message-State: AOAM5323dUhodRDWkz+XdfwLNoXf/9RLFTYjJeJeYeMNwqtFO9uy0O0i
 Are00Db/YGqWj/LmALGJyA==
X-Google-Smtp-Source: ABdhPJy6bcqCt9Nr7mez/COGdYXUV+b7ETIQSyxBwcojEj07xvqX689RWOJae7Mqf1SPDoohBZOb8Q==
X-Received: by 2002:a9d:355:: with SMTP id 79mr1336380otv.101.1623275846809;
 Wed, 09 Jun 2021 14:57:26 -0700 (PDT)
Received: from robh.at.kernel.org (24-155-109-49.dyn.grandenetworks.net.
 [24.155.109.49])
 by smtp.gmail.com with ESMTPSA id k8sm198439ool.5.2021.06.09.14.57.24
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 09 Jun 2021 14:57:25 -0700 (PDT)
Received: (nullmailer pid 168056 invoked by uid 1000);
 Wed, 09 Jun 2021 21:57:24 -0000
Date: Wed, 9 Jun 2021 16:57:24 -0500
From: Rob Herring <robh@kernel.org>
To: Jonathan Marek <jonathan@marek.ca>
Subject: Re: [PATCH v3 2/3] dt-bindings: msm: dsi: document phy-type property
 for 7nm dsi phy
Message-ID: <20210609215724.GA163102@robh.at.kernel.org>
References: <20210608195342.18269-1-jonathan@marek.ca>
 <20210608195342.18269-3-jonathan@marek.ca>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210608195342.18269-3-jonathan@marek.ca>
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
Cc: "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS"
 <devicetree@vger.kernel.org>,
 Anurag Kumar Vulisha <anurag.kumar.vulisha@xilinx.com>,
 David Airlie <airlied@linux.ie>, freedreno@lists.freedesktop.org,
 "open list:DRM DRIVER FOR MSM ADRENO GPU" <linux-arm-msm@vger.kernel.org>,
 Vinod Koul <vkoul@kernel.org>,
 "open list:DRM DRIVER FOR MSM ADRENO GPU" <dri-devel@lists.freedesktop.org>,
 open list <linux-kernel@vger.kernel.org>,
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
 Swapnil Jakhade <sjakhade@cadence.com>, Sean Paul <sean@poorly.run>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Tue, Jun 08, 2021 at 03:53:28PM -0400, Jonathan Marek wrote:
> Document a new phy-type property which will be used to determine whether
> the phy should operate in D-PHY or C-PHY mode.
> 
> Signed-off-by: Jonathan Marek <jonathan@marek.ca>
> ---
>  .../devicetree/bindings/display/msm/dsi-phy-7nm.yaml          | 4 ++++
>  include/dt-bindings/phy/phy.h                                 | 2 ++
>  2 files changed, 6 insertions(+)
> 
> diff --git a/Documentation/devicetree/bindings/display/msm/dsi-phy-7nm.yaml b/Documentation/devicetree/bindings/display/msm/dsi-phy-7nm.yaml
> index bf16b1c65e10..d447b517ea19 100644
> --- a/Documentation/devicetree/bindings/display/msm/dsi-phy-7nm.yaml
> +++ b/Documentation/devicetree/bindings/display/msm/dsi-phy-7nm.yaml
> @@ -34,6 +34,10 @@ properties:
>      description: |
>        Connected to VDD_A_DSI_PLL_0P9 pin (or VDDA_DSI{0,1}_PLL_0P9 for sm8150)
>  
> +  phy-type:
> +    description: |
> +      D-PHY (default) or C-PHY mode: PHY_TYPE_DSI_DPHY or PHY_TYPE_DSI_CPHY

Don't write prose for what can be schema. Unfortunately, can't do 
defines here, but you need:

enum: [ 10, 11 ]
default: 10

> +
>  required:
>    - compatible
>    - reg
> diff --git a/include/dt-bindings/phy/phy.h b/include/dt-bindings/phy/phy.h
> index 887a31b250a8..b978dac16bb8 100644
> --- a/include/dt-bindings/phy/phy.h
> +++ b/include/dt-bindings/phy/phy.h
> @@ -20,5 +20,7 @@
>  #define PHY_TYPE_XPCS		7
>  #define PHY_TYPE_SGMII		8
>  #define PHY_TYPE_QSGMII		9
> +#define PHY_TYPE_DSI_DPHY	10
> +#define PHY_TYPE_DSI_CPHY	11
>  
>  #endif /* _DT_BINDINGS_PHY */
> -- 
> 2.26.1
