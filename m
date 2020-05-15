Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id B9A691D42E0
	for <lists+dri-devel@lfdr.de>; Fri, 15 May 2020 03:24:54 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A59C26E113;
	Fri, 15 May 2020 01:24:49 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com
 [IPv6:2001:4b98:dc2:55:216:3eff:fef7:d647])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8FC9A6E0E7
 for <dri-devel@lists.freedesktop.org>; Fri, 15 May 2020 01:24:46 +0000 (UTC)
Received: from pendragon.bb.dnainternet.fi (81-175-216-236.bb.dnainternet.fi
 [81.175.216.236])
 by perceval.ideasonboard.com (Postfix) with ESMTPSA id 61DC126A;
 Fri, 15 May 2020 03:24:44 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
 s=mail; t=1589505884;
 bh=RYd3KrEDade1C0PYv5ABAchKX50NNlyJLQ6Zo570Ook=;
 h=From:To:Cc:Subject:Date:From;
 b=mrsClYrQQH4DmZuQ27/XO4wu5Nk4E9oDUHpLHxAoP4qGDPSDRacCnSi9SCGdPFJId
 aHPCe3GfhZgaXh1SI6BEd7feypxPifM4LzotW100UkAlZft6QrYUXjjS8yXky2Zh9b
 3/WzPdpEcFXtWGE83q7VQkgCSFBfg37LX1vBMS3U=
From: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH 0/8] d-bindings: media: Conversion of Renesas bindings to YAML
Date: Fri, 15 May 2020 04:24:24 +0300
Message-Id: <20200515012432.31326-1-laurent.pinchart+renesas@ideasonboard.com>
X-Mailer: git-send-email 2.26.2
MIME-Version: 1.0
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
Cc: linux-renesas-soc@vger.kernel.org, Rob Herring <robh+dt@kernel.org>,
 linux-media@vger.kernel.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hello,

This patch series converts the DT bindings for the Renesas R-Car FCP,
FDP1 and VSP1 to YAML. It also updates the bindings based on the
properties that have been added to the DT sources over time but never
documented.

Laurent Pinchart (8):
  dt-bindings: media: renesas,fcp: Convert binding to YAML
  dt-bindings: media: renesas,fcp: Make power-domains mandatory
  dt-bindings: media: renesas,fcp: Add resets and iommus properties
  dt-bindings: media: renesas,fdp1: Convert binding to YAML
  dt-bindings: media: renesas,fdp1: Make power-domains mandatory
  dt-bindings: media: renesas,fdp1: Add resets property
  dt-bindings: media: renesas,vsp1: Convert binding to YAML
  dt-bindings: media: renesas,vsp1: Add power-domains and resets

 .../devicetree/bindings/media/renesas,fcp.txt | 34 -------
 .../bindings/media/renesas,fcp.yaml           | 66 +++++++++++++
 .../bindings/media/renesas,fdp1.txt           | 37 -------
 .../bindings/media/renesas,fdp1.yaml          | 69 +++++++++++++
 .../bindings/media/renesas,vsp1.txt           | 30 ------
 .../bindings/media/renesas,vsp1.yaml          | 97 +++++++++++++++++++
 6 files changed, 232 insertions(+), 101 deletions(-)
 delete mode 100644 Documentation/devicetree/bindings/media/renesas,fcp.txt
 create mode 100644 Documentation/devicetree/bindings/media/renesas,fcp.yaml
 delete mode 100644 Documentation/devicetree/bindings/media/renesas,fdp1.txt
 create mode 100644 Documentation/devicetree/bindings/media/renesas,fdp1.yaml
 delete mode 100644 Documentation/devicetree/bindings/media/renesas,vsp1.txt
 create mode 100644 Documentation/devicetree/bindings/media/renesas,vsp1.yaml

-- 
Regards,

Laurent Pinchart

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
