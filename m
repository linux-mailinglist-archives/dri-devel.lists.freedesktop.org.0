Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 30695189278
	for <lists+dri-devel@lfdr.de>; Wed, 18 Mar 2020 01:10:48 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 22A546E825;
	Wed, 18 Mar 2020 00:10:46 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-74.mimecast.com
 (us-smtp-delivery-74.mimecast.com [63.128.21.74])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4D7076E825
 for <dri-devel@lists.freedesktop.org>; Wed, 18 Mar 2020 00:10:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1584490243;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding;
 bh=HQPIeCdfVTClx20kgdMHYVnwS6rUV5YZEErwS5TMOy0=;
 b=cXgVaAB+e98qaj4TGgnX7vX6sA+C/PoFZVMruEKMjE7SwniYw7gm/JLsf3BQLrPbVfMEFX
 zE9eXIrtOdaAI75MtbB0mexCQTOrQSiWRBy0p/mKzd+Cv9SArjtrZHlOtHtHxk3zKeY4WK
 rgPzvWg0X3HbPa6vY2X5B4BEFYJiTes=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-85-jVmTE72rP-2ACgXwWWjQYg-1; Tue, 17 Mar 2020 20:04:28 -0400
X-MC-Unique: jVmTE72rP-2ACgXwWWjQYg-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com
 [10.5.11.14])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 5C398800D50;
 Wed, 18 Mar 2020 00:04:26 +0000 (UTC)
Received: from whitewolf.redhat.com (ovpn-113-173.rdu2.redhat.com
 [10.10.113.173])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 660F55D9E2;
 Wed, 18 Mar 2020 00:04:25 +0000 (UTC)
From: Lyude Paul <lyude@redhat.com>
To: nouveau@lists.freedesktop.org
Subject: [PATCH 1/2] drm/nouveau/connector: Fix indenting in
 nouveau_connector_detect()
Date: Tue, 17 Mar 2020 20:04:22 -0400
Message-Id: <20200318000423.205005-1-lyude@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
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
Cc: David Airlie <airlied@linux.ie>, dri-devel@lists.freedesktop.org,
 Ben Skeggs <bskeggs@redhat.com>, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

No functional changes

Signed-off-by: Lyude Paul <lyude@redhat.com>
---
 drivers/gpu/drm/nouveau/nouveau_connector.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/nouveau/nouveau_connector.c b/drivers/gpu/drm/nouveau/nouveau_connector.c
index 9a9a7f5003d3..0d42a7e5deff 100644
--- a/drivers/gpu/drm/nouveau/nouveau_connector.c
+++ b/drivers/gpu/drm/nouveau/nouveau_connector.c
@@ -582,7 +582,7 @@ nouveau_connector_detect(struct drm_connector *connector, bool force)
 			nv_connector->edid = drm_get_edid(connector, i2c);
 
 		drm_connector_update_edid_property(connector,
-							nv_connector->edid);
+						   nv_connector->edid);
 		if (!nv_connector->edid) {
 			NV_ERROR(drm, "DDC responded, but no EDID for %s\n",
 				 connector->name);
@@ -635,7 +635,7 @@ nouveau_connector_detect(struct drm_connector *connector, bool force)
 						encoder->helper_private;
 
 		if (helper->detect(encoder, connector) ==
-						connector_status_connected) {
+		    connector_status_connected) {
 			nouveau_connector_set_encoder(connector, nv_encoder);
 			conn_status = connector_status_connected;
 			goto out;
-- 
2.24.1

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
