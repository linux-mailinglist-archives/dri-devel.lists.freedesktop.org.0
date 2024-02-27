Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E4356868F25
	for <lists+dri-devel@lfdr.de>; Tue, 27 Feb 2024 12:39:37 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 51BA010F2F9;
	Tue, 27 Feb 2024 11:39:07 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=suse.de header.i=@suse.de header.b="OnsJRYqv";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="tBwVcm6E";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="OnsJRYqv";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="tBwVcm6E";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.223.130])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 14B7810F304;
 Tue, 27 Feb 2024 11:39:04 +0000 (UTC)
Received: from imap2.dmz-prg2.suse.org (imap2.dmz-prg2.suse.org
 [IPv6:2a07:de40:b281:104:10:150:64:98])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by smtp-out1.suse.de (Postfix) with ESMTPS id A3C0022671;
 Tue, 27 Feb 2024 11:39:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1709033942; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=+me0BDLw67ndsbsjeM1XkKYm0ToICqKPaX9sSOSx+bE=;
 b=OnsJRYqvj23X0jkN1i0Mvlz6s6rrCkV3HIevgSZQFSpJQfiYs6DR8ikA+WOzeMKOopIgSk
 hiFR/5zwIbdp3VQic53MdFbUW7SCtzd71xd7da0afPOCkAe16ihF38Kz3IDAkl3R80nIuS
 gTl9lBNEqnzKz6HaIBSpBdb/EK2Xvg8=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1709033942;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=+me0BDLw67ndsbsjeM1XkKYm0ToICqKPaX9sSOSx+bE=;
 b=tBwVcm6EFquLqtUbc9X5EZZjk7oPTfe5B0PGee5ukqEUAoxfz/qMwisrz2Ho4xe7Honu8m
 oLbhP1lqUGvKFdCw==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1709033942; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=+me0BDLw67ndsbsjeM1XkKYm0ToICqKPaX9sSOSx+bE=;
 b=OnsJRYqvj23X0jkN1i0Mvlz6s6rrCkV3HIevgSZQFSpJQfiYs6DR8ikA+WOzeMKOopIgSk
 hiFR/5zwIbdp3VQic53MdFbUW7SCtzd71xd7da0afPOCkAe16ihF38Kz3IDAkl3R80nIuS
 gTl9lBNEqnzKz6HaIBSpBdb/EK2Xvg8=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1709033942;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=+me0BDLw67ndsbsjeM1XkKYm0ToICqKPaX9sSOSx+bE=;
 b=tBwVcm6EFquLqtUbc9X5EZZjk7oPTfe5B0PGee5ukqEUAoxfz/qMwisrz2Ho4xe7Honu8m
 oLbhP1lqUGvKFdCw==
Received: from imap2.dmz-prg2.suse.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by imap2.dmz-prg2.suse.org (Postfix) with ESMTPS id DCFF113ABC;
 Tue, 27 Feb 2024 11:39:01 +0000 (UTC)
Received: from dovecot-director2.suse.de ([10.150.64.162])
 by imap2.dmz-prg2.suse.org with ESMTPSA id 8OCQNNXJ3WVMUQAAn2gu4w
 (envelope-from <tzimmermann@suse.de>); Tue, 27 Feb 2024 11:39:01 +0000
From: Thomas Zimmermann <tzimmermann@suse.de>
To: daniel@ffwll.ch, airlied@gmail.com, mripard@kernel.org,
 maarten.lankhorst@linux.intel.com, christian.koenig@amd.com,
 sumit.semwal@linaro.org, dmitry.osipenko@collabora.com,
 robdclark@gmail.com, quic_abhinavk@quicinc.com,
 dmitry.baryshkov@linaro.org, sean@poorly.run,
 marijn.suijten@somainline.org, suijingfeng@loongson.cn, kherbst@redhat.com,
 lyude@redhat.com, dakr@redhat.com, airlied@redhat.com, kraxel@redhat.com,
 alexander.deucher@amd.com, Xinhui.Pan@amd.com, zack.rusin@broadcom.com,
 bcm-kernel-feedback-list@broadcom.com
Cc: dri-devel@lists.freedesktop.org, linux-arm-msm@vger.kernel.org,
 freedreno@lists.freedesktop.org, nouveau@lists.freedesktop.org,
 virtualization@lists.linux.dev, spice-devel@lists.freedesktop.org,
 amd-gfx@lists.freedesktop.org, Thomas Zimmermann <tzimmermann@suse.de>
Subject: [PATCH 08/13] drm/qxl: Acquire reservation lock in GEM pin/unpin
 callbacks
