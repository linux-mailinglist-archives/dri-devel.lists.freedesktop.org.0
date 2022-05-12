Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id F39C5524ED8
	for <lists+dri-devel@lfdr.de>; Thu, 12 May 2022 15:53:36 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BBA7210E61B;
	Thu, 12 May 2022 13:53:28 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM04-BN8-obe.outbound.protection.outlook.com
 (mail-bn8nam08on2041.outbound.protection.outlook.com [40.107.100.41])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4B55B10E435
 for <dri-devel@lists.freedesktop.org>; Thu, 12 May 2022 13:53:26 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=BUWHhpQDf584LredZTZDpX4Kalk77HzPtjn8LHUXLCgWj7/3zJl2dwxR5cdOv/6v6pM5j9/Q95bDA/4JhcX5GU8HHQIOhpZ34qMtEdKGO3mEJAY+/Cw6QXq6/xA+8lHfYtGZ3+PFqKRqXfx8Eexd7GoDUpnycvvsA3LhNivSpudoV1y4UkW4eeKu4FFXui1zlkkF9+HCGoElxqhIp8fed44eo50/NJWyn7ugLisO5hOtGk3g2t7SkMAWEv2mA+Et4qYpSSgYbOO9TPY2/61l2UCH1tiWl/YRKtlKPhbPrFp9nzIll4xR44DpQMz/i8sxf1dANxHF+myFM7yqvZeYAA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=LDqVzw9vjjkvtQs7NrjFxRXiUdGZx/y4CQg0pwyUxBw=;
 b=lfmtV+wmGJiX6QsYs3C++bhRFe396WdcsHt7u4SV0Pa+AqICqFx3jWjxxc82CMoNxxbWW2xEM4B4iSBIm44jtqvhbwcqAXhewxCMkb0M60InrjFseqVyFCDq4stWEoTzZLjoqMduwXrvvTUndw5KH2tP8FunqGQFCeHXk3hFN1pA6R7f9HWvCdnOgzw8PuZX8FOoM7q5QYy+XNcW3aZC9wbAV2Hasl/Phs9b8B+JfP5BHHF1QeSrQlZBIQoIHPboifWsQ17AiOPWk0DGHNB5jUM47p0G26Vs8bJjd0fPokz4N3jGPxjHcTziZkOFclMT7iYmBYoDAtUltkIgr984NA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 149.199.62.198) smtp.rcpttodomain=ideasonboard.com smtp.mailfrom=xilinx.com;
 dmarc=pass (p=none sp=none pct=100) action=none header.from=xilinx.com;
 dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=xilinx.onmicrosoft.com; s=selector2-xilinx-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=LDqVzw9vjjkvtQs7NrjFxRXiUdGZx/y4CQg0pwyUxBw=;
 b=nzpPRMEw7ktejiIJ0O7c7G+6exgPKYRXqZquhlYRl46tpsDGO1rOIx+bg4x3TynuFXKcypPMhgCLnem53Xhgs/WqVz8I/EBuWfen4OmB/0FPsFfoUEI4a0E3pa68npJeNZedPDv0BAuKkI0Cq/x67UBGWezdZwU4LYEJNOESGig=
Received: from BN9PR03CA0415.namprd03.prod.outlook.com (2603:10b6:408:111::30)
 by BYAPR02MB4710.namprd02.prod.outlook.com (2603:10b6:a03:52::23)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5250.13; Thu, 12 May
 2022 13:53:23 +0000
Received: from BN1NAM02FT013.eop-nam02.prod.protection.outlook.com
 (2603:10b6:408:111:cafe::bb) by BN9PR03CA0415.outlook.office365.com
 (2603:10b6:408:111::30) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5250.13 via Frontend
 Transport; Thu, 12 May 2022 13:53:23 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 149.199.62.198)
 smtp.mailfrom=xilinx.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=xilinx.com;
Received-SPF: Pass (protection.outlook.com: domain of xilinx.com designates
 149.199.62.198 as permitted sender) receiver=protection.outlook.com;
 client-ip=149.199.62.198; helo=xsj-pvapexch02.xlnx.xilinx.com;
Received: from xsj-pvapexch02.xlnx.xilinx.com (149.199.62.198) by
 BN1NAM02FT013.mail.protection.outlook.com (10.13.2.88) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.5250.13 via Frontend Transport; Thu, 12 May 2022 13:53:23 +0000
Received: from xsj-pvapexch02.xlnx.xilinx.com (172.19.86.41) by
 xsj-pvapexch02.xlnx.xilinx.com (172.19.86.41) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2176.14; Thu, 12 May 2022 06:53:18 -0700
Received: from smtp.xilinx.com (172.19.127.95) by
 xsj-pvapexch02.xlnx.xilinx.com (172.19.86.41) with Microsoft SMTP Server id
 15.1.2176.14 via Frontend Transport; Thu, 12 May 2022 06:53:18 -0700
Envelope-to: laurent.pinchart@ideasonboard.com,
 dri-devel@lists.freedesktop.org, airlied@linux.ie,
 daniel@ffwll.ch, linux-kernel@vger.kernel.org
Received: from [172.23.135.119] (port=39078 helo=xhdvgannava41x.xilinx.com)
 by smtp.xilinx.com with esmtp (Exim 4.90)
 (envelope-from <venkateshwar.rao.gannavarapu@xilinx.com>)
 id 1np9Fm-000DP4-MT; Thu, 12 May 2022 06:53:18 -0700
