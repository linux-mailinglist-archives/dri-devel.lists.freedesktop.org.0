Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 84AFD72E6F4
	for <lists+dri-devel@lfdr.de>; Tue, 13 Jun 2023 17:20:55 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CDD3010E3B8;
	Tue, 13 Jun 2023 15:20:35 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx07-00376f01.pphosted.com (mx07-00376f01.pphosted.com
 [185.132.180.163])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3366110E3AC
 for <dri-devel@lists.freedesktop.org>; Tue, 13 Jun 2023 15:20:27 +0000 (UTC)
Received: from pps.filterd (m0168889.ppops.net [127.0.0.1])
 by mx07-00376f01.pphosted.com (8.17.1.22/8.17.1.22) with ESMTP id
 35D6uk03011744; Tue, 13 Jun 2023 15:48:25 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=imgtec.com; h=
 from:to:cc:subject:date:message-id:in-reply-to:references
 :content-transfer-encoding:content-type:mime-version; s=
 dk201812; bh=Ug1A3IoqyT8rbf/0f/Ym7VsHF1i0TyXAgLHfHOUVHlg=; b=SNR
 P03o/ep576crWi/Y78IAPR24Drs2eyFIRQ3F/KWm8DI+1KYpRD5oEcmfArmn1aOn
 nWj1LrpfHN3Z2sdCu5LF05GG9f63dH6MiyW0AZFrameXPHwHVTSOGTbB2hc+pJqG
 aLe/CWiWPS7LP2W4u4+qlthlWkKVi1lBFJsH5lza1GUzoitbr+KYWXGujHiqn5CX
 EYc7I88dFVaXAWwffFH3BZyMpwAriRP8XXti9fftuSJ5uaw5y5sc2WvmKvrwr7vC
 RNGSX7c5bJTmntpMQ3JIpdSaLHz8bsCBWfg9NsC4Victa/WV+AlDb8Q0gUthMAg3
 Y2EEEmLN4eQavKY0zPg==
Received: from hhmail05.hh.imgtec.org ([217.156.249.195])
 by mx07-00376f01.pphosted.com (PPS) with ESMTPS id 3r4vqbt0kc-4
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT);
 Tue, 13 Jun 2023 15:48:24 +0100 (BST)
Received: from HHMAIL05.hh.imgtec.org (10.100.10.120) by
 HHMAIL05.hh.imgtec.org (10.100.10.120) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.23; Tue, 13 Jun 2023 15:48:23 +0100
