Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 735F36613BE
	for <lists+dri-devel@lfdr.de>; Sun,  8 Jan 2023 07:04:15 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 054D810E10D;
	Sun,  8 Jan 2023 06:04:13 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pj1-x1031.google.com (mail-pj1-x1031.google.com
 [IPv6:2607:f8b0:4864:20::1031])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9DD3410E10D
 for <dri-devel@lists.freedesktop.org>; Sun,  8 Jan 2023 06:04:11 +0000 (UTC)
Received: by mail-pj1-x1031.google.com with SMTP id o13so2119452pjg.2
 for <dri-devel@lists.freedesktop.org>; Sat, 07 Jan 2023 22:04:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=vgZ2O2c7uY02sp110jrpcb4sFVag4L5bnVZx1zPM2pI=;
 b=IW2zWqIfbJ6qsS5cqgDH+ted49FOkNroNVcFrpkVcoPl8GKd+1RwKWqzEyepMhcXwx
 u+gr6KXwzGkboxfT4riF2CX1urgg8C34a9iSgadD5M7L1hb4pGKdWuO1JTlkh2FnVXOt
 15v+rOAVummx8A349NdKMYRkS5XdeWUHIQ4EefeM0DFTsGTrWq9eiy8UiI9vUNy0T8F9
 iXCYLlmNw7VcOncr9R/ivAlFC43hjc4ZJfD25eEspNBvvHaKOgYSGHGk2wewL0zcJ+oq
 2i/QGasknTh9UC9ZhK4iLMwdsxSrChabp+i7CkVvSVQAA7NqMWM0kfTOC7oFj0H37yM0
 BSDg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=vgZ2O2c7uY02sp110jrpcb4sFVag4L5bnVZx1zPM2pI=;
 b=Ry78/2mlXuIm8hbtGJn5UOKbIIB5F9lFhYml/c4PV6UQAoF6ctm70ocj1D/a4QaBuk
 I5tff/gPAj2apg9SWopK5XESJQiWy+/Nxmd/0S77WQLvr7A5XrS6Nypqa+mwzLtVj3Od
 9XJGJbRj0UUZ3Lwm49Y+UqoDHoDUAOAhFN91tiMWGgimEj/xzE//52mcPE37dqIZvVqJ
 P9dC3rYx6vZ7cFQXr+I3S+Qx9a09f9FY/kLjQzDha9xHNqLOtcmSjtZOM1ktj7NVlykZ
 33vmUgpD61OTx8iT9Z2zBbmaEqkZbJLiNHfhh3d8HiQL2k4Dom8L6qYWc3JSLBqPr5SQ
 QQ4Q==
X-Gm-Message-State: AFqh2kohRmg3N/8zJfJ5m9oA0+5xOkrzmxbiSt2WI/bOUk1wrthmthud
 chSjJNc0aVMUdn60WB05hkM=
X-Google-Smtp-Source: AMrXdXuIhWr4qCAcRzAZ1ind21LDvWzbvvMG909C5Jh3ogz5WeCZFjP7tXUmssARcmq8hOPwya/3XQ==
X-Received: by 2002:a05:6a20:4f1c:b0:b2:8c0b:529c with SMTP id
 gi28-20020a056a204f1c00b000b28c0b529cmr58171027pzb.54.1673157851160; 
 Sat, 07 Jan 2023 22:04:11 -0800 (PST)
Received: from morpheus.home.roving-it.com
 (91.196.27.211.sta.commander.net.au. [211.27.196.91])
 by smtp.googlemail.com with ESMTPSA id
 u18-20020a170903125200b001869ba04c83sm3557012plh.245.2023.01.07.22.04.07
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 07 Jan 2023 22:04:10 -0800 (PST)
From: Peter Robinson <pbrobinson@gmail.com>
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
 Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>,
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>,
 dri-devel@lists.freedesktop.org, linux-renesas-soc@vger.kernel.org
Subject: [PATCH v2] drm: rcar-du: depend on DRM_RCAR_DU for components on that
 SoC
Date: Sun,  8 Jan 2023 06:04:01 +0000
Message-Id: <20230108060401.391061-1-pbrobinson@gmail.com>
X-Mailer: git-send-email 2.39.0
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
Cc: Peter Robinson <pbrobinson@gmail.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

There's a few components in the rcar-du drm directory that
don't make sense to be selectable if DRM_RCAR_DU isn't because
they are part of the IP block so add a dependency and add
compile check to ensure they're still tested.

Signed-off-by: Peter Robinson <pbrobinson@gmail.com>
---

v2:
- typo fix in commit message
- s/ARCH_RENESAS/DRM_RCAR_DU

 drivers/gpu/drm/rcar-du/Kconfig | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/drivers/gpu/drm/rcar-du/Kconfig b/drivers/gpu/drm/rcar-du/Kconfig
index b2bddbeca878..362fb6099e9f 100644
--- a/drivers/gpu/drm/rcar-du/Kconfig
+++ b/drivers/gpu/drm/rcar-du/Kconfig
@@ -25,6 +25,7 @@ config DRM_RCAR_CMM
 config DRM_RCAR_DW_HDMI
 	tristate "R-Car Gen3 and RZ/G2 DU HDMI Encoder Support"
 	depends on DRM && OF
+	depends on DRM_RCAR_DU || COMPILE_TEST
 	select DRM_DW_HDMI
 	help
 	  Enable support for R-Car Gen3 or RZ/G2 internal HDMI encoder.
@@ -32,6 +33,7 @@ config DRM_RCAR_DW_HDMI
 config DRM_RCAR_USE_LVDS
 	bool "R-Car DU LVDS Encoder Support"
 	depends on DRM_BRIDGE && OF
+	depends on DRM_RCAR_DU || COMPILE_TEST
 	default DRM_RCAR_DU
 	help
 	  Enable support for the R-Car Display Unit embedded LVDS encoders.
@@ -45,6 +47,7 @@ config DRM_RCAR_LVDS
 config DRM_RCAR_USE_MIPI_DSI
 	bool "R-Car DU MIPI DSI Encoder Support"
 	depends on DRM_BRIDGE && OF
+	depends on DRM_RCAR_DU || COMPILE_TEST
 	default DRM_RCAR_DU
 	help
 	  Enable support for the R-Car Display Unit embedded MIPI DSI encoders.
-- 
2.39.0

