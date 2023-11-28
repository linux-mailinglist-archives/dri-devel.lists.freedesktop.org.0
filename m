Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id AD11D7FC057
	for <lists+dri-devel@lfdr.de>; Tue, 28 Nov 2023 18:35:50 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DC3A010E098;
	Tue, 28 Nov 2023 17:35:46 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx07-00376f01.pphosted.com (mx07-00376f01.pphosted.com
 [185.132.180.163])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A659A10E098
 for <dri-devel@lists.freedesktop.org>; Tue, 28 Nov 2023 17:35:44 +0000 (UTC)
Received: from pps.filterd (m0168889.ppops.net [127.0.0.1])
 by mx07-00376f01.pphosted.com (8.17.1.24/8.17.1.24) with ESMTP id
 3ASD0TRE009251; Tue, 28 Nov 2023 17:35:20 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=imgtec.com; h=
 from:to:cc:subject:date:message-id:content-transfer-encoding
 :content-type:mime-version; s=dk201812; bh=7FCpdBcKV4nhohotlwbXC
 cKmOTAy0ANyVIRC3rTGiSI=; b=gXuiWdZQ6l2s4TrB7cq+4ScUpPjtDbOF7faoK
 ym4t0tPTsj9/P30E+JB+Akkg8zDQRTQd1Nzp0OlpDsNaKHnmG3OQTZskwUreyWkw
 bsBauu2AVUBv7Mi+lw8/DIUCREo0qPtm2JmyqOOxjWumrAOFYmvHC0svns92J+0N
 AhRWqUzwefki3ElHOVrxdlI5zZuX8Crzg05SasIlMzJClAYBMvKLRdhmU066yHbc
 3SYc/K73PgfcrPg/fRSo+SGVACeVNhSAD+DG9zzqubaSP5hKTm9HSU7uEkk685z4
 wAgkzzVMtmbi+bXIjQyalqXC8Jf5BFELU0z1X6VjiEpQ8zIPA==
Received: from hhmail05.hh.imgtec.org ([217.156.249.195])
 by mx07-00376f01.pphosted.com (PPS) with ESMTPS id 3uk9vwjh71-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT);
 Tue, 28 Nov 2023 17:35:20 +0000 (GMT)
Received: from HHMAIL05.hh.imgtec.org (10.100.10.120) by
 HHMAIL05.hh.imgtec.org (10.100.10.120) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Tue, 28 Nov 2023 17:35:19 +0000
Received: from GBR01-LO4-obe.outbound.protection.outlook.com (104.47.85.105)
 by email.imgtec.com (10.100.10.121) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35 via Frontend Transport; Tue, 28 Nov 2023 17:35:19 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=c35XwvCZEzBdzAq74XrWxr1gFbe7z8lPx9O3qA1MdpNMIKfclRBYQ1r7I0z2TQLAFI1ETQNaaV5qhC++oSV39/pwFklnf+QqqdMNtYaziHu3ZlrqUDMQzG5KBig3PhuzfYqK1hmeTxvFAy22VezdwgqYWDmI/7j8t7+8O1MAb4dtXLK9eAVK7wtuLvjBd/PdLRJJeSuEip3/iezJz76nx1YNCvoU0r3iXF9WGEGKrF8x6MgSS+cRYRypF7HRzQuqZeon3/ohoUOYQcyKpj+aS1/bKGj0t7jQGLmfoaFcVX2nQb0gYaCFNmLVEfZDExR2tYStapRNSiSrr6pdEL0jqg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=7FCpdBcKV4nhohotlwbXCcKmOTAy0ANyVIRC3rTGiSI=;
 b=QKf1s3QS/NfZvOUiTUkZWwjOqyNG2jbwFGFi8MTkjvauYPsMrCEwHQgbcwF2Eb06WT+8mnm9ZAs64XEkL7GsUIsGewmxxTIrg/0lsvwuBTqFRMMZ+bDgOLMSFPcIXXGWo3RlAQrxLiKgtKSPBcVJC56hZAuZ8TBE7c9n6QQxwdQqDyYxMo8a+WOr6wCS/akluRo6aYYkZBpy7N+kdo0enTGaS2dogHRRMQJ69tLTySqk2s/SFjfxsXHEwwAIuE99na4a2SD8Yc/48/EozJFZxX1rLNGlJZ4BMyv1yT6/u8XVD5uw7iiLbYcnLtCRuW+gyaeEpAvVDQBL/xGTmtRFaA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=imgtec.com; dmarc=pass action=none header.from=imgtec.com;
 dkim=pass header.d=imgtec.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=IMGTecCRM.onmicrosoft.com; s=selector2-IMGTecCRM-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=7FCpdBcKV4nhohotlwbXCcKmOTAy0ANyVIRC3rTGiSI=;
 b=k6kBdZOdyfQuKkAQEYkEzLo8yNNmKqQz6tR0Eb9HMY2PXrqdNakJsxjrJ4utkJ3ficM49BvDYLcjxAnxuWu2Wh3/AhhjOOo3A08XUVmoLIg4lZGZXzqaynf8cXG619QaSO/FEbAuY+WBS+8yT2vJnxlcRdvyL3v5KRwRPGJdBQE=
