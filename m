Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D3486AE8B96
	for <lists+dri-devel@lfdr.de>; Wed, 25 Jun 2025 19:37:37 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 13A1E10E7B4;
	Wed, 25 Jun 2025 17:37:36 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="IAt/yoOI";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com
 [205.220.168.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 35CB810E7B2
 for <dri-devel@lists.freedesktop.org>; Wed, 25 Jun 2025 17:37:23 +0000 (UTC)
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 55PCbgH0021986
 for <dri-devel@lists.freedesktop.org>; Wed, 25 Jun 2025 17:37:23 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:date:from:in-reply-to:message-id
 :mime-version:references:subject:to; s=qcppdkim1; bh=ckmpcZmveJc
 msZUFuiT/RpgJEDPikgftzrJym6w4+0k=; b=IAt/yoOISlrjfvms2SYcBU3NWDJ
 ziIUjVKYkVfYJskuW83tRi/WBwd4BOTUvv9B3iO6QASPxxVA/h4fLzucz8umMLzr
 phZHnwum6YBph0oIbdwS0hNByekX4s3/J34qblAulrwFVjVpRRz/zCIoGN93n5vK
 v3vjnCvvFNxpMfnxapFG6z6F0cFZa2DmSscDvylOY2S4P1h1fSuuZheEdyLjk5Y+
 sIjFT5UUyEkiwKE30QwndOg8gAWIRJexl+eoMd3JMMoyGjDP8PHMuf5cZmd4Y3yM
 rFO8B1LE1mDjSGg1I/O3gNVfamlXubaUOL9jVkLBOAB+XarvrW1iZ6H0yRA==
Received: from mail-pg1-f197.google.com (mail-pg1-f197.google.com
 [209.85.215.197])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 47f4b40k57-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
 for <dri-devel@lists.freedesktop.org>; Wed, 25 Jun 2025 17:37:23 +0000 (GMT)
Received: by mail-pg1-f197.google.com with SMTP id
 41be03b00d2f7-b31f4a9f67cso94426a12.1
 for <dri-devel@lists.freedesktop.org>; Wed, 25 Jun 2025 10:37:23 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1750873042; x=1751477842;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=ckmpcZmveJcmsZUFuiT/RpgJEDPikgftzrJym6w4+0k=;
 b=s9a+0+crAXBJh98jXwPFZgXdKaLW+JpvItUdqTqRky4WzjVWBtk0NRThCsbyrS1Idt
 47g8C5loSsQbVqR9fhRWHVssAkikoOAxnvXi58byBzQa5izXLC9j0nymNs1iovnuBodp
 xhB10vmBq7G0pwhOmmKaWX82YNJ0gAZBgwQPGhyu+l4PGq/OmQbwJQPei1CIVtkBJEBB
 ShMvl6Z7BqONOxajLDgUaxaUguISmG4S73pJ2L4Kl303hg3HfOHARQPivlZBElqeQcfJ
 S0PW4NsIa6Tzc0+6wtmOblungesy3dk92nHJ5GzXmGTVks29lIiCwPHNjZARFZzAo1sE
 GU7Q==
X-Gm-Message-State: AOJu0YzH82d5/XcLcgJzJu1cUQBTChNXzckWDOCiIy9BbdXUsxU042yS
 A2k6rF5y+g/NOUToAyaxxo6fJfp7Tt8ZBIY5mkOLaKxhh3QSV/HFBGSX3bd5gM3a8hxLV1GrUtB
 xJl2hPw3Dp2g6zhK0m7HX/x5Vav91ywBDsnHKgSP3Jkge2DDwH3aBho3ZZsT/iiFZ/DVyukPSzL
 kIk6c=
X-Gm-Gg: ASbGncv8wgOZMOQ4T93H+MVQdnzveNgEbweKfscjIcnjpxT7oJ3JHFAEVs27PD4f7Kz
 Gv82qOmE3Ew6W6fBTjvyFjQHfHd1HQcFZ1HHAqBr3oyU75eDUxbLdWbWWDH3Hm/YMmgAhrOIAvR
 DYX1rv3kMltsmS/vXf89r5UXYgleFEq1WGDIuKa7fnonl60nExsjiOFUC91EYvcSbI3xKGxgW8s
 0km+rpUHuwCsdIM1pVvVNjyDZ8DKEhiDJu2cS9MLSszl0WeGLr4630BcbbTqpxDSCFN+tG6ZqTB
 X0PfIm9yWV5C08t1omKrG82J67wxf0th
X-Received: by 2002:a17:90b:3a05:b0:311:f684:d3cd with SMTP id
 98e67ed59e1d1-315f2623c5amr6932418a91.12.1750873042098; 
 Wed, 25 Jun 2025 10:37:22 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHisPZ8e1PdIMAqtxONK/SJTKlziax5CcCuFowOdaVXodfUQiW5C7P6F/abrBzQuGI6mBDiIw==
X-Received: by 2002:a17:90b:3a05:b0:311:f684:d3cd with SMTP id
 98e67ed59e1d1-315f2623c5amr6932377a91.12.1750873041680; 
 Wed, 25 Jun 2025 10:37:21 -0700 (PDT)
Received: from localhost ([2601:1c0:5000:d5c:5b3e:de60:4fda:e7b1])
 by smtp.gmail.com with ESMTPSA id
 98e67ed59e1d1-315f539e862sm2199928a91.16.2025.06.25.10.37.21
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 25 Jun 2025 10:37:21 -0700 (PDT)
From: Rob Clark <robin.clark@oss.qualcomm.com>
To: dri-devel@lists.freedesktop.org
Cc: freedreno@lists.freedesktop.org, linux-arm-msm@vger.kernel.org,
 Simona Vetter <simona@ffwll.ch>, Daniel Stone <daniels@collabora.com>,
 Rob Clark <robin.clark@oss.qualcomm.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>,
 linux-kernel@vger.kernel.org (open list)
Subject: [PATCH v2 2/2] drm/fourcc: Add 32b float formats
Date: Wed, 25 Jun 2025 10:37:11 -0700
Message-ID: <20250625173712.116446-3-robin.clark@oss.qualcomm.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250625173712.116446-1-robin.clark@oss.qualcomm.com>
References: <20250625173712.116446-1-robin.clark@oss.qualcomm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNjI1MDEzMSBTYWx0ZWRfX4h8sFrWdCjqH
 rVvc7qEhK1Q+gCBLzwiNprDS9x5NYyRdDM7Ar88vmKDT7P0HL3qen7ntBMrbtIi9rJcIMRTa2rI
 XzuXrieswixJ5pyQIVSj9PZ6sojytCeYLhKDN1EVl0RoeOJ+UMmDRN1nIA6OQRG7sGbX1WhOht1
 QgakeNQoFMXqbX2f54BdNb+gjbG6SnO8aWxjX6GvvIOt5r0lkxoyh8qx/fcfmvII4PbalVrDLoe
 4ylm27ojoWLgRHk2tUa+WRDjQyW9JUf23SzEPPDhInQEIHuqClBBphF2oOaSpVVIy9Kivd8oZtW
 aOzawrN+MvDhKRMGKZ142ZOhVJNLYIok1mUyBgciNQ2JY1fA8mUyNkovtKUH1xPq30CUZhHODDK
 NsUnBCQMduGetVJ8Bm7CJ3SwRn0XUDDK5+Iv0Ab0CvyTtjnkZgbC/hgw0b4ZqhlIneaBp2DD
X-Proofpoint-ORIG-GUID: qiW-U_dHM__Nmj-C1uOBPX6Qh8T8Bs2W
X-Proofpoint-GUID: qiW-U_dHM__Nmj-C1uOBPX6Qh8T8Bs2W
X-Authority-Analysis: v=2.4 cv=A8BsP7WG c=1 sm=1 tr=0 ts=685c33d3 cx=c_pps
 a=rz3CxIlbcmazkYymdCej/Q==:117 a=xqWC_Br6kY4A:10 a=6IFa9wvqVegA:10
 a=EUspDBNiAAAA:8 a=QX4gbG5DAAAA:8 a=n6CFGpYek-_V9AMlogEA:9
 a=bFCP_H2QrGi7Okbo017w:22 a=AbAUZ8qAyYyZVLSsDulk:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.7,FMLib:17.12.80.40
 definitions=2025-06-25_05,2025-06-25_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 mlxlogscore=999 malwarescore=0 spamscore=0 bulkscore=0
 phishscore=0 adultscore=0 impostorscore=0 suspectscore=0 mlxscore=0
 clxscore=1015 priorityscore=1501 classifier=spam authscore=0 authtc=n/a
 authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2505280000 definitions=main-2506250131
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Add 1, 2, 3, and 4 component 32b float formats, so that buffers with
these formats can be imported/exported with fourcc+modifier, and/or
created by gbm.

These correspond to PIPE_FORMAT_{R32,R32G32,R32G32B32,R32G32B32A32}_FLOAT
in mesa.

v2: Fix comment describing float32 layout [Sima]

Signed-off-by: Rob Clark <robin.clark@oss.qualcomm.com>
Acked-by: Simona Vetter <simona@ffwll.ch>
Acked-by: Daniel Stone <daniels@collabora.com>
---
 include/uapi/drm/drm_fourcc.h | 10 ++++++++++
 1 file changed, 10 insertions(+)

diff --git a/include/uapi/drm/drm_fourcc.h b/include/uapi/drm/drm_fourcc.h
index 3560ca1ffb8b..6a3f1b32cb30 100644
--- a/include/uapi/drm/drm_fourcc.h
+++ b/include/uapi/drm/drm_fourcc.h
@@ -232,6 +232,16 @@ extern "C" {
 #define DRM_FORMAT_GR1616F       fourcc_code('G', 'R', ' ', 'H') /* [31:0] G:R 16:16 little endian */
 #define DRM_FORMAT_BGR161616F    fourcc_code('B', 'G', 'R', 'H') /* [47:0] B:G:R 16:16:16 little endian */
 
+/*
+ * Floating point - 32b/component
+ * IEEE 754-2008 binary32 float
+ * [31:0] sign:exponent:mantissa 1:8:23
+ */
+#define DRM_FORMAT_R32F          fourcc_code('R', ' ', ' ', 'F') /* [31:0] R 32 little endian */
+#define DRM_FORMAT_GR3232F       fourcc_code('G', 'R', ' ', 'F') /* [63:0] R:G 32:32 little endian */
+#define DRM_FORMAT_BGR323232F    fourcc_code('B', 'G', 'R', 'F') /* [95:0] R:G:B 32:32:32 little endian */
+#define DRM_FORMAT_ABGR32323232F fourcc_code('A', 'B', '8', 'F') /* [127:0] R:G:B:A 32:32:32:32 little endian */
+
 /*
  * RGBA format with 10-bit components packed in 64-bit per pixel, with 6 bits
  * of unused padding per component:
-- 
2.49.0

