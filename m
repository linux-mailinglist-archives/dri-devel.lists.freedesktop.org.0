Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 2BE8EC19340
	for <lists+dri-devel@lfdr.de>; Wed, 29 Oct 2025 09:52:27 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 78BFA10E772;
	Wed, 29 Oct 2025 08:52:25 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="CBqySYDJ";
	dkim=pass (2048-bit key; unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="PY+DFajn";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com
 [205.220.180.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E567210E774
 for <dri-devel@lists.freedesktop.org>; Wed, 29 Oct 2025 08:52:23 +0000 (UTC)
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 59T4uwBU3676861
 for <dri-devel@lists.freedesktop.org>; Wed, 29 Oct 2025 08:52:23 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 1e9oSMS+d/VCq+PGqeKk2Zb2CCfTMlkGDkQXezm1vKw=; b=CBqySYDJhaZvDH0A
 lrZF9p0C/7Cr/7S4+hc6UIbj1u0GG6AvawcvDdMRddTfj6H9rS58aOFjRjIbPjB3
 ZMWM4eEueHhYvReXdjbWQNXCKBPw5gmBuqwFXua5DS7UX0cKp3G+ugCsgLNtAeX+
 aLhysyHOl2huQMXG2zeTDOk9EE8ZQjk4I/ePAuroUouJA5wlMWNNFVY4iX/dHk3L
 9djCFxdAjULaSIa/m7UDX3unvzDEHlneTMWn/PRj/8pW3oYLw6JbocDEKogK6JvU
 iz3TjFMnsHCQ6UAv1o+rUYEB1mlohYEheeKM2VX7PD/KvILU+9FUTUDkQVp/bWEj
 ootbFg==
Received: from mail-qt1-f197.google.com (mail-qt1-f197.google.com
 [209.85.160.197])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4a34a1hujy-1
 (version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
 for <dri-devel@lists.freedesktop.org>; Wed, 29 Oct 2025 08:52:22 +0000 (GMT)
Received: by mail-qt1-f197.google.com with SMTP id
 d75a77b69052e-4ecf0501ec2so80557471cf.0
 for <dri-devel@lists.freedesktop.org>; Wed, 29 Oct 2025 01:52:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oss.qualcomm.com; s=google; t=1761727942; x=1762332742;
 darn=lists.freedesktop.org; 
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:from:to:cc:subject:date:message-id
 :reply-to; bh=1e9oSMS+d/VCq+PGqeKk2Zb2CCfTMlkGDkQXezm1vKw=;
 b=PY+DFajnt6a0DsnihUmzjjFryHnvP+mEIFvdARBDQ5++JB3qKJ9bL/fea1wD+k6XRo
 xma5Apy7YSHL6ZHIN5XSc3Smt2EfZUFq6aW0K/LBge9b9ZkTbBsPai75n1ExVeBsIsax
 X58+mn9D2Bx5xpN8MC7c/MqLcUtDzY6VDiLSfRzLuZx3//mP9phM3zee7TxV8/azT/vr
 wq40pp9temuJllTH4JqDLPZUwV/oBOWRhxSIbkhngHw6+3jIX7e6MCHoUMMpJgXf55Mc
 K++tv+s18q+kyz03apwY0TEGBt7+vYgU9wvccKYFmar6gcBAlUsTZAg7WAaaFEGdimk5
 rB9Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1761727942; x=1762332742;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=1e9oSMS+d/VCq+PGqeKk2Zb2CCfTMlkGDkQXezm1vKw=;
 b=PAacZOrlLPn/CgiVbGju+7c3GZNVRENmqlFHQyE/AQS0k7AvmPZW7sa1IQiWwrb7PP
 8/wBfmfrZTh+AsbDmenQXS0HJAHalZCM5bxIUxMeBkVIngiLEj6coNiisAbsRFEiDxZE
 +tWynZCkpFN7yJLf5ZZkM/un4dmqGfsgdBPNcSAxwJrZUKULmWYMKBcJKszJRuQBAgxm
 vRPI+ev68CubKfwlj6NkOGK9xie2sSZH1VY4f/2jNkpqVVtXJ1G89ZH1Oy76KJpApgOr
 JOEJaEXgIJlMoipmh1lVUNDeJHSKpLvSh4USGVpTI8sOC6tuJMk8AtrdaQnpiINZRLQ+
 16kg==
X-Forwarded-Encrypted: i=1;
 AJvYcCUxJES4OJgOlab71I9VXmlz5c9i9RqFEUO8rF2rx0o3p4vVqoQzgMIFWzlLp6juYfgDtgEuriJhi70=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YwJkXaKYEzmltFkMPkbnHAl4XgjTt067AMrT6qsfBaDXWyqVpHO
 Iz8b1SEBuCuoVrLpU9Y0dlyUZBr2NCDuQ+WlqupGw0hzKtEPIw0YrooC4VRq3YqvoxesUFFkjNi
 yXLDhEmJducraSEiIPAV1k9N/iwR0RN40XEu2ws2njgnkY9PBCfQhNbqtiIP/501p/3yh4M4=
X-Gm-Gg: ASbGncuK1LxmmDG/HYAUyChtvpYpNe15/JdZZM4TU+ouzhG6+5oYq9M4HsueOScDLfx
 gjAznlyDNRfluER6rQ3/kAHWduTUDZgboMRuIH7emqATTfv81UVMERPqePX1ky5xiL7KGWTgLQK
 zTh7buCr/8PCEXfKplPVL6f14mf2s2n9p0+SY4Az3CvpygSBGnalCv7pQ5GNFIHOAD+EjiXTM7h
 ZwOKpK4hJXD5Qnkcqg022IWcYfM8OwtHrESLIZG2NAmIQ6FKgHWaF3C8jUN3kF7P+BP4GTfzGJM
 cwLJQiH3DEjB+/NCDsY01o/MM6eLx9Os0BJjchQdR39XF4yP3Ixb2zyJ7KHtkbxBUxhK8cCudbw
 l6fAa/tcEV0/K2iCyug0ZzwY=
X-Received: by 2002:a05:622a:260d:b0:4ed:1ccb:e617 with SMTP id
 d75a77b69052e-4ed1ccbe7d2mr2855551cf.6.1761727942306; 
 Wed, 29 Oct 2025 01:52:22 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFhx7ax4/RlPT+IUaI3UXmPttDiy0gzUvlqhRIcryDt0sdvPy/2AnJ4i3HDDVRg6uQM7MD3xQ==
X-Received: by 2002:a05:622a:260d:b0:4ed:1ccb:e617 with SMTP id
 d75a77b69052e-4ed1ccbe7d2mr2855141cf.6.1761727941812; 
 Wed, 29 Oct 2025 01:52:21 -0700 (PDT)
Received: from yongmou2.ap.qualcomm.com ([114.94.8.21])
 by smtp.gmail.com with ESMTPSA id
 d75a77b69052e-4ed0817602dsm36760171cf.18.2025.10.29.01.52.13
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 29 Oct 2025 01:52:21 -0700 (PDT)
From: Yongxing Mou <yongxing.mou@oss.qualcomm.com>
Date: Wed, 29 Oct 2025 16:51:37 +0800
Subject: [PATCH v13 4/5] soc: qcom: ubwc: Add QCS8300 UBWC cfg
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251029-qcs8300_mdss-v13-4-e8c8c4f82da2@oss.qualcomm.com>
References: <20251029-qcs8300_mdss-v13-0-e8c8c4f82da2@oss.qualcomm.com>
In-Reply-To: <20251029-qcs8300_mdss-v13-0-e8c8c4f82da2@oss.qualcomm.com>
To: Rob Clark <robin.clark@oss.qualcomm.com>,
 Dmitry Baryshkov <lumag@kernel.org>,
 Abhinav Kumar <abhinav.kumar@linux.dev>, Sean Paul <sean@poorly.run>,
 Marijn Suijten <marijn.suijten@somainline.org>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>,
 Neil Armstrong <neil.armstrong@linaro.org>,
 Kuogee Hsieh <quic_khsieh@quicinc.com>,
 Bjorn Andersson <andersson@kernel.org>,
 Konrad Dybcio <konradybcio@kernel.org>,
 Jessica Zhang <jesszhan0024@gmail.com>
Cc: linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
 freedreno@lists.freedesktop.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, Yongxing Mou <yongxing.mou@oss.qualcomm.com>,
 Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1761727898; l=1133;
 i=yongxing.mou@oss.qualcomm.com; s=20250910; h=from:subject:message-id;
 bh=kT0nNkqfwLX+XjzaS7EK/w+Lq2GKCF3A4szZDCXzJMM=;
 b=z7KgsgL6QAqNhspcyEXiISLQx3yK4dMx/rLPpvzTlBHiZhv7tB4FcIzHldIVlGllvk5/X+Ibn
 7wQqJO/f0kqBH3aLICgSJ4J+ZrJZHN5Q9FIij8s0r7NDf2uFfNvEmCp
X-Developer-Key: i=yongxing.mou@oss.qualcomm.com; a=ed25519;
 pk=rAy5J1eP+V7OXqH5FJ7ngMCtUrnHhut30ZTldOj52UM=
X-Authority-Analysis: v=2.4 cv=Nu/cssdJ c=1 sm=1 tr=0 ts=6901d5c6 cx=c_pps
 a=EVbN6Ke/fEF3bsl7X48z0g==:117 a=Uz3yg00KUFJ2y2WijEJ4bw==:17
 a=IkcTkHD0fZMA:10 a=x6icFKpwvdMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8
 a=yyC0Gtz2zuuxwh5CSaYA:9 a=QEXdDO2ut3YA:10 a=a_PwQJl-kcHnX1M80qC6:22
X-Proofpoint-GUID: 8I7SCoOEzOrJudzEySCOLHoDQB05GDp6
X-Proofpoint-ORIG-GUID: 8I7SCoOEzOrJudzEySCOLHoDQB05GDp6
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMDI5MDA2NSBTYWx0ZWRfX9gMl34v9fmzP
 GiAVtpr7s/gnIWw7UNiwCTz4Nxhb97s1pKNZan90qpAsA4sRKzHRgQcx7TzVSt3lpI5N8Z9jPvs
 TXn6Y1u4mtXbNdrYBGWrU4hemcrkWXpVWQBEU7ZLFc3f1eYPetHsGMLQC8Dn57hicToTp1JUqot
 GsPTCOmeEJeWR0/YaSjnp9kVpYgo3taeBY7GA89bFpIFKoUNxlmnzeGSivgFstazMl/l7ZcIxuR
 w4SQM3DtFULsglSBHiP2zk+WMThXQM0S9+j/aHSW4zw0Hrlda+ronBZXY214GmYJHJ5QeWJjA5M
 ofG2SA3+LuQ0YXxu30KMn3hzMbzLOkZMFuNokHn3Nig94FtJw43Mg/r7p8KHMvrmy/9xh9eTiXr
 yGuPJv4PCR+PGXhlHQimbsNuhea0nA==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-10-29_04,2025-10-22_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 priorityscore=1501 adultscore=0 suspectscore=0 clxscore=1015
 lowpriorityscore=0 phishscore=0 impostorscore=0 bulkscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2510240001 definitions=main-2510290065
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

The QCS8300 supports UBWC 4.0 and 4 channels LP5 memory interface. Use
the SC8280XP data structure for QCS8300 according to the specification.

Acked-by: Bjorn Andersson <andersson@kernel.org>
Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Signed-off-by: Yongxing Mou <yongxing.mou@oss.qualcomm.com>
---
 drivers/soc/qcom/ubwc_config.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/soc/qcom/ubwc_config.c b/drivers/soc/qcom/ubwc_config.c
index 7cca2afb68e3..942fe6c17612 100644
--- a/drivers/soc/qcom/ubwc_config.c
+++ b/drivers/soc/qcom/ubwc_config.c
@@ -249,6 +249,7 @@ static const struct of_device_id qcom_ubwc_configs[] __maybe_unused = {
 	{ .compatible = "qcom,msm8998", .data = &msm8998_data },
 	{ .compatible = "qcom,qcm2290", .data = &qcm2290_data, },
 	{ .compatible = "qcom,qcm6490", .data = &sc7280_data, },
+	{ .compatible = "qcom,qcs8300", .data = &sc8280xp_data, },
 	{ .compatible = "qcom,sa8155p", .data = &sm8150_data, },
 	{ .compatible = "qcom,sa8540p", .data = &sc8280xp_data, },
 	{ .compatible = "qcom,sa8775p", .data = &sa8775p_data, },

-- 
2.43.0

