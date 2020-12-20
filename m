Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id DAC422DF6BF
	for <lists+dri-devel@lfdr.de>; Sun, 20 Dec 2020 21:05:25 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8149B6E185;
	Sun, 20 Dec 2020 20:05:22 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com
 [IPv6:2001:4b98:dc2:55:216:3eff:fef7:d647])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 996E56E185
 for <dri-devel@lists.freedesktop.org>; Sun, 20 Dec 2020 20:05:20 +0000 (UTC)
Received: from pendragon.ideasonboard.com (62-78-145-57.bb.dnainternet.fi
 [62.78.145.57])
 by perceval.ideasonboard.com (Postfix) with ESMTPSA id 01A8731A;
 Sun, 20 Dec 2020 21:05:18 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
 s=mail; t=1608494719;
 bh=WRT4qE0nvqCxGhxafhRoygvhc3ychpCBF1FuQ4wNglQ=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=JNVBPFdrFV2jOCZtuzydqfC2xxHDEgMgX+QgxdaADMxh/frh4xVJ4PG/HJ8DWQbUq
 Q7gBp+rLytKpyOMnOoFjxbZH8t8u6+d8LW1+SrqV8rL0fz61zJDpQ82n2aOqYC0jI4
 n2bqHnonQ2xoY0MdFumX3U+JgnswwI6y1kLA2/44=
Date: Sun, 20 Dec 2020 22:05:11 +0200
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>
Subject: Re: [PATCH v2 0/6] dt-bindings: display: Convert DWC HDMI TX
 bindings to YAML
Message-ID: <X9+ud1Xd0ZAAB2Zd@pendragon.ideasonboard.com>
References: <20201220195005.26438-1-laurent.pinchart+renesas@ideasonboard.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20201220195005.26438-1-laurent.pinchart+renesas@ideasonboard.com>
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
Cc: Sandy Huang <hjc@rock-chips.com>, dri-devel@lists.freedesktop.org,
 linux-renesas-soc@vger.kernel.org, Chen-Yu Tsai <wens@csie.org>,
 Rob Herring <robh+dt@kernel.org>, Maxime Ripard <maxime@cerno.tech>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Sun, Dec 20, 2020 at 09:49:59PM +0200, Laurent Pinchart wrote:
> Hello,
> 
> This patch series attempts a conversion of the DWC HDMI TX DT bindings
> to YAML.
> 
> The DWC HDMI TX is an HDMI transmitter IP core from Synopsys, integrated
> in various SoCs with different glue layers. As such, some properties are
> defined in a common document, but sometimes need to be overridden by
> platform-specific bindings.
> 
> Patch 1/6 adds a base schema for the common properties, based on the
> existing dw_hdmi.txt document. Patches 2/6 to 4/6 then convert the
> platform-specific bindings for Renesas, NXP and Rockchip SoCs. Patch 5/6
> replaces the reference to dw_hdmi.txt in the Allwinner bindings with a
> reference to the YAML base schema, and patch 6/6 drops dw_hdmi.txt.
> 
> Compared to v1 (sent as an RFC), the base schema now works properly on
> all three platforms, and the schemas have been converted to use the OF
> graph schema. A more detailed changelog is available in individual
> patches.
> 
> I have volunteered Philipp Zabel and Mark Yao as maintainers for the
> i.MX6 and Rockchip bindings respectively. Please let me know if you
> would prefer a different maintainer, or ack the respective patch if this
> is fine with you.

Given the fact that Mark's e-mail address bounces, I'll need another
volunteer :-S

> Laurent Pinchart (6):
>   dt-bindings: display: bridge: Add YAML schema for Synopsys DW-HDMI
>   dt-bindings: display: bridge: renesas,dw-hdmi: Convert binding to YAML
>   dt-bindings: display: imx: hdmi: Convert binding to YAML
>   dt-bindings: display: rockchip: dw-hdmi: Convert binding to YAML
>   dt-bindings: display: sun8i-a83t-dw-hdmi: Reference dw-hdmi YAML
>     schema
>   dt-bindings: display: bridge: Remove deprecated dw_hdmi.txt
> 
>  .../display/allwinner,sun8i-a83t-dw-hdmi.yaml |   4 +-
>  .../bindings/display/bridge/dw_hdmi.txt       |  33 ----
>  .../display/bridge/renesas,dw-hdmi.txt        |  88 ----------
>  .../display/bridge/renesas,dw-hdmi.yaml       | 128 ++++++++++++++
>  .../display/bridge/synopsys,dw-hdmi.yaml      |  58 +++++++
>  .../bindings/display/imx/fsl,imx6-hdmi.yaml   | 130 ++++++++++++++
>  .../devicetree/bindings/display/imx/hdmi.txt  |  65 -------
>  .../display/rockchip/dw_hdmi-rockchip.txt     |  74 --------
>  .../display/rockchip/rockchip,dw-hdmi.yaml    | 158 ++++++++++++++++++
>  9 files changed, 476 insertions(+), 262 deletions(-)
>  delete mode 100644 Documentation/devicetree/bindings/display/bridge/dw_hdmi.txt
>  delete mode 100644 Documentation/devicetree/bindings/display/bridge/renesas,dw-hdmi.txt
>  create mode 100644 Documentation/devicetree/bindings/display/bridge/renesas,dw-hdmi.yaml
>  create mode 100644 Documentation/devicetree/bindings/display/bridge/synopsys,dw-hdmi.yaml
>  create mode 100644 Documentation/devicetree/bindings/display/imx/fsl,imx6-hdmi.yaml
>  delete mode 100644 Documentation/devicetree/bindings/display/imx/hdmi.txt
>  delete mode 100644 Documentation/devicetree/bindings/display/rockchip/dw_hdmi-rockchip.txt
>  create mode 100644 Documentation/devicetree/bindings/display/rockchip/rockchip,dw-hdmi.yaml

-- 
Regards,

Laurent Pinchart
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
