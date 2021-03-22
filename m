Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id C2E75343760
	for <lists+dri-devel@lfdr.de>; Mon, 22 Mar 2021 04:25:56 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 286816E075;
	Mon, 22 Mar 2021 03:25:52 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com
 [IPv6:2001:4b98:dc2:55:216:3eff:fef7:d647])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 63B956E075
 for <dri-devel@lists.freedesktop.org>; Mon, 22 Mar 2021 03:25:50 +0000 (UTC)
Received: from pendragon.ideasonboard.com (62-78-145-57.bb.dnainternet.fi
 [62.78.145.57])
 by perceval.ideasonboard.com (Postfix) with ESMTPSA id C262C8CE;
 Mon, 22 Mar 2021 04:25:48 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
 s=mail; t=1616383549;
 bh=qBK6IeMXanWV4X9hYvcRVXrUvXBpLtFU28oZkZ/RxiQ=;
 h=Date:From:To:Cc:Subject:From;
 b=BXWYz82MqJz417LOdNacWR1u3TT9xJOd0Y0OXhThK/biD28lPRYeb3Dtl6Ls9w3op
 qg4pDRorhdc+XnlIq35oC7wsN2dDnSGfLtiiP1elcs6uK/js+VLUyD8Vd5isbdDeEP
 7O69NKC+qxP+durIs3Xo+KfmaAIDekwM96tOhiFo=
Date: Mon, 22 Mar 2021 05:25:08 +0200
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: dri-devel@lists.freedesktop.org
Subject: [GIT PULL FOR v5.13] Conversion of misc display DT bindings to YAML
Message-ID: <YFgOFL/yMUkyxqK3@pendragon.ideasonboard.com>
MIME-Version: 1.0
Content-Disposition: inline
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Dave, Daniel,

The following changes since commit 06debd6e1b28029e6e77c41e59a162868f377897:

  Merge tag 'drm-intel-next-2021-03-16' of git://anongit.freedesktop.org/drm/drm-intel into drm-next (2021-03-18 08:06:34 +1000)

are available in the Git repository at:

  git://linuxtv.org/pinchartl/media.git tags/drm-next-20210322

for you to fetch changes up to c7941422cff96874fc76c9b127eaf0be5dc7d7af:

  dt-bindings: display: bridge: Remove deprecated dw_hdmi.txt (2021-03-22 05:09:04 +0200)

----------------------------------------------------------------
Conversion of misc display DT bindings to YAML

----------------------------------------------------------------
Laurent Pinchart (7):
      dt-bindings: display: renesas,du: Convert binding to YAML
      dt-bindings: display: bridge: Add YAML schema for Synopsys DW-HDMI
      dt-bindings: display: bridge: renesas,dw-hdmi: Convert binding to YAML
      dt-bindings: display: imx: hdmi: Convert binding to YAML
      dt-bindings: display: rockchip: dw-hdmi: Convert binding to YAML
      dt-bindings: display: sun8i-a83t-dw-hdmi: Reference dw-hdmi YAML schema
      dt-bindings: display: bridge: Remove deprecated dw_hdmi.txt

 .../display/allwinner,sun8i-a83t-dw-hdmi.yaml  |   4 +-
 .../bindings/display/bridge/dw_hdmi.txt        |  33 -
 .../display/bridge/renesas,dw-hdmi.txt         |  88 --
 .../display/bridge/renesas,dw-hdmi.yaml        | 125 +++
 .../display/bridge/synopsys,dw-hdmi.yaml       |  55 ++
 .../bindings/display/imx/fsl,imx6-hdmi.yaml    | 126 +++
 .../devicetree/bindings/display/imx/hdmi.txt   |  65 --
 .../devicetree/bindings/display/renesas,du.txt | 145 ---
 .../bindings/display/renesas,du.yaml           | 831 ++++++++++++++++++
 .../display/rockchip/dw_hdmi-rockchip.txt      |  74 --
 .../display/rockchip/rockchip,dw-hdmi.yaml     | 156 ++++
 MAINTAINERS                                    |   4 +-
 12 files changed, 1297 insertions(+), 409 deletions(-)
 delete mode 100644 Documentation/devicetree/bindings/display/bridge/dw_hdmi.txt
 delete mode 100644 Documentation/devicetree/bindings/display/bridge/renesas,dw-hdmi.txt
 create mode 100644 Documentation/devicetree/bindings/display/bridge/renesas,dw-hdmi.yaml
 create mode 100644 Documentation/devicetree/bindings/display/bridge/synopsys,dw-hdmi.yaml
 create mode 100644 Documentation/devicetree/bindings/display/imx/fsl,imx6-hdmi.yaml
 delete mode 100644 Documentation/devicetree/bindings/display/imx/hdmi.txt
 delete mode 100644 Documentation/devicetree/bindings/display/renesas,du.txt
 create mode 100644 Documentation/devicetree/bindings/display/renesas,du.yaml
 delete mode 100644 Documentation/devicetree/bindings/display/rockchip/dw_hdmi-rockchip.txt
 create mode 100644 Documentation/devicetree/bindings/display/rockchip/rockchip,dw-hdmi.yaml

-- 
Regards,

Laurent Pinchart
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
