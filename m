Return-Path: <dri-devel-bounces@lists.freedesktop.org>
Delivered-To: lists+dri-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id iNJZGRhrqWnH7AAAu9opvQ
	(envelope-from <dri-devel-bounces@lists.freedesktop.org>)
	for <lists+dri-devel@lfdr.de>; Thu, 05 Mar 2026 12:38:00 +0100
X-Original-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E7B11210AC4
	for <lists+dri-devel@lfdr.de>; Thu, 05 Mar 2026 12:37:59 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F3A2610E27E;
	Thu,  5 Mar 2026 11:37:57 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=lankhorst.se header.i=@lankhorst.se header.b="GmHCyAPL";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from lankhorst.se (unknown [141.105.120.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 96E9010E278;
 Thu,  5 Mar 2026 11:37:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=lankhorst.se;
 s=default; t=1772710675;
 bh=s2ekpwW+kcg1DfUIh/2SilhqwnHNZ02RMSpuVs+sGA0=;
 h=From:To:Cc:Subject:Date:From;
 b=GmHCyAPLkwCj4mesXklpEYEN+Hj2GliVyeroNk7em1qFcrUrdFS3pYNU08qq5yNGs
 47UZL1bVrFE5yLs9C2r+NOL5k03Gm/IPnJMFG+TikubBfiN8c4oGl3DcOkckud/JRV
 cMSuJbY5DRcqqXhpECkhNiax7YQstQ2vXP+XPjgBOeIKael0J6Jc3Y3pp3RmHoF9Wb
 JNSMlVy5sDhdRE/f2LmCh8B0Ul0wMrsb6lxzYi+yjjewHhjHX4lVgHb2QmPSI5aeLA
 Vwtiob5Oi2mQB2t9n1HPan6+CXqbHPUvo2O6ZcUFOqDsBILAFbCMGKm95Jd21FdIYp
 DLUSpb+b13CYQ==
From: Maarten Lankhorst <dev@lankhorst.se>
To: dri-devel@lists.freedesktop.org
Cc: intel-xe@lists.freedesktop.org, Maarten Lankhorst <dev@lankhorst.se>,
 Rob Clark <robdclark@chromium.org>, Julian Orth <ju.orth@gmail.com>,
 =?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>,
 =?UTF-8?q?Michel=20D=C3=A4nzer?= <michel.daenzer@mailbox.org>
Subject: [PATCH] Revert "drm/syncobj: Fix handle <-> fd ioctls with dirty
 stack"
Date: Thu,  5 Mar 2026 12:37:34 +0100
Message-ID: <20260305113734.1309238-1-dev@lankhorst.se>
X-Mailer: git-send-email 2.51.0
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>
X-Rspamd-Queue-Id: E7B11210AC4
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [9.69 / 15.00];
	URIBL_BLACK(7.50)[lankhorst.se:dkim,lankhorst.se:email,lankhorst.se:mid];
	SUSPICIOUS_RECIPS(1.50)[];
	MID_CONTAINS_FROM(1.00)[];
	MAILLIST(-0.20)[mailman];
	MIME_GOOD(-0.10)[text/plain];
	BAD_REP_POLICIES(0.10)[];
	RWL_MAILSPIKE_GOOD(-0.10)[131.252.210.177:from];
	HAS_LIST_UNSUB(-0.01)[];
	FROM_HAS_DN(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	R_DKIM_ALLOW(0.00)[lankhorst.se:s=default];
	GREYLIST(0.00)[pass,meta];
	MIME_TRACE(0.00)[0:+];
	ARC_NA(0.00)[];
	TO_DN_SOME(0.00)[];
	FREEMAIL_CC(0.00)[lists.freedesktop.org,lankhorst.se,chromium.org,gmail.com,amd.com,mailbox.org];
	DMARC_POLICY_ALLOW(0.00)[lankhorst.se,none];
	DKIM_TRACE(0.00)[lankhorst.se:+];
	NEURAL_HAM(-0.00)[-0.768];
	RCVD_COUNT_TWO(0.00)[2];
	FROM_NEQ_ENVFROM(0.00)[dev@lankhorst.se,dri-devel-bounces@lists.freedesktop.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[7];
	R_SPF_ALLOW(0.00)[+ip4:131.252.210.177:c];
	TAGGED_RCPT(0.00)[dri-devel];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ASN(0.00)[asn:6366, ipnet:131.252.0.0/16, country:US];
	DBL_BLOCKED_OPENRESOLVER(0.00)[gabe.freedesktop.org:rdns,gabe.freedesktop.org:helo,lankhorst.se:dkim,lankhorst.se:email,lankhorst.se:mid,amd.com:email,mailbox.org:email]
X-Rspamd-Action: add header
X-Spam: Yes

This reverts commit 2e3649e237237258a08d75afef96648dd2b379f7.

The problem occurs when userspace is compiled against new headers
with new members, but don't correctly initialise those new members.

This is not a kernel problem, and should be fixed in userspace by
correctly zero'ing all members.

Cc: Rob Clark <robdclark@chromium.org>
Cc: Julian Orth <ju.orth@gmail.com>
Cc: Christian König <christian.koenig@amd.com>
Cc: Michel Dänzer <michel.daenzer@mailbox.org>
Signed-off-by: Maarten Lankhorst <dev@lankhorst.se>
---
 drivers/gpu/drm/drm_syncobj.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/drm_syncobj.c b/drivers/gpu/drm/drm_syncobj.c
index 49eccb43ce63d..250734dee928e 100644
--- a/drivers/gpu/drm/drm_syncobj.c
+++ b/drivers/gpu/drm/drm_syncobj.c
@@ -875,7 +875,7 @@ drm_syncobj_handle_to_fd_ioctl(struct drm_device *dev, void *data,
 		return drm_syncobj_export_sync_file(file_private, args->handle,
 						    point, &args->fd);
 
-	if (point)
+	if (args->point)
 		return -EINVAL;
 
 	return drm_syncobj_handle_to_fd(file_private, args->handle,
@@ -909,7 +909,7 @@ drm_syncobj_fd_to_handle_ioctl(struct drm_device *dev, void *data,
 							  args->handle,
 							  point);
 
-	if (point)
+	if (args->point)
 		return -EINVAL;
 
 	return drm_syncobj_fd_to_handle(file_private, args->fd,
-- 
2.51.0

