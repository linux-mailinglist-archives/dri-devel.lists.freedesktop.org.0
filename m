Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 4E99E72E701
	for <lists+dri-devel@lfdr.de>; Tue, 13 Jun 2023 17:22:33 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 224C310E3BF;
	Tue, 13 Jun 2023 15:22:31 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx07-00376f01.pphosted.com (mx07-00376f01.pphosted.com
 [185.132.180.163])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2696B10E3C1
 for <dri-devel@lists.freedesktop.org>; Tue, 13 Jun 2023 15:22:27 +0000 (UTC)
Received: from pps.filterd (m0168889.ppops.net [127.0.0.1])
 by mx07-00376f01.pphosted.com (8.17.1.22/8.17.1.22) with ESMTP id
 35DCfIAd029541; Tue, 13 Jun 2023 15:48:27 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=imgtec.com; h=
 from:to:cc:subject:date:message-id:in-reply-to:references
 :content-transfer-encoding:content-type:mime-version; s=
 dk201812; bh=DL3y7FGIycJK0dXxEmKHVzs6zaRmThnmwkC2yxkUAec=; b=bwS
 xA+Z2kry2dLQcdV8uhwSJtybSekiz2pxPX1LYR/XB+5v5SUe4IKoTDV+c0nN/m+S
 J1WWKFYyjURnXfxQPU+o450q1/bkVqyOd7cqzYhc54aWQHypcCjCpfn3yIm29AhW
 B/+RoVPBnerGmzjVlpgzlD0eUaaY7yXD3Xjh8wHJ7LW3WLBjSOu2Req2NPlLAGXr
 DlIZBCccVJCC4UAoyCGl7lBORTrbpAOUW7NumgTKI4LTunnMvd11uS4RXC26Ziza
 qEkdZr/2x99Oef66zfVbwE59JkwCDpijnYWUruKnZFaDcj7tUwcFWr4kOLf13afS
 LgRX5sJa3Ib1aMi5SDg==
Received: from hhmail04.hh.imgtec.org ([217.156.249.195])
 by mx07-00376f01.pphosted.com (PPS) with ESMTPS id 3r4vqbt0kd-4
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT);
 Tue, 13 Jun 2023 15:48:26 +0100 (BST)
Received: from HHMAIL05.hh.imgtec.org (10.100.10.120) by
 HHMAIL04.hh.imgtec.org (10.100.10.119) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.23; Tue, 13 Jun 2023 15:48:24 +0100
Received: from GBR01-CWL-obe.outbound.protection.outlook.com (104.47.20.58) by
 email.imgtec.com (10.100.10.121) with Microsoft SMTP Server
 (version=TLS1_2, 
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.23 via Frontend
 Transport; Tue, 13 Jun 2023 15:48:24 +0100
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=exhbkp2P2qHTiM9y4w9R0VumP+3nAhZpcZcJAFo6OswLL8fIG90hX5zfPgk31AAnzn1R+ZnjjI0vCxV5Vzrade4xSIqvD6y4XWY7MdShRwhTMVOPqHFFyjPXNbAHr4oiUwSJSPHb1jEe4sAYFYGUVZ4gA153Dd9uSI6rEqzHvszkZflhzlhPuxWksaAJWaKbLCNzz7e9ffaO1jutqDPwmiRewo770qBMEyIulYnzDaA7VurwRAvjn4k6xhRNpql9Kr7cjFVQoGBY26ElFDRwQYf/owLol9TPl3zJQtRttP4DN8Mfv8IzR110SEqfD8XWezGrXwujKJ3tokc4aZB90w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=DL3y7FGIycJK0dXxEmKHVzs6zaRmThnmwkC2yxkUAec=;
 b=L3Z4COg0DxWZLvTLXDdUpj+6310yeJNjP7iMgSmnXU7lzmt7WTjMbFJBpD4f13CJCeyRwtkx+tfl4K5LpsOjl8w6Wmh6kXCpnUEjKoq4pWdEjWj5F4s1bYnF+yuEe3cHMj+f52dYQrgWOH2MTBG5NwgXyIoTnKYt6gA2f6FPxmS1miT3t8L3aty6XpUFoap4st9uDaTvhLIdzfmiorxEAVpaIIcBaCsnE0G05NDFJ/vdAYz5ju11FQUyFHotfNbdPAnKX0Go9rt1Rx1oM07mOkPZXUkhh5q/9IvqKsbo2VYQI4vfxGbPXhov4lLNY/2zywRoDr/39oNk0pVFNZyMUA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=imgtec.com; dmarc=pass action=none header.from=imgtec.com;
 dkim=pass header.d=imgtec.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=IMGTecCRM.onmicrosoft.com; s=selector2-IMGTecCRM-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=DL3y7FGIycJK0dXxEmKHVzs6zaRmThnmwkC2yxkUAec=;
 b=p9E9ziNMYF9JZYZCzWeWJK33mMs2kqxgKUoHhhpakkn4Sc0inTGBljmR6NyFHa6g6fkWxpVl7BeQWTRt493FPkYv8Ymjxf4HhVV4AEnc1LtiDX4z2x8t0ZaMlXJddOTMIElzfPMnYajOdbzuVJrwCnzXJwRxzXd9dlnasq8FJ+s=
Received: from CWXP265MB4826.GBRP265.PROD.OUTLOOK.COM (2603:10a6:400:155::11)
 by LO3P265MB2282.GBRP265.PROD.OUTLOOK.COM (2603:10a6:600:100::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6500.21; Tue, 13 Jun
 2023 14:48:20 +0000
Received: from CWXP265MB4826.GBRP265.PROD.OUTLOOK.COM
 ([fe80::23bd:d6e:8ecc:fa5f]) by CWXP265MB4826.GBRP265.PROD.OUTLOOK.COM
 ([fe80::23bd:d6e:8ecc:fa5f%5]) with mapi id 15.20.6500.020; Tue, 13 Jun 2023
 14:48:20 +0000
From: Sarah Walker <sarah.walker@imgtec.com>
To: <dri-devel@lists.freedesktop.org>
Subject: [PATCH v3 14/17] drm/imagination: Implement job submission and
 scheduling
Date: Tue, 13 Jun 2023 15:47:57 +0100
Message-Id: <20230613144800.52657-15-sarah.walker@imgtec.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20230613144800.52657-1-sarah.walker@imgtec.com>
References: <20230613144800.52657-1-sarah.walker@imgtec.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: LO4P123CA0375.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:18e::20) To CWXP265MB4826.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:400:155::11)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CWXP265MB4826:EE_|LO3P265MB2282:EE_
X-MS-Office365-Filtering-Correlation-Id: c6f52785-eb97-465f-ee43-08db6c1d3adc
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: xYlJGpJV5/vZNmaZOxsGawmCvBDh2bFVmkQdp2ZBle+Y/JVFdBG6DyFUvlRiZfUuxBSdJxx0JhdfvpClWsF6TeKHRCN1oe1xBI1TAKkNgstNxpAHbNnpqRHj3lGtv9TtlXih2uy8/uMnDHFiK+m0hKxJUUp9ooSZB1L3RoR3bkD8kOquEosOYvQzQZujb57p5Nxh7SvllJnYx6WP6KK6UokG/81BvDLlOJ9LynUvWsE4OuwKNjpw9fdESk1YB0RiOEQ6x9uDmIsLcuejltOdWlta8oITXJs6LrCDPKRuNh05YNw+WKHtJBqmmLlG5I2WJjQ5B8z82qemiPzzasR15/Vr5I4TBddWpFbRTKMPKS2hSlJfJSCPoGk9bT5kmlX/lWmy/m+5nVmsspPQ/aNOtWpC7ZJ2Rju3d5Sss1Xs+3/nY84F5fGzxD4mnkFHkrhotDk7fYwOux1jLEsDX2DcnxDPP0rscWO/QBHk9NN99k9rPbkPpVbT1T3qILrBxc1yhlHzHiY7VXOlhIZ4JhKiQ9h4KNU0tRcfo9W0W2yN+e/hI6R+IzzEJ7MUKGT+rOJT
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CWXP265MB4826.GBRP265.PROD.OUTLOOK.COM; PTR:; CAT:NONE;
 SFS:(13230028)(396003)(366004)(136003)(376002)(346002)(39840400004)(451199021)(44832011)(4326008)(8936002)(316002)(7416002)(66946007)(6916009)(66476007)(41300700001)(186003)(2906002)(30864003)(66556008)(478600001)(8676002)(66899021)(5660300002)(6666004)(966005)(52116002)(6486002)(6512007)(1076003)(6506007)(26005)(83380400001)(36756003)(86362001)(2616005)(38350700002)(38100700002)(579004)(559001);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?ecWx5FK2aeAZPFlV7VsyUQECV9SE8My0qoGpjgfkyv21IlNfE+YhVXAsEk2a?=
 =?us-ascii?Q?/aorHJHSt3lYtxDVjNL0TWkGF785ljjFTichKlp2D1FR2J6Zc4F6hhGx92Js?=
 =?us-ascii?Q?3n3Yh4bMh74n4RDD0SF+Aj97gR/GdnVOWqyW+acFvGFCoNW4a0DSi0+KatiX?=
 =?us-ascii?Q?xCrDJ5XRCaFjUxG+9v3xKExjI5rXOyes/+zOHdPxLAZdbCckXKqoti1OgP+z?=
 =?us-ascii?Q?9CWhhZOBh4t9WYVCnKR7Cnx20jZsCSukDY5Uy0XEt0Ep6DbWTJKFVKSNWr/k?=
 =?us-ascii?Q?n//4UAGrsSICvOhO+9nVDQeziPbyvXAZbRjTPu3Qq9nhfu4pEjwpy6a8WutB?=
 =?us-ascii?Q?m53VrOGG9stK9lr11s7eUQX8QRw6mSLwFSxw4YEm//w+MOV4GRVSXkEMc6R2?=
 =?us-ascii?Q?lxqpMVo9o/3wQS8MbtMleA3hmxq1BT17RemmulIGbu6mfvMO6R/j77Bkybso?=
 =?us-ascii?Q?rJit8d9jXHDnMw3qLVa5Nmn63RAmBrRvAu9eeWMGvkoIdQSn3BoVEWFvVOtL?=
 =?us-ascii?Q?KCpf8Bk33wtVRO94X4NrXc+r5JAUHFo8V0V+qP2pymWIcLXMmLi6jTwOBHWL?=
 =?us-ascii?Q?N5MhXkyGS08cR3eN8u7SJbhnZSBE2SVsTdc1xgPJf9DN6gY8DvpLnjzrU2/V?=
 =?us-ascii?Q?Um99vwc1t86g6CwOhqc8V/n6uqhg2AzVN9cJkT17LCRX4Bmin3pZh9a2HXnj?=
 =?us-ascii?Q?fm4uFv6QI6pqs9Av6lY1jC4D14ICbFv7ja8JlL7IKPp1lpFRfZHZr6yVE62j?=
 =?us-ascii?Q?+yeFmIz98467rxE60eYVXvp+mRDZ2rGGCMwp/owVr2ReW0pD4i59a5FG85Ic?=
 =?us-ascii?Q?Co7NQMVgLTcXAGJDcHTEkSd7KE7GtJC6nkZdjO9PEfyTRDb+FRZ+ANOfQ1nF?=
 =?us-ascii?Q?zfLxGPmrCGgt+tmWt/1MeqmIMrB9E9UNMvw6ozTXBi6ppIl3345E1RIKCkdn?=
 =?us-ascii?Q?YBpPPpJiid7lKWQBRv21sthRquMTxJucIcsCQaoBfUgc2AtMu9VsK4TExc+v?=
 =?us-ascii?Q?UG5B/1Q6M0WGKzMxzFe0U5Mt7BAJpNItXm2Z1rRCGda4GUmRp2JxvwwKb1Hy?=
 =?us-ascii?Q?ujnbpNhMa7CvCUXbRfmGf8xUOzRIAH72+JwU4uWiE90IAX1+e4KTfIsFjEnG?=
 =?us-ascii?Q?7/d/CnYyXkS67fdU9zTj65t45dlhAag2lDWgxZPvgavyMSPMByx2qECyYOKQ?=
 =?us-ascii?Q?AdA2TZ5OJ6ybB2wKzIS5gdq51Sio0LkIhwp6uEwmEV2NlHCrdv1kGl3L9XIa?=
 =?us-ascii?Q?dScE6+8KGqpzSufzO/07sgAHU/VDCvdv3Twt7yDsXazMvQyxtayAB0vQKAAp?=
 =?us-ascii?Q?Zot06tCX2+3+CRNpv0PjuhlOd5t0IxrkeWAqoN8A2SiG8IF40rIC2gM7uwI7?=
 =?us-ascii?Q?FLo9Tsq9PccwEEGn8dIg8AlrUPelM0t4obwC7Som1lkIS+IGeSwFKFWlAXRZ?=
 =?us-ascii?Q?NbbVGFn6RBMVDdu+bToFO97CMIu8R2xCusAf+C2HuDmpdRZWhF1W061d4iuG?=
 =?us-ascii?Q?JF/eKn+V4mzDPpZT9oqtgCQhdCYmaH6IH9iATclTBxWM6zo7jQYSDDYlU4bh?=
 =?us-ascii?Q?DPWJWydkjgO/6hSL58I0UlAg9L8lV+H3Mn1eJMV4pvQFvQKXDlUixrBtDojf?=
 =?us-ascii?Q?cA=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: c6f52785-eb97-465f-ee43-08db6c1d3adc
X-MS-Exchange-CrossTenant-AuthSource: CWXP265MB4826.GBRP265.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 Jun 2023 14:48:20.2957 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 0d5fd8bb-e8c2-4e0a-8dd5-2c264f7140fe
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: ACrmTWTcibEQhJUY9S/oIkkOyCw7P92k7JGUgPg+rG7dL8jBgSYc3rPc+StaBNh71iqRQQl+6bU+cWZu0Sv7eQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LO3P265MB2282
X-OriginatorOrg: imgtec.com
X-EXCLAIMER-MD-CONFIG: 15a78312-3e47-46eb-9010-2e54d84a9631
X-Proofpoint-ORIG-GUID: p2yJ4WIWNAuCho3IecdHzoBL5rVa2akf
X-Proofpoint-GUID: p2yJ4WIWNAuCho3IecdHzoBL5rVa2akf
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
Cc: matthew.brost@intel.com, luben.tuikov@amd.com, sumit.semwal@linaro.org,
 boris.brezillon@collabora.com, dakr@redhat.com, donald.robson@imgtec.com,
 christian.koenig@amd.com, faith.ekstrand@collabora.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Implement job submission ioctl. Job scheduling is implemented using
drm_sched.

Jobs are submitted in a stream format. This is intended to allow the UAPI
data format to be independent of the actual FWIF structures in use, which
vary depending on the GPU in use.

The stream formats are documented at:
https://gitlab.freedesktop.org/mesa/mesa/-/blob/73fe6db819d951c02ce57eefcbd9b31b85900f33/src/imagination/csbgen/rogue_kmd_stream.xml

This patch depends on:
drm/sched: Convert drm scheduler to use a work queue rather than kthread: https://lists.freedesktop.org/archives/dri-devel/2023-April/398458.html
drm/sched: Move schedule policy to scheduler / entity: https://lists.freedesktop.org/archives/dri-devel/2023-April/398461.html
drm/sched: Add DRM_SCHED_POLICY_SINGLE_ENTITY scheduling policy: https://lists.freedesktop.org/archives/dri-devel/2023-April/398460.html
drm/sched: Start run wq before TDR in drm_sched_start: https://lists.freedesktop.org/archives/dri-devel/2023-April/398462.html
drm/sched: Submit job before starting TDR: https://lists.freedesktop.org/archives/dri-devel/2023-April/398466.html
drm/sched: Add helper to set TDR timeout: https://lists.freedesktop.org/archives/dri-devel/2023-April/398464.html
drm: fix drmm_mutex_init(): https://lists.freedesktop.org/archives/dri-devel/2023-May/404863.html
drm/sched: Make sure we wait for all dependencies in kill_jobs_cb(): https://lists.freedesktop.org/archives/dri-devel/2023-June/408901.html
drm/sched: Call drm_sched_fence_set_parent() from drm_sched_fence_scheduled(): https://lists.freedesktop.org/archives/dri-devel/2023-June/408904.html

Signed-off-by: Sarah Walker <sarah.walker@imgtec.com>
---
 drivers/gpu/drm/imagination/Makefile          |    2 +
 drivers/gpu/drm/imagination/pvr_context.c     |  127 +-
 drivers/gpu/drm/imagination/pvr_context.h     |   35 +
 drivers/gpu/drm/imagination/pvr_device.c      |    4 +
 drivers/gpu/drm/imagination/pvr_device.h      |   46 +
 drivers/gpu/drm/imagination/pvr_drv.c         |   34 +-
 drivers/gpu/drm/imagination/pvr_job.c         |  834 ++++++++++++
 drivers/gpu/drm/imagination/pvr_job.h         |  147 ++
 drivers/gpu/drm/imagination/pvr_power.c       |   17 +
 drivers/gpu/drm/imagination/pvr_queue.c       | 1203 +++++++++++++++++
 drivers/gpu/drm/imagination/pvr_queue.h       |  157 +++
 drivers/gpu/drm/imagination/pvr_stream.c      |    2 +-
 drivers/gpu/drm/imagination/pvr_stream_defs.c |  226 ++++
 13 files changed, 2827 insertions(+), 7 deletions(-)
 create mode 100644 drivers/gpu/drm/imagination/pvr_job.c
 create mode 100644 drivers/gpu/drm/imagination/pvr_job.h
 create mode 100644 drivers/gpu/drm/imagination/pvr_queue.c
 create mode 100644 drivers/gpu/drm/imagination/pvr_queue.h

diff --git a/drivers/gpu/drm/imagination/Makefile b/drivers/gpu/drm/imagination/Makefile
index 786a7bf6c773..85cd0c0c70cd 100644
--- a/drivers/gpu/drm/imagination/Makefile
+++ b/drivers/gpu/drm/imagination/Makefile
@@ -18,7 +18,9 @@ powervr-y := \
 	pvr_fw_trace.o \
 	pvr_gem.o \
 	pvr_hwrt.o \
+	pvr_job.o \
 	pvr_power.o \
