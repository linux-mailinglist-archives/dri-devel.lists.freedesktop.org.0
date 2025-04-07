Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 6E3D1A7DEA7
	for <lists+dri-devel@lfdr.de>; Mon,  7 Apr 2025 15:14:08 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 35FC610E47C;
	Mon,  7 Apr 2025 13:14:05 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.b="HPsJNXX0";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.133.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2AAAB10E458
 for <dri-devel@lists.freedesktop.org>; Mon,  7 Apr 2025 13:14:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1744031638;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=9SpQQiJ63n0rLM0/lYh4xUP6SXIxDSrLe9wSuPmrOkg=;
 b=HPsJNXX03D4asq99QS+KbSKi7+6jsst4i8qjBGdnegqpHuvhQkm3Gk0SPhv3D5f3KJLg+3
 ng8MVt/nc7xdsfHe66YSutjSOaDKF9q/Oq+8iNqFBppnlg9nx02Jebj1vOZBGV32dRYd3B
 U0FtSQBpVrUESdGUPWx4pHuNbbAqhDA=
Received: from mx-prod-mc-06.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-35-165-154-97.us-west-2.compute.amazonaws.com [35.165.154.97]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-310-Iw65SczrMCSFjhWB2ohvig-1; Mon,
 07 Apr 2025 09:13:55 -0400
X-MC-Unique: Iw65SczrMCSFjhWB2ohvig-1
X-Mimecast-MFC-AGG-ID: Iw65SczrMCSFjhWB2ohvig_1744031634
Received: from mx-prod-int-03.mail-002.prod.us-west-2.aws.redhat.com
 (mx-prod-int-03.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.12])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by mx-prod-mc-06.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS
 id A41B61800258; Mon,  7 Apr 2025 13:13:53 +0000 (UTC)
Received: from hydra.redhat.com (unknown [10.45.225.175])
 by mx-prod-int-03.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTP
 id 7F14219560AD; Mon,  7 Apr 2025 13:13:50 +0000 (UTC)
From: Jocelyn Falempe <jfalempe@redhat.com>
To: Thomas Zimmermann <tzimmermann@suse.de>,
 Javier Martinez Canillas <javierm@redhat.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, David Airlie <airlied@gmail.com>,
 Simona Vetter <simona@ffwll.ch>, dri-devel@lists.freedesktop.org
Cc: Jocelyn Falempe <jfalempe@redhat.com>
Subject: [PATCH] drm/sysfb: Fix unused function simpledrm_device_of_dev()
Date: Mon,  7 Apr 2025 15:13:26 +0200
Message-ID: <20250407131344.139878-1-jfalempe@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 3.0 on 10.30.177.12
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: G9gaToCi_FNnC59J8KKezVrBcC1uW4GcTtkAptKVCjk_1744031634
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
content-type: text/plain; charset="US-ASCII"; x-default=true
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

When building with clang, with CONFIG_OF unset, I got the following
error:

drivers/gpu/drm/sysfb/simpledrm.c:247:33: error: unused function 'simpledrm_device_of_dev' [-Werror,-Wunused-function]
  247 | static struct simpledrm_device *simpledrm_device_of_dev(struct drm_device *dev)

Add #if to define the function only when needed.

Signed-off-by: Jocelyn Falempe <jfalempe@redhat.com>
Fixes: 177dfbdb7e67 ("drm/sysfb: Merge primary-plane functions")
---
 drivers/gpu/drm/sysfb/simpledrm.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/drivers/gpu/drm/sysfb/simpledrm.c b/drivers/gpu/drm/sysfb/simpledrm.c
index cfb1fe07704d..82b1a669a42e 100644
--- a/drivers/gpu/drm/sysfb/simpledrm.c
+++ b/drivers/gpu/drm/sysfb/simpledrm.c
@@ -244,10 +244,12 @@ struct simpledrm_device {
 	struct drm_connector connector;
 };
 
+#if defined CONFIG_OF && (defined CONFIG_COMMON_CLK || defined CONFIG_REGULATOR)
 static struct simpledrm_device *simpledrm_device_of_dev(struct drm_device *dev)
 {
 	return container_of(to_drm_sysfb_device(dev), struct simpledrm_device, sysfb);
 }
+#endif
 
 /*
  * Hardware

base-commit: fbe43810d563a293e3de301141d33caf1f5d5c5a
-- 
2.49.0

