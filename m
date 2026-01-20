Return-Path: <dri-devel-bounces@lists.freedesktop.org>
Delivered-To: lists+dri-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id QH+QD/+mb2lDEgAAu9opvQ
	(envelope-from <dri-devel-bounces@lists.freedesktop.org>)
	for <lists+dri-devel@lfdr.de>; Tue, 20 Jan 2026 17:02:07 +0100
X-Original-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 09D1246FBC
	for <lists+dri-devel@lfdr.de>; Tue, 20 Jan 2026 17:02:01 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BB9D110E195;
	Tue, 20 Jan 2026 15:13:31 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=fail reason="signature verification failed" (1024-bit key; unprotected) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="BvPrt8nA";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from tor.source.kernel.org (tor.source.kernel.org [172.105.4.254])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D976710E195
 for <dri-devel@lists.freedesktop.org>; Tue, 20 Jan 2026 15:13:30 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by tor.source.kernel.org (Postfix) with ESMTP id CD3F6600CB;
 Tue, 20 Jan 2026 15:13:29 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2C1C9C19423;
 Tue, 20 Jan 2026 15:13:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
 s=korg; t=1768922009;
 bh=yQUM36/r5Ovup4YUkVc55rDGoC2Zv3mOOmLAEGO/N74=;
 h=Subject:To:Cc:From:Date:From;
 b=BvPrt8nAMMIqXPFYLXCGXjKluC+lKeJC9PnbOryOm8kmNvFWlMmKevDxbG2LPr1wG
 o5iqcFl8OobBkIHq4pxZGpS6btw0tgE/21Kq+/0id2w0JLpwehX8sAouQREAg55o0L
 143Krv8/kC5cYnQXwM/MZgCJobrmUAQfgbdiCGsw=
Subject: Patch "drm/sysfb: Remove duplicate declarations" has been added to
 the 6.18-stable tree
To: dri-devel@lists.freedesktop.org, gregkh@linuxfoundation.org,
 javierm@redhat.com, tzimmermann@suse.de
Cc: <stable-commits@vger.kernel.org>
From: <gregkh@linuxfoundation.org>
Date: Tue, 20 Jan 2026 16:09:16 +0100
Message-ID: <2026012016-prelaw-limpness-c1b3@gregkh>
MIME-Version: 1.0
Content-Type: text/plain; charset=ANSI_X3.4-1968
Content-Transfer-Encoding: 8bit
X-stable: commit
X-Patchwork-Hint: ignore 
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
X-Spamd-Result: default: False [4.99 / 15.00];
	MID_END_EQ_FROM_USER_PART(4.00)[];
	R_DKIM_REJECT(1.00)[linuxfoundation.org:s=korg];
	MID_RHS_NOT_FQDN(0.50)[];
	MAILLIST(-0.20)[mailman];
	R_SPF_ALLOW(-0.20)[+ip4:131.252.210.177:c];
	MIME_GOOD(-0.10)[text/plain];
	RWL_MAILSPIKE_GOOD(-0.10)[131.252.210.177:from];
	DMARC_POLICY_SOFTFAIL(0.10)[linuxfoundation.org : SPF not aligned (relaxed),none];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	GREYLIST(0.00)[pass,body];
	RCVD_TLS_LAST(0.00)[];
	RSPAMD_URIBL_FAIL(0.00)[suse.de:query timed out];
	MIME_TRACE(0.00)[0:+];
	ARC_NA(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[gregkh@linuxfoundation.org,dri-devel-bounces@lists.freedesktop.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCPT_COUNT_FIVE(0.00)[5];
	TAGGED_RCPT(0.00)[dri-devel];
	PREVIOUSLY_DELIVERED(0.00)[dri-devel@lists.freedesktop.org];
	TO_DN_NONE(0.00)[];
	DKIM_TRACE(0.00)[linuxfoundation.org:-];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	FROM_NO_DN(0.00)[];
	ASN(0.00)[asn:6366, ipnet:131.252.0.0/16, country:US];
	MISSING_XM_UA(0.00)[];
	RSPAMD_EMAILBL_FAIL(0.00)[dri-devel.lists.freedesktop.org:query timed out,javierm.redhat.com:query timed out];
	DBL_BLOCKED_OPENRESOLVER(0.00)[linuxfoundation.org:email,msgid.link:url,suse.de:email]
X-Rspamd-Queue-Id: 09D1246FBC
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr


This is a note to let you know that I've just added the patch titled

    drm/sysfb: Remove duplicate declarations

to the 6.18-stable tree which can be found at:
    http://www.kernel.org/git/?p=linux/kernel/git/stable/stable-queue.git;a=summary

The filename of the patch is:
     drm-sysfb-remove-duplicate-declarations.patch
and it can be found in the queue-6.18 subdirectory.

If you, or anyone else, feels it should not be added to the stable tree,
please let <stable@vger.kernel.org> know about it.


From b91a565ed14fcf900b4d95e86882b4b763860986 Mon Sep 17 00:00:00 2001
From: Thomas Zimmermann <tzimmermann@suse.de>
Date: Thu, 8 Jan 2026 15:19:46 +0100
Subject: drm/sysfb: Remove duplicate declarations

From: Thomas Zimmermann <tzimmermann@suse.de>

commit b91a565ed14fcf900b4d95e86882b4b763860986 upstream.

Commit 6046b49bafff ("drm/sysfb: Share helpers for integer validation")
and commit e8c086880b2b ("drm/sysfb: Share helpers for screen_info
validation") added duplicate function declarations. Remove the latter
ones.

Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
Fixes: e8c086880b2b ("drm/sysfb: Share helpers for screen_info validation")
Cc: Thomas Zimmermann <tzimmermann@suse.de>
Cc: Javier Martinez Canillas <javierm@redhat.com>
Cc: dri-devel@lists.freedesktop.org
Cc: <stable@vger.kernel.org> # v6.16+
Reviewed-by: Javier Martinez Canillas <javierm@redhat.com>
Link: https://patch.msgid.link/20260108145058.56943-7-tzimmermann@suse.de
Signed-off-by: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
---
 drivers/gpu/drm/sysfb/drm_sysfb_helper.h |    9 ---------
 1 file changed, 9 deletions(-)

--- a/drivers/gpu/drm/sysfb/drm_sysfb_helper.h
+++ b/drivers/gpu/drm/sysfb/drm_sysfb_helper.h
@@ -48,15 +48,6 @@ const struct drm_format_info *drm_sysfb_
 #endif
 
 /*
- * Input parsing
- */
-
-int drm_sysfb_get_validated_int(struct drm_device *dev, const char *name,
-				u64 value, u32 max);
-int drm_sysfb_get_validated_int0(struct drm_device *dev, const char *name,
-				 u64 value, u32 max);
-
-/*
  * Display modes
  */
 


Patches currently in stable-queue which might be from tzimmermann@suse.de are

queue-6.18/drm-sysfb-remove-duplicate-declarations.patch
