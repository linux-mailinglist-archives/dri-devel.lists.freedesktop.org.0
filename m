Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 2FDE8D2D2A2
	for <lists+dri-devel@lfdr.de>; Fri, 16 Jan 2026 08:27:49 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8C82210E80B;
	Fri, 16 Jan 2026 07:27:46 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="EuPrK0fT";
	dkim=pass (2048-bit key; unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="c/i1hhnE";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com
 [205.220.168.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D803C10E80A
 for <dri-devel@lists.freedesktop.org>; Fri, 16 Jan 2026 07:27:43 +0000 (UTC)
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 60FMcrmv4100987
 for <dri-devel@lists.freedesktop.org>; Fri, 16 Jan 2026 07:27:43 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 YrXH4igIIlXWUhPhZRbTg6nwFhrMEZhR8CFgP8J7Ma8=; b=EuPrK0fT/9XHNzF+
 ZB8VSizQXr5hyryxGJO8uyWVCTZoKvP7tlY7cP8lplXOAqmOl4dpWVI5SzMz7MSx
 Bd3bYrnp/ezRalPooys/OHD1bH5VxZBTJbzGP6V1kvIDh2WWO8y3ogjAARIu4ECg
 owGi41e1wcWW3SoK17Ngn06+G9mTqgQOIS7+/qlzti9QxAdYhN+MDMbxf94tGeqi
 fd3OsxNi3ZLX9GbipC3sBRPssG/sutsg3f2LMuS7C/zqrVL5renb48JL4JR3g5bv
 KVLUaKZiCJor8NDuS8BrX3pAjaX7wViBtw3MxmKPypTCbCWt0j0fY5690VbDc4xp
 0FTe1Q==
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com
 [209.85.222.198])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4bq97517e5-1
 (version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
 for <dri-devel@lists.freedesktop.org>; Fri, 16 Jan 2026 07:27:43 +0000 (GMT)
Received: by mail-qk1-f198.google.com with SMTP id
 af79cd13be357-8b22ab98226so798085485a.2
 for <dri-devel@lists.freedesktop.org>; Thu, 15 Jan 2026 23:27:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oss.qualcomm.com; s=google; t=1768548462; x=1769153262;
 darn=lists.freedesktop.org; 
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:from:to:cc:subject:date:message-id
 :reply-to; bh=YrXH4igIIlXWUhPhZRbTg6nwFhrMEZhR8CFgP8J7Ma8=;
 b=c/i1hhnEUF1V2S3f+xMQF64eQr86OZF+jr8Ys5chOZqIFlTDQnL6UYlTt7whjzsDTV
 FpuLa1Qk4PCgoWrBRi03VoilJNfc4xRAp9eYErWLMwnXzeo29noGYbxoCLc568oZijCB
 sxb+VoiNd7ag46+b7u5un2kn+mjvci6MHWv+4G5gyMSV78p8QHaqp/xodj7mkfECHum0
 wg2jM09LsB6PhOWMacsvNwu8RdlQxPSi7nbxUotRmT7+HM3HGSS5fBXHnDiUVluyFNF3
 IGy8ocix9EofeO5bJYp5fCYbx6n+ICr7QRKWLELSZlnnJ9Zx7BAgZqRa+mmjyUrF8rHk
 hMMg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1768548462; x=1769153262;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
 :cc:subject:date:message-id:reply-to;
 bh=YrXH4igIIlXWUhPhZRbTg6nwFhrMEZhR8CFgP8J7Ma8=;
 b=j7EiKVZgjGmdBhFlauQBirgv9/pyUrEI9pmLF3bXiBxUODyxs/4usbdiVHyptJqYhS
 shRB1cPXun1dtf55eQF8tGhwuV27MJxT5BW5K/ETyVCdo/V3CiiUF/ymaS8IZPkiy/J5
 uVSNQBKEDE8OZFIF6zzXiZe2ML5eGh8Tn3NkCjNokCKS94eVQs3N4iqwfOWitaOiFx4l
 D/Wmjjte07Q0UahTCIfLlu7JWdwCtUcHOEogHI5H3lT38Mw4oCszAek5IhSvaf+dDy76
 TWzUlIDveYHlfwVVgpQzPEjALEYOHK705CgDBinwdx93HM1a9nWEmBi4BkSfy+jbB4xM
 8Itg==
X-Forwarded-Encrypted: i=1;
 AJvYcCWvqrEm97Bht71dXxpn7zIPZabgzVBlVIXGbSqY1317o6Zdnro94m5/XBpkIhkUlLiepLvdtNT+CVE=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yw1YqIUn/EJf1w12im1Z5Io91gfCT3nVsOVOwKX9qH9wZTyhus9
 c3IkTGoB4/GLi6WMRTmcEpGzAi/cEVIfJ6gChnpdZ4lOYGxOOQEZMgLTLs78eKSkEW2wLa8zeip
 aXdEZ3gWYGIAQr7sx+py10ZYNtKYMrR6lPO6Zn5cQv2JaBR3orWvNh3Diu1VQAAwv3RToIBQ=
X-Gm-Gg: AY/fxX6A56yUgRCOEEmldad1Kf2ay7L1xxUSt02tf5ULfQ8Zm4kX2tcQPWEXcV2QShB
 IetYKwzMLBEhdjxKoxJ9zCXWU1IiDLtbsSks3Bn6jJWIxRpI2G4AaNjKG4fu3xsx6vRNH+g8NpI
 b0c47oMkJn+vdyJv1V0kY/HW74WzvVS7Zh5Vk64nTT1WeU4j6ZBYVW7BPk0i5QzHn+eM5Gfi/+U
 uj334KyK9qEI7XoTerUkyhcdUNuNdr9Ptd0WDLv0tG9WwtFW0fIzrFVpTSmMS4ehWcMaZzLSq3D
 rjET3OqAKjDr7uWTH8tP4QgdL2qeLOA9iwgEO5QHs0Cbo8aNqPOlyKP3zmsQSqSujMScBSNP7nR
 mV3d25Oz3vtYICrXAvFjZ6Q/tqdDiK+3C+QaTjoDfyxcNWKBAbQSN02UEqUW5gS02qo6pf/0b2J
 FEJyVYlTwLEw2vXLhBzPnMx4U=
X-Received: by 2002:a05:620a:1987:b0:8c5:2e15:ee7e with SMTP id
 af79cd13be357-8c6a68edf15mr273149685a.1.1768548462284; 
 Thu, 15 Jan 2026 23:27:42 -0800 (PST)
X-Received: by 2002:a05:620a:1987:b0:8c5:2e15:ee7e with SMTP id
 af79cd13be357-8c6a68edf15mr273145485a.1.1768548461871; 
 Thu, 15 Jan 2026 23:27:41 -0800 (PST)
Received: from umbar.lan
 (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi.
 [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
 by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-59baf3976dbsm516941e87.66.2026.01.15.23.27.40
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 15 Jan 2026 23:27:41 -0800 (PST)
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Date: Fri, 16 Jan 2026 09:27:36 +0200
Subject: [PATCH v3 2/9] soc: qcom: ubwc: add helpers to get programmable values
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260116-iris-ubwc-v3-2-662ac0e0761f@oss.qualcomm.com>
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
 linux-media@vger.kernel.org
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=openpgp-sha256; l=1726;
 i=dmitry.baryshkov@oss.qualcomm.com; h=from:subject:message-id;
 bh=f6HtLiKKb/4Affz7e1VJ8PeslNVW6kXZOqanD2Gu5FE=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBpaehpqr0DI/T4fzPhXcMLUQDO1d03tFKGRdCkS
 CTh5W4hgYGJATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCaWnoaQAKCRCLPIo+Aiko
 1SIbCACz74dN96rhxETe3r7bYueM72qOgA2EXJfBPvIDyxk9w/kz7CFKGKgzJiMHrNNJ5j2bsgT
 O8AHYHbc7KH/5PKFNCRmoX+E3CkiQJKta1DRQNJEfrD3FI4ESwJZwSXSR6qsvcbgNmB0ytyfMVW
 cThizBKwzZPMiOgNlX+l4y9uUD6yPGVFm2RsGY7GE0ArYDEfx+RiiLeE0U0zjWllSNB5vPhjFS1
 ItIszToX5EZvXjn1TEOAiehcNiSOH042HlYLowcJwoeZM3CrN1BKOy1Jh6qh9YEBWMjYO1xh+2f
 GGj3pOXAceV2/nrJHHnCnmI+NmLhM0u5f+ET67YQFmaFT6Tu
X-Developer-Key: i=dmitry.baryshkov@oss.qualcomm.com; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMTE2MDA1NyBTYWx0ZWRfXyBGLGqicfH2X
 eWH1Es1bf34sCfWzEKDNIlM4ZE3ghvnu/f1FhUKHYImOrFynADfXxhYGQ/04af+bmRgaXht633v
 fR/VJcYtjqjwUCJalmOqgdJqY4ljYUiV0kLqPD4XMK5wfqAS/vMTU54JhMizlF3ta1qbc/jooTO
 jhdnWCPvMz4eufzdS73SskNWuLngwxlOIk1l9EOGByCWTSsSaYvrMBWixOkvDUFiKa50XSOxeYV
 8xdeGte+BfYwg8Kl5ylAEKvu3qhBVuQulh3szjBAAiBbu3ab9Qn8OeoVrZJCLHIuaV9B4PLEaCU
 6hhb+o1OT3lQ98EPyLb10szPAyWoBTVfrKrgRxmxh6WjjuiW7eV0WlATCDwS1I9anMkkkKxgAGN
 AeJm332HSAF2YtrumT71cai8noQtOB7mDpqCk+iviazv4n5FYr5FEIOu6mWVBXydD0dRYWrkapR
 eJTtO/TPqJCuVr5KACQ==
X-Authority-Analysis: v=2.4 cv=Sv6dKfO0 c=1 sm=1 tr=0 ts=6969e86f cx=c_pps
 a=qKBjSQ1v91RyAK45QCPf5w==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=vUbySO9Y5rIA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=EUspDBNiAAAA:8 a=0nnIczzv09DC-zKiMkwA:9 a=QEXdDO2ut3YA:10
 a=NFOGd7dJGGMPyQGDc5-O:22
X-Proofpoint-GUID: bjuoicYpoh3v6FWFI8H2iqCjmLO_6RM-
X-Proofpoint-ORIG-GUID: bjuoicYpoh3v6FWFI8H2iqCjmLO_6RM-
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2026-01-16_02,2026-01-15_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 clxscore=1015 impostorscore=0 bulkscore=0 adultscore=0
 phishscore=0 spamscore=0 suspectscore=0 lowpriorityscore=0 priorityscore=1501
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

Currently the database stores macrotile_mode in the data. However it
can be derived from the rest of the data: it should be used for UBWC
encoding >= 3.0 except for several corner cases (SM8150 and SC8180X).

The ubwc_bank_spread field seems to be based on the impreside data we
had for the MDSS and DPU programming. In some cases UBWC engine inside
the display controller doesn't need to program it, although bank spread
is to be enabled.

Bank swizzle is also currently stored as is, but it is almost standard
(banks 1-3 for UBWC 1.0 and 2-3 for other versions), the only exception
being Lemans (it uses only bank 3).

Add helpers returning values from the config for now. They will be
rewritten later, in a separate series, but having the helper now
simplifies refacroring the code later.

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
---
 include/linux/soc/qcom/ubwc.h | 15 +++++++++++++++
 1 file changed, 15 insertions(+)

diff --git a/include/linux/soc/qcom/ubwc.h b/include/linux/soc/qcom/ubwc.h
index 719b31c8fb3c..4801f288af81 100644
--- a/include/linux/soc/qcom/ubwc.h
+++ b/include/linux/soc/qcom/ubwc.h
@@ -83,4 +83,19 @@ static inline bool qcom_ubwc_min_acc_length_64b(const struct qcom_ubwc_cfg_data
 		 cfg->ubwc_dec_version == UBWC_3_0);
 }
 
+static inline bool qcom_ubwc_macrotile_mode(const struct qcom_ubwc_cfg_data *cfg)
+{
+	return cfg->macrotile_mode;
+}
+
+static inline bool qcom_ubwc_bank_spread(const struct qcom_ubwc_cfg_data *cfg)
+{
+	return cfg->ubwc_bank_spread;
+}
+
+static inline u32 qcom_ubwc_swizzle(const struct qcom_ubwc_cfg_data *cfg)
+{
+	return cfg->ubwc_swizzle;
+}
+
 #endif /* __QCOM_UBWC_H__ */

-- 
2.47.3

