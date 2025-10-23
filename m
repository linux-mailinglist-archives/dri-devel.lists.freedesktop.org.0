Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id BB2CCBFFBAC
	for <lists+dri-devel@lfdr.de>; Thu, 23 Oct 2025 09:55:33 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 99B2F10E8C1;
	Thu, 23 Oct 2025 07:55:31 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="SeSnbzm3";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com
 [205.220.168.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id ECB4010E8C7
 for <dri-devel@lists.freedesktop.org>; Thu, 23 Oct 2025 07:55:30 +0000 (UTC)
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 59N6hdle025819
 for <dri-devel@lists.freedesktop.org>; Thu, 23 Oct 2025 07:55:30 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:date:from:in-reply-to:message-id
 :mime-version:references:subject:to; s=qcppdkim1; bh=lOK2MHSzPbs
 iXffQZgfe3h7iHMKpferDHyC/TWrrCWc=; b=SeSnbzm3H/cw2/2r7DRnoRK4Fca
 8wMZ/x7Yn5bTTaQWB6FSKnvPEpQOe8975TE27FxJWBo6M7wty50N6dzKGmcv8ZGp
 lcyTCnVlYqSztuojTYb3TkboI20wlbPyHUffR2P1l4+7vaiKFSzNyvYls7liJy8P
 EaxgNdE6ANqb0dX+QZdu0Ck0K/LS2TdoASmlhts4SsTjKae5US6wR2BvPKBG1RQC
 iOoEkScnuv6C/yQ3+VxkxO6JhKKsTpxXDU9r+f5PrJBro2XuHleA99tRgx/ycs7V
 u5oP/SuNDE8OmO7Eb8IZTXl0NVfmkHTat05ViJyWVSAUmgUtmoW09Tgfv1g==
Received: from mail-pl1-f200.google.com (mail-pl1-f200.google.com
 [209.85.214.200])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 49v42kfb7d-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
 for <dri-devel@lists.freedesktop.org>; Thu, 23 Oct 2025 07:55:30 +0000 (GMT)
Received: by mail-pl1-f200.google.com with SMTP id
 d9443c01a7336-290bcced220so5639605ad.1
 for <dri-devel@lists.freedesktop.org>; Thu, 23 Oct 2025 00:55:30 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1761206129; x=1761810929;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=lOK2MHSzPbsiXffQZgfe3h7iHMKpferDHyC/TWrrCWc=;
 b=GmiL/xmclY0UcAXOQa7e35iARxmRuSfKCd9+GYmDQQp35AFf5HSH72FZpYRjdzX2Xs
 sqW83TVC7OwqgOG9jwDmfcNorzVp/d4g6ZNeMdqsSpK9TvZ3LU9WkWNINyZ//3pU+xU9
 zJ5JbxDy0ZuIP0VmcIIXGC0ALN/gAQEngjgVi8+Q6lIGo8txRvOej5ONhE2zQm//R1pu
 KEvlobsmdGKjAUMfR3qS9ys8IqZ/8hjnssEDBhJPh1dvyyk3xyCnx6kB2RfTRutXr8C8
 MeDTlQyqCo9td0DuaBC4kQoFCfCsDb/5UmAj1pfVBuZm0jEvCrgqzBHIHB4fFKGflm0S
 cDjg==
X-Forwarded-Encrypted: i=1;
 AJvYcCWGdjGDVNjMAGLhecfobUjp3nKXSbkrDiPojOepftf3XcY2aLDE6g19Tv9kwx0lOiL1nDmDabCOLGo=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YxFaGF1xs2s6bzWF6FGCHI5FuwAFSWr/NcOPl1s06hK7jIJhdI7
 db3/xEduklwhonSeom1Y4yFrdeaX9vwqEaG4wasg9y9VJadFdJ2fsWtskCOeRcPSkrrT2rGqVxY
 hsqCnWE8rtXrCvOAMhLHXl8mIUbX2W/wBYv87Dru/zGqDwfos3MZll/CFADgII8jSbu+euRU=
X-Gm-Gg: ASbGnct9LidOFVsKNEvftcZPjE82QrZwqNYk3yU2ZzAkQGILDrlZNiOng2rCpBbnbxJ
 3d4k/H+ycsYfNH3jpgxJeJwsrqQxVD1W30MgqOSxUtn8y0byd8O3pMGBEx30QUux0JKlafjrZRs
 3blefRbT4cyhjN0kLEu4dqLkRztZzvywA8xc1Wkl+Vbfu6xLkCpf4yQ7aGjM+WTbclwOIDw6Tve
 iLVz5E4Unpy2hBA/xAGiXkqw3a/D922v/k3ZzA347dsn4GCIi3g307w/Cm+gTd7Rg2+cjV0hamK
 ZGzelA+qKqeChaJLnIOVa794JHy6SRYJfVnAd5MFGbFi7Hs7llRcV55fH7r/09WCvJxE2nGzTEV
 bwfNhATFVzPnoBcLC4TRDkj+3HtQRTET4iyYouSbev9Bqywr03g==
X-Received: by 2002:a17:902:ef4d:b0:269:8f0c:4d86 with SMTP id
 d9443c01a7336-290cb66049dmr319783335ad.53.1761206129506; 
 Thu, 23 Oct 2025 00:55:29 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IE0QuIZ+LuMNR8q0/YAebLqe1CyU54eHt5XXlt5BpEpKdtKF5ztAJWGBj2FwTltk88GyCTZ8A==
X-Received: by 2002:a17:902:ef4d:b0:269:8f0c:4d86 with SMTP id
 d9443c01a7336-290cb66049dmr319783175ad.53.1761206129026; 
 Thu, 23 Oct 2025 00:55:29 -0700 (PDT)
Received: from yuanjiey.qualcomm.com (i-global254.qualcomm.com.
 [199.106.103.254]) by smtp.gmail.com with ESMTPSA id
 d9443c01a7336-2946e1231b0sm14371265ad.97.2025.10.23.00.55.21
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 23 Oct 2025 00:55:28 -0700 (PDT)
From: yuanjie yang <yuanjie.yang@oss.qualcomm.com>
To: robin.clark@oss.qualcomm.com, lumag@kernel.org, abhinav.kumar@linux.dev,
 sean@poorly.run, marijn.suijten@somainline.org, airlied@gmail.com,
 simona@ffwll.ch, maarten.lankhorst@linux.intel.com, mripard@kernel.org,
 tzimmermann@suse.de, robh@kernel.org, krzk+dt@kernel.org,
 conor+dt@kernel.org, quic_mkrishn@quicinc.com, jonathan@marek.ca,
 quic_khsieh@quicinc.com, neil.armstrong@linaro.org
Cc: linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
 freedreno@lists.freedesktop.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, tingwei.zhang@oss.qualcomm.com,
 aiqun.yu@oss.qualcomm.com, yongxing.mou@oss.qualcomm.com
Subject: [PATCH 04/12] drm/msm/mdss: Add support for Kaanapali
Date: Thu, 23 Oct 2025 15:53:53 +0800
Message-Id: <20251023075401.1148-5-yuanjie.yang@oss.qualcomm.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20251023075401.1148-1-yuanjie.yang@oss.qualcomm.com>
References: <20251023075401.1148-1-yuanjie.yang@oss.qualcomm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-GUID: U3D8pNsRNZD6_8v-WnU7yVy6-QafutO2
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMDE4MDAzMSBTYWx0ZWRfX9efLN4rifqz3
 aRKWfS/aKUKEsLJM0YX7RSv5NoaANeIZhKLObLM5nh6NNTdnMreVYIa4zmu4noIvJ7OCs0c3Zxx
 OjY4qLVCq4g7Y8S/CcE88cIheviLXo/Ipd7sXE7o0PFoOlk9Wkt9KFSaIHKO/dPM7bOGI5YEah9
 sPnij3+h7fwE/VjrQQ58Hhh1c/wNLNDE+WXWDJhJfEMpEKNr+q57AEGMa3PERUeokw4tNZENk5Z
 C7bIUEq67tpmtAhrCzHObKe0k2/cDzzd/mXTvhXZ3cQbpToLcAlEQzg5vKX9uJgunpINtQmJvlL
 hpG27bjbgxKQ59uKXMB0/mRl/VuKiLbFmNTL4sBIq2saY6loKvORyxQUM9dixnfA0FETCJ3XCeS
 weytPPagYT3UAHJxuBkLwe+m2jUCWg==
X-Authority-Analysis: v=2.4 cv=QYNrf8bv c=1 sm=1 tr=0 ts=68f9df72 cx=c_pps
 a=IZJwPbhc+fLeJZngyXXI0A==:117 a=JYp8KDb2vCoCEuGobkYCKw==:17
 a=x6icFKpwvdMA:10 a=VkNPw1HP01LnGYTKEx00:22 a=EUspDBNiAAAA:8
 a=fceNRhxQrX_EhRTcvHUA:9 a=uG9DUKGECoFWVXl0Dc02:22
X-Proofpoint-ORIG-GUID: U3D8pNsRNZD6_8v-WnU7yVy6-QafutO2
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-10-22_08,2025-10-22_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 phishscore=0 malwarescore=0 clxscore=1015 impostorscore=0
 spamscore=0 bulkscore=0 suspectscore=0 adultscore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2510020000 definitions=main-2510180031
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

From: Yuanjie Yang <yuanjie.yang@oss.qualcomm.com>

Add mdss support for the Qualcomm Kaanapali platform.

Signed-off-by: Yongxing Mou <yongxing.mou@oss.qualcomm.com>
Signed-off-by: Yuanjie Yang <yuanjie.yang@oss.qualcomm.com>
---
 drivers/gpu/drm/msm/msm_mdss.c | 22 ++++++++++++++++++++++
 include/linux/soc/qcom/ubwc.h  |  1 +
 2 files changed, 23 insertions(+)

diff --git a/drivers/gpu/drm/msm/msm_mdss.c b/drivers/gpu/drm/msm/msm_mdss.c
index 2d0e3e784c04..665751d2b999 100644
--- a/drivers/gpu/drm/msm/msm_mdss.c
+++ b/drivers/gpu/drm/msm/msm_mdss.c
@@ -243,6 +243,24 @@ static void msm_mdss_setup_ubwc_dec_50(struct msm_mdss *msm_mdss)
 	writel_relaxed(1, msm_mdss->mmio + REG_MDSS_UBWC_PREDICTION_MODE);
 }
 
