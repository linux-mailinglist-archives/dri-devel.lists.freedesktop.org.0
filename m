Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id EAF5166494A
	for <lists+dri-devel@lfdr.de>; Tue, 10 Jan 2023 19:20:30 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 34B5010E13A;
	Tue, 10 Jan 2023 18:20:25 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from ams.source.kernel.org (ams.source.kernel.org [145.40.68.75])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 387B810E145
 for <dri-devel@lists.freedesktop.org>; Tue, 10 Jan 2023 18:20:20 +0000 (UTC)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ams.source.kernel.org (Postfix) with ESMTPS id AC442B81901;
 Tue, 10 Jan 2023 18:20:18 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E43DFC433EF;
 Tue, 10 Jan 2023 18:20:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
 s=korg; t=1673374817;
 bh=z2nNy7V2xDibHg1tTULdeywPbSJL51jOJhY+PHRIesk=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=xA4jirrgzekuaBPfv2uKmA89o1G8dSEKuNJUJOV6fPOqd1S6IbzV3gOh/0qoA/nJx
 aHAVaPIzqt3CKQMxP9efdlEMTXcJ4KnwK44xqGpndk4+8DxuNVYsXaDyJtlEA3bWVm
 firB9c4JetFP7vVRJcHi9Nlk/Npr1CS+OSfhSvZA=
From: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To: stable@vger.kernel.org
Subject: [PATCH 6.1 144/159] drm/plane-helper: Add the missing declaration of
 drm_atomic_state
Date: Tue, 10 Jan 2023 19:04:52 +0100
Message-Id: <20230110180023.052617144@linuxfoundation.org>
X-Mailer: git-send-email 2.39.0
In-Reply-To: <20230110180018.288460217@linuxfoundation.org>
References: <20230110180018.288460217@linuxfoundation.org>
User-Agent: quilt/0.67
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
Cc: Ma Jun <majun@amd.com>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Javier Martinez Canillas <javierm@redhat.com>, patches@lists.linux.dev,
 dri-devel@lists.freedesktop.org, Thomas Zimmermann <tzimmermann@suse.de>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: Ma Jun <majun@amd.com>

commit 4e699e34f923188175986ad8a74ab99f7034075e upstream.

Add the missing declaration of struct drm_atomic_state to fix the
compile error below:

error: 'struct drm_atomic_state' declared inside parameter
list will not be visible outside of this definition or declaration [-Werror]

Signed-off-by: Ma Jun <majun@amd.com>
Reviewed-by: Thomas Zimmermann <tzimmermann@suse.de>
Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
Fixes: 8401bd361f59 ("drm/plane-helper: Add a drm_plane_helper_atomic_check() helper")
Cc: Javier Martinez Canillas <javierm@redhat.com>
Cc: Thomas Zimmermann <tzimmermann@suse.de>
Cc: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>
Cc: Maxime Ripard <mripard@kernel.org>
Cc: David Airlie <airlied@gmail.com>
Cc: Daniel Vetter <daniel@ffwll.ch>
Cc: dri-devel@lists.freedesktop.org
Cc: <stable@vger.kernel.org> # v6.1+
Link: https://patchwork.freedesktop.org/patch/msgid/20221216030526.1335609-1-majun@amd.com
Signed-off-by: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
---
 include/drm/drm_plane_helper.h | 1 +
 1 file changed, 1 insertion(+)

diff --git a/include/drm/drm_plane_helper.h b/include/drm/drm_plane_helper.h
index ff83d2621687..3a574e8cd22f 100644
--- a/include/drm/drm_plane_helper.h
+++ b/include/drm/drm_plane_helper.h
@@ -26,6 +26,7 @@
 
 #include <linux/types.h>
 
+struct drm_atomic_state;
 struct drm_crtc;
 struct drm_framebuffer;
 struct drm_modeset_acquire_ctx;
-- 
2.39.0



