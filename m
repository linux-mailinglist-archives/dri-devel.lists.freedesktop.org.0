Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 75EF3461148
	for <lists+dri-devel@lfdr.de>; Mon, 29 Nov 2021 10:48:54 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9A6BF6EC3E;
	Mon, 29 Nov 2021 09:48:47 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.220.29])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 82D006EC31
 for <dri-devel@lists.freedesktop.org>; Mon, 29 Nov 2021 09:48:46 +0000 (UTC)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out2.suse.de (Postfix) with ESMTPS id 2F0AA1FD33;
 Mon, 29 Nov 2021 09:48:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1638179325; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=7hBK0QaaYkFaFjNRDuh1R2pqol79zjLvgj0AGGIp/Qo=;
 b=L4D1TL+EfTVcyc/aReWQ+v3REDsqInFN9m5pmSC3LaWZKyo4RaGVLvUSMGAo+pG0yHnCgo
 XhN8rsf+4bHEyXnIVi+M5sIJXFvxnCBXiYlHvdhfYtFdZSbLrbMoT/kDaJlMoFGFJ4ftq/
 wPSkL+cR0wzqcmEK+PqPiJJZ9nNjbZY=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1638179325;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=7hBK0QaaYkFaFjNRDuh1R2pqol79zjLvgj0AGGIp/Qo=;
 b=l5vgbsASG6l6z8AoiLi4qEhZWLk3PXnv3eoWpMCUmqaP11UiOA8jPTwo0NDhgfh8Se3vl1
 5/sVN96Oc7kBJoCQ==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id D8CCA13C95;
 Mon, 29 Nov 2021 09:48:44 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id sKvtM/yhpGG+YAAAMHmgww
 (envelope-from <tzimmermann@suse.de>); Mon, 29 Nov 2021 09:48:44 +0000
From: Thomas Zimmermann <tzimmermann@suse.de>
To: daniel@ffwll.ch, airlied@linux.ie, zackr@vmware.com,
 linux-graphics-maintainer@vmware.com, christian.koenig@amd.com,
 ray.huang@amd.com, mripard@kernel.org, maarten.lankhorst@linux.intel.com,
 sam@ravnborg.org
Subject: [PATCH v2 1/3] drm/ttm: Don't include drm_hashtab.h
Date: Mon, 29 Nov 2021 10:48:39 +0100
Message-Id: <20211129094841.22499-2-tzimmermann@suse.de>
X-Mailer: git-send-email 2.34.0
In-Reply-To: <20211129094841.22499-1-tzimmermann@suse.de>
References: <20211129094841.22499-1-tzimmermann@suse.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
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
Cc: Daniel Vetter <daniel.vetter@ffwll.ch>,
 Thomas Zimmermann <tzimmermann@suse.de>, dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Remove the include statement for drm_hashtab.h. It's not required
by TTM.

Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
Reviewed-by: Christian König <christian.koenig@amd.com>
Acked-by: Daniel Vetter <daniel.vetter@ffwll.ch>
---
 include/drm/ttm/ttm_bo_api.h | 1 -
 1 file changed, 1 deletion(-)

diff --git a/include/drm/ttm/ttm_bo_api.h b/include/drm/ttm/ttm_bo_api.h
index cd785cfa3123..c17b2df9178b 100644
--- a/include/drm/ttm/ttm_bo_api.h
+++ b/include/drm/ttm/ttm_bo_api.h
@@ -32,7 +32,6 @@
 #define _TTM_BO_API_H_
 
 #include <drm/drm_gem.h>
-#include <drm/drm_hashtab.h>
 #include <drm/drm_vma_manager.h>
 #include <linux/kref.h>
 #include <linux/list.h>
-- 
2.34.0

