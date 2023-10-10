Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D4E617BFDD5
	for <lists+dri-devel@lfdr.de>; Tue, 10 Oct 2023 15:39:23 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D0E7510E384;
	Tue, 10 Oct 2023 13:39:21 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx07-00376f01.pphosted.com (mx07-00376f01.pphosted.com
 [185.132.180.163])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 591C110E377
 for <dri-devel@lists.freedesktop.org>; Tue, 10 Oct 2023 13:39:04 +0000 (UTC)
Received: from pps.filterd (m0168889.ppops.net [127.0.0.1])
 by mx07-00376f01.pphosted.com (8.17.1.22/8.17.1.22) with ESMTP id
 39A6eZgU030133; Tue, 10 Oct 2023 14:38:14 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=imgtec.com; h=
 from:to:cc:subject:date:message-id:in-reply-to:references
 :content-transfer-encoding:content-type:mime-version; s=
 dk201812; bh=2PUrw8uXO9LBM5QlLiLriDPn5A9uoyrqNs961f/wbb0=; b=ti9
 r/6CH54mXK4+owATRQlOni1udsoXSh/2rtIf+86O4CnwXM5ZUXO8YRrCgK9AamSX
 HIjDig+BorupzuJZrf8YlUqBkcYToZW6H8cEc3/wrSM8VyXZSAid4ktT/i7o0uaa
 hI6No+rDbWpqYgD3VCFQmjnQF0rZGIl4RLeGaSrtSxpMh3Dah1lKZQjuxfsU0Q3a
 XIKwzQK+mvZrrCOh3Yg2xMFoM0nWEy6nsCQWtt6gqhsZQH9FlVJn9Of9LDrhz9ma
 gSEjC5KKMZbKv9h9ULEpIo/gnfWTcEPjxCSd93O5gsn/nkPWwJuvTVbCIg1/N1dO
 1dkuSa84gP0EYEQ0Iaw==
Received: from hhmail05.hh.imgtec.org ([217.156.249.195])
 by mx07-00376f01.pphosted.com (PPS) with ESMTPS id 3tjydrt72g-3
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT);
 Tue, 10 Oct 2023 14:38:13 +0100 (BST)
Received: from HHMAIL05.hh.imgtec.org (10.100.10.120) by
 HHMAIL05.hh.imgtec.org (10.100.10.120) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.31; Tue, 10 Oct 2023 14:38:12 +0100
Received: from GBR01-LO4-obe.outbound.protection.outlook.com (104.47.85.104)
 by email.imgtec.com (10.100.10.121) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.31 via Frontend Transport; Tue, 10 Oct 2023 14:38:12 +0100
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=dqCNcr2n8+s4bcT2mi4VnBSs0SRF5/0IdcAvhMBqHe83By+EoylpTlatnAIRVvOblRAsuh/a4c5FVh41V9zXlOfjSeUlW9Pm6+Hm8swhgBdWcjHmTSlr1QEHJ3EDv7cFJMWLDxJDCKv/XPqB1yVKK7UHByf3pAYDuhMHiSPOVh+7sA+cxI+ZkkRqiXpDRTDsDMg9QNY2HVjvEfxXCIsx5oVyePyjHJ9snpeU48s1HO9XC7FdJgRiz4iULR8Zt2qvvJGs7WWkbnqpnPp0P2CakF125loetSOam+fZd1FSzQJ3aCx3WwS0eJYZziYs2KTZ2tDFeS5sUx2JmMhGX9qbgw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=2PUrw8uXO9LBM5QlLiLriDPn5A9uoyrqNs961f/wbb0=;
 b=D8mWt8tirw+0u2q9iD4mqvKrZb/v0AYBk7wdDbksDnjKanL4DiPdgBbfiMgV8/MKmYNcC3iQ64nbtVHEwke5it+Z14bcORHA22KiuP7P7xPd2XtvjlS67pI4xThu9zmju+vOQfb4RypdjZNp1Ck8oF46kHsPLsU8guysCaNneTTXU9XRy3+HRsSFZP2WWw5BUGhi70onBdnaRRCgZJKI6Pc5aEwbubJJ0XEyUpUCeZC0P9WcLeLV94nkk1hjiakADE6qzCy6jG0WUa/F7S52PKS10DMb23WKzpzr5T30H46d6letN8VoXerHlz3pyngl66yGs/cgSKcfOCLYDfO7sA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=imgtec.com; dmarc=pass action=none header.from=imgtec.com;
 dkim=pass header.d=imgtec.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=IMGTecCRM.onmicrosoft.com; s=selector2-IMGTecCRM-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=2PUrw8uXO9LBM5QlLiLriDPn5A9uoyrqNs961f/wbb0=;
 b=Z+VY6Wqp5PHcWefwTkFc1VnmLaw5GfELshRr/giDFzQzb0Qn90k3jKQHjMWAXMkz8HCY4u/X9m8/vUSXmcOuOKkaRswOoMKs/HJCSTmfwoP38j/Gj/DhgVvIcs6FTO9KzKwaivojiQsrynBqNU+w60hWM5e0sA1xmH/eI1odhT4=
Received: from CWLP265MB4817.GBRP265.PROD.OUTLOOK.COM (2603:10a6:400:170::9)
 by LNXP265MB2442.GBRP265.PROD.OUTLOOK.COM (2603:10a6:600:132::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6863.38; Tue, 10 Oct
 2023 13:38:08 +0000
Received: from CWLP265MB4817.GBRP265.PROD.OUTLOOK.COM
 ([fe80::1f14:8c15:179d:7afc]) by CWLP265MB4817.GBRP265.PROD.OUTLOOK.COM
 ([fe80::1f14:8c15:179d:7afc%4]) with mapi id 15.20.6863.032; Tue, 10 Oct 2023
 13:38:08 +0000
From: Sarah Walker <sarah.walker@imgtec.com>
To: <dri-devel@lists.freedesktop.org>
Subject: [PATCH v7 04/20] drm/imagination/uapi: Add PowerVR driver UAPI
Date: Tue, 10 Oct 2023 14:37:22 +0100
Message-Id: <20231010133738.35274-5-sarah.walker@imgtec.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20231010133738.35274-1-sarah.walker@imgtec.com>
References: <20231010133738.35274-1-sarah.walker@imgtec.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: LO4P123CA0183.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:1a4::8) To CWLP265MB4817.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:400:170::9)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CWLP265MB4817:EE_|LNXP265MB2442:EE_
X-MS-Office365-Filtering-Correlation-Id: 61423105-20ad-46c1-cb34-08dbc99623de
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: vIHcN8w7NY0VUxJoYx0bnmaImCJJ3sCxTJh4vb4sQdgrhuud79YpM1aEtXmZL1e0vmbgVBUmJnk5rojiKHsfU8Q79HJFEUyQ1bcH7bsGrfwAQ6VavNBNP8SZkyZ7h5jfAV5s7j9ygzs82zEOrzX2+zIM2l4+uPTlij6aWBotGvIhUpPRR43mDfcLKwL57Az6Mdn0DKsr6YGT7GJQmTjxxbNPKX680dBQtCSdf92x4V7IuwR3x7s0Xpu0C8pyOv+3bhyuk3Ld88mC7kjgUkCbsM0cFqUpLdNw3o1e1y31Bw9HByBx6XxFfs5y8ckCzFGxDRg9+5r2oQcDTTK5h39zcntvdyXBSLj8QLUlz5TKYBytarufVyxy5JW5dtkXCBOKDpY9TS7vb1WGzevmDx1suKlMQQLBzdH+WhqOtwvg7YouxvJ1qNUU4Yr3g39kBAWu63B3xEGQrxR2UQGtYdVHb8aikGVJSJbzrY90s6VEbzil6i/obOgHi/QSVLXsfPfYrMzrjRngOUCoSBExxeFaaflJ2V1C50l6b7dRE2SJh1uAXcAo3OLsAN5Jv5iHLpjtWbY4q/SpzTEFJkIBakEZR3xIW0HhNWsC7C4zJSjoqlmHV9jlNKq+d2tU7E9X1XE9
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CWLP265MB4817.GBRP265.PROD.OUTLOOK.COM; PTR:; CAT:NONE;
 SFS:(13230031)(366004)(136003)(376002)(346002)(396003)(39850400004)(230922051799003)(64100799003)(186009)(1800799009)(451199024)(107886003)(6512007)(52116002)(1076003)(6506007)(2616005)(478600001)(6486002)(6666004)(44832011)(26005)(83380400001)(7416002)(2906002)(30864003)(5660300002)(66556008)(66946007)(66476007)(8676002)(8936002)(6916009)(4326008)(41300700001)(316002)(36756003)(38350700002)(38100700002)(86362001)(579004);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?27NFw56ZUOrIO8b8+pin2ALHrOtBqwCkt0YODjlRpOUklHBNe3yaOIj7cKSt?=
 =?us-ascii?Q?D+o44Lu1lshSC5GwXS3a9mK8ZO9L9wxOSyOROsv6P1QdmtD9qwhGLrISVUTz?=
 =?us-ascii?Q?C3pE7H7qpuosoUNGudpblz+0/VFD9jmK1LWShZKOSVPZkYm+yjT5BfhJPGVI?=
 =?us-ascii?Q?C1ztWQdSVefLFYvP0vfMqxPQ2tIH0rA6U51OmbMg3xdN2SfXiuq3MC6E+qF3?=
 =?us-ascii?Q?f45RFxlkvOuOrsYGlPJOmjRxsoMMTCWe9DaHBmjoGqGzeJvnd6FNan8ef/t4?=
 =?us-ascii?Q?1me1JUWwIey9Ah1el+Oill/0q8ihtthYgzsAhVFsr9Ow9sbY23d+454KLo/e?=
 =?us-ascii?Q?S5wZAm4SKdrdwLbJJ42a859DwZCeC0mz4xqPPmBW3rUtcIgY5xrIqx3Es4K0?=
 =?us-ascii?Q?SINaSOw94bqyD+8dukeeNjpYrjGS4rsJ8Y4o5pO0wI+a9ebV0UzXuqRUfDZl?=
 =?us-ascii?Q?xQNj8h6T6dA7c0cqRIBcm60szjwnMUoU4DyR+EzWCM9x8i9u+hx4C6mk10Rf?=
 =?us-ascii?Q?Bc6+PPrhMSdXNl+MSvExqPULMWk8X+GVIv1ZTMbW5NLVIZLkrSA2CacFZSb+?=
 =?us-ascii?Q?K6KGdUfl9jG1aLXnLhzV1ghMJDgBYdVygjMMI0IFDJH5GQDGF53iSNY4X4hf?=
 =?us-ascii?Q?QA75J+vVei7OEjZIKqJqCdHHTIYGjrEm6PpXi5QFDnZp4iAgKViXt/okPJYE?=
 =?us-ascii?Q?SVRiKggtAqviJGeoafqbYqN8wN0Jjj0m5QXxrhQB3s7ofwF/sK62XufOrde5?=
 =?us-ascii?Q?9E6W7KkFX/lz+rN5jAmj/5+QB1670MoIR3ZoKtnvOKO+aAncmkWV/gizqTOI?=
 =?us-ascii?Q?p2GsxLWX1Y/5bqxEaknDCxJ0W8UQ+LNIk7fKLb9KVl+AmTR/90B/32VxnKU5?=
 =?us-ascii?Q?4bZnOdAQf5a7/zp0IUAzz3F0ec6xFnGeAelmeHThX466egwWv6v32YziOr5V?=
 =?us-ascii?Q?NpteGYOGvCOTN2DeSAcFmm6OjiA9exOFffsI3jNaUnuRXQVYX33MCzG9mpTS?=
 =?us-ascii?Q?LX733+K+JPGHAdmt8gTDFDBl6h7za2iDeScLb+ev4l2NEEjRXHOXWUFnNe5O?=
 =?us-ascii?Q?5yfXyynbv6Nm8hQLi8DYUywcelN9UQOAe+8wdkajD8Mer36hrGO6QRYU0yRi?=
 =?us-ascii?Q?/bInfT9pUVgxF95nIzJkgBSyzChPlLGIJqb1SYqXaH+yynZyB8H03kd5E8pz?=
 =?us-ascii?Q?tZIPP9LiEHkPc+jftreymalhagFG1klbA7ZJGn4ncIs0iKC/JwPy6AfreJLg?=
 =?us-ascii?Q?jwYiCqoRWarqded05+FC+CmL0kXPlMs/otMwwA5ZtrATDO2XPYsQzkDjySan?=
 =?us-ascii?Q?rXXE4ETDYaO4LCTaZcIYNUTg4lwNiyZZU6kDGsaLuM8jeqk9fSNIy9XoJZ/H?=
 =?us-ascii?Q?SQQKZryQKiU3lvd8jwC3Yh0mjGWw6qHUi6wejZRYdYbhxpDkLMFPPZ8WvhIJ?=
 =?us-ascii?Q?gwKIWCVIuin330fLORaFFO2FrkyQ9ZUDQF5O2p9LXkN4q/hjpSGkw/3galxA?=
 =?us-ascii?Q?0hQXvlanHFXlEKds+ISe9pup5jpT7dg4eYK3oFTv86hX1Jery4zBAmlsCM6B?=
 =?us-ascii?Q?/wWI191Bbze3tmaDHKru4DmNWj2ENGdpqq1/O8NH?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 61423105-20ad-46c1-cb34-08dbc99623de
