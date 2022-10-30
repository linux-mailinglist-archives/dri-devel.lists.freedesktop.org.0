Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id D18A2612BD3
	for <lists+dri-devel@lfdr.de>; Sun, 30 Oct 2022 18:19:54 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6327810E10D;
	Sun, 30 Oct 2022 17:19:51 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM11-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam11on2054.outbound.protection.outlook.com [40.107.223.54])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4947410E10D
 for <dri-devel@lists.freedesktop.org>; Sun, 30 Oct 2022 17:19:46 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=bsVnrc2pFtD3kfx0P8Eush3KDRWPFdTIgkncl716ZzL+sIHXZx3kqnP13++niKfop5PBPBMlJ2DX70SCDzKcH9Rq/mDxNfWwi6eDSw2+xVUj0uCKZj4bSqiXei2K8906AlSiezb/dxN8qlsGK+IB8C7hE1rEbMzaHk84/3JMpdtgdN3LNrEO6XbZeMsCS5S+tcKXiwNJRoAuUH+X/3qGl0OwPy/B795+IXoYgEVQrDC2ZnInHEOdCdhC7xY9fiBpyI1vTzuvBfvEchvhN7dR8g3pXXbwxPNb84pNclGMQPTenK7aC5srV8F4Kdu93yqDo9G63G9OZkzw7q0D1Skrqg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Gr933eifnr2TpHN8IVdO6xIseG0WakdC3w2T5dMzTFo=;
 b=idy9IUovvAMsPu8BdXO69mon5RqbdCd2HJpD+19ea5hjCKPY1TBCCFvho6HWJgOk5KgbUEIF212322Y5ffvv9pIu1z38aBjUCTNNwzgI93xlp/7WuPlBRUzJt7qnlgwv9NOXhEMEKKUzuiF0MDBxd9SUMtXEjJq8jzy77fbg4CFqwFFHv9QhwJhalezYjL1ZM5KeitXxcdjc90Huwmhh8uKJn2+1fs1dDrv+KcRIPFx2i3MH5DofGeclkgU01VEVHmVAFn1yYbHFxI51baAODJZ4OcKeq+xkCyp73dSxtVOnE17S7fqLdvMbBqvdr22Sp7cpK/TCT767pa5OYujZZg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=synaptics.com; dmarc=pass action=none
 header.from=synaptics.com; dkim=pass header.d=synaptics.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=Synaptics.onmicrosoft.com; s=selector2-Synaptics-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Gr933eifnr2TpHN8IVdO6xIseG0WakdC3w2T5dMzTFo=;
 b=iSXI+GIf8iVvcglAdf/Pf0Ypa7zdGoBv5vBdpYAMmtpEmjbtH0+r8znNvcD0asKwt+nX7yQVDrZNek0CmOfN9YcpPQ/0j19+3qZVthczGIrkXpnR6sXV8puwozOFDDqXzJZtv5DXRq7j4sVSmnHl+6o7ItrKB0LxFWxdw4cx0ag=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=synaptics.com;
Received: from DM6PR03MB5196.namprd03.prod.outlook.com (2603:10b6:5:24a::19)
 by CH0PR03MB6113.namprd03.prod.outlook.com (2603:10b6:610:b8::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5769.16; Sun, 30 Oct
 2022 17:19:44 +0000
Received: from DM6PR03MB5196.namprd03.prod.outlook.com
 ([fe80::a132:66d9:ed0f:e5c1]) by DM6PR03MB5196.namprd03.prod.outlook.com
 ([fe80::a132:66d9:ed0f:e5c1%6]) with mapi id 15.20.5769.019; Sun, 30 Oct 2022
 17:19:44 +0000
From: Hsia-Jun Li <randy.li@synaptics.com>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH v2 2/2] media: docs: Add Synpatics tile modifiers
Date: Mon, 31 Oct 2022 01:18:07 +0800
Message-Id: <20221030171807.55837-3-randy.li@synaptics.com>
X-Mailer: git-send-email 2.37.3
In-Reply-To: <20221030171807.55837-1-randy.li@synaptics.com>
References: <20221030171807.55837-1-randy.li@synaptics.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: BYAPR05CA0010.namprd05.prod.outlook.com
 (2603:10b6:a03:c0::23) To DM6PR03MB5196.namprd03.prod.outlook.com
 (2603:10b6:5:24a::19)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM6PR03MB5196:EE_|CH0PR03MB6113:EE_