+static void msm_mdss_setup_ubwc_dec_60(struct msm_mdss *msm_mdss)
+{
+	const struct qcom_ubwc_cfg_data *data = msm_mdss->mdss_data;
+	u32 value = MDSS_UBWC_STATIC_UBWC_SWIZZLE(data->ubwc_swizzle) |
+		    MDSS_UBWC_STATIC_HIGHEST_BANK_BIT(data->highest_bank_bit);
+
+	if (data->ubwc_bank_spread)
+		value |= MDSS_UBWC_STATIC_UBWC_BANK_SPREAD;
+
+	if (data->macrotile_mode)
+		value |= MDSS_UBWC_STATIC_MACROTILE_MODE;
+
+	writel_relaxed(value, msm_mdss->mmio + REG_MDSS_UBWC_STATIC);
+
+	writel_relaxed(5, msm_mdss->mmio + REG_MDSS_UBWC_CTRL_2);
+	writel_relaxed(1, msm_mdss->mmio + REG_MDSS_UBWC_PREDICTION_MODE);
+}
+
 static int msm_mdss_enable(struct msm_mdss *msm_mdss)
 {
 	int ret, i;
@@ -296,6 +314,9 @@ static int msm_mdss_enable(struct msm_mdss *msm_mdss)
 	case UBWC_5_0:
 		msm_mdss_setup_ubwc_dec_50(msm_mdss);
 		break;
+	case UBWC_6_0:
+		msm_mdss_setup_ubwc_dec_60(msm_mdss);
+		break;
 	default:
 		dev_err(msm_mdss->dev, "Unsupported UBWC decoder version %x\n",
 			msm_mdss->mdss_data->ubwc_dec_version);
@@ -552,6 +573,7 @@ static const struct msm_mdss_data data_153k6 = {
 };
 
 static const struct of_device_id mdss_dt_match[] = {
+	{ .compatible = "qcom,kaanapali-mdss", .data = &data_57k },
 	{ .compatible = "qcom,mdss", .data = &data_153k6 },
 	{ .compatible = "qcom,msm8998-mdss", .data = &data_76k8 },
 	{ .compatible = "qcom,qcm2290-mdss", .data = &data_76k8 },
diff --git a/include/linux/soc/qcom/ubwc.h b/include/linux/soc/qcom/ubwc.h
index 1ed8b1b16bc9..0a4edfe3d96d 100644
--- a/include/linux/soc/qcom/ubwc.h
+++ b/include/linux/soc/qcom/ubwc.h
@@ -52,6 +52,7 @@ struct qcom_ubwc_cfg_data {
 #define UBWC_4_0 0x40000000
 #define UBWC_4_3 0x40030000
 #define UBWC_5_0 0x50000000
+#define UBWC_6_0 0x60000000
 
 #if IS_ENABLED(CONFIG_QCOM_UBWC_CONFIG)
 const struct qcom_ubwc_cfg_data *qcom_ubwc_config_get_data(void);
-- 
2.34.1