X-MS-Exchange-CrossTenant-AuthSource: CWLP265MB4817.GBRP265.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Oct 2023 13:38:08.8782 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 0d5fd8bb-e8c2-4e0a-8dd5-2c264f7140fe
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: KpW1dQ4sOf0E8GQO9YB5aJBQlMR3YKBrsLKBJs+EwS1xxdzAI/sxDSqFIJ6mAx7bZHgbeGUvP3f9tYNFWQSJlA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LNXP265MB2442
X-OriginatorOrg: imgtec.com
X-EXCLAIMER-MD-CONFIG: 15a78312-3e47-46eb-9010-2e54d84a9631
X-Proofpoint-GUID: MFwXofS4N--pYMdxvK7bIzvZi8-jJYOO
X-Proofpoint-ORIG-GUID: MFwXofS4N--pYMdxvK7bIzvZi8-jJYOO
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
Cc: linux-doc@vger.kernel.org, hns@goldelico.com,
 krzysztof.kozlowski+dt@linaro.org, matthew.brost@intel.com, corbet@lwn.net,
 luben.tuikov@amd.com, dakr@redhat.com, donald.robson@imgtec.com,
 devicetree@vger.kernel.org, conor+dt@kernel.org, mripard@kernel.org,
 Matt Coster <matt.coster@imgtec.com>, robh+dt@kernel.org,
 faith.ekstrand@collabora.com, linux-kernel@vger.kernel.org, afd@ti.com,
 boris.brezillon@collabora.com, tzimmermann@suse.de, christian.koenig@amd.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Add the UAPI implementation for the PowerVR driver.

Changes from v6
- Add padding to struct drm_pvr_dev_query_gpu_info
- Improve BYPASS_CACHE flag documentation
- Add SUBMIT_JOB_FRAG_CMD_DISABLE_PIXELMERGE flag

Changes from v4:
- Remove CREATE_ZEROED flag for BO creation (all buffers are now zeroed)

Co-developed-by: Frank Binns <frank.binns@imgtec.com>
Signed-off-by: Frank Binns <frank.binns@imgtec.com>
Co-developed-by: Boris Brezillon <boris.brezillon@collabora.com>
Signed-off-by: Boris Brezillon <boris.brezillon@collabora.com>
Co-developed-by: Matt Coster <matt.coster@imgtec.com>
Signed-off-by: Matt Coster <matt.coster@imgtec.com>
Co-developed-by: Donald Robson <donald.robson@imgtec.com>
Signed-off-by: Donald Robson <donald.robson@imgtec.com>
Signed-off-by: Sarah Walker <sarah.walker@imgtec.com>
---
 MAINTAINERS                |    1 +
 include/uapi/drm/pvr_drm.h | 1319 ++++++++++++++++++++++++++++++++++++
 2 files changed, 1320 insertions(+)
 create mode 100644 include/uapi/drm/pvr_drm.h

diff --git a/MAINTAINERS b/MAINTAINERS
index eea8e618746a..cfdc7ec02972 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -10233,6 +10233,7 @@ M:	Frank Binns <frank.binns@imgtec.com>
 M:	Donald Robson <donald.robson@imgtec.com>
 S:	Supported
 F:	Documentation/devicetree/bindings/gpu/img,powervr.yaml
+F:	include/uapi/drm/pvr_drm.h
 
 IMON SOUNDGRAPH USB IR RECEIVER
 M:	Sean Young <sean@mess.org>
