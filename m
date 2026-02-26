Return-Path: <dri-devel-bounces@lists.freedesktop.org>
Delivered-To: lists+dri-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id uCdGOQ/CoGlqmQQAu9opvQ
	(envelope-from <dri-devel-bounces@lists.freedesktop.org>)
	for <lists+dri-devel@lfdr.de>; Thu, 26 Feb 2026 22:58:39 +0100
X-Original-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 687131B01D2
	for <lists+dri-devel@lfdr.de>; Thu, 26 Feb 2026 22:58:39 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6F4E410E9EA;
	Thu, 26 Feb 2026 21:58:37 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=fail reason="signature verification failed" (2048-bit key; secure) header.d=infradead.org header.i=@infradead.org header.b="TLOugngg";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from bombadil.infradead.org (bombadil.infradead.org
 [198.137.202.133])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 898AD10E9EA
 for <dri-devel@lists.freedesktop.org>; Thu, 26 Feb 2026 21:58:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=bombadil.20210309; h=Content-Transfer-Encoding:
 MIME-Version:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:
 Content-ID:Content-Description:In-Reply-To:References;
 bh=YWXdveS3W5uaJq5mYGYCeLHABpearsvRw8je8B2ojz8=; b=TLOugngg9sHXvUxXfwmpy0Ua72
 EkCFQJgd9kDFZoujO/ulKE4j5ydMppGQHAkmKObbUEWFxPwRVSkCDbuzpy6sdFW7h4az04dWf4c2K
 qPd+wP2tMMU3iv/Tyyyj/QzAA+VgmOFNgK+mfiPPO/COdBzJhG2jcHwgd9+6W3NgqiaaZlE+r6ZpZ
 brkLk5jdHMz0hl7kvzDqvpn5OZrgHckzZUbvXHNc0mBxc5V7OqHJxj4w8iRtzy2XECXASSCCxrOFb
 PGCgMmKGwUuJCatOCVPAT3P988PIpgGdYOafV2Wn/5AO9OZ5vjOjvFl5bFeg/6VuRcZJfNPEaeFVy
 PRLpV5sg==;
