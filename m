Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 99B8F23248A
	for <lists+dri-devel@lfdr.de>; Wed, 29 Jul 2020 20:21:59 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A6FC46E0C6;
	Wed, 29 Jul 2020 18:21:55 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM11-CO1-obe.outbound.protection.outlook.com
 (mail-co1nam11on2069.outbound.protection.outlook.com [40.107.220.69])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1A9BC6E0C6
 for <dri-devel@lists.freedesktop.org>; Wed, 29 Jul 2020 18:21:53 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=ZwTprVj3r0rjPu0+Mp4MACpg3S5ImKgWW5/0Ey+4rQw1eoLSVdkS0R1Af/gsSAVil4y60WfIGkyVUb9Ot5QBwkpf7TsnsR64sR4pMZ59+3B/1YagJBqu7cIF7Skq69E/a4ycPeDNqxsoHunGYfW/0XYGxav4FqZTQobJFsY8vh+iP/EB9cIvIB19QeiSZP0nlJI30Y5R9QGn+ZX22bNt8EjQvZkyD5gZqtbNYHA9vREf4iLJhDlh7mieeBALp7A/mWNM5auCETcqDpMn1BRz4TBCyf5axu5q918NqIrffMb+8qutTxzEUSbeC5JsUBoFbwFPtgqO80EqXpXwTRj1hA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=FWd/MA55JaQ5MJvBrX7QDhqeYzuDM+B+t8Lif2pC15k=;
 b=OOUfzf9HZI4OTFQpcLS7wDvtevYMUQT8V211UkFA44U25vfzz/tGNTkFOTkUbyqSL+Ti40pXldKDU9Y1GigeQKxpqxULWKdNs1ZmqlHSXQXDL6L98LakfFMJfLYE8pU6z56ExgoVxasFPvMF0HejlmDoZ9JM5yl47LuDg1nm7+ox5noEa2EfhzDCqel7OmvvT0j4d35A7tc0pWWnxyP+EenoIIzkSot70t8asBNIW2FRW7P/K9C6LZbr6C1es0HrUP/zvnNu5E8pAiCMLHNgM1DGurZKqycqt6PZ21CiksnCvF5bHGJb7W+f2AuTmY6vTDMdq6WvAt3NTBVM1wEJ3g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 149.199.60.83) smtp.rcpttodomain=oracle.com smtp.mailfrom=xilinx.com;
 dmarc=bestguesspass action=none header.from=xilinx.com; dkim=none (message
 not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=xilinx.onmicrosoft.com; s=selector2-xilinx-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=FWd/MA55JaQ5MJvBrX7QDhqeYzuDM+B+t8Lif2pC15k=;
 b=MQnuAqYucYMWGBtTi7RiHkJaR/lacJC5ODqYJJXJAVxt6Tym5aRRyDM4nVk/n/vukVBjJ/0K7y99e3JNXYoiuJLFDiRPre4AyQaqRhYv6yb58yRaI4EHVzp+Zp1JbRzExE+r0Oicdlo6WOhA+l7vGIKMvm6u9IBFJoFrM9xNZqg=
Received: from MN2PR04CA0019.namprd04.prod.outlook.com (2603:10b6:208:d4::32)
 by BYAPR02MB4086.namprd02.prod.outlook.com (2603:10b6:a02:f9::21)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3216.21; Wed, 29 Jul
 2020 18:21:51 +0000
Received: from BL2NAM02FT039.eop-nam02.prod.protection.outlook.com
 (2603:10b6:208:d4:cafe::30) by MN2PR04CA0019.outlook.office365.com
 (2603:10b6:208:d4::32) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3239.16 via Frontend
 Transport; Wed, 29 Jul 2020 18:21:51 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 149.199.60.83)
 smtp.mailfrom=xilinx.com; oracle.com; dkim=none (message not signed)
 header.d=none;oracle.com; dmarc=bestguesspass action=none
 header.from=xilinx.com;
Received-SPF: Pass (protection.outlook.com: domain of xilinx.com designates
 149.199.60.83 as permitted sender) receiver=protection.outlook.com;
 client-ip=149.199.60.83; helo=xsj-pvapsmtpgw01;
Received: from xsj-pvapsmtpgw01 (149.199.60.83) by
 BL2NAM02FT039.mail.protection.outlook.com (10.152.77.152) with Microsoft SMTP
 Server id 15.20.3216.10 via Frontend Transport; Wed, 29 Jul 2020 18:21:51
 +0000
Received: from [149.199.38.66] (port=34008 helo=smtp.xilinx.com)
 by xsj-pvapsmtpgw01 with esmtp (Exim 4.90)
 (envelope-from <hyun.kwon@xilinx.com>)
 id 1k0qg8-0008Bw-Ef; Wed, 29 Jul 2020 11:19:48 -0700
Received: from [127.0.0.1] (helo=xsj-smtp-dlp2.xlnx.xilinx.com)
 by xsj-pvapsmtp01 with esmtp (Exim 4.63)
 (envelope-from <hyun.kwon@xilinx.com>)
 id 1k0qi7-00088C-5t; Wed, 29 Jul 2020 11:21:51 -0700
Received: from xsj-pvapsmtp01 (smtp.xilinx.com [149.199.38.66])
 by xsj-smtp-dlp2.xlnx.xilinx.com (8.13.8/8.13.1) with ESMTP id 06TILoUe016466; 
 Wed, 29 Jul 2020 11:21:50 -0700