Received: from CWLP265MB5770.GBRP265.PROD.OUTLOOK.COM (2603:10a6:400:1a0::8)
 by LO0P265MB6228.GBRP265.PROD.OUTLOOK.COM (2603:10a6:600:24e::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7046.22; Tue, 28 Nov
 2023 17:35:18 +0000
Received: from CWLP265MB5770.GBRP265.PROD.OUTLOOK.COM
 ([fe80::a85a:76f7:c085:2b34]) by CWLP265MB5770.GBRP265.PROD.OUTLOOK.COM
 ([fe80::a85a:76f7:c085:2b34%3]) with mapi id 15.20.7025.022; Tue, 28 Nov 2023
 17:35:18 +0000
From: Donald Robson <donald.robson@imgtec.com>
To: <dri-devel@lists.freedesktop.org>, <linux-doc@vger.kernel.org>,
 <linux-kernel@vger.kernel.org>
Subject: [PATCH] drm/imagination: Numerous documentation fixes.
Date: Tue, 28 Nov 2023 17:35:07 +0000
Message-Id: <20231128173507.95119-1-donald.robson@imgtec.com>
X-Mailer: git-send-email 2.25.1
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: LO2P265CA0255.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:8a::27) To CWLP265MB5770.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:400:1a0::8)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CWLP265MB5770:EE_|LO0P265MB6228:EE_
X-MS-Office365-Filtering-Correlation-Id: 787956d8-49a3-432f-3f02-08dbf0386378
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: D4T0ZLTNd8dVYfDjUIJAXYIg46PfC1C6fmvOgiIbZO/2awGoZ+d2E0jLJ50sVBv8X+HvEstllM44DUS7j6Cf+H9Q1x2IoY0Ectyh51aWtqSox+iepUhciklYr4kktj22h1c8pvVSz5h2qRjRKAheODs/YSe95JXl06m+tJiiHhvJXzQLXIkZzOqFyRd0lIKw4ygGftp1ik+O0eWGdYMSX/qP8AUR3kyfsBWEeM4ELC83avUa3ZoIJCCGZW0mb83yQy4p8TjXZGr7BRwGUgn4CBcyOGQlfG0ZP0Of/ZsWrL5Uy8lw5Q9VlVqF5l86NL2qC6Q+8kSShjQMPH8+ip55TnciOUrtdUPPaVN0VZPbuq91eJkF56whtOmmgdzuRzIzytBt3581tGR05XowIHqKFp85mZliITjGj35Ag0oq2/O1HzXAnKlJQZ0APkSHLJKQ050lsm3etqW3ynD244bFR2N9sG9Bd3CFZ++dSSpfphdPBqJZXAVkX3p0qUNis/145iBYSGISxoWllQ+rZkT1sFN98yu4MlyOxTH4D74pE+9MIKsmtOg/5w9G6GcNzCz6hcPGSDzoWePsnHjO0E5srTxSPvlp9TkImp7eYdjWchy/2oILpa403RqdlR7Ymwi+5O+qKxZ17hHVnhJaAAwLnQ==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CWLP265MB5770.GBRP265.PROD.OUTLOOK.COM; PTR:; CAT:NONE;
 SFS:(13230031)(346002)(376002)(396003)(366004)(136003)(39850400004)(230173577357003)(230922051799003)(230273577357003)(186009)(64100799003)(1800799012)(451199024)(6666004)(6512007)(2616005)(1076003)(26005)(478600001)(6506007)(83380400001)(7416002)(5660300002)(2906002)(30864003)(41300700001)(44832011)(6486002)(966005)(66946007)(8936002)(8676002)(4326008)(54906003)(66476007)(66556008)(316002)(52116002)(38100700002)(36756003)(86362001)(38350700005);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?n2FmqCD1W+UDztFWamKrdSQMKrwv32ygfTVa5TQ8XZsJCzttMiuIuUCE7Nh+?=
 =?us-ascii?Q?3waTGibYK40rqkxKACP7K22p+gruZkjG/Qk38xyMPvj1hwYWTLav5iUMaxlR?=
 =?us-ascii?Q?SmgcwWE2XDhuBUKXpyP/hUHDeyVU2iYM2w6eQ2y6YnaFymj+O8s8nsHSY/aC?=
 =?us-ascii?Q?jM635UH0jRu/GuF3RkUX5fdL64pa/K1O1j7CL5pbOMCNA9ZM4DBvJuZdRMnJ?=
 =?us-ascii?Q?xrzW6C0qrWyBF0lgyK6fYlt2hXsWo+gxasEMqxbwR78D2+Fbbt2lMKROaLul?=
 =?us-ascii?Q?laZYtAAZZUt9e+mjC2g9fEf6gmXdFiDzU7vqIfXIWaVwqiObWHqdkNgu+kKs?=
 =?us-ascii?Q?8fZrlFZXm/EUHse2oXIJyQoi+pAeZTVUYItKLixBqg3F0JDct85ynyUxi9F0?=
 =?us-ascii?Q?1CJsT66shRy0r8XPz2qYNc5Sn9EaPWFvbLIqw4Yq1m5wK97hQqDAuUnYOn12?=
 =?us-ascii?Q?2xPa1RooOVx3NocDooEzQH0ghG/CX8/M9fjBmxq20c8sQ+VRqoHtvIVj6Shi?=
 =?us-ascii?Q?nhdQU0nDy8obQLRk4TT3betMjfpKyTd2gTTVtNW0sva5sU8znhZMj3c23Xt6?=
 =?us-ascii?Q?oSyNDZ8GDImka6oluoKuoG3WvwOYlMwQ5z/X3oimEgJ/JX8jmjjMje402C9e?=
 =?us-ascii?Q?KFajqhdTs9p0Tvig8H2uBR81NZxQoJnJjx6gns49+1ThOuyyfG2DA1440Ee8?=
 =?us-ascii?Q?tPsiG+igvLwyzKVENZojBjHyfheZz5a2O9yV2gDBUJ42Nfl/QoMyA3cHzK16?=
 =?us-ascii?Q?XMj7NUzKvYUKKsrDCn6VOuau2cJbbTYmoD+mGZ3ELLRqzcm4bBiYYVfoOddO?=
 =?us-ascii?Q?DpG5BBJ/Qv6A0sMOUldrTTgL+oJ2eB2CL4HAIzBLGrJTVpt7nTbsCQcwKZ2W?=
 =?us-ascii?Q?rzAu8jR1R57T88QTEL75Zwx4kZp8ej1QerGcafjADBOb6k7IV6fs4GAhRinv?=
 =?us-ascii?Q?LUrkLWYKBE3gphkfeKGHbvY4QSe4OPtUSiN6goUaOdefaOosk4Lmqy2P5vnA?=
 =?us-ascii?Q?SsGS3wbCguoO3VTrWRK4xjCggMBmF0yRzpiElO+XYVD5kzklzoDZGiff0Mkw?=
 =?us-ascii?Q?gtow7N1adMwe+YNwhd3H+cTAngIUEh4uwEKSS5OwlYYVLb5C9rmPzbwR4Lwm?=
 =?us-ascii?Q?U0jaf819qDC/VQdO+RUOvfxUlCPDJ9vzmUB6aTA1lRbpVrZRmuzv/jlY2A4n?=
 =?us-ascii?Q?jkTijbeJE4oI+eciB+5e2yeJd7ajMiuTTdJ9AOwv3pkbnp2DXXlPSwNM9fpE?=
 =?us-ascii?Q?CbKjoVxbsOuWtn5V/bnrB4SscNCqIfvm7zF7n+eoE6GldwiBN+aWbyAT+O+O?=
 =?us-ascii?Q?m6x1txP+eSv/MpgVRQx0MlNr5QgNJRqKVEPte1jaGTnnretBHZkCM0/U6Zla?=
 =?us-ascii?Q?kXnbiGoAyc6n3kPPZQksHjN944atqnrhINKvV3BxJh+xB/CYCHbqQPcYx5fj?=
 =?us-ascii?Q?83QZW+0YE+U2aX3XLuDqVR3EGFxMtIwiip2idWtYTNnxmxEOBqmG3OQPvgjB?=
 =?us-ascii?Q?X0tRzdml6R5yPiahLqHk6mNLi6pmf0YBpw5yW4gEjFc1O6k6MbFah9qguCSI?=
 =?us-ascii?Q?S57/NnCIPGw/VJaR4+yUe5XNgeaexJVSID273KItXOTsuDF0mah1N/W3S2BA?=
 =?us-ascii?Q?NQ=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 787956d8-49a3-432f-3f02-08dbf0386378
