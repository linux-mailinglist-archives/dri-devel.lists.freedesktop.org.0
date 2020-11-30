Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 889262C7FB5
	for <lists+dri-devel@lfdr.de>; Mon, 30 Nov 2020 09:25:36 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4A95D6E43C;
	Mon, 30 Nov 2020 08:25:29 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM10-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam10on2054.outbound.protection.outlook.com [40.107.93.54])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C84356E40A
 for <dri-devel@lists.freedesktop.org>; Mon, 30 Nov 2020 07:48:35 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=LQi0t2cA3Sn6lTgSfbV6JEUm+caV034YVPWT9dY5D1p7hGG2FBaRmTYhF7ura5N9WFaT3UhYOkC9ulREJqIi+RSt37aheU7SB8WxrPKfIU2zaVgXLSloE0ATICM2d4FL6ayMzF/xooXDCk1CVz6Oo92S2mHgxbcch2yUB4d1MALUdE/RJU9ennfnszVfPkDglCkMnsHMjUkrtMamn6aWabpy5i0QIgYUXdWTuRGLVzU8uqtzCRArcZfPD1hrzq0JlC9KZJbS/DTlGKyrQ0BgD4Sv/A4xg61aJfCCSz7jJKMM1QD6iEW3ElWWCWEs7C7d6+AO1UYK2kX46bDsoxpWWA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=xZK2pzjRvi4T7bRyKSpPaWs/p3o+GWQR8in59XQqeb0=;
 b=kq8uZtqVMCGpqpqglbP5x3jW4CFKWMN+fFKX+U/qp1MMqzInktCDeJieMDuoe7O5/cQ7+xAN/wrYM7ODYqhL3ATs6rMaZN/WRwfCWRDuszDCn8iM/D94491vkMQJaHILKcN95EGz9bv8e83a1pzBQFvvPMnzMgHBPMxFRPGB+28BGHIV0ZwdEyv37DwGjif7c+y/7M/s8bwshfG3viIq6wMe2yJdiKNxI8vMKvvvBDCmmbFqTh33+huQFXqhnB6OIntcICIoT9cjOOJSfPsslJO/HgRAwjHlmeeAS4WXqvA2kirgJ0T14E5xRUcb72hecvQpx1hHI+n3xgNzxvz37A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 149.199.62.198) smtp.rcpttodomain=kernel.org smtp.mailfrom=xilinx.com;
 dmarc=bestguesspass action=none header.from=xilinx.com; dkim=none (message
 not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=xilinx.onmicrosoft.com; s=selector2-xilinx-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=xZK2pzjRvi4T7bRyKSpPaWs/p3o+GWQR8in59XQqeb0=;
 b=ORW+z8K/FXcstpmwAKGB9hn4hOVr0J0n1QYr+THH5ynFvhq1+sm7RhmlXQdvfG0H/+smU3rgX9GPBciizsbbNLVfC0mQ6jc/RuF7twrnnipCVDQ04RkSIJ4moKlr5DKyrseJrUmrwM1hXJzO1pKsbDX0Z7bQQ/N/SU6DSAjIZq8=
Received: from SA9PR10CA0023.namprd10.prod.outlook.com (2603:10b6:806:a7::28)
 by CY4PR02MB3270.namprd02.prod.outlook.com (2603:10b6:910:78::26)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3611.25; Mon, 30 Nov
 2020 07:48:33 +0000
Received: from SN1NAM02FT057.eop-nam02.prod.protection.outlook.com
 (2603:10b6:806:a7:cafe::d7) by SA9PR10CA0023.outlook.office365.com
 (2603:10b6:806:a7::28) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3611.25 via Frontend
 Transport; Mon, 30 Nov 2020 07:48:31 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 149.199.62.198)
 smtp.mailfrom=xilinx.com; kernel.org; dkim=none (message not signed)
 header.d=none;kernel.org; dmarc=bestguesspass action=none
 header.from=xilinx.com;
Received-SPF: Pass (protection.outlook.com: domain of xilinx.com designates
 149.199.62.198 as permitted sender) receiver=protection.outlook.com;
 client-ip=149.199.62.198; helo=xsj-pvapexch01.xlnx.xilinx.com;
Received: from xsj-pvapexch01.xlnx.xilinx.com (149.199.62.198) by
 SN1NAM02FT057.mail.protection.outlook.com (10.152.73.105) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.3611.27 via Frontend Transport; Mon, 30 Nov 2020 07:48:31 +0000
Received: from xsj-pvapexch02.xlnx.xilinx.com (172.19.86.41) by
 xsj-pvapexch01.xlnx.xilinx.com (172.19.86.40) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.1913.5; Sun, 29 Nov 2020 23:48:30 -0800
Received: from smtp.xilinx.com (172.19.127.96) by
 xsj-pvapexch02.xlnx.xilinx.com (172.19.86.41) with Microsoft SMTP Server id
 15.1.1913.5 via Frontend Transport; Sun, 29 Nov 2020 23:48:30 -0800
Envelope-to: michal.simek@xilinx.com, derek.kiernan@xilinx.com,
 dragan.cvetic@xilinx.com, rajan.vaja@xilinx.com,
 tejas.patel@xilinx.com, manish.narani@xilinx.com,
 ravi.patel@xilinx.com, wendy.liang@xilinx.com, robh+dt@kernel.org,
 arnd@arndb.de, gregkh@linuxfoundation.org,
 sumit.semwal@linaro.org, christian.koenig@amd.com,
 devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org, linux-media@vger.kernel.org,
 dri-devel@lists.freedesktop.org