Received: from [50.53.43.113] (helo=bombadil.infradead.org)
 by bombadil.infradead.org with esmtpsa (Exim 4.98.2 #2 (Red Hat Linux))
 id 1vvjNT-00000007HHz-0MGG; Thu, 26 Feb 2026 21:58:35 +0000
From: Randy Dunlap <rdunlap@infradead.org>
To: dri-devel@lists.freedesktop.org
Cc: Randy Dunlap <rdunlap@infradead.org>,
 Thierry Reding <thierry.reding@gmail.com>,
 Mikko Perttunen <mperttunen@nvidia.com>, linux-tegra@vger.kernel.org,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>,
 Simona Vetter <simona@ffwll.ch>
Subject: [PATCH] drm/tegra: tegra_drm.h: fix all uapi kernel-doc warnings
Date: Thu, 26 Feb 2026 13:58:33 -0800
Message-ID: <20260226215833.989397-1-rdunlap@infradead.org>
X-Mailer: git-send-email 2.53.0
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [3.49 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	MID_CONTAINS_FROM(1.00)[];
	R_DKIM_REJECT(1.00)[infradead.org:s=bombadil.20210309];
	R_MISSING_CHARSET(0.50)[];
	MAILLIST(-0.20)[mailman];
	R_SPF_ALLOW(-0.20)[+ip4:131.252.210.177:c];
	DMARC_POLICY_SOFTFAIL(0.10)[infradead.org : SPF not aligned (relaxed),none];
	RWL_MAILSPIKE_GOOD(-0.10)[131.252.210.177:from];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	ARC_NA(0.00)[];
	TO_DN_SOME(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	RCVD_COUNT_THREE(0.00)[3];
	MIME_TRACE(0.00)[0:+];
	FREEMAIL_CC(0.00)[infradead.org,gmail.com,nvidia.com,vger.kernel.org,linux.intel.com,kernel.org,suse.de,ffwll.ch];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[dri-devel@lists.freedesktop.org];
	FROM_NEQ_ENVFROM(0.00)[rdunlap@infradead.org,dri-devel-bounces@lists.freedesktop.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[infradead.org:-];
	NEURAL_HAM(-0.00)[-0.701];
	TAGGED_RCPT(0.00)[dri-devel];
	RCPT_COUNT_SEVEN(0.00)[10];
	ASN(0.00)[asn:6366, ipnet:131.252.0.0/16, country:US];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[ffwll.ch:email,gabe.freedesktop.org:helo,gabe.freedesktop.org:rdns,nvidia.com:email,infradead.org:mid,infradead.org:email,intel.com:email]
X-Rspamd-Queue-Id: 687131B01D2
X-Rspamd-Action: no action

Add 2 struct member descriptions and demote several comments from
"/**" kernel-doc comments to plain C "/*" comments to eliminate all
kernel-doc warnings:

Warning: include/uapi/drm/tegra_drm.h:353 struct member 'cmdbuf' not
 described in 'drm_tegra_reloc'
Warning: include/uapi/drm/tegra_drm.h:353 struct member 'target' not
 described in 'drm_tegra_reloc'

Warning: include/uapi/drm/tegra_drm.h:780 This comment starts with '/**',
 but isn't a kernel-doc comment.
 * Specify that bit 39 of the patched-in address should be set to switch
Warning: include/uapi/drm/tegra_drm.h:832 This comment starts with '/**',
 but isn't a kernel-doc comment.
 * Execute `words` words of Host1x opcodes specified in the
 `gather_data_ptr`
Warning: include/uapi/drm/tegra_drm.h:837 This comment starts with '/**',
 but isn't a kernel-doc comment.
 * Wait for a syncpoint to reach a value before continuing with further
Warning: include/uapi/drm/tegra_drm.h:842 This comment starts with '/**',
 but isn't a kernel-doc comment.
 * Wait for a syncpoint to reach a value before continuing with further

Signed-off-by: Randy Dunlap <rdunlap@infradead.org>
---
Cc: Thierry Reding <thierry.reding@gmail.com>
Cc: Mikko Perttunen <mperttunen@nvidia.com>
Cc: linux-tegra@vger.kernel.org
Cc: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>
Cc: Maxime Ripard <mripard@kernel.org>
Cc: Thomas Zimmermann <tzimmermann@suse.de>
Cc: David Airlie <airlied@gmail.com>
Cc: Simona Vetter <simona@ffwll.ch>

 include/uapi/drm/tegra_drm.h |   10 ++++++----
 1 file changed, 6 insertions(+), 4 deletions(-)

--- linux-next-20260226.orig/include/uapi/drm/tegra_drm.h
+++ linux-next-20260226/include/uapi/drm/tegra_drm.h
@@ -304,6 +304,7 @@ struct drm_tegra_cmdbuf {
  * struct drm_tegra_reloc - GEM object relocation structure
  */
 struct drm_tegra_reloc {
+	/** @cmdbuf: cmd information */
 	struct {
 		/**
 		 * @cmdbuf.handle:
@@ -321,6 +322,7 @@ struct drm_tegra_reloc {
 		 */
 		__u32 offset;
 	} cmdbuf;
+	/** @target: relocate target information */
 	struct {
 		/**
 		 * @target.handle:
@@ -777,7 +779,7 @@ struct drm_tegra_channel_unmap {
 
 /* Submission */
 
-/**
+/*
  * Specify that bit 39 of the patched-in address should be set to switch
  * swizzling between Tegra and non-Tegra sector layout on systems that store
  * surfaces in system memory in non-Tegra sector layout.
@@ -829,17 +831,17 @@ struct drm_tegra_submit_buf {
 	} reloc;
 };
 
-/**
+/*
  * Execute `words` words of Host1x opcodes specified in the `gather_data_ptr`
  * buffer. Each GATHER_UPTR command uses successive words from the buffer.
  */
 #define DRM_TEGRA_SUBMIT_CMD_GATHER_UPTR		0
-/**
+/*
  * Wait for a syncpoint to reach a value before continuing with further
  * commands.
  */
 #define DRM_TEGRA_SUBMIT_CMD_WAIT_SYNCPT		1
-/**
+/*
  * Wait for a syncpoint to reach a value before continuing with further
  * commands. The threshold is calculated relative to the start of the job.
  */