Received: from GBR01-CWL-obe.outbound.protection.outlook.com (104.47.20.58) by
 email.imgtec.com (10.100.10.121) with Microsoft SMTP Server
 (version=TLS1_2, 
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.23 via Frontend
 Transport; Tue, 13 Jun 2023 15:48:23 +0100
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=CZ1V18K13ZXHSihUaIIzqfHn+vncu8fc0pQ4EwHCNtSMz/7zNBc9KnVtKeX194SQ5ko6qaQHLjdO1VCDE00wQVRpho1FTwa6MyFJ2C3khabDRaSglcc6Hq91h1d7NIksDgrvV/DsntijAGZMCHyEbGcnSIUYRn8wdei/Bw2Hshdrd0HIeqtraRczSzUEj6y7iY5iM8B6qZrQGgxmvxb9NovbrYpNDhbpCoeUGMvVi4wtqNcCFSx6TDI6Ubhum0E+30BpeXvR3knDW9w1psXwU+DvBiT/kCw50OemmWs88eDds5M0cao5Y93smxMlhRDh7eNlrL8CjTPh8Nv+BFgEmA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Ug1A3IoqyT8rbf/0f/Ym7VsHF1i0TyXAgLHfHOUVHlg=;
 b=KtMgVY+PIJjhN6emFau5w0fT9JuXkEHOED74CQdpOjeo5ufeJDi75lenqgb/XK5x4iiJ5j5NDKJc7SvKVQwSyyES6NPsUbsZixCwzpCZgut/rMxY+aNBSkDy/YHhrcPwJ9yKNHD4KkMPP8f3+LCbfqS9TBRNYAy9FUgtg/1k73WoNVKeHMgwOqVOcgytzrAnoOOFptR2V0jHd8n+Oc6+awQ9L2a2D4jk7w2+BLof4Pn07vwcdQVSw1aYknEXOcIW9xZIBa28O4w34q10FWJpxXv3X191CgS4jK0fjvHrZ+FmAGfmbeuBqQVOGdDHzrTa7f6iTfeSxLFrjD53AZRAjA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=imgtec.com; dmarc=pass action=none header.from=imgtec.com;
 dkim=pass header.d=imgtec.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=IMGTecCRM.onmicrosoft.com; s=selector2-IMGTecCRM-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Ug1A3IoqyT8rbf/0f/Ym7VsHF1i0TyXAgLHfHOUVHlg=;
 b=YMASaVBPLHu/rlXO/7YzdIv7NoRXTO4hhNakKTOLOmJpEPVbIPVwYtUP8IYmvB/5ye1W7CcS2ykrm7JocF6leQhmWw7SAnNlFqY2Kobo37gl/0D8pjMJDftLu+zZRlraDZv0HdN110JlI6v/r+VxK8Ti6yvnFNLDPImu8ec1guU=
Received: from CWXP265MB4826.GBRP265.PROD.OUTLOOK.COM (2603:10a6:400:155::11)
 by LO3P265MB2282.GBRP265.PROD.OUTLOOK.COM (2603:10a6:600:100::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6500.21; Tue, 13 Jun
 2023 14:48:18 +0000
Received: from CWXP265MB4826.GBRP265.PROD.OUTLOOK.COM
 ([fe80::23bd:d6e:8ecc:fa5f]) by CWXP265MB4826.GBRP265.PROD.OUTLOOK.COM
 ([fe80::23bd:d6e:8ecc:fa5f%5]) with mapi id 15.20.6500.020; Tue, 13 Jun 2023
 14:48:18 +0000
From: Sarah Walker <sarah.walker@imgtec.com>
To: <dri-devel@lists.freedesktop.org>
Subject: [PATCH v3 10/17] drm/imagination: Implement firmware infrastructure
 and META FW support
Date: Tue, 13 Jun 2023 15:47:53 +0100
Message-Id: <20230613144800.52657-11-sarah.walker@imgtec.com>
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
X-MS-Office365-Filtering-Correlation-Id: 99e36cd5-e764-49ba-a96f-08db6c1d39a4
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: eXkzCPab8DnLXzpiDxkSZTpi1qwn/6m6jeJTivHMQE3dQwqzB3oewqehSxz3b6j9k80S4okRsJ6TIFksAKNx3AKIOSsYNzI4NRDvNkViYkDn9t462cKSeXz7kEWtRFYcfx4afmjmy3crTfKz1Sib9gi3uxTobfrwEhkSpvbv1lPvy0VslbwZKjvuhZo5UcMMPtTO2oheTqEVXr3/cXlXQFg14zsmqSNL0ou589A9RPBOm69zEq6YaLoZ4CpNjMfNT3D8rsXtcqe2dzwcHp5aHiVsshj94MUvmb196tCmU0SPbIc3TicgCmmpnOxeR0eqHMd6P6URl5N+4QwkmQ5Jd7Eif02ZBSslHfKiRegnLibeti2y3e46fSQKQDJpMIl2XTzzkmaQzATbuz7cNIji1RTedfo3PA2kMnsZsN3hpPw4cM9LuMAaBE3MuF/QSDKOR5ArufkvWmu0Jf2FEGZvzX/AKx6ZypnpwH5qcY6Dth7+Xsdl/FcVmX0xNv4WUsSFqY+6gE0Guj4XiqIaYI5mBKZplgsyJxJP++KBWBkVojuBYAUpjSsficfJ4I2hlx6KJRvDHZOO01B627X2IP2Jng==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CWXP265MB4826.GBRP265.PROD.OUTLOOK.COM; PTR:; CAT:NONE;
 SFS:(13230028)(396003)(366004)(136003)(376002)(346002)(39840400004)(451199021)(44832011)(4326008)(8936002)(316002)(7416002)(66946007)(6916009)(66476007)(41300700001)(186003)(2906002)(30864003)(66556008)(478600001)(8676002)(5660300002)(6666004)(966005)(52116002)(6486002)(6512007)(1076003)(6506007)(26005)(83380400001)(36756003)(86362001)(2616005)(38350700002)(38100700002)(579004)(559001)(134885004);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?8edoB4NxwuaVCVAs8fDg9eeH/bQatfi+MHBUl2Ik7YMy9DvpEdZqmN0+vl8W?=
 =?us-ascii?Q?zp+uiwwUzdxIDgB2NJh4ddoCQ8A7v4/BXFt8jpqB4B3OxeXCvPMEDF0by1no?=
 =?us-ascii?Q?C0VMB1P/kNFHmhZ/l0RD2hL9aYJyRgqQ2nPlrBvZTBbdqGBMzlW4LDPsL8up?=
 =?us-ascii?Q?KIRHPjzojmSQrhnGHizi0RM7YrMgi4doLa8ntBREH2hZo1r2jWr3PJPjnAaj?=
 =?us-ascii?Q?/iEbMulVKTA3doAtc5rWOyYuD4V3oUXdnX31oSUk641Qgrd2Mkz9Q7StTBNz?=
 =?us-ascii?Q?uQxJ8ocyGltHP8Yyby0qBhAqX2FHLDC7MXTMzSKYoCw4iUmbddbjvgM5u0//?=
 =?us-ascii?Q?xylCEdwkHKTFc6SHoWfIBkLSpwZ9MN6S4/Dzas93//RAq/mreRbivV6aIVAd?=
 =?us-ascii?Q?WUZclBUDAXgv2BYhS0dlhEGbg1Z4JmPE5nC9V04IRsmYhUZvNs+FuT1RcuXj?=
 =?us-ascii?Q?L25NEsFpIYJs89sqpe8HdnHffBec2+jULNxUfV1DTNlWcGHy24/G034mlmAn?=
 =?us-ascii?Q?8Opd3evGWSiSaRQaJuE+i3V9hHnC/HrwbOBuOvnooCvgWQR6brxf+bvi7FsK?=
 =?us-ascii?Q?xUq50iM0SBm/f49JoXfYlQxRFCAh+Gec7yy4eUb+0Q0fVqBUDFhEg+fbobII?=
 =?us-ascii?Q?Hv+zn4GkuufEetu25ONhYQ7ndKgVy5jWaBXB+FSGkN3k5s5FO9N1Xi5FEkfr?=
 =?us-ascii?Q?7i8mOB3YSXr7n4ZKV5k/9GDtGWrivmbCWOFgEAgw5R/mBssACv0PxHlIkxDA?=
 =?us-ascii?Q?tWYFmK0lVByEVfdOmale6yweKbBRypvlhUBOE3Wwlpv88CVqQ/pe4a3pR74y?=
 =?us-ascii?Q?oCuNdAFRIaKu+iy97cFxOJ29G2GfPyp10uQcYSuGNiVPN0xrR+nuLmFs00NZ?=
 =?us-ascii?Q?9p8TTTpcguFM839O/CUnn3S/gO4yFhPd7OWLHMXK5/pF8UZR6jsQavdF+R+3?=
 =?us-ascii?Q?3AB9ZuQOazpNUN6ShOiR6npfjkyz4IGhsyx99bFpGG2YEf5/JsED9Hlw+Pho?=
 =?us-ascii?Q?CnDno+8NVpp+Gd/V7Um3U6gde6WOlYRXNjc2dCAeprwvIETVYSFJW+cY4OEL?=
 =?us-ascii?Q?V2BMh6BPrwyFIZ/FwKuvrejP/enXAxOvXcs0KHG7fvwxsa2cJlLVBxv2i49V?=
 =?us-ascii?Q?0oK8FsP9b/zLqdjUcISYLEB8RZk4mO2xndEl5A8cQoXnOIRecfxXfADYe0Rc?=
 =?us-ascii?Q?5VoE45iAz1+9mNZOK3iXk27SNOmOZ/jc4vfHY5Ao9gvPe953dk6waYBKgQVe?=
 =?us-ascii?Q?R580cxBHE5Lx5+1/303FLq93n9iniLFOuKjEHVVq9q3EUmI0OO20alijmmRX?=
 =?us-ascii?Q?Es6fH1uEiXVaVZAYojiy+MVRVOBI2C5I2z0JjFmk3UMt33/dR7R56g7N7OB5?=
 =?us-ascii?Q?7t33Y4+W31K1wPNEMb5AZWVGM/p/3NWHLCgGHQwW85wepjMP0wzRGGUYOdHD?=
 =?us-ascii?Q?5zm8TZFXkIumJ+7UvgJuLY6sDDhqKNImtA6uobeT1Ngh5CH+jV1HLCcZt7uv?=
 =?us-ascii?Q?m6+84/jZSJ13u/eK2R5ayB5c1RTor+S1QiorZJ1NVIrIt4cK3lDKKHeVeus0?=
 =?us-ascii?Q?if8QzAACxrIojV26ORHyNBTA5DjaxQFyOOQ/FMxGv6gHDD/mmsAVCpzLTZY3?=
 =?us-ascii?Q?Yg=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 99e36cd5-e764-49ba-a96f-08db6c1d39a4
X-MS-Exchange-CrossTenant-AuthSource: CWXP265MB4826.GBRP265.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 Jun 2023 14:48:18.3232 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 0d5fd8bb-e8c2-4e0a-8dd5-2c264f7140fe
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 4uHXYz6o1liJ0euOlDS4txPPF7WSqVfHJl50yvSFDSp2QKmIBpCFPIKINIIzeLN/xnLr64okoCajyDWwErs7tg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LO3P265MB2282
X-OriginatorOrg: imgtec.com
X-EXCLAIMER-MD-CONFIG: 15a78312-3e47-46eb-9010-2e54d84a9631
X-Proofpoint-ORIG-GUID: 0JIJ5d5sq3FeRmQlT4kNp09QaxjfN0Ef
X-Proofpoint-GUID: 0JIJ5d5sq3FeRmQlT4kNp09QaxjfN0Ef
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

The infrastructure includes parsing of the firmware image, initialising
FW-side structures, handling the kernel and firmware command
ringbuffers and starting & stopping the firmware processor.

This patch also adds the necessary support code for the META firmware
processor.

This patch depends on:
drm: fix drmm_mutex_init(): https://lists.freedesktop.org/archives/dri-devel/2023-May/404863.html

Signed-off-by: Sarah Walker <sarah.walker@imgtec.com>
---
 drivers/gpu/drm/imagination/Makefile          |    5 +
 drivers/gpu/drm/imagination/pvr_ccb.c         |  637 ++++++++
 drivers/gpu/drm/imagination/pvr_ccb.h         |   62 +
 drivers/gpu/drm/imagination/pvr_device.c      |   89 +-
 drivers/gpu/drm/imagination/pvr_device.h      |   56 +
 drivers/gpu/drm/imagination/pvr_fw.c          | 1386 +++++++++++++++++
 drivers/gpu/drm/imagination/pvr_fw.h          |  409 ++++-
 drivers/gpu/drm/imagination/pvr_fw_info.h     |  115 ++
 drivers/gpu/drm/imagination/pvr_fw_meta.c     |  610 ++++++++
 drivers/gpu/drm/imagination/pvr_fw_meta.h     |   14 +
 .../gpu/drm/imagination/pvr_fw_startstop.c    |  280 ++++
 .../gpu/drm/imagination/pvr_fw_startstop.h    |   13 +
 drivers/gpu/drm/imagination/pvr_fw_trace.c    |   99 ++
 drivers/gpu/drm/imagination/pvr_fw_trace.h    |   78 +
 drivers/gpu/drm/imagination/pvr_power.c       |   94 +-
 drivers/gpu/drm/imagination/pvr_vm.c          |   45 +-
 16 files changed, 3973 insertions(+), 19 deletions(-)
 create mode 100644 drivers/gpu/drm/imagination/pvr_ccb.c
 create mode 100644 drivers/gpu/drm/imagination/pvr_ccb.h
 create mode 100644 drivers/gpu/drm/imagination/pvr_fw.c
 create mode 100644 drivers/gpu/drm/imagination/pvr_fw_info.h
 create mode 100644 drivers/gpu/drm/imagination/pvr_fw_meta.c
 create mode 100644 drivers/gpu/drm/imagination/pvr_fw_meta.h
 create mode 100644 drivers/gpu/drm/imagination/pvr_fw_startstop.c
 create mode 100644 drivers/gpu/drm/imagination/pvr_fw_startstop.h
 create mode 100644 drivers/gpu/drm/imagination/pvr_fw_trace.c
 create mode 100644 drivers/gpu/drm/imagination/pvr_fw_trace.h

diff --git a/drivers/gpu/drm/imagination/Makefile b/drivers/gpu/drm/imagination/Makefile
index 00036b075505..f6fe9fbea094 100644
--- a/drivers/gpu/drm/imagination/Makefile
+++ b/drivers/gpu/drm/imagination/Makefile
@@ -4,9 +4,14 @@
 subdir-ccflags-y := -I$(srctree)/$(src)
 
 powervr-y := \
+	pvr_ccb.o \
 	pvr_device.o \
 	pvr_device_info.o \
 	pvr_drv.o \
+	pvr_fw.o \
+	pvr_fw_meta.o \
+	pvr_fw_startstop.o \
+	pvr_fw_trace.o \
 	pvr_gem.o \
 	pvr_power.o \
 	pvr_vm.o
diff --git a/drivers/gpu/drm/imagination/pvr_ccb.c b/drivers/gpu/drm/imagination/pvr_ccb.c
new file mode 100644
index 000000000000..621470d04ea8
--- /dev/null
+++ b/drivers/gpu/drm/imagination/pvr_ccb.c
@@ -0,0 +1,637 @@
+// SPDX-License-Identifier: GPL-2.0 OR MIT
+/* Copyright (c) 2022 Imagination Technologies Ltd. */
+
+#include "pvr_ccb.h"
+#include "pvr_device.h"
+#include "pvr_drv.h"
+#include "pvr_fw.h"
+#include "pvr_gem.h"
+#include "pvr_power.h"
+
+#include <drm/drm_managed.h>
+#include <linux/compiler.h>
+#include <linux/delay.h>
+#include <linux/jiffies.h>
+#include <linux/kernel.h>
+#include <linux/mutex.h>
+#include <linux/types.h>
+#include <linux/workqueue.h>
+
+#define RESERVE_SLOT_TIMEOUT (1 * HZ) /* 1s */
+
+/**
+ * pvr_ccb_init() - Initialise a CCB
+ * @pvr_dev: Device pointer.
+ * @pvr_ccb: Pointer to CCB structure to initialise.
+ * @num_cmds_log2: Log2 of number of commands in this CCB.
+ * @cmd_size: Command size for this CCB.
+ *
+ * Return:
+ *  * Zero on success, or
+ *  * Any error code returned by pvr_fw_object_create_and_map().
+ */
+static int
+pvr_ccb_init(struct pvr_device *pvr_dev, struct pvr_ccb *pvr_ccb,
+	     u32 num_cmds_log2, size_t cmd_size)
+{
+	u32 num_cmds = 1 << num_cmds_log2;
+	u32 ccb_size = num_cmds * cmd_size;
+	int err;
+
+	err = drmm_mutex_init(from_pvr_device(pvr_dev), &pvr_ccb->lock);
+	if (err)
+		goto err_out;
+
+	/*
+	 * Map CCB and control structure as uncached, so we don't have to flush
+	 * CPU cache repeatedly when polling for space.
+	 */
+	pvr_ccb->ctrl = pvr_fw_object_create_and_map(pvr_dev, sizeof(*pvr_ccb->ctrl),
+						     PVR_BO_FW_FLAGS_DEVICE_UNCACHED,
+						     &pvr_ccb->ctrl_obj);
+	if (IS_ERR(pvr_ccb->ctrl)) {
+		err = PTR_ERR(pvr_ccb->ctrl);
+		goto err_out;
+	}
+
+	pvr_ccb->ccb = pvr_fw_object_create_and_map(pvr_dev, ccb_size,
+						    PVR_BO_FW_FLAGS_DEVICE_UNCACHED |
+						    DRM_PVR_BO_CREATE_ZEROED,
+						    &pvr_ccb->ccb_obj);
+	if (IS_ERR(pvr_ccb->ccb)) {
+		err = PTR_ERR(pvr_ccb->ccb);
+		goto err_free_ctrl;
+	}
+
+	pvr_fw_object_get_fw_addr(pvr_ccb->ctrl_obj, &pvr_ccb->ctrl_fw_addr);
+	pvr_fw_object_get_fw_addr(pvr_ccb->ccb_obj, &pvr_ccb->ccb_fw_addr);
+
+	WRITE_ONCE(pvr_ccb->ctrl->write_offset, 0);
+	WRITE_ONCE(pvr_ccb->ctrl->read_offset, 0);
+	WRITE_ONCE(pvr_ccb->ctrl->wrap_mask, num_cmds - 1);
+	WRITE_ONCE(pvr_ccb->ctrl->cmd_size, cmd_size);
+
+	return 0;
+
+err_free_ctrl:
+	pvr_fw_object_unmap_and_destroy(pvr_ccb->ctrl_obj);
+
+err_out:
+	return err;
+}
+
+/**
+ * pvr_ccb_fini() - Release CCB structure
+ * @pvr_ccb: CCB to release.
+ */
+void
+pvr_ccb_fini(struct pvr_ccb *pvr_ccb)
+{
+	pvr_fw_object_unmap_and_destroy(pvr_ccb->ccb_obj);
+	pvr_fw_object_unmap_and_destroy(pvr_ccb->ctrl_obj);
+}
+
+/**
+ * pvr_ccb_slot_available_locked() - Test whether any slots are available in CCB
+ * @pvr_ccb: CCB to test.
+ * @write_offset: Address to store number of next available slot. May be %NULL.
+ *
+ * Caller must hold @pvr_ccb->lock.
+ *
+ * Return:
+ *  * %true if a slot is available, or
+ *  * %false if no slot is available.
+ */
+static __always_inline bool
+pvr_ccb_slot_available_locked(struct pvr_ccb *pvr_ccb, u32 *write_offset)
+{
+	struct rogue_fwif_ccb_ctl *ctrl = pvr_ccb->ctrl;
+	u32 next_write_offset = (READ_ONCE(ctrl->write_offset) + 1) & READ_ONCE(ctrl->wrap_mask);
+
+	lockdep_assert_held(&pvr_ccb->lock);
+
+	if (READ_ONCE(ctrl->read_offset) != next_write_offset) {
+		if (write_offset)
+			*write_offset = next_write_offset;
+		return true;
+	}
+
+	return false;
+}
+
+static void
+process_fwccb_command(struct pvr_device *pvr_dev, struct rogue_fwif_fwccb_cmd *cmd)
+{
+	switch (cmd->cmd_type) {
+	case ROGUE_FWIF_FWCCB_CMD_REQUEST_GPU_RESTART:
+		WARN_ON(pvr_power_reset(pvr_dev));
+		break;
+
+	default:
+		drm_info(from_pvr_device(pvr_dev), "Received unknown FWCCB command %x\n",
+			 cmd->cmd_type);
+		break;
+	}
+}
+
+/**
+ * pvr_fwccb_process_worker() - Process any pending FWCCB commands
+ * @work: Work item.
+ *
+ * For this initial implementation, FWCCB commands will be printed to the console but otherwise not
+ * processed.
+ */
+static void
+pvr_fwccb_process_worker(struct work_struct *work)
+{
+	struct pvr_device *pvr_dev = container_of(work, struct pvr_device, fwccb_work);
+	struct rogue_fwif_fwccb_cmd *fwccb = pvr_dev->fwccb.ccb;
+	struct rogue_fwif_ccb_ctl *ctrl = pvr_dev->fwccb.ctrl;
+	u32 read_offset;
+
+	mutex_lock(&pvr_dev->fwccb.lock);
+
+	while ((read_offset = READ_ONCE(ctrl->read_offset)) != READ_ONCE(ctrl->write_offset)) {
+		struct rogue_fwif_fwccb_cmd cmd = fwccb[read_offset];
+
+		WRITE_ONCE(ctrl->read_offset, (read_offset + 1) & READ_ONCE(ctrl->wrap_mask));
+
+		/* Drop FWCCB lock while we process command. */
+		mutex_unlock(&pvr_dev->fwccb.lock);
+
+		process_fwccb_command(pvr_dev, &cmd);
+
+		mutex_lock(&pvr_dev->fwccb.lock);
+	}
+
+	mutex_unlock(&pvr_dev->fwccb.lock);
+}
+
+/**
+ * pvr_kccb_capacity() - Returns the maximum number of usable KCCB slots.
+ * @pvr_dev: Target PowerVR device
+ *
+ * Return:
+ *  * The maximum number of active slots.
+ */
+static u32 pvr_kccb_capacity(struct pvr_device *pvr_dev)
+{
+	/* Capacity is the number of slot minus one to cope with the wrapping
+	 * mechanisms. If we were to use all slots, we might end up with
+	 * read_offset == write_offset, which the FW considers as a KCCB-is-empty
+	 * condition.
+	 */
+	return pvr_dev->kccb.slot_count - 1;
+}
+
+/**
+ * pvr_kccb_used_slot_count_locked() - Get the number of used slots
+ * @pvr_dev: Device pointer.
+ *
+ * KCCB lock must be held.
+ *
+ * Return:
+ *  * The number of slots currently used.
+ */
+static u32
+pvr_kccb_used_slot_count_locked(struct pvr_device *pvr_dev)
+{
+	struct pvr_ccb *pvr_ccb = &pvr_dev->kccb.ccb;
+	struct rogue_fwif_ccb_ctl *ctrl = pvr_ccb->ctrl;
+	u32 wr_offset = READ_ONCE(ctrl->write_offset);
+	u32 rd_offset = READ_ONCE(ctrl->read_offset);
+	u32 used_count;
+
+	lockdep_assert_held(&pvr_ccb->lock);
+
+	if (wr_offset >= rd_offset)
+		used_count = wr_offset - rd_offset;
+	else
+		used_count = wr_offset + pvr_dev->kccb.slot_count - rd_offset;
+
+	return used_count;
+}
+
+/**
+ * pvr_kccb_send_cmd_reserved_powered() - Send command to the KCCB, with the PM ref
+ * held and a slot pre-reserved
+ * @pvr_dev: Device pointer.
+ * @cmd: Command to sent.
+ * @kccb_slot: Address to store the KCCB slot for this command. May be %NULL.
+ */
+void
+pvr_kccb_send_cmd_reserved_powered(struct pvr_device *pvr_dev,
+				   struct rogue_fwif_kccb_cmd *cmd,
+				   u32 *kccb_slot)
+{
+	struct pvr_ccb *pvr_ccb = &pvr_dev->kccb.ccb;
+	struct rogue_fwif_kccb_cmd *kccb = pvr_ccb->ccb;
+	struct rogue_fwif_ccb_ctl *ctrl = pvr_ccb->ctrl;
+	u32 old_write_offset;
+	u32 new_write_offset;
+
+	WARN_ON(pvr_dev->lost);
+
+	mutex_lock(&pvr_ccb->lock);
+
+	if (WARN_ON(!pvr_dev->kccb.reserved_count))
+		goto out_unlock;
+
+	old_write_offset = READ_ONCE(ctrl->write_offset);
+
+	/* We reserved the slot, we should have one available. */
+	if (WARN_ON(!pvr_ccb_slot_available_locked(pvr_ccb, &new_write_offset)))
+		goto out_unlock;
+
+	memcpy(&kccb[old_write_offset], cmd,
+	       sizeof(struct rogue_fwif_kccb_cmd));
+	if (kccb_slot) {
+		*kccb_slot = old_write_offset;
+		/* Clear return status for this slot. */
+		WRITE_ONCE(pvr_dev->kccb.rtn[old_write_offset],
+			   ROGUE_FWIF_KCCB_RTN_SLOT_NO_RESPONSE);
+	}
+	mb(); /* memory barrier */
+	WRITE_ONCE(ctrl->write_offset, new_write_offset);
+	pvr_dev->kccb.reserved_count--;
+
+	/* Kick MTS */
+	pvr_fw_mts_schedule(pvr_dev,
+			    PVR_FWIF_DM_GP & ~ROGUE_CR_MTS_SCHEDULE_DM_CLRMSK);
+
+out_unlock:
+	mutex_unlock(&pvr_ccb->lock);
+}
+
+/**
+ * pvr_kccb_try_reserve_slot() - Try to reserve a KCCB slot
+ * @pvr_dev: Device pointer.
+ *
+ * Return:
+ *  * true if a KCCB slot was reserved, or
+ *  * false otherwise.
+ */
+static bool pvr_kccb_try_reserve_slot(struct pvr_device *pvr_dev)
+{
+	bool reserved = false;
+	u32 used_count;
+
+	mutex_lock(&pvr_dev->kccb.ccb.lock);
+
+	used_count = pvr_kccb_used_slot_count_locked(pvr_dev);
+	if (pvr_dev->kccb.reserved_count < pvr_kccb_capacity(pvr_dev) - used_count) {
+		pvr_dev->kccb.reserved_count++;
+		reserved = true;
+	}
+
+	mutex_unlock(&pvr_dev->kccb.ccb.lock);
+
+	return reserved;
+}
+
+/**
+ * pvr_kccb_reserve_slot_sync() - Try to reserve a slot synchronously
+ * @pvr_dev: Device pointer.
+ *
+ * Return:
+ *  * 0 on success, or
+ *  * -EBUSY if now slots were reserved after %RESERVE_SLOT_TIMEOUT.
+ */
+static int pvr_kccb_reserve_slot_sync(struct pvr_device *pvr_dev)
+{
+	unsigned long start_timestamp = jiffies;
+	bool reserved = false;
+
+	while ((jiffies - start_timestamp) < (u32)RESERVE_SLOT_TIMEOUT) {
+		reserved = pvr_kccb_try_reserve_slot(pvr_dev);
+		if (reserved)
+			break;
+
+		usleep_range(1, 50);
+	}
+
+	return reserved ? 0 : -EBUSY;
+}
+
+/**
+ * pvr_kccb_send_cmd_powered() - Send command to the KCCB, with a PM ref held
+ * @pvr_dev: Device pointer.
+ * @cmd: Command to sent.
+ * @kccb_slot: Address to store the KCCB slot for this command. May be %NULL.
+ *
+ * Returns:
+ *  * Zero on success, or
+ *  * -EBUSY if timeout while waiting for a free KCCB slot.
+ */
+int
+pvr_kccb_send_cmd_powered(struct pvr_device *pvr_dev, struct rogue_fwif_kccb_cmd *cmd,
+			  u32 *kccb_slot)
+{
+	int err;
+
+	err = pvr_kccb_reserve_slot_sync(pvr_dev);
+	if (err)
+		return err;
+
+	pvr_kccb_send_cmd_reserved_powered(pvr_dev, cmd, kccb_slot);
+	return 0;
+}
+
+/**
+ * pvr_kccb_send_cmd() - Send command to the KCCB
+ * @pvr_dev: Device pointer.
+ * @cmd: Command to sent.
+ * @kccb_slot: Address to store the KCCB slot for this command. May be %NULL.
+ *
+ * Returns:
+ *  * Zero on success, or
+ *  * -EBUSY if timeout while waiting for a free KCCB slot.
+ */
+int
+pvr_kccb_send_cmd(struct pvr_device *pvr_dev, struct rogue_fwif_kccb_cmd *cmd,
+		  u32 *kccb_slot)
+{
+	int err;
+
+	err = pvr_power_get(pvr_dev);
+	if (err)
+		return err;
+
+	err = pvr_kccb_send_cmd_powered(pvr_dev, cmd, kccb_slot);
+
+	pvr_power_put(pvr_dev);
+
+	return err;
+}
+
+/**
+ * pvr_kccb_wait_for_completion() - Wait for a KCCB command to complete
+ * @pvr_dev: Device pointer.
+ * @slot_nr: KCCB slot to wait on.
+ * @timeout: Timeout length (in jiffies).
+ * @rtn_out: Location to store KCCB command result. May be %NULL.
+ *
+ * Returns:
+ *  * Zero on success, or
+ *  * -ETIMEDOUT on timeout.
+ */
+int
+pvr_kccb_wait_for_completion(struct pvr_device *pvr_dev, u32 slot_nr,
+			     u32 timeout, u32 *rtn_out)
+{
+	int ret = wait_event_timeout(pvr_dev->kccb.rtn_q, READ_ONCE(pvr_dev->kccb.rtn[slot_nr]) &
+				     ROGUE_FWIF_KCCB_RTN_SLOT_CMD_EXECUTED, timeout);
+
+	if (ret && rtn_out)
+		*rtn_out = READ_ONCE(pvr_dev->kccb.rtn[slot_nr]);
+
+	return ret ? 0 : -ETIMEDOUT;
+}
+
+/**
+ * pvr_kccb_is_idle() - Returns whether the device's KCCB is idle
+ * @pvr_dev: Device pointer
+ *
+ * Returns:
+ *  * %true if the KCCB is idle (contains no commands), or
+ *  * %false if the KCCB contains pending commands.
+ */
+bool
+pvr_kccb_is_idle(struct pvr_device *pvr_dev)
+{
+	struct rogue_fwif_ccb_ctl *ctrl = pvr_dev->kccb.ccb.ctrl;
+	bool idle;
+
+	mutex_lock(&pvr_dev->kccb.ccb.lock);
+
+	idle = (READ_ONCE(ctrl->write_offset) == READ_ONCE(ctrl->read_offset));
+
+	mutex_unlock(&pvr_dev->kccb.ccb.lock);
+
+	return idle;
+}
+
+static const char *
+pvr_kccb_fence_get_driver_name(struct dma_fence *f)
+{
+	return PVR_DRIVER_NAME;
+}
+
+static const char *
+pvr_kccb_fence_get_timeline_name(struct dma_fence *f)
+{
+	return "kccb";
+}
+
+static const struct dma_fence_ops pvr_kccb_fence_ops = {
+	.get_driver_name = pvr_kccb_fence_get_driver_name,
+	.get_timeline_name = pvr_kccb_fence_get_timeline_name,
+};
+
+/**
+ * struct pvr_kccb_fence - Fence object used to wait for a KCCB slot
+ */
+struct pvr_kccb_fence {
+	/** @base: Base dma_fence object. */
+	struct dma_fence base;
+
+	/** @node: Node used to insert the fence in the pvr_device::kccb::waiters list. */
+	struct list_head node;
+};
+
+/**
+ * pvr_kccb_check_waiters() - Check the KCCB waiters
+ * @pvr_dev: Target PowerVR device
+ *
+ * Signal as many KCCB fences as we have slots available.
+ */
+static void pvr_kccb_check_waiters(struct pvr_device *pvr_dev)
+{
+	struct pvr_kccb_fence *fence, *tmp_fence;
+	u32 used_count, available_count;
+
+	/* Then iterate over all KCCB fences and signal as many as we can. */
+	mutex_lock(&pvr_dev->kccb.ccb.lock);
+	used_count = pvr_kccb_used_slot_count_locked(pvr_dev);
+
+	if (WARN_ON(used_count + pvr_dev->kccb.reserved_count > pvr_kccb_capacity(pvr_dev)))
+		goto out_unlock;
+
+	available_count = pvr_kccb_capacity(pvr_dev) - used_count - pvr_dev->kccb.reserved_count;
+	list_for_each_entry_safe(fence, tmp_fence, &pvr_dev->kccb.waiters, node) {
+		if (!available_count)
+			break;
+
+		list_del(&fence->node);
+		pvr_dev->kccb.reserved_count++;
+		available_count--;
+		dma_fence_signal(&fence->base);
+		dma_fence_put(&fence->base);
+	}
+
+out_unlock:
+	mutex_unlock(&pvr_dev->kccb.ccb.lock);
+}
+
+/**
+ * pvr_kccb_process_worker() - KCCB processing work
+ * @work: Work object.
+ *
+ * Called on a FW event. We use it to signal KCCB slot waiters when we have slots
+ * available.
+ */
+static void pvr_kccb_process_worker(struct work_struct *work)
+{
+	struct pvr_device *pvr_dev = container_of(work, struct pvr_device, kccb.work);
+
+	pvr_kccb_check_waiters(pvr_dev);
+}
+
+/**
+ * pvr_kccb_fini() - Cleanup device KCCB
+ * @pvr_dev: Target PowerVR device
+ */
+void pvr_kccb_fini(struct pvr_device *pvr_dev)
+{
+	cancel_work_sync(&pvr_dev->kccb.work);
+	pvr_ccb_fini(&pvr_dev->kccb.ccb);
+	WARN_ON(!list_empty(&pvr_dev->kccb.waiters));
+	WARN_ON(pvr_dev->kccb.reserved_count);
+}
+
+/**
+ * pvr_kccb_init() - Initialise device KCCB
+ * @pvr_dev: Target PowerVR device
+ *
+ * Returns:
+ *  * 0 on success, or
+ *  * Any error returned by pvr_ccb_init().
+ */
+int
+pvr_kccb_init(struct pvr_device *pvr_dev)
+{
+	pvr_dev->kccb.slot_count = 1 << ROGUE_FWIF_KCCB_NUMCMDS_LOG2_DEFAULT;
+	INIT_LIST_HEAD(&pvr_dev->kccb.waiters);
+	pvr_dev->kccb.fence_ctx.id = dma_fence_context_alloc(1);
+	spin_lock_init(&pvr_dev->kccb.fence_ctx.lock);
+	INIT_WORK(&pvr_dev->kccb.work, pvr_kccb_process_worker);
+
+	return pvr_ccb_init(pvr_dev, &pvr_dev->kccb.ccb,
+			    ROGUE_FWIF_KCCB_NUMCMDS_LOG2_DEFAULT,
+			    sizeof(struct rogue_fwif_kccb_cmd));
+}
+
+/**
+ * pvr_kccb_fence_alloc() - Allocate a pvr_kccb_fence object
+ *
+ * Return:
+ *  * NULL if the allocation fails, or
+ *  * A valid dma_fence pointer otherwise.
+ */
+struct dma_fence *pvr_kccb_fence_alloc(void)
+{
+	struct pvr_kccb_fence *kccb_fence;
+
+	kccb_fence = kzalloc(sizeof(*kccb_fence), GFP_KERNEL);
+	if (!kccb_fence)
+		return NULL;
+
+	return &kccb_fence->base;
+}
+
+/**
+ * pvr_kccb_fence_put() - Drop a KCCB fence reference
+ * @fence: The fence to drop the reference on.
+ *
+ * If the fence hasn't been initialized yet, dma_fence_free() is called. This
+ * way we have a single function taking care of both cases.
+ */
+void pvr_kccb_fence_put(struct dma_fence *fence)
+{
+	if (!fence)
+		return;
+
+	if (!fence->ops) {
+		dma_fence_free(fence);
+	} else {
+		WARN_ON(fence->ops != &pvr_kccb_fence_ops);
+		dma_fence_put(fence);
+	}
+}
+
+/**
+ * pvr_kccb_reserve_slot() - Reserve a KCCB slot for later use
+ * @pvr_dev: Target PowerVR device
+ * @f: KCCB fence object previously allocated with pvr_kccb_fence_alloc()
+ *
+ * Try to reserve a KCCB slot, and if there's no slot available,
+ * initializes the fence object and queue it to the waiters list.
+ *
+ * If NULL is returned, that means the slot is reserved. In that case,
+ * the @f is freed and shouldn't be accessed after that point.
+ *
+ * Return:
+ *  * NULL if a slot was available directly, or
+ *  * A valid dma_fence object to wait on if no slot was available.
+ */
+struct dma_fence *
+pvr_kccb_reserve_slot(struct pvr_device *pvr_dev, struct dma_fence *f)
+{
+	struct pvr_kccb_fence *fence = container_of(f, struct pvr_kccb_fence, base);
+	struct dma_fence *out_fence = NULL;
+	u32 used_count;
+
+	mutex_lock(&pvr_dev->kccb.ccb.lock);
+
+	used_count = pvr_kccb_used_slot_count_locked(pvr_dev);
+	if (pvr_dev->kccb.reserved_count >= pvr_kccb_capacity(pvr_dev) - used_count) {
+		dma_fence_init(&fence->base, &pvr_kccb_fence_ops,
+			       &pvr_dev->kccb.fence_ctx.lock,
+			       pvr_dev->kccb.fence_ctx.id,
+			       atomic_inc_return(&pvr_dev->kccb.fence_ctx.seqno));
+		out_fence = dma_fence_get(&fence->base);
+		list_add_tail(&fence->node, &pvr_dev->kccb.waiters);
+	} else {
+		pvr_kccb_fence_put(f);
+		pvr_dev->kccb.reserved_count++;
+	}
+
+	mutex_unlock(&pvr_dev->kccb.ccb.lock);
+
+	return out_fence;
+}
+
+/**
+ * pvr_kccb_release_slot() - Release a KCCB slot reserved with
+ * pvr_kccb_reserve_slot()
+ * @pvr_dev: Target PowerVR device
+ *
+ * Should only be called if something failed after the
+ * pvr_kccb_reserve_slot() call and you know you won't call
+ * pvr_kccb_send_cmd_reserved().
+ */
+void pvr_kccb_release_slot(struct pvr_device *pvr_dev)
+{
+	mutex_lock(&pvr_dev->kccb.ccb.lock);
+	if (!WARN_ON(!pvr_dev->kccb.reserved_count))
+		pvr_dev->kccb.reserved_count--;
+	mutex_unlock(&pvr_dev->kccb.ccb.lock);
+}
+
+/**
+ * pvr_fwccb_init() - Initialise device FWCCB
+ * @pvr_dev: Target PowerVR device
+ *
+ * Returns:
+ *  * 0 on success, or
+ *  * Any error returned by pvr_ccb_init().
+ */
+int
+pvr_fwccb_init(struct pvr_device *pvr_dev)
+{
+	INIT_WORK(&pvr_dev->fwccb_work, pvr_fwccb_process_worker);
+
+	return pvr_ccb_init(pvr_dev, &pvr_dev->fwccb,
+			    ROGUE_FWIF_FWCCB_NUMCMDS_LOG2,
+			    sizeof(struct rogue_fwif_fwccb_cmd));
+}
diff --git a/drivers/gpu/drm/imagination/pvr_ccb.h b/drivers/gpu/drm/imagination/pvr_ccb.h
new file mode 100644
index 000000000000..d0dff64157a3
--- /dev/null
+++ b/drivers/gpu/drm/imagination/pvr_ccb.h
@@ -0,0 +1,62 @@
+/* SPDX-License-Identifier: GPL-2.0 OR MIT */
+/* Copyright (c) 2022 Imagination Technologies Ltd. */
+
+#ifndef PVR_CCB_H
+#define PVR_CCB_H
+
+#include "pvr_rogue_fwif.h"
+
+#include <linux/mutex.h>
+#include <linux/types.h>
+
+/* Forward declaration from pvr_device.h. */
+struct pvr_device;
+
+/* Forward declaration from pvr_gem.h. */
+struct pvr_fw_object;
+
+struct pvr_ccb {
+	/** @ctrl_obj: FW object representing CCB control structure. */
+	struct pvr_fw_object *ctrl_obj;
+	/** @ccb_obj: FW object representing CCB. */
+	struct pvr_fw_object *ccb_obj;
+
+	/** @ctrl_fw_addr: FW virtual address of CCB control structure. */
+	u32 ctrl_fw_addr;
+	/** @ccb_fw_addr: FW virtual address of CCB. */
+	u32 ccb_fw_addr;
+
+	/** @lock: Mutex protecting @ctrl and @ccb. */
+	struct mutex lock;
+	/**
+	 * @ctrl: Kernel mapping of CCB control structure. @lock must be held
+	 *        when accessing.
+	 */
+	struct rogue_fwif_ccb_ctl *ctrl;
+	/** @ccb: Kernel mapping of CCB. @lock must be held when accessing. */
+	void *ccb;
+};
+
+int pvr_kccb_init(struct pvr_device *pvr_dev);
+void pvr_kccb_fini(struct pvr_device *pvr_dev);
+int pvr_fwccb_init(struct pvr_device *pvr_dev);
+void pvr_ccb_fini(struct pvr_ccb *ccb);
+
+struct dma_fence *pvr_kccb_fence_alloc(void);
+void pvr_kccb_fence_put(struct dma_fence *fence);
+struct dma_fence *
+pvr_kccb_reserve_slot(struct pvr_device *pvr_dev, struct dma_fence *f);
+void pvr_kccb_release_slot(struct pvr_device *pvr_dev);
+int pvr_kccb_send_cmd(struct pvr_device *pvr_dev,
+		      struct rogue_fwif_kccb_cmd *cmd, u32 *kccb_slot);
+int pvr_kccb_send_cmd_powered(struct pvr_device *pvr_dev,
+			      struct rogue_fwif_kccb_cmd *cmd,
+			      u32 *kccb_slot);
+void pvr_kccb_send_cmd_reserved_powered(struct pvr_device *pvr_dev,
+					struct rogue_fwif_kccb_cmd *cmd,
+					u32 *kccb_slot);
+int pvr_kccb_wait_for_completion(struct pvr_device *pvr_dev, u32 slot_nr, u32 timeout,
+				 u32 *rtn_out);
+bool pvr_kccb_is_idle(struct pvr_device *pvr_dev);
+
+#endif /* PVR_CCB_H */
diff --git a/drivers/gpu/drm/imagination/pvr_device.c b/drivers/gpu/drm/imagination/pvr_device.c
index 8428e1270a22..710ba07325de 100644
--- a/drivers/gpu/drm/imagination/pvr_device.c
+++ b/drivers/gpu/drm/imagination/pvr_device.c
@@ -240,6 +240,77 @@ pvr_device_clk_core_get_freq(struct pvr_device *pvr_dev, u32 *freq_out)
 	return 0;
 }
 
+static irqreturn_t pvr_meta_irq_handler(int irq, void *data)
+{
+	struct pvr_device *pvr_dev = data;
+
+	if (!pvr_dev->fw_dev.funcs->check_and_ack_irq(pvr_dev))
+		return IRQ_NONE; /* Spurious IRQ - ignore. */
+
+	/* Only process IRQ work if FW is currently running. */
+	if (pvr_dev->fw_dev.booted) {
+		queue_work(pvr_dev->irq_wq, &pvr_dev->fwccb_work);
+		wake_up(&pvr_dev->kccb.rtn_q);
+		queue_work(pvr_dev->irq_wq, &pvr_dev->kccb.work);
+	}
+
+	return IRQ_HANDLED;
+}
+
+/**
+ * pvr_device_irq_init() - Initialise IRQ required by a PowerVR device
+ * @pvr_dev: Target PowerVR device.
+ *
+ * Returns:
+ *  * 0 on success,
+ *  * Any error returned by platform_get_irq_byname(), or
+ *  * Any error returned by request_irq().
+ */
+static int
+pvr_device_irq_init(struct pvr_device *pvr_dev)
+{
+	struct drm_device *drm_dev = from_pvr_device(pvr_dev);
+	struct platform_device *plat_dev = to_platform_device(drm_dev->dev);
+	int err;
+
+	init_waitqueue_head(&pvr_dev->kccb.rtn_q);
+
+	pvr_dev->irq_wq = alloc_workqueue("powervr-irq", WQ_UNBOUND, 0);
+	if (!pvr_dev->irq_wq) {
+		err = -ENOMEM;
+		goto err_out;
+	}
+
+	pvr_dev->irq = platform_get_irq_byname(plat_dev, "gpu");
+	if (pvr_dev->irq < 0) {
+		err = pvr_dev->irq;
+		goto err_destroy_wq;
+	}
+
+	err = request_irq(pvr_dev->irq, pvr_meta_irq_handler, IRQF_SHARED, NULL, pvr_dev);
+	if (err)
+		goto err_destroy_wq;
+
+	return 0;
+
+err_destroy_wq:
+	destroy_workqueue(pvr_dev->irq_wq);
+
+err_out:
+	return err;
+}
+
+/**
+ * pvr_device_irq_fini() - Deinitialise IRQ required by a PowerVR device
+ * @pvr_dev: Target PowerVR device.
+ */
+static void
+pvr_device_irq_fini(struct pvr_device *pvr_dev)
+{
+	free_irq(pvr_dev->irq, pvr_dev);
+	destroy_workqueue(pvr_dev->irq_wq);
+}
+
 /**
  * pvr_build_firmware_filename() - Construct a PowerVR firmware filename
  * @pvr_dev: Target PowerVR device.
@@ -449,8 +520,15 @@ pvr_device_gpu_init(struct pvr_device *pvr_dev)
 	if (err)
 		goto err_vm_ctx_put;
 
+	err = pvr_fw_init(pvr_dev);
+	if (err)
+		goto err_release_firmware;
+
 	return 0;
 
+err_release_firmware:
+	release_firmware(pvr_dev->fw_dev.firmware);
+
 err_vm_ctx_put:
 	pvr_vm_context_put(pvr_dev->kernel_vm_ctx);
 	pvr_dev->kernel_vm_ctx = NULL;
@@ -466,6 +544,7 @@ pvr_device_gpu_init(struct pvr_device *pvr_dev)
 static void
 pvr_device_gpu_fini(struct pvr_device *pvr_dev)
 {
+	pvr_fw_fini(pvr_dev);
 	release_firmware(pvr_dev->fw_dev.firmware);
 	WARN_ON(!pvr_vm_context_put(pvr_dev->kernel_vm_ctx));
 	pvr_dev->kernel_vm_ctx = NULL;
@@ -516,15 +595,22 @@ pvr_device_init(struct pvr_device *pvr_dev)
 	if (err)
 		goto err_pm_runtime_put;
 
+	err = pvr_device_irq_init(pvr_dev);
+	if (err)
+		goto err_device_reg_fini;
+
 	/* Perform GPU-specific initialization steps. */
 	err = pvr_device_gpu_init(pvr_dev);
 	if (err)
-		goto err_device_reg_fini;
+		goto err_device_irq_fini;
 
 	pm_runtime_put_autosuspend(dev);
 
 	return 0;
 
+err_device_irq_fini:
+	pvr_device_irq_fini(pvr_dev);
+
 err_device_reg_fini:
 	pvr_device_reg_fini(pvr_dev);
 
@@ -554,6 +640,7 @@ pvr_device_fini(struct pvr_device *pvr_dev)
 	 */
 	pm_runtime_get_sync(dev);
 	pvr_device_gpu_fini(pvr_dev);
+	pvr_device_irq_fini(pvr_dev);
 	pvr_device_reg_fini(pvr_dev);
 	pm_runtime_put_sync_suspend(dev);
 	pvr_device_clk_fini(pvr_dev);
diff --git a/drivers/gpu/drm/imagination/pvr_device.h b/drivers/gpu/drm/imagination/pvr_device.h
index e5c5e47bf573..ecd044564653 100644
--- a/drivers/gpu/drm/imagination/pvr_device.h
+++ b/drivers/gpu/drm/imagination/pvr_device.h
@@ -4,6 +4,7 @@
 #ifndef PVR_DEVICE_H
 #define PVR_DEVICE_H
 
+#include "pvr_ccb.h"
 #include "pvr_device_info.h"
 #include "pvr_fw.h"
 
@@ -118,9 +119,18 @@ struct pvr_device {
 	/** @regulator: Power regulator. */
 	struct regulator *regulator;
 
+	/** @irq: IRQ number. */
+	int irq;
+
 	/** @irq_wq: Workqueue for actions triggered off the IRQ handler. */
 	struct workqueue_struct *irq_wq;
 
+	/** @fwccb: Firmware CCB. */
+	struct pvr_ccb fwccb;
+
+	/** @fwccb_work: Work item for FWCCB processing. */
+	struct work_struct fwccb_work;
+
 	/**
 	 * @kernel_vm_ctx: Virtual memory context used for kernel mappings.
 	 *
@@ -145,6 +155,52 @@ struct pvr_device {
 		u32 kccb_stall_count;
 	} watchdog;
 
+	struct {
+		/** @ccb: Kernel CCB. */
+		struct pvr_ccb ccb;
+
+		/** @rtn_q: Waitqueue for KCCB command return waiters. */
+		wait_queue_head_t rtn_q;
+
+		/** @rtn_obj: Object representing KCCB return slots. */
+		struct pvr_fw_object *rtn_obj;
+
+		/**
+		 * @rtn: Pointer to CPU mapping of KCCB return slots. Must be accessed by
+		 *       READ_ONCE()/WRITE_ONCE().
+		 */
+		u32 *rtn;
+
+		/** @slot_count: Total number of KCCB slots available. */
+		u32 slot_count;
+
+		/** @reserved_count: Number of KCCB slots reserved for future use. */
+		u32 reserved_count;
+
+		/** @work: Work item for KCCB processing. */
+		struct work_struct work;
+
+		/**
+		 * @waiters: List of KCCB slot waiters.
+		 */
+		struct list_head waiters;
+
+		/** @fence_ctx: KCCB fence context. */
+		struct {
+			/** @id: KCCB fence context ID allocated with dma_fence_context_alloc(). */
+			u64 id;
+
+			/** @seqno: Sequence number incremented each time a fence is created. */
+			atomic_t seqno;
+
+			/**
+			 * @lock: Lock used to synchronize access to fences allocated by this
+			 * context.
+			 */
+			spinlock_t lock;
+		} fence_ctx;
+	} kccb;
+
 	/** @lost: %true if the device has been lost. */
 	bool lost;
 };
