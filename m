Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 72DE73B38BA
	for <lists+dri-devel@lfdr.de>; Thu, 24 Jun 2021 23:31:28 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A41506E03B;
	Thu, 24 Jun 2021 21:31:26 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-il1-f178.google.com (mail-il1-f178.google.com
 [209.85.166.178])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BF2296E03B;
 Thu, 24 Jun 2021 21:31:25 +0000 (UTC)
Received: by mail-il1-f178.google.com with SMTP id q9so7802754ilj.3;
 Thu, 24 Jun 2021 14:31:25 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=O8EmC5jmhd3H2tbmN3mNHrPfEcvwMJRpkzyEy8i3V+E=;
 b=mvJVXiDwi9tu4jRtXef+Du/x136EOYan+QsbcSr8ytzgcaJu4JHi7uyfEwI7xZErPD
 G0vM2vK0odofRYsUqpibShRv+AWE8BQCb9TvTyUbFjoMgX6fO+AkVJNjwGF+eh0WbOjA
 cmBt4qQ33AH+i37ZUrfFyYOHhbLUSqDUhmC/Tmg0cG4yWB7gT8oo1+jpvuaJf3fizvfY
 ZAh7UTkcXA69aWPzHoXTdTzhZZ8Brtpac8lx1zS7OveckzlE+PqAE/cugTwNFFsF+U/f
 VaMYp1XVZsVwjQ13dHOZ9FVLIFbqH2oFsPz3faUBMLXY45zBW4NjCYj0+M402oyd8Z+w
 y01Q==
X-Gm-Message-State: AOAM532LjDFx4OUGNu/2Pw3Dj+l+qNPKelz+nJTzOMg3m+dWpAVQ42+B
 FknVNvzsptrT6pDNYr4Mqg==
X-Google-Smtp-Source: ABdhPJyfC0XhMTfy1YhoujL5JpehdqKXMrHWs83jfIsPpv/8SunAVt0KZjArx8NQ2Mj1T8BTQVTMZw==
X-Received: by 2002:a92:2e08:: with SMTP id v8mr2143640ile.50.1624570285223;
 Thu, 24 Jun 2021 14:31:25 -0700 (PDT)
Received: from robh.at.kernel.org ([64.188.179.248])
 by smtp.gmail.com with ESMTPSA id d5sm2495355ilf.55.2021.06.24.14.31.21
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 24 Jun 2021 14:31:24 -0700 (PDT)
Received: (nullmailer pid 2020523 invoked by uid 1000);
 Thu, 24 Jun 2021 21:31:19 -0000
Date: Thu, 24 Jun 2021 15:31:19 -0600
From: Rob Herring <robh@kernel.org>
To: Jonathan Marek <jonathan@marek.ca>
Subject: Re: [PATCH v4 2/3] dt-bindings: msm: dsi: document phy-type property
 for 7nm dsi phy
Message-ID: <20210624213119.GA2017600@robh.at.kernel.org>
References: <20210617144349.28448-1-jonathan@marek.ca>
 <20210617144349.28448-3-jonathan@marek.ca>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210617144349.28448-3-jonathan@marek.ca>
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

On Thu, Jun 17, 2021 at 10:43:34AM -0400, Jonathan Marek wrote:
> Document a new phy-type property which will be used to determine whether
> the phy should operate in D-PHY or C-PHY mode.
> 
> Signed-off-by: Jonathan Marek <jonathan@marek.ca>
> Reviewed-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
> ---
>  .../devicetree/bindings/display/msm/dsi-phy-7nm.yaml         | 5 +++++
>  include/dt-bindings/phy/phy.h                                | 2 ++
>  2 files changed, 7 insertions(+)
> 
> diff --git a/Documentation/devicetree/bindings/display/msm/dsi-phy-7nm.yaml b/Documentation/devicetree/bindings/display/msm/dsi-phy-7nm.yaml
> index c0077ca7e9e7..70809d1cac54 100644
> --- a/Documentation/devicetree/bindings/display/msm/dsi-phy-7nm.yaml
> +++ b/Documentation/devicetree/bindings/display/msm/dsi-phy-7nm.yaml
> @@ -34,6 +34,11 @@ properties:
>      description: |
>        Connected to VDD_A_DSI_PLL_0P9 pin (or VDDA_DSI{0,1}_PLL_0P9 for sm8150)
>  
> +  phy-type:
> +    description: D-PHY (default) or C-PHY mode
> +    enum: [ 10, 11 ]
> +    default: 10
> +
>  required:
>    - compatible
>    - reg
> diff --git a/include/dt-bindings/phy/phy.h b/include/dt-bindings/phy/phy.h
> index 887a31b250a8..f48c9acf251e 100644
> --- a/include/dt-bindings/phy/phy.h
> +++ b/include/dt-bindings/phy/phy.h
> @@ -20,5 +20,7 @@
>  #define PHY_TYPE_XPCS		7
>  #define PHY_TYPE_SGMII		8
>  #define PHY_TYPE_QSGMII		9
> +#define PHY_TYPE_DPHY		10
> +#define PHY_TYPE_CPHY		11

I thought I recalled a suggestion to add 'MIPI_' in this. Or was there 
another similar patch? If not, I'm fine either way:

Acked-by: Rob Herring <robh@kernel.org>
