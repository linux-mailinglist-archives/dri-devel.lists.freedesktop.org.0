Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 51C43D3A865
	for <lists+dri-devel@lfdr.de>; Mon, 19 Jan 2026 13:17:27 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0386810E426;
	Mon, 19 Jan 2026 12:17:25 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="IPZpVwLJ";
	dkim=pass (2048-bit key; unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="h/VSeEXe";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com
 [205.220.168.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E4A8C10E426
 for <dri-devel@lists.freedesktop.org>; Mon, 19 Jan 2026 12:17:23 +0000 (UTC)
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 60JBDQcj1440867
 for <dri-devel@lists.freedesktop.org>; Mon, 19 Jan 2026 12:17:23 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 ODvajz5k+1YRXA6Nwokuzw/VMyW4/mE+fTtWqbu7rKg=; b=IPZpVwLJPuvCjP68
 EoXnbOX2bzoU+tuQhq/IuETuOxfpvrvxHmSzbWOd+1epPb4wsI9ioMpvcVHF+Gnc
 Y28i1c2a6s/MklK5LDwOThlPLmtp4ZB8S5C0NYqVb0IPq1OmEvnlI4dKgK9bCWaJ
 +wDybahgZcE4bCioOW5d8zAg88TuEQ7JCFj6L/uNEvNCYsdo59GVICPx9/FMnupk
 oeCmOU33uP2A37xAG8cyG+TZizK8MZpEyBrt3zcHmqxqEaeRuGPnCIkrjy0lJ1Ne
 NUDKH99bzopgButMyP8nllor5LJN4uNloTCHWKzDoWuivzUOwCAfkrjzbg2KY/6K
 Q+yGKA==
Received: from mail-qv1-f70.google.com (mail-qv1-f70.google.com
 [209.85.219.70])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4bskj3g5h1-1
 (version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
 for <dri-devel@lists.freedesktop.org>; Mon, 19 Jan 2026 12:17:23 +0000 (GMT)
Received: by mail-qv1-f70.google.com with SMTP id
 6a1803df08f44-88a2d8b7ea5so47432956d6.0
 for <dri-devel@lists.freedesktop.org>; Mon, 19 Jan 2026 04:17:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oss.qualcomm.com; s=google; t=1768825042; x=1769429842;
 darn=lists.freedesktop.org; 
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:from:to:cc:subject:date:message-id
 :reply-to; bh=ODvajz5k+1YRXA6Nwokuzw/VMyW4/mE+fTtWqbu7rKg=;
 b=h/VSeEXesVgut1hTdyUPMpRYP0NRJNj4wiwkO9N1NDFrWSBLLxN637hSlVqDegQ/Vd
 NW5moKIYH3x3pUOkHRJIGCmKSsaR//JK8QGa46q+C6N23Yg4tVEyzXI+Zk1GD8rVZF2q
 nEfdrx8sunq9HqvQXQDnfGfMcy54HzmW6PnYc6A/mNUtglKNKYm1HxkyOmTGD8bjW2Ts
 FTNBcULYEp2UoUqWFwtI/GxHZKSCfuOcbV7A08xH+MQzsg3GYL9kIBXb4T75bX5imX11
 oizXN8GZYKgFebpv1BYhI0KY1GUh6pl55djORRrpo5ZLSLdqvihGzD6PSRTVoc4gRFG9
 lAaA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1768825042; x=1769429842;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
 :cc:subject:date:message-id:reply-to;
 bh=ODvajz5k+1YRXA6Nwokuzw/VMyW4/mE+fTtWqbu7rKg=;
 b=YI+MWJiwfWcdlMexGogd2ii4FNghVu6T1m5jN0LHFlvaKuzAfhbq4Y2DX7kZT1uIsE
 4gpytCUOMEqtjqRpNeI70gVVhe2QJKfRAJunKl/U2FSM1364PJ3Crj4Ijfxts0Nmiz+V
 HuEk5kEX936IfCkKfezcR4NBPNtuJqNLrQJb2Jkp2GlWY/0eMmt8/cKCSrKZxpptZxbV
 dYl3nEuhzBGkvZogtlYDRPpouNUfP8DTajRx4bgiOAlxFFeLpaxpKv11LU6pnxpCLKNR
 4+0Rw4FWmG4R+/ixCVvfKY57KDB3N0uyjYhRkUr/2JkNdQLxFoNmdW4CkiLz/5FPLm09
 NfHA==
X-Forwarded-Encrypted: i=1;
 AJvYcCUYZo+P6ebnHnsaFFpi7FGNIoWyZ37hFezfslyDJ6dEfYY39g0pfJXOUHnAbp6JT+oI8m32YnvzJrU=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Ywu4CQQdm5UVmWfhrpqsFnURN/droXX5pvcTSoexaFbqcat2qAn
 7bsgFzswclLjZLIXIKj5MwOUTPovKTMcMwv2dMPvrU8sGRVBNk7paECG7gS6Bsy0jh0YZSd0OfP
 q+aTd06MtjLsoSSUXYE7IOxom8S4lEyHq2PlkuGUANIs5GWFxLeiUNhAGJWO18n3EqFCuxkM=
X-Gm-Gg: AZuq6aIRazZCrFkds/muPApzd0/6lWg5d0GcfyD4kDEJ9NNEdsp97Lw7bDgSCWd2dos
 BPtoNKq0n5XnzmwUoAWdChi/2H7Kfw/HJenKXCi4x/ylsWx1+IZGmIOzUWOu2IarlQYf6iUp5eC
 OTz80tBLj/nvzK/+jk/he4s0TWE3TKBIH5ZfUsrgg6ZPTLnP4FiE8cBR5DZ8HBQO2XBDYdDNnAe
 L4eRDCZuWKyFK+cjKL9QC5W/zB2M6tWMXIeDU4aZ4q6iOpnzYWxDrIoTS/1lfnnLdanXZYdXg33
 6V+LNJW5S3s5JpnuL2C57f2plNy3LVGgL47r2iV3QLZ7qD6kplQkeMEx3gcdXOFd6lr9NROz2yQ
 lEjD434pHi8/+96m9G0t27dNlQFa255YZtDDTu8+iruWAkCCRJRRsQLhjmxgzeGSRTLKI2jG7m2
 PW2c/bzio0I4+w6P+KWOxaD+M=
X-Received: by 2002:a05:6214:629:b0:88a:3113:3abf with SMTP id
 6a1803df08f44-8942dd8e7c8mr153078856d6.52.1768825042382; 
 Mon, 19 Jan 2026 04:17:22 -0800 (PST)
X-Received: by 2002:a05:6214:629:b0:88a:3113:3abf with SMTP id
 6a1803df08f44-8942dd8e7c8mr153078406d6.52.1768825041762; 
 Mon, 19 Jan 2026 04:17:21 -0800 (PST)
Received: from umbar.lan
 (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi.
 [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
 by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-59baf3a17b9sm3274641e87.92.2026.01.19.04.17.19
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 19 Jan 2026 04:17:20 -0800 (PST)
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Date: Mon, 19 Jan 2026 14:16:39 +0200
Subject: [PATCH v4 3/4] drm/msm/dpu: program correct register for UBWC
 config on DPU 8.x+
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260119-msm-ubwc-fixes-v4-3-0987acc0427f@oss.qualcomm.com>
References: <20260119-msm-ubwc-fixes-v4-0-0987acc0427f@oss.qualcomm.com>
In-Reply-To: <20260119-msm-ubwc-fixes-v4-0-0987acc0427f@oss.qualcomm.com>
To: Rob Clark <robin.clark@oss.qualcomm.com>,
 Dmitry Baryshkov <lumag@kernel.org>,
 Abhinav Kumar <abhinav.kumar@linux.dev>,
 Jessica Zhang <jesszhan0024@gmail.com>, Sean Paul <sean@poorly.run>,
 Marijn Suijten <marijn.suijten@somainline.org>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
 Konrad Dybcio <konradybcio@kernel.org>, Vinod Koul <vkoul@kernel.org>,
 Stephan Gerhold <stephan.gerhold@linaro.org>
Cc: linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
 freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 Val Packett <val@packett.cool>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=openpgp-sha256; l=3623;
 i=dmitry.baryshkov@oss.qualcomm.com; h=from:subject:message-id;
 bh=j7ALa2ZclhoGMQnJoj7aJ1Do0/fMTZqp4zi/tvC4Yrs=;
 b=owGbwMvMwMXYbdNlx6SpcZXxtFoSQ2aewum/G+1ffRMqUL0xI39LiBqH4eGkfwYP4uNeMlc7/
 S5hLmHoZDRmYWDkYpAVU2TxKWiZGrMpOezDjqn1MINYmUCmMHBxCsBEumvY//C9Wblebvp1pYT4
 f/e736Zn70xWNo+XX//xTPn9j+902Riu1Sh1PjXZKhafFfiq66f3AgmX3aqLbfqv/90pNmnOgwL
 3z9ZCoUJNqqF1LE38ebs6pBwnMTcfMJHWfuC/hWnJEr3sG5PNdXgcs8vdS7fE1cm2bKu2m744/X
 +HZMceuU7PNLV3U4JfTTRV4zSMOct1pOp148FjgR1Nqwtta7bsfd7CydyfOlt/26942WfT/jNmH
 +X1Wvbh8etzXPus1FwuTrV4N52DIXiexss3leUCOp/F9umznX9jWLw2uu9kdY7pgRnrjhg9j757
 RuhPrV+hZL6qs9O7C/oBr5u5XvcfEFkc+db9o5SEfkU9AA==
X-Developer-Key: i=dmitry.baryshkov@oss.qualcomm.com; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A
X-Authority-Analysis: v=2.4 cv=ds7Wylg4 c=1 sm=1 tr=0 ts=696e20d3 cx=c_pps
 a=oc9J++0uMp73DTRD5QyR2A==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=vUbySO9Y5rIA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=EUspDBNiAAAA:8 a=BEO5sv_cWZf0Vc4k7EUA:9 a=QEXdDO2ut3YA:10
 a=iYH6xdkBrDN1Jqds4HTS:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMTE5MDEwMiBTYWx0ZWRfX/1XmBwsxvWh1
 cKJVFGG3kAwMntW6B5Ihv9LSveA2NldYvt9+KweT+DxW96HJXyqOMRqT4SU1YgtJ61519VbYm0J
 F+usw4rjHEB9o0y+r0UMsQGmWA8bbmNUbbvuoCGnKbpMfV/QprLy+2m8v3lMSwnbTkgzAM2ZLzz
 04BN+sOCL5ReWM+zIA/CkIM3pup6DEeSLBXQkTgb3KBGcd8o7JcKQK9RMkQUl9H0iO7fVBlvDxX
 HJnLu9jguwRnbGm1Td9ucbxhVvZ4EFRhY8ZN5F+OKTkwztWGUDDKFi3MfNHCkE+eFYznxoCrsjm
 mKr9QM/HO8N95KhDYTh4FEPsyVb6u4ZjPulgrjMp7NvbgNUuRIDyw8WYteTQF0Ylm3/V+NpwxEu
 kVgpKKcj9jO/Pab7bUC0i7nYMdtH41/uV9UMaJjIM1HqC4IMkqkZC26EO7J4qtip7ZkopDeq840
 lPF6s/Cvo+DiAiQovgQ==
X-Proofpoint-ORIG-GUID: 4w2L_GAP2HIVMouDM2njSo2dc95fsGcu
X-Proofpoint-GUID: 4w2L_GAP2HIVMouDM2njSo2dc95fsGcu
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2026-01-19_02,2026-01-19_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 impostorscore=0 phishscore=0 priorityscore=1501 spamscore=0
 clxscore=1015 adultscore=0 malwarescore=0 lowpriorityscore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2601150000 definitions=main-2601190102
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

Since DPU 8.0 there is a separate register for the second rectangle,
which needs to be programmed with the UBWC config if multirect is being
used. Write pipe's UBWC configuration to the correct register.

Fixes: 100d7ef6995d ("drm/msm/dpu: add support for SM8450")
Tested-by: Val Packett <val@packett.cool> # x1e80100-dell-latitude-7455
Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
---
 drivers/gpu/drm/msm/disp/dpu1/dpu_hw_sspp.c | 25 +++++++++++++++++++------
 1 file changed, 19 insertions(+), 6 deletions(-)

diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_sspp.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_sspp.c
index b66c4cb5760c..6ff4902fce08 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_sspp.c
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_sspp.c
@@ -72,6 +72,8 @@
 #define SSPP_EXCL_REC_XY_REC1              0x188
 #define SSPP_EXCL_REC_SIZE                 0x1B4
 #define SSPP_EXCL_REC_XY                   0x1B8
+#define SSPP_UBWC_STATIC_CTRL_REC1         0x1c0
+#define SSPP_UBWC_ERROR_STATUS_REC1        0x1c8
 #define SSPP_CLK_CTRL                      0x330
 
 /* SSPP_SRC_OP_MODE & OP_MODE_REC1 */
@@ -215,7 +217,7 @@ static void dpu_hw_sspp_setup_format(struct dpu_sw_pipe *pipe,
 	u32 chroma_samp, unpack, src_format;
 	u32 opmode = 0;
 	u32 fast_clear = 0;
-	u32 op_mode_off, unpack_pat_off, format_off;
+	u32 op_mode_off, unpack_pat_off, format_off, ubwc_ctrl_off, ubwc_error_off;
 
 	if (!ctx || !fmt)
 		return;
@@ -225,10 +227,21 @@ static void dpu_hw_sspp_setup_format(struct dpu_sw_pipe *pipe,
 		op_mode_off = SSPP_SRC_OP_MODE;
 		unpack_pat_off = SSPP_SRC_UNPACK_PATTERN;
 		format_off = SSPP_SRC_FORMAT;
+		ubwc_ctrl_off = SSPP_UBWC_STATIC_CTRL;
+		ubwc_error_off = SSPP_UBWC_ERROR_STATUS;
 	} else {
 		op_mode_off = SSPP_SRC_OP_MODE_REC1;
 		unpack_pat_off = SSPP_SRC_UNPACK_PATTERN_REC1;
 		format_off = SSPP_SRC_FORMAT_REC1;
+
+		/* reg wasn't present before DPU 8.0 */
+		if (ctx->mdss_ver->core_major_ver >= 8) {
+			ubwc_ctrl_off = SSPP_UBWC_STATIC_CTRL_REC1;
+			ubwc_error_off = SSPP_UBWC_ERROR_STATUS_REC1;
+		} else {
+			ubwc_ctrl_off = SSPP_UBWC_STATIC_CTRL;
+			ubwc_error_off = SSPP_UBWC_ERROR_STATUS;
+		}
 	}
 
 	c = &ctx->hw;
@@ -281,24 +294,24 @@ static void dpu_hw_sspp_setup_format(struct dpu_sw_pipe *pipe,
 		switch (ctx->ubwc->ubwc_enc_version) {
 		case UBWC_1_0:
 			fast_clear = fmt->alpha_enable ? BIT(31) : 0;
-			DPU_REG_WRITE(c, SSPP_UBWC_STATIC_CTRL,
+			DPU_REG_WRITE(c, ubwc_ctrl_off,
 					fast_clear | (ctx->ubwc->ubwc_swizzle & 0x1) |
 					BIT(8) |
 					(hbb << 4));
 			break;
 		case UBWC_2_0:
 			fast_clear = fmt->alpha_enable ? BIT(31) : 0;
-			DPU_REG_WRITE(c, SSPP_UBWC_STATIC_CTRL,
+			DPU_REG_WRITE(c, ubwc_ctrl_off,
 					fast_clear | (ctx->ubwc->ubwc_swizzle) |
 					(hbb << 4));
 			break;
 		case UBWC_3_0:
-			DPU_REG_WRITE(c, SSPP_UBWC_STATIC_CTRL,
+			DPU_REG_WRITE(c, ubwc_ctrl_off,
 					BIT(30) | (ctx->ubwc->ubwc_swizzle) |
 					(hbb << 4));
 			break;
 		case UBWC_4_0:
-			DPU_REG_WRITE(c, SSPP_UBWC_STATIC_CTRL,
+			DPU_REG_WRITE(c, ubwc_ctrl_off,
 					MSM_FORMAT_IS_YUV(fmt) ? 0 : BIT(30));
 			break;
 		}
@@ -327,7 +340,7 @@ static void dpu_hw_sspp_setup_format(struct dpu_sw_pipe *pipe,
 	DPU_REG_WRITE(c, op_mode_off, opmode);
 
 	/* clear previous UBWC error */
-	DPU_REG_WRITE(c, SSPP_UBWC_ERROR_STATUS, BIT(31));
+	DPU_REG_WRITE(c, ubwc_error_off, BIT(31));
 }
 
 static void dpu_hw_sspp_setup_pe_config(struct dpu_hw_sspp *ctx,

-- 
2.47.3

