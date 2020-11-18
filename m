Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C6B9C2B8D5D
	for <lists+dri-devel@lfdr.de>; Thu, 19 Nov 2020 09:32:46 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B2BDD6E52C;
	Thu, 19 Nov 2020 08:31:49 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM12-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam12on2052.outbound.protection.outlook.com [40.107.243.52])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B4C966E3D3
 for <dri-devel@lists.freedesktop.org>; Wed, 18 Nov 2020 08:06:37 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=FQf+Pj3TfomKGmqfICKPFvjIs3O00B0JQMk92Yy2+A2JDMMdiSTOEly/o93t6oA+tM0C/hKt9g3agrgXOOFRkM3Z3pg4ebFK+o92OjwMVcZyKQmeONrtAIHPVespt9Lh6Ws0+k3Gno+hhz37dSWqHNfuNkWTMXdiCWqTI0TkBVn2w3SHQ301EAvBK+UsL4gGpBiWohLC4mK1Deb8LAITxNqs8yl1ouEzJ/uCgb/iUkU0WKNKqWA2pRoK1tlyk1fDmWJ1k87s2hfGJ0HG7we9Z4apXhj/2N/vzpi98wnfiK29xXYiJAbgf73T4bjtPRstIqUJst42XVc7Sd3+QGwMmw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=q0nD+xrKCoRJnd2ci4g9RBMRwYk7vdecmC4tyUpod0w=;
 b=haerDyF8o/jyvPHgS49SodAON8V9aLHQ6MxiC6Fs3vQCZ5oxpmbBkIxwC2RMjzHJsZJalFbyjICzOYWcAdETI8+CD1s6hCNRIhXtxA55WwTDdQPmWoNigcWpXVNTce+1i329w5LdhrpQSXa+VNPsOKhWE5UOwEsgueag0Dt4tYBQN2YiXK72fzTUPEuGX4i0qf9fjyQLtbO6+UnqllEKc+aBNw723oz9UWegnN+NFjlgu4TLl1S0PyzZzCemrKRBmJ/Yg4aiN0gI0qRVrJKCo5jetcKRotC/uWdyN8y5oikDul+aGG7kJi7QPTsuFyf2EY+Kp6p47gSFKUcQ1PwAfA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 149.199.62.198) smtp.rcpttodomain=kernel.org smtp.mailfrom=xilinx.com;
 dmarc=bestguesspass action=none header.from=xilinx.com; dkim=none (message
 not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=xilinx.onmicrosoft.com; s=selector2-xilinx-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=q0nD+xrKCoRJnd2ci4g9RBMRwYk7vdecmC4tyUpod0w=;
 b=mPnycYrWBPgC2E3GBv+SeLUFd4iOYYA4s/GrWKURQ5go7s2Hdf/rTo1EabuhC/z+ZnIo91jQ/vVV0jBXoCH8kesAHI294Mkr55qDW1rYA571PXBB410jhIgkcrbEvjejcIjeju+UXYcr7slF8Hd2BNrqN+g+GOXn4T0yfzJ+Plc=
Received: from CY4PR22CA0052.namprd22.prod.outlook.com (2603:10b6:903:ae::14)
 by BYAPR02MB5637.namprd02.prod.outlook.com (2603:10b6:a03:97::14)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3564.28; Wed, 18 Nov
 2020 08:06:35 +0000
Received: from CY1NAM02FT033.eop-nam02.prod.protection.outlook.com
 (2603:10b6:903:ae:cafe::f9) by CY4PR22CA0052.outlook.office365.com
 (2603:10b6:903:ae::14) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3589.20 via Frontend
 Transport; Wed, 18 Nov 2020 08:06:34 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 149.199.62.198)
 smtp.mailfrom=xilinx.com; kernel.org; dkim=none (message not signed)
 header.d=none;kernel.org; dmarc=bestguesspass action=none
 header.from=xilinx.com;
Received-SPF: Pass (protection.outlook.com: domain of xilinx.com designates
 149.199.62.198 as permitted sender) receiver=protection.outlook.com;
 client-ip=149.199.62.198; helo=xsj-pvapexch02.xlnx.xilinx.com;
Received: from xsj-pvapexch02.xlnx.xilinx.com (149.199.62.198) by
 CY1NAM02FT033.mail.protection.outlook.com (10.152.75.179) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.3564.22 via Frontend Transport; Wed, 18 Nov 2020 08:06:34 +0000
Received: from xsj-pvapexch01.xlnx.xilinx.com (172.19.86.40) by
 xsj-pvapexch02.xlnx.xilinx.com (172.19.86.41) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.1913.5; Wed, 18 Nov 2020 00:06:33 -0800
Received: from smtp.xilinx.com (172.19.127.95) by
 xsj-pvapexch01.xlnx.xilinx.com (172.19.86.40) with Microsoft SMTP Server id
 15.1.1913.5 via Frontend Transport; Wed, 18 Nov 2020 00:06:33 -0800
Envelope-to: michal.simek@xilinx.com, derek.kiernan@xilinx.com,
 dragan.cvetic@xilinx.com, rajan.vaja@xilinx.com,
 tejas.patel@xilinx.com, manish.narani@xilinx.com,
 ravi.patel@xilinx.com, wendy.liang@xilinx.com, robh+dt@kernel.org,
 arnd@arndb.de, gregkh@linuxfoundation.org,
 sumit.semwal@linaro.org, christian.koenig@amd.com,
 devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org, linux-media@vger.kernel.org,
 dri-devel@lists.freedesktop.org, linaro-mm-sig@lists.linaro.org
