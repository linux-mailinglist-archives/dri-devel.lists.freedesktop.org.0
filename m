Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B282E2027B6
	for <lists+dri-devel@lfdr.de>; Sun, 21 Jun 2020 02:48:10 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 33D1C89E2B;
	Sun, 21 Jun 2020 00:48:06 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com
 [213.167.242.64])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 729A989E2B
 for <dri-devel@lists.freedesktop.org>; Sun, 21 Jun 2020 00:48:04 +0000 (UTC)
Received: from pendragon.bb.dnainternet.fi (81-175-216-236.bb.dnainternet.fi
 [81.175.216.236])
 by perceval.ideasonboard.com (Postfix) with ESMTPSA id 1D535532;
 Sun, 21 Jun 2020 02:48:02 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
 s=mail; t=1592700482;
 bh=AheFJE5DVX4uY8v/JD7skTLoTphtChS1ByYzmSujvZk=;
 h=From:To:Cc:Subject:Date:From;
 b=pxzuNrHE9rBosZr1WxuOmTBOOWmgxkkXTVBJIcHD6d39k0lT/DxYXLNV0m/q73a6Q
 jqiWUuZpVnMksfdqaTgsCwDgKjGbnw02Ik63/Q1kOMZTy7adFlqRUa+Ra+xOvPZh+M
 VNKt48yivZUW1b5qCVoVJk12kwFBSdIyhrAW/XJc=
From: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>
To: dri-devel@lists.freedesktop.org,
	linux-media@vger.kernel.org
Subject: [PATCH v2 0/8] dt-bindings: media: Conversion of Renesas bindings to
 YAML
Date: Sun, 21 Jun 2020 03:47:26 +0300
Message-Id: <20200621004734.28602-1-laurent.pinchart+renesas@ideasonboard.com>
X-Mailer: git-send-email 2.27.0
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
Cc: linux-renesas-soc@vger.kernel.org, devicetree@vger.kernel.org,
 Rob Herring <robh+dt@kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

This patch series converts the DT bindings for the Renesas R-Car FCP,
FDP1 and VSP1 to YAML. It also updates the bindings based on the
properties that have been added to the DT sources over time but never
documented.

Compared to v1, review comments have been incorporated to fix small
typos and simplify a few comments in the bindings, and MAINTAINERS has
been updated.

Rob, this series has been reviewed by Geert, could you merge it ?
Alternatively you can provide acks and I can send a pull request to get
it merged through the linux-media tree.

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
 MAINTAINERS                                   |  6 +-
 7 files changed, 235 insertions(+), 104 deletions(-)
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
