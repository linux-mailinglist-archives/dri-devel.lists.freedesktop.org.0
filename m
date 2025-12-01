Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 98CD4C958A2
	for <lists+dri-devel@lfdr.de>; Mon, 01 Dec 2025 02:49:21 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6D82710E062;
	Mon,  1 Dec 2025 01:49:18 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=qq.com header.i=@qq.com header.b="Jx3HSriF";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from out162-62-57-64.mail.qq.com (out162-62-57-64.mail.qq.com
 [162.62.57.64])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5523510E062
 for <dri-devel@lists.freedesktop.org>; Mon,  1 Dec 2025 01:49:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qq.com; s=s201512;
 t=1764553752; bh=EwbRVh5O8zYDm77GrSE46g/cFUM+uW2lfKH1bz4YXPw=;
 h=From:To:Cc:Subject:Date;
 b=Jx3HSriFeaF/nn1MUwOO5G+faxKQ3LcvCUErvJbpCZs8wPvCDL0yjG96gww8YFZrw
 vWryxd8rmdKJQN0yhdTNaxIVorZYgz0oG9UH4QlYmX8LnU1vOl0akV9bexzebu9mXx
 I2UWreg5lHHhtk1JiFdUn8NjfS067aRxzy252wdo=
Received: from localhost.localdomain ([116.128.244.169])
 by newxmesmtplogicsvrszb51-0.qq.com (NewEsmtp) with SMTP
 id A67B906E; Mon, 01 Dec 2025 09:41:39 +0800
X-QQ-mid: xmsmtpt1764553299t3kp9bknk
Message-ID: <tencent_7431C42BA1F206D1FAF305FB068550884605@qq.com>
X-QQ-XMAILINFO: MGcJvgbhPSHvqKda8qgvU1SNZR/cbDAt5KkK+IO6+GfyhUMbUSqa6orKlRlxfa
 jJ52ppBFBRdF+98o6pLVdwSBAo6EskvAGP+c3fqej9+sGbVwH5+oWd/cXCrIcTs0emBVICTX0lyB
 K6d9mQSb5YsPXORCMo9nDoTOqVm0EPpNTQfHwl6wNtRT70uFjgW94xneCyF77IgPe/FljOLVomdC
 ZEQYub+zudNmGPgPQICG0YiqKzg8hBn3Fwk6W6lK+LnFG/ygPTcMKD6o2iBTFIl10p1kmL2S8VQT
 s7qR4EH3z+0CrXhPd0x3F3Ay3v1dbt0bW3bin8yJun+DlkowwQDwefZrNoyGs6WfAHeid3xSNrPJ
 lA6euebWveWuHbHgix70RJLOKNDwwgyi+zPAKP7YkJ8jx2wBOUOX1gxKqUnBE/Voi9Ysx3n17U1j
 HYsidoLRO5xCeCbarldfDxjnOzevQHpPVGWboP8zh1jr2CmXa51YwiydZERqlEh4hr9Og4rsX6Rm
 2du9JHHL8xbtTcDvtJ52OIwk1NNUEKU6HS5s+oGHQkpmuR3MFwR922oBbKNsOZtRCFqqvCzuKkb0
 45NDZa17tk72cANNS0KM3C1WWlM6RtFzxdDg4LRALhQNfQXRoM5fpa/oLtcSHUlshqPAFPbBtxwg
 lUOriT+et/+h5k7Aw8SRGfWROvZIjhTNkgrDFSsqYAtJjzy5zOot9l7LO26ZbZpSBSsOF261ysSE
 GLbteQPiVCNifl3/h6EkzVzIyJj6Ig/eMtgeJ7XxizyHOb9YoOi7se7uU+LfkhUhlDeSLKp6Izs4
 9BhVr8xsvz5ek9hqymsN68lfeVT9C0dimW7a54Jfl/h2E9Kz3Xyr6CWx9Iy+Ce1sTbQ2H8pqw3BL
 4vPLWr2bm2MjXOnma+0ej33+6q9yQXJCZ968iHDOduhTtWT+6+xsPARKofnK5BUWSPXP++J2AEMk
 j1mppRY6GJoRZyqrQht6fvJ2XCf4rU
X-QQ-XMRINFO: MPJ6Tf5t3I/ycC2BItcBVIA=
From: 2564278112@qq.com
To: Lyude Paul <lyude@redhat.com>, Danilo Krummrich <dakr@kernel.org>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>,
 Simona Vetter <simona@ffwll.ch>
Cc: dri-devel@lists.freedesktop.org, nouveau@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, jiangwang@kylinos.cn
Subject: [PATCH] drm/nouveau: Resolve the issue of VGA not detecting
 disconnection
Date: Mon,  1 Dec 2025 09:41:36 +0800
X-OQ-MSGID: <20251201014136.38975-1-2564278112@qq.com>
X-Mailer: git-send-email 2.25.1
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: Wang Jiang <jiangwang@kylinos.cn>

When using the GT730, I found that the VGA could recognize when it was plugged in,
but could not detect when it was disconnected.
The reason is that the polled flag for the connector is missing DRM_CONNECTOR_POLL_DISCONNECT.

Signed-off-by: Wang Jiang <jiangwang@kylinos.cn>
Reviewed-by: Thomas Zimmermann <tzimmermann@suse.de>
---
 drivers/gpu/drm/nouveau/nouveau_connector.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/nouveau/nouveau_connector.c b/drivers/gpu/drm/nouveau/nouveau_connector.c
index 63621b1510f6..dfff01edf65a 100644
--- a/drivers/gpu/drm/nouveau/nouveau_connector.c
+++ b/drivers/gpu/drm/nouveau/nouveau_connector.c
@@ -1421,7 +1421,7 @@ nouveau_connector_create(struct drm_device *dev, int index)
 	connector->doublescan_allowed = false;
 
 	drm_connector_helper_add(connector, &nouveau_connector_helper_funcs);
-	connector->polled = DRM_CONNECTOR_POLL_CONNECT;
+	connector->polled = DRM_CONNECTOR_POLL_CONNECT | DRM_CONNECTOR_POLL_DISCONNECT;
 
 	if (nvif_object_constructed(&nv_connector->conn.object)) {
 		ret = nvif_conn_event_ctor(&nv_connector->conn, "kmsHotplug",
-- 
2.25.1

