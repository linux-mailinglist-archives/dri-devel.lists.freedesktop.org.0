Return-Path: <dri-devel-bounces@lists.freedesktop.org>
Delivered-To: lists+dri-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id oMoFNTMbnGkZ/wMAu9opvQ
	(envelope-from <dri-devel-bounces@lists.freedesktop.org>)
	for <lists+dri-devel@lfdr.de>; Mon, 23 Feb 2026 10:17:39 +0100
X-Original-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 84ECB173B52
	for <lists+dri-devel@lfdr.de>; Mon, 23 Feb 2026 10:17:39 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A05E310E2A1;
	Mon, 23 Feb 2026 09:17:37 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="dCEDSDzw";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5C20C10E2A1;
 Mon, 23 Feb 2026 09:17:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1771838256; x=1803374256;
 h=from:date:subject:mime-version:content-transfer-encoding:
 message-id:references:in-reply-to:to:cc;
 bh=G4BMkhSaHKQ0kvRPZs6Gsy8zI84WYy2KBWtLkFjtTQc=;
 b=dCEDSDzwz28Ly20ZK0banudc6ziko8lmbEqAHfxk7XFvYzpMU8kksjw9
 5MAB3PZApbVZXEhXtD4Rcz5JRcO0+OphcZo11IsN8IxW5qNhKV6BKRley
 HOrGkE9dD7e8arcrC4x5NrhdF1nVVUAescxJc3GpfM8Y2Ts0uOBM7S4a5
 fkNzMsBcLZ+6TpNwxc+gRc1VTdiUoMqfyyJLwMrr8izXajYOdXQahr+l6
 P8u+jABJCwm8aQQgSxm6VDai9AC0frp0+krdVZnhentC1bXOCzhvFdkiZ
 RKrSYPe+rXFAEkqbakpgGjAiG/HDMPpJpBdn7UMxQf/5KwotnRw2cmUCY Q==;
X-CSE-ConnectionGUID: idWBDTLdR4OUGolv0YuaHQ==
X-CSE-MsgGUID: uvwFGRHBRcuWy5res42dzA==
X-IronPort-AV: E=McAfee;i="6800,10657,11709"; a="76690752"
X-IronPort-AV: E=Sophos;i="6.21,306,1763452800"; d="scan'208";a="76690752"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
 by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 Feb 2026 01:17:36 -0800
X-CSE-ConnectionGUID: YaB5H5G5RQWIBVPIBqpSeQ==
X-CSE-MsgGUID: foY0u5Y6T8CSrKVI2uMi4Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,306,1763452800"; d="scan'208";a="220048787"
Received: from srr4-3-linux-106-armuthy.iind.intel.com ([10.190.238.56])
 by fmviesa005.fm.intel.com with ESMTP; 23 Feb 2026 01:17:31 -0800
From: Arun R Murthy <arun.r.murthy@intel.com>
Date: Mon, 23 Feb 2026 14:45:59 +0530
Subject: [PATCH v10 1/7] drm: Define user readable error codes for atomic ioctl
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260223-atomic-v10-1-f59c8def2e70@intel.com>
References: <20260223-atomic-v10-0-f59c8def2e70@intel.com>
In-Reply-To: <20260223-atomic-v10-0-f59c8def2e70@intel.com>
To: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
 Jani Nikula <jani.nikula@linux.intel.com>, 
 Rodrigo Vivi <rodrigo.vivi@intel.com>, 
 Joonas Lahtinen <joonas.lahtinen@linux.intel.com>, 
 Tvrtko Ursulin <tursulin@ursulin.net>, xaver.hugl@kde.org, 
 harry.wentland@amd.com, uma.shankar@intel.com, louis.chauvet@bootlin.com, 
 naveen1.kumar@intel.com, ramya.krishna.yella@intel.com
Cc: "Imported from f20260210-atomic-v9-5-525c88fd2402"@intel.com, 
 dri-devel@lists.freedesktop.org, intel-gfx@lists.freedesktop.org, 
 intel-xe@lists.freedesktop.org, Arun R Murthy <arun.r.murthy@intel.com>, 
 Suraj Kandpal <suraj.kandpal@intel.com>
