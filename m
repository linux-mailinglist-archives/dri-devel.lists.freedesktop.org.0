Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id BFDC13DC3C1
	for <lists+dri-devel@lfdr.de>; Sat, 31 Jul 2021 08:10:26 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C1FB36E53C;
	Sat, 31 Jul 2021 06:10:21 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-qt1-x833.google.com (mail-qt1-x833.google.com
 [IPv6:2607:f8b0:4864:20::833])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6F1F76F4DA
 for <dri-devel@lists.freedesktop.org>; Sat, 31 Jul 2021 00:53:32 +0000 (UTC)
Received: by mail-qt1-x833.google.com with SMTP id x9so7696374qtw.13
 for <dri-devel@lists.freedesktop.org>; Fri, 30 Jul 2021 17:53:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=date:from:to:cc:subject:message-id:mime-version:content-disposition
 :user-agent; bh=o9Zdiw6K369prvk3D1uESThz5LudI1mAgV6OPbSiui4=;
 b=h2hMncmKkWj53pRhHsbHhurfZQD1w4i3oFX/B692uVqckYYAi2zZme2KoRzKsPMFs8
 IVJp/eTSPb42INlKKwKRQQt2C+laE+BDSI5cBQ6s2yCAAxNvesm3+L1xDk+7grBw9emX
 QrDzOKU6c1PH+9n5MGB6/kUx4vv3qaWpksHU3mia746LfBAKQY1IvVX/YRIfqml3+/bn
 X1RouMTvkQWMDl/LkDNHwlQ0tqFjMLPFokGtAkO4lBDYB4SqSO0VWHolf9PsW7dV93le
 31TV3OvTtAJl15eGCJdlNHfkhIkD0PbPPMCXhD12GnaAyfck0AakVQptzYxxij5YPAu/
 ZGLg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:mime-version
 :content-disposition:user-agent;
 bh=o9Zdiw6K369prvk3D1uESThz5LudI1mAgV6OPbSiui4=;
 b=MQKNeuut133LItrLkNEppyOaLHhoTrHuC0mM1zYmTCi/Hw6KOpTL1KtgoRLFn4u21c
 D9jiy3SRgk5q3pJkhpPzJlE2rHH9rdmojPfsnEQRoGKqF5k/S+eiSMrqADKPudz5Jc9i
 CxD0Kw5t0ApCCGn+zI7H60fHvvM/vfndcgzXp4QP5rNk2T0MqeWTDFSe+cSMnkM5BoEF
 PChaLivcuspgjKu+B9JVgFLYdPBfjUdal7+Yr2w6tCSXNwQ5QHtFPclWsK7UWVe+ZgPj
 YH7AVZGAW4G5DCm6MTt9dwMWBwUkdAyldWRYOnGELP1U+cxytoxgz8hOgVvzbfn4B3GH
 iyqA==
X-Gm-Message-State: AOAM530mfdhNzFVJ6grbUl6SmGAcbj/Z1jbNNR8y/S/fSxPWjLS72pvd
 2s6cJAOR4QYVw5cGv8fkVAI=
X-Google-Smtp-Source: ABdhPJxWh7VVNCk59dlYyVv++IHEoDgiBt8VY3eOSyTVmyv8B2vh8OS7Cvj1Q9McN1xUv7+IVqXX7g==
X-Received: by 2002:ac8:65c5:: with SMTP id t5mr4777693qto.157.1627692811397; 
 Fri, 30 Jul 2021 17:53:31 -0700 (PDT)
