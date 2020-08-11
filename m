Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D882B24143D
	for <lists+dri-devel@lfdr.de>; Tue, 11 Aug 2020 02:46:55 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 921866E49D;
	Tue, 11 Aug 2020 00:46:49 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM04-CO1-obe.outbound.protection.outlook.com
 (mail-eopbgr690088.outbound.protection.outlook.com [40.107.69.88])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B85396E49D
 for <dri-devel@lists.freedesktop.org>; Tue, 11 Aug 2020 00:46:47 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=U04FjEbSgMIXMAH7YYVDNxkNMe+fKNm+06wdC55QXwQnGzecmpt8QQUiriPEiUUnboVWuRx6n0fdu7SQJVHJ3BqeKtPSSx2sD1fEpSHaqkACZrHdYvxIJSUzuqukJhMBvTQmA5xt23qngw2zG76NPAVMtLwxZIppSHhl22ch0hU1X14hJkYX62STPaPGXX6I9df4E6wt81266JRUX33NHfaFzRF5XjM4NehLK0J2P8XxIWOe5b3B18BLTCCOXcNSlHIqVG6EOLl7+kND6XC4tzKyOVXoj2zYHqrk0bdsjb81uOVhsSdk6zUpThVV4qjaNJ3WvdSsuUB2izdA4kJz/A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Hf+kX7toRnc1H+Mm/SMFbHLlMDYEuy1AKtF4Ee18HlI=;
 b=lOTm3M4m5nopIkQL0DhDK5ZkjeJXCqdPigLYzUBGdlEH0NNvGxJ12MWPMvM7c9+lQvnQOuzN6IJ080YOuC73l4sPdQ2wTEmoXhxPnL6l5Z6NDq0NkXqYQOd4t58hHoq7jRmWdW5SofZgLpxM8mzdsKPBblhh5B7LgztDMNZgmvrSvWZMat1YtzGLBv2CIGHIc/O/894MYKCdaNDbJrk8tza7GGdZEHHtAqxn2l3Jl1xfRXPN7aQvFurXjdBY62pOLkG1ll8r+md2s7QDnC+l7UTxI9HSneke9TBITJNiD9rY89QV/7S4c7nwwCpZOsg0Q5/soMpNokGbDQpDnPtssQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 149.199.60.83) smtp.rcpttodomain=vger.kernel.org smtp.mailfrom=xilinx.com;
 dmarc=bestguesspass action=none header.from=xilinx.com; dkim=none (message
 not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=xilinx.onmicrosoft.com; s=selector2-xilinx-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Hf+kX7toRnc1H+Mm/SMFbHLlMDYEuy1AKtF4Ee18HlI=;
 b=L/H19DTppCYWjry38EOpn1m0v+FGPtIlB3NHGXf+mF+lbRID+iioF3tKZIPSkJCTZe9ldKUgmCwr8p7K2ZihmgzkXskIfb9Uv/D0b9IFmczHo54V6DHdy1ZCChXiHGofU8ORXxl7K4v97ybjQ+aTPDo2h/xNk1jSc+VS+7OkVA8=
Received: from DM6PR02CA0084.namprd02.prod.outlook.com (2603:10b6:5:1f4::25)
 by DM5PR02MB2281.namprd02.prod.outlook.com (2603:10b6:3:59::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3261.19; Tue, 11 Aug
 2020 00:46:41 +0000
Received: from DM3NAM02FT024.eop-nam02.prod.protection.outlook.com
 (2603:10b6:5:1f4:cafe::2c) by DM6PR02CA0084.outlook.office365.com
 (2603:10b6:5:1f4::25) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3261.18 via Frontend
 Transport; Tue, 11 Aug 2020 00:46:41 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 149.199.60.83)
 smtp.mailfrom=xilinx.com; vger.kernel.org; dkim=none (message not signed)
 header.d=none;vger.kernel.org; dmarc=bestguesspass action=none
 header.from=xilinx.com;
Received-SPF: Pass (protection.outlook.com: domain of xilinx.com designates
 149.199.60.83 as permitted sender) receiver=protection.outlook.com;
 client-ip=149.199.60.83; helo=xsj-pvapsmtpgw01;
Received: from xsj-pvapsmtpgw01 (149.199.60.83) by
 DM3NAM02FT024.mail.protection.outlook.com (10.13.5.128) with Microsoft SMTP
 Server id 15.20.3261.19 via Frontend Transport; Tue, 11 Aug 2020 00:46:41
 +0000
Received: from [149.199.38.66] (port=39380 helo=smtp.xilinx.com)
 by xsj-pvapsmtpgw01 with esmtp (Exim 4.90)
 (envelope-from <venkateshwar.rao.gannavarapu@xilinx.com>)
 id 1k5IR0-0006Xt-Ps; Mon, 10 Aug 2020 17:46:34 -0700
Received: from [127.0.0.1] (helo=localhost)
 by xsj-pvapsmtp01 with smtp (Exim 4.63)
 (envelope-from <venkateshwar.rao.gannavarapu@xilinx.com>)
 id 1k5IR7-0000Bj-7G; Mon, 10 Aug 2020 17:46:41 -0700
Received: from xsj-pvapsmtp01 (xsj-smtp1.xilinx.com [149.199.38.66])
 by xsj-smtp-dlp2.xlnx.xilinx.com (8.13.8/8.13.1) with ESMTP id 07B0kUxl005574; 
 Mon, 10 Aug 2020 17:46:30 -0700
Received: from [172.23.155.151] (helo=xhdengvm155151.xilinx.com)
 by xsj-pvapsmtp01 with esmtp (Exim 4.63)
 (envelope-from <venkateshwar.rao.gannavarapu@xilinx.com>)
 id 1k5IQw-00009x-9a; Mon, 10 Aug 2020 17:46:30 -0700
From: Venkateshwar Rao Gannavarapu <venkateshwar.rao.gannavarapu@xilinx.com>
To: hyun.kwon@xilinx.com, laurent.pinchart@ideasonboard.com,
 dri-devel@lists.freedesktop.org
Subject: [RFC PATCH V2 0/2] Add Xilinx DSI TX driver
Date: Tue, 11 Aug 2020 06:16:15 +0530
Message-Id: <1597106777-30913-1-git-send-email-venkateshwar.rao.gannavarapu@xilinx.com>
X-Mailer: git-send-email 2.1.1
X-RCIS-Action: ALLOW
X-TM-AS-Product-Ver: IMSS-7.1.0.1224-8.2.0.1013-23620.005
X-TM-AS-User-Approved-Sender: Yes;Yes
X-EOPAttributedMessage: 0
X-MS-Office365-Filtering-HT: Tenant
X-MS-PublicTrafficType: Email
MIME-Version: 1.0
X-MS-Office365-Filtering-Correlation-Id: 779b67c4-d76d-4efa-1648-08d83d900365
X-MS-TrafficTypeDiagnostic: DM5PR02MB2281:
X-Microsoft-Antispam-PRVS: <DM5PR02MB22812AAC0925966888BD1801B1450@DM5PR02MB2281.namprd02.prod.outlook.com>
X-Auto-Response-Suppress: DR, RN, NRN, OOF, AutoReply
X-MS-Oob-TLC-OOBClassifiers: OLM:7219;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: D72s+PddBj3YA2VQPKT5tYMeQ5ICfVQ704SATdSMD5aRmf6AhpJ2gChhdZiApQeVV4jBnip5O2dk5uYYoDvSW9McrkMmi+0vLYpV9WxBIkxzl+Z9PBXOOL9qxRhP6wjMFFvPX1DIM3RAmt+6WRXlfE8TXRX46vLsQXmatTxoQtozYuVq9kPsdAivFF1aHdqVrotj/ncWSgHfN7SZAH8MzCGC5rerdTggzFOgMpeM5TJX7NQBnQIntd17BMxwEEkfH3mbxhP/qGm+Wrw7OhydEqNJL8QdKbnFGSanv5JE5FT1TKJc7zVUCeYvwoinYeKXAzQAlRaGj2D2sher1XRsIVC+7v/tMzwWhcKvOusF7E5tseFZcYUngyq36weT6EbjGkStc523mbWS0grnWFuTGA==
X-Forefront-Antispam-Report: CIP:149.199.60.83; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:xsj-pvapsmtpgw01; PTR:unknown-60-83.xilinx.com; CAT:NONE;
 SFTY:;
 SFS:(136003)(39860400002)(396003)(346002)(376002)(46966005)(186003)(5660300002)(9786002)(83380400001)(8936002)(2906002)(26005)(36756003)(70586007)(70206006)(356005)(336012)(82310400002)(81166007)(82740400003)(47076004)(4326008)(426003)(478600001)(8676002)(7696005)(316002)(6666004)(107886003)(2616005);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: xilinx.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Aug 2020 00:46:41.4426 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 779b67c4-d76d-4efa-1648-08d83d900365
X-MS-Exchange-CrossTenant-Id: 657af505-d5df-48d0-8300-c31994686c5c
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=657af505-d5df-48d0-8300-c31994686c5c; Ip=[149.199.60.83];
 Helo=[xsj-pvapsmtpgw01]
X-MS-Exchange-CrossTenant-AuthSource: DM3NAM02FT024.eop-nam02.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM5PR02MB2281
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
