Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 293B478B507
	for <lists+dri-devel@lfdr.de>; Mon, 28 Aug 2023 18:01:20 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0615B10E0AD;
	Mon, 28 Aug 2023 16:01:18 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com
 [213.167.242.64])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 77D8410E0AD
 for <dri-devel@lists.freedesktop.org>; Mon, 28 Aug 2023 16:01:16 +0000 (UTC)
Received: from pendragon.ideasonboard.com
 (117.145-247-81.adsl-dyn.isp.belgacom.be [81.247.145.117])
 by perceval.ideasonboard.com (Postfix) with ESMTPSA id 890C25AA;
 Mon, 28 Aug 2023 17:59:53 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
 s=mail; t=1693238393;
 bh=2wlfMAxVDtiPXltxA2DVHT4sa0xfWfVhDD4I6ZRhmt8=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=QOzKty6rOPSnVEi1Q59+FtxKLjafK5CXNkbOFEebyupOF7YlQu/nvX4m//b1fi7zY
 FPNUG0IHcC4Stt/6oRKGJa/8gj4QMAgRiSId9B1pNoQSPvl/+eRMKSWG8yktcLHFIl
 gZ0VJUeOeuPio4x+N3Ul7fWgITi76lkLBhU3EPAI=
Date: Mon, 28 Aug 2023 19:01:24 +0300
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Subject: Re: [PATCH 1/2] dt-bindings: display/lvds-codec: add ti,sn65lvds94
Message-ID: <20230828160124.GS14596@pendragon.ideasonboard.com>
References: <20230826215429.1905599-1-dmitry.baryshkov@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20230826215429.1905599-1-dmitry.baryshkov@linaro.org>
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
Cc: dri-devel@lists.freedesktop.org, Conor Dooley <conor+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Jonas Karlman <jonas@kwiboo.se>, Sascha Hauer <s.hauer@pengutronix.de>,
 Neil Armstrong <narmstrong@baylibre.com>,
 Jernej Skrabec <jernej.skrabec@gmail.com>, Rob Herring <robh+dt@kernel.org>,
 Robert Foss <robert.foss@linaro.org>, Andrzej Hajda <andrzej.hajda@intel.com>,
 Shawn Guo <shawnguo@kernel.org>,
 Pengutronix Kernel Team <kernel@pengutronix.de>,
 linux-arm-kernel@lists.infradead.org, NXP Linux Team <linux-imx@nxp.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Dmitry,

Thank you for the patch.

On Sun, Aug 27, 2023 at 12:54:28AM +0300, Dmitry Baryshkov wrote:
> Add compatible strings for TI sn65lvds94, LVDS serdes receiver.
> 
> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>

Reviewed-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>

> ---
>  Documentation/devicetree/bindings/display/bridge/lvds-codec.yaml | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/Documentation/devicetree/bindings/display/bridge/lvds-codec.yaml b/Documentation/devicetree/bindings/display/bridge/lvds-codec.yaml
> index 84aafcbf0919..6ceeed76e88e 100644
> --- a/Documentation/devicetree/bindings/display/bridge/lvds-codec.yaml
> +++ b/Documentation/devicetree/bindings/display/bridge/lvds-codec.yaml
> @@ -41,6 +41,7 @@ properties:
>            - enum:
>                - ti,ds90cf364a # For the DS90CF364A FPD-Link LVDS Receiver
>                - ti,ds90cf384a # For the DS90CF384A FPD-Link LVDS Receiver
> +              - ti,sn65lvds94 # For the SN65DS94 LVDS serdes
>            - const: lvds-decoder # Generic LVDS decoders compatible fallback
>        - enum:
>            - thine,thc63lvdm83d # For the THC63LVDM83D LVDS serializer

-- 
Regards,

Laurent Pinchart
