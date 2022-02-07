Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 387C54ABAED
	for <lists+dri-devel@lfdr.de>; Mon,  7 Feb 2022 12:33:20 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E179C10F80C;
	Mon,  7 Feb 2022 11:33:17 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.133.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 135AF10F80C
 for <dri-devel@lists.freedesktop.org>; Mon,  7 Feb 2022 11:33:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1644233595;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=2HWpZqUfaLDy0Yn92v+Rapc9W++mbbbodtpT4t+RR6M=;
 b=KV1wd0V2dKWw3U4KOOBIsIxa3FA9IBLi/Hp9nb8BqZvTodWgUr4HLyiU0OQkl4lgwBYYnh
 LAejGzS5B51CZFPfOrbUPk1IXkONE9EYPo1eDZvTLwTryysD4oxcqEg/unGv/slIIB11pd
 XRu6NmKVvsJ4gURy1Amu4fulyzu4KpY=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-312-9gt5ZXM1MIav-CYmPH4_Jw-1; Mon, 07 Feb 2022 06:33:12 -0500
X-MC-Unique: 9gt5ZXM1MIav-CYmPH4_Jw-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com
 [10.5.11.12])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 19F6C1846103;
 Mon,  7 Feb 2022 11:33:11 +0000 (UTC)
Received: from x1.localdomain.com (unknown [10.39.194.116])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 8EE397CAD2;
 Mon,  7 Feb 2022 11:33:08 +0000 (UTC)
From: Hans de Goede <hdegoede@redhat.com>
To: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>
Subject: [PATCH] drm/privacy-screen: Fix sphinx warning
Date: Mon,  7 Feb 2022 12:33:07 +0100
Message-Id: <20220207113307.346281-1-hdegoede@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=hdegoede@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"
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
Cc: Hans de Goede <hdegoede@redhat.com>, Rajat Jain <rajatja@google.com>,
 dri-devel@lists.freedesktop.org, Stephen Rothwell <sfr@canb.auug.org.au>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Fix the following warning from "make htmldocs":

drivers/gpu/drm/drm_privacy_screen.c:392:
  warning: Function parameter or member 'data' not described in
  'drm_privacy_screen_register'

Fixes: 30598d925d46 ("drm/privacy_screen: Add drvdata in drm_privacy_screen")
Cc: Rajat Jain <rajatja@google.com>
Reported-by: Stephen Rothwell <sfr@canb.auug.org.au>
Signed-off-by: Hans de Goede <hdegoede@redhat.com>
---
 drivers/gpu/drm/drm_privacy_screen.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/gpu/drm/drm_privacy_screen.c b/drivers/gpu/drm/drm_privacy_screen.c
index 03b149cc455b..45c080134488 100644
--- a/drivers/gpu/drm/drm_privacy_screen.c
+++ b/drivers/gpu/drm/drm_privacy_screen.c
@@ -379,6 +379,7 @@ static void drm_privacy_screen_device_release(struct device *dev)
  * drm_privacy_screen_register - register a privacy-screen
  * @parent: parent-device for the privacy-screen
  * @ops: &struct drm_privacy_screen_ops pointer with ops for the privacy-screen
+ * @data: Private data owned by the privacy screen provider
  *
  * Create and register a privacy-screen.
  *
-- 
2.33.1

