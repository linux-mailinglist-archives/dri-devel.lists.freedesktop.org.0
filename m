Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C2CE87FB87F
	for <lists+dri-devel@lfdr.de>; Tue, 28 Nov 2023 11:47:54 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 408AA10E4C6;
	Tue, 28 Nov 2023 10:47:50 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.223.130])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C1E7E10E4B7
 for <dri-devel@lists.freedesktop.org>; Tue, 28 Nov 2023 10:47:29 +0000 (UTC)
Received: from imap2.dmz-prg2.suse.org (imap2.dmz-prg2.suse.org [10.150.64.98])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by smtp-out1.suse.de (Postfix) with ESMTPS id 71C4D21993;
 Tue, 28 Nov 2023 10:47:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1701168448; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=Xp0/n3rAzJHsgt84dqyPYq0k4jUW2xjL1Cp74rO1uao=;
 b=Y7Z4Ij/DbAJGVhlUr73ASmIr0hne5iSuVGFq0HiHXUn7c+YHPb2RoqSepANwqfpv4vk8LV
 fXNHfPCV6NiBFCfhuh0ZrFl4RgvGzC15vtuxeRWwimAjDZCp9iDtCawrnkAzuG0FFg7ovX
 1gBYaMw+l+YaBurXJdXU0uKVoqHHsUc=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1701168448;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=Xp0/n3rAzJHsgt84dqyPYq0k4jUW2xjL1Cp74rO1uao=;
 b=n+09wQdViPHcI+CHLduBpochOKwVvmAxyp2BkKI8xPQkQK+wSA0CWkmtHbUnPfUjfQMQ4x
 2ZfQENfelXItGvCA==
Received: from imap2.dmz-prg2.suse.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by imap2.dmz-prg2.suse.org (Postfix) with ESMTPS id 277FD139FC;
 Tue, 28 Nov 2023 10:47:28 +0000 (UTC)
Received: from dovecot-director2.suse.de ([10.150.64.162])
 by imap2.dmz-prg2.suse.org with ESMTPSA id CKiSCEDFZWXpagAAn2gu4w
 (envelope-from <tzimmermann@suse.de>); Tue, 28 Nov 2023 10:47:28 +0000
From: Thomas Zimmermann <tzimmermann@suse.de>
To: mripard@kernel.org, maarten.lankhorst@linux.intel.com, daniel@ffwll.ch,
 airlied@gmail.com, suijingfeng@loongson.cn
Subject: [PATCH 8/8] drm/xlnx: Do not include <drm/drm_plane_helper.h>
Date: Tue, 28 Nov 2023 11:45:24 +0100
Message-ID: <20231128104723.20622-9-tzimmermann@suse.de>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20231128104723.20622-1-tzimmermann@suse.de>
References: <20231128104723.20622-1-tzimmermann@suse.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Flag: NO
Authentication-Results: smtp-out1.suse.de;
	none
X-Spam-Score: 4.29
X-Spam-Level: ****
X-Spamd-Result: default: False [4.29 / 50.00]; ARC_NA(0.00)[];
 RCVD_VIA_SMTP_AUTH(0.00)[]; FROM_HAS_DN(0.00)[];
 TO_DN_SOME(0.00)[]; FREEMAIL_ENVRCPT(0.00)[gmail.com];
 R_MISSING_CHARSET(2.50)[]; MIME_GOOD(-0.10)[text/plain];
 TO_MATCH_ENVRCPT_ALL(0.00)[]; BROKEN_CONTENT_TYPE(1.50)[];
 NEURAL_HAM_LONG(-0.41)[-0.413];
 R_RATELIMIT(0.00)[to_ip_from(RL9pqk354j4esf7wsagg6iyf8a)];
 RCVD_COUNT_THREE(0.00)[3];
 DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
 NEURAL_HAM_SHORT(-0.20)[-1.000]; RCPT_COUNT_TWELVE(0.00)[12];
 MID_CONTAINS_FROM(1.00)[];
 DBL_BLOCKED_OPENRESOLVER(0.00)[suse.de:email];
 FREEMAIL_TO(0.00)[kernel.org,linux.intel.com,ffwll.ch,gmail.com,loongson.cn]; 
 FUZZY_BLOCKED(0.00)[rspamd.com]; FROM_EQ_ENVFROM(0.00)[];
 MIME_TRACE(0.00)[0:+]; RCVD_TLS_ALL(0.00)[];
 BAYES_HAM(-0.00)[39.89%]
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
Cc: dri-devel@lists.freedesktop.org, javierm@redhat.com,
 amd-gfx@lists.freedesktop.org, linux-renesas-soc@vger.kernel.org,
 laurent.pinchart@ideasonboard.com, Thomas Zimmermann <tzimmermann@suse.de>,
 linux-arm-kernel@lists.infradead.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Remove unnecessary include statements for <drm/drm_plane_helper.h>.
The file contains helpers for non-atomic code and should not be
required by most drivers. No functional changes.

Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
---
 drivers/gpu/drm/xlnx/zynqmp_kms.c | 1 -
 1 file changed, 1 deletion(-)

diff --git a/drivers/gpu/drm/xlnx/zynqmp_kms.c b/drivers/gpu/drm/xlnx/zynqmp_kms.c
index a7f8611be6f42..db3bb4afbfc46 100644
--- a/drivers/gpu/drm/xlnx/zynqmp_kms.c
+++ b/drivers/gpu/drm/xlnx/zynqmp_kms.c
@@ -27,7 +27,6 @@
 #include <drm/drm_managed.h>
 #include <drm/drm_mode_config.h>
 #include <drm/drm_plane.h>
-#include <drm/drm_plane_helper.h>
 #include <drm/drm_probe_helper.h>
 #include <drm/drm_simple_kms_helper.h>
 #include <drm/drm_vblank.h>
-- 
2.43.0

