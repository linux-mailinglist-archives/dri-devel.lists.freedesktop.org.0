Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id DECA072E6F6
	for <lists+dri-devel@lfdr.de>; Tue, 13 Jun 2023 17:20:56 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 64EBC10E3B7;
	Tue, 13 Jun 2023 15:20:36 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx07-00376f01.pphosted.com (mx07-00376f01.pphosted.com
 [185.132.180.163])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BACB210E3A4
 for <dri-devel@lists.freedesktop.org>; Tue, 13 Jun 2023 15:20:27 +0000 (UTC)
Received: from pps.filterd (m0168889.ppops.net [127.0.0.1])
 by mx07-00376f01.pphosted.com (8.17.1.22/8.17.1.22) with ESMTP id
 35D6uk01011744; Tue, 13 Jun 2023 15:48:23 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=imgtec.com; h=
 from:to:cc:subject:date:message-id:in-reply-to:references
 :content-transfer-encoding:content-type:mime-version; s=
 dk201812; bh=mTgT5lHMnod9fXXBXNb70vxPu2tLA+UtiM3aEiYLmD0=; b=e/v
 MM9aFUwDjfGoOAYp66YP05U2qNwFXvPIMdnMVMlDZEowNiVg6nOrbmb9dC4XaI4f
 8FltD4u1oVw5WV1FQYm/9hCGpVvq7OBpT1g/NuE5WR/BynhHsk+3tu1+Doq4nyNu
 pscWBKz0iG61s7BT1ZP/HBE2/NLF+a1RW/Hn8UxVulzk0JqF6kx2QOCa0FRC/n59
 Z9PVfDXaOpCRB/i4I+7uTWKZb6TB+63LC4ZvV+TpB4G8N6i8lAROX3pzQc4C2Z/a
 ZMSZ/9tJ59MDK44ZLmnQ4QS0s+4IaFo/m85PRBbocU2/ZkpyluOvrfQleeA+VHpc
 /FV5FDd0s3L+oiwxWZg==
Received: from hhmail05.hh.imgtec.org ([217.156.249.195])
 by mx07-00376f01.pphosted.com (PPS) with ESMTPS id 3r4vqbt0kc-2
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT);
 Tue, 13 Jun 2023 15:48:22 +0100 (BST)
Received: from HHMAIL05.hh.imgtec.org (10.100.10.120) by
 HHMAIL05.hh.imgtec.org (10.100.10.120) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.23; Tue, 13 Jun 2023 15:48:21 +0100
