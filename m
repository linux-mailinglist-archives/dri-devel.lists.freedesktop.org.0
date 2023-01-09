Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 3E16A6622A4
	for <lists+dri-devel@lfdr.de>; Mon,  9 Jan 2023 11:13:00 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 42E3D10E3AD;
	Mon,  9 Jan 2023 10:12:52 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtp-out2.suse.de (smtp-out2.suse.de [IPv6:2001:67c:2178:6::1d])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9CA7F10E3A7;
 Mon,  9 Jan 2023 10:12:47 +0000 (UTC)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out2.suse.de (Postfix) with ESMTPS id A0E3976131;
 Mon,  9 Jan 2023 10:12:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1673259165; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=k+Iby1fOAvcM85dz1sT5JfVhbtaGPyy++4NEDjlBJs8=;
 b=VjIp4fZdJjMtxKU21o33LyRMO2TH4DkU7HJYa0CSnt588MqdqOLo+TAE0yx8EacOYeKvBy
 xuxSkkIXefd5S4NjWlu372JqgE8QmT4QS8CY4nHYPQUecVfmZgWeWADjBo1wfHmYI9kZ75
 BK7feViOengUPwMGvn+nwNmJYbQvI14=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1673259165;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=k+Iby1fOAvcM85dz1sT5JfVhbtaGPyy++4NEDjlBJs8=;
 b=f8orLLlV2Fa2RC60japc7XZMIFBcUjfC352NOOs/hk8Tvc8a4kdSTFeRN3r5r0PiVKB3vE
 qMXS/8TOeZ9xlZAA==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id 4D4B413587;
 Mon,  9 Jan 2023 10:12:45 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id IIvyEZ3ou2O3EwAAMHmgww
 (envelope-from <tzimmermann@suse.de>); Mon, 09 Jan 2023 10:12:45 +0000
From: Thomas Zimmermann <tzimmermann@suse.de>
To: alexander.deucher@amd.com, christian.koenig@amd.com, airlied@gmail.com,
 daniel@ffwll.ch, maarten.lankhorst@linux.intel.com, mripard@kernel.org,
 patrik.r.jakobsson@gmail.com, thierry.reding@gmail.com, sam@ravnborg.org,
 f.fainelli@gmail.com
Subject: [PATCH 2/5] drm: Don't include linux/fb.h in drm_crtc_helper.h
Date: Mon,  9 Jan 2023 11:12:40 +0100
Message-Id: <20230109101243.26995-3-tzimmermann@suse.de>
X-Mailer: git-send-email 2.39.0
In-Reply-To: <20230109101243.26995-1-tzimmermann@suse.de>
References: <20230109101243.26995-1-tzimmermann@suse.de>
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

Including <linux/fb.h> in drm_crtc_helper.h is not required. Remove
the include statement and avoid rebuilding DRM whenever the fbdev
header changes.

Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
---
 include/drm/drm_crtc_helper.h | 2 --
 1 file changed, 2 deletions(-)

diff --git a/include/drm/drm_crtc_helper.h b/include/drm/drm_crtc_helper.h
index 1840db247f69..072bc4f90349 100644
--- a/include/drm/drm_crtc_helper.h
+++ b/include/drm/drm_crtc_helper.h
@@ -37,8 +37,6 @@
 #include <linux/types.h>
 #include <linux/idr.h>
 
-#include <linux/fb.h>
-
 #include <drm/drm_crtc.h>
 #include <drm/drm_modeset_helper_vtables.h>
 #include <drm/drm_modeset_helper.h>
-- 
2.39.0

