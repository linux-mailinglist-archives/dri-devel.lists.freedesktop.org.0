Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 7CF9A661395
	for <lists+dri-devel@lfdr.de>; Sun,  8 Jan 2023 05:32:04 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B65F110E1D7;
	Sun,  8 Jan 2023 04:31:58 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pl1-x62b.google.com (mail-pl1-x62b.google.com
 [IPv6:2607:f8b0:4864:20::62b])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 80A0810E1D7
 for <dri-devel@lists.freedesktop.org>; Sun,  8 Jan 2023 04:31:56 +0000 (UTC)
Received: by mail-pl1-x62b.google.com with SMTP id y1so6043542plb.2
 for <dri-devel@lists.freedesktop.org>; Sat, 07 Jan 2023 20:31:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=HQcbv0fVqINYjCu2Urro0sAqFZH0EtVLvVWe9v4/BO0=;
 b=On/CuKsWVc21aXJuPlUiYlbdF/UabyUSce6mN4AP/KgtdiIJac6z3AvaPypTyhD914
 Fz4wKtbeJykThfK2QFNPCOdpyqDEtnRY/WTOIzGy/lxinTouAQLPgiQPHnodYev2JKXt
 rmx58KcknfXw7IW/7+mFWmihDIai8iGYGrdBkoKmHTGK31Ur2bHGFp1wGOYmd1BpOI4d
 TtN2j4akKegga1x1jqs0vUaLWCql/fh24QUeQNffvvXUf7ljDFmI+unAG8DTtd7M4cm5
 cIHHmJN1ns0N8+h11edzinYkqAvqlI2ifIBhFSxG4W5v/jaZmMSz6K3AD55n+GTWYyDB
 RmyQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=HQcbv0fVqINYjCu2Urro0sAqFZH0EtVLvVWe9v4/BO0=;
 b=KPnm2PPaWycDS0DOmbXRckooF3iNWP/kwOp3iRS8IMcP1PIWBs7L87Op/GxaH+zKFf
 KOH5EhSiWpcq31rU2VsygdooTnJOKv3MPlzuN0gwq7xk5eB8f155yyPFdt7oJLSETVqE
 uKIs/nki8CNvbAC0zGAdKCwm2LitWJVoUpMH9x6fAU7KC3QMYa3+5GlzdFt6PZn+m0Gq
 cuBbeNWu+rsRt0B9R7U9NSxeIPZVg0XrACScKYl3SOMXrkWEzbffXV19kM6fucNTeH4T
 hJPbQdgdX29RTrgIA281lDbCUl5z5gK+K3pWaI/aBfcSAXVbIVvKTjLNTT00O2U1oCzS
 BlsA==
X-Gm-Message-State: AFqh2kp/Ul51zQm6eL1y4LujgUJ23FkaiIQVRV1q61wUF0CWmwKKakkU
 TMjnmc548kqsUz4VStksiJo=
X-Google-Smtp-Source: AMrXdXsT16Rn4k6cTMhyLA23I+EmeMHXxmqs+DNboZgxbO6GKYdJ1LNgWEBTSHISPeO3HbBhENxuKA==
X-Received: by 2002:a05:6a20:2a94:b0:9d:efc0:76 with SMTP id
 v20-20020a056a202a9400b0009defc00076mr92438306pzh.30.1673152316013; 
 Sat, 07 Jan 2023 20:31:56 -0800 (PST)
Received: from morpheus.home.roving-it.com ([60.231.56.234])
 by smtp.googlemail.com with ESMTPSA id
 l9-20020a170903120900b00188a908cbddsm3426046plh.302.2023.01.07.20.31.52
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 07 Jan 2023 20:31:55 -0800 (PST)
From: Peter Robinson <pbrobinson@gmail.com>
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
 Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>,
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>,
 dri-devel@lists.freedesktop.org, linux-renesas-soc@vger.kernel.org
Subject: [PATCH] drm: rcar-du: depend on ARCH_RENESAS for components on that
 SoC
Date: Sun,  8 Jan 2023 04:31:47 +0000
Message-Id: <20230108043147.346349-1-pbrobinson@gmail.com>
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
don't make sense to be slectedable if ARCH_RENESAS isn't because
they are part of those SoCs so add a dependency and add compile
check to ensure they're still tested.

Signed-off-by: Peter Robinson <pbrobinson@gmail.com>
---
 drivers/gpu/drm/rcar-du/Kconfig | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/drivers/gpu/drm/rcar-du/Kconfig b/drivers/gpu/drm/rcar-du/Kconfig
index b2bddbeca878..4d2bff78a559 100644
--- a/drivers/gpu/drm/rcar-du/Kconfig
+++ b/drivers/gpu/drm/rcar-du/Kconfig
@@ -25,6 +25,7 @@ config DRM_RCAR_CMM
 config DRM_RCAR_DW_HDMI
 	tristate "R-Car Gen3 and RZ/G2 DU HDMI Encoder Support"
 	depends on DRM && OF
+	depends on ARCH_RENESAS || COMPILE_TEST
 	select DRM_DW_HDMI
 	help
 	  Enable support for R-Car Gen3 or RZ/G2 internal HDMI encoder.
@@ -32,6 +33,7 @@ config DRM_RCAR_DW_HDMI
 config DRM_RCAR_USE_LVDS
 	bool "R-Car DU LVDS Encoder Support"
 	depends on DRM_BRIDGE && OF
+	depends on ARCH_RENESAS || COMPILE_TEST
 	default DRM_RCAR_DU
 	help
 	  Enable support for the R-Car Display Unit embedded LVDS encoders.
@@ -45,6 +47,7 @@ config DRM_RCAR_LVDS
 config DRM_RCAR_USE_MIPI_DSI
 	bool "R-Car DU MIPI DSI Encoder Support"
 	depends on DRM_BRIDGE && OF
+	depends on ARCH_RENESAS || COMPILE_TEST
 	default DRM_RCAR_DU
 	help
 	  Enable support for the R-Car Display Unit embedded MIPI DSI encoders.
-- 
2.39.0

