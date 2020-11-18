Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 440312B8D2C
	for <lists+dri-devel@lfdr.de>; Thu, 19 Nov 2020 09:32:24 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1CC076E52F;
	Thu, 19 Nov 2020 08:31:49 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM12-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam12on2054.outbound.protection.outlook.com [40.107.243.54])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4B54C6E4D2
 for <dri-devel@lists.freedesktop.org>; Wed, 18 Nov 2020 23:48:19 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=c1LxhrwpAobqcyz/aMTamxGuQZnR5gJA4bzpgCJSfQ11ER7CLNlZNw/9035nwy9UMvQbkSQLcZiZFKHSc13CT0vb54WyW3pnMZl700Ge/6omPjJ9SlSPGBSLMj6aQ+ok3AU+A8UTCdm1J2v03KYEwvvu1FSCbVf4WW2yPRezsVIZjk+d4kLUa9xljD/yEj6QWRXTwG67MaE39TLc2reKlnBspPCgJFp5D4JyFC+SXroeQ9fi7y7mLWEpXzWYZCzZBP/KcfSj3kKIhN5tDMmQBYa8eiLwJ9PedC6jCx30JkyvMvJYKtwEkeHWj3q+yF1YRC/sqeCRobt67aUxYl+qUg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=c6t0TsiSJl+7WN6xGdp6MVeBR0eM9sX9FKauYUnoMMM=;
 b=C/VLpG1Kk40DlzpzYY5hHg8ANk+r8rBtqU2dlnaauIupS4b5LDQza2Gr9OazAshqFVJHCVi3nIOoly1RhdD2P8DOQad17IJ5eyQtu7r9bD65bSJi4aBxj3mVgBuAIYRCextWegHI+hcki4baYOz8Ef+b6HUGPFmxu+LTR9KJAie36bgUTmQ+AJ4SdqwWAx5V09fu9iqVjvfOOIK+3vbqCsI/EPxVFM23cPwBWdhKLEPL+fOu774poDlHMRTe1EgoNjNp+tvy/ZhTInwZNg9JktBw0EoN6POyfEXjMMa4QERgSmT9V8z7aYTLAcyue+U2Pqn5ab536X9OE7zp5aUTDw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 149.199.62.198) smtp.rcpttodomain=kernel.org smtp.mailfrom=xilinx.com;
 dmarc=bestguesspass action=none header.from=xilinx.com; dkim=none (message
 not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=xilinx.onmicrosoft.com; s=selector2-xilinx-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=c6t0TsiSJl+7WN6xGdp6MVeBR0eM9sX9FKauYUnoMMM=;
 b=K0tviN4nOyrJQ7Za7TWpYgUMlTkQG1xnNPa4BjljH6KqYY51N417qROlInO4Sv8SrAh8BZqo+3xkxVsZvTSoVcMD/VI5D2Ir54bpBnMepvF41FgMweMFiXo/WSrGnV+N0hfGPB+knQH0H1MsTHvz7ESFvtpfRTkRnljsAJxAUkM=
Received: from SN4PR0801CA0021.namprd08.prod.outlook.com
 (2603:10b6:803:29::31) by BN7PR02MB4020.namprd02.prod.outlook.com
 (2603:10b6:406:f1::12) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3589.21; Wed, 18 Nov
 2020 23:48:16 +0000
Received: from SN1NAM02FT064.eop-nam02.prod.protection.outlook.com
 (2603:10b6:803:29:cafe::e6) by SN4PR0801CA0021.outlook.office365.com
 (2603:10b6:803:29::31) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3589.20 via Frontend
 Transport; Wed, 18 Nov 2020 23:48:16 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 149.199.62.198)
 smtp.mailfrom=xilinx.com; kernel.org; dkim=none (message not signed)
 header.d=none;kernel.org; dmarc=bestguesspass action=none
 header.from=xilinx.com;
Received-SPF: Pass (protection.outlook.com: domain of xilinx.com designates
 149.199.62.198 as permitted sender) receiver=protection.outlook.com;
 client-ip=149.199.62.198; helo=xsj-pvapexch01.xlnx.xilinx.com;
Received: from xsj-pvapexch01.xlnx.xilinx.com (149.199.62.198) by
 SN1NAM02FT064.mail.protection.outlook.com (10.152.72.143) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.3564.22 via Frontend Transport; Wed, 18 Nov 2020 23:48:16 +0000
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
 ravi.patel@xilinx.com, wendy.liang@xilinx.com, robh+dt@kernel.org,
 arnd@arndb.de, gregkh@linuxfoundation.org,
 sumit.semwal@linaro.org, christian.koenig@amd.com,
 devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org, linux-media@vger.kernel.org,
 dri-devel@lists.freedesktop.org
