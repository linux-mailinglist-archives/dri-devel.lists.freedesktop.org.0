Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 09333241450
	for <lists+dri-devel@lfdr.de>; Tue, 11 Aug 2020 02:52:45 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2F0C56E0E4;
	Tue, 11 Aug 2020 00:52:41 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM10-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam10on2068.outbound.protection.outlook.com [40.107.93.68])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AD64A6E0E4
 for <dri-devel@lists.freedesktop.org>; Tue, 11 Aug 2020 00:52:39 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=KT3CCVFsjJbrfc+CE15wpgu0udSjUtHEusra/vRfDjt/xcoK2+33GkZqrgGH1+qJwdTPP/STo582MXwUdOC8QndczLYRaTy59dMSM+U6XppW+bWkK2f1sUF+vZynv/DdWeLSj0USCSTaA1jc4oQ0gnUlPWQRs7lwHQ7pXS8HK9DEqFdA/zlQLzJ+CDEO2TkOJCV+hkIbSMfhXPuJtaMIO88AYAmeTM9P4RBSp9K84krxPIv58+5YvVPPeTNUc0VD6/ypSwqWQeL3INP+7WxH7l75Sa92/rcTucL+zamWL9vJhy0yO9sj4F7aEVMKFV/2mm0CVdFeFqKM4aYsck1NlQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=23o8zOI6FmQH4tYUVY7NuOnE0JvZu5Jrfpkr0giKIwI=;
 b=QZTNl0JSxG6yQZhJLHkk1Ym7+jFyfi39S3V6kPhrpJYSu2SmkWmx5l/rmulVHzlXI7rhl2dYhklvKi9w6KRQwojQOyfr8oWhbIH3QFmqMvgbwtQb7JTwlSrpTts80dBehJjTUEDS1ZYNQ6AH9P3rs4hXr/pvvniMRJb/C9DPDtEjiHE0Fvl8msiPjZ/IVGZQHshWFBCSTgflEP4R5e1nWBUwIC5mH6qPXeRSpvE0OA9nBfNG09vHY5JoM/NdlJz7LyDS+YMJ0uZPgonmHOS43vh3oKDOZfqDZu4Av5cFtiIeWzXU2oczUYaJPuuI6PkcUFc/A7WQDAJBHNg5GOsaWw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 149.199.60.83) smtp.rcpttodomain=vger.kernel.org smtp.mailfrom=xilinx.com;
 dmarc=bestguesspass action=none header.from=xilinx.com; dkim=none (message
 not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=xilinx.onmicrosoft.com; s=selector2-xilinx-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=23o8zOI6FmQH4tYUVY7NuOnE0JvZu5Jrfpkr0giKIwI=;
 b=OsJTGrxZ9szzCVSGl/46fJ0Ljo/S5V/qgcnxzSj1DltYAwtxILp1A8hOxZ1y39SPZ0xPtXOLlxMzlCMFe/B9TOToqpmWR3sOP3xDUIpQfj7TCyqivw4CcYC23k61YqWLVcZIRE+AMZV49/hoziAklRkizmNXnefgOvOpIThZfno=
Received: from BN6PR2001CA0004.namprd20.prod.outlook.com
 (2603:10b6:404:b4::14) by BN7PR02MB4100.namprd02.prod.outlook.com
 (2603:10b6:406:fb::14) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3261.22; Tue, 11 Aug
 2020 00:52:33 +0000
Received: from BN1NAM02FT042.eop-nam02.prod.protection.outlook.com
 (2603:10b6:404:b4:cafe::6d) by BN6PR2001CA0004.outlook.office365.com
 (2603:10b6:404:b4::14) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3261.20 via Frontend
 Transport; Tue, 11 Aug 2020 00:52:33 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 149.199.60.83)
 smtp.mailfrom=xilinx.com; vger.kernel.org; dkim=none (message not signed)
 header.d=none;vger.kernel.org; dmarc=bestguesspass action=none
 header.from=xilinx.com;
Received-SPF: Pass (protection.outlook.com: domain of xilinx.com designates
 149.199.60.83 as permitted sender) receiver=protection.outlook.com;
 client-ip=149.199.60.83; helo=xsj-pvapsmtpgw01;
Received: from xsj-pvapsmtpgw01 (149.199.60.83) by
 BN1NAM02FT042.mail.protection.outlook.com (10.13.2.153) with Microsoft SMTP
 Server id 15.20.3261.19 via Frontend Transport; Tue, 11 Aug 2020 00:52:33
 +0000
Received: from [149.199.38.66] (port=50064 helo=smtp.xilinx.com)
 by xsj-pvapsmtpgw01 with esmtp (Exim 4.90)
 (envelope-from <venkateshwar.rao.gannavarapu@xilinx.com>)
 id 1k5IWg-0006dO-ME; Mon, 10 Aug 2020 17:52:26 -0700
Received: from [127.0.0.1] (helo=localhost)
 by xsj-pvapsmtp01 with smtp (Exim 4.63)
 (envelope-from <venkateshwar.rao.gannavarapu@xilinx.com>)
 id 1k5IWn-0002TL-3k; Mon, 10 Aug 2020 17:52:33 -0700
Received: from xsj-pvapsmtp01 (smtp2.xilinx.com [149.199.38.66])
 by xsj-smtp-dlp1.xlnx.xilinx.com (8.13.8/8.13.1) with ESMTP id 07B0qNEB001814; 
 Mon, 10 Aug 2020 17:52:24 -0700
Received: from [172.23.155.151] (helo=xhdengvm155151.xilinx.com)
 by xsj-pvapsmtp01 with esmtp (Exim 4.63)
 (envelope-from <venkateshwar.rao.gannavarapu@xilinx.com>)
 id 1k5IWd-0002SD-DF; Mon, 10 Aug 2020 17:52:23 -0700
