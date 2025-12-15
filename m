Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 98C18CBCFBC
	for <lists+dri-devel@lfdr.de>; Mon, 15 Dec 2025 09:40:33 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0130810E39E;
	Mon, 15 Dec 2025 08:40:32 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="GiUHDZ+3";
	dkim=pass (2048-bit key; unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="TQV1CUtb";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com
 [205.220.168.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0F2B210E3A2
 for <dri-devel@lists.freedesktop.org>; Mon, 15 Dec 2025 08:40:30 +0000 (UTC)
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 5BF7TVwQ1641162
 for <dri-devel@lists.freedesktop.org>; Mon, 15 Dec 2025 08:40:29 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:date:from:in-reply-to:message-id
 :mime-version:references:subject:to; s=qcppdkim1; bh=T5hormO1Tzm
 iMptirNKEBXdbWFDw2mJd8ZK7F/ndOPI=; b=GiUHDZ+3mRxBGRkuHWnuU4KxTRD
 BRMMKpl+1xHry6oADWGSvdPkZvY+rD1NVwqvKuZTscyCSpqC5xzOLNewgDYP6YGy
 iQ61YS19nKRVoG12kW4M0mqs9caEtkDSLBDb9ebB/OAAHNzulM81ShFkmb9NG/gt
 0xvcMsDj9BArDuTlawLA+3w84pP4koFgHsqdE2qB5zmkLa+SsjkES55fSvh4fbi7
 qEVi1Fx7a6i4RwFIAkpzx5HkBhFD+v6eLJkUFK4n8OSY9n3CenOAeOEBCuQ3wQvP
 sh6hzVTwH8iXJrkfWwqGmKowSWerkizyQR7S+iBsnRw3Ysich7vchD9iTNg==
Received: from mail-qt1-f198.google.com (mail-qt1-f198.google.com
 [209.85.160.198])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4b1771ucj2-1
 (version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
 for <dri-devel@lists.freedesktop.org>; Mon, 15 Dec 2025 08:40:29 +0000 (GMT)
Received: by mail-qt1-f198.google.com with SMTP id
 d75a77b69052e-4ee09211413so90985111cf.2
 for <dri-devel@lists.freedesktop.org>; Mon, 15 Dec 2025 00:40:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oss.qualcomm.com; s=google; t=1765788028; x=1766392828;
 darn=lists.freedesktop.org; 
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=T5hormO1TzmiMptirNKEBXdbWFDw2mJd8ZK7F/ndOPI=;
 b=TQV1CUtbmgZtOwJICiv0IW4UTxl5VVvlp8xez0Akv08fbaj/SOHQSXwoH0hzMsl2o4
 GlFb/AKWZajxeIC5DfVg1a303qNZVVxzrvoaZI8tVPpNkFNhQZWOSuxKRVgcINk/hpGc
 yceoD6x42aihfVgV2lW45RWfe/VNxJ5O9eOf0nrPXFVlWaqc71Wu2uXORZTg1Jyi4dsu
 uItHSxl+oyvis5iF8mmusA/m75UgS5ibnpEGM/hu6X/mOBrhljn8WlHNNBUQDTm8EDd1
 oQ2PN5i+35tBUXvmvJkx+jTnX5ezZlN6vf9s92+8XY+1etvDByyVal615ZrQNBTojyYS
 Y8Mw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1765788028; x=1766392828;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=T5hormO1TzmiMptirNKEBXdbWFDw2mJd8ZK7F/ndOPI=;
 b=Whm9jA4hC/AIqRgQXmHNa3dq6p75NCucFO9TyPJKzK5qpOTfy6MFu6r8SiAul3wLgk
 x+3OXrB8wP9ZjzqSgUy0SqWSzjEpfpGkptSjizdBSss8z7tEvxfQJr4jv26jo1ystRrP
 5p08JTHWBmEJ0ByVIrXZyYvU7t9LYzug6ot1o1jCTbXbL2iTL86PmS0Az6rnzu+A22+m
 Ft2MOiQ5l1EG7F6EcUHu9EnK9k8Saq/62junbwRcvNbv9y8Wsq5Td/y7LaYMIDa+ElvB
 b3ir771wKt4Ootl4ICUVJ5eoKFdW6zktUlsNbiKarCIz2OXdza7HbVFcZe4AtByoiooh
 QZQA==
X-Forwarded-Encrypted: i=1;
 AJvYcCUX7QGt1pIdgwUyF3E2HusA96MO0BDIO+GyqcSsJCUyl3xF7xMHdg+McBKEXx0MLZUzHnMZ48Afcqo=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yxg4vKGQiYxBYLk98QUKrccEK78aqSbl7bXccpTbrukcNlORrK3
 1ops9qH5MMiy0NAr5sJdIuUM5ZZiy002dsfASabwkD5AexGyeIHpmPA6ei0VoiAGBYLx+dxOEpX
 6QH5MLKaebGakCRJWgIb5f+GP9v3blvCIs3uWPZciYp0/I0LhOxs7OVbFTc0Cxv21F6NCDlc=
X-Gm-Gg: AY/fxX4E5jRmeaxspJ3wovk7fLwSr9x0FD52z0TUPGnjQgbMQ6VpE9/3Z4qDTMDXrTr
 sANWx/Qfw3GI781s4738DOEjRkwmSMCDAN7tCXjp37N289GaOZOVvJXZb+D0nuXG1cBBqMOs238
 0QVuBdpjMslA46+Vvqg8xqjl1qBlr4v0JUMlmr80GDPSU7r2POjlrwyF9JRpntlSrHFcZjIpHao
 mFY75+Wfl3wlLQ1AHY57TYZO66IW0pVim7gZbnxHAhrUIj3BtLcEaXXSnt3Bb45qPJjGyTkFIbe
 FfQt1IILnv0moJFY5htXgbXaGstG+RVi35FrfZqFjH8v+DrMHV2daxqp6p+hm4Isfc84CYGCzm9
 Rj0AJsEOu7YQP/8ecxOJ35jr4NKY6lNLi3QaQH8J51lf26Peapue8BwdyQKSwXJ2svkU=
X-Received: by 2002:a05:622a:4c8d:b0:4b7:a680:2111 with SMTP id
 d75a77b69052e-4f1d049f54bmr115502441cf.8.1765788028597; 
 Mon, 15 Dec 2025 00:40:28 -0800 (PST)
X-Google-Smtp-Source: AGHT+IE21JM+j2xLBWwUMji/MxEsoKpff5aogjPA7lsLdjIGqhs/FRgyL+lLOBLkdvbMHjyrb9e34Q==
X-Received: by 2002:a05:622a:4c8d:b0:4b7:a680:2111 with SMTP id
 d75a77b69052e-4f1d049f54bmr115502311cf.8.1765788028170; 
 Mon, 15 Dec 2025 00:40:28 -0800 (PST)
Received: from yuanjiey.qualcomm.com (Global_NAT1_IAD_FW.qualcomm.com.
 [129.46.232.65]) by smtp.gmail.com with ESMTPSA id
 d75a77b69052e-4f1bd6b50afsm90557971cf.21.2025.12.15.00.40.20
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 15 Dec 2025 00:40:27 -0800 (PST)
From: yuanjie yang <yuanjie.yang@oss.qualcomm.com>
To: robin.clark@oss.qualcomm.com, lumag@kernel.org, abhinav.kumar@linux.dev,
 jesszhan0024@gmail.com, sean@poorly.run, marijn.suijten@somainline.org,
 airlied@gmail.com, simona@ffwll.ch, maarten.lankhorst@linux.intel.com,
 mripard@kernel.org, tzimmermann@suse.de, robh@kernel.org,
 krzk+dt@kernel.org, conor+dt@kernel.org, neil.armstrong@linaro.org,
 yongxing.mou@oss.qualcomm.com, konrad.dybcio@oss.qualcomm.com
Cc: linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
 freedreno@lists.freedesktop.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, tingwei.zhang@oss.qualcomm.com,
 aiqun.yu@oss.qualcomm.com
Subject: [PATCH v3 05/11] drm/msm/mdss: Add support for Kaanapali
Date: Mon, 15 Dec 2025 16:38:48 +0800
Message-Id: <20251215083854.577-6-yuanjie.yang@oss.qualcomm.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20251215083854.577-1-yuanjie.yang@oss.qualcomm.com>
References: <20251215083854.577-1-yuanjie.yang@oss.qualcomm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Authority-Analysis: v=2.4 cv=Q6vfIo2a c=1 sm=1 tr=0 ts=693fc97d cx=c_pps
 a=mPf7EqFMSY9/WdsSgAYMbA==:117 a=C3Dk8TwHQYyIj7nOf9RCJw==:17
 a=wP3pNCr1ah4A:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=EUspDBNiAAAA:8 a=sRsiwY7EFmHr75jNHr8A:9 a=dawVfQjAaf238kedN5IG:22
X-Proofpoint-ORIG-GUID: 2JBwJCyao6s91lZHCvfdr0j1szu2j4is
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMjE1MDA3MSBTYWx0ZWRfX8wZygb2UhoSV
 lGHMtYohTHQB+94PZ86x6c81pcte/lt/gAQidvtoQQtkSxlxze32l8MKqDZHbBOHAWMYx0AsaGa
 bT2Oow1//I6TBozO+3W2wAdhG+2M8OllOMjkb1lcXnjIPtj9Jea1RrNX2dMHRRKupouSEe/fkLT
 +kyIG1Vu3RdzWnPbqPZ/w/ZIPPn9hozkxe/O0tWEFIOlhILIiQjuSHnhwPSj3DDLXDTWn+MSQbQ
 DUsDF8kzDZQpYmmClbOjWl/lUv0kI/+VQVyptJv4ohnKu8rRB34kSkAYBZXa1FJnOvFPvFImX4U
 ALVlieDaiKLneLs4qefsRv3fOQYVYDCnK9uOH4lvnwvBW7ipyCPelbpYNHkNT3YtZTnimHhMcjb
 LRn18erUIy/2g4e5sn4mwtDEZsJgHA==
X-Proofpoint-GUID: 2JBwJCyao6s91lZHCvfdr0j1szu2j4is
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-12-15_01,2025-12-15_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 clxscore=1015 bulkscore=0 malwarescore=0 suspectscore=0
 adultscore=0 impostorscore=0 lowpriorityscore=0 priorityscore=1501
 phishscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2510240001
 definitions=main-2512150071
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

Co-developed-by: Yongxing Mou <yongxing.mou@oss.qualcomm.com>
Signed-off-by: Yongxing Mou <yongxing.mou@oss.qualcomm.com>
Signed-off-by: Yuanjie Yang <yuanjie.yang@oss.qualcomm.com>
---
 drivers/gpu/drm/msm/msm_mdss.c | 10 +++++++++-
 1 file changed, 9 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/msm/msm_mdss.c b/drivers/gpu/drm/msm/msm_mdss.c
index bf9a33e925ac..cd330870a6fb 100644
--- a/drivers/gpu/drm/msm/msm_mdss.c
+++ b/drivers/gpu/drm/msm/msm_mdss.c
@@ -239,7 +239,11 @@ static void msm_mdss_setup_ubwc_dec_50(struct msm_mdss *msm_mdss)
 
 	writel_relaxed(value, msm_mdss->mmio + REG_MDSS_UBWC_STATIC);
 
-	writel_relaxed(4, msm_mdss->mmio + REG_MDSS_UBWC_CTRL_2);
+	if (data->ubwc_dec_version == UBWC_5_0)
+		writel_relaxed(4, msm_mdss->mmio + REG_MDSS_UBWC_CTRL_2);
+	else
+		writel_relaxed(5, msm_mdss->mmio + REG_MDSS_UBWC_CTRL_2);
+
 	writel_relaxed(1, msm_mdss->mmio + REG_MDSS_UBWC_PREDICTION_MODE);
 }
 
@@ -296,6 +300,9 @@ static int msm_mdss_enable(struct msm_mdss *msm_mdss)
 	case UBWC_5_0:
 		msm_mdss_setup_ubwc_dec_50(msm_mdss);
 		break;
+	case UBWC_6_0:
+		msm_mdss_setup_ubwc_dec_50(msm_mdss);
+		break;
 	default:
 		dev_err(msm_mdss->dev, "Unsupported UBWC decoder version %x\n",
 			msm_mdss->mdss_data->ubwc_dec_version);
@@ -552,6 +559,7 @@ static const struct msm_mdss_data data_153k6 = {
 };
 
 static const struct of_device_id mdss_dt_match[] = {
+	{ .compatible = "qcom,kaanapali-mdss", .data = &data_57k },
 	{ .compatible = "qcom,mdss", .data = &data_153k6 },
 	{ .compatible = "qcom,glymur-mdss", .data = &data_57k },
 	{ .compatible = "qcom,msm8998-mdss", .data = &data_76k8 },
-- 
2.34.1

