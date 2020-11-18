Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 2E63E2B8D69
	for <lists+dri-devel@lfdr.de>; Thu, 19 Nov 2020 09:33:02 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C6A066E56A;
	Thu, 19 Nov 2020 08:32:54 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM12-BN8-obe.outbound.protection.outlook.com
 (mail-bn8nam12on2052.outbound.protection.outlook.com [40.107.237.52])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 218606E4EA
 for <dri-devel@lists.freedesktop.org>; Wed, 18 Nov 2020 23:48:33 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=KPe+mJ/ytYfu/BNIHdmlOV8VI7QpctTCUhaCKy9+zkcD71ei7XU7Pmh5FJQbyEym86dSbYOKX0RPZsgyqKhcY+/ZylijjTVmxjweed5KJOlPJnfhw7jpYKyXcEMXomibCnw4ANQbdSwamMh8gnr0u3T0mPv4gReG0lCJ3nPxGYyKuXqOc5AaRNEdeBNLVAyZ67jCp4NXRd+QVeWXUW2kVMIFg79DAZed6R7HE08Jgqf1Ht4Li9zDs5kAL5DKx3LIrKduo/26bihHTxGmTK2lJA3ib45lpU0jnGBhDm7MkpG/S9X1pm4GRr5LR1y0qLeUbUL+BWjJRQyxn4qyZKAyeg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=CGxVQf/qy7O9cQ8ALWcUWk6pL0MT/c/GwfT3ZILfMXI=;
 b=XIbQ7Zd/Ipax0PYqPctfudfmH8eEKRYz9oO5WwY5xojoVIktb6UAADVdRavKWz2dZKXzLQPYdukZayzubzdy+mmTy3w6wmdmEWoCKq4FgqGGDHpurMuA4DDXQRfDr3cxFkC/lHRd8gRRt39lpH7r6wp4zNJypMCwQwL61JFKm77bMeaPKW84K+XscWR0hnEeP3vqKlK6rsYHRC/NvowAd2hUHiuFy2n9isA/tpXKVxvSbKPJgg2pXsXbsbXYtOYKje6kTN21RPU0JYmJctQeWeCncTbT7cA4TZfUVQFxAuHKcKDq8g0hv/dqHEjVcok0+bPdmMZ09zL7oiEBMKDcZg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 149.199.62.198) smtp.rcpttodomain=kernel.org smtp.mailfrom=xilinx.com;
 dmarc=bestguesspass action=none header.from=xilinx.com; dkim=none (message
 not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=xilinx.onmicrosoft.com; s=selector2-xilinx-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=CGxVQf/qy7O9cQ8ALWcUWk6pL0MT/c/GwfT3ZILfMXI=;
 b=kPMApwEdHpGsn1UdPQ4plsKGGpM+axMgdKHqR+MrKrqhqktHP5vqbnMjtX+kfnFcWdMPJOO1XrRU/66Y5zzkD44Oa52Exh+2OxQScO5xNsJ35zr3o55ubsJt6HeqtZJIVUDaXb32rHTNZvTQNSZKTOHwYVnvdYw6bou/WYzR5/E=
Received: from SA9PR03CA0003.namprd03.prod.outlook.com (2603:10b6:806:20::8)
 by SN6PR02MB4734.namprd02.prod.outlook.com (2603:10b6:805:96::28) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3541.22; Wed, 18 Nov
 2020 23:48:30 +0000
Received: from SN1NAM02FT038.eop-nam02.prod.protection.outlook.com
 (2603:10b6:806:20:cafe::d) by SA9PR03CA0003.outlook.office365.com
 (2603:10b6:806:20::8) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3589.20 via Frontend
 Transport; Wed, 18 Nov 2020 23:48:30 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 149.199.62.198)
 smtp.mailfrom=xilinx.com; kernel.org; dkim=none (message not signed)
 header.d=none;kernel.org; dmarc=bestguesspass action=none
 header.from=xilinx.com;
Received-SPF: Pass (protection.outlook.com: domain of xilinx.com designates
 149.199.62.198 as permitted sender) receiver=protection.outlook.com;
 client-ip=149.199.62.198; helo=xsj-pvapexch01.xlnx.xilinx.com;
Received: from xsj-pvapexch01.xlnx.xilinx.com (149.199.62.198) by
 SN1NAM02FT038.mail.protection.outlook.com (10.152.72.69) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.3589.20 via Frontend Transport; Wed, 18 Nov 2020 23:48:30 +0000
Received: from xsj-pvapexch02.xlnx.xilinx.com (172.19.86.41) by
 xsj-pvapexch01.xlnx.xilinx.com (172.19.86.40) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.1913.5; Wed, 18 Nov 2020 15:48:11 -0800
