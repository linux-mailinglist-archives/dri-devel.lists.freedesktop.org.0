Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 89D91D2D2A5
	for <lists+dri-devel@lfdr.de>; Fri, 16 Jan 2026 08:27:50 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9BA0B10E810;
	Fri, 16 Jan 2026 07:27:48 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="mfJSSDoD";
	dkim=pass (2048-bit key; unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="MoSA07Cp";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com
 [205.220.168.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B558310E808
 for <dri-devel@lists.freedesktop.org>; Fri, 16 Jan 2026 07:27:42 +0000 (UTC)
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 60FMbZsa1240933
 for <dri-devel@lists.freedesktop.org>; Fri, 16 Jan 2026 07:27:42 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 wgF62A0Vusbbe68co/vJ8MiSnUGF6/3kIJAgIkf9pl4=; b=mfJSSDoDKd+l0yyp
 nPbIotzAReyT4WSca4wXc2GjvafC4liDhf+VlJGNE1ZvWHiSH+oXxLPVNyYkVRix
 5T6/UZdyBbesDwEVfCanCcpXR3S3/zjlMreLMd4JVrSDo1Lxq9h4RzD5BSrhF64C
 16gNioOhE5B9G8+Slu1JidtG7zzhFttMbLihz4BKALZzSMbzL4l8Z4W4tpCcN/Cj
 YRGnaTdv6ODjgkKqteavI5z7qMjZB9T5U8HKlZlzIXExlsw90tJX3XJ6IDcaje6P
 tXKmgqQVvuZUA0IaZ8pd9w4DSq618aEQNbzZRjT9LA/qgovz4X4BFda+dfnKimCb
 mEs1Sw==
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com
 [209.85.222.200])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4bq96ss7ae-1
 (version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
 for <dri-devel@lists.freedesktop.org>; Fri, 16 Jan 2026 07:27:42 +0000 (GMT)
Received: by mail-qk1-f200.google.com with SMTP id
 af79cd13be357-8c52f07fbd0so786883185a.2
 for <dri-devel@lists.freedesktop.org>; Thu, 15 Jan 2026 23:27:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oss.qualcomm.com; s=google; t=1768548461; x=1769153261;
 darn=lists.freedesktop.org; 
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:from:to:cc:subject:date:message-id
 :reply-to; bh=wgF62A0Vusbbe68co/vJ8MiSnUGF6/3kIJAgIkf9pl4=;
 b=MoSA07CpdcWT0BSAP3skE6j/jWYFJ7TIZX0wkiqh2PD9MuvR7byuEHwij6AfBdbasg
 q23P+4kazQ1K533g9IccF9he2oJr3I5oWRAxnx8NY/AfXrdd97bko9BDQyJ5aSILkGzB
 vt7E1nwUbAqARlCU2wjmqZWCIpTILuT+F8jSbJL/gHEOFeFU5zAVhRmibFNL/aDSl4ei
 vKwnXOpxTjw04FQwHFSlVj5Cu4wYQ+mTJjOPYzGXc8MIkROvFk3CscZZxynIW0uxKX2T
 92cn/RA6Hx087AgNRMrOdvFRoY11UwE3h5MDax98Je1aP0F6IXASvwve/yiPNQ1W+ksK
 QgFg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1768548461; x=1769153261;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
 :cc:subject:date:message-id:reply-to;
 bh=wgF62A0Vusbbe68co/vJ8MiSnUGF6/3kIJAgIkf9pl4=;
 b=Ir00CKW/smmXvnt7+DRcHZhS4ZSRGTqeSUdqSklvx9ljxji/gB2ES5TMypnU47zH8b
 +QPUSllsxOWNnvtkaguBmC6kqNBSKqZgPuacxtfxbDqe7EqZczkcPns824+Pc2MaFn8V
 VboeT3wP3P/O5xtGmd34Fb3nGXJr2/icUixcnOPkSswNZErlVeISZ3poyJcAJSpqDC9I
 tki5bZZ3dYBne2rFBmxz488VSxfiwACLGUF+K5LcWri/oA52uZINwJFTyJln1SNmQuTg
 3BBKFm/MT+J95xNoDTp2E1MhMC91nInbc0UUFy45P1w7YbWiIAsX4lxQCS0fnXG8JdwS
 92vQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCVd2uMGp8s1VfVTDjeM1R3bQ/JQl3k20Oi0mfM6m676Cx6UpTIfcVgM6pMpjaBN3H5dT1vg5aOxRwQ=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YziDvzQEmZcEAU8j7iA9GYFfNbYrV/vN5Rx/7nqQBvKNftOh2+4
 z83M5CcCrvbl5sJ1ZXkANk5/82EVNNg4RG969Wy0B1ixsC3ylwrMuSY2aVQLnBYbm7BwXdCBOjR
 5WqMEEdCaMNZe0rrUVITJQ3fzxTzk3an5E6gXbsiu+pc3VDYVqUhRNY3udtBCCp7ZRMYn3vc=
X-Gm-Gg: AY/fxX6LzpZrdIf/aMieEO1gmkFEInJSPhFW/Cwg3k4v/HtIWSb9dcQgr0rVQOmU/it
 I085wSc0b9P3tAoz6FU8ht+o5S8y1CwdCEzlk4HwwAyfzZJh1qHyqXDW1cJe6xwAYZV7RLaplQE
 uKSdm6VRv+F48Eor9eZ7G6xQyJZfQP1luSo980WghdnbwOElSiu82rFAWdBGIzW/2AUqsr/ku1x
 4Y4hFqcP1I4E0SMSAFAmuobqC8bpokghuqCcytNiuh+EfBT64U8ScskDFlhlBGRZDoZ9HIniGZH
 uJ0l+DQpFyk4d632iLH0c1Z/HNldz0O5GIz1RuVwZBLwc0QoDC/k7Znp5E4Fd+0nyDyqqEy8kqw
 7jehkX6U5qHBeRvWVIJVRZhNRn6twfNkeRkHstpgjLKeskpWvYeCINyxRNHb7ZwNUcF0pTlZmwn
 6udW3FtOH0K5AEt2EDdSnlHGc=
X-Received: by 2002:a05:620a:199e:b0:8b2:730f:134b with SMTP id
 af79cd13be357-8c6a6944de0mr277056485a.50.1768548461209; 
 Thu, 15 Jan 2026 23:27:41 -0800 (PST)
X-Received: by 2002:a05:620a:199e:b0:8b2:730f:134b with SMTP id
 af79cd13be357-8c6a6944de0mr277054785a.50.1768548460795; 
 Thu, 15 Jan 2026 23:27:40 -0800 (PST)
Received: from umbar.lan
 (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi.
 [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
 by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-59baf3976dbsm516941e87.66.2026.01.15.23.27.39
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 15 Jan 2026 23:27:40 -0800 (PST)
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Date: Fri, 16 Jan 2026 09:27:35 +0200
Subject: [PATCH v3 1/9] soc: qcom: ubwc: add helper to get min_acc length
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260116-iris-ubwc-v3-1-662ac0e0761f@oss.qualcomm.com>
References: <20260116-iris-ubwc-v3-0-662ac0e0761f@oss.qualcomm.com>
In-Reply-To: <20260116-iris-ubwc-v3-0-662ac0e0761f@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>,
 Konrad Dybcio <konradybcio@kernel.org>,
 Rob Clark <robin.clark@oss.qualcomm.com>,
 Dmitry Baryshkov <lumag@kernel.org>,
 Abhinav Kumar <abhinav.kumar@linux.dev>,
 Jessica Zhang <jesszhan0024@gmail.com>, Sean Paul <sean@poorly.run>,
 Marijn Suijten <marijn.suijten@somainline.org>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Akhil P Oommen <akhilpo@oss.qualcomm.com>,
 Vikash Garodia <vikash.garodia@oss.qualcomm.com>,
 Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>,
 Bryan O'Donoghue <bod@kernel.org>,
 Mauro Carvalho Chehab <mchehab@kernel.org>
Cc: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
 linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org,
 linux-media@vger.kernel.org, Bryan O'Donoghue <bryan.odonoghue@linaro.org>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=openpgp-sha256; l=1369;
 i=dmitry.baryshkov@oss.qualcomm.com; h=from:subject:message-id;
 bh=/pPr+dRIKfLnp8Q3woKxExVLtAqBn6gFla+MK36Boq4=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBpaehpR1T3VBTIQkkyCWtBdhXU5YpA+KxUORAvI
 bellaztkwCJATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCaWnoaQAKCRCLPIo+Aiko
 1UwDCACat6lqDOs4O4mFhWUV0YM5NoK2p4O7go9R7f0ZP2lW1boDmpYL47eINtt7v81/t8RFexC
 4JyVdynfkAM43wuBa6wCrWHDm04nxJLr/RX92tSdynVM15uH4aghcMVvVPG4ZLY2labtWx/9Tvi
 om95wvBAbbvZf3vkD/+b6xrtcbefxRkV6qZBd0zUZpBMWwDSshmEfknkyOgxp5WMpAB6VF7muQo
 8LYHaCxcO/ME5Lr+6cQWMQjRHtmP6u9+tD4LYYm8hhN192xaRuwwzh/YZpUaDlXUQkWN+aWiHpB
 S49ef/WFOg5lgsl8P5TSbpTq3Ad4uehuOholTmwFweY7gMfF
X-Developer-Key: i=dmitry.baryshkov@oss.qualcomm.com; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A
X-Proofpoint-ORIG-GUID: X1JtpXi0ftkk3pDkL5Sh7ig2Rcc01Qkf
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMTE2MDA1NyBTYWx0ZWRfX1vhGOhoNl+q1
 dcaw7QNJjMM5gdaAhZBoEQhwFfmclZuWlmvQ0leqNU3CAzg7j0SrtFPdbUNkmp/w3nC2aojqdMi
 wahQC6GNhov0kd6hgA9BaaVDAfpdKLi0H/tt8Sdb0eQcd4cFeFv9djFh+55WNB3ZmlBs+5oXBkt
 qEPIxahq8mQIV9R5tZwOhrjuqY51SASZTfWYHU9FH78P7HzwrhhYbv0F9Ki6tV3Y4kv2Mp+XlUa
 G5e07TVNJZAli2b02UW4sGcE7wqyDpyUv4QmJPih+NcnqnbLTTv5NF1HjkqAbHuNOl/8eLpugig
 U+pSITFSsTGXPn1DKHaU0vhxiMJWaUC2myQeBi+JNY4t7L/XZPykO0KnlT/xu4Fu/37h4mWZC9O
 xQs979J5zW9LLwsnhJLvss4UbNLLsTstYqd+F85aZinD3iIuRry7rMSp/hezRaG0NtPDViL6MZJ
 1LIGiB14MZZuRMqHYGA==
X-Proofpoint-GUID: X1JtpXi0ftkk3pDkL5Sh7ig2Rcc01Qkf
X-Authority-Analysis: v=2.4 cv=M9tA6iws c=1 sm=1 tr=0 ts=6969e86e cx=c_pps
 a=hnmNkyzTK/kJ09Xio7VxxA==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=vUbySO9Y5rIA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=KKAkSRfTAAAA:8 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=ZnE8w8QzOYjIZ_Lrp0IA:9
 a=4tUkUnfIpJ8A:10 a=QEXdDO2ut3YA:10 a=PEH46H7Ffwr30OY-TuGO:22
 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2026-01-16_02,2026-01-15_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 clxscore=1015 malwarescore=0 bulkscore=0 impostorscore=0
 lowpriorityscore=0 adultscore=0 spamscore=0 phishscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2512120000 definitions=main-2601160057
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

MDSS and GPU drivers use different approaches to get min_acc length.
Add helper function that can be used by all the drivers.

The helper reflects our current best guess, it blindly copies the
approach adopted by the MDSS drivers and it matches current values
selected by the GPU driver.

Reviewed-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
Acked-by: Bjorn Andersson <andersson@kernel.org>
Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Reviewed-by: Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>
Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
---
 include/linux/soc/qcom/ubwc.h | 10 ++++++++++
 1 file changed, 10 insertions(+)

diff --git a/include/linux/soc/qcom/ubwc.h b/include/linux/soc/qcom/ubwc.h
index 0a4edfe3d96d..719b31c8fb3c 100644
--- a/include/linux/soc/qcom/ubwc.h
+++ b/include/linux/soc/qcom/ubwc.h
@@ -73,4 +73,14 @@ static inline bool qcom_ubwc_get_ubwc_mode(const struct qcom_ubwc_cfg_data *cfg)
 	return ret;
 }
 
+/*
+ * This is the best guess, based on the MDSS driver, which worked so far.
+ */
+static inline bool qcom_ubwc_min_acc_length_64b(const struct qcom_ubwc_cfg_data *cfg)
+{
+	return cfg->ubwc_enc_version == UBWC_1_0 &&
+		(cfg->ubwc_dec_version == UBWC_2_0 ||
+		 cfg->ubwc_dec_version == UBWC_3_0);
+}
+
 #endif /* __QCOM_UBWC_H__ */

-- 
2.47.3

