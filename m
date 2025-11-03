Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 854A3C2CD62
	for <lists+dri-devel@lfdr.de>; Mon, 03 Nov 2025 16:43:52 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D9AD910E42C;
	Mon,  3 Nov 2025 15:43:49 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="d7kIV6RQ";
	dkim=pass (2048-bit key; unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="XBjtmBJ7";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com
 [205.220.168.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DDD1810E42C
 for <dri-devel@lists.freedesktop.org>; Mon,  3 Nov 2025 15:43:48 +0000 (UTC)
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 5A3CRb8o2269714
 for <dri-devel@lists.freedesktop.org>; Mon, 3 Nov 2025 15:43:48 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:message-id
 :mime-version:subject:to; s=qcppdkim1; bh=MLSUVL0011U+bl1QMn4/8R
 YN+a6NKJhjMZdbnPjm8I8=; b=d7kIV6RQuk2dJu82om2Hyg0nCJdmJFIbieZBex
 UcUexBkW1A1pHw1YLH1oEZCEYQmiZyG1tTg+W+EMJjVc7J5itpALy1cgKv8fWoXa
 /Mmua1p2EkDmlEkVw/K5y4lpc8m/DUv2CQ6+gZfLw/Nl2LNFQCcXFplnTfBTApQy
 VfRThU2RC1Q/eVkipHd4nJLeOdd/dRSRi/eL389i/JIpCwTnLeU93ebfb3/oKUVa
 cGBX2AACTL1F/lbp3MEy7RbKsWlFpNStdqW3a8fcbbzZtvwANsSFu5kEghvSuh+a
 AP17TfOC1ARXeGOMB/Y/Kyg8aAsXDoWU1uqv63YR0MQDB+EQ==
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com
 [209.85.222.199])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4a6pv79mmp-1
 (version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
 for <dri-devel@lists.freedesktop.org>; Mon, 03 Nov 2025 15:43:48 +0000 (GMT)
Received: by mail-qk1-f199.google.com with SMTP id
 af79cd13be357-89f7a8b9775so1324272885a.1
 for <dri-devel@lists.freedesktop.org>; Mon, 03 Nov 2025 07:43:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oss.qualcomm.com; s=google; t=1762184625; x=1762789425;
 darn=lists.freedesktop.org; 
 h=cc:to:message-id:content-transfer-encoding:mime-version:subject
 :date:from:from:to:cc:subject:date:message-id:reply-to;
 bh=MLSUVL0011U+bl1QMn4/8RYN+a6NKJhjMZdbnPjm8I8=;
 b=XBjtmBJ72zxquscCEP/KGIJXy0jhZuH50VuPHKr/mS42bcnoUpEOYK75XCVN+Xah8P
 DZ1OIzgizJFw+tH04lRG/M4WDfVkm1hJR8FKWE2ZxJMONt4YAIcE/Bq+OhjmTXVWtEMC
 3RO2fRIj/WTn7+ZfqW5D4X7EOhDDc3/GpwOIjLpjxXJ+slMSwLe+tLtGpV8f7rXonMdL
 dwxvDowFXDAFYF0U4xAKbWPKprCu/XyAuz8QuU/OdGDfa4V0Ov/D2oSebgH4KBKv00RM
 DD9idON8Nm/CqkZeK/sj6P7JGLROoP5xOI3K8rJvR465S0wk4XWeHNLfR9fCv6h6tWVa
 0xag==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1762184625; x=1762789425;
 h=cc:to:message-id:content-transfer-encoding:mime-version:subject
 :date:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=MLSUVL0011U+bl1QMn4/8RYN+a6NKJhjMZdbnPjm8I8=;
 b=XvmnEr0XRfKhJAkOCsz0FQi6tfdP672SlrTGCME11orc3vQ/ZboEn55w4FiupBQZ8Z
 F0k/F6Yg/3KUH7PayjZ1C0VU5Vf3Sg+6w+atjIiEbqc8CtDEHKS28LVFqw0678tCZyjP
 eE9oO7kMJzUKcU+fIlmefnT+4V3h4JVLEtODE7aK70YAcBjBi+/MblEOq9OAs5XenIU+
 hVqGhrpZs1X1zc6pqim789xYMZL2DicoX9+b0PWYf2pYVdhzC+pYJrDRRp9YbEYzy+UX
 DHG86ZEHeYJTKOqVdjsviqCbGbHLLqgvFnef2QNgXJoYaFWVl2RILa/2AbBHfjNGevdO
 rmKg==
X-Forwarded-Encrypted: i=1;
 AJvYcCVP1cNtHGfBakuJkp0x2BYTDp2JupOvPKsiA/SQcM4mRlqWXJM3f/HkZB/QIPPZghkTJaaiozqJtM0=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Ywy2L66V5va2btaqdNFxFMj7kCmyB5x4YBOJ7JHndSkrNjVLEzt
 I7RtKfgchnia3+XOOjYo0pg5Eu76JsKArJOOUaiI1ssGaHoUW1Ep2OiPeRq4TMhvMhm8kV2vKc5
 7octU9tRPs9jY/bZVAMcQvAuK24Qy+7sAAbFgKDFw/uZWeqamEcc/X9n9gBmlnV3TI0/QWQQ=
X-Gm-Gg: ASbGncuy+SPgGgStPOdTEaa+T9OujcDgmQUlxkdeb9nGeOd1t2nsbDoe8m0yW+tgcJk
 PrT56h2dtMRXVGaQj5w9gRBixV8x6ZjqU4j064KvD5FjlOJbrdy005ej5gl5+UmznQuCGV0ssau
 dlq5I/Pamuu4zSND1q0Jdqp5+sGTB/I8g76I/IzfvLcwtDXFoy0WeRjFUdV+08C65K/8nMUrNf5
 eGCGXtGxiUyRpN7XF5FYNyE93/LiPdBBEYtlsx5lMp9HpLuvjVQULCIA1cJoQ6Qd9WWK0B0JPa2
 m19155zEJZSpcU+c18gKihJfVqjMBan6mLPaBFDYTDUH9bQzDkhNdOc3cozCZ9htnoZ2I55/5b+
 Afx6E3Y+Fl3kL5sA49XTdim5FLVMf6m3LHn/Sj5L6fmPfRfyydR+XopDIbiExnFNvdGaKtAqc/t
 6vDJABumh/sUL5
X-Received: by 2002:a05:622a:244a:b0:4e8:a7d6:bbf8 with SMTP id
 d75a77b69052e-4ed310bd456mr153322821cf.75.1762184624702; 
 Mon, 03 Nov 2025 07:43:44 -0800 (PST)
X-Google-Smtp-Source: AGHT+IGx6fdpy9ffRuVsvhz8yNjpEytEyKHoZ4q3oHwfdF2Lj12GhBZH98nF9j0PD7DIHX03P4jxmw==
X-Received: by 2002:a05:622a:244a:b0:4e8:a7d6:bbf8 with SMTP id
 d75a77b69052e-4ed310bd456mr153322311cf.75.1762184624084; 
 Mon, 03 Nov 2025 07:43:44 -0800 (PST)
Received: from umbar.lan
 (2001-14ba-a0c3-3a00-264b-feff-fe8b-be8a.rev.dnainternet.fi.
 [2001:14ba:a0c3:3a00:264b:feff:fe8b:be8a])
 by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-5943445901csm9896e87.104.2025.11.03.07.43.43
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 03 Nov 2025 07:43:43 -0800 (PST)
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Date: Mon, 03 Nov 2025 17:43:39 +0200
Subject: [PATCH v2] drm/msm: fix allocation of dumb buffers for non-RGB formats
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251103-drm-msm-fix-nv12-v2-1-75103b64576e@oss.qualcomm.com>
X-B4-Tracking: v=1; b=H4sIAKrNCGkC/32NwQrCMBBEf6Xs2S3ZaEU9+R/SQ5psbMA0mtWgl
 P67sR/gZeDNMDMzCOfAAqdmhswlSEhTBb1pwI5mujIGVxm00h2R0uhyxCgRfXjjVEgjkVd8sFs
 aNEOt3TPXbJ289JXHIM+UP+tDoZ/7Z6wQEqrj3g122JmO/DmJtI+XudkUY1sF+mVZvvMpUU+3A
 AAA
X-Change-ID: 20251102-drm-msm-fix-nv12-11f0e8c31b2e
To: Rob Clark <robin.clark@oss.qualcomm.com>,
 Dmitry Baryshkov <lumag@kernel.org>,
 Abhinav Kumar <abhinav.kumar@linux.dev>,
 Jessica Zhang <jesszhan0024@gmail.com>, Sean Paul <sean@poorly.run>,
 Marijn Suijten <marijn.suijten@somainline.org>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Thomas Zimmermann <tzimmermann@suse.de>
Cc: linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
 freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=2345;
 i=dmitry.baryshkov@oss.qualcomm.com; h=from:subject:message-id;
 bh=eI5cBu6QQfK3tjsQDS+FvtnmilDLe0nXXkJB8PTH17U=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBpCM2vxYMRKRx5ca1WQ0ggB27XbRlV3JD/T9Vpx
 zk2DpptdJWJATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCaQjNrwAKCRCLPIo+Aiko
 1UX6B/wO+drRIoqx9TL/752F67KiRKU8cWu0rZlFvlMMTXZcBfAk5L+VM4ZQ9/jv0GQVE1AT3Gz
 B/nNq2btijArTstBZfeCr/BIaiUqC8JAENJLZ6u0Asl9piNg4FzFy4cVpLbs9xKCCijyoCHEZ/n
 xPPgbJ1J2qaHWNgXxONsRfWpZqZv4MlgM9JMSOQaxJ2SL+3hxf0s+pd1MT2XPRgyFIaVWEq0DWn
 6WpcHjXB1MqnL/7CIWrHqnYW326EiaeBrbBf/n8jNgS5T+F+hiH4F3XpXfx8762oQ6dDFl644QE
 XaaFFLmCEvkunyMKs1urQ7es0YTVxPbUPKrMSO8ZwzRnhuiv
X-Developer-Key: i=dmitry.baryshkov@oss.qualcomm.com; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A
X-Proofpoint-GUID: -hSUCjWX5exOAJ9WzqgOoioaP6y74_pF
X-Authority-Analysis: v=2.4 cv=A7dh/qWG c=1 sm=1 tr=0 ts=6908cdb4 cx=c_pps
 a=HLyN3IcIa5EE8TELMZ618Q==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=6UeiqGixMTsA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=KVldPKIrq6pl5aLy4YAA:9 a=QEXdDO2ut3YA:10
 a=bTQJ7kPSJx9SKPbeHEYW:22
X-Proofpoint-ORIG-GUID: -hSUCjWX5exOAJ9WzqgOoioaP6y74_pF
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMTAzMDE0MSBTYWx0ZWRfX0M0VgrBvbW/0
 Dinfqkefic2AANFpiQNk4QjY6GZRXuOTxtgYxWng++9kUMSJAVKAQFcy8eNYl9+2lNV7HAvKgtD
 /Q7sJ4GnIDbm/Na1qsYo2Czde9WmE2AfLof11U1ILSq4UPAUgSt1koS/AgsjAgD1HsfbANiMHC6
 cv4VaA/9Iumr8BJ3x/wVS+vN5q+Qwf5ptTB4ahxN060zKDvfUtR4VpqwpaDnNB3bf4V2whLvXqA
 aVN2gyv2H3DsBG8SF2DTrgGqXzYstBn2F9OfYF3zEuCAXg8R6Mq5uovNbyA95yo375pUKgHpDf6
 2/belhNJJszqtpLKByHxjlzls5Hli4X/YD0agpB0wHfrRPT2R2q2JBWzRQPI91Vn15foIdkAyiG
 7z9pcNWlioNDUwHOV2BrTxhX3b9Ing==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-11-03_03,2025-11-03_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 malwarescore=0 priorityscore=1501 bulkscore=0 lowpriorityscore=0
 clxscore=1015 impostorscore=0 spamscore=0 adultscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2510240001 definitions=main-2511030141
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

Several users (including IGT kms_getfb tests) allocate DUMB buffers for
YUV data. Commit 538fa012cbdb ("drm/msm: Compute dumb-buffer sizes with
drm_mode_size_dumb()") broke that usecase, since in those cases
drm_driver_color_mode_format() returns DRM_FORMAT_INVALID.

Handle the YUV usecase, aligning to 32-bit pixels.

Fixes: 538fa012cbdb ("drm/msm: Compute dumb-buffer sizes with drm_mode_size_dumb()")
Closes: https://lore.kernel.org/all/vptw5tquup34e3jen62znnw26qe76f3pys4lpsal5g3czwev6y@2q724ibos7by/
Reviewed-by: Thomas Zimmermann <tzimmermann@suse.de>
Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
---
Changes in v2:
- s/SZ_32/32/g (Thomas)
- Link to v1: https://lore.kernel.org/r/20251102-drm-msm-fix-nv12-v1-1-096dbcb4a51f@oss.qualcomm.com
---
 drivers/gpu/drm/msm/msm_gem.c | 17 ++++++++++-------
 1 file changed, 10 insertions(+), 7 deletions(-)

diff --git a/drivers/gpu/drm/msm/msm_gem.c b/drivers/gpu/drm/msm/msm_gem.c
index 435c0067c2641786ca7b4a42cca0ae7e7dda3451..017411a0bf4503f02b04d9aa9177958762e950e4 100644
--- a/drivers/gpu/drm/msm/msm_gem.c
+++ b/drivers/gpu/drm/msm/msm_gem.c
@@ -701,7 +701,6 @@ int msm_gem_dumb_create(struct drm_file *file, struct drm_device *dev,
 		struct drm_mode_create_dumb *args)
 {
 	u32 fourcc;
-	const struct drm_format_info *info;
 	u64 pitch_align;
 	int ret;
 
@@ -711,12 +710,16 @@ int msm_gem_dumb_create(struct drm_file *file, struct drm_device *dev,
 	 * Use the result as pitch alignment.
 	 */
 	fourcc = drm_driver_color_mode_format(dev, args->bpp);
-	if (fourcc == DRM_FORMAT_INVALID)
-		return -EINVAL;
-	info = drm_format_info(fourcc);
-	if (!info)
-		return -EINVAL;
-	pitch_align = drm_format_info_min_pitch(info, 0, SZ_32);
+	if (fourcc != DRM_FORMAT_INVALID) {
+		const struct drm_format_info *info;
+
+		info = drm_format_info(fourcc);
+		if (!info)
+			return -EINVAL;
+		pitch_align = drm_format_info_min_pitch(info, 0, 32);
+	} else {
+		pitch_align = round_up(args->width, 32) * DIV_ROUND_UP(args->bpp, SZ_8);
+	}
 	if (!pitch_align || pitch_align > U32_MAX)
 		return -EINVAL;
 	ret = drm_mode_size_dumb(dev, args, pitch_align, 0);

---
base-commit: 98bd8b16ae57e8f25c95d496fcde3dfdd8223d41
change-id: 20251102-drm-msm-fix-nv12-11f0e8c31b2e

Best regards,
-- 
With best wishes
Dmitry

