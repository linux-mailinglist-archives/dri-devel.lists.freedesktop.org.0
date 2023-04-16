Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 1699B6E38A2
	for <lists+dri-devel@lfdr.de>; Sun, 16 Apr 2023 15:25:31 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0029310E0F3;
	Sun, 16 Apr 2023 13:25:25 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com
 [213.167.242.64])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9025C10E0F3
 for <dri-devel@lists.freedesktop.org>; Sun, 16 Apr 2023 13:25:23 +0000 (UTC)
Received: from pendragon.ideasonboard.com
 (133-32-181-51.west.xps.vectant.ne.jp [133.32.181.51])
 by perceval.ideasonboard.com (Postfix) with ESMTPSA id 4DAEF10A;
 Sun, 16 Apr 2023 15:25:14 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
 s=mail; t=1681651516;
 bh=K1YyYPxqlo8x0z8CFYuKhkS6h5XnbugyXRD+m3v6t+w=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=XYEa6rBvV07FbhTKRy/yVdc+naA/KunzZ6mX4AppiJWXdNntc79/o/GnhdOGqUclj
 fRx7IrQDMxoOL6R8n5tD17FPAqCmj4jBJ9vAw/NvFmDmyPnZFwVp8b5SQ0hquODq2G
 32u742q+tNl/je0x1epHRxYwt1Yrbnk0zxGT2NA8=
Date: Sun, 16 Apr 2023 16:25:31 +0300
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: Jernej Skrabec <jernej.skrabec@gmail.com>
Subject: Re: [PATCH 3/3] ARM: dts: sun8i: h3: beelink-x2: Disable DW-HDMI CEC
Message-ID: <20230416132531.GA28551@pendragon.ideasonboard.com>
References: <20230415104613.61224-1-jernej.skrabec@gmail.com>
 <20230415104613.61224-4-jernej.skrabec@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20230415104613.61224-4-jernej.skrabec@gmail.com>
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
Cc: neil.armstrong@linaro.org, rfoss@kernel.org, andrzej.hajda@intel.com,
 samuel@sholland.org, jonas@kwiboo.se, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, wens@csie.org, robh+dt@kernel.org,
 linux-arm-kernel@lists.infradead.org, krzysztof.kozlowski+dt@linaro.org,
 hverkuil-cisco@xs4all.nl, linux-sunxi@lists.linux.dev,
 devicetree@vger.kernel.org, linux-media@vger.kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Jernej,

Thank you for the patch.

On Sat, Apr 15, 2023 at 12:46:13PM +0200, Jernej Skrabec wrote:
> Beelink X2 uses software implementation of CEC even though DW-HDMI has
> working hardware implementation.

Why ? The reason should be explained in the commit message.

> Disable unused DW-HDMI CEC.
> 
> Signed-off-by: Jernej Skrabec <jernej.skrabec@gmail.com>
> ---
>  arch/arm/boot/dts/sun8i-h3-beelink-x2.dts | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/arch/arm/boot/dts/sun8i-h3-beelink-x2.dts b/arch/arm/boot/dts/sun8i-h3-beelink-x2.dts
> index a6d38ecee141..38f40d69e5c5 100644
> --- a/arch/arm/boot/dts/sun8i-h3-beelink-x2.dts
> +++ b/arch/arm/boot/dts/sun8i-h3-beelink-x2.dts
> @@ -150,6 +150,7 @@ &emac {
>  };
>  
>  &hdmi {
> +	snps,disable-cec;
>  	status = "okay";
>  };
>  

-- 
Regards,

Laurent Pinchart
