Return-Path: <dri-devel-bounces@lists.freedesktop.org>
Delivered-To: lists+dri-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id kKFgGBSIqWki+gAAu9opvQ
	(envelope-from <dri-devel-bounces@lists.freedesktop.org>)
	for <lists+dri-devel@lfdr.de>; Thu, 05 Mar 2026 14:41:40 +0100
X-Original-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 14052212B08
	for <lists+dri-devel@lfdr.de>; Thu, 05 Mar 2026 14:41:40 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E575010EB53;
	Thu,  5 Mar 2026 13:41:37 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=suse.de header.i=@suse.de header.b="Crm1UbBk";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="5eQFPYID";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="Crm1UbBk";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="5eQFPYID";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.223.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4CD4F10EB53
 for <dri-devel@lists.freedesktop.org>; Thu,  5 Mar 2026 13:41:36 +0000 (UTC)
Received: from imap1.dmz-prg2.suse.org (unknown [10.150.64.97])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by smtp-out2.suse.de (Postfix) with ESMTPS id 5402B5BCF7;
 Thu,  5 Mar 2026 13:41:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1772718091; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=Y90tIcG/fR2FpP/Fw5x9a8sFdOFRkDnjFRWpP3z3mHM=;
 b=Crm1UbBkActPcKRpoqn2AiIuLMBQlD+lJEIZ+QpmakyJpPucMdkTz70Yl4nBZLZa7u0i1O
 hzA1+ZVlZ6MqQScTZfTdUG1/3KvbbXV4P9zcqXafWL1MMhh8LHtewKgx2o5egUHyVFXJSd
 fUFS01lyS8mFJbYKfJQPM84m5syUqxw=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1772718091;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=Y90tIcG/fR2FpP/Fw5x9a8sFdOFRkDnjFRWpP3z3mHM=;
 b=5eQFPYID8lhkFjgyFXcYE6+0iQ3TuCzGs0vZjgUXsopf65gpCNzbqBgu3kEPEsaO4q2oeH
 PGoMB6qTAZUyG5Cg==
Authentication-Results: smtp-out2.suse.de;
	none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1772718091; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=Y90tIcG/fR2FpP/Fw5x9a8sFdOFRkDnjFRWpP3z3mHM=;
 b=Crm1UbBkActPcKRpoqn2AiIuLMBQlD+lJEIZ+QpmakyJpPucMdkTz70Yl4nBZLZa7u0i1O
 hzA1+ZVlZ6MqQScTZfTdUG1/3KvbbXV4P9zcqXafWL1MMhh8LHtewKgx2o5egUHyVFXJSd
 fUFS01lyS8mFJbYKfJQPM84m5syUqxw=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1772718091;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=Y90tIcG/fR2FpP/Fw5x9a8sFdOFRkDnjFRWpP3z3mHM=;
 b=5eQFPYID8lhkFjgyFXcYE6+0iQ3TuCzGs0vZjgUXsopf65gpCNzbqBgu3kEPEsaO4q2oeH
 PGoMB6qTAZUyG5Cg==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 264623EA76;
 Thu,  5 Mar 2026 13:41:31 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
 by imap1.dmz-prg2.suse.org with ESMTPSA id AFjrBwuIqWnFQQAAD6G6ig
 (envelope-from <tzimmermann@suse.de>); Thu, 05 Mar 2026 13:41:31 +0000
From: Thomas Zimmermann <tzimmermann@suse.de>
To: zack.rusin@broadcom.com, bcm-kernel-feedback-list@broadcom.com,
 maarten.lankhorst@linux.intel.com, mripard@kernel.org
Cc: dri-devel@lists.freedesktop.org,
	Thomas Zimmermann <tzimmermann@suse.de>
Subject: [PATCH 1/3] drm/vmwgfx: Determine lock-waiting timeout from vblank
 state
Date: Thu,  5 Mar 2026 14:39:58 +0100
Message-ID: <20260305134122.246884-2-tzimmermann@suse.de>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260305134122.246884-1-tzimmermann@suse.de>
References: <20260305134122.246884-1-tzimmermann@suse.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Score: -2.79
X-Spam-Level: 
X-Spam-Flag: NO
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
X-Rspamd-Queue-Id: 14052212B08
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [0.19 / 15.00];
	MID_CONTAINS_FROM(1.00)[];
	R_MISSING_CHARSET(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[suse.de,none];
	MAILLIST(-0.20)[mailman];
	R_SPF_ALLOW(-0.20)[+ip4:131.252.210.177:c];
	R_DKIM_ALLOW(-0.20)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	RWL_MAILSPIKE_GOOD(-0.10)[131.252.210.177:from];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:zack.rusin@broadcom.com,m:bcm-kernel-feedback-list@broadcom.com,m:maarten.lankhorst@linux.intel.com,m:mripard@kernel.org,m:tzimmermann@suse.de,s:lists@lfdr.de];
	ARC_NA(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	FORWARDED(0.00)[dri-devel@lists.freedesktop.org];
	FORGED_SENDER(0.00)[tzimmermann@suse.de,dri-devel-bounces@lists.freedesktop.org];
	MIME_TRACE(0.00)[0:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCPT_COUNT_FIVE(0.00)[6];
	FORGED_SENDER_FORWARDING(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	FROM_NEQ_ENVFROM(0.00)[tzimmermann@suse.de,dri-devel-bounces@lists.freedesktop.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[suse.de:+];
	PREVIOUSLY_DELIVERED(0.00)[dri-devel@lists.freedesktop.org];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:6366, ipnet:131.252.0.0/16, country:US];
	NEURAL_HAM(-0.00)[-1.000];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[dri-devel];
	DBL_BLOCKED_OPENRESOLVER(0.00)[suse.de:dkim,suse.de:email,suse.de:mid]
X-Rspamd-Action: no action

Use the calculated duration of a frame as stored in the vblank state
for the lock-waiting timeout. Decouples the waiting from the details
of the vblank implementation. Both values should be equal.

This will be helpful for replacing vmwgfx's vblank timer with DRM's
common implementation.

Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
---
 drivers/gpu/drm/vmwgfx/vmwgfx_vkms.c | 8 ++++++--
 1 file changed, 6 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/vmwgfx/vmwgfx_vkms.c b/drivers/gpu/drm/vmwgfx/vmwgfx_vkms.c
index 5abd7f5ad2db..7862f6972512 100644
--- a/drivers/gpu/drm/vmwgfx/vmwgfx_vkms.c
+++ b/drivers/gpu/drm/vmwgfx/vmwgfx_vkms.c
@@ -516,9 +516,13 @@ vmw_vkms_set_crc_surface(struct drm_crtc *crtc,
 static inline u64
 vmw_vkms_lock_max_wait_ns(struct vmw_display_unit *du)
 {
-	s64 nsecs = ktime_to_ns(du->vkms.period_ns);
+	struct drm_crtc *crtc = &du->crtc;
+	struct drm_vblank_crtc *vblank = drm_crtc_vblank_crtc(crtc);
+
+	if (!vblank || !vblank->framedur_ns)
+		return NSEC_PER_SEC / 60; /* disabled; assume 60 Hz */
 
-	return  (nsecs > 0) ? nsecs : 16666666;
+	return vblank->framedur_ns;
 }
 
 /**
-- 
2.53.0

