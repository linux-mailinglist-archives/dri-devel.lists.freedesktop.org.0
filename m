Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id ED7C9189271
	for <lists+dri-devel@lfdr.de>; Wed, 18 Mar 2020 01:09:16 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A89426E262;
	Wed, 18 Mar 2020 00:09:12 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
X-Greylist: delayed 305 seconds by postgrey-1.36 at gabe;
 Wed, 18 Mar 2020 00:09:11 UTC
Received: from us-smtp-delivery-74.mimecast.com
 (us-smtp-delivery-74.mimecast.com [63.128.21.74])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C201B6E265
 for <dri-devel@lists.freedesktop.org>; Wed, 18 Mar 2020 00:09:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1584490150;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding;
 bh=N2Gtgkv06wnI4cyGTcKeuqfrpNMV9nZjixOcNqMDEdw=;
 b=NKoxgTc5jOICFvOD2lfWe6+buxVS7HuBSI9EQELtZ1UYzjuxwm/Sbkt7NfiCZzECe3AHYw
 18wXh/Ww4dut1ibSfFK1AUpYVl56oOST/yoaqtnGSSkqVbetLcdYL8LSk422MR0G4A2Yt3
 RlCO1F8AVasTW5SalvYUP1M+zcXsB4A=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-87-pezQ8yvvMRenOOh_kZDzdQ-1; Tue, 17 Mar 2020 20:02:56 -0400
X-MC-Unique: pezQ8yvvMRenOOh_kZDzdQ-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com
 [10.5.11.16])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 006661137842;
 Wed, 18 Mar 2020 00:02:55 +0000 (UTC)
Received: from whitewolf.redhat.com (ovpn-113-173.rdu2.redhat.com
 [10.10.113.173])
 by smtp.corp.redhat.com (Postfix) with ESMTP id D3AAD5C1BB;
 Wed, 18 Mar 2020 00:02:53 +0000 (UTC)
From: Lyude Paul <lyude@redhat.com>
To: nouveau@lists.freedesktop.org
Subject: [PATCH] drm/nouveau: Remove nouveau_bios_connector_entry()
Date: Tue, 17 Mar 2020 19:59:45 -0400
Message-Id: <20200317235946.204443-1-lyude@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
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

This function doesn't exist

Signed-off-by: Lyude Paul <lyude@redhat.com>
---
 drivers/gpu/drm/nouveau/nouveau_bios.h | 2 --
 1 file changed, 2 deletions(-)

diff --git a/drivers/gpu/drm/nouveau/nouveau_bios.h b/drivers/gpu/drm/nouveau/nouveau_bios.h
index 18eb061ccafb..5495f004a297 100644
--- a/drivers/gpu/drm/nouveau/nouveau_bios.h
+++ b/drivers/gpu/drm/nouveau/nouveau_bios.h
@@ -163,8 +163,6 @@ u8 *olddcb_conn(struct drm_device *, u8 idx);
 int nouveau_bios_init(struct drm_device *);
 void nouveau_bios_takedown(struct drm_device *dev);
 int nouveau_run_vbios_init(struct drm_device *);
-struct dcb_connector_table_entry *
-nouveau_bios_connector_entry(struct drm_device *, int index);
 bool nouveau_bios_fp_mode(struct drm_device *, struct drm_display_mode *);
 uint8_t *nouveau_bios_embedded_edid(struct drm_device *);
 int nouveau_bios_parse_lvds_table(struct drm_device *, int pxclk,
-- 
2.24.1

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