X-MS-Office365-Filtering-Correlation-Id: e04e6ce0-e267-4ee3-e85f-08daba9af014
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: oAKqHbQ52D4xvBjJ7CmnByI9x4+lAy8g55gKOzPavrizpv9V5NkCu1aPa3rgiaPLCj6GfAbT18bomoVMsEBQypS9+rLwEsv5SN2RL2vI+M+IJj7i2RmqYsDarP28AywBTlSy+WqNDZHn77HPhSdPHLGnc7LY/h8oKOWiZk7EQqqEPcEa7wblcgXc5m3Uz3zlGrlQ/AkfxDId9C0G57vHxG0maBQZ0QIFVQA+ECXnWcHd/s7qVvuNRizIwttNYavrf9HaLXCzwEZzPB+mpLX9mfbYiGwu1jcW7QXNV7WxJg0+Bk3M5Rb6GY8m/H7wKxNB33FkubFEy9K40JVzRfS147zL9OILh3AGd4uJ2Ufve5lrDPLLYk0Sys3hNOr1pTSvGqkPTPAmJ65zMGW7tDERwndvKru85A8IKGk70+aguKC/q7xI/enKovmaE8zQ8AXJBH+IhbnUqie0Ay1aCKgJUIGsAindZyr4TaCXHBCmNqN4siZi14PUn2UuSVH3PyU4SmYNF5v4S2P9eQsSTrLlwhF6G3TZmW6ovg7sg/DMB14UaV4ami19x5v+Wbuo+4im43jucRt8r49FYk87TOTZ3spt0EPnwoDwMiB0HtwLpP9wVX1uVVAgCFSE9sGjgZN8gHyxiRXP6NGItihyW8eh9ChZUMmjNx1d6fqjm+Bc74x7GPIiiiynZwB1BBJYpMw7wm+IE/JVp8L3PsZRc0+jL/n4lLjPGKjKSCsyg0hby8v0ISM0vPvZta/X3evZE/Q4
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM6PR03MB5196.namprd03.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230022)(376002)(39860400002)(366004)(346002)(136003)(396003)(451199015)(38350700002)(38100700002)(36756003)(8676002)(83380400001)(66946007)(66556008)(4326008)(66476007)(316002)(2906002)(41300700001)(86362001)(2616005)(6916009)(5660300002)(7416002)(8936002)(186003)(1076003)(6486002)(478600001)(6512007)(26005)(52116002)(6506007)(6666004);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?gVEt4Rnk4hGRDg0RE1+hHOBWfwb7nqsWMMtNOHjA8rqnE6pUnT+1m7m8k2pb?=
 =?us-ascii?Q?0rMI45vbt/Ug6CQ2aAXHy1HTUD0On8Me1FaYKuGuwGxRQqsK1hvPg3rmSLjU?=
 =?us-ascii?Q?Ecd2mCcZdINXzqSmjAqoVmQmUm8d9vuxwuezTTWvvQROOGbnljF9+LEW1YeE?=
 =?us-ascii?Q?dbv2usRficgRepJ98GTAEsyVahUXL/WxT58MhaJ21k7FiOixYDZaZM2zFhIs?=
 =?us-ascii?Q?+ts6nZE1SM7pRmJczxoLpKn+AWTu7HWgq9MNBZ5ycrI2NNNZArShRFCszqK6?=
 =?us-ascii?Q?jXGh3abtLAJHhJ7WYPaVFtHB3dxoO9D8rubWqVl70pnZyszAeuelBYd4Jbfp?=
 =?us-ascii?Q?KDHS7lh2JkBy6bLgnglTe3hM6SrzVKBwMoofE8ATdk21sYTy8KW5Voi1tJmI?=
 =?us-ascii?Q?vluoBIwBBuaQkd2pwYz7WM7ZP6EBYn5/OXR/7Eu44ykSEuZJX5er31TMaN12?=
 =?us-ascii?Q?kBC3RHTb5iPPehu1C+ZNrV3c3gkxe08QxbJEaH+tb/sQfBA1olklDI0EBrXe?=
 =?us-ascii?Q?ofAZ6Qx9XyCPbdgcSmIsMFeNipNvhhGu/Q2xE6xI+qEbFzFERsPzfxbWgTfr?=
 =?us-ascii?Q?rAklObgNTMqoYFOg6X34owdahXhc121NHXI2bC8fScPtlLI8NUonHNZVl0yo?=
 =?us-ascii?Q?hEcKftJ+wVUGP6Ir6m/oizW0/sBLbvWMDXC8O4Oe954MtoIQXpmQyYwLUOLH?=
 =?us-ascii?Q?qa8/C7upRVySLWtwHbiakFVIDpeU2xr6eat1UeI2fCW8Ziq8q71RzD3+BV39?=
 =?us-ascii?Q?J0Lp6jOoiE3XCfCFl2Qtu3HJrhFM/UJcEnBwVhlvPxY2w3Whs+WnpDqzuET/?=
 =?us-ascii?Q?UfFWKXtXUSU7Gcd9lj2KmjDRRH9lXgIohrvcRT8gtP81Zta4gsRS4GGmjjhg?=
 =?us-ascii?Q?00p2+vHyNiQfWDarjA9VC0feEPUuTTPu7LMcrw+zUF9PqPhGNxr26WTrPwJt?=
 =?us-ascii?Q?tBYWA2K/yZMRygN/dZkO36SvZzx0Jm/2OBrk3JtYQuu3IFLbOwcgXPQeLzvr?=
 =?us-ascii?Q?JkW+jMYGnbvxL9t+uww4DYJDOO2xgdzKgBTlNllWL+V0fOoaMNktxslHs6Gq?=
 =?us-ascii?Q?ainZpWtE1ZXkGsNHGp7YhhXPK8AXIBqYEDFZrpz5bNszxQHmqh7xVETYtWnY?=
 =?us-ascii?Q?7KmwrWv4ZgeGM2dfP98vCxP6cjigLaazgzErQCqjD2f4NDjI6+nYmrFaHRde?=
 =?us-ascii?Q?j9pPsJpcnmhmIJzSotJ7Zmoaydycs2bXCGM6CgoQKTrLuyjGMEu4wPrswWQI?=
 =?us-ascii?Q?wTYTR/aZFHjz7QrQ10Xm8mjnjEUtvS5wNz/e7Ayhwj+n+URnJTKYOo+Zj5ve?=
 =?us-ascii?Q?MaxFRjF/8KXaM01sJuKG3LeruVZUF6rySotFN3oEwbnA0Kj9BbaVpxX95iEk?=
 =?us-ascii?Q?x5EjIZsQizQDg/Hfrlow7ICqDyrYXswyNVzcd+ZDAhsv2//UkxtdMhbzKiIe?=
 =?us-ascii?Q?7dliSCGDTg9/ii5IQTpsNYPUKXHU3Iup6+gXj3wxfzqtthFIvogvNisxvVdA?=
 =?us-ascii?Q?cXL71bfwDr0qlfHDn8elMomkexVOaeC6TPCDd2m1YrBgBH56t4vE+UarhItE?=
 =?us-ascii?Q?EFgjciyTlQDCZVLKJH0+Ntf8kET6gOqvI54m4XOh?=
