Return-Path: <dri-devel-bounces@lists.freedesktop.org>
Delivered-To: lists+dri-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id GOZyJemWomn14AQAu9opvQ
	(envelope-from <dri-devel-bounces@lists.freedesktop.org>)
	for <lists+dri-devel@lfdr.de>; Sat, 28 Feb 2026 08:19:05 +0100
X-Original-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id F2CF81C0EF5
	for <lists+dri-devel@lfdr.de>; Sat, 28 Feb 2026 08:19:04 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 32DF210E197;
	Sat, 28 Feb 2026 07:19:01 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=fail reason="signature verification failed" (2048-bit key; secure) header.d=infradead.org header.i=@infradead.org header.b="IFBqWOid";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from bombadil.infradead.org (bombadil.infradead.org
 [198.137.202.133])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6A98110E197;
 Sat, 28 Feb 2026 07:18:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=bombadil.20210309; h=Content-Transfer-Encoding:
 Content-Type:MIME-Version:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:
 Content-ID:Content-Description:In-Reply-To:References;
 bh=O62dPwsxI0vXkHhWl85bEDZbUuogD7R4wbsoIpXYSG8=; b=IFBqWOidGSFoQw22BLarV6Ruln
 rGiqJAiIbW+RlX5oetv+x8YQ/iWsl0j/1HYSQllZBWyiT5a5amEFLfRKgpMV/8FfOJ49SfolF/Ymq
 SqP+FPvX1TzIzFMUqgtiwF/PbRwj7w63FP7ylgpUOL93Y1Aw06a08n3KefIGPGgwwWqYhNsauoG30
 6tlGuwYL6YT1kg/a7QaSbd622LZIy6xRc2ackVjmCs2YGSDQiDUTwbhwWJ31WED0tep6ar4s9iDm2
 YHRDF2CRWLWOV7KMVFtbhbuF4u2SeMid7tKFkgrR46AhbnESelD6NfWk97l/cSNw13SSzzyggY6pI
 QN+T3Eww==;