X-MS-Exchange-CrossTenant-AuthSource: CWLP265MB5770.GBRP265.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 Nov 2023 17:35:18.1723 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 0d5fd8bb-e8c2-4e0a-8dd5-2c264f7140fe
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: wycbTDsFgtIlWHQgdTeTLEs53oKiiBQtajazzDRdSdzQLcac5UtlETL5atA67UHkB3NoMitRMsdSS1TvsXv8Pfj59gTQZGZjNU7csuFasZ8=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LO0P265MB6228
X-OriginatorOrg: imgtec.com
X-EXCLAIMER-MD-CONFIG: 15a78312-3e47-46eb-9010-2e54d84a9631
X-Proofpoint-GUID: uSN4pilQrdIps6tzksJfYBCoCs2TceKv
X-Proofpoint-ORIG-GUID: uSN4pilQrdIps6tzksJfYBCoCs2TceKv
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
Cc: Stephen Rothwell <sfr@canb.auug.org.au>, corbet@lwn.net, mripard@kernel.org,
 matt.coster@imgtec.com, donald.robson@imgtec.com, tzimmermann@suse.de,
 kernel test robot <lkp@intel.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Some reported by Stephen Rothwell. The rest were found by running the
kernel-doc build script.
Some indentation fixes.

Reported-by: Stephen Rothwell <sfr@canb.auug.org.au>
Reported-by: kernel test robot <lkp@intel.com>
Closes: https://lore.kernel.org/oe-kbuild-all/202311241526.Y2WZeUau-lkp@intel.com/
Signed-off-by: Donald Robson <donald.robson@imgtec.com>
---
 Documentation/gpu/imagination/index.rst   |  2 +-
 Documentation/gpu/imagination/uapi.rst    |  5 +----
 drivers/gpu/drm/imagination/pvr_cccb.h    |  1 +
 drivers/gpu/drm/imagination/pvr_device.h  | 25 ++++++++++++++++-------
 drivers/gpu/drm/imagination/pvr_fw.h      |  3 ++-
 drivers/gpu/drm/imagination/pvr_fw_info.h |  8 ++++----
 drivers/gpu/drm/imagination/pvr_hwrt.h    |  1 +
 drivers/gpu/drm/imagination/pvr_job.c     |  4 +---
 drivers/gpu/drm/imagination/pvr_mmu.c     |  3 ++-
 drivers/gpu/drm/imagination/pvr_queue.h   |  4 ++--
 drivers/gpu/drm/imagination/pvr_vm.c      |  2 +-
 include/uapi/drm/pvr_drm.h                | 10 ++++-----
 12 files changed, 38 insertions(+), 30 deletions(-)

