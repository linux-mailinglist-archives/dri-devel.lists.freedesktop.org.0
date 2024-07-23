Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 85DDB939D61
	for <lists+dri-devel@lfdr.de>; Tue, 23 Jul 2024 11:16:40 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C13AC10E4FB;
	Tue, 23 Jul 2024 09:16:38 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.b="H2XV7Nlk";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.129.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5DA4310E4FB
 for <dri-devel@lists.freedesktop.org>; Tue, 23 Jul 2024 09:16:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1721726190;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=NCVCr9g5S6O78ocEstThgsQomHjIoELf5RRZdphKH5E=;
 b=H2XV7NlkG3IYxZPBqQF1VJL4XQ+Z6m9tgcOcHzVsqBqs9dY2ztKydB+jKUCzeKtOlft4VR
 btnyod7ZcMuGGzcnhW2h0CG6WHSeMhrg9P9EWz4rcRQSP3YhYAbwXnALVAOqJCCU86n8Hg
 1ExoCZfgecOjGj7k0WQ+4RscnM4BA7s=
Received: from mx-prod-mc-05.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-54-186-198-63.us-west-2.compute.amazonaws.com [54.186.198.63]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-395-mMiO3yCzNsm9uW0JQOMdlg-1; Tue,
 23 Jul 2024 05:16:27 -0400
X-MC-Unique: mMiO3yCzNsm9uW0JQOMdlg-1
Received: from mx-prod-int-04.mail-002.prod.us-west-2.aws.redhat.com
 (mx-prod-int-04.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.40])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by mx-prod-mc-05.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS
 id E9A871955F2B; Tue, 23 Jul 2024 09:16:25 +0000 (UTC)
Received: from hydra.redhat.com (unknown [10.39.192.165])
 by mx-prod-int-04.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTP
 id 09AC51955D45; Tue, 23 Jul 2024 09:16:22 +0000 (UTC)
From: Jocelyn Falempe <jfalempe@redhat.com>
To: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>,
 Daniel Vetter <daniel@ffwll.ch>,
 Javier Martinez Canillas <javierm@redhat.com>,
 Michal Wajdeczko <michal.wajdeczko@intel.com>,
 dri-devel@lists.freedesktop.org
Cc: Jocelyn Falempe <jfalempe@redhat.com>
Subject: [PATCH 4/5] drm/panic: Move copyright notice to the top
Date: Tue, 23 Jul 2024 11:11:33 +0200
Message-ID: <20240723091553.286844-5-jfalempe@redhat.com>
In-Reply-To: <20240723091553.286844-1-jfalempe@redhat.com>
References: <20240723091553.286844-1-jfalempe@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 3.0 on 10.30.177.40
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Move the copyright notice to the top of drm_panic.h, and add the
missing Red Hat copyright notice.

Suggested-by: Thomas Zimmermann <tzimmermann@suse.de>
Signed-off-by: Jocelyn Falempe <jfalempe@redhat.com>
---
 include/drm/drm_panic.h | 9 ++++++---
 1 file changed, 6 insertions(+), 3 deletions(-)

diff --git a/include/drm/drm_panic.h b/include/drm/drm_panic.h
index a4bd3681920d..54085d5d05c3 100644
--- a/include/drm/drm_panic.h
+++ b/include/drm/drm_panic.h
@@ -1,4 +1,10 @@
 /* SPDX-License-Identifier: GPL-2.0 or MIT */
+
+/*
+ * Copyright (c) 2024 Intel
+ * Copyright (c) 2024 Red Hat
+ */
+
 #ifndef __DRM_PANIC_H__
 #define __DRM_PANIC_H__
 
@@ -8,9 +14,6 @@
 
 #include <drm/drm_device.h>
 #include <drm/drm_fourcc.h>
-/*
- * Copyright (c) 2024 Intel
- */
 
 /**
  * struct drm_scanout_buffer - DRM scanout buffer
-- 
2.45.2

