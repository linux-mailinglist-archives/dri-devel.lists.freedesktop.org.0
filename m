Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 4A4C65ED901
	for <lists+dri-devel@lfdr.de>; Wed, 28 Sep 2022 11:32:02 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D533610E38D;
	Wed, 28 Sep 2022 09:31:52 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pj1-x102b.google.com (mail-pj1-x102b.google.com
 [IPv6:2607:f8b0:4864:20::102b])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C11BE10E38D
 for <dri-devel@lists.freedesktop.org>; Wed, 28 Sep 2022 09:31:47 +0000 (UTC)
Received: by mail-pj1-x102b.google.com with SMTP id
 e11-20020a17090a77cb00b00205edbfd646so1512782pjs.1
 for <dri-devel@lists.freedesktop.org>; Wed, 28 Sep 2022 02:31:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date;
 bh=M3bp3/heYcffHLAjkXbjJ8sI3ZEzvrPkNlCHNlANPn0=;
 b=d4FuVwCupy+evQjyXNFVgqKHpVO/fPVitibQ+sIbQQ7RGRzTBmsYsXfXZXrjzFwXND
 IIFKaJ0Xz2PSctYiM+nrdjlcy4SW8y3YsY2dIxpCbJJOTipgj8nHbc5ShntY0iOiWNM7
 myW55UKPrOhjfGb7d4OPavDgzs3PMKhbGKymNShtJaC7/ttXncfjgpOF2xkpkVuvsddX
 +Mb3u7zrsCk+UyOmiEuhvGJEA4ROy5Ys6baDFLbuJmkFTpP/VorGEMetw+3WYPyRxWdo
 1vlW7z2CTUVBBIMmP6ztmaB8JW8orc37Mm0RefAhZLnJoFefyWagOCbJSnD0chLwbqXA
 9YQA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date;
 bh=M3bp3/heYcffHLAjkXbjJ8sI3ZEzvrPkNlCHNlANPn0=;
 b=s0JPJuwfLC0wNWdecF+UVr+Xh1SuDG3s4KZi6MhUrS263KqWqLJtcstan8oMW6KygD
 vwWEOkGs35YzsVmLPO+2UnMMHuqdIWG5e4CV1eiCDTrCzSRLwDGL9uaqWKTpXkDjWEqP
 PcGpAUGgtRitibVk1IoNZYaOjV+q9k68Ctb6CR0xgN7Jvv/gOsP1kCetkPuBNEYry3ou
 vCjY8hw5cwcs+U+TMbYlgXTTKvlrDL0fQfmN7s3OunChn4DGF90oSy7OueqKCifiN2pW
 oJlopTZIRWPnQ6HqSLIBiW5ftTtdl6oaVjiIQDs/EdutAFjxqLct9j7kDl+5XbOJltMb
 cIRw==
X-Gm-Message-State: ACrzQf2fgf/YERsein3cHGLzAn2EIPwA5zO5o2FasRvYPxse9gr6gtSC
 6xtlFA9F/YsvtJKLkvuMgkE=
X-Google-Smtp-Source: AMsMyM5189enVMuN9LzPeIB5eR13RwM5I2P4XwY5RpLgpLl+Ej9vM5JxwQ6iUvQdkoypJ+1756lDaw==
X-Received: by 2002:a17:902:f60b:b0:178:6a49:d4e3 with SMTP id
 n11-20020a170902f60b00b001786a49d4e3mr32109753plg.75.1664357507219; 
 Wed, 28 Sep 2022 02:31:47 -0700 (PDT)
Received: from fedora.. ([103.159.189.146]) by smtp.gmail.com with ESMTPSA id
 v11-20020a17090a088b00b001f22647cb56sm1049477pjc.27.2022.09.28.02.31.43
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 28 Sep 2022 02:31:46 -0700 (PDT)
From: Khalid Masum <khalid.masum.92@gmail.com>
To: Linus Walleij <linus.walleij@linaro.org>, David Airlie <airlied@linux.ie>,
 Daniel Vetter <daniel@ffwll.ch>, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org
Subject: [PATCH] drm/tve200: Use drm_* variants for logging
Date: Wed, 28 Sep 2022 15:31:03 +0600
Message-Id: <20220928093103.64014-1-khalid.masum.92@gmail.com>
X-Mailer: git-send-email 2.37.3
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
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
Cc: Khalid Masum <khalid.masum.92@gmail.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

We have routines like drm_info/warn/err for logging. Use them instead
of dev_* variants to get drm-formatted log messages.

Signed-off-by: Khalid Masum <khalid.masum.92@gmail.com>
---
 drivers/gpu/drm/tve200/tve200_display.c | 12 ++++++------
 1 file changed, 6 insertions(+), 6 deletions(-)

diff --git a/drivers/gpu/drm/tve200/tve200_display.c b/drivers/gpu/drm/tve200/tve200_display.c
index 771bad881714..d453581b6b18 100644
--- a/drivers/gpu/drm/tve200/tve200_display.c
+++ b/drivers/gpu/drm/tve200/tve200_display.c
@@ -60,7 +60,7 @@ irqreturn_t tve200_irq(int irq, void *data)
 		}
 		writel(val, priv->regs + TVE200_CTRL);
 	} else
-		dev_err(priv->drm->dev, "stray IRQ %08x\n", stat);
+		drm_err(priv->drm, "stray IRQ %08x\n", stat);
 
 	/* Clear the interrupt once done */
 	writel(stat, priv->regs + TVE200_INT_CLR);
@@ -146,7 +146,7 @@ static void tve200_display_enable(struct drm_simple_display_pipe *pipe,
 	}
 	if (retries == 5 &&
 	    readl(priv->regs + TVE200_CTRL_4) & TVE200_CTRL_4_RESET) {
-		dev_err(drm->dev, "can't get hardware out of reset\n");
+		drm_err(drm, "can't get hardware out of reset\n");
 		return;
 	}
 
@@ -171,14 +171,14 @@ static void tve200_display_enable(struct drm_simple_display_pipe *pipe,
 	if ((mode->hdisplay == 352 && mode->vdisplay == 240) || /* SIF(525) */
 	    (mode->hdisplay == 352 && mode->vdisplay == 288)) { /* CIF(625) */
 		ctrl1 |= TVE200_CTRL_IPRESOL_CIF;
-		dev_info(drm->dev, "CIF mode\n");
+		drm_info(drm, "CIF mode\n");
 	} else if (mode->hdisplay == 640 && mode->vdisplay == 480) {
 		ctrl1 |= TVE200_CTRL_IPRESOL_VGA;
-		dev_info(drm->dev, "VGA mode\n");
+		drm_info(drm, "VGA mode\n");
 	} else if ((mode->hdisplay == 720 && mode->vdisplay == 480) ||
 		   (mode->hdisplay == 720 && mode->vdisplay == 576)) {
 		ctrl1 |= TVE200_CTRL_IPRESOL_D1;
-		dev_info(drm->dev, "D1 mode\n");
+		drm_info(drm, "D1 mode\n");
 	}
 
 	if (format & DRM_FORMAT_BIG_ENDIAN) {
@@ -226,7 +226,7 @@ static void tve200_display_enable(struct drm_simple_display_pipe *pipe,
 		ctrl1 |= TVE200_IPDMOD_YUV420;
 		break;
 	default:
-		dev_err(drm->dev, "Unknown FB format 0x%08x\n",
+		drm_err(drm, "Unknown FB format 0x%08x\n",
 			fb->format->format);
 		break;
 	}
-- 
2.37.3