Received: from GBR01-CWL-obe.outbound.protection.outlook.com (104.47.20.50) by
 email.imgtec.com (10.100.10.121) with Microsoft SMTP Server
 (version=TLS1_2, 
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.23 via Frontend
 Transport; Tue, 13 Jun 2023 15:48:21 +0100
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=ZcGumhnCnfRneeLtpLUODmWX9mFBrXRGIf9yh3GIpO2UQnrpnwNrH4BrjaQunNRb9fDmXpPj0OXTdHr2SeDqTA6a86OMGaydxtOMovmiB8MYK+PofSOUxYJi7lGgE/RuZkDmso3esbV82CJ5+n9YeXwaBdJ20nKqjEFcmMo0mHWqjRvf8BDjJtBGCyy2k5xb3uxWyLGJPj29iPNyqfHj2KbznfHNM7F/crpPwKRxZsYZrT3qTilTZNeVZxBTcfa2N1c3WIP33nSrFQuB6n/74a5qpk2mdGZjvG+hQonsP2DlE2Fra/2imBrdzx5EIGunWHdZIVWrRuxM8Y05l7NsvQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=mTgT5lHMnod9fXXBXNb70vxPu2tLA+UtiM3aEiYLmD0=;
 b=nXk3fvZKwcwyDmfcyjkEY+dHTdylO9blXBgReHNpdPT6Pd1REG/yddZPoRXnHI2gUt3p5hx8kghhvoE8/UG+9yBj+jAYK+6e23eqZd1aVYX0y1wR8EXwAYgilqCgAOsnoE1LWmqycgsRcblK4nDZClqQaa2K7J7Z8xlbPjpZ/trO/8nuUxw4MYKVSpXWNG9ZWR2MkHHr4Qj9OEpFIDRFXS4Dl5dCsTqbGQnJnSwji/UuTtSEEL5eiZ88kq2EEmDiAm+oDFg29xLLP49IELSB17xHEllpEgmq/bqPBI1pLSFzY3yCJf3i7Qxpz8CVRVooGMyy5fbOBf8TuQiIonqcnw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=imgtec.com; dmarc=pass action=none header.from=imgtec.com;
 dkim=pass header.d=imgtec.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=IMGTecCRM.onmicrosoft.com; s=selector2-IMGTecCRM-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=mTgT5lHMnod9fXXBXNb70vxPu2tLA+UtiM3aEiYLmD0=;
 b=p+CrxRW5heDlCfzEKYVSPDJrQMhcm+nWyos3fINAYSC5Euj/HRo6zR+lLiHqNL230U8cGTyXDRmOiOAmqxZaOYWdTCZFUZrCd1sA0ehFVDTtW/UeFoT13vWq0Fbs1xHCEBDWp4XaMP2strvO4raC+qdYJVqeOMzPaO24dtDY2m8=
Received: from CWXP265MB4826.GBRP265.PROD.OUTLOOK.COM (2603:10a6:400:155::11)
 by LO3P265MB2282.GBRP265.PROD.OUTLOOK.COM (2603:10a6:600:100::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6500.21; Tue, 13 Jun
 2023 14:48:19 +0000
Received: from CWXP265MB4826.GBRP265.PROD.OUTLOOK.COM
 ([fe80::23bd:d6e:8ecc:fa5f]) by CWXP265MB4826.GBRP265.PROD.OUTLOOK.COM
 ([fe80::23bd:d6e:8ecc:fa5f%5]) with mapi id 15.20.6500.020; Tue, 13 Jun 2023
 14:48:19 +0000
From: Sarah Walker <sarah.walker@imgtec.com>
To: <dri-devel@lists.freedesktop.org>
Subject: [PATCH v3 12/17] drm/imagination: Implement free list and HWRT create
 and destroy ioctls
Date: Tue, 13 Jun 2023 15:47:55 +0100
Message-Id: <20230613144800.52657-13-sarah.walker@imgtec.com>
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
X-MS-Office365-Filtering-Correlation-Id: f5177c40-1756-47d6-e819-08db6c1d3a4d
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 8HkcDVkvQkQVYVWbg/9DNzfzKlQbUHLcI+YJNkJZnIYhZ/eIA7O1gB5sNpSn9Tce5WrVlB1h+4r3hzwiLpjTHn/IplhbWnYuOnyz3bOTu80lrPz08tUTPTGX5pFN1DiUUl8d3HVv+FlWckyfKfzDyEsV2PylPegHweGKorFU6LPjNy6s64gTlPRvKAurY3l3zA+ukC2cFDy05jUNk9pBLGwk8QnZvfprRmmtR2eBPC7+qHfw8m/TmlFoE/X0J2d46dAHNazelqsiMzjHdPMbzqD9QGC5/SRQ03pydnHyXLFng1CqjMeqOO8nWEiTggJX3SZg6fqd9wOxLKq6LQBXPKxB6F5891Uapn/xH66xHycQby0ZgEp5IS+eSeHunjBOgwNRBEIJ7+pE5Venc84vQZ1B/1m4KVw1n6G5jvZXPfuzw5xc4AD/U9G+AzY0qmU2OpyaYG6x69zNcvxBn8x4hSjzEYrdoR8ZXbNKTqJPRAPpL+EB3snBkmMQ4RjLdxR/3BJQa8MYN1r6Ap27A7ChDLb1y9dYj5hlQWdVsnIxr0TZC/cxTIkoYV06erDTeYZNAGb3U/+wTUXvJhg7zVXjjOk34SARsWhsukj7OLeJjvLysSBcO2ZOI/rwkX2BOy9Y
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CWXP265MB4826.GBRP265.PROD.OUTLOOK.COM; PTR:; CAT:NONE;
 SFS:(13230028)(396003)(366004)(136003)(376002)(346002)(39840400004)(451199021)(44832011)(4326008)(8936002)(316002)(7416002)(66946007)(6916009)(66476007)(41300700001)(186003)(2906002)(30864003)(66556008)(478600001)(8676002)(5660300002)(6666004)(52116002)(6486002)(6512007)(1076003)(6506007)(26005)(83380400001)(36756003)(86362001)(2616005)(38350700002)(38100700002)(579004)(559001);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?POkfxYEXwSlthLrS0UBAIO+S86mUYCnPiJJ4v57AJufhLIxVlVreEa+VCgTq?=
 =?us-ascii?Q?Q8xmT6lgCu9ExEdyMmtHbagbuQA725eoemgnFZ6E0Y6eutCHVEnKtjUTKaiG?=
 =?us-ascii?Q?lmSJKffFQL4v1R42HnTuaKbnFbj82KKdErDvwwV4oibNAPdvI+XnR1zxi4HT?=
 =?us-ascii?Q?aKph8fPfMKF09zVCq0GsmWuih9HIhhIaQ6rDQ8aqzda36QjoDI221EJd9XP2?=
 =?us-ascii?Q?lM1oA/4EUuaVbov3hQ1ploGZW/3eJcvw3ox6B7jUYwNf5vyA9WtvrnOqDhO0?=
 =?us-ascii?Q?tEZ7XCO1rN0xMkX0PFL2BgNTQgcvWF9LhVyKPmmKlkTG6kgxfeRFo0HAd56O?=
 =?us-ascii?Q?OnxIkUlx2AeLf1uVkvr4njTC1qFgRzDFcgy+RObyGYVMbkLSfEFupC/Ip+8u?=
 =?us-ascii?Q?3+aRFVZXWJLdHSJnj1atlt09vWEFmt9Ka1FYaEPUujwshC3OHiYQPT4G3qXz?=
 =?us-ascii?Q?R+vwRYztnIF1oo5cs5ArZ2zb7ORBFBP9IvD/UUo6YTMVOrCThrXiiMwoyyli?=
 =?us-ascii?Q?NIsuwzVsjcpzBHUjYQ9PJFEV9bnqQm0NtbwINtNF6XWim1M6DRZrMb7tZU9W?=
 =?us-ascii?Q?2My/tw1RepluKvwdUmFnJ6eweC9OB37a2Kx5D8DpZEZZdpkx+P/g5jpnUEBh?=
 =?us-ascii?Q?78FEW15BU4PZ4rGa69JUrZgVTmuQd5+K4BEQIRr4YW46ZWf6i+Xlohm3F73b?=
 =?us-ascii?Q?wKUNZ2fjEJ97EcDsJW75EP5TIE00vlgYl5Atvx+PI/1aJZZ+SwDzrZRYquPN?=
 =?us-ascii?Q?PngUrHWrcvo/3SqKGSxg6w/HYAtiDOU2A1A8Y+70O4iWj1Bokh2L1iTNT45O?=
 =?us-ascii?Q?2PDEotUsdPZg3/CCboxmDqdiecE6p6jHORJnWWMDj1lUVYYa4gEm+GzmMQFJ?=
 =?us-ascii?Q?Vj7sQK9km+gWNcZX7o0M8/t9Z4238c5BwFP5GtntkMfY1SikzIXgOGZ0mqF7?=
 =?us-ascii?Q?D052DEryA6VyA1CIWNdSgsEU/gllmcTVCTSAb6qXZjqjtmapM+htThuYesB3?=
 =?us-ascii?Q?nHUMKHno0XmM9D8a8cijLmq75ItQCQ3dqmf6reo8hEuoIhr7QXZNVV8/rfZO?=
 =?us-ascii?Q?nMtt2TPxKVk9bL1nIXHfx5E7gVyAT/X88z9pEbYpS+tOZmPLzBrOVHpAZ5Cd?=
 =?us-ascii?Q?jNnh+uaC+KYmEAMxviDTgE166tYa5CgoK0ZBvus9RrCcjbEmVEERX0PRKInj?=
 =?us-ascii?Q?huMahrKV7Ask/Lis9Rla2YoQPuPbUvWL4ALLbbyifgQUCGiRJPqo/nsX4NVr?=
 =?us-ascii?Q?UZHvBFL1L/SZAoBPnV7/0rx9TPQRfGUVBpa7C/W6A4kD0vLkeBqg0Vk19GGp?=
 =?us-ascii?Q?7i2eHDDhSlXvNtAgnj0qbNicnfSc2ZyJSS3t8578trImz80pZ95eNTG5uhW8?=
 =?us-ascii?Q?1H9ALTIHLpVNhWmuqV/SRcijwMh4HNlRw5l8Eiw+9W5J7L63lPJfhoA5T1U0?=
 =?us-ascii?Q?WJ95IwLXi7IRqW4cv+g6dW6zqyJfanK4JGyo9RHuv2BxB6UQieCtHTpzl7Fc?=
 =?us-ascii?Q?oCDaYUcZQpwcU/f6VyI3oS4WzTyQtd6dKFX4UsnveQqCoNRHOyFCSKXJGzD5?=
 =?us-ascii?Q?4Hb8if03asGfvmOaBSvQBdMiaf0BlTzyIfFict0O822PUMt4Dc5LDW2Bd7AC?=
 =?us-ascii?Q?0Q=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: f5177c40-1756-47d6-e819-08db6c1d3a4d
X-MS-Exchange-CrossTenant-AuthSource: CWXP265MB4826.GBRP265.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 Jun 2023 14:48:19.2887 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 0d5fd8bb-e8c2-4e0a-8dd5-2c264f7140fe
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 7FBYseOkDDLnA7IADZdwYVcjF4AbxSyAKbpm2PrJVgjaBe7xEHtja9tlaTAx/6e5TiTVefrEwc+1n19HDykNCg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LO3P265MB2282
X-OriginatorOrg: imgtec.com
X-EXCLAIMER-MD-CONFIG: 15a78312-3e47-46eb-9010-2e54d84a9631
X-Proofpoint-ORIG-GUID: Zg8uhbYepTlcnVZPJF0qdbvbu7ajdX21
X-Proofpoint-GUID: Zg8uhbYepTlcnVZPJF0qdbvbu7ajdX21
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

Implement ioctls to create and destroy free lists and HWRT datasets. Free
lists are used for GPU-side memory allocation during geometry processing.
HWRT datasets are the FW-side structures representing render targets.

Signed-off-by: Sarah Walker <sarah.walker@imgtec.com>
---
 drivers/gpu/drm/imagination/Makefile        |   2 +
 drivers/gpu/drm/imagination/pvr_ccb.c       |  23 +
 drivers/gpu/drm/imagination/pvr_device.h    |  24 +
 drivers/gpu/drm/imagination/pvr_drv.c       | 104 +++-
 drivers/gpu/drm/imagination/pvr_free_list.c | 577 ++++++++++++++++++++
 drivers/gpu/drm/imagination/pvr_free_list.h | 185 +++++++
 drivers/gpu/drm/imagination/pvr_hwrt.c      | 559 +++++++++++++++++++
 drivers/gpu/drm/imagination/pvr_hwrt.h      | 163 ++++++
 8 files changed, 1633 insertions(+), 4 deletions(-)
 create mode 100644 drivers/gpu/drm/imagination/pvr_free_list.c
 create mode 100644 drivers/gpu/drm/imagination/pvr_free_list.h
 create mode 100644 drivers/gpu/drm/imagination/pvr_hwrt.c
 create mode 100644 drivers/gpu/drm/imagination/pvr_hwrt.h

diff --git a/drivers/gpu/drm/imagination/Makefile b/drivers/gpu/drm/imagination/Makefile
index 89a101dfb7f3..6edf64bed724 100644
--- a/drivers/gpu/drm/imagination/Makefile
+++ b/drivers/gpu/drm/imagination/Makefile
@@ -8,12 +8,14 @@ powervr-y := \
 	pvr_device.o \
 	pvr_device_info.o \
 	pvr_drv.o \
+	pvr_free_list.o \
 	pvr_fw.o \
 	pvr_fw_meta.o \
 	pvr_fw_mips.o \
 	pvr_fw_startstop.o \
 	pvr_fw_trace.o \
 	pvr_gem.o \
+	pvr_hwrt.o \
 	pvr_power.o \
 	pvr_vm.o \
 	pvr_vm_mips.o
diff --git a/drivers/gpu/drm/imagination/pvr_ccb.c b/drivers/gpu/drm/imagination/pvr_ccb.c
index 621470d04ea8..6cf8ed705845 100644
--- a/drivers/gpu/drm/imagination/pvr_ccb.c
+++ b/drivers/gpu/drm/imagination/pvr_ccb.c
@@ -4,6 +4,7 @@
 #include "pvr_ccb.h"
 #include "pvr_device.h"
 #include "pvr_drv.h"
+#include "pvr_free_list.h"
 #include "pvr_fw.h"
 #include "pvr_gem.h"
 #include "pvr_power.h"
@@ -127,6 +128,28 @@ process_fwccb_command(struct pvr_device *pvr_dev, struct rogue_fwif_fwccb_cmd *c
 		WARN_ON(pvr_power_reset(pvr_dev));
 		break;
 
+	case ROGUE_FWIF_FWCCB_CMD_FREELISTS_RECONSTRUCTION: {
+		struct rogue_fwif_fwccb_cmd_freelists_reconstruction_data *data =
+			&cmd->cmd_data.cmd_freelists_reconstruction;
+		struct rogue_fwif_kccb_cmd resp_cmd;
+		struct rogue_fwif_freelists_reconstruction_data *resp_data =
+			&resp_cmd.cmd_data.free_lists_reconstruction_data;
+		u32 i;
+
+		for (i = 0; i < data->freelist_count; i++)
+			pvr_free_list_reconstruct(pvr_dev, data->freelist_ids[i]);
+
+		resp_cmd.cmd_type = ROGUE_FWIF_KCCB_CMD_FREELISTS_RECONSTRUCTION_UPDATE;
+		resp_cmd.kccb_flags = 0;
+		resp_data->freelist_count = data->freelist_count;
+
+		memcpy(resp_data->freelist_ids, data->freelist_ids,
+		       data->freelist_count * sizeof(resp_data->freelist_ids[0]));
+
+		WARN_ON(pvr_kccb_send_cmd(pvr_dev, &resp_cmd, NULL));
+		break;
+	}
+
 	default:
 		drm_info(from_pvr_device(pvr_dev), "Received unknown FWCCB command %x\n",
 			 cmd->cmd_type);
diff --git a/drivers/gpu/drm/imagination/pvr_device.h b/drivers/gpu/drm/imagination/pvr_device.h
index ecd044564653..9431ebe64656 100644
--- a/drivers/gpu/drm/imagination/pvr_device.h
+++ b/drivers/gpu/drm/imagination/pvr_device.h
@@ -144,6 +144,14 @@ struct pvr_device {
 	/** @fw_dev: Firmware related data. */
 	struct pvr_fw_device fw_dev;
 
+	/**
+	 * @free_list_ids: Array of free lists belonging to this device. Array members
+	 *                 are of type "struct pvr_free_list *".
+	 *
+	 * This array is used to allocate IDs used by the firmware.
+	 */
+	struct xarray free_list_ids;
+
 	struct {
 		/** @work: Work item for watchdog callback. */
 		struct delayed_work work;
@@ -224,6 +232,22 @@ struct pvr_file {
 	 */
 	struct pvr_device *pvr_dev;
 
+	/**
+	 * @free_list_handles: Array of free lists belonging to this file. Array
+	 * members are of type "struct pvr_free_list *".
+	 *
+	 * This array is used to allocate handles returned to userspace.
+	 */
+	struct xarray free_list_handles;
+
+	/**
+	 * @hwrt_handles: Array of HWRT datasets belonging to this file. Array
+	 * members are of type "struct pvr_hwrt_dataset *".
+	 *
+	 * This array is used to allocate handles returned to userspace.
+	 */
+	struct xarray hwrt_handles;
+
 	/**
 	 * @vm_ctx_handles: Array of VM contexts belonging to this file. Array
 	 * members are of type "struct pvr_vm_context *".
diff --git a/drivers/gpu/drm/imagination/pvr_drv.c b/drivers/gpu/drm/imagination/pvr_drv.c
index 9d26cfcc7a16..3172ac4796b8 100644
--- a/drivers/gpu/drm/imagination/pvr_drv.c
+++ b/drivers/gpu/drm/imagination/pvr_drv.c
@@ -3,7 +3,9 @@
 
 #include "pvr_device.h"
 #include "pvr_drv.h"
+#include "pvr_free_list.h"
 #include "pvr_gem.h"
+#include "pvr_hwrt.h"
 #include "pvr_power.h"
 #include "pvr_rogue_defs.h"
 #include "pvr_rogue_fwif_client.h"
@@ -743,7 +745,37 @@ static int
 pvr_ioctl_create_free_list(struct drm_device *drm_dev, void *raw_args,
 			   struct drm_file *file)
 {
-	return -ENOTTY;
+	struct drm_pvr_ioctl_create_free_list_args *args = raw_args;
+	struct pvr_device *pvr_dev = to_pvr_device(drm_dev);
+	struct pvr_file *pvr_file = to_pvr_file(file);
+	struct pvr_free_list *free_list;
+	int err;
+
+	if (pvr_dev->lost)
+		return -EIO;
+
+	free_list = pvr_free_list_create(pvr_file, args);
+	if (IS_ERR(free_list)) {
+		err = PTR_ERR(free_list);
+		goto err_out;
+	}
+
+	/* Allocate object handle for userspace. */
+	err = xa_alloc(&pvr_file->free_list_handles,
+		       &args->handle,
+		       free_list,
+		       xa_limit_32b,
+		       GFP_KERNEL);
+	if (err < 0)
+		goto err_cleanup;
+
+	return 0;
+
+err_cleanup:
+	pvr_free_list_put(free_list);
+
+err_out:
+	return err;
 }
 
 /**
@@ -763,7 +795,19 @@ static int
 pvr_ioctl_destroy_free_list(struct drm_device *drm_dev, void *raw_args,
 			    struct drm_file *file)
 {
-	return -ENOTTY;
+	struct drm_pvr_ioctl_destroy_free_list_args *args = raw_args;
+	struct pvr_file *pvr_file = to_pvr_file(file);
+	struct pvr_free_list *free_list;
+
+	if (args->_padding_4)
+		return -EINVAL;
+
+	free_list = xa_erase(&pvr_file->free_list_handles, args->handle);
+	if (!free_list)
+		return -EINVAL;
+
+	pvr_free_list_put(free_list);
+	return 0;
 }
 
 /**
@@ -783,7 +827,37 @@ static int
 pvr_ioctl_create_hwrt_dataset(struct drm_device *drm_dev, void *raw_args,
 			      struct drm_file *file)
 {
-	return -ENOTTY;
+	struct drm_pvr_ioctl_create_hwrt_dataset_args *args = raw_args;
+	struct pvr_device *pvr_dev = to_pvr_device(drm_dev);
+	struct pvr_file *pvr_file = to_pvr_file(file);
+	struct pvr_hwrt_dataset *hwrt;
+	int err;
+
+	if (pvr_dev->lost)
+		return -EIO;
+
+	hwrt = pvr_hwrt_dataset_create(pvr_file, args);
+	if (IS_ERR(hwrt)) {
+		err = PTR_ERR(hwrt);
+		goto err_out;
+	}
+
+	/* Allocate object handle for userspace. */
+	err = xa_alloc(&pvr_file->hwrt_handles,
+		       &args->handle,
+		       hwrt,
+		       xa_limit_32b,
+		       GFP_KERNEL);
+	if (err < 0)
+		goto err_cleanup;
+
+	return 0;
+
+err_cleanup:
+	pvr_hwrt_dataset_put(hwrt);
+
+err_out:
+	return err;
 }
 
 /**
@@ -803,7 +877,19 @@ static int
 pvr_ioctl_destroy_hwrt_dataset(struct drm_device *drm_dev, void *raw_args,
 			       struct drm_file *file)
 {
-	return -ENOTTY;
+	struct drm_pvr_ioctl_destroy_hwrt_dataset_args *args = raw_args;
+	struct pvr_file *pvr_file = to_pvr_file(file);
+	struct pvr_hwrt_dataset *hwrt;
+
+	if (args->_padding_4)
+		return -EINVAL;
+
+	hwrt = xa_erase(&pvr_file->hwrt_handles, args->handle);
+	if (!hwrt)
+		return -EINVAL;
+
+	pvr_hwrt_dataset_put(hwrt);
+	return 0;
 }
 
 /**
@@ -1215,6 +1301,8 @@ pvr_drm_driver_open(struct drm_device *drm_dev, struct drm_file *file)
 	 */
 	pvr_file->pvr_dev = pvr_dev;
 
+	xa_init_flags(&pvr_file->free_list_handles, XA_FLAGS_ALLOC1);
+	xa_init_flags(&pvr_file->hwrt_handles, XA_FLAGS_ALLOC1);
 	xa_init_flags(&pvr_file->vm_ctx_handles, XA_FLAGS_ALLOC1);
 
 	/*
@@ -1246,6 +1334,8 @@ pvr_drm_driver_postclose(__always_unused struct drm_device *drm_dev,
 	struct pvr_file *pvr_file = to_pvr_file(file);
 
 	/* Drop references on any remaining objects. */
+	pvr_destroy_free_lists_for_file(pvr_file);
+	pvr_destroy_hwrt_datasets_for_file(pvr_file);
 	pvr_destroy_vm_contexts_for_file(pvr_file);
 
 	kfree(pvr_file);
@@ -1317,6 +1407,8 @@ pvr_probe(struct platform_device *plat_dev)
 	if (err)
 		goto err_device_fini;
 
+	xa_init_flags(&pvr_dev->free_list_ids, XA_FLAGS_ALLOC1);
+
 	return 0;
 
 err_device_fini:
@@ -1335,6 +1427,10 @@ pvr_remove(struct platform_device *plat_dev)
 	struct drm_device *drm_dev = platform_get_drvdata(plat_dev);
 	struct pvr_device *pvr_dev = to_pvr_device(drm_dev);
 
+	WARN_ON(!xa_empty(&pvr_dev->free_list_ids));
+
+	xa_destroy(&pvr_dev->free_list_ids);
+
 	drm_dev_unregister(drm_dev);
 	pvr_device_fini(pvr_dev);
 	pvr_power_fini(pvr_dev);
diff --git a/drivers/gpu/drm/imagination/pvr_free_list.c b/drivers/gpu/drm/imagination/pvr_free_list.c
new file mode 100644
index 000000000000..d8aa1d7700a1
--- /dev/null
+++ b/drivers/gpu/drm/imagination/pvr_free_list.c
@@ -0,0 +1,577 @@
+// SPDX-License-Identifier: GPL-2.0 OR MIT
+/* Copyright (c) 2022 Imagination Technologies Ltd. */
+
+#include "pvr_free_list.h"
+#include "pvr_gem.h"
+#include "pvr_hwrt.h"
+#include "pvr_rogue_fwif.h"
+#include "pvr_vm.h"
+
+#include <drm/drm_gem.h>
+#include <linux/slab.h>
+#include <linux/xarray.h>
+#include <uapi/drm/pvr_drm.h>
+
+#define FREE_LIST_ENTRY_SIZE sizeof(u32)
+
+#define FREE_LIST_ALIGNMENT \
+	((ROGUE_BIF_PM_FREELIST_BASE_ADDR_ALIGNSIZE / FREE_LIST_ENTRY_SIZE) - 1)
+
+#define FREE_LIST_MIN_PAGES 50
+#define FREE_LIST_MIN_PAGES_BRN66011 40
+#define FREE_LIST_MIN_PAGES_ROGUEXE 25
+
+/**
+ * pvr_get_free_list_min_pages() - Get minimum free list size for this device
+ * @pvr_dev: Device pointer.
+ *
+ * Returns:
+ *  * Minimum free list size, in PM physical pages.
+ */
+u32
+pvr_get_free_list_min_pages(struct pvr_device *pvr_dev)
+{
+	u32 value;
+
+	if (PVR_HAS_FEATURE(pvr_dev, roguexe)) {
+		if (PVR_HAS_QUIRK(pvr_dev, 66011))
+			value = FREE_LIST_MIN_PAGES_BRN66011;
+		else
+			value = FREE_LIST_MIN_PAGES_ROGUEXE;
+	} else {
+		value = FREE_LIST_MIN_PAGES;
+	}
+
+	return value;
+}
+
+static int
+free_list_create_kernel_structure(struct pvr_file *pvr_file,
+				  struct drm_pvr_ioctl_create_free_list_args *args,
+				  struct pvr_free_list *free_list)
+{
+	struct pvr_gem_object *free_list_obj;
+	struct pvr_vm_context *vm_ctx;
+	u64 free_list_size;
+	int err;
+
+	if (args->grow_threshold > 100 ||
+	    args->initial_num_pages > args->max_num_pages ||
+	    args->grow_num_pages > args->max_num_pages ||
+	    args->max_num_pages == 0 ||
+	    (args->initial_num_pages < args->max_num_pages && !args->grow_num_pages) ||
+	    (args->initial_num_pages == args->max_num_pages && args->grow_num_pages)) {
+		err = -EINVAL;
+		goto err_out;
+	}
+	if ((args->initial_num_pages & FREE_LIST_ALIGNMENT) ||
+	    (args->max_num_pages & FREE_LIST_ALIGNMENT) ||
+	    (args->grow_num_pages & FREE_LIST_ALIGNMENT)) {
+		err = -EINVAL;
+		goto err_out;
+	}
+
+	vm_ctx = pvr_vm_context_lookup(pvr_file, args->vm_context_handle);
+	if (!vm_ctx) {
+		err = -EINVAL;
+		goto err_out;
+	}
+
+	free_list_obj = pvr_vm_find_gem_object(vm_ctx, args->free_list_gpu_addr,
+					       NULL, &free_list_size);
+	if (!free_list_obj) {
+		err = -EINVAL;
+		goto err_put_vm_context;
+	}
+
+	if ((free_list_obj->flags & DRM_PVR_BO_CPU_ALLOW_USERSPACE_ACCESS) ||
+	    !(free_list_obj->flags & DRM_PVR_BO_DEVICE_PM_FW_PROTECT) ||
+	    free_list_size < (args->max_num_pages * FREE_LIST_ENTRY_SIZE)) {
+		err = -EINVAL;
+		goto err_put_free_list_obj;
+	}
+
+	free_list->pvr_dev = pvr_file->pvr_dev;
+	free_list->current_pages = 0;
+	free_list->max_pages = args->max_num_pages;
+	free_list->grow_pages = args->grow_num_pages;
+	free_list->grow_threshold = args->grow_threshold;
+	free_list->obj = free_list_obj;
+
+	err = pvr_gem_object_get_pages(free_list->obj);
+	if (err < 0)
+		goto err_put_free_list_obj;
+
+	pvr_vm_context_put(vm_ctx);
+
+	return 0;
+
+err_put_free_list_obj:
+	pvr_gem_object_put(free_list_obj);
+
+err_put_vm_context:
+	pvr_vm_context_put(vm_ctx);
+
+err_out:
+	return err;
+}
+
+static void
+free_list_destroy_kernel_structure(struct pvr_free_list *free_list)
+{
+	WARN_ON(!list_empty(&free_list->hwrt_list));
+
+	pvr_gem_object_put_pages(free_list->obj);
+	pvr_gem_object_put(free_list->obj);
+}
+
+/**
+ * calculate_free_list_ready_pages_locked() - Function to work out the number of free
+ *                                            list pages to reserve for growing within
+ *                                            the FW without having to wait for the
+ *                                            host to progress a grow request
+ * @free_list: Pointer to free list.
+ * @pages: Total pages currently in free list.
+ *
+ * If the threshold or grow size means less than the alignment size (4 pages on
+ * Rogue), then the feature is not used.
+ *
+ * Caller must hold &free_list->lock.
+ *
+ * Return: number of pages to reserve.
+ */
+static u32
+calculate_free_list_ready_pages_locked(struct pvr_free_list *free_list, u32 pages)
+{
+	u32 ready_pages;
+
+	lockdep_assert_held(&free_list->lock);
+
+	ready_pages = ((pages * free_list->grow_threshold) / 100);
+
+	/* The number of pages must be less than the grow size. */
+	ready_pages = min(ready_pages, free_list->grow_pages);
+
+	/*
+	 * The number of pages must be a multiple of the free list align size.
+	 */
+	ready_pages &= ~FREE_LIST_ALIGNMENT;
+
+	return ready_pages;
+}
+
+static u32
+calculate_free_list_ready_pages(struct pvr_free_list *free_list, u32 pages)
+{
+	u32 ret;
+
+	mutex_lock(&free_list->lock);
+
+	ret = calculate_free_list_ready_pages_locked(free_list, pages);
+
+	mutex_unlock(&free_list->lock);
+
+	return ret;
+}
+
+static int
+free_list_create_fw_structure(struct pvr_file *pvr_file,
+			      struct drm_pvr_ioctl_create_free_list_args *args,
+			      struct pvr_free_list *free_list)
+{
+	struct pvr_device *pvr_dev = pvr_file->pvr_dev;
+	struct rogue_fwif_freelist *fw_data;
+	u32 ready_pages;
+	int err;
+
+	/*
+	 * Create and map the FW structure so we can initialise it. This is not
+	 * accessed on the CPU side post-initialisation so the mapping lifetime
+	 * is only for this function.
+	 */
+	free_list->fw_data = pvr_fw_object_create_and_map(pvr_dev, sizeof(*free_list->fw_data),
+							  PVR_BO_FW_FLAGS_DEVICE_UNCACHED |
+							  DRM_PVR_BO_CREATE_ZEROED,
+							  &free_list->fw_obj);
+	if (IS_ERR(free_list->fw_data)) {
+		err = PTR_ERR(free_list->fw_data);
+		goto err_out;
+	}
+
+	/* Fill out FW structure */
+	ready_pages = calculate_free_list_ready_pages(free_list,
+						      args->initial_num_pages);
+
+	fw_data = free_list->fw_data;
+
+	fw_data->max_pages = free_list->max_pages;
+	fw_data->current_pages = args->initial_num_pages - ready_pages;
+	fw_data->grow_pages = free_list->grow_pages;
+	fw_data->ready_pages = ready_pages;
+	fw_data->freelist_id = free_list->fw_id;
+	fw_data->grow_pending = false;
+	fw_data->current_stack_top = fw_data->current_pages - 1;
+	fw_data->freelist_dev_addr = args->free_list_gpu_addr;
+	fw_data->current_dev_addr = (fw_data->freelist_dev_addr +
+				     ((fw_data->max_pages - fw_data->current_pages) *
+				      FREE_LIST_ENTRY_SIZE)) &
+				    ~((u64)ROGUE_BIF_PM_FREELIST_BASE_ADDR_ALIGNSIZE - 1);
+
+	return 0;
+
+err_out:
+	return err;
+}
+
+static void
+free_list_destroy_fw_structure(struct pvr_free_list *free_list)
+{
+	pvr_fw_object_unmap_and_destroy(free_list->fw_obj);
+}
+
+static int
+pvr_free_list_insert_pages_locked(struct pvr_free_list *free_list,
+				  struct sg_table *sgt, u32 offset, u32 num_pages)
+{
+	struct sg_dma_page_iter dma_iter;
+	u32 *page_list;
+	int err;
+
+	lockdep_assert_held(&free_list->lock);
+
+	page_list = pvr_gem_object_vmap(free_list->obj);
+	if (IS_ERR(page_list)) {
+		err = PTR_ERR(page_list);
+		goto err_out;
+	}
+
+	offset /= FREE_LIST_ENTRY_SIZE;
+	/* clang-format off */
+	for_each_sgtable_dma_page(sgt, &dma_iter, 0) {
+		dma_addr_t dma_addr = sg_page_iter_dma_address(&dma_iter);
+		u64 dma_pfn = dma_addr >>
+			       ROGUE_BIF_PM_PHYSICAL_PAGE_ALIGNSHIFT;
+		u32 dma_addr_offset;
+
+		BUILD_BUG_ON(ROGUE_BIF_PM_PHYSICAL_PAGE_SIZE > PAGE_SIZE);
+
+		for (dma_addr_offset = 0; dma_addr_offset < PAGE_SIZE;
+		     dma_addr_offset += ROGUE_BIF_PM_PHYSICAL_PAGE_SIZE) {
+			WARN_ON_ONCE(dma_pfn >> 32);
+
+			page_list[offset++] = (u32)dma_pfn;
+			dma_pfn++;
+
+			num_pages--;
+			if (!num_pages)
+				break;
+		}
+
+		if (!num_pages)
+			break;
+	};
+	/* clang-format on */
+
+	/* Make sure our free_list update is flushed. */
+	wmb();
+
+	pvr_gem_object_vunmap(free_list->obj);
+
+	return 0;
+
+err_out:
+	return err;
+}
+
+static int
+pvr_free_list_insert_node_locked(struct pvr_free_list_node *free_list_node)
+{
+	struct pvr_free_list *free_list = free_list_node->free_list;
+	struct sg_table *sgt;
+	u32 start_page;
+	u32 offset;
+	int err;
+
+	lockdep_assert_held(&free_list->lock);
+
+	start_page = free_list->max_pages - free_list->current_pages -
+		     free_list_node->num_pages;
+	offset = (start_page * FREE_LIST_ENTRY_SIZE) &
+		  ~((u64)ROGUE_BIF_PM_FREELIST_BASE_ADDR_ALIGNSIZE - 1);
+
+	sgt = drm_gem_shmem_get_pages_sgt(&free_list_node->mem_obj->base);
+	if (WARN_ON(IS_ERR(sgt)))
+		return PTR_ERR(sgt);
+
+	err = pvr_free_list_insert_pages_locked(free_list, sgt,
+						offset, free_list_node->num_pages);
+	if (!err)
+		free_list->current_pages += free_list_node->num_pages;
+
+	return err;
+}
+
+static int
+pvr_free_list_grow(struct pvr_free_list *free_list, u32 num_pages)
+{
+	struct pvr_device *pvr_dev = free_list->pvr_dev;
+	struct pvr_free_list_node *free_list_node;
+	int err;
+
+	mutex_lock(&free_list->lock);
+
+	if (num_pages & FREE_LIST_ALIGNMENT) {
+		err = -EINVAL;
+		goto err_unlock;
+	}
+
+	free_list_node = kzalloc(sizeof(*free_list_node), GFP_KERNEL);
+	if (!free_list_node) {
+		err = -ENOMEM;
+		goto err_unlock;
+	}
+
+	free_list_node->num_pages = num_pages;
+	free_list_node->free_list = free_list;
+
+	free_list_node->mem_obj = pvr_gem_object_create(pvr_dev,
+							num_pages <<
+							ROGUE_BIF_PM_PHYSICAL_PAGE_ALIGNSHIFT,
+							PVR_BO_FW_FLAGS_DEVICE_CACHED);
+	if (IS_ERR(free_list_node->mem_obj)) {
+		err = PTR_ERR(free_list_node->mem_obj);
+		goto err_free;
+	}
+
+	err = pvr_gem_object_get_pages(free_list_node->mem_obj);
+	if (err < 0)
+		goto err_destroy_gem_object;
+
+	err = pvr_free_list_insert_node_locked(free_list_node);
+	if (err)
+		goto err_put_pages;
+
+	list_add_tail(&free_list_node->node, &free_list->mem_block_list);
+
+	/*
+	 * Reserve a number ready pages to allow the FW to process OOM quickly
+	 * and asynchronously request a grow.
+	 */
+	free_list->ready_pages =
+		calculate_free_list_ready_pages_locked(free_list,
+						       free_list->current_pages);
+	free_list->current_pages -= free_list->ready_pages;
+
+	mutex_unlock(&free_list->lock);
+
+	return 0;
+
+err_put_pages:
+	pvr_gem_object_put_pages(free_list_node->mem_obj);
+
+err_destroy_gem_object:
+	pvr_gem_object_put(free_list_node->mem_obj);
+
+err_free:
+	kfree(free_list_node);
+
+err_unlock:
+	mutex_unlock(&free_list->lock);
+
+	return err;
+}
+
+static void
+pvr_free_list_free_node(struct pvr_free_list_node *free_list_node)
+{
+	pvr_gem_object_put_pages(free_list_node->mem_obj);
+	pvr_gem_object_put(free_list_node->mem_obj);
+
+	kfree(free_list_node);
+}
+
+/**
+ * pvr_free_list_create() - Create a new free list and return an object pointer
+ * @pvr_file: Pointer to pvr_file structure.
+ * @args: Creation arguments from userspace.
+ *
+ * Return:
+ *  * Pointer to new free_list, or
+ *  * ERR_PTR(-%ENOMEM) on out of memory.
+ */
+struct pvr_free_list *
+pvr_free_list_create(struct pvr_file *pvr_file,
+		     struct drm_pvr_ioctl_create_free_list_args *args)
+{
+	struct pvr_free_list *free_list;
+	int err;
+
+	/* Create and fill out the kernel structure */
+	free_list = kzalloc(sizeof(*free_list), GFP_KERNEL);
+
+	if (!free_list)
+		return ERR_PTR(-ENOMEM);
+
+	kref_init(&free_list->ref_count);
+	INIT_LIST_HEAD(&free_list->mem_block_list);
+	INIT_LIST_HEAD(&free_list->hwrt_list);
+	mutex_init(&free_list->lock);
+
+	err = free_list_create_kernel_structure(pvr_file, args, free_list);
+	if (err < 0)
+		goto err_free;
+
+	/* Allocate global object ID for firmware. */
+	err = xa_alloc(&pvr_file->pvr_dev->free_list_ids,
+		       &free_list->fw_id,
+		       free_list,
+		       xa_limit_32b,
+		       GFP_KERNEL);
+	if (err)
+		goto err_destroy_kernel_structure;
+
+	err = free_list_create_fw_structure(pvr_file, args, free_list);
+	if (err < 0)
+		goto err_free_fw_id;
+
+	err = pvr_free_list_grow(free_list, args->initial_num_pages);
+	if (err < 0)
+		goto err_fw_struct_cleanup;
+
+	return free_list;
+
+err_fw_struct_cleanup:
+	WARN_ON(pvr_fw_structure_cleanup(free_list->pvr_dev,
+					 ROGUE_FWIF_CLEANUP_FREELIST,
+					 free_list->fw_obj, 0));
+
+err_free_fw_id:
+	xa_erase(&free_list->pvr_dev->free_list_ids, free_list->fw_id);
+
+err_destroy_kernel_structure:
+	free_list_destroy_kernel_structure(free_list);
+
+err_free:
+	mutex_destroy(&free_list->lock);
+	kfree(free_list);
+
+	return ERR_PTR(err);
+}
+
+static void
+pvr_free_list_release(struct kref *ref_count)
+{
+	struct pvr_free_list *free_list =
+		container_of(ref_count, struct pvr_free_list, ref_count);
+	struct list_head *pos, *n;
+
+	xa_erase(&free_list->pvr_dev->free_list_ids, free_list->fw_id);
+
+	WARN_ON(pvr_fw_structure_cleanup(free_list->pvr_dev, ROGUE_FWIF_CLEANUP_FREELIST,
+					 free_list->fw_obj, 0));
+
+	/* clang-format off */
+	list_for_each_safe(pos, n, &free_list->mem_block_list) {
+		struct pvr_free_list_node *free_list_node =
+			container_of(pos, struct pvr_free_list_node, node);
+
+		list_del(pos);
+		pvr_free_list_free_node(free_list_node);
+	}
+	/* clang-format on */
+
+	free_list_destroy_kernel_structure(free_list);
+	free_list_destroy_fw_structure(free_list);
+	mutex_destroy(&free_list->lock);
+	kfree(free_list);
+}
+
+/**
+ * pvr_destroy_free_lists_for_file: Destroy any free lists associated with the
+ * given file.
+ * @pvr_file: Pointer to pvr_file structure.
+ *
+ * Removes all free lists associated with @pvr_file from the device free_list
+ * list and drops initial references. Free lists will then be destroyed once
+ * all outstanding references are dropped.
+ */
+void pvr_destroy_free_lists_for_file(struct pvr_file *pvr_file)
+{
+	struct pvr_free_list *free_list;
+	unsigned long handle;
+
+	xa_for_each(&pvr_file->free_list_handles, handle, free_list) {
+		(void)free_list;
+		pvr_free_list_put(xa_erase(&pvr_file->free_list_handles, handle));
+	}
+}
+
+/**
+ * pvr_free_list_put() - Release reference on free list
+ * @free_list: Pointer to list to release reference on
+ */
+void
+pvr_free_list_put(struct pvr_free_list *free_list)
+{
+	if (free_list)
+		kref_put(&free_list->ref_count, pvr_free_list_release);
+}
+
+void pvr_free_list_add_hwrt(struct pvr_free_list *free_list, struct pvr_hwrt_data *hwrt_data)
+{
+	mutex_lock(&free_list->lock);
+
+	list_add_tail(&hwrt_data->freelist_node, &free_list->hwrt_list);
+
+	mutex_unlock(&free_list->lock);
+}
+
+void pvr_free_list_remove_hwrt(struct pvr_free_list *free_list, struct pvr_hwrt_data *hwrt_data)
+{
+	mutex_lock(&free_list->lock);
+
+	list_del(&hwrt_data->freelist_node);
+
+	mutex_unlock(&free_list->lock);
+}
+
+void
+pvr_free_list_reconstruct(struct pvr_device *pvr_dev, u32 freelist_id)
+{
+	struct pvr_free_list *free_list = pvr_free_list_lookup_id(pvr_dev, freelist_id);
+	struct pvr_free_list_node *free_list_node;
+	struct rogue_fwif_freelist *fw_data;
+	struct pvr_hwrt_data *hwrt_data;
+
+	if (!free_list)
+		return;
+
+	mutex_lock(&free_list->lock);
+
+	/* Rebuild the free list based on the memory block list. */
+	free_list->current_pages = 0;
+
+	list_for_each_entry(free_list_node, &free_list->mem_block_list, node)
+		WARN_ON(pvr_free_list_insert_node_locked(free_list_node));
+
+	/*
+	 * Remove the ready pages, which are reserved to allow the FW to process OOM quickly and
+	 * asynchronously request a grow.
+	 */
+	free_list->current_pages -= free_list->ready_pages;
+
+	fw_data = free_list->fw_data;
+	fw_data->current_stack_top = fw_data->current_pages - 1;
+	fw_data->allocated_page_count = 0;
+	fw_data->allocated_mmu_page_count = 0;
+
+	/* Reset the state of any associated HWRTs. */
+	list_for_each_entry(hwrt_data, &free_list->hwrt_list, freelist_node) {
+		hwrt_data->fw_data->state = ROGUE_FWIF_RTDATA_STATE_HWR;
+		hwrt_data->fw_data->hwrt_data_flags &= ~HWRTDATA_HAS_LAST_GEOM;
+	}
+
+	mutex_unlock(&free_list->lock);
+
+	pvr_free_list_put(free_list);
+}
diff --git a/drivers/gpu/drm/imagination/pvr_free_list.h b/drivers/gpu/drm/imagination/pvr_free_list.h
new file mode 100644
index 000000000000..b3c6d4435272
--- /dev/null
+++ b/drivers/gpu/drm/imagination/pvr_free_list.h
@@ -0,0 +1,185 @@
+/* SPDX-License-Identifier: GPL-2.0 OR MIT */
+/* Copyright (c) 2022 Imagination Technologies Ltd. */
+
+#ifndef PVR_FREE_LIST_H
+#define PVR_FREE_LIST_H
+
+#include <linux/compiler_attributes.h>
+#include <linux/kref.h>
+#include <linux/list.h>
+#include <linux/mutex.h>
+#include <linux/types.h>
+#include <linux/xarray.h>
+#include <uapi/drm/pvr_drm.h>
+
+#include "pvr_device.h"
+
+/* Forward declaration from pvr_gem.h. */
+struct pvr_fw_object;
+
+/* Forward declaration from pvr_gem.h. */
+struct pvr_gem_object;
+
+/* Forward declaration from pvr_hwrt.h. */
+struct pvr_hwrt_data;
+
+/**
+ * struct pvr_free_list_node - structure representing an allocation in the free
+ *                             list
+ */
+struct pvr_free_list_node {
+	/** @node: List node for &pvr_free_list.mem_block_list. */
+	struct list_head node;
+
+	/** @free_list: Pointer to owning free list. */
+	struct pvr_free_list *free_list;
+
+	/** @num_pages: Number of pages in this node. */
+	u32 num_pages;
+
+	/** @mem_obj: GEM object representing the pages in this node. */
+	struct pvr_gem_object *mem_obj;
+};
+
+/**
+ * struct pvr_free_list - structure representing a free list
+ */
+struct pvr_free_list {
+	/** @ref_count: Reference count of object. */
+	struct kref ref_count;
+
+	/** @pvr_dev: Pointer to device that owns this object. */
+	struct pvr_device *pvr_dev;
+
+	/** @obj: GEM object representing the free list. */
+	struct pvr_gem_object *obj;
+
+	/** @fw_obj: FW object representing the FW-side structure. */
+	struct pvr_fw_object *fw_obj;
+
+	/** @fw_data: Pointer to CPU mapping of the FW-side structure. */
+	struct rogue_fwif_freelist *fw_data;
+
+	/**
+	 * @lock: Mutex protecting modification of the free list. Must be held when accessing any
+	 *        of the members below.
+	 */
+	struct mutex lock;
+
+	/** @fw_id: Firmware ID for this object. */
+	u32 fw_id;
+
+	/** @current_pages: Current number of pages in free list. */
+	u32 current_pages;
+
+	/** @max_pages: Maximum number of pages in free list. */
+	u32 max_pages;
+
+	/** @grow_pages: Pages to grow free list by per request. */
+	u32 grow_pages;
+
+	/**
+	 * @grow_threshold: Percentage of FL memory used that should trigger a
+	 *                  new grow request.
+	 */
+	u32 grow_threshold;
+
+	/**
+	 * @ready_pages: Number of pages reserved for FW to use while a grow
+	 *               request is being processed.
+	 */
+	u32 ready_pages;
+
+	/** @mem_block_list: List of memory blocks in this free list. */
+	struct list_head mem_block_list;
+
+	/** @hwrt_list: List of HWRTs using this free list. */
+	struct list_head hwrt_list;
+};
+
+struct pvr_free_list *
+pvr_free_list_create(struct pvr_file *pvr_file,
+		     struct drm_pvr_ioctl_create_free_list_args *args);
+
+void
+pvr_destroy_free_lists_for_file(struct pvr_file *pvr_file);
+
+u32
+pvr_get_free_list_min_pages(struct pvr_device *pvr_dev);
+
+static __always_inline struct pvr_free_list *
+pvr_free_list_get(struct pvr_free_list *free_list)
+{
+	if (free_list)
+		kref_get(&free_list->ref_count);
+
+	return free_list;
+}
+
+/**
+ * pvr_free_list_lookup() - Lookup free list pointer from handle and file
+ * @pvr_file: Pointer to pvr_file structure.
+ * @handle: Object handle.
+ *
+ * Takes reference on free list object. Call pvr_free_list_put() to release.
+ *
+ * Returns:
+ *  * The requested object on success, or
+ *  * %NULL on failure (object does not exist in list, is not a free list, or
+ *    does not belong to @pvr_file)
+ */
+static __always_inline struct pvr_free_list *
+pvr_free_list_lookup(struct pvr_file *pvr_file, u32 handle)
+{
+	struct pvr_free_list *free_list;
+
+	xa_lock(&pvr_file->free_list_handles);
+	free_list = pvr_free_list_get(xa_load(&pvr_file->free_list_handles, handle));
+	xa_unlock(&pvr_file->free_list_handles);
+
+	return free_list;
+}
+
+/**
+ * pvr_free_list_lookup_id() - Lookup free list pointer from FW ID
+ * @pvr_dev: Device pointer.
+ * @id: FW object ID.
+ *
+ * Takes reference on free list object. Call pvr_free_list_put() to release.
+ *
+ * Returns:
+ *  * The requested object on success, or
+ *  * %NULL on failure (object does not exist in list, or is not a free list)
+ */
+static __always_inline struct pvr_free_list *
+pvr_free_list_lookup_id(struct pvr_device *pvr_dev, u32 id)
+{
+	struct pvr_free_list *free_list;
+
+	xa_lock(&pvr_dev->free_list_ids);
+
+	/* Contexts are removed from the ctx_ids set in the context release path,
+	 * meaning the ref_count reached zero before they get removed. We need
+	 * to make sure we're not trying to acquire a context that's being
+	 * destroyed.
+	 */
+	free_list = xa_load(&pvr_dev->free_list_ids, id);
+	if (free_list && !kref_get_unless_zero(&free_list->ref_count))
+		free_list = NULL;
+	xa_unlock(&pvr_dev->free_list_ids);
+
+	return free_list;
+}
+
+void
+pvr_free_list_put(struct pvr_free_list *free_list);
+
+void
+pvr_free_list_add_hwrt(struct pvr_free_list *free_list, struct pvr_hwrt_data *hwrt_data);
+void
+pvr_free_list_remove_hwrt(struct pvr_free_list *free_list, struct pvr_hwrt_data *hwrt_data);
+
+void
+pvr_free_list_reconstruct(struct pvr_device *pvr_dev, u32 freelist_id);
+
+#endif /* PVR_FREE_LIST_H */
diff --git a/drivers/gpu/drm/imagination/pvr_hwrt.c b/drivers/gpu/drm/imagination/pvr_hwrt.c
new file mode 100644
index 000000000000..96c3dd964482
--- /dev/null
+++ b/drivers/gpu/drm/imagination/pvr_hwrt.c
@@ -0,0 +1,559 @@
+// SPDX-License-Identifier: GPL-2.0 OR MIT
+/* Copyright (c) 2022 Imagination Technologies Ltd. */
+
+#include "pvr_free_list.h"
+#include "pvr_hwrt.h"
+#include "pvr_gem.h"
+#include "pvr_rogue_cr_defs_client.h"
+#include "pvr_rogue_fwif.h"
+
+#include <drm/drm_gem.h>
+#include <linux/bitops.h>
+#include <linux/math.h>
+#include <linux/slab.h>
+#include <linux/xarray.h>
+#include <uapi/drm/pvr_drm.h>
+
+static_assert(ROGUE_FWIF_NUM_RTDATAS == 2);
+static_assert(ROGUE_FWIF_NUM_GEOMDATAS == 1);
+static_assert(ROGUE_FWIF_NUM_RTDATA_FREELISTS == 2);
+
+/*
+ * struct pvr_rt_mtile_info - Render target macrotile information
+ */
+struct pvr_rt_mtile_info {
+	u32 mtile_x[3];
+	u32 mtile_y[3];
+	u32 tile_max_x;
+	u32 tile_max_y;
+	u32 tile_size_x;
+	u32 tile_size_y;
+	u32 num_tiles_x;
+	u32 num_tiles_y;
+};
+
+/* Size of Shadow Render Target Cache entry */
+#define SRTC_ENTRY_SIZE sizeof(u32)
+/* Size of Renders Accumulation Array entry */
+#define RAA_ENTRY_SIZE sizeof(u32)
+
+static int
+hwrt_init_kernel_structure(struct pvr_file *pvr_file,
+			   struct drm_pvr_ioctl_create_hwrt_dataset_args *args,
+			   struct pvr_hwrt_dataset *hwrt)
+{
+	struct pvr_device *pvr_dev = pvr_file->pvr_dev;
+	int err;
+	int i;
+
+	hwrt->pvr_dev = pvr_dev;
+
+	/* Get pointers to the free lists */
+	for (i = 0; i < ARRAY_SIZE(hwrt->free_lists); i++) {
+		hwrt->free_lists[i] = pvr_free_list_lookup(pvr_file,  args->free_list_handles[i]);
+		if (!hwrt->free_lists[i]) {
+			err = -EINVAL;
+			goto err_put_free_lists;
+		}
+	}
+
+	if (hwrt->free_lists[ROGUE_FW_LOCAL_FREELIST]->current_pages <
+	    pvr_get_free_list_min_pages(pvr_dev)) {
+		err = -EINVAL;
+		goto err_put_free_lists;
+	}
+
+	return 0;
+
+err_put_free_lists:
+	for (i = 0; i < ARRAY_SIZE(hwrt->free_lists); i++) {
+		pvr_free_list_put(hwrt->free_lists[i]);
+		hwrt->free_lists[i] = NULL;
+	}
+
+	return err;
+}
+
+static void
+hwrt_fini_kernel_structure(struct pvr_hwrt_dataset *hwrt)
+{
+	int i;
+
+	for (i = 0; i < ARRAY_SIZE(hwrt->free_lists); i++) {
+		pvr_free_list_put(hwrt->free_lists[i]);
+		hwrt->free_lists[i] = NULL;
+	}
+}
+
+static void
+hwrt_fini_common_fw_structure(struct pvr_hwrt_dataset *hwrt)
+{
+	pvr_fw_object_destroy(hwrt->common_fw_obj);
+}
+
+static int
+get_cr_isp_mtile_size_val(struct pvr_device *pvr_dev, u32 samples,
+			  struct pvr_rt_mtile_info *info, u32 *value_out)
+{
+	u32 x = info->mtile_x[0];
+	u32 y = info->mtile_y[0];
+	u32 samples_per_pixel;
+	int err;
+
+	err = PVR_FEATURE_VALUE(pvr_dev, isp_samples_per_pixel, &samples_per_pixel);
+	if (err)
+		goto err_out;
+
+	if (samples_per_pixel == 1) {
+		if (samples >= 4)
+			x <<= 1;
+		if (samples >= 2)
+			y <<= 1;
+	} else if (samples_per_pixel == 2) {
+		if (samples >= 8)
+			x <<= 1;
+		if (samples >= 4)
+			y <<= 1;
+	} else if (samples_per_pixel == 4) {
+		if (samples >= 8)
+			y <<= 1;
+	} else {
+		WARN(true, "Unsupported ISP samples per pixel value");
+		err = -EINVAL;
+		goto err_out;
+	}
+
+	*value_out = ((x << ROGUE_CR_ISP_MTILE_SIZE_X_SHIFT) & ~ROGUE_CR_ISP_MTILE_SIZE_X_CLRMSK) |
+		     ((y << ROGUE_CR_ISP_MTILE_SIZE_Y_SHIFT) & ~ROGUE_CR_ISP_MTILE_SIZE_Y_CLRMSK);
+
+err_out:
+	return err;
+}
+
+static int
+get_cr_multisamplectl_val(u32 samples, bool y_flip, u64 *value_out)
+{
+	static const struct {
+		u8 x[8];
+		u8 y[8];
+	} sample_positions[4] = {
+		/* 1 sample */
+		{
+			.x = { 8 },
+			.y = { 8 },
+		},
+		/* 2 samples */
+		{
+			.x = { 12, 4 },
+			.y = { 12, 4 },
+		},
+		/* 4 samples */
+		{
+			.x = { 6, 14, 2, 10 },
+			.y = { 2, 6, 10, 14 },
+		},
+		/* 8 samples */
+		{
+			.x = { 9, 7, 13, 5, 3, 1, 11, 15 },
+			.y = { 5, 11, 9, 3, 13, 7, 15, 1 },
+		},
+	};
+	const int idx = fls(samples) - 1;
+	u64 value = 0;
+
+	if (idx < 0 || idx > 3)
+		return -EINVAL;
+
+	for (u32 i = 0; i < 8; i++) {
+		value |= sample_positions[idx].x[i] << (i * 8);
+		if (y_flip)
+			value |= ((16 - sample_positions[idx].y[i]) & 0xf) << (i * 8 + 4);
+		else
+			value |= (sample_positions[idx].y[i]) << (i * 8 + 4);
+	}
+
+	*value_out = value;
+
+	return 0;
+}
+
+static int
+get_cr_te_aa_val(struct pvr_device *pvr_dev, u32 samples, u32 *value_out)
+{
+	u32 samples_per_pixel;
+	u32 value = 0;
+	int err = 0;
+
+	err = PVR_FEATURE_VALUE(pvr_dev, isp_samples_per_pixel, &samples_per_pixel);
+	if (err)
+		goto err_out;
+
+	switch (samples_per_pixel) {
+	case 1:
+		if (samples >= 2)
+			value |= ROGUE_CR_TE_AA_Y_EN;
+		if (samples >= 4)
+			value |= ROGUE_CR_TE_AA_X_EN;
+		break;
+	case 2:
+		if (samples >= 2)
+			value |= ROGUE_CR_TE_AA_X2_EN;
+		if (samples >= 4)
+			value |= ROGUE_CR_TE_AA_Y_EN;
+		if (samples >= 8)
+			value |= ROGUE_CR_TE_AA_X_EN;
+		break;
+	case 4:
+		if (samples >= 2)
+			value |= ROGUE_CR_TE_AA_X2_EN;
+		if (samples >= 4)
+			value |= ROGUE_CR_TE_AA_Y2_EN;
+		if (samples >= 8)
+			value |= ROGUE_CR_TE_AA_Y_EN;
+		break;
+	default:
+		WARN(true, "Unsupported ISP samples per pixel value");
+		err = -EINVAL;
+		goto err_out;
+	}
+
+	*value_out = value;
+
+err_out:
+	return err;
+}
+
+static int
+hwrt_init_common_fw_structure(struct pvr_file *pvr_file,
+			      struct drm_pvr_ioctl_create_hwrt_dataset_args *args,
+			      struct pvr_hwrt_dataset *hwrt)
+{
+	struct drm_pvr_create_hwrt_geom_data_args *geom_data_args = &args->geom_data_args;
+	struct pvr_device *pvr_dev = pvr_file->pvr_dev;
+	struct rogue_fwif_hwrtdata_common *hwrt_data_common_fw;
+	struct pvr_rt_mtile_info info;
+	int err;
+
+	err = PVR_FEATURE_VALUE(pvr_dev, tile_size_x, &info.tile_size_x);
+	if (WARN_ON(err))
+		return err;
+
+	err = PVR_FEATURE_VALUE(pvr_dev, tile_size_y, &info.tile_size_y);
+	if (WARN_ON(err))
+		return err;
+
+	info.num_tiles_x = DIV_ROUND_UP(args->width, info.tile_size_x);
+	info.num_tiles_y = DIV_ROUND_UP(args->height, info.tile_size_y);
+
+	if (PVR_HAS_FEATURE(pvr_dev, simple_internal_parameter_format)) {
+		u32 parameter_format;
+
+		err = PVR_FEATURE_VALUE(pvr_dev, simple_internal_parameter_format,
+					&parameter_format);
+		if (WARN_ON(err))
+			return err;
+
+		WARN_ON(parameter_format != 2);
+
+		/*
+		 * Set up 16 macrotiles with a multiple of 2x2 tiles per macrotile, which is
+		 * aligned to a tile group.
+		 */
+		info.mtile_x[0] = DIV_ROUND_UP(info.num_tiles_x, 8) * 2;
+		info.mtile_y[0] = DIV_ROUND_UP(info.num_tiles_y, 8) * 2;
+		info.mtile_x[1] = 0;
+		info.mtile_y[1] = 0;
+		info.mtile_x[2] = 0;
+		info.mtile_y[2] = 0;
+		info.tile_max_x = round_up(info.num_tiles_x, 2) - 1;
+		info.tile_max_y = round_up(info.num_tiles_y, 2) - 1;
+	} else {
+		/* Set up 16 macrotiles with a multiple of 4x4 tiles per macrotile. */
+		info.mtile_x[0] = round_up(DIV_ROUND_UP(info.num_tiles_x, 4), 4);
+		info.mtile_y[0] = round_up(DIV_ROUND_UP(info.num_tiles_y, 4), 4);
+		info.mtile_x[1] = info.mtile_x[0] * 2;
+		info.mtile_y[1] = info.mtile_y[0] * 2;
+		info.mtile_x[2] = info.mtile_x[0] * 3;
+		info.mtile_y[2] = info.mtile_y[0] * 3;
+		info.tile_max_x = info.num_tiles_x - 1;
+		info.tile_max_y = info.num_tiles_y - 1;
+	}
+
+	/*
+	 * Create and map the FW structure so we can initialise it. This is not
+	 * accessed on the CPU side post-initialisation so the mapping lifetime
+	 * is only for this function.
+	 */
+	hwrt_data_common_fw =
+		pvr_fw_object_create_and_map(pvr_dev,
+					     sizeof(*hwrt_data_common_fw),
+					     PVR_BO_FW_FLAGS_DEVICE_UNCACHED |
+					     DRM_PVR_BO_CREATE_ZEROED, &hwrt->common_fw_obj);
+	if (IS_ERR(hwrt_data_common_fw)) {
+		err = PTR_ERR(hwrt_data_common_fw);
+		return err;
+	}
+
+	hwrt_data_common_fw->geom_caches_need_zeroing = false;
+
+	hwrt_data_common_fw->isp_merge_lower_x = args->isp_merge_lower_x;
+	hwrt_data_common_fw->isp_merge_lower_y = args->isp_merge_lower_y;
+	hwrt_data_common_fw->isp_merge_upper_x = args->isp_merge_upper_x;
+	hwrt_data_common_fw->isp_merge_upper_y = args->isp_merge_upper_y;
+	hwrt_data_common_fw->isp_merge_scale_x = args->isp_merge_scale_x;
+	hwrt_data_common_fw->isp_merge_scale_y = args->isp_merge_scale_y;
+
+	err = get_cr_multisamplectl_val(args->samples, false,
+					&hwrt_data_common_fw->multi_sample_ctl);
+	if (err)
+		goto err_put_fw_obj;
+
+	err = get_cr_multisamplectl_val(args->samples, true,
+					&hwrt_data_common_fw->flipped_multi_sample_ctl);
+	if (err)
+		goto err_put_fw_obj;
+
+	hwrt_data_common_fw->mtile_stride = info.mtile_x[0] * info.mtile_y[0];
+
+	err = get_cr_te_aa_val(pvr_dev, args->samples, &hwrt_data_common_fw->teaa);
+	if (err)
+		goto err_put_fw_obj;
+
+	hwrt_data_common_fw->screen_pixel_max =
+		(((args->width - 1) << ROGUE_CR_PPP_SCREEN_PIXXMAX_SHIFT) &
+		 ~ROGUE_CR_PPP_SCREEN_PIXXMAX_CLRMSK) |
+		(((args->height - 1) << ROGUE_CR_PPP_SCREEN_PIXYMAX_SHIFT) &
+		 ~ROGUE_CR_PPP_SCREEN_PIXYMAX_CLRMSK);
+
+	hwrt_data_common_fw->te_screen =
+		((info.tile_max_x << ROGUE_CR_TE_SCREEN_XMAX_SHIFT) &
+		 ~ROGUE_CR_TE_SCREEN_XMAX_CLRMSK) |
+		((info.tile_max_y << ROGUE_CR_TE_SCREEN_YMAX_SHIFT) &
+		 ~ROGUE_CR_TE_SCREEN_YMAX_CLRMSK);
+	hwrt_data_common_fw->te_mtile1 =
+		((info.mtile_x[0] << ROGUE_CR_TE_MTILE1_X1_SHIFT) & ~ROGUE_CR_TE_MTILE1_X1_CLRMSK) |
+		((info.mtile_x[1] << ROGUE_CR_TE_MTILE1_X2_SHIFT) & ~ROGUE_CR_TE_MTILE1_X2_CLRMSK) |
+		((info.mtile_x[2] << ROGUE_CR_TE_MTILE1_X3_SHIFT) & ~ROGUE_CR_TE_MTILE1_X3_CLRMSK);
+	hwrt_data_common_fw->te_mtile2 =
+		((info.mtile_y[0] << ROGUE_CR_TE_MTILE2_Y1_SHIFT) & ~ROGUE_CR_TE_MTILE2_Y1_CLRMSK) |
+		((info.mtile_y[1] << ROGUE_CR_TE_MTILE2_Y2_SHIFT) & ~ROGUE_CR_TE_MTILE2_Y2_CLRMSK) |
+		((info.mtile_y[2] << ROGUE_CR_TE_MTILE2_Y3_SHIFT) & ~ROGUE_CR_TE_MTILE2_Y3_CLRMSK);
+
+	err = get_cr_isp_mtile_size_val(pvr_dev, args->samples, &info,
+					&hwrt_data_common_fw->isp_mtile_size);
+	if (err)
+		goto err_put_fw_obj;
+
+	hwrt_data_common_fw->tpc_stride = geom_data_args->tpc_stride;
+	hwrt_data_common_fw->tpc_size = geom_data_args->tpc_size;
+
+	hwrt_data_common_fw->rgn_header_size = args->region_header_size;
+
+	pvr_fw_object_vunmap(hwrt->common_fw_obj);
+
+	return 0;
+
+err_put_fw_obj:
+	pvr_fw_object_vunmap(hwrt->common_fw_obj);
+
+	return err;
+}
+
+static int
+hwrt_data_init_fw_structure(struct pvr_file *pvr_file,
+			    struct pvr_hwrt_dataset *hwrt,
+			    struct drm_pvr_ioctl_create_hwrt_dataset_args *args,
+			    struct drm_pvr_create_hwrt_rt_data_args *rt_data_args,
+			    struct pvr_hwrt_data *hwrt_data)
+{
+	struct drm_pvr_create_hwrt_geom_data_args *geom_data_args = &args->geom_data_args;
+	struct pvr_device *pvr_dev = pvr_file->pvr_dev;
+	struct rogue_fwif_rta_ctl *rta_ctl;
+	int free_list_i;
+	int err;
+
+	hwrt_data->fw_data = pvr_fw_object_create_and_map(pvr_dev, sizeof(*hwrt_data->fw_data),
+							  PVR_BO_FW_FLAGS_DEVICE_UNCACHED |
+							  DRM_PVR_BO_CREATE_ZEROED,
+							  &hwrt_data->fw_obj);
+	if (IS_ERR(hwrt_data->fw_data)) {
+		err = PTR_ERR(hwrt_data->fw_data);
+		goto err_out;
+	}
+
+	pvr_fw_object_get_fw_addr(hwrt->common_fw_obj,
+				  &hwrt_data->fw_data->hwrt_data_common_fw_addr);
+
+	for (free_list_i = 0; free_list_i < ARRAY_SIZE(hwrt->free_lists); free_list_i++) {
+		pvr_fw_object_get_fw_addr(hwrt->free_lists[free_list_i]->fw_obj,
+					  &hwrt_data->fw_data->freelists_fw_addr[free_list_i]);
+	}
+
+	hwrt_data->fw_data->tail_ptrs_dev_addr = geom_data_args->tpc_dev_addr;
+	hwrt_data->fw_data->vheap_table_dev_addr = geom_data_args->vheap_table_dev_addr;
+	hwrt_data->fw_data->rtc_dev_addr = geom_data_args->rtc_dev_addr;
+
+	hwrt_data->fw_data->pm_mlist_dev_addr = rt_data_args->pm_mlist_dev_addr;
+	hwrt_data->fw_data->macrotile_array_dev_addr = rt_data_args->macrotile_array_dev_addr;
+	hwrt_data->fw_data->rgn_header_dev_addr = rt_data_args->region_header_dev_addr;
+
+	rta_ctl = &hwrt_data->fw_data->rta_ctl;
+
+	rta_ctl->render_target_index = 0;
+	rta_ctl->active_render_targets = 0;
+	rta_ctl->valid_render_targets_fw_addr = 0;
+	rta_ctl->rta_num_partial_renders_fw_addr = 0;
+	rta_ctl->max_rts = args->layers;
+
+	if (args->layers > 1) {
+		err = pvr_fw_object_create(pvr_dev, args->layers * SRTC_ENTRY_SIZE,
+					   PVR_BO_FW_FLAGS_DEVICE_UNCACHED |
+					   DRM_PVR_BO_CREATE_ZEROED,
+					   &hwrt_data->srtc_obj);
+		if (err)
+			goto err_put_fw_obj;
+		pvr_fw_object_get_fw_addr(hwrt_data->srtc_obj,
+					  &rta_ctl->valid_render_targets_fw_addr);
+
+		err = pvr_fw_object_create(pvr_dev, args->layers * RAA_ENTRY_SIZE,
+					   PVR_BO_FW_FLAGS_DEVICE_UNCACHED |
+					   DRM_PVR_BO_CREATE_ZEROED,
+					   &hwrt_data->raa_obj);
+		if (err)
+			goto err_put_shadow_rt_cache;
+		pvr_fw_object_get_fw_addr(hwrt_data->raa_obj,
+					  &rta_ctl->rta_num_partial_renders_fw_addr);
+	}
+
+	pvr_free_list_add_hwrt(hwrt->free_lists[0], hwrt_data);
+
+	return 0;
+
+err_put_shadow_rt_cache:
+	pvr_fw_object_destroy(hwrt_data->srtc_obj);
+
+err_put_fw_obj:
+	pvr_fw_object_unmap_and_destroy(hwrt_data->fw_obj);
+
+err_out:
+	return err;
+}
+
+static void
+hwrt_data_fini_fw_structure(struct pvr_hwrt_dataset *hwrt, int hwrt_nr)
+{
+	struct pvr_hwrt_data *hwrt_data = &hwrt->data[hwrt_nr];
+
+	pvr_free_list_remove_hwrt(hwrt->free_lists[0], hwrt_data);
+
+	if (hwrt->max_rts > 1) {
+		pvr_fw_object_destroy(hwrt_data->raa_obj);
+		pvr_fw_object_destroy(hwrt_data->srtc_obj);
+	}
+
+	pvr_fw_object_unmap_and_destroy(hwrt_data->fw_obj);
+}
+
+/**
+ * pvr_hwrt_dataset_create() - Create a new HWRT dataset
+ * @pvr_file: Pointer to pvr_file structure.
+ * @args: Creation arguments from userspace.
+ *
+ * Return:
+ *  * Pointer to new HWRT, or
+ *  * ERR_PTR(-%ENOMEM) on out of memory.
+ */
+struct pvr_hwrt_dataset *
+pvr_hwrt_dataset_create(struct pvr_file *pvr_file,
+			struct drm_pvr_ioctl_create_hwrt_dataset_args *args)
+{
+	struct pvr_hwrt_dataset *hwrt;
+	int err;
+
+	/* Create and fill out the kernel structure */
+	hwrt = kzalloc(sizeof(*hwrt), GFP_KERNEL);
+
+	if (!hwrt)
+		return ERR_PTR(-ENOMEM);
+
+	kref_init(&hwrt->ref_count);
+
+	err = hwrt_init_kernel_structure(pvr_file, args, hwrt);
+	if (err < 0)
+		goto err_free;
+
+	err = hwrt_init_common_fw_structure(pvr_file, args, hwrt);
+	if (err < 0)
+		goto err_free;
+
+	for (int i = 0; i < ARRAY_SIZE(hwrt->data); i++) {
+		err = hwrt_data_init_fw_structure(pvr_file, hwrt, args,
+						  &args->rt_data_args[i],
+						  &hwrt->data[i]);
+		if (err < 0) {
+			i--;
+			/* Destroy already created structures. */
+			for (; i >= 0; i--)
+				hwrt_data_fini_fw_structure(hwrt, i);
+			goto err_free;
+		}
+
+		hwrt->data[i].hwrt_dataset = hwrt;
+	}
+
+	return hwrt;
+
+err_free:
+	pvr_hwrt_dataset_put(hwrt);
+
+	return ERR_PTR(err);
+}
+
+static void
+pvr_hwrt_dataset_release(struct kref *ref_count)
+{
+	struct pvr_hwrt_dataset *hwrt =
+		container_of(ref_count, struct pvr_hwrt_dataset, ref_count);
+
+	for (int i = ARRAY_SIZE(hwrt->data) - 1; i >= 0; i--) {
+		WARN_ON(pvr_fw_structure_cleanup(hwrt->pvr_dev, ROGUE_FWIF_CLEANUP_HWRTDATA,
+						 hwrt->data[i].fw_obj, 0));
+		hwrt_data_fini_fw_structure(hwrt, i);
+	}
+
+	hwrt_fini_common_fw_structure(hwrt);
+	hwrt_fini_kernel_structure(hwrt);
+
+	kfree(hwrt);
+}
+
+/**
+ * pvr_destroy_hwrt_datasets_for_file: Destroy any HWRT datasets associated
+ * with the given file.
+ * @pvr_file: Pointer to pvr_file structure.
+ *
+ * Removes all HWRT datasets associated with @pvr_file from the device
+ * hwrt_dataset list and drops initial references. HWRT datasets will then be
+ * destroyed once all outstanding references are dropped.
+ */
+void pvr_destroy_hwrt_datasets_for_file(struct pvr_file *pvr_file)
+{
+	struct pvr_hwrt_dataset *hwrt;
+	unsigned long handle;
+
+	xa_for_each(&pvr_file->hwrt_handles, handle, hwrt) {
+		(void)hwrt;
+		pvr_hwrt_dataset_put(xa_erase(&pvr_file->hwrt_handles, handle));
+	}
+}
+
+/**
+ * pvr_hwrt_dataset_put() - Release reference on HWRT dataset
+ * @hwrt: Pointer to HWRT dataset to release reference on
+ */
+void
+pvr_hwrt_dataset_put(struct pvr_hwrt_dataset *hwrt)
+{
+	if (hwrt)
+		kref_put(&hwrt->ref_count, pvr_hwrt_dataset_release);
+}
diff --git a/drivers/gpu/drm/imagination/pvr_hwrt.h b/drivers/gpu/drm/imagination/pvr_hwrt.h
new file mode 100644
index 000000000000..d2ffaf8566bc
--- /dev/null
+++ b/drivers/gpu/drm/imagination/pvr_hwrt.h
@@ -0,0 +1,163 @@
+/* SPDX-License-Identifier: GPL-2.0 OR MIT */
+/* Copyright (c) 2022 Imagination Technologies Ltd. */
+
+#ifndef PVR_HWRT_H
+#define PVR_HWRT_H
+
+#include <linux/compiler_attributes.h>
+#include <linux/kref.h>
+#include <linux/list.h>
+#include <linux/types.h>
+#include <linux/xarray.h>
+#include <uapi/drm/pvr_drm.h>
+
+#include "pvr_device.h"
+#include "pvr_rogue_fwif_shared.h"
+
+/* Forward declaration from pvr_free_list.h. */
+struct pvr_free_list;
+
+/* Forward declaration from pvr_gem.h. */
+struct pvr_fw_object;
+
+/**
+ * struct pvr_hwrt_data - structure representing HWRT data
+ */
+struct pvr_hwrt_data {
+	/** @fw_obj: FW object representing the FW-side structure. */
+	struct pvr_fw_object *fw_obj;
+
+	/** @fw_data: Pointer to CPU mappings of the FW-side structure. */
+	struct rogue_fwif_hwrtdata *fw_data;
+
+	/** @freelist_node: List node connecting this HWRT to the local freelist. */
+	struct list_head freelist_node;
+
+	/**
+	 * @srtc_obj: FW object representing shadow render target cache.
+	 *
+	 * Only valid if @max_rts > 1.
+	 */
+	struct pvr_fw_object *srtc_obj;
+
+	/**
+	 * @raa_obj: FW object representing renders accumulation array.
+	 *
+	 * Only valid if @max_rts > 1.
+	 */
+	struct pvr_fw_object *raa_obj;
+
+	/** @hwrt_dataset: Back pointer to owning HWRT dataset. */
+	struct pvr_hwrt_dataset *hwrt_dataset;
+};
+
+/**
+ * struct pvr_hwrt_dataset - structure representing a HWRT data set.
+ */
+struct pvr_hwrt_dataset {
+	/** @ref_count: Reference count of object. */
+	struct kref ref_count;
+
+	/** @pvr_dev: Pointer to device that owns this object. */
+	struct pvr_device *pvr_dev;
+
+	/** @common_fw_obj: FW object representing common FW-side structure. */
+	struct pvr_fw_object *common_fw_obj;
+
+	/** @data: HWRT data structures belonging to this set. */
+	struct pvr_hwrt_data data[ROGUE_FWIF_NUM_RTDATAS];
+
+	/** @free_lists: Free lists used by HWRT data set. */
+	struct pvr_free_list *free_lists[ROGUE_FWIF_NUM_RTDATA_FREELISTS];
+
+	/** @max_rts: Maximum render targets for this HWRT data set. */
+	u16 max_rts;
+};
+
+struct pvr_hwrt_dataset *
+pvr_hwrt_dataset_create(struct pvr_file *pvr_file,
+			struct drm_pvr_ioctl_create_hwrt_dataset_args *args);
+
+void
+pvr_destroy_hwrt_datasets_for_file(struct pvr_file *pvr_file);
+
+/**
+ * pvr_hwrt_dataset_lookup() - Lookup HWRT dataset pointer from handle
+ * @pvr_file: Pointer to pvr_file structure.
+ * @handle: Object handle.
+ *
+ * Takes reference on dataset object. Call pvr_hwrt_dataset_put() to release.
+ *
+ * Returns:
+ *  * The requested object on success, or
+ *  * %NULL on failure (object does not exist in list, or is not a HWRT
+ *    dataset)
+ */
+static __always_inline struct pvr_hwrt_dataset *
+pvr_hwrt_dataset_lookup(struct pvr_file *pvr_file, u32 handle)
+{
+	struct pvr_hwrt_dataset *hwrt;
+
+	xa_lock(&pvr_file->hwrt_handles);
+	hwrt = xa_load(&pvr_file->hwrt_handles, handle);
+
+	if (hwrt)
+		kref_get(&hwrt->ref_count);
+
+	xa_unlock(&pvr_file->hwrt_handles);
+
+	return hwrt;
+}
+
+void
+pvr_hwrt_dataset_put(struct pvr_hwrt_dataset *hwrt);
+
+/**
+ * pvr_hwrt_data_lookup() - Lookup HWRT data pointer from handle and index
+ * @pvr_file: Pointer to pvr_file structure.
+ * @handle: Object handle.
+ * @index: Index of RT data within dataset.
+ *
+ * Takes reference on dataset object. Call pvr_hwrt_data_put() to release.
+ *
+ * Returns:
+ *  * The requested object on success, or
+ *  * %NULL on failure (object does not exist in list, or is not a HWRT
+ *    dataset, or index is out of range)
+ */
+static __always_inline struct pvr_hwrt_data *
+pvr_hwrt_data_lookup(struct pvr_file *pvr_file, u32 handle, u32 index)
+{
+	struct pvr_hwrt_dataset *hwrt_dataset = pvr_hwrt_dataset_lookup(pvr_file, handle);
+
+	if (hwrt_dataset) {
+		if (index < ARRAY_SIZE(hwrt_dataset->data))
+			return &hwrt_dataset->data[index];
+
+		pvr_hwrt_dataset_put(hwrt_dataset);
+	}
+
+	return NULL;
+}
+
+/**
+ * pvr_hwrt_data_put() - Release reference on HWRT data
+ * @hwrt: Pointer to HWRT data to release reference on
+ */
+static __always_inline void
+pvr_hwrt_data_put(struct pvr_hwrt_data *hwrt)
+{
+	if (hwrt)
+		pvr_hwrt_dataset_put(hwrt->hwrt_dataset);
+}
+
+static __always_inline struct pvr_hwrt_data *
+pvr_hwrt_data_get(struct pvr_hwrt_data *hwrt)
+{
+	if (hwrt)
+		kref_get(&hwrt->hwrt_dataset->ref_count);
+
+	return hwrt;
+}
+
+#endif /* PVR_HWRT_H */
-- 
2.40.1

