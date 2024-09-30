Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 1711098AD7F
	for <lists+dri-devel@lfdr.de>; Mon, 30 Sep 2024 21:54:32 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5D2B510E596;
	Mon, 30 Sep 2024 19:54:26 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="kw1hbNz4";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4125E10E588
 for <dri-devel@lists.freedesktop.org>; Mon, 30 Sep 2024 19:54:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1727726054; x=1759262054;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=OrC9MLpoTQNtIXamCd0xFktpFLSTjW/MwxGhAp3hJnM=;
 b=kw1hbNz4BHSaUYmEC7heOa0EDpP31B8/Q//QzhdO6uYdA9VQYyRKR4Au
 iiEEwedo67QS7fgV/thW2cgobHql2OVQPgsaskimV/pe4RYHg1G7tayF9
 0QzYSbGTBN5dvkBYbcsSP+o3XVKBP/PPtwoVU4pGui1VPiQSB4+7S2/Nz
 DWYTpJJS3/Y8zbxxWJaZ/9nuclyVWsuEbASNZ4T7q7nkbd9wdzM2n1BNU
 ilbx7N1vH5dQdl6LVNKvgGNXK26GYbzhrLf6k3/3kgSa1kbZ77YyhiSK6
 /RrjzgAkhDZaFu8ip76FdrC1EVeYTE/otMXt9TwvzUqiBOjTyFZL6oOsC A==;
X-CSE-ConnectionGUID: J5aWv+96TSyeC6ZQHH1ksw==
X-CSE-MsgGUID: EAtsJfsBTrKsalSib5a+aw==
X-IronPort-AV: E=McAfee;i="6700,10204,11211"; a="26962397"
X-IronPort-AV: E=Sophos;i="6.11,166,1725346800"; d="scan'208";a="26962397"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
 by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 30 Sep 2024 12:54:13 -0700
X-CSE-ConnectionGUID: Py00x4PzR8SXBbpVqp2b1A==
X-CSE-MsgGUID: iZCUK6H3RXmEw5Ca48SOYQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,166,1725346800"; d="scan'208";a="73370264"
Received: from jlawryno.igk.intel.com ([10.91.220.59])
 by fmviesa009-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 30 Sep 2024 12:54:12 -0700
From: Jacek Lawrynowicz <jacek.lawrynowicz@linux.intel.com>
To: dri-devel@lists.freedesktop.org
Cc: oded.gabbay@gmail.com, quic_jhugo@quicinc.com,
 Jacek Lawrynowicz <jacek.lawrynowicz@linux.intel.com>,
 Karol Wachowski <karol.wachowski@intel.com>
Subject: [PATCH v2 31/31] accel/ivpu: Fix typos in ivpu_pm.c
Date: Mon, 30 Sep 2024 21:53:22 +0200
Message-ID: <20240930195322.461209-32-jacek.lawrynowicz@linux.intel.com>
X-Mailer: git-send-email 2.45.1
In-Reply-To: <20240930195322.461209-1-jacek.lawrynowicz@linux.intel.com>
References: <20240930195322.461209-1-jacek.lawrynowicz@linux.intel.com>
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

Replace "Filed" with an actual word.

Reviewed-by: Karol Wachowski <karol.wachowski@intel.com>
Reviewed-by: Jeffrey Hugo <quic_jhugo@quicinc.com>
Signed-off-by: Jacek Lawrynowicz <jacek.lawrynowicz@linux.intel.com>
---
 drivers/accel/ivpu/ivpu_pm.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/accel/ivpu/ivpu_pm.c b/drivers/accel/ivpu/ivpu_pm.c
index 6d180c81e6df9..e567df79a6129 100644
--- a/drivers/accel/ivpu/ivpu_pm.c
+++ b/drivers/accel/ivpu/ivpu_pm.c
@@ -423,7 +423,7 @@ int ivpu_pm_dct_enable(struct ivpu_device *vdev, u8 active_percent)
 
 	ret = ivpu_jsm_dct_enable(vdev, active_us, inactive_us);
 	if (ret) {
-		ivpu_err_ratelimited(vdev, "Filed to enable DCT: %d\n", ret);
+		ivpu_err_ratelimited(vdev, "Failed to enable DCT: %d\n", ret);
 		return ret;
 	}
 
@@ -440,7 +440,7 @@ int ivpu_pm_dct_disable(struct ivpu_device *vdev)
 
 	ret = ivpu_jsm_dct_disable(vdev);
 	if (ret) {
-		ivpu_err_ratelimited(vdev, "Filed to disable DCT: %d\n", ret);
+		ivpu_err_ratelimited(vdev, "Failed to disable DCT: %d\n", ret);
 		return ret;
 	}
 
-- 
2.45.1

