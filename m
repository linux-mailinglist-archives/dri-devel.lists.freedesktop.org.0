Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 2F2E3D3A120
	for <lists+dri-devel@lfdr.de>; Mon, 19 Jan 2026 09:14:54 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E086610E39A;
	Mon, 19 Jan 2026 08:14:51 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="jYOUEt0B";
	dkim=pass (2048-bit key; unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="gD3oybRR";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com
 [205.220.168.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EE8ED10E392
 for <dri-devel@lists.freedesktop.org>; Mon, 19 Jan 2026 08:14:46 +0000 (UTC)
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 60J85UOR4190774
 for <dri-devel@lists.freedesktop.org>; Mon, 19 Jan 2026 08:14:46 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 /NThq6KSUJeukEL9pMouMMZw++r4/wpGPMWQ27LsLSs=; b=jYOUEt0BYWuVrhzB
 fHkc6UXZhpeuA8O4ZWwd+20yM34hs5Fkdm4bMxJ2yEYjxSBz3YnlXAne8dUIvXqw
 yfwT5NW79P0QJMmUv4NMzYJdVEvJSVZauBX3QhP3a0fkKO95Gla6t7v1D3rijGrq
 UkULtt66gjyfu2Yt1/3uG2RyVPoe0/adIDZ1RDQHQL9YFmkDlonEwxqzt6iaB8ZA
 NM7JZvid1SCVP/BIazkURbpdNAai35ofENsedKhOSP97U2CQy/djp2N6x7vQ/ZSH
 VbS+ZiZTmck25sjJW+U2/8mclwZ556KuEZmJfJKRsGgHkK0cNLP6e3Hr885b1t2D
 vxwXKQ==
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com
 [209.85.222.200])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4br1cqcf10-1
 (version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
 for <dri-devel@lists.freedesktop.org>; Mon, 19 Jan 2026 08:14:46 +0000 (GMT)
Received: by mail-qk1-f200.google.com with SMTP id
 af79cd13be357-8c2a3a614b5so1005063985a.0
 for <dri-devel@lists.freedesktop.org>; Mon, 19 Jan 2026 00:14:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oss.qualcomm.com; s=google; t=1768810485; x=1769415285;
 darn=lists.freedesktop.org; 
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:from:to:cc:subject:date:message-id
 :reply-to; bh=/NThq6KSUJeukEL9pMouMMZw++r4/wpGPMWQ27LsLSs=;
 b=gD3oybRRWeG7jwL4QdDNuYXA4fFFmpBg4xfqCCM0wZPyCJBqul0GOCeoVMTJvHo1Cs
 7FCN+y96DRgz2OrFMbE55Tl4WU+kVKgZN/6xSQL67iBdpgb7urxYYIavIdRAbFBUe7i4
 yqaGfRlKn8ciiKST7IfuLPa0n7/2J3ZaKM0SEEZG2WmDCUFapGdeQy2I3YTMVRNAqmvJ
 ukgIjralgLA+VR/NKmZRFE3Qf/1Ps0uUNv/JL7td4uqByS/eBEEZeUnRMdaAb4WyWGWH
 vt0Q6XgPSivzxR58p2iJo8eCIDrbRnVsNAmdvMSUh3w5CFRjJkd5czPIi/wnjbFd9yet
 xgiQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1768810485; x=1769415285;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
 :cc:subject:date:message-id:reply-to;
 bh=/NThq6KSUJeukEL9pMouMMZw++r4/wpGPMWQ27LsLSs=;
 b=O3eaCUvD4VUe1o4nXfR+HpO/wxwhkzg9dNX+IFLplRMglbIANK83QZ/M+hAdVkd54L
 mnLWsu0/cL/Z85V25ZPu8oBpiM02wklRorgWr+HpigUCTwKif62508oUv0avnZKGpzt4
 oPK9IzPZHQI3ZgdHVHgBvXoxJpoqYYMtIncUT/u1ENJn2vmqmd+JTJW0jGJmFBd+fKCY
 WRnLOIVks0v4h18jSEmsiz20mN8R9yaVV7/F14Q/9rahXFd3UTaPBX7/iNnhZ4Op67Hq
 FwG9puU10/P/ExKOk8dbo2Haak+gWLofp8omfjo8YOGb2dbbBwRkh9G8lnRN2uHXiVkw
 oEOA==
X-Forwarded-Encrypted: i=1;
 AJvYcCX2oKQpx1x1EVQRzVnwSDzBJ+uvdvq8Mdd6oF7dTQK86rp1biWy4jHf4oUNRIKoX5jV8vM3QpupNnk=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YzA23l1VXXXAVyEppCBcH2e/hWrHzzLwlj2FrHyK8gwSZU9c28u
 65Yh98BXDvP89YHOblGwoNrU07IlkRHAgO6TVpPm8EOrr9nocvmBV2jlmW4L8ZRPusXTDzK3nYG
 RAq7NzZAZWcXWPcdQVVWCmO1+OBamsUGXAGXi/mrOMlj4JwqKITThiJey7gRnSgUDc2hdqPA=
X-Gm-Gg: AY/fxX62BctBth8yvEATbrQqjkjmH66/+YgQQ7jgfU2z8JHY1+gTS3OQME6RwTFGcnh
 oomSQjQsinJvwDrLDr6nDqLby24J2pygHgrCIKACAQPenHgFQI+Klr49elPR2NvDFBnUjUOgXsc
 XOAvMk8turNzaW2gie+ob8bMIXAOb6WBgPZipubYuteuW04L03UrXA+rDU23ltLB59DmAY2sHp8
 qkVbgIlijDbeKiaiUxz8vy4CD3B5wc1YKNNpbNKIsVTMQEP4x3EaYosZg8lhJwrwCI5YTsvQlV4
 i3G3iJoyHBwSv/ylO6DU4edjUDOcldMx/Is0UB4xz/w8PpERT95hCpslX1qUuHXx7KVQqLzdvqk
 rbGxb4hyijZ2kuccha3IGRgmmsYW4Uzdmq0HLn3TN+JyUIbA08UhGH3RHZdTRlHRM2g+b61NrcX
 TUteJ9HjCseYWSx0XpvPceEhU=
X-Received: by 2002:a05:620a:450b:b0:8c6:a587:377f with SMTP id
 af79cd13be357-8c6a58737e7mr1730834985a.36.1768810485424; 
 Mon, 19 Jan 2026 00:14:45 -0800 (PST)
X-Received: by 2002:a05:620a:450b:b0:8c6:a587:377f with SMTP id
 af79cd13be357-8c6a58737e7mr1730831685a.36.1768810484957; 
 Mon, 19 Jan 2026 00:14:44 -0800 (PST)
Received: from umbar.lan
 (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi.
 [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
 by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-59baf34d572sm3063845e87.24.2026.01.19.00.14.43
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 19 Jan 2026 00:14:44 -0800 (PST)
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Date: Mon, 19 Jan 2026 10:14:39 +0200
Subject: [PATCH v2 3/4] drm/msm/dpu: program correct register for UBWC
 config on DPU 8.x+
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260119-msm-ubwc-fixes-v2-3-e0c8c630fdd3@oss.qualcomm.com>
References: <20260119-msm-ubwc-fixes-v2-0-e0c8c630fdd3@oss.qualcomm.com>
In-Reply-To: <20260119-msm-ubwc-fixes-v2-0-e0c8c630fdd3@oss.qualcomm.com>
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
 freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=openpgp-sha256; l=2979;
 i=dmitry.baryshkov@oss.qualcomm.com; h=from:subject:message-id;
 bh=nlqM4pS5tehTmTBqQ+prrjj8JpfEcAuwIhsTGK973JQ=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBpbefvWPciqvjeXggjI9TRGgYthCdanfv4U7egB
 9Iij4swhm+JATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCaW3n7wAKCRCLPIo+Aiko
 1VJ1B/9YNyZABfqXcN2Uyf9qCt6ZDrbYTxPKKdlQWj1xVwUsjAVwyWSRdpOT+5ryjmRjqlf/kKt
 AG4lFvLBZALJSOitDQIAFXj3TjTKi26Mebk4IkVjAiYUYTxhwWwR0qWp/RxVgyP9V1A2luxImxr
 FUb1yNcGq22/w6TcmEFHp7bamENlqzo9jI7kzrPBoisVdY3a0bb6lL1bAT5MigvnAFck3ebnOpk
 SrG+az6YJ4ea9ovVfwpkWtT6Hdlnhqn9RTC9ahEuDEd65xTb6EY1ISBtle674JDXzQX8p93PCTB
 CTcqBHmL0nrmvIPtAwWDji43ZMCzExr1u1uzpwVbuKihq+dr
X-Developer-Key: i=dmitry.baryshkov@oss.qualcomm.com; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A
X-Proofpoint-GUID: V2e5VmpUe52HDvWZEnlc7uPTvKV1JF-Q
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMTE5MDA2NiBTYWx0ZWRfX+7ii0qseW18L
 c/jsiHK3G+CRjy3gZSs6gHwp90/BPvxf5TN+0g48drA2UGI9tq1rs7NWBypieg0fch7EL+ScM0i
 /RTnfTo2OGdDO72RPta2u/XKzeBgEuVcrROk3vBQ1SAPuQm5wr+DW8pYyIUNiaVD1ral8B6znag
 HC0fvu4Vh8PMZzea1s/NChMbdH3Dh61QgSzbmJr2ECOzfpfqfPjTdXSHjw51Zbv7HzJVZqzF2sS
 e/jEa33n3ethdnwcTB49whMpdWZw8qGGcQY3xkF4gwgepHI1uSg0B61pu+Fd9ZIYWemI6IGeuKP
 WiBToadDE4AhIVU8MkQVn7m4eGSQd0c9cXbRFXdEzUusHrtA7UH6hzpLz5NG95yYDyRZBYQ3HeB
 ubgO3XO+qMDCP6Vu6HJHFgjoGuEicq8cVWaZa1VqwiJ1ZOVoHZZfkaTkDrgHPKOt0dd2DxXbyt9
 L/Pu43emYWi65UgajPw==
X-Proofpoint-ORIG-GUID: V2e5VmpUe52HDvWZEnlc7uPTvKV1JF-Q
X-Authority-Analysis: v=2.4 cv=NfbrFmD4 c=1 sm=1 tr=0 ts=696de7f6 cx=c_pps
 a=hnmNkyzTK/kJ09Xio7VxxA==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=vUbySO9Y5rIA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=EUspDBNiAAAA:8 a=7tap2HhiP8zdS8EL3YEA:9 a=QEXdDO2ut3YA:10
 a=PEH46H7Ffwr30OY-TuGO:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2026-01-19_01,2026-01-19_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 bulkscore=0 spamscore=0 priorityscore=1501 malwarescore=0
 adultscore=0 suspectscore=0 impostorscore=0 lowpriorityscore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2601150000 definitions=main-2601190066
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
Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
---
 drivers/gpu/drm/msm/disp/dpu1/dpu_hw_sspp.c | 18 +++++++++++++-----
 1 file changed, 13 insertions(+), 5 deletions(-)

diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_sspp.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_sspp.c
index b66c4cb5760c..a99e33230514 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_sspp.c
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_sspp.c
@@ -72,6 +72,7 @@
 #define SSPP_EXCL_REC_XY_REC1              0x188
 #define SSPP_EXCL_REC_SIZE                 0x1B4
 #define SSPP_EXCL_REC_XY                   0x1B8
+#define SSPP_UBWC_STATIC_CTRL_REC1         0x1c0
 #define SSPP_CLK_CTRL                      0x330
 
 /* SSPP_SRC_OP_MODE & OP_MODE_REC1 */
@@ -215,7 +216,7 @@ static void dpu_hw_sspp_setup_format(struct dpu_sw_pipe *pipe,
 	u32 chroma_samp, unpack, src_format;
 	u32 opmode = 0;
 	u32 fast_clear = 0;
-	u32 op_mode_off, unpack_pat_off, format_off;
+	u32 op_mode_off, unpack_pat_off, format_off, ubwc_static_ctrl_off;
 
 	if (!ctx || !fmt)
 		return;
@@ -225,10 +226,17 @@ static void dpu_hw_sspp_setup_format(struct dpu_sw_pipe *pipe,
 		op_mode_off = SSPP_SRC_OP_MODE;
 		unpack_pat_off = SSPP_SRC_UNPACK_PATTERN;
 		format_off = SSPP_SRC_FORMAT;
+		ubwc_static_ctrl_off = SSPP_UBWC_STATIC_CTRL;
 	} else {
 		op_mode_off = SSPP_SRC_OP_MODE_REC1;
 		unpack_pat_off = SSPP_SRC_UNPACK_PATTERN_REC1;
 		format_off = SSPP_SRC_FORMAT_REC1;
+
+		/* reg wasn't present before DPU 8.0 */
+		if (ctx->mdss_ver->core_major_ver >= 8)
+			ubwc_static_ctrl_off = SSPP_UBWC_STATIC_CTRL_REC1;
+		else
+			ubwc_static_ctrl_off = SSPP_UBWC_STATIC_CTRL;
 	}
 
 	c = &ctx->hw;
@@ -281,24 +289,24 @@ static void dpu_hw_sspp_setup_format(struct dpu_sw_pipe *pipe,
 		switch (ctx->ubwc->ubwc_enc_version) {
 		case UBWC_1_0:
 			fast_clear = fmt->alpha_enable ? BIT(31) : 0;
-			DPU_REG_WRITE(c, SSPP_UBWC_STATIC_CTRL,
+			DPU_REG_WRITE(c, ubwc_static_ctrl_off,
 					fast_clear | (ctx->ubwc->ubwc_swizzle & 0x1) |
 					BIT(8) |
 					(hbb << 4));
 			break;
 		case UBWC_2_0:
 			fast_clear = fmt->alpha_enable ? BIT(31) : 0;
-			DPU_REG_WRITE(c, SSPP_UBWC_STATIC_CTRL,
+			DPU_REG_WRITE(c, ubwc_static_ctrl_off,
 					fast_clear | (ctx->ubwc->ubwc_swizzle) |
 					(hbb << 4));
 			break;
 		case UBWC_3_0:
-			DPU_REG_WRITE(c, SSPP_UBWC_STATIC_CTRL,
+			DPU_REG_WRITE(c, ubwc_static_ctrl_off,
 					BIT(30) | (ctx->ubwc->ubwc_swizzle) |
 					(hbb << 4));
 			break;
 		case UBWC_4_0:
-			DPU_REG_WRITE(c, SSPP_UBWC_STATIC_CTRL,
+			DPU_REG_WRITE(c, ubwc_static_ctrl_off,
 					MSM_FORMAT_IS_YUV(fmt) ? 0 : BIT(30));
 			break;
 		}

-- 
2.47.3