Received: from [172.19.2.244] (helo=xsjhyunkubuntu)
 by xsj-pvapsmtp01 with esmtp (Exim 4.63)
 (envelope-from <hyunk@smtp.xilinx.com>)
 id 1k0qi5-000886-V8; Wed, 29 Jul 2020 11:21:49 -0700
Received: by xsjhyunkubuntu (Postfix, from userid 13638)
 id BDAA42C238C; Wed, 29 Jul 2020 11:17:58 -0700 (PDT)
From: Hyun Kwon <hyun.kwon@xilinx.com>
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
 dri-devel@lists.freedesktop.org
Subject: [PATCH 1/1] drm: xlnx: zynqmp: Stop the loop at lowest link rate
 without check
Date: Wed, 29 Jul 2020 11:17:54 -0700
Message-Id: <1596046674-29155-1-git-send-email-hyun.kwon@xilinx.com>
X-Mailer: git-send-email 2.7.4
X-RCIS-Action: ALLOW
X-TM-AS-Product-Ver: IMSS-7.1.0.1224-8.2.0.1013-23620.005
X-TM-AS-User-Approved-Sender: Yes;Yes
X-EOPAttributedMessage: 0
X-MS-Office365-Filtering-HT: Tenant
X-MS-PublicTrafficType: Email
MIME-Version: 1.0
X-MS-Office365-Filtering-Correlation-Id: 44ea5823-141f-4de3-3b7f-08d833ec43c9
X-MS-TrafficTypeDiagnostic: BYAPR02MB4086:
X-Microsoft-Antispam-PRVS: <BYAPR02MB40860F4E6297357DA6F146F0D6700@BYAPR02MB4086.namprd02.prod.outlook.com>
X-Auto-Response-Suppress: DR, RN, NRN, OOF, AutoReply
X-MS-Oob-TLC-OOBClassifiers: OLM:7219;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: RajPZ7oVcfTchppVc8DlAL65uus6rnuodI6VDKCwEcGuBD8G/b79z0cMJfbKcEjvSVlg6vT1o0vU6dAKxQEgSTupi2W7eOJmmwa5qQwOqSFnRyMkS3bIavmqWYTa/rV+JeLAyetgHfF1lHGZDGFrSHljls5QvJrx+MIG/33+w8mI8enFUwYOAEzmAH2u4sZHROYGMxam51wwQZ6s5KMoG0tvOh7dgN8Fj3oEMpBajCA1xzyKassXVaClZ9gxTX6so3P9nSV8QLdCmo5wk1LoNvN6GCGKnrGjI5HYqGoRK63c/OBtQsPpYsWQPNu3Uya3bvo8niQN0PDwEzKWSNCCbWI5QHEpMq5yC1YWfUJsyAPvdI26kx1y1EFnvHtfptLon8mS8foiPQCYt1/5rchUa9P+UZBLg+Z9LtyDXBSS/d4=
X-Forefront-Antispam-Report: CIP:149.199.60.83; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:xsj-pvapsmtpgw01; PTR:unknown-60-83.xilinx.com; CAT:NONE;
 SFTY:;
 SFS:(376002)(346002)(136003)(39860400002)(396003)(46966005)(82310400002)(70586007)(6266002)(70206006)(426003)(478600001)(2616005)(44832011)(81166007)(356005)(83380400001)(47076004)(5660300002)(8936002)(54906003)(36756003)(42186006)(8676002)(82740400003)(4326008)(26005)(6666004)(336012)(186003)(316002)(107886003)(2906002)(16453002);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: xilinx.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 Jul 2020 18:21:51.5445 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 44ea5823-141f-4de3-3b7f-08d833ec43c9
X-MS-Exchange-CrossTenant-Id: 657af505-d5df-48d0-8300-c31994686c5c
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=657af505-d5df-48d0-8300-c31994686c5c; Ip=[149.199.60.83];
 Helo=[xsj-pvapsmtpgw01]
X-MS-Exchange-CrossTenant-AuthSource: BL2NAM02FT039.eop-nam02.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BYAPR02MB4086
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
Cc: Hyun Kwon <hyun.kwon@xilinx.com>, Dan Carpenter <dan.carpenter@oracle.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

The loop should exit at the lowest link rate, so break the loop
at the lowest link rate without check. The check is always true
because lowest link rate is smaller than current one and maximum
of current display. Otherwise, it may be seen as the loop can
potentially result in negative array offset.

The patch d76271d22694: "drm: xlnx: DRM/KMS driver for Xilinx ZynqMP
DisplayPort Subsystem" from Jul 7, 2018, leads to the following
static checker warning:

	drivers/gpu/drm/xlnx/zynqmp_dp.c:594 zynqmp_dp_mode_configure()
	error: iterator underflow 'bws' (-1)-2

Reported-by: Dan Carpenter <dan.carpenter@oracle.com>
Signed-off-by: Hyun Kwon <hyun.kwon@xilinx.com>
---
 drivers/gpu/drm/xlnx/zynqmp_dp.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/xlnx/zynqmp_dp.c b/drivers/gpu/drm/xlnx/zynqmp_dp.c
index b735072..1be2b19 100644
--- a/drivers/gpu/drm/xlnx/zynqmp_dp.c
+++ b/drivers/gpu/drm/xlnx/zynqmp_dp.c
@@ -579,7 +579,7 @@ static int zynqmp_dp_mode_configure(struct zynqmp_dp *dp, int pclock,
 		return -EINVAL;
 	}
 
-	for (i = ARRAY_SIZE(bws) - 1; i >= 0; i--) {
+	for (i = ARRAY_SIZE(bws) - 1; i > 0; i--) {
 		if (current_bw && bws[i] >= current_bw)
 			continue;
 
-- 
2.7.4

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
