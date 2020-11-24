Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B484D2C3A98
	for <lists+dri-devel@lfdr.de>; Wed, 25 Nov 2020 09:12:23 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 177F46E859;
	Wed, 25 Nov 2020 08:11:56 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from softboy.mntmn.com (softboy.mntmn.com [91.250.115.15])
 by gabe.freedesktop.org (Postfix) with ESMTP id 7A0E16E4DD
 for <dri-devel@lists.freedesktop.org>; Tue, 24 Nov 2020 17:26:52 +0000 (UTC)
From: "Lukas F. Hartmann" <lukas@mntre.com>
DKIM-Filter: OpenDKIM Filter v2.11.0 softboy.mntmn.com 36201720F46
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=mntre.com;
 s=mntremail; t=1606238811;
 bh=8Jj0AmtAGplo7ayDkJLt5zNooDVeNlxY0dyEat7B+hQ=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=nJybrgiQY6dVhmKoAHKjQNVaAUk5xQcXofGN8wo76PACdPU5MXCIY7sgFhNuEkkTl
 JWqi8XUvwMh9cQvhlyKXgBqPdY6jzRPXxHtddHAxxsgnbeJswm3lghMnotx/4oIZCM
 72D5fFKCaMuaEnXi6zAyr1yNmIGMyhq53RbgerLlkQMtDgX3ZHJPTK7iUjTpEXubU6
 BBmcW1iFG2DaO35/wu1fCUpq8csQA6H0d1WzjsUC6cCxJC2AFPIoxBOP2+JhO/gFBI
 eMxhgA6NDWKJqnTkhbEV6DGnseFLwvKsNvNVZNx3vXfjprq+N2Ym1oZF15MxjiSC+A
 XbtaM0OKyzJ6w==
To: lukas@mntre.com
Subject: [PATCH 2/2] dt-bindings: display/panel: add Innolux N125HCE-GN1
Date: Tue, 24 Nov 2020 18:26:06 +0100
Message-Id: <20201124172604.981746-2-lukas@mntre.com>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <20201124172604.981746-1-lukas@mntre.com>
References: <20201124172604.981746-1-lukas@mntre.com>
MIME-Version: 1.0
X-Mailman-Approved-At: Wed, 25 Nov 2020 08:11:52 +0000
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
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 Rob Herring <robh+dt@kernel.org>, Thierry Reding <thierry.reding@gmail.com>,
 Sam Ravnborg <sam@ravnborg.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

The Innolux N125HCE-GN1 display is used in the MNT Reform 2.0 laptop,
attached via eDP to a SN65DSI86 MIPI-DSI to eDP bridge. This patch
contains the DT binding for "innolux,n125hce-gn1".

Signed-off-by: Lukas F. Hartmann <lukas@mntre.com>
---
 .../devicetree/bindings/display/panel/panel-simple.yaml         | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/Documentation/devicetree/bindings/display/panel/panel-simple.yaml b/Documentation/devicetree/bindings/display/panel/panel-simple.yaml
index edb53ab0d..03b3e0b9d 100644
--- a/Documentation/devicetree/bindings/display/panel/panel-simple.yaml
+++ b/Documentation/devicetree/bindings/display/panel/panel-simple.yaml
@@ -160,6 +160,8 @@ properties:
         # Innolux Corporation 11.6" WXGA (1366x768) TFT LCD panel
       - innolux,n116bge
         # InnoLux 15.6" WXGA TFT LCD panel
+      - innolux,n125hce-gn1
+        # InnoLux 13.3" FHD (1920x1080) eDP TFT LCD panel
       - innolux,n156bge-l21
         # Innolux Corporation 7.0" WSVGA (1024x600) TFT LCD panel
       - innolux,zj070na-01p
-- 
2.28.0

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
