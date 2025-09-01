Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C0226B3DF37
	for <lists+dri-devel@lfdr.de>; Mon,  1 Sep 2025 11:58:31 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F309410E3F8;
	Mon,  1 Sep 2025 09:58:29 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="JWAhe3A1";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com
 [205.220.168.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 194A210E321
 for <dri-devel@lists.freedesktop.org>; Mon,  1 Sep 2025 09:58:29 +0000 (UTC)
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 5819eWSD004552
 for <dri-devel@lists.freedesktop.org>; Mon, 1 Sep 2025 09:58:28 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 WIK2qr3/NE94iQwkqEL7J6K1o6tIhuvxaoMJhpu+NbY=; b=JWAhe3A18RmjzDzZ
 Z0AsmrpBxizSatiAvThVXP2/Wmn3h8IfP14ej9OKyOd4uWbVwYKTGh5K71Gcxg5i
 AquS9r6CT/z5Xvpi8TucNSAOhQS4HOmXa4DUJM5GbQva1hIvLcUAgWBuIszMoZht
 78v8V1nrUwwIq638aGRMtOCjTGDpvcWTlLBZNdz+H2CRa8psa5dxMkivuI9a78sn
 GUs62Gz5jm3Cm4yQeqTUE+5EYEPWHxWlsFeZQK+tqwxwNpQVt97jAyHqh30q0sfn
 uP4PxMkeJ9ZqEX38uWAguaeJe6Bc1yLOlpgMGNuZ3xTsnhLrTIS+EF70mxtNYMTR
 L/1A5Q==
Received: from mail-pg1-f200.google.com (mail-pg1-f200.google.com
 [209.85.215.200])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 48ut2fc7pg-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
 for <dri-devel@lists.freedesktop.org>; Mon, 01 Sep 2025 09:58:28 +0000 (GMT)
Received: by mail-pg1-f200.google.com with SMTP id
 41be03b00d2f7-b4f738792b0so1411552a12.3
 for <dri-devel@lists.freedesktop.org>; Mon, 01 Sep 2025 02:58:28 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1756720708; x=1757325508;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=WIK2qr3/NE94iQwkqEL7J6K1o6tIhuvxaoMJhpu+NbY=;
 b=cj/e0yxBoPSgpvuVnx5W611qPDxOqKlgm0OYDkzdOpADYERHoiYJtujuc/AjCjXnia
 vnPp4L19Vq6FGSQqm3xuYL9eJWV/5jydfFB9pe0LFmkaeoFpWrJfth/EcZCBGgYQDDtn
 hMr7T8z+wZ7pzHtelFv+J/wLS9ji9nQb4F6w2h12nBNx+KTMpU/3TkHxZdl/0AJZBLUo
 xIEE7B6rXv7M3c+duQ9n/0bBEkwjZE8iYRn1XYfXRLBN0HfPEU2g2vLPtnSMryKLIDv5
 crsrGCDgoR58em4RifwQiA8nwF4D24qYSn7ULKHES0XJLzQYM8d198hZj2aFY/LTMg+Q
 xOSQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCXOEL1CBg3I1x86xpSMHhU6HRrkzVDdHGOyNU4ayJBH1eU8g/IWNd8o75HuRI9I2bf5mO1cYWnmzhQ=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YwieJGBk55kccCRBkaiCSGRFHWJgg3a7Bw6V/RN17UC6X0j4DV/
 jAL27lpceZq54FJ7ST1Cduw2SiO/OAuAlBf2nH9lY2219Mweoc37Z6fQzsvXH46Q7jG+Q1S7BJd
 HkJbH1iXbbE7Qeo01AUXgR7OgzPBR2zlYXTtOeqZ3+bIM1Kj3we00E9IXQUtQ7zoSJq7UBvE=
X-Gm-Gg: ASbGncunnvb3YdflParDRT52/VNu7naM3Z4bwpIgB4hBF//whuGDsPR3BTBx+6IZGi3
 ayLPpPyC77eUBX0mEBHBQrGyh6m8OkS/BOHwrSjalr47FO32R8f3u1F8YAVSyhtbC2Mc3p+ePqd
 BgNTb2Ynm7XaaRHToltXWmpPPiIQ03sQMl4DvCDMYzAYToHp/CdGsBMc9nRWA3rGBgP83WvcJDT
 URG8BG00raUWJyxnYpH4OyTIUWttuHMRyRMy83DxgdQkGKJB60yXSNzO58PSFbmBoS858gCgqhM
 gSYCRiztgdR7KTqettxMxkpdZ0ovRbG1lGEtH1tUdU7iT9bOZ7UTrrA+JuRXxtNmycVCaYU=
X-Received: by 2002:a05:6a20:12c7:b0:243:b411:ae53 with SMTP id
 adf61e73a8af0-243d6dd56acmr9552546637.11.1756720707585; 
 Mon, 01 Sep 2025 02:58:27 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IE0MoPFSikRmyDViMrlgzOfYeCyLjAV52qLyprlfZ2BtiAd4BuV9Kdl5fEac8p72y1J2WvtDw==
X-Received: by 2002:a05:6a20:12c7:b0:243:b411:ae53 with SMTP id
 adf61e73a8af0-243d6dd56acmr9552504637.11.1756720707109; 
 Mon, 01 Sep 2025 02:58:27 -0700 (PDT)
Received: from cse-cd01-lnx.ap.qualcomm.com ([114.94.8.21])
 by smtp.gmail.com with ESMTPSA id
 d2e1a72fcca58-7722a26bfe2sm10305656b3a.14.2025.09.01.02.58.19
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 01 Sep 2025 02:58:26 -0700 (PDT)
From: Yongxing Mou <yongxing.mou@oss.qualcomm.com>
Date: Mon, 01 Sep 2025 17:57:32 +0800
Subject: [PATCH v10 4/6] soc: qcom: ubwc: Add QCS8300 UBWC cfg
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250901-qcs8300_mdss-v10-4-87cab7e48479@oss.qualcomm.com>
References: <20250901-qcs8300_mdss-v10-0-87cab7e48479@oss.qualcomm.com>
In-Reply-To: <20250901-qcs8300_mdss-v10-0-87cab7e48479@oss.qualcomm.com>
To: Rob Clark <robin.clark@oss.qualcomm.com>,
 Dmitry Baryshkov <lumag@kernel.org>,
 Abhinav Kumar <abhinav.kumar@linux.dev>,
 Jessica Zhang <jessica.zhang@oss.qualcomm.com>,
 Sean Paul <sean@poorly.run>,
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
 Konrad Dybcio <konradybcio@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
 freedreno@lists.freedesktop.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, Yongxing Mou <yongxing.mou@oss.qualcomm.com>,
 Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1756720667; l=1189;
 i=yongxing.mou@oss.qualcomm.com; s=20241121; h=from:subject:message-id;
 bh=/6uXAHc8u+Q/a1DjNDEMhzB6keYn2be9cZkXxsbUEe4=;
 b=nK6UeSTKXTGBlXsu+2YyHgK746mWAkfKz4qckJV50Abj9bxG53cDZdJiYOqMQxNf7O3dZGDFd
 9T377LelwR/AzsUUYDWRurQHcDtjXdMspfr4wjyZmrzODmxcjjtqknA
X-Developer-Key: i=yongxing.mou@oss.qualcomm.com; a=ed25519;
 pk=zeCnFRUqtOQMeFvdwex2M5o0Yf67UHYfwCyBRQ3kFbU=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwODMwMDAzOCBTYWx0ZWRfX01EqndIcx8n0
 bd0wXuHRmBYjGTv1kPyU4TXQRwkSg5IsT1JaY+zY7+S2I2vUPTFbvTx31TOTMG8TrkZKEVMNv4o
 i8Jeh6XS2hBFtZBzzbTR7ZwoCUYGt6iKK+AKli1UFZemK5ml+9OlfzNWFNyFiO66eMpf7HnxOBf
 TGua9Nc+ID4r3d3H0ENp4udlpGhCcO33Boq36NtoZzHvIT5UxvPNylCG92dBN0RXd+zn//dDjTW
 H8q+N/iExjCclhKyvx+PRD3OIkMnk/XQrmYIK+6UA50SZkqoGS51FkVGRcLByihPjJV9S23O6zU
 OVgug0j0mTk9em3iEAfgqSNPjd2h4h++vd675YC8h23bZrf1f5PtB5IpMor3TysGF33XLJgrJ09
 Rlm3ql1j
X-Proofpoint-ORIG-GUID: vUwSxD7adqlL2fA3-AzfTr_fjanlv-0W
X-Proofpoint-GUID: vUwSxD7adqlL2fA3-AzfTr_fjanlv-0W
X-Authority-Analysis: v=2.4 cv=U7iSDfru c=1 sm=1 tr=0 ts=68b56e44 cx=c_pps
 a=oF/VQ+ItUULfLr/lQ2/icg==:117 a=Uz3yg00KUFJ2y2WijEJ4bw==:17
 a=IkcTkHD0fZMA:10 a=yJojWOMRYYMA:10 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8
 a=yyC0Gtz2zuuxwh5CSaYA:9 a=QEXdDO2ut3YA:10 a=3WC7DwWrALyhR5TkjVHa:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-09-01_04,2025-08-28_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 phishscore=0 clxscore=1015 impostorscore=0 suspectscore=0
 malwarescore=0 priorityscore=1501 adultscore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2507300000 definitions=main-2508300038
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
index 1490a7f63767bba176e8e2e76891d7d2c424bb7f..b70627d40dc4c671b8a855a17d4b8ca2dd9952d5 100644
--- a/drivers/soc/qcom/ubwc_config.c
+++ b/drivers/soc/qcom/ubwc_config.c
@@ -236,6 +236,7 @@ static const struct of_device_id qcom_ubwc_configs[] __maybe_unused = {
 	{ .compatible = "qcom,msm8998", .data = &msm8998_data },
 	{ .compatible = "qcom,qcm2290", .data = &qcm2290_data, },
 	{ .compatible = "qcom,qcm6490", .data = &sc7280_data, },
+	{ .compatible = "qcom,qcs8300", .data = &sc8280xp_data, },
 	{ .compatible = "qcom,sa8155p", .data = &sm8150_data, },
 	{ .compatible = "qcom,sa8540p", .data = &sc8280xp_data, },
 	{ .compatible = "qcom,sa8775p", .data = &sa8775p_data, },

-- 
2.34.1

