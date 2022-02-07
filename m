Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id DDF434ABEC5
	for <lists+dri-devel@lfdr.de>; Mon,  7 Feb 2022 14:04:21 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 221D210E56E;
	Mon,  7 Feb 2022 13:04:19 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.129.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4FDA110E56E
 for <dri-devel@lists.freedesktop.org>; Mon,  7 Feb 2022 13:04:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1644239056;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=KUS3n+uFvuwsI8GzzPt8M7g7KzIfkj2rMHeSXl6MRs8=;
 b=eFODT4CSxy4zhQP6W+FjVV1+OAaE7Ekydy2y7oyiZLiR5KbpJtetJWtSD8L9fbmiOOgYsX
 P1yu6VQJN63pwu0X0AnzTtYo28pzg/2YqXj+E86T31uvD0hvLee8wzj6EBHfJOQUgCSP/7
 F77p4eUUKIT5/xck6kOX6sq0+Kz03eY=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-595-YmDRYTCjMcie5xSovhuPjg-1; Mon, 07 Feb 2022 08:04:13 -0500
X-MC-Unique: YmDRYTCjMcie5xSovhuPjg-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com
 [10.5.11.22])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id AACAF100CC84;
 Mon,  7 Feb 2022 13:04:11 +0000 (UTC)
Received: from x1.localdomain.com (unknown [10.39.194.116])
 by smtp.corp.redhat.com (Postfix) with ESMTP id B73D41038AB4;
 Mon,  7 Feb 2022 13:04:08 +0000 (UTC)
From: Hans de Goede <hdegoede@redhat.com>
To: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, Simon Ser <contact@emersion.fr>
Subject: [PATCH v2] drm/privacy-screen: Fix sphinx warning
Date: Mon,  7 Feb 2022 14:04:07 +0100
Message-Id: <20220207130407.389585-1-hdegoede@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
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
Changes in v2:
- Use double backtick quotes around the "void *data" instead of using
  a backslash to escape the *
---
 drivers/gpu/drm/drm_privacy_screen.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/drm_privacy_screen.c b/drivers/gpu/drm/drm_privacy_screen.c
index beaf99e9120a..b688841c18e4 100644
--- a/drivers/gpu/drm/drm_privacy_screen.c
+++ b/drivers/gpu/drm/drm_privacy_screen.c
@@ -269,7 +269,7 @@ EXPORT_SYMBOL(drm_privacy_screen_get_state);
  *
  * The notifier is called with no locks held. The new hw_state and sw_state
  * can be retrieved using the drm_privacy_screen_get_state() function.
- * A pointer to the drm_privacy_screen's struct is passed as the void *data
+ * A pointer to the drm_privacy_screen's struct is passed as the ``void *data``
  * argument of the notifier_block's notifier_call.
  *
  * The notifier will NOT be called when changes are made through
-- 
2.33.1

