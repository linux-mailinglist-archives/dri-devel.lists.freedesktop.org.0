Return-Path: <dri-devel-bounces@lists.freedesktop.org>
Delivered-To: lists+dri-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id GOHnI0HBpmlDTQAAu9opvQ
	(envelope-from <dri-devel-bounces@lists.freedesktop.org>)
	for <lists+dri-devel@lfdr.de>; Tue, 03 Mar 2026 12:08:49 +0100
X-Original-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 642FA1ED6C2
	for <lists+dri-devel@lfdr.de>; Tue, 03 Mar 2026 12:08:49 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A813210E79D;
	Tue,  3 Mar 2026 11:08:47 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="LJ9CCTpr";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B3D8D10E79B;
 Tue,  3 Mar 2026 11:08:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1772536125; x=1804072125;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=ZDHVkna6gAiaGZuv6R5i1Hi9y2BToHfaq6PzsBzIMgs=;
 b=LJ9CCTprNp0wi7gFxX033Rwu0QN/MUHC/x/G+Mu6dH7gXb2TOiHu923T
 LrbTUffZGJwBhzbJmv3hKJU/HxcSbZOIDvzBZK0j799mIWFcYviwEj8EQ
 wevrOS7R850C6VqN8hlcX8Z4SSfJ+qqA/qQMmkEfje7v7ckpl6Jh8O+wG
 nHdj20lEpXAjIoPcJxCxfc0+QP8MjliGqVenrqIlFH3RgKMXAr2XttRuR
 fgj0Efx1xCp2I7GZYtCt1oVTMG4bpSI5RZZp5OuHyGwZm/mYWUCsGSca6
 WD7QhdpPytRbZbrraN8p8FBqoQpLcUWys6HrVy1eGrTbCU5qGigdPh5lc Q==;
X-CSE-ConnectionGUID: AmaY1lVVRuu3pHXwKYA+dQ==
X-CSE-MsgGUID: m0JXUE37SjuNwbFdi853qA==
X-IronPort-AV: E=McAfee;i="6800,10657,11717"; a="77410125"
X-IronPort-AV: E=Sophos;i="6.21,321,1763452800"; d="scan'208";a="77410125"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
 by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 Mar 2026 03:08:45 -0800
X-CSE-ConnectionGUID: 6OK3oXk6TW24sD1QMwtA7g==
X-CSE-MsgGUID: qwglBkurRLOU2nztCz8adQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,321,1763452800"; d="scan'208";a="248460038"
Received: from jraag-z790m-itx-wifi.iind.intel.com ([10.190.239.23])
 by orviesa002.jf.intel.com with ESMTP; 03 Mar 2026 03:08:42 -0800
From: Raag Jadav <raag.jadav@intel.com>
To: intel-xe@lists.freedesktop.org,
	dri-devel@lists.freedesktop.org
Cc: airlied@gmail.com, simona@ffwll.ch, mripard@kernel.org,
 matthew.brost@intel.com, rodrigo.vivi@intel.com, riana.tauro@intel.com,
 christian.koenig@amd.com, andrealmeid@igalia.com,
 Raag Jadav <raag.jadav@intel.com>
Subject: [PATCH v1 3/3] drm/xe: Send 'none' recovery method for
 XE_WEDGED_MODE_UPON_ANY_HANG_NO_RESET
Date: Tue,  3 Mar 2026 16:35:19 +0530
Message-ID: <20260303110556.3577612-4-raag.jadav@intel.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260303110556.3577612-1-raag.jadav@intel.com>
References: <20260303110556.3577612-1-raag.jadav@intel.com>
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
X-Rspamd-Queue-Id: 642FA1ED6C2
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [0.19 / 15.00];
	MID_CONTAINS_FROM(1.00)[];
	DMARC_POLICY_ALLOW(-0.50)[intel.com,none];
	R_MISSING_CHARSET(0.50)[];
	R_SPF_ALLOW(-0.20)[+ip4:131.252.210.177:c];
	R_DKIM_ALLOW(-0.20)[intel.com:s=Intel];
	MAILLIST(-0.20)[mailman];
	MIME_GOOD(-0.10)[text/plain];
	RWL_MAILSPIKE_GOOD(-0.10)[131.252.210.177:from];
	HAS_LIST_UNSUB(-0.01)[];
	TO_DN_SOME(0.00)[];
	FREEMAIL_CC(0.00)[gmail.com,ffwll.ch,kernel.org,intel.com,amd.com,igalia.com];
	MIME_TRACE(0.00)[0:+];
	RCVD_TLS_LAST(0.00)[];
	ARC_NA(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	DKIM_TRACE(0.00)[intel.com:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[raag.jadav@intel.com,dri-devel-bounces@lists.freedesktop.org];
	FROM_HAS_DN(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-0.999];
	TAGGED_RCPT(0.00)[dri-devel];
	RCPT_COUNT_SEVEN(0.00)[11];
	ASN(0.00)[asn:6366, ipnet:131.252.0.0/16, country:US];
	DBL_BLOCKED_OPENRESOLVER(0.00)[intel.com:dkim,intel.com:email,intel.com:mid]
X-Rspamd-Action: no action

XE_WEDGED_MODE_UPON_ANY_HANG_NO_RESET is intended for debugging hangs,
so wedge the device with 'none' recovery method and have it available
to the user for debugging.

Signed-off-by: Raag Jadav <raag.jadav@intel.com>
---
 drivers/gpu/drm/xe/xe_device.c | 9 ++++++++-
 1 file changed, 8 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/xe/xe_device.c b/drivers/gpu/drm/xe/xe_device.c
index c137dc0a1840..eeb626737760 100644
--- a/drivers/gpu/drm/xe/xe_device.c
+++ b/drivers/gpu/drm/xe/xe_device.c
@@ -1329,8 +1329,15 @@ void xe_device_declare_wedged(struct xe_device *xe)
 		xe_gt_declare_wedged(gt);
 
 	if (xe_device_wedged(xe)) {
+		/*
+		 * XE_WEDGED_MODE_UPON_ANY_HANG_NO_RESET is intended for debugging
+		 * hangs, so wedge the device with 'none' recovery method and have
+		 * it available to the user for debugging.
+		 */
+		if (xe->wedged.mode == XE_WEDGED_MODE_UPON_ANY_HANG_NO_RESET)
+			xe_device_set_wedged_method(xe, DRM_WEDGE_RECOVERY_NONE);
 		/* If no wedge recovery method is set, use default */
-		if (!xe->wedged.method)
+		else if (!xe->wedged.method)
 			xe_device_set_wedged_method(xe, DRM_WEDGE_RECOVERY_REBIND |
 						    DRM_WEDGE_RECOVERY_BUS_RESET);
 
-- 
2.43.0