+	pvr_queue.o \
 	pvr_stream.o \
 	pvr_stream_defs.o \
 	pvr_vm.o \
diff --git a/drivers/gpu/drm/imagination/pvr_context.c b/drivers/gpu/drm/imagination/pvr_context.c
index 809bc0e55553..4a72be95faed 100644
--- a/drivers/gpu/drm/imagination/pvr_context.c
+++ b/drivers/gpu/drm/imagination/pvr_context.c
@@ -6,10 +6,12 @@
 #include "pvr_device.h"
 #include "pvr_drv.h"
 #include "pvr_gem.h"
+#include "pvr_job.h"
 #include "pvr_power.h"
 #include "pvr_rogue_fwif.h"
 #include "pvr_rogue_fwif_common.h"
 #include "pvr_rogue_fwif_resetframework.h"
+#include "pvr_stream.h"
 #include "pvr_stream_defs.h"
 #include "pvr_vm.h"
 
@@ -159,6 +161,116 @@ static int init_fw_objs(struct pvr_context *ctx,
 	return -EINVAL;
 }
 
+/**
+ * pvr_context_destroy_queues() - Destroy all queues attached to a context.
+ * @ctx: Context to destroy queues on.
+ *
+ * Should be called when the last reference to a context object is dropped.
+ * It releases all resources attached to the queues bound to this context.
+ */
+static void pvr_context_destroy_queues(struct pvr_context *ctx)
+{
+	switch (ctx->type) {
+	case DRM_PVR_CTX_TYPE_RENDER:
+		pvr_queue_destroy(ctx->queues.fragment);
+		pvr_queue_destroy(ctx->queues.geometry);
+		break;
+	case DRM_PVR_CTX_TYPE_COMPUTE:
+		pvr_queue_destroy(ctx->queues.compute);
+		break;
+	case DRM_PVR_CTX_TYPE_TRANSFER_FRAG:
+		pvr_queue_destroy(ctx->queues.transfer);
+		break;
+	}
+}
+
+/**
+ * pvr_context_create_queues() - Create all queues attached to a context.
+ * @ctx: Context to create queues on.
+ * @args: Context creation arguments passed by userspace.
+ * @fw_ctx_map: CPU mapping of the FW context object.
+ *
+ * Return:
+ *  * 0 on success, or
+ *  * A negative error code otherwise.
+ */
+static int pvr_context_create_queues(struct pvr_context *ctx,
+				     struct drm_pvr_ioctl_create_context_args *args,
+				     void *fw_ctx_map)
+{
+	int err;
+
+	switch (ctx->type) {
+	case DRM_PVR_CTX_TYPE_RENDER:
+		ctx->queues.geometry = pvr_queue_create(ctx, DRM_PVR_JOB_TYPE_GEOMETRY,
+							args, fw_ctx_map);
+		if (IS_ERR(ctx->queues.geometry)) {
+			err = PTR_ERR(ctx->queues.geometry);
+			ctx->queues.geometry = NULL;
+			goto err_destroy_queues;
+		}
+
+		ctx->queues.fragment = pvr_queue_create(ctx, DRM_PVR_JOB_TYPE_FRAGMENT,
+							args, fw_ctx_map);
+		if (IS_ERR(ctx->queues.fragment)) {
+			err = PTR_ERR(ctx->queues.fragment);
+			ctx->queues.fragment = NULL;
+			goto err_destroy_queues;
+		}
+		return 0;
+
+	case DRM_PVR_CTX_TYPE_COMPUTE:
+		ctx->queues.compute = pvr_queue_create(ctx, DRM_PVR_JOB_TYPE_COMPUTE,
+						       args, fw_ctx_map);
+		if (IS_ERR(ctx->queues.compute)) {
+			err = PTR_ERR(ctx->queues.compute);
+			ctx->queues.compute = NULL;
+			goto err_destroy_queues;
+		}
+		return 0;
+
+	case DRM_PVR_CTX_TYPE_TRANSFER_FRAG:
+		ctx->queues.transfer = pvr_queue_create(ctx, DRM_PVR_JOB_TYPE_TRANSFER_FRAG,
+							args, fw_ctx_map);
+		if (IS_ERR(ctx->queues.transfer)) {
+			err = PTR_ERR(ctx->queues.transfer);
+			ctx->queues.transfer = NULL;
+			goto err_destroy_queues;
+		}
+		return 0;
+	}
+
+	return -EINVAL;
+
+err_destroy_queues:
+	pvr_context_destroy_queues(ctx);
+	return err;
+}
+
+/**
+ * pvr_context_kill_queues() - Kill queues attached to context.
+ * @ctx: Context to kill queues on.
+ *
+ * Killing the queues implies making them unusable for future jobs, while still
+ * letting the currently submitted jobs a chance to finish. Queue resources will
+ * stay around until pvr_context_destroy_queues() is called.
+ */
+static void pvr_context_kill_queues(struct pvr_context *ctx)
+{
+	switch (ctx->type) {
+	case DRM_PVR_CTX_TYPE_RENDER:
+		pvr_queue_kill(ctx->queues.fragment);
+		pvr_queue_kill(ctx->queues.geometry);
+		break;
+	case DRM_PVR_CTX_TYPE_COMPUTE:
+		pvr_queue_kill(ctx->queues.compute);
+		break;
+	case DRM_PVR_CTX_TYPE_TRANSFER_FRAG:
+		pvr_queue_kill(ctx->queues.transfer);
+		break;
+	}
+}
+
 /**
  * pvr_context_create() - Create a context.
  * @pvr_file: File to attach the created context to.
@@ -213,13 +325,17 @@ int pvr_context_create(struct pvr_file *pvr_file, struct drm_pvr_ioctl_create_co
 		goto err_put_vm;
 	}
 
-	err = init_fw_objs(ctx, args, ctx_map);
+	err = pvr_context_create_queues(ctx, args, ctx_map);
 	if (err)
 		goto err_destroy_fw_obj;
 
+	err = init_fw_objs(ctx, args, ctx_map);
+	if (err)
+		goto err_destroy_queues;
+
 	err = xa_alloc(&pvr_dev->ctx_ids, &ctx->ctx_id, ctx, xa_limit_32b, GFP_KERNEL);
 	if (err)
-		goto err_destroy_fw_obj;
+		goto err_destroy_queues;
 
 	err = xa_alloc(&pvr_file->ctx_handles, &args->handle, ctx, xa_limit_32b, GFP_KERNEL);
 	if (err)
@@ -231,6 +347,9 @@ int pvr_context_create(struct pvr_file *pvr_file, struct drm_pvr_ioctl_create_co
 err_release_id:
 	xa_erase(&pvr_dev->ctx_ids, ctx->ctx_id);
 
+err_destroy_queues:
+	pvr_context_destroy_queues(ctx);
+
 err_destroy_fw_obj:
 	pvr_fw_object_unmap_and_destroy(ctx->fw_obj);
 
@@ -250,6 +369,7 @@ pvr_context_release(struct kref *ref_count)
 	struct pvr_device *pvr_dev = ctx->pvr_dev;
 
 	xa_erase(&pvr_dev->ctx_ids, ctx->ctx_id);
+	pvr_context_destroy_queues(ctx);
 	pvr_fw_object_destroy(ctx->fw_obj);
 	pvr_vm_context_put(ctx->vm_ctx);
 }
@@ -285,6 +405,9 @@ pvr_context_destroy(struct pvr_file *pvr_file, u32 handle)
 	if (!ctx)
 		return -EINVAL;
 
+	/* Make sure nothing can be queued to the queues after that point. */
+	pvr_context_kill_queues(ctx);
+
 	/* Release the reference held by the handle set. */
 	pvr_context_put(ctx);
 
diff --git a/drivers/gpu/drm/imagination/pvr_context.h b/drivers/gpu/drm/imagination/pvr_context.h
index 9f37e698dd52..9af3d69fe65a 100644
--- a/drivers/gpu/drm/imagination/pvr_context.h
+++ b/drivers/gpu/drm/imagination/pvr_context.h
@@ -15,6 +15,7 @@
 
 #include "pvr_cccb.h"
 #include "pvr_device.h"
+#include "pvr_queue.h"
 
 /* Forward declaration from pvr_gem.h. */
 struct pvr_fw_object;
@@ -52,8 +53,42 @@ struct pvr_context {
 
 	/** @ctx_id: FW context ID. */
 	u32 ctx_id;
+
+	/** @queues: Union containg all kind of queues. */
+	union {
+		struct {
+			/** @geometry: Geometry queue. */
+			struct pvr_queue *geometry;
+
+			/** @fragment: Fragment queue. */
+			struct pvr_queue *fragment;
+		};
+
+		/** @compute: Compute queue. */
+		struct pvr_queue *compute;
+
+		/** @compute: Transfer queue. */
+		struct pvr_queue *transfer;
+	} queues;
 };
 
+static __always_inline struct pvr_queue *
+pvr_context_get_queue_for_job(struct pvr_context *ctx, enum drm_pvr_job_type type)
+{
+	switch (type) {
+	case DRM_PVR_JOB_TYPE_GEOMETRY:
+		return ctx->type == DRM_PVR_CTX_TYPE_RENDER ? ctx->queues.geometry : NULL;
+	case DRM_PVR_JOB_TYPE_FRAGMENT:
+		return ctx->type == DRM_PVR_CTX_TYPE_RENDER ? ctx->queues.fragment : NULL;
+	case DRM_PVR_JOB_TYPE_COMPUTE:
+		return ctx->type == DRM_PVR_CTX_TYPE_COMPUTE ? ctx->queues.compute : NULL;
+	case DRM_PVR_JOB_TYPE_TRANSFER_FRAG:
+		return ctx->type == DRM_PVR_CTX_TYPE_TRANSFER_FRAG ? ctx->queues.transfer : NULL;
+	}
+
+	return NULL;
+}
+
 /**
  * pvr_context_get() - Take additional reference on context.
  * @ctx: Context pointer.
diff --git a/drivers/gpu/drm/imagination/pvr_device.c b/drivers/gpu/drm/imagination/pvr_device.c
index 710ba07325de..209bc35450a9 100644
--- a/drivers/gpu/drm/imagination/pvr_device.c
+++ b/drivers/gpu/drm/imagination/pvr_device.c
@@ -7,6 +7,7 @@
 #include "pvr_fw.h"
 #include "pvr_power.h"
 #include "pvr_rogue_cr_defs.h"
+#include "pvr_stream.h"
 #include "pvr_vm.h"
 
 #include <drm/drm_print.h>
@@ -252,6 +253,7 @@ static irqreturn_t pvr_meta_irq_handler(int irq, void *data)
 		queue_work(pvr_dev->irq_wq, &pvr_dev->fwccb_work);
 		wake_up(&pvr_dev->kccb.rtn_q);
 		queue_work(pvr_dev->irq_wq, &pvr_dev->kccb.work);
+		queue_work(pvr_dev->irq_wq, &pvr_dev->queues.work);
 	}
 
 	return IRQ_HANDLED;
@@ -506,6 +508,8 @@ pvr_device_gpu_init(struct pvr_device *pvr_dev)
 		goto err_out;
 	}
 
+	pvr_stream_create_musthave_masks(pvr_dev);
+
 	err = pvr_set_dma_info(pvr_dev);
 	if (err)
 		goto err_out;
diff --git a/drivers/gpu/drm/imagination/pvr_device.h b/drivers/gpu/drm/imagination/pvr_device.h
index d26a7e866fcb..9ab40d25a0fd 100644
--- a/drivers/gpu/drm/imagination/pvr_device.h
+++ b/drivers/gpu/drm/imagination/pvr_device.h
@@ -165,6 +165,29 @@ struct pvr_device {
 	 */
 	struct xarray free_list_ids;
 
+	/**
+	 * @job_ids: Array of objects belonging to this device. Array members
+	 *           are of type "struct pvr_job *".
+	 */
+	struct xarray job_ids;
+
+	/**
+	 * @queues: Queue-related fields.
+	 */
+	struct {
+		/** @active: Active queue list. */
+		struct list_head active;
+
+		/** @idle: Idle queue list. */
+		struct list_head idle;
+
+		/** @lock: Lock protecting access to the active/idle lists. */
+		struct mutex lock;
+
+		/** @work: Work item for active queue processing. */
+		struct work_struct work;
+	} queues;
+
 	struct {
 		/** @work: Work item for watchdog callback. */
 		struct delayed_work work;
@@ -224,6 +247,9 @@ struct pvr_device {
 
 	/** @lost: %true if the device has been lost. */
 	bool lost;
+
+	/** @sched_wq: Workqueue for schedulers. */
+	struct workqueue_struct *sched_wq;
 };
 
 /**
@@ -276,6 +302,25 @@ struct pvr_file {
 	 * This array is used to allocate handles returned to userspace.
 	 */
 	struct xarray vm_ctx_handles;
+
+	/**
+	 * @submit_lock: Lock used to prevent concurrent access to the queues
+	 * targeted by a SUBMIT_JOBS ioctl.
+	 *
+	 * drm_sched_job_arm() and drm_sched_entity_push_job() need to be called
+	 * in the same critical section, so that the seqno assigned to job fences
+	 * in drm_sched_job_arm() are consistent with the order in the entity
+	 * list.
+	 *
+	 * Jobs submission is implemented as an atomic operation where all jobs
+	 * are submitted or none of them are. We also allow jobs to be passed
+	 * fences issued by previous jobs in the job array, and that requires
+	 * calling drm_sched_job_arm() on a job, before proceeding with the next
+	 * job in the list. For all these reasons the region protected by the lock
+	 * is quite large, which is likely to hurt perfs on apps that submit
+	 * things to different VkQueues in separate threads.
+	 */
+	struct mutex submit_lock;
 };
 
 /**
@@ -435,6 +480,7 @@ packed_bvnc_to_pvr_gpu_id(u64 bvnc, struct pvr_gpu_id *gpu_id)
 
 int pvr_device_init(struct pvr_device *pvr_dev);
 void pvr_device_fini(struct pvr_device *pvr_dev);
+void pvr_device_reset(struct pvr_device *pvr_dev);
 
 int
 pvr_device_clk_core_get_freq(struct pvr_device *pvr_dev, u32 *freq_out);
diff --git a/drivers/gpu/drm/imagination/pvr_drv.c b/drivers/gpu/drm/imagination/pvr_drv.c
index 6c1bde247f97..2ee6c4b0d60e 100644
--- a/drivers/gpu/drm/imagination/pvr_drv.c
+++ b/drivers/gpu/drm/imagination/pvr_drv.c
@@ -7,6 +7,7 @@
 #include "pvr_free_list.h"
 #include "pvr_gem.h"
 #include "pvr_hwrt.h"
+#include "pvr_job.h"
 #include "pvr_power.h"
 #include "pvr_rogue_defs.h"
 #include "pvr_rogue_fwif_client.h"
@@ -31,6 +32,8 @@
 #include <linux/of_device.h>
 #include <linux/of_platform.h>
 #include <linux/platform_device.h>
+#include <linux/pm_runtime.h>
+#include <linux/xarray.h>
 
 /**
  * DOC: PowerVR Graphics Driver
@@ -396,7 +399,8 @@ pvr_dev_query_runtime_info_get(struct pvr_device *pvr_dev,
 		return 0;
 	}
 
-	runtime_info.free_list_min_pages = 0; /* FIXME */
+	runtime_info.free_list_min_pages =
+		pvr_get_free_list_min_pages(pvr_dev);
 	runtime_info.free_list_max_pages =
 		ROGUE_PM_MAX_FREELIST_SIZE / ROGUE_PM_PAGE_SIZE;
 	runtime_info.common_store_alloc_region_size =
@@ -678,10 +682,10 @@ pvr_ioctl_dev_query(struct drm_device *drm_dev, void *raw_args,
 		return pvr_dev_query_enhancements_get(pvr_dev, args);
 
 	case DRM_PVR_DEV_QUERY_HEAP_INFO_GET:
-		return -EINVAL;
+		return pvr_heap_info_get(pvr_dev, args);
 
 	case DRM_PVR_DEV_QUERY_STATIC_DATA_AREAS_GET:
-		return -EINVAL;
+		return pvr_static_data_areas_get(pvr_dev, args);
 	}
 
 	return -EINVAL;
@@ -1140,7 +1144,14 @@ static int
 pvr_ioctl_submit_jobs(struct drm_device *drm_dev, void *raw_args,
 		      struct drm_file *file)
 {
-	return -ENOTTY;
+	struct drm_pvr_ioctl_submit_jobs_args *args = raw_args;
+	struct pvr_device *pvr_dev = to_pvr_device(drm_dev);
+	struct pvr_file *pvr_file = to_pvr_file(file);
+
+	if (pvr_dev->lost)
+		return -EIO;
+
+	return pvr_submit_jobs(pvr_dev, pvr_file, args);
 }
 
 int
@@ -1320,6 +1331,8 @@ pvr_drm_driver_open(struct drm_device *drm_dev, struct drm_file *file)
 	xa_init_flags(&pvr_file->hwrt_handles, XA_FLAGS_ALLOC1);
 	xa_init_flags(&pvr_file->vm_ctx_handles, XA_FLAGS_ALLOC1);
 
