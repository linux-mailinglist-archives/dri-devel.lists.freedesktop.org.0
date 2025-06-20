Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D44CCAE1DAF
	for <lists+dri-devel@lfdr.de>; Fri, 20 Jun 2025 16:43:30 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D231210EB79;
	Fri, 20 Jun 2025 14:43:26 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="b7ohHmMa";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com
 [205.220.180.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4259310EB81
 for <dri-devel@lists.freedesktop.org>; Fri, 20 Jun 2025 14:43:25 +0000 (UTC)
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 55KCgvQQ021215
 for <dri-devel@lists.freedesktop.org>; Fri, 20 Jun 2025 14:43:24 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:date:from:in-reply-to:message-id
 :mime-version:references:subject:to; s=qcppdkim1; bh=HRDy2PkiT+b
 Jp3nZw0dqpJsJDfHdIbBg3CgFYYVmwzQ=; b=b7ohHmMaBH6/bo1E7YjTnSPn0Fj
 zfq2f76Z0Z9cQwczCpob8P6YxOjr/sHaH3u7t2kCC+kA4yGG95VBl3zzj1D3zcmu
 JE4xhuHntjJtYVVSgNCZF4UEjKGrHnKZHPwAFy0CG2j8f1aNkZMm3YegvMXFfmJi
 75utTkipnb0Qy4sNwIJUJQDCiU1SR7lQDTo004Sy1VUHYANcH4Twd/BGkxolm/cr
 TVbsTcsV/HuX+yTFZ30zMkjtnwzGskFt7Xqz5fFgXsh2+RtIrlSKtXE4B7u7rR4Z
 Q/9vUZjfNpgJZDW3f0rixW4t/GoJEm4IE5CPXUslC1Qmh/VhONdlmRMhD0w==
Received: from mail-pf1-f200.google.com (mail-pf1-f200.google.com
 [209.85.210.200])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4791h9kk8p-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
 for <dri-devel@lists.freedesktop.org>; Fri, 20 Jun 2025 14:43:24 +0000 (GMT)
Received: by mail-pf1-f200.google.com with SMTP id
 d2e1a72fcca58-7425efba1a3so2159094b3a.0
 for <dri-devel@lists.freedesktop.org>; Fri, 20 Jun 2025 07:43:24 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1750430603; x=1751035403;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=HRDy2PkiT+bJp3nZw0dqpJsJDfHdIbBg3CgFYYVmwzQ=;
 b=IZuRMVNcUBrhAjNQKBI8DBvKs2rpuHtu16BG6nJfGlfQtKBoYdW/dPWV0rGZ7hfkx7
 iaMp2nFFH+FJtd+eveDqFYRgk0ze+R+6r4Y3+NtrERPWqK4x+gDv5DyWBlEtOvb5k63g
 GnH0sqL8eR7DQwS5Vho9BziDGPgMzhcejDZ4bfTczLGAVoDV1p9N6E4NdY2wX5qwY8c0
 GLVGZizG8Z45FGJE8giizXwdUn0eCZBb9/kvVdhQxgfU0TZMznWtjXg5L23dN3lsVsVj
 9T96GxAeAT9ixFy1O0Tc7DeFRaI6Gl/lEOBiVUlCYFr7SBL29wrSrLcd3nKuTBpCcqMv
 4p5A==
X-Gm-Message-State: AOJu0Yy9aQzfVqZ1SZeGRSDfiItClcHLYg2AjolMxU05RjgwFF/PbT/x
 Bb4tkklJ/35qcW1oKzIx+Th//2c3jwbZdwx2lbdIt2ccGUgoPaWrY4ZswB4KaMXhWWyCYIojfgN
 ndA//Sw8RHrW+FCtpYXF0hrXBI+nq5L9e0zBSOZk5hG156U3nCZ7vQEpe505dAf0zkTbK88qTfv
 OG/Qo=
X-Gm-Gg: ASbGncsqMhbl76+214cs9gxQdXabaVY0IcN4KVsGO94mI9YfkemtXrpbbVKGHfF1ktP
 NkTqblYs1jQKhjlwWl3Z9ngM/9rbDykqe/k9RcX61oZicV40y7Gj7u7TJH1C0Sc/r/ZYUMPB16a
 lMIX8Jajr42uKCuMq90RAeRkUPtzbGk+bwGBQ67/HFFwbXxGqxsniUh0GDwwa0ZRpmHdzr/zK53
 O3QJPxo8Ax7ITft1629SNBkfcDfNJ2jfXDA0tOfh4eMmLAcJci9tU9UNlCtO7NApMBM+p7wov1B
 P4nZcHAMKl0HQee8Mo1e9BzngGyjMRhd
X-Received: by 2002:a05:6a20:d48c:b0:220:247:29e5 with SMTP id
 adf61e73a8af0-2202915778dmr4964071637.4.1750430602940; 
 Fri, 20 Jun 2025 07:43:22 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFngm+bBwxJRzLg91zDCmzRMd4IZHrpLNM6IeTMuAbWKdDIwmWciPiCOoEVycUeYJx8shFpnA==
X-Received: by 2002:a05:6a20:d48c:b0:220:247:29e5 with SMTP id
 adf61e73a8af0-2202915778dmr4964024637.4.1750430602499; 
 Fri, 20 Jun 2025 07:43:22 -0700 (PDT)
Received: from localhost ([2601:1c0:5000:d5c:5b3e:de60:4fda:e7b1])
 by smtp.gmail.com with ESMTPSA id
 41be03b00d2f7-b31f12427d9sm1598224a12.48.2025.06.20.07.43.21
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 20 Jun 2025 07:43:21 -0700 (PDT)
From: Rob Clark <robin.clark@oss.qualcomm.com>
To: dri-devel@lists.freedesktop.org
Cc: linux-arm-msm@vger.kernel.org, freedreno@lists.freedesktop.org,
 Daniel Stone <daniels@collabora.com>,
 Rob Clark <robin.clark@oss.qualcomm.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 linux-kernel@vger.kernel.org (open list)
Subject: [PATCH 1/2] drm/fourcc: Add missing half-float formats
Date: Fri, 20 Jun 2025 07:43:08 -0700
Message-ID: <20250620144310.82590-2-robin.clark@oss.qualcomm.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250620144310.82590-1-robin.clark@oss.qualcomm.com>
References: <20250620144310.82590-1-robin.clark@oss.qualcomm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-ORIG-GUID: L6PqA-yecuWvT-Jfv7wznYCNb4LwrCWp
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNjIwMDEwNCBTYWx0ZWRfX6fC3++fn0W8y
 kXlnrdo3/OBA71LVLXACcNtS+jphZEBX2UWtdaijt1YxjnYt6yQ/d7xqJ/3T6G02EIBFdA8M9vl
 CzEDdRyW9UmqiCUOxVKtYUyZCiRAPLDQqyk6Cb28Ilv8yUHtvjxiwQ6NgwL/gDnnFsMN0CmeaIK
 d29Jl7ln6gCv3ejV5RzO4vk920dn89Nh5INpk/F4kZ0ldMxIpkk4l3j/kzmPX6MrWDTxj3wLLbG
 zl+c2nt/Fj+z7Z6L7ZYjBjW2MnXOfL51o6J2IOVsBr/iaosjqba3g+EbxPMjyURJHzeuJM9yIti
 FtO3m8IBKW0GmUedMfVu6yTcC/mB8Nv0nO5gBID5FJEo2LHyLz1nJEvbtnVco6JfocTPfoYzjMv
 PWwbolkA97Gnw+dpbBGHCmFuPhTLKDG7j6E8wPhu0BHQEat/W3Im/47FWjrbJYRnaYLTEOMP
X-Authority-Analysis: v=2.4 cv=UL/dHDfy c=1 sm=1 tr=0 ts=6855738c cx=c_pps
 a=mDZGXZTwRPZaeRUbqKGCBw==:117 a=xqWC_Br6kY4A:10 a=6IFa9wvqVegA:10
 a=EUspDBNiAAAA:8 a=M_I3Rqd0q2e7SYdxXhEA:9 a=zc0IvFSfCIW2DFIPzwfm:22
X-Proofpoint-GUID: L6PqA-yecuWvT-Jfv7wznYCNb4LwrCWp
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-06-20_05,2025-06-20_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 mlxscore=0 clxscore=1015 suspectscore=0 priorityscore=1501 adultscore=0
 lowpriorityscore=0 bulkscore=0 spamscore=0 phishscore=0 mlxlogscore=999
 malwarescore=0 impostorscore=0 classifier=spam authscore=0 authtc=n/a authcc=
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

Not something that is likely to be scanned out, but GPUs usually support
half-float formats with 1, 2, or possibly 3 components, and it is useful
to be able to import/export them with a valid fourcc, and/or use gbm to
create them.

These correspond to PIPE_FORMAT_{R16,R16G16,R16G16B16}_FLOAT in mesa.

Signed-off-by: Rob Clark <robin.clark@oss.qualcomm.com>
---
 include/uapi/drm/drm_fourcc.h | 6 +++++-
 1 file changed, 5 insertions(+), 1 deletion(-)

diff --git a/include/uapi/drm/drm_fourcc.h b/include/uapi/drm/drm_fourcc.h
index e41a3cec6a9e..3560ca1ffb8b 100644
--- a/include/uapi/drm/drm_fourcc.h
+++ b/include/uapi/drm/drm_fourcc.h
@@ -218,7 +218,7 @@ extern "C" {
 #define DRM_FORMAT_ABGR16161616	fourcc_code('A', 'B', '4', '8') /* [63:0] A:B:G:R 16:16:16:16 little endian */
 
 /*
- * Floating point 64bpp RGB
+ * Half-Floating point - 16b/component
  * IEEE 754-2008 binary16 half-precision float
  * [15:0] sign:exponent:mantissa 1:5:10
  */
@@ -228,6 +228,10 @@ extern "C" {
 #define DRM_FORMAT_ARGB16161616F fourcc_code('A', 'R', '4', 'H') /* [63:0] A:R:G:B 16:16:16:16 little endian */
 #define DRM_FORMAT_ABGR16161616F fourcc_code('A', 'B', '4', 'H') /* [63:0] A:B:G:R 16:16:16:16 little endian */
 
+#define DRM_FORMAT_R16F          fourcc_code('R', ' ', ' ', 'H') /* [15:0] R 16 little endian */
+#define DRM_FORMAT_GR1616F       fourcc_code('G', 'R', ' ', 'H') /* [31:0] G:R 16:16 little endian */
+#define DRM_FORMAT_BGR161616F    fourcc_code('B', 'G', 'R', 'H') /* [47:0] B:G:R 16:16:16 little endian */
+
 /*
  * RGBA format with 10-bit components packed in 64-bit per pixel, with 6 bits
  * of unused padding per component:
-- 
2.49.0