Received: from [172.19.2.167] (port=36324 helo=xsjjliang50.xilinx.com)
 by smtp.xilinx.com with esmtp (Exim 4.90)
 (envelope-from <wendy.liang@xilinx.com>)
 id 1kfXBL-0000Wz-3e; Wed, 18 Nov 2020 15:48:11 -0800
From: Wendy Liang <wendy.liang@xilinx.com>
To: <robh+dt@kernel.org>, <michal.simek@xilinx.com>, <arnd@arndb.de>,
 <gregkh@linuxfoundation.org>, <sumit.semwal@linaro.org>,
 <christian.koenig@amd.com>, <derek.kiernan@xilinx.com>,
 <dragan.cvetic@xilinx.com>, <rajan.vaja@xilinx.com>,
 <tejas.patel@xilinx.com>, <manish.narani@xilinx.com>, <ravi.patel@xilinx.com>
Subject: [PATCH v2 0/9] Xilinx AI engine kernel driver
Date: Wed, 18 Nov 2020 15:48:00 -0800
Message-ID: <1605743289-26575-1-git-send-email-wendy.liang@xilinx.com>
X-Mailer: git-send-email 2.7.4
MIME-Version: 1.0
X-EOPAttributedMessage: 0
X-MS-Office365-Filtering-HT: Tenant
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 3039bffa-f1d0-4a75-0e51-08d88c1c6ba8
X-MS-TrafficTypeDiagnostic: BN7PR02MB4020:
X-Microsoft-Antispam-PRVS: <BN7PR02MB40206E206E1C5CE1C7572D09B0E10@BN7PR02MB4020.namprd02.prod.outlook.com>
X-Auto-Response-Suppress: DR, RN, NRN, OOF, AutoReply
X-MS-Oob-TLC-OOBClassifiers: OLM:308;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: VmcPcKoysL5kRgqIB8652nltzK1BdXfhajnXZBPJ1PLZ+HF3dP+T6Csrj2N+iHq7OX23pTDZXEHfpZuXaqO6DKlSSyXc0YtOSrKszhXgXeGxeMC5KHA+RcUJuNoCaBaE89N0WLW5uYoo6M5iMD8XQ38OrOauyCNn9gVahMyImMcmglyR3cxdNTpxB0HONwlr/5oCKlfz8NNQc9/Mbv7BeIUkUnusVSh6ptA8rfuel/+yq4B1snDdBHf0kuzOfvNkQGqz7hUFT7/olnZ4/Oo6L9LO9Vc7prjiLvP/jyJtT17LEDvleNBMpSrafZWX1c8J8yoo1InS+4mOXXuo/Sn9Q/SsbeGM6KLIJ9BHZEvYVNcq3Dijf1EATWdjSAbJHVYt/BMR+9PWr+GhNQ0w/ZOF/h3RHtyiOFtdXRzhZyLxvsTWcL1T1zjjPs3vJnbCWsH28hnWp696VMYmFnTdFuI5FBxasBKFFgPNBNHKVXUAFNDG+as/hMy32PJSgreF46zKXJcFIvN6KByjVkgyMhUXdw==
X-Forefront-Antispam-Report: CIP:149.199.62.198; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:xsj-pvapexch01.xlnx.xilinx.com;
 PTR:unknown-62-198.xilinx.com; CAT:NONE;
 SFS:(4636009)(396003)(346002)(136003)(39860400002)(376002)(46966005)(110136005)(44832011)(6636002)(966005)(6666004)(8936002)(2616005)(47076004)(54906003)(36756003)(7636003)(478600001)(186003)(921005)(83380400001)(82740400003)(70206006)(36906005)(107886003)(9786002)(4326008)(8676002)(426003)(2906002)(336012)(82310400003)(316002)(5660300002)(7416002)(356005)(26005)(7696005)(70586007)(102446001);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: xilinx.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Nov 2020 23:48:16.5274 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 3039bffa-f1d0-4a75-0e51-08d88c1c6ba8
X-MS-Exchange-CrossTenant-Id: 657af505-d5df-48d0-8300-c31994686c5c
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=657af505-d5df-48d0-8300-c31994686c5c; Ip=[149.199.62.198];
 Helo=[xsj-pvapexch01.xlnx.xilinx.com]
X-MS-Exchange-CrossTenant-AuthSource: SN1NAM02FT064.eop-nam02.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BN7PR02MB4020
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
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, Wendy Liang <wendy.liang@xilinx.com>,
 linux-arm-kernel@lists.infradead.org, linux-media@vger.kernel.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