From: Venkateshwar Rao Gannavarapu <venkateshwar.rao.gannavarapu@xilinx.com>
To: <laurent.pinchart@ideasonboard.com>, <dri-devel@lists.freedesktop.org>
Subject: [LINUX PATCH 0/2] Add Xilinx DSI-Tx DRM driver
Date: Thu, 12 May 2022 19:23:11 +0530
Message-ID: <1652363593-45799-1-git-send-email-venkateshwar.rao.gannavarapu@xilinx.com>
X-Mailer: git-send-email 2.1.1
MIME-Version: 1.0
Content-Type: text/plain
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 1604b5c6-5965-4e63-aa1a-08da341ec7c2
X-MS-TrafficTypeDiagnostic: BYAPR02MB4710:EE_
X-Microsoft-Antispam-PRVS: <BYAPR02MB471025AE89773D3513C1B613B1CB9@BYAPR02MB4710.namprd02.prod.outlook.com>
X-Auto-Response-Suppress: DR, RN, NRN, OOF, AutoReply
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: X2wcUUj2sQG/lc9J4eqBGikYMLuSfi23WxI/DFhU4l37ZJgQIAc4u1OwuClnrluJ3JrgCi/q6d0zE/1T9cV76SguNA/O5apInSx9myFx9iNDYAFIaZTc5mL0FFSQXb31p/4qtarXhKwYeRLyMGkmBZ+jpHRrUtS6oK1qZHxTOx/s6kIH/eh56gaoq/rEl50gmgZAN6BKISWDj96Cd3WbsI924UZkKXD3LM/qFqXg7gSs7QRfKlRLck1bK6GJRD48MbF4TIwWph6gi3QNIzKEqaBd5LD1zhuEoK05ZqEqyBnZWlEJuomulAFg/jWYpn2SXwuzmXgy/DtMQQbSHFb0+vczgkufXoe0ugkcuEN6ywdXoqlGF8TRYpm8FVlyqgyiu5qz2puelAi9v/skGqHqZ2X2Xzikm4AbXHa/D9tA5SaXIKq8AHSGrKcTEFLO06DFZBm30BLp+uiUAEw1nIkheb8xbPMeb5ltlp6Ol6+s8AMR9djlQKvwajBfyFSb2saEY/AazsjhQ94xnRKkVBCEf1DtceLm4UJdhAUeg2LxBGNuZVi4hdPdXVcVZJKR3TRUz7Ba91c01P3DjG848+7ZaoH0rRSN760/mtPXWlE6HhlJv/pdelZAd8tEO1B4wjcoKf6n/DHCM4bAPqXAOSPgArkF5L1qj326owJ6w++3r48GUzsOyznQHbGhtuTRnro0WMR+XGVArtSBwNTO2dH5jnN20+xd55Vn6RE5tHFha61j+lCnj8ceDmlqNi6f6DdS2WhW+TCXrbbI5LfY96z/Iq9Jc/Dx90n7DGSsYILv5e4=
X-Forefront-Antispam-Report: CIP:149.199.62.198; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:xsj-pvapexch02.xlnx.xilinx.com;
 PTR:unknown-62-198.xilinx.com; CAT:NONE;
 SFS:(13230001)(4636009)(40470700004)(36840700001)(46966006)(110136005)(8676002)(4326008)(316002)(356005)(186003)(966005)(40460700003)(508600001)(7636003)(70206006)(54906003)(426003)(336012)(107886003)(83380400001)(36860700001)(47076005)(70586007)(7696005)(2616005)(26005)(6666004)(36756003)(82310400005)(5660300002)(8936002)(2906002)(9786002)(102446001);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: xilinx.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 May 2022 13:53:23.0183 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 1604b5c6-5965-4e63-aa1a-08da341ec7c2
X-MS-Exchange-CrossTenant-Id: 657af505-d5df-48d0-8300-c31994686c5c
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=657af505-d5df-48d0-8300-c31994686c5c; Ip=[149.199.62.198];
 Helo=[xsj-pvapexch02.xlnx.xilinx.com]
X-MS-Exchange-CrossTenant-AuthSource: BN1NAM02FT013.eop-nam02.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BYAPR02MB4710
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
Cc: airlied@linux.ie, vgannava@xilinx.com,
 Venkateshwar Rao Gannavarapu <venkateshwar.rao.gannavarapu@xilinx.com>,
 linux-kernel@vger.kernel.org
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
and pixel format.

This patch series adds the dt-binding and DRM driver for Xilinx DSI-Tx soft IP.

References:
[1]: https://www.xilinx.com/support/documentation/ip_documentation/mipi_dsi_tx_subsystem/v2_0/pg238-mipi-dsi-tx.pdf

Venkateshwar Rao Gannavarapu (2):
  dt-bindings: display: xlnx: Add DSI 2.0 Tx subsystem documentation
  drm: xlnx: dsi: driver for Xilinx DSI Tx subsystem

 .../bindings/display/xlnx/xlnx,dsi-tx.yaml         | 105 +++++
 drivers/gpu/drm/xlnx/Kconfig                       |  14 +
 drivers/gpu/drm/xlnx/Makefile                      |   1 +
 drivers/gpu/drm/xlnx/xlnx_dsi.c                    | 456 +++++++++++++++++++++
 4 files changed, 576 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/display/xlnx/xlnx,dsi-tx.yaml
 create mode 100644 drivers/gpu/drm/xlnx/xlnx_dsi.c

--
1.8.3.1