diff --git a/drivers/gpu/drm/imagination/pvr_fw.c b/drivers/gpu/drm/imagination/pvr_fw.c
new file mode 100644
index 000000000000..304d9bdebfe3
--- /dev/null
+++ b/drivers/gpu/drm/imagination/pvr_fw.c
@@ -0,0 +1,1386 @@
+// SPDX-License-Identifier: GPL-2.0 OR MIT
+/* Copyright (c) 2022 Imagination Technologies Ltd. */
+
+#include "pvr_ccb.h"
+#include "pvr_device.h"
+#include "pvr_fw.h"
+#include "pvr_fw_info.h"
+#include "pvr_rogue_mips.h"
+#include "pvr_fw_startstop.h"
+#include "pvr_fw_trace.h"
+#include "pvr_gem.h"
+#include "pvr_power.h"
+#include "pvr_rogue_heap_config.h"
+#include "pvr_vm.h"
+
+#include <drm/drm_mm.h>
+#include <linux/firmware.h>
+#include <linux/minmax.h>
+#include <linux/sizes.h>
+
+#define FW_MAX_SUPPORTED_MAJOR_VERSION 1
+
+#define FW_BOOT_TIMEOUT_USEC 5000000
+
+/* Config heap occupies top 192k of the firmware heap. */
+#define PVR_ROGUE_FW_CONFIG_HEAP_GRANULARITY SZ_64K
+#define PVR_ROGUE_FW_CONFIG_HEAP_SIZE (3 * PVR_ROGUE_FW_CONFIG_HEAP_GRANULARITY)
+
+/* Main firmware allocations should come from the remainder of the heap. */
+#define PVR_ROGUE_FW_MAIN_HEAP_BASE ROGUE_FW_HEAP_BASE
+
+/* Offsets from start of configuration area of FW heap. */
+#define PVR_ROGUE_FWIF_CONNECTION_CTL_OFFSET 0
+#define PVR_ROGUE_FWIF_OSINIT_OFFSET \
+	(PVR_ROGUE_FWIF_CONNECTION_CTL_OFFSET + PVR_ROGUE_FW_CONFIG_HEAP_GRANULARITY)
+#define PVR_ROGUE_FWIF_SYSINIT_OFFSET \
+	(PVR_ROGUE_FWIF_OSINIT_OFFSET + PVR_ROGUE_FW_CONFIG_HEAP_GRANULARITY)
+
+#define PVR_ROGUE_FAULT_PAGE_SIZE SZ_4K
+
+#define PVR_SYNC_OBJ_SIZE sizeof(u32)
+
+const struct pvr_fw_layout_entry *
+pvr_fw_find_layout_entry(const struct pvr_fw_layout_entry *layout_entries, u32 num_layout_entries,
+			 enum pvr_fw_section_id id)
+{
+	u32 entry;
+
+	for (entry = 0; entry < num_layout_entries; entry++) {
+		if (layout_entries[entry].id == id)
+			return &layout_entries[entry];
+	}
+
+	return NULL;
+}
+
+static const struct pvr_fw_layout_entry *
+pvr_fw_find_private_data(const struct pvr_fw_layout_entry *layout_entries, u32 num_layout_entries)
+{
+	u32 entry;
+
+	for (entry = 0; entry < num_layout_entries; entry++) {
+		if (layout_entries[entry].id == META_PRIVATE_DATA ||
+		    layout_entries[entry].id == MIPS_PRIVATE_DATA ||
+		    layout_entries[entry].id == RISCV_PRIVATE_DATA)
+			return &layout_entries[entry];
+	}
+
+	return NULL;
+}
+
+/**
+ * pvr_fw_validate() - Parse firmware header and check compatibility
+ * @pvr_dev: Device pointer.
+ * @header_out: Pointer to location to write firmware header pointer.
+ * @layout_entries_out: Pointer to location to write layout table pointer.
+ *
+ * Returns:
+ *  * 0 on success, or
+ *  * -EINVAL if firmware is incompatible.
+ */
+static int
+pvr_fw_validate(struct pvr_device *pvr_dev,
+		const struct pvr_fw_info_header **header_out,
+		const struct pvr_fw_layout_entry **layout_entries_out)
+{
+	struct drm_device *drm_dev = from_pvr_device(pvr_dev);
+	const struct firmware *firmware = pvr_dev->fw_dev.firmware;
+	const u8 *fw = firmware->data;
+	u32 fw_offset = firmware->size - SZ_4K;
+	const struct pvr_fw_layout_entry *layout_entries;
+	const struct pvr_fw_info_header *header;
+	u32 layout_table_size;
+	u32 entry;
+	int err;
+
+	if (firmware->size < SZ_4K || (firmware->size % FW_BLOCK_SIZE)) {
+		err = -EINVAL;
+		goto err_out;
+	}
+
+	header = (const struct pvr_fw_info_header *)&fw[fw_offset];
+
+	if (header->info_version != PVR_FW_INFO_VERSION) {
+		drm_err(drm_dev, "Unsupported fw info version %u\n",
+			header->info_version);
+		err = -EINVAL;
+		goto err_out;
+	}
+
+	if (header->header_len != sizeof(struct pvr_fw_info_header) ||
+	    header->layout_entry_size != sizeof(struct pvr_fw_layout_entry) ||
+	    header->layout_entry_num > PVR_FW_INFO_MAX_NUM_ENTRIES) {
+		drm_err(drm_dev, "FW info format mismatch\n");
+		err = -EINVAL;
+		goto err_out;
+	}
+
+	if (!(header->flags & PVR_FW_FLAGS_OPEN_SOURCE) ||
+	    header->fw_version_major > FW_MAX_SUPPORTED_MAJOR_VERSION ||
+	    header->fw_version_major == 0) {
+		drm_err(drm_dev, "Unsupported FW version %u.%u (build: %u%s)\n",
+			header->fw_version_major, header->fw_version_minor,
+			header->fw_version_build,
+			(header->flags & PVR_FW_FLAGS_OPEN_SOURCE) ? " OS" : "");
+		err = -EINVAL;
+		goto err_out;
+	}
+
+	if (pvr_gpu_id_to_packed_bvnc(&pvr_dev->gpu_id) != header->bvnc) {
+		struct pvr_gpu_id fw_gpu_id;
+
+		packed_bvnc_to_pvr_gpu_id(header->bvnc, &fw_gpu_id);
+		drm_err(drm_dev, "FW built for incorrect GPU ID %i.%i.%i.%i (expected %i.%i.%i.%i)\n",
+			fw_gpu_id.b, fw_gpu_id.v, fw_gpu_id.n, fw_gpu_id.c,
+			pvr_dev->gpu_id.b, pvr_dev->gpu_id.v, pvr_dev->gpu_id.n, pvr_dev->gpu_id.c);
+		err = -EINVAL;
+		goto err_out;
+	}
+
+	fw_offset += header->header_len;
+	layout_table_size =
+		header->layout_entry_size * header->layout_entry_num;
+	if ((fw_offset + layout_table_size) > firmware->size) {
+		err = -EINVAL;
+		goto err_out;
+	}
+
+	layout_entries = (const struct pvr_fw_layout_entry *)&fw[fw_offset];
+	for (entry = 0; entry < header->layout_entry_num; entry++) {
+		u32 start_addr = layout_entries[entry].base_addr;
+		u32 end_addr = start_addr + layout_entries[entry].alloc_size;
+
+		if (start_addr >= end_addr) {
+			err = -EINVAL;
+			goto err_out;
+		}
+	}
+
+	drm_info(drm_dev, "FW version v%u.%u (build %u OS)\n", header->fw_version_major,
+		 header->fw_version_minor, header->fw_version_build);
+
+	pvr_dev->fw_version.major = header->fw_version_major;
+	pvr_dev->fw_version.minor = header->fw_version_minor;
+
+	*header_out = header;
+	*layout_entries_out = layout_entries;
+
+	return 0;
+
+err_out:
+	return err;
+}
+
+static void
+layout_get_sizes(const struct pvr_fw_layout_entry *layout_entries,
+		 u32 num_layout_entries, u32 *code_alloc_size,
+		 u32 *data_alloc_size, u32 *core_code_alloc_size,
+		 u32 *core_data_alloc_size)
+{
+	u32 entry;
+
+	*code_alloc_size = 0;
+	*data_alloc_size = 0;
+	*core_code_alloc_size = 0;
+	*core_data_alloc_size = 0;
+
+	/* Extract section sizes from FW layout table. */
+	for (entry = 0; entry < num_layout_entries; entry++) {
+		switch (layout_entries[entry].type) {
+		case FW_CODE:
+			(*code_alloc_size) += layout_entries[entry].alloc_size;
+			break;
+		case FW_DATA:
+			(*data_alloc_size) += layout_entries[entry].alloc_size;
+			break;
+		case FW_COREMEM_CODE:
+			(*core_code_alloc_size) +=
+				layout_entries[entry].alloc_size;
+			break;
+		case FW_COREMEM_DATA:
+			(*core_data_alloc_size) +=
+				layout_entries[entry].alloc_size;
+			break;
+		case NONE:
+			break;
+		}
+	}
+}
+
+int
+pvr_fw_find_mmu_segment(u32 addr, u32 size, const struct pvr_fw_layout_entry *layout_entries,
+			u32 num_layout_entries, void *fw_code_ptr, void *fw_data_ptr,
+			void *fw_core_code_ptr, void *fw_core_data_ptr,
+			void **host_addr_out)
+{
+	u32 end_addr = addr + size;
+	int entry = 0;
+	int err;
+
+	/* Ensure requested range is not zero, and size is not causing addr to overflow. */
+	if (end_addr <= addr) {
+		err = -EINVAL;
+		goto err_out;
+	}
+
+	for (entry = 0; entry < num_layout_entries; entry++) {
+		u32 entry_start_addr = layout_entries[entry].base_addr;
+		u32 entry_end_addr = entry_start_addr + layout_entries[entry].alloc_size;
+
+		if (addr >= entry_start_addr && addr < entry_end_addr &&
+		    end_addr > entry_start_addr && end_addr <= entry_end_addr) {
+			switch (layout_entries[entry].type) {
+			case FW_CODE:
+				*host_addr_out = fw_code_ptr;
+				break;
+
+			case FW_DATA:
+				*host_addr_out = fw_data_ptr;
+				break;
+
+			case FW_COREMEM_CODE:
+				*host_addr_out = fw_core_code_ptr;
+				break;
+
+			case FW_COREMEM_DATA:
+				*host_addr_out = fw_core_data_ptr;
+				break;
+
+			default:
+				err = -EINVAL;
+				goto err_out;
+			}
+			/* Direct Mem write to mapped memory */
+			addr -= layout_entries[entry].base_addr;
+			addr += layout_entries[entry].alloc_offset;
+
+			/*
+			 * Add offset to pointer to FW allocation only if that
+			 * allocation is available
+			 */
+			*(u8 **)host_addr_out += addr;
+			return 0;
+		}
+	}
+
+	err = -EINVAL;
+
+err_out:
+	return err;
+}
+
+static int
+pvr_fw_create_fwif_connection_ctl(struct pvr_device *pvr_dev)
+{
+	struct drm_device *drm_dev = from_pvr_device(pvr_dev);
+	struct pvr_fw_device *fw_dev = &pvr_dev->fw_dev;
+	int err;
+
+	fw_dev->fwif_connection_ctl =
+		pvr_fw_object_create_and_map_offset(pvr_dev,
+						    fw_dev->fw_heap_info.config_offset +
+						    PVR_ROGUE_FWIF_CONNECTION_CTL_OFFSET,
+						    sizeof(*fw_dev->fwif_connection_ctl),
+						    PVR_BO_FW_FLAGS_DEVICE_UNCACHED |
+						    DRM_PVR_BO_CREATE_ZEROED,
+						    &fw_dev->mem.fwif_connection_ctl_obj);
+	if (IS_ERR(fw_dev->fwif_connection_ctl)) {
+		drm_err(drm_dev,
+			"Unable to allocate FWIF connection control memory\n");
+		err = PTR_ERR(fw_dev->fwif_connection_ctl);
+		goto err_out;
+	}
+
+	return 0;
+
+err_out:
+	return err;
+}
+
+static void
+pvr_fw_fini_fwif_connection_ctl(struct pvr_device *pvr_dev)
+{
+	struct pvr_fw_device *fw_dev = &pvr_dev->fw_dev;
+
+	pvr_fw_object_unmap_and_destroy(fw_dev->mem.fwif_connection_ctl_obj);
+}
+
+static int
+pvr_fw_create_os_structures(struct pvr_device *pvr_dev)
+{
+	struct drm_device *drm_dev = from_pvr_device(pvr_dev);
+	struct pvr_fw_device *fw_dev = &pvr_dev->fw_dev;
+	struct pvr_fw_mem *fw_mem = &fw_dev->mem;
+	struct rogue_fwif_osinit *fwif_osinit;
+	int err;
+
+	fw_dev->fwif_osinit =
+		pvr_fw_object_create_and_map_offset(pvr_dev,
+						    fw_dev->fw_heap_info.config_offset +
+						    PVR_ROGUE_FWIF_OSINIT_OFFSET,
+						    sizeof(*fw_dev->fwif_osinit),
+						    PVR_BO_FW_FLAGS_DEVICE_UNCACHED |
+						    DRM_PVR_BO_CREATE_ZEROED,
+						    &fw_mem->osinit_obj);
+	if (IS_ERR(fw_dev->fwif_osinit)) {
+		drm_err(drm_dev, "Unable to allocate FW OSINIT structure\n");
+		err = PTR_ERR(fw_dev->fwif_osinit);
+		goto err_out;
+	}
+	fwif_osinit = fw_dev->fwif_osinit;
+
+	fw_dev->fwif_osdata = pvr_fw_object_create_and_map(pvr_dev,
+							   sizeof(*fw_dev->fwif_osdata),
+							   PVR_BO_FW_FLAGS_DEVICE_UNCACHED |
+							   DRM_PVR_BO_CREATE_ZEROED,
+							   &fw_mem->osdata_obj);
+	if (IS_ERR(fw_dev->fwif_osdata)) {
+		drm_err(drm_dev, "Unable to allocate FW OSDATA structure\n");
+		err = PTR_ERR(fw_dev->fwif_osdata);
+		goto err_release_osinit;
+	}
+
+	fw_dev->power_sync = pvr_fw_object_create_and_map(pvr_dev, sizeof(*fw_dev->power_sync),
+							  PVR_BO_FW_FLAGS_DEVICE_UNCACHED |
+							  DRM_PVR_BO_CREATE_ZEROED,
+							  &fw_mem->power_sync_obj);
+	if (IS_ERR(fw_dev->power_sync)) {
+		drm_err(drm_dev, "Unable to allocate FW power_sync structure\n");
+		err = PTR_ERR(fw_dev->power_sync);
+		goto err_release_osdata;
+	}
+
+	fw_dev->hwrinfobuf = pvr_fw_object_create_and_map(pvr_dev, sizeof(*fw_dev->hwrinfobuf),
+							  PVR_BO_FW_FLAGS_DEVICE_UNCACHED |
+							  DRM_PVR_BO_CREATE_ZEROED,
+							  &fw_mem->hwrinfobuf_obj);
+	if (IS_ERR(fw_dev->hwrinfobuf)) {
+		drm_err(drm_dev,
+			"Unable to allocate FW hwrinfobuf structure\n");
+		err = PTR_ERR(fw_dev->hwrinfobuf);
+		goto err_release_power_sync;
+	}
+
+	err = pvr_fw_object_create(pvr_dev, PVR_SYNC_OBJ_SIZE,
+				   PVR_BO_FW_FLAGS_DEVICE_UNCACHED |
+				   DRM_PVR_BO_CREATE_ZEROED,
+				   &fw_mem->mmucache_sync_obj);
+	if (err) {
+		drm_err(drm_dev,
+			"Unable to allocate MMU cache sync object\n");
+		goto err_release_hwrinfobuf;
+	}
+
+	pvr_fw_object_get_fw_addr(fw_mem->power_sync_obj, &fw_dev->fwif_osdata->power_sync_fw_addr);
+
+	fwif_osinit->kernel_ccbctl_fw_addr = pvr_dev->kccb.ccb.ctrl_fw_addr;
+	fwif_osinit->kernel_ccb_fw_addr = pvr_dev->kccb.ccb.ccb_fw_addr;
+	pvr_fw_object_get_fw_addr(pvr_dev->kccb.rtn_obj,
+				  &fwif_osinit->kernel_ccb_rtn_slots_fw_addr);
+
+	fwif_osinit->firmware_ccbctl_fw_addr = pvr_dev->fwccb.ctrl_fw_addr;
+	fwif_osinit->firmware_ccb_fw_addr = pvr_dev->fwccb.ccb_fw_addr;
+
+	fwif_osinit->work_est_firmware_ccbctl_fw_addr = 0;
+	fwif_osinit->work_est_firmware_ccb_fw_addr = 0;
+
+	pvr_fw_object_get_fw_addr(fw_mem->hwrinfobuf_obj,
+				  &fwif_osinit->rogue_fwif_hwr_info_buf_ctl_fw_addr);
+	pvr_fw_object_get_fw_addr(fw_mem->osdata_obj, &fwif_osinit->fw_os_data_fw_addr);
+
+	fwif_osinit->hwr_debug_dump_limit = 0;
+
+	rogue_fwif_compchecks_bvnc_init(&fwif_osinit->rogue_comp_checks.hw_bvnc);
+	rogue_fwif_compchecks_bvnc_init(&fwif_osinit->rogue_comp_checks.fw_bvnc);
+
+	return 0;
+
+err_release_hwrinfobuf:
+	pvr_fw_object_unmap_and_destroy(fw_mem->hwrinfobuf_obj);
+
+err_release_power_sync:
+	pvr_fw_object_unmap_and_destroy(fw_mem->power_sync_obj);
+
+err_release_osdata:
+	pvr_fw_object_unmap_and_destroy(fw_mem->osdata_obj);
+
+err_release_osinit:
+	pvr_fw_object_unmap_and_destroy(fw_mem->osinit_obj);
+
+err_out:
+	return err;
+}
+
+static void
+pvr_fw_destroy_os_structures(struct pvr_device *pvr_dev)
+{
+	struct pvr_fw_device *fw_dev = &pvr_dev->fw_dev;
+	struct pvr_fw_mem *fw_mem = &fw_dev->mem;
+
+	pvr_fw_object_destroy(fw_mem->mmucache_sync_obj);
+	pvr_fw_object_unmap_and_destroy(fw_mem->hwrinfobuf_obj);
+	pvr_fw_object_unmap_and_destroy(fw_mem->power_sync_obj);
+	pvr_fw_object_unmap_and_destroy(fw_mem->osdata_obj);
+	pvr_fw_object_unmap_and_destroy(fw_mem->osinit_obj);
+}
+
+static int
+pvr_fw_create_dev_structures(struct pvr_device *pvr_dev)
+{
+	struct drm_device *drm_dev = from_pvr_device(pvr_dev);
+	struct rogue_fwif_gpu_util_fwcb *gpu_util_fwcb;
+	struct pvr_fw_device *fw_dev = &pvr_dev->fw_dev;
+	struct pvr_fw_mem *fw_mem = &fw_dev->mem;
+	struct rogue_fwif_runtime_cfg *runtime_cfg;
+	struct rogue_fwif_sysinit *fwif_sysinit;
+	u32 clock_speed_hz;
+	u32 *fault_page;
+	dma_addr_t fault_dma_addr;
+	int i;
+	int err;
+
+	fw_dev->fwif_sysinit =
+		pvr_fw_object_create_and_map_offset(pvr_dev,
+						    fw_dev->fw_heap_info.config_offset +
+						    PVR_ROGUE_FWIF_SYSINIT_OFFSET,
+						    sizeof(*fw_dev->fwif_sysinit),
+						    PVR_BO_FW_FLAGS_DEVICE_UNCACHED |
+						    DRM_PVR_BO_CREATE_ZEROED,
+						    &fw_mem->sysinit_obj);
+	if (IS_ERR(fw_dev->fwif_sysinit)) {
+		drm_err(drm_dev, "Unable to allocate FW SYSINIT structure\n");
+		err = PTR_ERR(fw_dev->fwif_sysinit);
+		goto err_out;
+	}
+	fwif_sysinit = fw_dev->fwif_sysinit;
+
+	fw_dev->fwif_sysdata = pvr_fw_object_create_and_map(pvr_dev,
+							    sizeof(*fw_dev->fwif_sysdata),
+							    PVR_BO_FW_FLAGS_DEVICE_UNCACHED |
+							    DRM_PVR_BO_CREATE_ZEROED,
+							    &fw_mem->sysdata_obj);
+	if (IS_ERR(fw_dev->fwif_sysdata)) {
+		drm_err(drm_dev, "Unable to allocate FW SYSDATA structure\n");
+		err = PTR_ERR(fw_dev->fwif_sysdata);
+		goto err_release_sysinit;
+	}
+	fw_dev->fwif_sysdata->config_flags = 0;
+	fw_dev->fwif_sysdata->config_flags_ext = 0;
+
+	fault_page = pvr_fw_object_create_and_map(pvr_dev, PVR_ROGUE_FAULT_PAGE_SIZE,
+						  PVR_BO_FW_FLAGS_DEVICE_UNCACHED,
+						  &fw_mem->fault_page_obj);
+	if (IS_ERR(fault_page)) {
+		drm_err(drm_dev, "Unable to allocate FW fault page\n");
+		err = PTR_ERR(fault_page);
+		goto err_release_sysdata;
+	}
+	for (i = 0; i < PVR_ROGUE_FAULT_PAGE_SIZE / sizeof(*fault_page); i++)
+		fault_page[i] = 0xdeadbee0;
+	pvr_fw_object_vunmap(fw_mem->fault_page_obj);
+
+	gpu_util_fwcb = pvr_fw_object_create_and_map(pvr_dev, sizeof(*gpu_util_fwcb),
+						     PVR_BO_FW_FLAGS_DEVICE_UNCACHED |
+						     DRM_PVR_BO_CREATE_ZEROED,
+						     &fw_mem->gpu_util_fwcb_obj);
+	if (IS_ERR(gpu_util_fwcb)) {
+		drm_err(drm_dev, "Unable to allocate GPU util FWCB\n");
+		err = PTR_ERR(gpu_util_fwcb);
+		goto err_release_fault_page;
+	}
+	/* TODO : add timestamp. */
+	gpu_util_fwcb->last_word = PVR_FWIF_GPU_UTIL_STATE_IDLE;
+	pvr_fw_object_vunmap(fw_mem->gpu_util_fwcb_obj);
+
+	err = pvr_device_clk_core_get_freq(pvr_dev, &clock_speed_hz);
+	if (err) {
+		drm_err(drm_dev, "Unable to determine core clock frequency\n");
+		goto err_release_gpu_util_fwcb;
+	}
+
+	runtime_cfg = pvr_fw_object_create_and_map(pvr_dev, sizeof(*runtime_cfg),
+						   PVR_BO_FW_FLAGS_DEVICE_UNCACHED |
+						   DRM_PVR_BO_CREATE_ZEROED,
+						   &fw_mem->runtime_cfg_obj);
+	if (IS_ERR(runtime_cfg)) {
+		drm_err(drm_dev, "Unable to allocate FW runtime config\n");
+		err = PTR_ERR(runtime_cfg);
+		goto err_release_gpu_util_fwcb;
+	}
+	runtime_cfg->core_clock_speed = clock_speed_hz;
+	runtime_cfg->active_pm_latency_ms = 0;
+	runtime_cfg->active_pm_latency_persistant = true;
+	WARN_ON(PVR_FEATURE_VALUE(pvr_dev, num_clusters,
+				  &runtime_cfg->default_dusts_num_init) != 0);
+	pvr_fw_object_vunmap(fw_mem->runtime_cfg_obj);
+
+	err = pvr_fw_trace_init(pvr_dev);
+	if (err)
+		goto err_release_runtime_cfg;
+
+	err = pvr_fw_object_get_dma_addr(fw_mem->fault_page_obj, 0, &fault_dma_addr);
+	if (err) {
+		drm_err(drm_dev,
+			"Unable to get FW fault page physical address\n");
+		goto err_trace_fini;
+	}
+	fwif_sysinit->fault_phys_addr = (u64)fault_dma_addr;
+
+	fwif_sysinit->pds_exec_base = ROGUE_PDSCODEDATA_HEAP_BASE;
+	fwif_sysinit->usc_exec_base = ROGUE_USCCODE_HEAP_BASE;
+
+	pvr_fw_object_get_fw_addr(fw_mem->runtime_cfg_obj, &fwif_sysinit->runtime_cfg_fw_addr);
+	pvr_fw_object_get_fw_addr(fw_dev->fw_trace.tracebuf_ctrl_obj,
+				  &fwif_sysinit->trace_buf_ctl_fw_addr);
+	pvr_fw_object_get_fw_addr(fw_mem->sysdata_obj, &fwif_sysinit->fw_sys_data_fw_addr);
+	pvr_fw_object_get_fw_addr(fw_mem->gpu_util_fwcb_obj,
+				  &fwif_sysinit->gpu_util_fw_cb_ctl_fw_addr);
+	if (fw_mem->core_data_obj) {
+		pvr_fw_object_get_fw_addr(fw_mem->core_data_obj,
+					  &fwif_sysinit->coremem_data_store.fw_addr);
+	}
+
+	/* Currently unsupported. */
+	fwif_sysinit->counter_dump_ctl.buffer_fw_addr = 0;
+	fwif_sysinit->counter_dump_ctl.size_in_dwords = 0;
+
+	/* Skip alignment checks. */
+	fwif_sysinit->align_checks = 0;
+
+	fwif_sysinit->filter_flags = 0;
+	fwif_sysinit->hw_perf_filter = 0;
+	fwif_sysinit->firmware_perf = FW_PERF_CONF_NONE;
+	fwif_sysinit->initial_core_clock_speed = clock_speed_hz;
+	fwif_sysinit->active_pm_latency_ms = 0;
+	fwif_sysinit->gpio_validation_mode = ROGUE_FWIF_GPIO_VAL_OFF;
+	fwif_sysinit->firmware_started = false;
+	fwif_sysinit->marker_val = 1;
+
+	memset(&fwif_sysinit->bvnc_km_feature_flags, 0,
+	       sizeof(fwif_sysinit->bvnc_km_feature_flags));
+
+	return 0;
+
+err_trace_fini:
+	pvr_fw_trace_fini(pvr_dev);
+
+err_release_runtime_cfg:
+	pvr_fw_object_destroy(fw_mem->runtime_cfg_obj);
+
+err_release_gpu_util_fwcb:
+	pvr_fw_object_destroy(fw_mem->gpu_util_fwcb_obj);
+
+err_release_fault_page:
+	pvr_fw_object_destroy(fw_mem->fault_page_obj);
+
+err_release_sysdata:
+	pvr_fw_object_unmap_and_destroy(fw_mem->sysdata_obj);
+
+err_release_sysinit:
+	pvr_fw_object_unmap_and_destroy(fw_mem->sysinit_obj);
+
+err_out:
+	return err;
+}
+
+static void
+pvr_fw_destroy_dev_structures(struct pvr_device *pvr_dev)
+{
+	struct pvr_fw_device *fw_dev = &pvr_dev->fw_dev;
+	struct pvr_fw_mem *fw_mem = &fw_dev->mem;
+
+	pvr_fw_trace_fini(pvr_dev);
+	pvr_fw_object_destroy(fw_mem->runtime_cfg_obj);
+	pvr_fw_object_destroy(fw_mem->gpu_util_fwcb_obj);
+	pvr_fw_object_destroy(fw_mem->fault_page_obj);
+	pvr_fw_object_unmap_and_destroy(fw_mem->sysdata_obj);
+	pvr_fw_object_unmap_and_destroy(fw_mem->sysinit_obj);
+}
+
+/**
+ * pvr_fw_process() - Process firmware image, allocate FW memory and create boot
+ *                    arguments
+ * @pvr_dev: Device pointer.
+ *
+ * Returns:
+ *  * 0 on success, or
+ *  * Any error returned by pvr_fw_object_create_and_map_offset(), or
+ *  * Any error returned by pvr_fw_object_create_and_map().
+ */
+static int
+pvr_fw_process(struct pvr_device *pvr_dev)
+{
+	struct drm_device *drm_dev = from_pvr_device(pvr_dev);
+	struct pvr_fw_mem *fw_mem = &pvr_dev->fw_dev.mem;
+	const u8 *fw = pvr_dev->fw_dev.firmware->data;
+	const struct pvr_fw_info_header *header;
+	const struct pvr_fw_layout_entry *layout_entries;
+	const struct pvr_fw_layout_entry *private_data;
+	u32 code_alloc_size;
+	u32 data_alloc_size;
+	u32 core_code_alloc_size;
+	u32 core_data_alloc_size;
+	u8 *fw_code_ptr;
+	u8 *fw_data_ptr;
+	u8 *fw_core_code_ptr;
+	u8 *fw_core_data_ptr;
+	int err;
+
+	err = pvr_fw_validate(pvr_dev, &header, &layout_entries);
+	if (err)
+		goto err_out;
+
+	layout_get_sizes(layout_entries, header->layout_entry_num,
+			 &code_alloc_size, &data_alloc_size,
+			 &core_code_alloc_size, &core_data_alloc_size);
+
+	private_data = pvr_fw_find_private_data(layout_entries, header->layout_entry_num);
+	if (!private_data) {
+		err = -EINVAL;
+		goto err_out;
+	}
+
+	/* Allocate and map memory for firmware sections. */
+
+	/*
+	 * Code allocation must be at the start of the firmware heap, otherwise
+	 * firmware processor will be unable to boot.
+	 *
+	 * This has the useful side-effect that for every other object in the
+	 * driver, a firmware address of 0 is invalid.
+	 */
+	fw_code_ptr = pvr_fw_object_create_and_map_offset(pvr_dev, 0, code_alloc_size,
+							  PVR_BO_FW_FLAGS_DEVICE_UNCACHED |
+							  DRM_PVR_BO_CREATE_ZEROED,
+							  &fw_mem->code_obj);
+	if (IS_ERR(fw_code_ptr)) {
+		drm_err(drm_dev, "Unable to allocate FW code memory\n");
+		err = PTR_ERR(fw_code_ptr);
+		goto err_out;
+	}
+
+	if (pvr_dev->fw_dev.funcs->has_fixed_data_addr()) {
+		u32 base_addr = private_data->base_addr & pvr_dev->fw_dev.fw_heap_info.offset_mask;
+
+		fw_data_ptr =
+			pvr_fw_object_create_and_map_offset(pvr_dev, base_addr,
+							    data_alloc_size,
+							    PVR_BO_FW_FLAGS_DEVICE_UNCACHED |
+							    DRM_PVR_BO_CREATE_ZEROED,
+							    &fw_mem->data_obj);
+	} else {
+		fw_data_ptr = pvr_fw_object_create_and_map(pvr_dev, data_alloc_size,
+							   PVR_BO_FW_FLAGS_DEVICE_UNCACHED |
+							   DRM_PVR_BO_CREATE_ZEROED,
+							   &fw_mem->data_obj);
+	}
+	if (IS_ERR(fw_data_ptr)) {
+		drm_err(drm_dev, "Unable to allocate FW data memory\n");
+		err = PTR_ERR(fw_data_ptr);
+		goto err_free_fw_code_obj;
+	}
+
+	/* Core code and data sections are optional. */
+	if (core_code_alloc_size) {
+		fw_core_code_ptr =
+			pvr_fw_object_create_and_map(pvr_dev, core_code_alloc_size,
+						     PVR_BO_FW_FLAGS_DEVICE_UNCACHED |
+						     DRM_PVR_BO_CREATE_ZEROED,
+						     &fw_mem->core_code_obj);
+		if (IS_ERR(fw_core_code_ptr)) {
+			drm_err(drm_dev,
+				"Unable to allocate FW core code memory\n");
+			err = PTR_ERR(fw_core_code_ptr);
+			goto err_free_fw_data_obj;
+		}
+	} else {
+		fw_core_code_ptr = NULL;
+	}
+
+	if (core_data_alloc_size) {
+		fw_core_data_ptr =
+			pvr_fw_object_create_and_map(pvr_dev, core_data_alloc_size,
+						     PVR_BO_FW_FLAGS_DEVICE_UNCACHED |
+						     DRM_PVR_BO_CREATE_ZEROED,
+						     &fw_mem->core_data_obj);
+		if (IS_ERR(fw_core_data_ptr)) {
+			drm_err(drm_dev,
+				"Unable to allocate FW core data memory\n");
+			err = PTR_ERR(fw_core_data_ptr);
+			goto err_free_fw_core_code_obj;
+		}
+	} else {
+		fw_core_data_ptr = NULL;
+	}
+
+	err = pvr_dev->fw_dev.funcs->fw_process(pvr_dev, fw, layout_entries,
+						header->layout_entry_num,
+						fw_code_ptr, fw_data_ptr, fw_core_code_ptr,
+						fw_core_data_ptr, core_code_alloc_size);
+
+	if (err)
+		goto err_free_fw_core_data_obj;
+
+	/* We're finished with the firmware section memory on the CPU, unmap. */
+	if (fw_core_data_ptr)
+		pvr_fw_object_vunmap(fw_mem->core_data_obj);
+	if (fw_core_code_ptr)
+		pvr_fw_object_vunmap(fw_mem->core_code_obj);
+	pvr_fw_object_vunmap(fw_mem->data_obj);
+	fw_data_ptr = NULL;
+	pvr_fw_object_vunmap(fw_mem->code_obj);
+	fw_code_ptr = NULL;
+
+	err = pvr_fw_create_fwif_connection_ctl(pvr_dev);
+	if (err)
+		goto err_free_fw_core_data_obj;
+
+	return 0;
+
+err_free_fw_core_data_obj:
+	if (fw_core_data_ptr)
+		pvr_fw_object_unmap_and_destroy(fw_mem->core_data_obj);
+
+err_free_fw_core_code_obj:
+	if (fw_core_code_ptr)
+		pvr_fw_object_unmap_and_destroy(fw_mem->core_code_obj);
+
+err_free_fw_data_obj:
+	if (fw_data_ptr)
+		pvr_fw_object_vunmap(fw_mem->data_obj);
+	pvr_fw_object_destroy(fw_mem->data_obj);
+
+err_free_fw_code_obj:
+	if (fw_code_ptr)
+		pvr_fw_object_vunmap(fw_mem->code_obj);
+	pvr_fw_object_destroy(fw_mem->code_obj);
+
+err_out:
+	return err;
+}
+
+static void
+pvr_fw_cleanup(struct pvr_device *pvr_dev)
+{
+	struct pvr_fw_mem *fw_mem = &pvr_dev->fw_dev.mem;
+
+	pvr_fw_fini_fwif_connection_ctl(pvr_dev);
+
+	if (fw_mem->core_code_obj)
+		pvr_fw_object_destroy(fw_mem->core_code_obj);
+	if (fw_mem->core_data_obj)
+		pvr_fw_object_destroy(fw_mem->core_data_obj);
+	pvr_fw_object_destroy(fw_mem->code_obj);
+	pvr_fw_object_destroy(fw_mem->data_obj);
+}
+
+/**
+ * pvr_wait_for_fw_boot() - Wait for firmware to finish booting
+ * @pvr_dev: Target PowerVR device.
+ *
+ * Returns:
+ *  * 0 on success, or
+ *  * -%ETIMEDOUT if firmware fails to boot within timeout.
+ */
+int
+pvr_wait_for_fw_boot(struct pvr_device *pvr_dev)
+{
+	ktime_t deadline = ktime_add_us(ktime_get(), FW_BOOT_TIMEOUT_USEC);
+	struct pvr_fw_device *fw_dev = &pvr_dev->fw_dev;
+
+	while (ktime_to_ns(ktime_sub(deadline, ktime_get())) > 0) {
+		if (READ_ONCE(fw_dev->fwif_sysinit->firmware_started))
+			return 0;
+	}
+
+	return -ETIMEDOUT;
+}
+
+/*
+ * pvr_fw_heap_info_init() - Calculate size and masks for FW heap
+ * @pvr_dev: Target PowerVR device.
+ * @log2_size: Log2 of raw heap size.
+ * @reserved_size: Size of reserved area of heap, in bytes. May be zero.
+ */
+void
+pvr_fw_heap_info_init(struct pvr_device *pvr_dev, u32 log2_size, u32 reserved_size)
+{
+	struct pvr_fw_device *fw_dev = &pvr_dev->fw_dev;
+
+	fw_dev->fw_heap_info.gpu_addr = PVR_ROGUE_FW_MAIN_HEAP_BASE;
+	fw_dev->fw_heap_info.log2_size = log2_size;
+	fw_dev->fw_heap_info.reserved_size = reserved_size;
+	fw_dev->fw_heap_info.raw_size = 1 << fw_dev->fw_heap_info.log2_size;
+	fw_dev->fw_heap_info.offset_mask = fw_dev->fw_heap_info.raw_size - 1;
+	fw_dev->fw_heap_info.config_offset = fw_dev->fw_heap_info.raw_size -
+					     PVR_ROGUE_FW_CONFIG_HEAP_SIZE;
+	fw_dev->fw_heap_info.size = fw_dev->fw_heap_info.raw_size -
+				    (PVR_ROGUE_FW_CONFIG_HEAP_SIZE + reserved_size);
+}
+
+/**
+ * pvr_fw_init() - Initialise and boot firmware
+ * @pvr_dev: Target PowerVR device
+ *
+ * On successful completion of the function the PowerVR device will be
+ * initialised and ready to use.
+ *
+ * Returns:
+ *  * 0 on success,
+ *  * -%EINVAL on invalid firmware image,
+ *  * -%ENOMEM on out of memory, or
+ *  * -%ETIMEDOUT if firmware processor fails to boot or on register poll timeout.
+ */
+int
+pvr_fw_init(struct pvr_device *pvr_dev)
+{
+	u32 kccb_size_log2 = ROGUE_FWIF_KCCB_NUMCMDS_LOG2_DEFAULT;
+	u32 kccb_rtn_size = (1 << kccb_size_log2) * sizeof(*pvr_dev->kccb.rtn);
+	struct pvr_fw_device *fw_dev = &pvr_dev->fw_dev;
+	int err;
+
+	if (fw_dev->processor_type == PVR_FW_PROCESSOR_TYPE_META) {
+		fw_dev->funcs = &pvr_fw_funcs_meta;
+	} else {
+		err = -EINVAL;
+		goto err_out;
+	}
+
+	err = fw_dev->funcs->init(pvr_dev);
+	if (err)
+		goto err_out;
+
+	drm_mm_init(&fw_dev->fw_mm, ROGUE_FW_HEAP_BASE, fw_dev->fw_heap_info.raw_size);
+	fw_dev->fw_mm_base = ROGUE_FW_HEAP_BASE;
+	spin_lock_init(&fw_dev->fw_mm_lock);
+
+	err = pvr_fw_process(pvr_dev);
+	if (err)
+		goto err_mm_takedown;
+
+	/* Initialise KCCB and FWCCB. */
+	err = pvr_kccb_init(pvr_dev);
+	if (err)
+		goto err_fw_cleanup;
+
+	err = pvr_fwccb_init(pvr_dev);
+	if (err)
+		goto err_kccb_fini;
+
+	/* Allocate memory for KCCB return slots. */
+	pvr_dev->kccb.rtn = pvr_fw_object_create_and_map(pvr_dev, kccb_rtn_size,
+							 PVR_BO_FW_FLAGS_DEVICE_UNCACHED |
+							 DRM_PVR_BO_CREATE_ZEROED,
+							 &pvr_dev->kccb.rtn_obj);
+	if (IS_ERR(pvr_dev->kccb.rtn)) {
+		err = PTR_ERR(pvr_dev->kccb.rtn);
+		goto err_fwccb_fini;
+	}
+
+	err = pvr_fw_create_os_structures(pvr_dev);
+	if (err)
+		goto err_kccb_rtn_release;
+
+	err = pvr_fw_create_dev_structures(pvr_dev);
+	if (err)
+		goto err_destroy_os_structures;
+
+	err = pvr_fw_start(pvr_dev);
+	if (err)
+		goto err_destroy_dev_structures;
+
+	err = pvr_wait_for_fw_boot(pvr_dev);
+	if (err) {
+		drm_err(from_pvr_device(pvr_dev), "Firmware failed to boot\n");
+		goto err_fw_stop;
+	}
+
+	fw_dev->booted = true;
+
+	return 0;
+
+err_fw_stop:
+	pvr_fw_stop(pvr_dev);
+
+err_destroy_dev_structures:
+	pvr_fw_destroy_dev_structures(pvr_dev);
+
+err_destroy_os_structures:
+	pvr_fw_destroy_os_structures(pvr_dev);
+
+err_kccb_rtn_release:
+	pvr_fw_object_unmap_and_destroy(pvr_dev->kccb.rtn_obj);
+
+err_fwccb_fini:
+	pvr_ccb_fini(&pvr_dev->fwccb);
+
+err_kccb_fini:
+	pvr_kccb_fini(pvr_dev);
+
+err_fw_cleanup:
+	pvr_fw_cleanup(pvr_dev);
+
+err_mm_takedown:
+	drm_mm_takedown(&fw_dev->fw_mm);
+
+	if (fw_dev->funcs->fini)
+		fw_dev->funcs->fini(pvr_dev);
+
+err_out:
+	return err;
+}
+
+/**
+ * pvr_fw_fini() - Shutdown firmware processor and free associated memory
+ * @pvr_dev: Target PowerVR device
+ */
+void
+pvr_fw_fini(struct pvr_device *pvr_dev)
+{
+	struct pvr_fw_device *fw_dev = &pvr_dev->fw_dev;
+
+	fw_dev->booted = false;
+
+	pvr_fw_destroy_dev_structures(pvr_dev);
+	pvr_fw_destroy_os_structures(pvr_dev);
+	pvr_fw_object_unmap_and_destroy(pvr_dev->kccb.rtn_obj);
+	/*
+	 * Ensure FWCCB worker has finished executing before destroying FWCCB. The IRQ handler has
+	 * been unregistered at this point so no new work should be being submitted.
+	 */
+	flush_work(&pvr_dev->fwccb_work);
+	pvr_ccb_fini(&pvr_dev->fwccb);
+	pvr_kccb_fini(pvr_dev);
+	pvr_fw_cleanup(pvr_dev);
+
+	drm_mm_takedown(&fw_dev->fw_mm);
+
+	if (fw_dev->funcs->fini)
+		fw_dev->funcs->fini(pvr_dev);
+}
+
+/**
+ * pvr_fw_mts_schedule() - Schedule work via an MTS kick
+ * @pvr_dev: Target PowerVR device
+ * @val: Kick mask. Should be a combination of %ROGUE_CR_MTS_SCHEDULE_*
+ */
+void
+pvr_fw_mts_schedule(struct pvr_device *pvr_dev, u32 val)
+{
+	/* Ensure memory is flushed before kicking MTS. */
+	wmb();
+
+	PVR_CR_WRITE32(pvr_dev, MTS_SCHEDULE, val);
+
+	/* Ensure the MTS kick goes through before continuing. */
+	mb();
+}
+
+/**
+ * pvr_fw_mem_context_create() - Create firmware memory context
+ * @pvr_dev: Target PowerVR device.
+ * @vm_ctx: VM context to be associated with the firmware memory context.
+ * @fw_mem_ctx_obj_out: Pointer to location to store the address of the firmware memory context
+ *                      object.
+ *
+ * Returns:
+ *  * 0 on success, or
+ *  * Any error returned by pvr_fw_object_create_and_map().
+ */
+int pvr_fw_mem_context_create(struct pvr_device *pvr_dev, struct pvr_vm_context *vm_ctx,
+			      struct pvr_fw_object **fw_mem_ctx_obj_out)
+{
+	struct rogue_fwif_fwmemcontext *fw_mem_ctx;
+	struct pvr_fw_object *fw_mem_ctx_obj = NULL;
+	int err;
+
+	fw_mem_ctx = pvr_fw_object_create_and_map(pvr_dev, sizeof(*fw_mem_ctx),
+						  PVR_BO_FW_FLAGS_DEVICE_UNCACHED |
+						  DRM_PVR_BO_CREATE_ZEROED,
+						  &fw_mem_ctx_obj);
+	if (IS_ERR(fw_mem_ctx)) {
+		err = PTR_ERR(fw_mem_ctx);
+		goto err_out;
+	}
+
+	fw_mem_ctx->pc_dev_paddr = pvr_vm_get_page_table_root_addr(vm_ctx);
+	fw_mem_ctx->page_cat_base_reg_set = ROGUE_FW_BIF_INVALID_PCSET;
+
+	pvr_fw_object_vunmap(fw_mem_ctx_obj);
+
+	*fw_mem_ctx_obj_out = fw_mem_ctx_obj;
+
+	return 0;
+
+err_out:
+	return err;
+}
+
+/**
+ * pvr_fw_mem_context_destroy() - Destroy firmware memory context
+ * @fw_mem_ctx_obj: Pointer to firmware object representing memory context.
+ */
+void pvr_fw_mem_context_destroy(struct pvr_fw_object *fw_mem_ctx_obj)
+{
+	pvr_fw_object_destroy(fw_mem_ctx_obj);
+}
+
+/**
+ * pvr_fw_structure_cleanup() - Send FW cleanup request for an object
+ * @pvr_dev: Target PowerVR device.
+ * @type: Type of object to cleanup. Must be one of &enum rogue_fwif_cleanup_type.
+ * @fw_obj: Pointer to FW object containing object to cleanup.
+ * @offset: Offset within FW object of object to cleanup.
+ *
+ * Returns:
+ *  * 0 on success,
+ *  * -EBUSY if object is busy, or
+ *  * -ETIMEDOUT on timeout.
+ */
+int
+pvr_fw_structure_cleanup(struct pvr_device *pvr_dev, u32 type, struct pvr_fw_object *fw_obj,
+			 u32 offset)
+{
+	struct rogue_fwif_kccb_cmd cmd;
+	int slot_nr;
+	int err;
+	u32 rtn;
+
+	struct rogue_fwif_cleanup_request *cleanup_req = &cmd.cmd_data.cleanup_data;
+
+	cmd.cmd_type = ROGUE_FWIF_KCCB_CMD_CLEANUP;
+	cmd.kccb_flags = 0;
+	cleanup_req->cleanup_type = type;
+
+	switch (type) {
+	case ROGUE_FWIF_CLEANUP_FWCOMMONCONTEXT:
+		pvr_fw_object_get_fw_addr_offset(fw_obj, offset,
+						 &cleanup_req->cleanup_data.context_fw_addr);
+		break;
+	case ROGUE_FWIF_CLEANUP_HWRTDATA:
+		pvr_fw_object_get_fw_addr_offset(fw_obj, offset,
+						 &cleanup_req->cleanup_data.hwrt_data_fw_addr);
+		break;
+	case ROGUE_FWIF_CLEANUP_FREELIST:
+		pvr_fw_object_get_fw_addr_offset(fw_obj, offset,
+						 &cleanup_req->cleanup_data.freelist_fw_addr);
+		break;
+	default:
+		err = -EINVAL;
+		goto err_out;
+	}
+
+	err = pvr_kccb_send_cmd(pvr_dev, &cmd, &slot_nr);
+	if (err)
+		goto err_out;
+
+	err = pvr_kccb_wait_for_completion(pvr_dev, slot_nr, HZ, &rtn);
+	if (err)
+		goto err_out;
+
+	if (rtn & ROGUE_FWIF_KCCB_RTN_SLOT_CLEANUP_BUSY)
+		err = -EBUSY;
+
+err_out:
+	return err;
+}
+
+/**
+ * pvr_fw_object_fw_map() - Map a FW object in firmware address space
+ * @pvr_dev: Device pointer.
+ * @fw_obj: FW object to map.
+ * @dev_addr: Desired address in device space, if a specific address is
+ *            required. 0 otherwise.
+ *
+ * Returns:
+ *  * 0 on success, or
+ *  * -%EINVAL if @fw_obj is already mapped but has no references, or
+ *  * Any error returned by DRM.
+ */
+static int
+pvr_fw_object_fw_map(struct pvr_device *pvr_dev, struct pvr_fw_object *fw_obj, u64 dev_addr)
+{
+	struct pvr_gem_object *pvr_obj = fw_obj->gem;
+	struct drm_gem_object *gem_obj = gem_from_pvr_gem(pvr_obj);
+	struct pvr_fw_device *fw_dev = &pvr_dev->fw_dev;
+
+	int err;
+
+	err = pvr_gem_object_get_pages(pvr_obj);
+	if (err)
+		goto err_out;
+
+	spin_lock(&fw_dev->fw_mm_lock);
+
+	if (drm_mm_node_allocated(&fw_obj->fw_mm_node)) {
+		err = -EINVAL;
+		goto err_unlock;
+	}
+
+	if (!dev_addr) {
+		/*
+		 * Allocate from the main heap only (firmware heap minus
+		 * config space).
+		 */
+		err = drm_mm_insert_node_in_range(&fw_dev->fw_mm, &fw_obj->fw_mm_node,
+						  gem_obj->size, 0, 0,
+						  fw_dev->fw_heap_info.gpu_addr,
+						  fw_dev->fw_heap_info.gpu_addr +
+						  fw_dev->fw_heap_info.size, 0);
+		if (err)
+			goto err_unlock;
+	} else {
+		fw_obj->fw_mm_node.start = dev_addr;
+		fw_obj->fw_mm_node.size = gem_obj->size;
+		err = drm_mm_reserve_node(&fw_dev->fw_mm, &fw_obj->fw_mm_node);
+		if (err)
+			goto err_unlock;
+	}
+
+	spin_unlock(&fw_dev->fw_mm_lock);
+
+	/* Map object on GPU. */
+	err = fw_dev->funcs->vm_map(pvr_dev, fw_obj);
+	if (err)
+		goto err_remove_node;
+
+	fw_obj->fw_addr_offset = (u32)(fw_obj->fw_mm_node.start - fw_dev->fw_mm_base);
+
+	return 0;
+
+err_remove_node:
+	spin_lock(&fw_dev->fw_mm_lock);
+	drm_mm_remove_node(&fw_obj->fw_mm_node);
+
+err_unlock:
+	spin_unlock(&fw_dev->fw_mm_lock);
+
+	pvr_gem_object_put_pages(pvr_obj);
+
+err_out:
+	return err;
+}
+
+/**
+ * pvr_fw_object_fw_unmap() - Unmap a previously mapped FW object
+ * @fw_obj: FW object to unmap.
+ *
+ * Returns:
+ *  * 0 on success, or
+ *  * -%EINVAL if object is not currently mapped.
+ */
+static int
+pvr_fw_object_fw_unmap(struct pvr_fw_object *fw_obj)
+{
+	struct pvr_gem_object *pvr_obj = fw_obj->gem;
+	struct drm_gem_object *gem_obj = gem_from_pvr_gem(pvr_obj);
+	struct pvr_device *pvr_dev = to_pvr_device(gem_obj->dev);
+	struct pvr_fw_device *fw_dev = &pvr_dev->fw_dev;
+	int err;
+
+	fw_dev->funcs->vm_unmap(pvr_dev, fw_obj);
+
+	spin_lock(&fw_dev->fw_mm_lock);
+
+	if (!drm_mm_node_allocated(&fw_obj->fw_mm_node)) {
+		spin_unlock(&fw_dev->fw_mm_lock);
+		err = -EINVAL;
+		goto err_out;
+	}
+
+	drm_mm_remove_node(&fw_obj->fw_mm_node);
+
+	spin_unlock(&fw_dev->fw_mm_lock);
+
+	pvr_gem_object_put_pages(pvr_obj);
+
+	return 0;
+
+err_out:
+	return err;
+}
+
+static int
+pvr_fw_object_create_common(struct pvr_device *pvr_dev, size_t size,
+			    u64 flags, u64 dev_addr,
+			    struct pvr_fw_object **fw_obj_out)
+{
+	struct pvr_fw_object *fw_obj;
+	int err;
+
+	/* %DRM_PVR_BO_DEVICE_PM_FW_PROTECT is implicit for FW objects. */
+	flags |= DRM_PVR_BO_DEVICE_PM_FW_PROTECT;
+
+	fw_obj = kzalloc(sizeof(*fw_obj), GFP_KERNEL);
+	if (!fw_obj)
+		return -ENOMEM;
+
+	fw_obj->gem = pvr_gem_object_create(pvr_dev, size, flags);
+	if (IS_ERR(fw_obj->gem)) {
+		err = PTR_ERR(fw_obj->gem);
+		fw_obj->gem = NULL;
+		goto err_put_fw_obj;
+	}
+
+	err = pvr_fw_object_fw_map(pvr_dev, fw_obj, dev_addr);
+	if (err)
+		goto err_put_fw_obj;
+
+	*fw_obj_out = fw_obj;
+
+	return 0;
+
+err_put_fw_obj:
+	pvr_fw_object_destroy(fw_obj);
+	return err;
+}
+
+/**
+ * pvr_fw_object_create() - Create a FW object and map to firmware
+ * @pvr_dev: PowerVR device pointer.
+ * @size: Size of object, in bytes.
+ * @flags: Options which affect both this operation and future mapping
+ * operations performed on the returned object. Must be a combination of
+ * DRM_PVR_BO_* and/or PVR_BO_* flags.
+ * @fw_obj_out: Pointer to location to store created object pointer.
+ *
+ * %DRM_PVR_BO_DEVICE_PM_FW_PROTECT is implied for all FW objects. Consequently,
+ * this function will fail if @flags has %DRM_PVR_BO_CPU_ALLOW_USERSPACE_ACCESS
+ * set.
+ *
+ * Returns:
+ *  * 0 on success, or
+ *  * Any error returned by pvr_fw_object_create_common().
+ */
+int
+pvr_fw_object_create(struct pvr_device *pvr_dev, size_t size, u64 flags,
+		     struct pvr_fw_object **fw_obj_out)
+{
+	return pvr_fw_object_create_common(pvr_dev, size, flags, 0, fw_obj_out);
+}
+
+static void *
+pvr_fw_object_create_and_map_common(struct pvr_device *pvr_dev, size_t size,
+				    u64 flags, u64 dev_addr,
+				    struct pvr_fw_object **fw_obj_out)
+{
+	struct pvr_fw_object *fw_obj;
+	void *cpu_ptr;
+	int err;
+
+	err = pvr_fw_object_create_common(pvr_dev, size, flags, dev_addr, &fw_obj);
+	if (err)
+		goto err_out;
+
+	cpu_ptr = pvr_fw_object_vmap(fw_obj);
+	if (IS_ERR(cpu_ptr)) {
+		err = PTR_ERR(cpu_ptr);
+		goto err_put_object;
+	}
+
+	*fw_obj_out = fw_obj;
+
+	return cpu_ptr;
+
+err_put_object:
+	pvr_fw_object_destroy(fw_obj);
+
+err_out:
+	return ERR_PTR(err);
+}
+
+/**
+ * pvr_fw_object_create_and_map() - Create a FW object and map to firmware and CPU
+ * @pvr_dev: PowerVR device pointer.
+ * @size: Size of object, in bytes.
+ * @flags: Options which affect both this operation and future mapping
+ * operations performed on the returned object. Must be a combination of
+ * DRM_PVR_BO_* and/or PVR_BO_* flags.
+ * @fw_obj_out: Pointer to location to store created object pointer.
+ *
+ * %DRM_PVR_BO_DEVICE_PM_FW_PROTECT is implied for all FW objects. Consequently,
+ * this function will fail if @flags has %DRM_PVR_BO_CPU_ALLOW_USERSPACE_ACCESS
+ * set.
+ *
+ * Caller is responsible for calling pvr_fw_object_vunmap() to release the CPU
+ * mapping.
+ *
+ * Returns:
+ *  * Pointer to CPU mapping of newly created object, or
+ *  * Any error returned by pvr_fw_object_create(), or
+ *  * Any error returned by pvr_fw_object_vmap().
+ */
+void *
+pvr_fw_object_create_and_map(struct pvr_device *pvr_dev, size_t size,
+			     u64 flags, struct pvr_fw_object **fw_obj_out)
+{
+	return pvr_fw_object_create_and_map_common(pvr_dev, size, flags, 0, fw_obj_out);
+}
+
+/**
+ * pvr_fw_object_create_and_map_offset() - Create a FW object and map to
+ * firmware at the provided offset and to the CPU.
+ * @pvr_dev: PowerVR device pointer.
+ * @dev_offset: Base address of desired FW mapping, offset from start of FW heap.
+ * @size: Size of object, in bytes.
+ * @flags: Options which affect both this operation and future mapping
+ * operations performed on the returned object. Must be a combination of
+ * DRM_PVR_BO_* and/or PVR_BO_* flags.
+ * @fw_obj_out: Pointer to location to store created object pointer.
+ *
+ * %DRM_PVR_BO_DEVICE_PM_FW_PROTECT is implied for all FW objects. Consequently,
+ * this function will fail if @flags has %DRM_PVR_BO_CPU_ALLOW_USERSPACE_ACCESS
+ * set.
+ *
+ * Caller is responsible for calling pvr_fw_object_vunmap() to release the CPU
+ * mapping.
+ *
+ * Returns:
+ *  * Pointer to CPU mapping of newly created object, or
+ *  * Any error returned by pvr_fw_object_create(), or
+ *  * Any error returned by pvr_fw_object_vmap().
+ */
+void *
+pvr_fw_object_create_and_map_offset(struct pvr_device *pvr_dev,
+				    u32 dev_offset, size_t size, u64 flags,
+				    struct pvr_fw_object **fw_obj_out)
+{
+	u64 dev_addr = pvr_dev->fw_dev.fw_mm_base + dev_offset;
+
+	return pvr_fw_object_create_and_map_common(pvr_dev, size, flags, dev_addr,
+						   fw_obj_out);
+}
+
+/**
+ * pvr_fw_object_destroy() - Destroy a pvr_fw_object
+ * @fw_obj: Pointer to object to destroy.
+ */
+void pvr_fw_object_destroy(struct pvr_fw_object *fw_obj)
+{
+	if (drm_mm_node_allocated(&fw_obj->fw_mm_node)) {
+		/* If we can't unmap, leak the memory. */
+		if (WARN_ON(pvr_fw_object_fw_unmap(fw_obj)))
+			return;
+	}
+
+	if (fw_obj->gem)
+		pvr_gem_object_put(fw_obj->gem);
+
+	kfree(fw_obj);
+}
+
+/**
+ * pvr_fw_object_get_fw_addr_offset() - Return address of object in firmware address space, with
+ * given offset.
+ * @fw_obj: Pointer to object.
+ * @offset: Desired offset from start of object.
+ * @fw_addr_out: Location to store address to.
+ */
+void pvr_fw_object_get_fw_addr_offset(struct pvr_fw_object *fw_obj, u32 offset, u32 *fw_addr_out)
+{
+	struct pvr_gem_object *pvr_obj = fw_obj->gem;
+	struct pvr_device *pvr_dev = to_pvr_device(gem_from_pvr_gem(pvr_obj)->dev);
+
+	*fw_addr_out = pvr_dev->fw_dev.funcs->get_fw_addr_with_offset(fw_obj, offset);
+}
diff --git a/drivers/gpu/drm/imagination/pvr_fw.h b/drivers/gpu/drm/imagination/pvr_fw.h
index ba3bfd41867f..a4dfcf2883fe 100644
--- a/drivers/gpu/drm/imagination/pvr_fw.h
+++ b/drivers/gpu/drm/imagination/pvr_fw.h
@@ -4,17 +4,422 @@
 #ifndef PVR_FW_H
 #define PVR_FW_H
 
