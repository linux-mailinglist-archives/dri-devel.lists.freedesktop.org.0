Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 4682949CD59
	for <lists+dri-devel@lfdr.de>; Wed, 26 Jan 2022 16:11:19 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8939210E6D5;
	Wed, 26 Jan 2022 15:11:16 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.129.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7887010E6D5
 for <dri-devel@lists.freedesktop.org>; Wed, 26 Jan 2022 15:11:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1643209873;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=JU1DfdMfg4k4e+Zkle9mE1ngqvgp8qa3eDdP3CUrH3A=;
 b=WbM4X9y4KTlQ3ToTQ/VRdgdE0ov4d9Vv5KPsiTPrZ7r/iEvVrIXsZ5yDE2F3Ob1NbE4s4D
 u+Bc5zIws8WusaZrvZOdhXmukR4C3sPxkiGwMLjPOhLxUwOyeXTva8/e9Ve45BHzw/6XSE
 93xfPGQjUN29QFKZen0BW4EeF3r33GE=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-407-dUm7zD0MMme78OPTJhxK0Q-1; Wed, 26 Jan 2022 10:11:10 -0500
X-MC-Unique: dUm7zD0MMme78OPTJhxK0Q-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com
 [10.5.11.23])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id D1828100CCC3;
 Wed, 26 Jan 2022 15:11:08 +0000 (UTC)
Received: from x1.localdomain.com (unknown [10.39.195.19])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 088E623763;
 Wed, 26 Jan 2022 15:11:06 +0000 (UTC)
From: Hans de Goede <hdegoede@redhat.com>
To: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>
Subject: [PATCH] drm/privacy-screen: Fix sphinx warning
Date: Wed, 26 Jan 2022 16:11:05 +0100
Message-Id: <20220126151105.494521-1-hdegoede@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
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
Cc: Hans de Goede <hdegoede@redhat.com>, dri-devel@lists.freedesktop.org,
 Stephen Rothwell <sfr@canb.auug.org.au>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Fix the following warning from "make htmldocs":

drivers/gpu/drm/drm_privacy_screen.c:270:
 WARNING: Inline emphasis start-string without end-string.

Fixes: 8a12b170558a ("drm/privacy-screen: Add notifier support (v2)")
Reported-by: Stephen Rothwell <sfr@canb.auug.org.au>
Signed-off-by: Hans de Goede <hdegoede@redhat.com>
---
 drivers/gpu/drm/drm_privacy_screen.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/drm_privacy_screen.c b/drivers/gpu/drm/drm_privacy_screen.c
index beaf99e9120a..9f35f8f0cf60 100644
--- a/drivers/gpu/drm/drm_privacy_screen.c
+++ b/drivers/gpu/drm/drm_privacy_screen.c
@@ -269,7 +269,7 @@ EXPORT_SYMBOL(drm_privacy_screen_get_state);
  *
  * The notifier is called with no locks held. The new hw_state and sw_state
  * can be retrieved using the drm_privacy_screen_get_state() function.
- * A pointer to the drm_privacy_screen's struct is passed as the void *data
+ * A pointer to the drm_privacy_screen's struct is passed as the void \*data
  * argument of the notifier_block's notifier_call.
  *
  * The notifier will NOT be called when changes are made through
-- 
2.33.1