X-OriginatorOrg: synaptics.com
X-MS-Exchange-CrossTenant-Network-Message-Id: e04e6ce0-e267-4ee3-e85f-08daba9af014
X-MS-Exchange-CrossTenant-AuthSource: DM6PR03MB5196.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 Oct 2022 17:19:44.5716 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335d1fbc-2124-4173-9863-17e7051a2a0e
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: eqM+jJzXE3fI+SiFAnEnYC4xInLeTJcGZ34/DoRLjdKjUMQHCBfkhrwaOU/wI0VsV9KJ/7/CgIT1zBq9w7O9HQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH0PR03MB6113
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
Cc: linux-arm-kernel@lists.infradead.org, nicolas@ndufresne.ca,
 tfiga@chromium.org, laurent.pinchart@ideasonboard.com, tzimmermann@suse.de,
 sebastian.hesselbarth@gmail.com, airlied@linux.ie,
 Randy Li <ayaka@soulik.info>, linux-kernel@vger.kernel.org,
 sakari.ailus@linux.intel.com, helen.koike@collabora.com,
 ezequiel@vanguardiasur.com.ar, ribalda@chromium.org, hverkuil-cisco@xs4all.nl,
 mchehab@kernel.org, jszhang@kernel.org, linux-media@vger.kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: Randy Li <ayaka@soulik.info>

The pixel formats used in Synpatics video smart platform
are too many. It is impossible to store them in fourcc
namespace.

Signed-off-by: Randy Li <ayaka@soulik.info>
---
 .../media/v4l/pixfmt-synaptics.rst            | 80 +++++++++++++++++++
 .../userspace-api/media/v4l/pixfmt.rst        |  1 +
 2 files changed, 81 insertions(+)
 create mode 100644 Documentation/userspace-api/media/v4l/pixfmt-synaptics.rst

