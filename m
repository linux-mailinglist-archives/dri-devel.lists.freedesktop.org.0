Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id D7B3463D1B3
	for <lists+dri-devel@lfdr.de>; Wed, 30 Nov 2022 10:22:51 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9986310E439;
	Wed, 30 Nov 2022 09:22:42 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM02-DM3-obe.outbound.protection.outlook.com
 (mail-dm3nam02on2045.outbound.protection.outlook.com [40.107.95.45])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 87CDB10E438
 for <dri-devel@lists.freedesktop.org>; Wed, 30 Nov 2022 09:22:38 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=YdqhfquldSbNZUu4OAR3cTi/N2js1TaAWys8MEQLPiqHsU+wCXbIQB7XQnLrXjQ6tN71h/7wl1pgCpvAY+J3W1VapTBCN+j8yQGvby8csWCSzQtVYjL8sj9FlsRROmGDgSoupEfkUscB0RlHnLFHqvHSWGH/46GgnNsToQejM7g8lfWBBh8suplwMBfjmC163oZ0/onYxj6qifSxjVU1ByRp+AFcYdkn/QIqx8dJohFcUlM2e3jvJmg7yez5lFAvWTN6x9gMbbvUR4P9xv8ve48bZDRE8N1hM8/vy26oOSSYe4mr90dm2Zhzan1Qf9h3I0GXFh7FBtZWK73LczMgXA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ABCaPfmdnyZ1OMYQv+zcc5c0UsHTzNbNlbXcyCmW+58=;
 b=S3iOtVThTO3wWNTywqk9tfz46Jq6quzERBdeaGV8+SJEfwj+s8wVuwOpFQLVo7PcArek0u5QrSiVqDkiD9reX1dCczkmjKWllfriiTGDU0BDa/cA5Hr2obfLTZXESSCvPxc07NupGYw4AQ4CDCen73jno0MBSllnxAny/o6MCzK/ORWO0S2Ob4hpHCvpFI//hsKaOufFO851dqcAuc4YpEsaRW4Jhg57SnxlzRqGSHRt9BsR92T+svjivPywpDkx7X2gLSWlGUqY1CWfdzRdNizJrfr+ua1EtKUjrba8Y8ZVYmAr7aB/QeQr2Ynbd7Ukwu14cMbng26DD9kIJK1tvw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=synaptics.com; dmarc=pass action=none
 header.from=synaptics.com; dkim=pass header.d=synaptics.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=Synaptics.onmicrosoft.com; s=selector2-Synaptics-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ABCaPfmdnyZ1OMYQv+zcc5c0UsHTzNbNlbXcyCmW+58=;
 b=hJyBtI/5HKIspYdPdtQZ7OzkRCtNDaR5dPOCw8lZsufTtsUwKhFQXGeSenmXNLu1e+kh3FSU2GAUgxCJbRUPK+2hSFF7Jh/8pVuDLGF/deXW+Jm+Czg/jLjeRq+mlElqP9DURmSuZyUSSZcrtKH3B70VBlcTZRwDbsKoVXEz2ew=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=synaptics.com;
Received: from DM6PR03MB5196.namprd03.prod.outlook.com (2603:10b6:5:24a::19)
 by PH0PR03MB5799.namprd03.prod.outlook.com (2603:10b6:510:34::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5857.23; Wed, 30 Nov
 2022 09:22:37 +0000
Received: from DM6PR03MB5196.namprd03.prod.outlook.com
 ([fe80::a132:66d9:ed0f:e5c1]) by DM6PR03MB5196.namprd03.prod.outlook.com
 ([fe80::a132:66d9:ed0f:e5c1%5]) with mapi id 15.20.5857.023; Wed, 30 Nov 2022
 09:22:37 +0000
From: Hsia-Jun Li <randy.li@synaptics.com>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH v5 2/2] Documentation/gpu: Add Synaptics tiling formats
 documentation
Date: Wed, 30 Nov 2022 17:21:49 +0800
Message-Id: <20221130092149.102788-3-randy.li@synaptics.com>
X-Mailer: git-send-email 2.37.3
In-Reply-To: <20221130092149.102788-1-randy.li@synaptics.com>
References: <20221130092149.102788-1-randy.li@synaptics.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SJ0PR05CA0142.namprd05.prod.outlook.com
 (2603:10b6:a03:33d::27) To DM6PR03MB5196.namprd03.prod.outlook.com
 (2603:10b6:5:24a::19)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM6PR03MB5196:EE_|PH0PR03MB5799:EE_