-#include <linux/firmware.h>
+#include "pvr_fw_info.h"
+#include "pvr_fw_trace.h"
+#include "pvr_gem.h"
+
+#include <drm/drm_mm.h>
+
+#include <linux/types.h>
+
+/* Forward declarations from "pvr_device.h". */
+struct pvr_device;
+struct pvr_file;
+
+/* Forward declaration from "pvr_vm.h". */
+struct pvr_vm_context;
+
+#define ROGUE_FWIF_FWCCB_NUMCMDS_LOG2 5
+
+#define ROGUE_FWIF_KCCB_NUMCMDS_LOG2_DEFAULT 7
+
+/**
+ * struct pvr_fw_object - container for firmware memory allocations
+ */
+struct pvr_fw_object {
+	/** @ref_count: FW object reference counter. */
+	struct kref ref_count;
+
+	/** @gem: GEM object backing the FW object. */
+	struct pvr_gem_object *gem;
+
+	/**
+	 * @fw_mm_node: Node representing mapping in FW address space. @pvr_obj->lock must
+	 *              be held when writing.
+	 */
+	struct drm_mm_node fw_mm_node;
+
+	/**
+	 * @fw_addr_offset: Virtual address offset of firmware mapping. Only
+	 *                  valid if @flags has %PVR_GEM_OBJECT_FLAGS_FW_MAPPED
+	 *                  set.
+	 */
+	u32 fw_addr_offset;
+};
+
+/**
+ * struct pvr_fw_funcs - FW processor function table
+ */
+struct pvr_fw_funcs {
+	/**
+	 * @init:
+	 *
+	 * FW processor specific initialisation.
+	 * @pvr_dev: Target PowerVR device.
+	 *
+	 * This function must call pvr_fw_heap_calculate() to initialise the firmware heap for this
+	 * FW processor.
+	 *
+	 * This function is mandatory.
+	 *
+	 * Returns:
+	 *  * 0 on success, or
+	 *  * Any appropriate error on failure.
+	 */
+	int (*init)(struct pvr_device *pvr_dev);
+
+	/**
+	 * @fini:
+	 *
+	 * FW processor specific finalisation.
+	 * @pvr_dev: Target PowerVR device.
+	 *
+	 * This function is optional.
+	 */
+	void (*fini)(struct pvr_device *pvr_dev);
+
+	/**
+	 * @fw_process:
+	 *
+	 * Load and process firmware image.
+	 * @pvr_dev: Target PowerVR device.
+	 * @fw: Pointer to firmware image.
+	 * @layout_entries: Layout of firmware memory.
+	 * @num_layout_entries: Number of entries in @layout_entries.
+	 * @fw_code_ptr: Pointer to firmware code section.
+	 * @fw_data_ptr: Pointer to firmware data section.
+	 * @fw_core_code_ptr: Pointer to firmware core code section. May be %NULL.
+	 * @fw_core_data_ptr: Pointer to firmware core data section. May be %NULL.
+	 * @core_code_alloc_size: Total allocation size of core code section.
+	 *
+	 * This function is mandatory.
+	 *
+	 * Returns:
+	 *  * 0 on success, or
+	 *  * Any appropriate error on failure.
+	 */
+	int (*fw_process)(struct pvr_device *pvr_dev, const u8 *fw,
+			  const struct pvr_fw_layout_entry *layout_entries, u32 num_layout_entries,
+			  u8 *fw_code_ptr, u8 *fw_data_ptr, u8 *fw_core_code_ptr,
+			  u8 *fw_core_data_ptr, u32 core_code_alloc_size);
+
+	/**
+	 * @vm_map:
+	 *
+	 * Map FW object into FW processor address space.
+	 * @pvr_dev: Target PowerVR device.
+	 * @fw_obj: FW object to map.
+	 *
+	 * This function is mandatory.
+	 *
+	 * Returns:
+	 *  * 0 on success, or
+	 *  * Any appropriate error on failure.
+	 */
+	int (*vm_map)(struct pvr_device *pvr_dev, struct pvr_fw_object *fw_obj);
+
+	/**
+	 * @vm_unmap:
+	 *
+	 * Unmap FW object from FW processor address space.
+	 * @pvr_dev: Target PowerVR device.
+	 * @fw_obj: FW object to map.
+	 *
+	 * This function is mandatory.
+	 */
+	void (*vm_unmap)(struct pvr_device *pvr_dev, struct pvr_fw_object *fw_obj);
+
+	/**
+	 * @get_fw_addr_with_offset:
+	 *
+	 * Called to get address of object in firmware address space, with offset.
+	 * @fw_obj: Pointer to object.
+	 * @offset: Desired offset from start of object.
+	 *
+	 * This function is mandatory.
+	 *
+	 * Returns:
+	 *  * Address in firmware address space.
+	 */
+	u32 (*get_fw_addr_with_offset)(struct pvr_fw_object *fw_obj, u32 offset);
+
+	/**
+	 * @wrapper_init:
+	 *
+	 * Called to initialise FW wrapper.
+	 * @pvr_dev: Target PowerVR device.
+	 *
+	 * This function is mandatory.
+	 *
+	 * Returns:
+	 *  * 0 on success.
+	 *  * Any appropriate error on failure.
+	 */
+	int (*wrapper_init)(struct pvr_device *pvr_dev);
+
+	/**
+	 * @check_and_ack_irq:
+	 *
+	 * Called to check if a GPU interrupt has occurred, and to acknowledge if it has.
+	 * @pvr_dev: Target PowerVR device.
+	 *
+	 * This function is mandatory.
+	 *
+	 * Returns:
+	 *  * %true if an interrupt has occurred, or
+	 *  * %false if no interrupt has occurred.
+	 */
+	bool (*check_and_ack_irq)(struct pvr_device *pvr_dev);
+
+	/**
+	 * @has_fixed_data_addr:
+	 *
+	 * Called to check if firmware fixed data must be loaded at the address given by the
+	 * firmware layout table.
+	 *
+	 * This function is mandatory.
+	 *
+	 * Returns:
+	 *  * %true if firmware fixed data must be loaded at the address given by the firmware
+	 *    layout table.
+	 *  * %false otherwise.
+	 */
+	bool (*has_fixed_data_addr)(void);
+};
+
+/**
+ * struct pvr_fw_mem - FW memory allocations
+ */
+struct pvr_fw_mem {
+	/** @code_obj: Object representing firmware code. */
+	struct pvr_fw_object *code_obj;
+
+	/** @data_obj: Object representing firmware data. */
+	struct pvr_fw_object *data_obj;
+
+	/**
+	 * @core_code_obj: Object representing firmware core code. May be
+	 *                 %NULL if firmware does not contain this section.
+	 */
+	struct pvr_fw_object *core_code_obj;
+
+	/**
+	 * @core_data_obj: Object representing firmware core data. May be
+	 *                 %NULL if firmware does not contain this section.
+	 */
+	struct pvr_fw_object *core_data_obj;
+
+	/**
+	 * @fwif_connection_ctl_obj: Object representing FWIF connection control
+	 *                           structure.
+	 */
+	struct pvr_fw_object *fwif_connection_ctl_obj;
+
+	/** @osinit_obj: Object representing FW OSINIT structure. */
+	struct pvr_fw_object *osinit_obj;
+
+	/** @sysinit_obj: Object representing FW SYSINIT structure. */
+	struct pvr_fw_object *sysinit_obj;
+
+	/** @osdata_obj: Object representing FW OSDATA structure. */
+	struct pvr_fw_object *osdata_obj;
+
+	/** @hwrinfobuf_obj: Object representing FW hwrinfobuf structure. */
+	struct pvr_fw_object *hwrinfobuf_obj;
+
+	/** @sysdata_obj: Object representing FW SYSDATA structure. */
+	struct pvr_fw_object *sysdata_obj;
+
+	/** @power_sync_obj: Object representing power sync state. */
+	struct pvr_fw_object *power_sync_obj;
+
+	/** @fault_page_obj: Object representing FW fault page. */
+	struct pvr_fw_object *fault_page_obj;
+
+	/** @gpu_util_fwcb_obj: Object representing FW GPU utilisation control structure. */
+	struct pvr_fw_object *gpu_util_fwcb_obj;
+
+	/** @runtime_cfg_obj: Object representing FW runtime config structure. */
+	struct pvr_fw_object *runtime_cfg_obj;
+
+	/** @mmucache_sync_obj: Object used as the sync parameter in an MMU cache operation. */
+	struct pvr_fw_object *mmucache_sync_obj;
+};
 
 struct pvr_fw_device {
 	/** @firmware: Handle to the firmware loaded into the device. */
 	const struct firmware *firmware;
 
-	/*
+	/** @mem: Structure containing objects representing firmware memory allocations. */
+	struct pvr_fw_mem mem;
+
+	/** @booted: %true if the firmware has been booted, %false otherwise. */
+	bool booted;
+
+	/**
 	 * @processor_type: FW processor type for this device. Must be one of
 	 *                  %PVR_FW_PROCESSOR_TYPE_*.
 	 */
 	u16 processor_type;
+
+	/** @funcs: Function table for the FW processor used by this device. */
+	const struct pvr_fw_funcs *funcs;
+
+	/** @processor_data: Pointer to data specific to FW processor. */
+	union {
+		/** @mips_data: Pointer to MIPS-specific data. */
+		struct pvr_fw_mips_data *mips_data;
+	} processor_data;
+
+	/** @fw_heap_info: Firmware heap information. */
+	struct {
+		/** @gpu_addr: Base address of firmware heap in GPU address space. */
+		u64 gpu_addr;
+
+		/** @size: Size of main area of heap. */
+		u32 size;
+
+		/** @offset_mask: Mask for offsets within FW heap. */
+		u32 offset_mask;
+
+		/** @raw_size: Raw size of heap, including reserved areas. */
+		u32 raw_size;
+
+		/** @log2_size: Log2 of raw size of heap. */
+		u32 log2_size;
+
+		/** @config_offset: Offset of config area within heap. */
+		u32 config_offset;
+
+		/** @reserved_size: Size of reserved area in heap. */
+		u32 reserved_size;
+	} fw_heap_info;
+
+	/** @fw_mm: Firmware address space allocator. */
+	struct drm_mm fw_mm;
+
+	/** @fw_mm_lock: Lock protecting access to &fw_mm. */
+	spinlock_t fw_mm_lock;
+
+	/** @fw_mm_base: Base address of address space managed by @fw_mm. */
+	u64 fw_mm_base;
+
+	/**
+	 * @fwif_connection_ctl: Pointer to CPU mapping of FWIF connection
+	 *                       control structure.
+	 */
+	struct rogue_fwif_connection_ctl *fwif_connection_ctl;
+
+	/** @fwif_sysinit: Pointer to CPU mapping of FW SYSINIT structure. */
+	struct rogue_fwif_sysinit *fwif_sysinit;
+
+	/** @fwif_sysdata: Pointer to CPU mapping of FW SYSDATA structure. */
+	struct rogue_fwif_sysdata *fwif_sysdata;
+
+	/** @fwif_osinit: Pointer to CPU mapping of FW OSINIT structure. */
+	struct rogue_fwif_osinit *fwif_osinit;
+
+	/** @fwif_osdata: Pointer to CPU mapping of FW OSDATA structure. */
+	struct rogue_fwif_osdata *fwif_osdata;
+
+	/** @power_sync: Pointer to CPU mapping of power sync state. */
+	u32 *power_sync;
+
+	/** @hwrinfobuf: Pointer to CPU mapping of FW HWR info buffer. */
+	struct rogue_fwif_hwrinfobuf *hwrinfobuf;
+
+	/** @fw_trace: Device firmware trace buffer state. */
+	struct pvr_fw_trace fw_trace;
 };
 
