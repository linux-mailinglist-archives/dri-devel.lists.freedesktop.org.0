Return-Path: <dri-devel-bounces@lists.freedesktop.org>
Delivered-To: lists+dri-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id p/RkL9uAqWnU9gAAu9opvQ
	(envelope-from <dri-devel-bounces@lists.freedesktop.org>)
	for <lists+dri-devel@lfdr.de>; Thu, 05 Mar 2026 14:10:51 +0100
X-Original-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 8A6042126FD
	for <lists+dri-devel@lfdr.de>; Thu, 05 Mar 2026 14:10:51 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E76CB10E29F;
	Thu,  5 Mar 2026 13:10:49 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="KUORK4sO";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F11CD10E29E;
 Thu,  5 Mar 2026 13:10:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1772716249; x=1804252249;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=WqtAM8bzKPJlSaqRtvK/cj91YfXOSmVv8MMgMMscGpU=;
 b=KUORK4sOi534iQQ/LHcfEB/9XUUepCvJhxh8TS1GqljfRhiCP4LWLUqR
 tBIET5t1MJhHV+opD+zUERKRXolERoC+9PiYyyqm+EvYN2f3pSAC1Tbec
 uAc0CPKaPilFCgmikV1FYDWZBp6acZh6g0J5XPLjcypOnpLvcwSaJe21i
 s59bEUQgiHvvA9m4LsvmX/HRsAjj3sylalOk4hWzYZRUfHnVsNe7Y+oqW
 DCJSHP1NDW4HIXenR222P9QvLiEh7CA39x+CR98ba3lF9TLElF9/g0KPb
 0yO2AzhFK3dUgNzt3wVQGEOzPsrCDSoS68dW1B6vP9gCJfk/i7Pd7DMtq w==;
X-CSE-ConnectionGUID: WShV7FQ6T4Skj0KMM4uqfQ==
X-CSE-MsgGUID: 0oI4lk9CSzSd1cxFS5KiiQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11719"; a="96418648"
X-IronPort-AV: E=Sophos;i="6.23,103,1770624000"; d="scan'208";a="96418648"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
 by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 Mar 2026 05:10:44 -0800
X-CSE-ConnectionGUID: tvIQZWeESP2aaEvwK940cQ==
X-CSE-MsgGUID: 4kAcD7l8QmmziVtokOR3Gg==
X-ExtLoop1: 1
Received: from jraag-z790m-itx-wifi.iind.intel.com ([10.190.239.23])
 by fmviesa003.fm.intel.com with ESMTP; 05 Mar 2026 05:10:41 -0800
From: Raag Jadav <raag.jadav@intel.com>
To: intel-xe@lists.freedesktop.org,
	dri-devel@lists.freedesktop.org
Cc: airlied@gmail.com, simona@ffwll.ch, mripard@kernel.org,
 matthew.brost@intel.com, rodrigo.vivi@intel.com, riana.tauro@intel.com,
 christian.koenig@amd.com, andrealmeid@igalia.com,
 Raag Jadav <raag.jadav@intel.com>
Subject: [PATCH v2 1/3] drm/doc: Update documentation for 'none' recovery
 method
Date: Thu,  5 Mar 2026 18:36:47 +0530
Message-ID: <20260305130720.3685754-2-raag.jadav@intel.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260305130720.3685754-1-raag.jadav@intel.com>
References: <20260305130720.3685754-1-raag.jadav@intel.com>
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
X-Rspamd-Queue-Id: 8A6042126FD
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
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[dri-devel];
	RCPT_COUNT_SEVEN(0.00)[11];
	ASN(0.00)[asn:6366, ipnet:131.252.0.0/16, country:US];
	DBL_BLOCKED_OPENRESOLVER(0.00)[gabe.freedesktop.org:rdns,gabe.freedesktop.org:helo,intel.com:dkim,intel.com:email,intel.com:mid]
X-Rspamd-Action: no action

Expand 'none' recovery method for wedged event to include debug cases
where driver wants to hint "no recovery" without resetting the device
from driver context.

Signed-off-by: Raag Jadav <raag.jadav@intel.com>
---
 Documentation/gpu/drm-uapi.rst | 14 +++++++-------
 1 file changed, 7 insertions(+), 7 deletions(-)

diff --git a/Documentation/gpu/drm-uapi.rst b/Documentation/gpu/drm-uapi.rst
index d98428a592f1..579e87cb9ff7 100644
--- a/Documentation/gpu/drm-uapi.rst
+++ b/Documentation/gpu/drm-uapi.rst
@@ -438,14 +438,14 @@ following expectations.
     unknown         consumer policy
     =============== ========================================
 
-The only exception to this is ``WEDGED=none``, which signifies that the device
-was temporarily 'wedged' at some point but was recovered from driver context
-using device specific methods like reset. No explicit recovery is expected from
-the consumer in this case, but it can still take additional steps like gathering
-telemetry information (devcoredump, syslog). This is useful because the first
-hang is usually the most critical one which can result in consequential hangs or
-complete wedging.
+No Recovery
+-----------
 
+Here ``WEDGED=none`` signifies that no recovery is expected from the consumer
+but it can still try to gather telemetry information (devcoredump, syslog) for
+debug purpose in order to root cause the hang. This is useful because the first
+hang is usually the most critical one which can result in consequential hangs
+or complete wedging.
 
 Vendor Specific Recovery
 ------------------------
-- 
2.43.0