X-MS-Office365-Filtering-Correlation-Id: 3d5819fc-b07b-4ddf-9669-08dad2b46ba5
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: sWATc+C+itzm4dTeDSsuhUBfuRc5AxklY6dHJcF6FpIMgNIAI9f5kIBXImzsoMzousKo84thc+XsH8EFgSbOZvw1M+KJ9BesKDRbJCPRDbYNTiH6bbMpVP/0ansmLAIc9/xvylHWKA+lEWW7/ANml73Nn/xPlWVfMIsgi5wcn2K6TLDxn2PGEaSUQuVWjDRb0nA8/uPMmLswJcHhP33Q/sZwrE/URFp/Rt3AEnJsFaX9yiMSjXSGmRez/BbHUMwHJVdzd8o7BRJW3HDeKdRCk3sls1r7HQxZg3jPVtVC+PC/kmJxh39kCm9bqsy44kEv4hG2gxmLki+/Jg4S/8T/MInC2XJLaXIXk9o6NipH5d52xn1OwjmFkEf8fT2euI3xOlIRZ8DZN+3pzvA8BsekQHWb7NXVkHdzQdhnYFhTbTIXWW7ZaCnGDWLk2jMYKcyTVD+BIJ3pkzkxtJ5obD8GwYYjnjZVJoVZx5INgK6x9mzQvUa74cq3bjYDWWxzs/jjH5KMEqW5w4r/ppbBSj/KB+GSiZdNacSe+KjbSPsdNu9m/WxsLv1ZKxECAWuPM0mglTb8wde5/xJRRyKz2ASad/SN3xglvY4Zn/0gKplmj6quQTdixRLHvjuthjShuVoAFlpvmSx00NJq4LtcsfnbKRM71mt3I44LNxSODI7hHmaDAJ2V/bcdJMq3mmBZNOHz
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM6PR03MB5196.namprd03.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230022)(136003)(346002)(366004)(396003)(376002)(39860400002)(451199015)(316002)(478600001)(66946007)(36756003)(2906002)(6916009)(1076003)(6486002)(86362001)(38100700002)(83380400001)(107886003)(6666004)(38350700002)(52116002)(6506007)(26005)(6512007)(186003)(2616005)(8936002)(5660300002)(7416002)(41300700001)(4326008)(8676002)(66556008)(66476007);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?VUU4ovx2KNm9EgVfupMqICKyJgS0U+E/ZofofFPi5M6X+0vozMZwvUtojaSH?=
 =?us-ascii?Q?6n6zdaQYv3LfPKxxxLbD2uQTzsja9L0Wa02xeIbNBtxTbjkwDjf7uWjpUdK2?=
 =?us-ascii?Q?TW3iy2nynYb23/al9jlXspNbXZOKRrwwoRVi8dAQ5lNOFO/UzzU7yQ4lXSvh?=
 =?us-ascii?Q?2kcq7X4zV85g9FfTB11st3wv5uRylRUBgb4auusUYIBMIB37K9jurTOrKYSB?=
 =?us-ascii?Q?CNl8vNmCRDtK5uHZ/5JRI9ft6nSG4aRH6AkUnAN7dSHirAjwNo8hKC49eCqv?=
 =?us-ascii?Q?4BvsYF/NxW1GGEEgqxH1SgtsLUFK+ew7QdOHat3eVRZvY0//q8MP6329ii3A?=
 =?us-ascii?Q?DVAg51J6WEIKgqRB6QXf3s8YbB3x95meWNzunWDTliaOXkDL1M/5ANL8qae3?=
 =?us-ascii?Q?kazjTpytcuVa4MiYbHW9L/KdoGk6OkpDZ7p6OJIHYS94U6HVARld6WzCEav1?=
 =?us-ascii?Q?3TRhzfKUSmFoaqTwT36aCWG/bxNWMaMyvJqz0tyayGbJ7GTETuBd9e8Lvb2H?=
 =?us-ascii?Q?3gr2LOGabOGE4kdN4JUIGRYrdt1mrF/ivnSVnoOJF+L5T8fREaYaggSLhaQx?=
 =?us-ascii?Q?rMhf+zz8rHrSDZykpDW/i9gtw0aIRCK1RqltC14UW5qZG5BdqSyFG05K9Rwu?=
 =?us-ascii?Q?vOKavOvWRtztjPrU3oRPK2rrzw067ASJ4ARtR4zk1q62mvg/lVbryoSqHcJk?=
 =?us-ascii?Q?267iqvaSAtTR+LQr++OW0pxLCulCxqCjc+v0p2zloSMq2ZG8KoKvdlUjmQD1?=
 =?us-ascii?Q?I4gHdoiocSBKgLKnosV3qhzzKtbjEr7B9BDewjr+AsfkXC3cW/ddR7wKyd4V?=
 =?us-ascii?Q?V/fVDT6sXHjjFhrHlXCPxSXf7CtN1BhkiThuFqhwOkTBq/gum3pFgEYnU7Ds?=
 =?us-ascii?Q?VVJHRp3cCRmYgKPEoYrHpJhUVy1Q6dVbXgXDpQnLrzefKAQCh9WBleoXYTJB?=
 =?us-ascii?Q?3iNNpYZz8oCHokjpOof+t8wyigigOQxx0aJ2UuEs/PrpNF9y4OVczMI9+mIt?=
 =?us-ascii?Q?JRv3y3bS2HYDByi6f09CB54ecZOlVpys13irpt9nifvNQce3NVZg0icu/7TI?=
 =?us-ascii?Q?CxvOrQwzPuNbdcV/NxwlZmQy+N30hTFIbkWlL6bMq6iTqzcAxKIvfe0Tw+E/?=
 =?us-ascii?Q?4sHczkvh3pcdlVVKQcriN+K0qvVdr9KOpxWoLRQsHZJov9AlOrr9Eaq8wBZ4?=
 =?us-ascii?Q?0dBs5Ym8MSWfp5ClLheKTNAe2iehq5F2a9u7IGvgL8X9CYv+ExM7GbuFXpoJ?=
 =?us-ascii?Q?KxZl/bzHRYLpPNHH9mzgir4ifA6Dd1wkcWK449Vruc1lC3GYWn0D6O4Jvc7t?=
 =?us-ascii?Q?Tqqviqn8YicDoXJTyHzpvSwZuoJApsG8MZ0FTTMoD/nNlt751pYRZe3fSGYa?=
 =?us-ascii?Q?rxT2HbyQs9AZsjJ1ihKBTON+XvbJ81OZfPP4022btR38sgOfvEHlb0LueSqz?=
 =?us-ascii?Q?vlrqMWuSJTOvNaHEKM7jp399eaZTVCq8PqnJcQ7qoDvu+qhG1CO6pPMC1uVn?=
 =?us-ascii?Q?T6SZvjYlWTPItJ5sBEO894zsWZZoIqqqyXmUy6oYobmoJO6LSPZ3OrNm+TRD?=
 =?us-ascii?Q?h0nehVTtdW/1p2zeM8EcmGbF5koJV/7oGe32cyaq?=
