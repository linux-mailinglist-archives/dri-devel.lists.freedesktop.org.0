Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id AFCA594A8FF
	for <lists+dri-devel@lfdr.de>; Wed,  7 Aug 2024 15:49:40 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 28C8010E522;
	Wed,  7 Aug 2024 13:49:39 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.b="Q8afEhAy";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.133.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CE17610E531
 for <dri-devel@lists.freedesktop.org>; Wed,  7 Aug 2024 13:49:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1723038577;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=vzrbNPGiVM9XAiLYV2Z4F/zW98nee/i25MdjPmBQvbo=;
 b=Q8afEhAylt0tt5vON0wR/KeDvIYaBXb6veHrakLI+VGbBeMdDPtdGm41MyWhNFlex/e7aN
 5bB8eY4UJOa6SL+L4iB0QUveqdyh7BatiHyIGTXJDDfTzbSsRS8RUtHaGFCof/8TYtRWoL
 d22hCLojd6UBTwAfYqc/9kThJyYCfDo=
Received: from mx-prod-mc-01.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-54-186-198-63.us-west-2.compute.amazonaws.com [54.186.198.63]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-398-XI4Bnp0xNPGgrQxitILvEw-1; Wed,
 07 Aug 2024 09:49:32 -0400
X-MC-Unique: XI4Bnp0xNPGgrQxitILvEw-1
Received: from mx-prod-int-04.mail-002.prod.us-west-2.aws.redhat.com
 (mx-prod-int-04.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.40])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by mx-prod-mc-01.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS
 id 7A2F7195609E; Wed,  7 Aug 2024 13:49:24 +0000 (UTC)
Received: from hydra.redhat.com (unknown [10.39.193.86])
 by mx-prod-int-04.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTP
 id ACE0819560AA; Wed,  7 Aug 2024 13:49:21 +0000 (UTC)
From: Jocelyn Falempe <jfalempe@redhat.com>
To: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>,
 Daniel Vetter <daniel@ffwll.ch>,
 Javier Martinez Canillas <javierm@redhat.com>,
 Michal Wajdeczko <michal.wajdeczko@intel.com>,
 dri-devel@lists.freedesktop.org
Cc: Jocelyn Falempe <jfalempe@redhat.com>,
 Daniel Vetter <daniel.vetter@ffwll.ch>
Subject: [PATCH v2 4/5] drm/panic: Move copyright notice to the top
Date: Wed,  7 Aug 2024 15:36:13 +0200
Message-ID: <20240807134902.458669-5-jfalempe@redhat.com>
In-Reply-To: <20240807134902.458669-1-jfalempe@redhat.com>
References: <20240807134902.458669-1-jfalempe@redhat.com>
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
Reviewed-by: Daniel Vetter <daniel.vetter@ffwll.ch>
Reviewed-by: Thomas Zimmermann <tzimmermann@suse.de>
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

