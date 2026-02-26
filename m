Return-Path: <dri-devel-bounces@lists.freedesktop.org>
Delivered-To: lists+dri-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id SPWhIJ3/n2n3fAQAu9opvQ
	(envelope-from <dri-devel-bounces@lists.freedesktop.org>)
	for <lists+dri-devel@lfdr.de>; Thu, 26 Feb 2026 09:09:01 +0100
X-Original-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 121061A24C2
	for <lists+dri-devel@lfdr.de>; Thu, 26 Feb 2026 09:09:01 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6F43010E069;
	Thu, 26 Feb 2026 08:08:58 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Cnm515ta";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.19])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 08EE810E069
 for <dri-devel@lists.freedesktop.org>; Thu, 26 Feb 2026 08:08:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1772093336; x=1803629336;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=R507udYL6opjuI8np0fBrl0n6cNHN1Ex0n/gN/SM0is=;
 b=Cnm515taLCJaBhak20jgMy4JBhtFJroQbewyT9InkD6cm2FouH/HyN9o
 CK6CPYp0bvCvX2IZ0odOqE+bx+YUv7ylAuJAPCXkuWCSGz+2mV58Q3e3N
 WDGDRewS7a39rncRlcvbcPUrCy6XZ7BlfVhi72Mpmq9gOmEpxzXa9m3nF
 fFwvBCgA+vQ9fL0H1UrQ71EkDqE45rDBp00vyFwNYfxi19yjoWv9l4Ncu
 0Z2otuB/WzRE9qo0p0w11gkBqCbwhqHPogpl585xKg5C8ZXiu1okxWGMA
 2VUlDo2Biztg7DLXh1TbJR48U36I3IV4KyfDz0g5IB2Rd/mavDlD3QxCt g==;
X-CSE-ConnectionGUID: iLyQSUiFSy2102lonJkbKg==
X-CSE-MsgGUID: oEQlp7UuT/qvizwuGmQC5w==
X-IronPort-AV: E=McAfee;i="6800,10657,11712"; a="72180820"
X-IronPort-AV: E=Sophos;i="6.21,312,1763452800"; d="scan'208";a="72180820"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
 by fmvoesa113.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Feb 2026 00:08:55 -0800
X-CSE-ConnectionGUID: arDF5drgSuiGjuhq6t849g==
X-CSE-MsgGUID: xekKFge0QQGIy7/OLTSd+g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,312,1763452800"; d="scan'208";a="220634741"
Received: from black.igk.intel.com ([10.91.253.5])
 by orviesa003.jf.intel.com with ESMTP; 26 Feb 2026 00:08:53 -0800
Received: by black.igk.intel.com (Postfix, from userid 1003)
 id EEE6D98; Thu, 26 Feb 2026 09:08:51 +0100 (CET)
From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To: Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
 dri-devel@lists.freedesktop.org, linux-fbdev@vger.kernel.org,
 linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org
Cc: Andy Shevchenko <andy@kernel.org>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Randy Dunlap <rdunlap@infradead.org>, Helge Deller <deller@gmx.de>,
 Dan Carpenter <dan.carpenter@linaro.org>
Subject: [PATCH v1 1/1] fbtft: Update REAMDE to slow down the stream of
 undesired cleanups
Date: Thu, 26 Feb 2026 09:08:45 +0100
Message-ID: <20260226080845.4081732-1-andriy.shevchenko@linux.intel.com>
X-Mailer: git-send-email 2.50.1
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
X-Spamd-Result: default: False [0.19 / 15.00];
	MID_CONTAINS_FROM(1.00)[];
	R_MISSING_CHARSET(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[intel.com,none];
	MAILLIST(-0.20)[mailman];
	R_DKIM_ALLOW(-0.20)[intel.com:s=Intel];
	R_SPF_ALLOW(-0.20)[+ip4:131.252.210.177:c];
	MIME_GOOD(-0.10)[text/plain];
	RWL_MAILSPIKE_GOOD(-0.10)[131.252.210.177:from];
	HAS_LIST_UNSUB(-0.01)[];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER(0.00)[andriy.shevchenko@linux.intel.com,dri-devel-bounces@lists.freedesktop.org];
	FREEMAIL_CC(0.00)[kernel.org,linuxfoundation.org,infradead.org,gmx.de,linaro.org];
	ARC_NA(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORGED_RECIPIENTS(0.00)[m:andriy.shevchenko@linux.intel.com,m:linux-fbdev@vger.kernel.org,m:linux-staging@lists.linux.dev,m:linux-kernel@vger.kernel.org,m:andy@kernel.org,m:gregkh@linuxfoundation.org,m:rdunlap@infradead.org,m:deller@gmx.de,m:dan.carpenter@linaro.org,s:lists@lfdr.de];
	FORWARDED(0.00)[dri-devel@lists.freedesktop.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	FROM_NEQ_ENVFROM(0.00)[andriy.shevchenko@linux.intel.com,dri-devel-bounces@lists.freedesktop.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[intel.com:+];
	PREVIOUSLY_DELIVERED(0.00)[dri-devel@lists.freedesktop.org];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:6366, ipnet:131.252.0.0/16, country:US];
	NEURAL_HAM(-0.00)[-0.994];
	TAGGED_RCPT(0.00)[dri-devel];
	RCPT_COUNT_SEVEN(0.00)[10];
	DBL_BLOCKED_OPENRESOLVER(0.00)[intel.com:email,intel.com:dkim,gabe.freedesktop.org:helo,gabe.freedesktop.org:rdns]
X-Rspamd-Queue-Id: 121061A24C2
X-Rspamd-Action: no action

Lately the enormous amount of some untested cleanups started coming
to a mailing list. This adds an unneeded and undesired burden on
the reviewers and maintainers. Try to stop that by clearly state
what we accept and on what conditions in the README file.

Signed-off-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
---
 drivers/staging/fbtft/README | 29 +++++++----------------------
 1 file changed, 7 insertions(+), 22 deletions(-)

diff --git a/drivers/staging/fbtft/README b/drivers/staging/fbtft/README
index ba4c74c92e4c..91f152d622bd 100644
--- a/drivers/staging/fbtft/README
+++ b/drivers/staging/fbtft/README
@@ -6,27 +6,12 @@ The module 'fbtft' makes writing drivers for some of these displays very easy.
 
 Development is done on a Raspberry Pi running the Raspbian "wheezy" distribution.
 
-INSTALLATION
-  Download kernel sources
+For new hardware support consider using DRM subsystem (see TODO).
 
-  From Linux 3.15
-    cd drivers/video/fbdev/fbtft
-    git clone https://github.com/notro/fbtft.git
+NOTE:
 
-    Add to drivers/video/fbdev/Kconfig:   source "drivers/video/fbdev/fbtft/Kconfig"
-    Add to drivers/video/fbdev/Makefile:  obj-y += fbtft/
-
-  Before Linux 3.15
-    cd drivers/video
-    git clone https://github.com/notro/fbtft.git
-
-    Add to drivers/video/Kconfig:   source "drivers/video/fbtft/Kconfig"
-    Add to drivers/video/Makefile:  obj-y += fbtft/
-
-  Enable driver(s) in menuconfig and build the kernel
-
-
-See wiki for more information: https://github.com/notro/fbtft/wiki
-
-
-Source: https://github.com/notro/fbtft/
+The driver is in maintenance mode, only performance issue or bug fixes
+are accepted, which effectively means the patches must be tested on
+the real hardware (the patch must be accompanied with the information
+what hardware is that). The treewide changes may also be accepted as
+an exception.
-- 
2.50.1