diff --git a/Documentation/gpu/imagination/index.rst b/Documentation/gpu/imagination/index.rst
index dc9579e758c3..0c1e247cea41 100644
--- a/Documentation/gpu/imagination/index.rst
+++ b/Documentation/gpu/imagination/index.rst
@@ -3,7 +3,7 @@ drm/imagination PowerVR Graphics Driver
 =======================================
 
 .. kernel-doc:: drivers/gpu/drm/imagination/pvr_drv.c
-   :doc: PowerVR Graphics Driver
+   :doc: PowerVR (Series 6 and later) and IMG Graphics Driver
 
 Contents
 ========
diff --git a/Documentation/gpu/imagination/uapi.rst b/Documentation/gpu/imagination/uapi.rst
index 2227ea7e6222..7502413d0a93 100644
--- a/Documentation/gpu/imagination/uapi.rst
+++ b/Documentation/gpu/imagination/uapi.rst
@@ -45,9 +45,6 @@ DEV_QUERY
                  drm_pvr_heap
                  drm_pvr_dev_query_heap_info
 
-.. kernel-doc:: include/uapi/drm/pvr_drm.h
-   :doc: Flags for DRM_PVR_DEV_QUERY_HEAP_INFO_GET.
-
 .. kernel-doc:: include/uapi/drm/pvr_drm.h
    :identifiers: drm_pvr_static_data_area_usage
                  drm_pvr_static_data_area