Received: from [172.19.2.167] (port=48528 helo=xsjjliang50.xilinx.com)
 by smtp.xilinx.com with esmtp (Exim 4.90)
 (envelope-from <wendy.liang@xilinx.com>)
 id 1kjdvC-0006Pm-PN; Sun, 29 Nov 2020 23:48:30 -0800
From: Wendy Liang <wendy.liang@xilinx.com>
To: <robh+dt@kernel.org>, <michal.simek@xilinx.com>, <arnd@arndb.de>,
 <gregkh@linuxfoundation.org>, <sumit.semwal@linaro.org>,
 <christian.koenig@amd.com>, <derek.kiernan@xilinx.com>,
 <dragan.cvetic@xilinx.com>, <rajan.vaja@xilinx.com>,
 <tejas.patel@xilinx.com>, <manish.narani@xilinx.com>, <ravi.patel@xilinx.com>
Subject: [PATCH v3 0/9] Xilinx AI engine kernel driver
Date: Sun, 29 Nov 2020 23:48:16 -0800
Message-ID: <1606722505-16194-1-git-send-email-wendy.liang@xilinx.com>
X-Mailer: git-send-email 2.7.4
MIME-Version: 1.0
X-EOPAttributedMessage: 0
X-MS-Office365-Filtering-HT: Tenant
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 8fbdbc71-c7b9-41a8-a8e1-08d895045559
X-MS-TrafficTypeDiagnostic: CY4PR02MB3270:
X-Microsoft-Antispam-PRVS: <CY4PR02MB327096F9DA961D8506073E74B0F50@CY4PR02MB3270.namprd02.prod.outlook.com>
X-Auto-Response-Suppress: DR, RN, NRN, OOF, AutoReply
X-MS-Oob-TLC-OOBClassifiers: OLM:348;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: YKByB0YPIy92Mt++5bSfrg6Ho+2vFwc3lwFc9jNLcEN0VWPj3Y5Fs9rjy6xjXIfMfyhd6mIg78BsFvPx+LeSuNBXY8wECoNT3c+eShe/2yb0nJ2trUcIKoPzQ4XX0HrbEk2oo2n12cJkgoCpoL2pMFH6V704dkIYLQqCfCWgJESKBkIO8dvOw9yEoKbYTaJ02UDxH9qCBJ+ANQjJ65S1Ut1duo2NiL69XjYsJ5Ax8KX96kc0L8WObmkn1Ha4V528QB6sVGxAkBXZ8Y43zwJSc50pzzHDEwXNz4HeN31iXj1zoGj5F+H380DA7kEa1Cvuo9cdRPBZKvSz62TSmXnGlQ72Qd6f3Kr9J+WVNeVWoX8m8IrNrIvSZkuMi1xppYgC4RIBY8VkVNlxY1PqKBXgBL0nhVlm+lCvvJtU9NmhT7BjXI4q07m7QFJ23QUU/euPEIe7lm3hRse7b9370+kSoOhEFiEFC40CPDmi+itK7fFkNWNx2I9r/5IeOVRM6/HOEWK5xEeUsm4AcLQztvVtTQ==
X-Forefront-Antispam-Report: CIP:149.199.62.198; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:xsj-pvapexch01.xlnx.xilinx.com;
 PTR:unknown-62-198.xilinx.com; CAT:NONE;
 SFS:(4636009)(376002)(39850400004)(136003)(346002)(396003)(46966005)(2616005)(82740400003)(9786002)(7636003)(83380400001)(36906005)(6666004)(4326008)(36756003)(921005)(316002)(107886003)(336012)(54906003)(356005)(5660300002)(8676002)(82310400003)(7696005)(70586007)(7416002)(47076004)(70206006)(186003)(8936002)(26005)(478600001)(426003)(966005)(6636002)(44832011)(2906002)(110136005)(102446001);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: xilinx.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 Nov 2020 07:48:31.6462 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 8fbdbc71-c7b9-41a8-a8e1-08d895045559
X-MS-Exchange-CrossTenant-Id: 657af505-d5df-48d0-8300-c31994686c5c
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=657af505-d5df-48d0-8300-c31994686c5c; Ip=[149.199.62.198];
 Helo=[xsj-pvapexch01.xlnx.xilinx.com]
X-MS-Exchange-CrossTenant-AuthSource: SN1NAM02FT057.eop-nam02.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY4PR02MB3270
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

v3:
* unlock AIE dev mutex after failed to gain the partition lock in
  errors handing
* replace pointer with __u64 and enum with __u32 in ioctl

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
 drivers/misc/xilinx-ai-engine/ai-engine-clock.c    | 245 ++++++++
 drivers/misc/xilinx-ai-engine/ai-engine-dev.c      | 496 ++++++++++++++++
 drivers/misc/xilinx-ai-engine/ai-engine-dma.c      | 481 +++++++++++++++
 drivers/misc/xilinx-ai-engine/ai-engine-internal.h | 519 ++++++++++++++++
 .../misc/xilinx-ai-engine/ai-engine-interrupt.c    | 659 +++++++++++++++++++++
 drivers/misc/xilinx-ai-engine/ai-engine-mem.c      | 275 +++++++++
 drivers/misc/xilinx-ai-engine/ai-engine-part.c     | 635 ++++++++++++++++++++
 drivers/misc/xilinx-ai-engine/ai-engine-res.c      | 219 +++++++
 drivers/misc/xilinx-ai-engine/ai-engine-reset.c    | 159 +++++
 include/linux/firmware/xlnx-zynqmp.h               |   8 +
 include/uapi/linux/xlnx-ai-engine.h                | 238 ++++++++
 18 files changed, 4719 insertions(+)
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
