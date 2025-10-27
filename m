Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 064E3C0BB9E
	for <lists+dri-devel@lfdr.de>; Mon, 27 Oct 2025 04:14:39 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B8BAC10E03C;
	Mon, 27 Oct 2025 03:14:20 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=qq.com header.i=@qq.com header.b="okDcDPrG";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from out162-62-57-49.mail.qq.com (out162-62-57-49.mail.qq.com
 [162.62.57.49])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C39CC10E337
 for <dri-devel@lists.freedesktop.org>; Mon, 27 Oct 2025 03:14:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qq.com; s=s201512;
 t=1761534843; bh=stzLUCzkNul917MZrE2iPdNYMyfJtsDmIaIrJi019dU=;
 h=From:To:Subject:Date;
 b=okDcDPrG1ewZPUgEjwrBWKfewB1702pgoqKtdwjsLkzth6z2JDIaDgj/iFsB3kges
 OHGGlneO1c7dO2RhOQmG3EKUKMZlzK6/FNb/+B5CTL6P4JT8tm2/Ma+6dS04/IJMWb
 FYZvAlgv492o6YOp3aDrHptrrqcLlsprLZhihLBA=
Received: from localhost.localdomain ([116.128.244.169])
 by newxmesmtplogicsvrszb20-0.qq.com (NewEsmtp) with SMTP
 id 1EF3064E; Mon, 27 Oct 2025 11:07:47 +0800
X-QQ-mid: xmsmtpt1761534467txd3bei18
Message-ID: <tencent_5382628D577DA53322CAA700F6308AB29006@qq.com>
X-QQ-XMAILINFO: M2Ecasen3dvfUnuLHJcpGs0/zjsVt6LcyzyKl40UA6rlGsaXEZ9r3hGPJPtBum
 pfuwQiLtchCkCVmniWk3SJ9itZq/ecyq7UzZQwfK9X5IN37LGDZaUCBtiUTBcVpljWuqT+J2H2mM
 iSuCQH5B8ikIDypFINTNiYkuLE0NPxZTCuR0wzdTGkGGHtvrD/gBTYPUDcU9cEW4P5Drf8MGSQvb
 8cM6qWKY2Pw597xNhvIb9P3KABzo7Q3cPjvG5shtuvW/ca1CwNPxkpI3zx9wq8BPdJMh5pSFFGPX
 Wl7ziDgIt22hQihVYBbB2yHgHz2vG2B4xYxL15AEF4IzAIvsz3eMqGDSJrZos4m3QqW1ZxE1mYw0
 KFHi2wgKj7j6Yn2uSwj5a9GjzPL0XmowHnc/ZY7epx+PqWmdErlf2Wf4qwFyuIqWON1gQKvTb+Su
 cGOjS4VcppaEVGurqC2hsd0h4w+O9yRSjudst+DP7qBuTVeKXJOF8KJ+RMB/IzNS+t/1ZmkeUNKi
 GoHTSX5l9TZYqimqMGjSagSSNStKsakF7eROxeA3nmokFAdrKL2/c6jP8q1ukb237q30CTyF3Rd3
 fYiApVxszuH8Q2NOZZdkLV48jYo9Omd5/449KpYGIFnh7lIM5f+AhVkti+7TxSK6hkVL5ukVX5b0
 I481ITJxhUswc9wCWSHUUT3oYtX344tSYXt1mwMu/MSxD+66jk66PGhqh71xTgNBFJiisB+joXbz
 oDiPXzKVKYtVat4gWH9ZoKqZcacKJa/urRKiB7bfUg3QIycVBE0jUrqtfRotamkFbnk16P1/ixOa
 JJFeqZOndzcg7h1JKgJdlljwf13ahlGF6Q/HobfTCZvrKhlfPKYQqdeG944Z18y2xGXyiQ1k7kMI
 9W/VbLPZoDnpRJlYLANUEAmaMhEMO6wPrJV9ROJ6SIkKnpSrII7ZDnfjHu9cRwqRIiPG/EEB0kEZ
 8wtWVnV8r7ReD1Qkf1lg==
X-QQ-XMRINFO: OWPUhxQsoeAVDbp3OJHYyFg=
From: 2564278112@qq.com
To: lyude@redhat.com, dakr@kernel.org, maarten.lankhorst@linux.intel.com,
 mripard@kernel.org, tzimmermann@suse.de, airlie@gmail.com, simona@ffwll.ch,
 dri-devel@lists.freedesktop.org, nouveau@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, jiangwang@kylinos.cn
Subject: [PATCH] drm/nouveau: Resolve the issue of VGA not being recognized or
 disconnected
Date: Mon, 27 Oct 2025 11:07:42 +0800
X-OQ-MSGID: <20251027030742.69802-1-2564278112@qq.com>
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