Date: Tue, 27 Feb 2024 11:14:55 +0100
Message-ID: <20240227113853.8464-9-tzimmermann@suse.de>
X-Mailer: git-send-email 2.43.2
In-Reply-To: <20240227113853.8464-1-tzimmermann@suse.de>
References: <20240227113853.8464-1-tzimmermann@suse.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Authentication-Results: smtp-out1.suse.de;
 dkim=pass header.d=suse.de header.s=susede2_rsa header.b=OnsJRYqv;
 dkim=pass header.d=suse.de header.s=susede2_ed25519 header.b=tBwVcm6E
X-Spamd-Result: default: False [1.69 / 50.00]; RCVD_VIA_SMTP_AUTH(0.00)[];
 SPAMHAUS_XBL(0.00)[2a07:de40:b281:104:10:150:64:98:from];
 TO_DN_SOME(0.00)[]; R_MISSING_CHARSET(2.50)[];
 BROKEN_CONTENT_TYPE(1.50)[];
 R_RATELIMIT(0.00)[to_ip_from(RLo3wgn6xaqcdyw4c639zmwwtu)];
 RCVD_COUNT_THREE(0.00)[3]; DKIM_TRACE(0.00)[suse.de:+];
 MX_GOOD(-0.01)[];
 FREEMAIL_TO(0.00)[ffwll.ch,gmail.com,kernel.org,linux.intel.com,amd.com,linaro.org,collabora.com,quicinc.com,poorly.run,somainline.org,loongson.cn,redhat.com,broadcom.com];
 FROM_EQ_ENVFROM(0.00)[]; MIME_TRACE(0.00)[0:+];
 BAYES_HAM(-1.00)[87.14%]; ARC_NA(0.00)[];
 R_DKIM_ALLOW(-0.20)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
 FROM_HAS_DN(0.00)[]; DWL_DNSWL_MED(-2.00)[suse.de:dkim];
 FREEMAIL_ENVRCPT(0.00)[gmail.com];
 TO_MATCH_ENVRCPT_ALL(0.00)[]; MIME_GOOD(-0.10)[text/plain];
 DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
 RCPT_COUNT_TWELVE(0.00)[30]; MID_CONTAINS_FROM(1.00)[];
 DBL_BLOCKED_OPENRESOLVER(0.00)[suse.de:dkim,suse.de:email];
 FUZZY_BLOCKED(0.00)[rspamd.com]; RCVD_TLS_ALL(0.00)[]
X-Rspamd-Server: rspamd1.dmz-prg2.suse.org
X-Spam-Score: 1.69
X-Rspamd-Queue-Id: A3C0022671
X-Spam-Level: *
X-Spam-Flag: NO
X-Spamd-Bar: +
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

Acquire the reservation lock directly in GEM pin callback. Same for
unpin. Prepares for further changes.

Dma-buf locking semantics require callers to hold the buffer's
reservation lock when invoking the pin and unpin callbacks. Prepare
qxl accordingly by pushing locking out of the implementation. A
follow-up patch will fix locking for all GEM code at once.

Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
---
 drivers/gpu/drm/qxl/qxl_prime.c | 16 ++++++++++++++--
 1 file changed, 14 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/qxl/qxl_prime.c b/drivers/gpu/drm/qxl/qxl_prime.c
index 9169c26357d36..f2646603e12eb 100644
--- a/drivers/gpu/drm/qxl/qxl_prime.c
+++ b/drivers/gpu/drm/qxl/qxl_prime.c
@@ -31,15 +31,27 @@
 int qxl_gem_prime_pin(struct drm_gem_object *obj)
 {
 	struct qxl_bo *bo = gem_to_qxl_bo(obj);
+	int r;
 
-	return qxl_bo_pin(bo);
+	r = qxl_bo_reserve(bo);
+	if (r)
+		return r;
+	r = qxl_bo_pin_locked(bo);
+	qxl_bo_unreserve(bo);
+
+	return r;
 }
 
 void qxl_gem_prime_unpin(struct drm_gem_object *obj)
 {
 	struct qxl_bo *bo = gem_to_qxl_bo(obj);
+	int r;
 
-	qxl_bo_unpin(bo);
+	r = qxl_bo_reserve(bo);
+	if (r)
+		return;
+	qxl_bo_unpin_locked(bo);
+	qxl_bo_unreserve(bo);
 }
 
 struct sg_table *qxl_gem_prime_get_sg_table(struct drm_gem_object *obj)
-- 
2.43.2

