Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 40641665C09
	for <lists+dri-devel@lfdr.de>; Wed, 11 Jan 2023 14:02:48 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4592010E73A;
	Wed, 11 Jan 2023 13:02:24 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.220.29])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5137110E726;
 Wed, 11 Jan 2023 13:02:15 +0000 (UTC)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out2.suse.de (Postfix) with ESMTPS id 2A9C777271;
 Wed, 11 Jan 2023 13:02:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1673442133; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=udTl3DM0I3j9wYNIKYaZIAJbQA2AX6jAbAF0fxPrm20=;
 b=QFWuIylFlAvgXOBPfJsrun8B+AL0Nh+mAeoURxwIgX6byrG5qUsTA8s8+T+9fYXCz4KGfh
 yKH9zS0dtv1yrcknaZsgQRIlsCw64HNJhLRNEexcVBr5qyVABi4fMIyYLQhhXTsZIRxcdl
 Hg9h3fezVRMctyYHzzOeQkG0eD9bSiA=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1673442133;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=udTl3DM0I3j9wYNIKYaZIAJbQA2AX6jAbAF0fxPrm20=;
 b=c7/xAccRAZpjo6Jsrc3E7hY7t5VfqNZAlC+VSwC0o6w0ELIR7n7dyoNa6NqjjMii+OjkF+
 Q8AK/j+O3lrccBCA==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id C92B213594;
 Wed, 11 Jan 2023 13:02:12 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id sFU9MFSzvmMaXAAAMHmgww
 (envelope-from <tzimmermann@suse.de>); Wed, 11 Jan 2023 13:02:12 +0000
From: Thomas Zimmermann <tzimmermann@suse.de>
To: alexander.deucher@amd.com, christian.koenig@amd.com, airlied@gmail.com,
 daniel@ffwll.ch, maarten.lankhorst@linux.intel.com, mripard@kernel.org,
 patrik.r.jakobsson@gmail.com, thierry.reding@gmail.com, sam@ravnborg.org,
 f.fainelli@gmail.com, james.qian.wang@arm.com, liviu.dudau@arm.com
Subject: [PATCH v2 09/10] drm/radeon: Remove trailing whitespaces
Date: Wed, 11 Jan 2023 14:02:05 +0100
Message-Id: <20230111130206.29974-10-tzimmermann@suse.de>
X-Mailer: git-send-email 2.39.0
In-Reply-To: <20230111130206.29974-1-tzimmermann@suse.de>
References: <20230111130206.29974-1-tzimmermann@suse.de>
MIME-Version: 1.0
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
Cc: dri-devel@lists.freedesktop.org, amd-gfx@lists.freedesktop.org,
 bcm-kernel-feedback-list@broadcom.com, linux-rpi-kernel@lists.infradead.org,
 Thomas Zimmermann <tzimmermann@suse.de>, linux-arm-kernel@lists.infradead.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Fix coding style. No functional changes.

Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
---
 drivers/gpu/drm/radeon/radeon_legacy_crtc.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/radeon/radeon_legacy_crtc.c b/drivers/gpu/drm/radeon/radeon_legacy_crtc.c
index 6072ed5f2dd3..648e78862d2f 100644
--- a/drivers/gpu/drm/radeon/radeon_legacy_crtc.c
+++ b/drivers/gpu/drm/radeon/radeon_legacy_crtc.c
@@ -322,7 +322,7 @@ static void radeon_crtc_dpms(struct drm_crtc *crtc, int mode)
 	 */
 	if (rdev->flags & RADEON_SINGLE_CRTC)
 		crtc_ext_cntl = RADEON_CRTC_CRT_ON;
-	
+
 	switch (mode) {
 	case DRM_MODE_DPMS_ON:
 		radeon_crtc->enabled = true;
-- 
2.39.0