X-Mailer: b4 0.15-dev
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
X-Spamd-Result: default: False [-1.31 / 15.00];
	DMARC_POLICY_ALLOW(-0.50)[intel.com,none];
	R_DKIM_ALLOW(-0.20)[intel.com:s=Intel];
	MAILLIST(-0.20)[mailman];
	R_SPF_ALLOW(-0.20)[+ip4:131.252.210.177:c];
	RWL_MAILSPIKE_GOOD(-0.10)[131.252.210.177:from];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FREEMAIL_TO(0.00)[linux.intel.com,kernel.org,suse.de,gmail.com,ffwll.ch,intel.com,ursulin.net,kde.org,amd.com,bootlin.com];
	RCVD_COUNT_THREE(0.00)[4];
	ARC_NA(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[21];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[intel.com:+];
	TO_DN_SOME(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	FROM_NEQ_ENVFROM(0.00)[arun.r.murthy@intel.com,dri-devel-bounces@lists.freedesktop.org];
	RCVD_TLS_LAST(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	ASN(0.00)[asn:6366, ipnet:131.252.0.0/16, country:US];
	TAGGED_RCPT(0.00)[dri-devel];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[gabe.freedesktop.org:helo,gabe.freedesktop.org:rdns,intel.com:mid,intel.com:dkim,intel.com:email]
X-Rspamd-Queue-Id: 84ECB173B52
X-Rspamd-Action: no action

There can be multiple reasons for a failure in atomic_ioctl. Most often
in these error conditions -EINVAL is returned. User/Compositor would
have to blindly take a call on failure of this ioctl so as to use
ALLOW_MODESET or retry. It would be good if user/compositor gets a
readable error code on failure so they can take proper corrections in
the next commit.
The struct drm_mode_atomic is being passed by the user/compositor which
holds the properties for modeset/flip. Reusing the same struct for
returning the error code in case of failure, thereby creation of new
uapi/interface for returning the error code is not required.
The element 'reserved' in the struct drm_mode_atomic is used for
returning the user readable error code. This points to the struct
drm_mode_atomic_err_code. Failure reasons as a string can also be added
on need basis by the variable failure_string in the same struct
drm_mode_atomic_err_code.

v3: Remove fixed error (Jani/Xaver)
v5: Fix kernel-doc (Jani)
v7: Rephrase the kernel doc description (Suraj)
v8: Removed the below enum and suggest to use INVALID_API_USAGE (Xaver)
	DRM_MODE_ATOMIC_ASYNC_NOT_SUPP_PLANE
	DRM_MODE_ATOMIC_ASYNC_MODIFIER_NOT_SUPP

Signed-off-by: Arun R Murthy <arun.r.murthy@intel.com>
Reviewed-by: Suraj Kandpal <suraj.kandpal@intel.com>
---
 include/uapi/drm/drm_mode.h | 37 +++++++++++++++++++++++++++++++++++++
 1 file changed, 37 insertions(+)

diff --git a/include/uapi/drm/drm_mode.h b/include/uapi/drm/drm_mode.h
index 3693d82b5279f1cf14fc2adb538ea830591cc598..71e91d4f05ee8d556e8e7137a6cdcc7f3b261a75 100644
--- a/include/uapi/drm/drm_mode.h
+++ b/include/uapi/drm/drm_mode.h
@@ -45,6 +45,7 @@ extern "C" {
 #define DRM_CONNECTOR_NAME_LEN	32
 #define DRM_DISPLAY_MODE_LEN	32
 #define DRM_PROP_NAME_LEN	32
+#define DRM_MODE_ATOMIC_FAILURE_STRING_LEN	128
 
 #define DRM_MODE_TYPE_BUILTIN	(1<<0) /* deprecated */
 #define DRM_MODE_TYPE_CLOCK_C	((1<<1) | DRM_MODE_TYPE_BUILTIN) /* deprecated */
@@ -1343,6 +1344,42 @@ struct drm_mode_destroy_dumb {
 		DRM_MODE_ATOMIC_NONBLOCK |\
 		DRM_MODE_ATOMIC_ALLOW_MODESET)
 
+/**
+ * enum drm_mode_atomic_failure_codes -  error codes for failures in atomic_ioctl
+ * @DRM_MODE_ATOMIC_INVALID_API_USAGE: invallid API usage(DRM_ATOMIC not
+ *				       enabled, invalid falg, page_flip event
+ *				       with test-only, etc)
+ * @DRM_MODE_ATOMIC_CRTC_NEED_FULL_MODESET: Need full modeset on this crtc
+ * @DRM_MODE_ATOMIC_NEED_FULL_MODESET: Need full modeset on all connected crtc's
+ * @DRM_MODE_ATOMIC_ASYNC_PROP_CHANGED: Property changed in async flip
+ */
+enum drm_mode_atomic_failure_codes {
+	DRM_MODE_ATOMIC_INVALID_API_USAGE,
+	DRM_MODE_ATOMIC_CRTC_NEED_FULL_MODESET,
+	DRM_MODE_ATOMIC_NEED_FULL_MODESET,
+	DRM_MODE_ATOMIC_ASYNC_PROP_CHANGED,
+};
+
+/**
+ * struct drm_mode_atomic_err_code - struct to store the error code
+ *
+ * pointer to this struct will be stored in reserved variable of
+ * struct drm_mode_atomic to report the failure cause to the user.
+ *
+ * @failure_code: error codes defined in enum drm_moide_atomic_failure_code
+ * @failure_objs_ptr: pointer to the drm_object that caused error
+ * @reserved: reserved for future use
+ * @count_objs: count of drm_objects if multiple drm_objects caused error
+ * @failure_string: user readable error message string
+ */
+struct drm_mode_atomic_err_code {
+	__u64 failure_code;
+	__u64 failure_objs_ptr;
+	__u64 reserved;
+	__u32 count_objs;
+	char failure_string[DRM_MODE_ATOMIC_FAILURE_STRING_LEN];
+};
+
 struct drm_mode_atomic {
 	__u32 flags;
 	__u32 count_objs;

-- 
2.25.1

