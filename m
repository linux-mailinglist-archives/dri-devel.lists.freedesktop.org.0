Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id F2550C838A6
	for <lists+dri-devel@lfdr.de>; Tue, 25 Nov 2025 07:49:15 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 42DD010E352;
	Tue, 25 Nov 2025 06:49:14 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="F+kxnB4B";
	dkim=pass (2048-bit key; unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="XygS1bhs";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com
 [205.220.180.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2A9E410E352
 for <dri-devel@lists.freedesktop.org>; Tue, 25 Nov 2025 06:49:13 +0000 (UTC)
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 5AP2guUh2149383
 for <dri-devel@lists.freedesktop.org>; Tue, 25 Nov 2025 06:49:12 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:date:from:in-reply-to:message-id
 :mime-version:references:subject:to; s=qcppdkim1; bh=sl70Xakrk/Q
 WuTVO9HzpUuERYvoGu0ruQzvOAyWXJVA=; b=F+kxnB4BHt1771E/s27KGl4vZuO
 ji8uIBVxgAtc5jlyJX+jZc33agIimP1nJw3p9GmWMjweTmrdjTerZkWj9GMCaBjE
 /kBZptiUZC7pVh3IMBfbzsAFANG6SrX9lbxdutCuPsqzCbYj6TOjSmcpgFJF0bVm
 QZDfisUxkFu1VEoPx5tULR93GhSCqeNCU6bj59YkdOeX8KdBGOBpwatP/TZJK2ac
 9177VB3b8TygmF9bi1UimgwhtEKdcWTBtRKJRz12VlRJSpL1YHK/pQmef86RcWtc
 38tUF3X7YNflRC3lgBkfu40F1SJyFCeiw/SCXnX3hmBf9CxptNApl0AAezQ==
Received: from mail-qt1-f199.google.com (mail-qt1-f199.google.com
 [209.85.160.199])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4amr8sank0-1
 (version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
 for <dri-devel@lists.freedesktop.org>; Tue, 25 Nov 2025 06:49:12 +0000 (GMT)
Received: by mail-qt1-f199.google.com with SMTP id
 d75a77b69052e-4ee1b7293e7so193106341cf.0
 for <dri-devel@lists.freedesktop.org>; Mon, 24 Nov 2025 22:49:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oss.qualcomm.com; s=google; t=1764053351; x=1764658151;
 darn=lists.freedesktop.org; 
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=sl70Xakrk/QWuTVO9HzpUuERYvoGu0ruQzvOAyWXJVA=;
 b=XygS1bhslPq4vk4GEjlRKna3xIcH8bnsJ+beu4npKoOcg9SS2rX964esQZrfH/X7Y6
 7OVwLZXZ9sboHMYXBYeDWIzV+Cp7eCxZVhiaLaiXfSxOhxMHigqeW+e6Clinu2k2tKUf
 KUzp8JQXYWbEar7eqX5O9M0C6VCZZIqjq4Pbgbt7NHwgQ43fDPBGNd882rCWTTCB6Pfm
 tQtMs8LFcg98F6d/rJqIjnVXB82WPEbNbJCk8SJeiAgrAAUmvS9qnooe+3w7RbHHM2i5
 z2gNsAKbJQjWD8hNDkQKtefBJ4+pY0WUkvs+dg25gxOzvMcrIvqrLckAVpIYnZ/htWZR
 Ggxg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1764053351; x=1764658151;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=sl70Xakrk/QWuTVO9HzpUuERYvoGu0ruQzvOAyWXJVA=;
 b=qZQdms1xoIt83cHRIRsJeCFD/92BOofs9jEpwKW7C5oCEfDfy+uVYnEgIUJGbQ4Cqv
 dfPEz0uADtre6qk6UTHqGPBV+pEKNwox+YQHcbUR5p2VMxCissTVx3wCP1dGfQS1zs7J
 961qY/fPx+h7DyfHeMG7VHVevOwnk1JF7c5RuBoHuZ7AOswqVPYZX7D+AIEnv4VNIyFY
 dYJw5FTPbp18uIMlDvvNdE8V4jvc91EH6qI8Zi9HePnuzLMOVm3FQVeMapTIKkX1LiZi
 B87xOrTTrs6Qjo3Kib/oA02htTLp/Mo+7zGHQq98zkTqBCQrjnyY04Ov8VcS/Z0QYqTh
 L4Sw==
X-Forwarded-Encrypted: i=1;
 AJvYcCWzbWQxyYA1HBaj6XiaRE9bpnUokzO014SlGfTbzMA9+ySSLoGvD3Ctkp/MumzjbtbP9yQ9FhyelcY=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YyXDt+RHNU5t43C55K6ayMDKFprOIAfIdCpj6n8GE2CwKQdE0wN
 iylRj02gpgO5uddxm4S6/NagXizDkTOYGzS/SSrdj6RwJFvcIDVuGL+jVAiQW8eJNNJWdpI2Hxb
 qw8KnwaMYtZA3b2xLdKHjNUEriNNkM7YMNDO7Y/hLlGaQbr3yR8Xj/J2DN9nY6dJtAcaa98Q=
X-Gm-Gg: ASbGncvLOhvFYZeeCSZaRtcp0DGrXlmzLumjaeZfE8RZGwypWafVVSLMJimCV705dAj
 Rm9i5SsdLIa9GIKsQCj/Qy5BDTN7pIDsXCf1iPOc1HlUj7BeHLYnBgoQzYc3/IEbDsHj4HagNRr
 S6Uav8k2Ys0x/X6PuJG39g8mRCZmADm5IPsy05Vc7TUTDEVM7/niXayCLB3wYhDbSA0Ip0drDTF
 fJHXb3QhoB0CJag67r7b4ndjRDE0E2bvCKzLWo6ZYeiLUBLvUC5YPtkWScF331XLbRyJ3yq+3mC
 Kd81SbWzeFX6y55tm7TnFuN2Hx2KAGE9rceAXCKTmKSMAWjx2z8CNYDexMv73CRogqYJbAZCupJ
 kj1F24sU5oe6S0JGpKKTqYnzw2v3ITF6JPyBkuhW9Hn4A9rMn9swAl+g6kcj6G2jm1H4eYkw=
X-Received: by 2002:a05:622a:98d:b0:4ed:bad6:9fac with SMTP id
 d75a77b69052e-4ee58a446e5mr170268581cf.1.1764053351613; 
 Mon, 24 Nov 2025 22:49:11 -0800 (PST)
X-Google-Smtp-Source: AGHT+IFiZgA3RMR7QzcGUxzPh5hdymLOsFNIYBB5TZ/d/l1DFbwPQDvEADrbvlT5d/ZAyusRDJhjzg==
X-Received: by 2002:a05:622a:98d:b0:4ed:bad6:9fac with SMTP id
 d75a77b69052e-4ee58a446e5mr170268461cf.1.1764053351283; 
 Mon, 24 Nov 2025 22:49:11 -0800 (PST)
Received: from yuanjiey.qualcomm.com (Global_NAT1_IAD_FW.qualcomm.com.
 [129.46.232.65]) by smtp.gmail.com with ESMTPSA id
 d75a77b69052e-4ee48e3edb9sm100645971cf.22.2025.11.24.22.49.03
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 24 Nov 2025 22:49:10 -0800 (PST)
From: yuanjie yang <yuanjie.yang@oss.qualcomm.com>
To: robin.clark@oss.qualcomm.com, lumag@kernel.org, abhinav.kumar@linux.dev,
 sean@poorly.run, marijn.suijten@somainline.org, airlied@gmail.com,
 simona@ffwll.ch, maarten.lankhorst@linux.intel.com, mripard@kernel.org,
 tzimmermann@suse.de, robh@kernel.org, krzk+dt@kernel.org,
 conor+dt@kernel.org, quic_mkrishn@quicinc.com, jonathan@marek.ca,
 quic_khsieh@quicinc.com, neil.armstrong@linaro.org,
 yuanjie.yang@oss.qualcomm.com
Cc: linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
 freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 tingwei.zhang@oss.qualcomm.com, aiqun.yu@oss.qualcomm.com,
 Yongxing Mou <yongxing.mou@oss.qualcomm.com>
Subject: [PATCH v2 05/10] drm/msm/mdss: Add support for Kaanapali
Date: Tue, 25 Nov 2025 14:47:53 +0800
Message-Id: <20251125064758.7207-6-yuanjie.yang@oss.qualcomm.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20251125064758.7207-1-yuanjie.yang@oss.qualcomm.com>
References: <20251125064758.7207-1-yuanjie.yang@oss.qualcomm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-ORIG-GUID: tf-8hQd9a3FHY1Y_taFdo_fRS7-m51YP
X-Authority-Analysis: v=2.4 cv=KP5XzVFo c=1 sm=1 tr=0 ts=69255168 cx=c_pps
 a=WeENfcodrlLV9YRTxbY/uA==:117 a=C3Dk8TwHQYyIj7nOf9RCJw==:17
 a=6UeiqGixMTsA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=EUspDBNiAAAA:8 a=74ENWJKDy3Vb_L2bHi4A:9 a=kacYvNCVWA4VmyqE58fU:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMTI1MDA1NCBTYWx0ZWRfX2JlyKCXgOqo1
 9xYtgLqPCMWAy2Hw/qJix0Nep64uYmI23r9LnIR4UkqckMWNasxkiDtN3Y8TnvgtR7MnGedMT4m
 NTUvwaqQk+12G9f5cXIsP86peo7TptKX2kYNgCHu+k4qIjk9BMyZnedYV6bQiegnT7Z2CI+R3/F
 OgmwrB4XkljcgN3xMD7bLWEo3R+amMdxJPvWRJk46InZ/D7cUX+SRSBGJGRM9a9RgSB2Or8hxQp
 juoF4bE7j5o6fEPNy4KaRUUlw3nZa4/eXF0xCKt5YW/WPtzDdxzDylkpREUMyNKL3DJ3/755etO
 4Htddd2l1mGoBf9btpuoWXetVD63lW/QRC3efWqs8BJUMSFMoJlIQUMOxQ3ClauCsrklPxAg0oB
 lTJePZDjZmBgDbcp0cvWyERM9c8+zQ==
X-Proofpoint-GUID: tf-8hQd9a3FHY1Y_taFdo_fRS7-m51YP
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-11-25_01,2025-11-24_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 impostorscore=0 clxscore=1015 lowpriorityscore=0 phishscore=0
 bulkscore=0 spamscore=0 priorityscore=1501 suspectscore=0 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2510240001 definitions=main-2511250054
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
 drivers/gpu/drm/msm/msm_mdss.c | 22 ++++++++++++++++++++++
 1 file changed, 22 insertions(+)

diff --git a/drivers/gpu/drm/msm/msm_mdss.c b/drivers/gpu/drm/msm/msm_mdss.c
index bf9a33e925ac..797ef134e081 100644
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
 	{ .compatible = "qcom,glymur-mdss", .data = &data_57k },
 	{ .compatible = "qcom,msm8998-mdss", .data = &data_76k8 },
-- 
2.34.1