Received: from [50.53.43.113] (helo=bombadil.infradead.org)
 by bombadil.infradead.org with esmtpsa (Exim 4.98.2 #2 (Red Hat Linux))
 id 1vwEbI-00000009boe-3TCh; Sat, 28 Feb 2026 07:18:56 +0000
From: Randy Dunlap <rdunlap@infradead.org>
To: dri-devel@lists.freedesktop.org
Cc: Randy Dunlap <rdunlap@infradead.org>,
 Alex Deucher <alexander.deucher@amd.com>,
 =?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>,
 amd-gfx@lists.freedesktop.org,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>,
 Simona Vetter <simona@ffwll.ch>
Subject: [PATCH] drm/amdgpu: amdgpu.h: fix all kernel-doc warnings
Date: Fri, 27 Feb 2026 23:18:54 -0800
Message-ID: <20260228071856.2664080-1-rdunlap@infradead.org>
X-Mailer: git-send-email 2.53.0
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
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [1.49 / 15.00];
	MID_CONTAINS_FROM(1.00)[];
	R_DKIM_REJECT(1.00)[infradead.org:s=bombadil.20210309];
	R_SPF_ALLOW(-0.20)[+ip4:131.252.210.177];
	MAILLIST(-0.20)[mailman];
	DMARC_POLICY_SOFTFAIL(0.10)[infradead.org : SPF not aligned (relaxed),none];
	RWL_MAILSPIKE_GOOD(-0.10)[131.252.210.177:from];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FREEMAIL_CC(0.00)[infradead.org,amd.com,lists.freedesktop.org,linux.intel.com,kernel.org,suse.de,gmail.com,ffwll.ch];
	RCVD_TLS_LAST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	RCVD_COUNT_THREE(0.00)[3];
	FORGED_SENDER_MAILLIST(0.00)[];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	FROM_NEQ_ENVFROM(0.00)[rdunlap@infradead.org,dri-devel-bounces@lists.freedesktop.org];
	DKIM_TRACE(0.00)[infradead.org:-];
	RCPT_COUNT_SEVEN(0.00)[10];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[dri-devel];
	ASN(0.00)[asn:6366, ipnet:131.252.0.0/16, country:US];
	ARC_NA(0.00)[]
X-Rspamd-Queue-Id: F2CF81C0EF5
X-Rspamd-Action: no action

Use the struct keyword for kernel-doc struct comments.
Use the correct enum names in enum amd_reset_method.

This eliminates these warnings:

Warning: drivers/gpu/drm/amd/amdgpu/amdgpu.h:477 cannot understand
 function prototype: 'struct amdgpu_wb'
Warning: drivers/gpu/drm/amd/amdgpu/amdgpu.h:576 Enum value
 'AMD_RESET_METHOD_LEGACY' not described in enum 'amd_reset_method'
Warning: drivers/gpu/drm/amd/amdgpu/amdgpu.h:576 Enum value
 'AMD_RESET_METHOD_MODE0' not described in enum 'amd_reset_method'
Warning: drivers/gpu/drm/amd/amdgpu/amdgpu.h:576 Enum value
 'AMD_RESET_METHOD_MODE1' not described in enum 'amd_reset_method'
Warning: drivers/gpu/drm/amd/amdgpu/amdgpu.h:576 Enum value
 'AMD_RESET_METHOD_MODE2' not described in enum 'amd_reset_method'
Warning: drivers/gpu/drm/amd/amdgpu/amdgpu.h:576 Enum value
 'AMD_RESET_METHOD_LINK' not described in enum 'amd_reset_method'
Warning: drivers/gpu/drm/amd/amdgpu/amdgpu.h:576 Enum value
 'AMD_RESET_METHOD_BACO' not described in enum 'amd_reset_method'
Warning: drivers/gpu/drm/amd/amdgpu/amdgpu.h:576 Enum value
 'AMD_RESET_METHOD_PCI' not described in enum 'amd_reset_method'
Warning: drivers/gpu/drm/amd/amdgpu/amdgpu.h:576 Enum value
 'AMD_RESET_METHOD_ON_INIT' not described in enum 'amd_reset_method'
Warning: drivers/gpu/drm/amd/amdgpu/amdgpu.h:576 Excess enum value
 '@AMD_RESET_LEGACY' description in 'amd_reset_method'
Warning: drivers/gpu/drm/amd/amdgpu/amdgpu.h:576 Excess enum value
 '@AMD_RESET_MODE0' description in 'amd_reset_method'
Warning: drivers/gpu/drm/amd/amdgpu/amdgpu.h:576 Excess enum value
 '@AMD_RESET_MODE1' description in 'amd_reset_method'
Warning: drivers/gpu/drm/amd/amdgpu/amdgpu.h:576 Excess enum value
 '@AMD_RESET_MODE2' description in 'amd_reset_method'
Warning: drivers/gpu/drm/amd/amdgpu/amdgpu.h:576 Excess enum value
 '@AMD_RESET_LINK' description in 'amd_reset_method'
Warning: drivers/gpu/drm/amd/amdgpu/amdgpu.h:576 Excess enum value
 '@AMD_RESET_BACO' description in 'amd_reset_method'
Warning: drivers/gpu/drm/amd/amdgpu/amdgpu.h:576 Excess enum value
 '@AMD_RESET_PCI' description in 'amd_reset_method'

Signed-off-by: Randy Dunlap <rdunlap@infradead.org>
---
Cc: Alex Deucher <alexander.deucher@amd.com>
Cc: Christian König <christian.koenig@amd.com>
Cc: amd-gfx@lists.freedesktop.org
Cc: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>
Cc: Maxime Ripard <mripard@kernel.org>
Cc: Thomas Zimmermann <tzimmermann@suse.de>
Cc: David Airlie <airlied@gmail.com>
Cc: Simona Vetter <simona@ffwll.ch>

 drivers/gpu/drm/amd/amdgpu/amdgpu.h |   39 ++++++++++++++------------
 1 file changed, 21 insertions(+), 18 deletions(-)

--- linux-next-20260227.orig/drivers/gpu/drm/amd/amdgpu/amdgpu.h
+++ linux-next-20260227/drivers/gpu/drm/amd/amdgpu/amdgpu.h
@@ -462,7 +462,7 @@ int amdgpu_file_to_fpriv(struct file *fi
 #define AMDGPU_MAX_WB 1024	/* Reserve at most 1024 WB slots for amdgpu-owned rings. */
 
 /**
- * amdgpu_wb - This struct is used for small GPU memory allocation.
+ * struct amdgpu_wb - This struct is used for small GPU memory allocation.
  *
  * This struct is used to allocate a small amount of GPU memory that can be
  * used to shadow certain states into the memory. This is especially useful for
@@ -540,23 +540,26 @@ struct amdgpu_allowed_register_entry {
  * enum amd_reset_method - Methods for resetting AMD GPU devices
  *
  * @AMD_RESET_METHOD_NONE: The device will not be reset.
- * @AMD_RESET_LEGACY: Method reserved for SI, CIK and VI ASICs.
- * @AMD_RESET_MODE0: Reset the entire ASIC. Not currently available for the
- *                   any device.
- * @AMD_RESET_MODE1: Resets all IP blocks on the ASIC (SDMA, GFX, VCN, etc.)
- *                   individually. Suitable only for some discrete GPU, not
- *                   available for all ASICs.
- * @AMD_RESET_MODE2: Resets a lesser level of IPs compared to MODE1. Which IPs
- *                   are reset depends on the ASIC. Notably doesn't reset IPs
- *                   shared with the CPU on APUs or the memory controllers (so
- *                   VRAM is not lost). Not available on all ASICs.
- * @AMD_RESET_LINK: Triggers SW-UP link reset on other GPUs
- * @AMD_RESET_BACO: BACO (Bus Alive, Chip Off) method powers off and on the card
- *                  but without powering off the PCI bus. Suitable only for
- *                  discrete GPUs.
- * @AMD_RESET_PCI: Does a full bus reset using core Linux subsystem PCI reset
- *                 and does a secondary bus reset or FLR, depending on what the
- *                 underlying hardware supports.
+ * @AMD_RESET_METHOD_LEGACY: Method reserved for SI, CIK and VI ASICs.
+ * @AMD_RESET_METHOD_MODE0: Reset the entire ASIC. Not currently available
+ *			    for the any device.
+ * @AMD_RESET_METHOD_MODE1: Resets all IP blocks on the ASIC (SDMA, GFX, VCN,
+ *			    etc.) individually. Suitable only for some discrete
+ *			    GPU, not available for all ASICs.
+ * @AMD_RESET_METHOD_MODE2: Resets a lesser level of IPs compared to MODE1.
+ *			    Which IPs are reset depends on the ASIC. Notably
+ *			    doesn't reset IPs shared with the CPU on APUs or
+ *			    the memory controllers (so VRAM is not lost).
+ *			    Not available on all ASICs.
+ * @AMD_RESET_METHOD_LINK: Triggers SW-UP link reset on other GPUs
+ * @AMD_RESET_METHOD_BACO: BACO (Bus Alive, Chip Off) method powers off and on
+ *			   the card but without powering off the PCI bus.
+ *			   Suitable only for discrete GPUs.
+ * @AMD_RESET_METHOD_PCI: Does a full bus reset using core Linux subsystem
+ *			  PCI reset and does a secondary bus reset or FLR,
+ *			  depending on what the underlying hardware supports.
+ * @AMD_RESET_METHOD_ON_INIT: Does a device reset during the driver init
+ *			  sequence.
  *
  * Methods available for AMD GPU driver for resetting the device. Not all
  * methods are suitable for every device. User can override the method using
