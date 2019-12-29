Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 93B7F12C2CD
	for <lists+dri-devel@lfdr.de>; Sun, 29 Dec 2019 15:44:12 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2051489E3F;
	Sun, 29 Dec 2019 14:43:44 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pg1-x542.google.com (mail-pg1-x542.google.com
 [IPv6:2607:f8b0:4864:20::542])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D3D0689ABA
 for <dri-devel@lists.freedesktop.org>; Sun, 29 Dec 2019 06:09:00 +0000 (UTC)
Received: by mail-pg1-x542.google.com with SMTP id l24so16560685pgk.2
 for <dri-devel@lists.freedesktop.org>; Sat, 28 Dec 2019 22:09:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=PQEq/pXQPWAm+/HQqqVHlxrLAblqW9jzRSmCcXe+hVc=;
 b=vaJlyE8bstbxQxnAUBACLIH9E3AWWNJirhpiyq4G61nllSMb7fqBJhsL9F3KeEOwSG
 GrpZeXpXFWSPSeprwkFVen/PpkmbfPpGCEMIB43ySWQZdVELEtmoqMM6Y8K8m1YR/fk0
 Rh7YqKJjTcIVPTYI/fqj+SqV2qoeE4HlSQkCGuTgqXa5WOjpoc6YDLVPoiuz/XumWGfe
 8AEMcQmx1SSiV03YR8UidnRFZA6suwkC0MM34oCdketkOXtN8PwfbD9TEkc8iNDm5OjD
 FVulASlJ1fCdn2I2A/S7vlcVg9gDmXRDJUvJrHIHgxk/JU8G/dRwrG6/eJWXXtVD8+0/
 aX5A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=PQEq/pXQPWAm+/HQqqVHlxrLAblqW9jzRSmCcXe+hVc=;
 b=q2fL2tcnHVpmpZMk91PbL7r6qP4NW45PiVwRIG+nDfjTvdRYXW0xdiqZQJJqQAMUlL
 NQjrUUqedE4HSZfI/BpuRoVO5lFEgmClpmSn++B2TB9hdhqjL0kYAbALkopGWn0UeDEI
 rgvFnbC2t5Vu2WE7fx7VleGdUuzDvJShBeHTRqOIBrtMkNDIzV2liX8Beg5VteyI7XEF
 ULBdfLGJWMg7VlPSOStlZW1nevx0fOWAL9WofJkYppJ3waLwsCgMrPaNWHPVfqW/xVym
 9UTX6RZS2ZBukUwEHIgk2+bEUG33eok35Fs6xI0rfFFtuK+MJ1Potak2yaMbAcB05SmH
 r89Q==
X-Gm-Message-State: APjAAAUxBTC0Od30Yn2NzJPEQPEIMSIL/0UOmWGLdXKaoMu5PO1mxzLa
 J7E35v5Ju4CWc94BSVW40pFT9Q==
X-Google-Smtp-Source: APXvYqwEIg9C9X4H9fXSdY40cModg6G+r8GR11cJ+V73bUm6nsOiyCNuD5QFmcFq/H7Btsgk2mIxrQ==
X-Received: by 2002:a62:4e0a:: with SMTP id c10mr54791833pfb.181.1577599740493; 
 Sat, 28 Dec 2019 22:09:00 -0800 (PST)
Received: from localhost.localdomain
 (104-188-17-28.lightspeed.sndgca.sbcglobal.net. [104.188.17.28])
 by smtp.gmail.com with ESMTPSA id s131sm28316795pfs.135.2019.12.28.22.08.59
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 28 Dec 2019 22:08:59 -0800 (PST)
From: Bjorn Andersson <bjorn.andersson@linaro.org>
To: Thierry Reding <thierry.reding@gmail.com>, Sam Ravnborg <sam@ravnborg.org>,
 David Airlie <airlied@linux.ie>, Daniel Vetter <daniel@ffwll.ch>
Subject: [PATCH] panel: simple: Add BOE NV133FHM-N61
Date: Sat, 28 Dec 2019 22:08:23 -0800
Message-Id: <20191229060823.746255-1-bjorn.andersson@linaro.org>
X-Mailer: git-send-email 2.24.0
MIME-Version: 1.0
X-Mailman-Approved-At: Sun, 29 Dec 2019 14:43:42 +0000
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
Cc: linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

The BOE NV133FHM-N61 panel is a 13.3" 1920x1080 eDP panel, add support
for it in panel-simple.

Signed-off-by: Bjorn Andersson <bjorn.andersson@linaro.org>
---
 drivers/gpu/drm/panel/panel-simple.c | 30 ++++++++++++++++++++++++++++
 1 file changed, 30 insertions(+)

diff --git a/drivers/gpu/drm/panel/panel-simple.c b/drivers/gpu/drm/panel/panel-simple.c
index d7ae0ede2b6e..3c25e10b719d 100644
--- a/drivers/gpu/drm/panel/panel-simple.c
+++ b/drivers/gpu/drm/panel/panel-simple.c
@@ -1008,6 +1008,33 @@ static const struct panel_desc boe_nv101wxmn51 = {
 	},
 };
 
+static const struct drm_display_mode boe_nv133fhm_n61_modes = {
+	.clock = 147840,
+	.hdisplay = 1920,
+	.hsync_start = 1920 + 48,
+	.hsync_end = 1920 + 48 + 32,
+	.htotal = 1920 + 48 + 32 + 200,
+	.vdisplay = 1080,
+	.vsync_start = 1080 + 3,
+	.vsync_end = 1080 + 3 + 6,
+	.vtotal = 1080 + 3 + 6 + 31,
+	.vrefresh = 60,
+};
+
+static const struct panel_desc boe_nv133fhm_n61 = {
+	.modes = &boe_nv133fhm_n61_modes,
+	.num_modes = 1,
+	.bpc = 8,
+	.size = {
+		.width = 300,
+		.height = 187,
+	},
+	.delay = {
+		.hpd_absent_delay = 200,
+		.unprepare = 500,
+	},
+};
+
 static const struct drm_display_mode cdtech_s043wq26h_ct7_mode = {
 	.clock = 9000,
 	.hdisplay = 480,
@@ -3195,6 +3222,9 @@ static const struct of_device_id platform_of_match[] = {
 	}, {
 		.compatible = "boe,nv101wxmn51",
 		.data = &boe_nv101wxmn51,
+	}, {
+		.compatible = "boe,nv133fhm-n61",
+		.data = &boe_nv133fhm_n61,
 	}, {
 		.compatible = "cdtech,s043wq26h-ct7",
 		.data = &cdtech_s043wq26h_ct7,
-- 
2.24.0

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