diff --git a/include/uapi/drm/pvr_drm.h b/include/uapi/drm/pvr_drm.h
new file mode 100644
index 000000000000..ca021dae7de7
--- /dev/null
+++ b/include/uapi/drm/pvr_drm.h
@@ -0,0 +1,1319 @@
+/* SPDX-License-Identifier: (GPL-2.0 WITH Linux-syscall-note) OR MIT */
+/* Copyright (c) 2023 Imagination Technologies Ltd. */
+
+#ifndef PVR_DRM_UAPI_H
+#define PVR_DRM_UAPI_H
+
+#include "drm.h"
+
+#include <linux/const.h>
+#include <linux/types.h>
+
+#if defined(__cplusplus)
+extern "C" {
+#endif
+
+/**
+ * DOC: PowerVR UAPI
+ *
+ * The PowerVR IOCTL argument structs have a few limitations in place, in
+ * addition to the standard kernel restrictions:
+ *
+ *  - All members must be type-aligned.
+ *  - The overall struct must be padded to 64-bit alignment.
+ *  - Explicit padding is almost always required. This takes the form of
+ *    ``_padding_[x]`` members of sufficient size to pad to the next power-of-two
+ *    alignment, where [x] is the offset into the struct in hexadecimal. Arrays
+ *    are never used for alignment. Padding fields must be zeroed; this is
+ *    always checked.
+ *  - Unions may only appear as the last member of a struct.
+ *  - Individual union members may grow in the future. The space between the
+ *    end of a union member and the end of its containing union is considered
+ *    "implicit padding" and must be zeroed. This is always checked.
+ *
+ * In addition to the IOCTL argument structs, the PowerVR UAPI makes use of
+ * DEV_QUERY argument structs. These are used to fetch information about the
+ * device and runtime. These structs are subject to the same rules set out
+ * above.
+ */
+
+/**
+ * struct drm_pvr_obj_array - Container used to pass arrays of objects
+ *
+ * It is not unusual to have to extend objects to pass new parameters, and the DRM
+ * ioctl infrastructure is supporting that by padding ioctl arguments with zeros
+ * when the data passed by userspace is smaller than the struct defined in the
+ * drm_ioctl_desc, thus keeping things backward compatible. This type is just
+ * applying the same concepts to indirect objects passed through arrays referenced
+ * from the main ioctl arguments structure: the stride basically defines the size
+ * of the object passed by userspace, which allows the kernel driver to pad with
+ * zeros when it's smaller than the size of the object it expects.
+ *
+ * Use ``DRM_PVR_OBJ_ARRAY()`` to fill object array fields, unless you
+ * have a very good reason not to.
+ */
+struct drm_pvr_obj_array {
+	/** @stride: Stride of object struct. Used for versioning. */
+	__u32 stride;
+
+	/** @count: Number of objects in the array. */
+	__u32 count;
+
+	/** @array: User pointer to an array of objects. */
+	__u64 array;
+};
+
+/**
+ * DRM_PVR_OBJ_ARRAY() - Helper macro for filling &struct drm_pvr_obj_array.
+ * @cnt: Number of elements pointed to py @ptr.
+ * @ptr: Pointer to start of a C array.
+ *
+ * Return: Literal of type &struct drm_pvr_obj_array.
+ */
+#define DRM_PVR_OBJ_ARRAY(cnt, ptr) \
+	{ .stride = sizeof((ptr)[0]), .count = (cnt), .array = (__u64)(uintptr_t)(ptr) }
+
+/**
+ * DOC: PowerVR IOCTL interface
+ */
+
+/**
+ * PVR_IOCTL() - Build a PowerVR IOCTL number
+ * @_ioctl: An incrementing id for this IOCTL. Added to %DRM_COMMAND_BASE.
+ * @_mode: Must be one of %DRM_IOR, %DRM_IOW or %DRM_IOWR.
+ * @_data: The type of the args struct passed by this IOCTL.
+ *
+ * The struct referred to by @_data must have a ``drm_pvr_ioctl_`` prefix and an
+ * ``_args suffix``. They are therefore omitted from @_data.
+ *
+ * This should only be used to build the constants described below; it should
+ * never be used to call an IOCTL directly.
+ *
+ * Return: An IOCTL number to be passed to ioctl() from userspace.
+ */
+#define PVR_IOCTL(_ioctl, _mode, _data) \
+	_mode(DRM_COMMAND_BASE + (_ioctl), struct drm_pvr_ioctl_##_data##_args)
+
+#define DRM_IOCTL_PVR_DEV_QUERY PVR_IOCTL(0x00, DRM_IOWR, dev_query)
+#define DRM_IOCTL_PVR_CREATE_BO PVR_IOCTL(0x01, DRM_IOWR, create_bo)
+#define DRM_IOCTL_PVR_GET_BO_MMAP_OFFSET PVR_IOCTL(0x02, DRM_IOWR, get_bo_mmap_offset)
+#define DRM_IOCTL_PVR_CREATE_VM_CONTEXT PVR_IOCTL(0x03, DRM_IOWR, create_vm_context)
+#define DRM_IOCTL_PVR_DESTROY_VM_CONTEXT PVR_IOCTL(0x04, DRM_IOW, destroy_vm_context)
+#define DRM_IOCTL_PVR_VM_MAP PVR_IOCTL(0x05, DRM_IOW, vm_map)
+#define DRM_IOCTL_PVR_VM_UNMAP PVR_IOCTL(0x06, DRM_IOW, vm_unmap)
+#define DRM_IOCTL_PVR_CREATE_CONTEXT PVR_IOCTL(0x07, DRM_IOWR, create_context)
+#define DRM_IOCTL_PVR_DESTROY_CONTEXT PVR_IOCTL(0x08, DRM_IOW, destroy_context)
+#define DRM_IOCTL_PVR_CREATE_FREE_LIST PVR_IOCTL(0x09, DRM_IOWR, create_free_list)
+#define DRM_IOCTL_PVR_DESTROY_FREE_LIST PVR_IOCTL(0x0a, DRM_IOW, destroy_free_list)
+#define DRM_IOCTL_PVR_CREATE_HWRT_DATASET PVR_IOCTL(0x0b, DRM_IOWR, create_hwrt_dataset)
+#define DRM_IOCTL_PVR_DESTROY_HWRT_DATASET PVR_IOCTL(0x0c, DRM_IOW, destroy_hwrt_dataset)
+#define DRM_IOCTL_PVR_SUBMIT_JOBS PVR_IOCTL(0x0d, DRM_IOW, submit_jobs)
+
+/**
+ * DOC: PowerVR IOCTL DEV_QUERY interface
+ */
+
+/**
+ * struct drm_pvr_dev_query_gpu_info - Container used to fetch information about
+ * the graphics processor.
+ *
+ * When fetching this type &struct drm_pvr_ioctl_dev_query_args.type must be set
+ * to %DRM_PVR_DEV_QUERY_GPU_INFO_GET.
+ */
+struct drm_pvr_dev_query_gpu_info {
+	/**
+	 * @gpu_id: GPU identifier.
+	 *
+	 * For all currently supported GPUs this is the BVNC encoded as a 64-bit
+	 * value as follows:
+	 *
+	 *    +--------+--------+--------+-------+
+	 *    | 63..48 | 47..32 | 31..16 | 15..0 |
+	 *    +========+========+========+=======+
+	 *    | B      | V      | N      | C     |
+	 *    +--------+--------+--------+-------+
+	 */
+	__u64 gpu_id;
+
+	/**
+	 * @num_phantoms: Number of Phantoms present.
+	 */
+	__u32 num_phantoms;
+
+	/** @_padding_c: Reserved. This field must be zeroed. */
+	__u32 _padding_c;
+};
+
+/**
+ * struct drm_pvr_dev_query_runtime_info - Container used to fetch information
+ * about the graphics runtime.
+ *
+ * When fetching this type &struct drm_pvr_ioctl_dev_query_args.type must be set
+ * to %DRM_PVR_DEV_QUERY_RUNTIME_INFO_GET.
+ */
+struct drm_pvr_dev_query_runtime_info {
+	/**
+	 * @free_list_min_pages: Minimum allowed free list size,
+	 * in PM physical pages.
+	 */
+	__u64 free_list_min_pages;
+
+	/**
+	 * @free_list_max_pages: Maximum allowed free list size,
+	 * in PM physical pages.
+	 */
+	__u64 free_list_max_pages;
+
+	/**
+	 * @common_store_alloc_region_size: Size of the Allocation
+	 * Region within the Common Store used for coefficient and shared
+	 * registers, in dwords.
+	 */
+	__u32 common_store_alloc_region_size;
+
+	/**
+	 * @common_store_partition_space_size: Size of the
+	 * Partition Space within the Common Store for output buffers, in
+	 * dwords.
+	 */
+	__u32 common_store_partition_space_size;
+
+	/**
+	 * @max_coeffs: Maximum coefficients, in dwords.
+	 */
+	__u32 max_coeffs;
+
+	/**
+	 * @cdm_max_local_mem_size_regs: Maximum amount of local
+	 * memory available to a compute kernel, in dwords.
+	 */
+	__u32 cdm_max_local_mem_size_regs;
+};
+
+/**
+ * struct drm_pvr_dev_query_quirks - Container used to fetch information about
+ * hardware fixes for which the device may require support in the user mode
+ * driver.
+ *
+ * When fetching this type &struct drm_pvr_ioctl_dev_query_args.type must be set
+ * to %DRM_PVR_DEV_QUERY_QUIRKS_GET.
+ */
+struct drm_pvr_dev_query_quirks {
+	/**
+	 * @quirks: A userspace address for the hardware quirks __u32 array.
+	 *
+	 * The first @musthave_count items in the list are quirks that the
+	 * client must support for this device. If userspace does not support
+	 * all these quirks then functionality is not guaranteed and client
+	 * initialisation must fail.
+	 * The remaining quirks in the list affect userspace and the kernel or
+	 * firmware. They are disabled by default and require userspace to
+	 * opt-in. The opt-in mechanism depends on the quirk.
+	 */
+	__u64 quirks;
+
+	/** @count: Length of @quirks (number of __u32). */
+	__u16 count;
+
+	/**
+	 * @musthave_count: The number of entries in @quirks that are
+	 * mandatory, starting at index 0.
+	 */
+	__u16 musthave_count;
+
+	/** @_padding_c: Reserved. This field must be zeroed. */
+	__u32 _padding_c;
+};
+
+/**
+ * struct drm_pvr_dev_query_enhancements - Container used to fetch information
+ * about optional enhancements supported by the device that require support in
+ * the user mode driver.
+ *
+ * When fetching this type &struct drm_pvr_ioctl_dev_query_args.type must be set
+ * to %DRM_PVR_DEV_ENHANCEMENTS_GET.
+ */
+struct drm_pvr_dev_query_enhancements {
+	/**
+	 * @enhancements: A userspace address for the hardware enhancements
+	 * __u32 array.
+	 *
+	 * These enhancements affect userspace and the kernel or firmware. They
+	 * are disabled by default and require userspace to opt-in. The opt-in
+	 * mechanism depends on the enhancement.
+	 */
+	__u64 enhancements;
+
+	/** @count: Length of @enhancements (number of __u32). */
+	__u16 count;
+
+	/** @_padding_a: Reserved. This field must be zeroed. */
+	__u16 _padding_a;
+
+	/** @_padding_c: Reserved. This field must be zeroed. */
+	__u32 _padding_c;
+};
+
+/**
+ * enum drm_pvr_heap_id - Array index for heap info data returned by
+ * %DRM_PVR_DEV_QUERY_HEAP_INFO_GET.
+ *
+ * For compatibility reasons all indices will be present in the returned array,
+ * however some heaps may not be present. These are indicated where
+ * &struct drm_pvr_heap.size is set to zero.
+ */
+enum drm_pvr_heap_id {
+	/** @DRM_PVR_HEAP_GENERAL: General purpose heap. */
+	DRM_PVR_HEAP_GENERAL = 0,
+	/** @DRM_PVR_HEAP_PDS_CODE_DATA: PDS code and data heap. */
+	DRM_PVR_HEAP_PDS_CODE_DATA,
+	/** @DRM_PVR_HEAP_USC_CODE: USC code heap. */
+	DRM_PVR_HEAP_USC_CODE,
+	/** @DRM_PVR_HEAP_RGNHDR: Region header heap. Only used if GPU has BRN63142. */
+	DRM_PVR_HEAP_RGNHDR,
+	/** @DRM_PVR_HEAP_VIS_TEST: Visibility test heap. */
+	DRM_PVR_HEAP_VIS_TEST,
+	/** @DRM_PVR_HEAP_TRANSFER_FRAG: Transfer fragment heap. */
+	DRM_PVR_HEAP_TRANSFER_FRAG,
+
+	/**
+	 * @DRM_PVR_HEAP_COUNT: The number of heaps returned by
+	 * %DRM_PVR_DEV_QUERY_HEAP_INFO_GET.
+	 *
+	 * More heaps may be added, so this also serves as the copy limit when
+	 * sent by the caller.
+	 */
+	DRM_PVR_HEAP_COUNT
+	/* Please only add additional heaps above DRM_PVR_HEAP_COUNT! */
+};
+
+/**
+ * DOC: Flags for DRM_PVR_DEV_QUERY_HEAP_INFO_GET.
+ *
+ * .. c:macro:: DRM_PVR_HEAP_FLAG_STATIC_CARVEOUT_AT_END
+ *
+ *    The static data area is at the end of the heap memory area, rather than
+ *    at the beginning.
+ *    The base address will be:
+ *        drm_pvr_heap::base +
+ *            (drm_pvr_heap::size - drm_pvr_heap::static_data_carveout_size)
+ */
+#define DRM_PVR_HEAP_FLAG_STATIC_CARVEOUT_AT_END _BITUL(0)
+
+/**
+ * struct drm_pvr_heap - Container holding information about a single heap.
+ *
+ * This will always be fetched as an array.
+ */
+struct drm_pvr_heap {
+	/** @base: Base address of heap. */
+	__u64 base;
+
+	/**
+	 * @size: Size of heap, in bytes. Will be 0 if the heap is not present.
+	 */
+	__u64 size;
+
+	/** @flags: Flags for this heap. See &enum drm_pvr_heap_flags. */
+	__u32 flags;
+
+	/** @page_size_log2: Log2 of page size. */
+	__u32 page_size_log2;
+};
+
+/**
+ * struct drm_pvr_dev_query_heap_info - Container used to fetch information
+ * about heaps supported by the device driver.
+ *
+ * Please note all driver-supported heaps will be returned up to &heaps.count.
+ * Some heaps will not be present in all devices, which will be indicated by
+ * &struct drm_pvr_heap.size being set to zero.
+ *
+ * When fetching this type &struct drm_pvr_ioctl_dev_query_args.type must be set
+ * to %DRM_PVR_DEV_QUERY_HEAP_INFO_GET.
+ */
+struct drm_pvr_dev_query_heap_info {
+	/**
+	 * @heaps: Array of &struct drm_pvr_heap. If pointer is NULL, the count
+	 * and stride will be updated with those known to the driver version, to
+	 * facilitate allocation by the caller.
+	 */
+	struct drm_pvr_obj_array heaps;
+};
+
+/**
+ * enum drm_pvr_static_data_area_usage - Array index for static data area info
+ * returned by %DRM_PVR_DEV_QUERY_STATIC_DATA_AREAS_GET.
+ *
+ * For compatibility reasons all indices will be present in the returned array,
+ * however some areas may not be present. These are indicated where
+ * &struct drm_pvr_static_data_area.size is set to zero.
+ */
+enum drm_pvr_static_data_area_usage {
+	/**
+	 * @DRM_PVR_STATIC_DATA_AREA_EOT: End of Tile USC program.
+	 *
+	 * The End of Tile task runs at completion of a tile, and is responsible for emitting the
+	 * tile to the Pixel Back End.
+	 */
+	DRM_PVR_STATIC_DATA_AREA_EOT = 0,
+
+	/**
+	 * @DRM_PVR_STATIC_DATA_AREA_FENCE: MCU fence area, used during cache flush and
+	 * invalidation.
+	 *
+	 * This must point to valid physical memory but the contents otherwise are not used.
+	 */
+	DRM_PVR_STATIC_DATA_AREA_FENCE,
+
+	/**
+	 * @DRM_PVR_STATIC_DATA_AREA_VDM_SYNC: VDM sync program.
+	 *
+	 * The VDM sync program is used to synchronise multiple areas of the GPU hardware.
+	 */
+	DRM_PVR_STATIC_DATA_AREA_VDM_SYNC,
+
+	/**
+	 * @DRM_PVR_STATIC_DATA_AREA_YUV_CSC: YUV coefficients.
+	 *
+	 * Area contains up to 16 slots with stride of 64 bytes. Each is a 3x4 matrix of u16 fixed
+	 * point numbers, with 1 sign bit, 2 integer bits and 13 fractional bits.
+	 *
+	 * The slots are :
+	 * 0 = VK_SAMPLER_YCBCR_MODEL_CONVERSION_RGB_IDENTITY_KHR
+	 * 1 = VK_SAMPLER_YCBCR_MODEL_CONVERSION_YCBCR_IDENTITY_KHR (full range)
+	 * 2 = VK_SAMPLER_YCBCR_MODEL_CONVERSION_YCBCR_IDENTITY_KHR (conformant range)
+	 * 3 = VK_SAMPLER_YCBCR_MODEL_CONVERSION_YCBCR_709_KHR (full range)
+	 * 4 = VK_SAMPLER_YCBCR_MODEL_CONVERSION_YCBCR_709_KHR (conformant range)
+	 * 5 = VK_SAMPLER_YCBCR_MODEL_CONVERSION_YCBCR_601_KHR (full range)
+	 * 6 = VK_SAMPLER_YCBCR_MODEL_CONVERSION_YCBCR_601_KHR (conformant range)
+	 * 7 = VK_SAMPLER_YCBCR_MODEL_CONVERSION_YCBCR_2020_KHR (full range)
+	 * 8 = VK_SAMPLER_YCBCR_MODEL_CONVERSION_YCBCR_2020_KHR (conformant range)
+	 * 9 = VK_SAMPLER_YCBCR_MODEL_CONVERSION_YCBCR_601_KHR (conformant range, 10 bit)
+	 * 10 = VK_SAMPLER_YCBCR_MODEL_CONVERSION_YCBCR_709_KHR (conformant range, 10 bit)
+	 * 11 = VK_SAMPLER_YCBCR_MODEL_CONVERSION_YCBCR_2020_KHR (conformant range, 10 bit)
+	 * 14 = Identity (biased)
+	 * 15 = Identity
+	 */
+	DRM_PVR_STATIC_DATA_AREA_YUV_CSC,
+};
+
+/**
+ * struct drm_pvr_static_data_area - Container holding information about a
+ * single static data area.
+ *
+ * This will always be fetched as an array.
+ */
+struct drm_pvr_static_data_area {
+	/**
+	 * @area_usage: Usage of static data area.
+	 * See &enum drm_pvr_static_data_area_usage.
+	 */
+	__u16 area_usage;
+
+	/**
+	 * @location_heap_id: Array index of heap where this of static data
+	 * area is located. This array is fetched using
+	 * %DRM_PVR_DEV_QUERY_HEAP_INFO_GET.
+	 */
+	__u16 location_heap_id;
+
+	/** @size: Size of static data area. Not present if set to zero. */
+	__u32 size;
+
+	/**
+	 * @offset: Offset of static data area from start of static data
+	 * carveout.
+	 */
+	__u64 offset;
+};
+
+/**
+ * struct drm_pvr_dev_query_static_data_areas - Container used to fetch
+ * information about the static data areas in heaps supported by the device
+ * driver.
+ *
+ * Please note all driver-supported static data areas will be returned up to
+ * &static_data_areas.count. Some will not be present for all devices which,
+ * will be indicated by &struct drm_pvr_static_data_area.size being set to zero.
+ *
+ * Further, some heaps will not be present either. See &struct
+ * drm_pvr_dev_query_heap_info.
+ *
+ * When fetching this type &struct drm_pvr_ioctl_dev_query_args.type must be set
+ * to %DRM_PVR_DEV_QUERY_STATIC_DATA_AREAS_GET.
+ */
+struct drm_pvr_dev_query_static_data_areas {
+	/**
+	 * @static_data_areas: Array of &struct drm_pvr_static_data_area. If
+	 * pointer is NULL, the count and stride will be updated with those
+	 * known to the driver version, to facilitate allocation by the caller.
+	 */
+	struct drm_pvr_obj_array static_data_areas;
+};
+
+/**
+ * enum drm_pvr_dev_query - For use with &drm_pvr_ioctl_dev_query_args.type to
+ * indicate the type of the receiving container.
+ *
+ * Append only. Do not reorder.
+ */
+enum drm_pvr_dev_query {
+	/**
+	 * @DRM_PVR_DEV_QUERY_GPU_INFO_GET: The dev query args contain a pointer
+	 * to &struct drm_pvr_dev_query_gpu_info.
+	 */
+	DRM_PVR_DEV_QUERY_GPU_INFO_GET = 0,
+
+	/**
+	 * @DRM_PVR_DEV_QUERY_RUNTIME_INFO_GET: The dev query args contain a
+	 * pointer to &struct drm_pvr_dev_query_runtime_info.
+	 */
+	DRM_PVR_DEV_QUERY_RUNTIME_INFO_GET,
+
+	/**
+	 * @DRM_PVR_DEV_QUERY_QUIRKS_GET: The dev query args contain a pointer
+	 * to &struct drm_pvr_dev_query_quirks.
+	 */
+	DRM_PVR_DEV_QUERY_QUIRKS_GET,
+
+	/**
+	 * @DRM_PVR_DEV_QUERY_ENHANCEMENTS_GET: The dev query args contain a
+	 * pointer to &struct drm_pvr_dev_query_enhancements.
+	 */
+	DRM_PVR_DEV_QUERY_ENHANCEMENTS_GET,
+
+	/**
+	 * @DRM_PVR_DEV_QUERY_HEAP_INFO_GET: The dev query args contain a
+	 * pointer to &struct drm_pvr_dev_query_heap_info.
+	 */
+	DRM_PVR_DEV_QUERY_HEAP_INFO_GET,
+
+	/**
+	 * @DRM_PVR_DEV_QUERY_STATIC_DATA_AREAS_GET: The dev query args contain
+	 * a pointer to &struct drm_pvr_dev_query_static_data_areas.
+	 */
+	DRM_PVR_DEV_QUERY_STATIC_DATA_AREAS_GET,
+};
+
+/**
+ * struct drm_pvr_ioctl_dev_query_args - Arguments for %DRM_IOCTL_PVR_DEV_QUERY.
+ */
+struct drm_pvr_ioctl_dev_query_args {
+	/**
+	 * @type: Type of query and output struct. See &enum drm_pvr_dev_query.
+	 */
+	__u32 type;
+
+	/**
+	 * @size: Size of the receiving struct, see @type.
+	 *
+	 * After a successful call this will be updated to the written byte
+	 * length.
+	 * Can also be used to get the minimum byte length (see @pointer).
+	 * This allows additional fields to be appended to the structs in
+	 * future.
+	 */
+	__u32 size;
+
+	/**
+	 * @pointer: Pointer to struct @type.
+	 *
+	 * Must be large enough to contain @size bytes.
+	 * If pointer is NULL, the expected size will be returned in the @size
+	 * field, but no other data will be written.
+	 */
+	__u64 pointer;
+};
+
+/**
+ * DOC: PowerVR IOCTL CREATE_BO interface
+ */
+
+/**
+ * DOC: Flags for CREATE_BO
+ *
+ * The &struct drm_pvr_ioctl_create_bo_args.flags field is 64 bits wide and consists
+ * of three groups of flags: creation, device mapping and CPU mapping.
+ *
+ * We use "device" to refer to the GPU here because of the ambiguity between
+ * CPU and GPU in some fonts.
+ *
+ * Creation options
+ *    These use the prefix ``DRM_PVR_BO_CREATE_``.
+ *
+ * Device mapping options
+ *    These use the prefix ``DRM_PVR_BO_DEVICE_``.
+ *
+ *    :BYPASS_CACHE: Specify that device accesses to this memory will bypass the cache.
+ *       This is used for buffers that will either be regularly updated by the CPU (eg
+ *       free lists) or will be accessed only once and therefore isn't worth caching (eg
+ *       partial render buffers).
+ *       By default, the device flushes its memory caches after every job, so this
+ *       is not normally required for coherency.
+ *    :PM_FW_PROTECT: Specify that only the Parameter Manager (PM) and/or
+ *       firmware processor should be allowed to access this memory when mapped
+ *       to the device. It is not valid to specify this flag with
+ *       CPU_ALLOW_USERSPACE_ACCESS.
+ *
+ * CPU mapping options
+ *    These use the prefix ``DRM_PVR_BO_CPU_``.
+ *
+ *    :ALLOW_USERSPACE_ACCESS: Allow userspace to map and access the contents
+ *       of this memory. It is not valid to specify this flag with
+ *       DEVICE_PM_FW_PROTECT.
+ */
+#define DRM_PVR_BO_DEVICE_BYPASS_CACHE _BITULL(0)
+#define DRM_PVR_BO_DEVICE_PM_FW_PROTECT _BITULL(1)
+#define DRM_PVR_BO_CPU_ALLOW_USERSPACE_ACCESS _BITULL(2)
+/* Bits 3..63 are reserved. */
+
+#define DRM_PVR_BO_FLAGS_MASK (DRM_PVR_BO_DEVICE_BYPASS_CACHE | DRM_PVR_BO_DEVICE_PM_FW_PROTECT | \
+			       DRM_PVR_BO_CPU_ALLOW_USERSPACE_ACCESS)
+
+/**
+ * struct drm_pvr_ioctl_create_bo_args - Arguments for %DRM_IOCTL_PVR_CREATE_BO
+ */
+struct drm_pvr_ioctl_create_bo_args {
+	/**
+	 * @size: [IN/OUT] Unaligned size of buffer object to create. On
+	 * return, this will be populated with the actual aligned size of the
+	 * new buffer.
+	 */
+	__u64 size;
+
+	/**
+	 * @handle: [OUT] GEM handle of the new buffer object for use in
+	 * userspace.
+	 */
+	__u32 handle;
+
+	/** @_padding_c: Reserved. This field must be zeroed. */
+	__u32 _padding_c;
+
+	/**
+	 * @flags: [IN] Options which will affect the behaviour of this
+	 * creation operation and future mapping operations on the created
+	 * object. This field must be a valid combination of ``DRM_PVR_BO_*``
+	 * values, with all bits marked as reserved set to zero.
+	 */
+	__u64 flags;
+};
+
+/**
+ * DOC: PowerVR IOCTL GET_BO_MMAP_OFFSET interface
+ */
+
+/**
+ * struct drm_pvr_ioctl_get_bo_mmap_offset_args - Arguments for
+ * %DRM_IOCTL_PVR_GET_BO_MMAP_OFFSET
+ *
+ * Like other DRM drivers, the "mmap" IOCTL doesn't actually map any memory.
+ * Instead, it allocates a fake offset which refers to the specified buffer
+ * object. This offset can be used with a real mmap call on the DRM device
+ * itself.
+ */
+struct drm_pvr_ioctl_get_bo_mmap_offset_args {
+	/** @handle: [IN] GEM handle of the buffer object to be mapped. */
+	__u32 handle;
+
+	/** @_padding_4: Reserved. This field must be zeroed. */
+	__u32 _padding_4;
+
+	/** @offset: [OUT] Fake offset to use in the real mmap call. */
+	__u64 offset;
+};
+
+/**
+ * DOC: PowerVR IOCTL CREATE_VM_CONTEXT and DESTROY_VM_CONTEXT interfaces
+ */
+
+/**
+ * struct drm_pvr_ioctl_create_vm_context_args - Arguments for
+ * %DRM_IOCTL_PVR_CREATE_VM_CONTEXT
+ */
+struct drm_pvr_ioctl_create_vm_context_args {
+	/** @handle: [OUT] Handle for new VM context. */
+	__u32 handle;
+
+	/** @_padding_4: Reserved. This field must be zeroed. */
+	__u32 _padding_4;
+};
+
+/**
+ * struct drm_pvr_ioctl_destroy_vm_context_args - Arguments for
+ * %DRM_IOCTL_PVR_DESTROY_VM_CONTEXT
+ */
+struct drm_pvr_ioctl_destroy_vm_context_args {
+	/**
+	 * @handle: [IN] Handle for VM context to be destroyed.
+	 */
+	__u32 handle;
+
+	/** @_padding_4: Reserved. This field must be zeroed. */
+	__u32 _padding_4;
+};
+
+/**
+ * DOC: PowerVR IOCTL VM_MAP and VM_UNMAP interfaces
+ *
+ * The VM UAPI allows userspace to create buffer object mappings in GPU virtual address space.
+ *
+ * The client is responsible for managing GPU address space. It should allocate mappings within
+ * the heaps returned by %DRM_PVR_DEV_QUERY_HEAP_INFO_GET.
+ *
+ * %DRM_IOCTL_PVR_VM_MAP creates a new mapping. The client provides the target virtual address for
+ * the mapping. Size and offset within the mapped buffer object can be specified, so the client can
+ * partially map a buffer.
+ *
+ * %DRM_IOCTL_PVR_VM_UNMAP removes a mapping. The entire mapping will be removed from GPU address
+ * space. For this reason only the start address is provided by the client.
+ */
+
+/**
+ * struct drm_pvr_ioctl_vm_map_args - Arguments for %DRM_IOCTL_PVR_VM_MAP.
+ */
+struct drm_pvr_ioctl_vm_map_args {
+	/**
+	 * @vm_context_handle: [IN] Handle for VM context for this mapping to
+	 * exist in.
+	 */
+	__u32 vm_context_handle;
+
+	/** @flags: [IN] Flags which affect this mapping. Currently always 0. */
+	__u32 flags;
+
+	/**
+	 * @device_addr: [IN] Requested device-virtual address for the mapping.
+	 * This must be non-zero and aligned to the device page size for the
+	 * heap containing the requested address. It is an error to specify an
+	 * address which is not contained within one of the heaps returned by
+	 * %DRM_PVR_DEV_QUERY_HEAP_INFO_GET.
+	 */
+	__u64 device_addr;
+
+	/**
+	 * @handle: [IN] Handle of the target buffer object. This must be a
+	 * valid handle returned by %DRM_IOCTL_PVR_CREATE_BO.
+	 */
+	__u32 handle;
+
+	/** @_padding_14: Reserved. This field must be zeroed. */
+	__u32 _padding_14;
+
+	/**
+	 * @offset: [IN] Offset into the target bo from which to begin the
+	 * mapping.
+	 */
+	__u64 offset;
+
+	/**
+	 * @size: [IN] Size of the requested mapping. Must be aligned to
+	 * the device page size for the heap containing the requested address,
+	 * as well as the host page size. When added to @device_addr, the
+	 * result must not overflow the heap which contains @device_addr (i.e.
+	 * the range specified by @device_addr and @size must be completely
+	 * contained within a single heap specified by
+	 * %DRM_PVR_DEV_QUERY_HEAP_INFO_GET).
+	 */
+	__u64 size;
+};
+
+/**
+ * struct drm_pvr_ioctl_vm_unmap_args - Arguments for %DRM_IOCTL_PVR_VM_UNMAP.
+ */
+struct drm_pvr_ioctl_vm_unmap_args {
+	/**
+	 * @vm_context_handle: [IN] Handle for VM context that this mapping
+	 * exists in.
+	 */
+	__u32 vm_context_handle;
+
+	/** @_padding_4: Reserved. This field must be zeroed. */
+	__u32 _padding_4;
+
+	/**
+	 * @device_addr: [IN] Device-virtual address at the start of the target
+	 * mapping. This must be non-zero.
+	 */
+	__u64 device_addr;
+
+	/**
+	 * @size: Size in bytes of the target mapping. This must be non-zero.
+	 */
+	__u64 size;
+};
+
+/**
+ * DOC: PowerVR IOCTL CREATE_CONTEXT and DESTROY_CONTEXT interfaces
+ */
+
+/**
+ * enum drm_pvr_ctx_priority - Arguments for
+ * &drm_pvr_ioctl_create_context_args.priority
+ */
+enum drm_pvr_ctx_priority {
+	/** @DRM_PVR_CTX_PRIORITY_LOW: Priority below normal. */
+	DRM_PVR_CTX_PRIORITY_LOW = -512,
+
+	/** @DRM_PVR_CTX_PRIORITY_NORMAL: Normal priority. */
+	DRM_PVR_CTX_PRIORITY_NORMAL = 0,
+
+	/**
+	 * @DRM_PVR_CTX_PRIORITY_HIGH: Priority above normal.
+	 * Note this requires ``CAP_SYS_NICE`` or ``DRM_MASTER``.
+	 */
+	DRM_PVR_CTX_PRIORITY_HIGH = 512,
+};
+
+/**
+ * enum drm_pvr_ctx_type - Arguments for
+ * &struct drm_pvr_ioctl_create_context_args.type
+ */
+enum drm_pvr_ctx_type {
+	/**
+	 * @DRM_PVR_CTX_TYPE_RENDER: Render context. Use &struct
+	 * drm_pvr_ioctl_create_render_context_args for context creation arguments.
+	 */
+	DRM_PVR_CTX_TYPE_RENDER = 0,
+
+	/**
+	 * @DRM_PVR_CTX_TYPE_COMPUTE: Compute context. Use &struct
+	 * drm_pvr_ioctl_create_compute_context_args for context creation arguments.
+	 */
+	DRM_PVR_CTX_TYPE_COMPUTE,
+
+	/**
+	 * @DRM_PVR_CTX_TYPE_TRANSFER_FRAG: Transfer context for fragment data masters. Use
+	 * &struct drm_pvr_ioctl_create_transfer_context_args for context creation arguments.
+	 */
+	DRM_PVR_CTX_TYPE_TRANSFER_FRAG,
+};
+
+/**
+ * struct drm_pvr_ioctl_create_context_args - Arguments for
+ * %DRM_IOCTL_PVR_CREATE_CONTEXT
+ */
+struct drm_pvr_ioctl_create_context_args {
+	/**
+	 * @type: [IN] Type of context to create.
+	 *
+	 * This must be one of the values defined by &enum drm_pvr_ctx_type.
+	 */
+	__u32 type;
+
+	/** @flags: [IN] Flags for context. */
+	__u32 flags;
+
+	/**
+	 * @priority: [IN] Priority of new context.
+	 *
+	 * This must be one of the values defined by &enum drm_pvr_ctx_priority.
+	 */
+	__s32 priority;
+
+	/** @handle: [OUT] Handle for new context. */
+	__u32 handle;
+
+	/**
+	 * @static_context_state: [IN] Pointer to static context state stream.
+	 */
+	__u64 static_context_state;
+
+	/**
+	 * @static_context_state_len: [IN] Length of static context state, in bytes.
+	 */
+	__u32 static_context_state_len;
+
+	/**
+	 * @vm_context_handle: [IN] Handle for VM context that this context is
+	 * associated with.
+	 */
+	__u32 vm_context_handle;
+
+	/**
+	 * @callstack_addr: [IN] Address for initial call stack pointer. Only valid
+	 * if @type is %DRM_PVR_CTX_TYPE_RENDER, otherwise must be 0.
+	 */
+	__u64 callstack_addr;
+};
+
+/**
+ * struct drm_pvr_ioctl_destroy_context_args - Arguments for
+ * %DRM_IOCTL_PVR_DESTROY_CONTEXT
+ */
+struct drm_pvr_ioctl_destroy_context_args {
+	/**
+	 * @handle: [IN] Handle for context to be destroyed.
+	 */
+	__u32 handle;
+
+	/** @_padding_4: Reserved. This field must be zeroed. */
+	__u32 _padding_4;
+};
+
+/**
+ * DOC: PowerVR IOCTL CREATE_FREE_LIST and DESTROY_FREE_LIST interfaces
+ */
+
+/**
+ * struct drm_pvr_ioctl_create_free_list_args - Arguments for
+ * %DRM_IOCTL_PVR_CREATE_FREE_LIST
+ *
+ * Free list arguments have the following constraints :
+ *
+ * - @max_num_pages must be greater than zero.
+ * - @grow_threshold must be between 0 and 100.
+ * - @grow_num_pages must be less than or equal to &max_num_pages.
+ * - @initial_num_pages, @max_num_pages and @grow_num_pages must be multiples
+ *   of 4.
+ * - When &grow_num_pages is 0, @initial_num_pages must be equal to
+ *   @max_num_pages.
+ * - When &grow_num_pages is non-zero, @initial_num_pages must be less than
+ *   @max_num_pages.
+ */
+struct drm_pvr_ioctl_create_free_list_args {
+	/**
+	 * @free_list_gpu_addr: [IN] Address of GPU mapping of buffer object
+	 * containing memory to be used by free list.
+	 *
+	 * The mapped region of the buffer object must be at least
+	 * @max_num_pages * ``sizeof(__u32)``.
+	 *
+	 * The buffer object must have been created with
+	 * %DRM_PVR_BO_DEVICE_PM_FW_PROTECT set and
+	 * %DRM_PVR_BO_CPU_ALLOW_USERSPACE_ACCESS not set.
+	 */
+	__u64 free_list_gpu_addr;
+
+	/** @initial_num_pages: [IN] Pages initially allocated to free list. */
+	__u32 initial_num_pages;
+
+	/** @max_num_pages: [IN] Maximum number of pages in free list. */
+	__u32 max_num_pages;
+
+	/** @grow_num_pages: [IN] Pages to grow free list by per request. */
+	__u32 grow_num_pages;
+
+	/**
+	 * @grow_threshold: [IN] Percentage of FL memory used that should
+	 * trigger a new grow request.
+	 */
+	__u32 grow_threshold;
+
+	/**
+	 * @vm_context_handle: [IN] Handle for VM context that the free list buffer
+	 * object is mapped in.
+	 */
+	__u32 vm_context_handle;
+
+	/**
+	 * @handle: [OUT] Handle for created free list.
+	 */
+	__u32 handle;
+};
+
+/**
+ * struct drm_pvr_ioctl_destroy_free_list_args - Arguments for
+ * %DRM_IOCTL_PVR_DESTROY_FREE_LIST
+ */
+struct drm_pvr_ioctl_destroy_free_list_args {
+	/**
+	 * @handle: [IN] Handle for free list to be destroyed.
+	 */
+	__u32 handle;
+
+	/** @_padding_4: Reserved. This field must be zeroed. */
+	__u32 _padding_4;
+};
+
+/**
+ * DOC: PowerVR IOCTL CREATE_HWRT_DATASET and DESTROY_HWRT_DATASET interfaces
+ */
+
+/**
+ * struct drm_pvr_create_hwrt_geom_data_args - Geometry data arguments used for
+ * &struct drm_pvr_ioctl_create_hwrt_dataset_args.geom_data_args.
+ */
+struct drm_pvr_create_hwrt_geom_data_args {
+	/** @tpc_dev_addr: [IN] Tail pointer cache GPU virtual address. */
+	__u64 tpc_dev_addr;
+
+	/** @tpc_size: [IN] Size of TPC, in bytes. */
+	__u32 tpc_size;
+
+	/** @tpc_stride: [IN] Stride between layers in TPC, in pages */
+	__u32 tpc_stride;
+
+	/** @vheap_table_dev_addr: [IN] VHEAP table GPU virtual address. */
+	__u64 vheap_table_dev_addr;
+
+	/** @rtc_dev_addr: [IN] Render Target Cache virtual address. */
+	__u64 rtc_dev_addr;
+};
+
+/**
+ * struct drm_pvr_create_hwrt_rt_data_args - Render target arguments used for
+ * &struct drm_pvr_ioctl_create_hwrt_dataset_args.rt_data_args.
+ */
+struct drm_pvr_create_hwrt_rt_data_args {
+	/** @pm_mlist_dev_addr: [IN] PM MLIST GPU virtual address. */
+	__u64 pm_mlist_dev_addr;
+
+	/** @macrotile_array_dev_addr: [IN] Macrotile array GPU virtual address. */
+	__u64 macrotile_array_dev_addr;
+
+	/** @region_header_dev_addr: [IN] Region header array GPU virtual address. */
+	__u64 region_header_dev_addr;
+};
+
+/**
+ * struct drm_pvr_ioctl_create_hwrt_dataset_args - Arguments for
+ * %DRM_IOCTL_PVR_CREATE_HWRT_DATASET
+ */
+struct drm_pvr_ioctl_create_hwrt_dataset_args {
+	/** @geom_data_args: [IN] Geometry data arguments. */
+	struct drm_pvr_create_hwrt_geom_data_args geom_data_args;
+
+	/** @rt_data_args: [IN] Array of render target arguments. */
+	struct drm_pvr_create_hwrt_rt_data_args rt_data_args[2];
+
+	/**
+	 * @free_list_handles: [IN] Array of free list handles.
+	 *
+	 * free_list_handles[0] must have initial size of at least that reported
+	 * by &drm_pvr_dev_query_runtime_info.free_list_min_pages.
+	 */
+	__u32 free_list_handles[2];
+
+	/** @width: [IN] Width in pixels. */
+	__u32 width;
+
+	/** @height: [IN] Height in pixels. */
+	__u32 height;
+
+	/** @samples: [IN] Number of samples. */
+	__u32 samples;
+
+	/** @layers: [IN] Number of layers. */
+	__u32 layers;
+
+	/** @isp_merge_lower_x: [IN] Lower X coefficient for triangle merging. */
+	__u32 isp_merge_lower_x;
+
+	/** @isp_merge_lower_y: [IN] Lower Y coefficient for triangle merging. */
+	__u32 isp_merge_lower_y;
+
+	/** @isp_merge_scale_x: [IN] Scale X coefficient for triangle merging. */
+	__u32 isp_merge_scale_x;
+
+	/** @isp_merge_scale_y: [IN] Scale Y coefficient for triangle merging. */
+	__u32 isp_merge_scale_y;
+
+	/** @isp_merge_upper_x: [IN] Upper X coefficient for triangle merging. */
+	__u32 isp_merge_upper_x;
+
+	/** @isp_merge_upper_y: [IN] Upper Y coefficient for triangle merging. */
+	__u32 isp_merge_upper_y;
+
+	/**
+	 * @region_header_size: [IN] Size of region header array. This common field is used by
+	 * both render targets in this data set.
+	 *
+	 * The units for this field differ depending on what version of the simple internal
+	 * parameter format the device uses. If format 2 is in use then this is interpreted as the
+	 * number of region headers. For other formats it is interpreted as the size in dwords.
+	 */
+	__u32 region_header_size;
+
+	/**
+	 * @handle: [OUT] Handle for created HWRT dataset.
+	 */
+	__u32 handle;
+};
+
+/**
+ * struct drm_pvr_ioctl_destroy_hwrt_dataset_args - Arguments for
+ * %DRM_IOCTL_PVR_DESTROY_HWRT_DATASET
+ */
+struct drm_pvr_ioctl_destroy_hwrt_dataset_args {
+	/**
+	 * @handle: [IN] Handle for HWRT dataset to be destroyed.
+	 */
+	__u32 handle;
+
+	/** @_padding_4: Reserved. This field must be zeroed. */
+	__u32 _padding_4;
+};
+
+/**
+ * DOC: PowerVR IOCTL SUBMIT_JOBS interface
+ */
+
+/**
+ * DOC: Flags for the drm_pvr_sync_op object.
+ *
+ * .. c:macro:: DRM_PVR_SYNC_OP_HANDLE_TYPE_MASK
+ *
+ *    Handle type mask for the drm_pvr_sync_op::flags field.
+ *
+ * .. c:macro:: DRM_PVR_SYNC_OP_FLAG_HANDLE_TYPE_SYNCOBJ
+ *
+ *    Indicates the handle passed in drm_pvr_sync_op::handle is a syncobj handle.
+ *    This is the default type.
+ *
+ * .. c:macro:: DRM_PVR_SYNC_OP_FLAG_HANDLE_TYPE_TIMELINE_SYNCOBJ
+ *
+ *    Indicates the handle passed in drm_pvr_sync_op::handle is a timeline syncobj handle.
+ *
+ * .. c:macro:: DRM_PVR_SYNC_OP_FLAG_SIGNAL
+ *
+ *    Signal operation requested. The out-fence bound to the job will be attached to
+ *    the syncobj whose handle is passed in drm_pvr_sync_op::handle.
+ *
+ * .. c:macro:: DRM_PVR_SYNC_OP_FLAG_WAIT
+ *
+ *    Wait operation requested. The job will wait for this particular syncobj or syncobj
+ *    point to be signaled before being started.
+ *    This is the default operation.
+ */
+#define DRM_PVR_SYNC_OP_FLAG_HANDLE_TYPE_MASK 0xf
+#define DRM_PVR_SYNC_OP_FLAG_HANDLE_TYPE_SYNCOBJ 0
+#define DRM_PVR_SYNC_OP_FLAG_HANDLE_TYPE_TIMELINE_SYNCOBJ 1
+#define DRM_PVR_SYNC_OP_FLAG_SIGNAL _BITULL(31)
+#define DRM_PVR_SYNC_OP_FLAG_WAIT 0
+
+#define DRM_PVR_SYNC_OP_FLAGS_MASK (DRM_PVR_SYNC_OP_FLAG_HANDLE_TYPE_MASK | \
+				    DRM_PVR_SYNC_OP_FLAG_SIGNAL)
+
+/**
+ * struct drm_pvr_sync_op - Object describing a sync operation
+ */
+struct drm_pvr_sync_op {
+	/** @handle: Handle of sync object. */
+	__u32 handle;
+
+	/** @flags: Combination of ``DRM_PVR_SYNC_OP_FLAG_`` flags. */
+	__u32 flags;
+
+	/** @value: Timeline value for this drm_syncobj. MBZ for a binary syncobj. */
+	__u64 value;
+};
+
+/**
+ * DOC: Flags for SUBMIT_JOB ioctl geometry command.
+ *
+ * .. c:macro:: DRM_PVR_SUBMIT_JOB_GEOM_CMD_FIRST
+ *
+ *    Indicates if this the first command to be issued for a render.
+ *
+ * .. c:macro:: DRM_PVR_SUBMIT_JOB_GEOM_CMD_LAST
+ *
+ *    Indicates if this the last command to be issued for a render.
+ *
+ * .. c:macro:: DRM_PVR_SUBMIT_JOB_GEOM_CMD_SINGLE_CORE
+ *
+ *    Forces to use single core in a multi core device.
+ *
+ * .. c:macro:: DRM_PVR_SUBMIT_JOB_GEOM_CMD_FLAGS_MASK
+ *
+ *    Logical OR of all the geometry cmd flags.
+ */
+#define DRM_PVR_SUBMIT_JOB_GEOM_CMD_FIRST _BITULL(0)
+#define DRM_PVR_SUBMIT_JOB_GEOM_CMD_LAST _BITULL(1)
+#define DRM_PVR_SUBMIT_JOB_GEOM_CMD_SINGLE_CORE _BITULL(2)
+#define DRM_PVR_SUBMIT_JOB_GEOM_CMD_FLAGS_MASK                                 \
+	(DRM_PVR_SUBMIT_JOB_GEOM_CMD_FIRST |                                   \
+	 DRM_PVR_SUBMIT_JOB_GEOM_CMD_LAST |                                    \
+	 DRM_PVR_SUBMIT_JOB_GEOM_CMD_SINGLE_CORE)
+
+/**
+ * DOC: Flags for SUBMIT_JOB ioctl fragment command.
+ *
+ * .. c:macro:: DRM_PVR_SUBMIT_JOB_FRAG_CMD_SINGLE_CORE
+ *
+ *    Use single core in a multi core setup.
+ *
+ * .. c:macro:: DRM_PVR_SUBMIT_JOB_FRAG_CMD_DEPTHBUFFER
+ *
+ *    Indicates whether a depth buffer is present.
+ *
+ * .. c:macro:: DRM_PVR_SUBMIT_JOB_FRAG_CMD_STENCILBUFFER
+ *
+ *    Indicates whether a stencil buffer is present.
+ *
+ * .. c:macro:: DRM_PVR_SUBMIT_JOB_FRAG_CMD_PREVENT_CDM_OVERLAP
+ *
+ *    Disallow compute overlapped with this render.
+ *
+ * .. c:macro:: DRM_PVR_SUBMIT_JOB_FRAG_CMD_GET_VIS_RESULTS
+ *
+ *    Indicates whether this render produces visibility results.
+ *
+ * .. c:macro:: DRM_PVR_SUBMIT_JOB_FRAG_CMD_SCRATCHBUFFER
+ *
+ *    Indicates whether partial renders write to a scratch buffer instead of
+ *    the final surface. It also forces the full screen copy expected to be
+ *    present on the last render after all partial renders have completed.
+ *
+ * .. c:macro:: DRM_PVR_SUBMIT_JOB_FRAG_CMD_DISABLE_PIXELMERGE
+ *
+ *    Disable pixel merging for this render.
+ *
+ * .. c:macro:: DRM_PVR_SUBMIT_JOB_FRAG_CMD_FLAGS_MASK
+ *
+ *    Logical OR of all the fragment cmd flags.
+ */
+#define DRM_PVR_SUBMIT_JOB_FRAG_CMD_SINGLE_CORE _BITULL(0)
+#define DRM_PVR_SUBMIT_JOB_FRAG_CMD_DEPTHBUFFER _BITULL(1)
+#define DRM_PVR_SUBMIT_JOB_FRAG_CMD_STENCILBUFFER _BITULL(2)
+#define DRM_PVR_SUBMIT_JOB_FRAG_CMD_PREVENT_CDM_OVERLAP _BITULL(3)
+#define DRM_PVR_SUBMIT_JOB_FRAG_CMD_SCRATCHBUFFER _BITULL(4)
+#define DRM_PVR_SUBMIT_JOB_FRAG_CMD_GET_VIS_RESULTS _BITULL(5)
+#define DRM_PVR_SUBMIT_JOB_FRAG_CMD_PARTIAL_RENDER _BITULL(6)
+#define DRM_PVR_SUBMIT_JOB_FRAG_CMD_DISABLE_PIXELMERGE _BITULL(7)
+#define DRM_PVR_SUBMIT_JOB_FRAG_CMD_FLAGS_MASK                                 \
+	(DRM_PVR_SUBMIT_JOB_FRAG_CMD_SINGLE_CORE |                             \
+	 DRM_PVR_SUBMIT_JOB_FRAG_CMD_DEPTHBUFFER |                             \
+	 DRM_PVR_SUBMIT_JOB_FRAG_CMD_STENCILBUFFER |                           \
+	 DRM_PVR_SUBMIT_JOB_FRAG_CMD_PREVENT_CDM_OVERLAP |                     \
+	 DRM_PVR_SUBMIT_JOB_FRAG_CMD_SCRATCHBUFFER |                           \
+	 DRM_PVR_SUBMIT_JOB_FRAG_CMD_GET_VIS_RESULTS |                         \
+	 DRM_PVR_SUBMIT_JOB_FRAG_CMD_PARTIAL_RENDER |                          \
+	 DRM_PVR_SUBMIT_JOB_FRAG_CMD_DISABLE_PIXELMERGE)
+
+/**
+ * DOC: Flags for SUBMIT_JOB ioctl compute command.
+ *
+ * .. c:macro:: DRM_PVR_SUBMIT_JOB_COMPUTE_CMD_PREVENT_ALL_OVERLAP
+ *
+ *    Disallow other jobs overlapped with this compute.
+ *
+ * .. c:macro:: DRM_PVR_SUBMIT_JOB_COMPUTE_CMD_SINGLE_CORE
+ *
+ *    Forces to use single core in a multi core device.
+ *
+ * .. c:macro:: DRM_PVR_SUBMIT_JOB_COMPUTE_CMD_FLAGS_MASK
+ *
+ *    Logical OR of all the compute cmd flags.
+ */
+#define DRM_PVR_SUBMIT_JOB_COMPUTE_CMD_PREVENT_ALL_OVERLAP _BITULL(0)
+#define DRM_PVR_SUBMIT_JOB_COMPUTE_CMD_SINGLE_CORE _BITULL(1)
+#define DRM_PVR_SUBMIT_JOB_COMPUTE_CMD_FLAGS_MASK         \
+	(DRM_PVR_SUBMIT_JOB_COMPUTE_CMD_PREVENT_ALL_OVERLAP | \
+	 DRM_PVR_SUBMIT_JOB_COMPUTE_CMD_SINGLE_CORE)
+
+/**
+ * DOC: Flags for SUBMIT_JOB ioctl transfer command.
+ *
+ * .. c:macro:: DRM_PVR_SUBMIT_JOB_TRANSFER_CMD_SINGLE_CORE
+ *
+ *    Forces job to use a single core in a multi core device.
+ *
+ * .. c:macro:: DRM_PVR_SUBMIT_JOB_TRANSFER_CMD_FLAGS_MASK
+ *
+ *    Logical OR of all the transfer cmd flags.
+ */
+#define DRM_PVR_SUBMIT_JOB_TRANSFER_CMD_SINGLE_CORE _BITULL(0)
+
+#define DRM_PVR_SUBMIT_JOB_TRANSFER_CMD_FLAGS_MASK \
+	DRM_PVR_SUBMIT_JOB_TRANSFER_CMD_SINGLE_CORE
+
+/**
+ * enum drm_pvr_job_type - Arguments for &struct drm_pvr_job.job_type
+ */
+enum drm_pvr_job_type {
+	/** @DRM_PVR_JOB_TYPE_GEOMETRY: Job type is geometry. */
+	DRM_PVR_JOB_TYPE_GEOMETRY = 0,
+
+	/** @DRM_PVR_JOB_TYPE_FRAGMENT: Job type is fragment. */
+	DRM_PVR_JOB_TYPE_FRAGMENT,
+
+	/** @DRM_PVR_JOB_TYPE_COMPUTE: Job type is compute. */
+	DRM_PVR_JOB_TYPE_COMPUTE,
+
+	/** @DRM_PVR_JOB_TYPE_TRANSFER_FRAG: Job type is a fragment transfer. */
+	DRM_PVR_JOB_TYPE_TRANSFER_FRAG,
+};
+
+/**
+ * struct drm_pvr_hwrt_data_ref - Reference HWRT data
+ */
+struct drm_pvr_hwrt_data_ref {
+	/** @set_handle: HWRT data set handle. */
+	__u32 set_handle;
+
+	/** @data_index: Index of the HWRT data inside the data set. */
+	__u32 data_index;
+};
+
+/**
+ * struct drm_pvr_job - Job arguments passed to the %DRM_IOCTL_PVR_SUBMIT_JOBS ioctl
+ */
+struct drm_pvr_job {
+	/**
+	 * @type: [IN] Type of job being submitted
+	 *
+	 * This must be one of the values defined by &enum drm_pvr_job_type.
+	 */
+	__u32 type;
+
+	/**
+	 * @context_handle: [IN] Context handle.
+	 *
+	 * When @job_type is %DRM_PVR_JOB_TYPE_RENDER, %DRM_PVR_JOB_TYPE_COMPUTE or
+	 * %DRM_PVR_JOB_TYPE_TRANSFER_FRAG, this must be a valid handle returned by
+	 * %DRM_IOCTL_PVR_CREATE_CONTEXT. The type of context must be compatible
+	 * with the type of job being submitted.
+	 *
+	 * When @job_type is %DRM_PVR_JOB_TYPE_NULL, this must be zero.
+	 */
+	__u32 context_handle;
+
+	/**
+	 * @flags: [IN] Flags for command.
+	 *
+	 * Those are job-dependent. See all ``DRM_PVR_SUBMIT_JOB_*``.
+	 */
+	__u32 flags;
+
+	/**
+	 * @cmd_stream_len: [IN] Length of command stream, in bytes.
+	 */
+	__u32 cmd_stream_len;
+
+	/**
+	 * @cmd_stream: [IN] Pointer to command stream for command.
+	 *
+	 * The command stream must be u64-aligned.
+	 */
+	__u64 cmd_stream;
+
+	/** @sync_ops: [IN] Fragment sync operations. */
+	struct drm_pvr_obj_array sync_ops;
+
+	/**
+	 * @hwrt: [IN] HWRT data used by render jobs (geometry or fragment).
+	 *
+	 * Must be zero for non-render jobs.
+	 */
+	struct drm_pvr_hwrt_data_ref hwrt;
+};
+
+/**
+ * struct drm_pvr_ioctl_submit_jobs_args - Arguments for %DRM_IOCTL_PVR_SUBMIT_JOB
+ *
+ * If the syscall returns an error it is important to check the value of
+ * @jobs.count. This indicates the index into @jobs.array where the
+ * error occurred.
+ */
+struct drm_pvr_ioctl_submit_jobs_args {
+	/** @jobs: [IN] Array of jobs to submit. */
+	struct drm_pvr_obj_array jobs;
+};
+
+#if defined(__cplusplus)
+}
+#endif
+
+#endif /* PVR_DRM_UAPI_H */
-- 
2.42.0