From: Venkateshwar Rao Gannavarapu <venkateshwar.rao.gannavarapu@xilinx.com>
To: hyun.kwon@xilinx.com, laurent.pinchart@ideasonboard.com,
 dri-devel@lists.freedesktop.org
Subject: [RFC PATCH V2 0/2] Add Xilinx DSI TX driver
Date: Tue, 11 Aug 2020 06:22:19 +0530
Message-Id: <1597107139-31477-1-git-send-email-venkateshwar.rao.gannavarapu@xilinx.com>
X-Mailer: git-send-email 2.1.1
X-RCIS-Action: ALLOW
X-TM-AS-Product-Ver: IMSS-7.1.0.1224-8.2.0.1013-23620.005
X-TM-AS-User-Approved-Sender: Yes;Yes
X-EOPAttributedMessage: 0
X-MS-Office365-Filtering-HT: Tenant
X-MS-PublicTrafficType: Email
MIME-Version: 1.0
X-MS-Office365-Filtering-Correlation-Id: a71e961a-6175-44d7-dadb-08d83d90d533
X-MS-TrafficTypeDiagnostic: BN7PR02MB4100:
X-Microsoft-Antispam-PRVS: <BN7PR02MB4100337CC8F1FF0F685DBA99B1450@BN7PR02MB4100.namprd02.prod.outlook.com>
X-Auto-Response-Suppress: DR, RN, NRN, OOF, AutoReply
X-MS-Oob-TLC-OOBClassifiers: OLM:6790;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: eMLIeZYy6ooRT5dOF4PR6QADBeO520KUdl3W6BHtXEYNzdrLsHWN/IoTULBZojX4/nuQk8JwktNuy/qb5sNnJTS1x3SYvoLhyWjD4mtbilSGEGgTl2PuSea0Rws470NkcOR8UQLCdbgR+TRN5VNjhdksBlxkuuWnnUeGqCX2uA/FVO9TersBCBeZRWhAFqdfO/yzhGdLAUpHrdNvWr/HFUy8U7aeID9Tb+p0NHGKt7WKqgYA1Mz/Dfm9G2xnWjwLXvHeHUu7ao1ZuMY77Qo3OqnsuowuhjIg8tffykKGmvMUXvDw1ZhDODMoQRod7CC8UhrBJUvS9+AMOTCNpG632Q25vcuR7fw1SfmmliMw6jr2xTuPLnyZBG+ggpnffnKyyaHTtPSj+seA1lymwnxs8A==
X-Forefront-Antispam-Report: CIP:149.199.60.83; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:xsj-pvapsmtpgw01; PTR:unknown-60-83.xilinx.com; CAT:NONE;
 SFTY:;
 SFS:(136003)(39860400002)(346002)(376002)(396003)(46966005)(70206006)(70586007)(5660300002)(47076004)(7696005)(316002)(478600001)(2616005)(8936002)(426003)(36756003)(4326008)(2906002)(26005)(8676002)(81166007)(9786002)(82310400002)(186003)(107886003)(6666004)(336012)(83380400001)(82740400003)(356005);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: xilinx.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Aug 2020 00:52:33.4415 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: a71e961a-6175-44d7-dadb-08d83d90d533
X-MS-Exchange-CrossTenant-Id: 657af505-d5df-48d0-8300-c31994686c5c
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=657af505-d5df-48d0-8300-c31994686c5c; Ip=[149.199.60.83];
 Helo=[xsj-pvapsmtpgw01]
X-MS-Exchange-CrossTenant-AuthSource: BN1NAM02FT042.eop-nam02.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BN7PR02MB4100
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

Xilinx DSI-TX subsytem consists of DSI controller core, AXI crossbar
and D-PHY as sub blocks. DSI TX subsystem driver supports multiple lanes
upto 4, RGB color formats, video mode and command modes.

DSI-TX driver is implemented as an encoder driver, as it going to be
the final node in display pipeline. Xilinx doesn't support any converter
logic to make this as bridge driver. Xilinx doesn't have such
use cases where end node can't be an encoder like DSI-TX. And Xilinx
encoder drivers represents a subsystem where individual blocks can't be
used with external components / encoders.

changes in v2:
 - converted bindings to .yaml format
 - updated compatible string with version number
 - addressed Laurent and Hyun's review comments
 - removed wrappers for enable/disable API's
 - few API's are inlined
 - fixes indent, extra spaces and alignments.
 - added generic long write command mode support

Venkateshwar Rao Gannavarapu (2):
  dt-bindings: display: xlnx: dsi: This add a DT binding for Xilinx DSI
    TX     subsystem.
  drm: xlnx: dsi: driver for Xilinx DSI TX subsystem

 .../devicetree/bindings/display/xlnx/xlnx,dsi.yaml | 147 +++++
 drivers/gpu/drm/xlnx/Kconfig                       |  11 +
 drivers/gpu/drm/xlnx/Makefile                      |   2 +
 drivers/gpu/drm/xlnx/xlnx_dsi.c                    | 701 +++++++++++++++++++++
 4 files changed, 861 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/display/xlnx/xlnx,dsi.yaml
 create mode 100644 drivers/gpu/drm/xlnx/xlnx_dsi.c

--
1.8.3.1

This email and any attachments are intended for the sole use of the named recipient(s) and contain(s) confidential information that may be proprietary, privileged or copyrighted under applicable law. If you are not the intended recipient, do not read, copy, or forward this email message or any attachments. Delete this email message and any attachments immediately.
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