AI engine is the acceleration engine provided by Xilinx. These engines
provide high compute density for vector-based algorithms, and flexible
custom compute and data movement. It has core tiles for compute and
shim tiles to interface the FPGA fabric.

You can check the AI engine architecture document for more hardware details:
https://www.xilinx.com/support/documentation/architecture-manuals/am009-versal-ai-engine.pdf

This patch series adds a Linux kernel driver to manage the Xilinx AI
engine array device and AI engine partitions (groups of AI engine tiles
dedicated to an application).

v2:
* Fix dtschema check errors
* Fix test bot warning on interrupt implementation. Removed set but
  unused  varaible.
* Fix compilation unused function warning of firmware change in case
  ZynqMP firmware is not configured
* There are other warning on ZynqMP firmware reported from testbot
  which is not introduced by this patch set.
  "[PATCH] firmware: xlnx-zynqmp: fix compilation warning" is submitted
  for those fixes.

Izhar Ameer Shaikh (1):
  firmware: xilinx: Add IOCTL support for AIE ISR Clear

Nishad Saraf (2):
  misc: xilinx-ai-engine: Add support to request device management
    services
  misc: xilinx-ai-engine: Add support for servicing error interrupts

Wendy Liang (6):
  dt-binding: soc: xilinx: ai-engine: Add AI engine binding
  misc: Add Xilinx AI engine device driver
  misc: xilinx-ai-engine: Implement AI engine cleanup sequence
  misc: xilinx-ai-engine: expose AI engine tile memories to userspace
  misc: xilinx-ai-engine: add setting shim dma bd operation
  misc: xilinx-ai-engine: add request and release tiles

 .../bindings/soc/xilinx/xlnx,ai-engine.yaml        | 126 ++++
 MAINTAINERS                                        |   8 +
 drivers/firmware/xilinx/zynqmp.c                   |  14 +
 drivers/misc/Kconfig                               |  12 +
 drivers/misc/Makefile                              |   1 +
 drivers/misc/xilinx-ai-engine/Makefile             |  16 +
 drivers/misc/xilinx-ai-engine/ai-engine-aie.c      | 608 +++++++++++++++++++
 drivers/misc/xilinx-ai-engine/ai-engine-clock.c    | 244 ++++++++
 drivers/misc/xilinx-ai-engine/ai-engine-dev.c      | 492 +++++++++++++++
 drivers/misc/xilinx-ai-engine/ai-engine-dma.c      | 481 +++++++++++++++
 drivers/misc/xilinx-ai-engine/ai-engine-internal.h | 519 ++++++++++++++++
 .../misc/xilinx-ai-engine/ai-engine-interrupt.c    | 659 +++++++++++++++++++++
 drivers/misc/xilinx-ai-engine/ai-engine-mem.c      | 274 +++++++++
 drivers/misc/xilinx-ai-engine/ai-engine-part.c     | 635 ++++++++++++++++++++
 drivers/misc/xilinx-ai-engine/ai-engine-res.c      | 219 +++++++
 drivers/misc/xilinx-ai-engine/ai-engine-reset.c    | 159 +++++
 include/linux/firmware/xlnx-zynqmp.h               |   8 +
 include/uapi/linux/xlnx-ai-engine.h                | 236 ++++++++
 18 files changed, 4711 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/soc/xilinx/xlnx,ai-engine.yaml
 create mode 100644 drivers/misc/xilinx-ai-engine/Makefile
 create mode 100644 drivers/misc/xilinx-ai-engine/ai-engine-aie.c
 create mode 100644 drivers/misc/xilinx-ai-engine/ai-engine-clock.c
 create mode 100644 drivers/misc/xilinx-ai-engine/ai-engine-dev.c
 create mode 100644 drivers/misc/xilinx-ai-engine/ai-engine-dma.c
 create mode 100644 drivers/misc/xilinx-ai-engine/ai-engine-internal.h
 create mode 100644 drivers/misc/xilinx-ai-engine/ai-engine-interrupt.c
 create mode 100644 drivers/misc/xilinx-ai-engine/ai-engine-mem.c
 create mode 100644 drivers/misc/xilinx-ai-engine/ai-engine-part.c
 create mode 100644 drivers/misc/xilinx-ai-engine/ai-engine-res.c
 create mode 100644 drivers/misc/xilinx-ai-engine/ai-engine-reset.c
 create mode 100644 include/uapi/linux/xlnx-ai-engine.h

-- 
2.7.4

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
