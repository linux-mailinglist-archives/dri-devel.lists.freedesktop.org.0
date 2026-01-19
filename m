Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 36BB6D3A12B
	for <lists+dri-devel@lfdr.de>; Mon, 19 Jan 2026 09:17:24 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3EB3010E398;
	Mon, 19 Jan 2026 08:17:22 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="UkInDYfe";
	dkim=pass (2048-bit key; unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="YKl9+ScS";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com
 [205.220.180.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 58D2010E397
 for <dri-devel@lists.freedesktop.org>; Mon, 19 Jan 2026 08:17:21 +0000 (UTC)
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 60J7iJQh041713
 for <dri-devel@lists.freedesktop.org>; Mon, 19 Jan 2026 08:17:20 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 76Smpb7OAuPrJPWLjQuPjMFitzxPMEeAECFWrSbRqDA=; b=UkInDYfeu5xWblOq
 DAVT1XskVc27rpyqoqeSm7p50dCup0/1+iOBuoJxFJWu3V3I0kMagqUm/Jn6aYRr
 EktTEbiVW53DV70B1kx2Auxlr8GFnL0mcWb1ugpy6a7nBHZijAT24gowk1CxwNgE
 2T58ALEVucJ3HZ5QgnNWAo28Hos0n4+yMBrBf6wZLiG/bB4mcavaeLVVhOakuH3G
 DTnazyxp2CO2tFhEvZX4C2KNGghUL/RxasNhWBLZ4Mq0ecMD2XSr0Ln8iwXnMFGk
 A8E6sQ1gbVOnfOO/wxdc2xY+2g2tHzqSLXgSzqZRztwWNM4vhbWLS758k26HMWfk
 R0GQyw==
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com
 [209.85.222.198])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4bsgfr84jt-1
 (version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
 for <dri-devel@lists.freedesktop.org>; Mon, 19 Jan 2026 08:17:20 +0000 (GMT)
Received: by mail-qk1-f198.google.com with SMTP id
 af79cd13be357-8c6a5bc8c43so859349785a.2
 for <dri-devel@lists.freedesktop.org>; Mon, 19 Jan 2026 00:17:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oss.qualcomm.com; s=google; t=1768810640; x=1769415440;
 darn=lists.freedesktop.org; 
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:from:to:cc:subject:date:message-id
 :reply-to; bh=76Smpb7OAuPrJPWLjQuPjMFitzxPMEeAECFWrSbRqDA=;
 b=YKl9+ScSqwngdP+67DbRm6AlL6OVsSfIKXk726PNFn7YBkH8uwCyibx8rVgCdqFKB2
 GKAEMBVngIF+ahRoU6X5XtThje1iIY6zfENSXB9woTTPTGwmP9L60fDvQMMYiSdH5UnE
 YFN9yo3q7efaJpKnKxJymlldV5Cmxz31kE7kRNDu16LbPu1MwJWPBxvY1gYCwnyHxYUV
 fF2NAEh8Fgwu1YPnbmC7nHod0/kZ7L91WeGtwOz3URFeasUFMqhp8B35+dsjAIMb21pk
 FbQUOX3BYD/k5QCTTE5KEpkEuUGbjG5W9l21xxFki8Vd4jPRNgniTvObwT8SI2lgrJgF
 GErQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1768810640; x=1769415440;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
 :cc:subject:date:message-id:reply-to;
 bh=76Smpb7OAuPrJPWLjQuPjMFitzxPMEeAECFWrSbRqDA=;
 b=u0VX9lGhnBSJcrkCOnirTJFxttEs8Qqizx0IEe5S/97W5RAF8CKX8yBw7pB6Bvqb6J
 qZ4E7NUvNdeQjX63zkVCcnZL6X2jsuAhXXHG6WcjGtX4pUBzXC7ASzJk1h40MulVfocO
 oeDL+JRvpZtZLhftb2vQBhYqbMJyJXqnqH51Xi1ShFzSTiPUZh/+8t7EEFyuTh3Zmjj9
 o2vCajqFCfnUZS/fplnmLmRzWKisbHcrGq5AL2HBjAkYwzfpiPxpFmtnxqwFLXfe52bZ
 q6G04mZk/1oBk/uTnkYBisJKqRTk6a68MTRfI9GKcV8TR/nGBRCJYH8trncfsdU5jUPs
 681w==
X-Forwarded-Encrypted: i=1;
 AJvYcCWUYxoOetrI/mrUPFaQzmdKGMwJdZ4jxNEP2PLAqGEm7HDaI/weRQIsPC/C6klgIJ5DWIF8P+eE9k4=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YxbSHj/Jr9gnrujeI6zGmuLNdsZbgjhAkAfBcqAR1rHmpfIn29A
 HkIQePyumOyc0NWyIeIbNa00woh3G1tXn2ex+A2js+18lLTu3vqvB/8BS5BYIbQCWascPu2yWcS
 gd1E6NpgpUstvavtyt0ZfKIBe0wpPtz1huODkT8Wcl3TNtNlru8X5v5RYfoi0fOaPcgijGlk=
X-Gm-Gg: AY/fxX61Iw5haEsQ/ePBSfzco6veSAWnZCZLc1QiWWm3QBfb4Y+rjHmWzagCQCWY+oL
 lbGfbCB5FdUyejohvKnV507DyL22aP9OTliQzw3PHfJnDo3YQ6GK1jOVTR2ARTKQagJmBKLVFrU
 +Ij5WMgNarbk94DYRJMpQuSH11IUNLRrOY9JNU6cLo7H0M2z0YSk59suH2FrTbUZmFpPER9rNLW
 P6YtjZdns0ku4FPm0KRCr6ym6W9FO6oBx4ijoqdirfirhq4c5fnpH6mP+aqh4LvP3BZYb1dqzbt
 +xMu2n1YhqNBULWH6zcZ23lgeLUc61z/JDLAx7ubNG2MSmxILsaqtDqO+9PzXH1clgo8nZ0TqqZ
 m3+CnV6Qt/sqgDhRvFYoLIaMDhZrpqunsmmxsVFdTL6bRFSDTbenuJ0giD+miHXnHAREgK/w7He
 jBRkejzXSO8RuPwr2Xi+csa84=
X-Received: by 2002:a05:620a:bc2:b0:8c5:310d:3b1e with SMTP id
 af79cd13be357-8c6a66f6bb5mr1518900085a.33.1768810639775; 
 Mon, 19 Jan 2026 00:17:19 -0800 (PST)
X-Received: by 2002:a05:620a:bc2:b0:8c5:310d:3b1e with SMTP id
 af79cd13be357-8c6a66f6bb5mr1518896885a.33.1768810639275; 
 Mon, 19 Jan 2026 00:17:19 -0800 (PST)
Received: from umbar.lan
 (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi.
 [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
 by smtp.gmail.com with ESMTPSA id
 38308e7fff4ca-38384dbec4dsm29636391fa.20.2026.01.19.00.17.17
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 19 Jan 2026 00:17:17 -0800 (PST)
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Date: Mon, 19 Jan 2026 10:17:14 +0200
Subject: [PATCH v3 1/4] drm/msm/mdss: correct HBB programmed on UBWC 5.x
 and 6.x devices
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260119-msm-ubwc-fixes-v3-1-34aaa672c829@oss.qualcomm.com>
References: <20260119-msm-ubwc-fixes-v3-0-34aaa672c829@oss.qualcomm.com>
In-Reply-To: <20260119-msm-ubwc-fixes-v3-0-34aaa672c829@oss.qualcomm.com>
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
 freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 Val Packett <val@packett.cool>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=openpgp-sha256; l=1187;
 i=dmitry.baryshkov@oss.qualcomm.com; h=from:subject:message-id;
 bh=rvlLamNB1d8AxWI8yQdhDfj/WRXPqvKE6wjpg+ZGkfw=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBpbeiLRc6MfZfjLwLgU9ZLO+AmHQLpKNEG53lTe
 uFIrNKomZ6JATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCaW3oiwAKCRCLPIo+Aiko
 1ZiYCACKIFBdBuVY28Simiz9YBlSWLg7vfCkIdbVslZHYkeWy+BmVuv0O1Ne8FFUiw3KIWTX1C+
 Blz4BoZakElqDCeCKgu/N63/gkM5NPFytkeUQ4cHgHtcceXl4bG47umALc9V1NJAfM1tDOb5/0c
 VX7JYAynZSWnkpn//AVfb4bweJ/n71hPBkUZWjtO8+BI6A4c5FCLxyw+hfAhkEyFzj99A6JIX52
 mNtQgQuTjMgV9j9EekWH2LxvKeWItXo9Kr/LhQQZjCPCye24ph6NJAQZmEk83C5w7/e2f88sbUO
 TP0dvVar7Di6T9yZf38+ThRugmLsSv25DeTeKGA8k15VJmcQ
X-Developer-Key: i=dmitry.baryshkov@oss.qualcomm.com; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A
X-Proofpoint-ORIG-GUID: vAS31Qj-4cjHwZV6K_407gdZBj10A6u4
X-Proofpoint-GUID: vAS31Qj-4cjHwZV6K_407gdZBj10A6u4
X-Authority-Analysis: v=2.4 cv=c4OmgB9l c=1 sm=1 tr=0 ts=696de890 cx=c_pps
 a=qKBjSQ1v91RyAK45QCPf5w==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=vUbySO9Y5rIA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=EUspDBNiAAAA:8 a=VBuLEOLxEfejlaYavu0A:9 a=+jEqtf1s3R9VXZ0wqowq2kgwd+I=:19
 a=QEXdDO2ut3YA:10 a=NFOGd7dJGGMPyQGDc5-O:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMTE5MDA2NyBTYWx0ZWRfX1456SIQvDu2z
 Z4+PDkUcgplFSQzvDlCCGwTofvdHcnxzk7o2K32ZX+jiARQ3g7LdqVtH+G8BIADsQHtIFYDFiSR
 62B0ZE9MkoiXJx3+YVlGU/UusTiRgPmU5pxiXQ51TClKnUfP2He6ZF7qdqSJufAcgiEGcTHfHwr
 mfqKlHZmEZxNBHdg5M0QuFjGV5M1QXXYyfJ5bDrZRRFyTGvxIw5kfw+avO8pvmWGDQxisJiKyHC
 0y4hb7dCvxpeptsjDfDLEVj4hEro+fis0cv2yg1AQ5InZlOId4wEN9djHnKI81UVPwgxfTri194
 Kv3vKi2aJPN5QVRkRCy8mHlP5+1i4UWUvk/ARmvC6Af13kTX7oGkqSOW71ZEshdF4E0ZL+zN4dh
 4UW1oiEa25tPKR8YrdOyIH2ZghaVGJE7Lq0ogGKyeRQcSgWHNfqJzSRDtYwprU7PTxgyCAbgLES
 nYgxItpM2VgMsN/njwA==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2026-01-19_01,2026-01-19_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 adultscore=0 impostorscore=0 clxscore=1015 priorityscore=1501
 suspectscore=0 spamscore=0 bulkscore=0 phishscore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2601150000 definitions=main-2601190067
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
Tested-by: Val Packett <val@packett.cool> # x1e80100-dell-latitude-7455
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

