Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 3C6ED2B8D70
	for <lists+dri-devel@lfdr.de>; Thu, 19 Nov 2020 09:33:16 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3677C6E580;
	Thu, 19 Nov 2020 08:33:02 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM11-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam11on2042.outbound.protection.outlook.com [40.107.223.42])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EE5C66E42D
 for <dri-devel@lists.freedesktop.org>; Wed, 18 Nov 2020 08:06:59 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=jo8vCK768z4ZUxVfmQEjA30DvxcMUOHLdbab2LbhVKrx0J/xPVh3Dk0LvE/LIR0cUZhNkomN2kko2W1U34o1uqghay2zQOtweKFz/pf+RGtX8GRUdPvFT8xTvkEO5O7ccRLth/zTjLHULF79bRsyi4aN+VjIFI2wvUurajpLWSYXJQFaiI81OI36k84QUrTP9KJK/ItqaEbYnbr/nkoXBcrhm9kTlKYW7trubBCPuVN/KzEjVJjxnAnXkQx+N2l/ocY1QEPA8btC+KsgNckDfMRvsDHJHsyBGA3tyPitaB6aYB8fLEGtJ4jxsHRRA0GzQ1v1QDiv/QEJZvhKlH8AVQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=sgFPcwVcdVDA1lISQdnpSALC+Om4hmyoTqUgCLjEox0=;
 b=j0ein2QxcpkUCi/sLzSIbeIxJUw6zRlh2D4TcuUV4ocjQWWfbf0yOEnME7o8xMedrje/oGss6TXJHsiGEwtrC7x/pdCjKDc9vUKhx9bCYg0rO28d9awPD8oPjPmK0o+IM+T2rnHoW6w+5oI7Cl3lzQ6TFWpUqJp6M73GaeYMYc4+YMB4BcjO8H3i9FUJQq3jUD4pLO8d2VKa5dyaClSxTBvWa10v+7GjiHkY673lnSK57D2S+xCeWQskQvzvBl4VlQU5pilucQ55JU21JWUjIsZoNlY0Y25U/0nmD/LMUUSbp+22jYXrpTkT4CZYnD4Fjk8hOp+0EFOdtG7//0mLGg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 149.199.62.198) smtp.rcpttodomain=kernel.org smtp.mailfrom=xilinx.com;
 dmarc=bestguesspass action=none header.from=xilinx.com; dkim=none (message
 not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=xilinx.onmicrosoft.com; s=selector2-xilinx-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=sgFPcwVcdVDA1lISQdnpSALC+Om4hmyoTqUgCLjEox0=;
 b=ryUmlwrDxOryq4RpmVoRCAFocFEESG4PAEQVL+TQ9bai5z1aG0RSsogvhaU9GDGeBHSpFfRcR2sdrAnMrJmumu4vP0t1f5tbJUkgKyps/i8MmMQbEQzUvnVqrH1GMsVSmglrX9NBGEC00TCM0prgXEX1xE+X5WmUO73U0fGtOtQ=
Received: from SA0PR11CA0092.namprd11.prod.outlook.com (2603:10b6:806:d1::7)
 by DM6PR02MB4265.namprd02.prod.outlook.com (2603:10b6:5:2e::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3564.25; Wed, 18 Nov
 2020 08:06:58 +0000
Received: from SN1NAM02FT048.eop-nam02.prod.protection.outlook.com
 (2603:10b6:806:d1:cafe::68) by SA0PR11CA0092.outlook.office365.com
 (2603:10b6:806:d1::7) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3589.20 via Frontend
 Transport; Wed, 18 Nov 2020 08:06:57 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 149.199.62.198)
 smtp.mailfrom=xilinx.com; kernel.org; dkim=none (message not signed)
 header.d=none;kernel.org; dmarc=bestguesspass action=none
 header.from=xilinx.com;
Received-SPF: Pass (protection.outlook.com: domain of xilinx.com designates
 149.199.62.198 as permitted sender) receiver=protection.outlook.com;
 client-ip=149.199.62.198; helo=xsj-pvapexch01.xlnx.xilinx.com;
Received: from xsj-pvapexch01.xlnx.xilinx.com (149.199.62.198) by
 SN1NAM02FT048.mail.protection.outlook.com (10.152.72.202) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.3564.22 via Frontend Transport; Wed, 18 Nov 2020 08:06:56 +0000
Received: from xsj-pvapexch01.xlnx.xilinx.com (172.19.86.40) by
 xsj-pvapexch01.xlnx.xilinx.com (172.19.86.40) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.1913.5; Wed, 18 Nov 2020 00:06:33 -0800
Received: from smtp.xilinx.com (172.19.127.95) by
 xsj-pvapexch01.xlnx.xilinx.com (172.19.86.40) with Microsoft SMTP Server id
 15.1.1913.5 via Frontend Transport; Wed, 18 Nov 2020 00:06:33 -0800
Envelope-to: michal.simek@xilinx.com, derek.kiernan@xilinx.com,
 dragan.cvetic@xilinx.com, rajan.vaja@xilinx.com,
 tejas.patel@xilinx.com, manish.narani@xilinx.com,
 ravi.patel@xilinx.com, izhar.ameer.shaikh@xilinx.com,
 wendy.liang@xilinx.com, robh+dt@kernel.org, arnd@arndb.de,
 gregkh@linuxfoundation.org, sumit.semwal@linaro.org,
 christian.koenig@amd.com, devicetree@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org, linux-media@vger.kernel.org,
 dri-devel@lists.freedesktop.org, linaro-mm-sig@lists.linaro.org
Received: from [172.19.2.167] (port=35936 helo=xsjjliang50.xilinx.com)
 by smtp.xilinx.com with esmtp (Exim 4.90)
 (envelope-from <wendy.liang@xilinx.com>)
 id 1kfIU5-0000Nk-QS; Wed, 18 Nov 2020 00:06:33 -0800
From: Wendy Liang <wendy.liang@xilinx.com>
To: <robh+dt@kernel.org>, <michal.simek@xilinx.com>, <arnd@arndb.de>,
 <gregkh@linuxfoundation.org>, <sumit.semwal@linaro.org>,
 <christian.koenig@amd.com>, <derek.kiernan@xilinx.com>,
 <dragan.cvetic@xilinx.com>, <rajan.vaja@xilinx.com>,
 <tejas.patel@xilinx.com>, <manish.narani@xilinx.com>, <ravi.patel@xilinx.com>
Subject: [PATCH 8/9] firmware: xilinx: Add IOCTL support for AIE ISR Clear
Date: Wed, 18 Nov 2020 00:06:19 -0800
Message-ID: <1605686780-17886-9-git-send-email-wendy.liang@xilinx.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1605686780-17886-1-git-send-email-wendy.liang@xilinx.com>
References: <1605686780-17886-1-git-send-email-wendy.liang@xilinx.com>
MIME-Version: 1.0
X-EOPAttributedMessage: 0
X-MS-Office365-Filtering-HT: Tenant
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: e10d6275-e360-4838-29da-08d88b98eb2b
X-MS-TrafficTypeDiagnostic: DM6PR02MB4265:
X-Microsoft-Antispam-PRVS: <DM6PR02MB42655720BE305005CC3D4A10B0E10@DM6PR02MB4265.namprd02.prod.outlook.com>
X-Auto-Response-Suppress: DR, RN, NRN, OOF, AutoReply
X-MS-Oob-TLC-OOBClassifiers: OLM:7219;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 6kVZJpBpGhGhZo8B/GKzgyHgMIJRRDFAKJCGHyhVEYgTaTTQa8BdogEueB4plsvyN1vtKO4i94lYpPLivUCKs0F/V/ZJ8Ok81atjaqcCJlq8YLNM3SLVL8PjkmRZhRUPTk6TzDknFd4ruua91FCZ1FcMyEKM2mNQkdFXeJObuHFXbLO6vO+lmlwNqNwbvc6bJQ33a2RSOKLT/Thex3S6jrYRTxEx2bAT58tCtywlxjSHDqv86xrzgzN2lkW+vo7sRmLFqMcK1c5pA1ylONKzkorgA/XMnaG8kZQ/dnkufUZZyOrV74oG3UnSqdOyTpDKp6Bcfd4cVTpv/9ZND8PhO4sWlcVupFUgcX1vynvolBFjAE5AVJijPzdNXNCEhLwKvq3LOzlbodWcEcKvpUVYoRwVD6cz2Y5v0v8IGBtcAgz9chO0ojYZbe7yn3ezT3J/
X-Forefront-Antispam-Report: CIP:149.199.62.198; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:xsj-pvapexch01.xlnx.xilinx.com;
 PTR:unknown-62-198.xilinx.com; CAT:NONE;
 SFS:(4636009)(136003)(376002)(39850400004)(396003)(346002)(46966005)(426003)(2616005)(82310400003)(44832011)(54906003)(47076004)(5660300002)(7696005)(36906005)(316002)(478600001)(110136005)(336012)(6666004)(921005)(2906002)(26005)(83380400001)(186003)(36756003)(82740400003)(4326008)(8936002)(7416002)(7636003)(6636002)(9786002)(8676002)(70206006)(356005)(70586007)(107886003)(102446001);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: xilinx.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Nov 2020 08:06:56.8889 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: e10d6275-e360-4838-29da-08d88b98eb2b
X-MS-Exchange-CrossTenant-Id: 657af505-d5df-48d0-8300-c31994686c5c
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=657af505-d5df-48d0-8300-c31994686c5c; Ip=[149.199.62.198];
 Helo=[xsj-pvapexch01.xlnx.xilinx.com]
X-MS-Exchange-CrossTenant-AuthSource: SN1NAM02FT048.eop-nam02.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR02MB4265
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
Cc: devicetree@vger.kernel.org, Izhar
 Ameer Shaikh <izhar.ameer.shaikh@xilinx.com>, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, linaro-mm-sig@lists.linaro.org,
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
index 5968df8..b929d57 100644
--- a/include/linux/firmware/xlnx-zynqmp.h
+++ b/include/linux/firmware/xlnx-zynqmp.h
@@ -116,6 +116,8 @@ enum pm_ioctl_id {
 	IOCTL_READ_PGGS = 15,
 	/* Set healthy bit value */
 	IOCTL_SET_BOOT_HEALTH_STATUS = 17,
+	/* AI engine NPI ISR clear */
+	IOCTL_AIE_ISR_CLEAR = 24,
 };
 
 enum pm_query_id {
@@ -357,6 +359,7 @@ int zynqmp_pm_write_pggs(u32 index, u32 value);
 int zynqmp_pm_read_pggs(u32 index, u32 *value);
 int zynqmp_pm_system_shutdown(const u32 type, const u32 subtype);
 int zynqmp_pm_set_boot_health_status(u32 value);
+int zynqmp_pm_clear_aie_npi_isr(u32 node, u32 irq_mask);
 #else
 static inline struct zynqmp_eemi_ops *zynqmp_pm_get_eemi_ops(void)
 {
@@ -507,6 +510,11 @@ static inline int zynqmp_pm_set_boot_health_status(u32 value)
 {
 	return -ENODEV;
 }
+
+static int zynqmp_pm_clear_aie_npi_isr(u32 node, u32 irq_mask)
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
