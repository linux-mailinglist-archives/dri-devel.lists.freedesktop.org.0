Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 9851594A8FB
	for <lists+dri-devel@lfdr.de>; Wed,  7 Aug 2024 15:49:27 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CCEF710E523;
	Wed,  7 Aug 2024 13:49:25 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.b="FOoGjA0a";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.133.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4F56910E522
 for <dri-devel@lists.freedesktop.org>; Wed,  7 Aug 2024 13:49:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1723038563;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=B09kSIbYSApgPI0VjEak3TdklWaHKDsh4z8WexGbhwU=;
 b=FOoGjA0aw/eqP+6NN/bMssZmS5Gu7BGhiAsWD0yOD7do/8+StUDvyaKyNQRnvdf5wWgh5R
 DOofhSCJifKvmplrP/U2jRfD8zk3fXMFlul+GHhNXY+sGa8UxSRlMsmLQSsDItsYNg6SuX
 kQrvbHfgzATXp7Tf7PIqeltrGFjLoVU=
Received: from mx-prod-mc-02.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-54-186-198-63.us-west-2.compute.amazonaws.com [54.186.198.63]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-548-0-1MwgaHNfqXutWNZ9pOrQ-1; Wed,
 07 Aug 2024 09:49:17 -0400
X-MC-Unique: 0-1MwgaHNfqXutWNZ9pOrQ-1
Received: from mx-prod-int-04.mail-002.prod.us-west-2.aws.redhat.com
 (mx-prod-int-04.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.40])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by mx-prod-mc-02.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS
 id E44C61955D63; Wed,  7 Aug 2024 13:49:14 +0000 (UTC)
Received: from hydra.redhat.com (unknown [10.39.193.86])
 by mx-prod-int-04.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTP
 id D7C3219560AE; Wed,  7 Aug 2024 13:49:11 +0000 (UTC)
From: Jocelyn Falempe <jfalempe@redhat.com>
To: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>,
 Daniel Vetter <daniel@ffwll.ch>,
 Javier Martinez Canillas <javierm@redhat.com>,
 Michal Wajdeczko <michal.wajdeczko@intel.com>,
 dri-devel@lists.freedesktop.org
Cc: Jocelyn Falempe <jfalempe@redhat.com>, Diego Viola <diego.viola@gmail.com>,
 Daniel Vetter <daniel.vetter@ffwll.ch>
Subject: [PATCH v2 1/5] drm/panic: Remove space before "!" in panic message
Date: Wed,  7 Aug 2024 15:36:10 +0200
Message-ID: <20240807134902.458669-2-jfalempe@redhat.com>
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

There is no space between the last word, and the punctuation mark in
English.

Suggested-by: Diego Viola <diego.viola@gmail.com>
Signed-off-by: Jocelyn Falempe <jfalempe@redhat.com>
Reviewed-by: Daniel Vetter <daniel.vetter@ffwll.ch>
Reviewed-by: Thomas Zimmermann <tzimmermann@suse.de>
---
 drivers/gpu/drm/drm_panic.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/drm_panic.c b/drivers/gpu/drm/drm_panic.c
index 072752b658f0..5e873469856f 100644
--- a/drivers/gpu/drm/drm_panic.c
+++ b/drivers/gpu/drm/drm_panic.c
@@ -78,7 +78,7 @@ struct drm_panic_line {
 #define PANIC_LINE(s) {.len = sizeof(s) - 1, .txt = s}
 
 static struct drm_panic_line panic_msg[] = {
-	PANIC_LINE("KERNEL PANIC !"),
+	PANIC_LINE("KERNEL PANIC!"),
 	PANIC_LINE(""),
 	PANIC_LINE("Please reboot your computer."),
 };
-- 
2.45.2