diff --git a/Documentation/userspace-api/media/v4l/pixfmt-synaptics.rst b/Documentation/userspace-api/media/v4l/pixfmt-synaptics.rst
new file mode 100644
index 000000000000..bc86737febb7
--- /dev/null
+++ b/Documentation/userspace-api/media/v4l/pixfmt-synaptics.rst
@@ -0,0 +1,80 @@
+.. SPDX-License-Identifier: GFDL-1.1-no-invariants-or-later
+
+.. _pixfmt-synaptics:
+
+***************************
+Synaptics Pixel Format Modifiers
+***************************
+
+The tiled pixel formats in synpatics video smart platform have
+many variants. Here just list the most widely pixel format modifiers
+here. The value here should be the same as the one defined in the
+``drm_fourcc.h`` file.
+
+.. tabularcolumns:: |p{6.6cm}|p{2.2cm}|p{8.5cm}|
+
+.. raw:: latex
+
+	\small
+
+.. _reserved-formats:
+
+.. flat-table:: Synpatics Image Format Modifiers
+	:header-rows:  1
+	:stub-columns: 0
+	:widths:	   3 1 4
+
+	* - Identifier
+	  - Code
+	  - Details
+	* .. _V4L2-PIX-FMT-MOD-SYNA-V4H1:
+
+	  - ``V4L2_PIX_FMT_MOD_SYNA_V4H1``
+	  - '0x0b00000000000101'
+	  - The plain uncompressed 8bits tile format. It sounds similar to
+	Intel's Y-tile. but it won't take any pixel from the next X direction
+	in a tile group. The line stride and image height must be aligned to
+	a multiple of 16. The height of chrominance plane would plus 8.
+	This modifier current would be in conjunction with ``V4L2_PIX_FMT_NV12``
+	or ``V4L2_PIX_FMT_NV12M``.
+	* .. _V4L2-PIX-FMT-MOD-SYNA-V4H3P8:
+
+	  - ``V4L2_PIX_FMT_MOD_SYNA_V4H3P8``
+	  - '0x0b00000000080301'
+	  - The plain uncompressed 10bits tile format. It stores pixel in 2D
+	3x4 tiles with a 8bits padding to each of tiles. Then tile is in a
+	128 bytes cache line. This modifier would be in conjunction with
+	``V4L2_PIX_FMT_NV15``.
+	* .. _V4L2-PIX-FMT-MOD-SYNA-V4H1-64L4C:
+
+	  - ``V4L2_PIX_FMT_MOD_SYNA_V4H1_64L4C``
+	  - '0x0b00000026010101'
+	  - Compressed ``V4L2_PIX_FMT_MOD_SYNA_V4H1``. It stores 64x4 pixels
+	in 1x4 tiles. Each plane would request a meta plane (MTR plane) for
+	decompression. A MTR plane would have a 32 bytes parameters set.
+	* .. _V4L2-PIX-FMT-MOD-SYNA-V4H3P8-64L4C:
+
+	  - ``V4L2_PIX_FMT_MOD_SYNA_V4H3P8_64L4C``
+	  - '0x0b00000026090301'
+	  - Compressed ``V4L2_PIX_FMT_MOD_SYNA_V4H3``. It stores 64x4 pixels
+	in tiles. Each plane would request a meta plane (MTR plane) for
+	decompression. A MTR plane would have a 32 bytes parameters set.
+
+	* .. _V4L2-PIX-FMT-MOD-SYNA-V4H1-128L128C:
+
+	  - ``V4L2_PIX_FMT_MOD_SYNA_V4H1_128L128C``
+	  - '0x0b00000077010101'
+	  - Compressed ``V4L2_PIX_FMT_MOD_SYNA_V4H1``. It stores 128x128 pixels
+	in 1x4 tiles. Each plane would request a meta plane (MTR plane) for
+	decompression. A MTR plane would have a 32 bytes parameters set.
+	* .. _V4L2-PIX-FMT-MOD-SYNA-V4H3P8-128L128C:
+
+	  - ``V4L2_PIX_FMT_MOD_SYNA_V4H3P8_128L128C``
+	  - '0x0b00000077090301'
+	  - Compressed ``V4L2_PIX_FMT_MOD_SYNA_V4H3``. It stores 128x128 pixels
+	in tiles. Each plane would request a meta plane (MTR plane) for
+	decompression. A MTR plane would have a 32 bytes parameters set.
+
+.. raw:: latex
+
+	\normalsize
diff --git a/Documentation/userspace-api/media/v4l/pixfmt.rst b/Documentation/userspace-api/media/v4l/pixfmt.rst
index 11dab4a90630..bfe4fdb52b6b 100644
--- a/Documentation/userspace-api/media/v4l/pixfmt.rst
+++ b/Documentation/userspace-api/media/v4l/pixfmt.rst
@@ -36,3 +36,4 @@ see also :ref:`VIDIOC_G_FBUF <VIDIOC_G_FBUF>`.)
     colorspaces
     colorspaces-defs
     colorspaces-details
+	pixfmt-synaptics 
-- 
2.17.1

