Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 4FAEF24F0BB
	for <lists+dri-devel@lfdr.de>; Mon, 24 Aug 2020 02:33:25 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BF8D86EC59;
	Mon, 24 Aug 2020 00:33:20 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com
 [IPv6:2001:4b98:dc2:55:216:3eff:fef7:d647])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2A45C6EC59
 for <dri-devel@lists.freedesktop.org>; Mon, 24 Aug 2020 00:33:19 +0000 (UTC)
Received: from pendragon.lan (62-78-145-57.bb.dnainternet.fi [62.78.145.57])
 by perceval.ideasonboard.com (Postfix) with ESMTPSA id BFDE1574;
 Mon, 24 Aug 2020 02:33:16 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
 s=mail; t=1598229197;
 bh=Qk7UJYGwgCD2fNWhuWMVwQkcNnpHrrVda5sJ4LJGaD0=;
 h=From:To:Cc:Subject:Date:From;
 b=Zo/uEziKTwN+aSLOUZrJA7IM4Ut8+te8gIFPKjrjSn9DvKG/p3IqiLqZ5xrOAykwE
 UQAatMf77h8Qj0Zg8ShY39F8oYTMY0f+xkP7RJqD8KISR3pH5ef31a1RyTo0tkaoly
 wOJyb3D/BM2wkHMqgHEacevN47ab/IvFEHr1L6O8=
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH] drm: panel: Fix bpc for OrtusTech COM43H4M85ULC panel
Date: Mon, 24 Aug 2020 03:32:54 +0300
Message-Id: <20200824003254.21904-1-laurent.pinchart@ideasonboard.com>
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
Cc: Thierry Reding <thierry.reding@gmail.com>, Sam Ravnborg <sam@ravnborg.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

The OrtusTech COM43H4M85ULC panel is a 18-bit RGB panel. Commit
f098f168e91c ("drm: panel: Fix bus format for OrtusTech COM43H4M85ULC
panel") has fixed the bus formats, but forgot to address the bpc value.
Set it to 6.

Fixes: f098f168e91c ("drm: panel: Fix bus format for OrtusTech COM43H4M85ULC panel")
Signed-off-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
---
 drivers/gpu/drm/panel/panel-simple.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/panel/panel-simple.c b/drivers/gpu/drm/panel/panel-simple.c
index 4eabfdd3be2d..723e9c879dfc 100644
--- a/drivers/gpu/drm/panel/panel-simple.c
+++ b/drivers/gpu/drm/panel/panel-simple.c
@@ -3024,7 +3024,7 @@ static const struct drm_display_mode ortustech_com43h4m85ulc_mode  = {
 static const struct panel_desc ortustech_com43h4m85ulc = {
 	.modes = &ortustech_com43h4m85ulc_mode,
 	.num_modes = 1,
-	.bpc = 8,
+	.bpc = 6,
 	.size = {
 		.width = 56,
 		.height = 93,
-- 
Regards,

Laurent Pinchart

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
