Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 634D5A0422C
	for <lists+dri-devel@lfdr.de>; Tue,  7 Jan 2025 15:22:57 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C8A1110EAD2;
	Tue,  7 Jan 2025 14:22:55 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="nFcIV8Z6";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.19])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BD8DB10EAD2
 for <dri-devel@lists.freedesktop.org>; Tue,  7 Jan 2025 14:22:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1736259774; x=1767795774;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=J4Qd/MRhohSbcUGpHV4gNjm1mS/1p+HTffB0fCrZ5Tk=;
 b=nFcIV8Z6VWJOYFpSYEq0JdvowzTBNBGsGI+W3zJFxIbuxVI0lmzo9y4p
 t8EOQ78GXmterhUgJgwv/tc26SQrHKBoRimReNRBOLt5ejGDq2POBXE/d
 NpCxtE+2t3YvbqXuPbFno7+scfG9O0jU9XAkLTmG51gv4BhdnviN03ttL
 ++u+zp+66WMccYLPBIqvLjKimgxv047ZdQvUh5TkLG7OwTGngDcAV9cmy
 9mB62bW5PIOorCvuwnOo9vKgTTYw+15qg6zZDJtP4dm7v2tscCJARTfWt
 GVlH1PNOA+ZuXr0JqRb0tj3wBVgKyivCFBvsrQ/20V0+TjT2vnrL+0tfy A==;
X-CSE-ConnectionGUID: ru++RkoBS32wgC3KKdgKiw==
X-CSE-MsgGUID: WRt1NPuyTNmrX5B/cFGarg==
X-IronPort-AV: E=McAfee;i="6700,10204,11308"; a="36324484"
X-IronPort-AV: E=Sophos;i="6.12,295,1728975600"; d="scan'208";a="36324484"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
 by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Jan 2025 06:22:54 -0800
X-CSE-ConnectionGUID: RzMphEGcRjeYNCyPNxIO1A==
X-CSE-MsgGUID: p7dLvXYPRfCD+hcCh2EWVg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,224,1728975600"; d="scan'208";a="103635520"
Received: from try2-8594.igk.intel.com ([10.91.220.58])
 by orviesa008-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Jan 2025 06:22:53 -0800
From: Maciej Falkowski <maciej.falkowski@linux.intel.com>
To: dri-devel@lists.freedesktop.org
Cc: oded.gabbay@gmail.com, quic_jhugo@quicinc.com,
 jacek.lawrynowicz@linux.intel.com,
 Maciej Falkowski <maciej.falkowski@linux.intel.com>
Subject: [PATCH 14/14] accel/ivpu: Enable HWS by default on all platforms
Date: Tue,  7 Jan 2025 18:32:37 +0100
Message-ID: <20250107173238.381120-15-maciej.falkowski@linux.intel.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250107173238.381120-1-maciej.falkowski@linux.intel.com>
References: <20250107173238.381120-1-maciej.falkowski@linux.intel.com>
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

From: Jacek Lawrynowicz <jacek.lawrynowicz@linux.intel.com>

Enable HWS on selected platforms if FW API version is above 3.19.

Signed-off-by: Karol Wachowski <karol.wachowski@intel.com>
Signed-off-by: Jacek Lawrynowicz <jacek.lawrynowicz@linux.intel.com>
Signed-off-by: Maciej Falkowski <maciej.falkowski@linux.intel.com>
---
 drivers/accel/ivpu/ivpu_fw.c | 13 ++++++++++++-
 1 file changed, 12 insertions(+), 1 deletion(-)

diff --git a/drivers/accel/ivpu/ivpu_fw.c b/drivers/accel/ivpu/ivpu_fw.c
index 6037ec0b3096..6cf1fb826d1b 100644
--- a/drivers/accel/ivpu/ivpu_fw.c
+++ b/drivers/accel/ivpu/ivpu_fw.c
@@ -145,7 +145,18 @@ ivpu_fw_sched_mode_select(struct ivpu_device *vdev, const struct vpu_firmware_he
 	if (ivpu_sched_mode != IVPU_SCHED_MODE_AUTO)
 		return ivpu_sched_mode;
 
-	return VPU_SCHEDULING_MODE_OS;
+	if (IVPU_FW_CHECK_API_VER_LT(vdev, fw_hdr, JSM, 3, 24))
+		return VPU_SCHEDULING_MODE_OS;
+
+	switch (ivpu_device_id(vdev)) {
+	case PCI_DEVICE_ID_MTL:
+	case PCI_DEVICE_ID_ARL:
+	case PCI_DEVICE_ID_LNL:
+	case PCI_DEVICE_ID_PTL_P:
+		return VPU_SCHEDULING_MODE_HW;
+	default:
+		return VPU_SCHEDULING_MODE_OS;
+	}
 }
 
 static int ivpu_fw_parse(struct ivpu_device *vdev)
-- 
2.43.0

