Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 75E13D3A868
	for <lists+dri-devel@lfdr.de>; Mon, 19 Jan 2026 13:17:31 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C2A0210E431;
	Mon, 19 Jan 2026 12:17:29 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="C7zxh3D5";
	dkim=pass (2048-bit key; unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="Sc2Kt5aO";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com
 [205.220.180.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 43DC910E431
 for <dri-devel@lists.freedesktop.org>; Mon, 19 Jan 2026 12:17:26 +0000 (UTC)
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 60J90h0Z227848
 for <dri-devel@lists.freedesktop.org>; Mon, 19 Jan 2026 12:17:25 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 1+R1NURe0aOQBp8d0tJX9/rPnT/UJh1DxdGIX1sR33s=; b=C7zxh3D5av3+lFSy
 TDVSFodXBe0LK+CdMRyvl+zIIZSy79R6llY5l4BiNEFbe/bJnLOukNGaQxj130xt
 9tymzsvPWCY+NVGZtW07cPhPfq+dklHbkGfKIWNjGDK7WkYvXD/+aE85/kKBXtmb
 hwtEkcyL1gaKRCH9KOV+64q5cl3sILjgGtV4+/a3Vxsjeyl1DGVHi5cZu6kaBEeb
 KfsucreD55oUBkp2U6T7kFQ0HQnipAdZaUTyJ7BVVR/73Lj5xnNDCuaxW/oFsd81
 tB69RpSQiTWOi1MnUAGZBTuuaeQbEvMg7ptXR1tIv2ZHfv7JH998pzkmsusAD1tU
 2z2kfg==
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com
 [209.85.222.198])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4bsgfr8vu5-1
 (version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
 for <dri-devel@lists.freedesktop.org>; Mon, 19 Jan 2026 12:17:25 +0000 (GMT)
Received: by mail-qk1-f198.google.com with SMTP id
 af79cd13be357-8c6a291e7faso491671985a.3
 for <dri-devel@lists.freedesktop.org>; Mon, 19 Jan 2026 04:17:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oss.qualcomm.com; s=google; t=1768825045; x=1769429845;
 darn=lists.freedesktop.org; 
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:from:to:cc:subject:date:message-id
 :reply-to; bh=1+R1NURe0aOQBp8d0tJX9/rPnT/UJh1DxdGIX1sR33s=;
 b=Sc2Kt5aOTg8xRcrnJP3NS8FHyQTc3GHzLQwEFYaXlXc2O/x4pxcd1Zk1mwAp864Kwa
 /JFrh7Kid7gK2ZkMamcbbMRBaWpfll2Y+HSvj9M9P+K0RfsFYt0JX/XeImiIcMvrobCQ
 NZOzSS+cMRaofT8+LLSlGgRBfOUnZv1RIsD0rmfAC/b04g0+oDkunz8zNDl3u40at0Gw
 15hErChsaMKQVzD5GtrIDTm+mWVgOTNVWN/nCgf1PsrnR4AGqSvdTMQBBH/cNM9pOKHI
 +sVC25ugF/A/UE0bOjQURLDmgf5jVsUpMlHW5wKZfmMfFoIbzLaOOjVIUPyhMs0Cjbkq
 P/SA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1768825045; x=1769429845;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
 :cc:subject:date:message-id:reply-to;
 bh=1+R1NURe0aOQBp8d0tJX9/rPnT/UJh1DxdGIX1sR33s=;
 b=up2hzrsAePFtiZsKp51pUmAq2rpeqSjTfCyuuL2bcqaoKK/LAQpaVuOxrhISEh0wt2
 SAh31zERF1Qz1dW+Bu0DedcrNQ4xbrfp7mRElklhJ4iNHl2kpB11TzqjJsgyQpWY/Ksc
 DJ9G72fB92DgRsCUyAHSyeTfLd0cD3BI8i5a03CwxxyrBLWbWE+O3iw6qir1D1vrWaMz
 P4Rc3ffqh1ccf11Y3Xax10ozechiyQ0chRZFJ40gc7sWNOxAUWwpBM5ODoTHwSAMjITG
 SSSkZb8MG0VenpMQDFp3WjEMOQg8xTA/eJNvAcTV/LV5xilEvNdGM35qcf4nlQpJ+1O3
 vmoA==
X-Forwarded-Encrypted: i=1;
 AJvYcCXz+t70OQaAk0SCqXac2BHIEeRGqMWVeoENorN/YT1/ilsiyW+4b0ZHJs2P7O32KZXYe23TFbJQixA=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yzh4TWWpOLSlV5vRpHoWOrNUcT4mfdW7DumlZIqFjti1JV0FkGh
 CBj/SgSZ9iiW2FBOca4j8d6lzbgXUBfJ95/u8T8VbhVhlYw/TlNGiRAyu0wROmUAOAYRWSsvdMZ
 2/s+u6dKdEoqknWiSmumhHIIqNFLHXwYEkqoKU1NRK23DpX1hO/YqfrSGPyXuk8XOUXjYq74=
X-Gm-Gg: AY/fxX4jI59Pj957R+sPu/1VWTVnSmHZYXnZ5X7ddAgRTgWRa8O5AxCZ1bm5jU9jN79
 9n4lw0UAYkYkHilL7Z9BSdY936P7PHPGwzksxB2zo0qNE6B75FDo/51PVd7dnIQ+yH1zYOP2gm7
 AYu/Ki/oLmTsp4bS75Q8dG4sHVXvEckr0k1J2xmefCzNey94lsSYZtLO+hxJ3QTit2yQ/HueG4c
 nLhQid7o3e8Tq2XPQvDdMf2WJQlR8vsJ/RB2CkllOifBQE0/k/tDm24oUUPnduza9Qw+Y1VDw0/
 pfN83MfiaTXiBUGkRYHtmbBPd9EEmgEld+F27yu1uVOaU7/QZsHbVoQFW11Nps7VOA7DGym1EEL
 QjXwNLRuRUJp47BYTMajRWlLnoRdZgCClTEEDYTsBFMo+Pj54GdVmkKEVlOytvArl4a/MhWe+jR
 hBEaD2C8g5eSBlOKVkFp6y5hY=
X-Received: by 2002:a05:620a:3947:b0:8c5:3495:87df with SMTP id
 af79cd13be357-8c6a691f35emr1541593885a.38.1768825044736; 
 Mon, 19 Jan 2026 04:17:24 -0800 (PST)
X-Received: by 2002:a05:620a:3947:b0:8c5:3495:87df with SMTP id
 af79cd13be357-8c6a691f35emr1541590685a.38.1768825044215; 
 Mon, 19 Jan 2026 04:17:24 -0800 (PST)
Received: from umbar.lan
 (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi.
 [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
 by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-59baf3a17b9sm3274641e87.92.2026.01.19.04.17.21
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 19 Jan 2026 04:17:22 -0800 (PST)
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Date: Mon, 19 Jan 2026 14:16:40 +0200
Subject: [PATCH v4 4/4] drm/msm/dpu: fix SSPP_UBWC_STATIC_CTRL programming
 on UBWC 5.x+
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260119-msm-ubwc-fixes-v4-4-0987acc0427f@oss.qualcomm.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=2999;
 i=dmitry.baryshkov@oss.qualcomm.com; h=from:subject:message-id;
 bh=hK4mO/cagHj3HVYjVR3i3QZO8ZbZgg9vO0ANe18SGRw=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBpbiDLpqeQzOXgyf3tXynVkxvGog9EgSHQgbY48
 /KeMdsJMhKJATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCaW4gywAKCRCLPIo+Aiko
 1e/2CACcDaJ6s6kfm+vHnD/D6JZRlYJKgJpb6vVJ+CubGxlksC2JZK/iBXaKvdU435oeEqvlR+A
 Yt+GmgPjHbmDSGXVLx8gj8/vu6AtqxKz3yRy/WpPcEgOI9N2Yap9grQHG4IC1C4UPJwFHtUELzK
 CLmBgwHX8VLI/U9iqp34YeYlZLjAvpNqya8tAxv5zaoHoR+3mx7N0i1XzUmgK5OgtWFa9LYwFea
 XZLzz6LRRZH74S26+h7Ue79tjdrJ58maQ1Ic/d1syDvrKPI2ksCHPBPrPaIEoo6MhwayjVDqXhd
 gkNlqZWnjhlKc8SR1SOCwK/TmDh9XJ4m2GldNLuMdoY8AQW+
X-Developer-Key: i=dmitry.baryshkov@oss.qualcomm.com; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A
X-Proofpoint-ORIG-GUID: 4Tgb_C_BdGEda7rn1sQheQUxBvkLgGEr
X-Proofpoint-GUID: 4Tgb_C_BdGEda7rn1sQheQUxBvkLgGEr
X-Authority-Analysis: v=2.4 cv=c4OmgB9l c=1 sm=1 tr=0 ts=696e20d5 cx=c_pps
 a=qKBjSQ1v91RyAK45QCPf5w==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=vUbySO9Y5rIA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=EUspDBNiAAAA:8 a=7FpWx5GjbivZIX0HvvoA:9 a=QEXdDO2ut3YA:10
 a=NFOGd7dJGGMPyQGDc5-O:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMTE5MDEwMiBTYWx0ZWRfX7igC6Ncx4hOS
 SYJBHhis92cVjfPt3yMfFNDB6zTtbJBp91TBwx2OZ9MMbAHX02NyTxNtdXvW10oHgb/h1FraA1P
 zCggw42r77XFKbKXQG+Yyxd/9ybhcojSkfF6XziaynHjsOLEIlVyrA1cn+s7bqtTdeJa5uDSJkk
 yRGzFW4+md6ZVAWqS+dbZ5vgzGGc1hj2k1i/nFftlL/aMG+ciz2hQusHgyMKNxfbqZippdTpWvK
 sxVCOxMd2bYsGtzFMM7NOL+VNJ1d4vjVkbRMKh2AkcZtBTq2LDG6AVm+Qz4e/MPEiSVIcz0ZMFk
 9wsY7hrop4SZ+/maigXsPAuMl2t7oKAR/Af5yHC9ppaPVcsThybSj9FbP3j0JH2ppRXjvb8L0ex
 GMGa81qQxvB6B7qX5ztGgZIohkXMAChst81pS2dDtmyK9QzevGBpE3BfoYlC91l8Bu4viBlefvv
 7NtYNXh7EiWXxzO1bgA==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2026-01-19_02,2026-01-19_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 adultscore=0 impostorscore=0 clxscore=1015 priorityscore=1501
 suspectscore=0 spamscore=0 bulkscore=0 phishscore=0 lowpriorityscore=0
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

Code in dpu_hw_sspp_setup_format() doesn't handle UBWC versions bigger
than 4.0. Replace switch-case with if-else checks, making sure that the
register is initialized on UBWC 5.x (and later) hosts.

Fixes: c2577fc1740d ("drm/msm/dpu: Add support for SM8750")
Tested-by: Val Packett <val@packett.cool> # x1e80100-dell-latitude-7455
Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
---
 drivers/gpu/drm/msm/disp/dpu1/dpu_hw_sspp.c | 45 +++++++++++++++--------------
 1 file changed, 24 insertions(+), 21 deletions(-)

diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_sspp.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_sspp.c
index 6ff4902fce08..f275b14da4ff 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_sspp.c
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_sspp.c
@@ -284,6 +284,7 @@ static void dpu_hw_sspp_setup_format(struct dpu_sw_pipe *pipe,
 
 	if (fmt->fetch_mode != MDP_FETCH_LINEAR) {
 		u32 hbb = ctx->ubwc->highest_bank_bit - 13;
+		u32 ctrl_val;
 
 		if (MSM_FORMAT_IS_UBWC(fmt))
 			opmode |= MDSS_MDP_OP_BWC_EN;
@@ -291,30 +292,32 @@ static void dpu_hw_sspp_setup_format(struct dpu_sw_pipe *pipe,
 		DPU_REG_WRITE(c, SSPP_FETCH_CONFIG,
 			DPU_FETCH_CONFIG_RESET_VALUE |
 			hbb << 18);
-		switch (ctx->ubwc->ubwc_enc_version) {
-		case UBWC_1_0:
+
+		if (ctx->ubwc->ubwc_enc_version == UBWC_1_0) {
 			fast_clear = fmt->alpha_enable ? BIT(31) : 0;
-			DPU_REG_WRITE(c, ubwc_ctrl_off,
-					fast_clear | (ctx->ubwc->ubwc_swizzle & 0x1) |
-					BIT(8) |
-					(hbb << 4));
-			break;
-		case UBWC_2_0:
+			ctrl_val = fast_clear | (ctx->ubwc->ubwc_swizzle & 0x1) |
+				BIT(8) | (hbb << 4);
+		} else if (ctx->ubwc->ubwc_enc_version == UBWC_2_0) {
 			fast_clear = fmt->alpha_enable ? BIT(31) : 0;
-			DPU_REG_WRITE(c, ubwc_ctrl_off,
-					fast_clear | (ctx->ubwc->ubwc_swizzle) |
-					(hbb << 4));
-			break;
-		case UBWC_3_0:
-			DPU_REG_WRITE(c, ubwc_ctrl_off,
-					BIT(30) | (ctx->ubwc->ubwc_swizzle) |
-					(hbb << 4));
-			break;
-		case UBWC_4_0:
-			DPU_REG_WRITE(c, ubwc_ctrl_off,
-					MSM_FORMAT_IS_YUV(fmt) ? 0 : BIT(30));
-			break;
+			ctrl_val = fast_clear | ctx->ubwc->ubwc_swizzle | (hbb << 4);
+		} else if (ctx->ubwc->ubwc_enc_version == UBWC_3_0) {
+			ctrl_val = BIT(30) | (ctx->ubwc->ubwc_swizzle) | (hbb << 4);
+		} else if (ctx->ubwc->ubwc_enc_version == UBWC_4_0) {
+			ctrl_val = MSM_FORMAT_IS_YUV(fmt) ? 0 : BIT(30);
+		} else if (ctx->ubwc->ubwc_enc_version <= UBWC_6_0) {
+			if (MSM_FORMAT_IS_YUV(fmt))
+				ctrl_val = 0;
+			else if (MSM_FORMAT_IS_DX(fmt)) /* or FP16, but it's unsupported */
+				ctrl_val = BIT(30);
+			else
+				ctrl_val = BIT(30) | BIT(31);
+			/* SDE also sets bits for lossy formats, but we don't support them yet */
+		} else {
+			DRM_WARN_ONCE("Unsupported UBWC version %x\n", ctx->ubwc->ubwc_enc_version);
+			ctrl_val = 0;
 		}
+
+		DPU_REG_WRITE(c, ubwc_ctrl_off, ctrl_val);
 	}
 
 	opmode |= MDSS_MDP_OP_PE_OVERRIDE;

-- 
2.47.3

