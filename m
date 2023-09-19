Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 6EDB37A6E55
	for <lists+dri-devel@lfdr.de>; Wed, 20 Sep 2023 00:08:09 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5E94210E412;
	Tue, 19 Sep 2023 22:08:07 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.133.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A90A610E410
 for <dri-devel@lists.freedesktop.org>; Tue, 19 Sep 2023 22:07:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1695161272;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=UgxOGkaBUWbPIYLcmI3sy0E91p2GMrXjntXFP7Ao7mY=;
 b=GfaGXbL/fiSqf/sJ5vZ7ZnBhiDIY7l4q33vtAaYFhHIJvfMI6ONT26oaKZPCj++u8Hgqer
 uyyCofwUdP1CuirKqR0A/1xZrbdVscuNKlfobxcizq7zwkvIW2OVA1OfSy4B/Ejk8eRJjg
 6dHAj+1xlZQheNbvx8QtUIAdaZfVn40=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-156-2L1JG1gQPh2Knj3WzHOyag-1; Tue, 19 Sep 2023 18:07:49 -0400
X-MC-Unique: 2L1JG1gQPh2Knj3WzHOyag-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.rdu2.redhat.com
 [10.11.54.1])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 3B126801779;
 Tue, 19 Sep 2023 22:07:49 +0000 (UTC)
Received: from emerald.lyude.net (unknown [10.22.18.67])
 by smtp.corp.redhat.com (Postfix) with ESMTP id D5FE240C2064;
 Tue, 19 Sep 2023 22:07:48 +0000 (UTC)
From: Lyude Paul <lyude@redhat.com>
To: dri-devel@lists.freedesktop.org,
	nouveau@lists.freedesktop.org
Subject: [PATCH v3 44/44] drm/nouveau/kms/nv50-: disable dcb parsing
Date: Tue, 19 Sep 2023 17:56:39 -0400
Message-ID: <20230919220442.202488-45-lyude@redhat.com>
In-Reply-To: <20230919220442.202488-1-lyude@redhat.com>
References: <20230919220442.202488-1-lyude@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.1
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
Cc: Karol Herbst <kherbst@redhat.com>, Danilo Krummrich <me@dakr.org>,
 open list <linux-kernel@vger.kernel.org>, Ben Skeggs <bskeggs@redhat.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: Ben Skeggs <bskeggs@redhat.com>

- nvkm should provide all this info now
- preparation for GSP-RM

Signed-off-by: Ben Skeggs <bskeggs@redhat.com>
Reviewed-by: Lyude Paul <lyude@redhat.com>
Acked-by: Danilo Krummrich <me@dakr.org>
Signed-off-by: Lyude Paul <lyude@redhat.com>
---
 drivers/gpu/drm/nouveau/nouveau_bios.c    | 8 +++++---
 drivers/gpu/drm/nouveau/nouveau_display.c | 8 ++++----
 drivers/gpu/drm/nouveau/nvif/disp.c       | 2 +-
 3 files changed, 10 insertions(+), 8 deletions(-)

diff --git a/drivers/gpu/drm/nouveau/nouveau_bios.c b/drivers/gpu/drm/nouveau/nouveau_bios.c
index 189903b65edc9..9e878cdc8e38e 100644
--- a/drivers/gpu/drm/nouveau/nouveau_bios.c
+++ b/drivers/gpu/drm/nouveau/nouveau_bios.c
@@ -2093,9 +2093,11 @@ nouveau_bios_init(struct drm_device *dev)
 	if (!NVInitVBIOS(dev))
 		return -ENODEV;
 
-	ret = parse_dcb_table(dev, bios);
-	if (ret)
-		return ret;
+	if (drm->client.device.info.family < NV_DEVICE_INFO_V0_TESLA) {
+		ret = parse_dcb_table(dev, bios);
+		if (ret)
+			return ret;
+	}
 
 	if (!bios->major_version)	/* we don't run version 0 bios */
 		return 0;
diff --git a/drivers/gpu/drm/nouveau/nouveau_display.c b/drivers/gpu/drm/nouveau/nouveau_display.c
index 99977e5fe7161..d8c92521226d9 100644
--- a/drivers/gpu/drm/nouveau/nouveau_display.c
+++ b/drivers/gpu/drm/nouveau/nouveau_display.c
@@ -724,10 +724,10 @@ nouveau_display_create(struct drm_device *dev)
 	drm_kms_helper_poll_init(dev);
 	drm_kms_helper_poll_disable(dev);
 
-	if (nouveau_modeset != 2 && drm->vbios.dcb.entries) {
-		ret = nvif_disp_ctor(&drm->client.device, "kmsDisp", 0,
-				     &disp->disp);
-		if (ret == 0) {
+	if (nouveau_modeset != 2) {
+		ret = nvif_disp_ctor(&drm->client.device, "kmsDisp", 0, &disp->disp);
+
+		if (!ret && (disp->disp.outp_mask || drm->vbios.dcb.entries)) {
 			nouveau_display_create_properties(dev);
 			if (disp->disp.object.oclass < NV50_DISP) {
 				dev->mode_config.fb_modifiers_not_supported = true;
diff --git a/drivers/gpu/drm/nouveau/nvif/disp.c b/drivers/gpu/drm/nouveau/nvif/disp.c
index 09915f2715afd..097246e10cdb7 100644
--- a/drivers/gpu/drm/nouveau/nvif/disp.c
+++ b/drivers/gpu/drm/nouveau/nvif/disp.c
@@ -60,7 +60,7 @@ nvif_disp_ctor(struct nvif_device *device, const char *name, s32 oclass, struct
 	cid = nvif_sclass(&device->object, disps, oclass);
 	disp->object.client = NULL;
 	if (cid < 0) {
-		NVIF_ERRON(cid, &device->object, "[NEW disp%04x] not supported", oclass);
+		NVIF_DEBUG(&device->object, "[NEW disp%04x] not supported", oclass);
 		return cid;
 	}
 
-- 
2.41.0

