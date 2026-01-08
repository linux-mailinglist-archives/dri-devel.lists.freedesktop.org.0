Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 45EE0D01B11
	for <lists+dri-devel@lfdr.de>; Thu, 08 Jan 2026 09:58:11 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8CFCF10E6B5;
	Thu,  8 Jan 2026 08:58:09 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="cwFID3MK";
	dkim=pass (2048-bit key; unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="dBHuQqV/";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com
 [205.220.180.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9D7B010E6B8
 for <dri-devel@lists.freedesktop.org>; Thu,  8 Jan 2026 08:58:08 +0000 (UTC)
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 6081wuKa125958
 for <dri-devel@lists.freedesktop.org>; Thu, 8 Jan 2026 08:58:07 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:date:from:in-reply-to:message-id
 :mime-version:references:subject:to; s=qcppdkim1; bh=D7O7zbR7bk0
 RBrH6WlI0a+LXkFPZYFN4ZGyTTHv5I0k=; b=cwFID3MKDYKuRkIpd5VIj7CQX80
 IIeZdQuPcSNfydPzPOdmuw9iQumQlXD7JTLsuLfBEAW7845tR9e6liYyieNchtEr
 4fnDAWK4abSlCZLdbiJFQUjt/DtwZdqv//UD+enyPhLOpRx4bg1QAJKl1M9XD/md
 Xvgmst4sdC4nt+aSG59pJ+03r8f+NGc/yfJemkQmAohN2iL1L7IvjvA0q3Y28ELr
 fVN/nCVeqcStpmRPKeAHtP4FyZXFUt0Yv58KULElYh89VeVOsojNdgSVfTsO+AB4
 dJeSVybIHzJRgihto5ew5EiXAg5ySQpytw2AuaQ7ZCBSPNK8vCUjMr++1Nw==
Received: from mail-qv1-f71.google.com (mail-qv1-f71.google.com
 [209.85.219.71])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4bj3d695s6-1
 (version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
 for <dri-devel@lists.freedesktop.org>; Thu, 08 Jan 2026 08:58:07 +0000 (GMT)
Received: by mail-qv1-f71.google.com with SMTP id
 6a1803df08f44-8888447ffebso74302556d6.1
 for <dri-devel@lists.freedesktop.org>; Thu, 08 Jan 2026 00:58:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oss.qualcomm.com; s=google; t=1767862687; x=1768467487;
 darn=lists.freedesktop.org; 
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=D7O7zbR7bk0RBrH6WlI0a+LXkFPZYFN4ZGyTTHv5I0k=;
 b=dBHuQqV/k1FWn/X2TGk+OiH9iPP2cgWJv3YJrPefsNWwEWPUcsdMI2XRR1csIjB3l9
 eZnwFquH9U3osGLuQSScBt4LNX+B9+4iHvT86dwy60LTU4PSuOPNRj7YSPBlEhdnad50
 gcWRM31WfvZi3csynueexJrs/cSJrq8BQqedAcdojCp+QWL06doSM3oNGqDS5FV0/Lzm
 glpGbcJyVIEoeo/ybYPMOhI/T0WcNI9HyXHwsyIUPQFDKsZzSI0W6C/h/DejfEU/xUA6
 XQ4LaozzStK4XoAIYuQqCs5xCQNsZvuEgqEfNDqTirrrZK4hsZ72sb//gTJllXYpdzkF
 H8AA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1767862687; x=1768467487;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=D7O7zbR7bk0RBrH6WlI0a+LXkFPZYFN4ZGyTTHv5I0k=;
 b=d9Q8FA5pDgNOgwmIotHlfue3UAXjjPoyo5KbKxVtfQ4cQrxtZ+c+cAwwkBqGRGUI02
 hKVkmDjnVcAHi3nZqidduLo6cpIUvf0JIyyzGWarxHNCXxAUBgwpcgx91ee5wmow7TFq
 XGJzC/SzuM5ZTin2Tow4vw7Ad51ZvAGDugxF3gmi5v+PGWLGAg3GtvgHRehs+HtD5asI
 jRhTf2sc5kwlc5ZyvGIO4ZdoMCl5TOJS6aT/MPfQTTbg9tNmjBtRHLciFL0i0/7L2+at
 /lb5RaeS3ZyPLNGE2bcFw0XXe72UzR5Q3kgeRBBw/+aIx+qxlGAcSSNulpI8/usCxIf3
 AJ6Q==
X-Forwarded-Encrypted: i=1;
 AJvYcCXoPjWwnSi4hTu8ethddGHMQaTl0/x41JJKefwi+MrACC3+u3OsvCRXZ43CWvHJq6i2qn1oAvLxuo8=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YxnDfkPY3m2QpzIkuR6NX0BxFmnn+QtXVO1KEIyJh4Cn506NYq+
 aGuR5gPrtAdz27SOcjOR3uimJXCue4uZIW39UDPe3dgd8Tj5aUK2NVgutNIdOLwg4FNSraoDsAn
 sg8u4lvhn7BRPsptRWxd/ta+cHZWeKWsg/2OUJsQbEoECUzrWrP0jkybqAEcI3obEoCzatBU=
X-Gm-Gg: AY/fxX5uKF3xV0RZY+dqY+WuZfIqA7qvWJ33Mq744ronOhYfIFuFnV2LDCsNYGEdoW+
 i2WC3WkGWQjbpufCZTAjwnSV0KUN65PTXypTWSc0IrrhRjUPGV7PWH09c0iX9EJfmMfeDg6Z2SP
 /GyVnpM7XBmmgtBFx74biSb4DgtCuGtj0CDvr6i4cHveMvaqEBS44tFd3hzCeuvHEhuNEIZyeDw
 /akeMAl6LhBQcYCakeZNSJSZmZrPbFi1DjcqREY2eo2o2sariNlBhUaktI+SqfCHbQktgFEevSx
 aRfzwm7CqrsID9bOViIzISKDp5Ahg2B/QsLrj2wcE5DTZcH/KItGry9+Hnskv3yM9jCMHPGZGHs
 MRJ7e+9Ugaf/cQ25Eq8qybP5fxE3vcLXENbESxjOVUl+xmAbLP8jM8WrWoj9M7FUY4dI=
X-Received: by 2002:a05:6214:c46:b0:882:4be6:9ab9 with SMTP id
 6a1803df08f44-890842d158emr79772606d6.54.1767862687085; 
 Thu, 08 Jan 2026 00:58:07 -0800 (PST)
X-Google-Smtp-Source: AGHT+IEZ6o0SmHvML2LmrOe7eTL0nOVLedXj8klhr7BqpyaZ9HLVsEOuMtIS4GiO6aIiM/fwMf952g==
X-Received: by 2002:a05:6214:c46:b0:882:4be6:9ab9 with SMTP id
 6a1803df08f44-890842d158emr79772466d6.54.1767862686705; 
 Thu, 08 Jan 2026 00:58:06 -0800 (PST)
Received: from yuanjiey.qualcomm.com (Global_NAT1_IAD_FW.qualcomm.com.
 [129.46.232.65]) by smtp.gmail.com with ESMTPSA id
 6a1803df08f44-890770cc7eesm49680326d6.2.2026.01.08.00.57.57
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 08 Jan 2026 00:58:06 -0800 (PST)
From: yuanjie yang <yuanjie.yang@oss.qualcomm.com>
To: robin.clark@oss.qualcomm.com, lumag@kernel.org, jesszhan0024@gmail.com,
 sean@poorly.run, marijn.suijten@somainline.org, airlied@gmail.com,
 simona@ffwll.ch, maarten.lankhorst@linux.intel.com, mripard@kernel.org,
 tzimmermann@suse.de, robh@kernel.org, krzk+dt@kernel.org,
 conor+dt@kernel.org, neil.armstrong@linaro.org,
 konrad.dybcio@oss.qualcomm.com
Cc: linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
 freedreno@lists.freedesktop.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, tingwei.zhang@oss.qualcomm.com,
 aiqun.yu@oss.qualcomm.com, yongxing.mou@oss.qualcomm.com,
 Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Subject: [PATCH v5 05/12] drm/msm/mdss: Add support for Kaanapali
Date: Thu,  8 Jan 2026 16:56:52 +0800
Message-Id: <20260108085659.790-6-yuanjie.yang@oss.qualcomm.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260108085659.790-1-yuanjie.yang@oss.qualcomm.com>
References: <20260108085659.790-1-yuanjie.yang@oss.qualcomm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-GUID: 9Jth_tHto5WHpItVbWUdFHinJM_Oq7Wv
X-Authority-Analysis: v=2.4 cv=APfYzRIR c=1 sm=1 tr=0 ts=695f719f cx=c_pps
 a=UgVkIMxJMSkC9lv97toC5g==:117 a=C3Dk8TwHQYyIj7nOf9RCJw==:17
 a=vUbySO9Y5rIA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=EUspDBNiAAAA:8 a=hYg4dbXq4j5tZlskCswA:9 a=1HOtulTD9v-eNWfpl4qZ:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMTA4MDA1OSBTYWx0ZWRfXz0P5H1SkHJ8f
 oc8/EkFmCeWCi6tWfPW+nXtbPpnidM7yhjYOS0oXVzAACJXnSBVHEv4O98N7Xv4hV9K7MDDjy3U
 wnV8o4k9mqlg12/MPYQFCxVDX1bXToCdHUvZVcyHPh6L7fx0gZiUpD0wakZAgy5v/WGuWV7hiIp
 Aa2ZW6OFX9uAF3zcIeJb010vxdZtiHGCWxoOBDgKUoslR4F/lqifVz1ctYjb0tkY4mv9PWZEM1s
 gfvWO9dyngkRh3gyJWzG5bromeXYqTBMyCBrrlhKbCVDgwnaGDPbaaqpdDwC78NRgngLTxnKHwC
 sS1lygYoXqynNCQh1whVpvkJ7DUY+Q5m/6pTXucrtoK2uIkZz5JwSesWbMttSvE4/Qa2zZFEOUr
 0rporkkMdOZtMbBuCXMfeZzlXBNjB3wBZ/tj7iSpTkaIiTYOrahUkUlnuHiIiKO7dRptQk7CDAB
 blVcOAUUT6kGPkV2JWQ==
X-Proofpoint-ORIG-GUID: 9Jth_tHto5WHpItVbWUdFHinJM_Oq7Wv
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2026-01-08_01,2026-01-07_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 priorityscore=1501 spamscore=0 lowpriorityscore=0
 suspectscore=0 bulkscore=0 clxscore=1015 adultscore=0 phishscore=0
 impostorscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2512120000
 definitions=main-2601080059
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
Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Signed-off-by: Yuanjie Yang <yuanjie.yang@oss.qualcomm.com>
---
 drivers/gpu/drm/msm/msm_mdss.c | 10 +++++++++-
 1 file changed, 9 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/msm/msm_mdss.c b/drivers/gpu/drm/msm/msm_mdss.c
index bf9a33e925ac..7d78d16f8802 100644
--- a/drivers/gpu/drm/msm/msm_mdss.c
+++ b/drivers/gpu/drm/msm/msm_mdss.c
@@ -239,7 +239,11 @@ static void msm_mdss_setup_ubwc_dec_50(struct msm_mdss *msm_mdss)
 
 	writel_relaxed(value, msm_mdss->mmio + REG_MDSS_UBWC_STATIC);
 
-	writel_relaxed(4, msm_mdss->mmio + REG_MDSS_UBWC_CTRL_2);
+	if (data->ubwc_dec_version == UBWC_6_0)
+		writel_relaxed(5, msm_mdss->mmio + REG_MDSS_UBWC_CTRL_2);
+	else
+		writel_relaxed(4, msm_mdss->mmio + REG_MDSS_UBWC_CTRL_2);
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
@@ -554,6 +561,7 @@ static const struct msm_mdss_data data_153k6 = {
 static const struct of_device_id mdss_dt_match[] = {
 	{ .compatible = "qcom,mdss", .data = &data_153k6 },
 	{ .compatible = "qcom,glymur-mdss", .data = &data_57k },
+	{ .compatible = "qcom,kaanapali-mdss", .data = &data_57k },
 	{ .compatible = "qcom,msm8998-mdss", .data = &data_76k8 },
 	{ .compatible = "qcom,qcm2290-mdss", .data = &data_76k8 },
 	{ .compatible = "qcom,qcs8300-mdss", .data = &data_74k },
-- 
2.34.1

