Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id BB6587E12CF
	for <lists+dri-devel@lfdr.de>; Sun,  5 Nov 2023 10:32:41 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1840610E047;
	Sun,  5 Nov 2023 09:32:35 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
X-Greylist: delayed 400 seconds by postgrey-1.36 at gabe;
 Sun, 05 Nov 2023 09:32:31 UTC
Received: from mail.zeus03.de (www.zeus03.de [194.117.254.33])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9152D10E10B
 for <dri-devel@lists.freedesktop.org>; Sun,  5 Nov 2023 09:32:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 sang-engineering.com; h=from:to:cc:subject:date:message-id
 :mime-version:content-transfer-encoding; s=k1; bh=k6kq6ZSc+Pa23o
 60zfFYsZ6XKr84eY0iwg/3EIsqzOM=; b=Ry3cBfESeEaIvc0xTY5PvSkLYbJQ+G
 1hG0FS2oCto83ZTB+OanSt1srFzgE0Tpib5gSgK3OxL2+TmDjlNa4BwhscVhDB6H
 L7Qv6M86bs2aBqDZZa9p6pIf/9quiLkM9EF3EAPIE1Q9kICalF2r+hmx/eRk4zb4
 exKycFfzvTwvHpUC78R57N4zOrvkV46Q/ihGa+M8QQavavIrnOy6J9/bK5DpPFq7
 NX8d9/IUotP/SKya8aGcpyU7NTLljwWSA5sgl9xOPlsBGROy/qv6nZTbUYgbWIQu
 fgz7LhubQOG08iSdUKWBIk657unAc8j4VHpAgAUkLRZV1St87A0CaUJw==
Received: (qmail 1669474 invoked from network); 5 Nov 2023 10:25:47 +0100
Received: by mail.zeus03.de with ESMTPSA (TLS_AES_256_GCM_SHA384 encrypted,
 authenticated); 5 Nov 2023 10:25:47 +0100
X-UD-Smtp-Session: l3s3148p1@T6dzUmQJ7rIgAQnoAFPQANY41GnTzLIh
From: Wolfram Sang <wsa+renesas@sang-engineering.com>
To: linux-renesas-soc@vger.kernel.org
Subject: [PATCH v3] drm: renesas: rcar-du: use proper naming for R-Car
Date: Sun,  5 Nov 2023 10:25:39 +0100
Message-Id: <20231105092540.3658-1-wsa+renesas@sang-engineering.com>
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
Cc: Geert Uytterhoeven <geert+renesas@glider.be>, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org,
 Wolfram Sang <wsa+renesas@sang-engineering.com>,
 Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>,
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Not RCAR, but R-Car.

Signed-off-by: Wolfram Sang <wsa+renesas@sang-engineering.com>
Reviewed-by: Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>
Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>
---

Changes since v2:
* rebased to 6.6
* added Geert's tag (thanks!)

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

