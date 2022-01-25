Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 4B29749BCE7
	for <lists+dri-devel@lfdr.de>; Tue, 25 Jan 2022 21:21:29 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A16E510E457;
	Tue, 25 Jan 2022 20:21:23 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga07.intel.com (mga07.intel.com [134.134.136.100])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CDBAE10E356
 for <dri-devel@lists.freedesktop.org>; Tue, 25 Jan 2022 20:21:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1643142074; x=1674678074;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=6zue4ppucen/ANYQA3c/xAkoOYydv3PMPDvmLNWSzoI=;
 b=GWTDpVaNzaYxWxHDZho0hGLW56Ceoe96nz25eu77gn59yb7P0N34l2tu
 wTFqwqPx1KjQjksV0faorXsOfvPfSQlLX0UNpMS5pGfECPk/6Ilq49cEb
 Wx0py7efQDOFRu2h3y0HXEem3PCAPAA074hfq+LCt2PdMLC6Yo+4oDuEK
 8BOid1cEljJ9/hRhRGuiakFO246b8m2vRYa3zqk87cSRxvpK8PkttiWpA
 KY+KmbnXYgMR5DleeD3c3AWvmWrHXa0hFCOb6JGZSjIiiiE/INqmr3g8V
 mFHQUq37LFeplStgu3DsXVaW8vZD06EM5iDPZfAj1vgvkNwHtQ5gIjFu8 A==;
X-IronPort-AV: E=McAfee;i="6200,9189,10238"; a="309724983"
X-IronPort-AV: E=Sophos;i="5.88,315,1635231600"; d="scan'208";a="309724983"
Received: from orsmga002.jf.intel.com ([10.7.209.21])
 by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 Jan 2022 12:21:13 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.88,315,1635231600"; d="scan'208";a="495130326"
Received: from black.fi.intel.com ([10.237.72.28])
 by orsmga002.jf.intel.com with ESMTP; 25 Jan 2022 12:21:09 -0800
Received: by black.fi.intel.com (Postfix, from userid 1003)
 id 67655B9; Tue, 25 Jan 2022 22:21:22 +0200 (EET)
From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Phillip Potter <phil@philpotter.co.uk>,
 Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
 Lee Jones <lee.jones@linaro.org>, Heiner Kallweit <hkallweit1@gmail.com>,
 Carlis <zhangxuezhi1@yulong.com>, linux-kernel@vger.kernel.org,
 linux-staging@lists.linux.dev, linux-fbdev@vger.kernel.org,
 dri-devel@lists.freedesktop.org
Subject: [PATCH v1 1/4] fbtft: Unorphan the driver
Date: Tue, 25 Jan 2022 22:21:14 +0200
Message-Id: <20220125202118.63362-2-andriy.shevchenko@linux.intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220125202118.63362-1-andriy.shevchenko@linux.intel.com>
References: <20220125202118.63362-1-andriy.shevchenko@linux.intel.com>
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
Cc: Andy Shevchenko <andy@kernel.org>, Helge Deller <deller@gmx.de>,
 Michael Hennerich <michael.hennerich@analog.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Let's maintain occasional fixes to the fbtft driver.

Signed-off-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
---
 MAINTAINERS | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/MAINTAINERS b/MAINTAINERS
index ea3e6c914384..16e614606ac1 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -7372,9 +7372,11 @@ F:	Documentation/fault-injection/
 F:	lib/fault-inject.c
 
 FBTFT Framebuffer drivers
+M:	Andy Shevchenko <andy@kernel.org>
 L:	dri-devel@lists.freedesktop.org
 L:	linux-fbdev@vger.kernel.org
-S:	Orphan
+S:	Maintained
+T:	git git://git.kernel.org/pub/scm/linux/kernel/git/andy/linux-fbtft.git
 F:	drivers/staging/fbtft/
 
 FC0011 TUNER DRIVER
-- 
2.34.1

