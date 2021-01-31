Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 92F5A309BAD
	for <lists+dri-devel@lfdr.de>; Sun, 31 Jan 2021 12:43:30 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 272EB6E296;
	Sun, 31 Jan 2021 11:43:28 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from aruko.org (aruko.org [45.79.249.221])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7F0B56E135
 for <dri-devel@lists.freedesktop.org>; Sun, 31 Jan 2021 10:07:46 +0000 (UTC)
Received: from localhost.localdomain (unknown [213.111.80.72])
 by aruko.org (Postfix) with ESMTPSA id 14C9B7F496;
 Sun, 31 Jan 2021 09:57:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=aruko.org; s=mail;
 t=1612087039; bh=WaYjN6LulNhQAZc5zhwsQAkXNQ91yI459HM4uMk/86Y=;
 h=From:To:Cc:Subject:Date;
 b=CRGZWkrihQ1uFYO2Y0oYzbvDecHao0u9aMQKSt76J5dxQ6FtdbgYTONUdxYRw/Gy6
 eNAEK+hcPKWHOW5rwNQ3av+Thd6fMuOvPNi8vcFvfY8+5ZAy2FQp1LPIc4mwAa8pd9
 FyfUvgVNBEKBRjUd9oJmdV/tiGMxqJtHP25JK7N0=
From: Mykyta Poturai <ddone@aruko.org>
To: 
Subject: [PATCH 2/2] dt-bindings: display: Add "disable-hpd" binding
Date: Sun, 31 Jan 2021 11:57:01 +0200
Message-Id: <20210131095701.965147-1-ddone@aruko.org>
X-Mailer: git-send-email 2.30.0
MIME-Version: 1.0
X-Mailman-Approved-At: Sun, 31 Jan 2021 11:43:06 +0000
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
Cc: devicetree@vger.kernel.org, David Airlie <airlied@linux.ie>,
 Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 linux-renesas-soc@vger.kernel.org, Rob Herring <robh+dt@kernel.org>,
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
 Mykyta Poturai <ddone@aruko.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Add the "disable-hpd" binding, used to disable hotplug detected
functionality in the driver. When it's enabled the driver assumes that
the connector is always connected and disables the hotplug detect
related IRQ.

Signed-off-by: Mykyta Poturai <ddone@aruko.org>
---
 .../devicetree/bindings/display/bridge/renesas,dw-hdmi.txt       | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/display/bridge/renesas,dw-hdmi.txt b/Documentation/devicetree/bindings/display/bridge/renesas,dw-hdmi.txt
index 3f6072651182..b2b899f46b86 100644
--- a/Documentation/devicetree/bindings/display/bridge/renesas,dw-hdmi.txt
+++ b/Documentation/devicetree/bindings/display/bridge/renesas,dw-hdmi.txt
@@ -39,6 +39,7 @@ Optional properties:
 
 - power-domains: Shall reference the power domain that contains the DWC HDMI,
   if any.
+- disable-hpd: Disables the hotplug detect feature
 
 
 Example:
-- 
2.30.0

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