+extern const struct pvr_fw_funcs pvr_fw_funcs_meta;
+extern const struct pvr_fw_funcs pvr_fw_funcs_mips;
+
+int pvr_fw_init(struct pvr_device *pvr_dev);
+void pvr_fw_fini(struct pvr_device *pvr_dev);
+
+int pvr_wait_for_fw_boot(struct pvr_device *pvr_dev);
+
+void pvr_fw_mts_schedule(struct pvr_device *pvr_dev, u32 val);
+
+int
+pvr_fw_mem_context_create(struct pvr_device *pvr_dev, struct pvr_vm_context *vm_ctx,
+			  struct pvr_fw_object **fw_mem_ctx_obj_out);
+void
+pvr_fw_mem_context_destroy(struct pvr_fw_object *fw_mem_ctx_obj);
+
+void
+pvr_fw_heap_info_init(struct pvr_device *pvr_dev, u32 log2_size, u32 reserved_size);
+
+const struct pvr_fw_layout_entry *
+pvr_fw_find_layout_entry(const struct pvr_fw_layout_entry *layout_entries, u32 num_layout_entries,
+			 enum pvr_fw_section_id id);
+int
+pvr_fw_find_mmu_segment(u32 addr, u32 size, const struct pvr_fw_layout_entry *layout_entries,
+			u32 num_layout_entries, void *fw_code_ptr, void *fw_data_ptr,
+			void *fw_core_code_ptr, void *fw_core_data_ptr,
+			void **host_addr_out);
+
+int
+pvr_fw_structure_cleanup(struct pvr_device *pvr_dev, u32 type, struct pvr_fw_object *fw_obj,
+			 u32 offset);
+
+int pvr_fw_object_create(struct pvr_device *pvr_dev, size_t size, u64 flags,
+			 struct pvr_fw_object **pvr_obj_out);
+
+void *pvr_fw_object_create_and_map(struct pvr_device *pvr_dev, size_t size,
+				   u64 flags,
+				   struct pvr_fw_object **pvr_obj_out);
+
+void *
+pvr_fw_object_create_and_map_offset(struct pvr_device *pvr_dev,
+				    u32 dev_offset, size_t size, u64 flags,
+				    struct pvr_fw_object **pvr_obj_out);
+
+static __always_inline void *
+pvr_fw_object_vmap(struct pvr_fw_object *fw_obj)
+{
+	return pvr_gem_object_vmap(fw_obj->gem);
+}
+
+static __always_inline void
+pvr_fw_object_vunmap(struct pvr_fw_object *fw_obj)
+{
+	pvr_gem_object_vunmap(fw_obj->gem);
+}
+
+void pvr_fw_object_destroy(struct pvr_fw_object *fw_obj);
+
+static __always_inline void
+pvr_fw_object_unmap_and_destroy(struct pvr_fw_object *fw_obj)
+{
+	pvr_fw_object_vunmap(fw_obj);
+	pvr_fw_object_destroy(fw_obj);
+}
+
+/**
+ * pvr_fw_get_dma_addr() - Get DMA address for given offset in firmware object
+ * @fw_obj: Pointer to object to lookup address in.
+ * @offset: Offset within object to lookup address at.
+ * @dma_addr_out: Pointer to location to store DMA address.
+ *
+ * Returns:
+ *  * 0 on success, or
+ *  * -%EINVAL if object is not currently backed, or if @offset is out of valid
+ *    range for this object.
+ */
+static __always_inline int
+pvr_fw_object_get_dma_addr(struct pvr_fw_object *fw_obj, u32 offset, dma_addr_t *dma_addr_out)
+{
+	return pvr_gem_get_dma_addr(fw_obj->gem, offset, dma_addr_out);
+}
+
+void pvr_fw_object_get_fw_addr_offset(struct pvr_fw_object *fw_obj, u32 offset, u32 *fw_addr_out);
+
+static __always_inline void
+pvr_fw_object_get_fw_addr(struct pvr_fw_object *fw_obj, u32 *fw_addr_out)
+{
+	pvr_fw_object_get_fw_addr_offset(fw_obj, 0, fw_addr_out);
+}
+
 #endif /* PVR_FW_H */
