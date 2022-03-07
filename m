Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 9CE334D036E
	for <lists+dri-devel@lfdr.de>; Mon,  7 Mar 2022 16:51:24 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9C4C410E03C;
	Mon,  7 Mar 2022 15:51:22 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com
 [213.167.242.64])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C1E0310E03C
 for <dri-devel@lists.freedesktop.org>; Mon,  7 Mar 2022 15:51:20 +0000 (UTC)
Received: from pendragon.ideasonboard.com (62-78-145-57.bb.dnainternet.fi
 [62.78.145.57])
 by perceval.ideasonboard.com (Postfix) with ESMTPSA id B0E2B30B;
 Mon,  7 Mar 2022 16:51:18 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
 s=mail; t=1646668278;
 bh=SfxEEhRPvuDd44PxQZDXnX/DJ2LqiwGXoarMuJp/ZM4=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=V8ImryOJpGHpy5ygU0+dU6R2BhB3NGcuHbiW2AFKjATgPv9k2CQe2tGPptepqjkK5
 diWkulTMnS2WWAi4ycvJW5/QCFZNvk9B93dackkT/b7YjSFI2YgRAGlOgQmR9dwvkU
 fXI6DpLrdmaARIp54QP+2+HuL7TIsF240W0BxaZg=
Date: Mon, 7 Mar 2022 17:51:05 +0200
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: Robert Foss <robert.foss@linaro.org>
Subject: Re: [PATCH v1 0/2] Revert vendor property from anx7625 bindings
Message-ID: <YiYp6bKJPdIoKD+f@pendragon.ideasonboard.com>
References: <20220307154558.2505734-1-robert.foss@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20220307154558.2505734-1-robert.foss@linaro.org>
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
Cc: devicetree@vger.kernel.org, airlied@linux.ie,
 Chen-Yu Tsai <wenst@chromium.org>, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, robh+dt@kernel.org,
 linux-mediatek@lists.infradead.org, hsinyi@chromium.org,
 matthias.bgg@gmail.com, xji@analogixsemi.com,
 linux-arm-kernel@lists.infradead.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Rob,

Thank you for the patch.

On Mon, Mar 07, 2022 at 04:45:56PM +0100, Robert Foss wrote:
> An issue[1] related to how the V4L2_FWNODE_BUS_TYPE_PARALLEL flag is mis-used
> was found in recent addition to the anx7625 driver.
> 
> In order to not introduce this issue into the ABI, let's revert the changes
> to the anx7625 dt-binding related to this.
> 
> [1] https://lore.kernel.org/all/YiTruiCIkyxs3jTC@pendragon.ideasonboard.com/
> 
> Robert Foss (2):
>   Revert "dt-bindings:drm/bridge:anx7625:add vendor define"
>   Revert "arm64: dts: mt8183: jacuzzi: Fix bus properties in anx's DSI
>     endpoint"

If this is enough to avoid the wrong bus-type becoming an ABI, even if
the corresponding driver support isn't reverted, then, for the whole
series,

Reviewed-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>

>  .../display/bridge/analogix,anx7625.yaml      | 65 +------------------
>  .../dts/mediatek/mt8183-kukui-jacuzzi.dtsi    |  2 -
>  2 files changed, 2 insertions(+), 65 deletions(-)

-- 
Regards,

Laurent Pinchart
