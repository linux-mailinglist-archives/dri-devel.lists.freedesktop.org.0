Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 0F20C2C7FB6
	for <lists+dri-devel@lfdr.de>; Mon, 30 Nov 2020 09:25:38 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4A2766E43F;
	Mon, 30 Nov 2020 08:25:30 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM11-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam11on2062.outbound.protection.outlook.com [40.107.223.62])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 779B96E40B
 for <dri-devel@lists.freedesktop.org>; Mon, 30 Nov 2020 07:48:47 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=mgxaLxHdztCg8i/uo/RBNiionGW4Rgqi1F9PG8owXWh/kxpMca8IjHAapai6PpHwz0X6Qc1tsALupOCeLdSEXeKQNQtIef/n2L2aqsDUAP6f62iAVsTJ18qxtn7s54TTgG2Cp8YIEKYYa8divWOR8Q5cWP8Ch7ELSdgSlWL7dwSCnUMQT1vdBWMvB65aJeEy24Snq5gaf5V5OYMIrfHaYqV2UgBUM4LCUCHEA3plUFfkj1A7HLNCpZIFOQo82uwycP36cQOP8hMH/6NioTXlULqnUyPVvweC7ArP2BxtaONSVmMgTYO8c+KJotwYaUnfR8xm2uDJRstDwnpBKulaPA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=vghQNYKIxc54dw5ls7dzSN5SAYnmfHZqMdclWTaJaoo=;
 b=VxfeUGud1gpQ7PGNdtjEQLY/oNpv1bJ5u7nw/RzUx13WqwLWwKaYqyvsJJt7N0PdEYLH2YJI0IpZWrrOGh4DcIB53F7cIdH5WilzJu7hnoj4N7kS1p3tg3WURFPsi9TTJw3dPloJ1BjJdq/FRUCafek62weQoTD7RbOnsF2YWZvH4Hg22rmut4eeYSQpPYS2jV9GIDBSeoRhXhWda/6QOfh+gvzpDmhxZmofIOefleqDX2Df11KoeRN93/Fw9Drxrmv1tneMBLpXsl0rvteBBhGIXqR2NCgOkVuW8jxEs7mN2H8cgLfhTVfkbJ7Dg7U12SGU+vL/9OTyq03QEppWKQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 149.199.62.198) smtp.rcpttodomain=kernel.org smtp.mailfrom=xilinx.com;
 dmarc=bestguesspass action=none header.from=xilinx.com; dkim=none (message
 not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=xilinx.onmicrosoft.com; s=selector2-xilinx-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=vghQNYKIxc54dw5ls7dzSN5SAYnmfHZqMdclWTaJaoo=;
 b=OjrFfLb1UQU98DNk9tFLsDiN1pPVFGRSLlIegXsNkakBnu48Q8wM30bWo+2tlKCSrq39ajiUbcz3yhCfjF8OxCmHyfxLV0gOxJcwfjM6fKEk8N7PmfQY2J/NB27XhN7sIblykFdWes7MLSC17xwRIKEX9wLVcI2IyBrfB3giDE8=
Received: from CY4PR03CA0023.namprd03.prod.outlook.com (2603:10b6:903:33::33)
 by BN7PR02MB3971.namprd02.prod.outlook.com (2603:10b6:406:fe::16)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3611.23; Mon, 30 Nov
 2020 07:48:45 +0000
Received: from CY1NAM02FT037.eop-nam02.prod.protection.outlook.com
 (2603:10b6:903:33:cafe::1d) by CY4PR03CA0023.outlook.office365.com
 (2603:10b6:903:33::33) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3611.20 via Frontend
 Transport; Mon, 30 Nov 2020 07:48:45 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 149.199.62.198)
 smtp.mailfrom=xilinx.com; kernel.org; dkim=none (message not signed)
 header.d=none;kernel.org; dmarc=bestguesspass action=none
 header.from=xilinx.com;
Received-SPF: Pass (protection.outlook.com: domain of xilinx.com designates
 149.199.62.198 as permitted sender) receiver=protection.outlook.com;
 client-ip=149.199.62.198; helo=xsj-pvapexch02.xlnx.xilinx.com;
Received: from xsj-pvapexch02.xlnx.xilinx.com (149.199.62.198) by
 CY1NAM02FT037.mail.protection.outlook.com (10.152.75.77) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.3611.27 via Frontend Transport; Mon, 30 Nov 2020 07:48:45 +0000
Received: from xsj-pvapexch02.xlnx.xilinx.com (172.19.86.41) by
 xsj-pvapexch02.xlnx.xilinx.com (172.19.86.41) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.1913.5; Sun, 29 Nov 2020 23:48:31 -0800
Received: from smtp.xilinx.com (172.19.127.96) by
 xsj-pvapexch02.xlnx.xilinx.com (172.19.86.41) with Microsoft SMTP Server id
 15.1.1913.5 via Frontend Transport; Sun, 29 Nov 2020 23:48:31 -0800
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
Received: from [172.19.2.167] (port=48528 helo=xsjjliang50.xilinx.com)
 by smtp.xilinx.com with esmtp (Exim 4.90)
 (envelope-from <wendy.liang@xilinx.com>)
 id 1kjdvD-0006Pm-4f; Sun, 29 Nov 2020 23:48:31 -0800
