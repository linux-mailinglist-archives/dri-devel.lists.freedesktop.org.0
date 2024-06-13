Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 692E89084A8
	for <lists+dri-devel@lfdr.de>; Fri, 14 Jun 2024 09:25:49 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E5D8310EC50;
	Fri, 14 Jun 2024 07:25:46 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=habana.ai header.i=@habana.ai header.b="sIPkoCnj";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail02.habana.ai (habanamailrelay.habana.ai [213.57.90.13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7EF3C10E289
 for <dri-devel@lists.freedesktop.org>; Thu, 13 Jun 2024 08:29:25 +0000 (UTC)
Received: internal info suppressed
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=habana.ai; s=default;
 t=1718266951; bh=8C8zdDbTmh+b1C4BEJxx8WDVF16ZLcry/Ha2BurmCw4=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=sIPkoCnjVI2B2E6VQJljtteVH1duBGErQGF5MHi6pgdZHHQTGih4dDJVfZl1BMxqu
 Ra6FWoXwjCgVNFoj8WU+m+Ze7ti+oW6R3mdQrqgNOez8jjE2WLesZv6raCavZMEc9e
 YOUFIkPM++9GPSMpfgcnKQ81g4tspg1EoWkiOEZ+ghJtUibEW2v2T11LHeb2ueYTJO
 Rau5Sw8iGac6YIQx6zpzmhFUmqj5pbUd3oW/CvfJqC91iTWPSEyXSLVd8kv/IKWScD
 azuH1blH4BY8DMAzqautDV5X/8s20z41AUTW6APjqIRGE89mXFbY4OEEI831MUX0CX
 3DkPwyRDjWV1Q==
Received: from oshpigelman-vm-u22.habana-labs.com (localhost [127.0.0.1])
 by oshpigelman-vm-u22.habana-labs.com (8.15.2/8.15.2/Debian-22ubuntu3) with
 ESMTP id 45D8M8hj1440009; Thu, 13 Jun 2024 11:22:12 +0300
From: Omer Shpigelman <oshpigelman@habana.ai>
To: linux-kernel@vger.kernel.org, linux-rdma@vger.kernel.org,
 netdev@vger.kernel.org, dri-devel@lists.freedesktop.org
Cc: ogabbay@kernel.org, oshpigelman@habana.ai, zyehudai@habana.ai
Subject: [PATCH 14/15] accel/habanalabs/gaudi2: CN registers header files
Date: Thu, 13 Jun 2024 11:22:07 +0300
Message-Id: <20240613082208.1439968-15-oshpigelman@habana.ai>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20240613082208.1439968-1-oshpigelman@habana.ai>
References: <20240613082208.1439968-1-oshpigelman@habana.ai>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Mailman-Approved-At: Fri, 14 Jun 2024 07:24:53 +0000
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

Add the relevant CN registers header files. These files are generated
automatically from a tool maintained by the VLSI engineers.
These are required for the upcoming GAUDI2 CN driver support.

Signed-off-by: Omer Shpigelman <oshpigelman@habana.ai>
Co-developed-by: Abhilash K V <kvabhilash@habana.ai>
Signed-off-by: Abhilash K V <kvabhilash@habana.ai>
Co-developed-by: Andrey Agranovich <aagranovich@habana.ai>
Signed-off-by: Andrey Agranovich <aagranovich@habana.ai>
Co-developed-by: Bharat Jauhari <bjauhari@habana.ai>
Signed-off-by: Bharat Jauhari <bjauhari@habana.ai>
Co-developed-by: David Meriin <dmeriin@habana.ai>
Signed-off-by: David Meriin <dmeriin@habana.ai>
Co-developed-by: Sagiv Ozeri <sozeri@habana.ai>
Signed-off-by: Sagiv Ozeri <sozeri@habana.ai>
Co-developed-by: Zvika Yehudai <zyehudai@habana.ai>
Signed-off-by: Zvika Yehudai <zyehudai@habana.ai>
---
 .../include/gaudi2/asic_reg/gaudi2_regs.h     |  10 +-
 .../include/gaudi2/asic_reg/nic0_phy_regs.h   |  59 ++
 .../nic0_qm0_axuser_nonsecured_regs.h         |  61 ++
 .../include/gaudi2/asic_reg/nic0_qpc1_regs.h  | 905 ++++++++++++++++++
 .../include/gaudi2/asic_reg/nic0_rxe0_regs.h  | 725 ++++++++++++++
 .../include/gaudi2/asic_reg/nic0_rxe1_regs.h  | 725 ++++++++++++++
 .../include/gaudi2/asic_reg/nic0_txe0_regs.h  | 529 ++++++++++
 .../include/gaudi2/asic_reg/nic0_txs0_regs.h  | 289 ++++++
 8 files changed, 3302 insertions(+), 1 deletion(-)
 create mode 100644 drivers/accel/habanalabs/include/gaudi2/asic_reg/nic0_phy_regs.h
 create mode 100644 drivers/accel/habanalabs/include/gaudi2/asic_reg/nic0_qm0_axuser_nonsecured_regs.h
 create mode 100644 drivers/accel/habanalabs/include/gaudi2/asic_reg/nic0_qpc1_regs.h
 create mode 100644 drivers/accel/habanalabs/include/gaudi2/asic_reg/nic0_rxe0_regs.h
 create mode 100644 drivers/accel/habanalabs/include/gaudi2/asic_reg/nic0_rxe1_regs.h
 create mode 100644 drivers/accel/habanalabs/include/gaudi2/asic_reg/nic0_txe0_regs.h
 create mode 100644 drivers/accel/habanalabs/include/gaudi2/asic_reg/nic0_txs0_regs.h

diff --git a/drivers/accel/habanalabs/include/gaudi2/asic_reg/gaudi2_regs.h b/drivers/accel/habanalabs/include/gaudi2/asic_reg/gaudi2_regs.h
index d21fcd3880b4..4aa0117dc62a 100644
--- a/drivers/accel/habanalabs/include/gaudi2/asic_reg/gaudi2_regs.h
+++ b/drivers/accel/habanalabs/include/gaudi2/asic_reg/gaudi2_regs.h
@@ -1,6 +1,6 @@
 /* SPDX-License-Identifier: GPL-2.0
  *
- * Copyright 2020-2023 HabanaLabs, Ltd.
+ * Copyright 2020-2024 HabanaLabs, Ltd.
  * All Rights Reserved.
  *
  */
@@ -563,6 +563,14 @@
 #include "nic0_qm0_cgm_regs.h"
 #include "nic0_umr0_0_completion_queue_ci_1_regs.h"
 #include "nic0_umr0_0_unsecure_doorbell0_regs.h"
+#include "nic0_qm0_axuser_nonsecured_regs.h"
+#include "nic0_txe0_regs.h"
+#include "nic0_rxe0_regs.h"
+#include "nic0_rxe1_regs.h"
+#include "nic0_txs0_regs.h"
+#include "nic0_phy_regs.h"
+#include "nic0_qpc1_regs.h"
+#include "nic0_rxe0_regs.h"
 
 #define NIC_OFFSET		(mmNIC1_MSTR_IF_RR_SHRD_HBW_BASE - mmNIC0_MSTR_IF_RR_SHRD_HBW_BASE)
 
diff --git a/drivers/accel/habanalabs/include/gaudi2/asic_reg/nic0_phy_regs.h b/drivers/accel/habanalabs/include/gaudi2/asic_reg/nic0_phy_regs.h
new file mode 100644
index 000000000000..f7d21bf181fd
--- /dev/null
+++ b/drivers/accel/habanalabs/include/gaudi2/asic_reg/nic0_phy_regs.h
@@ -0,0 +1,59 @@
+/* SPDX-License-Identifier: GPL-2.0
+ *
+ * Copyright 2016-2020 HabanaLabs, Ltd.
+ * All Rights Reserved.
+ *
+ */
+
+/************************************
+ ** This is an auto-generated file **
+ **       DO NOT EDIT BELOW        **
+ ************************************/
+
+#ifndef ASIC_REG_NIC0_PHY_REGS_H_
+#define ASIC_REG_NIC0_PHY_REGS_H_
+
+/*
+ *****************************************
+ *   NIC0_PHY
+ *   (Prototype: PRT_PHY)
+ *****************************************
+ */
+
+#define mmNIC0_PHY_PHY_RX_STS_0 0x5460000
+
+#define mmNIC0_PHY_PHY_RX_STS_1 0x5460004
+
+#define mmNIC0_PHY_PHY_RX_STS_2 0x5460008
+
+#define mmNIC0_PHY_PHY_RX_STS_3 0x546000C
+
+#define mmNIC0_PHY_PHY_RX_CFG_0 0x5460010
+
+#define mmNIC0_PHY_PHY_RX_CFG_1 0x5460014
+
+#define mmNIC0_PHY_PHY_RX_CFG_2 0x5460018
+
+#define mmNIC0_PHY_PHY_RX_CFG_3 0x546001C
+
+#define mmNIC0_PHY_PHY_TX_STS_0 0x5460020
+
+#define mmNIC0_PHY_PHY_TX_STS_1 0x5460024
+
+#define mmNIC0_PHY_PHY_TX_STS_2 0x5460028
+
+#define mmNIC0_PHY_PHY_TX_STS_3 0x546002C
+
+#define mmNIC0_PHY_PHY_RST_CFG 0x5460030
+
+#define mmNIC0_PHY_PHY_CFG_ADDR 0x5460040
+
+#define mmNIC0_PHY_PHY_LINK_STS_INTR 0x5460050
+
+#define mmNIC0_PHY_PHY_IDDQ_0 0x5460060
+
+#define mmNIC0_PHY_PHY_IDDQ_1 0x5460064
+
+#define mmNIC0_PHY_PHY_ASYNC_LANE_SWAP 0x5460068
+
+#endif /* ASIC_REG_NIC0_PHY_REGS_H_ */
diff --git a/drivers/accel/habanalabs/include/gaudi2/asic_reg/nic0_qm0_axuser_nonsecured_regs.h b/drivers/accel/habanalabs/include/gaudi2/asic_reg/nic0_qm0_axuser_nonsecured_regs.h
new file mode 100644
index 000000000000..adc0eec56f0c
--- /dev/null
+++ b/drivers/accel/habanalabs/include/gaudi2/asic_reg/nic0_qm0_axuser_nonsecured_regs.h
@@ -0,0 +1,61 @@
+/* SPDX-License-Identifier: GPL-2.0
+ *
+ * Copyright 2016-2020 HabanaLabs, Ltd.
+ * All Rights Reserved.
+ *
+ */
+
+/************************************
+ ** This is an auto-generated file **
+ **       DO NOT EDIT BELOW        **
+ ************************************/
+
+#ifndef ASIC_REG_NIC0_QM0_AXUSER_NONSECURED_REGS_H_
+#define ASIC_REG_NIC0_QM0_AXUSER_NONSECURED_REGS_H_
+
+/*
+ *****************************************
+ *   NIC0_QM0_AXUSER_NONSECURED
+ *   (Prototype: AXUSER)
+ *****************************************
+ */
+
+#define mmNIC0_QM0_AXUSER_NONSECURED_HB_ASID 0x541AB80
+
+#define mmNIC0_QM0_AXUSER_NONSECURED_HB_MMU_BP 0x541AB84
+
+#define mmNIC0_QM0_AXUSER_NONSECURED_HB_STRONG_ORDER 0x541AB88
+
+#define mmNIC0_QM0_AXUSER_NONSECURED_HB_NO_SNOOP 0x541AB8C
+
+#define mmNIC0_QM0_AXUSER_NONSECURED_HB_WR_REDUCTION 0x541AB90
+
+#define mmNIC0_QM0_AXUSER_NONSECURED_HB_RD_ATOMIC 0x541AB94
+
+#define mmNIC0_QM0_AXUSER_NONSECURED_HB_QOS 0x541AB98
+
+#define mmNIC0_QM0_AXUSER_NONSECURED_HB_RSVD 0x541AB9C
+
+#define mmNIC0_QM0_AXUSER_NONSECURED_HB_EMEM_CPAGE 0x541ABA0
+
+#define mmNIC0_QM0_AXUSER_NONSECURED_HB_CORE 0x541ABA4
+
+#define mmNIC0_QM0_AXUSER_NONSECURED_E2E_COORD 0x541ABA8
+
+#define mmNIC0_QM0_AXUSER_NONSECURED_HB_WR_OVRD_LO 0x541ABB0
+
+#define mmNIC0_QM0_AXUSER_NONSECURED_HB_WR_OVRD_HI 0x541ABB4
+
+#define mmNIC0_QM0_AXUSER_NONSECURED_HB_RD_OVRD_LO 0x541ABB8
+
+#define mmNIC0_QM0_AXUSER_NONSECURED_HB_RD_OVRD_HI 0x541ABBC
+
+#define mmNIC0_QM0_AXUSER_NONSECURED_LB_COORD 0x541ABC0
+
+#define mmNIC0_QM0_AXUSER_NONSECURED_LB_LOCK 0x541ABC4
+
+#define mmNIC0_QM0_AXUSER_NONSECURED_LB_RSVD 0x541ABC8
+
+#define mmNIC0_QM0_AXUSER_NONSECURED_LB_OVRD 0x541ABCC
+
+#endif /* ASIC_REG_NIC0_QM0_AXUSER_NONSECURED_REGS_H_ */
diff --git a/drivers/accel/habanalabs/include/gaudi2/asic_reg/nic0_qpc1_regs.h b/drivers/accel/habanalabs/include/gaudi2/asic_reg/nic0_qpc1_regs.h
new file mode 100644
index 000000000000..9d1443fffb2d
--- /dev/null
+++ b/drivers/accel/habanalabs/include/gaudi2/asic_reg/nic0_qpc1_regs.h
@@ -0,0 +1,905 @@
+/* SPDX-License-Identifier: GPL-2.0
+ *
+ * Copyright 2016-2020 HabanaLabs, Ltd.
+ * All Rights Reserved.
+ *
+ */
+
+/************************************
+ ** This is an auto-generated file **
+ **       DO NOT EDIT BELOW        **
+ ************************************/
+
+#ifndef ASIC_REG_NIC0_QPC1_REGS_H_
+#define ASIC_REG_NIC0_QPC1_REGS_H_
+
+/*
+ *****************************************
+ *   NIC0_QPC1
+ *   (Prototype: NIC_QPC)
+ *****************************************
+ */
+
+#define mmNIC0_QPC1_REQ_QPC_CACHE_INVALIDATE 0x543F000
+
+#define mmNIC0_QPC1_REQ_QPC_CACHE_INV_STATUS 0x543F004
+
+#define mmNIC0_QPC1_REQ_STATIC_CONFIG 0x543F008
+
+#define mmNIC0_QPC1_REQ_BASE_ADDRESS_63_32 0x543F00C
+
+#define mmNIC0_QPC1_REQ_BASE_ADDRESS_31_7 0x543F010
+
+#define mmNIC0_QPC1_REQ_CLEAN_LINK_LIST 0x543F014
+
+#define mmNIC0_QPC1_REQ_ERR_FIFO_PUSH_63_32 0x543F018
+
+#define mmNIC0_QPC1_REQ_ERR_FIFO_PUSH_31_0 0x543F01C
+
+#define mmNIC0_QPC1_REQ_ERR_QP_STATE_63_32 0x543F020
+
+#define mmNIC0_QPC1_REQ_ERR_QP_STATE_31_0 0x543F024
+
+#define mmNIC0_QPC1_RETRY_COUNT_MAX 0x543F028
+
+#define mmNIC0_QPC1_AXI_PROT 0x543F030
+
+#define mmNIC0_QPC1_RES_QPC_CACHE_INVALIDATE 0x543F034
+
+#define mmNIC0_QPC1_RES_QPC_CACHE_INV_STATUS 0x543F038
+
+#define mmNIC0_QPC1_RES_STATIC_CONFIG 0x543F03C
+
+#define mmNIC0_QPC1_RES_BASE_ADDRESS_63_32 0x543F040
+
+#define mmNIC0_QPC1_RES_BASE_ADDRESS_31_7 0x543F044
+
+#define mmNIC0_QPC1_RES_CLEAN_LINK_LIST 0x543F048
+
+#define mmNIC0_QPC1_ERR_FIFO_WRITE_INDEX 0x543F050
+
+#define mmNIC0_QPC1_ERR_FIFO_PRODUCER_INDEX 0x543F054
+
+#define mmNIC0_QPC1_ERR_FIFO_CONSUMER_INDEX 0x543F058
+
+#define mmNIC0_QPC1_ERR_FIFO_MASK 0x543F05C
+
+#define mmNIC0_QPC1_ERR_FIFO_CREDIT 0x543F060
+
+#define mmNIC0_QPC1_ERR_FIFO_CFG 0x543F064
+
+#define mmNIC0_QPC1_ERR_FIFO_INTR_MASK 0x543F068
+
+#define mmNIC0_QPC1_ERR_FIFO_BASE_ADDR_63_32 0x543F06C
+
+#define mmNIC0_QPC1_ERR_FIFO_BASE_ADDR_31_7 0x543F070
+
+#define mmNIC0_QPC1_GW_BUSY 0x543F080
+
+#define mmNIC0_QPC1_GW_CTRL 0x543F084
+
+#define mmNIC0_QPC1_GW_DATA_0 0x543F08C
+
+#define mmNIC0_QPC1_GW_DATA_1 0x543F090
+
+#define mmNIC0_QPC1_GW_DATA_2 0x543F094
+
+#define mmNIC0_QPC1_GW_DATA_3 0x543F098
+
+#define mmNIC0_QPC1_GW_DATA_4 0x543F09C
+
+#define mmNIC0_QPC1_GW_DATA_5 0x543F0A0
+
+#define mmNIC0_QPC1_GW_DATA_6 0x543F0A4
+
+#define mmNIC0_QPC1_GW_DATA_7 0x543F0A8
+
+#define mmNIC0_QPC1_GW_DATA_8 0x543F0AC
+
+#define mmNIC0_QPC1_GW_DATA_9 0x543F0B0
+
+#define mmNIC0_QPC1_GW_DATA_10 0x543F0B4
+
+#define mmNIC0_QPC1_GW_DATA_11 0x543F0B8
+
+#define mmNIC0_QPC1_GW_DATA_12 0x543F0BC
+
+#define mmNIC0_QPC1_GW_DATA_13 0x543F0C0
+
+#define mmNIC0_QPC1_GW_DATA_14 0x543F0C4
+
+#define mmNIC0_QPC1_GW_DATA_15 0x543F0C8
+
+#define mmNIC0_QPC1_GW_DATA_16 0x543F0CC
+
+#define mmNIC0_QPC1_GW_DATA_17 0x543F0D0
+
+#define mmNIC0_QPC1_GW_DATA_18 0x543F0D4
+
+#define mmNIC0_QPC1_GW_DATA_19 0x543F0D8
+
+#define mmNIC0_QPC1_GW_DATA_20 0x543F0DC
+
+#define mmNIC0_QPC1_GW_DATA_21 0x543F0E0
+
+#define mmNIC0_QPC1_GW_DATA_22 0x543F0E4
+
+#define mmNIC0_QPC1_GW_DATA_23 0x543F0E8
+
+#define mmNIC0_QPC1_GW_DATA_24 0x543F0EC
+
+#define mmNIC0_QPC1_GW_DATA_25 0x543F0F0
+
+#define mmNIC0_QPC1_GW_DATA_26 0x543F0F4
+
+#define mmNIC0_QPC1_GW_DATA_27 0x543F0F8
+
+#define mmNIC0_QPC1_GW_DATA_28 0x543F0FC
+
+#define mmNIC0_QPC1_GW_DATA_29 0x543F100
+
+#define mmNIC0_QPC1_GW_DATA_30 0x543F104
+
+#define mmNIC0_QPC1_GW_DATA_31 0x543F108
+
+#define mmNIC0_QPC1_GW_MASK_0 0x543F124
+
+#define mmNIC0_QPC1_GW_MASK_1 0x543F128
+
+#define mmNIC0_QPC1_GW_MASK_2 0x543F12C
+
+#define mmNIC0_QPC1_GW_MASK_3 0x543F130
+
+#define mmNIC0_QPC1_GW_MASK_4 0x543F134
+
+#define mmNIC0_QPC1_GW_MASK_5 0x543F138
+
+#define mmNIC0_QPC1_GW_MASK_6 0x543F13C
+
+#define mmNIC0_QPC1_GW_MASK_7 0x543F140
+
+#define mmNIC0_QPC1_GW_MASK_8 0x543F144
+
+#define mmNIC0_QPC1_GW_MASK_9 0x543F148
+
+#define mmNIC0_QPC1_GW_MASK_10 0x543F14C
+
+#define mmNIC0_QPC1_GW_MASK_11 0x543F150
+
+#define mmNIC0_QPC1_GW_MASK_12 0x543F154
+
+#define mmNIC0_QPC1_GW_MASK_13 0x543F158
+
+#define mmNIC0_QPC1_GW_MASK_14 0x543F15C
+
+#define mmNIC0_QPC1_GW_MASK_15 0x543F160
+
+#define mmNIC0_QPC1_GW_MASK_16 0x543F164
+
+#define mmNIC0_QPC1_GW_MASK_17 0x543F168
+
+#define mmNIC0_QPC1_GW_MASK_18 0x543F16C
+
+#define mmNIC0_QPC1_GW_MASK_19 0x543F170
+
+#define mmNIC0_QPC1_GW_MASK_20 0x543F174
+
+#define mmNIC0_QPC1_GW_MASK_21 0x543F178
+
+#define mmNIC0_QPC1_GW_MASK_22 0x543F17C
+
+#define mmNIC0_QPC1_GW_MASK_23 0x543F180
+
+#define mmNIC0_QPC1_GW_MASK_24 0x543F184
+
+#define mmNIC0_QPC1_GW_MASK_25 0x543F188
+
+#define mmNIC0_QPC1_GW_MASK_26 0x543F18C
+
+#define mmNIC0_QPC1_GW_MASK_27 0x543F190
+
+#define mmNIC0_QPC1_GW_MASK_28 0x543F194
+
+#define mmNIC0_QPC1_GW_MASK_29 0x543F198
+
+#define mmNIC0_QPC1_GW_MASK_30 0x543F19C
+
+#define mmNIC0_QPC1_GW_MASK_31 0x543F1A0
+
+#define mmNIC0_QPC1_CC_TIMEOUT 0x543F1B0
+
+#define mmNIC0_QPC1_CC_WINDOW_INC_EN 0x543F1FC
+
+#define mmNIC0_QPC1_CC_TICK_WRAP 0x543F200
+
+#define mmNIC0_QPC1_CC_ROLLBACK 0x543F204
+
+#define mmNIC0_QPC1_CC_MAX_WINDOW_SIZE 0x543F208
+
+#define mmNIC0_QPC1_CC_MIN_WINDOW_SIZE 0x543F20C
+
+#define mmNIC0_QPC1_CC_ALPHA_LINEAR_0 0x543F210
+
+#define mmNIC0_QPC1_CC_ALPHA_LINEAR_1 0x543F214
+
+#define mmNIC0_QPC1_CC_ALPHA_LINEAR_2 0x543F218
+
+#define mmNIC0_QPC1_CC_ALPHA_LINEAR_3 0x543F21C
+
+#define mmNIC0_QPC1_CC_ALPHA_LINEAR_4 0x543F220
+
+#define mmNIC0_QPC1_CC_ALPHA_LINEAR_5 0x543F224
+
+#define mmNIC0_QPC1_CC_ALPHA_LINEAR_6 0x543F228
+
+#define mmNIC0_QPC1_CC_ALPHA_LINEAR_7 0x543F22C
+
+#define mmNIC0_QPC1_CC_ALPHA_LINEAR_8 0x543F230
+
+#define mmNIC0_QPC1_CC_ALPHA_LINEAR_9 0x543F234
+
+#define mmNIC0_QPC1_CC_ALPHA_LINEAR_10 0x543F238
+
+#define mmNIC0_QPC1_CC_ALPHA_LINEAR_11 0x543F23C
+
+#define mmNIC0_QPC1_CC_ALPHA_LINEAR_12 0x543F240
+
+#define mmNIC0_QPC1_CC_ALPHA_LINEAR_13 0x543F244
+
+#define mmNIC0_QPC1_CC_ALPHA_LINEAR_14 0x543F248
+
+#define mmNIC0_QPC1_CC_ALPHA_LINEAR_15 0x543F24C
+
+#define mmNIC0_QPC1_CC_ALPHA_LOG_0 0x543F250
+
+#define mmNIC0_QPC1_CC_ALPHA_LOG_1 0x543F254
+
+#define mmNIC0_QPC1_CC_ALPHA_LOG_2 0x543F258
+
+#define mmNIC0_QPC1_CC_ALPHA_LOG_3 0x543F25C
+
+#define mmNIC0_QPC1_CC_ALPHA_LOG_4 0x543F260
+
+#define mmNIC0_QPC1_CC_ALPHA_LOG_5 0x543F264
+
+#define mmNIC0_QPC1_CC_ALPHA_LOG_6 0x543F268
+
+#define mmNIC0_QPC1_CC_ALPHA_LOG_7 0x543F26C
+
+#define mmNIC0_QPC1_CC_ALPHA_LOG_8 0x543F270
+
+#define mmNIC0_QPC1_CC_ALPHA_LOG_9 0x543F274
+
+#define mmNIC0_QPC1_CC_ALPHA_LOG_10 0x543F278
+
+#define mmNIC0_QPC1_CC_ALPHA_LOG_11 0x543F27C
+
+#define mmNIC0_QPC1_CC_ALPHA_LOG_12 0x543F280
+
+#define mmNIC0_QPC1_CC_ALPHA_LOG_13 0x543F284
+
+#define mmNIC0_QPC1_CC_ALPHA_LOG_14 0x543F288
+
+#define mmNIC0_QPC1_CC_ALPHA_LOG_15 0x543F28C
+
+#define mmNIC0_QPC1_CC_ALPHA_LOG_THRESHOLD_0 0x543F290
+
+#define mmNIC0_QPC1_CC_ALPHA_LOG_THRESHOLD_1 0x543F294
+
+#define mmNIC0_QPC1_CC_ALPHA_LOG_THRESHOLD_2 0x543F298
+
+#define mmNIC0_QPC1_CC_ALPHA_LOG_THRESHOLD_3 0x543F29C
+
+#define mmNIC0_QPC1_CC_ALPHA_LOG_THRESHOLD_4 0x543F2A0
+
+#define mmNIC0_QPC1_CC_ALPHA_LOG_THRESHOLD_5 0x543F2A4
+
+#define mmNIC0_QPC1_CC_ALPHA_LOG_THRESHOLD_6 0x543F2A8
+
+#define mmNIC0_QPC1_CC_ALPHA_LOG_THRESHOLD_7 0x543F2AC
+
+#define mmNIC0_QPC1_CC_ALPHA_LOG_THRESHOLD_8 0x543F2B0
+
+#define mmNIC0_QPC1_CC_ALPHA_LOG_THRESHOLD_9 0x543F2B4
+
+#define mmNIC0_QPC1_CC_ALPHA_LOG_THRESHOLD_10 0x543F2B8
+
+#define mmNIC0_QPC1_CC_ALPHA_LOG_THRESHOLD_11 0x543F2BC
+
+#define mmNIC0_QPC1_CC_ALPHA_LOG_THRESHOLD_12 0x543F2C0
+
+#define mmNIC0_QPC1_CC_ALPHA_LOG_THRESHOLD_13 0x543F2C4
+
+#define mmNIC0_QPC1_CC_ALPHA_LOG_THRESHOLD_14 0x543F2C8
+
+#define mmNIC0_QPC1_CC_ALPHA_LOG_THRESHOLD_15 0x543F2CC
+
+#define mmNIC0_QPC1_CC_WINDOW_INC_0 0x543F2D0
+
+#define mmNIC0_QPC1_CC_WINDOW_INC_1 0x543F2D4
+
+#define mmNIC0_QPC1_CC_WINDOW_INC_2 0x543F2D8
+
+#define mmNIC0_QPC1_CC_WINDOW_INC_3 0x543F2DC
+
+#define mmNIC0_QPC1_CC_WINDOW_INC_4 0x543F2E0
+
+#define mmNIC0_QPC1_CC_WINDOW_INC_5 0x543F2E4
+
+#define mmNIC0_QPC1_CC_WINDOW_INC_6 0x543F2E8
+
+#define mmNIC0_QPC1_CC_WINDOW_INC_7 0x543F2EC
+
+#define mmNIC0_QPC1_CC_WINDOW_INC_8 0x543F2F0
+
+#define mmNIC0_QPC1_CC_WINDOW_INC_9 0x543F2F4
+
+#define mmNIC0_QPC1_CC_WINDOW_INC_10 0x543F2F8
+
+#define mmNIC0_QPC1_CC_WINDOW_INC_11 0x543F2FC
+
+#define mmNIC0_QPC1_CC_WINDOW_INC_12 0x543F300
+
+#define mmNIC0_QPC1_CC_WINDOW_INC_13 0x543F304
+
+#define mmNIC0_QPC1_CC_WINDOW_INC_14 0x543F308
+
+#define mmNIC0_QPC1_CC_WINDOW_INC_15 0x543F30C
+
+#define mmNIC0_QPC1_CC_WINDOW_IN_THRESHOLD_0 0x543F310
+
+#define mmNIC0_QPC1_CC_WINDOW_IN_THRESHOLD_1 0x543F314
+
+#define mmNIC0_QPC1_CC_WINDOW_IN_THRESHOLD_2 0x543F318
+
+#define mmNIC0_QPC1_CC_WINDOW_IN_THRESHOLD_3 0x543F31C
+
+#define mmNIC0_QPC1_CC_WINDOW_IN_THRESHOLD_4 0x543F320
+
+#define mmNIC0_QPC1_CC_WINDOW_IN_THRESHOLD_5 0x543F324
+
+#define mmNIC0_QPC1_CC_WINDOW_IN_THRESHOLD_6 0x543F328
+
+#define mmNIC0_QPC1_CC_WINDOW_IN_THRESHOLD_7 0x543F32C
+
+#define mmNIC0_QPC1_CC_WINDOW_IN_THRESHOLD_8 0x543F330
+
+#define mmNIC0_QPC1_CC_WINDOW_IN_THRESHOLD_9 0x543F334
+
+#define mmNIC0_QPC1_CC_WINDOW_IN_THRESHOLD_10 0x543F338
+
+#define mmNIC0_QPC1_CC_WINDOW_IN_THRESHOLD_11 0x543F33C
+
+#define mmNIC0_QPC1_CC_WINDOW_IN_THRESHOLD_12 0x543F340
+
+#define mmNIC0_QPC1_CC_WINDOW_IN_THRESHOLD_13 0x543F344
+
+#define mmNIC0_QPC1_CC_WINDOW_IN_THRESHOLD_14 0x543F348
+
+#define mmNIC0_QPC1_CC_WINDOW_IN_THRESHOLD_15 0x543F34C
+
+#define mmNIC0_QPC1_DB_FIFO_USER_OVRD_0 0x543F360
+
+#define mmNIC0_QPC1_DB_FIFO_USER_OVRD_1 0x543F364
+
+#define mmNIC0_QPC1_DB_FIFO_USER_OVRD_2 0x543F368
+
+#define mmNIC0_QPC1_DB_FIFO_USER_OVRD_3 0x543F36C
+
+#define mmNIC0_QPC1_DB_FIFO_USER_OVRD_4 0x543F370
+
+#define mmNIC0_QPC1_DB_FIFO_USER_OVRD_5 0x543F374
+
+#define mmNIC0_QPC1_DB_FIFO_USER_OVRD_6 0x543F378
+
+#define mmNIC0_QPC1_DB_FIFO_USER_OVRD_7 0x543F37C
+
+#define mmNIC0_QPC1_DB_FIFO_USER_OVRD_8 0x543F380
+
+#define mmNIC0_QPC1_DB_FIFO_USER_OVRD_9 0x543F384
+
+#define mmNIC0_QPC1_DB_FIFO_USER_OVRD_10 0x543F388
+
+#define mmNIC0_QPC1_DB_FIFO_USER_OVRD_11 0x543F38C
+
+#define mmNIC0_QPC1_DB_FIFO_USER_OVRD_12 0x543F390
+
+#define mmNIC0_QPC1_DB_FIFO_USER_OVRD_13 0x543F394
+
+#define mmNIC0_QPC1_DB_FIFO_USER_OVRD_14 0x543F398
+
+#define mmNIC0_QPC1_DB_FIFO_USER_OVRD_15 0x543F39C
+
+#define mmNIC0_QPC1_DB_FIFO_USER_OVRD_16 0x543F3A0
+
+#define mmNIC0_QPC1_DB_FIFO_USER_OVRD_17 0x543F3A4
+
+#define mmNIC0_QPC1_DB_FIFO_USER_OVRD_18 0x543F3A8
+
+#define mmNIC0_QPC1_DB_FIFO_USER_OVRD_19 0x543F3AC
+
+#define mmNIC0_QPC1_DB_FIFO_USER_OVRD_20 0x543F3B0
+
+#define mmNIC0_QPC1_DB_FIFO_USER_OVRD_21 0x543F3B4
+
+#define mmNIC0_QPC1_DB_FIFO_USER_OVRD_22 0x543F3B8
+
+#define mmNIC0_QPC1_DB_FIFO_USER_OVRD_23 0x543F3BC
+
+#define mmNIC0_QPC1_DB_FIFO_USER_OVRD_24 0x543F3C0
+
+#define mmNIC0_QPC1_DB_FIFO_USER_OVRD_25 0x543F3C4
+
+#define mmNIC0_QPC1_DB_FIFO_USER_OVRD_26 0x543F3C8
+
+#define mmNIC0_QPC1_DB_FIFO_USER_OVRD_27 0x543F3CC
+
+#define mmNIC0_QPC1_DB_FIFO_USER_OVRD_28 0x543F3D0
+
+#define mmNIC0_QPC1_DB_FIFO_USER_OVRD_29 0x543F3D4
+
+#define mmNIC0_QPC1_DB_FIFO_USER_OVRD_30 0x543F3D8
+
+#define mmNIC0_QPC1_DB_FIFO_USER_OVRD_31 0x543F3DC
+
+#define mmNIC0_QPC1_DB_FIFO_CFG_0 0x543F3E0
+
+#define mmNIC0_QPC1_DB_FIFO_CFG_1 0x543F3E4
+
+#define mmNIC0_QPC1_DB_FIFO_CFG_2 0x543F3E8
+
+#define mmNIC0_QPC1_DB_FIFO_CFG_3 0x543F3EC
+
+#define mmNIC0_QPC1_DB_FIFO_CFG_4 0x543F3F0
+
+#define mmNIC0_QPC1_DB_FIFO_CFG_5 0x543F3F4
+
+#define mmNIC0_QPC1_DB_FIFO_CFG_6 0x543F3F8
+
+#define mmNIC0_QPC1_DB_FIFO_CFG_7 0x543F3FC
+
+#define mmNIC0_QPC1_DB_FIFO_CFG_8 0x543F400
+
+#define mmNIC0_QPC1_DB_FIFO_CFG_9 0x543F404
+
+#define mmNIC0_QPC1_DB_FIFO_CFG_10 0x543F408
+
+#define mmNIC0_QPC1_DB_FIFO_CFG_11 0x543F40C
+
+#define mmNIC0_QPC1_DB_FIFO_CFG_12 0x543F410
+
+#define mmNIC0_QPC1_DB_FIFO_CFG_13 0x543F414
+
+#define mmNIC0_QPC1_DB_FIFO_CFG_14 0x543F418
+
+#define mmNIC0_QPC1_DB_FIFO_CFG_15 0x543F41C
+
+#define mmNIC0_QPC1_DB_FIFO_CFG_16 0x543F420
+
+#define mmNIC0_QPC1_DB_FIFO_CFG_17 0x543F424
+
+#define mmNIC0_QPC1_DB_FIFO_CFG_18 0x543F428
+
+#define mmNIC0_QPC1_DB_FIFO_CFG_19 0x543F42C
+
+#define mmNIC0_QPC1_DB_FIFO_CFG_20 0x543F430
+
+#define mmNIC0_QPC1_DB_FIFO_CFG_21 0x543F434
+
+#define mmNIC0_QPC1_DB_FIFO_CFG_22 0x543F438
+
+#define mmNIC0_QPC1_DB_FIFO_CFG_23 0x543F43C
+
+#define mmNIC0_QPC1_DB_FIFO_CFG_24 0x543F440
+
+#define mmNIC0_QPC1_DB_FIFO_CFG_25 0x543F444
+
+#define mmNIC0_QPC1_DB_FIFO_CFG_26 0x543F448
+
+#define mmNIC0_QPC1_DB_FIFO_CFG_27 0x543F44C
+
+#define mmNIC0_QPC1_DB_FIFO_CFG_28 0x543F450
+
+#define mmNIC0_QPC1_DB_FIFO_CFG_29 0x543F454
+
+#define mmNIC0_QPC1_DB_FIFO_CFG_30 0x543F458
+
+#define mmNIC0_QPC1_DB_FIFO_CFG_31 0x543F45C
+
+#define mmNIC0_QPC1_SECURED_DB_FIRST32 0x543F460
+
+#define mmNIC0_QPC1_SECURED_DB_SECOND32 0x543F464
+
+#define mmNIC0_QPC1_SECURED_DB_THIRD32 0x543F468
+
+#define mmNIC0_QPC1_SECURED_DB_FOURTH32 0x543F46C
+
+#define mmNIC0_QPC1_PRIVILEGE_DB_FIRST32 0x543F470
+
+#define mmNIC0_QPC1_PRIVILEGE_DB_SECOND32 0x543F474
+
+#define mmNIC0_QPC1_PRIVILEGE_DB_THIRD32 0x543F478
+
+#define mmNIC0_QPC1_PRIVILEGE_DB_FOURTH32 0x543F47C
+
+#define mmNIC0_QPC1_DBG_INDICATION 0x543F480
+
+#define mmNIC0_QPC1_WTD_WC_FSM 0x543F484
+
+#define mmNIC0_QPC1_WTD_SLICE_FSM 0x543F488
+
+#define mmNIC0_QPC1_REQ_TX_EMPTY_CNT 0x543F48C
+
+#define mmNIC0_QPC1_RES_TX_EMPTY_CNT 0x543F490
+
+#define mmNIC0_QPC1_NUM_ROLLBACKS 0x543F494
+
+#define mmNIC0_QPC1_LAST_QP_ROLLED_BACK 0x543F498
+
+#define mmNIC0_QPC1_NUM_TIMEOUTS 0x543F49C
+
+#define mmNIC0_QPC1_LAST_QP_TIMED_OUT 0x543F4A0
+
+#define mmNIC0_QPC1_WTD_SLICE_FSM_HI 0x543F4A4
+
+#define mmNIC0_QPC1_INTERRUPT_BASE_0 0x543F4B0
+
+#define mmNIC0_QPC1_INTERRUPT_BASE_1 0x543F4B4
+
+#define mmNIC0_QPC1_INTERRUPT_BASE_2 0x543F4B8
+
+#define mmNIC0_QPC1_INTERRUPT_BASE_3 0x543F4BC
+
+#define mmNIC0_QPC1_INTERRUPT_BASE_4 0x543F4C0
+
+#define mmNIC0_QPC1_INTERRUPT_BASE_5 0x543F4C4
+
+#define mmNIC0_QPC1_INTERRUPT_BASE_6 0x543F4C8
+
+#define mmNIC0_QPC1_INTERRUPT_BASE_7 0x543F4CC
+
+#define mmNIC0_QPC1_INTERRUPT_BASE_8 0x543F4D0
+
+#define mmNIC0_QPC1_INTERRUPT_BASE_9 0x543F4D4
+
+#define mmNIC0_QPC1_INTERRUPT_BASE_10 0x543F4D8
+
+#define mmNIC0_QPC1_INTERRUPT_DATA_0 0x543F4DC
+
+#define mmNIC0_QPC1_INTERRUPT_DATA_1 0x543F4E0
+
+#define mmNIC0_QPC1_INTERRUPT_DATA_2 0x543F4E4
+
+#define mmNIC0_QPC1_INTERRUPT_DATA_3 0x543F4E8
+
+#define mmNIC0_QPC1_INTERRUPT_DATA_4 0x543F4EC
+
+#define mmNIC0_QPC1_INTERRUPT_DATA_5 0x543F4F0
+
+#define mmNIC0_QPC1_INTERRUPT_DATA_6 0x543F4F4
+
+#define mmNIC0_QPC1_INTERRUPT_DATA_7 0x543F4F8
+
+#define mmNIC0_QPC1_INTERRUPT_DATA_8 0x543F4FC
+
+#define mmNIC0_QPC1_INTERRUPT_DATA_9 0x543F500
+
+#define mmNIC0_QPC1_INTERRUPT_DATA_10 0x543F504
+
+#define mmNIC0_QPC1_DBG_COUNT_SELECT_0 0x543F600
+
+#define mmNIC0_QPC1_DBG_COUNT_SELECT_1 0x543F604
+
+#define mmNIC0_QPC1_DBG_COUNT_SELECT_2 0x543F608
+
+#define mmNIC0_QPC1_DBG_COUNT_SELECT_3 0x543F60C
+
+#define mmNIC0_QPC1_DBG_COUNT_SELECT_4 0x543F610
+
+#define mmNIC0_QPC1_DBG_COUNT_SELECT_5 0x543F614
+
+#define mmNIC0_QPC1_DBG_COUNT_SELECT_6 0x543F618
+
+#define mmNIC0_QPC1_DBG_COUNT_SELECT_7 0x543F61C
+
+#define mmNIC0_QPC1_DBG_COUNT_SELECT_8 0x543F620
+
+#define mmNIC0_QPC1_DBG_COUNT_SELECT_9 0x543F624
+
+#define mmNIC0_QPC1_DBG_COUNT_SELECT_10 0x543F628
+
+#define mmNIC0_QPC1_DBG_COUNT_SELECT_11 0x543F62C
+
+#define mmNIC0_QPC1_DOORBELL_SECURITY 0x543F648
+
+#define mmNIC0_QPC1_DBG_CFG 0x543F64C
+
+#define mmNIC0_QPC1_RES_RING0_PI 0x543F650
+
+#define mmNIC0_QPC1_RES_RING0_CI 0x543F654
+
+#define mmNIC0_QPC1_RES_RING0_CFG 0x543F658
+
+#define mmNIC0_QPC1_RES_RING1_PI 0x543F65C
+
+#define mmNIC0_QPC1_RES_RING1_CI 0x543F660
+
+#define mmNIC0_QPC1_RES_RING1_CFG 0x543F664
+
+#define mmNIC0_QPC1_RES_RING2_PI 0x543F668
+
+#define mmNIC0_QPC1_RES_RING2_CI 0x543F66C
+
+#define mmNIC0_QPC1_RES_RING2_CFG 0x543F670
+
+#define mmNIC0_QPC1_RES_RING3_PI 0x543F674
+
+#define mmNIC0_QPC1_RES_RING3_CI 0x543F678
+
+#define mmNIC0_QPC1_RES_RING3_CFG 0x543F67C
+
+#define mmNIC0_QPC1_REQ_RING0_CI 0x543F680
+
+#define mmNIC0_QPC1_REQ_RING1_CI 0x543F684
+
+#define mmNIC0_QPC1_REQ_RING2_CI 0x543F688
+
+#define mmNIC0_QPC1_REQ_RING3_CI 0x543F68C
+
+#define mmNIC0_QPC1_INTERRUPT_CAUSE 0x543F690
+
+#define mmNIC0_QPC1_INTERRUPT_MASK 0x543F694
+
+#define mmNIC0_QPC1_INTERRUPT_CLR 0x543F698
+
+#define mmNIC0_QPC1_INTERRUPT_EN 0x543F69C
+
+#define mmNIC0_QPC1_INTERRUPT_CFG 0x543F6F0
+
+#define mmNIC0_QPC1_INTERRUPT_RESP_ERR_CAUSE 0x543F6F4
+
+#define mmNIC0_QPC1_INTERRUPT_RESP_ERR_MASK 0x543F6F8
+
+#define mmNIC0_QPC1_INTERRUPR_RESP_ERR_CLR 0x543F700
+
+#define mmNIC0_QPC1_TMR_GW_VALID 0x543F704
+
+#define mmNIC0_QPC1_TMR_GW_DATA0 0x543F708
+
+#define mmNIC0_QPC1_TMR_GW_DATA1 0x543F70C
+
+#define mmNIC0_QPC1_RNR_RETRY_COUNT_EN 0x543F710
+
+#define mmNIC0_QPC1_EVENT_QUE_BASE_ADDR_63_32 0x543F830
+
+#define mmNIC0_QPC1_EVENT_QUE_BASE_ADDR_31_7 0x543F834
+
+#define mmNIC0_QPC1_EVENT_QUE_LOG_SIZE 0x543F838
+
+#define mmNIC0_QPC1_EVENT_QUE_WRITE_INDEX 0x543F83C
+
+#define mmNIC0_QPC1_EVENT_QUE_PRODUCER_INDEX 0x543F840
+
+#define mmNIC0_QPC1_EVENT_QUE_PI_ADDR_63_32 0x543F844
+
+#define mmNIC0_QPC1_EVENT_QUE_PI_ADDR_31_7 0x543F848
+
+#define mmNIC0_QPC1_EVENT_QUE_CONSUMER_INDEX_CB 0x543F84C
+
+#define mmNIC0_QPC1_EVENT_QUE_CFG 0x543F850
+
+#define mmNIC0_QPC1_LBW_PROT 0x543F858
+
+#define mmNIC0_QPC1_MEM_WRITE_INIT 0x543F85C
+
+#define mmNIC0_QPC1_QMAN_DOORBELL 0x543F8E8
+
+#define mmNIC0_QPC1_QMAN_DOORBELL_QPN 0x543F8EC
+
+#define mmNIC0_QPC1_SECURED_CQ_NUMBER 0x543F8F0
+
+#define mmNIC0_QPC1_SECURED_CQ_CONSUMER_INDEX 0x543F8F4
+
+#define mmNIC0_QPC1_PRIVILEGE_CQ_NUMBER 0x543F8F8
+
+#define mmNIC0_QPC1_PRIVILEGE_CQ_CONSUMER_INDEX 0x543F8FC
+
+#define mmNIC0_QPC1_TX_WQ_BASE_ADDR_63_32_0 0x543F900
+
+#define mmNIC0_QPC1_TX_WQ_BASE_ADDR_63_32_1 0x543F904
+
+#define mmNIC0_QPC1_TX_WQ_BASE_ADDR_63_32_2 0x543F908
+
+#define mmNIC0_QPC1_TX_WQ_BASE_ADDR_63_32_3 0x543F90C
+
+#define mmNIC0_QPC1_TX_WQ_BASE_ADDR_31_0_0 0x543F910
+
+#define mmNIC0_QPC1_TX_WQ_BASE_ADDR_31_0_1 0x543F914
+
+#define mmNIC0_QPC1_TX_WQ_BASE_ADDR_31_0_2 0x543F918
+
+#define mmNIC0_QPC1_TX_WQ_BASE_ADDR_31_0_3 0x543F91C
+
+#define mmNIC0_QPC1_LOG_MAX_TX_WQ_SIZE_0 0x543F920
+
+#define mmNIC0_QPC1_LOG_MAX_TX_WQ_SIZE_1 0x543F924
+
+#define mmNIC0_QPC1_LOG_MAX_TX_WQ_SIZE_2 0x543F928
+
+#define mmNIC0_QPC1_LOG_MAX_TX_WQ_SIZE_3 0x543F92C
+
+#define mmNIC0_QPC1_MMU_BYPASS_TX_WQ_0 0x543F930
+
+#define mmNIC0_QPC1_MMU_BYPASS_TX_WQ_1 0x543F934
+
+#define mmNIC0_QPC1_MMU_BYPASS_TX_WQ_2 0x543F938
+
+#define mmNIC0_QPC1_MMU_BYPASS_TX_WQ_3 0x543F93C
+
+#define mmNIC0_QPC1_RX_WQ_BASE_ADDR_63_32_0 0x543F940
+
+#define mmNIC0_QPC1_RX_WQ_BASE_ADDR_63_32_1 0x543F944
+
+#define mmNIC0_QPC1_RX_WQ_BASE_ADDR_63_32_2 0x543F948
+
+#define mmNIC0_QPC1_RX_WQ_BASE_ADDR_63_32_3 0x543F94C
+
+#define mmNIC0_QPC1_RX_WQ_BASE_ADDR_31_0_0 0x543F950
+
+#define mmNIC0_QPC1_RX_WQ_BASE_ADDR_31_0_1 0x543F954
+
+#define mmNIC0_QPC1_RX_WQ_BASE_ADDR_31_0_2 0x543F958
+
+#define mmNIC0_QPC1_RX_WQ_BASE_ADDR_31_0_3 0x543F95C
+
+#define mmNIC0_QPC1_LOG_MAX_RX_WQ_SIZE_0 0x543F960
+
+#define mmNIC0_QPC1_LOG_MAX_RX_WQ_SIZE_1 0x543F964
+
+#define mmNIC0_QPC1_LOG_MAX_RX_WQ_SIZE_2 0x543F968
+
+#define mmNIC0_QPC1_LOG_MAX_RX_WQ_SIZE_3 0x543F96C
+
+#define mmNIC0_QPC1_MMU_BYPASS_RX_WQ_0 0x543F970
+
+#define mmNIC0_QPC1_MMU_BYPASS_RX_WQ_1 0x543F974
+
+#define mmNIC0_QPC1_MMU_BYPASS_RX_WQ_2 0x543F978
+
+#define mmNIC0_QPC1_MMU_BYPASS_RX_WQ_3 0x543F97C
+
+#define mmNIC0_QPC1_WQE_MEM_WRITE_AXI_PROT 0x543F980
+
+#define mmNIC0_QPC1_WQ_UPPER_THRESHOLD 0x543F984
+
+#define mmNIC0_QPC1_WQ_LOWER_THRESHOLD 0x543F988
+
+#define mmNIC0_QPC1_WQ_BP_2ARC_ADDR 0x543F98C
+
+#define mmNIC0_QPC1_WQ_BP_2QMAN_ADDR 0x543F990
+
+#define mmNIC0_QPC1_WTD_CONFIG 0x543F994
+
+#define mmNIC0_QPC1_REQTX_ERR_FIFO_PUSH_63_32 0x543F998
+
+#define mmNIC0_QPC1_REQTX_ERR_FIFO_PUSH_31_0 0x543F99C
+
+#define mmNIC0_QPC1_REQTX_ERR_QP_STATE_63_32 0x543F9A0
+
+#define mmNIC0_QPC1_REQTX_ERR_QP_STATE_31_0 0x543F9A4
+
+#define mmNIC0_QPC1_EVENT_QUE_CONSUMER_INDEX 0x543F9A8
+
+#define mmNIC0_QPC1_ARM_CQ_NUM 0x543F9AC
+
+#define mmNIC0_QPC1_ARM_CQ_INDEX 0x543F9B0
+
+#define mmNIC0_QPC1_QPC_CLOCK_GATE 0x543F9B4
+
+#define mmNIC0_QPC1_QPC_CLOCK_GATE_DIS 0x543F9B8
+
+#define mmNIC0_QPC1_CONG_QUE_BASE_ADDR_63_32 0x543F9BC
+
+#define mmNIC0_QPC1_CONG_QUE_BASE_ADDR_31_7 0x543F9C0
+
+#define mmNIC0_QPC1_CONG_QUE_LOG_SIZE 0x543F9C4
+
+#define mmNIC0_QPC1_CONG_QUE_WRITE_INDEX 0x543F9C8
+
+#define mmNIC0_QPC1_CONG_QUE_PRODUCER_INDEX 0x543F9CC
+
+#define mmNIC0_QPC1_CONG_QUE_PI_ADDR_63_32 0x543F9D0
+
+#define mmNIC0_QPC1_CONG_QUE_PI_ADDR_31_7 0x543F9D4
+
+#define mmNIC0_QPC1_CONG_QUE_CONSUMER_INDEX_CB 0x543F9D8
+
+#define mmNIC0_QPC1_CONG_QUE_CFG 0x543F9DC
+
+#define mmNIC0_QPC1_CONG_QUE_CONSUMER_INDEX 0x543F9E0
+
+#define mmNIC0_QPC1_LINEAR_WQE_STATIC_0 0x543FA00
+
+#define mmNIC0_QPC1_LINEAR_WQE_STATIC_1 0x543FA04
+
+#define mmNIC0_QPC1_LINEAR_WQE_STATIC_2 0x543FA08
+
+#define mmNIC0_QPC1_LINEAR_WQE_STATIC_3 0x543FA0C
+
+#define mmNIC0_QPC1_LINEAR_WQE_STATIC_4 0x543FA10
+
+#define mmNIC0_QPC1_LINEAR_WQE_STATIC_5 0x543FA14
+
+#define mmNIC0_QPC1_LINEAR_WQE_STATIC_6 0x543FA18
+
+#define mmNIC0_QPC1_LINEAR_WQE_STATIC_7 0x543FA1C
+
+#define mmNIC0_QPC1_LINEAR_WQE_STATIC_8 0x543FA20
+
+#define mmNIC0_QPC1_LINEAR_WQE_STATIC_9 0x543FA24
+
+#define mmNIC0_QPC1_LINEAR_WQE_DYNAMIC_0 0x543FA40
+
+#define mmNIC0_QPC1_LINEAR_WQE_DYNAMIC_1 0x543FA44
+
+#define mmNIC0_QPC1_LINEAR_WQE_DYNAMIC_2 0x543FA48
+
+#define mmNIC0_QPC1_LINEAR_WQE_DYNAMIC_3 0x543FA4C
+
+#define mmNIC0_QPC1_LINEAR_WQE_DYNAMIC_4 0x543FA50
+
+#define mmNIC0_QPC1_LINEAR_WQE_DYNAMIC_5 0x543FA54
+
+#define mmNIC0_QPC1_LINEAR_WQE_QPN 0x543FA58
+
+#define mmNIC0_QPC1_MULTI_STRIDE_WQE_STATIC_0 0x543FA80
+
+#define mmNIC0_QPC1_MULTI_STRIDE_WQE_STATIC_1 0x543FA84
+
+#define mmNIC0_QPC1_MULTI_STRIDE_WQE_STATIC_2 0x543FA88
+
+#define mmNIC0_QPC1_MULTI_STRIDE_WQE_STATIC_3 0x543FA8C
+
+#define mmNIC0_QPC1_MULTI_STRIDE_WQE_STATIC_4 0x543FA90
+
+#define mmNIC0_QPC1_MULTI_STRIDE_WQE_STATIC_5 0x543FA94
+
+#define mmNIC0_QPC1_MULTI_STRIDE_WQE_STATIC_6 0x543FA98
+
+#define mmNIC0_QPC1_MULTI_STRIDE_WQE_STATIC_7 0x543FA9C
+
+#define mmNIC0_QPC1_MULTI_STRIDE_WQE_STATIC_8 0x543FAA0
+
+#define mmNIC0_QPC1_MULTI_STRIDE_WQE_STATIC_9 0x543FAA4
+
+#define mmNIC0_QPC1_MULTI_STRIDE_WQE_STATIC_10 0x543FAA8
+
+#define mmNIC0_QPC1_MULTI_STRIDE_WQE_STATIC_11 0x543FAAC
+
+#define mmNIC0_QPC1_MULTI_STRIDE_WQE_STATIC_12 0x543FAB0
+
+#define mmNIC0_QPC1_MULTI_STRIDE_WQE_STATIC_13 0x543FAB4
+
+#define mmNIC0_QPC1_MULTI_STRIDE_WQE_STATIC_14 0x543FAB8
+
+#define mmNIC0_QPC1_MULTI_STRIDE_WQE_STATIC_15 0x543FABC
+
+#define mmNIC0_QPC1_MULTI_STRIDE_WQE_STATIC_16 0x543FAC0
+
+#define mmNIC0_QPC1_MULTI_STRIDE_WQE_STATIC_17 0x543FAC4
+
+#define mmNIC0_QPC1_MULTI_STRIDE_WQE_DYNAMIC_0 0x543FAE0
+
+#define mmNIC0_QPC1_MULTI_STRIDE_WQE_DYNAMIC_1 0x543FAE4
+
+#define mmNIC0_QPC1_MULTI_STRIDE_WQE_DYNAMIC_2 0x543FAE8
+
+#define mmNIC0_QPC1_MULTI_STRIDE_WQE_DYNAMIC_3 0x543FAEC
+
+#define mmNIC0_QPC1_MULTI_STRIDE_WQE_DYNAMIC_4 0x543FAF0
+
+#define mmNIC0_QPC1_MULTI_STRIDE_WQE_DYNAMIC_5 0x543FAF4
+
+#define mmNIC0_QPC1_MULTI_STRIDE_WQE_QPN 0x543FAF8
+
+#endif /* ASIC_REG_NIC0_QPC1_REGS_H_ */
diff --git a/drivers/accel/habanalabs/include/gaudi2/asic_reg/nic0_rxe0_regs.h b/drivers/accel/habanalabs/include/gaudi2/asic_reg/nic0_rxe0_regs.h
new file mode 100644
index 000000000000..054414222ae1
--- /dev/null
+++ b/drivers/accel/habanalabs/include/gaudi2/asic_reg/nic0_rxe0_regs.h
@@ -0,0 +1,725 @@
+/* SPDX-License-Identifier: GPL-2.0
+ *
+ * Copyright 2016-2020 HabanaLabs, Ltd.
+ * All Rights Reserved.
+ *
+ */
+
+/************************************
+ ** This is an auto-generated file **
+ **       DO NOT EDIT BELOW        **
+ ************************************/
+
+#ifndef ASIC_REG_NIC0_RXE0_REGS_H_
+#define ASIC_REG_NIC0_RXE0_REGS_H_
+
+/*
+ *****************************************
+ *   NIC0_RXE0
+ *   (Prototype: NIC_RXE)
+ *****************************************
+ */
+
+#define mmNIC0_RXE0_CONTROL 0x544A000
+
+#define mmNIC0_RXE0_SCATTER_CFG 0x544A004
+
+#define mmNIC0_RXE0_SCATTER_CQ_ADDR 0x544A008
+
+#define mmNIC0_RXE0_RAW_QPN_P0_0 0x544A010
+
+#define mmNIC0_RXE0_RAW_QPN_P0_1 0x544A014
+
+#define mmNIC0_RXE0_RAW_QPN_P1_0 0x544A018
+
+#define mmNIC0_RXE0_RAW_QPN_P1_1 0x544A01C
+
+#define mmNIC0_RXE0_RAW_QPN_P2_0 0x544A020
+
+#define mmNIC0_RXE0_RAW_QPN_P2_1 0x544A024
+
+#define mmNIC0_RXE0_RAW_QPN_P3_0 0x544A028
+
+#define mmNIC0_RXE0_RAW_QPN_P3_1 0x544A02C
+
+#define mmNIC0_RXE0_RXE_CHECKS 0x544A030
+
+#define mmNIC0_RXE0_PKT_DROP 0x544A034
+
+#define mmNIC0_RXE0_PKT_SIZE_CHECK_RC 0x544A038
+
+#define mmNIC0_RXE0_PKT_SIZE_CHECK_RAW 0x544A03C
+
+#define mmNIC0_RXE0_ARUSER_MMU_BP 0x544A064
+
+#define mmNIC0_RXE0_AWUSER_LBW 0x544A068
+
+#define mmNIC0_RXE0_ARPROT_HBW 0x544A070
+
+#define mmNIC0_RXE0_AWPROT_LBW 0x544A074
+
+#define mmNIC0_RXE0_WIN0_WQ_BASE_LO 0x544A080
+
+#define mmNIC0_RXE0_WIN0_WQ_BASE_HI 0x544A084
+
+#define mmNIC0_RXE0_WIN0_WQ_MISC 0x544A088
+
+#define mmNIC0_RXE0_WIN1_WQ_BASE_LO 0x544A090
+
+#define mmNIC0_RXE0_WIN1_WQ_BASE_HI 0x544A094
+
+#define mmNIC0_RXE0_WIN1_WQ_MISC 0x544A098
+
+#define mmNIC0_RXE0_WIN2_WQ_BASE_LO 0x544A0A0
+
+#define mmNIC0_RXE0_WIN2_WQ_BASE_HI 0x544A0A4
+
+#define mmNIC0_RXE0_WIN2_WQ_MISC 0x544A0A8
+
+#define mmNIC0_RXE0_WIN3_WQ_BASE_LO 0x544A0B0
+
+#define mmNIC0_RXE0_WIN3_WQ_BASE_HI 0x544A0B4
+
+#define mmNIC0_RXE0_WIN3_WQ_MISC 0x544A0B8
+
+#define mmNIC0_RXE0_CG 0x544A0D0
+
+#define mmNIC0_RXE0_CG_TIMER 0x544A0D4
+
+#define mmNIC0_RXE0_WQE_WQ_WR_OP_DISABLE 0x544A0D8
+
+#define mmNIC0_RXE0_WQE_WQ_RDV_OP_DISABLE 0x544A0DC
+
+#define mmNIC0_RXE0_WQE_WQ_RD_OP_DISABLE 0x544A0E0
+
+#define mmNIC0_RXE0_WQE_MAX_WRITE_SEND_SIZE 0x544A0E4
+
+#define mmNIC0_RXE0_WQE_MAX_MULTI_STRIDE_SIZE 0x544A0E8
+
+#define mmNIC0_RXE0_CACHE_CFG 0x544A0F0
+
+#define mmNIC0_RXE0_CACHE_INFO 0x544A0F4
+
+#define mmNIC0_RXE0_CACHE_ADDR_LO 0x544A0F8
+
+#define mmNIC0_RXE0_CACHE_ADDR_HI 0x544A0FC
+
+#define mmNIC0_RXE0_CQ_BASE_ADDR_31_7 0x544A100
+
+#define mmNIC0_RXE0_CQ_BASE_ADDR_63_32 0x544A104
+
+#define mmNIC0_RXE0_CQ_LOG_MAX_SIZE 0x544A108
+
+#define mmNIC0_RXE0_CQ_ARM_TIMEOUT_EN 0x544A110
+
+#define mmNIC0_RXE0_CQ_ARM_TIMEOUT 0x544A114
+
+#define mmNIC0_RXE0_CQ_CFG_0 0x544A180
+
+#define mmNIC0_RXE0_CQ_CFG_1 0x544A184
+
+#define mmNIC0_RXE0_CQ_CFG_2 0x544A188
+
+#define mmNIC0_RXE0_CQ_CFG_3 0x544A18C
+
+#define mmNIC0_RXE0_CQ_CFG_4 0x544A190
+
+#define mmNIC0_RXE0_CQ_CFG_5 0x544A194
+
+#define mmNIC0_RXE0_CQ_CFG_6 0x544A198
+
+#define mmNIC0_RXE0_CQ_CFG_7 0x544A19C
+
+#define mmNIC0_RXE0_CQ_CFG_8 0x544A1A0
+
+#define mmNIC0_RXE0_CQ_CFG_9 0x544A1A4
+
+#define mmNIC0_RXE0_CQ_CFG_10 0x544A1A8
+
+#define mmNIC0_RXE0_CQ_CFG_11 0x544A1AC
+
+#define mmNIC0_RXE0_CQ_CFG_12 0x544A1B0
+
+#define mmNIC0_RXE0_CQ_CFG_13 0x544A1B4
+
+#define mmNIC0_RXE0_CQ_CFG_14 0x544A1B8
+
+#define mmNIC0_RXE0_CQ_CFG_15 0x544A1BC
+
+#define mmNIC0_RXE0_CQ_CFG_16 0x544A1C0
+
+#define mmNIC0_RXE0_CQ_CFG_17 0x544A1C4
+
+#define mmNIC0_RXE0_CQ_CFG_18 0x544A1C8
+
+#define mmNIC0_RXE0_CQ_CFG_19 0x544A1CC
+
+#define mmNIC0_RXE0_CQ_CFG_20 0x544A1D0
+
+#define mmNIC0_RXE0_CQ_CFG_21 0x544A1D4
+
+#define mmNIC0_RXE0_CQ_CFG_22 0x544A1D8
+
+#define mmNIC0_RXE0_CQ_CFG_23 0x544A1DC
+
+#define mmNIC0_RXE0_CQ_CFG_24 0x544A1E0
+
+#define mmNIC0_RXE0_CQ_CFG_25 0x544A1E4
+
+#define mmNIC0_RXE0_CQ_CFG_26 0x544A1E8
+
+#define mmNIC0_RXE0_CQ_CFG_27 0x544A1EC
+
+#define mmNIC0_RXE0_CQ_CFG_28 0x544A1F0
+
+#define mmNIC0_RXE0_CQ_CFG_29 0x544A1F4
+
+#define mmNIC0_RXE0_CQ_CFG_30 0x544A1F8
+
+#define mmNIC0_RXE0_CQ_CFG_31 0x544A1FC
+
+#define mmNIC0_RXE0_CQ_WRITE_INDEX_0 0x544A200
+
+#define mmNIC0_RXE0_CQ_WRITE_INDEX_1 0x544A204
+
+#define mmNIC0_RXE0_CQ_WRITE_INDEX_2 0x544A208
+
+#define mmNIC0_RXE0_CQ_WRITE_INDEX_3 0x544A20C
+
+#define mmNIC0_RXE0_CQ_WRITE_INDEX_4 0x544A210
+
+#define mmNIC0_RXE0_CQ_WRITE_INDEX_5 0x544A214
+
+#define mmNIC0_RXE0_CQ_WRITE_INDEX_6 0x544A218
+
+#define mmNIC0_RXE0_CQ_WRITE_INDEX_7 0x544A21C
+
+#define mmNIC0_RXE0_CQ_WRITE_INDEX_8 0x544A220
+
+#define mmNIC0_RXE0_CQ_WRITE_INDEX_9 0x544A224
+
+#define mmNIC0_RXE0_CQ_WRITE_INDEX_10 0x544A228
+
+#define mmNIC0_RXE0_CQ_WRITE_INDEX_11 0x544A22C
+
+#define mmNIC0_RXE0_CQ_WRITE_INDEX_12 0x544A230
+
+#define mmNIC0_RXE0_CQ_WRITE_INDEX_13 0x544A234
+
+#define mmNIC0_RXE0_CQ_WRITE_INDEX_14 0x544A238
+
+#define mmNIC0_RXE0_CQ_WRITE_INDEX_15 0x544A23C
+
+#define mmNIC0_RXE0_CQ_WRITE_INDEX_16 0x544A240
+
+#define mmNIC0_RXE0_CQ_WRITE_INDEX_17 0x544A244
+
+#define mmNIC0_RXE0_CQ_WRITE_INDEX_18 0x544A248
+
+#define mmNIC0_RXE0_CQ_WRITE_INDEX_19 0x544A24C
+
+#define mmNIC0_RXE0_CQ_WRITE_INDEX_20 0x544A250
+
+#define mmNIC0_RXE0_CQ_WRITE_INDEX_21 0x544A254
+
+#define mmNIC0_RXE0_CQ_WRITE_INDEX_22 0x544A258
+
+#define mmNIC0_RXE0_CQ_WRITE_INDEX_23 0x544A25C
+
+#define mmNIC0_RXE0_CQ_WRITE_INDEX_24 0x544A260
+
+#define mmNIC0_RXE0_CQ_WRITE_INDEX_25 0x544A264
+
+#define mmNIC0_RXE0_CQ_WRITE_INDEX_26 0x544A268
+
+#define mmNIC0_RXE0_CQ_WRITE_INDEX_27 0x544A26C
+
+#define mmNIC0_RXE0_CQ_WRITE_INDEX_28 0x544A270
+
+#define mmNIC0_RXE0_CQ_WRITE_INDEX_29 0x544A274
+
+#define mmNIC0_RXE0_CQ_WRITE_INDEX_30 0x544A278
+
+#define mmNIC0_RXE0_CQ_WRITE_INDEX_31 0x544A27C
+
+#define mmNIC0_RXE0_CQ_PRODUCER_INDEX_0 0x544A280
+
+#define mmNIC0_RXE0_CQ_PRODUCER_INDEX_1 0x544A284
+
+#define mmNIC0_RXE0_CQ_PRODUCER_INDEX_2 0x544A288
+
+#define mmNIC0_RXE0_CQ_PRODUCER_INDEX_3 0x544A28C
+
+#define mmNIC0_RXE0_CQ_PRODUCER_INDEX_4 0x544A290
+
+#define mmNIC0_RXE0_CQ_PRODUCER_INDEX_5 0x544A294
+
+#define mmNIC0_RXE0_CQ_PRODUCER_INDEX_6 0x544A298
+
+#define mmNIC0_RXE0_CQ_PRODUCER_INDEX_7 0x544A29C
+
+#define mmNIC0_RXE0_CQ_PRODUCER_INDEX_8 0x544A2A0
+
+#define mmNIC0_RXE0_CQ_PRODUCER_INDEX_9 0x544A2A4
+
+#define mmNIC0_RXE0_CQ_PRODUCER_INDEX_10 0x544A2A8
+
+#define mmNIC0_RXE0_CQ_PRODUCER_INDEX_11 0x544A2AC
+
+#define mmNIC0_RXE0_CQ_PRODUCER_INDEX_12 0x544A2B0
+
+#define mmNIC0_RXE0_CQ_PRODUCER_INDEX_13 0x544A2B4
+
+#define mmNIC0_RXE0_CQ_PRODUCER_INDEX_14 0x544A2B8
+
+#define mmNIC0_RXE0_CQ_PRODUCER_INDEX_15 0x544A2BC
+
+#define mmNIC0_RXE0_CQ_PRODUCER_INDEX_16 0x544A2C0
+
+#define mmNIC0_RXE0_CQ_PRODUCER_INDEX_17 0x544A2C4
+
+#define mmNIC0_RXE0_CQ_PRODUCER_INDEX_18 0x544A2C8
+
+#define mmNIC0_RXE0_CQ_PRODUCER_INDEX_19 0x544A2CC
+
+#define mmNIC0_RXE0_CQ_PRODUCER_INDEX_20 0x544A2D0
+
+#define mmNIC0_RXE0_CQ_PRODUCER_INDEX_21 0x544A2D4
+
+#define mmNIC0_RXE0_CQ_PRODUCER_INDEX_22 0x544A2D8
+
+#define mmNIC0_RXE0_CQ_PRODUCER_INDEX_23 0x544A2DC
+
+#define mmNIC0_RXE0_CQ_PRODUCER_INDEX_24 0x544A2E0
+
+#define mmNIC0_RXE0_CQ_PRODUCER_INDEX_25 0x544A2E4
+
+#define mmNIC0_RXE0_CQ_PRODUCER_INDEX_26 0x544A2E8
+
+#define mmNIC0_RXE0_CQ_PRODUCER_INDEX_27 0x544A2EC
+
+#define mmNIC0_RXE0_CQ_PRODUCER_INDEX_28 0x544A2F0
+
+#define mmNIC0_RXE0_CQ_PRODUCER_INDEX_29 0x544A2F4
+
+#define mmNIC0_RXE0_CQ_PRODUCER_INDEX_30 0x544A2F8
+
+#define mmNIC0_RXE0_CQ_PRODUCER_INDEX_31 0x544A2FC
+
+#define mmNIC0_RXE0_CQ_CONSUMER_INDEX_0 0x544A300
+
+#define mmNIC0_RXE0_CQ_CONSUMER_INDEX_1 0x544A304
+
+#define mmNIC0_RXE0_CQ_CONSUMER_INDEX_2 0x544A308
+
+#define mmNIC0_RXE0_CQ_CONSUMER_INDEX_3 0x544A30C
+
+#define mmNIC0_RXE0_CQ_CONSUMER_INDEX_4 0x544A310
+
+#define mmNIC0_RXE0_CQ_CONSUMER_INDEX_5 0x544A314
+
+#define mmNIC0_RXE0_CQ_CONSUMER_INDEX_6 0x544A318
+
+#define mmNIC0_RXE0_CQ_CONSUMER_INDEX_7 0x544A31C
+
+#define mmNIC0_RXE0_CQ_CONSUMER_INDEX_8 0x544A320
+
+#define mmNIC0_RXE0_CQ_CONSUMER_INDEX_9 0x544A324
+
+#define mmNIC0_RXE0_CQ_CONSUMER_INDEX_10 0x544A328
+
+#define mmNIC0_RXE0_CQ_CONSUMER_INDEX_11 0x544A32C
+
+#define mmNIC0_RXE0_CQ_CONSUMER_INDEX_12 0x544A330
+
+#define mmNIC0_RXE0_CQ_CONSUMER_INDEX_13 0x544A334
+
+#define mmNIC0_RXE0_CQ_CONSUMER_INDEX_14 0x544A338
+
+#define mmNIC0_RXE0_CQ_CONSUMER_INDEX_15 0x544A33C
+
+#define mmNIC0_RXE0_CQ_CONSUMER_INDEX_16 0x544A340
+
+#define mmNIC0_RXE0_CQ_CONSUMER_INDEX_17 0x544A344
+
+#define mmNIC0_RXE0_CQ_CONSUMER_INDEX_18 0x544A348
+
+#define mmNIC0_RXE0_CQ_CONSUMER_INDEX_19 0x544A34C
+
+#define mmNIC0_RXE0_CQ_CONSUMER_INDEX_20 0x544A350
+
+#define mmNIC0_RXE0_CQ_CONSUMER_INDEX_21 0x544A354
+
+#define mmNIC0_RXE0_CQ_CONSUMER_INDEX_22 0x544A358
+
+#define mmNIC0_RXE0_CQ_CONSUMER_INDEX_23 0x544A35C
+
+#define mmNIC0_RXE0_CQ_CONSUMER_INDEX_24 0x544A360
+
+#define mmNIC0_RXE0_CQ_CONSUMER_INDEX_25 0x544A364
+
+#define mmNIC0_RXE0_CQ_CONSUMER_INDEX_26 0x544A368
+
+#define mmNIC0_RXE0_CQ_CONSUMER_INDEX_27 0x544A36C
+
+#define mmNIC0_RXE0_CQ_CONSUMER_INDEX_28 0x544A370
+
+#define mmNIC0_RXE0_CQ_CONSUMER_INDEX_29 0x544A374
+
+#define mmNIC0_RXE0_CQ_CONSUMER_INDEX_30 0x544A378
+
+#define mmNIC0_RXE0_CQ_CONSUMER_INDEX_31 0x544A37C
+
+#define mmNIC0_RXE0_CQ_PI_ADDR_LO_0 0x544A380
+
+#define mmNIC0_RXE0_CQ_PI_ADDR_LO_1 0x544A384
+
+#define mmNIC0_RXE0_CQ_PI_ADDR_LO_2 0x544A388
+
+#define mmNIC0_RXE0_CQ_PI_ADDR_LO_3 0x544A38C
+
+#define mmNIC0_RXE0_CQ_PI_ADDR_LO_4 0x544A390
+
+#define mmNIC0_RXE0_CQ_PI_ADDR_LO_5 0x544A394
+
+#define mmNIC0_RXE0_CQ_PI_ADDR_LO_6 0x544A398
+
+#define mmNIC0_RXE0_CQ_PI_ADDR_LO_7 0x544A39C
+
+#define mmNIC0_RXE0_CQ_PI_ADDR_LO_8 0x544A3A0
+
+#define mmNIC0_RXE0_CQ_PI_ADDR_LO_9 0x544A3A4
+
+#define mmNIC0_RXE0_CQ_PI_ADDR_LO_10 0x544A3A8
+
+#define mmNIC0_RXE0_CQ_PI_ADDR_LO_11 0x544A3AC
+
+#define mmNIC0_RXE0_CQ_PI_ADDR_LO_12 0x544A3B0
+
+#define mmNIC0_RXE0_CQ_PI_ADDR_LO_13 0x544A3B4
+
+#define mmNIC0_RXE0_CQ_PI_ADDR_LO_14 0x544A3B8
+
+#define mmNIC0_RXE0_CQ_PI_ADDR_LO_15 0x544A3BC
+
+#define mmNIC0_RXE0_CQ_PI_ADDR_LO_16 0x544A3C0
+
+#define mmNIC0_RXE0_CQ_PI_ADDR_LO_17 0x544A3C4
+
+#define mmNIC0_RXE0_CQ_PI_ADDR_LO_18 0x544A3C8
+
+#define mmNIC0_RXE0_CQ_PI_ADDR_LO_19 0x544A3CC
+
+#define mmNIC0_RXE0_CQ_PI_ADDR_LO_20 0x544A3D0
+
+#define mmNIC0_RXE0_CQ_PI_ADDR_LO_21 0x544A3D4
+
+#define mmNIC0_RXE0_CQ_PI_ADDR_LO_22 0x544A3D8
+
+#define mmNIC0_RXE0_CQ_PI_ADDR_LO_23 0x544A3DC
+
+#define mmNIC0_RXE0_CQ_PI_ADDR_LO_24 0x544A3E0
+
+#define mmNIC0_RXE0_CQ_PI_ADDR_LO_25 0x544A3E4
+
+#define mmNIC0_RXE0_CQ_PI_ADDR_LO_26 0x544A3E8
+
+#define mmNIC0_RXE0_CQ_PI_ADDR_LO_27 0x544A3EC
+
+#define mmNIC0_RXE0_CQ_PI_ADDR_LO_28 0x544A3F0
+
+#define mmNIC0_RXE0_CQ_PI_ADDR_LO_29 0x544A3F4
+
+#define mmNIC0_RXE0_CQ_PI_ADDR_LO_30 0x544A3F8
+
+#define mmNIC0_RXE0_CQ_PI_ADDR_LO_31 0x544A3FC
+
+#define mmNIC0_RXE0_CQ_PI_ADDR_HI_0 0x544A400
+
+#define mmNIC0_RXE0_CQ_PI_ADDR_HI_1 0x544A404
+
+#define mmNIC0_RXE0_CQ_PI_ADDR_HI_2 0x544A408
+
+#define mmNIC0_RXE0_CQ_PI_ADDR_HI_3 0x544A40C
+
+#define mmNIC0_RXE0_CQ_PI_ADDR_HI_4 0x544A410
+
+#define mmNIC0_RXE0_CQ_PI_ADDR_HI_5 0x544A414
+
+#define mmNIC0_RXE0_CQ_PI_ADDR_HI_6 0x544A418
+
+#define mmNIC0_RXE0_CQ_PI_ADDR_HI_7 0x544A41C
+
+#define mmNIC0_RXE0_CQ_PI_ADDR_HI_8 0x544A420
+
+#define mmNIC0_RXE0_CQ_PI_ADDR_HI_9 0x544A424
+
+#define mmNIC0_RXE0_CQ_PI_ADDR_HI_10 0x544A428
+
+#define mmNIC0_RXE0_CQ_PI_ADDR_HI_11 0x544A42C
+
+#define mmNIC0_RXE0_CQ_PI_ADDR_HI_12 0x544A430
+
+#define mmNIC0_RXE0_CQ_PI_ADDR_HI_13 0x544A434
+
+#define mmNIC0_RXE0_CQ_PI_ADDR_HI_14 0x544A438
+
+#define mmNIC0_RXE0_CQ_PI_ADDR_HI_15 0x544A43C
+
+#define mmNIC0_RXE0_CQ_PI_ADDR_HI_16 0x544A440
+
+#define mmNIC0_RXE0_CQ_PI_ADDR_HI_17 0x544A444
+
+#define mmNIC0_RXE0_CQ_PI_ADDR_HI_18 0x544A448
+
+#define mmNIC0_RXE0_CQ_PI_ADDR_HI_19 0x544A44C
+
+#define mmNIC0_RXE0_CQ_PI_ADDR_HI_20 0x544A450
+
+#define mmNIC0_RXE0_CQ_PI_ADDR_HI_21 0x544A454
+
+#define mmNIC0_RXE0_CQ_PI_ADDR_HI_22 0x544A458
+
+#define mmNIC0_RXE0_CQ_PI_ADDR_HI_23 0x544A45C
+
+#define mmNIC0_RXE0_CQ_PI_ADDR_HI_24 0x544A460
+
+#define mmNIC0_RXE0_CQ_PI_ADDR_HI_25 0x544A464
+
+#define mmNIC0_RXE0_CQ_PI_ADDR_HI_26 0x544A468
+
+#define mmNIC0_RXE0_CQ_PI_ADDR_HI_27 0x544A46C
+
+#define mmNIC0_RXE0_CQ_PI_ADDR_HI_28 0x544A470
+
+#define mmNIC0_RXE0_CQ_PI_ADDR_HI_29 0x544A474
+
+#define mmNIC0_RXE0_CQ_PI_ADDR_HI_30 0x544A478
+
+#define mmNIC0_RXE0_CQ_PI_ADDR_HI_31 0x544A47C
+
+#define mmNIC0_RXE0_CQ_AXI_PROT_0 0x544A480
+
+#define mmNIC0_RXE0_CQ_AXI_PROT_1 0x544A484
+
+#define mmNIC0_RXE0_CQ_AXI_PROT_2 0x544A488
+
+#define mmNIC0_RXE0_CQ_AXI_PROT_3 0x544A48C
+
+#define mmNIC0_RXE0_CQ_AXI_PROT_4 0x544A490
+
+#define mmNIC0_RXE0_CQ_AXI_PROT_5 0x544A494
+
+#define mmNIC0_RXE0_CQ_AXI_PROT_6 0x544A498
+
+#define mmNIC0_RXE0_CQ_AXI_PROT_7 0x544A49C
+
+#define mmNIC0_RXE0_CQ_AXI_PROT_8 0x544A4A0
+
+#define mmNIC0_RXE0_CQ_AXI_PROT_9 0x544A4A4
+
+#define mmNIC0_RXE0_CQ_AXI_PROT_10 0x544A4A8
+
+#define mmNIC0_RXE0_CQ_AXI_PROT_11 0x544A4AC
+
+#define mmNIC0_RXE0_CQ_AXI_PROT_12 0x544A4B0
+
+#define mmNIC0_RXE0_CQ_AXI_PROT_13 0x544A4B4
+
+#define mmNIC0_RXE0_CQ_AXI_PROT_14 0x544A4B8
+
+#define mmNIC0_RXE0_CQ_AXI_PROT_15 0x544A4BC
+
+#define mmNIC0_RXE0_CQ_AXI_PROT_16 0x544A4C0
+
+#define mmNIC0_RXE0_CQ_AXI_PROT_17 0x544A4C4
+
+#define mmNIC0_RXE0_CQ_AXI_PROT_18 0x544A4C8
+
+#define mmNIC0_RXE0_CQ_AXI_PROT_19 0x544A4CC
+
+#define mmNIC0_RXE0_CQ_AXI_PROT_20 0x544A4D0
+
+#define mmNIC0_RXE0_CQ_AXI_PROT_21 0x544A4D4
+
+#define mmNIC0_RXE0_CQ_AXI_PROT_22 0x544A4D8
+
+#define mmNIC0_RXE0_CQ_AXI_PROT_23 0x544A4DC
+
+#define mmNIC0_RXE0_CQ_AXI_PROT_24 0x544A4E0
+
+#define mmNIC0_RXE0_CQ_AXI_PROT_25 0x544A4E4
+
+#define mmNIC0_RXE0_CQ_AXI_PROT_26 0x544A4E8
+
+#define mmNIC0_RXE0_CQ_AXI_PROT_27 0x544A4EC
+
+#define mmNIC0_RXE0_CQ_AXI_PROT_28 0x544A4F0
+
+#define mmNIC0_RXE0_CQ_AXI_PROT_29 0x544A4F4
+
+#define mmNIC0_RXE0_CQ_AXI_PROT_30 0x544A4F8
+
+#define mmNIC0_RXE0_CQ_AXI_PROT_31 0x544A4FC
+
+#define mmNIC0_RXE0_CQ_LOG_SIZE_0 0x544A500
+
+#define mmNIC0_RXE0_CQ_LOG_SIZE_1 0x544A504
+
+#define mmNIC0_RXE0_CQ_LOG_SIZE_2 0x544A508
+
+#define mmNIC0_RXE0_CQ_LOG_SIZE_3 0x544A50C
+
+#define mmNIC0_RXE0_CQ_LOG_SIZE_4 0x544A510
+
+#define mmNIC0_RXE0_CQ_LOG_SIZE_5 0x544A514
+
+#define mmNIC0_RXE0_CQ_LOG_SIZE_6 0x544A518
+
+#define mmNIC0_RXE0_CQ_LOG_SIZE_7 0x544A51C
+
+#define mmNIC0_RXE0_CQ_LOG_SIZE_8 0x544A520
+
+#define mmNIC0_RXE0_CQ_LOG_SIZE_9 0x544A524
+
+#define mmNIC0_RXE0_CQ_LOG_SIZE_10 0x544A528
+
+#define mmNIC0_RXE0_CQ_LOG_SIZE_11 0x544A52C
+
+#define mmNIC0_RXE0_CQ_LOG_SIZE_12 0x544A530
+
+#define mmNIC0_RXE0_CQ_LOG_SIZE_13 0x544A534
+
+#define mmNIC0_RXE0_CQ_LOG_SIZE_14 0x544A538
+
+#define mmNIC0_RXE0_CQ_LOG_SIZE_15 0x544A53C
+
+#define mmNIC0_RXE0_CQ_LOG_SIZE_16 0x544A540
+
+#define mmNIC0_RXE0_CQ_LOG_SIZE_17 0x544A544
+
+#define mmNIC0_RXE0_CQ_LOG_SIZE_18 0x544A548
+
+#define mmNIC0_RXE0_CQ_LOG_SIZE_19 0x544A54C
+
+#define mmNIC0_RXE0_CQ_LOG_SIZE_20 0x544A550
+
+#define mmNIC0_RXE0_CQ_LOG_SIZE_21 0x544A554
+
+#define mmNIC0_RXE0_CQ_LOG_SIZE_22 0x544A558
+
+#define mmNIC0_RXE0_CQ_LOG_SIZE_23 0x544A55C
+
+#define mmNIC0_RXE0_CQ_LOG_SIZE_24 0x544A560
+
+#define mmNIC0_RXE0_CQ_LOG_SIZE_25 0x544A564
+
+#define mmNIC0_RXE0_CQ_LOG_SIZE_26 0x544A568
+
+#define mmNIC0_RXE0_CQ_LOG_SIZE_27 0x544A56C
+
+#define mmNIC0_RXE0_CQ_LOG_SIZE_28 0x544A570
+
+#define mmNIC0_RXE0_CQ_LOG_SIZE_29 0x544A574
+
+#define mmNIC0_RXE0_CQ_LOG_SIZE_30 0x544A578
+
+#define mmNIC0_RXE0_CQ_LOG_SIZE_31 0x544A57C
+
+#define mmNIC0_RXE0_RDV_SEND_WQ_BASE_ADDR_LO 0x544A600
+
+#define mmNIC0_RXE0_RDV_SEND_WQ_BASE_ADDR_HI 0x544A604
+
+#define mmNIC0_RXE0_RDV_LOG_MAX_WQ_SIZE 0x544A608
+
+#define mmNIC0_RXE0_LBW_BASE_LO 0x544A700
+
+#define mmNIC0_RXE0_LBW_BASE_HI 0x544A704
+
+#define mmNIC0_RXE0_LBW_LOG_SIZE 0x544A708
+
+#define mmNIC0_RXE0_RAW_BASE_LO_P0_0 0x544A710
+
+#define mmNIC0_RXE0_RAW_BASE_LO_P0_1 0x544A714
+
+#define mmNIC0_RXE0_RAW_BASE_HI_P0_0 0x544A720
+
+#define mmNIC0_RXE0_RAW_BASE_HI_P0_1 0x544A724
+
+#define mmNIC0_RXE0_RAW_MISC_P0_0 0x544A730
+
+#define mmNIC0_RXE0_RAW_MISC_P0_1 0x544A734
+
+#define mmNIC0_RXE0_RAW_BASE_LO_P1_0 0x544A750
+
+#define mmNIC0_RXE0_RAW_BASE_LO_P1_1 0x544A754
+
+#define mmNIC0_RXE0_RAW_BASE_HI_P1_0 0x544A760
+
+#define mmNIC0_RXE0_RAW_BASE_HI_P1_1 0x544A764
+
+#define mmNIC0_RXE0_RAW_MISC_P1_0 0x544A770
+
+#define mmNIC0_RXE0_RAW_MISC_P1_1 0x544A774
+
+#define mmNIC0_RXE0_RAW_BASE_LO_P2_0 0x544A790
+
+#define mmNIC0_RXE0_RAW_BASE_LO_P2_1 0x544A794
+
+#define mmNIC0_RXE0_RAW_BASE_HI_P2_0 0x544A7A0
+
+#define mmNIC0_RXE0_RAW_BASE_HI_P2_1 0x544A7A4
+
+#define mmNIC0_RXE0_RAW_MISC_P2_0 0x544A7B0
+
+#define mmNIC0_RXE0_RAW_MISC_P2_1 0x544A7B4
+
+#define mmNIC0_RXE0_RAW_BASE_LO_P3_0 0x544A7D0
+
+#define mmNIC0_RXE0_RAW_BASE_LO_P3_1 0x544A7D4
+
+#define mmNIC0_RXE0_RAW_BASE_HI_P3_0 0x544A7E0
+
+#define mmNIC0_RXE0_RAW_BASE_HI_P3_1 0x544A7E4
+
+#define mmNIC0_RXE0_RAW_MISC_P3_0 0x544A7F0
+
+#define mmNIC0_RXE0_RAW_MISC_P3_1 0x544A7F4
+
+#define mmNIC0_RXE0_SEI_INTR_CAUSE 0x544A800
+
+#define mmNIC0_RXE0_SEI_INTR_MASK 0x544A804
+
+#define mmNIC0_RXE0_SEI_INTR_CLEAR 0x544A808
+
+#define mmNIC0_RXE0_SPI_INTR_CAUSE 0x544A810
+
+#define mmNIC0_RXE0_SPI_INTR_MASK 0x544A814
+
+#define mmNIC0_RXE0_SPI_INTR_CLEAR 0x544A818
+
+#define mmNIC0_RXE0_DBG_SPMU_SELECT 0x544AA00
+
+#define mmNIC0_RXE0_DBG_INV_OP_0 0x544AA04
+
+#define mmNIC0_RXE0_DBG_INV_OP_1 0x544AA08
+
+#define mmNIC0_RXE0_DBG_AXI_ERR 0x544AA0C
+
+#define mmNIC0_RXE0_DBG_AXI_CQE_ERR 0x544AA10
+
+#define mmNIC0_RXE0_DBG_AXI_LBW_ERR 0x544AA14
+
+#define mmNIC0_RXE0_DBG_EN 0x544AA18
+
+#define mmNIC0_RXE0_DBG_CQ_ARM_ON 0x544AA1C
+
+#define mmNIC0_RXE0_DBG_CQ_ARM_SEL 0x544AA20
+
+#define mmNIC0_RXE0_DBG_CQ_ARM_IDX 0x544AA24
+
+#define mmNIC0_RXE0_DBG_SLICE_MAIN 0x544AA28
+
+#define mmNIC0_RXE0_DBG_SLICE_SCT 0x544AA2C
+
+#endif /* ASIC_REG_NIC0_RXE0_REGS_H_ */
diff --git a/drivers/accel/habanalabs/include/gaudi2/asic_reg/nic0_rxe1_regs.h b/drivers/accel/habanalabs/include/gaudi2/asic_reg/nic0_rxe1_regs.h
new file mode 100644
index 000000000000..9cc3fbd5ec51
--- /dev/null
+++ b/drivers/accel/habanalabs/include/gaudi2/asic_reg/nic0_rxe1_regs.h
@@ -0,0 +1,725 @@
+/* SPDX-License-Identifier: GPL-2.0
+ *
+ * Copyright 2016-2020 HabanaLabs, Ltd.
+ * All Rights Reserved.
+ *
+ */
+
+/************************************
+ ** This is an auto-generated file **
+ **       DO NOT EDIT BELOW        **
+ ************************************/
+
+#ifndef ASIC_REG_NIC0_RXE1_REGS_H_
+#define ASIC_REG_NIC0_RXE1_REGS_H_
+
+/*
+ *****************************************
+ *   NIC0_RXE1
+ *   (Prototype: NIC_RXE)
+ *****************************************
+ */
+
+#define mmNIC0_RXE1_CONTROL 0x544B000
+
+#define mmNIC0_RXE1_SCATTER_CFG 0x544B004
+
+#define mmNIC0_RXE1_SCATTER_CQ_ADDR 0x544B008
+
+#define mmNIC0_RXE1_RAW_QPN_P0_0 0x544B010
+
+#define mmNIC0_RXE1_RAW_QPN_P0_1 0x544B014
+
+#define mmNIC0_RXE1_RAW_QPN_P1_0 0x544B018
+
+#define mmNIC0_RXE1_RAW_QPN_P1_1 0x544B01C
+
+#define mmNIC0_RXE1_RAW_QPN_P2_0 0x544B020
+
+#define mmNIC0_RXE1_RAW_QPN_P2_1 0x544B024
+
+#define mmNIC0_RXE1_RAW_QPN_P3_0 0x544B028
+
+#define mmNIC0_RXE1_RAW_QPN_P3_1 0x544B02C
+
+#define mmNIC0_RXE1_RXE_CHECKS 0x544B030
+
+#define mmNIC0_RXE1_PKT_DROP 0x544B034
+
+#define mmNIC0_RXE1_PKT_SIZE_CHECK_RC 0x544B038
+
+#define mmNIC0_RXE1_PKT_SIZE_CHECK_RAW 0x544B03C
+
+#define mmNIC0_RXE1_ARUSER_MMU_BP 0x544B064
+
+#define mmNIC0_RXE1_AWUSER_LBW 0x544B068
+
+#define mmNIC0_RXE1_ARPROT_HBW 0x544B070
+
+#define mmNIC0_RXE1_AWPROT_LBW 0x544B074
+
+#define mmNIC0_RXE1_WIN0_WQ_BASE_LO 0x544B080
+
+#define mmNIC0_RXE1_WIN0_WQ_BASE_HI 0x544B084
+
+#define mmNIC0_RXE1_WIN0_WQ_MISC 0x544B088
+
+#define mmNIC0_RXE1_WIN1_WQ_BASE_LO 0x544B090
+
+#define mmNIC0_RXE1_WIN1_WQ_BASE_HI 0x544B094
+
+#define mmNIC0_RXE1_WIN1_WQ_MISC 0x544B098
+
+#define mmNIC0_RXE1_WIN2_WQ_BASE_LO 0x544B0A0
+
+#define mmNIC0_RXE1_WIN2_WQ_BASE_HI 0x544B0A4
+
+#define mmNIC0_RXE1_WIN2_WQ_MISC 0x544B0A8
+
+#define mmNIC0_RXE1_WIN3_WQ_BASE_LO 0x544B0B0
+
+#define mmNIC0_RXE1_WIN3_WQ_BASE_HI 0x544B0B4
+
+#define mmNIC0_RXE1_WIN3_WQ_MISC 0x544B0B8
+
+#define mmNIC0_RXE1_CG 0x544B0D0
+
+#define mmNIC0_RXE1_CG_TIMER 0x544B0D4
+
+#define mmNIC0_RXE1_WQE_WQ_WR_OP_DISABLE 0x544B0D8
+
+#define mmNIC0_RXE1_WQE_WQ_RDV_OP_DISABLE 0x544B0DC
+
+#define mmNIC0_RXE1_WQE_WQ_RD_OP_DISABLE 0x544B0E0
+
+#define mmNIC0_RXE1_WQE_MAX_WRITE_SEND_SIZE 0x544B0E4
+
+#define mmNIC0_RXE1_WQE_MAX_MULTI_STRIDE_SIZE 0x544B0E8
+
+#define mmNIC0_RXE1_CACHE_CFG 0x544B0F0
+
+#define mmNIC0_RXE1_CACHE_INFO 0x544B0F4
+
+#define mmNIC0_RXE1_CACHE_ADDR_LO 0x544B0F8
+
+#define mmNIC0_RXE1_CACHE_ADDR_HI 0x544B0FC
+
+#define mmNIC0_RXE1_CQ_BASE_ADDR_31_7 0x544B100
+
+#define mmNIC0_RXE1_CQ_BASE_ADDR_63_32 0x544B104
+
+#define mmNIC0_RXE1_CQ_LOG_MAX_SIZE 0x544B108
+
+#define mmNIC0_RXE1_CQ_ARM_TIMEOUT_EN 0x544B110
+
+#define mmNIC0_RXE1_CQ_ARM_TIMEOUT 0x544B114
+
+#define mmNIC0_RXE1_CQ_CFG_0 0x544B180
+
+#define mmNIC0_RXE1_CQ_CFG_1 0x544B184
+
+#define mmNIC0_RXE1_CQ_CFG_2 0x544B188
+
+#define mmNIC0_RXE1_CQ_CFG_3 0x544B18C
+
+#define mmNIC0_RXE1_CQ_CFG_4 0x544B190
+
+#define mmNIC0_RXE1_CQ_CFG_5 0x544B194
+
+#define mmNIC0_RXE1_CQ_CFG_6 0x544B198
+
+#define mmNIC0_RXE1_CQ_CFG_7 0x544B19C
+
+#define mmNIC0_RXE1_CQ_CFG_8 0x544B1A0
+
+#define mmNIC0_RXE1_CQ_CFG_9 0x544B1A4
+
+#define mmNIC0_RXE1_CQ_CFG_10 0x544B1A8
+
+#define mmNIC0_RXE1_CQ_CFG_11 0x544B1AC
+
+#define mmNIC0_RXE1_CQ_CFG_12 0x544B1B0
+
+#define mmNIC0_RXE1_CQ_CFG_13 0x544B1B4
+
+#define mmNIC0_RXE1_CQ_CFG_14 0x544B1B8
+
+#define mmNIC0_RXE1_CQ_CFG_15 0x544B1BC
+
+#define mmNIC0_RXE1_CQ_CFG_16 0x544B1C0
+
+#define mmNIC0_RXE1_CQ_CFG_17 0x544B1C4
+
+#define mmNIC0_RXE1_CQ_CFG_18 0x544B1C8
+
+#define mmNIC0_RXE1_CQ_CFG_19 0x544B1CC
+
+#define mmNIC0_RXE1_CQ_CFG_20 0x544B1D0
+
+#define mmNIC0_RXE1_CQ_CFG_21 0x544B1D4
+
+#define mmNIC0_RXE1_CQ_CFG_22 0x544B1D8
+
+#define mmNIC0_RXE1_CQ_CFG_23 0x544B1DC
+
+#define mmNIC0_RXE1_CQ_CFG_24 0x544B1E0
+
+#define mmNIC0_RXE1_CQ_CFG_25 0x544B1E4
+
+#define mmNIC0_RXE1_CQ_CFG_26 0x544B1E8
+
+#define mmNIC0_RXE1_CQ_CFG_27 0x544B1EC
+
+#define mmNIC0_RXE1_CQ_CFG_28 0x544B1F0
+
+#define mmNIC0_RXE1_CQ_CFG_29 0x544B1F4
+
+#define mmNIC0_RXE1_CQ_CFG_30 0x544B1F8
+
+#define mmNIC0_RXE1_CQ_CFG_31 0x544B1FC
+
+#define mmNIC0_RXE1_CQ_WRITE_INDEX_0 0x544B200
+
+#define mmNIC0_RXE1_CQ_WRITE_INDEX_1 0x544B204
+
+#define mmNIC0_RXE1_CQ_WRITE_INDEX_2 0x544B208
+
+#define mmNIC0_RXE1_CQ_WRITE_INDEX_3 0x544B20C
+
+#define mmNIC0_RXE1_CQ_WRITE_INDEX_4 0x544B210
+
+#define mmNIC0_RXE1_CQ_WRITE_INDEX_5 0x544B214
+
+#define mmNIC0_RXE1_CQ_WRITE_INDEX_6 0x544B218
+
+#define mmNIC0_RXE1_CQ_WRITE_INDEX_7 0x544B21C
+
+#define mmNIC0_RXE1_CQ_WRITE_INDEX_8 0x544B220
+
+#define mmNIC0_RXE1_CQ_WRITE_INDEX_9 0x544B224
+
+#define mmNIC0_RXE1_CQ_WRITE_INDEX_10 0x544B228
+
+#define mmNIC0_RXE1_CQ_WRITE_INDEX_11 0x544B22C
+
+#define mmNIC0_RXE1_CQ_WRITE_INDEX_12 0x544B230
+
+#define mmNIC0_RXE1_CQ_WRITE_INDEX_13 0x544B234
+
+#define mmNIC0_RXE1_CQ_WRITE_INDEX_14 0x544B238
+
+#define mmNIC0_RXE1_CQ_WRITE_INDEX_15 0x544B23C
+
+#define mmNIC0_RXE1_CQ_WRITE_INDEX_16 0x544B240
+
+#define mmNIC0_RXE1_CQ_WRITE_INDEX_17 0x544B244
+
+#define mmNIC0_RXE1_CQ_WRITE_INDEX_18 0x544B248
+
+#define mmNIC0_RXE1_CQ_WRITE_INDEX_19 0x544B24C
+
+#define mmNIC0_RXE1_CQ_WRITE_INDEX_20 0x544B250
+
+#define mmNIC0_RXE1_CQ_WRITE_INDEX_21 0x544B254
+
+#define mmNIC0_RXE1_CQ_WRITE_INDEX_22 0x544B258
+
+#define mmNIC0_RXE1_CQ_WRITE_INDEX_23 0x544B25C
+
+#define mmNIC0_RXE1_CQ_WRITE_INDEX_24 0x544B260
+
+#define mmNIC0_RXE1_CQ_WRITE_INDEX_25 0x544B264
+
+#define mmNIC0_RXE1_CQ_WRITE_INDEX_26 0x544B268
+
+#define mmNIC0_RXE1_CQ_WRITE_INDEX_27 0x544B26C
+
+#define mmNIC0_RXE1_CQ_WRITE_INDEX_28 0x544B270
+
+#define mmNIC0_RXE1_CQ_WRITE_INDEX_29 0x544B274
+
+#define mmNIC0_RXE1_CQ_WRITE_INDEX_30 0x544B278
+
+#define mmNIC0_RXE1_CQ_WRITE_INDEX_31 0x544B27C
+
+#define mmNIC0_RXE1_CQ_PRODUCER_INDEX_0 0x544B280
+
+#define mmNIC0_RXE1_CQ_PRODUCER_INDEX_1 0x544B284
+
+#define mmNIC0_RXE1_CQ_PRODUCER_INDEX_2 0x544B288
+
+#define mmNIC0_RXE1_CQ_PRODUCER_INDEX_3 0x544B28C
+
+#define mmNIC0_RXE1_CQ_PRODUCER_INDEX_4 0x544B290
+
+#define mmNIC0_RXE1_CQ_PRODUCER_INDEX_5 0x544B294
+
+#define mmNIC0_RXE1_CQ_PRODUCER_INDEX_6 0x544B298
+
+#define mmNIC0_RXE1_CQ_PRODUCER_INDEX_7 0x544B29C
+
+#define mmNIC0_RXE1_CQ_PRODUCER_INDEX_8 0x544B2A0
+
+#define mmNIC0_RXE1_CQ_PRODUCER_INDEX_9 0x544B2A4
+
+#define mmNIC0_RXE1_CQ_PRODUCER_INDEX_10 0x544B2A8
+
+#define mmNIC0_RXE1_CQ_PRODUCER_INDEX_11 0x544B2AC
+
+#define mmNIC0_RXE1_CQ_PRODUCER_INDEX_12 0x544B2B0
+
+#define mmNIC0_RXE1_CQ_PRODUCER_INDEX_13 0x544B2B4
+
+#define mmNIC0_RXE1_CQ_PRODUCER_INDEX_14 0x544B2B8
+
+#define mmNIC0_RXE1_CQ_PRODUCER_INDEX_15 0x544B2BC
+
+#define mmNIC0_RXE1_CQ_PRODUCER_INDEX_16 0x544B2C0
+
+#define mmNIC0_RXE1_CQ_PRODUCER_INDEX_17 0x544B2C4
+
+#define mmNIC0_RXE1_CQ_PRODUCER_INDEX_18 0x544B2C8
+
+#define mmNIC0_RXE1_CQ_PRODUCER_INDEX_19 0x544B2CC
+
+#define mmNIC0_RXE1_CQ_PRODUCER_INDEX_20 0x544B2D0
+
+#define mmNIC0_RXE1_CQ_PRODUCER_INDEX_21 0x544B2D4
+
+#define mmNIC0_RXE1_CQ_PRODUCER_INDEX_22 0x544B2D8
+
+#define mmNIC0_RXE1_CQ_PRODUCER_INDEX_23 0x544B2DC
+
+#define mmNIC0_RXE1_CQ_PRODUCER_INDEX_24 0x544B2E0
+
+#define mmNIC0_RXE1_CQ_PRODUCER_INDEX_25 0x544B2E4
+
+#define mmNIC0_RXE1_CQ_PRODUCER_INDEX_26 0x544B2E8
+
+#define mmNIC0_RXE1_CQ_PRODUCER_INDEX_27 0x544B2EC
+
+#define mmNIC0_RXE1_CQ_PRODUCER_INDEX_28 0x544B2F0
+
+#define mmNIC0_RXE1_CQ_PRODUCER_INDEX_29 0x544B2F4
+
+#define mmNIC0_RXE1_CQ_PRODUCER_INDEX_30 0x544B2F8
+
+#define mmNIC0_RXE1_CQ_PRODUCER_INDEX_31 0x544B2FC
+
+#define mmNIC0_RXE1_CQ_CONSUMER_INDEX_0 0x544B300
+
+#define mmNIC0_RXE1_CQ_CONSUMER_INDEX_1 0x544B304
+
+#define mmNIC0_RXE1_CQ_CONSUMER_INDEX_2 0x544B308
+
+#define mmNIC0_RXE1_CQ_CONSUMER_INDEX_3 0x544B30C
+
+#define mmNIC0_RXE1_CQ_CONSUMER_INDEX_4 0x544B310
+
+#define mmNIC0_RXE1_CQ_CONSUMER_INDEX_5 0x544B314
+
+#define mmNIC0_RXE1_CQ_CONSUMER_INDEX_6 0x544B318
+
+#define mmNIC0_RXE1_CQ_CONSUMER_INDEX_7 0x544B31C
+
+#define mmNIC0_RXE1_CQ_CONSUMER_INDEX_8 0x544B320
+
+#define mmNIC0_RXE1_CQ_CONSUMER_INDEX_9 0x544B324
+
+#define mmNIC0_RXE1_CQ_CONSUMER_INDEX_10 0x544B328
+
+#define mmNIC0_RXE1_CQ_CONSUMER_INDEX_11 0x544B32C
+
+#define mmNIC0_RXE1_CQ_CONSUMER_INDEX_12 0x544B330
+
+#define mmNIC0_RXE1_CQ_CONSUMER_INDEX_13 0x544B334
+
+#define mmNIC0_RXE1_CQ_CONSUMER_INDEX_14 0x544B338
+
+#define mmNIC0_RXE1_CQ_CONSUMER_INDEX_15 0x544B33C
+
+#define mmNIC0_RXE1_CQ_CONSUMER_INDEX_16 0x544B340
+
+#define mmNIC0_RXE1_CQ_CONSUMER_INDEX_17 0x544B344
+
+#define mmNIC0_RXE1_CQ_CONSUMER_INDEX_18 0x544B348
+
+#define mmNIC0_RXE1_CQ_CONSUMER_INDEX_19 0x544B34C
+
+#define mmNIC0_RXE1_CQ_CONSUMER_INDEX_20 0x544B350
+
+#define mmNIC0_RXE1_CQ_CONSUMER_INDEX_21 0x544B354
+
+#define mmNIC0_RXE1_CQ_CONSUMER_INDEX_22 0x544B358
+
+#define mmNIC0_RXE1_CQ_CONSUMER_INDEX_23 0x544B35C
+
+#define mmNIC0_RXE1_CQ_CONSUMER_INDEX_24 0x544B360
+
+#define mmNIC0_RXE1_CQ_CONSUMER_INDEX_25 0x544B364
+
+#define mmNIC0_RXE1_CQ_CONSUMER_INDEX_26 0x544B368
+
+#define mmNIC0_RXE1_CQ_CONSUMER_INDEX_27 0x544B36C
+
+#define mmNIC0_RXE1_CQ_CONSUMER_INDEX_28 0x544B370
+
+#define mmNIC0_RXE1_CQ_CONSUMER_INDEX_29 0x544B374
+
+#define mmNIC0_RXE1_CQ_CONSUMER_INDEX_30 0x544B378
+
+#define mmNIC0_RXE1_CQ_CONSUMER_INDEX_31 0x544B37C
+
+#define mmNIC0_RXE1_CQ_PI_ADDR_LO_0 0x544B380
+
+#define mmNIC0_RXE1_CQ_PI_ADDR_LO_1 0x544B384
+
+#define mmNIC0_RXE1_CQ_PI_ADDR_LO_2 0x544B388
+
+#define mmNIC0_RXE1_CQ_PI_ADDR_LO_3 0x544B38C
+
+#define mmNIC0_RXE1_CQ_PI_ADDR_LO_4 0x544B390
+
+#define mmNIC0_RXE1_CQ_PI_ADDR_LO_5 0x544B394
+
+#define mmNIC0_RXE1_CQ_PI_ADDR_LO_6 0x544B398
+
+#define mmNIC0_RXE1_CQ_PI_ADDR_LO_7 0x544B39C
+
+#define mmNIC0_RXE1_CQ_PI_ADDR_LO_8 0x544B3A0
+
+#define mmNIC0_RXE1_CQ_PI_ADDR_LO_9 0x544B3A4
+
+#define mmNIC0_RXE1_CQ_PI_ADDR_LO_10 0x544B3A8
+
+#define mmNIC0_RXE1_CQ_PI_ADDR_LO_11 0x544B3AC
+
+#define mmNIC0_RXE1_CQ_PI_ADDR_LO_12 0x544B3B0
+
+#define mmNIC0_RXE1_CQ_PI_ADDR_LO_13 0x544B3B4
+
+#define mmNIC0_RXE1_CQ_PI_ADDR_LO_14 0x544B3B8
+
+#define mmNIC0_RXE1_CQ_PI_ADDR_LO_15 0x544B3BC
+
+#define mmNIC0_RXE1_CQ_PI_ADDR_LO_16 0x544B3C0
+
+#define mmNIC0_RXE1_CQ_PI_ADDR_LO_17 0x544B3C4
+
+#define mmNIC0_RXE1_CQ_PI_ADDR_LO_18 0x544B3C8
+
+#define mmNIC0_RXE1_CQ_PI_ADDR_LO_19 0x544B3CC
+
+#define mmNIC0_RXE1_CQ_PI_ADDR_LO_20 0x544B3D0
+
+#define mmNIC0_RXE1_CQ_PI_ADDR_LO_21 0x544B3D4
+
+#define mmNIC0_RXE1_CQ_PI_ADDR_LO_22 0x544B3D8
+
+#define mmNIC0_RXE1_CQ_PI_ADDR_LO_23 0x544B3DC
+
+#define mmNIC0_RXE1_CQ_PI_ADDR_LO_24 0x544B3E0
+
+#define mmNIC0_RXE1_CQ_PI_ADDR_LO_25 0x544B3E4
+
+#define mmNIC0_RXE1_CQ_PI_ADDR_LO_26 0x544B3E8
+
+#define mmNIC0_RXE1_CQ_PI_ADDR_LO_27 0x544B3EC
+
+#define mmNIC0_RXE1_CQ_PI_ADDR_LO_28 0x544B3F0
+
+#define mmNIC0_RXE1_CQ_PI_ADDR_LO_29 0x544B3F4
+
+#define mmNIC0_RXE1_CQ_PI_ADDR_LO_30 0x544B3F8
+
+#define mmNIC0_RXE1_CQ_PI_ADDR_LO_31 0x544B3FC
+
+#define mmNIC0_RXE1_CQ_PI_ADDR_HI_0 0x544B400
+
+#define mmNIC0_RXE1_CQ_PI_ADDR_HI_1 0x544B404
+
+#define mmNIC0_RXE1_CQ_PI_ADDR_HI_2 0x544B408
+
+#define mmNIC0_RXE1_CQ_PI_ADDR_HI_3 0x544B40C
+
+#define mmNIC0_RXE1_CQ_PI_ADDR_HI_4 0x544B410
+
+#define mmNIC0_RXE1_CQ_PI_ADDR_HI_5 0x544B414
+
+#define mmNIC0_RXE1_CQ_PI_ADDR_HI_6 0x544B418
+
+#define mmNIC0_RXE1_CQ_PI_ADDR_HI_7 0x544B41C
+
+#define mmNIC0_RXE1_CQ_PI_ADDR_HI_8 0x544B420
+
+#define mmNIC0_RXE1_CQ_PI_ADDR_HI_9 0x544B424
+
+#define mmNIC0_RXE1_CQ_PI_ADDR_HI_10 0x544B428
+
+#define mmNIC0_RXE1_CQ_PI_ADDR_HI_11 0x544B42C
+
+#define mmNIC0_RXE1_CQ_PI_ADDR_HI_12 0x544B430
+
+#define mmNIC0_RXE1_CQ_PI_ADDR_HI_13 0x544B434
+
+#define mmNIC0_RXE1_CQ_PI_ADDR_HI_14 0x544B438
+
+#define mmNIC0_RXE1_CQ_PI_ADDR_HI_15 0x544B43C
+
+#define mmNIC0_RXE1_CQ_PI_ADDR_HI_16 0x544B440
+
+#define mmNIC0_RXE1_CQ_PI_ADDR_HI_17 0x544B444
+
+#define mmNIC0_RXE1_CQ_PI_ADDR_HI_18 0x544B448
+
+#define mmNIC0_RXE1_CQ_PI_ADDR_HI_19 0x544B44C
+
+#define mmNIC0_RXE1_CQ_PI_ADDR_HI_20 0x544B450
+
+#define mmNIC0_RXE1_CQ_PI_ADDR_HI_21 0x544B454
+
+#define mmNIC0_RXE1_CQ_PI_ADDR_HI_22 0x544B458
+
+#define mmNIC0_RXE1_CQ_PI_ADDR_HI_23 0x544B45C
+
+#define mmNIC0_RXE1_CQ_PI_ADDR_HI_24 0x544B460
+
+#define mmNIC0_RXE1_CQ_PI_ADDR_HI_25 0x544B464
+
+#define mmNIC0_RXE1_CQ_PI_ADDR_HI_26 0x544B468
+
+#define mmNIC0_RXE1_CQ_PI_ADDR_HI_27 0x544B46C
+
+#define mmNIC0_RXE1_CQ_PI_ADDR_HI_28 0x544B470
+
+#define mmNIC0_RXE1_CQ_PI_ADDR_HI_29 0x544B474
+
+#define mmNIC0_RXE1_CQ_PI_ADDR_HI_30 0x544B478
+
+#define mmNIC0_RXE1_CQ_PI_ADDR_HI_31 0x544B47C
+
+#define mmNIC0_RXE1_CQ_AXI_PROT_0 0x544B480
+
+#define mmNIC0_RXE1_CQ_AXI_PROT_1 0x544B484
+
+#define mmNIC0_RXE1_CQ_AXI_PROT_2 0x544B488
+
+#define mmNIC0_RXE1_CQ_AXI_PROT_3 0x544B48C
+
+#define mmNIC0_RXE1_CQ_AXI_PROT_4 0x544B490
+
+#define mmNIC0_RXE1_CQ_AXI_PROT_5 0x544B494
+
+#define mmNIC0_RXE1_CQ_AXI_PROT_6 0x544B498
+
+#define mmNIC0_RXE1_CQ_AXI_PROT_7 0x544B49C
+
+#define mmNIC0_RXE1_CQ_AXI_PROT_8 0x544B4A0
+
+#define mmNIC0_RXE1_CQ_AXI_PROT_9 0x544B4A4
+
+#define mmNIC0_RXE1_CQ_AXI_PROT_10 0x544B4A8
+
+#define mmNIC0_RXE1_CQ_AXI_PROT_11 0x544B4AC
+
+#define mmNIC0_RXE1_CQ_AXI_PROT_12 0x544B4B0
+
+#define mmNIC0_RXE1_CQ_AXI_PROT_13 0x544B4B4
+
+#define mmNIC0_RXE1_CQ_AXI_PROT_14 0x544B4B8
+
+#define mmNIC0_RXE1_CQ_AXI_PROT_15 0x544B4BC
+
+#define mmNIC0_RXE1_CQ_AXI_PROT_16 0x544B4C0
+
+#define mmNIC0_RXE1_CQ_AXI_PROT_17 0x544B4C4
+
+#define mmNIC0_RXE1_CQ_AXI_PROT_18 0x544B4C8
+
+#define mmNIC0_RXE1_CQ_AXI_PROT_19 0x544B4CC
+
+#define mmNIC0_RXE1_CQ_AXI_PROT_20 0x544B4D0
+
+#define mmNIC0_RXE1_CQ_AXI_PROT_21 0x544B4D4
+
+#define mmNIC0_RXE1_CQ_AXI_PROT_22 0x544B4D8
+
+#define mmNIC0_RXE1_CQ_AXI_PROT_23 0x544B4DC
+
+#define mmNIC0_RXE1_CQ_AXI_PROT_24 0x544B4E0
+
+#define mmNIC0_RXE1_CQ_AXI_PROT_25 0x544B4E4
+
+#define mmNIC0_RXE1_CQ_AXI_PROT_26 0x544B4E8
+
+#define mmNIC0_RXE1_CQ_AXI_PROT_27 0x544B4EC
+
+#define mmNIC0_RXE1_CQ_AXI_PROT_28 0x544B4F0
+
+#define mmNIC0_RXE1_CQ_AXI_PROT_29 0x544B4F4
+
+#define mmNIC0_RXE1_CQ_AXI_PROT_30 0x544B4F8
+
+#define mmNIC0_RXE1_CQ_AXI_PROT_31 0x544B4FC
+
+#define mmNIC0_RXE1_CQ_LOG_SIZE_0 0x544B500
+
+#define mmNIC0_RXE1_CQ_LOG_SIZE_1 0x544B504
+
+#define mmNIC0_RXE1_CQ_LOG_SIZE_2 0x544B508
+
+#define mmNIC0_RXE1_CQ_LOG_SIZE_3 0x544B50C
+
+#define mmNIC0_RXE1_CQ_LOG_SIZE_4 0x544B510
+
+#define mmNIC0_RXE1_CQ_LOG_SIZE_5 0x544B514
+
+#define mmNIC0_RXE1_CQ_LOG_SIZE_6 0x544B518
+
+#define mmNIC0_RXE1_CQ_LOG_SIZE_7 0x544B51C
+
+#define mmNIC0_RXE1_CQ_LOG_SIZE_8 0x544B520
+
+#define mmNIC0_RXE1_CQ_LOG_SIZE_9 0x544B524
+
+#define mmNIC0_RXE1_CQ_LOG_SIZE_10 0x544B528
+
+#define mmNIC0_RXE1_CQ_LOG_SIZE_11 0x544B52C
+
+#define mmNIC0_RXE1_CQ_LOG_SIZE_12 0x544B530
+
+#define mmNIC0_RXE1_CQ_LOG_SIZE_13 0x544B534
+
+#define mmNIC0_RXE1_CQ_LOG_SIZE_14 0x544B538
+
+#define mmNIC0_RXE1_CQ_LOG_SIZE_15 0x544B53C
+
+#define mmNIC0_RXE1_CQ_LOG_SIZE_16 0x544B540
+
+#define mmNIC0_RXE1_CQ_LOG_SIZE_17 0x544B544
+
+#define mmNIC0_RXE1_CQ_LOG_SIZE_18 0x544B548
+
+#define mmNIC0_RXE1_CQ_LOG_SIZE_19 0x544B54C
+
+#define mmNIC0_RXE1_CQ_LOG_SIZE_20 0x544B550
+
+#define mmNIC0_RXE1_CQ_LOG_SIZE_21 0x544B554
+
+#define mmNIC0_RXE1_CQ_LOG_SIZE_22 0x544B558
+
+#define mmNIC0_RXE1_CQ_LOG_SIZE_23 0x544B55C
+
+#define mmNIC0_RXE1_CQ_LOG_SIZE_24 0x544B560
+
+#define mmNIC0_RXE1_CQ_LOG_SIZE_25 0x544B564
+
+#define mmNIC0_RXE1_CQ_LOG_SIZE_26 0x544B568
+
+#define mmNIC0_RXE1_CQ_LOG_SIZE_27 0x544B56C
+
+#define mmNIC0_RXE1_CQ_LOG_SIZE_28 0x544B570
+
+#define mmNIC0_RXE1_CQ_LOG_SIZE_29 0x544B574
+
+#define mmNIC0_RXE1_CQ_LOG_SIZE_30 0x544B578
+
+#define mmNIC0_RXE1_CQ_LOG_SIZE_31 0x544B57C
+
+#define mmNIC0_RXE1_RDV_SEND_WQ_BASE_ADDR_LO 0x544B600
+
+#define mmNIC0_RXE1_RDV_SEND_WQ_BASE_ADDR_HI 0x544B604
+
+#define mmNIC0_RXE1_RDV_LOG_MAX_WQ_SIZE 0x544B608
+
+#define mmNIC0_RXE1_LBW_BASE_LO 0x544B700
+
+#define mmNIC0_RXE1_LBW_BASE_HI 0x544B704
+
+#define mmNIC0_RXE1_LBW_LOG_SIZE 0x544B708
+
+#define mmNIC0_RXE1_RAW_BASE_LO_P0_0 0x544B710
+
+#define mmNIC0_RXE1_RAW_BASE_LO_P0_1 0x544B714
+
+#define mmNIC0_RXE1_RAW_BASE_HI_P0_0 0x544B720
+
+#define mmNIC0_RXE1_RAW_BASE_HI_P0_1 0x544B724
+
+#define mmNIC0_RXE1_RAW_MISC_P0_0 0x544B730
+
+#define mmNIC0_RXE1_RAW_MISC_P0_1 0x544B734
+
+#define mmNIC0_RXE1_RAW_BASE_LO_P1_0 0x544B750
+
+#define mmNIC0_RXE1_RAW_BASE_LO_P1_1 0x544B754
+
+#define mmNIC0_RXE1_RAW_BASE_HI_P1_0 0x544B760
+
+#define mmNIC0_RXE1_RAW_BASE_HI_P1_1 0x544B764
+
+#define mmNIC0_RXE1_RAW_MISC_P1_0 0x544B770
+
+#define mmNIC0_RXE1_RAW_MISC_P1_1 0x544B774
+
+#define mmNIC0_RXE1_RAW_BASE_LO_P2_0 0x544B790
+
+#define mmNIC0_RXE1_RAW_BASE_LO_P2_1 0x544B794
+
+#define mmNIC0_RXE1_RAW_BASE_HI_P2_0 0x544B7A0
+
+#define mmNIC0_RXE1_RAW_BASE_HI_P2_1 0x544B7A4
+
+#define mmNIC0_RXE1_RAW_MISC_P2_0 0x544B7B0
+
+#define mmNIC0_RXE1_RAW_MISC_P2_1 0x544B7B4
+
+#define mmNIC0_RXE1_RAW_BASE_LO_P3_0 0x544B7D0
+
+#define mmNIC0_RXE1_RAW_BASE_LO_P3_1 0x544B7D4
+
+#define mmNIC0_RXE1_RAW_BASE_HI_P3_0 0x544B7E0
+
+#define mmNIC0_RXE1_RAW_BASE_HI_P3_1 0x544B7E4
+
+#define mmNIC0_RXE1_RAW_MISC_P3_0 0x544B7F0
+
+#define mmNIC0_RXE1_RAW_MISC_P3_1 0x544B7F4
+
+#define mmNIC0_RXE1_SEI_INTR_CAUSE 0x544B800
+
+#define mmNIC0_RXE1_SEI_INTR_MASK 0x544B804
+
+#define mmNIC0_RXE1_SEI_INTR_CLEAR 0x544B808
+
+#define mmNIC0_RXE1_SPI_INTR_CAUSE 0x544B810
+
+#define mmNIC0_RXE1_SPI_INTR_MASK 0x544B814
+
+#define mmNIC0_RXE1_SPI_INTR_CLEAR 0x544B818
+
+#define mmNIC0_RXE1_DBG_SPMU_SELECT 0x544BA00
+
+#define mmNIC0_RXE1_DBG_INV_OP_0 0x544BA04
+
+#define mmNIC0_RXE1_DBG_INV_OP_1 0x544BA08
+
+#define mmNIC0_RXE1_DBG_AXI_ERR 0x544BA0C
+
+#define mmNIC0_RXE1_DBG_AXI_CQE_ERR 0x544BA10
+
+#define mmNIC0_RXE1_DBG_AXI_LBW_ERR 0x544BA14
+
+#define mmNIC0_RXE1_DBG_EN 0x544BA18
+
+#define mmNIC0_RXE1_DBG_CQ_ARM_ON 0x544BA1C
+
+#define mmNIC0_RXE1_DBG_CQ_ARM_SEL 0x544BA20
+
+#define mmNIC0_RXE1_DBG_CQ_ARM_IDX 0x544BA24
+
+#define mmNIC0_RXE1_DBG_SLICE_MAIN 0x544BA28
+
+#define mmNIC0_RXE1_DBG_SLICE_SCT 0x544BA2C
+
+#endif /* ASIC_REG_NIC0_RXE1_REGS_H_ */
diff --git a/drivers/accel/habanalabs/include/gaudi2/asic_reg/nic0_txe0_regs.h b/drivers/accel/habanalabs/include/gaudi2/asic_reg/nic0_txe0_regs.h
new file mode 100644
index 000000000000..0537d108ead9
--- /dev/null
+++ b/drivers/accel/habanalabs/include/gaudi2/asic_reg/nic0_txe0_regs.h
@@ -0,0 +1,529 @@
+/* SPDX-License-Identifier: GPL-2.0
+ *
+ * Copyright 2016-2020 HabanaLabs, Ltd.
+ * All Rights Reserved.
+ *
+ */
+
+/************************************
+ ** This is an auto-generated file **
+ **       DO NOT EDIT BELOW        **
+ ************************************/
+
+#ifndef ASIC_REG_NIC0_TXE0_REGS_H_
+#define ASIC_REG_NIC0_TXE0_REGS_H_
+
+/*
+ *****************************************
+ *   NIC0_TXE0
+ *   (Prototype: NIC_TXE)
+ *****************************************
+ */
+
+#define mmNIC0_TXE0_WQE_FETCH_REQ_MASK_31_0 0x5452000
+
+#define mmNIC0_TXE0_WQE_FETCH_REQ_MASK_47_32 0x5452004
+
+#define mmNIC0_TXE0_LOCAL_WQ_BUFFER_SIZE 0x5452008
+
+#define mmNIC0_TXE0_LOCAL_WQ_LINE_SIZE 0x545200C
+
+#define mmNIC0_TXE0_LOG_MAX_WQ_SIZE_0 0x5452010
+
+#define mmNIC0_TXE0_LOG_MAX_WQ_SIZE_1 0x5452014
+
+#define mmNIC0_TXE0_LOG_MAX_WQ_SIZE_2 0x5452018
+
+#define mmNIC0_TXE0_LOG_MAX_WQ_SIZE_3 0x545201C
+
+#define mmNIC0_TXE0_SQ_BASE_ADDRESS_63_32_0 0x5452020
+
+#define mmNIC0_TXE0_SQ_BASE_ADDRESS_63_32_1 0x5452024
+
+#define mmNIC0_TXE0_SQ_BASE_ADDRESS_63_32_2 0x5452028
+
+#define mmNIC0_TXE0_SQ_BASE_ADDRESS_63_32_3 0x545202C
+
+#define mmNIC0_TXE0_SQ_BASE_ADDRESS_31_0_0 0x5452030
+
+#define mmNIC0_TXE0_SQ_BASE_ADDRESS_31_0_1 0x5452034
+
+#define mmNIC0_TXE0_SQ_BASE_ADDRESS_31_0_2 0x5452038
+
+#define mmNIC0_TXE0_SQ_BASE_ADDRESS_31_0_3 0x545203C
+
+#define mmNIC0_TXE0_WQE_USER_CFG 0x5452040
+
+#define mmNIC0_TXE0_ALLOC_CREDIT 0x5452044
+
+#define mmNIC0_TXE0_ALLOC_CREDIT_FORCE_FULL 0x5452048
+
+#define mmNIC0_TXE0_READ_CREDIT 0x545204C
+
+#define mmNIC0_TXE0_READ_CREDIT_FORCE_FULL 0x5452050
+
+#define mmNIC0_TXE0_BURST_ENABLE 0x5452054
+
+#define mmNIC0_TXE0_WR_INIT_BUSY 0x5452058
+
+#define mmNIC0_TXE0_READ_RES_WT_INIT_BUSY 0x545205C
+
+#define mmNIC0_TXE0_BTH_TVER 0x5452060
+
+#define mmNIC0_TXE0_IPV4_IDENTIFICATION 0x5452064
+
+#define mmNIC0_TXE0_IPV4_FLAGS 0x5452068
+
+#define mmNIC0_TXE0_PAD 0x545206C
+
+#define mmNIC0_TXE0_ADD_PAD_TO_IPV4_LEN 0x5452070
+
+#define mmNIC0_TXE0_ADD_PAD_TO_UDP_LEN 0x5452074
+
+#define mmNIC0_TXE0_ICRC_EN 0x5452078
+
+#define mmNIC0_TXE0_UDP_MASK_S_PORT 0x545207C
+
+#define mmNIC0_TXE0_UDP_CHECKSUM 0x5452080
+
+#define mmNIC0_TXE0_UDP_DEST_PORT 0x5452084
+
+#define mmNIC0_TXE0_PORT0_MAC_CFG_47_32 0x5452088
+
+#define mmNIC0_TXE0_PORT0_MAC_CFG_31_0 0x545208C
+
+#define mmNIC0_TXE0_PORT1_MAC_CFG_47_32 0x5452090
+
+#define mmNIC0_TXE0_PORT1_MAC_CFG_31_0 0x5452094
+
+#define mmNIC0_TXE0_PRIO_TO_DSCP_0 0x545209C
+
+#define mmNIC0_TXE0_PRIO_TO_DSCP_1 0x54520A0
+
+#define mmNIC0_TXE0_PRIO_TO_PCP 0x54520B0
+
+#define mmNIC0_TXE0_MAC_ETHER_TYPE 0x54520B4
+
+#define mmNIC0_TXE0_MAC_ETHER_TYPE_VLAN 0x54520B8
+
+#define mmNIC0_TXE0_ECN_0 0x54520BC
+
+#define mmNIC0_TXE0_ECN_1 0x54520C0
+
+#define mmNIC0_TXE0_IPV4_TIME_TO_LIVE_0 0x54520C4
+
+#define mmNIC0_TXE0_IPV4_TIME_TO_LIVE_1 0x54520C8
+
+#define mmNIC0_TXE0_PRIO_PORT_CREDIT_FORCE 0x54520CC
+
+#define mmNIC0_TXE0_PRIO_PORT_CRDIT_0 0x54520D0
+
+#define mmNIC0_TXE0_PRIO_PORT_CRDIT_1 0x54520D4
+
+#define mmNIC0_TXE0_PRIO_PORT_CRDIT_2 0x54520D8
+
+#define mmNIC0_TXE0_PRIO_PORT_CRDIT_3 0x54520DC
+
+#define mmNIC0_TXE0_PRIO_PORT_CRDIT_4 0x54520E0
+
+#define mmNIC0_TXE0_PRIO_PORT_CRDIT_5 0x54520E4
+
+#define mmNIC0_TXE0_PRIO_PORT_CRDIT_6 0x54520E8
+
+#define mmNIC0_TXE0_PRIO_PORT_CRDIT_7 0x54520EC
+
+#define mmNIC0_TXE0_WQE_FETCH_TOKEN_EN 0x54520F0
+
+#define mmNIC0_TXE0_NACK_SYNDROME 0x54520F4
+
+#define mmNIC0_TXE0_WQE_FETCH_AXI_PROT 0x54520FC
+
+#define mmNIC0_TXE0_DATA_FETCH_AXI_PROT 0x5452104
+
+#define mmNIC0_TXE0_FETCH_OUT_OF_TOKEN 0x5452108
+
+#define mmNIC0_TXE0_ECN_COUNT_EN 0x545210C
+
+#define mmNIC0_TXE0_INERRUPT_CAUSE 0x5452110
+
+#define mmNIC0_TXE0_INTERRUPT_MASK 0x5452114
+
+#define mmNIC0_TXE0_INTERRUPT_CLR 0x5452118
+
+#define mmNIC0_TXE0_VLAN_TAG_QPN_OFFSET 0x545211C
+
+#define mmNIC0_TXE0_VALN_TAG_CFG_0 0x5452120
+
+#define mmNIC0_TXE0_VALN_TAG_CFG_1 0x5452124
+
+#define mmNIC0_TXE0_VALN_TAG_CFG_2 0x5452128
+
+#define mmNIC0_TXE0_VALN_TAG_CFG_3 0x545212C
+
+#define mmNIC0_TXE0_VALN_TAG_CFG_4 0x5452130
+
+#define mmNIC0_TXE0_VALN_TAG_CFG_5 0x5452134
+
+#define mmNIC0_TXE0_VALN_TAG_CFG_6 0x5452138
+
+#define mmNIC0_TXE0_VALN_TAG_CFG_7 0x545213C
+
+#define mmNIC0_TXE0_VALN_TAG_CFG_8 0x5452140
+
+#define mmNIC0_TXE0_VALN_TAG_CFG_9 0x5452144
+
+#define mmNIC0_TXE0_VALN_TAG_CFG_10 0x5452148
+
+#define mmNIC0_TXE0_VALN_TAG_CFG_11 0x545214C
+
+#define mmNIC0_TXE0_VALN_TAG_CFG_12 0x5452150
+
+#define mmNIC0_TXE0_VALN_TAG_CFG_13 0x5452154
+
+#define mmNIC0_TXE0_VALN_TAG_CFG_14 0x5452158
+
+#define mmNIC0_TXE0_VALN_TAG_CFG_15 0x545215C
+
+#define mmNIC0_TXE0_DBG_TRIG 0x5452160
+
+#define mmNIC0_TXE0_WQE_PREFETCH_CFG 0x5452164
+
+#define mmNIC0_TXE0_WQE_PREFETCH_INVALIDATE 0x5452168
+
+#define mmNIC0_TXE0_SWAP_MEMORY_ENDIANNESS 0x545216C
+
+#define mmNIC0_TXE0_WQE_FETCH_SLICE_47_32 0x5452170
+
+#define mmNIC0_TXE0_WQE_FETCH_SLICE_31_0 0x5452174
+
+#define mmNIC0_TXE0_WQE_EXE_SLICE_47_32 0x5452178
+
+#define mmNIC0_TXE0_WQE_EXE_SLICE_31_0 0x545217C
+
+#define mmNIC0_TXE0_DBG_COUNT_SELECT0 0x5452180
+
+#define mmNIC0_TXE0_DBG_COUNT_SELECT1 0x5452184
+
+#define mmNIC0_TXE0_DBG_COUNT_SELECT2 0x5452188
+
+#define mmNIC0_TXE0_DBG_COUNT_SELECT3 0x545218C
+
+#define mmNIC0_TXE0_DBG_COUNT_SELECT4 0x5452190
+
+#define mmNIC0_TXE0_DBG_COUNT_SELECT5 0x5452194
+
+#define mmNIC0_TXE0_DBG_COUNT_SELECT6 0x5452198
+
+#define mmNIC0_TXE0_DBG_COUNT_SELECT7 0x545219C
+
+#define mmNIC0_TXE0_DBG_COUNT_SELECT8 0x54521A0
+
+#define mmNIC0_TXE0_DBG_COUNT_SELECT9 0x54521A4
+
+#define mmNIC0_TXE0_DBG_COUNT_SELECT10 0x54521A8
+
+#define mmNIC0_TXE0_DBG_COUNT_SELECT11 0x54521AC
+
+#define mmNIC0_TXE0_BTH_MKEY 0x54521B0
+
+#define mmNIC0_TXE0_WQE_BUFF_FLUSH_SLICE_47_3 0x54521B4
+
+#define mmNIC0_TXE0_WQE_BUFF_FLUSH_SLICE_31_0 0x54521B8
+
+#define mmNIC0_TXE0_INTERRUPT_INDEX_MASK_RING_0 0x54521BC
+
+#define mmNIC0_TXE0_INTERRUPT_INDEX_MASK_RING_1 0x54521C0
+
+#define mmNIC0_TXE0_INTERRUPT_INDEX_MASK_RING_2 0x54521C4
+
+#define mmNIC0_TXE0_INTERRUPT_INDEX_MASK_RING_3 0x54521C8
+
+#define mmNIC0_TXE0_INTERRUPT_INDEX_MASK_RING_4 0x54521CC
+
+#define mmNIC0_TXE0_QPN_RING_0 0x54521D0
+
+#define mmNIC0_TXE0_QPN_RING_1 0x54521D4
+
+#define mmNIC0_TXE0_QPN_RING_2 0x54521D8
+
+#define mmNIC0_TXE0_QPN_RING_3 0x54521DC
+
+#define mmNIC0_TXE0_INTERRUPT_EACH_PACKET 0x54521F0
+
+#define mmNIC0_TXE0_EXECUTIN_INDEX_RING_0 0x54521F4
+
+#define mmNIC0_TXE0_EXECUTIN_INDEX_RING_1 0x54521F8
+
+#define mmNIC0_TXE0_EXECUTIN_INDEX_RING_2 0x54521FC
+
+#define mmNIC0_TXE0_EXECUTIN_INDEX_RING_3 0x5452200
+
+#define mmNIC0_TXE0_WQE_FETCH_AXI_USER_LO 0x5452208
+
+#define mmNIC0_TXE0_WQE_FETCH_AXI_USER_HI 0x545220C
+
+#define mmNIC0_TXE0_DATA_FETCH_AXI_USER_LO 0x5452210
+
+#define mmNIC0_TXE0_DATA_FETCH_AXI_USER_HI 0x5452214
+
+#define mmNIC0_TXE0_CHICKEN_BITS 0x5452218
+
+#define mmNIC0_TXE0_CHICKEN_BITS2 0x545221C
+
+#define mmNIC0_TXE0_WQE_CHECK_EN 0x5452220
+
+#define mmNIC0_TXE0_WQE_CHECK_EN2 0x5452224
+
+#define mmNIC0_TXE0_WQE_CHECK_CFG1 0x5452228
+
+#define mmNIC0_TXE0_WQE_CHECK_CFG2 0x545222C
+
+#define mmNIC0_TXE0_WQE_CHECK_CFG3 0x5452230
+
+#define mmNIC0_TXE0_WQE_CHECK_CONST1 0x5452234
+
+#define mmNIC0_TXE0_WQE_CHECK_CONST2 0x5452238
+
+#define mmNIC0_TXE0_WQE_CHECK_CONST3 0x545223C
+
+#define mmNIC0_TXE0_WQE_CHECK_CONST4 0x5452240
+
+#define mmNIC0_TXE0_WQE_CHECK_CONST5 0x5452244
+
+#define mmNIC0_TXE0_WQE_CHECK_CONST6 0x5452248
+
+#define mmNIC0_TXE0_WQE_CHECK_CONST7 0x545224C
+
+#define mmNIC0_TXE0_SOURCE_IP_PORT0_0 0x5452250
+
+#define mmNIC0_TXE0_SOURCE_IP_PORT0_1 0x5452254
+
+#define mmNIC0_TXE0_SOURCE_IP_PORT0_2 0x5452258
+
+#define mmNIC0_TXE0_SOURCE_IP_PORT0_3 0x545225C
+
+#define mmNIC0_TXE0_SOURCE_IP_PORT0_4 0x5452260
+
+#define mmNIC0_TXE0_SOURCE_IP_PORT0_5 0x5452264
+
+#define mmNIC0_TXE0_SOURCE_IP_PORT0_6 0x5452268
+
+#define mmNIC0_TXE0_SOURCE_IP_PORT0_7 0x545226C
+
+#define mmNIC0_TXE0_SOURCE_IP_PORT1_0 0x5452270
+
+#define mmNIC0_TXE0_SOURCE_IP_PORT1_1 0x5452274
+
+#define mmNIC0_TXE0_SOURCE_IP_PORT1_2 0x5452278
+
+#define mmNIC0_TXE0_SOURCE_IP_PORT1_3 0x545227C
+
+#define mmNIC0_TXE0_SOURCE_IP_PORT1_4 0x5452280
+
+#define mmNIC0_TXE0_SOURCE_IP_PORT1_5 0x5452284
+
+#define mmNIC0_TXE0_SOURCE_IP_PORT1_6 0x5452288
+
+#define mmNIC0_TXE0_SOURCE_IP_PORT1_7 0x545228C
+
+#define mmNIC0_TXE0_BTH_RSVD 0x5452290
+
+#define mmNIC0_TXE0_MULTI_PKT_WQE 0x5452294
+
+#define mmNIC0_TXE0_TXWQC 0x54522A0
+
+#define mmNIC0_TXE0_TXWQC_STATUS 0x54522A4
+
+#define mmNIC0_TXE0_TXWQC_INVALIDATE 0x54522A8
+
+#define mmNIC0_TXE0_STATS_CFG0 0x54522B0
+
+#define mmNIC0_TXE0_STATS_CFG1 0x54522B4
+
+#define mmNIC0_TXE0_STATS_CFG2 0x54522B8
+
+#define mmNIC0_TXE0_STATS_TOT_BYTES_LSB 0x54522C0
+
+#define mmNIC0_TXE0_STATS_TOT_BYTES_MSB 0x54522C4
+
+#define mmNIC0_TXE0_STATS_TOT_PKTS_LSB 0x54522C8
+
+#define mmNIC0_TXE0_STATS_TOT_PKTS_MSB 0x54522CC
+
+#define mmNIC0_TXE0_STATS_MEAS_WIN_BYTES_LSB 0x54522D0
+
+#define mmNIC0_TXE0_STATS_MEAS_WIN_BYTES_MSB 0x54522D4
+
+#define mmNIC0_TXE0_STATS_MEAS_WIN_PKTS 0x54522D8
+
+#define mmNIC0_TXE0_STATS_MEAS_LATENCY 0x54522DC
+
+#define mmNIC0_TXE0_HW_EVENT_CFG 0x54522E0
+
+#define mmNIC0_TXE0_ENCAP_CFG_0 0x5452300
+
+#define mmNIC0_TXE0_ENCAP_CFG_1 0x5452304
+
+#define mmNIC0_TXE0_ENCAP_CFG_2 0x5452308
+
+#define mmNIC0_TXE0_ENCAP_CFG_3 0x545230C
+
+#define mmNIC0_TXE0_ENCAP_CFG_4 0x5452310
+
+#define mmNIC0_TXE0_ENCAP_CFG_5 0x5452314
+
+#define mmNIC0_TXE0_ENCAP_CFG_6 0x5452318
+
+#define mmNIC0_TXE0_ENCAP_CFG_7 0x545231C
+
+#define mmNIC0_TXE0_ENCAP_DATA_31_0_0 0x5452320
+
+#define mmNIC0_TXE0_ENCAP_DATA_31_0_1 0x5452324
+
+#define mmNIC0_TXE0_ENCAP_DATA_31_0_2 0x5452328
+
+#define mmNIC0_TXE0_ENCAP_DATA_31_0_3 0x545232C
+
+#define mmNIC0_TXE0_ENCAP_DATA_31_0_4 0x5452330
+
+#define mmNIC0_TXE0_ENCAP_DATA_31_0_5 0x5452334
+
+#define mmNIC0_TXE0_ENCAP_DATA_31_0_6 0x5452338
+
+#define mmNIC0_TXE0_ENCAP_DATA_31_0_7 0x545233C
+
+#define mmNIC0_TXE0_ENCAP_DATA_63_32_0 0x5452340
+
+#define mmNIC0_TXE0_ENCAP_DATA_63_32_1 0x5452344
+
+#define mmNIC0_TXE0_ENCAP_DATA_63_32_2 0x5452348
+
+#define mmNIC0_TXE0_ENCAP_DATA_63_32_3 0x545234C
+
+#define mmNIC0_TXE0_ENCAP_DATA_63_32_4 0x5452350
+
+#define mmNIC0_TXE0_ENCAP_DATA_63_32_5 0x5452354
+
+#define mmNIC0_TXE0_ENCAP_DATA_63_32_6 0x5452358
+
+#define mmNIC0_TXE0_ENCAP_DATA_63_32_7 0x545235C
+
+#define mmNIC0_TXE0_ENCAP_DATA_95_64_0 0x5452360
+
+#define mmNIC0_TXE0_ENCAP_DATA_95_64_1 0x5452364
+
+#define mmNIC0_TXE0_ENCAP_DATA_95_64_2 0x5452368
+
+#define mmNIC0_TXE0_ENCAP_DATA_95_64_3 0x545236C
+
+#define mmNIC0_TXE0_ENCAP_DATA_95_64_4 0x5452370
+
+#define mmNIC0_TXE0_ENCAP_DATA_95_64_5 0x5452374
+
+#define mmNIC0_TXE0_ENCAP_DATA_95_64_6 0x5452378
+
+#define mmNIC0_TXE0_ENCAP_DATA_95_64_7 0x545237C
+
+#define mmNIC0_TXE0_ENCAP_DATA_127_96_0 0x5452380
+
+#define mmNIC0_TXE0_ENCAP_DATA_127_96_1 0x5452384
+
+#define mmNIC0_TXE0_ENCAP_DATA_127_96_2 0x5452388
+
+#define mmNIC0_TXE0_ENCAP_DATA_127_96_3 0x545238C
+
+#define mmNIC0_TXE0_ENCAP_DATA_127_96_4 0x5452390
+
+#define mmNIC0_TXE0_ENCAP_DATA_127_96_5 0x5452394
+
+#define mmNIC0_TXE0_ENCAP_DATA_127_96_6 0x5452398
+
+#define mmNIC0_TXE0_ENCAP_DATA_127_96_7 0x545239C
+
+#define mmNIC0_TXE0_ENCAP_DATA_159_128_0 0x54523A0
+
+#define mmNIC0_TXE0_ENCAP_DATA_159_128_1 0x54523A4
+
+#define mmNIC0_TXE0_ENCAP_DATA_159_128_2 0x54523A8
+
+#define mmNIC0_TXE0_ENCAP_DATA_159_128_3 0x54523AC
+
+#define mmNIC0_TXE0_ENCAP_DATA_159_128_4 0x54523B0
+
+#define mmNIC0_TXE0_ENCAP_DATA_159_128_5 0x54523B4
+
+#define mmNIC0_TXE0_ENCAP_DATA_159_128_6 0x54523B8
+
+#define mmNIC0_TXE0_ENCAP_DATA_159_128_7 0x54523BC
+
+#define mmNIC0_TXE0_ENCAP_DATA_191_160_0 0x54523C0
+
+#define mmNIC0_TXE0_ENCAP_DATA_191_160_1 0x54523C4
+
+#define mmNIC0_TXE0_ENCAP_DATA_191_160_2 0x54523C8
+
+#define mmNIC0_TXE0_ENCAP_DATA_191_160_3 0x54523CC
+
+#define mmNIC0_TXE0_ENCAP_DATA_191_160_4 0x54523D0
+
+#define mmNIC0_TXE0_ENCAP_DATA_191_160_5 0x54523D4
+
+#define mmNIC0_TXE0_ENCAP_DATA_191_160_6 0x54523D8
+
+#define mmNIC0_TXE0_ENCAP_DATA_191_160_7 0x54523DC
+
+#define mmNIC0_TXE0_ENCAP_DATA_223_192_0 0x54523E0
+
+#define mmNIC0_TXE0_ENCAP_DATA_223_192_1 0x54523E4
+
+#define mmNIC0_TXE0_ENCAP_DATA_223_192_2 0x54523E8
+
+#define mmNIC0_TXE0_ENCAP_DATA_223_192_3 0x54523EC
+
+#define mmNIC0_TXE0_ENCAP_DATA_223_192_4 0x54523F0
+
+#define mmNIC0_TXE0_ENCAP_DATA_223_192_5 0x54523F4
+
+#define mmNIC0_TXE0_ENCAP_DATA_223_192_6 0x54523F8
+
+#define mmNIC0_TXE0_ENCAP_DATA_223_192_7 0x54523FC
+
+#define mmNIC0_TXE0_ENCAP_DATA_255_224_0 0x5452400
+
+#define mmNIC0_TXE0_ENCAP_DATA_255_224_1 0x5452404
+
+#define mmNIC0_TXE0_ENCAP_DATA_255_224_2 0x5452408
+
+#define mmNIC0_TXE0_ENCAP_DATA_255_224_3 0x545240C
+
+#define mmNIC0_TXE0_ENCAP_DATA_255_224_4 0x5452410
+
+#define mmNIC0_TXE0_ENCAP_DATA_255_224_5 0x5452414
+
+#define mmNIC0_TXE0_ENCAP_DATA_255_224_6 0x5452418
+
+#define mmNIC0_TXE0_ENCAP_DATA_255_224_7 0x545241C
+
+#define mmNIC0_TXE0_ENCAP_CFG2 0x5452420
+
+#define mmNIC0_TXE0_MTD_DUAL_STRIDE3 0x5452430
+
+#define mmNIC0_TXE0_MTD_DUAL_STRIDE4 0x5452434
+
+#define mmNIC0_TXE0_MTD_DUAL_NUM_OF_STRIDES 0x5452438
+
+#define mmNIC0_TXE0_CLK_GATE_CFG 0x5452440
+
+#define mmNIC0_TXE0_WQE_CHECK_NOTIFY_EN 0x5452450
+
+#define mmNIC0_TXE0_WQE_CHECK_NOTIFY_EN2 0x5452454
+
+#define mmNIC0_TXE0_WQE_CHECK_CFG4 0x5452458
+
+#define mmNIC0_TXE0_WQE_CHECK_CFG5 0x545245C
+
+#define mmNIC0_TXE0_WQE_CHECK_CFG6 0x5452460
+
+#define mmNIC0_TXE0_DATA_READ_RL_CFG 0x5452470
+
+#endif /* ASIC_REG_NIC0_TXE0_REGS_H_ */
diff --git a/drivers/accel/habanalabs/include/gaudi2/asic_reg/nic0_txs0_regs.h b/drivers/accel/habanalabs/include/gaudi2/asic_reg/nic0_txs0_regs.h
new file mode 100644
index 000000000000..94db189452b4
--- /dev/null
+++ b/drivers/accel/habanalabs/include/gaudi2/asic_reg/nic0_txs0_regs.h
@@ -0,0 +1,289 @@
+/* SPDX-License-Identifier: GPL-2.0
+ *
+ * Copyright 2016-2020 HabanaLabs, Ltd.
+ * All Rights Reserved.
+ *
+ */
+
+/************************************
+ ** This is an auto-generated file **
+ **       DO NOT EDIT BELOW        **
+ ************************************/
+
+#ifndef ASIC_REG_NIC0_TXS0_REGS_H_
+#define ASIC_REG_NIC0_TXS0_REGS_H_
+
+/*
+ *****************************************
+ *   NIC0_TXS0
+ *   (Prototype: NIC_TXS)
+ *****************************************
+ */
+
+#define mmNIC0_TXS0_TMR_SCAN_EN 0x5450000
+
+#define mmNIC0_TXS0_TICK_WRAP 0x5450004
+
+#define mmNIC0_TXS0_SCAN_TIME_COMPARE_0 0x5450008
+
+#define mmNIC0_TXS0_SCAN_TIME_COMPARE_1 0x545000C
+
+#define mmNIC0_TXS0_SLICE_CREDIT 0x5450010
+
+#define mmNIC0_TXS0_SLICE_FORCE_FULL 0x5450014
+
+#define mmNIC0_TXS0_FIRST_SCHEDQ_ID 0x5450018
+
+#define mmNIC0_TXS0_LAST_SCHEDQ_ID 0x545001C
+
+#define mmNIC0_TXS0_PUSH_MASK 0x5450020
+
+#define mmNIC0_TXS0_POP_MASK 0x5450024
+
+#define mmNIC0_TXS0_PUSH_RELEASE_INVALIDATE 0x5450028
+
+#define mmNIC0_TXS0_POP_RELEASE_INVALIDATE 0x545002C
+
+#define mmNIC0_TXS0_LIST_MEM_READ_MASK 0x5450030
+
+#define mmNIC0_TXS0_FIFO_MEM_READ_MASK 0x5450034
+
+#define mmNIC0_TXS0_LIST_MEM_WRITE_MASK 0x5450038
+
+#define mmNIC0_TXS0_FIFO_MEM_WRITE_MASK 0x545003C
+
+#define mmNIC0_TXS0_BASE_ADDRESS_63_32 0x5450040
+
+#define mmNIC0_TXS0_BASE_ADDRESS_31_7 0x5450044
+
+#define mmNIC0_TXS0_AXI_PROT 0x545004C
+
+#define mmNIC0_TXS0_RATE_LIMIT 0x5450050
+
+#define mmNIC0_TXS0_CACHE_CFG 0x5450054
+
+#define mmNIC0_TXS0_SCHEDQ_MEM_INIT 0x5450058
+
+#define mmNIC0_TXS0_SCHEDQ_UPDATE_EN 0x545005C
+
+#define mmNIC0_TXS0_SCHEDQ_UPDATE_FIFO 0x5450060
+
+#define mmNIC0_TXS0_SCHEDQ_UPDATE_DESC_31_0 0x5450064
+
+#define mmNIC0_TXS0_SCHEDQ_UPDATE_DESC_63_32 0x5450068
+
+#define mmNIC0_TXS0_SCHEDQ_UPDATE_DESC_95_64 0x545006C
+
+#define mmNIC0_TXS0_SCHEDQ_UPDATE_DESC_127_96 0x5450070
+
+#define mmNIC0_TXS0_SCHEDQ_UPDATE_DESC_159_128 0x5450074
+
+#define mmNIC0_TXS0_SCHEDQ_UPDATE_DESC_191_160 0x5450078
+
+#define mmNIC0_TXS0_SCHEDQ_UPDATE_DESC_217_192 0x545007C
+
+#define mmNIC0_TXS0_FORCE_HIT_EN 0x5450080
+
+#define mmNIC0_TXS0_INVALIDATE_LIST 0x5450084
+
+#define mmNIC0_TXS0_INVALIDATE_LIST_STATUS 0x5450088
+
+#define mmNIC0_TXS0_INVALIDATE_FREE_LIST 0x545008C
+
+#define mmNIC0_TXS0_INVALIDATE_FREE_LIST_STAT 0x5450090
+
+#define mmNIC0_TXS0_PUSH_PREFETCH_EN 0x5450094
+
+#define mmNIC0_TXS0_PUSH_RELEASE_EN 0x5450098
+
+#define mmNIC0_TXS0_PUSH_LOCK_EN 0x545009C
+
+#define mmNIC0_TXS0_PUSH_PREFETCH_NEXT_EN 0x54500A0
+
+#define mmNIC0_TXS0_POP_PREFETCH_EN 0x54500A4
+
+#define mmNIC0_TXS0_POP_RELEASE_EN 0x54500A8
+
+#define mmNIC0_TXS0_POP_LOCK_EN 0x54500AC
+
+#define mmNIC0_TXS0_POP_PREFETCH_NEXT_EN 0x54500B0
+
+#define mmNIC0_TXS0_LIST_MASK 0x54500B4
+
+#define mmNIC0_TXS0_RELEASE_INCALIDATE 0x54500B8
+
+#define mmNIC0_TXS0_BASE_ADDRESS_FREE_LIST_63_32 0x54500BC
+
+#define mmNIC0_TXS0_BASE_ADDRESS_FREE_LIST_31_0 0x54500C0
+
+#define mmNIC0_TXS0_FREE_LIST_EN 0x54500C4
+
+#define mmNIC0_TXS0_PUSH_FORCE_HIT_EN 0x54500C8
+
+#define mmNIC0_TXS0_PRODUCER_UPDATE_EN 0x54500CC
+
+#define mmNIC0_TXS0_PRODUCER_UPDATE 0x54500D0
+
+#define mmNIC0_TXS0_PRIOQ_CREDIT_FORCE 0x54500D4
+
+#define mmNIC0_TXS0_PRIOQ_CREDIT_0 0x54500D8
+
+#define mmNIC0_TXS0_PRIOQ_CREDIT_1 0x54500DC
+
+#define mmNIC0_TXS0_PRIOQ_CREDIT_2 0x54500E0
+
+#define mmNIC0_TXS0_PRIOQ_CREDIT_3 0x54500E4
+
+#define mmNIC0_TXS0_PRIOQ_CREDIT_4 0x54500E8
+
+#define mmNIC0_TXS0_PRIOQ_CREDIT_5 0x54500EC
+
+#define mmNIC0_TXS0_PRIOQ_CREDIT_6 0x54500F0
+
+#define mmNIC0_TXS0_PRIOQ_CREDIT_7 0x54500F4
+
+#define mmNIC0_TXS0_DBG_COUNT_SELECT0 0x54500F8
+
+#define mmNIC0_TXS0_DBG_COUNT_SELECT1 0x54500FC
+
+#define mmNIC0_TXS0_DBG_COUNT_SELECT2 0x5450100
+
+#define mmNIC0_TXS0_DBG_COUNT_SELECT3 0x5450104
+
+#define mmNIC0_TXS0_DBG_COUNT_SELECT4 0x5450108
+
+#define mmNIC0_TXS0_DBG_COUNT_SELECT5 0x545010C
+
+#define mmNIC0_TXS0_DBG_COUNT_SELECT6 0x5450110
+
+#define mmNIC0_TXS0_DBG_COUNT_SELECT7 0x5450114
+
+#define mmNIC0_TXS0_DBG_COUNT_SELECT8 0x5450118
+
+#define mmNIC0_TXS0_DBG_COUNT_SELECT9 0x545011C
+
+#define mmNIC0_TXS0_DBG_COUNT_SELECT10 0x5450120
+
+#define mmNIC0_TXS0_DBG_COUNT_SELECT11 0x5450124
+
+#define mmNIC0_TXS0_IGNORE_BURST_EN 0x5450140
+
+#define mmNIC0_TXS0_IGNORE_BURST_THRESHOLD_0 0x5450144
+
+#define mmNIC0_TXS0_IGNORE_BURST_THRESHOLD_1 0x5450148
+
+#define mmNIC0_TXS0_IGNORE_BURST_THRESHOLD_2 0x545014C
+
+#define mmNIC0_TXS0_IGNORE_BURST_THRESHOLD_3 0x5450150
+
+#define mmNIC0_TXS0_IGNORE_BURST_THRESHOLD_4 0x5450154
+
+#define mmNIC0_TXS0_IGNORE_BURST_THRESHOLD_5 0x5450158
+
+#define mmNIC0_TXS0_IGNORE_BURST_THRESHOLD_6 0x545015C
+
+#define mmNIC0_TXS0_IGNORE_BURST_THRESHOLD_7 0x5450160
+
+#define mmNIC0_TXS0_RANDOM_PSUH_CFG 0x5450164
+
+#define mmNIC0_TXS0_DBG_HW_EVENT_TRIGER 0x5450168
+
+#define mmNIC0_TXS0_INTERRUPT_CAUSE 0x545016C
+
+#define mmNIC0_TXS0_INTERRUPT_MASK 0x5450170
+
+#define mmNIC0_TXS0_INTERRUPT_CLR 0x5450174
+
+#define mmNIC0_TXS0_LOAD_SLICE_HIT_EN 0x5450178
+
+#define mmNIC0_TXS0_SLICE_ACTIVE_47_32 0x545017C
+
+#define mmNIC0_TXS0_SLICE_ACTIVE_31_0 0x5450180
+
+#define mmNIC0_TXS0_AXI_CACHE 0x5450184
+
+#define mmNIC0_TXS0_SLICE_GW_ADDR 0x5450188
+
+#define mmNIC0_TXS0_SLICE_GW_DATA 0x545018C
+
+#define mmNIC0_TXS0_SCANNER_CREDIT_EN 0x5450190
+
+#define mmNIC0_TXS0_FREE_LIST_PUSH_MASK_EN 0x5450194
+
+#define mmNIC0_TXS0_FREE_AEMPTY_THRESHOLD 0x5450198
+
+#define mmNIC0_TXS0_AXI_USER_LO 0x5450200
+
+#define mmNIC0_TXS0_AXI_USER_HI 0x5450204
+
+#define mmNIC0_TXS0_NCH_SYNCED 0x5450210
+
+#define mmNIC0_TXS0_NCH_ASYNCED 0x5450214
+
+#define mmNIC0_TXS0_NCH_ASYNCED_RES 0x5450218
+
+#define mmNIC0_TXS0_STATS_CFG 0x5450220
+
+#define mmNIC0_TXS0_STATS_TOT_PUSH_REQ 0x5450230
+
+#define mmNIC0_TXS0_STATS_TOT_PUSH_RES 0x5450234
+
+#define mmNIC0_TXS0_STATS_TOT_SCHED_QP_REQ 0x5450238
+
+#define mmNIC0_TXS0_STATS_TOT_SCHED_QP_RES 0x545023C
+
+#define mmNIC0_TXS0_STATS_TOT_RETURN_SLICE 0x5450240
+
+#define mmNIC0_TXS0_STATS_WIN_PUSH_REQ 0x5450250
+
+#define mmNIC0_TXS0_STATS_WIN_PUSH_RES 0x5450254
+
+#define mmNIC0_TXS0_STATS_WIN_SCHED_QP_REQ 0x5450258
+
+#define mmNIC0_TXS0_STATS_WIN_SCHED_QP_RES 0x545025C
+
+#define mmNIC0_TXS0_STATS_WIN_RETURN_SLICE 0x5450260
+
+#define mmNIC0_TXS0_ASYNC_NICL_APB_ADDR_MASK 0x5450270
+
+#define mmNIC0_TXS0_ASYNC_NICL_APB_SPLIT_ADDR0 0x5450274
+
+#define mmNIC0_TXS0_ASYNC_NICL_APB_SPLIT_ADDR1 0x5450278
+
+#define mmNIC0_TXS0_ASYNC_NICL_APB_SPLIT_ADDR2 0x545027C
+
+#define mmNIC0_TXS0_ASYNC_NICL_APB_SPLIT_ADDR3 0x5450280
+
+#define mmNIC0_TXS0_ASYNC_NICD_APB_ADDR_MASK 0x5450290
+
+#define mmNIC0_TXS0_ASYNC_NICD_APB_SPLIT_ADDR0 0x5450294
+
+#define mmNIC0_TXS0_ASYNC_NICD_APB_SPLIT_ADDR1 0x5450298
+
+#define mmNIC0_TXS0_ASYNC_NICD_APB_SPLIT_ADDR2 0x545029C
+
+#define mmNIC0_TXS0_ASYNC_NICD_APB_SPLIT_ADDR3 0x54502A0
+
+#define mmNIC0_TXS0_TX_APB_ADDR_MASK 0x54502B0
+
+#define mmNIC0_TXS0_TX_APB_SPLIT_ADDR0 0x54502B4
+
+#define mmNIC0_TXS0_TX_APB_SPLIT_ADDR1 0x54502B8
+
+#define mmNIC0_TXS0_TX_APB_SPLIT_ADDR2 0x54502BC
+
+#define mmNIC0_TXS0_TX_APB_SPLIT_ADDR3 0x54502C0
+
+#define mmNIC0_TXS0_TX_APB_SPLIT_ADDR4 0x54502C4
+
+#define mmNIC0_TXS0_TX_APB_SPLIT_ADDR5 0x54502C8
+
+#define mmNIC0_TXS0_TX_APB_SPLIT_ADDR6 0x54502CC
+
+#define mmNIC0_TXS0_HW_EVENT_CFG 0x54502E0
+
+#define mmNIC0_TXS0_CHICKEN_BITS 0x54502E8
+
+#define mmNIC0_TXS0_CLK_GATE_CFG 0x54502F0
+
+#endif /* ASIC_REG_NIC0_TXS0_REGS_H_ */
-- 
2.34.1