+	mutex_init(&pvr_file->submit_lock);
+
 	/*
 	 * Store reference to powervr-specific file private data in DRM file
 	 * private data.
@@ -1356,6 +1369,8 @@ pvr_drm_driver_postclose(__always_unused struct drm_device *drm_dev,
 	pvr_destroy_hwrt_datasets_for_file(pvr_file);
 	pvr_destroy_vm_contexts_for_file(pvr_file);
 
+	mutex_destroy(&pvr_file->submit_lock);
+
 	kfree(pvr_file);
 	file->driver_priv = NULL;
 }
@@ -1412,6 +1427,10 @@ pvr_probe(struct platform_device *plat_dev)
 	platform_set_drvdata(plat_dev, drm_dev);
 	pvr_context_device_init(pvr_dev);
 
+	err = pvr_queue_device_init(pvr_dev);
+	if (err)
+		goto err_context_fini;
+
 	devm_pm_runtime_enable(&plat_dev->dev);
 
 	pm_runtime_set_autosuspend_delay(&plat_dev->dev, 50);
@@ -1427,6 +1446,7 @@ pvr_probe(struct platform_device *plat_dev)
 		goto err_device_fini;
 
 	xa_init_flags(&pvr_dev->free_list_ids, XA_FLAGS_ALLOC1);
+	xa_init_flags(&pvr_dev->job_ids, XA_FLAGS_ALLOC1);
 
 	return 0;
 
@@ -1436,6 +1456,9 @@ pvr_probe(struct platform_device *plat_dev)
 err_power_fini:
 	pvr_power_fini(pvr_dev);
 
+	pvr_queue_device_fini(pvr_dev);
+
+err_context_fini:
 	pvr_context_device_fini(pvr_dev);
 
 err_out:
@@ -1448,13 +1471,16 @@ pvr_remove(struct platform_device *plat_dev)
 	struct drm_device *drm_dev = platform_get_drvdata(plat_dev);
 	struct pvr_device *pvr_dev = to_pvr_device(drm_dev);
 
+	WARN_ON(!xa_empty(&pvr_dev->job_ids));
 	WARN_ON(!xa_empty(&pvr_dev->free_list_ids));
 
+	xa_destroy(&pvr_dev->job_ids);
 	xa_destroy(&pvr_dev->free_list_ids);
 
 	drm_dev_unregister(drm_dev);
 	pvr_device_fini(pvr_dev);
 	pvr_power_fini(pvr_dev);
+	pvr_queue_device_fini(pvr_dev);
 	pvr_context_device_fini(pvr_dev);
 
 	return 0;
diff --git a/drivers/gpu/drm/imagination/pvr_job.c b/drivers/gpu/drm/imagination/pvr_job.c
new file mode 100644
index 000000000000..8bb71e04d571
--- /dev/null
+++ b/drivers/gpu/drm/imagination/pvr_job.c
@@ -0,0 +1,834 @@
+// SPDX-License-Identifier: GPL-2.0 OR MIT
+/* Copyright (c) 2022 Imagination Technologies Ltd. */
+
+#include "pvr_context.h"
+#include "pvr_device.h"
+#include "pvr_drv.h"
+#include "pvr_gem.h"
+#include "pvr_hwrt.h"
+#include "pvr_job.h"
+#include "pvr_power.h"
+#include "pvr_rogue_fwif.h"
+#include "pvr_rogue_fwif_client.h"
+#include "pvr_stream.h"
+#include "pvr_stream_defs.h"
+
+#include <drm/drm_gem.h>
+#include <drm/drm_syncobj.h>
+#include <linux/dma-fence.h>
+#include <linux/dma-fence-array.h>
+#include <linux/dma-fence-unwrap.h>
+#include <linux/dma-resv.h>
+#include <linux/slab.h>
+#include <linux/types.h>
+#include <linux/ww_mutex.h>
+#include <linux/xarray.h>
+#include <uapi/drm/pvr_drm.h>
+
+static void pvr_job_release(struct kref *kref)
+{
+	struct pvr_job *job = container_of(kref, struct pvr_job, ref_count);
+
+	xa_erase(&job->pvr_dev->job_ids, job->id);
+
+	pvr_hwrt_data_put(job->hwrt);
+	pvr_context_put(job->ctx);
+
+	pvr_queue_job_cleanup(job);
+	pvr_job_release_pm_ref(job);
+
+	kfree(job->cmd);
+	kfree(job);
+}
+
+/**
+ * pvr_job_put() - Release reference on job
+ * @job: Target job.
+ */
+void
+pvr_job_put(struct pvr_job *job)
+{
+	if (job)
+		kref_put(&job->ref_count, pvr_job_release);
+}
+
+static int
+pvr_check_sync_op(const struct drm_pvr_sync_op *sync_op)
+{
+	u8 handle_type;
+
+	if (sync_op->flags & ~DRM_PVR_SYNC_OP_FLAGS_MASK)
+		return -EINVAL;
+
+	handle_type = sync_op->flags & DRM_PVR_SYNC_OP_FLAG_HANDLE_TYPE_MASK;
+	if (handle_type != DRM_PVR_SYNC_OP_FLAG_HANDLE_TYPE_SYNCOBJ &&
+	    handle_type != DRM_PVR_SYNC_OP_FLAG_HANDLE_TYPE_TIMELINE_SYNCOBJ)
+		return -EINVAL;
+
+	if (handle_type == DRM_PVR_SYNC_OP_FLAG_HANDLE_TYPE_SYNCOBJ &&
+	    sync_op->value != 0)
+		return -EINVAL;
+
+	return 0;
+}
+
+/**
+ * struct pvr_sync_signal - Object encoding a syncobj signal operation
+ *
+ * The job submission logic collects all signal operations in an array of
+ * pvr_sync_signal objects. This array also serves as a cache to get the
+ * latest dma_fence when multiple jobs are submitted at once, and one job
+ * signals a syncobj point that's later waited on by a subsequent job.
+ */
+struct pvr_sync_signal {
+	/** @handle: Handle of the syncobj to signal. */
+	u32 handle;
+
+	/**
+	 * @point: Point to signal in the syncobj.
+	 *
+	 * Only relevant for timeline syncobjs.
+	 */
+	u64 point;
+
+	/** @syncobj: Syncobj retrieved from the handle. */
+	struct drm_syncobj *syncobj;
+
+	/**
+	 * @chain: Chain object used to link the new fence with the
+	 *	   existing timeline syncobj.
+	 *
+	 * Should be zero when manipulating a regular syncobj.
+	 */
+	struct dma_fence_chain *chain;
+
+	/**
+	 * @fence: New fence object to attach to the syncobj.
+	 *
+	 * This pointer starts with the current fence bound to
+	 * the <handle,point> pair.
+	 */
+	struct dma_fence *fence;
+};
+
+static void
+pvr_sync_signal_free(struct pvr_sync_signal *sig_sync)
+{
+	if (!sig_sync)
+		return;
+
+	drm_syncobj_put(sig_sync->syncobj);
+	dma_fence_chain_free(sig_sync->chain);
+	dma_fence_put(sig_sync->fence);
+	kfree(sig_sync);
+}
+
+static void
+pvr_sync_signal_array_cleanup(struct xarray *array)
+{
+	struct pvr_sync_signal *sig_sync;
+	unsigned long i;
+
+	xa_for_each(array, i, sig_sync)
+		pvr_sync_signal_free(sig_sync);
+
+	xa_destroy(array);
+}
+
+static struct pvr_sync_signal *
+pvr_sync_signal_array_add(struct xarray *array, struct drm_file *file, u32 handle, u64 point)
+{
+	struct pvr_sync_signal *sig_sync;
+	int err;
+	u32 id;
+
+	sig_sync = kzalloc(sizeof(*sig_sync), GFP_KERNEL);
+	if (!sig_sync)
+		return ERR_PTR(-ENOMEM);
+
+	sig_sync->handle = handle;
+	sig_sync->point = point;
+
+	if (point > 0) {
+		sig_sync->chain = dma_fence_chain_alloc();
+		if (!sig_sync->chain) {
+			err = -ENOMEM;
+			goto err_free_sig_sync;
+		}
+	}
+
+	sig_sync->syncobj = drm_syncobj_find(file, handle);
+	if (!sig_sync->syncobj) {
+		err = -EINVAL;
+		goto err_free_sig_sync;
+	}
+
+	/* Retrieve the current fence attached to that point. It's
+	 * perfectly fine to get a NULL fence here, it just means there's
+	 * no fence attached to that point yet.
+	 */
+	drm_syncobj_find_fence(file, handle, point, 0, &sig_sync->fence);
+
+	err = xa_alloc(array, &id, sig_sync, xa_limit_32b, GFP_KERNEL);
+	if (err)
+		goto err_free_sig_sync;
+
+	return sig_sync;
+
+err_free_sig_sync:
+	pvr_sync_signal_free(sig_sync);
+	return ERR_PTR(err);
+}
+
+static struct pvr_sync_signal *
+pvr_sync_signal_array_search(struct xarray *array, u32 handle, u64 point)
+{
+	struct pvr_sync_signal *sig_sync;
+	unsigned long i;
+
+	xa_for_each(array, i, sig_sync) {
+		if (handle == sig_sync->handle && point == sig_sync->point)
+			return sig_sync;
+	}
+
+	return NULL;
+}
+
+static struct pvr_sync_signal *
+pvr_sync_signal_array_get(struct xarray *array, struct drm_file *file, u32 handle, u64 point)
+{
+	struct pvr_sync_signal *sig_sync;
+
+	sig_sync = pvr_sync_signal_array_search(array, handle, point);
+	if (sig_sync)
+		return sig_sync;
+
+	return pvr_sync_signal_array_add(array, file, handle, point);
+}
+
+static int
+pvr_sync_signal_array_collect_ops(struct xarray *array,
+				  struct drm_file *file,
+				  u32 sync_op_count,
+				  struct drm_pvr_sync_op *sync_ops)
+{
+	for (u32 i = 0; i < sync_op_count; i++) {
+		struct pvr_sync_signal *sig_sync;
+		int ret;
+
+		if (!(sync_ops[i].flags & DRM_PVR_SYNC_OP_FLAG_SIGNAL))
+			continue;
+
+		ret = pvr_check_sync_op(&sync_ops[i]);
+		if (ret)
+			return ret;
+
+		sig_sync = pvr_sync_signal_array_get(array, file,
+						     sync_ops[i].handle,
+						     sync_ops[i].value);
+		if (IS_ERR(sig_sync))
+			return PTR_ERR(sig_sync);
+	}
+
+	return 0;
+}
+
+static int
+pvr_sync_signal_array_update_fences(struct xarray *array,
+				    u32 sync_op_count,
+				    const struct drm_pvr_sync_op *sync_ops,
+				    struct dma_fence *done_fence)
+{
+	for (u32 i = 0; i < sync_op_count; i++) {
+		struct dma_fence *old_fence;
+		struct pvr_sync_signal *sig_sync;
+
+		if (!(sync_ops[i].flags & DRM_PVR_SYNC_OP_FLAG_SIGNAL))
+			continue;
+
+		sig_sync = pvr_sync_signal_array_search(array, sync_ops[i].handle,
+							sync_ops[i].value);
+		if (WARN_ON(!sig_sync))
+			return -EINVAL;
+
+		old_fence = sig_sync->fence;
+		sig_sync->fence = dma_fence_get(done_fence);
+		dma_fence_put(old_fence);
+
+		if (WARN_ON(!sig_sync->fence))
+			return -EINVAL;
+	}
+
+	return 0;
+}
+
+static void
+pvr_sync_signal_array_push_fences(struct xarray *array)
+{
+	struct pvr_sync_signal *sig_sync;
+	unsigned long i;
+
+	xa_for_each(array, i, sig_sync) {
+		if (sig_sync->chain) {
+			drm_syncobj_add_point(sig_sync->syncobj, sig_sync->chain,
+					      sig_sync->fence, sig_sync->point);
+			sig_sync->chain = NULL;
+		} else {
+			drm_syncobj_replace_fence(sig_sync->syncobj, sig_sync->fence);
+		}
+	}
+}
+
+static int
+pvr_job_add_dep(struct pvr_job *job, struct dma_fence *f)
+{
+	struct dma_fence_unwrap iter;
+	u32 native_fence_count = 0;
+	struct dma_fence *uf;
+	int err = 0;
+
+	dma_fence_unwrap_for_each(uf, &iter, f) {
+		if (pvr_queue_fence_is_ufo_backed(uf))
+			native_fence_count++;
+	}
+
+	/* No need to unwrap the fence if it's fully non-native. */
+	if (!native_fence_count)
+		return drm_sched_job_add_dependency(&job->base, f);
+
+	dma_fence_unwrap_for_each(uf, &iter, f) {
+		/* There's no dma_fence_unwrap_stop() helper cleaning up the refs
+		 * owned by dma_fence_unwrap(), so let's just iterate over all
+		 * entries without doing anything when something failed.
+		 */
+		if (err)
+			continue;
+
+		if (pvr_queue_fence_is_ufo_backed(uf)) {
+			struct drm_sched_fence *s_fence = to_drm_sched_fence(uf);
+
+			/* If this is a native dependency, we wait for the scheduled fence,
+			 * and we will let pvr_queue_run_job() issue FW waits.
+			 */
+			err = drm_sched_job_add_dependency(&job->base,
+							   dma_fence_get(&s_fence->scheduled));
+		} else {
+			err = drm_sched_job_add_dependency(&job->base, dma_fence_get(uf));
+		}
+	}
+
+	dma_fence_put(f);
+	return err;
+}
+
+static int
+pvr_job_add_deps(struct pvr_file *pvr_file, struct pvr_job *job,
+		 u32 sync_op_count, const struct drm_pvr_sync_op *sync_ops,
+		 struct xarray *signal_array)
+{
+	int err = 0;
+
+	if (!sync_op_count)
+		return 0;
+
+	for (u32 i = 0; i < sync_op_count; i++) {
+		struct pvr_sync_signal *sig_sync;
+		struct dma_fence *fence;
+
+		if (sync_ops[i].flags & DRM_PVR_SYNC_OP_FLAG_SIGNAL)
+			continue;
+
+		err = pvr_check_sync_op(&sync_ops[i]);
+		if (err)
+			return err;
+
+		sig_sync = pvr_sync_signal_array_search(signal_array, sync_ops[i].handle,
+							sync_ops[i].value);
+		if (sig_sync) {
+			if (WARN_ON(!sig_sync->fence))
+				return -EINVAL;
+
+			fence = dma_fence_get(sig_sync->fence);
+		} else {
+			err = drm_syncobj_find_fence(from_pvr_file(pvr_file), sync_ops[i].handle,
+						     sync_ops[i].value, 0, &fence);
+			if (err)
+				return err;
+		}
+
+		err = pvr_job_add_dep(job, fence);
+		if (err)
+			return err;
+	}
+
+	return 0;
+}
+
+/**
+ * pvr_job_process_stream() - Build job FW structure from stream
+ * @pvr_dev: Device pointer.
+ * @cmd_defs: Stream definition.
+ * @stream: Pointer to command stream.
+ * @stream_size: Size of command stream, in bytes.
+ * @job: Pointer to job.
+ *
+ * Caller is responsible for freeing the output structure.
+ *
+ * Returns:
+ *  * 0 on success,
+ *  * -%ENOMEM on out of memory, or
+ *  * -%EINVAL on malformed stream.
+ */
+static int
+pvr_job_process_stream(struct pvr_device *pvr_dev, const struct pvr_stream_cmd_defs *cmd_defs,
+		       void *stream, u32 stream_size, struct pvr_job *job)
+{
+	int err;
+
+	job->cmd = kzalloc(cmd_defs->dest_size, GFP_KERNEL);
+	if (!job->cmd) {
+		err = -ENOMEM;
+		goto err_out;
+	}
+
+	job->cmd_len = cmd_defs->dest_size;
+
+	err = pvr_stream_process(pvr_dev, cmd_defs, stream, stream_size, job->cmd);
+	if (err)
+		kfree(job->cmd);
+
+err_out:
+	return err;
+}
+
+static int pvr_fw_cmd_init(struct pvr_device *pvr_dev, struct pvr_job *job,
+			   const struct pvr_stream_cmd_defs *stream_def,
+			   u64 stream_userptr, u32 stream_len)
+{
+	void *stream;
+	int err;
+
+	stream = kzalloc(stream_len, GFP_KERNEL);
+	if (!stream) {
+		err = -ENOMEM;
+		goto err_out;
+	}
+
+	if (copy_from_user(stream, u64_to_user_ptr(stream_userptr), stream_len)) {
+		err = -EFAULT;
+		goto err_free_stream;
+	}
+
+	err = pvr_job_process_stream(pvr_dev, stream_def, stream, stream_len, job);
+
+err_free_stream:
+	kfree(stream);
+
+err_out:
+	return err;
+}
+
+static u32
+convert_geom_flags(u32 in_flags)
+{
+	u32 out_flags = 0;
+
+	if (in_flags & DRM_PVR_SUBMIT_JOB_GEOM_CMD_FIRST)
+		out_flags |= ROGUE_GEOM_FLAGS_FIRSTKICK;
+	if (in_flags & DRM_PVR_SUBMIT_JOB_GEOM_CMD_LAST)
+		out_flags |= ROGUE_GEOM_FLAGS_LASTKICK;
+	if (in_flags & DRM_PVR_SUBMIT_JOB_GEOM_CMD_SINGLE_CORE)
+		out_flags |= ROGUE_GEOM_FLAGS_SINGLE_CORE;
+
+	return out_flags;
+}
+
+static u32
+convert_frag_flags(u32 in_flags)
+{
+	u32 out_flags = 0;
+
+	if (in_flags & DRM_PVR_SUBMIT_JOB_FRAG_CMD_SINGLE_CORE)
+		out_flags |= ROGUE_FRAG_FLAGS_SINGLE_CORE;
+	if (in_flags & DRM_PVR_SUBMIT_JOB_FRAG_CMD_DEPTHBUFFER)
+		out_flags |= ROGUE_FRAG_FLAGS_DEPTHBUFFER;
+	if (in_flags & DRM_PVR_SUBMIT_JOB_FRAG_CMD_STENCILBUFFER)
+		out_flags |= ROGUE_FRAG_FLAGS_STENCILBUFFER;
+	if (in_flags & DRM_PVR_SUBMIT_JOB_FRAG_CMD_PREVENT_CDM_OVERLAP)
+		out_flags |= ROGUE_FRAG_FLAGS_PREVENT_CDM_OVERLAP;
+	if (in_flags & DRM_PVR_SUBMIT_JOB_FRAG_CMD_GET_VIS_RESULTS)
+		out_flags |= ROGUE_FRAG_FLAGS_GET_VIS_RESULTS;
+
+	return out_flags;
+}
+
+static int
+pvr_geom_job_fw_cmd_init(struct pvr_job *job,
+			 struct drm_pvr_job *args)
+{
+	struct rogue_fwif_cmd_geom *cmd;
+	int err;
+
+	if (args->flags & ~DRM_PVR_SUBMIT_JOB_GEOM_CMD_FLAGS_MASK)
+		return -EINVAL;
+
+	if (job->ctx->type != DRM_PVR_CTX_TYPE_RENDER)
+		return -EINVAL;
+
+	if (!job->hwrt)
+		return -EINVAL;
+
+	job->fw_ccb_cmd_type = ROGUE_FWIF_CCB_CMD_TYPE_GEOM;
+	err = pvr_fw_cmd_init(job->pvr_dev, job, &pvr_cmd_geom_stream,
+			      args->cmd_stream, args->cmd_stream_len);
+	if (err)
+		return err;
+
+	cmd = job->cmd;
+	cmd->cmd_shared.cmn.frame_num = 0;
+	cmd->flags = convert_geom_flags(args->flags);
+	pvr_fw_object_get_fw_addr(job->hwrt->fw_obj, &cmd->cmd_shared.hwrt_data_fw_addr);
+	return 0;
+}
+
+static int
+pvr_frag_job_fw_cmd_init(struct pvr_job *job,
+			 struct drm_pvr_job *args)
+{
+	struct rogue_fwif_cmd_frag *cmd;
+	int err;
+
+	if (args->flags & ~DRM_PVR_SUBMIT_JOB_FRAG_CMD_FLAGS_MASK)
+		return -EINVAL;
+
+	if (job->ctx->type != DRM_PVR_CTX_TYPE_RENDER)
+		return -EINVAL;
+
+	if (!job->hwrt)
+		return -EINVAL;
+
+	job->fw_ccb_cmd_type = ROGUE_FWIF_CCB_CMD_TYPE_FRAG;
+	err = pvr_fw_cmd_init(job->pvr_dev, job, &pvr_cmd_frag_stream,
+			      args->cmd_stream, args->cmd_stream_len);
+	if (err)
+		return err;
+
+	cmd = job->cmd;
+	cmd->cmd_shared.cmn.frame_num = 0;
+	cmd->flags = convert_frag_flags(args->flags);
+	pvr_fw_object_get_fw_addr(job->hwrt->fw_obj, &cmd->cmd_shared.hwrt_data_fw_addr);
+	return 0;
+}
+
+static u32
+convert_compute_flags(u32 in_flags)
+{
+	u32 out_flags = 0;
+
+	if (in_flags & DRM_PVR_SUBMIT_JOB_COMPUTE_CMD_PREVENT_ALL_OVERLAP)
+		out_flags |= ROGUE_COMPUTE_FLAG_PREVENT_ALL_OVERLAP;
+	if (in_flags & DRM_PVR_SUBMIT_JOB_COMPUTE_CMD_SINGLE_CORE)
+		out_flags |= ROGUE_COMPUTE_FLAG_SINGLE_CORE;
+
+	return out_flags;
+}
+
+static int
+pvr_compute_job_fw_cmd_init(struct pvr_job *job,
+			    struct drm_pvr_job *args)
+{
+	struct rogue_fwif_cmd_compute *cmd;
+	int err;
+
+	if (args->flags & ~DRM_PVR_SUBMIT_JOB_COMPUTE_CMD_FLAGS_MASK)
+		return -EINVAL;
+
+	if (job->ctx->type != DRM_PVR_CTX_TYPE_COMPUTE)
+		return -EINVAL;
+
+	job->fw_ccb_cmd_type = ROGUE_FWIF_CCB_CMD_TYPE_CDM;
+	err = pvr_fw_cmd_init(job->pvr_dev, job, &pvr_cmd_compute_stream,
+			      args->cmd_stream, args->cmd_stream_len);
+	if (err)
+		return err;
+
+	cmd = job->cmd;
+	cmd->common.frame_num = 0;
+	cmd->flags = convert_compute_flags(args->flags);
+	return 0;
+}
+
+static u32
+convert_transfer_flags(u32 in_flags)
+{
+	u32 out_flags = 0;
+
+	if (in_flags & DRM_PVR_SUBMIT_JOB_TRANSFER_CMD_SINGLE_CORE)
+		out_flags |= ROGUE_TRANSFER_FLAGS_SINGLE_CORE;
+
+	return out_flags;
+}
+
+static int
+pvr_transfer_job_fw_cmd_init(struct pvr_job *job,
+			     struct drm_pvr_job *args)
+{
+	struct rogue_fwif_cmd_transfer *cmd;
+	int err;
+
+	if (args->flags & ~DRM_PVR_SUBMIT_JOB_TRANSFER_CMD_FLAGS_MASK)
+		return -EINVAL;
+
+	if (job->ctx->type != DRM_PVR_CTX_TYPE_TRANSFER_FRAG)
+		return -EINVAL;
+
+	job->fw_ccb_cmd_type = ROGUE_FWIF_CCB_CMD_TYPE_TQ_3D;
+	err = pvr_fw_cmd_init(job->pvr_dev, job, &pvr_cmd_transfer_stream,
+			      args->cmd_stream, args->cmd_stream_len);
+	if (err)
+		return err;
+
+	cmd = job->cmd;
+	cmd->common.frame_num = 0;
+	cmd->flags = convert_transfer_flags(args->flags);
+	return 0;
+}
+
+static int
+pvr_job_fw_cmd_init(struct pvr_job *job,
+		    struct drm_pvr_job *args)
+{
+	switch (args->type) {
+	case DRM_PVR_JOB_TYPE_GEOMETRY:
+		return pvr_geom_job_fw_cmd_init(job, args);
+
+	case DRM_PVR_JOB_TYPE_FRAGMENT:
+		return pvr_frag_job_fw_cmd_init(job, args);
+
+	case DRM_PVR_JOB_TYPE_COMPUTE:
+		return pvr_compute_job_fw_cmd_init(job, args);
+
+	case DRM_PVR_JOB_TYPE_TRANSFER_FRAG:
+		return pvr_transfer_job_fw_cmd_init(job, args);
+
+	default:
+		return -EINVAL;
+	}
+}
+
+static struct pvr_job *
+pvr_create_job(struct pvr_device *pvr_dev,
+	       struct pvr_file *pvr_file,
+	       struct drm_pvr_job *args,
+	       struct xarray *signal_array)
+{
+	struct drm_pvr_sync_op *sync_ops = NULL;
+	struct dma_fence *done_fence;
+	struct pvr_job *job = NULL;
+	int err;
+
+	if (!args->cmd_stream || !args->cmd_stream_len)
+		return ERR_PTR(-EINVAL);
+
+	if (args->type != DRM_PVR_JOB_TYPE_GEOMETRY &&
+	    args->type != DRM_PVR_JOB_TYPE_FRAGMENT &&
+	    (args->hwrt.set_handle || args->hwrt.data_index))
+		return ERR_PTR(-EINVAL);
+
+	job = kzalloc(sizeof(*job), GFP_KERNEL);
+	if (!job)
+		return ERR_PTR(-ENOMEM);
+
+	kref_init(&job->ref_count);
+	job->type = args->type;
+	job->pvr_dev = pvr_dev;
+
+	err = xa_alloc(&pvr_dev->job_ids, &job->id, job, xa_limit_32b, GFP_KERNEL);
+	if (err)
+		goto err_put_job;
+
+	err = PVR_UOBJ_GET_ARRAY(sync_ops, &args->sync_ops);
+	if (err)
+		goto err_put_job;
+
+	err = pvr_sync_signal_array_collect_ops(signal_array, from_pvr_file(pvr_file),
+						args->sync_ops.count, sync_ops);
+	if (err)
+		goto err_put_job;
+
+	job->ctx = pvr_context_lookup(pvr_file, args->context_handle);
+	if (!job->ctx) {
+		err = -EINVAL;
+		goto err_put_job;
+	}
+
+	if (args->hwrt.set_handle) {
+		job->hwrt = pvr_hwrt_data_lookup(pvr_file, args->hwrt.set_handle,
+						 args->hwrt.data_index);
+		if (!job->hwrt) {
+			err = -EINVAL;
+			goto err_put_job;
+		}
+	}
+
+	err = pvr_job_fw_cmd_init(job, args);
+	if (err)
+		goto err_put_job;
+
+	err = pvr_queue_job_init(job);
+	if (err)
+		goto err_put_job;
+
+	err = pvr_job_add_deps(pvr_file, job, args->sync_ops.count, sync_ops, signal_array);
+	if (err)
+		goto err_put_job;
+
+	/* We need to arm the job to get the job done fence. */
+	done_fence = pvr_queue_job_arm(job);
+
+	err = pvr_sync_signal_array_update_fences(signal_array,
+						  args->sync_ops.count, sync_ops,
+						  done_fence);
+	if (err)
+		goto err_put_job;
+
+	kvfree(sync_ops);
+	return job;
+
+err_put_job:
+	kvfree(sync_ops);
+	pvr_job_put(job);
+	return ERR_PTR(err);
+}
+
+/**
+ * pvr_submit_jobs() - Submit jobs to the GPU
+ * @pvr_dev: Target PowerVR device.
+ * @pvr_file: Pointer to PowerVR file structure.
+ * @args: IOCTL arguments.
+ *
+ * This initial implementation is entirely synchronous; on return the GPU will
+ * be idle. This will not be the case for future implementations.
+ *
+ * Returns:
+ *  * 0 on success,
+ *  * -%EFAULT if arguments can not be copied from user space,
+ *  * -%EINVAL on invalid arguments, or
+ *  * Any other error.
+ */
+int
+pvr_submit_jobs(struct pvr_device *pvr_dev,
+		struct pvr_file *pvr_file,
+		struct drm_pvr_ioctl_submit_jobs_args *args)
+{
+	struct drm_pvr_job *jobs_args = NULL;
+	DEFINE_XARRAY_ALLOC(signal_array);
+	struct pvr_job **jobs = NULL;
+	int err;
+
+	if (!args->jobs.count)
+		return -EINVAL;
+
+	err = PVR_UOBJ_GET_ARRAY(jobs_args, &args->jobs);
+	if (err)
+		return err;
+
+	/* NOLINTNEXTLINE(bugprone-sizeof-expression) */
+	jobs = kvmalloc_array(args->jobs.count, sizeof(*jobs), GFP_KERNEL | __GFP_ZERO);
+	if (!jobs) {
+		err = -ENOMEM;
+		goto out_free_jobs_args;
+	}
+
+	/* FIXME: We should probably not serialize things at the file level,
+	 * because that means we prevent parallel submission on separate VkQueue
+	 * objects. This mean this lock should go away and be replaced by
+	 * something better.
+	 *
+	 * I see several options here:
+	 *
+	 * 1. We try to lock all queues being targeted by jobs in the job array
+	 *    passed to SUBMIT_JOBS before actually submitting the jobs. This
+	 *    requires using ww_mutexes and making the right thing when DEADLCK
+	 *    is reported. Note that we don't have to implement our own ww_class,
+	 *    we can just use the dma_resv object attached to the FW context
+	 *    object (pvr_fw_object->gem->base.base.resv).
+	 *    This is a bit convoluted, but I fear we'll have to deal with resv
+	 *    objects at some point anyway, even if our driver is explicit-sync
+	 *    only (needed if we want to implement memory reclaim).
+	 * 2. We group FW contexts into a higher-level abstract matching exactly
+	 *    the VkQueue object (we could call those submit contexts) which can
+	 *    have several ctx (they currently have four, one gfx, one compute,
+	 *    another compute for queries and a transfer context). This approach
+	 *    has several advantages: we could make sure the multi-job submission
+	 *    only targets a single target submit-context (it doesn't make sense
+	 *    to do a multi-job submission on contexts that are not part of the
+	 *    same VkQueue), and we get a single lock we can acquire to protect
+	 *    access to the queues being targeted by the SUBMIT_JOBS request.
+	 *    There's basically 2 ways to implement that:
+	 *    A. Rework the CREATE_CONTEXT ioctls so they create those high-level
+	 *       submit contexts containing N FW contexts, each of them being
+	 *       assigned an index that's directly matching the position of the
+	 *       FW context creation args in the
+	 *       pvr_create_submit_context::sub_ctxs array
+	 *       (pvr_create_submit_context is the new struct taking an array
+	 *       of FW context to attach to the submit context). We also need
+	 *       to rework the SUBMIT_JOBS ioctl so it get passed a submit context
+	 *       handle, and each job is passed the index of the FW context in
+	 *       the submit context.
+	 *       This also implies reworking the mesa winsys abstraction to
+	 *       expose the concept of vk_queue to the winsys and let winsys
+	 *       implementation create high-level submit contexts instead of
+	 *       asking them to create each FW context independently.
+	 *    B. Add 2 new {CREATE,DESTROY}_SUBMIT_CONTEXT ioctls, creating
+	 *       those high-level submission contexts, and extend CREATE_CONTEXT
+	 *       so it can be passed a submit context handle (if one only wants
+	 *       to create an independent FW context, it can just pass a zero
+	 *       handle). In the SUBMIT_JOBS path, we iterate over all jobs and
+	 *       make sure the contexts they're targeting are part of the same
+	 *       submit context, if not, we fail. Once we've done that, we have
+	 *       a single lock (attached to the submit context) we can acquire
+	 *       to push job to the pvr_queues.
+	 *
+	 * From a design standpoint, I tend to prefer option 2A., because we
+	 * make submit contexts a first class citizen that matches how Vulkan is
+	 * going to use the API, rather than trying to retrofit it to original
+	 * model. But it's also the most invasive of all options.
+	 *
+	 * Option 1. might be interesting to look at, so we get things in shape
+	 * for the next step: dealing with mem-reclaim in a sane way, adding job
+	 * out fences to the VM resv and all external BOs, such that the
+	 * memory is guaranteed to be pinned/mapped when the job is being
+	 * executed by the GPU. But I like the idea of restricting multi-job
+	 * submission to jobs targeting pvr_queues that are part of the same
+	 * VkQueue, and this solution doesn't allow that grouping.
+	 */
+	mutex_lock(&pvr_file->submit_lock);
+
+	for (u32 i = 0; i < args->jobs.count; i++) {
+		jobs[i] = pvr_create_job(pvr_dev, pvr_file, &jobs_args[i], &signal_array);
+		if (IS_ERR(jobs[i])) {
+			err = PTR_ERR(jobs[i]);
+			jobs[i] = NULL;
+			goto out_submit_unlock;
+		}
+	}
+
+	for (u32 i = 0; i < args->jobs.count; i++)
+		pvr_queue_job_push(jobs[i]);
+
+	pvr_sync_signal_array_push_fences(&signal_array);
+	err = 0;
+
+out_submit_unlock:
+	mutex_unlock(&pvr_file->submit_lock);
+
+	for (u32 i = 0; i < args->jobs.count; i++)
+		pvr_job_put(jobs[i]);
+
+	kvfree(jobs);
+
+out_free_jobs_args:
+	pvr_sync_signal_array_cleanup(&signal_array);
+	return err;
+}
diff --git a/drivers/gpu/drm/imagination/pvr_job.h b/drivers/gpu/drm/imagination/pvr_job.h
new file mode 100644
index 000000000000..582854875009
--- /dev/null
+++ b/drivers/gpu/drm/imagination/pvr_job.h
@@ -0,0 +1,147 @@
+/* SPDX-License-Identifier: GPL-2.0 OR MIT */
+/* Copyright (c) 2022 Imagination Technologies Ltd. */
+
+#ifndef PVR_JOB_H
+#define PVR_JOB_H
+
+#include <uapi/drm/pvr_drm.h>
+
+#include <linux/kref.h>
+#include <linux/types.h>
+
+#include <drm/drm_gem.h>
+#include <drm/gpu_scheduler.h>
+
+#include "pvr_power.h"
+
+/* Forward declaration from "pvr_context.h". */
+struct pvr_context;
+
+/* Forward declarations from "pvr_device.h". */
+struct pvr_device;
+struct pvr_file;
+
+/* Forward declarations from "pvr_hwrt.h". */
+struct pvr_hwrt_data;
+
+/* Forward declaration from "pvr_queue.h". */
+struct pvr_queue;
+
+struct pvr_job {
+	/** @base: drm_sched_job object. */
+	struct drm_sched_job base;
+
+	/** @ref_count: Refcount for job. */
+	struct kref ref_count;
+
+	/** @type: Type of job. */
+	enum drm_pvr_job_type type;
+
+	/** @id: Job ID number. */
+	u32 id;
+
+	/** @cccb_fence: Fence used to wait for CCCB space. */
+	struct dma_fence *cccb_fence;
+
+	/** @kccb_fence: Fence used to wait for KCCB space. */
+	struct dma_fence *kccb_fence;
+
+	/** @done_fence: Fence to signal when the job is done. */
+	struct dma_fence *done_fence;
+
+	/** @pvr_dev: Device pointer. */
+	struct pvr_device *pvr_dev;
+
+	/** @ctx: Pointer to owning context. */
+	struct pvr_context *ctx;
+
+	/** @cmd: Command data. Format depends on @type. */
+	void *cmd;
+
+	/** @cmd_len: Length of command data, in bytes. */
+	u32 cmd_len;
+
+	/**
+	 * @fw_ccb_cmd_type: Firmware CCB command type. Must be one of %ROGUE_FWIF_CCB_CMD_TYPE_*.
+	 */
+	u32 fw_ccb_cmd_type;
+
+	/** @hwrt: HWRT object. Will be NULL for compute and transfer jobs. */
+	struct pvr_hwrt_data *hwrt;
+
+	/**
+	 * @has_pm_ref: True if the job has a power ref, thus forcing the GPU to stay on until
+	 * the job is done.
+	 */
+	bool has_pm_ref;
+};
+
+/**
+ * pvr_job_get() - Take additional reference on job.
+ * @job: Job pointer.
+ *
+ * Call pvr_job_put() to release.
+ *
+ * Returns:
+ *  * The requested job on success, or
+ *  * %NULL if no job pointer passed.
+ */
+static __always_inline struct pvr_job *
+pvr_job_get(struct pvr_job *job)
+{
+	if (job)
+		kref_get(&job->ref_count);
+
+	return job;
+}
+
+void pvr_job_put(struct pvr_job *job);
+
+/**
+ * pvr_job_release_pm_ref() - Release the PM ref if the job acquired it.
+ * @job: The job to release the PM ref on.
+ */
+static __always_inline void
+pvr_job_release_pm_ref(struct pvr_job *job)
+{
+	if (job->has_pm_ref) {
+		pvr_power_put(job->pvr_dev);
+		job->has_pm_ref = false;
+	}
+}
+
+/**
+ * pvr_job_get_pm_ref() - Get a PM ref and attach it to the job.
+ * @job: The job to attach the PM ref to.
+ *
+ * Return:
+ *  * 0 on success, or
+ *  * Any error returned by pvr_power_get() otherwise.
+ */
+static __always_inline int
+pvr_job_get_pm_ref(struct pvr_job *job)
+{
+	int err;
+
+	if (job->has_pm_ref)
+		return 0;
+
+	err = pvr_power_get(job->pvr_dev);
+	if (!err)
+		job->has_pm_ref = true;
+
+	return err;
+}
+
+int pvr_job_wait_first_non_signaled_native_dep(struct pvr_job *job);
+
+bool pvr_job_non_native_deps_done(struct pvr_job *job);
+
+int pvr_job_fits_in_cccb(struct pvr_job *job, unsigned long native_dep_count);
+
+void pvr_job_submit(struct pvr_job *job);
+
+int pvr_submit_jobs(struct pvr_device *pvr_dev, struct pvr_file *pvr_file,
+		    struct drm_pvr_ioctl_submit_jobs_args *args);
+
+#endif /* PVR_JOB_H */
diff --git a/drivers/gpu/drm/imagination/pvr_power.c b/drivers/gpu/drm/imagination/pvr_power.c
index 309148cf7d08..1c30117a97ca 100644
--- a/drivers/gpu/drm/imagination/pvr_power.c
+++ b/drivers/gpu/drm/imagination/pvr_power.c
@@ -150,6 +150,23 @@ pvr_watchdog_kccb_stalled(struct pvr_device *pvr_dev)
 		 */
 		if (pvr_dev->watchdog.kccb_stall_count == 2)
 			return true;
