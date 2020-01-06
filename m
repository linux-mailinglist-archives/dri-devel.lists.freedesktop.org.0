Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E6B7D131394
	for <lists+dri-devel@lfdr.de>; Mon,  6 Jan 2020 15:30:04 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0D1A86E2E6;
	Mon,  6 Jan 2020 14:30:01 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
X-Greylist: delayed 1404 seconds by postgrey-1.36 at gabe;
 Mon, 06 Jan 2020 14:29:59 UTC
Received: from www413.your-server.de (www413.your-server.de [88.198.28.140])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BE0996E2E3;
 Mon,  6 Jan 2020 14:29:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=cyberus-technology.de; s=default1911; h=Content-Transfer-Encoding:
 MIME-Version:Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Id:
 List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=KW11SDNZTlK7yN6ChFi9azprOFMlb/1DKxBGOgh5XZ8=; b=P9P3UkKtEz5Dlo8dbhVf8CD1A
 bLj4pxDJftJAQRIyF81VopSSYEvCiX3LWV1w3NfaupnjxcxWOKXxAdbed8XNXpr4ucsh9nJ++c1S+
 0tvALkmv57cTPxmiHNev+6iaoPf0pa5ONsKqScprNTWn7Ku+WB8nSX7E+4IujARvytujG5gfgq17L
 KL0a8mBotA0Aq7XfcxlojjJbHwK2WGHhmKv9URZiyL1YFcSmiVnIE9iDiRTfw1iTcu8pZV7tRb12Y
 ZW0QqAMGexGxfi2KMomYRVjofx2SmJ2e2dVLHCeI7sX7UK3otELyj5110HTBhaVXLqI27j0YN/glj
 4gVlzUilw==;
Received: from sslproxy06.your-server.de ([78.46.172.3])
 by www413.your-server.de with esmtpsa (TLSv1.2:DHE-RSA-AES256-GCM-SHA384:256)
 (Exim 4.89_1)
 (envelope-from <julian.stecklina@cyberus-technology.de>)
 id 1ioT1d-0008HA-Vx; Mon, 06 Jan 2020 15:06:34 +0100
Received: from [188.25.180.214] (helo=192-168-0-109.rdsnet.ro)
 by sslproxy06.your-server.de with esmtpsa (TLSv1:DHE-RSA-AES256-SHA:256)
 (Exim 4.89) (envelope-from <julian.stecklina@cyberus-technology.de>)
 id 1ioT1d-000Xjb-MN; Mon, 06 Jan 2020 15:06:33 +0100
From: Julian Stecklina <julian.stecklina@cyberus-technology.de>
To: intel-gvt-dev@lists.freedesktop.org
Subject: [PATCH 1/3] drm/i915/gvt: fix file paths in documentation
Date: Mon,  6 Jan 2020 16:06:20 +0200
Message-Id: <20200106140622.14393-1-julian.stecklina@cyberus-technology.de>
X-Mailer: git-send-email 2.24.1
MIME-Version: 1.0
X-Authenticated-Sender: julian.stecklina@cyberus-technology.de
X-Virus-Scanned: Clear (ClamAV 0.101.4/25686/Mon Jan  6 10:55:07 2020)
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
Cc: Julian Stecklina <julian.stecklina@cyberus-technology.de>,
 linux-kernel@vger.kernel.org, hang.yuan@intel.com,
 dri-devel@lists.freedesktop.org, zhiyuan.lv@intel.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

The documentation had some stale paths to i915 graphics virtualization
code. Fix them to point to existing files.

Cc: Zhenyu Wang <zhenyuw@linux.intel.com>
Cc: zhiyuan.lv@intel.com
Cc: hang.yuan@intel.com

Signed-off-by: Julian Stecklina <julian.stecklina@cyberus-technology.de>
---
 Documentation/gpu/i915.rst | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/Documentation/gpu/i915.rst b/Documentation/gpu/i915.rst
index e539c42a3e78..d644683c5249 100644
--- a/Documentation/gpu/i915.rst
+++ b/Documentation/gpu/i915.rst
@@ -43,19 +43,19 @@ Interrupt Handling
 Intel GVT-g Guest Support(vGPU)
 -------------------------------
 
-.. kernel-doc:: drivers/gpu/drm/i915/i915_vgpu.c
+.. kernel-doc:: drivers/gpu/drm/i915/gvt/vgpu.c
    :doc: Intel GVT-g guest support
 
-.. kernel-doc:: drivers/gpu/drm/i915/i915_vgpu.c
+.. kernel-doc:: drivers/gpu/drm/i915/gvt/vgpu.c
    :internal:
 
 Intel GVT-g Host Support(vGPU device model)
 -------------------------------------------
 
-.. kernel-doc:: drivers/gpu/drm/i915/intel_gvt.c
+.. kernel-doc:: drivers/gpu/drm/i915/gvt/gvt.c
    :doc: Intel GVT-g host support
 
-.. kernel-doc:: drivers/gpu/drm/i915/intel_gvt.c
+.. kernel-doc:: drivers/gpu/drm/i915/gvt/gvt.c
    :internal:
 
 Workarounds
-- 
2.24.1

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
