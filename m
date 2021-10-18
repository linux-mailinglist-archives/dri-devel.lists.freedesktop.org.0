Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 64E9743115D
	for <lists+dri-devel@lfdr.de>; Mon, 18 Oct 2021 09:26:13 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3CBBD6E090;
	Mon, 18 Oct 2021 07:26:08 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com
 [213.167.242.64])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9EA746E090
 for <dri-devel@lists.freedesktop.org>; Mon, 18 Oct 2021 07:26:06 +0000 (UTC)
Received: from pendragon.ideasonboard.com (62-78-145-57.bb.dnainternet.fi
 [62.78.145.57])
 by perceval.ideasonboard.com (Postfix) with ESMTPSA id 344628C6;
 Mon, 18 Oct 2021 09:26:04 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
 s=mail; t=1634541964;
 bh=s+35dVXIiZQlJtK7I4ILbFbiGh0fIoV9u8yEqsBt5AA=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=s8md4ByrxswRfQYqJ26/hprPufyhoscvdVLD00eVS59Kc08Og41DWz+SMneN6Yj8W
 6MyJcogwBBDFwHImx9rZM+Ez8UYNmVTzCkpbFGe+lV6v9HZTJXDdVOI2K5HeXU+Tnj
 KgfEZY6qD9t5Hqi3luWED9R5xyfzcfV/QUDZmV3s=
Date: Mon, 18 Oct 2021 10:25:47 +0300
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: Michal Simek <michal.simek@xilinx.com>
Cc: linux-kernel@vger.kernel.org, monstr@monstr.eu, git@xilinx.com,
 Daniel Vetter <daniel@ffwll.ch>, David Airlie <airlied@linux.ie>,
 Hyun Kwon <hyun.kwon@xilinx.com>, Rob Herring <robh+dt@kernel.org>,
 Sam Ravnborg <sam@ravnborg.org>, devicetree@vger.kernel.org,
 dri-devel@lists.freedesktop.org, linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH] dt-bindings: display: xilinx: Fix example with psgtr
Message-ID: <YW0he/FObi1WYqBf@pendragon.ideasonboard.com>
References: <a291be294dea6e580ad9acd436742a48b7cd00a2.1634539210.git.michal.simek@xilinx.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <a291be294dea6e580ad9acd436742a48b7cd00a2.1634539210.git.michal.simek@xilinx.com>
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Michal,

Thank you for the patch.

On Mon, Oct 18, 2021 at 08:40:12AM +0200, Michal Simek wrote:
> Commit cea0f76a483d ("dt-bindings: phy: Add DT bindings for Xilinx ZynqMP
> PSGTR PHY") clearly defines #phy-cells as 4. In past 5 cells were used by
> it never went to upstream. That's why fix example by using only 4 cells
> instead of 5.
> 
> Fixes: e7c7970a678d ("dt-bindings: display: xlnx: Add ZynqMP DP subsystem bindings")
> Signed-off-by: Michal Simek <michal.simek@xilinx.com>

Reviewed-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>

> ---
> 
>  .../devicetree/bindings/display/xlnx/xlnx,zynqmp-dpsub.yaml   | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/Documentation/devicetree/bindings/display/xlnx/xlnx,zynqmp-dpsub.yaml b/Documentation/devicetree/bindings/display/xlnx/xlnx,zynqmp-dpsub.yaml
> index d88bd93f4b80..10ec78ca1c65 100644
> --- a/Documentation/devicetree/bindings/display/xlnx/xlnx,zynqmp-dpsub.yaml
> +++ b/Documentation/devicetree/bindings/display/xlnx/xlnx,zynqmp-dpsub.yaml
> @@ -160,8 +160,8 @@ examples:
>                 <&xlnx_dpdma 2>,
>                 <&xlnx_dpdma 3>;
>  
> -        phys = <&psgtr 1 PHY_TYPE_DP 0 3 27000000>,
> -               <&psgtr 0 PHY_TYPE_DP 1 3 27000000>;
> +        phys = <&psgtr 1 PHY_TYPE_DP 0 3>,
> +               <&psgtr 0 PHY_TYPE_DP 1 3>;
>  
>          phy-names = "dp-phy0", "dp-phy1";
>      };

-- 
Regards,

Laurent Pinchart
