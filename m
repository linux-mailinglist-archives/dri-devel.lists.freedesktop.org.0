Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id F1BA7791202
	for <lists+dri-devel@lfdr.de>; Mon,  4 Sep 2023 09:24:36 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DD40310E2A8;
	Mon,  4 Sep 2023 07:24:31 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
X-Greylist: delayed 357 seconds by postgrey-1.36 at gabe;
 Sun, 03 Sep 2023 13:43:32 UTC
Received: from mail.astralinux.ru (mail.astralinux.ru [217.74.38.119])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A959310E0C9
 for <dri-devel@lists.freedesktop.org>; Sun,  3 Sep 2023 13:43:32 +0000 (UTC)
Received: from localhost (localhost.localdomain [127.0.0.1])
 by mail.astralinux.ru (Postfix) with ESMTP id 248D41866A1A;
 Sun,  3 Sep 2023 16:37:32 +0300 (MSK)
Received: from mail.astralinux.ru ([127.0.0.1])
 by localhost (rbta-msk-vsrv-mail01.astralinux.ru [127.0.0.1]) (amavisd-new,
 port 10032)
 with ESMTP id QQ9uYetXdeN2; Sun,  3 Sep 2023 16:37:31 +0300 (MSK)
Received: from localhost (localhost.localdomain [127.0.0.1])
 by mail.astralinux.ru (Postfix) with ESMTP id C17561866B52;
 Sun,  3 Sep 2023 16:37:31 +0300 (MSK)
X-Virus-Scanned: amavisd-new at astralinux.ru
Received: from mail.astralinux.ru ([127.0.0.1])
 by localhost (rbta-msk-vsrv-mail01.astralinux.ru [127.0.0.1]) (amavisd-new,
 port 10026)
 with ESMTP id K58ZH9uiW7iq; Sun,  3 Sep 2023 16:37:31 +0300 (MSK)
Received: from rbta-msk-lt-302690.astralinux.ru (unknown [10.177.232.241])
 by mail.astralinux.ru (Postfix) with ESMTPSA id 5E6201866A1A;
 Sun,  3 Sep 2023 16:37:30 +0300 (MSK)
From: Alexandra Diupina <adiupina@astralinux.ru>
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Subject: [PATCH] drm/rcar-du: fix comment to rcar_du_group_get()
Date: Sun,  3 Sep 2023 16:37:09 +0300
Message-Id: <20230903133709.8049-1-adiupina@astralinux.ru>
X-Mailer: git-send-email 2.30.2
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-Mailman-Approved-At: Mon, 04 Sep 2023 07:24:29 +0000
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
Cc: Alexandra Diupina <adiupina@astralinux.ru>, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, linux-renesas-soc@vger.kernel.org,
 Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>,
 Tomi Valkeinen <tomi.valkeinen+renesas@ideasonboard.com>,
 Biju Das <biju.das.jz@bp.renesas.com>, lvc-project@linuxtesting.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

rcar_du_group_get() never returns a negative
error code (always returns 0), so change
the comment about returned value

Fixes: cb2025d2509f ("drm/rcar-du: Introduce CRTCs groups")
Signed-off-by: Alexandra Diupina <adiupina@astralinux.ru>
---
 drivers/gpu/drm/renesas/rcar-du/rcar_du_group.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/renesas/rcar-du/rcar_du_group.c b/drivers/gp=
u/drm/renesas/rcar-du/rcar_du_group.c
index 2ccd2581f544..499d4e56c32d 100644
--- a/drivers/gpu/drm/renesas/rcar-du/rcar_du_group.c
+++ b/drivers/gpu/drm/renesas/rcar-du/rcar_du_group.c
@@ -200,7 +200,7 @@ static void rcar_du_group_setup(struct rcar_du_group =
*rgrp)
  *
  * This function must be called with the DRM mode_config lock held.
  *
- * Return 0 in case of success or a negative error code otherwise.
+ * Always return 0.
  */
 int rcar_du_group_get(struct rcar_du_group *rgrp)
 {
--=20
2.30.2