diff --git a/drivers/gpu/drm/imagination/pvr_fw_info.h b/drivers/gpu/drm/imagination/pvr_fw_info.h
new file mode 100644
index 000000000000..37731eacc191
--- /dev/null
+++ b/drivers/gpu/drm/imagination/pvr_fw_info.h
@@ -0,0 +1,115 @@
+/* SPDX-License-Identifier: GPL-2.0 OR MIT */
+/* Copyright (c) 2022 Imagination Technologies Ltd. */
+
+#ifndef PVR_FW_INFO_H
+#define PVR_FW_INFO_H
+
+#include <linux/bits.h>
+#include <linux/sizes.h>
+#include <linux/types.h>
+
+/*
+ * Firmware binary block unit in bytes.
+ * Raw data stored in FW binary will be aligned to this size.
+ */
+#define FW_BLOCK_SIZE SZ_4K
+
+/* Maximum number of entries in firmware layout table. */
+#define PVR_FW_INFO_MAX_NUM_ENTRIES 8
+
+enum pvr_fw_section_id {
+	META_CODE = 0,
+	META_PRIVATE_DATA,
+	META_COREMEM_CODE,
+	META_COREMEM_DATA,
+	MIPS_CODE,
+	MIPS_EXCEPTIONS_CODE,
+	MIPS_BOOT_CODE,
+	MIPS_PRIVATE_DATA,
+	MIPS_BOOT_DATA,
+	MIPS_STACK,
+	RISCV_UNCACHED_CODE,
+	RISCV_CACHED_CODE,
+	RISCV_PRIVATE_DATA,
+	RISCV_COREMEM_CODE,
+	RISCV_COREMEM_DATA,
+};
+
+enum pvr_fw_section_type {
+	NONE = 0,
+	FW_CODE,
+	FW_DATA,
+	FW_COREMEM_CODE,
+	FW_COREMEM_DATA,
+};
+
+/*
+ * FW binary format with FW info attached:
+ *
+ *          Contents        Offset
+ *     +-----------------+
+ *     |                 |    0
+ *     |                 |
+ *     | Original binary |
+ *     |      file       |
+ *     |   (.ldr/.elf)   |
+ *     |                 |
+ *     |                 |
+ *     +-----------------+
+ *     | FW info header  |  FILE_SIZE - 4K
+ *     +-----------------+
+ *     |                 |
+ *     | FW layout table |
+ *     |                 |
+ *     +-----------------+
+ *                          FILE_SIZE
+ */
+
+#define PVR_FW_INFO_VERSION 2
+
+#define PVR_FW_FLAGS_OPEN_SOURCE BIT(0)
+
+/** struct pvr_fw_info_header - Firmware header */
+struct pvr_fw_info_header {
+	/** @info_version: FW info header version. */
+	u32 info_version;
+	/** @header_len: Header length. */
+	u32 header_len;
+	/** @layout_entry_num: Number of entries in the layout table. */
+	u32 layout_entry_num;
+	/** @layout_entry_size: Size of an entry in the layout table. */
+	u32 layout_entry_size;
+	/** @bvnc: GPU ID supported by firmware. */
+	aligned_u64 bvnc;
+	/** @fw_page_size: Page size of processor on which firmware executes. */
+	u32 fw_page_size;
+	/** @flags: Compatibility flags. */
+	u32 flags;
+	/** @fw_version_major: Firmware major version number. */
+	u16 fw_version_major;
+	/** @fw_version_minor: Firmware minor version number. */
+	u16 fw_version_minor;
+	/** @fw_version_build: Firmware build number. */
+	u32 fw_version_build;
+};
+
+/**
+ * struct pvr_fw_layout_entry - Entry in firmware layout table, describing a
+ *                              section of the firmware image
+ */
+struct pvr_fw_layout_entry {
+	/** @id: Section ID. */
+	enum pvr_fw_section_id id;
+	/** @type: Section type. */
+	enum pvr_fw_section_type type;
+	/** @base_addr: Base address of section in FW address space. */
+	u32 base_addr;
+	/** @max_size: Maximum size of section, in bytes. */
+	u32 max_size;
+	/** @alloc_size: Allocation size of section, in bytes. */
+	u32 alloc_size;
+	/** @alloc_offset: Allocation offset of section. */
+	u32 alloc_offset;
+};
+
+#endif /* PVR_FW_INFO_H */
diff --git a/drivers/gpu/drm/imagination/pvr_fw_meta.c b/drivers/gpu/drm/imagination/pvr_fw_meta.c
new file mode 100644
index 000000000000..363b983731ef
--- /dev/null
+++ b/drivers/gpu/drm/imagination/pvr_fw_meta.c
@@ -0,0 +1,610 @@
+// SPDX-License-Identifier: GPL-2.0 OR MIT
+/* Copyright (c) 2022 Imagination Technologies Ltd. */
+
+#include "pvr_device.h"
+#include "pvr_fw.h"
+#include "pvr_fw_info.h"
+#include "pvr_gem.h"
+#include "pvr_rogue_cr_defs.h"
+#include "pvr_rogue_meta.h"
+#include "pvr_vm.h"
+
+#include <linux/compiler.h>
+#include <linux/delay.h>
+#include <linux/firmware.h>
+#include <linux/ktime.h>
+#include <linux/types.h>
+
+#define ROGUE_FW_HEAP_META_SHIFT 25 /* 32 MB */
+
+#define POLL_TIMEOUT_USEC 1000000
+
+/**
+ * pvr_meta_cr_read32() - Read a META register via the Slave Port
+ * @pvr_dev: Device pointer.
+ * @reg_addr: Address of register to read.
+ * @reg_value_out: Pointer to location to store register value.
+ *
+ * Returns:
+ *  * 0 on success, or
+ *  * Any error returned by pvr_cr_poll_reg32().
+ */
+int
+pvr_meta_cr_read32(struct pvr_device *pvr_dev, u32 reg_addr, u32 *reg_value_out)
+{
+	int err;
+
+	/* Wait for Slave Port to be Ready. */
+	err = pvr_cr_poll_reg32(pvr_dev, ROGUE_CR_META_SP_MSLVCTRL1,
+				ROGUE_CR_META_SP_MSLVCTRL1_READY_EN |
+					ROGUE_CR_META_SP_MSLVCTRL1_GBLPORT_IDLE_EN,
+				ROGUE_CR_META_SP_MSLVCTRL1_READY_EN |
+					ROGUE_CR_META_SP_MSLVCTRL1_GBLPORT_IDLE_EN,
+				POLL_TIMEOUT_USEC);
+	if (err)
+		goto err_out;
+
+	/* Issue a Read. */
+	PVR_CR_WRITE32(pvr_dev, META_SP_MSLVCTRL0,
+		       reg_addr | ROGUE_CR_META_SP_MSLVCTRL0_RD_EN);
+	(void)PVR_CR_READ32(pvr_dev, META_SP_MSLVCTRL0); /* Fence write. */
+
+	/* Wait for Slave Port to be Ready. */
+	err = pvr_cr_poll_reg32(pvr_dev, ROGUE_CR_META_SP_MSLVCTRL1,
+				ROGUE_CR_META_SP_MSLVCTRL1_READY_EN |
+					ROGUE_CR_META_SP_MSLVCTRL1_GBLPORT_IDLE_EN,
+				ROGUE_CR_META_SP_MSLVCTRL1_READY_EN |
+					ROGUE_CR_META_SP_MSLVCTRL1_GBLPORT_IDLE_EN,
+				POLL_TIMEOUT_USEC);
+	if (err)
+		goto err_out;
+
+	*reg_value_out = PVR_CR_READ32(pvr_dev, META_SP_MSLVDATAX);
+
+	return 0;
+
+err_out:
+	return err;
+}
+
+static int
+pvr_meta_wrapper_init(struct pvr_device *pvr_dev)
+{
+	u64 garten_config;
+
+	/* Configure META to Master boot. */
+	PVR_CR_WRITE64(pvr_dev, META_BOOT, ROGUE_CR_META_BOOT_MODE_EN);
+
+	/* Set Garten IDLE to META idle and Set the Garten Wrapper BIF Fence address. */
+
+	/* Garten IDLE bit controlled by META. */
+	garten_config = ROGUE_CR_MTS_GARTEN_WRAPPER_CONFIG_IDLE_CTRL_META;
+
+	/* The fence addr is set during the fw init sequence. */
+
+	/* Set PC = 0 for fences. */
+	garten_config &=
+		ROGUE_CR_MTS_GARTEN_WRAPPER_CONFIG_FENCE_PC_BASE_CLRMSK;
+	garten_config |=
+		(u64)MMU_CONTEXT_MAPPING_FWPRIV
+		<< ROGUE_CR_MTS_GARTEN_WRAPPER_CONFIG_FENCE_PC_BASE_SHIFT;
+
+	/* Set SLC DM=META. */
+	garten_config |= ((u64)ROGUE_FW_SEGMMU_META_BIFDM_ID)
+			 << ROGUE_CR_MTS_GARTEN_WRAPPER_CONFIG_FENCE_DM_SHIFT;
+
+	PVR_CR_WRITE64(pvr_dev, MTS_GARTEN_WRAPPER_CONFIG, garten_config);
+
+	return 0;
+}
+
+static __always_inline void
+add_boot_arg(u32 **boot_conf, u32 param, u32 data)
+{
+	*(*boot_conf)++ = param;
+	*(*boot_conf)++ = data;
+}
+
+static int
+meta_ldr_cmd_loadmem(struct drm_device *drm_dev, const u8 *fw,
+		     struct rogue_meta_ldr_l1_data_blk *l1_data,
+		     u32 coremem_size,
+		     const struct pvr_fw_layout_entry *layout_entries,
+		     u32 num_layout_entries, u8 *fw_code_ptr, u8 *fw_data_ptr,
+		     u8 *fw_core_code_ptr, u8 *fw_core_data_ptr,
+		     const u32 fw_size)
+{
+	struct rogue_meta_ldr_l2_data_blk *l2_block =
+		(struct rogue_meta_ldr_l2_data_blk *)(fw +
+						      l1_data->cmd_data[1]);
+	u32 offset = l1_data->cmd_data[0];
+	u32 data_size;
+	void *write_addr;
+	int err;
+
+	/* Verify header is within bounds. */
+	if (((u8 *)l2_block - fw) >= fw_size || ((u8 *)(l2_block + 1) - fw) >= fw_size) {
+		err = -EINVAL;
+		goto err_out;
+	}
+
+	data_size = l2_block->length - 6 /* L2 Tag length and checksum */;
+
+	/* Verify data is within bounds. */
+	if (((u8 *)l2_block->block_data - fw) >= fw_size ||
+	    ((((u8 *)l2_block->block_data) + data_size) - fw) >= fw_size) {
+		err = -EINVAL;
+		goto err_out;
+	}
+
+	if (!ROGUE_META_IS_COREMEM_CODE(offset, coremem_size) &&
+	    !ROGUE_META_IS_COREMEM_DATA(offset, coremem_size)) {
+		/* Global range is aliased to local range */
+		offset &= ~META_MEM_GLOBAL_RANGE_BIT;
+	}
+
+	err = pvr_fw_find_mmu_segment(offset, data_size, layout_entries,
+				      num_layout_entries, fw_code_ptr, fw_data_ptr,
+				      fw_core_code_ptr, fw_core_data_ptr, &write_addr);
+	if (err) {
+		drm_err(drm_dev,
+			"Addr 0x%x (size: %d) not found in any firmware segment",
+			offset, data_size);
+		goto err_out;
+	}
+
+	memcpy(write_addr, l2_block->block_data, data_size);
+
+	return 0;
+
+err_out:
+	return err;
+}
+
+static int
+meta_ldr_cmd_zeromem(struct drm_device *drm_dev,
+		     struct rogue_meta_ldr_l1_data_blk *l1_data,
+		     u32 coremem_size,
+		     const struct pvr_fw_layout_entry *layout_entries,
+		     u32 num_layout_entries, u8 *fw_code_ptr, u8 *fw_data_ptr,
+		     u8 *fw_core_code_ptr, u8 *fw_core_data_ptr)
+{
+	u32 offset = l1_data->cmd_data[0];
+	u32 byte_count = l1_data->cmd_data[1];
+	void *write_addr;
+	int err;
+
+	if (ROGUE_META_IS_COREMEM_DATA(offset, coremem_size)) {
+		/* cannot zero coremem directly */
+		return 0;
+	}
+
+	/* Global range is aliased to local range */
+	offset &= ~META_MEM_GLOBAL_RANGE_BIT;
+
+	err = pvr_fw_find_mmu_segment(offset, byte_count, layout_entries,
+				      num_layout_entries, fw_code_ptr, fw_data_ptr,
+				      fw_core_code_ptr, fw_core_data_ptr, &write_addr);
+	if (err) {
+		drm_err(drm_dev,
+			"Addr 0x%x (size: %d) not found in any firmware segment",
+			offset, byte_count);
+		goto err_out;
+	}
+
+	memset(write_addr, 0, byte_count);
+
+	return 0;
+
+err_out:
+	return err;
+}
+
+static int
+meta_ldr_cmd_config(struct drm_device *drm_dev, const u8 *fw,
+		    struct rogue_meta_ldr_l1_data_blk *l1_data,
+		    const u32 fw_size, u32 **boot_conf_ptr)
+{
+	struct rogue_meta_ldr_l2_data_blk *l2_block =
+		(struct rogue_meta_ldr_l2_data_blk *)(fw +
+						      l1_data->cmd_data[0]);
+	struct rogue_meta_ldr_cfg_blk *config_command;
+	u32 l2_block_size;
+	u32 curr_block_size = 0;
+	u32 *boot_conf = boot_conf_ptr ? *boot_conf_ptr : NULL;
+	int err;
+
+	/* Verify block header is within bounds. */
+	if (((u8 *)l2_block - fw) >= fw_size || ((u8 *)(l2_block + 1) - fw) >= fw_size) {
+		err = -EINVAL;
+		goto err_out;
+	}
+
+	l2_block_size = l2_block->length - 6 /* L2 Tag length and checksum */;
+	config_command = (struct rogue_meta_ldr_cfg_blk *)l2_block->block_data;
+
+	if (((u8 *)config_command - fw) >= fw_size ||
+	    ((((u8 *)config_command) + l2_block_size) - fw) >= fw_size) {
+		err = -EINVAL;
+		goto err_out;
+	}
+
+	while (l2_block_size >= 12) {
+		if (config_command->type != ROGUE_META_LDR_CFG_WRITE) {
+			err = -EINVAL;
+			goto err_out;
+		}
+
+		/*
+		 * Only write to bootloader if we got a valid pointer to the FW
+		 * code allocation.
+		 */
+		if (boot_conf) {
+			u32 register_offset = config_command->block_data[0];
+			u32 register_value = config_command->block_data[1];
+
+			/* Do register write */
+			add_boot_arg(&boot_conf, register_offset,
+				     register_value);
+		}
+
+		curr_block_size = 12;
+		l2_block_size -= curr_block_size;
+		config_command = (struct rogue_meta_ldr_cfg_blk
+					  *)((uintptr_t)config_command +
+					     curr_block_size);
+	}
+
+	if (boot_conf_ptr)
+		*boot_conf_ptr = boot_conf;
+
+	return 0;
+
+err_out:
+	return err;
+}
+
+/**
+ * process_ldr_command_stream() - Process LDR firmware image and populate
+ *                                firmware sections
+ * @pvr_dev: Device pointer.
+ * @fw: Pointer to firmware image.
+ * @layout_entries: Pointer to layout table.
+ * @num_layout_entries: Number of entries in layout table.
+ * @fw_code_ptr: Pointer to FW code section.
+ * @fw_data_ptr: Pointer to FW data section.
+ * @fw_core_code_ptr: Pointer to FW coremem code section.
+ * @fw_core_data_ptr: Pointer to FW coremem data section.
+ * @boot_conf_ptr: Pointer to boot config argument pointer.
+ *
+ * Returns :
+ *  * 0 on success, or
+ *  * -EINVAL on any error in LDR command stream.
+ */
+static int
+process_ldr_command_stream(struct pvr_device *pvr_dev, const u8 *fw,
+			   const struct pvr_fw_layout_entry *layout_entries,
+			   u32 num_layout_entries, u8 *fw_code_ptr,
+			   u8 *fw_data_ptr, u8 *fw_core_code_ptr,
+			   u8 *fw_core_data_ptr, u32 **boot_conf_ptr)
+{
+	struct drm_device *drm_dev = from_pvr_device(pvr_dev);
+	struct rogue_meta_ldr_block_hdr *ldr_header =
+		(struct rogue_meta_ldr_block_hdr *)fw;
+	struct rogue_meta_ldr_l1_data_blk *l1_data =
+		(struct rogue_meta_ldr_l1_data_blk *)(fw + ldr_header->sl_data);
+	const u32 fw_size = pvr_dev->fw_dev.firmware->size;
+	int err;
+
+	u32 *boot_conf = boot_conf_ptr ? *boot_conf_ptr : NULL;
+	u32 coremem_size;
+
+	err = PVR_FEATURE_VALUE(pvr_dev, meta_coremem_size, &coremem_size);
+	if (err)
+		goto err_out;
+
+	coremem_size *= SZ_1K;
+
+	while (l1_data) {
+		/* Verify block header is within bounds. */
+		if (((u8 *)l1_data - fw) >= fw_size || ((u8 *)(l1_data + 1) - fw) >= fw_size) {
+			err = -EINVAL;
+			goto err_out;
+		}
+
+		if (ROGUE_META_LDR_BLK_IS_COMMENT(l1_data->cmd)) {
+			/* Don't process comment blocks */
+			goto next_block;
+		}
+
+		switch (l1_data->cmd & ROGUE_META_LDR_CMD_MASK)
+		case ROGUE_META_LDR_CMD_LOADMEM: {
+			err = meta_ldr_cmd_loadmem(drm_dev, fw, l1_data,
+						   coremem_size, layout_entries,
+						   num_layout_entries,
+						   fw_code_ptr, fw_data_ptr,
+						   fw_core_code_ptr,
+						   fw_core_data_ptr, fw_size);
+			if (err)
+				goto err_out;
+			break;
+
+		case ROGUE_META_LDR_CMD_START_THREADS:
+			/* Don't process this block */
+			break;
+
+		case ROGUE_META_LDR_CMD_ZEROMEM:
+			err = meta_ldr_cmd_zeromem(drm_dev, l1_data,
+						   coremem_size, layout_entries,
+						   num_layout_entries,
+						   fw_code_ptr, fw_data_ptr,
+						   fw_core_code_ptr,
+						   fw_core_data_ptr);
+			if (err)
+				goto err_out;
+			break;
+
+		case ROGUE_META_LDR_CMD_CONFIG:
+			err = meta_ldr_cmd_config(drm_dev, fw, l1_data, fw_size,
+						  &boot_conf);
+			if (err)
+				goto err_out;
+			break;
+
+		default:
+			err = -EINVAL;
+			goto err_out;
+		}
+
+next_block:
+		if (l1_data->next == 0xFFFFFFFF)
+			break;
+
+		l1_data = (struct rogue_meta_ldr_l1_data_blk *)(fw +
+								l1_data->next);
+	}
+
+	if (boot_conf_ptr)
+		*boot_conf_ptr = boot_conf;
+
+	return 0;
+
+err_out:
+	return err;
+}
+
+static void
+configure_seg_id(u64 seg_out_addr, u32 seg_base, u32 seg_limit, u32 seg_id,
+		 u32 **boot_conf_ptr)
+{
+	u32 seg_out_addr0 = seg_out_addr & 0x00000000FFFFFFFFUL;
+	u32 seg_out_addr1 = (seg_out_addr >> 32) & 0x00000000FFFFFFFFUL;
+	u32 *boot_conf = *boot_conf_ptr;
+
+	/* META segments have a minimum size. */
+	u32 limit_off = max(seg_limit, ROGUE_FW_SEGMMU_ALIGN);
+
+	/* The limit is an offset, therefore off = size - 1. */
+	limit_off -= 1;
+
+	seg_base |= ROGUE_FW_SEGMMU_ALLTHRS_WRITEABLE;
+
+	add_boot_arg(&boot_conf, META_CR_MMCU_SEGMENT_N_BASE(seg_id), seg_base);
+	add_boot_arg(&boot_conf, META_CR_MMCU_SEGMENT_N_LIMIT(seg_id), limit_off);
+	add_boot_arg(&boot_conf, META_CR_MMCU_SEGMENT_N_OUTA0(seg_id), seg_out_addr0);
+	add_boot_arg(&boot_conf, META_CR_MMCU_SEGMENT_N_OUTA1(seg_id), seg_out_addr1);
+
+	*boot_conf_ptr = boot_conf;
+}
+
+static u64 get_fw_obj_gpu_addr(struct pvr_fw_object *fw_obj)
+{
+	struct pvr_device *pvr_dev = to_pvr_device(gem_from_pvr_gem(fw_obj->gem)->dev);
+	struct pvr_fw_device *fw_dev = &pvr_dev->fw_dev;
+
+	return fw_obj->fw_addr_offset + fw_dev->fw_heap_info.gpu_addr;
+}
+
+static void
+configure_seg_mmu(struct pvr_device *pvr_dev,
+		  const struct pvr_fw_layout_entry *layout_entries,
+		  u32 num_layout_entries, u32 **boot_conf_ptr)
+{
+	u64 seg_out_addr_top;
+	u32 i;
+
+	seg_out_addr_top =
+		ROGUE_FW_SEGMMU_OUTADDR_TOP_SLC(MMU_CONTEXT_MAPPING_FWPRIV,
+						ROGUE_FW_SEGMMU_META_BIFDM_ID);
+
+	for (i = 0; i < num_layout_entries; i++) {
+		/*
+		 * FW code is using the bootloader segment which is already
+		 * configured on boot. FW coremem code and data don't use the
+		 * segment MMU. Only the FW data segment needs to be configured.
+		 */
+		if (layout_entries[i].type == FW_DATA) {
+			u32 seg_id = ROGUE_FW_SEGMMU_DATA_ID;
+			u64 seg_out_addr = get_fw_obj_gpu_addr(pvr_dev->fw_dev.mem.data_obj);
+
+			seg_out_addr += layout_entries[i].alloc_offset;
+			seg_out_addr |= seg_out_addr_top;
+
+			/* Write the sequence to the bootldr. */
+			configure_seg_id(seg_out_addr,
+					 layout_entries[i].base_addr,
+					 layout_entries[i].alloc_size, seg_id,
+					 boot_conf_ptr);
+
+			break;
+		}
+	}
+}
+
+static void
+configure_meta_caches(u32 **boot_conf_ptr)
+{
+	u32 *boot_conf = *boot_conf_ptr;
+	u32 d_cache_t0, i_cache_t0;
+	u32 d_cache_t1, i_cache_t1;
+	u32 d_cache_t2, i_cache_t2;
+	u32 d_cache_t3, i_cache_t3;
+
+	/* Initialise I/Dcache settings */
+	d_cache_t0 = META_CR_SYSC_DCPARTX_CACHED_WRITE_ENABLE;
+	d_cache_t1 = META_CR_SYSC_DCPARTX_CACHED_WRITE_ENABLE;
+	d_cache_t2 = META_CR_SYSC_DCPARTX_CACHED_WRITE_ENABLE;
+	d_cache_t3 = META_CR_SYSC_DCPARTX_CACHED_WRITE_ENABLE;
+	i_cache_t0 = 0;
+	i_cache_t1 = 0;
+	i_cache_t2 = 0;
+	i_cache_t3 = 0;
+
+	d_cache_t0 |= META_CR_SYSC_XCPARTX_LOCAL_ADDR_FULL_CACHE;
+	i_cache_t0 |= META_CR_SYSC_XCPARTX_LOCAL_ADDR_FULL_CACHE;
+
+	/* Local region MMU enhanced bypass: WIN-3 mode for code and data caches */
+	add_boot_arg(&boot_conf, META_CR_MMCU_LOCAL_EBCTRL,
+		     META_CR_MMCU_LOCAL_EBCTRL_ICWIN |
+			     META_CR_MMCU_LOCAL_EBCTRL_DCWIN);
+
+	/* Data cache partitioning thread 0 to 3 */
+	add_boot_arg(&boot_conf, META_CR_SYSC_DCPART(0), d_cache_t0);
+	add_boot_arg(&boot_conf, META_CR_SYSC_DCPART(1), d_cache_t1);
+	add_boot_arg(&boot_conf, META_CR_SYSC_DCPART(2), d_cache_t2);
+	add_boot_arg(&boot_conf, META_CR_SYSC_DCPART(3), d_cache_t3);
+
+	/* Enable data cache hits */
+	add_boot_arg(&boot_conf, META_CR_MMCU_DCACHE_CTRL,
+		     META_CR_MMCU_XCACHE_CTRL_CACHE_HITS_EN);
+
+	/* Instruction cache partitioning thread 0 to 3 */
+	add_boot_arg(&boot_conf, META_CR_SYSC_ICPART(0), i_cache_t0);
+	add_boot_arg(&boot_conf, META_CR_SYSC_ICPART(1), i_cache_t1);
+	add_boot_arg(&boot_conf, META_CR_SYSC_ICPART(2), i_cache_t2);
+	add_boot_arg(&boot_conf, META_CR_SYSC_ICPART(3), i_cache_t3);
+
+	/* Enable instruction cache hits */
+	add_boot_arg(&boot_conf, META_CR_MMCU_ICACHE_CTRL,
+		     META_CR_MMCU_XCACHE_CTRL_CACHE_HITS_EN);
+
+	add_boot_arg(&boot_conf, 0x040000C0, 0);
+
+	*boot_conf_ptr = boot_conf;
+}
+
+static int
+pvr_meta_fw_process(struct pvr_device *pvr_dev, const u8 *fw,
+		    const struct pvr_fw_layout_entry *layout_entries, u32 num_layout_entries,
+		    u8 *fw_code_ptr, u8 *fw_data_ptr, u8 *fw_core_code_ptr, u8 *fw_core_data_ptr,
+		    u32 core_code_alloc_size)
+{
+	struct pvr_fw_device *fw_dev = &pvr_dev->fw_dev;
+	u32 *boot_conf;
+	int err;
+
+	boot_conf = ((u32 *)fw_code_ptr) + ROGUE_FW_BOOTLDR_CONF_OFFSET;
+
+	/* Slave port and JTAG accesses are privileged. */
+	add_boot_arg(&boot_conf, META_CR_SYSC_JTAG_THREAD,
+		     META_CR_SYSC_JTAG_THREAD_PRIV_EN);
+
+	configure_seg_mmu(pvr_dev, layout_entries, num_layout_entries, &boot_conf);
+
+	/* Populate FW sections from LDR image. */
+	err = process_ldr_command_stream(pvr_dev, fw, layout_entries, num_layout_entries,
+					 fw_code_ptr, fw_data_ptr, fw_core_code_ptr,
+					 fw_core_data_ptr, &boot_conf);
+	if (err)
+		goto err_out;
+
+	configure_meta_caches(&boot_conf);
+
+	/* End argument list. */
+	add_boot_arg(&boot_conf, 0, 0);
+
+	if (fw_dev->mem.core_code_obj) {
+		u32 core_code_fw_addr;
+
+		pvr_fw_object_get_fw_addr(fw_dev->mem.core_code_obj, &core_code_fw_addr);
+		add_boot_arg(&boot_conf, core_code_fw_addr, core_code_alloc_size);
+	} else {
+		add_boot_arg(&boot_conf, 0, 0);
+	}
+	/* None of the cores supported by this driver have META DMA. */
+	add_boot_arg(&boot_conf, 0, 0);
+
+	return 0;
+
+err_out:
+	return err;
+}
+
+static int
+pvr_meta_init(struct pvr_device *pvr_dev)
+{
+	pvr_fw_heap_info_init(pvr_dev, ROGUE_FW_HEAP_META_SHIFT, 0);
+
+	return 0;
+}
+
+static u32
+pvr_meta_get_fw_addr_with_offset(struct pvr_fw_object *fw_obj, u32 offset)
+{
+	u32 fw_addr = fw_obj->fw_addr_offset + offset + ROGUE_FW_SEGMMU_DATA_BASE_ADDRESS;
+
+	/* META cacheability is determined by address. */
+	if (fw_obj->gem->flags & PVR_BO_FW_FLAGS_DEVICE_UNCACHED)
+		fw_addr |= ROGUE_FW_SEGMMU_DATA_META_UNCACHED |
+			   ROGUE_FW_SEGMMU_DATA_VIVT_SLC_UNCACHED;
+
+	return fw_addr;
+}
+
+static int
+pvr_meta_vm_map(struct pvr_device *pvr_dev, struct pvr_fw_object *fw_obj)
+{
+	struct pvr_gem_object *pvr_obj = fw_obj->gem;
+
+	return pvr_vm_map(pvr_dev->kernel_vm_ctx, pvr_obj, 0, fw_obj->fw_mm_node.start,
+			  pvr_gem_object_size(pvr_obj));
+}
+
+static void
+pvr_meta_vm_unmap(struct pvr_device *pvr_dev, struct pvr_fw_object *fw_obj)
+{
+	pvr_vm_unmap(pvr_dev->kernel_vm_ctx, fw_obj->fw_mm_node.start,
+		     fw_obj->fw_mm_node.size);
+}
+
+static bool
+pvr_meta_check_and_ack_irq(struct pvr_device *pvr_dev)
+{
+	u32 irq_status = PVR_CR_READ32(pvr_dev, META_SP_MSLVIRQSTATUS);
+
+	if (!(irq_status & ROGUE_CR_META_SP_MSLVIRQSTATUS_TRIGVECT2_EN))
+		return false; /* Spurious IRQ - ignore. */
+
+	/* Acknowledge IRQ. */
+	PVR_CR_WRITE32(pvr_dev, META_SP_MSLVIRQSTATUS,
+		       ROGUE_CR_META_SP_MSLVIRQSTATUS_TRIGVECT2_CLRMSK);
+
+	return true;
+}
+
+static bool
+pvr_meta_has_fixed_data_addr(void)
+{
+	return false;
+}
+
+const struct pvr_fw_funcs pvr_fw_funcs_meta = {
+	.init = pvr_meta_init,
+	.fw_process = pvr_meta_fw_process,
+	.vm_map = pvr_meta_vm_map,
+	.vm_unmap = pvr_meta_vm_unmap,
+	.get_fw_addr_with_offset = pvr_meta_get_fw_addr_with_offset,
+	.wrapper_init = pvr_meta_wrapper_init,
+	.check_and_ack_irq = pvr_meta_check_and_ack_irq,
+	.has_fixed_data_addr = pvr_meta_has_fixed_data_addr,
+};
diff --git a/drivers/gpu/drm/imagination/pvr_fw_meta.h b/drivers/gpu/drm/imagination/pvr_fw_meta.h
new file mode 100644
index 000000000000..5468b3d69031
--- /dev/null
+++ b/drivers/gpu/drm/imagination/pvr_fw_meta.h
@@ -0,0 +1,14 @@
+/* SPDX-License-Identifier: GPL-2.0 OR MIT */
+/* Copyright (c) 2022 Imagination Technologies Ltd. */
+
+#ifndef PVR_FW_META_H
+#define PVR_FW_META_H
+
+#include <linux/types.h>
+
+/* Forward declaration from pvr_device.h */
+struct pvr_device;
+
+int pvr_meta_cr_read32(struct pvr_device *pvr_dev, u32 reg_addr, u32 *reg_value_out);
+
+#endif /* PVR_FW_META_H */
diff --git a/drivers/gpu/drm/imagination/pvr_fw_startstop.c b/drivers/gpu/drm/imagination/pvr_fw_startstop.c
new file mode 100644
index 000000000000..070eebe2d7e3
--- /dev/null
+++ b/drivers/gpu/drm/imagination/pvr_fw_startstop.c
@@ -0,0 +1,280 @@
+// SPDX-License-Identifier: GPL-2.0 OR MIT
+/* Copyright (c) 2022 Imagination Technologies Ltd. */
+
+#include "pvr_device.h"
+#include "pvr_fw.h"
+#include "pvr_fw_meta.h"
+#include "pvr_fw_startstop.h"
+#include "pvr_rogue_cr_defs.h"
+#include "pvr_rogue_meta.h"
+#include "pvr_vm.h"
+
+#include <linux/compiler.h>
+#include <linux/delay.h>
+#include <linux/ktime.h>
+#include <linux/types.h>
+
+#define POLL_TIMEOUT_USEC 1000000
+
+static void
+rogue_axi_ace_list_init(struct pvr_device *pvr_dev)
+{
+	/* Setup AXI-ACE config. Set everything to outer cache. */
+	u64 reg_val =
+		(3U << ROGUE_CR_AXI_ACE_LITE_CONFIGURATION_AWDOMAIN_NON_SNOOPING_SHIFT) |
+		(3U << ROGUE_CR_AXI_ACE_LITE_CONFIGURATION_ARDOMAIN_NON_SNOOPING_SHIFT) |
+		(2U << ROGUE_CR_AXI_ACE_LITE_CONFIGURATION_ARDOMAIN_CACHE_MAINTENANCE_SHIFT) |
+		(2U << ROGUE_CR_AXI_ACE_LITE_CONFIGURATION_AWDOMAIN_COHERENT_SHIFT) |
+		(2U << ROGUE_CR_AXI_ACE_LITE_CONFIGURATION_ARDOMAIN_COHERENT_SHIFT) |
+		(2U << ROGUE_CR_AXI_ACE_LITE_CONFIGURATION_AWCACHE_COHERENT_SHIFT) |
+		(2U << ROGUE_CR_AXI_ACE_LITE_CONFIGURATION_ARCACHE_COHERENT_SHIFT) |
+		(2U << ROGUE_CR_AXI_ACE_LITE_CONFIGURATION_ARCACHE_CACHE_MAINTENANCE_SHIFT);
+
+	PVR_CR_WRITE64(pvr_dev, AXI_ACE_LITE_CONFIGURATION, reg_val);
+}
+
+static void
+rogue_bif_init(struct pvr_device *pvr_dev)
+{
+	dma_addr_t pc_dma_addr;
+	u64 pc_addr;
+
+	/* Acquire the address of the Kernel Page Catalogue. */
+	pc_dma_addr = pvr_vm_get_page_table_root_addr(pvr_dev->kernel_vm_ctx);
+
+	/* Write the kernel catalogue base. */
+	pc_addr = ((((u64)pc_dma_addr >> ROGUE_CR_BIF_CAT_BASE0_ADDR_ALIGNSHIFT)
+		    << ROGUE_CR_BIF_CAT_BASE0_ADDR_SHIFT) &
+		   ~ROGUE_CR_BIF_CAT_BASE0_ADDR_CLRMSK);
+
+	pvr_cr_write64(pvr_dev, BIF_CAT_BASEX(MMU_CONTEXT_MAPPING_FWPRIV),
+		       pc_addr);
+}
+
+static int
+rogue_slc_init(struct pvr_device *pvr_dev)
+{
+	u16 slc_cache_line_size_in_bits;
+	u32 reg_val;
+	int err;
+
+	/*
+	 * SLC Misc control.
+	 *
+	 * Note: This is a 64bit register and we set only the lower 32bits
+	 *       leaving the top 32bits (ROGUE_CR_SLC_CTRL_MISC_SCRAMBLE_BITS)
+	 *       unchanged from the HW default.
+	 */
+	reg_val = (PVR_CR_READ32(pvr_dev, SLC_CTRL_MISC) &
+		      ROGUE_CR_SLC_CTRL_MISC_ENABLE_PSG_HAZARD_CHECK_EN) |
+		     ROGUE_CR_SLC_CTRL_MISC_ADDR_DECODE_MODE_PVR_HASH1;
+
+	err = PVR_FEATURE_VALUE(pvr_dev, slc_cache_line_size_in_bits, &slc_cache_line_size_in_bits);
+	if (err)
+		return err;
+
+	/* Bypass burst combiner if SLC line size is smaller than 1024 bits. */
+	if (slc_cache_line_size_in_bits < 1024)
+		reg_val |= ROGUE_CR_SLC_CTRL_MISC_BYPASS_BURST_COMBINER_EN;
+
+	PVR_CR_WRITE32(pvr_dev, SLC_CTRL_MISC, reg_val);
+
+	return 0;
+}
+
+/**
+ * pvr_fw_start() - Start FW processor and boot firmware
+ * @pvr_dev: Target PowerVR device.
+ *
+ * Returns:
+ *  * 0 on success, or
+ *  * Any error returned by rogue_slc_init().
+ */
+int
+pvr_fw_start(struct pvr_device *pvr_dev)
+{
+	int err;
+
+	if (PVR_HAS_FEATURE(pvr_dev, sys_bus_secure_reset)) {
+		/*
+		 * Disable the default sys_bus_secure protection to perform
+		 * minimal setup.
+		 */
+		PVR_CR_WRITE32(pvr_dev, SYS_BUS_SECURE, 0);
+		(void)PVR_CR_READ32(pvr_dev, SYS_BUS_SECURE); /* Fence write */
+	}
+
+	/* Set Rogue in soft-reset. */
+	PVR_CR_WRITE64(pvr_dev, SOFT_RESET, ROGUE_CR_SOFT_RESET_MASKFULL);
+
+	/* Read soft-reset to fence previous write in order to clear the SOCIF pipeline. */
+	(void)PVR_CR_READ64(pvr_dev, SOFT_RESET);
+
+	/* Take Rascal and Dust out of reset. */
+	PVR_CR_WRITE64(pvr_dev, SOFT_RESET,
+		       ROGUE_CR_SOFT_RESET_MASKFULL ^
+			       ROGUE_CR_SOFT_RESET_RASCALDUSTS_EN);
+
+	(void)PVR_CR_READ64(pvr_dev, SOFT_RESET);
+
+	/* Take everything out of reset but the FW processor. */
+	PVR_CR_WRITE64(pvr_dev, SOFT_RESET, ROGUE_CR_SOFT_RESET_GARTEN_EN);
+
+	(void)PVR_CR_READ64(pvr_dev, SOFT_RESET);
+
+	err = rogue_slc_init(pvr_dev);
+	if (err)
+		goto err_reset;
+
+	/* Initialise Firmware wrapper. */
+	pvr_dev->fw_dev.funcs->wrapper_init(pvr_dev);
+
+	/* We must init the AXI-ACE interface before first BIF transaction. */
+	rogue_axi_ace_list_init(pvr_dev);
+
+	/* Initialise BIF. */
+	rogue_bif_init(pvr_dev);
+
+	/* Need to wait for at least 16 cycles before taking the FW processor out of reset ... */
+	udelay(3);
+
+	PVR_CR_WRITE64(pvr_dev, SOFT_RESET, 0x0);
+	(void)PVR_CR_READ64(pvr_dev, SOFT_RESET);
+
+	/* ... and afterwards. */
+	udelay(3);
+
+	return 0;
+
+err_reset:
+	/* Put everything back into soft-reset. */
+	PVR_CR_WRITE64(pvr_dev, SOFT_RESET, ROGUE_CR_SOFT_RESET_MASKFULL);
+
+	return err;
+}
+
+/**
+ * pvr_fw_stop() - Stop FW processor
+ * @pvr_dev: Target PowerVR device.
+ *
+ * Returns:
+ *  * 0 on success, or
+ *  * Any error returned by pvr_cr_poll_reg32().
+ */
+int
+pvr_fw_stop(struct pvr_device *pvr_dev)
+{
+	const u32 sidekick_idle_mask = ROGUE_CR_SIDEKICK_IDLE_MASKFULL &
+				       ~(ROGUE_CR_SIDEKICK_IDLE_GARTEN_EN |
+					 ROGUE_CR_SIDEKICK_IDLE_SOCIF_EN |
+					 ROGUE_CR_SIDEKICK_IDLE_HOSTIF_EN);
+	bool skip_garten_idle = false;
+	u32 reg_value;
+	int err;
+
+	/*
+	 * Wait for Sidekick/Jones to signal IDLE except for the Garten Wrapper.
+	 * For cores with the LAYOUT_MARS feature, SIDEKICK would have been
+	 * powered down by the FW.
+	 */
+	err = pvr_cr_poll_reg32(pvr_dev, ROGUE_CR_SIDEKICK_IDLE, sidekick_idle_mask,
+				sidekick_idle_mask, POLL_TIMEOUT_USEC);
+	if (err)
+		goto err_out;
+
+	/* Unset MTS DM association with threads. */
+	PVR_CR_WRITE32(pvr_dev, MTS_INTCTX_THREAD0_DM_ASSOC,
+		       ROGUE_CR_MTS_INTCTX_THREAD0_DM_ASSOC_MASKFULL &
+		       ROGUE_CR_MTS_INTCTX_THREAD0_DM_ASSOC_DM_ASSOC_CLRMSK);
+	PVR_CR_WRITE32(pvr_dev, MTS_BGCTX_THREAD0_DM_ASSOC,
+		       ROGUE_CR_MTS_BGCTX_THREAD0_DM_ASSOC_MASKFULL &
+		       ROGUE_CR_MTS_BGCTX_THREAD0_DM_ASSOC_DM_ASSOC_CLRMSK);
+	PVR_CR_WRITE32(pvr_dev, MTS_INTCTX_THREAD1_DM_ASSOC,
+		       ROGUE_CR_MTS_INTCTX_THREAD1_DM_ASSOC_MASKFULL &
+		       ROGUE_CR_MTS_INTCTX_THREAD1_DM_ASSOC_DM_ASSOC_CLRMSK);
+	PVR_CR_WRITE32(pvr_dev, MTS_BGCTX_THREAD1_DM_ASSOC,
+		       ROGUE_CR_MTS_BGCTX_THREAD1_DM_ASSOC_MASKFULL &
+		       ROGUE_CR_MTS_BGCTX_THREAD1_DM_ASSOC_DM_ASSOC_CLRMSK);
+
+	/* Extra Idle checks. */
+	err = pvr_cr_poll_reg32(pvr_dev, ROGUE_CR_BIF_STATUS_MMU, 0,
+				ROGUE_CR_BIF_STATUS_MMU_MASKFULL,
+				POLL_TIMEOUT_USEC);
+	if (err)
+		goto err_out;
+
+	err = pvr_cr_poll_reg32(pvr_dev, ROGUE_CR_BIFPM_STATUS_MMU, 0,
+				ROGUE_CR_BIFPM_STATUS_MMU_MASKFULL,
+				POLL_TIMEOUT_USEC);
+	if (err)
+		goto err_out;
+
+	if (!PVR_HAS_FEATURE(pvr_dev, xt_top_infrastructure)) {
+		err = pvr_cr_poll_reg32(pvr_dev, ROGUE_CR_BIF_READS_EXT_STATUS, 0,
+					ROGUE_CR_BIF_READS_EXT_STATUS_MASKFULL,
+					POLL_TIMEOUT_USEC);
+		if (err)
+			goto err_out;
+	}
+
+	err = pvr_cr_poll_reg32(pvr_dev, ROGUE_CR_BIFPM_READS_EXT_STATUS, 0,
+				ROGUE_CR_BIFPM_READS_EXT_STATUS_MASKFULL,
+				POLL_TIMEOUT_USEC);
+	if (err)
+		goto err_out;
+
+	err = pvr_cr_poll_reg64(pvr_dev, ROGUE_CR_SLC_STATUS1, 0,
+				ROGUE_CR_SLC_STATUS1_MASKFULL,
+				POLL_TIMEOUT_USEC);
+	if (err)
+		goto err_out;
+
+	/*
+	 * Wait for SLC to signal IDLE.
+	 * For cores with the LAYOUT_MARS feature, SLC would have been powered
+	 * down by the FW.
+	 */
+	err = pvr_cr_poll_reg32(pvr_dev, ROGUE_CR_SLC_IDLE,
+				ROGUE_CR_SLC_IDLE_MASKFULL,
+				ROGUE_CR_SLC_IDLE_MASKFULL, POLL_TIMEOUT_USEC);
+	if (err)
+		goto err_out;
+
+	/*
+	 * Wait for Sidekick/Jones to signal IDLE except for the Garten Wrapper.
+	 * For cores with the LAYOUT_MARS feature, SIDEKICK would have been powered
+	 * down by the FW.
+	 */
+	err = pvr_cr_poll_reg32(pvr_dev, ROGUE_CR_SIDEKICK_IDLE, sidekick_idle_mask,
+				sidekick_idle_mask, POLL_TIMEOUT_USEC);
+	if (err)
+		goto err_out;
+
+	if (pvr_dev->fw_dev.processor_type == PVR_FW_PROCESSOR_TYPE_META) {
+		err = pvr_meta_cr_read32(pvr_dev, META_CR_TxVECINT_BHALT, &reg_value);
+		if (err)
+			goto err_out;
+
+		/*
+		 * Wait for Sidekick/Jones to signal IDLE including the Garten
+		 * Wrapper if there is no debugger attached (TxVECINT_BHALT =
+		 * 0x0).
+		 */
+		if (reg_value)
+			skip_garten_idle = true;
+	}
+
+	if (!skip_garten_idle) {
+		err = pvr_cr_poll_reg32(pvr_dev, ROGUE_CR_SIDEKICK_IDLE,
+					ROGUE_CR_SIDEKICK_IDLE_GARTEN_EN,
+					ROGUE_CR_SIDEKICK_IDLE_GARTEN_EN,
+					POLL_TIMEOUT_USEC);
+		if (err)
+			goto err_out;
+	}
+
+	return 0;
+
+err_out:
+	return err;
+}
diff --git a/drivers/gpu/drm/imagination/pvr_fw_startstop.h b/drivers/gpu/drm/imagination/pvr_fw_startstop.h
new file mode 100644
index 000000000000..b833f6936b4d
--- /dev/null
+++ b/drivers/gpu/drm/imagination/pvr_fw_startstop.h
@@ -0,0 +1,13 @@
+/* SPDX-License-Identifier: GPL-2.0 OR MIT */
+/* Copyright (c) 2022 Imagination Technologies Ltd. */
+
+#ifndef PVR_FW_STARTSTOP_H
+#define PVR_FW_STARTSTOP_H
+
+/* Forward declaration from pvr_device.h. */
+struct pvr_device;
+
+int pvr_fw_start(struct pvr_device *pvr_dev);
+int pvr_fw_stop(struct pvr_device *pvr_dev);
+
+#endif /* PVR_FW_STARTSTOP_H */
diff --git a/drivers/gpu/drm/imagination/pvr_fw_trace.c b/drivers/gpu/drm/imagination/pvr_fw_trace.c
new file mode 100644
index 000000000000..42435149d56a
--- /dev/null
+++ b/drivers/gpu/drm/imagination/pvr_fw_trace.c
@@ -0,0 +1,99 @@
+// SPDX-License-Identifier: GPL-2.0 OR MIT
+/* Copyright (c) 2022 Imagination Technologies Ltd. */
+
+#include "pvr_device.h"
+#include "pvr_gem.h"
+#include "pvr_rogue_fwif.h"
+#include "pvr_rogue_fwif_sf.h"
+#include "pvr_fw_trace.h"
+
+#include <drm/drm_file.h>
+
+#include <linux/build_bug.h>
+#include <linux/dcache.h>
+#include <linux/sysfs.h>
+#include <linux/types.h>
+
+int pvr_fw_trace_init(struct pvr_device *pvr_dev)
+{
+	struct pvr_fw_trace *fw_trace = &pvr_dev->fw_dev.fw_trace;
+	struct drm_device *drm_dev = from_pvr_device(pvr_dev);
+	u32 thread_nr;
+	int err;
+
+	fw_trace->tracebuf_ctrl =
+		pvr_fw_object_create_and_map(pvr_dev,
+					     sizeof(*fw_trace->tracebuf_ctrl),
+					     PVR_BO_FW_FLAGS_DEVICE_UNCACHED |
+					     DRM_PVR_BO_CREATE_ZEROED,
+					     &fw_trace->tracebuf_ctrl_obj);
+	if (IS_ERR(fw_trace->tracebuf_ctrl)) {
+		drm_err(drm_dev, "Unable to allocate trace buffer control structure\n");
+		err = PTR_ERR(fw_trace->tracebuf_ctrl);
+		goto err_out;
+	}
+
+	BUILD_BUG_ON(ARRAY_SIZE(fw_trace->tracebuf_ctrl->tracebuf) !=
+		     ARRAY_SIZE(fw_trace->buffers));
+
+	for (thread_nr = 0; thread_nr < ARRAY_SIZE(fw_trace->buffers); thread_nr++) {
+		struct rogue_fwif_tracebuf_space *tracebuf_space =
+			&fw_trace->tracebuf_ctrl->tracebuf[thread_nr];
+		struct pvr_fw_trace_buffer *trace_buffer = &fw_trace->buffers[thread_nr];
+
+		trace_buffer->buf =
+			pvr_fw_object_create_and_map(pvr_dev,
+						     ROGUE_FW_TRACE_BUF_DEFAULT_SIZE_IN_DWORDS *
+						     sizeof(*trace_buffer->buf),
+						     PVR_BO_FW_FLAGS_DEVICE_UNCACHED |
+						     DRM_PVR_BO_CREATE_ZEROED,
+						     &trace_buffer->buf_obj);
+		if (IS_ERR(trace_buffer->buf)) {
+			drm_err(drm_dev, "Unable to allocate trace buffer\n");
+			err = PTR_ERR(trace_buffer->buf);
+			trace_buffer->buf = NULL;
+			goto err_free_buf;
+		}
+		trace_buffer->tracebuf_space = tracebuf_space;
+
+		pvr_fw_object_get_fw_addr(trace_buffer->buf_obj,
+					  &tracebuf_space->trace_buffer_fw_addr);
+
+		tracebuf_space->trace_buffer = trace_buffer->buf;
+		tracebuf_space->trace_pointer = 0;
+	}
+
+	fw_trace->tracebuf_ctrl->tracebuf_size_in_dwords =
+		ROGUE_FW_TRACE_BUF_DEFAULT_SIZE_IN_DWORDS;
+	fw_trace->tracebuf_ctrl->tracebuf_flags = 0;
+
+	fw_trace->tracebuf_ctrl->log_type = ROGUE_FWIF_LOG_TYPE_NONE;
+
+	return 0;
+
+err_free_buf:
+	for (thread_nr = 0; thread_nr < ARRAY_SIZE(fw_trace->buffers); thread_nr++) {
+		struct pvr_fw_trace_buffer *trace_buffer = &fw_trace->buffers[thread_nr];
+
+		if (trace_buffer->buf)
+			pvr_fw_object_unmap_and_destroy(trace_buffer->buf_obj);
+	}
+
+	pvr_fw_object_unmap_and_destroy(fw_trace->tracebuf_ctrl_obj);
+
+err_out:
+	return err;
+}
+
+void pvr_fw_trace_fini(struct pvr_device *pvr_dev)
+{
+	struct pvr_fw_trace *fw_trace = &pvr_dev->fw_dev.fw_trace;
+	u32 thread_nr;
+
+	for (thread_nr = 0; thread_nr < ARRAY_SIZE(fw_trace->buffers); thread_nr++) {
+		struct pvr_fw_trace_buffer *trace_buffer = &fw_trace->buffers[thread_nr];
+
+		pvr_fw_object_unmap_and_destroy(trace_buffer->buf_obj);
+	}
+	pvr_fw_object_unmap_and_destroy(fw_trace->tracebuf_ctrl_obj);
+}
diff --git a/drivers/gpu/drm/imagination/pvr_fw_trace.h b/drivers/gpu/drm/imagination/pvr_fw_trace.h
new file mode 100644
index 000000000000..736d9008d86c
--- /dev/null
+++ b/drivers/gpu/drm/imagination/pvr_fw_trace.h
@@ -0,0 +1,78 @@
+/* SPDX-License-Identifier: GPL-2.0 OR MIT */
+/* Copyright (c) 2022 Imagination Technologies Ltd. */
+
+#ifndef PVR_FW_TRACE_H
+#define PVR_FW_TRACE_H
+
+#include <drm/drm_file.h>
+#include <linux/types.h>
+
+#include "pvr_rogue_fwif.h"
+
+/* Forward declaration from pvr_device.h. */
+struct pvr_device;
+
+/* Forward declaration from pvr_gem.h. */
+struct pvr_fw_object;
+
+/* Forward declarations from pvr_rogue_fwif.h */
+struct rogue_fwif_tracebuf;
+struct rogue_fwif_tracebuf_space;
+
+/**
+ * struct pvr_fw_trace_buffer - Structure representing a trace buffer
+ */
+struct pvr_fw_trace_buffer {
+	/** @buf_obj: FW buffer object representing trace buffer. */
+	struct pvr_fw_object *buf_obj;
+
+	/** @buf: Pointer to CPU mapping of trace buffer. */
+	u32 *buf;
+
+	/**
+	 * @tracebuf_space: Pointer to FW tracebuf_space structure for this
+	 *                  trace buffer.
+	 */
+	struct rogue_fwif_tracebuf_space *tracebuf_space;
+};
+
+/**
+ * struct pvr_fw_trace - Device firmware trace data
+ */
+struct pvr_fw_trace {
+	/**
+	 * @tracebuf_ctrl_obj: Object representing FW trace buffer control
+	 *                     structure.
+	 */
+	struct pvr_fw_object *tracebuf_ctrl_obj;
+
+	/**
+	 * @tracebuf_ctrl: Pointer to CPU mapping of FW trace buffer control
+	 *                 structure.
+	 */
+	struct rogue_fwif_tracebuf *tracebuf_ctrl;
+
+	/**
+	 * @buffers: Array representing the actual trace buffers owned by this
+	 *           device.
+	 */
+	struct pvr_fw_trace_buffer buffers[ROGUE_FW_THREAD_MAX];
+
+	/** @group_mask: Mask of enabled trace groups. */
+	u32 group_mask;
+};
+
+int pvr_fw_trace_init(struct pvr_device *pvr_dev);
+void pvr_fw_trace_fini(struct pvr_device *pvr_dev);
+
+#if defined(CONFIG_DEBUG_FS)
+/* Forward declaration from <linux/dcache.h>. */
+struct dentry;
+
+void pvr_fw_trace_mask_update(struct pvr_device *pvr_dev, u32 old_mask,
+			      u32 new_mask);
+
+void pvr_fw_trace_debugfs_init(struct pvr_device *pvr_dev, struct dentry *dir);
+#endif /* defined(CONFIG_DEBUG_FS) */
+
+#endif /* PVR_FW_TRACE_H */
diff --git a/drivers/gpu/drm/imagination/pvr_power.c b/drivers/gpu/drm/imagination/pvr_power.c
index fa1a84934127..309148cf7d08 100644
--- a/drivers/gpu/drm/imagination/pvr_power.c
+++ b/drivers/gpu/drm/imagination/pvr_power.c
@@ -3,6 +3,7 @@
 
 #include "pvr_device.h"
 #include "pvr_fw.h"
