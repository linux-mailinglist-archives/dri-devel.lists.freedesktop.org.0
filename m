Return-Path: <dri-devel-bounces@lists.freedesktop.org>
Delivered-To: lists+dri-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id wEyGOtmDoWkRuAQAu9opvQ
	(envelope-from <dri-devel-bounces@lists.freedesktop.org>)
	for <lists+dri-devel@lfdr.de>; Fri, 27 Feb 2026 12:45:29 +0100
X-Original-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 4ED6F1B6B9A
	for <lists+dri-devel@lfdr.de>; Fri, 27 Feb 2026 12:45:29 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 97E3110EB12;
	Fri, 27 Feb 2026 11:45:27 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=suse.de header.i=@suse.de header.b="iZD6bhY9";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="7oltfWQe";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="wzH2Ju6e";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="zZ5I/X7d";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.223.130])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D970710EB13
 for <dri-devel@lists.freedesktop.org>; Fri, 27 Feb 2026 11:45:23 +0000 (UTC)
Received: from imap1.dmz-prg2.suse.org (unknown [10.150.64.97])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by smtp-out1.suse.de (Postfix) with ESMTPS id CAF223FA0D;
 Fri, 27 Feb 2026 11:45:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1772192721; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=oQ4MJxAiFBMTT2WRhpvYhkkq8GMFlqB1g+OQwQf5gnw=;
 b=iZD6bhY9Ndpg1j4aBvaNgqzsAN51t7V7Qs6F0tMnFl8ov1CDC3nBs9hUS+4yoPzez0X39O
 OlELi29fntQR4rQBx+Toyut4OfS+SQnSJB0/3LeMkZQQpjSowziuBrVa0lEzg2/Ma7Pa+j
 rcJ2Zlfm/KbyahB/6QxRxfLx04IZtD4=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1772192721;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=oQ4MJxAiFBMTT2WRhpvYhkkq8GMFlqB1g+OQwQf5gnw=;
 b=7oltfWQebgmBoScDrPL+L1bysSEJGsntKyTjXcSRhPhN2/+6FGblHL7UJmoLZ1EaUAsnoG
 RGPpbPHPBA1+o6Bw==
Authentication-Results: smtp-out1.suse.de;
	none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1772192719; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=oQ4MJxAiFBMTT2WRhpvYhkkq8GMFlqB1g+OQwQf5gnw=;
 b=wzH2Ju6eMv+yw+7G0m0xqJGuGTFNEXDH4TDux/t8kkLoueyJ4oUlNeYLlG+5oyQHbzDhrb
 oo7q3766HV7sY/hykHugP6xtitRdrHxR6PzmmXSK77tS4xhtRCp8TUi43Q4/IGexfsCetm
 McGeXJHSqLqwy5ATIyRKp8gGEVuYkDo=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1772192719;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=oQ4MJxAiFBMTT2WRhpvYhkkq8GMFlqB1g+OQwQf5gnw=;
 b=zZ5I/X7d2+kFUnf4Vv9m+YfYKWS9Tl3Lzvfbx0hHtLrx82QnsSpMFYKHEUfXGBGU3TntXX
 n/KvjmuazasfIKAA==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 7E7393EA69;
 Fri, 27 Feb 2026 11:45:19 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
 by imap1.dmz-prg2.suse.org with ESMTPSA id iCaxHc+DoWkvOwAAD6G6ig
 (envelope-from <tzimmermann@suse.de>); Fri, 27 Feb 2026 11:45:19 +0000
From: Thomas Zimmermann <tzimmermann@suse.de>
To: boris.brezillon@collabora.com, loic.molinari@collabora.com,
 willy@infradead.org, frank.binns@imgtec.com, matt.coster@imgtec.com,
 maarten.lankhorst@linux.intel.com, mripard@kernel.org, airlied@gmail.com,
 simona@ffwll.ch, linux-mm@kvack.org
Cc: dri-devel@lists.freedesktop.org,
	Thomas Zimmermann <tzimmermann@suse.de>
Subject: [PATCH v4 6/6] drm/gem-shmem: Track folio accessed/dirty status in
 vmap
