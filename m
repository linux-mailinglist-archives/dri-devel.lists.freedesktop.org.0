Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A49D3C0BBA5
	for <lists+dri-devel@lfdr.de>; Mon, 27 Oct 2025 04:17:21 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 84F9F10E0C4;
	Mon, 27 Oct 2025 03:17:18 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=qq.com header.i=@qq.com header.b="h6B3yviX";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from out162-62-57-49.mail.qq.com (out162-62-57-49.mail.qq.com
 [162.62.57.49])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B49E510E0C4
 for <dri-devel@lists.freedesktop.org>; Mon, 27 Oct 2025 03:17:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qq.com; s=s201512;
 t=1761535032; bh=stzLUCzkNul917MZrE2iPdNYMyfJtsDmIaIrJi019dU=;
 h=From:To:Subject:Date;
 b=h6B3yviXXsr7JXmfZKLUzYL3/jHm6GX8Zk1NhayJ2XLjn5qIkeRo3mDWfDuc+eHOb
 5c0cGp2e14kKj8r5tes2oG5I3316TwisGJPWdCrmkbKpBGj5eipvokorLi2OO104YH
 EIOASxPB88G6wR3L0UjZdbJQljhVdSpKQ0Xs6kLA=
Received: from localhost.localdomain ([116.128.244.169])
 by newxmesmtplogicsvrsza56-0.qq.com (NewEsmtp) with SMTP
 id 432814DC; Mon, 27 Oct 2025 11:16:50 +0800
X-QQ-mid: xmsmtpt1761535010tc43gqnxb
Message-ID: <tencent_7EF61E8ABB90946288975CE501E2D9673C06@qq.com>
X-QQ-XMAILINFO: NT7uTz3cNku2RAwtjD01Dg9EHTOB2Zs5/YqmsPo6Nb0B+uQFHuK5AmfdOpIZYu
 CkmWOC+JYFlzjQOSkcgABqjLsp2BrHKo6orYs0fCUVOCXTTqkM5y9SbdMeymoXmQIF9v6pPEz/P9
 vt7LrzJEvfMrfigjBuf9izWLliwgLslRIuXkC5z2lc4AA3VrcIzDUaWZXThvWWuTfNrmH/b9X0uB
 DCRNlmUqbZPGJzDSqtEwG5xpGRxsVxOUVAjEZ6pVZqIUfsPhOTHVaTdWO3lrPb9y+IQbjzxvwA8l
 yeVdfsy1N60ujFN60nBJQMLqcCXDNRhAIwXF/eR+lt+qvYbsjGRWN15ldBigY9qtzTLKwvTmlmkR
 S+XxMzJwmv/20dHrGhZNY8+3FW/qama2ZpvToX5oLcsDUI8nJILOHMxYvtf6FYTprhFF50xAsgyl
 nFSCEGLH4rXpXJPy501eyx2zkGI/35Wq47sBfzV55LSJrgngaiD2dFrLQIbc5pa+q/kgbSxh3Qrs
 IrfduILRDOmuvJ7fnDzk27yQxH4oCa2GZ43EE+mP0KIPaMNEUtm+1Xy5r9TT002W612AmB1LPG/n
 sV+IRazOsaV7RqCp6dHfgGjJiBSGze79BM4JjqcwU6YPKIntl4W1ZGr0UepRZshDjPbO5WBp/wkA
 g8+wEfn/9YvlHH2WqKauE5AGUkF93FsiMxv8E2Cl+A1ObxvDJ4I8hhiJfKMaMUKAQqa0aVGryxPW
 vUPrYnpq7B61u39E6zCccoeZEfuHCKF7L/WD9Va5b8iM1oh/skaNk+/039O0wT86mIhzlTDTA+6n
 SkKRf+rKzk7KCj78L12TcuZJXfW8r9//39aQl3a8v1/xHsa21mgqVmhYm50SzXxRLNDBp7WS+ipt
 2W8kLskP3M8pqj9qAPJGq983rLCR56LwCA+Gq2e9igU3degeLC8mB4uJ1lLM9t5iXmWLRIAlCc0a
 WPbthhwS/vtteXameW50fmZeAfGSjUJ5w31s9RIcoNywejtD53r1Uh9eycrRbHVuUQc/6zUsiL95
 5/TIglXwoSLGcXv33LhZQIrWoXRig=
X-QQ-XMRINFO: NI4Ajvh11aEj8Xl/2s1/T8w=
From: 2564278112@qq.com
To: lyude@redhat.com, dakr@kernel.org, maarten.lankhorst@linux.intel.com,
 mripard@kernel.org, tzimmermann@suse.de, airlie@gmail.com, simona@ffwll.ch,
 dri-devel@lists.freedesktop.org, nouveau@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, jiangwang@kylinos.cn
Subject: [PATCH] drm/nouveau: Resolve the issue of VGA not detecting
 disconnection
Date: Mon, 27 Oct 2025 11:16:48 +0800
X-OQ-MSGID: <20251027031648.73856-1-2564278112@qq.com>
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

