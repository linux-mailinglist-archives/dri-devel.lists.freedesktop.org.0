Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 147DC3A0544
	for <lists+dri-devel@lfdr.de>; Tue,  8 Jun 2021 22:47:26 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7289D6E20F;
	Tue,  8 Jun 2021 20:47:22 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com
 [213.167.242.64])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B83DE6E1CF
 for <dri-devel@lists.freedesktop.org>; Tue,  8 Jun 2021 20:47:20 +0000 (UTC)
Received: from pendragon.ideasonboard.com (62-78-145-57.bb.dnainternet.fi
 [62.78.145.57])
 by perceval.ideasonboard.com (Postfix) with ESMTPSA id 7FD3C3E6;
 Tue,  8 Jun 2021 22:47:18 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
 s=mail; t=1623185238;
 bh=nL94lwxiZDx7hO51vSX7RllgqbEzWiXMfFLGeKO44RU=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=LqehrYH7+bNvxnCFiQRU5fOnAU8KAbzQFhAmjEpkGwrRsydbIiNAxFHhFDXenTXD3
 n6J0D/aEgZ2SJklelIKb8IWd1J7FBRkKGzPRnTIf89afSIo+VcOQTIa3IXSSJfbWQK
 J1f7W0/ODl1SjdZjDcwJnS1XftTAUlSoAnj1gfM0=
Date: Tue, 8 Jun 2021 23:47:02 +0300
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: Jonathan Marek <jonathan@marek.ca>
Subject: Re: [PATCH v3 2/3] dt-bindings: msm: dsi: document phy-type property
 for 7nm dsi phy
Message-ID: <YL/XRsiShrCJOadW@pendragon.ideasonboard.com>
References: <20210608195342.18269-1-jonathan@marek.ca>
 <20210608195342.18269-3-jonathan@marek.ca>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
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
 open list <linux-kernel@vger.kernel.org>, Rob Herring <robh+dt@kernel.org>,
 Swapnil Jakhade <sjakhade@cadence.com>, Sean Paul <sean@poorly.run>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Jonathan,

Thank you for the patch.

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

The MIPI D-PHY and C-PHY apply to both DSI and CSI. I'd name this
PHY_TYPE_DPHY and PHY_TYPE_CPHY, or possibly, PHY_TYPE_MIPI_DPHY and
PHY_TYPE_MIPI_CPHY, without a DSI prefix. With this addressed and the DT
bindings updated accordingly,

Reviewed-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>

(You may be asked to split this in two patches though, not sure)

>  #endif /* _DT_BINDINGS_PHY */

-- 
Regards,

Laurent Pinchart
