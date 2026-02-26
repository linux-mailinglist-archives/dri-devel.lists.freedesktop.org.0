Return-Path: <dri-devel-bounces@lists.freedesktop.org>
Delivered-To: lists+dri-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id k27qJAnCoGlqmQQAu9opvQ
	(envelope-from <dri-devel-bounces@lists.freedesktop.org>)
	for <lists+dri-devel@lfdr.de>; Thu, 26 Feb 2026 22:58:33 +0100
X-Original-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id BD3671B01CA
	for <lists+dri-devel@lfdr.de>; Thu, 26 Feb 2026 22:58:32 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C415010E9E1;
	Thu, 26 Feb 2026 21:58:29 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=fail reason="signature verification failed" (2048-bit key; secure) header.d=infradead.org header.i=@infradead.org header.b="Sb3v9O7W";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from bombadil.infradead.org (bombadil.infradead.org
 [198.137.202.133])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F0BB010E9E1
 for <dri-devel@lists.freedesktop.org>; Thu, 26 Feb 2026 21:58:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=bombadil.20210309; h=Content-Transfer-Encoding:
 MIME-Version:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:
 Content-ID:Content-Description:In-Reply-To:References;
 bh=odHUHhhMvfUKjO2VI3AGmgVIWAMpov1oefWyd7+ZFbg=; b=Sb3v9O7Wv54ced1SUV4YVgIL5W
 9IcZQUBwFdJtbYnKY8yRxq/sMzoKXLYsCpsmkprR7Gxfl++nKRqhIofSvB1NXXWglgTbwKV6sbElw
 wfZhuBxK2VyNa1bwYAqP9tMgCtIpQk42KqWw4S6OcQrFcSwBuZEw8Mmtuj/qxNWCHRMaOcIW5HP16
 9eOD+Ch/LmqeiVIjS3NRw1U4dH36zZrbeSRSU278Het3B3hwusVEAk7l2Nxqb/kdHvmRqyMu7CSzP
 e3r764vxUE878/wEC48lmrJ92rLL3EVyQbsv+f67OpGFNiwdiWUlX7e9RDWS0vK82xO5mU5vSBGeJ
 CKdlzL1g==;