Received: from devbox (cpe-172-73-74-72.carolina.res.rr.com. [172.73.74.72])
 by smtp.gmail.com with ESMTPSA id c11sm1356838qth.29.2021.07.30.17.53.30
 (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
 Fri, 30 Jul 2021 17:53:30 -0700 (PDT)
Date: Fri, 30 Jul 2021 20:53:28 -0400
From: Gregory Williams <gregwills85@gmail.com>
To: airlied@redhat.com
Cc: tzimmermann@suse.de, daniel@ffwll.ch, dri-devel@lists.freedesktop.org
Subject: [PATCH] DRM: ast: Fixed coding style issues of ast_mode.c
Message-ID: <20210731005328.GA19016@devbox>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
User-Agent: Mutt/1.9.4 (2018-02-28)
X-Mailman-Approved-At: Sat, 31 Jul 2021 06:10:20 +0000
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Removed space before comma, fixed if statements by putting trailing 
statements on new line, fixed unsigned int declaration, and removed 
not needed else statement after return.

Signed-off-by: Gregory Williams <gregwills85@gmail.com>
---
 drivers/gpu/drm/ast/ast_mode.c | 31 ++++++++++++++++++++-----------
 1 file changed, 20 insertions(+), 11 deletions(-)

diff --git a/drivers/gpu/drm/ast/ast_mode.c b/drivers/gpu/drm/ast/ast_mode.c
index 36d9575aa27b..1310ed092073 100644
--- a/drivers/gpu/drm/ast/ast_mode.c
+++ b/drivers/gpu/drm/ast/ast_mode.c
@@ -275,7 +275,7 @@ static void ast_set_std_reg(struct ast_private *ast,
 	ast_set_index_reg_mask(ast, AST_IO_SEQ_PORT, 0x01, 0xdf, stdtable->seq[0]);
 	for (i = 1; i < 4; i++) {
 		jreg = stdtable->seq[i];
-		ast_set_index_reg(ast, AST_IO_SEQ_PORT, (i + 1) , jreg);
+		ast_set_index_reg(ast, AST_IO_SEQ_PORT, (i + 1), jreg);
 	}
 
 	/* Set CRTC; except base address and offset */
@@ -498,13 +498,15 @@ static void ast_set_sync_reg(struct ast_private *ast,
 
 	jreg  = ast_io_read8(ast, AST_IO_MISC_PORT_READ);
 	jreg &= ~0xC0;
-	if (vbios_mode->enh_table->flags & NVSync) jreg |= 0x80;
-	if (vbios_mode->enh_table->flags & NHSync) jreg |= 0x40;
+	if (vbios_mode->enh_table->flags & NVSync)
+		jreg |= 0x80;
+	if (vbios_mode->enh_table->flags & NHSync)
+		jreg |= 0x40;
 	ast_io_write8(ast, AST_IO_MISC_PORT_WRITE, jreg);
 }
 
 static void ast_set_start_address_crt1(struct ast_private *ast,
-				       unsigned offset)
+				       unsigned int offset)
 {
 	u32 addr;
 
@@ -1212,6 +1214,7 @@ static int ast_get_modes(struct drm_connector *connector)
 	struct edid *edid;
 	int ret;
 	bool flags = false;
+
 	if (ast->tx_chip_type == AST_TX_DP501) {
 		ast->dp501_maxclk = 0xff;
 		edid = kmalloc(128, GFP_KERNEL);
@@ -1231,8 +1234,8 @@ static int ast_get_modes(struct drm_connector *connector)
 		ret = drm_add_edid_modes(connector, edid);
 		kfree(edid);
 		return ret;
-	} else
-		drm_connector_update_edid_property(&ast_connector->base, NULL);
+	}
+	drm_connector_update_edid_property(&ast_connector->base, NULL);
 	return 0;
 }
 
@@ -1272,19 +1275,24 @@ static enum drm_mode_status ast_mode_valid(struct drm_connector *connector,
 	}
 	switch (mode->hdisplay) {
 	case 640:
-		if (mode->vdisplay == 480) flags = MODE_OK;
+		if (mode->vdisplay == 480)
+			flags = MODE_OK;
 		break;
 	case 800:
-		if (mode->vdisplay == 600) flags = MODE_OK;
+		if (mode->vdisplay == 600)
+			flags = MODE_OK;
 		break;
 	case 1024:
-		if (mode->vdisplay == 768) flags = MODE_OK;
+		if (mode->vdisplay == 768)
+			flags = MODE_OK;
 		break;
 	case 1280:
-		if (mode->vdisplay == 1024) flags = MODE_OK;
+		if (mode->vdisplay == 1024)
+			flags = MODE_OK;
 		break;
 	case 1600:
-		if (mode->vdisplay == 1200) flags = MODE_OK;
+		if (mode->vdisplay == 1200)
+			flags = MODE_OK;
 		break;
 	default:
 		return flags;
@@ -1296,6 +1304,7 @@ static enum drm_mode_status ast_mode_valid(struct drm_connector *connector,
 static void ast_connector_destroy(struct drm_connector *connector)
 {
 	struct ast_connector *ast_connector = to_ast_connector(connector);
+
 	ast_i2c_destroy(ast_connector->i2c);
 	drm_connector_cleanup(connector);
 }
-- 
2.17.1