Received: from [172.19.2.167] (port=35936 helo=xsjjliang50.xilinx.com)
 by smtp.xilinx.com with esmtp (Exim 4.90)
 (envelope-from <wendy.liang@xilinx.com>)
 id 1kfIU5-0000Nk-Fy; Wed, 18 Nov 2020 00:06:33 -0800
From: Wendy Liang <wendy.liang@xilinx.com>
To: <robh+dt@kernel.org>, <michal.simek@xilinx.com>, <arnd@arndb.de>,
 <gregkh@linuxfoundation.org>, <sumit.semwal@linaro.org>,
 <christian.koenig@amd.com>, <derek.kiernan@xilinx.com>,
 <dragan.cvetic@xilinx.com>, <rajan.vaja@xilinx.com>,
 <tejas.patel@xilinx.com>, <manish.narani@xilinx.com>, <ravi.patel@xilinx.com>
Subject: [PATCH 0/9] Xilinx AI engine kernel driver
Date: Wed, 18 Nov 2020 00:06:11 -0800
Message-ID: <1605686780-17886-1-git-send-email-wendy.liang@xilinx.com>
X-Mailer: git-send-email 2.7.4
MIME-Version: 1.0
X-EOPAttributedMessage: 0
X-MS-Office365-Filtering-HT: Tenant
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: e49283c1-e8aa-4f37-56b8-08d88b98ddf0
X-MS-TrafficTypeDiagnostic: BYAPR02MB5637:
X-Microsoft-Antispam-PRVS: <BYAPR02MB5637B867834E38BFC17BB8DBB0E10@BYAPR02MB5637.namprd02.prod.outlook.com>
X-Auto-Response-Suppress: DR, RN, NRN, OOF, AutoReply
X-MS-Oob-TLC-OOBClassifiers: OLM:6108;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: bEj8nTVYwEg6i2wFy4UFsZIB1n+gFBo3DaQ1xap2s29ZvSyGJVj7Kz1HhL2AuCvkyXZtCos0a3mDbxfhizKglw92b+sfW1hx/QrrzFXUIunLQqOJAfxUoQR/1+1qGneWYssQzQNJP1tA+/w/rpmrnh62QwA4tZywnEdEXHyuxILv0QLZBt6Idi6aSMBbFPZRtfKYORBZ9bQ98da/YfbWVjZ6V4/uQ0TPZcxWDJMdty97kaD74pixNEH83YCUkP1E0cwemJLWQknnxuQamLRQRIFyJ0Ij0pLcz6vZ0/c28f092grO27+I8RPzmQ/H4B8U1BjBnllc1U9GIr3PcFrgVa6ZRXGefs5mTKKPEN3IPiVyDLJlUX6JApVO+38DQK/RPmVK7bxLwbBCuP5LLkFvomBj5YnKLGmB+UYpgpMDdMe7vyppc6rtOPuwxHDKCLvmpBuBNC17mAaTrN3arDACrzu5QJyp706qPP2SnuTU/Xz/gwADm4rzCo2tFE4/DjR78ym1lfwzXgUP3At6qXrNFQ==
X-Forefront-Antispam-Report: CIP:149.199.62.198; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:xsj-pvapexch02.xlnx.xilinx.com;
 PTR:unknown-62-198.xilinx.com; CAT:NONE;
 SFS:(4636009)(346002)(396003)(39850400004)(376002)(136003)(46966005)(54906003)(336012)(83380400001)(110136005)(8936002)(4326008)(2906002)(7416002)(107886003)(478600001)(316002)(82310400003)(44832011)(8676002)(426003)(2616005)(26005)(186003)(36906005)(7696005)(7636003)(5660300002)(70206006)(6666004)(70586007)(9786002)(6636002)(966005)(356005)(36756003)(82740400003)(47076004)(921005)(102446001);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: xilinx.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Nov 2020 08:06:34.7070 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: e49283c1-e8aa-4f37-56b8-08d88b98ddf0
X-MS-Exchange-CrossTenant-Id: 657af505-d5df-48d0-8300-c31994686c5c
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=657af505-d5df-48d0-8300-c31994686c5c; Ip=[149.199.62.198];
 Helo=[xsj-pvapexch02.xlnx.xilinx.com]
X-MS-Exchange-CrossTenant-AuthSource: CY1NAM02FT033.eop-nam02.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BYAPR02MB5637
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
 dri-devel@lists.freedesktop.org, linaro-mm-sig@lists.linaro.org, Wendy
 Liang <wendy.liang@xilinx.com>, linux-arm-kernel@lists.infradead.org,
 linux-media@vger.kernel.org
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

 .../bindings/soc/xilinx/xlnx,ai-engine.yaml        | 119 ++++
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
 .../misc/xilinx-ai-engine/ai-engine-interrupt.c    | 661 +++++++++++++++++++++
 drivers/misc/xilinx-ai-engine/ai-engine-mem.c      | 274 +++++++++
 drivers/misc/xilinx-ai-engine/ai-engine-part.c     | 635 ++++++++++++++++++++
 drivers/misc/xilinx-ai-engine/ai-engine-res.c      | 219 +++++++
 drivers/misc/xilinx-ai-engine/ai-engine-reset.c    | 159 +++++
 include/linux/firmware/xlnx-zynqmp.h               |   8 +
 include/uapi/linux/xlnx-ai-engine.h                | 236 ++++++++
 18 files changed, 4706 insertions(+)
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
