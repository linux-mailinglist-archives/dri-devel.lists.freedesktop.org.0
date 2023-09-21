Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 6A1A57A94DB
	for <lists+dri-devel@lfdr.de>; Thu, 21 Sep 2023 15:35:13 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 747BD10E100;
	Thu, 21 Sep 2023 13:35:11 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
X-Greylist: delayed 400 seconds by postgrey-1.36 at gabe;
 Thu, 21 Sep 2023 13:35:09 UTC
Received: from mail.zeus03.de (www.zeus03.de [194.117.254.33])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6D9AC10E0F2
 for <dri-devel@lists.freedesktop.org>; Thu, 21 Sep 2023 13:35:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 sang-engineering.com; h=from:to:cc:subject:date:message-id
 :mime-version:content-transfer-encoding; s=k1; bh=GwO52d2vHsQuQT
 4wL7WfqPFyqFblzEe1Yqp8jz2tu34=; b=kO/2lh4yvRSIWhUjLSFBGu3e8wq+Gp
 TTRvSCfwNUeB17SKt6VBF+ufjqhYfb9XSzwGLnlqhgvZ8eIe69NPkwXX+RdSthC8
 xLxd9rmRWntb0iydI0MQSHqv7xrSTAyp+fgpsfE9gkDJR64QjY1qaU08ZMQlCKke
 5GwWNDOsP2BxyqjeN5WM1tiLBspudPzsWdD722sklenaBZxTkH+J9zHOi3UOrxjg
 3ZhY6iuhc/Kjjyu4R4IYGLc/+w4T2ZZbKCY5ipZp8v0XZjMtBJe71vw4v+yPl2LW
 F9wUU3VyxBU9rZ9OPvVycoFDdlSIxt8bHvVrC+At2MBbEUuzXArLmRBg==
Received: (qmail 963055 invoked from network); 21 Sep 2023 15:28:25 +0200
Received: by mail.zeus03.de with ESMTPSA (TLS_AES_256_GCM_SHA384 encrypted,
 authenticated); 21 Sep 2023 15:28:25 +0200
X-UD-Smtp-Session: l3s3148p1@Ivd1d94FfiQuciJ+
From: Wolfram Sang <wsa+renesas@sang-engineering.com>
To: linux-renesas-soc@vger.kernel.org
Subject: [PATCH v2] drm: renesas: rcar-du: use proper naming for R-Car
Date: Thu, 21 Sep 2023 15:28:22 +0200
Message-Id: <20230921132823.5723-1-wsa+renesas@sang-engineering.com>
X-Mailer: git-send-email 2.35.1
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
Cc: linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 Wolfram Sang <wsa+renesas@sang-engineering.com>,
 Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>,
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Not RCAR, but R-Car.

Signed-off-by: Wolfram Sang <wsa+renesas@sang-engineering.com>
Reviewed-by: Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>
---

Changes since v1:
* rebased to 6.6-rc2
* added tag from Kieran (Thanks!)

 drivers/gpu/drm/renesas/rcar-du/rcar_du_plane.h | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/renesas/rcar-du/rcar_du_plane.h b/drivers/gpu/drm/renesas/rcar-du/rcar_du_plane.h
index f9893d7d6dfc..e9e59c5e70d5 100644
--- a/drivers/gpu/drm/renesas/rcar-du/rcar_du_plane.h
+++ b/drivers/gpu/drm/renesas/rcar-du/rcar_du_plane.h
@@ -16,7 +16,7 @@ struct rcar_du_format_info;
 struct rcar_du_group;
 
 /*
- * The RCAR DU has 8 hardware planes, shared between primary and overlay planes.
+ * The R-Car DU has 8 hardware planes, shared between primary and overlay planes.
  * As using overlay planes requires at least one of the CRTCs being enabled, no
  * more than 7 overlay planes can be available. We thus create 1 primary plane
  * per CRTC and 7 overlay planes, for a total of up to 9 KMS planes.
-- 
2.35.1