Received: from [50.53.43.113] (helo=bombadil.infradead.org)
 by bombadil.infradead.org with esmtpsa (Exim 4.98.2 #2 (Red Hat Linux))
 id 1vvjNI-00000007HHN-0m9e; Thu, 26 Feb 2026 21:58:24 +0000
From: Randy Dunlap <rdunlap@infradead.org>
To: dri-devel@lists.freedesktop.org
Cc: Randy Dunlap <rdunlap@infradead.org>, Rob Herring <robh@kernel.org>,
 Tomeu Vizoso <tomeu@tomeuvizoso.net>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>,
 Simona Vetter <simona@ffwll.ch>
Subject: [PATCH] accel: Arm Ethos-U NPU: fix all uapi kernel-doc warnings
Date: Thu, 26 Feb 2026 13:58:23 -0800
Message-ID: <20260226215823.989380-1-rdunlap@infradead.org>
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
X-Spamd-Result: default: False [1.99 / 15.00];
	MID_CONTAINS_FROM(1.00)[];
	R_DKIM_REJECT(1.00)[infradead.org:s=bombadil.20210309];
	R_MISSING_CHARSET(0.50)[];
	MAILLIST(-0.20)[mailman];
	R_SPF_ALLOW(-0.20)[+ip4:131.252.210.177:c];
	RWL_MAILSPIKE_GOOD(-0.10)[131.252.210.177:from];
	MIME_GOOD(-0.10)[text/plain];
	DMARC_POLICY_SOFTFAIL(0.10)[infradead.org : SPF not aligned (relaxed),none];
	HAS_LIST_UNSUB(-0.01)[];
	TO_DN_SOME(0.00)[];
	FREEMAIL_CC(0.00)[infradead.org,kernel.org,tomeuvizoso.net,linux.intel.com,suse.de,gmail.com,ffwll.ch];
	MIME_TRACE(0.00)[0:+];
	RCVD_TLS_LAST(0.00)[];
	ARC_NA(0.00)[];
	RCVD_COUNT_THREE(0.00)[3];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[dri-devel@lists.freedesktop.org];
	FROM_NEQ_ENVFROM(0.00)[rdunlap@infradead.org,dri-devel-bounces@lists.freedesktop.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[infradead.org:-];
	NEURAL_HAM(-0.00)[-0.974];
	TAGGED_RCPT(0.00)[dri-devel];
	RCPT_COUNT_SEVEN(0.00)[9];
	ASN(0.00)[asn:6366, ipnet:131.252.0.0/16, country:US];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[gabe.freedesktop.org:helo,gabe.freedesktop.org:rdns,intel.com:email,infradead.org:mid,infradead.org:email,ffwll.ch:email]
X-Rspamd-Queue-Id: BD3671B01CA
X-Rspamd-Action: no action

Use correct struct names, struct member names, and kernel-doc
format to resolve all kernel-doc warnings:

Warning: include/uapi/drm/ethosu_accel.h:81 expecting prototype for struct
 drm_ethosu_gpu_info. Prototype was for struct drm_ethosu_npu_info instead
Warning: include/uapi/drm/ethosu_accel.h:81 struct member 'config' not
 described in 'drm_ethosu_npu_info'
Warning: include/uapi/drm/ethosu_accel.h:81 struct member 'sram_size' not
 described in 'drm_ethosu_npu_info'

Warning: include/uapi/drm/ethosu_accel.h:172 expecting prototype for struct
 drm_ethosu_wait_bo. Prototype was for struct drm_ethosu_bo_wait instead
Warning: include/uapi/drm/ethosu_accel.h:172 struct member 'handle' not
 described in 'drm_ethosu_bo_wait'
Warning: include/uapi/drm/ethosu_accel.h:172 struct member 'pad' not
 described in 'drm_ethosu_bo_wait'
Warning: include/uapi/drm/ethosu_accel.h:172 struct member 'timeout_ns' not
 described in 'drm_ethosu_bo_wait'

Warning: include/uapi/drm/ethosu_accel.h:208 struct member 'cmd_bo' not
 described in 'drm_ethosu_job'
Warning: include/uapi/drm/ethosu_accel.h:208 struct member 'sram_size' not
 described in 'drm_ethosu_job'
Warning: include/uapi/drm/ethosu_accel.h:208 struct member
 'region_bo_handles' not described in 'drm_ethosu_job'

Warning: include/uapi/drm/ethosu_accel.h:224 struct member 'jobs' not
 described in 'drm_ethosu_submit'
Warning: include/uapi/drm/ethosu_accel.h:224 struct member 'job_count' not
 described in 'drm_ethosu_submit'
Warning: include/uapi/drm/ethosu_accel.h:224 struct member 'pad' not
 described in 'drm_ethosu_submit'

Signed-off-by: Randy Dunlap <rdunlap@infradead.org>
---
Cc: Rob Herring <robh@kernel.org>
Cc: Tomeu Vizoso <tomeu@tomeuvizoso.net>
Cc: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>
Cc: Maxime Ripard <mripard@kernel.org>
Cc: Thomas Zimmermann <tzimmermann@suse.de>
Cc: David Airlie <airlied@gmail.com>
Cc: Simona Vetter <simona@ffwll.ch>

 include/uapi/drm/ethosu_accel.h |   24 ++++++++++++++----------
 1 file changed, 14 insertions(+), 10 deletions(-)

--- linux-next-20260226.orig/include/uapi/drm/ethosu_accel.h
+++ linux-next-20260226/include/uapi/drm/ethosu_accel.h
@@ -60,7 +60,7 @@ enum drm_ethosu_dev_query_type {
 };
 
 /**
- * struct drm_ethosu_gpu_info - NPU information
+ * struct drm_ethosu_npu_info - NPU information
  *
  * Structure grouping all queryable information relating to the NPU.
  */
@@ -75,9 +75,10 @@ struct drm_ethosu_npu_info {
 #define DRM_ETHOSU_VERSION_MINOR(x)		(((x) >> 4) & 0xff)
 #define DRM_ETHOSU_VERSION_STATUS(x)		((x) & 0xf)
 
-	/** @gpu_rev: GPU revision. */
+	/** @config: NPU revision. */
 	__u32 config;
 
+	/** @sram_size: NPU SRAM size (KB) */
 	__u32 sram_size;
 };
 
@@ -159,7 +160,7 @@ struct drm_ethosu_bo_mmap_offset {
 };
 
 /**
- * struct drm_ethosu_wait_bo - ioctl argument for waiting for
+ * struct drm_ethosu_bo_wait - ioctl argument for waiting for
  * completion of the last DRM_ETHOSU_SUBMIT on a BO.
  *
  * This is useful for cases where multiple processes might be
@@ -167,9 +168,12 @@ struct drm_ethosu_bo_mmap_offset {
  * completed.
  */
 struct drm_ethosu_bo_wait {
+	/** @handle: BO handle */
 	__u32 handle;
+	/** @pad: Reserved, must be zero. */
 	__u32 pad;
-	__s64 timeout_ns;	/* absolute */
+	/** @timeout_ns: Absolute timeout in ns. */
+	__s64 timeout_ns;
 };
 
 struct drm_ethosu_cmdstream_bo_create {
@@ -197,14 +201,14 @@ struct drm_ethosu_cmdstream_bo_create {
  * sequentially on the same core, to benefit from memory residency in SRAM.
  */
 struct drm_ethosu_job {
-	/** Input: BO handle for cmdstream. */
+	/** @cmd_bo: Input: BO handle for cmdstream. */
 	__u32 cmd_bo;
 
-	/** Input: Amount of SRAM to use. */
+	/** @sram_size: Input: Amount of SRAM to use. */
 	__u32 sram_size;
 
 #define ETHOSU_MAX_REGIONS	8
-	/** Input: Array of BO handles for each region. */
+	/** @region_bo_handles: Input: Array of BO handles for each region. */
 	__u32 region_bo_handles[ETHOSU_MAX_REGIONS];
 };
 
@@ -214,13 +218,13 @@ struct drm_ethosu_job {
  * The kernel will schedule the execution of these jobs in dependency order.
  */
 struct drm_ethosu_submit {
-	/** Input: Pointer to an array of struct drm_ethosu_job. */
+	/** @jobs: Input: Pointer to an array of struct drm_ethosu_job. */
 	__u64 jobs;
 
-	/** Input: Number of jobs passed in. */
+	/** @job_count: Input: Number of jobs passed in. */
 	__u32 job_count;
 
-	/** Reserved, must be zero. */
+	/** @pad: Reserved, must be zero. */
 	__u32 pad;
 };
 