X-OriginatorOrg: synaptics.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 3d5819fc-b07b-4ddf-9669-08dad2b46ba5
X-MS-Exchange-CrossTenant-AuthSource: DM6PR03MB5196.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 Nov 2022 09:22:37.0962 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335d1fbc-2124-4173-9863-17e7051a2a0e
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: MHOBV/e7NS3elbLarza+sGNZspRTyLHLkh6yU1+cEZGkL1DxM3lg/QOxBPRpP4GcLl9NCOqBuFXNE6FO/fdFCw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH0PR03MB5799
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
Cc: nicolas@ndufresne.ca, sakari.ailus@linux.intel.com, airlied@linux.ie,
 ayaka@soulik.info, linux-kernel@vger.kernel.org, tfiga@chromium.org,
 Hsia-Jun Li <randy.li@synaptics.com>, helen.koike@collabora.com,
 linux-media@vger.kernel.org, ezequiel@vanguardiasur.com.ar,
 tzimmermann@suse.de, ribalda@chromium.org, sebastian.hesselbarth@gmail.com,
 mchehab@kernel.org, linux-arm-kernel@lists.infradead.org,
 laurent.pinchart@ideasonboard.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: Randy Li <ayaka@soulik.info>

Signed-off-by: Randy Li <ayaka@soulik.info>
Signed-off-by: Hsia-Jun(Randy) Li <randy.li@synaptics.com>
---
 Documentation/gpu/drivers.rst   |   1 +
 Documentation/gpu/synaptics.rst | 104 ++++++++++++++++++++++++++++++++
 2 files changed, 105 insertions(+)
 create mode 100644 Documentation/gpu/synaptics.rst

diff --git a/Documentation/gpu/drivers.rst b/Documentation/gpu/drivers.rst
index 3a52f48215a3..7e820c93d994 100644
--- a/Documentation/gpu/drivers.rst
+++ b/Documentation/gpu/drivers.rst
@@ -18,6 +18,7 @@ GPU Driver Documentation
    xen-front
    afbc
    komeda-kms
+   synaptics
 
 .. only::  subproject and html
 
