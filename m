Return-Path: <dri-devel-bounces@lists.freedesktop.org>
Delivered-To: lists+dri-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 0B3AEEC8qWnNDQEAu9opvQ
	(envelope-from <dri-devel-bounces@lists.freedesktop.org>)
	for <lists+dri-devel@lfdr.de>; Thu, 05 Mar 2026 18:24:16 +0100
X-Original-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B2982216204
	for <lists+dri-devel@lfdr.de>; Thu, 05 Mar 2026 18:24:15 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2690F10E2CD;
	Thu,  5 Mar 2026 17:24:12 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Bx0Xk5Y5";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6892B10E2CD
 for <dri-devel@lists.freedesktop.org>; Thu,  5 Mar 2026 17:24:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1772731451; x=1804267451;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=iqOH8N8PsA9m3Ss30/uK/Cj1N/czWRnyUDqpEaNIAoQ=;
 b=Bx0Xk5Y5NyfGjl6v8WmMrm++FyRaN3i+oYan+S3dj4VNR0L8XgN+8UX9
 ns4LHquU45ybYYeskcQC+EOzHFXSwlbrXP9GZMLjChqTXv3dC7ihTm2BQ
 elpXKE9OuXn8hadJTou24j/w9Mm56Uc8PyyjG8XGpLgbSeqy7H44+Xupw
 7g2kG5lvIUsdgGKrYF/uXD8vkRTsRj9JUWboKY40XjWwwPZ3yOum+qf33
 nOWBrYkb/9JlEswPBLYmB5j5lwq9IfArJCEihGjprpfgH5UzmSWw5VcU8
 DWzAJUqxlnsGL/qvG83A2wFW5kM0v001MZzqg0c3bhVwNs0qgKdGp7Weg w==;
X-CSE-ConnectionGUID: P1xrrwI9TJeOWME/Rxn6EQ==
X-CSE-MsgGUID: 57/HvIlqTOad6x2SjHMWFw==
X-IronPort-AV: E=McAfee;i="6800,10657,11720"; a="96445323"
X-IronPort-AV: E=Sophos;i="6.23,103,1770624000"; d="scan'208";a="96445323"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
 by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 Mar 2026 09:24:11 -0800
X-CSE-ConnectionGUID: bZt0m3jYRFW/V4gAhbkoyg==
X-CSE-MsgGUID: P0n5jSFyQe2nV3dw4UFYWQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,103,1770624000"; d="scan'208";a="223443887"
Received: from smtp.ostc.intel.com ([10.54.29.231])
 by fmviesa005-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 Mar 2026 09:24:10 -0800
Received: from ray2.sr71.net (unknown [10.125.109.20])
 by smtp.ostc.intel.com (Postfix) with ESMTP id A81E56362;
 Thu,  5 Mar 2026 09:24:09 -0800 (PST)
From: Dave Hansen <dave.hansen@linux.intel.com>
To: linux-kernel@vger.kernel.org
Cc: Dave Hansen <dave.hansen@linux.intel.com>,
 Anitha Chrisanthus <anitha.chrisanthus@intel.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>,
 Simona Vetter <simona@ffwll.ch>, dri-devel@lists.freedesktop.org
Subject: [PATCH] MAINTAINERS: Remove bouncing Keem Bay maintainer
Date: Thu,  5 Mar 2026 09:24:15 -0800
Message-ID: <20260305172415.3116438-1-dave.hansen@linux.intel.com>
X-Mailer: git-send-email 2.43.0
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
X-Rspamd-Queue-Id: B2982216204
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [0.19 / 15.00];
	MID_CONTAINS_FROM(1.00)[];
	R_MISSING_CHARSET(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[intel.com,none];
	R_DKIM_ALLOW(-0.20)[intel.com:s=Intel];
	MAILLIST(-0.20)[mailman];
	R_SPF_ALLOW(-0.20)[+ip4:131.252.210.177:c];
	MIME_GOOD(-0.10)[text/plain];
	RWL_MAILSPIKE_GOOD(-0.10)[131.252.210.177:from];
	HAS_LIST_UNSUB(-0.01)[];
	FREEMAIL_CC(0.00)[linux.intel.com,intel.com,kernel.org,suse.de,gmail.com,ffwll.ch,lists.freedesktop.org];
	RCVD_TLS_LAST(0.00)[];
	FORWARDED(0.00)[dri-devel@lists.freedesktop.org];
	MIME_TRACE(0.00)[0:+];
	FORGED_RECIPIENTS(0.00)[m:linux-kernel@vger.kernel.org,m:dave.hansen@linux.intel.com,m:anitha.chrisanthus@intel.com,m:maarten.lankhorst@linux.intel.com,m:mripard@kernel.org,m:tzimmermann@suse.de,m:airlied@gmail.com,m:simona@ffwll.ch,s:lists@lfdr.de];
	FORGED_SENDER(0.00)[dave.hansen@linux.intel.com,dri-devel-bounces@lists.freedesktop.org];
	TO_DN_SOME(0.00)[];
	ARC_NA(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PREVIOUSLY_DELIVERED(0.00)[dri-devel@lists.freedesktop.org];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[dave.hansen@linux.intel.com,dri-devel-bounces@lists.freedesktop.org];
	DKIM_TRACE(0.00)[intel.com:+];
	NEURAL_HAM(-0.00)[-1.000];
	RCPT_COUNT_SEVEN(0.00)[9];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:6366, ipnet:131.252.0.0/16, country:US];
	TAGGED_RCPT(0.00)[dri-devel];
	FROM_HAS_DN(0.00)[]
X-Rspamd-Action: no action

This maintainer's email no longer works. Remove it from MAINTAINERS.

There is still one listed maintainer for the "INTEL KEEM BAY DRM
DRIVER".

Signed-off-by: Dave Hansen <dave.hansen@linux.intel.com>
Acked-by: Anitha Chrisanthus <anitha.chrisanthus@intel.com>
Cc: Anitha Chrisanthus <anitha.chrisanthus@intel.com>
Cc: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>
Cc: Maxime Ripard <mripard@kernel.org>
Cc: Thomas Zimmermann <tzimmermann@suse.de>
Cc: David Airlie <airlied@gmail.com>
Cc: Simona Vetter <simona@ffwll.ch>
Cc: dri-devel@lists.freedesktop.org
---
 MAINTAINERS | 1 -
 1 file changed, 1 deletion(-)

diff --git a/MAINTAINERS b/MAINTAINERS
index 7c03c6f2e7328..427e45e12762e 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -12977,7 +12977,6 @@ F:	drivers/crypto/intel/ixp4xx/ixp4xx_crypto.c
 
 INTEL KEEM BAY DRM DRIVER
 M:	Anitha Chrisanthus <anitha.chrisanthus@intel.com>
-M:	Edmund Dea <edmund.j.dea@intel.com>
 S:	Maintained
 F:	Documentation/devicetree/bindings/display/intel,keembay-display.yaml
 F:	drivers/gpu/drm/kmb/
-- 
2.43.0

