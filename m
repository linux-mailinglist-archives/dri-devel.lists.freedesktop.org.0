Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C57A0D3A117
	for <lists+dri-devel@lfdr.de>; Mon, 19 Jan 2026 09:14:49 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 61EAE10E390;
	Mon, 19 Jan 2026 08:14:47 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="b8Ckh+nQ";
	dkim=pass (2048-bit key; unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="Czi2ucWe";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com
 [205.220.168.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 91C3F10E102
 for <dri-devel@lists.freedesktop.org>; Mon, 19 Jan 2026 08:14:44 +0000 (UTC)
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 60J83tql4056338
 for <dri-devel@lists.freedesktop.org>; Mon, 19 Jan 2026 08:14:44 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 2tTHPmj2NBaJb//qs7JmAmt97xPSCIRHJxgVnBNp34c=; b=b8Ckh+nQruCBx6g3
 Yv5/PMCoCm3zn5m4yKZVY8bQmfKpDg/eL0MlBGND1hmbffxHP7cPhbS4fEgNpxH5
 V4UUpIZxikIvZIYP0FF/q4TEq4Nu6uLoSyE2YMYishwGk8V3+5DIG7bB8ZpA6nNE
 K3CtVz/Y/EW5Ch3dDiDCSK/pU8uyj2RwPuuTdeBBFRnEncUUWbBsmNBc5NYOgcCF
 9NTb+4b2YxOaF5cIuS4UrzaRmitT0bmABZSFz0cTs6J4TVFrJA6HfIUowSgBZKVd
 jaTv4EEQ1VmpBS7j4QFC9SLMn7vlgAJGsRLi8xrVxrcwwdKARG0tg8WDxD/E+1tY
 ktrqfg==
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com
 [209.85.222.197])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4br04e4mjv-1
 (version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
 for <dri-devel@lists.freedesktop.org>; Mon, 19 Jan 2026 08:14:44 +0000 (GMT)
Received: by mail-qk1-f197.google.com with SMTP id
 af79cd13be357-8c52f89b415so1011277085a.0
 for <dri-devel@lists.freedesktop.org>; Mon, 19 Jan 2026 00:14:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oss.qualcomm.com; s=google; t=1768810483; x=1769415283;
 darn=lists.freedesktop.org; 
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:from:to:cc:subject:date:message-id
 :reply-to; bh=2tTHPmj2NBaJb//qs7JmAmt97xPSCIRHJxgVnBNp34c=;
 b=Czi2ucWevX66iiA9ciZTnvcvxgZZwBrr6nIhXQUwwv0Nnb4IL7n4fMscxdhS7nFX55
 w3Wrbt/7EfsmpQTDQEcJj3MmAPom6l1t3A0amhREhUlbRqrsOVeX8HFbALBIUPL0ehSm
 dOWnBV2uC1BtBRph9TJNbTYZzgQ9kxOzNZhCXw473HbQ686nCRYtUYuFGL4V8B4rNn4j
 pGB7ALWvDLk3Yyf/vFGaeGKwYZH3ezgyih/tkmElOS44VfpGldNrwma0yM9mQIiGKLr2
 +abFEUol/waN/+975OpUqmlWBV3Tk7ZeygCSe11BXhOFs5F3tNMlHMRA+XIM5We9R2q3
 x3Vg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1768810483; x=1769415283;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
 :cc:subject:date:message-id:reply-to;
 bh=2tTHPmj2NBaJb//qs7JmAmt97xPSCIRHJxgVnBNp34c=;
 b=mylKbtQ8KhbQhZVkgq0LhniPq4Dlgcm+EKO5pdNs6/NQdBAq42w/ljqDEm63pI52Hx
 qK8JrkMxFi+RrVnOGlrYRRhid75fiswV6zxBKkbBIU6VHg/0wyaGQeaEaXLQ6rJTBhfI
 lUbuw6xrGjx0bh5jEANsoTac05ZCzg+EQF/ULO6+UZQq8/K3HJpyqDdRoNTivm0GGDDD
 iVZZ1JXeVNy/nLK1QsX5Z5lUB/qeJeATz6QQQ9y6RtDeOLrU/CCJvKjoIDSulJwkrzCN
 VmxIK3QjirKHSrhzaaDp5MXBGijTnHmLzWgXFIbZh75Y+rlA0G1pLIn+UJenHGJz2XXG
 QwoA==
X-Forwarded-Encrypted: i=1;
 AJvYcCVBN5hq/7H93R6tMBju1gLLxoJVivUHbDWm9oVp6VRd/AN4kHbwHvUZBLHyFG/qWeXQiA7XQ1XJUzk=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YyLjLzQpAmj368P4deIC30lKDL1C7ecLCf9cHZzf1oREpnKI9IB
 PWUze8TrWjYS6Zyb3aW5t+AgieCWGvrLwwlJx/q+wVniAn4wwan8YxJn3BJ9PML0fz0/skE4UGS
 a3vCyE9ryAlrzN3aTFsqBR+art75OkFHNABhKSUBFzOXPESEPpLBkJ8xiQpE04V4eSHIgBic=
X-Gm-Gg: AY/fxX6/gsQEUM2UDGw3yZi8ZFDssG5hLuYtQA4/sERj9pnlM8k4UYUf+534TOP63UQ
 nPtUhONtR7+IRzDqUScPTMM6Hb7H0KdcSzq1ae/VHb+ZamRaen2uZaeHcTIpQrWjPZmPAlYrVrG
 P5ewha0MzYEgV6yh6yPZNbhxH1mBcuVNlDnOCYngrz7yrHhJratCOSS0gudM9DtMK3oJcsdoosd
 RGue7HuUf4igXDtwP5htC9upOwh6x5UQJX+4LQpogQJ/39YhbDmQoYjTDCwExnB7dFOQln1Reg+
 G3lvFFlGb9YPXvMenhw6CjxdF3AWl+l6LKs2K+dvNWwpU+RWAOF14Svsp5/pbIepB3BJrd9mK63
 k/yxuUI50v5vhB9acQcSWTco0tKonWo+S2f6G2MTSDtxJhkkGM2J8CTsRNbFhaFzsDQKj3+qlxn
 UasdDTN3pC3PAcfEg+iJYiGRE=
X-Received: by 2002:a05:620a:3712:b0:8be:88f2:5b15 with SMTP id
 af79cd13be357-8c6a670f6e8mr1458673885a.38.1768810483127; 
 Mon, 19 Jan 2026 00:14:43 -0800 (PST)
X-Received: by 2002:a05:620a:3712:b0:8be:88f2:5b15 with SMTP id
 af79cd13be357-8c6a670f6e8mr1458671285a.38.1768810482685; 
 Mon, 19 Jan 2026 00:14:42 -0800 (PST)
Received: from umbar.lan
 (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi.
 [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
 by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-59baf34d572sm3063845e87.24.2026.01.19.00.14.41
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 19 Jan 2026 00:14:42 -0800 (PST)
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Date: Mon, 19 Jan 2026 10:14:37 +0200
Subject: [PATCH v2 1/4] drm/msm/mdss: correct HBB programmed on UBWC 5.x
 and 6.x devices
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260119-msm-ubwc-fixes-v2-1-e0c8c630fdd3@oss.qualcomm.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=1114;
 i=dmitry.baryshkov@oss.qualcomm.com; h=from:subject:message-id;
 bh=Rj8iAyMfVncSKRo62kAtziE4yMoYdmQABsHSh5kDWEY=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBpbefuQyz/KDw5+L2NGZr/8tgfTvkCZZ6LwB57K
 VEiKShTdROJATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCaW3n7gAKCRCLPIo+Aiko
 1dL+B/47onnFk9FOGKSyu2tzszeBJMJknaST8XNmfVXnyT8fSrNmF7Tcug9qjZ+iy/tW8/viW8n
 kcj8bw+OmmOeCpqvAxBfzRbuTJBuI6EAZt60h9SqdwdyJ4lTE8uGF4Z1TRvSD+psuBqrNBYCmYo
 0Em1AMukV4Xw8gYOnQmrW64huNldZEFeeDGulwGIJOVqNDj4cPMn+UZPVFu2mlkdndXp6FhxuiA
 8zuGRmL5u8zO1/BCirhUE5Y66fxqpYt/x2Dukek7vZ/znMnhqHY2kRClGWeA8Ez3RwLC1a+HQ2n
 4MA591fvbGA8hFNktnhBKeLPYe0FhbMsAqQxsdqTG7I+XEnl
X-Developer-Key: i=dmitry.baryshkov@oss.qualcomm.com; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A
X-Authority-Analysis: v=2.4 cv=J5OnLQnS c=1 sm=1 tr=0 ts=696de7f4 cx=c_pps
 a=50t2pK5VMbmlHzFWWp8p/g==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=vUbySO9Y5rIA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=EUspDBNiAAAA:8 a=iGWu5DhtBPyiFZBs7r8A:9 a=+jEqtf1s3R9VXZ0wqowq2kgwd+I=:19
 a=QEXdDO2ut3YA:10 a=IoWCM6iH3mJn3m4BftBB:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMTE5MDA2NiBTYWx0ZWRfX1bs5d/G1RAYc
 /635sqtdzz2l+mrH+3Ivrme05N4Ik297L+A6IhDR8ktzISldOJ7o/XwVRbP2GFOzV8pOQBGWGxb
 rMjeA30DsGeNgPL5Opc7VqRaMaw/Dv9F6qZuFRCXCi6ITWu/17uK1FlIlvtOY4odfgzHuIcDpgo
 VA78rq1YBmRIXYMOcc+YZFf4iKAVHqHpYRu5OXHTPYB9IaFpUvpYTyVZRlvYlRCv7wXN1uwQjsN
 AUQijY9oY3mAy/RxaBo9AUwVeZf0KiQzDGU4N6C98fZXJRtkqr9YqMggqaOn6hD3smq284Gt05e
 oFWQ2CCAHaEwmjAGUWFRNJaObbIcyIcjWNb7KKlHWWU3kzSozzH51mL2xYnasliVAt38Ece2bb5
 Y0tQqFhQ23bIZThNqHGLU5LmO49eoehhQv8YpnslwjO03V2sGTUMtNKVye1gOp7bZ8yopR9EdwZ
 EpjnrzG8+0Donnf9XVg==
X-Proofpoint-GUID: J3Yd0rv5jGTMKZyoRNgq73WZOpAskVAb
X-Proofpoint-ORIG-GUID: J3Yd0rv5jGTMKZyoRNgq73WZOpAskVAb
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2026-01-19_01,2026-01-19_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 suspectscore=0 adultscore=0 bulkscore=0 priorityscore=1501
 clxscore=1015 malwarescore=0 lowpriorityscore=0 impostorscore=0 spamscore=0
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

As in the previous generations, on UBWC 5.x and 6.x devices the Highest
Bank Bit value should be programmed into the hardware with the offset of
-13.  Correct the value written into the register to prevent
unpredictable results.

Fixes: 227d4ce0b09e ("drm/msm: Offset MDSS HBB value by 13")
Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
---
 drivers/gpu/drm/msm/msm_mdss.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/msm/msm_mdss.c b/drivers/gpu/drm/msm/msm_mdss.c
index bf9a33e925ac..910242f5a71f 100644
--- a/drivers/gpu/drm/msm/msm_mdss.c
+++ b/drivers/gpu/drm/msm/msm_mdss.c
@@ -229,7 +229,7 @@ static void msm_mdss_setup_ubwc_dec_50(struct msm_mdss *msm_mdss)
 {
 	const struct qcom_ubwc_cfg_data *data = msm_mdss->mdss_data;
 	u32 value = MDSS_UBWC_STATIC_UBWC_SWIZZLE(data->ubwc_swizzle) |
-		    MDSS_UBWC_STATIC_HIGHEST_BANK_BIT(data->highest_bank_bit);
+		    MDSS_UBWC_STATIC_HIGHEST_BANK_BIT(data->highest_bank_bit - 13);
 
 	if (data->ubwc_bank_spread)
 		value |= MDSS_UBWC_STATIC_UBWC_BANK_SPREAD;

-- 
2.47.3

