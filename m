Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 4DD50717BB0
	for <lists+dri-devel@lfdr.de>; Wed, 31 May 2023 11:21:29 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9BC2D10E499;
	Wed, 31 May 2023 09:21:26 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.129.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5978E10E499
 for <dri-devel@lists.freedesktop.org>; Wed, 31 May 2023 09:21:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1685524880;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=C6sAamtTrdn9+0sMLnBgct8kw7MZhUdQyRxPJii1KDY=;
 b=HK+tQZURHrndOwGQ/BKtouiwl6J+3zcHOcPDS/S324PZLKlSLeR5CzB68iln9/3fO7gYvx
 +hpbCn1yiPAeFcUh+stgkIwIGwKuLaewFQo239OmU24vqF5lzmSuMv7ig9LW0bgB8Tlf2s
 JbPpKL6Fol7MJbBAxQpwvhKqGjz5nyM=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-549-CbB-Yp2vOE-3dvFZlt704Q-1; Wed, 31 May 2023 05:21:17 -0400
X-MC-Unique: CbB-Yp2vOE-3dvFZlt704Q-1
Received: from smtp.corp.redhat.com (int-mx09.intmail.prod.int.rdu2.redhat.com
 [10.11.54.9])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 60170811E7F;
 Wed, 31 May 2023 09:21:17 +0000 (UTC)
Received: from hydra.redhat.com (unknown [10.39.193.167])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 4B05F492B00;
 Wed, 31 May 2023 09:21:16 +0000 (UTC)
From: Jocelyn Falempe <jfalempe@redhat.com>
To: dri-devel@lists.freedesktop.org, tzimmermann@suse.de, airlied@redhat.com,
 javierm@redhat.com, lyude@redhat.com
Subject: [PATCH v2 1/4] drm/mgag200: Rename constant MGAREG_Status to
 MGAREG_STATUS
Date: Wed, 31 May 2023 11:21:07 +0200
Message-Id: <20230531092110.140564-2-jfalempe@redhat.com>
In-Reply-To: <20230531092110.140564-1-jfalempe@redhat.com>
References: <20230531092110.140564-1-jfalempe@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.9
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"; x-default=true
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
Cc: Gerd Hoffmann <kraxel@redhat.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: Thomas Zimmermann <tzimmermann@suse.de>

Register constants are upper case. Fix MGAREG_Status accordingly.

Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
Reviewed-by: Gerd Hoffmann <kraxel@redhat.com>
---
 drivers/gpu/drm/mgag200/mgag200_mode.c | 6 +++---
 drivers/gpu/drm/mgag200/mgag200_reg.h  | 2 +-
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/drivers/gpu/drm/mgag200/mgag200_mode.c b/drivers/gpu/drm/mgag200/mgag200_mode.c
index 0a5aaf78172a..9a24b9c00745 100644
--- a/drivers/gpu/drm/mgag200/mgag200_mode.c
+++ b/drivers/gpu/drm/mgag200/mgag200_mode.c
@@ -109,12 +109,12 @@ static inline void mga_wait_vsync(struct mga_device *mdev)
 	unsigned int status = 0;
 
 	do {
-		status = RREG32(MGAREG_Status);
+		status = RREG32(MGAREG_STATUS);
 	} while ((status & 0x08) && time_before(jiffies, timeout));
 	timeout = jiffies + HZ/10;
 	status = 0;
 	do {
-		status = RREG32(MGAREG_Status);
+		status = RREG32(MGAREG_STATUS);
 	} while (!(status & 0x08) && time_before(jiffies, timeout));
 }
 
@@ -123,7 +123,7 @@ static inline void mga_wait_busy(struct mga_device *mdev)
 	unsigned long timeout = jiffies + HZ;
 	unsigned int status = 0;
 	do {
-		status = RREG8(MGAREG_Status + 2);
+		status = RREG8(MGAREG_STATUS + 2);
 	} while ((status & 0x01) && time_before(jiffies, timeout));
 }
 
diff --git a/drivers/gpu/drm/mgag200/mgag200_reg.h b/drivers/gpu/drm/mgag200/mgag200_reg.h
index 1019ffd6c260..aa73463674e4 100644
--- a/drivers/gpu/drm/mgag200/mgag200_reg.h
+++ b/drivers/gpu/drm/mgag200/mgag200_reg.h
@@ -102,7 +102,7 @@
 #define MGAREG_EXEC		0x0100
 
 #define	MGAREG_FIFOSTATUS	0x1e10
-#define	MGAREG_Status		0x1e14
+#define	MGAREG_STATUS		0x1e14
 #define MGAREG_CACHEFLUSH       0x1fff
 #define	MGAREG_ICLEAR		0x1e18
 #define	MGAREG_IEN		0x1e1c

base-commit: 457391b0380335d5e9a5babdec90ac53928b23b4
-- 
2.40.1