Received: from smtp.xilinx.com (172.19.127.96) by
 xsj-pvapexch02.xlnx.xilinx.com (172.19.86.41) with Microsoft SMTP Server id
 15.1.1913.5 via Frontend Transport; Wed, 18 Nov 2020 15:48:11 -0800
Envelope-to: michal.simek@xilinx.com, derek.kiernan@xilinx.com,
 dragan.cvetic@xilinx.com, rajan.vaja@xilinx.com,
 tejas.patel@xilinx.com, manish.narani@xilinx.com,
 ravi.patel@xilinx.com, izhar.ameer.shaikh@xilinx.com,
 wendy.liang@xilinx.com, robh+dt@kernel.org, arnd@arndb.de,
 gregkh@linuxfoundation.org, sumit.semwal@linaro.org,
 christian.koenig@amd.com, devicetree@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org, linux-media@vger.kernel.org,
 dri-devel@lists.freedesktop.org
Received: from [172.19.2.167] (port=36324 helo=xsjjliang50.xilinx.com)
 by smtp.xilinx.com with esmtp (Exim 4.90)
 (envelope-from <wendy.liang@xilinx.com>)
 id 1kfXBL-0000Wz-DQ; Wed, 18 Nov 2020 15:48:11 -0800
From: Wendy Liang <wendy.liang@xilinx.com>
To: <robh+dt@kernel.org>, <michal.simek@xilinx.com>, <arnd@arndb.de>,
 <gregkh@linuxfoundation.org>, <sumit.semwal@linaro.org>,
 <christian.koenig@amd.com>, <derek.kiernan@xilinx.com>,
 <dragan.cvetic@xilinx.com>, <rajan.vaja@xilinx.com>,
 <tejas.patel@xilinx.com>, <manish.narani@xilinx.com>, <ravi.patel@xilinx.com>
Subject: [PATCH v2 8/9] firmware: xilinx: Add IOCTL support for AIE ISR Clear
Date: Wed, 18 Nov 2020 15:48:08 -0800
Message-ID: <1605743289-26575-9-git-send-email-wendy.liang@xilinx.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1605743289-26575-1-git-send-email-wendy.liang@xilinx.com>
References: <1605743289-26575-1-git-send-email-wendy.liang@xilinx.com>
MIME-Version: 1.0
X-EOPAttributedMessage: 0
X-MS-Office365-Filtering-HT: Tenant
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: fa266ef2-17da-40a9-4094-08d88c1c73ba
X-MS-TrafficTypeDiagnostic: SN6PR02MB4734:
X-Microsoft-Antispam-PRVS: <SN6PR02MB47348E255278C287D5E0417EB0E10@SN6PR02MB4734.namprd02.prod.outlook.com>
X-Auto-Response-Suppress: DR, RN, NRN, OOF, AutoReply
X-MS-Oob-TLC-OOBClassifiers: OLM:7219;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: sI3DpAivM7orJv/VHAli821rtK/BIFckfZh+29u/jPAEqE7CIwindbrpeLTQOrykC5dNVrDH3s1bI/uf/pmVFrZCWhafrnzUkPvcTb56bTobPF06wwDRhQ/3aF5ZjCZS9OaGfWYvCMDctVynOgzWRn8Td3w59cxD060C7zsuWSnzs7L69g9AnE/QD8H1Z8Fb1es91vFqIHSGdV3raqig2RJUQgghMI1Sdwnvw+8ZorgNGG9KvqJPLAGe+4PG2owtcB2pHOmPrFzCRdbu2I6RxvJ97EzSNDDD4KrkfHo6fi4s+BJkZZI4OBDKYGVz0p207nqQtmYFzq0bXAj9ag3iWvRGaBFYGyGIXbmBRs21JW3OzRPmgkvNPDTxStnjf4j+arNBp8RLEJpeo6Ujuqs/m8fonTPpsAzOWeqjsyfj4RGmFiT+PrVdvlhd3tIrZguS
X-Forefront-Antispam-Report: CIP:149.199.62.198; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:xsj-pvapexch01.xlnx.xilinx.com;
 PTR:unknown-62-198.xilinx.com; CAT:NONE;
 SFS:(4636009)(396003)(136003)(376002)(39860400002)(346002)(46966005)(26005)(8676002)(186003)(82740400003)(36756003)(2616005)(356005)(316002)(110136005)(36906005)(82310400003)(54906003)(336012)(426003)(83380400001)(7696005)(44832011)(7416002)(47076004)(6636002)(5660300002)(8936002)(70206006)(70586007)(7636003)(921005)(4326008)(107886003)(2906002)(9786002)(6666004)(478600001)(102446001);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: xilinx.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Nov 2020 23:48:30.0674 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: fa266ef2-17da-40a9-4094-08d88c1c73ba