@@ -121,7 +118,7 @@ CREATE_FREE_LIST and DESTROY_FREE_LIST
    :identifiers: drm_pvr_ioctl_destroy_free_list_args
 
 CREATE_HWRT_DATASET and DESTROY_HWRT_DATASET
---------------------------------------
+--------------------------------------------
 .. kernel-doc:: include/uapi/drm/pvr_drm.h
    :doc: PowerVR IOCTL CREATE_HWRT_DATASET and DESTROY_HWRT_DATASET interfaces
 
diff --git a/drivers/gpu/drm/imagination/pvr_cccb.h b/drivers/gpu/drm/imagination/pvr_cccb.h
index f35b3d4c9575..943fe8f2c963 100644
--- a/drivers/gpu/drm/imagination/pvr_cccb.h
+++ b/drivers/gpu/drm/imagination/pvr_cccb.h
@@ -86,6 +86,7 @@ pvr_cccb_get_size_of_cmd_with_hdr(u32 cmd_size)
 
 /**
  * pvr_cccb_cmdseq_can_fit() - Check if a command sequence can fit in the CCCB.
+ * @pvr_cccb: Target Client CCB.
  * @size: Command sequence size.
  *
  * Returns:
diff --git a/drivers/gpu/drm/imagination/pvr_device.h b/drivers/gpu/drm/imagination/pvr_device.h
index e07655fc65e8..2ca7e535799f 100644
--- a/drivers/gpu/drm/imagination/pvr_device.h
+++ b/drivers/gpu/drm/imagination/pvr_device.h
@@ -203,17 +203,29 @@ struct pvr_device {
 		struct mutex lock;
 	} queues;
 
+	/**
+	 * @watchdog: Watchdog for communications with firmware.
+	 */
 	struct {
 		/** @work: Work item for watchdog callback. */
 		struct delayed_work work;
 
-		/** @old_kccb_cmds_executed: KCCB command execution count at last watchdog poll. */
+		/**
+		 * @old_kccb_cmds_executed: KCCB command execution count at last
+		 * watchdog poll.
+		 */
 		u32 old_kccb_cmds_executed;
 
-		/** @kccb_stall_count: Number of watchdog polls KCCB has been stalled for. */
+		/**
+		 * @kccb_stall_count: Number of watchdog polls KCCB has been
+		 * stalled for.
+		 */
 		u32 kccb_stall_count;
 	} watchdog;
 
