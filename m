Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 8F4BB1B1846
	for <lists+dri-devel@lfdr.de>; Mon, 20 Apr 2020 23:21:24 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0ED8388CFA;
	Mon, 20 Apr 2020 21:21:21 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM10-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam10on2089.outbound.protection.outlook.com [40.107.93.89])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 19B406E85B
 for <dri-devel@lists.freedesktop.org>; Mon, 20 Apr 2020 21:21:16 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=P87LNasJlsDpFLgYyVIdgw6LniJSe/FQ6BO+gjByI3xJfv5JnNwybEN/YFUfp0G328Ae3DSmVjelC9yDUSgDE2KQv4yw438gauLR33zaeRX3JIFt/Ie/+MwefgiQR9xC9ykgSG2hnNJ/jOH60VRAoh61QOZI3SFMyHD0Vo30QUQBFogDTAnBl3nP1a7fjPhG1VRcP1Q3JFxtAUibB0vW7KOFGTFuserUh6tKKheFXoYkxOhpTsOXVMjpxNF4zEhfUyZUB3blgn7Lzx3tgj5q+Za5iWIAaJkmNpZwUfGjDzop1FF8cCYjkmMmOy/C5taBgOHjirJzNTNOUeFnO8AImQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=STiOgL68xRXzJBQVR2laSeo1owTpwOF5svz45x/QBNA=;
 b=URLD5EYnWMc1TtABz8SPFfLlIiQFVfjPbfRGWJjSc0z3PEnKU9XcJEWKK5fZ0SOwEwBnB6pNIGA70S8tX69GBiCmw0KGDQY+w7dww17IVOTmAgH6y8nAaK1Gt4cXdtJoRhFaOjjwoSkAToe2FQvRq0Kq82KfbZoSerguMKw9WP/T6aENxiNq7epq9Dl4PcmEZaV6CIHvyOWkahNQdms5e9wZ8yOHZoT2ivaY6cZ+K4FAvhicJewKl48JHv54gLGf4QSXU1qynXY2Fk+jE4/BbaosRRVEAI8XFwb4+si340kwCYzT1x8MbDQIDbizjIQRkYdy48UsRMmyT1HnSOXm1A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 149.199.60.83) smtp.rcpttodomain=ideasonboard.com smtp.mailfrom=xilinx.com;
 dmarc=bestguesspass action=none header.from=xilinx.com; dkim=none (message
 not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=xilinx.onmicrosoft.com; s=selector2-xilinx-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=STiOgL68xRXzJBQVR2laSeo1owTpwOF5svz45x/QBNA=;
 b=QRZBEKUYzvMQ1weeJALJS8vv5gp7pWqe3/Io9QTjuHPHlF65CBI9G95YostCL6cLaFDPbz7dTSEakWmVq3Gfrw+EPxz09WbvTaYNs92OhlHVMSPltUOacosbS46+O3siIIJd7jmTXRa2XBS+32vU5gez6TfWU3MzeJ+8JgiGH84=
Received: from DM5PR13CA0048.namprd13.prod.outlook.com (2603:10b6:3:7b::34) by
 MWHPR02MB2320.namprd02.prod.outlook.com (2603:10b6:300:5d::9) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2921.29; Mon, 20 Apr 2020 21:21:13 +0000
Received: from CY1NAM02FT041.eop-nam02.prod.protection.outlook.com
 (2603:10b6:3:7b:cafe::fa) by DM5PR13CA0048.outlook.office365.com
 (2603:10b6:3:7b::34) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.2937.6 via Frontend
 Transport; Mon, 20 Apr 2020 21:21:13 +0000
Authentication-Results: spf=pass (sender IP is 149.199.60.83)
 smtp.mailfrom=xilinx.com; ideasonboard.com; dkim=none (message not signed)
 header.d=none;ideasonboard.com; dmarc=bestguesspass action=none
 header.from=xilinx.com;
Received-SPF: Pass (protection.outlook.com: domain of xilinx.com designates
 149.199.60.83 as permitted sender) receiver=protection.outlook.com;
 client-ip=149.199.60.83; helo=xsj-pvapsmtpgw01;
Received: from xsj-pvapsmtpgw01 (149.199.60.83) by
 CY1NAM02FT041.mail.protection.outlook.com (10.152.74.156) with Microsoft SMTP
 Server id 15.20.2921.25 via Frontend Transport; Mon, 20 Apr 2020 21:21:12
 +0000
Received: from [149.199.38.66] (port=60249 helo=xsj-pvapsmtp01)
 by xsj-pvapsmtpgw01 with esmtp (Exim 4.90)
 (envelope-from <venkateshwar.rao.gannavarapu@xilinx.com>)
 id 1jQdpt-0007rd-3X; Mon, 20 Apr 2020 14:20:13 -0700
Received: from [127.0.0.1] (helo=localhost)
 by xsj-pvapsmtp01 with smtp (Exim 4.63)
 (envelope-from <venkateshwar.rao.gannavarapu@xilinx.com>)
 id 1jQdqq-0003Iv-4C; Mon, 20 Apr 2020 14:21:12 -0700
Received: from [172.23.62.221] (helo=xhdrdevl201.xilinx.com)
 by xsj-pvapsmtp01 with esmtp (Exim 4.63)
 (envelope-from <venkateshwar.rao.gannavarapu@xilinx.com>)
 id 1jQdqh-0003FI-4e; Mon, 20 Apr 2020 14:21:03 -0700
From: Venkateshwar Rao Gannavarapu <venkateshwar.rao.gannavarapu@xilinx.com>
To: hyun.kwon@xilinx.com, laurent.pinchart@ideasonboard.com,
 dri-devel@lists.freedesktop.org
Subject: [RFC PATCH 0/2] Add Xilinx DSI-TX DRM driver
Date: Tue, 21 Apr 2020 02:50:54 +0530
Message-Id: <1587417656-48078-1-git-send-email-venkateshwar.rao.gannavarapu@xilinx.com>
X-Mailer: git-send-email 2.7.4
X-TM-AS-Product-Ver: IMSS-7.1.0.1224-8.2.0.1013-23620.005
X-TM-AS-User-Approved-Sender: Yes;Yes
X-EOPAttributedMessage: 0
X-MS-Office365-Filtering-HT: Tenant
X-Forefront-Antispam-Report: CIP:149.199.60.83; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:xsj-pvapsmtpgw01; PTR:unknown-60-83.xilinx.com; CAT:NONE;
 SFTY:;
 SFS:(10009020)(4636009)(376002)(346002)(396003)(39860400002)(136003)(46966005)(5660300002)(186003)(26005)(81166007)(70206006)(316002)(6666004)(47076004)(966005)(356005)(82740400003)(70586007)(478600001)(2616005)(336012)(426003)(36756003)(107886003)(4326008)(9786002)(7696005)(8676002)(81156014)(8936002)(2906002);
 DIR:OUT; SFP:1101; 
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: d2781452-fe1c-4db7-0f98-08d7e570c074
X-MS-TrafficTypeDiagnostic: MWHPR02MB2320:
X-Microsoft-Antispam-PRVS: <MWHPR02MB2320D2784C0BF10DC195D9C2B1D40@MWHPR02MB2320.namprd02.prod.outlook.com>
X-Auto-Response-Suppress: DR, RN, NRN, OOF, AutoReply
X-MS-Oob-TLC-OOBClassifiers: OLM:8882;
X-Forefront-PRVS: 03793408BA
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 8LIc3r4CAi6PKmaIdEiCZ69cIewIdu/B32On0hvq5Dmpi8VlN6ALnJtNhvwXBqHcEeEIowYWHPzP0s5UMVvpen66/ei1ZyQinvkuWEVWoN9zi0YTrq9qtz2MRbv5ThuMjzPO2YOTan3tT9WuaNHuFMWZhlpMNy37F7wbI+kApLtsTRZZLrRI/6oGGvdgrausi69fczH7aJr9hmokqTLO/Kx2GcXGshpD5ax6IQC/oswM7gjPUBUkVbDkSnhpviJkJGZNfSj0WMtkPZYcHvZpFfsODxHCP95WteitW7Axr/W5Jg048VbdtuSpDJNmIyxaIF3dIkfKkVy0wJ2f9LmD5B7GvO3OW0ZxntwhMnalAsD1aGrnj7jbp0TgVP8ZSwp4neDwlbbsPDH6Ckx7RfAScNBIzS9ZBj+zedVBkC737PBp8MXZlk9hny+NL5EZn/p1ii3xti3iebZwcrtet1PgzhuFwk3S705OFEmhDMF9hgvvgWS4a8HOfTlzHrLNnzlaF4McPunheg6Pbfa4AiiCylQQvT9Mf/FFaMJvezxBAex7m9V8EutklDhSjij6IhHDtMIO9hfYnKkDmHqWPOas2XTR0fFU+k6/xv2UUFb0OtI=
X-OriginatorOrg: xilinx.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Apr 2020 21:21:12.4054 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: d2781452-fe1c-4db7-0f98-08d7e570c074
X-MS-Exchange-CrossTenant-Id: 657af505-d5df-48d0-8300-c31994686c5c
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=657af505-d5df-48d0-8300-c31994686c5c; Ip=[149.199.60.83];
 Helo=[xsj-pvapsmtpgw01]
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MWHPR02MB2320
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
Cc: sandipk@xilinx.com,
 Venkateshwar Rao Gannavarapu <venkateshwar.rao.gannavarapu@xilinx.com>,
 airlied@linux.ie, linux-kernel@vger.kernel.org, vgannava@xilinx.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

MIPI DSI TX subsystem allows you to quickly create systems based on the
MIPI protocol. It interfaces between the video processing subsystems and
MIPI-based displays. An internal high-speed physical layer design, D-PHY,
is provided to allow direct connection to display peripherals.

The subsystem consists of the following sub-blocks:
- MIPI D-PHY
- MIPI DSI TX Controller
- AXI Crossbar

Please refer pg238 [1].

The DSI TX Controller receives stream of image data through an input stream
interface. At design time, this subsystem can be configured to number of lanes
and command mode support.

This patch series adds the dt-binding and DRM driver for Xilinx DSI-TX soft IP.
patch is created on git://linuxtv.org/pinchartl/media.git drm/dpsub/next

References:
[1]: https://www.xilinx.com/support/documentation/ip_documentation/mipi_dsi_tx_subsystem/v2_0/pg238-mipi-dsi-tx.pdf

Venkateshwar Rao Gannavarapu (2):
  dt-bindings: display: xlnx: Add Xilinx DSI TX subsystem bindings
  drm: xlnx: driver for Xilinx DSI TX Subsystem

 .../devicetree/bindings/display/xlnx/xlnx,dsi.txt  |  68 ++
 drivers/gpu/drm/xlnx/Kconfig                       |  11 +
 drivers/gpu/drm/xlnx/Makefile                      |   2 +
 drivers/gpu/drm/xlnx/xlnx_dsi.c                    | 755 +++++++++++++++++++++
 4 files changed, 836 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/display/xlnx/xlnx,dsi.txt
 create mode 100644 drivers/gpu/drm/xlnx/xlnx_dsi.c

--
2.7.4

This email and any attachments are intended for the sole use of the named recipient(s) and contain(s) confidential information that may be proprietary, privileged or copyrighted under applicable law. If you are not the intended recipient, do not read, copy, or forward this email message or any attachments. Delete this email message and any attachments immediately.
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
