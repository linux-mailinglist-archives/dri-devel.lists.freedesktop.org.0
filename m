Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 83F08188736
	for <lists+dri-devel@lfdr.de>; Tue, 17 Mar 2020 15:17:52 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C8BBA6E59B;
	Tue, 17 Mar 2020 14:16:47 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM10-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam10on2082.outbound.protection.outlook.com [40.107.93.82])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 415B989DFA
 for <dri-devel@lists.freedesktop.org>; Tue, 17 Mar 2020 12:11:55 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=M0OkUmjl5ZmsKWt+cLjTj6kzdkTfvkSXyfy+yoixCeNvMqwR6DvqyRKAbRSVXbR5SXHc6y09uf8o+3C7uF/DDCFHquAX3502Uzo2jFL5MN0g1p0FyPEauGTUYHGggdOwukSd/f9NAcauXzlQtPGAojdz2GDwIyk2fK9vk1ymcGTQL5s2JgrDikte7pAlTwW1POVGPQinnrFABakCmr7IuXjrZl472Eyq3NuaJsxnC/2vCjQkt3FDt7rxj1/Ub2oxsqXqFFI3pA3d3J3YlgtLUPdYmwCgEZ4EMm9YhzcYvYCT5RNdspFekK6FePt9xNQIU2Yfx/TT3pnB0OY8v+blHg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=L/3V/xGI3O8ydw7cuGJ4DUzobkniaZ1yAzbkdEbtmEk=;
 b=WRBZr1cnMUQOWOCrCoOW5n5E6BGEIWcvSN44mW4eMdhttKZfMWjCkT3Fb7KDSliOw0LXCkdqYgYlL3ZB3fJ1MMIJtct5QFOcTz/sV4OtqjtK72np40cxK46T/b6OPYGOxRekF/jBhrYq6NmUgQE1L9UMh6vMGwLfQ+DUuxJpf9sbNSqYEKt7K1aFHCIL7GRHctHq4fhZ+7GkoI+LI8plEfZFtHylYaJK6j5iPVYdmjohB2p+lgC7TUYpGqs7cump0TCVT4wHxG7+xF3TcADLOhXKMYs84R+d9+nIP0T7yYtjfAU+/zu1/UQy1Mr4l8+lhm5emEA5021K4Rr/2vBmtQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 149.199.60.83) smtp.rcpttodomain=collabora.com smtp.mailfrom=xilinx.com;
 dmarc=bestguesspass action=none header.from=xilinx.com; dkim=none (message
 not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=xilinx.onmicrosoft.com; s=selector2-xilinx-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=L/3V/xGI3O8ydw7cuGJ4DUzobkniaZ1yAzbkdEbtmEk=;
 b=Cnicg/aI4wYsHdQwRuzUZOASYXqja1UjTqo2ki8NgrbE/ONvHHTp+I47SOH2wRMH+PLrZ4RWxZFTiDP2j6eeRDWcSdqO9/Tax59AW+8YMsXeC8BKsCeXWTSCxVchjZk+4i0n73CBe7vXIYhf86/KzWFu+74MTB0q3hgB5GQ4cr8=
Received: from SN4PR0401CA0015.namprd04.prod.outlook.com
 (2603:10b6:803:21::25) by SN6PR02MB5024.namprd02.prod.outlook.com
 (2603:10b6:805:6a::21) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.2814.14; Tue, 17 Mar
 2020 12:11:53 +0000
Received: from SN1NAM02FT053.eop-nam02.prod.protection.outlook.com
 (2603:10b6:803:21:cafe::9e) by SN4PR0401CA0015.outlook.office365.com
 (2603:10b6:803:21::25) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.2814.21 via Frontend
 Transport; Tue, 17 Mar 2020 12:11:53 +0000
Authentication-Results: spf=pass (sender IP is 149.199.60.83)
 smtp.mailfrom=xilinx.com; collabora.com; dkim=none (message not signed)
 header.d=none;collabora.com; dmarc=bestguesspass action=none
 header.from=xilinx.com;
Received-SPF: Pass (protection.outlook.com: domain of xilinx.com designates
 149.199.60.83 as permitted sender) receiver=protection.outlook.com;
 client-ip=149.199.60.83; helo=xsj-pvapsmtpgw01;
Received: from xsj-pvapsmtpgw01 (149.199.60.83) by
 SN1NAM02FT053.mail.protection.outlook.com (10.152.72.102) with Microsoft SMTP
 Server (version=TLS1_0, cipher=TLS_RSA_WITH_AES_256_CBC_SHA) id 15.20.2814.13
 via Frontend Transport; Tue, 17 Mar 2020 12:11:52 +0000
Received: from unknown-38-66.xilinx.com ([149.199.38.66] helo=xsj-pvapsmtp01)
 by xsj-pvapsmtpgw01 with esmtp (Exim 4.63)
 (envelope-from <rohit.visavalia@xilinx.com>)
 id 1jEB4a-0001r3-1N; Tue, 17 Mar 2020 05:11:52 -0700
Received: from [127.0.0.1] (helo=localhost)
 by xsj-pvapsmtp01 with smtp (Exim 4.63)
 (envelope-from <rohit.visavalia@xilinx.com>)
 id 1jEB4U-0008Fe-UO; Tue, 17 Mar 2020 05:11:46 -0700
Received: from xsj-pvapsmtp01 (maildrop.xilinx.com [149.199.38.66])
 by xsj-smtp-dlp2.xlnx.xilinx.com (8.13.8/8.13.1) with ESMTP id 02HCBfcA014757; 
 Tue, 17 Mar 2020 05:11:41 -0700
Received: from [172.19.2.102] (helo=xsjanandash50.xilinx.com)
 by xsj-pvapsmtp01 with esmtp (Exim 4.63)
 (envelope-from <rohit.visavalia@xilinx.com>)
 id 1jEB4P-0008FG-A4; Tue, 17 Mar 2020 05:11:41 -0700
From: Rohit Visavalia <rohit.visavalia@xilinx.com>
To: dri-devel@lists.freedesktop.org, imirkin@alum.mit.edu,
 emil.velikov@collabora.com, Hyun Kwon <hyunk@xilinx.com>
Subject: [PATCH libdrm] modetest: set_gamma only if CRTC supports gamma
 property
Date: Tue, 17 Mar 2020 05:11:17 -0700
Message-Id: <1584447077-22539-1-git-send-email-rohit.visavalia@xilinx.com>
X-Mailer: git-send-email 2.7.4
X-RCIS-Action: ALLOW
X-TM-AS-Product-Ver: IMSS-7.1.0.1224-8.2.0.1013-23620.005
X-TM-AS-User-Approved-Sender: Yes;Yes
X-EOPAttributedMessage: 0
X-MS-Office365-Filtering-HT: Tenant
X-Forefront-Antispam-Report: CIP:149.199.60.83; IPV:; CTRY:US; EFV:NLI;
 SFV:NSPM;
 SFS:(10009020)(4636009)(346002)(39860400002)(376002)(136003)(396003)(199004)(46966005)(70206006)(2616005)(70586007)(426003)(2906002)(36756003)(5660300002)(336012)(107886003)(44832011)(6862004)(4326008)(8676002)(7696005)(478600001)(8936002)(316002)(6666004)(81166006)(9786002)(81156014)(47076004)(6636002)(186003)(26005)(37006003)(54906003)(356004);
 DIR:OUT; SFP:1101; SCL:1; SRVR:SN6PR02MB5024; H:xsj-pvapsmtpgw01; FPR:;
 SPF:Pass; LANG:en; PTR:unknown-60-83.xilinx.com; A:1; 
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: e5df386b-714f-4b87-7e72-08d7ca6c60c7
X-MS-TrafficTypeDiagnostic: SN6PR02MB5024:
X-Microsoft-Antispam-PRVS: <SN6PR02MB5024E75C10787F8101B45B1CB3F60@SN6PR02MB5024.namprd02.prod.outlook.com>
X-Auto-Response-Suppress: DR, RN, NRN, OOF, AutoReply
X-MS-Oob-TLC-OOBClassifiers: OLM:1388;
X-Forefront-PRVS: 0345CFD558
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 8JGZRvGFr/uUexNfElvSPGothBO44jSPnSe/IvyqaRctPcE0CnGVtA4ZIdz9lBLLuTGvoGBu5/Qf8+Ez2309rCbUjRjF61LiaonTK0WyFvDEWRndHVKtgiZgG8ApJa9cnbxlrAW+4psNnC4yRq0eQR9dwnWOh+0az3f4mVXEXOi0VcJuNEEYSrAJKF88/cZnO+4Mn2ovWn88jR6HCVNrwhe15m4JgmKzbC81sSM+pYJdBZOTJnng0Hditr7hlcSjoS5QjftjhXtHQY2ou0JOfcV96kgvH6CY26kigNOjlxMZ3bHA0p5ZAQ01dyZvHrEL2E98h8CJOofhVZq1BhLRkd83wCU1D8TJLvkliX4Y50ZjolI6jdSbYYzt4LIZVu8QVGmh2nIQkxJMw4Da5Xy5NgoHCcuHTLa6jANz4et3/Oy2n37Y2uI6PcnWfEFhfNjxObZK4+RaF8DC0hbBq/kmY0ykv/mmo6ds6Bko/MvYjwNaTWHgMLfuqli+b7zLQctLuE0Yiqb+uA+93u2EZ9baVA==
X-OriginatorOrg: xilinx.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Mar 2020 12:11:52.4049 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: e5df386b-714f-4b87-7e72-08d7ca6c60c7
X-MS-Exchange-CrossTenant-Id: 657af505-d5df-48d0-8300-c31994686c5c
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=657af505-d5df-48d0-8300-c31994686c5c; Ip=[149.199.60.83];
 Helo=[xsj-pvapsmtpgw01]
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN6PR02MB5024
X-Mailman-Approved-At: Tue, 17 Mar 2020 14:16:40 +0000
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
Cc: Dhaval Rajeshbhai Shah <dshah@xilinx.com>,
 Rohit Visavalia <rohit.visavalia@xilinx.com>,
 Varunkumar Allagadapa <VARUNKUM@xilinx.com>,
 Devarsh Thakkar <DEVARSHT@xilinx.com>, Ranganathan Sk <rsk@xilinx.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Current implementation shows error as "failed to set gamma: Function
no implemented" if platform specific drm has no gamma property implemented

Signed-off-by: Rohit Visavalia <rohit.visavalia@xilinx.com>
---
 tests/modetest/modetest.c | 21 ++++++++++++++++-----
 1 file changed, 16 insertions(+), 5 deletions(-)

diff --git a/tests/modetest/modetest.c b/tests/modetest/modetest.c
index b907ab3..23ee73d 100644
--- a/tests/modetest/modetest.c
+++ b/tests/modetest/modetest.c
@@ -1328,14 +1328,24 @@ static int set_plane(struct device *dev, struct plane_arg *p)
 static void atomic_set_planes(struct device *dev, struct plane_arg *p,
                              unsigned int count, bool update)
 {
-       unsigned int i, pattern = primary_fill;
+       unsigned int i, j, pattern = primary_fill;
+       struct crtc *crtc = NULL;

        /* set up planes */
        for (i = 0; i < count; i++) {
-               if (i > 0)
+               if (i > 0) {
                        pattern = secondary_fill;
-               else
-                       set_gamma(dev, p[i].crtc_id, p[i].fourcc);
+               } else {
+                       for (j = 0; j < dev->resources->res->count_crtcs; j++) {
+                               if (p[i].crtc_id ==
+                                   dev->resources->res->crtcs[j]) {
+                                       crtc = &dev->resources->crtcs[j];
+                                       break;
+                               }
+                       }
+                       if (crtc->crtc->gamma_size)
+                               set_gamma(dev, p[i].crtc_id, p[i].fourcc);
+               }

                if (atomic_set_plane(dev, &p[i], pattern, update))
                        return;
@@ -1522,7 +1532,8 @@ static void set_mode(struct device *dev, struct pipe_arg *pipes, unsigned int co
                        return;
                }

-               set_gamma(dev, pipe->crtc->crtc->crtc_id, pipe->fourcc);
+               if (pipe->crtc->crtc->gamma_size)
+                       set_gamma(dev, pipe->crtc->crtc->crtc_id, pipe->fourcc);
        }
 }

--
2.7.4

This email and any attachments are intended for the sole use of the named recipient(s) and contain(s) confidential information that may be proprietary, privileged or copyrighted under applicable law. If you are not the intended recipient, do not read, copy, or forward this email message or any attachments. Delete this email message and any attachments immediately.
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
