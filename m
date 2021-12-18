Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 4159B479B93
	for <lists+dri-devel@lfdr.de>; Sat, 18 Dec 2021 16:23:27 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2CA1010FFE8;
	Sat, 18 Dec 2021 15:23:24 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from phobos.denx.de (phobos.denx.de
 [IPv6:2a01:238:438b:c500:173d:9f52:ddab:ee01])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 27A3F10FFC3
 for <dri-devel@lists.freedesktop.org>; Sat, 18 Dec 2021 15:23:22 +0000 (UTC)
Received: from tr.lan (ip-89-176-112-137.net.upcbroadband.cz [89.176.112.137])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
 (No client certificate requested)
 (Authenticated sender: marex@denx.de)
 by phobos.denx.de (Postfix) with ESMTPSA id 694478303B;
 Sat, 18 Dec 2021 16:23:19 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=denx.de;
 s=phobos-20191101; t=1639840999;
 bh=1lobMaw9pLY/MD9G5+vs9jJ/NBITmXZ5Lzdma5cfNR4=;
 h=From:To:Cc:Subject:Date:From;
 b=CCKhUrPk2Ni3buIODokFfcSH7f+zShNHV9oYp5IdLS8iGDnQJh8lPRp+88WZU7qEm
 GaTil1SzsMehivxgke0JAhq0sG9pGyWP7ESP0qxMZXlMyblC9aZTDNeoGyak1h2Bfc
 4eP5mFPkckbj7BWO9VCq0Y+SBt9bZj2cmAJVFdZxv7jwrEkLUa2OyBuQDPdO4iExeN
 l0MFUgHoMUo7cnOh9Gts62xkDr00V0zk44xxzdo/F5zDzC97L41N630XTztmPNCNT5
 C1P3fKsZ0y218wKYP72m91kc+TufrvcR/25244LykcZg0PWdhfsm4Lwrnqv+Wk00c8
 izAjSxNQOcBnA==
From: Marek Vasut <marex@denx.de>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH] dt-bindings: display: bridge: lvds-codec: Document TI
 DS90CF364A decoder
Date: Sat, 18 Dec 2021 16:23:09 +0100
Message-Id: <20211218152309.256183-1-marex@denx.de>
X-Mailer: git-send-email 2.33.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Virus-Scanned: clamav-milter 0.103.2 at phobos.denx.de
X-Virus-Status: Clean
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
 Rob Herring <robh+dt@kernel.org>, Sam Ravnborg <sam@ravnborg.org>,
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Add compatible string for TI DS90CF364A, which is another LVDS to DPI
decoder similar to DS90CF384A, except it is using smaller package and
only provides 18bit DPI bus.

Signed-off-by: Marek Vasut <marex@denx.de>
Cc: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Cc: Rob Herring <robh+dt@kernel.org>
Cc: Sam Ravnborg <sam@ravnborg.org>
Cc: devicetree@vger.kernel.org
To: dri-devel@lists.freedesktop.org
---
 Documentation/devicetree/bindings/display/bridge/lvds-codec.yaml | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/display/bridge/lvds-codec.yaml b/Documentation/devicetree/bindings/display/bridge/lvds-codec.yaml
index 1faae3e323a4..99c13f879916 100644
--- a/Documentation/devicetree/bindings/display/bridge/lvds-codec.yaml
+++ b/Documentation/devicetree/bindings/display/bridge/lvds-codec.yaml
@@ -39,6 +39,7 @@ properties:
           - const: lvds-encoder # Generic LVDS encoder compatible fallback
       - items:
           - enum:
+              - ti,ds90cf364a # For the DS90CF364A FPD-Link LVDS Receiver
               - ti,ds90cf384a # For the DS90CF384A FPD-Link LVDS Receiver
           - const: lvds-decoder # Generic LVDS decoders compatible fallback
       - enum:
-- 
2.33.0

