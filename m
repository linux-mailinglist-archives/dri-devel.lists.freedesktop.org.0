Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 9970D14CF36
	for <lists+dri-devel@lfdr.de>; Wed, 29 Jan 2020 18:07:12 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A5DEE6F5F4;
	Wed, 29 Jan 2020 17:07:10 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from relmlie6.idc.renesas.com (relmlor2.renesas.com
 [210.160.252.172])
 by gabe.freedesktop.org (Postfix) with ESMTP id 381416F5F3
 for <dri-devel@lists.freedesktop.org>; Wed, 29 Jan 2020 17:07:09 +0000 (UTC)
X-IronPort-AV: E=Sophos;i="5.70,378,1574089200"; d="scan'208";a="37711730"
Received: from unknown (HELO relmlir5.idc.renesas.com) ([10.200.68.151])
 by relmlie6.idc.renesas.com with ESMTP; 30 Jan 2020 02:02:05 +0900
Received: from marian-VirtualBox.ree.adwin.renesas.com (unknown
 [10.226.36.164])
 by relmlir5.idc.renesas.com (Postfix) with ESMTP id 77DDC4007F42;
 Thu, 30 Jan 2020 02:02:04 +0900 (JST)
From: Marian-Cristian Rotariu <marian-cristian.rotariu.rb@bp.renesas.com>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH 1/2] dt-bindings: display: Add bindings for EDT panel
Date: Wed, 29 Jan 2020 17:01:57 +0000
Message-Id: <1580317318-32071-2-git-send-email-marian-cristian.rotariu.rb@bp.renesas.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1580317318-32071-1-git-send-email-marian-cristian.rotariu.rb@bp.renesas.com>
References: <1580317318-32071-1-git-send-email-marian-cristian.rotariu.rb@bp.renesas.com>
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
Cc: Chris Paterson <chris.paterson2@renesas.com>,
 prabhakar.mahadev-lad.rj@bp.renesas.com,
 Marian-Cristian Rotariu <marian-cristian.rotariu.rb@bp.renesas.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Document the Emerging Display Technology Corp. (EDT) ETM043080DH6-GP
display, which is a 480x272 4.3" TFT display with capacitive touchscreen.

Signed-off-by: Marian-Cristian Rotariu <marian-cristian.rotariu.rb@bp.renesas.com>
Reviewed-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
---
 Documentation/devicetree/bindings/display/panel/edt,et-series.txt | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/Documentation/devicetree/bindings/display/panel/edt,et-series.txt b/Documentation/devicetree/bindings/display/panel/edt,et-series.txt
index b7ac1c7..cedbbe6 100644
--- a/Documentation/devicetree/bindings/display/panel/edt,et-series.txt
+++ b/Documentation/devicetree/bindings/display/panel/edt,et-series.txt
@@ -22,6 +22,9 @@ simple-panel.txt
 +=================+=====================+=====================================+
 | ETM0430G0DH6    | edt,etm0430g0dh6    | 480x272 TFT Display                 |
 +-----------------+---------------------+-------------------------------------+
+| ETM043080DH6-GP | edt,etm043080dh6gp  | 480x272 TFT Display with capacitive |
+|                 |                     | Touchscreen                         |
++-----------------+---------------------+-------------------------------------+
 
 5,7" WVGA TFT Panels
 --------------------
-- 
2.7.4

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
