Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 9462C2F8857
	for <lists+dri-devel@lfdr.de>; Fri, 15 Jan 2021 23:23:33 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 550846E4AA;
	Fri, 15 Jan 2021 22:23:28 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com
 [IPv6:2001:4b98:dc2:55:216:3eff:fef7:d647])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1E8986E4A5
 for <dri-devel@lists.freedesktop.org>; Fri, 15 Jan 2021 22:23:26 +0000 (UTC)
Received: from pendragon.lan (62-78-145-57.bb.dnainternet.fi [62.78.145.57])
 by perceval.ideasonboard.com (Postfix) with ESMTPSA id 8D50258B;
 Fri, 15 Jan 2021 23:23:24 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
 s=mail; t=1610749405;
 bh=B2mz6MMvaGp8Xos5MQEnbg4TxqpDEXLEWFqhOdeS5Uk=;
 h=From:To:Cc:Subject:Date:From;
 b=iifkKyK33Kr0Gky6TVO+xmyrJ90knbZT8Davai2qsnXAO2BnNsMzdzQVndLfQJule
 QtpeOvZqYHRdeUDuHIkKqTJnRuiM2W/UPI2Z7EIJO4OzNMrVRUz/D1G0fIVBjseVWJ
 MfKzQuPOI3SIXFMe3k2rNLrMKM1/02vGXYaXIH74=
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH v3 0/3] dt-bindings: display: Convert mxsfb DT bindings to YAML
Date: Sat, 16 Jan 2021 00:23:01 +0200
Message-Id: <20210115222304.5427-1-laurent.pinchart@ideasonboard.com>
X-Mailer: git-send-email 2.28.0
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
Cc: Marek Vasut <marex@denx.de>, devicetree@vger.kernel.org,
 Martin Kepplinger <martin.kepplinger@puri.sm>,
 Rob Herring <robh+dt@kernel.org>,
 Pengutronix Kernel Team <kernel@pengutronix.de>,
 linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hello,

This patch series has previously been posted as part of "[PATCH v2 0/7]
drm: mxsfb: Allow overriding bus width". I've split the DT bindings
conversion to a separate series as I believe they're ready, and Martin
has a patch that he would like to submit to the bindings.

All the patches have been acked, and changes to v2 are minor. Rob, could
you take this through your tree ?

Laurent Pinchart (2):
  dt-bindings: display: mxsfb: Convert binding to YAML
  dt-bindings: display: mxsfb: Add and fix compatible strings

Marek Vasut (1):
  dt-bindings: display: mxsfb: Add compatible for i.MX8MM

 .../bindings/display/fsl,lcdif.yaml           | 110 ++++++++++++++++++
 .../devicetree/bindings/display/mxsfb.txt     |  87 --------------
 MAINTAINERS                                   |   2 +-
 3 files changed, 111 insertions(+), 88 deletions(-)
 create mode 100644 Documentation/devicetree/bindings/display/fsl,lcdif.yaml
 delete mode 100644 Documentation/devicetree/bindings/display/mxsfb.txt

-- 
Regards,

Laurent Pinchart

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
