Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id B8D5F50C081
	for <lists+dri-devel@lfdr.de>; Fri, 22 Apr 2022 21:47:16 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C336A10E644;
	Fri, 22 Apr 2022 19:47:14 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pl1-x634.google.com (mail-pl1-x634.google.com
 [IPv6:2607:f8b0:4864:20::634])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4596210E5ED
 for <dri-devel@lists.freedesktop.org>; Fri, 22 Apr 2022 11:09:19 +0000 (UTC)
Received: by mail-pl1-x634.google.com with SMTP id c12so10108890plr.6
 for <dri-devel@lists.freedesktop.org>; Fri, 22 Apr 2022 04:09:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id;
 bh=leKcIkbTChTIcMMrK/8Nve45Vqax3ADqAZotWhYWeMw=;
 b=hfC+nmOjX6syuMVBvn8HGft8WokPauS0HtAD1WDHYkqcVZjXNkm4MAXBOLRkZDn/hF
 URPWWyQHJJZQbCDEffpQ5OYdPb+qS8ImgodnV651oaBX7a4hAI2eqCra9qibJ6V/X6f3
 IwXj3iPeO10M+mrkwSD3on+SSgg33my4EjHDRA2rBdM/anqkhUhHi2gdvCMp56ay6NK9
 iQCiAPk0G/hiqwP/nuLJQ/bs8LbMpZZBnVCXBoxywH8Nl51ZeOSgUbJQssN5PHzke93a
 ORONstvqXHVpBoPSAQ5KxKfxzX+cQi66XMEQ1VQtWL9cwqFQ6RnMeWdcr+VhZmh5co7u
 IsyA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id;
 bh=leKcIkbTChTIcMMrK/8Nve45Vqax3ADqAZotWhYWeMw=;
 b=e6cbdGLOjtRz3nPNL7muXyQeUvSAnQaVdXImcbIZ/jboke5R+OeoDQ5T1DEQTiR80s
 ScGGNaTQnxNFTEJRcBYkeyIrS7M4H9cv5HPncd+vfVTl6rbwH7KeqblGLn9H7LNwNnMK
 2vwLOEJ8loj2BMA9UdnJD/AP2QUpiU6JnKoqzaLuDp+btUBF3m9Of48S+kJVwC+r3d4w
 +0BeqTKPjcau1QxDPLmeW6fpEsteJ2r9oVYW/i2+Vgo9Q/Ljd6uVTk8Aml1QgOW2xpUn
 H6Xhg/459vV4uv94cab7LY3BxUW7OYTE4rsZTjl/P18leYu9frU02E0FZ9N2PmkH81qQ
 +D5A==
X-Gm-Message-State: AOAM532o14quy+ABntg5/zfDAikpDaOtPEKX5uvopXmd89f7kuynAmkA
 f+uc9v0GNKyJKP+I3Z0vf+U=
X-Google-Smtp-Source: ABdhPJxOx9+lZvaahYdspM6L4/KiVLRsNHoOZvb9ZVOrEX4rvkxh2WoAaaoTyHGDSVV3Mf965YPsMQ==
X-Received: by 2002:a17:902:cecb:b0:158:9a0b:c839 with SMTP id
 d11-20020a170902cecb00b001589a0bc839mr4195470plg.58.1650625758909; 
 Fri, 22 Apr 2022 04:09:18 -0700 (PDT)
Received: from localhost.localdomain ([43.132.141.9])
 by smtp.gmail.com with ESMTPSA id
 n20-20020a634d54000000b0039d18bf7864sm1942568pgl.20.2022.04.22.04.09.17
 (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
 Fri, 22 Apr 2022 04:09:18 -0700 (PDT)
From: "brookxu.cn" <brookxu.cn@gmail.com>
To: jyri.sarha@iki.fi,
	tomba@kernel.org,
	airlied@linux.ie,
	daniel@ffwll.ch
Subject: [PATCH] drm/tilcdc: fix typos in comment
Date: Fri, 22 Apr 2022 19:09:11 +0800
Message-Id: <1650625751-32137-1-git-send-email-brookxu.cn@gmail.com>
X-Mailer: git-send-email 1.8.3.1
X-Mailman-Approved-At: Fri, 22 Apr 2022 19:47:13 +0000
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
Cc: dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: Chunguang Xu <brookxu@tencent.com>

Fix typos in comment.

Signed-off-by: Chunguang Xu <brookxu@tencent.com>
---
 drivers/gpu/drm/tilcdc/tilcdc_crtc.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/tilcdc/tilcdc_crtc.c b/drivers/gpu/drm/tilcdc/tilcdc_crtc.c
index 29890d7..b986946 100644
--- a/drivers/gpu/drm/tilcdc/tilcdc_crtc.c
+++ b/drivers/gpu/drm/tilcdc/tilcdc_crtc.c
@@ -996,7 +996,7 @@ irqreturn_t tilcdc_crtc_irq(struct drm_crtc *crtc)
 	if (stat & LCDC_FRAME_DONE) {
 		tilcdc_crtc->frame_done = true;
 		wake_up(&tilcdc_crtc->frame_done_wq);
-		/* rev 1 lcdc appears to hang if irq is not disbaled here */
+		/* rev 1 lcdc appears to hang if irq is not disabled here */
 		if (priv->rev == 1)
 			tilcdc_clear(dev, LCDC_RASTER_CTRL_REG,
 				     LCDC_V1_FRAME_DONE_INT_ENA);
-- 
1.8.3.1