Date: Fri, 27 Feb 2026 12:42:11 +0100
Message-ID: <20260227114509.165572-7-tzimmermann@suse.de>
X-Mailer: git-send-email 2.52.0
In-Reply-To: <20260227114509.165572-1-tzimmermann@suse.de>
References: <20260227114509.165572-1-tzimmermann@suse.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Flag: NO
X-Spam-Score: -4.36
X-Spam-Level: 
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
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [0.19 / 15.00];
	MID_CONTAINS_FROM(1.00)[];
	R_MISSING_CHARSET(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[suse.de,none];
	R_DKIM_ALLOW(-0.20)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	R_SPF_ALLOW(-0.20)[+ip4:131.252.210.177:c];
	MAILLIST(-0.20)[mailman];
	MIME_GOOD(-0.10)[text/plain];
	RWL_MAILSPIKE_GOOD(-0.10)[131.252.210.177:from];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_SENDER(0.00)[tzimmermann@suse.de,dri-devel-bounces@lists.freedesktop.org];
	RCVD_TLS_LAST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[12];
	MIME_TRACE(0.00)[0:+];
	FORGED_RECIPIENTS(0.00)[m:boris.brezillon@collabora.com,m:loic.molinari@collabora.com,m:willy@infradead.org,m:frank.binns@imgtec.com,m:matt.coster@imgtec.com,m:maarten.lankhorst@linux.intel.com,m:mripard@kernel.org,m:airlied@gmail.com,m:simona@ffwll.ch,m:linux-mm@kvack.org,m:tzimmermann@suse.de,s:lists@lfdr.de];
	FREEMAIL_TO(0.00)[collabora.com,infradead.org,imgtec.com,linux.intel.com,kernel.org,gmail.com,ffwll.ch,kvack.org];
	FORWARDED(0.00)[dri-devel@lists.freedesktop.org];
	ARC_NA(0.00)[];
	DKIM_TRACE(0.00)[suse.de:+];
	ASN(0.00)[asn:6366, ipnet:131.252.0.0/16, country:US];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	FROM_NEQ_ENVFROM(0.00)[tzimmermann@suse.de,dri-devel-bounces@lists.freedesktop.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[dri-devel@lists.freedesktop.org];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_RCPT(0.00)[dri-devel];
	DBL_BLOCKED_OPENRESOLVER(0.00)[collabora.com:email,gabe.freedesktop.org:helo,gabe.freedesktop.org:rdns]
X-Rspamd-Queue-Id: 4ED6F1B6B9A
X-Rspamd-Action: no action

On successful vmap, set the page_mark_accessed_on_put and _dirty_on_put
flags in the gem-shmem object. Signals that the contained pages require
LRU and dirty tracking when they are being released back to SHMEM. Clear
these flags on put, so that the buffer remains quiet until the next call
to vmap. There's no means of handling dirty status in vmap as there's no
write-only mapping available.

Both flags, _accessed_on_put and _dirty_on_put, have always been part of
the gem-shmem object, but never used much. So most drivers did not track
the page status correctly.

Only the v3d and imagination drivers make limited use of _dirty_on_put. In
the case of imagination, move the flag setting from init to cleanup. This
ensures writeback of modified pages but does not interfere with the
internal vmap/vunmap calls. V3d already implements this behaviour.

Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
Reviewed-by: Boris Brezillon <boris.brezillon@collabora.com> # gem-shmem
Acked-by: Frank Binns <frank.binns@imgtec.com> # imagination
Tested-by: Frank Binns <frank.binns@imgtec.com> # imagination
---
 drivers/gpu/drm/drm_gem_shmem_helper.c | 4 ++++
 drivers/gpu/drm/imagination/pvr_gem.c  | 6 ++++--
 2 files changed, 8 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/drm_gem_shmem_helper.c b/drivers/gpu/drm/drm_gem_shmem_helper.c
index 1ab2bbd3860c..4500deef4127 100644
--- a/drivers/gpu/drm/drm_gem_shmem_helper.c
+++ b/drivers/gpu/drm/drm_gem_shmem_helper.c
@@ -265,6 +265,8 @@ void drm_gem_shmem_put_pages_locked(struct drm_gem_shmem_object *shmem)
 				  shmem->pages_mark_dirty_on_put,
 				  shmem->pages_mark_accessed_on_put);
 		shmem->pages = NULL;
+		shmem->pages_mark_accessed_on_put = false;
+		shmem->pages_mark_dirty_on_put = false;
 	}
 }
 EXPORT_SYMBOL_GPL(drm_gem_shmem_put_pages_locked);
@@ -397,6 +399,8 @@ int drm_gem_shmem_vmap_locked(struct drm_gem_shmem_object *shmem,
 		} else {
 			iosys_map_set_vaddr(map, shmem->vaddr);
 			refcount_set(&shmem->vmap_use_count, 1);
+			shmem->pages_mark_accessed_on_put = true;
+			shmem->pages_mark_dirty_on_put = true;
 		}
 	}
 
diff --git a/drivers/gpu/drm/imagination/pvr_gem.c b/drivers/gpu/drm/imagination/pvr_gem.c
index 686a3fe22986..d8660d6a8e01 100644
--- a/drivers/gpu/drm/imagination/pvr_gem.c
+++ b/drivers/gpu/drm/imagination/pvr_gem.c
@@ -25,7 +25,10 @@
 
 static void pvr_gem_object_free(struct drm_gem_object *obj)
 {
-	drm_gem_shmem_object_free(obj);
+	struct drm_gem_shmem_object *shmem_obj = to_drm_gem_shmem_obj(obj);
+
+	shmem_obj->pages_mark_dirty_on_put = true;
+	drm_gem_shmem_free(shmem_obj);
 }
 
 static struct dma_buf *pvr_gem_export(struct drm_gem_object *obj, int flags)
@@ -363,7 +366,6 @@ pvr_gem_object_create(struct pvr_device *pvr_dev, size_t size, u64 flags)
 	if (IS_ERR(shmem_obj))
 		return ERR_CAST(shmem_obj);
 
-	shmem_obj->pages_mark_dirty_on_put = true;
 	shmem_obj->map_wc = !(flags & PVR_BO_CPU_CACHED);
 	pvr_obj = shmem_gem_to_pvr_gem(shmem_obj);
 	pvr_obj->flags = flags;
-- 
2.52.0