+#include "pvr_fw_startstop.h"
 #include "pvr_power.h"
 #include "pvr_rogue_fwif.h"
 
@@ -31,8 +32,27 @@ pvr_device_lost(struct pvr_device *pvr_dev)
 static int
 pvr_power_send_command(struct pvr_device *pvr_dev, struct rogue_fwif_kccb_cmd *pow_cmd)
 {
-	/* TODO: implement */
-	return -ENODEV;
+	struct pvr_fw_device *fw_dev = &pvr_dev->fw_dev;
+	u32 slot_nr;
+	u32 value;
+	int err;
+
+	WRITE_ONCE(*fw_dev->power_sync, 0);
+
+	err = pvr_kccb_send_cmd_powered(pvr_dev, pow_cmd, &slot_nr);
+	if (err)
+		goto err_out;
+
+	/* Wait for FW to acknowledge. */
+	err = readl_poll_timeout(pvr_dev->fw_dev.power_sync, value, value != 0, 100,
+				 POWER_SYNC_TIMEOUT_US);
+	if (err)
+		goto err_out;
+
+	return 0;
+
+err_out:
+	return err;
 }
 
 int
@@ -76,8 +96,7 @@ pvr_power_fw_disable(struct pvr_device *pvr_dev)
 	if (err)
 		return err;
 
