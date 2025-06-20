Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 9C0D2AE1DB2
	for <lists+dri-devel@lfdr.de>; Fri, 20 Jun 2025 16:43:33 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0744A10EB73;
	Fri, 20 Jun 2025 14:43:32 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="NCA1p54R";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com
 [205.220.180.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F210F10EB7E
 for <dri-devel@lists.freedesktop.org>; Fri, 20 Jun 2025 14:43:26 +0000 (UTC)
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 55K75VHa016711
 for <dri-devel@lists.freedesktop.org>; Fri, 20 Jun 2025 14:43:26 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:date:from:in-reply-to:message-id
 :mime-version:references:subject:to; s=qcppdkim1; bh=J+2lD+C9IWf
 fZ7fGhqdCKCWgMv52ErT3dj8LA8hqs/4=; b=NCA1p54Rd2ZCYrDO02fRdPJ2iGl
 IfVb7zMuZX7p50zl4CiuIno6CGD6xuRSScz6Bw5s+JQGFyS25QIZXVlIK6FMi41h
 lM0uxwQr9j1q8L0COi7Cp8WURrqQ2yuJZXXcoDn3Lo9rKVy6dMe3MbPqe9ROnA77
 hvpzs4nasF0Dne29rH9WCKDlfeDhKOku8Gy4OO8/rpzLLD4uFbd48UgLMI/w5GBK
 QLe4LvLkEMZqyw5kEun/FPE+RQyIoTmXt7N6GZ3OgnATlVqVzQw2FuL2Qt9CQS9W
 aTfNo+O6srT2ffCF+qUPKiLgbnNLZVxCU3RHeuCXc6uTogewTYIRQXWsLzg==
Received: from mail-pg1-f197.google.com (mail-pg1-f197.google.com
 [209.85.215.197])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4791cs3cry-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
 for <dri-devel@lists.freedesktop.org>; Fri, 20 Jun 2025 14:43:26 +0000 (GMT)
Received: by mail-pg1-f197.google.com with SMTP id
 41be03b00d2f7-b2fcbd76b61so2374822a12.3
 for <dri-devel@lists.freedesktop.org>; Fri, 20 Jun 2025 07:43:25 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1750430605; x=1751035405;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=J+2lD+C9IWffZ7fGhqdCKCWgMv52ErT3dj8LA8hqs/4=;
 b=FMi3aKCJ6ebTJA/dvu33t/O1AymaThZkrduWHq8dqsWqHAGrO26RpJay39eH31cX/o
 Evhg/FA6Gj0IJuZi2xB8WcJzWZTJAwBbSt/x1EOMk9XgE23CeJC28yeGxC79kcAq2AVz
 qx6DqgGhmFi6Q38DKHzT0V87y3TBh1J4t/AtRGi9c8+3mE3q35TGR24tMabyg4b6y0h+
 goYjvnhl7WZwaU6umcUDi6KE12brzUlupJ9VPh/hDgx1xxVb3A9w6M70guaapAGwyNyJ
 4W36hoYkWmM1PdV+7vc8CM/Swt4ZEmGYQZPHO+BHYOvA29lIjfYZE6oO0HdnlBMpEizk
 R/BQ==
X-Gm-Message-State: AOJu0YzTnnK75llfbBhLQSQ+sF1twzfpGiHiMPHnztpMeX/H2mH65phV
 znrqfR1Y2mxY/TLNKyIqt+QC6oc6rR7fIxOaM2jKC4uQZ3lgNonn2KDcWy2KrPsYIf4Jh6lp5tV
 jLFlBCfiTxZmOYD/t3qgow1NBv5WriQzpJzMrsk4AabwErHgbpK+ARA5QtoLpzX7KsZBQE/74EH
 JluMw=
X-Gm-Gg: ASbGncs39JiKE812pFa7Y4IC0vx1gS2hXgKODoJ7dutEP6MmQk1x6mxLjLDHrbzfl4V
 rCIl1N0HPuycJCbSceRg7K2JmmsP60ko2+7Sxz1g0+/ICyToPHWOJjsxyICHWA+HPnugFHsv5jP
 rHQrF8yla/L8sitcLk55JkHSz3FbNO7f8hPqZYl8ysYaWtb2widpGFcFOMFCLvhIlW1N1YKpXEi
 Q+7HBT6mXG5nOMNMJr90UJ7yFmutpESKdRJfwhDy5FH5uBMMt9CgIo+kG6DvJkPcDaCq1+PZRx8
 5TdI8NIY8fpDyP2dvE/TK2RXRkKbZ8Mp
X-Received: by 2002:a05:6a20:3d83:b0:1f5:9024:324f with SMTP id
 adf61e73a8af0-22026ecb493mr6302521637.31.1750430604715; 
 Fri, 20 Jun 2025 07:43:24 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHH4frWgXICqPFw0JBjaV+WPfDhCyw+89W/qX0OyG987B9ALxAgWvGk3pHM+gFofmw1YVoc3Q==
X-Received: by 2002:a05:6a20:3d83:b0:1f5:9024:324f with SMTP id
 adf61e73a8af0-22026ecb493mr6302481637.31.1750430604342; 
 Fri, 20 Jun 2025 07:43:24 -0700 (PDT)
Received: from localhost ([2601:1c0:5000:d5c:5b3e:de60:4fda:e7b1])
 by smtp.gmail.com with ESMTPSA id
 41be03b00d2f7-b31f118eebdsm1609718a12.6.2025.06.20.07.43.23
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 20 Jun 2025 07:43:23 -0700 (PDT)
From: Rob Clark <robin.clark@oss.qualcomm.com>
To: dri-devel@lists.freedesktop.org
Cc: linux-arm-msm@vger.kernel.org, freedreno@lists.freedesktop.org,
 Daniel Stone <daniels@collabora.com>,
 Rob Clark <robin.clark@oss.qualcomm.com>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 linux-kernel@vger.kernel.org (open list)
Subject: [PATCH 2/2] drm/fourcc: Add 32b float formats
Date: Fri, 20 Jun 2025 07:43:09 -0700
Message-ID: <20250620144310.82590-3-robin.clark@oss.qualcomm.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250620144310.82590-1-robin.clark@oss.qualcomm.com>
References: <20250620144310.82590-1-robin.clark@oss.qualcomm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-ORIG-GUID: z5SKhTlMeIrCcsrWvUWTVyoIBkOX4S2_
X-Authority-Analysis: v=2.4 cv=BoedwZX5 c=1 sm=1 tr=0 ts=6855738e cx=c_pps
 a=rz3CxIlbcmazkYymdCej/Q==:117 a=xqWC_Br6kY4A:10 a=6IFa9wvqVegA:10
 a=EUspDBNiAAAA:8 a=n6CFGpYek-_V9AMlogEA:9 a=bFCP_H2QrGi7Okbo017w:22
X-Proofpoint-GUID: z5SKhTlMeIrCcsrWvUWTVyoIBkOX4S2_
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNjIwMDEwNCBTYWx0ZWRfX5Qld8O0eV5JJ
 WWL+XrS4FFeoOmp2iO1T6W/0esxUgUg3DNcqaRTmCqC97IDRlByYc/0fGCdPv8YuvxfuYl8PQG/
 6QHpM37Cft8W7L/swQUFNKTfjQJDU4OEquGAGIw/VMMjKFv/YBtQTaWYfUPWavdPB63uVeCFE7q
 L5Jn/zGb/2LAGKQ6VeF8LPDCB8hvQ8hBMqI8gb3ruTcw3Ut6rmPbiHYOL7EMPlwQRN4run9SX3k
 y1PElVLu7VAFq1masX+uKFVBNY8JvM0GTY99b0bqjruKK6jO4q0KtGrtSfdZcfP+mfLOghdnWWY
 XnxRvWspYYPsPK5IpPNMIWAVeyHDKucYyDWka+26zLcDDncjr/9huXFq3dF4YF9+ayXiaIFg2a1
 RIE4oxLuUeLdWIW6gYZizoajRL0xIlJ/+ZkT21BOGBSZViCtrgby/XLQboBrDBwU1/zxtcxj
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-06-20_05,2025-06-20_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 mlxscore=0 adultscore=0 phishscore=0 lowpriorityscore=0
 mlxlogscore=965 bulkscore=0 malwarescore=0 priorityscore=1501 clxscore=1015
 spamscore=0 suspectscore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2505280000
 definitions=main-2506200104
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

Signed-off-by: Rob Clark <robin.clark@oss.qualcomm.com>
---
 include/uapi/drm/drm_fourcc.h | 10 ++++++++++
 1 file changed, 10 insertions(+)

diff --git a/include/uapi/drm/drm_fourcc.h b/include/uapi/drm/drm_fourcc.h
index 3560ca1ffb8b..abf47dfcedc3 100644
--- a/include/uapi/drm/drm_fourcc.h
+++ b/include/uapi/drm/drm_fourcc.h
@@ -232,6 +232,16 @@ extern "C" {
 #define DRM_FORMAT_GR1616F       fourcc_code('G', 'R', ' ', 'H') /* [31:0] G:R 16:16 little endian */
 #define DRM_FORMAT_BGR161616F    fourcc_code('B', 'G', 'R', 'H') /* [47:0] B:G:R 16:16:16 little endian */
 
+/*
+ * Floating point - 32b/component
+ * IEEE 754-2008 binary32 float
+ * [15:0] sign:exponent:mantissa 1:8:23
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

