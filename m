Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id C47227AB299
	for <lists+dri-devel@lfdr.de>; Fri, 22 Sep 2023 15:22:30 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8011410E05A;
	Fri, 22 Sep 2023 13:22:27 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.100])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4C79310E684
 for <dri-devel@lists.freedesktop.org>; Fri, 22 Sep 2023 13:22:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1695388944; x=1726924944;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=nMwbxWQey/RqAbo8YUsuZsDmIdu+BEDYkU0L5nuLGWk=;
 b=JKSyaRGzHo1yRNpg0l11wPJGDWSk9pU6wCO5WvxyADZGGp5kX49dN6F+
 1ldVD7+IMkvmZzRih7ak3Vlss3BRk3pA2rV8A7cHzDDkEIV123cnlXPQ9
 RKsF2dMsPIQdzLZejqZrwvqBcNwPsWBScgzsuO+h8A/HsPC0+vL70Acki
 9u7fVwzm+x5J38u/bgLV1k4yBBA1FZntLNAAMpUCwwwgqREbqtmQS3eiw
 d66cvIPIL9l3G9CDAnSJxYxQWoIQ4wTyjnbj4FZ9vpjlG+b7ZM3+J0ak+
 iPAgPp7jrz2iPW3PnPUCjNTOccEI17HWD+ILGetEEB2ICI2XFKzpM0Al6 A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10841"; a="447303486"
X-IronPort-AV: E=Sophos;i="6.03,167,1694761200"; d="scan'208";a="447303486"
Received: from orsmga008.jf.intel.com ([10.7.209.65])
 by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 Sep 2023 06:22:10 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10841"; a="776846286"
X-IronPort-AV: E=Sophos;i="6.03,167,1694761200"; d="scan'208";a="776846286"
Received: from joe-255.igk.intel.com (HELO localhost) ([10.91.220.57])
 by orsmga008-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 Sep 2023 06:22:08 -0700
From: Stanislaw Gruszka <stanislaw.gruszka@linux.intel.com>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH] accel/ivpu: Add Arrow Lake pci id
Date: Fri, 22 Sep 2023 15:22:06 +0200
Message-Id: <20230922132206.812817-1-stanislaw.gruszka@linux.intel.com>
X-Mailer: git-send-email 2.25.1
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
Cc: Krystian Pradzynski <krystian.pradzynski@linux.intel.com>,
 Jeffrey Hugo <quic_jhugo@quicinc.com>,
 Karol Wachowski <karol.wachowski@linux.intel.com>,
 Oded Gabbay <ogabbay@kernel.org>,
 Stanislaw Gruszka <stanislaw.gruszka@linux.intel.com>,
 Jacek Lawrynowicz <jacek.lawrynowicz@linux.intel.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Enable VPU on Arrow Lake CPUs.

Reviewed-by: Krystian Pradzynski <krystian.pradzynski@linux.intel.com>
Reviewed-by: Karol Wachowski <karol.wachowski@linux.intel.com>
Signed-off-by: Stanislaw Gruszka <stanislaw.gruszka@linux.intel.com>
---
 drivers/accel/ivpu/ivpu_drv.c | 1 +
 drivers/accel/ivpu/ivpu_drv.h | 2 ++
 2 files changed, 3 insertions(+)

diff --git a/drivers/accel/ivpu/ivpu_drv.c b/drivers/accel/ivpu/ivpu_drv.c
index ba79f397c9e8..aa7314fdbc0f 100644
--- a/drivers/accel/ivpu/ivpu_drv.c
+++ b/drivers/accel/ivpu/ivpu_drv.c
@@ -634,6 +634,7 @@ static void ivpu_dev_fini(struct ivpu_device *vdev)
 
 static struct pci_device_id ivpu_pci_ids[] = {
 	{ PCI_DEVICE(PCI_VENDOR_ID_INTEL, PCI_DEVICE_ID_MTL) },
+	{ PCI_DEVICE(PCI_VENDOR_ID_INTEL, PCI_DEVICE_ID_ARL) },
 	{ PCI_DEVICE(PCI_VENDOR_ID_INTEL, PCI_DEVICE_ID_LNL) },
 	{ }
 };
diff --git a/drivers/accel/ivpu/ivpu_drv.h b/drivers/accel/ivpu/ivpu_drv.h
index 9e8c075fe9ef..03b3d6532fb6 100644
--- a/drivers/accel/ivpu/ivpu_drv.h
+++ b/drivers/accel/ivpu/ivpu_drv.h
@@ -23,6 +23,7 @@
 #define DRIVER_DATE "20230117"
 
 #define PCI_DEVICE_ID_MTL   0x7d1d
+#define PCI_DEVICE_ID_ARL   0xad1d
 #define PCI_DEVICE_ID_LNL   0x643e
 
 #define IVPU_HW_37XX	37
@@ -165,6 +166,7 @@ static inline int ivpu_hw_gen(struct ivpu_device *vdev)
 {
 	switch (ivpu_device_id(vdev)) {
 	case PCI_DEVICE_ID_MTL:
+	case PCI_DEVICE_ID_ARL:
 		return IVPU_HW_37XX;
 	case PCI_DEVICE_ID_LNL:
 		return IVPU_HW_40XX;
-- 
2.25.1