+	} else if (pvr_dev->watchdog.old_kccb_cmds_executed == kccb_cmds_executed) {
+		bool has_active_contexts;
+
+		mutex_lock(&pvr_dev->queues.lock);
+		has_active_contexts = list_empty(&pvr_dev->queues.active);
+		mutex_unlock(&pvr_dev->queues.lock);
+
+		if (has_active_contexts) {
+			/* Send a HEALTH_CHECK command so we can verify FW is still alive. */
+			struct rogue_fwif_kccb_cmd health_check_cmd;
+
+			health_check_cmd.cmd_type = ROGUE_FWIF_KCCB_CMD_HEALTH_CHECK;
+
+			pvr_kccb_send_cmd_powered(pvr_dev, &health_check_cmd, NULL);
+		}
+
+		pvr_dev->watchdog.kccb_stall_count = 0;
 	} else {
 		pvr_dev->watchdog.old_kccb_cmds_executed = kccb_cmds_executed;
 		pvr_dev->watchdog.kccb_stall_count = 0;
diff --git a/drivers/gpu/drm/imagination/pvr_queue.c b/drivers/gpu/drm/imagination/pvr_queue.c
new file mode 100644
index 000000000000..4a03d6756dde
--- /dev/null
+++ b/drivers/gpu/drm/imagination/pvr_queue.c
@@ -0,0 +1,1203 @@
+// SPDX-License-Identifier: GPL-2.0 OR MIT
+/* Copyright (c) 2022 Imagination Technologies Ltd. */
+
+#include <drm/drm_managed.h>
+#include <drm/gpu_scheduler.h>
+
+#include "pvr_cccb.h"
+#include "pvr_context.h"
+#include "pvr_device.h"
+#include "pvr_drv.h"
+#include "pvr_job.h"
+#include "pvr_queue.h"
+#include "pvr_vm.h"
+
+#define MAX_DEADLINE_MS 30000
+
+#define CTX_COMPUTE_CCCB_SIZE_LOG2 15
+#define CTX_FRAG_CCCB_SIZE_LOG2 15
+#define CTX_GEOM_CCCB_SIZE_LOG2 15
+#define CTX_TRANSFER_CCCB_SIZE_LOG2 15
+
+static int get_xfer_ctx_state_size(struct pvr_device *pvr_dev)
+{
+	u32 num_isp_store_registers;
+
+	if (PVR_HAS_FEATURE(pvr_dev, xe_memory_hierarchy)) {
+		num_isp_store_registers = 1;
+	} else {
+		int err;
+
+		err = PVR_FEATURE_VALUE(pvr_dev, num_isp_ipp_pipes, &num_isp_store_registers);
+		if (WARN_ON(err))
+			return err;
+	}
+
+	return sizeof(struct rogue_fwif_frag_ctx_state) +
+	       (num_isp_store_registers *
+		sizeof(((struct rogue_fwif_frag_ctx_state *)0)->frag_reg_isp_store[0]));
+}
+
+static int get_frag_ctx_state_size(struct pvr_device *pvr_dev)
+{
+	u32 num_isp_store_registers;
+	int err;
+
+	if (PVR_HAS_FEATURE(pvr_dev, xe_memory_hierarchy)) {
+		err = PVR_FEATURE_VALUE(pvr_dev, num_raster_pipes, &num_isp_store_registers);
+		if (WARN_ON(err))
+			return err;
+
+		if (PVR_HAS_FEATURE(pvr_dev, gpu_multicore_support)) {
+			u32 xpu_max_slaves;
+
+			err = PVR_FEATURE_VALUE(pvr_dev, xpu_max_slaves, &xpu_max_slaves);
+			if (WARN_ON(err))
+				return err;
+
+			num_isp_store_registers *= (1 + xpu_max_slaves);
+		}
+	} else {
+		err = PVR_FEATURE_VALUE(pvr_dev, num_isp_ipp_pipes, &num_isp_store_registers);
+		if (WARN_ON(err))
+			return err;
+	}
+
+	return sizeof(struct rogue_fwif_frag_ctx_state) +
+	       (num_isp_store_registers *
+		sizeof(((struct rogue_fwif_frag_ctx_state *)0)->frag_reg_isp_store[0]));
+}
+
+static int get_ctx_state_size(struct pvr_device *pvr_dev, enum drm_pvr_job_type type)
+{
+	switch (type) {
+	case DRM_PVR_JOB_TYPE_GEOMETRY:
+		return sizeof(struct rogue_fwif_geom_ctx_state);
+	case DRM_PVR_JOB_TYPE_FRAGMENT:
+		return get_frag_ctx_state_size(pvr_dev);
+	case DRM_PVR_JOB_TYPE_COMPUTE:
+		return sizeof(struct rogue_fwif_compute_ctx_state);
+	case DRM_PVR_JOB_TYPE_TRANSFER_FRAG:
+		return get_xfer_ctx_state_size(pvr_dev);
+	}
+
+	WARN(1, "Invalid queue type");
+	return -EINVAL;
+}
+
+static u32 get_ctx_offset(enum drm_pvr_job_type type)
+{
+	switch (type) {
+	case DRM_PVR_JOB_TYPE_GEOMETRY:
+		return offsetof(struct rogue_fwif_fwrendercontext, geom_context);
+	case DRM_PVR_JOB_TYPE_FRAGMENT:
+		return offsetof(struct rogue_fwif_fwrendercontext, frag_context);
+	case DRM_PVR_JOB_TYPE_COMPUTE:
+		return offsetof(struct rogue_fwif_fwcomputecontext, cdm_context);
+	case DRM_PVR_JOB_TYPE_TRANSFER_FRAG:
+		return offsetof(struct rogue_fwif_fwtransfercontext, tq_context);
+	}
+
+	return 0;
+}
+
+static const char *
+pvr_queue_fence_get_driver_name(struct dma_fence *f)
+{
+	return PVR_DRIVER_NAME;
+}
+
+static const char *
+pvr_queue_job_fence_get_timeline_name(struct dma_fence *f)
+{
+	struct pvr_queue_fence *fence = container_of(f, struct pvr_queue_fence, base);
+
+	switch (fence->queue->type) {
+	case DRM_PVR_JOB_TYPE_GEOMETRY:
+		return "geometry";
+
+	case DRM_PVR_JOB_TYPE_FRAGMENT:
+		return "fragment";
+
+	case DRM_PVR_JOB_TYPE_COMPUTE:
+		return "compute";
+
+	case DRM_PVR_JOB_TYPE_TRANSFER_FRAG:
+		return "transfer";
+	}
+
+	WARN(1, "Invalid queue type");
+	return "invalid";
+}
+
+static const char *
+pvr_queue_cccb_fence_get_timeline_name(struct dma_fence *f)
+{
+	struct pvr_queue_fence *fence = container_of(f, struct pvr_queue_fence, base);
+
+	switch (fence->queue->type) {
+	case DRM_PVR_JOB_TYPE_GEOMETRY:
+		return "geometry-cccb";
+
+	case DRM_PVR_JOB_TYPE_FRAGMENT:
+		return "fragment-cccb";
+
+	case DRM_PVR_JOB_TYPE_COMPUTE:
+		return "compute-cccb";
+
+	case DRM_PVR_JOB_TYPE_TRANSFER_FRAG:
+		return "transfer-cccb";
+	}
+
+	WARN(1, "Invalid queue type");
+	return "invalid";
+}
+
+static const struct dma_fence_ops pvr_queue_job_fence_ops = {
+	.get_driver_name = pvr_queue_fence_get_driver_name,
+	.get_timeline_name = pvr_queue_job_fence_get_timeline_name,
+};
+
+/**
+ * to_pvr_queue_job_fence() - Return a pvr_queue_fence object if the fence is
+ * backed by a UFO.
+ * @f: The dma_fence to turn into a pvr_queue_fence.
+ *
+ * Return:
+ *  * A non-NULL pvr_queue_fence object if the dma_fence is backed by a UFO, or
+ *  * NULL otherwise.
+ */
+static struct pvr_queue_fence *
+to_pvr_queue_job_fence(struct dma_fence *f)
+{
+	struct drm_sched_fence *sched_fence = to_drm_sched_fence(f);
+
+	if (sched_fence)
+		f = sched_fence->parent;
+
+	if (f && f->ops == &pvr_queue_job_fence_ops)
+		return container_of(f, struct pvr_queue_fence, base);
+
+	return NULL;
+}
+
+static const struct dma_fence_ops pvr_queue_cccb_fence_ops = {
+	.get_driver_name = pvr_queue_fence_get_driver_name,
+	.get_timeline_name = pvr_queue_cccb_fence_get_timeline_name,
+};
+
+/**
+ * pvr_queue_fence_put() - Put wrapper for pvr_queue_fence objects.
+ * @f: The dma_fence object to put.
+ *
+ * If the pvr_queue_fence has been initialized, we call dma_fence_put(),
+ * otherwise we free the object with dma_fence_free(). This allows us
+ * to do the right thing before and after pvr_queue_fence_init() had been
+ * called.
+ */
+static void pvr_queue_fence_put(struct dma_fence *f)
+{
+	if (!f)
+		return;
+
+	if (WARN_ON(f->ops &&
+		    f->ops != &pvr_queue_cccb_fence_ops &&
+		    f->ops != &pvr_queue_job_fence_ops))
+		return;
+
+	/* If the fence hasn't been initialized yet, free the object directly. */
+	if (f->ops)
+		dma_fence_put(f);
+	else
+		dma_fence_free(f);
+}
+
+/**
+ * pvr_queue_fence_alloc() - Allocate a pvr_queue_fence fence object
+ *
+ * Call this function to allocate job CCCB and done fences. This only
+ * allocates the objects. Initialization happens when the underlying
+ * dma_fence object is to be returned to drm_sched (in prepare_job() or
+ * run_job()).
+ *
+ * Return:
+ *  * A valid pointer if the allocation succeeds, or
+ *  * NULL if the allocation fails.
+ */
+static struct dma_fence *
+pvr_queue_fence_alloc(void)
+{
+	struct pvr_queue_fence *fence;
+
+	fence = kzalloc(sizeof(*fence), GFP_KERNEL);
+	if (!fence)
+		return NULL;
+
+	return &fence->base;
+}
+
+/**
+ * pvr_queue_fence_init() - Initializes a pvr_queue_fence object.
+ * @f: The fence to initialize
+ * @queue: The queue this fence belongs to.
+ * @fence_ops: The fence operations.
+ * @fence_ctx: The fence context.
+ *
+ * Wrapper around dma_fence_init() that takes care of initializing the
+ * pvr_queue_fence::queue field too.
+ */
+static void
+pvr_queue_fence_init(struct dma_fence *f,
+		     struct pvr_queue *queue,
+		     const struct dma_fence_ops *fence_ops,
+		     struct pvr_queue_fence_ctx *fence_ctx)
+{
+	struct pvr_queue_fence *fence = container_of(f, struct pvr_queue_fence, base);
+
+	fence->queue = queue;
+	dma_fence_init(&fence->base, fence_ops,
+		       &fence_ctx->lock, fence_ctx->id,
+		       atomic_inc_return(&fence_ctx->seqno));
+}
+
+/**
+ * pvr_queue_cccb_fence_init() - Initializes a CCCB fence object.
+ * @fence: The fence to initialize.
+ * @queue: The queue this fence belongs to.
+ *
+ * Initializes a fence that can be used to wait for CCCB space.
+ *
+ * Should be called in the ::prepare_job() path, so the fence returned to
+ * drm_sched is valid.
+ */
+static void
+pvr_queue_cccb_fence_init(struct dma_fence *fence, struct pvr_queue *queue)
+{
+	pvr_queue_fence_init(fence, queue, &pvr_queue_cccb_fence_ops,
+			     &queue->cccb_fence_ctx.base);
+}
+
+/**
+ * pvr_queue_job_fence_init() - Initializes a job done fence object.
+ * @fence: The fence to initialize.
+ * @queue: The queue this fence belongs to.
+ *
+ * Initializes a fence that will be signaled when the GPU is done executing
+ * a job.
+ *
+ * Should be called in the ::run_job() path, so the fence returned to drm_sched
+ * is valid.
+ */
+static void
+pvr_queue_job_fence_init(struct dma_fence *fence, struct pvr_queue *queue)
+{
+	pvr_queue_fence_init(fence, queue, &pvr_queue_job_fence_ops,
+			     &queue->job_fence_ctx);
+}
+
+/**
+ * pvr_queue_fence_ctx_init() - Queue fence context initialization.
+ * @fence_ctx: The context to initialize
+ */
+static void
+pvr_queue_fence_ctx_init(struct pvr_queue_fence_ctx *fence_ctx)
+{
+	spin_lock_init(&fence_ctx->lock);
+	fence_ctx->id = dma_fence_context_alloc(1);
+	atomic_set(&fence_ctx->seqno, 0);
+}
+
+static u32 ufo_cmds_size(u32 elem_count)
+{
+	/* We can pass at most ROGUE_FWIF_CCB_CMD_MAX_UFOS per UFO-related command. */
+	u32 full_cmd_count = elem_count / ROGUE_FWIF_CCB_CMD_MAX_UFOS;
+	u32 remaining_elems = elem_count % ROGUE_FWIF_CCB_CMD_MAX_UFOS;
+	u32 size = full_cmd_count *
+		   pvr_cccb_get_size_of_cmd_with_hdr(ROGUE_FWIF_CCB_CMD_MAX_UFOS *
+						     sizeof(struct rogue_fwif_ufo));
+
+	if (remaining_elems) {
+		size += pvr_cccb_get_size_of_cmd_with_hdr(remaining_elems *
+							  sizeof(struct rogue_fwif_ufo));
+	}
+
+	return size;
+}
+
+static u32 job_cmds_size(struct pvr_job *job, u32 ufo_wait_count)
+{
+	/* One UFO cmd for the fence signaling, one UFO cmd per native fence native,
+	 * and a command for the job itself.
+	 */
+	return ufo_cmds_size(1) + ufo_cmds_size(ufo_wait_count) +
+	       pvr_cccb_get_size_of_cmd_with_hdr(job->cmd_len);
+}
+
+/**
+ * job_count_remaining_native_deps() - Count the number of non-signaled native dependencies.
+ * @job: Job to operate on.
+ *
+ * Returns: Number of non-signaled native deps remaining.
+ */
+static unsigned long job_count_remaining_native_deps(struct pvr_job *job)
+{
+	unsigned long remaining_count = 0;
+	struct dma_fence *fence = NULL;
+	unsigned long index;
+
+	xa_for_each(&job->base.dependencies, index, fence) {
+		struct pvr_queue_fence *jfence;
+
+		jfence = to_pvr_queue_job_fence(fence);
+		if (!jfence)
+			continue;
+
+		if (!dma_fence_is_signaled(&jfence->base))
+			remaining_count++;
+	}
+
+	return remaining_count;
+}
+
+/**
+ * pvr_queue_get_job_cccb_fence() - Get the CCCB fence attached to a job.
+ * @queue: The queue this job will be submitted to.
+ * @job: The job to get the CCCB fence on.
+ *
+ * The CCCB fence is a synchronization primitive allowing us to delay job
+ * submission until there's enough space in the CCCB to submit the job.
+ *
+ * Return:
+ *  * NULL if there's enough space in the CCCB to submit this job, or
+ *  * A valid dma_fence object otherwise.
+ */
+static struct dma_fence *
+pvr_queue_get_job_cccb_fence(struct pvr_queue *queue, struct pvr_job *job)
+{
+	struct pvr_queue_fence *cccb_fence;
+	unsigned int native_deps_remaining;
+
+	/* If the fence is NULL, that means we already checked that we had
+	 * enough space in the cccb for our job.
+	 */
+	if (!job->cccb_fence)
+		return NULL;
+
+	mutex_lock(&queue->cccb_fence_ctx.job_lock);
+
+	/* Count remaining native dependencies and check if the job fits in the CCCB. */
+	native_deps_remaining = job_count_remaining_native_deps(job);
+	if (pvr_cccb_cmdseq_fits(&queue->cccb, job_cmds_size(job, native_deps_remaining))) {
+		pvr_queue_fence_put(job->cccb_fence);
+		job->cccb_fence = NULL;
+		goto out_unlock;
+	}
+
+	/* There should be no job attached to the CCCB fence context:
+	 * drm_sched_entity guarantees that jobs are submitted one at a time.
+	 */
+	if (WARN_ON(queue->cccb_fence_ctx.job))
+		pvr_job_put(queue->cccb_fence_ctx.job);
+
+	queue->cccb_fence_ctx.job = pvr_job_get(job);
+
+	/* Initialize the fence before returning it. */
+	cccb_fence = container_of(job->cccb_fence, struct pvr_queue_fence, base);
+	if (!WARN_ON(cccb_fence->queue))
+		pvr_queue_cccb_fence_init(job->cccb_fence, queue);
+
+out_unlock:
+	mutex_unlock(&queue->cccb_fence_ctx.job_lock);
+
+	return dma_fence_get(job->cccb_fence);
+}
+
+/**
+ * pvr_queue_get_job_kccb_fence() - Get the KCCB fence attached to a job.
+ * @queue: The queue this job will be submitted to.
+ * @job: The job to get the KCCB fence on.
+ *
+ * The KCCB fence is a synchronization primitive allowing us to delay job
+ * submission until there's enough space in the KCCB to submit the job.
+ *
+ * Return:
+ *  * NULL if there's enough space in the KCCB to submit this job, or
+ *  * A valid dma_fence object otherwise.
+ */
+static struct dma_fence *
+pvr_queue_get_job_kccb_fence(struct pvr_queue *queue, struct pvr_job *job)
+{
+	struct pvr_device *pvr_dev = queue->ctx->pvr_dev;
+	struct dma_fence *kccb_fence = NULL;
+
+	/* If the fence is NULL, that means we already checked that we had
+	 * enough space in the KCCB for our job.
+	 */
+	if (!job->kccb_fence)
+		return NULL;
+
+	if (!WARN_ON(job->kccb_fence->ops)) {
+		kccb_fence = pvr_kccb_reserve_slot(pvr_dev, job->kccb_fence);
+		job->kccb_fence = NULL;
+	}
+
+	return kccb_fence;
+}
+
+/**
+ * pvr_queue_prepare_job() - Return the next internal dependencies expressed as a dma_fence.
+ * @sched_job: The job to query the next internal dependency on
+ * @s_entity: The entity this job is queue on.
+ *
+ * After iterating over drm_sched_job::dependencies, drm_sched let the driver return
+ * its own internal dependencies. We use this function to return our internal dependencies.
+ */
+static struct dma_fence *
+pvr_queue_prepare_job(struct drm_sched_job *sched_job,
+		      struct drm_sched_entity *s_entity)
+{
+	struct pvr_job *job = container_of(sched_job, struct pvr_job, base);
+	struct pvr_queue *queue = container_of(s_entity, struct pvr_queue, entity);
+	struct dma_fence *internal_dep = NULL;
+
+	/* CCCB fence is used to make sure we have enough space in the CCCB to
+	 * submit our commands.
+	 */
+	internal_dep = pvr_queue_get_job_cccb_fence(queue, job);
+
+	/* KCCB fence is used to make sure we have a KCCB slot to queue our
+	 * CMD_KICK.
+	 */
+	if (!internal_dep)
+		internal_dep = pvr_queue_get_job_kccb_fence(queue, job);
+
+	/* Any extra internal dependency should be added here, using the following
+	 * the following pattern:
+	 *
+	 *	if (!internal_dep)
+	 *		internal_dep = pvr_queue_get_job_xxxx_fence(queue, job);
+	 */
+	return internal_dep;
+}
+
+/**
+ * pvr_queue_update_active_state_locked() - Update the queue active state.
+ * @queue: Queue to update the state on.
+ *
+ * Locked version of pvr_queue_update_active_state(). Must be called with
+ * pvr_device::queue::lock held.
+ */
+static void pvr_queue_update_active_state_locked(struct pvr_queue *queue)
+{
+	struct pvr_device *pvr_dev = queue->ctx->pvr_dev;
+
+	lockdep_assert_held(&pvr_dev->queues.lock);
+
+	if (!atomic_read(&queue->in_flight_job_count))
+		list_move_tail(&queue->node, &pvr_dev->queues.idle);
+	else
+		list_move_tail(&queue->node, &pvr_dev->queues.active);
+}
+
+/**
+ * pvr_queue_update_active_state() - Update the queue active state.
+ * @queue: Queue to update the state on.
+ *
+ * Active state is based on the in_flight_job_count value.
+ *
+ * Updating the active state implies moving the queue in or out of the
+ * active queue list, which also defines whether the queue is checked
+ * or not when a FW event is received.
+ *
+ * This function should be called any time a job is submitted or it done
+ * fence is signaled.
+ */
+static void pvr_queue_update_active_state(struct pvr_queue *queue)
+{
+	struct pvr_device *pvr_dev = queue->ctx->pvr_dev;
+
+	mutex_lock(&pvr_dev->queues.lock);
+	pvr_queue_update_active_state_locked(queue);
+	mutex_unlock(&pvr_dev->queues.lock);
+}
+
+/**
+ * pvr_queue_run_job() - Submit a job to the FW.
+ * @sched_job: The job to submit.
+ *
+ * This function is called when all non-native dependencies have been met and
+ * when the commands resulting from this job are guaranteed to fit in the CCCB.
+ * There's no reason for it to fail, but the CCCB rollback mechanism has been
+ * kept for debugging purpose.
+ */
+static struct dma_fence *pvr_queue_run_job(struct drm_sched_job *sched_job)
+{
+	struct pvr_job *job = container_of(sched_job, struct pvr_job, base);
+	struct pvr_queue *queue = container_of(sched_job->sched, struct pvr_queue, scheduler);
+	u32 ctx_fw_addr = pvr_context_get_fw_addr(job->ctx) + queue->ctx_offset;
+	struct pvr_device *pvr_dev = job->pvr_dev;
+	struct pvr_cccb *cccb = &queue->cccb;
+	struct rogue_fwif_ufo queue_ufo;
+	struct pvr_queue_fence *jfence;
+	struct dma_fence *fence;
+	unsigned long index;
+	int err;
+
+	err = pvr_job_get_pm_ref(job);
+	if (WARN_ON(err))
+		return ERR_PTR(err);
+
+	/* Initialize the done_fence, so we can signal it. */
+	pvr_queue_job_fence_init(job->done_fence, queue);
+
+	/* We need to add the queue to the active list before updating the CCCB,
+	 * otherwise we might miss the FW event informing us that something
+	 * happened on this queue.
+	 */
+	atomic_inc(&queue->in_flight_job_count);
+	pvr_queue_update_active_state(queue);
+
+	xa_for_each(&job->base.dependencies, index, fence) {
+		jfence = to_pvr_queue_job_fence(fence);
+		if (!jfence)
+			continue;
+
+		if (dma_fence_is_signaled(&jfence->base))
+			continue;
+
+		pvr_fw_object_get_fw_addr(jfence->queue->timeline_ufo.fw_obj,
+					  &queue_ufo.addr);
+		queue_ufo.value = fence->seqno;
+		pvr_cccb_write_command_with_header(cccb, ROGUE_FWIF_CCB_CMD_TYPE_FENCE_PR,
+						   sizeof(queue_ufo), &queue_ufo, 0, 0);
+	}
+
+	/* Submit job to FW */
+	pvr_cccb_write_command_with_header(cccb, job->fw_ccb_cmd_type, job->cmd_len, job->cmd,
+					   job->id, job->id);
+
+	/* Signal the job fence. */
+	pvr_fw_object_get_fw_addr(queue->timeline_ufo.fw_obj, &queue_ufo.addr);
+	queue_ufo.value = job->done_fence->seqno;
+	pvr_cccb_write_command_with_header(cccb, ROGUE_FWIF_CCB_CMD_TYPE_UPDATE,
+					   sizeof(queue_ufo), &queue_ufo, 0, 0);
+
+	/* The job we submit is added to the drm_gpu_scheduler::pending_list in
+	 * drm_sched_job_begin() which is called after ::run_job() returns. But the
+	 * GPU might be done executing the job before drm_sched_main() had a chance
+	 * to queue it to the pending_list, resulting in a lost event. Work around
+	 * this race by keeping track of the last submitted job so we can check it in
+	 * pvr_queue_signal_done_fences() if this job is not part of the pending_list
+	 * already.
+	 * No need to keep a reference to the job object here, because we only use
+	 * check the pointer value.
+	 */
+	spin_lock(&queue->scheduler.job_list_lock);
+	queue->last_submitted_job = job;
+	spin_unlock(&queue->scheduler.job_list_lock);
+
+	pvr_cccb_send_kccb_kick(pvr_dev, cccb, ctx_fw_addr, job->hwrt);
+
+	return dma_fence_get(job->done_fence);
+}
+
+/**
+ * pvr_queue_timedout_job() - Handle a job timeout event.
+ * @sched_job: The job this timeout occurred on.
+ *
+ * Return:
+ *  * DRM_GPU_SCHED_STAT_NOMINAL.
+ */
+static enum drm_gpu_sched_stat
+pvr_queue_timedout_job(struct drm_sched_job *sched_job)
+{
+	/* TODO: stop, recover, resubmit and start */
+	return DRM_GPU_SCHED_STAT_NOMINAL;
+}
+
+/**
+ * pvr_queue_free_job() - Release the reference the scheduler had on a job object.
+ * @sched_job: Job object to free.
+ */
+static void pvr_queue_free_job(struct drm_sched_job *sched_job)
+{
+	struct pvr_job *job = container_of(sched_job, struct pvr_job, base);
+
+	drm_sched_job_cleanup(sched_job);
+	pvr_job_put(job);
+}
+
+static const struct drm_sched_backend_ops pvr_queue_sched_ops = {
+	.prepare_job = pvr_queue_prepare_job,
+	.run_job = pvr_queue_run_job,
+	.timedout_job = pvr_queue_timedout_job,
+	.free_job = pvr_queue_free_job,
+};
+
+/**
+ * pvr_queue_fence_is_ufo_backed() - Check if a dma_fence is backed by a UFO object
+ * @f: Fence to test.
+ *
+ * A UFO-backed fence is a fence that can be signaled or waited upon FW-side.
+ * pvr_job::done_fence objects are backed by the timeline UFO attached to the queue
+ * they are pushed to, but those fences are not directly exposed to the outside
+ * world, so we also need to check if the fence we're being passed is a
+ * drm_sched_fence that was coming from our driver.
+ */
+bool pvr_queue_fence_is_ufo_backed(struct dma_fence *f)
+{
+	struct drm_sched_fence *sched_fence = f ? to_drm_sched_fence(f) : NULL;
+
+	if (sched_fence &&
+	    sched_fence->sched->ops == &pvr_queue_sched_ops)
+		return true;
+
+	if (f && f->ops == &pvr_queue_job_fence_ops)
+		return true;
+
+	return false;
+}
+
+/**
+ * pvr_queue_signal_done_fences() - Signal done fences.
+ * @queue: Queue to check.
+ *
+ * Signal done fences of jobs whose seqno is less than the current value of
+ * the UFO object attached to the queue.
+ */
+static void
+pvr_queue_signal_done_fences(struct pvr_queue *queue)
+{
+	struct pvr_job *job, *tmp_job;
+	u32 cur_seqno;
+
+	spin_lock(&queue->scheduler.job_list_lock);
+	cur_seqno = *queue->timeline_ufo.value;
+	list_for_each_entry_safe(job, tmp_job, &queue->scheduler.pending_list, base.list) {
+		/* We don't want to test jobs twice, so reset last_submitted_job
+		 * if the job is already part of the pending_list.
+		 */
+		if (job == queue->last_submitted_job)
+			queue->last_submitted_job = NULL;
+
+		if ((int)(cur_seqno - lower_32_bits(job->done_fence->seqno)) < 0)
+			break;
+
+		if (!dma_fence_is_signaled(job->done_fence)) {
+			dma_fence_signal(job->done_fence);
+			pvr_job_release_pm_ref(job);
+			atomic_dec(&queue->in_flight_job_count);
+		}
+	}
+
+	if (queue->last_submitted_job &&
+	    (int)(cur_seqno - lower_32_bits(queue->last_submitted_job->done_fence->seqno)) >= 0) {
+		dma_fence_signal(queue->last_submitted_job->done_fence);
+		pvr_job_release_pm_ref(queue->last_submitted_job);
+		atomic_dec(&queue->in_flight_job_count);
+	}
+	spin_unlock(&queue->scheduler.job_list_lock);
+}
+
+/**
+ * pvr_queue_check_job_waiting_for_cccb_space() - Check if the job waiting for CCCB space
+ * can be unblocked
+ * pushed to the CCCB
+ * @queue: Queue to check
+ *
+ * If we have a job waiting for CCCB, and this job now fits in the CCCB, we signal
+ * its CCCB fence, which should kick drm_sched.
+ */
+static void
+pvr_queue_check_job_waiting_for_cccb_space(struct pvr_queue *queue)
+{
+	struct pvr_queue_fence *cccb_fence;
+	u32 native_deps_remaining;
+	struct pvr_job *job;
+
+	mutex_lock(&queue->cccb_fence_ctx.job_lock);
+	job = queue->cccb_fence_ctx.job;
+	if (!job)
+		goto out_unlock;
+
+	/* If we have a job attached to the CCCB fence context, its CCCB fence
+	 * shouldn't be NULL.
+	 */
+	if (WARN_ON(!job->cccb_fence)) {
+		job = NULL;
+		goto out_unlock;
+	}
+
+	/* If we get there, CCCB fence has to be initialized. */
+	cccb_fence = container_of(job->cccb_fence, struct pvr_queue_fence, base);
+	if (WARN_ON(!cccb_fence->queue)) {
+		job = NULL;
+		goto out_unlock;
+	}
+
+	/* Evict signaled dependencies before checking for CCCB space.
+	 * If the job fits, signal the CCCB fence, this should unblock
+	 * the drm_sched_entity.
+	 */
+	native_deps_remaining = job_count_remaining_native_deps(job);
+	if (!pvr_cccb_cmdseq_fits(&queue->cccb, job_cmds_size(job, native_deps_remaining))) {
+		job = NULL;
+		goto out_unlock;
+	}
+
+	dma_fence_signal(job->cccb_fence);
+	pvr_queue_fence_put(job->cccb_fence);
+	job->cccb_fence = NULL;
+	queue->cccb_fence_ctx.job = NULL;
+
+out_unlock:
+	mutex_unlock(&queue->cccb_fence_ctx.job_lock);
+
+	pvr_job_put(job);
+}
+
+/**
+ * pvr_queue_process_worker() - Process all queue related events
+ * @work: Work object attached to this function.
+ *
+ * This worker is called any time we receive a FW event. It iterates over all
+ * active queues (those with in flight jobs) and signal done_fences on completed
+ * jobs.
+ *
+ * If we have a job that was waiting for ring buffer space, we check if it can
+ * now fit.
+ *
+ * If the queue has no jobs left after we've collected done jobs, we remove the
+ * queue from the active list.
+ */
+static void pvr_queue_process_worker(struct work_struct *work)
+{
+	struct pvr_device *pvr_dev = container_of(work, struct pvr_device, queues.work);
+	struct pvr_queue *queue, *tmp_queue;
+
+	mutex_lock(&pvr_dev->queues.lock);
+	list_for_each_entry_safe(queue, tmp_queue, &pvr_dev->queues.active, node) {
+		pvr_queue_check_job_waiting_for_cccb_space(queue);
+		pvr_queue_signal_done_fences(queue);
+
+		pvr_queue_update_active_state_locked(queue);
+	}
+	mutex_unlock(&pvr_dev->queues.lock);
+}
+
+static u32 get_dm_type(struct pvr_queue *queue)
+{
+	switch (queue->type) {
+	case DRM_PVR_JOB_TYPE_GEOMETRY:
+		return PVR_FWIF_DM_GEOM;
+	case DRM_PVR_JOB_TYPE_TRANSFER_FRAG:
+	case DRM_PVR_JOB_TYPE_FRAGMENT:
+		return PVR_FWIF_DM_FRAG;
+	case DRM_PVR_JOB_TYPE_COMPUTE:
+		return PVR_FWIF_DM_CDM;
+	}
+
+	return ~0;
+}
+
+/**
+ * init_geom_reg_state_obj() - Initializes the geometry register state.
+ * @queue: Queue object to initialize the register state for.
+ * @args: Arguments passed to the context creation function.
+ *
+ * Return:
+ *  * 0 on success, or
+ *  * Any error returned by pvr_fw_object_vmap() if the vmap operation failed.
+ */
+static int init_geom_reg_state_obj(struct pvr_queue *queue,
+				   struct drm_pvr_ioctl_create_context_args *args)
+{
+	struct rogue_fwif_geom_ctx_state *geom_ctx_state_fw;
+
+	geom_ctx_state_fw = pvr_fw_object_vmap(queue->reg_state_obj);
+	if (IS_ERR(geom_ctx_state_fw))
+		return PTR_ERR(geom_ctx_state_fw);
+
+	geom_ctx_state_fw->geom_core[0].geom_reg_vdm_call_stack_pointer = args->callstack_addr;
+
+	pvr_fw_object_vunmap(queue->reg_state_obj);
+	return 0;
+}
+
+/**
+ * init_fw_context() - Initializes the queue part of a FW context.
+ * @queue: Queue object to initialize the FW context for.
+ * @fw_ctx_map: The FW context CPU mapping.
+ *
+ * FW contexts are containing various states, one of them being a per-queue state
+ * that needs to be initialized for each queue being exposed by a context. This
+ * function takes care of that.
+ */
+static void init_fw_context(struct pvr_queue *queue, void *fw_ctx_map)
+{
+	struct pvr_context *ctx = queue->ctx;
+	struct pvr_fw_object *fw_mem_ctx_obj = pvr_vm_get_fw_mem_context(ctx->vm_ctx);
+	struct rogue_fwif_fwcommoncontext *cctx_fw;
+	struct pvr_cccb *cccb = &queue->cccb;
+
+	cctx_fw = fw_ctx_map + queue->ctx_offset;
+	cctx_fw->ccbctl_fw_addr = cccb->ctrl_fw_addr;
+	cctx_fw->ccb_fw_addr = cccb->cccb_fw_addr;
+
+	cctx_fw->dm = get_dm_type(queue);
+	cctx_fw->priority = ctx->priority;
+	cctx_fw->priority_seq_num = 0;
+	cctx_fw->max_deadline_ms = MAX_DEADLINE_MS;
+	cctx_fw->pid = task_tgid_nr(current);
+	cctx_fw->server_common_context_id = ctx->ctx_id;
+
+	pvr_fw_object_get_fw_addr(fw_mem_ctx_obj, &cctx_fw->fw_mem_context_fw_addr);
+
+	pvr_fw_object_get_fw_addr(queue->reg_state_obj, &cctx_fw->context_state_addr);
+}
+
+/**
+ * pvr_queue_cleanup_fw_context() - Wait for the FW context to be idle and clean it up.
+ * @queue: Queue on FW context to clean up.
+ *
+ * Return:
+ *  * 0 on success,
+ *  * Any error returned by pvr_fw_structure_cleanup() otherwise.
+ */
+static int pvr_queue_cleanup_fw_context(struct pvr_queue *queue)
+{
+	return pvr_fw_structure_cleanup(queue->ctx->pvr_dev,
+					ROGUE_FWIF_CLEANUP_FWCOMMONCONTEXT,
+					queue->ctx->fw_obj, queue->ctx_offset);
+}
+
+/**
+ * pvr_queue_job_init() - Initialize queue related fields in a pvr_job object.
+ * @job: The job to initialize.
+ *
+ * Bind the job to a queue and allocate memory to guarantee pvr_queue_job_arm()
+ * and pvr_queue_job_push() can't fail. We also make sure the context type is
+ * valid and the job can fit in the CCCB.
+ *
+ * Return:
+ *  * 0 on success, or
+ *  * An error code if something failed.
+ */
+int pvr_queue_job_init(struct pvr_job *job)
+{
+	/* Fragment jobs need at least one native fence wait on the geometry job fence. */
+	u32 min_native_dep_count = job->type == DRM_PVR_JOB_TYPE_FRAGMENT ? 1 : 0;
+	struct pvr_queue *queue = pvr_context_get_queue_for_job(job->ctx, job->type);
+	int err;
+
+	queue = pvr_context_get_queue_for_job(job->ctx, job->type);
+	if (!queue)
+		return -EINVAL;
+
+	if (!pvr_cccb_cmdseq_can_fit(&queue->cccb, job_cmds_size(job, min_native_dep_count)))
+		return -E2BIG;
+
+	err = drm_sched_job_init(&job->base, &queue->entity, THIS_MODULE);
+	if (err)
+		return err;
+
+	job->cccb_fence = pvr_queue_fence_alloc();
+	job->kccb_fence = pvr_kccb_fence_alloc();
+	job->done_fence = pvr_queue_fence_alloc();
+	if (!job->cccb_fence || !job->done_fence)
+		return -ENOMEM;
+
+	return 0;
+}
+
+/**
+ * pvr_queue_job_arm() - Arm a job object.
+ * @job: The job to arm.
+ *
+ * Initializes fences and return the drm_sched finished fence so it can
+ * be exposed to the outside world. Once this function is called, you should
+ * make sure the job is pushed using pvr_queue_job_push(), or guarantee that
+ * no one grabbed a reference to the returned fence. The latter can happen if
+ * we do multi-job submission, and something failed when creating/initializing
+ * a job. In that case, we know the fence didn't leave the driver, and we
+ * can thus guarantee nobody will wait on an dead fence object.
+ *
+ * Return:
+ *  * A dma_fence object.
+ */
+struct dma_fence *pvr_queue_job_arm(struct pvr_job *job)
+{
+	drm_sched_job_arm(&job->base);
+
+	return &job->base.s_fence->finished;
+}
+
+/**
+ * pvr_queue_job_cleanup() - Cleanup fence/scheduler related fields in the job object.
+ * @job: The job to cleanup.
+ *
+ * Should be called in the job release path.
+ */
+void pvr_queue_job_cleanup(struct pvr_job *job)
+{
+	pvr_queue_fence_put(job->done_fence);
+	pvr_queue_fence_put(job->cccb_fence);
+	pvr_kccb_fence_put(job->kccb_fence);
+
+	if (job->base.s_fence)
+		drm_sched_job_cleanup(&job->base);
+}
+
+/**
+ * pvr_queue_job_push() - Push a job to its queue.
+ * @job: The job to push.
+ *
+ * Must be called after pvr_queue_job_init() and after all dependencies
+ * have been added to the job. This will effectively queue the job to
+ * the drm_sched_entity attached to the queue. We grab a reference on
+ * the job object, so the caller is free to drop its reference when it's
+ * done accessing the job object.
+ */
+void pvr_queue_job_push(struct pvr_job *job)
+{
+	pvr_job_get(job);
+	drm_sched_entity_push_job(&job->base);
+}
+
+/**
+ * pvr_queue_create() - Create a queue object.
+ * @ctx: The context this queue will be attached to.
+ * @type: The type of jobs being pushed to this queue.
+ * @args: The arguments passed to the context creation function.
+ * @fw_ctx_map: CPU mapping of the FW context object.
+ *
+ * Create a queue object that will be used to queue and track jobs.
+ *
+ * Return:
+ *  * A valid pointer to a pvr_queue object, or
+ *  * An error pointer if the creation/initialization failed.
+ */
+struct pvr_queue *pvr_queue_create(struct pvr_context *ctx,
+				   enum drm_pvr_job_type type,
+				   struct drm_pvr_ioctl_create_context_args *args,
+				   void *fw_ctx_map)
+{
+	static const struct {
+		u32 cccb_size;
+		const char *name;
+	} props[] = {
+		[DRM_PVR_JOB_TYPE_GEOMETRY] = {
+			.cccb_size = CTX_GEOM_CCCB_SIZE_LOG2,
+			.name = "geometry",
+		},
+		[DRM_PVR_JOB_TYPE_FRAGMENT] = {
+			.cccb_size = CTX_FRAG_CCCB_SIZE_LOG2,
+			.name = "fragment"
+		},
+		[DRM_PVR_JOB_TYPE_COMPUTE] = {
+			.cccb_size = CTX_COMPUTE_CCCB_SIZE_LOG2,
+			.name = "compute"
+		},
+		[DRM_PVR_JOB_TYPE_TRANSFER_FRAG] = {
+			.cccb_size = CTX_TRANSFER_CCCB_SIZE_LOG2,
+			.name = "transfer_frag"
+		},
+	};
+	struct pvr_device *pvr_dev = ctx->pvr_dev;
+	struct drm_gpu_scheduler *sched;
+	struct pvr_queue *queue;
+	int ctx_state_size, err;
+	void *cpu_map;
+
+	if (WARN_ON(type >= sizeof(props)))
+		return ERR_PTR(-EINVAL);
+
+	switch (ctx->type) {
+	case DRM_PVR_CTX_TYPE_RENDER:
+		if (type != DRM_PVR_JOB_TYPE_GEOMETRY &&
+		    type != DRM_PVR_JOB_TYPE_FRAGMENT)
+			return ERR_PTR(-EINVAL);
+		break;
+	case DRM_PVR_CTX_TYPE_COMPUTE:
+		if (type != DRM_PVR_JOB_TYPE_COMPUTE)
+			return ERR_PTR(-EINVAL);
+		break;
+	case DRM_PVR_CTX_TYPE_TRANSFER_FRAG:
+		if (type != DRM_PVR_JOB_TYPE_TRANSFER_FRAG)
+			return ERR_PTR(-EINVAL);
+		break;
+	default:
+		return ERR_PTR(-EINVAL);
+	}
+
+	ctx_state_size = get_ctx_state_size(pvr_dev, type);
+	if (ctx_state_size < 0)
+		return ERR_PTR(ctx_state_size);
+
+	queue = kzalloc(sizeof(*queue), GFP_KERNEL);
+	if (!queue)
+		return ERR_PTR(-ENOMEM);
+
+	queue->type = type;
+	queue->ctx_offset = get_ctx_offset(type);
+	queue->ctx = ctx;
+	sched = &queue->scheduler;
+	INIT_LIST_HEAD(&queue->node);
+	mutex_init(&queue->cccb_fence_ctx.job_lock);
+	pvr_queue_fence_ctx_init(&queue->cccb_fence_ctx.base);
+	pvr_queue_fence_ctx_init(&queue->job_fence_ctx);
+
+	err = pvr_cccb_init(pvr_dev, &queue->cccb, props[type].cccb_size, props[type].name);
+	if (err)
+		goto err_free_queue;
+
+	err = pvr_fw_object_create(pvr_dev, ctx_state_size,
+				   PVR_BO_FW_FLAGS_DEVICE_UNCACHED |
+				   DRM_PVR_BO_CREATE_ZEROED,
+				   &queue->reg_state_obj);
+	if (err)
+		goto err_cccb_fini;
+
+	init_fw_context(queue, fw_ctx_map);
+
+	if (type == DRM_PVR_JOB_TYPE_GEOMETRY) {
+		err = init_geom_reg_state_obj(queue, args);
+		if (err)
+			goto err_release_reg_state;
+	} else if (type != DRM_PVR_JOB_TYPE_FRAGMENT && args->callstack_addr) {
+		err = -EINVAL;
+		goto err_release_reg_state;
+	}
+
+	cpu_map = pvr_fw_object_create_and_map(pvr_dev, sizeof(*queue->timeline_ufo.value),
+					       PVR_BO_FW_FLAGS_DEVICE_UNCACHED |
+					       DRM_PVR_BO_CREATE_ZEROED,
+					       &queue->timeline_ufo.fw_obj);
+	if (IS_ERR(cpu_map)) {
+		err = PTR_ERR(cpu_map);
+		goto err_release_reg_state;
+	}
+
+	queue->timeline_ufo.value = cpu_map;
+
+	err = drm_sched_init(&queue->scheduler,
+			     &pvr_queue_sched_ops,
+			     pvr_dev->sched_wq, 64 * 1024, 1,
+			     msecs_to_jiffies(500),
+			     pvr_dev->sched_wq, NULL, "pvr-queue",
+			     DRM_SCHED_POLICY_SINGLE_ENTITY,
+			     pvr_dev->base.dev);
+	if (err)
+		goto err_release_ufo;
+
+	err = drm_sched_entity_init(&queue->entity,
+				    DRM_SCHED_PRIORITY_MIN,
+				    &sched, 1, NULL);
+	if (err)
+		goto err_sched_fini;
+
+	mutex_lock(&pvr_dev->queues.lock);
+	list_add_tail(&queue->node, &pvr_dev->queues.idle);
+	mutex_unlock(&pvr_dev->queues.lock);
+
+	return queue;
+
+err_sched_fini:
+	drm_sched_fini(&queue->scheduler);
+
+err_release_ufo:
+	pvr_fw_object_unmap_and_destroy(queue->timeline_ufo.fw_obj);
+
+err_release_reg_state:
+	pvr_fw_object_destroy(queue->reg_state_obj);
+
+err_cccb_fini:
+	pvr_cccb_fini(&queue->cccb);
+
+err_free_queue:
+	mutex_destroy(&queue->cccb_fence_ctx.job_lock);
+	kfree(queue);
+
+	return ERR_PTR(err);
+}
+
+/**
+ * pvr_queue_kill() - Kill a queue.
+ * @queue: The queue to kill.
+ *
+ * Kill the queue so no new jobs can be pushed. Should be called when the
+ * context handle is destroyed. The queue object might last longer if jobs
+ * are still in flight and holding a reference to the context this queue
+ * belongs to.
+ */
+void pvr_queue_kill(struct pvr_queue *queue)
+{
+	drm_sched_entity_destroy(&queue->entity);
+}
+
+/**
+ * pvr_queue_destroy() - Destroy a queue.
+ * @queue: The queue to destroy.
+ *
+ * Cleanup the queue and free the resources attached to it. Should be
+ * called from the context release function.
+ */
+void pvr_queue_destroy(struct pvr_queue *queue)
+{
+	if (!queue)
+		return;
+
+	pvr_queue_cleanup_fw_context(queue);
+	drm_sched_fini(&queue->scheduler);
+	drm_sched_entity_fini(&queue->entity);
+
+	pvr_queue_update_active_state(queue);
+	mutex_lock(&queue->ctx->pvr_dev->queues.lock);
+	list_del_init(&queue->node);
+	mutex_unlock(&queue->ctx->pvr_dev->queues.lock);
+
+	pvr_fw_object_unmap_and_destroy(queue->timeline_ufo.fw_obj);
+	pvr_fw_object_destroy(queue->reg_state_obj);
+	pvr_cccb_fini(&queue->cccb);
+	mutex_destroy(&queue->cccb_fence_ctx.job_lock);
+	kfree(queue);
+}
+
+/**
+ * pvr_queue_device_init() - Device-level initialization of queue related fields.
+ * @pvr_dev: The device to initialize.
+ *
+ * Initializes all fields related to queue management in pvr_device.
+ *
+ * Return:
+ *  * 0 on success, or
+ *  * An error code on failure.
+ */
+int pvr_queue_device_init(struct pvr_device *pvr_dev)
+{
+	int err;
+
+	INIT_WORK(&pvr_dev->queues.work, pvr_queue_process_worker);
+	INIT_LIST_HEAD(&pvr_dev->queues.active);
+	INIT_LIST_HEAD(&pvr_dev->queues.idle);
+	err = drmm_mutex_init(from_pvr_device(pvr_dev), &pvr_dev->queues.lock);
+	if (err)
+		return err;
+
+	pvr_dev->sched_wq = alloc_ordered_workqueue("powervr-sched", 0);
+	if (!pvr_dev->sched_wq)
+		return -ENOMEM;
+
+	return 0;
+}
+
+/**
+ * pvr_queue_device_fini() - Device-level cleanup of queue related fields.
+ * @pvr_dev: The device to cleanup.
+ *
+ * Cleanup/free all queue-related resources attached to a pvr_device object.
+ */
+void pvr_queue_device_fini(struct pvr_device *pvr_dev)
+{
+	destroy_workqueue(pvr_dev->sched_wq);
+}
diff --git a/drivers/gpu/drm/imagination/pvr_queue.h b/drivers/gpu/drm/imagination/pvr_queue.h
new file mode 100644
index 000000000000..66a5e991b45c
--- /dev/null
+++ b/drivers/gpu/drm/imagination/pvr_queue.h
@@ -0,0 +1,157 @@
+/* SPDX-License-Identifier: GPL-2.0 OR MIT */
+/* Copyright (c) 2022 Imagination Technologies Ltd. */
+
+#ifndef PVR_QUEUE_H
+#define PVR_QUEUE_H
+
+#include "pvr_cccb.h"
+#include "pvr_device.h"
+
+struct pvr_context;
+struct pvr_queue;
+
+/**
+ * struct pvr_queue_fence_ctx - Queue fence context
+ *
+ * Used to implement dma_fence_ops for pvr_job::{done,cccb}_fence.
+ */
+struct pvr_queue_fence_ctx {
+	/** @id: Fence context ID allocated with dma_fence_context_alloc(). */
+	u64 id;
+
+	/** @seqno: Sequence number incremented each time a fence is created. */
+	atomic_t seqno;
+
+	/** @lock: Lock used to synchronize access to fences allocated by this context. */
+	spinlock_t lock;
+};
+
+/**
+ * struct pvr_queue_cccb_fence_ctx - CCCB fence context
+ *
+ * Context used to manage fences controlling access to the CCCB. No fences are
+ * issued if there's enough space in the CCCB to push job commands.
+ */
+struct pvr_queue_cccb_fence_ctx {
+	/** @base: Base queue fence context. */
+	struct pvr_queue_fence_ctx base;
+
+	/**
+	 * @job: Job waiting for CCCB space.
+	 *
+	 * Thanks to the serializationg done at the drm_sched_entity level,
+	 * there's no more than one job waiting for CCCB at a given time.
+	 *
+	 * This field is NULL if no jobs are currently waiting for CCCB space.
+	 *
+	 * Must be accessed with @job_lock held.
+	 */
+	struct pvr_job *job;
+
+	/** @lock: Lock protecting access to the job object. */
+	struct mutex job_lock;
+};
+
+/**
+ * struct pvr_queue_fence - Queue fence object
+ */
+struct pvr_queue_fence {
+	/** @base: Base dma_fence. */
+	struct dma_fence base;
+
+	/** @queue: Queue that created this fence. */
+	struct pvr_queue *queue;
+};
+
+/**
+ * struct pvr_queue - Job queue
+ *
+ * Used to queue and track execution of pvr_job objects.
+ */
+struct pvr_queue {
+	/** @scheduler: Single entity scheduler use to push jobs to this queue. */
+	struct drm_gpu_scheduler scheduler;
+
+	/** @entity: Scheduling entity backing this queue. */
+	struct drm_sched_entity entity;
+
+	/** @type: Type of jobs queued to this queue. */
+	enum drm_pvr_job_type type;
+
+	/** @ctx: Context object this queue is bound to. */
+	struct pvr_context *ctx;
+
+	/** @node: Used to add the queue to the active/idle queue list. */
+	struct list_head node;
+
+	/**
+	 * @in_flight_job_count: Number of jobs submitted to the CCCB that
+	 * have not been processed yet.
+	 */
+	atomic_t in_flight_job_count;
+
+	/**
+	 * @cccb_fence_ctx: CCCB fence context.
+	 *
+	 * Used to control access to the CCCB is full, such that we don't
+	 * end up trying to push commands to the CCCB if there's not enough
+	 * space to receive all commands needed for a job to complete.
+	 */
+	struct pvr_queue_cccb_fence_ctx cccb_fence_ctx;
+
+	/** @job_fence_ctx: Job fence context object. */
+	struct pvr_queue_fence_ctx job_fence_ctx;
+
+	/** @timeline_ufo: Timeline UFO for the context queue. */
+	struct {
+		/** @fw_obj: FW object representing the UFO value. */
+		struct pvr_fw_object *fw_obj;
+
+		/** @value: CPU mapping of the UFO value. */
+		u32 *value;
+	} timeline_ufo;
+
+	/**
+	 * @last_submitted_job: Last submitted job.
+	 *
+	 * We need to keep that one around because drm_sched_main() only
+	 * queues the job to the drm_gpu_scheduler::pending_list after
+	 * ::run_job() has returned, which is racy with the queue process
+	 * worker that's handling done job signaling.
+	 */
+	struct pvr_job *last_submitted_job;
+
+	/** @cccb: Client Circular Command Buffer. */
+	struct pvr_cccb cccb;
+
+	/** @reg_state_obj: FW object representing the register state of this queue. */
+	struct pvr_fw_object *reg_state_obj;
+
+	/** @ctx_offset: Offset of the queue context in the FW context object. */
+	u32 ctx_offset;
+};
+
+bool pvr_queue_fence_is_ufo_backed(struct dma_fence *f);
+
+int pvr_queue_job_init(struct pvr_job *job);
+
+void pvr_queue_job_cleanup(struct pvr_job *job);
+
+void pvr_queue_job_push(struct pvr_job *job);
+
+struct dma_fence *pvr_queue_job_arm(struct pvr_job *job);
+
+struct pvr_queue *pvr_queue_create(struct pvr_context *ctx,
+				   enum drm_pvr_job_type type,
+				   struct drm_pvr_ioctl_create_context_args *args,
+				   void *fw_ctx_map);
+
+void pvr_queue_kill(struct pvr_queue *queue);
+
+void pvr_queue_destroy(struct pvr_queue *queue);
+
+int pvr_queue_device_init(struct pvr_device *pvr_dev);
+
+void pvr_queue_device_fini(struct pvr_device *pvr_dev);
+
+#endif /* PVR_QUEUE_H */
diff --git a/drivers/gpu/drm/imagination/pvr_stream.c b/drivers/gpu/drm/imagination/pvr_stream.c
index 086a0694e610..3ec805fae595 100644
--- a/drivers/gpu/drm/imagination/pvr_stream.c
+++ b/drivers/gpu/drm/imagination/pvr_stream.c
@@ -210,7 +210,7 @@ pvr_stream_process_ext_stream(struct pvr_device *pvr_dev,
  * @cmd_defs: Stream definition.
  * @stream: Pointer to command stream.
  * @stream_size: Size of command stream, in bytes.
- * @job: Pointer to job in which to store address of FW structure.
+ * @dest_out: Pointer to destination buffer.
  *
  * Caller is responsible for freeing the output structure.
  *
diff --git a/drivers/gpu/drm/imagination/pvr_stream_defs.c b/drivers/gpu/drm/imagination/pvr_stream_defs.c
index 81d2d60e5e44..07f6e3e66de1 100644
--- a/drivers/gpu/drm/imagination/pvr_stream_defs.c
+++ b/drivers/gpu/drm/imagination/pvr_stream_defs.c
@@ -43,6 +43,232 @@
  * existing parameters, to preserve order. As parameters are naturally aligned, care must be taken
  * with respect to implicit padding in the stream; padding should be minimised as much as possible.
  */
+static const struct pvr_stream_def rogue_fwif_cmd_geom_stream[] = {
+	PVR_STREAM_DEF(rogue_fwif_cmd_geom, regs.vdm_ctrl_stream_base, 64),
+	PVR_STREAM_DEF(rogue_fwif_cmd_geom, regs.tpu_border_colour_table, 64),
+	PVR_STREAM_DEF_FEATURE(rogue_fwif_cmd_geom, regs.vdm_draw_indirect0, 64,
+			       PVR_FEATURE_VDM_DRAWINDIRECT),
+	PVR_STREAM_DEF_FEATURE(rogue_fwif_cmd_geom, regs.vdm_draw_indirect1, 32,
+			       PVR_FEATURE_VDM_DRAWINDIRECT),
+	PVR_STREAM_DEF(rogue_fwif_cmd_geom, regs.ppp_ctrl, 32),
+	PVR_STREAM_DEF(rogue_fwif_cmd_geom, regs.te_psg, 32),
+	PVR_STREAM_DEF(rogue_fwif_cmd_geom, regs.vdm_context_resume_task0_size, 32),
+	PVR_STREAM_DEF_FEATURE(rogue_fwif_cmd_geom, regs.vdm_context_resume_task3_size, 32,
+			       PVR_FEATURE_VDM_OBJECT_LEVEL_LLS),
+	PVR_STREAM_DEF(rogue_fwif_cmd_geom, regs.view_idx, 32),
+	PVR_STREAM_DEF_FEATURE(rogue_fwif_cmd_geom, regs.pds_coeff_free_prog, 32,
+			       PVR_FEATURE_TESSELLATION),
+};
+
+static const struct pvr_stream_def rogue_fwif_cmd_geom_stream_brn49927[] = {
+	PVR_STREAM_DEF(rogue_fwif_cmd_geom, regs.tpu, 32),
+};
+
+static const struct pvr_stream_ext_def cmd_geom_ext_streams_0[] = {
+	{
+		.stream = rogue_fwif_cmd_geom_stream_brn49927,
+		.stream_len = ARRAY_SIZE(rogue_fwif_cmd_geom_stream_brn49927),
+		.header_mask = PVR_STREAM_EXTHDR_GEOM0_BRN49927,
+		.quirk = 49927,
+	},
+};
+
+static const struct pvr_stream_ext_header cmd_geom_ext_headers[] = {
+	{
+		.ext_streams = cmd_geom_ext_streams_0,
+		.ext_streams_num = ARRAY_SIZE(cmd_geom_ext_streams_0),
+		.valid_mask = PVR_STREAM_EXTHDR_GEOM0_VALID,
+	},
+};
+
+const struct pvr_stream_cmd_defs pvr_cmd_geom_stream = {
+	.type = PVR_STREAM_TYPE_GEOM,
+
+	.main_stream = rogue_fwif_cmd_geom_stream,
+	.main_stream_len = ARRAY_SIZE(rogue_fwif_cmd_geom_stream),
+
+	.ext_nr_headers = ARRAY_SIZE(cmd_geom_ext_headers),
+	.ext_headers = cmd_geom_ext_headers,
+
+	.dest_size = sizeof(struct rogue_fwif_cmd_geom),
+};
+
+static const struct pvr_stream_def rogue_fwif_cmd_frag_stream[] = {
+	PVR_STREAM_DEF(rogue_fwif_cmd_frag, regs.isp_scissor_base, 64),
+	PVR_STREAM_DEF(rogue_fwif_cmd_frag, regs.isp_dbias_base, 64),
+	PVR_STREAM_DEF(rogue_fwif_cmd_frag, regs.isp_oclqry_base, 64),
+	PVR_STREAM_DEF(rogue_fwif_cmd_frag, regs.isp_zlsctl, 64),
+	PVR_STREAM_DEF(rogue_fwif_cmd_frag, regs.isp_zload_store_base, 64),
+	PVR_STREAM_DEF(rogue_fwif_cmd_frag, regs.isp_stencil_load_store_base, 64),
+	PVR_STREAM_DEF_FEATURE(rogue_fwif_cmd_frag, regs.fb_cdc_zls, 64,
+			       PVR_FEATURE_REQUIRES_FB_CDC_ZLS_SETUP),
+	PVR_STREAM_DEF_ARRAY(rogue_fwif_cmd_frag, regs.pbe_word),
+	PVR_STREAM_DEF(rogue_fwif_cmd_frag, regs.tpu_border_colour_table, 64),
+	PVR_STREAM_DEF_ARRAY(rogue_fwif_cmd_frag, regs.pds_bgnd),
+	PVR_STREAM_DEF_ARRAY(rogue_fwif_cmd_frag, regs.pds_pr_bgnd),
+	PVR_STREAM_DEF_ARRAY(rogue_fwif_cmd_frag, regs.usc_clear_register),
+	PVR_STREAM_DEF(rogue_fwif_cmd_frag, regs.usc_pixel_output_ctrl, 32),
+	PVR_STREAM_DEF(rogue_fwif_cmd_frag, regs.isp_bgobjdepth, 32),
+	PVR_STREAM_DEF(rogue_fwif_cmd_frag, regs.isp_bgobjvals, 32),
+	PVR_STREAM_DEF(rogue_fwif_cmd_frag, regs.isp_aa, 32),
+	PVR_STREAM_DEF_FEATURE(rogue_fwif_cmd_frag, regs.isp_xtp_pipe_enable, 32,
+			       PVR_FEATURE_S7_TOP_INFRASTRUCTURE),
+	PVR_STREAM_DEF(rogue_fwif_cmd_frag, regs.isp_ctl, 32),
+	PVR_STREAM_DEF(rogue_fwif_cmd_frag, regs.event_pixel_pds_info, 32),
+	PVR_STREAM_DEF_FEATURE(rogue_fwif_cmd_frag, regs.pixel_phantom, 32,
+			       PVR_FEATURE_CLUSTER_GROUPING),
+	PVR_STREAM_DEF(rogue_fwif_cmd_frag, regs.view_idx, 32),
+	PVR_STREAM_DEF(rogue_fwif_cmd_frag, regs.event_pixel_pds_data, 32),
+	PVR_STREAM_DEF_FEATURE(rogue_fwif_cmd_frag, regs.isp_oclqry_stride, 32,
+			       PVR_FEATURE_GPU_MULTICORE_SUPPORT),
+	PVR_STREAM_DEF_FEATURE(rogue_fwif_cmd_frag, regs.isp_zls_pixels, 32,
+			       PVR_FEATURE_ZLS_SUBTILE),
+	PVR_STREAM_DEF_FEATURE(rogue_fwif_cmd_frag, regs.rgx_cr_blackpearl_fix, 32,
+			       PVR_FEATURE_ISP_ZLS_D24_S8_PACKING_OGL_MODE),
+	PVR_STREAM_DEF(rogue_fwif_cmd_frag, zls_stride, 32),
+	PVR_STREAM_DEF(rogue_fwif_cmd_frag, sls_stride, 32),
+	PVR_STREAM_DEF_FEATURE(rogue_fwif_cmd_frag, execute_count, 32,
+			       PVR_FEATURE_GPU_MULTICORE_SUPPORT),
+};
+
+static const struct pvr_stream_def rogue_fwif_cmd_frag_stream_brn47217[] = {
+	PVR_STREAM_DEF(rogue_fwif_cmd_frag, regs.isp_oclqry_stride, 32),
+};
+
+static const struct pvr_stream_def rogue_fwif_cmd_frag_stream_brn49927[] = {
+	PVR_STREAM_DEF(rogue_fwif_cmd_frag, regs.tpu, 32),
+};
+
+static const struct pvr_stream_ext_def cmd_frag_ext_streams_0[] = {
+	{
+		.stream = rogue_fwif_cmd_frag_stream_brn47217,
+		.stream_len = ARRAY_SIZE(rogue_fwif_cmd_frag_stream_brn47217),
+		.header_mask = PVR_STREAM_EXTHDR_FRAG0_BRN47217,
+		.quirk = 47217,
+	},
+	{
+		.stream = rogue_fwif_cmd_frag_stream_brn49927,
+		.stream_len = ARRAY_SIZE(rogue_fwif_cmd_frag_stream_brn49927),
+		.header_mask = PVR_STREAM_EXTHDR_FRAG0_BRN49927,
+		.quirk = 49927,
+	},
+};
+
+static const struct pvr_stream_ext_header cmd_frag_ext_headers[] = {
+	{
+		.ext_streams = cmd_frag_ext_streams_0,
+		.ext_streams_num = ARRAY_SIZE(cmd_frag_ext_streams_0),
+		.valid_mask = PVR_STREAM_EXTHDR_FRAG0_VALID,
+	},
+};
+
+const struct pvr_stream_cmd_defs pvr_cmd_frag_stream = {
+	.type = PVR_STREAM_TYPE_FRAG,
+
+	.main_stream = rogue_fwif_cmd_frag_stream,
+	.main_stream_len = ARRAY_SIZE(rogue_fwif_cmd_frag_stream),
+
+	.ext_nr_headers = ARRAY_SIZE(cmd_frag_ext_headers),
+	.ext_headers = cmd_frag_ext_headers,
+
+	.dest_size = sizeof(struct rogue_fwif_cmd_frag),
+};
+
+static const struct pvr_stream_def rogue_fwif_cmd_compute_stream[] = {
+	PVR_STREAM_DEF(rogue_fwif_cmd_compute, regs.tpu_border_colour_table, 64),
+	PVR_STREAM_DEF_FEATURE(rogue_fwif_cmd_compute, regs.cdm_cb_queue, 64,
+			       PVR_FEATURE_CDM_USER_MODE_QUEUE),
+	PVR_STREAM_DEF_FEATURE(rogue_fwif_cmd_compute, regs.cdm_cb_base, 64,
+			       PVR_FEATURE_CDM_USER_MODE_QUEUE),
+	PVR_STREAM_DEF_FEATURE(rogue_fwif_cmd_compute, regs.cdm_cb, 64,
+			       PVR_FEATURE_CDM_USER_MODE_QUEUE),
+	PVR_STREAM_DEF_NOT_FEATURE(rogue_fwif_cmd_compute, regs.cdm_ctrl_stream_base, 64,
+				   PVR_FEATURE_CDM_USER_MODE_QUEUE),
+	PVR_STREAM_DEF(rogue_fwif_cmd_compute, regs.cdm_context_state_base_addr, 64),
+	PVR_STREAM_DEF(rogue_fwif_cmd_compute, regs.cdm_resume_pds1, 32),
+	PVR_STREAM_DEF_FEATURE(rogue_fwif_cmd_compute, regs.cdm_item, 32,
+			       PVR_FEATURE_COMPUTE_MORTON_CAPABLE),
+	PVR_STREAM_DEF_FEATURE(rogue_fwif_cmd_compute, regs.compute_cluster, 32,
+			       PVR_FEATURE_CLUSTER_GROUPING),
+	PVR_STREAM_DEF_FEATURE(rogue_fwif_cmd_compute, regs.tpu_tag_cdm_ctrl, 32,
+			       PVR_FEATURE_TPU_DM_GLOBAL_REGISTERS),
+	PVR_STREAM_DEF_FEATURE(rogue_fwif_cmd_compute, stream_start_offset, 32,
+			       PVR_FEATURE_CDM_USER_MODE_QUEUE),
+	PVR_STREAM_DEF_FEATURE(rogue_fwif_cmd_compute, execute_count, 32,
+			       PVR_FEATURE_GPU_MULTICORE_SUPPORT),
+};
+
+static const struct pvr_stream_def rogue_fwif_cmd_compute_stream_brn49927[] = {
+	PVR_STREAM_DEF(rogue_fwif_cmd_compute, regs.tpu, 32),
+};
+
+static const struct pvr_stream_ext_def cmd_compute_ext_streams_0[] = {
+	{
+		.stream = rogue_fwif_cmd_compute_stream_brn49927,
+		.stream_len = ARRAY_SIZE(rogue_fwif_cmd_compute_stream_brn49927),
+		.header_mask = PVR_STREAM_EXTHDR_COMPUTE0_BRN49927,
+		.quirk = 49927,
+	},
+};
+
+static const struct pvr_stream_ext_header cmd_compute_ext_headers[] = {
+	{
+		.ext_streams = cmd_compute_ext_streams_0,
+		.ext_streams_num = ARRAY_SIZE(cmd_compute_ext_streams_0),
+		.valid_mask = PVR_STREAM_EXTHDR_COMPUTE0_VALID,
+	},
+};
+
+const struct pvr_stream_cmd_defs pvr_cmd_compute_stream = {
+	.type = PVR_STREAM_TYPE_COMPUTE,
+
+	.main_stream = rogue_fwif_cmd_compute_stream,
+	.main_stream_len = ARRAY_SIZE(rogue_fwif_cmd_compute_stream),
+
+	.ext_nr_headers = ARRAY_SIZE(cmd_compute_ext_headers),
+	.ext_headers = cmd_compute_ext_headers,
+
+	.dest_size = sizeof(struct rogue_fwif_cmd_compute),
+};
+
+static const struct pvr_stream_def rogue_fwif_cmd_transfer_stream[] = {
+	PVR_STREAM_DEF(rogue_fwif_cmd_transfer, regs.pds_bgnd0_base, 64),
+	PVR_STREAM_DEF(rogue_fwif_cmd_transfer, regs.pds_bgnd1_base, 64),
+	PVR_STREAM_DEF(rogue_fwif_cmd_transfer, regs.pds_bgnd3_sizeinfo, 64),
+	PVR_STREAM_DEF(rogue_fwif_cmd_transfer, regs.isp_mtile_base, 64),
+	PVR_STREAM_DEF_ARRAY(rogue_fwif_cmd_transfer, regs.pbe_wordx_mrty),
+	PVR_STREAM_DEF(rogue_fwif_cmd_transfer, regs.isp_bgobjvals, 32),
+	PVR_STREAM_DEF(rogue_fwif_cmd_transfer, regs.usc_pixel_output_ctrl, 32),
+	PVR_STREAM_DEF(rogue_fwif_cmd_transfer, regs.usc_clear_register0, 32),
+	PVR_STREAM_DEF(rogue_fwif_cmd_transfer, regs.usc_clear_register1, 32),
+	PVR_STREAM_DEF(rogue_fwif_cmd_transfer, regs.usc_clear_register2, 32),
+	PVR_STREAM_DEF(rogue_fwif_cmd_transfer, regs.usc_clear_register3, 32),
+	PVR_STREAM_DEF(rogue_fwif_cmd_transfer, regs.isp_mtile_size, 32),
+	PVR_STREAM_DEF(rogue_fwif_cmd_transfer, regs.isp_render_origin, 32),
+	PVR_STREAM_DEF(rogue_fwif_cmd_transfer, regs.isp_ctl, 32),
+	PVR_STREAM_DEF(rogue_fwif_cmd_transfer, regs.isp_aa, 32),
+	PVR_STREAM_DEF(rogue_fwif_cmd_transfer, regs.event_pixel_pds_info, 32),
+	PVR_STREAM_DEF(rogue_fwif_cmd_transfer, regs.event_pixel_pds_code, 32),
+	PVR_STREAM_DEF(rogue_fwif_cmd_transfer, regs.event_pixel_pds_data, 32),
+	PVR_STREAM_DEF(rogue_fwif_cmd_transfer, regs.isp_render, 32),
+	PVR_STREAM_DEF(rogue_fwif_cmd_transfer, regs.isp_rgn, 32),
+	PVR_STREAM_DEF_FEATURE(rogue_fwif_cmd_transfer, regs.isp_xtp_pipe_enable, 32,
+			       PVR_FEATURE_S7_TOP_INFRASTRUCTURE),
+	PVR_STREAM_DEF_FEATURE(rogue_fwif_cmd_transfer, regs.frag_screen, 32,
+			       PVR_FEATURE_GPU_MULTICORE_SUPPORT),
+};
+
+const struct pvr_stream_cmd_defs pvr_cmd_transfer_stream = {
+	.type = PVR_STREAM_TYPE_TRANSFER,
+
+	.main_stream = rogue_fwif_cmd_transfer_stream,
+	.main_stream_len = ARRAY_SIZE(rogue_fwif_cmd_transfer_stream),
+
+	.ext_nr_headers = 0,
+
+	.dest_size = sizeof(struct rogue_fwif_cmd_transfer),
+};
+
 static const struct pvr_stream_def rogue_fwif_static_render_context_state_stream[] = {
 	PVR_STREAM_DEF(rogue_fwif_geom_registers_caswitch,
 		       geom_reg_vdm_context_state_base_addr, 64),
-- 
2.40.1