diff --git a/Documentation/gpu/synaptics.rst b/Documentation/gpu/synaptics.rst
new file mode 100644
index 000000000000..b0564d2fe3ce
--- /dev/null
+++ b/Documentation/gpu/synaptics.rst
@@ -0,0 +1,104 @@
+.. SPDX-License-Identifier: GFDL-1.1-no-invariants-or-later
+
+================
+Synaptics Tiling
+================
+
+The tiling pixel formats in Synpatics Video Smart platform have
+many variants. Tiles could form the group of tiles(GOT), pixels
+within a group rectangle are stored into tile.
+There are two parameters which consist a modifier described
+the (nearest) width and height pixels in a group.
+
+Meanwhile, the tile in a group may not follow dimension
+layout, tile could form a small group of tiles, then that (sub)group
+of tiles would form a bigger group. We won't describe the dimension
+layout inside the group of tiles here. The layout of the group
+of tiles is fixed with the group width and height parameters
+in the same generation of the platform.
+
+Compression
+===========
+The proprietary lossless image compression protocol in Synaptics
+could minimizes the amount of data transferred (less memory bandwidth
+consumption) between devices. It would usually apply to the tiling
+pixel format.
+
+Each component would request an extra page aligned length buffer
+for storing the compression meta data. Also a 32 bytes parameters
+set would come with a compression meta data buffer.
+
+The component here corresponds to a signal type (i.e. Luma, Chroma).
+They could be encoded into one or multiple metadata planes, but
+their compression parameters would still be individual.
+
+Pixel format modifiers
+======================
+Addition alignment requirement for stride and size of a memory plane
+could apply beyond what has been mentioned below. Remember always
+negotiating with all the devices in pipeline before allocation.
+
+.. raw:: latex
+
+    \small
+
+.. tabularcolumns:: |p{5.8cm}|p{1.2cm}|p{10.3cm}|
+
+.. cssclass:: longtable
+
+.. flat-table:: Synpatics Image Format Modifiers
+    :header-rows:  1
+    :stub-columns: 0
+    :widths:       3 1 8
+
+    * - Identifier
+      - Fourcc
+      - Details
+    * .. _DRM-FORMAT-MOD-SYNA-V4H1
+
+      - ``DRM_FORMAT_MOD_SYNA_V4H1``
+      - ``DRM_FORMAT_NV12``
+      - The plain uncompressed 8 bits tile format. It sounds similar to
+	Intel's Y-tile. but it won't take any pixel from the next X direction
+	in a tile group. The line stride and image height must be aligned to
+	a multiple of 16. The height of chrominance plane would plus 8.
+    * .. _DRM-FORMAT-MOD-SYNA-V4H3P8
+
+      - ``DRM_FORMAT_MOD_SYNA_V4H3P8``
+      - ``DRM_FORMAT_NV15``
+      - The plain uncompressed 10 bits tile format. It stores pixel in 2D
+	3x4 tiles with a 8bits padding to each of tile. Then a tile is in a
+	128 bits cache line.
+    * .. _DRM-FORMAT-MOD-SYNA-V4H1-64L4-COMPRESSED
+
+      - ``DRM_FORMAT_MOD_SYNA_V4H1_64L4_COMPRESSED``
+      - ``DRM_FORMAT_NV12``
+      - Group of tiles and compressed variant of ``DRM_FORMAT_MOD_SYNA_V4H1``.
+	A group of tiles would contain 64x4 pixels, where a tile has 1x4
+	pixel.
+    * .. _DRM-FORMAT-MOD-SYNA-V4H3P8-64L4-COMPRESSED
+
+      - ``DRM_FORMAT_MOD_SYNA_V4H3P8_64L4_COMPRESSED``
+      - ``DRM_FORMAT_NV15``
+      - Group of tiles and compressed variant of ``DRM_FORMAT_MOD_SYNA_V4H3P8``.
+	A group of tiles would contains 48x4 pixels, where a tile has 3x4 pixels
+	and a 8 bits padding in the end of a tile. A group of tiles would
+	be 256 bytes.
+    * .. _DRM-FORMAT-MOD-SYNA-V4H1-128L128-COMPRESSED
+
+      - ``DRM_FORMAT_MOD_SYNA_V4H1_128L128_COMPRESSED``
+      - ``DRM_FORMAT_NV12``
+      - Group of tiles and compressed variant of ``DRM_FORMAT_MOD_SYNA_V4H1``.
+	A group of tiles would contain 128x32 pixels, where a tile has 1x4 pixel.
+    * .. _DRM-FORMAT-MOD-SYNA-V4H3P8-128L128-COMPRESSED
+
+      - ``DRM_FORMAT_MOD_SYNA_V4H3P8_128L128_COMPRESSED``
+      - ``DRM_FORMAT_NV15``
+      - Group of tiles and compressed variant of ``DRM_FORMAT_MOD_SYNA_V4H3P8``.
+	A group of tiles would contains 96x128 pixels, where a tile has 3x4 pixels
+	and a 8 bits padding in the end of a tile. A group of tiles would 
+	be 16 KiB.
+
+.. raw:: latex
+
+    \normalsize
-- 
2.37.3

