Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 1D2BD93213A
	for <lists+dri-devel@lfdr.de>; Tue, 16 Jul 2024 09:31:01 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CA79010E103;
	Tue, 16 Jul 2024 07:30:58 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from szxga02-in.huawei.com (szxga02-in.huawei.com [45.249.212.188])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BA3BB10E103
 for <dri-devel@lists.freedesktop.org>; Tue, 16 Jul 2024 07:30:57 +0000 (UTC)
Received: from mail.maildlp.com (unknown [172.19.163.174])
 by szxga02-in.huawei.com (SkyGuard) with ESMTP id 4WNW0Q2p7Dzdhvy;
 Tue, 16 Jul 2024 15:29:10 +0800 (CST)
Received: from kwepemm600007.china.huawei.com (unknown [7.193.23.208])
 by mail.maildlp.com (Postfix) with ESMTPS id 93EF5140158;
 Tue, 16 Jul 2024 15:30:53 +0800 (CST)
Received: from DESKTOP-8RFUVS3.china.huawei.com (10.174.178.219) by
 kwepemm600007.china.huawei.com (7.193.23.208) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Tue, 16 Jul 2024 15:30:52 +0800
From: Zenghui Yu <yuzenghui@huawei.com>
To: <linux-arm-msm@vger.kernel.org>, <dri-devel@lists.freedesktop.org>,
 <linux-doc@vger.kernel.org>, <linux-kernel@vger.kernel.org>
CC: <quic_jhugo@quicinc.com>, <quic_carlv@quicinc.com>,
 <quic_pkanojiy@quicinc.com>, <ogabbay@kernel.org>, <corbet@lwn.net>,
 <wanghaibin.wang@huawei.com>, Zenghui Yu <yuzenghui@huawei.com>
Subject: [PATCH] accel/qaic: Remove the description of DRM_IOCTL_QAIC_PART_DEV
Date: Tue, 16 Jul 2024 15:30:36 +0800
Message-ID: <20240716073036.453-1-yuzenghui@huawei.com>
X-Mailer: git-send-email 2.23.0.windows.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.174.178.219]
X-ClientProxiedBy: dggems702-chm.china.huawei.com (10.3.19.179) To
 kwepemm600007.china.huawei.com (7.193.23.208)
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

The partition device ioctl was removed during the development of the
initial version of qaic driver. Remove its description from the
documentation to avoid confusing readers.

Signed-off-by: Zenghui Yu <yuzenghui@huawei.com>
---
 Documentation/accel/qaic/qaic.rst | 6 ------
 1 file changed, 6 deletions(-)

diff --git a/Documentation/accel/qaic/qaic.rst b/Documentation/accel/qaic/qaic.rst
index efb7771273bb..62a8d2b4711d 100644
--- a/Documentation/accel/qaic/qaic.rst
+++ b/Documentation/accel/qaic/qaic.rst
@@ -147,12 +147,6 @@ DRM_IOCTL_QAIC_PERF_STATS_BO
   recent execution of a BO. This allows userspace to construct an end to end
   timeline of the BO processing for a performance analysis.
 
-DRM_IOCTL_QAIC_PART_DEV
-  This IOCTL allows userspace to request a duplicate "shadow device". This extra
-  accelN device is associated with a specific partition of resources on the
-  AIC100 device and can be used for limiting a process to some subset of
-  resources.
-
 DRM_IOCTL_QAIC_DETACH_SLICE_BO
   This IOCTL allows userspace to remove the slicing information from a BO that
   was originally provided by a call to DRM_IOCTL_QAIC_ATTACH_SLICE_BO. This
-- 
2.33.0

