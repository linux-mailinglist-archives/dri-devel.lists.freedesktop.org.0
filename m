Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id DF732D38CE4
	for <lists+dri-devel@lfdr.de>; Sat, 17 Jan 2026 07:36:08 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C1E0310E28B;
	Sat, 17 Jan 2026 06:36:06 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="H6ZGO5UD";
	dkim=pass (2048-bit key; unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="Cu/0DTcV";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com
 [205.220.180.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4B8F010E250
 for <dri-devel@lists.freedesktop.org>; Sat, 17 Jan 2026 06:36:03 +0000 (UTC)
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 60H3VYrI2924739
 for <dri-devel@lists.freedesktop.org>; Sat, 17 Jan 2026 06:36:02 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 2tTHPmj2NBaJb//qs7JmAmt97xPSCIRHJxgVnBNp34c=; b=H6ZGO5UDfKJ9ThXp
 7/j2frgM59P/RJzsMIxNqq8aC3y2O1gGrrd+B8xRl66TbCGN1tKHdXeBN3QhSPKN
 Cn0NsVJsdLbMz42ZdAEBbVAlpDTrpRBCmtlkT7o09788wg8m1pXIA6rFVGvIjBZZ
 qrhZg+PNfq1OAChIaEgcABeratz0aNbfHuLdx3BVywrBpocXRweW+ObUyC49xWHd
 no7vRTHWgoWpeLPgBsKM+m5ntou0TXja8Ge9dSTxsUsv9JcT5IsoBl7BGB2dffUp
 RFKCOWbMBcDlPHN9H6iC67F0mdAfqrvVJaT2/D3BYbG+lCtJfoGJwRNd7XwBN1mi
 Bjs3eQ==
Received: from mail-qv1-f72.google.com (mail-qv1-f72.google.com
 [209.85.219.72])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4br2ke0a6g-1
 (version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
 for <dri-devel@lists.freedesktop.org>; Sat, 17 Jan 2026 06:36:02 +0000 (GMT)
Received: by mail-qv1-f72.google.com with SMTP id
 6a1803df08f44-88a2cff375bso61703956d6.1
 for <dri-devel@lists.freedesktop.org>; Fri, 16 Jan 2026 22:36:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oss.qualcomm.com; s=google; t=1768631761; x=1769236561;
 darn=lists.freedesktop.org; 
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:from:to:cc:subject:date:message-id
 :reply-to; bh=2tTHPmj2NBaJb//qs7JmAmt97xPSCIRHJxgVnBNp34c=;
 b=Cu/0DTcVqYSAPA/AsaxHeiwOTE27LhlR0QZnB6uksXYfjBxjzielLqFhIv63huV1ye
 iYavaH2GDjWuABLidp9Kw6f4x/lXgXotRsaMhrcV9EGiI52gLaD3DJdqmu7WidfE1jVQ
 PVTBF08sfYpb51uQ/3TtBxLbcb1tIQOaAU3zO2eneUdI7j43RMvj0TEt+Xpo8qgWal4q
 6zkw23/ZiHsjgSs4qNzRO4aYzAO0fbjmLeZyN9btGjHr0tpq8M4vN8I0Cs4Bay51RlfM
 uE2zX1vsdNwhM/mxgFCFs+T110Lyv6SKsTBbO6BXzeE9rXXzqbvaNpT8pVtQYjRwJKlJ
 0skg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1768631761; x=1769236561;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
 :cc:subject:date:message-id:reply-to;
 bh=2tTHPmj2NBaJb//qs7JmAmt97xPSCIRHJxgVnBNp34c=;
 b=iIhSYsPzuOEoGtvFeuLpjDPFP0ZQ5qnknTVh4+jm7xJXmTFMdRB73sMAM5PuwaJtN2
 E2zN2ncC12uoEydf2JtRIfGy1MVRnyM+j9S7M835REm8GzMTYGoSNcvzkn60Y36c3lyD
 VqEZzxJpHXoHwPjUHp68wGVnkoWpSY/EdnCS2mPrBMq1J0EI2m+oJFKsTf/FZl1Eo3Gp
 sEbJAGrmERRSK4CsGU0mHq/NBC9Io7pxtyTLebIM4t43uIwWQP1zBZFpPdXWJNeK/kI6
 Jq9Tw3NmLVdX/dz0UeCbi1LdQYNpbvT/hmQ+S0yDU4sZoBoN4G7GOHM9SrUjZ/rJNtss
 D7kw==
X-Forwarded-Encrypted: i=1;
 AJvYcCXP6KSvIajCQkJoeLEHf7azuuLwvTQg+v+HnKscTkD9g8GA0OZTeadjBOr86jOkPa8wK/QEwxIBJFo=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YznTX2iQ5Y6QThyQnSSgvqTkftxacNEyMBmsU51daNOAHNwegrr
 WAqhyjFXtP4U1RKZEPWlTnngQr9wvR8aDsydDhBUiIBpnH+hIwRb0xWo6z72+R7bNHq2vv8KKv9
 hJ6EntxgydiZGD4lo2LYP5Ocvfblz9N/T/yAntHMA8uznN89SqVV4kmS/bZsBzB6DQwP8dy4=
X-Gm-Gg: AY/fxX4Wnr/dhegR+Ve7slD/Zwo4cxKzYq1tg9wYJNkUKbLevWVtaqMAYejtESFpxL4
 2QoDor87Jb6sto05ECz/OabzY90Bh5USIHF/kSP8lrHMFJdNJInZ8htyUvQ+vkKBAsnMzlPB8Gg
 e7vnjBXT9sa20M499Pz0rd4K0NlntTXDcfzYdxmJQY20YyESE5ksUiXbsgZZeRdeTWYk8aPE0gI
 7uJZv8XxeR3IxiKg9kgeKd8wK0ArJawpmb7sQvw36kq8LrKtjwh7jMtMi8r7u6tgncgjFjrl/WG
 kPNsDi6+6QxxsdzRV598ly3dqJCE4K8fU90JtlyECsUdtPfxRP7D4gpLFb5f7TegYhLmVO5Rvws
 +HJHJhD1lmwBiJ4LaukIWqebJHrcAzFxHwYm3+bBhUkXr5gaez2+NZ0csJi2dgBZQTXgFBiivei
 RQBqkzM28PC56hc4WLhR7sK4k=
X-Received: by 2002:a05:620a:2a02:b0:8c5:3869:3f28 with SMTP id
 af79cd13be357-8c6a695902fmr797747585a.85.1768631761549; 
 Fri, 16 Jan 2026 22:36:01 -0800 (PST)
X-Received: by 2002:a05:620a:2a02:b0:8c5:3869:3f28 with SMTP id
 af79cd13be357-8c6a695902fmr797744785a.85.1768631761035; 
 Fri, 16 Jan 2026 22:36:01 -0800 (PST)
Received: from umbar.lan
 (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi.
 [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
 by smtp.gmail.com with ESMTPSA id
 38308e7fff4ca-38384e790fdsm14049851fa.23.2026.01.16.22.35.58
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 16 Jan 2026 22:36:00 -0800 (PST)
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Date: Sat, 17 Jan 2026 08:35:54 +0200
Subject: [PATCH 1/4] drm/msm/mdss: correct HBB programmed on UBWC 5.x and
 6.x devices
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260117-msm-ubwc-fixes-v1-1-d5c65ea552c7@oss.qualcomm.com>
References: <20260117-msm-ubwc-fixes-v1-0-d5c65ea552c7@oss.qualcomm.com>
In-Reply-To: <20260117-msm-ubwc-fixes-v1-0-d5c65ea552c7@oss.qualcomm.com>
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
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBpay3LXy7BviCDiClLOQ2PK8+jm9Hcs0eMu17i7
 xUfA2+3DIWJATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCaWstywAKCRCLPIo+Aiko
 1V/KB/46WgKJQQ+Lx/fXdiYXGiGzZRRziXq0o8DqaUBQZkJIKcpHd/e3QAEcEzG1qzWUoKJDGVM
 CWj5dcjoOz4GOfBp02RahyGcVMfRWym/6KWCmq/5onHWRgctC/scP9O/8j9W5gHMIR1H93ijpIo
 It2YM/n/pooiBA3EHr6Dx5r51y44w4kSrwNo1t3Pl8sbQxq/xHuIYFLXnIvLDxXdTOcwExyzlXe
 kAeomzjiB3znPgp28UWNmTb5tyBYNSTFgOCAoVKS8tBX4VbnWUGB6CijhL619Nb5TOkvAu/2Yz4
 /Ybne8HeCKGMg8aQMXO83qJyYQWiWZ1lUHur2rjvge8JL5zy
X-Developer-Key: i=dmitry.baryshkov@oss.qualcomm.com; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMTE3MDA1MiBTYWx0ZWRfX2x8KG4Md9Jo3
 NZwm6Fv+ap6Sft7mO9s0D8VQr1QKxFtrsj8JrSn5E9WrV0MAM6ImgYEnRjWM+kfD77E59/X2K5Q
 018CuneAXvc+xnVXwR9UquKZhZufFJh3VHUPgt6TxoGGipf0QluBTptvSL9P5/eIPhYl321vXxd
 e6CjRTJtJGxQR6oDM+Y9M33WDa8irduFLlBJrmZG+UNuH4zz8oN8iRTT8SL0iBnboG6pLjiqqNE
 U6R1CqtEH3rdNYG4EOMAmsIk+qmQ+JHpNf98e6lPF2tHAfOnJdMsCNMBesXmXClJmU+Trpivf3x
 ppmtQnsb8gZoMS1eB7IGD6RQjtmEW6kteKweUfT3Vaa8evmtU4savmtnXnftRlz9KI/3S6NnVgk
 cOXEFe1Ojmjf0qO9KRjLW/d8rJ1U+blyDGClYim8ZHz7tukJApKaB1rB2o3DY2aNW80BznDX0X5
 yXj6DU+TCVWhL1ySTOw==
X-Proofpoint-GUID: s_-py5DBxp6h9ulJncgVfE08GmScLS7e
X-Authority-Analysis: v=2.4 cv=EJgLElZC c=1 sm=1 tr=0 ts=696b2dd2 cx=c_pps
 a=7E5Bxpl4vBhpaufnMqZlrw==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=vUbySO9Y5rIA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=EUspDBNiAAAA:8 a=iGWu5DhtBPyiFZBs7r8A:9 a=+jEqtf1s3R9VXZ0wqowq2kgwd+I=:19
 a=QEXdDO2ut3YA:10 a=pJ04lnu7RYOZP9TFuWaZ:22
X-Proofpoint-ORIG-GUID: s_-py5DBxp6h9ulJncgVfE08GmScLS7e
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2026-01-16_09,2026-01-15_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 adultscore=0 priorityscore=1501 malwarescore=0 spamscore=0
 clxscore=1015 suspectscore=0 lowpriorityscore=0 impostorscore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2601150000 definitions=main-2601170052
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