+	/**
+	 * @kccb: Circular buffer for communications with firmware.
+	 */
 	struct {
 		/** @ccb: Kernel CCB. */
 		struct pvr_ccb ccb;
@@ -225,8 +237,8 @@ struct pvr_device {
 		struct pvr_fw_object *rtn_obj;
 
 		/**
-		 * @rtn: Pointer to CPU mapping of KCCB return slots. Must be accessed by
-		 *       READ_ONCE()/WRITE_ONCE().
+		 * @rtn: Pointer to CPU mapping of KCCB return slots. Must be
+		 * accessed by READ_ONCE()/WRITE_ONCE().
 		 */
 		u32 *rtn;
 
@@ -293,14 +305,13 @@ struct pvr_file {
 
 	/**
 	 * @pvr_dev: A reference to the powervr-specific wrapper for the
-	 *           associated device. Saves on repeated calls to
-	 *           to_pvr_device().
+	 * associated device. Saves on repeated calls to to_pvr_device().
 	 */
 	struct pvr_device *pvr_dev;
 
 	/**
 	 * @ctx_handles: Array of contexts belonging to this file. Array members
-	 *               are of type "struct pvr_context *".
+	 * are of type "struct pvr_context *".
 	 *
 	 * This array is used to allocate handles returned to userspace.
 	 */
diff --git a/drivers/gpu/drm/imagination/pvr_fw.h b/drivers/gpu/drm/imagination/pvr_fw.h
index 5cd3ef08d82b..b7966bd574a9 100644
--- a/drivers/gpu/drm/imagination/pvr_fw.h
+++ b/drivers/gpu/drm/imagination/pvr_fw.h
@@ -481,7 +481,8 @@ pvr_fw_object_unmap_and_destroy(struct pvr_fw_object *fw_obj)
 }
 
 /**
- * pvr_fw_get_dma_addr() - Get DMA address for given offset in firmware object
+ * pvr_fw_object_get_dma_addr() - Get DMA address for given offset in firmware
+ * object.
  * @fw_obj: Pointer to object to lookup address in.
  * @offset: Offset within object to lookup address at.
  * @dma_addr_out: Pointer to location to store DMA address.
diff --git a/drivers/gpu/drm/imagination/pvr_fw_info.h b/drivers/gpu/drm/imagination/pvr_fw_info.h
index ad5d44a3067a..c3639440610e 100644
--- a/drivers/gpu/drm/imagination/pvr_fw_info.h
+++ b/drivers/gpu/drm/imagination/pvr_fw_info.h
@@ -122,13 +122,13 @@ struct pvr_fw_layout_entry {
  * struct pvr_fw_device_info_header - Device information header.
  */
 struct pvr_fw_device_info_header {
-	/* BRN Mask size (in u64s). */
+	/** @brn_mask_size: BRN mask size (in u64s). */
 	u64 brn_mask_size;
-	/* ERN Mask size (in u64s). */
+	/** @ern_mask_size: ERN mask size (in u64s). */
 	u64 ern_mask_size;
-	/* Feature Mask size (in u64s). */
+	/** @feature_mask_size: Feature mask size (in u64s). */
 	u64 feature_mask_size;
-	/* Feature Parameter size (in u64s). */
+	/** @feature_param_size: Feature parameter size (in u64s). */
 	u64 feature_param_size;
 };
 
diff --git a/drivers/gpu/drm/imagination/pvr_hwrt.h b/drivers/gpu/drm/imagination/pvr_hwrt.h
index 76992948d047..676070b20c3b 100644
--- a/drivers/gpu/drm/imagination/pvr_hwrt.h
+++ b/drivers/gpu/drm/imagination/pvr_hwrt.h
@@ -64,6 +64,7 @@ struct pvr_hwrt_dataset {
 	/** @common_fw_obj: FW object representing common FW-side structure. */
 	struct pvr_fw_object *common_fw_obj;
 
+	/** @common: Common HWRT data. */
 	struct rogue_fwif_hwrtdata_common common;
 
 	/** @data: HWRT data structures belonging to this set. */
diff --git a/drivers/gpu/drm/imagination/pvr_job.c b/drivers/gpu/drm/imagination/pvr_job.c
index 9d0812710295..04139da6c04d 100644
--- a/drivers/gpu/drm/imagination/pvr_job.c
+++ b/drivers/gpu/drm/imagination/pvr_job.c
@@ -378,7 +378,7 @@ prepare_job_syncs(struct pvr_file *pvr_file,
 
 /**
  * prepare_job_syncs_for_each() - Prepare all sync objects for an array of jobs.
- * @file: PowerVR file.
+ * @pvr_file: PowerVR file.
  * @job_data: Array of precreated jobs and their sync_ops.
  * @job_count: Number of jobs.
  * @signal_array: xarray to receive signal sync objects.
@@ -696,8 +696,6 @@ pvr_jobs_link_geom_frag(struct pvr_job_data *job_data, u32 *job_count)
  * @pvr_dev: Target PowerVR device.
  * @pvr_file: Pointer to PowerVR file structure.
  * @args: Ioctl args.
- * @job_count: Number of jobs in @jobs_args. On error this will be updated
- * with the index into @jobs_args where the error occurred.
  *
  * This initial implementation is entirely synchronous; on return the GPU will
  * be idle. This will not be the case for future implementations.
diff --git a/drivers/gpu/drm/imagination/pvr_mmu.c b/drivers/gpu/drm/imagination/pvr_mmu.c
index b71d30e5f380..c8562bfc0dcd 100644
--- a/drivers/gpu/drm/imagination/pvr_mmu.c
+++ b/drivers/gpu/drm/imagination/pvr_mmu.c
@@ -335,8 +335,9 @@ pvr_mmu_backing_page_fini(struct pvr_mmu_backing_page *page)
 
 /**
  * pvr_mmu_backing_page_sync() - Flush a MMU backing page from the CPU to the
- *                              device.
+ * device.
  * @page: Target backing page.
+ * @flags: MMU flush flags. Must be one of %PVR_MMU_SYNC_LEVEL_*_FLAGS.
  *
  * .. caution::
  *
diff --git a/drivers/gpu/drm/imagination/pvr_queue.h b/drivers/gpu/drm/imagination/pvr_queue.h
index b5ce2c742150..e06ced69302f 100644
--- a/drivers/gpu/drm/imagination/pvr_queue.h
+++ b/drivers/gpu/drm/imagination/pvr_queue.h
@@ -50,7 +50,7 @@ struct pvr_queue_cccb_fence_ctx {
 	 */
 	struct pvr_job *job;
 
-	/** @lock: Lock protecting access to the job object. */
+	/** @job_lock: Lock protecting access to the job object. */
 	struct mutex job_lock;
 };
 
@@ -114,7 +114,7 @@ struct pvr_queue {
 	} timeline_ufo;
 
 	/**
-	 * last_queued_job_scheduled_fence: The scheduled fence of the last
+	 * @last_queued_job_scheduled_fence: The scheduled fence of the last
 	 * job queued to this queue.
 	 *
 	 * We use it to insert frag -> geom dependencies when issuing combined
diff --git a/drivers/gpu/drm/imagination/pvr_vm.c b/drivers/gpu/drm/imagination/pvr_vm.c
index 3ad1366294b9..04f7d0cf4188 100644
--- a/drivers/gpu/drm/imagination/pvr_vm.c
+++ b/drivers/gpu/drm/imagination/pvr_vm.c
@@ -42,7 +42,7 @@ struct pvr_vm_context {
 	/** @mmu_ctx: The context for binding to physical memory. */
 	struct pvr_mmu_context *mmu_ctx;
 
-	/** @gpuva_mgr: GPUVA manager object associated with this context. */
+	/** @gpuvm_mgr: GPUVM object associated with this context. */
 	struct drm_gpuvm gpuvm_mgr;
 
 	/** @lock: Global lock on this VM. */
diff --git a/include/uapi/drm/pvr_drm.h b/include/uapi/drm/pvr_drm.h
index 1834375390c4..ccf6c2112468 100644
--- a/include/uapi/drm/pvr_drm.h
+++ b/include/uapi/drm/pvr_drm.h
@@ -741,20 +741,18 @@ enum drm_pvr_ctx_priority {
  */
 enum drm_pvr_ctx_type {
 	/**
-	 * @DRM_PVR_CTX_TYPE_RENDER: Render context. Use &struct
-	 * drm_pvr_ioctl_create_render_context_args for context creation arguments.
+	 * @DRM_PVR_CTX_TYPE_RENDER: Render context.
 	 */
 	DRM_PVR_CTX_TYPE_RENDER = 0,
 
 	/**
-	 * @DRM_PVR_CTX_TYPE_COMPUTE: Compute context. Use &struct
-	 * drm_pvr_ioctl_create_compute_context_args for context creation arguments.
+	 * @DRM_PVR_CTX_TYPE_COMPUTE: Compute context.
 	 */
 	DRM_PVR_CTX_TYPE_COMPUTE,
 
 	/**
-	 * @DRM_PVR_CTX_TYPE_TRANSFER_FRAG: Transfer context for fragment data masters. Use
-	 * &struct drm_pvr_ioctl_create_transfer_context_args for context creation arguments.
+	 * @DRM_PVR_CTX_TYPE_TRANSFER_FRAG: Transfer context for fragment data
+	 * master.
 	 */
 	DRM_PVR_CTX_TYPE_TRANSFER_FRAG,
 };
-- 
2.25.1