-	/* TODO: stop firmware */
-	return -ENODEV;
+	return pvr_fw_stop(pvr_dev);
 }
 
 static int
@@ -85,11 +104,17 @@ pvr_power_fw_enable(struct pvr_device *pvr_dev)
 {
 	int err;
 
-	/* TODO: start firmware */
-	err = -ENODEV;
+	err = pvr_fw_start(pvr_dev);
 	if (err)
 		return err;
 
+	err = pvr_wait_for_fw_boot(pvr_dev);
+	if (err) {
+		drm_err(from_pvr_device(pvr_dev), "Firmware failed to boot\n");
+		pvr_fw_stop(pvr_dev);
+		return err;
+	}
+
 	queue_delayed_work(pvr_dev->irq_wq, &pvr_dev->watchdog.work,
 			   msecs_to_jiffies(WATCHDOG_TIME_MS));
 
@@ -99,14 +124,37 @@ pvr_power_fw_enable(struct pvr_device *pvr_dev)
 bool
 pvr_power_is_idle(struct pvr_device *pvr_dev)
 {
-	/* TODO: implement */
-	return true;
+	/*
+	 * FW power state can be out of date if a KCCB command has been submitted but the FW hasn't
+	 * started processing it yet. So also check the KCCB status.
+	 */
+	enum rogue_fwif_pow_state pow_state = READ_ONCE(pvr_dev->fw_dev.fwif_sysdata->pow_state);
+	bool kccb_idle = pvr_kccb_is_idle(pvr_dev);
+
+	return (pow_state == ROGUE_FWIF_POW_IDLE) && kccb_idle;
 }
 
 static bool
 pvr_watchdog_kccb_stalled(struct pvr_device *pvr_dev)
 {
-	/* TODO: implement */
+	/* Check KCCB commands are progressing. */
+	u32 kccb_cmds_executed = pvr_dev->fw_dev.fwif_osdata->kccb_cmds_executed;
+	bool kccb_is_idle = pvr_kccb_is_idle(pvr_dev);
+
+	if (pvr_dev->watchdog.old_kccb_cmds_executed == kccb_cmds_executed && !kccb_is_idle) {
+		pvr_dev->watchdog.kccb_stall_count++;
+
+		/*
+		 * If we have commands pending with no progress for 2 consecutive polls then
+		 * consider KCCB command processing stalled.
+		 */
+		if (pvr_dev->watchdog.kccb_stall_count == 2)
+			return true;
+	} else {
+		pvr_dev->watchdog.old_kccb_cmds_executed = kccb_cmds_executed;
+		pvr_dev->watchdog.kccb_stall_count = 0;
+	}
+
 	return false;
 }
 
@@ -123,6 +171,9 @@ pvr_watchdog_worker(struct work_struct *work)
 	if (pm_runtime_get_if_in_use(from_pvr_device(pvr_dev)->dev) <= 0)
 		return;
 
+	if (!pvr_dev->fw_dev.booted)
+		goto out_requeue;
+
 	stalled = pvr_watchdog_kccb_stalled(pvr_dev);
 
 	if (stalled) {
@@ -130,6 +181,7 @@ pvr_watchdog_worker(struct work_struct *work)
 		pvr_device_lost(pvr_dev);
 	}
 
+out_requeue:
 	if (!pvr_dev->lost) {
 		queue_delayed_work(pvr_dev->irq_wq, &pvr_dev->watchdog.work,
 				   msecs_to_jiffies(WATCHDOG_TIME_MS));
@@ -160,6 +212,13 @@ pvr_power_device_suspend(struct device *dev)
 	struct platform_device *plat_dev = to_platform_device(dev);
 	struct drm_device *drm_dev = platform_get_drvdata(plat_dev);
 	struct pvr_device *pvr_dev = to_pvr_device(drm_dev);
+	int err = 0;
+
+	if (pvr_dev->fw_dev.booted) {
+		err = pvr_power_fw_disable(pvr_dev);
+		if (err)
+			return err;
+	}
 
 	clk_disable(pvr_dev->mem_clk);
 	clk_disable(pvr_dev->sys_clk);
@@ -189,7 +248,20 @@ pvr_power_device_resume(struct device *dev)
 	clk_enable(pvr_dev->sys_clk);
 	clk_enable(pvr_dev->mem_clk);
 
+	if (pvr_dev->fw_dev.booted) {
+		err = pvr_power_fw_enable(pvr_dev);
+		if (err)
+			goto err_clk_disable;
+	}
+
 	return 0;
+
+err_clk_disable:
+	clk_disable(pvr_dev->mem_clk);
+	clk_disable(pvr_dev->sys_clk);
+	clk_disable(pvr_dev->core_clk);
+
+	return err;
 }
 
 int
@@ -219,6 +291,10 @@ pvr_power_reset(struct pvr_device *pvr_dev)
 	if (err)
 		goto err_power_put;
 
+	/* Clear the FW faulted flags. */
+	pvr_dev->fw_dev.fwif_sysdata->hwr_state_flags &= ~(ROGUE_FWIF_HWR_FW_FAULT |
+							   ROGUE_FWIF_HWR_RESTART_REQUESTED);
+
 	err = pvr_power_fw_enable(pvr_dev);
 
 err_power_put:
diff --git a/drivers/gpu/drm/imagination/pvr_vm.c b/drivers/gpu/drm/imagination/pvr_vm.c
index bf31f5f463df..92015fee09a5 100644
--- a/drivers/gpu/drm/imagination/pvr_vm.c
+++ b/drivers/gpu/drm/imagination/pvr_vm.c
@@ -80,8 +80,39 @@
 int
 pvr_vm_mmu_flush(struct pvr_device *pvr_dev)
 {
-	/* TODO: implement */
-	return -ENODEV;
+	struct rogue_fwif_kccb_cmd cmd_mmu_cache;
+	struct rogue_fwif_mmucachedata *cmd_mmu_cache_data =
+		&cmd_mmu_cache.cmd_data.mmu_cache_data;
+	u32 slot;
+	int err;
+
+	/* Can't flush MMU if the firmware hasn't booted yet. */
+	if (!pvr_dev->fw_dev.booted) {
+		err = 0;
+		goto err_out;
+	}
+
+	cmd_mmu_cache.cmd_type = ROGUE_FWIF_KCCB_CMD_MMUCACHE;
+	/* Request a complete MMU flush, across all pagetable levels, TLBs and contexts. */
+	cmd_mmu_cache_data->cache_flags = ROGUE_FWIF_MMUCACHEDATA_FLAGS_PT |
+					  ROGUE_FWIF_MMUCACHEDATA_FLAGS_PD |
+					  ROGUE_FWIF_MMUCACHEDATA_FLAGS_PC |
+					  ROGUE_FWIF_MMUCACHEDATA_FLAGS_TLB |
+					  ROGUE_FWIF_MMUCACHEDATA_FLAGS_INTERRUPT;
+	pvr_fw_object_get_fw_addr(pvr_dev->fw_dev.mem.mmucache_sync_obj,
+				  &cmd_mmu_cache_data->mmu_cache_sync_fw_addr);
+	cmd_mmu_cache_data->mmu_cache_sync_update_value = 0;
+
+	err = pvr_kccb_send_cmd(pvr_dev, &cmd_mmu_cache, &slot);
+	if (err)
+		goto err_out;
+
+	err = pvr_kccb_wait_for_completion(pvr_dev, slot, HZ, NULL);
+	if (err)
+		goto err_out;
+
+err_out:
+	return err;
 }
 
 /**
@@ -2865,9 +2896,9 @@ pvr_vm_create_context(struct pvr_device *pvr_dev, bool is_userspace_context)
 		goto err_put_ctx;
 
 	if (is_userspace_context) {
-		/* TODO: Create FW mem context */
-		err = -ENODEV;
-		goto err_put_ctx;
+		err = pvr_fw_mem_context_create(pvr_dev, vm_ctx, &vm_ctx->fw_mem_ctx_obj);
+		if (err)
+			goto err_put_ctx;
 	}
 
 	return vm_ctx;
@@ -2894,8 +2925,8 @@ pvr_vm_context_release(struct kref *ref_count)
 	DRM_GPUVA_ITER(it, &vm_ctx->gpuva_mgr, 0);
 	struct drm_gpuva *va;
 
-	/* TODO: Destroy FW mem context */
-	WARN_ON(vm_ctx->fw_mem_ctx_obj);
+	if (vm_ctx->fw_mem_ctx_obj)
+		pvr_fw_mem_context_destroy(vm_ctx->fw_mem_ctx_obj);
 
 	drm_gpuva_iter_for_each(va, it) {
 		bool can_release_gem_obj;
-- 
2.40.1