X-MS-Exchange-CrossTenant-Id: 657af505-d5df-48d0-8300-c31994686c5c
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=657af505-d5df-48d0-8300-c31994686c5c; Ip=[149.199.62.198];
 Helo=[xsj-pvapexch01.xlnx.xilinx.com]
X-MS-Exchange-CrossTenant-AuthSource: SN1NAM02FT038.eop-nam02.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN6PR02MB4734
X-Mailman-Approved-At: Thu, 19 Nov 2020 08:31:38 +0000
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
Cc: devicetree@vger.kernel.org,
 Izhar Ameer Shaikh <izhar.ameer.shaikh@xilinx.com>,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 Wendy Liang <wendy.liang@xilinx.com>, linux-arm-kernel@lists.infradead.org,
 linux-media@vger.kernel.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: Izhar Ameer Shaikh <izhar.ameer.shaikh@xilinx.com>

Latching of AIE NPI Interrupts is present in Versal ES1 Silicon Rev,
however it has been removed from ES2 rev.
As a result on ES1, in order to use the interrupt, a client needs to
request PMC to clear/ack the interrupt.

Provide an EEMI IOCTL to serve the same purpose. Note that, this will
only be applicable for ES1 rev. For ES2 and other non-silicon platforms,
this call will essentially be a NOP in the firmware.

Signed-off-by: Izhar Ameer Shaikh <izhar.ameer.shaikh@xilinx.com>
Signed-off-by: Wendy Liang <wendy.liang@xilinx.com>
---
 drivers/firmware/xilinx/zynqmp.c     | 14 ++++++++++++++
 include/linux/firmware/xlnx-zynqmp.h |  8 ++++++++
 2 files changed, 22 insertions(+)

diff --git a/drivers/firmware/xilinx/zynqmp.c b/drivers/firmware/xilinx/zynqmp.c
index efb8a66..7a0c6a3 100644
--- a/drivers/firmware/xilinx/zynqmp.c
+++ b/drivers/firmware/xilinx/zynqmp.c
@@ -702,6 +702,20 @@ int zynqmp_pm_set_boot_health_status(u32 value)
 }
 
 /**
+ * zynqmp_pm_clear_aie_npi_isr - Clear AI engine NPI interrupt status register
+ * @node:	AI engine node id
+ * @irq_mask:	Mask of AI engine NPI interrupt bit to clear
+ *
+ * Return: Returns status, either success or error+reason
+ */
+int zynqmp_pm_clear_aie_npi_isr(u32 node, u32 irq_mask)
+{
+	return zynqmp_pm_invoke_fn(PM_IOCTL, node, IOCTL_AIE_ISR_CLEAR,
+				   irq_mask, 0, NULL);
+}
+EXPORT_SYMBOL_GPL(zynqmp_pm_clear_aie_npi_isr);
+
+/**
  * zynqmp_pm_reset_assert - Request setting of reset (1 - assert, 0 - release)
  * @reset:		Reset to be configured
  * @assert_flag:	Flag stating should reset be asserted (1) or
diff --git a/include/linux/firmware/xlnx-zynqmp.h b/include/linux/firmware/xlnx-zynqmp.h
index 7b6f9fc..cdc0867 100644
--- a/include/linux/firmware/xlnx-zynqmp.h
+++ b/include/linux/firmware/xlnx-zynqmp.h
@@ -120,6 +120,8 @@ enum pm_ioctl_id {
 	IOCTL_READ_PGGS = 15,
 	/* Set healthy bit value */
 	IOCTL_SET_BOOT_HEALTH_STATUS = 17,
+	/* AI engine NPI ISR clear */
+	IOCTL_AIE_ISR_CLEAR = 24,
 };
 
 enum pm_query_id {
@@ -361,6 +363,7 @@ int zynqmp_pm_write_pggs(u32 index, u32 value);
 int zynqmp_pm_read_pggs(u32 index, u32 *value);
 int zynqmp_pm_system_shutdown(const u32 type, const u32 subtype);
 int zynqmp_pm_set_boot_health_status(u32 value);
+int zynqmp_pm_clear_aie_npi_isr(u32 node, u32 irq_mask);
 #else
 static inline struct zynqmp_eemi_ops *zynqmp_pm_get_eemi_ops(void)
 {
@@ -511,6 +514,11 @@ static inline int zynqmp_pm_set_boot_health_status(u32 value)
 {
 	return -ENODEV;
 }
+
+static inline int zynqmp_pm_clear_aie_npi_isr(u32 node, u32 irq_mask)
+{
+	return -ENODEV;
+}
 #endif
 
 #endif /* __FIRMWARE_ZYNQMP_H__ */
-- 
2.7.4

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
