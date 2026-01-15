Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 3E5F9D2381C
	for <lists+dri-devel@lfdr.de>; Thu, 15 Jan 2026 10:28:52 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9A71A10E724;
	Thu, 15 Jan 2026 09:28:50 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="mBDmXmT6";
	dkim=pass (2048-bit key; unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="A/5bgAf0";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com
 [205.220.168.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3940B10E723
 for <dri-devel@lists.freedesktop.org>; Thu, 15 Jan 2026 09:28:50 +0000 (UTC)
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 60F6fgrw1581827
 for <dri-devel@lists.freedesktop.org>; Thu, 15 Jan 2026 09:28:49 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:date:from:in-reply-to:message-id
 :mime-version:references:subject:to; s=qcppdkim1; bh=D7O7zbR7bk0
 RBrH6WlI0a+LXkFPZYFN4ZGyTTHv5I0k=; b=mBDmXmT6A8pVcYiqvNHCARH42l2
 BDV4QNvGcQTPicdfPk2ohFe8w4nGwJ+iJ2uMRkweLoIOq/3Mk6btOTZLtc+8BHD1
 +7kRCfd85Yb4ltZCg2NmQUZKQg6p/1l3q/zizCulilsfK8hrJ8kcr44QCTRsFRl5
 3JP5qGKmeAOGwOo7vwnm/bdWeTxpJzYmwNuXtPsVQMEIs4z14L9Bc9EKRolWf8lz
 5zqCmHetE8vK+QY25L9S3KjZkkdXqnyxHorOa0Koy1njBj+dG8lKfD4s33BRWM5w
 TuAKrc1Dn9dg9MMIkuMi9yjushXALX5j32/0A366WIWVzX80tsOZ90PxT6Q==
Received: from mail-qv1-f69.google.com (mail-qv1-f69.google.com
 [209.85.219.69])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4bpj1psyb1-1
 (version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
 for <dri-devel@lists.freedesktop.org>; Thu, 15 Jan 2026 09:28:49 +0000 (GMT)
Received: by mail-qv1-f69.google.com with SMTP id
 6a1803df08f44-88883a2cabbso22395436d6.0
 for <dri-devel@lists.freedesktop.org>; Thu, 15 Jan 2026 01:28:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oss.qualcomm.com; s=google; t=1768469328; x=1769074128;
 darn=lists.freedesktop.org; 
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=D7O7zbR7bk0RBrH6WlI0a+LXkFPZYFN4ZGyTTHv5I0k=;
 b=A/5bgAf03NyBakWO+qBDXcxToqS/ldwgJW+HMp7nP/rW1HwhpiytZ0koweXcKowrY5
 gS6Rwj6cOXOzShp0PLAiXQzmfohEV5Ra/p17vh80LBwXCCtQCYBRj63mvapmspP4l49M
 6jf70t21fGF2/7v9RhBdPRMmYfyhXAAxV8Bt80P3QzGQZ5dMALspSAkf+NWHfVTwbNXm
 QAcOEMCVRO3g5dCdcBbh+EOWQy+K+j0FR0m0/1yhHIWn6WLa8qg1HmX2cxN602r5FJVa
 0i1ZpcCyzh8c4pYJzGbwW1eNZkgzQY8tqnfjSWJ6j8tv0ZK6EQrC5q/EPDDEctZa8bfv
 dm0Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1768469328; x=1769074128;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=D7O7zbR7bk0RBrH6WlI0a+LXkFPZYFN4ZGyTTHv5I0k=;
 b=Wf6E3x0tb7V/G31+MlC32ujv7ACFAa1M70Obu/lppUGqvYMk38vICsu+yLLAzdMt74
 hbgiHac7o6O9ucs/U+v/VxU4Y7/nSwUErfv+vkR9C1HFTK5m0fYwXjUS8G3YhNhsHDl4
 ewpzIWZMyboUVk9Nr1OHBZSV/As3hlkj3SkdUrd+S7uZIP+uckI1tQ6U+UsYrvUwuVTC
 DHJn37hvja8FGgWBKfxjFOyc6MPsbR1O9P3kpQHXFbAYSUd2Oi3WB7AtAckSWJtUNsyv
 72/5AO73SjiMxDl41/15eoLaQT09zJt1EMYDVorLpud5Sfaw8aVK4C5/VgOYZ1bZHBCC
 ePbQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCXidOxDvxKlG89EPcSIQesA0TFoPPCFAHX5Hi2L+YSsjpiOVbPgrtQyCgCHZUKvY/G7GUJA90MyHGA=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YxgzfFf4XovWl2IYPeu9UieVSUiQDtTDTJv89kzehecQtemEHF6
 ifPivvrcbpmCAy7hk362r0brPOYAzRbfiEpFv3hLBjtTJ9hEywifH/1TdfeXmGhoQtKwO9GFmv9
 pKM5G55qTRBfa9sNY1vPsicmNUE7u6Rc0e7i4J1wycfdpJKboMqgwIsgwVSagU/yRQrJAOzA=
X-Gm-Gg: AY/fxX5IpKn0TXUtvBnr04jYgvblq/elQq7JznqiRTv5BMqOdCzS9VHCJ8973oHGzL4
 eFlhJJ3fN+vfdTSQOljOghN6XDGA49y7OPbDnDJvIPjbGZxVyil1GrNnm3wLEZhcf20QhZRvkBo
 1lLI/SZObgXrxwTcjfaxb6zS7cuMwiXQpOK7bFryA/95wU+2qARzSzlf3jpBS8ksvCIw6o4XcuJ
 o47f7NzWOkY5KagTYy55n0NbXf2Aw0QEBbqap7wh4VhnK1Zxqocgfb4ARdOMf+t47yqqnY8Xv+8
 CaFtYsI94Aer3CKYItLP5R2llDmIcj1GYvnPualJTfi8cBLTz2rY80zD0IiNJJabmkM3vIiN1lf
 QLfs1hQ3og+bCtjt17ztYwnn5kRMD0SIxsaKYZNG3ET8An7WEJwsqPZErTubfY0RQNh0=
X-Received: by 2002:a05:6214:19c9:b0:88a:589b:5dac with SMTP id
 6a1803df08f44-89274367ce7mr70873026d6.6.1768469328518; 
 Thu, 15 Jan 2026 01:28:48 -0800 (PST)
X-Received: by 2002:a05:6214:19c9:b0:88a:589b:5dac with SMTP id
 6a1803df08f44-89274367ce7mr70872626d6.6.1768469327965; 
 Thu, 15 Jan 2026 01:28:47 -0800 (PST)
Received: from yuanjiey.qualcomm.com (Global_NAT1_IAD_FW.qualcomm.com.
 [129.46.232.65]) by smtp.gmail.com with ESMTPSA id
 6a1803df08f44-892668a2419sm64388416d6.30.2026.01.15.01.28.40
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 15 Jan 2026 01:28:47 -0800 (PST)
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
Subject: [PATCH v6 05/12] drm/msm/mdss: Add support for Kaanapali
Date: Thu, 15 Jan 2026 17:27:42 +0800
Message-Id: <20260115092749.533-6-yuanjie.yang@oss.qualcomm.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260115092749.533-1-yuanjie.yang@oss.qualcomm.com>
References: <20260115092749.533-1-yuanjie.yang@oss.qualcomm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMTE1MDA2NSBTYWx0ZWRfX7f3ChRt9s/hq
 tlp8YfpVbcUq+sMJ93AgvYMt1bXryZAFexrabnZy4PKT6W0YZ/SpDBWLJK2zK0M0gpOcBgn5vUj
 DQVWbJ9f/W3FgdBspAVjM/f7bKl7pnJNu9Zr92gGK4So0+79hDtGQsMtLARmdnZ0AUkd9Hzw9PU
 MDAIOHzGClEtUCKIsMDd4ZQ18d5vaGhOi3jRo2CUOIdAYjaymS+i9V3NIuZmBEfaLBd8VfEhlIb
 r5Aq/JhpIp+3lXUJRsNElDkRpec9fI70ShQbpluv6/89ZzE8dXfnkXzvlQ89AVlhkxz5AW3nUJL
 VDLykomh20Vf5ZH38kkTBvCl2Zr5uUcFMrZxhH0d9qIeYYpbNhaySbH7XFCSfChMZPt4jMrlt+7
 QO7mg3pMWV986sxADxwRp7hfUbsN/f2o3lOAPIvEwQRXY/pa/kEWNWZc8jX0aTkH9hWpKVSEC4D
 PLtRGJCesuD8y/v9J4Q==
X-Authority-Analysis: v=2.4 cv=J+KnLQnS c=1 sm=1 tr=0 ts=6968b351 cx=c_pps
 a=wEM5vcRIz55oU/E2lInRtA==:117 a=C3Dk8TwHQYyIj7nOf9RCJw==:17
 a=vUbySO9Y5rIA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=EUspDBNiAAAA:8 a=hYg4dbXq4j5tZlskCswA:9 a=OIgjcC2v60KrkQgK7BGD:22
X-Proofpoint-GUID: DDNmQfwjCSABPTzTYpHU3kkOnW4P7Pkm
X-Proofpoint-ORIG-GUID: DDNmQfwjCSABPTzTYpHU3kkOnW4P7Pkm
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2026-01-15_02,2026-01-14_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 adultscore=0 priorityscore=1501 bulkscore=0 phishscore=0
 clxscore=1015 suspectscore=0 malwarescore=0 lowpriorityscore=0
 impostorscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2512120000
 definitions=main-2601150065
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

