Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id F141D939D5F
	for <lists+dri-devel@lfdr.de>; Tue, 23 Jul 2024 11:16:32 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3338310E4F5;
	Tue, 23 Jul 2024 09:16:31 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.b="QCvEPPB4";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.129.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E8E7010E4F5
 for <dri-devel@lists.freedesktop.org>; Tue, 23 Jul 2024 09:16:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1721726184;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=F57EKXk6FDu4YhRuE3Smj1gi6pv6W/J2EckcoqOPHwY=;
 b=QCvEPPB4Fpe7K2jwH+ebV5oQe5LR6qPNGgt9+OXCOlgfU494gKfTRVjnJKaFoKXzkewStM
 0NowBLURDtfXQRn77PaeZuuACH1PwEWCmxyS1D1hLi5eSfwsB/rVKS+XOlZd/ICCBW6eLp
 eTpfjy0au+Q1+SOQRzWoWlOcLL/tW6A=
Received: from mx-prod-mc-01.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-54-186-198-63.us-west-2.compute.amazonaws.com [54.186.198.63]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-113-lUgxc2qzOu2XXvAQt40W7w-1; Tue,
 23 Jul 2024 05:16:20 -0400
X-MC-Unique: lUgxc2qzOu2XXvAQt40W7w-1
Received: from mx-prod-int-04.mail-002.prod.us-west-2.aws.redhat.com
 (mx-prod-int-04.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.40])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by mx-prod-mc-01.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS
 id 0B6501955D47; Tue, 23 Jul 2024 09:16:19 +0000 (UTC)
Received: from hydra.redhat.com (unknown [10.39.192.165])
 by mx-prod-int-04.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTP
 id A7BEB1955D45; Tue, 23 Jul 2024 09:16:15 +0000 (UTC)
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
Subject: [PATCH 2/5] drm/panic: Remove useless export symbols
Date: Tue, 23 Jul 2024 11:11:31 +0200
Message-ID: <20240723091553.286844-3-jfalempe@redhat.com>
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

drm_panic_[un]register() are called only from the core drm, so there
is no need to export them.

Suggested-by: Daniel Vetter <daniel.vetter@ffwll.ch>
Signed-off-by: Jocelyn Falempe <jfalempe@redhat.com>
---
 drivers/gpu/drm/drm_panic.c | 2 --
 1 file changed, 2 deletions(-)

diff --git a/drivers/gpu/drm/drm_panic.c b/drivers/gpu/drm/drm_panic.c
index 5e873469856f..2efede7fa23a 100644
--- a/drivers/gpu/drm/drm_panic.c
+++ b/drivers/gpu/drm/drm_panic.c
@@ -752,7 +752,6 @@ void drm_panic_register(struct drm_device *dev)
 	if (registered_plane)
 		drm_info(dev, "Registered %d planes with drm panic\n", registered_plane);
 }
-EXPORT_SYMBOL(drm_panic_register);
 
 /**
  * drm_panic_unregister()
@@ -771,4 +770,3 @@ void drm_panic_unregister(struct drm_device *dev)
 		kmsg_dump_unregister(&plane->kmsg_panic);
 	}
 }
-EXPORT_SYMBOL(drm_panic_unregister);
-- 
2.45.2