From: Wendy Liang <wendy.liang@xilinx.com>
To: <robh+dt@kernel.org>, <michal.simek@xilinx.com>, <arnd@arndb.de>,
 <gregkh@linuxfoundation.org>, <sumit.semwal@linaro.org>,
 <christian.koenig@amd.com>, <derek.kiernan@xilinx.com>,
 <dragan.cvetic@xilinx.com>, <rajan.vaja@xilinx.com>,
 <tejas.patel@xilinx.com>, <manish.narani@xilinx.com>, <ravi.patel@xilinx.com>
Subject: [PATCH v3 8/9] firmware: xilinx: Add IOCTL support for AIE ISR Clear
Date: Sun, 29 Nov 2020 23:48:24 -0800
Message-ID: <1606722505-16194-9-git-send-email-wendy.liang@xilinx.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1606722505-16194-1-git-send-email-wendy.liang@xilinx.com>
References: <1606722505-16194-1-git-send-email-wendy.liang@xilinx.com>
MIME-Version: 1.0
X-EOPAttributedMessage: 0
X-MS-Office365-Filtering-HT: Tenant
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 82d49edd-55f1-4d09-9659-08d895045d61
X-MS-TrafficTypeDiagnostic: BN7PR02MB3971:
X-Microsoft-Antispam-PRVS: <BN7PR02MB39719025437169C25464FE19B0F50@BN7PR02MB3971.namprd02.prod.outlook.com>
X-Auto-Response-Suppress: DR, RN, NRN, OOF, AutoReply
X-MS-Oob-TLC-OOBClassifiers: OLM:7219;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: qf7hzy1PSFgS8g03MpFgbA7Sbgt3ZzIZbVZYEXO3uXvoC/BxuXfm7QkLNLf9EjJ6qpgz2RXkAxlTDt4Sf/7JBHu4dVfD2JuHxlMzeUdXFeth4flGAakaHV3/8zYt1USuKW9Iw/yQGD5vb7zWlrKWBV9e1gvKMnIaN+hFkay5ASCKfXT3afXJp5beLeeBZzeE7YCEjfAuAKRd2SrEiycxOk8rBwhcX7S9SJthmT3OsQcdMCo1X8eAcSveWqIUgI7uSj2T/gtOvfjthpoL7l9gS3ncAAGZRobeSZbe3ZTl1w4YTKyuzucbIWa6bbFgvsjJJEx1dLMBqqCZE/21cRipqCExnGRMZuRvPsrP65vFCwls7OYuFxzfB1XzNoTAT0eLTfXU8l4mxReg/qXMt7Jwqv0M1N9X8NTZrrvoFCxmqTeJuLJ8nGxSPc+yP8oquD7a
X-Forefront-Antispam-Report: CIP:149.199.62.198; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:xsj-pvapexch02.xlnx.xilinx.com;
 PTR:unknown-62-198.xilinx.com; CAT:NONE;
 SFS:(4636009)(39850400004)(346002)(136003)(396003)(376002)(46966005)(107886003)(36756003)(6666004)(7696005)(47076004)(2616005)(70206006)(70586007)(356005)(83380400001)(9786002)(7636003)(336012)(82310400003)(6636002)(426003)(5660300002)(8676002)(54906003)(2906002)(8936002)(26005)(478600001)(186003)(82740400003)(36906005)(110136005)(4326008)(921005)(316002)(44832011)(7416002)(102446001);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: xilinx.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 Nov 2020 07:48:45.1349 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 82d49edd-55f1-4d09-9659-08d895045d61
X-MS-Exchange-CrossTenant-Id: 657af505-d5df-48d0-8300-c31994686c5c
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=657af505-d5df-48d0-8300-c31994686c5c; Ip=[149.199.62.198];
 Helo=[xsj-pvapexch02.xlnx.xilinx.com]
X-MS-Exchange-CrossTenant-AuthSource: CY1NAM02FT037.eop-nam02.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BN7PR02MB3971
X-Mailman-Approved-At: Mon, 30 Nov 2020 08:25:11 +0000
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
index d08ac82..23e58cc 100644
--- a/drivers/firmware/xilinx/zynqmp.c
+++ b/drivers/firmware/xilinx/zynqmp.c
@@ -729,6 +729,20 @@ int zynqmp_pm_set_boot_health_status(u32 value)
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
index 83ac9ec..defa4ea 100644
--- a/include/linux/firmware/xlnx-zynqmp.h
+++ b/include/linux/firmware/xlnx-zynqmp.h
@@ -114,6 +114,8 @@ enum pm_ioctl_id {
 	IOCTL_READ_PGGS = 15,
 	/* Set healthy bit value */
 	IOCTL_SET_BOOT_HEALTH_STATUS = 17,
+	/* AI engine NPI ISR clear */
+	IOCTL_AIE_ISR_CLEAR = 24,
 };
 
 enum pm_query_id {
@@ -355,6 +357,7 @@ int zynqmp_pm_write_pggs(u32 index, u32 value);
 int zynqmp_pm_read_pggs(u32 index, u32 *value);
 int zynqmp_pm_system_shutdown(const u32 type, const u32 subtype);
 int zynqmp_pm_set_boot_health_status(u32 value);
+int zynqmp_pm_clear_aie_npi_isr(u32 node, u32 irq_mask);
 #else
 static inline struct zynqmp_eemi_ops *zynqmp_pm_get_eemi_ops(void)
 {
@@ -505,6 +508,11 @@ static inline int zynqmp_pm_set_boot_health_status(u32 value)
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
