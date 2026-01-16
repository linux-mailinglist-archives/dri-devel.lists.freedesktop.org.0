Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 9209FD2D2B3
	for <lists+dri-devel@lfdr.de>; Fri, 16 Jan 2026 08:27:52 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A351710E80E;
	Fri, 16 Jan 2026 07:27:50 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="UqFTB/gk";
	dkim=pass (2048-bit key; unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="BEU1iEcs";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com
 [205.220.168.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 90D6A10E80E
 for <dri-devel@lists.freedesktop.org>; Fri, 16 Jan 2026 07:27:48 +0000 (UTC)
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 60FMkuN93892921
 for <dri-devel@lists.freedesktop.org>; Fri, 16 Jan 2026 07:27:48 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 zJCnfFwC3vPDsJEo8QDX6Qy4iwhrLPmMctTCzdExcZQ=; b=UqFTB/gkSqAqa4vg
 bOMjaPzAclNHYHPxJbbrlhngh6bPPNfU1cTvy+xVuvgDgTagtCeLXrQVzo5JYUeB
 AnJXAAK2B5VOh4NtNjWgwfdFtXTywQYlGZHUtEqHjK6fHQhoOaST5lP2T6r5TWpW
 QLNDG+Vv7x7s35ZNicnEbkKxyL83CQZV5vKls9Wi2vbYEp/vCP9MyMSH1bZwQHFZ
 6Or+TgL7LIlLQh/GKtIuvJjfSzQdrn5WqT9qR/AK7MGwXaJH9xmQ9YscmU4jdBLp
 w4XqbjdPXeuFbEG9GjOsyz7SKusNESEERIv7S1PN8e/hM5sVeNmE8pa/6l5sGAkX
 xteTAw==
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com
 [209.85.222.198])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4bq9b097a5-1
 (version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
 for <dri-devel@lists.freedesktop.org>; Fri, 16 Jan 2026 07:27:48 +0000 (GMT)
Received: by mail-qk1-f198.google.com with SMTP id
 af79cd13be357-8c52dcf85b2so678651385a.0
 for <dri-devel@lists.freedesktop.org>; Thu, 15 Jan 2026 23:27:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oss.qualcomm.com; s=google; t=1768548467; x=1769153267;
 darn=lists.freedesktop.org; 
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:from:to:cc:subject:date:message-id
 :reply-to; bh=zJCnfFwC3vPDsJEo8QDX6Qy4iwhrLPmMctTCzdExcZQ=;
 b=BEU1iEcsNwP0U6jkZleq6QbqAbw7LjLS72CAvsUErcJMn3x9E6oUAFAZVmINeLGOpR
 Jp4u1vIl0/9bccOdqmLfsJMveltaK8wX6v3IoBwAuulLZX3T+NT2W4XPJEsaJmV+0a21
 t9JujiXVxZLkasRlovooYSDx6UASF2RKX9JubznMxQVAsHaeGtYyetcmwIbHP7cIY7f1
 intuuf4Bbia3zzUpT/SplfIXwVz2BcMIH6kVtkGmIDd2s7ENC1/GVRUXfkFkhzxsaCnN
 8ZYpAAYi9s3oWTCr5ngubArJDTg8oKc2Xlr0d8BWzHfF21IbKBlFBF4soXSbHJbCjjwi
 Ha0w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1768548467; x=1769153267;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
 :cc:subject:date:message-id:reply-to;
 bh=zJCnfFwC3vPDsJEo8QDX6Qy4iwhrLPmMctTCzdExcZQ=;
 b=TEfh/jWnq8O2O3k5pVKPP6kGh6j7X7xZPKD+/NkUI/LhrilSQfQ4uxwr/sGOwb53TB
 Fssh0TkF6Wv9z6388bu/rM9zrM9RPZKTmC5UYH71sqWyUWHK3Z84VNVlb3D4YvG7GP9Q
 UttlgRNWveEqJdvlL3SsKpnbdy87Qq8GP6v0sucodUoKNujRRcZcpQNoWElaqIcIg7bK
 XxumfvFW/iFLxvBiLhmfgunR7KEs/dLjnqulsTh+yNgoUPbPlw9PCk803kMJk8nXnpD6
 9+U+CFzex6EyyqhLVmVEYhVWSFTU++jWw1JbeQnc0T1mdRdHmoV352D0QrapM/hO/rJH
 z3Bw==
X-Forwarded-Encrypted: i=1;
 AJvYcCVuMZ588RPRGNI/MXPlLDjAPN09OLOEHq1by+/x7931/XGuNvd+Yqv/2nKU1rSl0AYkhEXyh/Rkc+M=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YyhxVx7uNW2GscTX0ifEv9tEAXuMHoYOuw97XeQGpz5GPzfSMDy
 O1lMLeXTYy17oJTuGC5qiRgeMS19k5bSTWYEYyWfUSv6hVxF2GofATdkQDaK6gVxMBzvi5ZDr0A
 WQcPdOPufVeOEYGEvbSjLWiM3e/ea4yHBku8sMP4gKcpJmCX5I22GJSxJ8OfQLGkOhtf7AcU=
X-Gm-Gg: AY/fxX6hFNTc6YrasyPgjeR9z6WgOPYV4iqI1zmPlQMIyeqN9ynGjA++IZ0tLJAvaVj
 X1fGRvojHBYS3jGFEdLhNywivrTwz4D/ctnRmxqAAdVmAcQ3t8XdTAMooULotJIUmA86SN78Sxx
 CqxhKYKm73vGGSHcfUktqVP113/9wnpXAnrGYIUpOtNO/3kDPoZkaF0EMJSbM65efXOd6AL8mUh
 juoP5z9jJhQfZGxz3snBMyvMF6mBr87lrOB/1xCTFXKxMDojn03ecHirwdYBwj1OF2vAnAEOvSj
 ZKMbk3K+LrGU75gsuucWUrZ7gb7T90lalI+0FgJ1m/KglV7fWSVBV7f9LbL8i3yUIsbq992S/1p
 VKe3J6hmwtN6N65Y7EEC+1+zwVprQLutYZTYVXJB8uSZBL27Cx63cEW4slSOzawXipIK/qEJA5/
 JOE2b5TzuHXQ9KrJ5PMSohKTQ=
X-Received: by 2002:a05:620a:1a94:b0:8b5:e783:933a with SMTP id
 af79cd13be357-8c6a69623a5mr244572785a.77.1768548467082; 
 Thu, 15 Jan 2026 23:27:47 -0800 (PST)
X-Received: by 2002:a05:620a:1a94:b0:8b5:e783:933a with SMTP id
 af79cd13be357-8c6a69623a5mr244569685a.77.1768548466707; 
 Thu, 15 Jan 2026 23:27:46 -0800 (PST)
Received: from umbar.lan
 (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi.
 [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
 by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-59baf3976dbsm516941e87.66.2026.01.15.23.27.45
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 15 Jan 2026 23:27:46 -0800 (PST)
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Date: Fri, 16 Jan 2026 09:27:39 +0200
Subject: [PATCH v3 5/9] media: iris: don't specify highest_bank_bit in the
 source code
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260116-iris-ubwc-v3-5-662ac0e0761f@oss.qualcomm.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=2393;
 i=dmitry.baryshkov@oss.qualcomm.com; h=from:subject:message-id;
 bh=NrDJ4X9mZsaFbnaH7GQn0AlXZA75xOGKUcWuV9qGUhE=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBpaehpQM4ilw+6GYwUK40BKUo+N7LqRwkaFjElo
 erSoDAH75CJATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCaWnoaQAKCRCLPIo+Aiko
 1R/LB/91YhzqEwbPpRYGn/20VhZeN4fQOegNQlRPhGRZjQOErNtthcy8er5gqD06knYOtO8A8O2
 3QFIxiibB0nYOfwl5WV8Zx8T8oqZTA9Qxpl8xsRz0wT6VEg/rGv8QUCW3oVjVC0aV6OB7Vux/bM
 YIRWkLuViBKro/sDvpLzMZjdNF1EZYbEmBt1IfcMYJBVmvV0mzMQfSrfE73feNAl43/D8JpsHev
 /hEmBA4d4Iw2ryo6y/hS8Mf+v5W67zd1jYWJN6MxLK0/PneyK0UtYElwWpDgb3vRS4FUVPSs/sp
 sYkF9wKPy5EFSCLz8oE14TRRS0xgHdQgWEs8vedgvqPhXQnL
X-Developer-Key: i=dmitry.baryshkov@oss.qualcomm.com; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A
X-Proofpoint-GUID: -XK_JVJrs6c3iq_HfnnV_KDh30VT24tn
X-Proofpoint-ORIG-GUID: -XK_JVJrs6c3iq_HfnnV_KDh30VT24tn
X-Authority-Analysis: v=2.4 cv=TcmbdBQh c=1 sm=1 tr=0 ts=6969e874 cx=c_pps
 a=qKBjSQ1v91RyAK45QCPf5w==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=vUbySO9Y5rIA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=EUspDBNiAAAA:8 a=KKAkSRfTAAAA:8 a=2VIzI6ABkMI1kr12n-IA:9 a=QEXdDO2ut3YA:10
 a=NFOGd7dJGGMPyQGDc5-O:22 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMTE2MDA1NyBTYWx0ZWRfX/oqYuOEhrn+c
 vcSD+nI2xRiWJoa0N/416JXTranMePPui9a4XU6NYgp5iL9dKAwPduzCaJswhJ0eoDkFTDp3q/5
 3D/TXeg9hpZuAmmtxYSsCU9BokvZnoucc0IJuhHJVjNZuzH2YsW5EF9DTLc6npFvJ+b+M1/TAJ/
 lI3W6UnR9v2KKdUwLLoeaB84NwZXqedhWPAWIUHAzSxpucVTemKaxi+RGF/p4ElFv/ath+iAs1h
 yFTMqSYNfsUuTmX8rdzdQORyyQf5SHJfBXd/Be03lEEaAP2/yg27Ru045FuJ4umyD9fO0iLxOEA
 wLcMHLeXki8RJWepw3WO4GLJnKkDOQ1Ag2dZW0kz0BY3f95MPEGjkvwmwouzPUGwvMp0x9Jf7h/
 JDdN+BrufQhfTgYwHT8n/OyClOS4Z+qkrpxaM7YD3ZoEBc8pwbj7zYQyUBrLRP/qNoxQLlV8XtG
 EhO0Cu0zsgoC5ssXb7Q==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2026-01-16_02,2026-01-15_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 spamscore=0 bulkscore=0 suspectscore=0 lowpriorityscore=0
 adultscore=0 clxscore=1015 priorityscore=1501 impostorscore=0 phishscore=0
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

The highest_bank_bit param is specified both in the Iris driver and in
the platform UBWC config. Use the platform UBWC configuration instead of
specifying it directly in the source.

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Reviewed-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
Reviewed-by: Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>
Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
---
 drivers/media/platform/qcom/iris/iris_hfi_gen2_packet.c | 2 +-
 drivers/media/platform/qcom/iris/iris_platform_common.h | 1 -
 drivers/media/platform/qcom/iris/iris_platform_gen2.c   | 1 -
 3 files changed, 1 insertion(+), 3 deletions(-)

diff --git a/drivers/media/platform/qcom/iris/iris_hfi_gen2_packet.c b/drivers/media/platform/qcom/iris/iris_hfi_gen2_packet.c
index aa4520b27739..6dc0cbaa9c19 100644
--- a/drivers/media/platform/qcom/iris/iris_hfi_gen2_packet.c
+++ b/drivers/media/platform/qcom/iris/iris_hfi_gen2_packet.c
@@ -160,7 +160,7 @@ void iris_hfi_gen2_packet_sys_init(struct iris_core *core, struct iris_hfi_heade
 				    &payload,
 				    sizeof(u32));
 
-	payload = core->iris_platform_data->ubwc_config->highest_bank_bit;
+	payload = ubwc->highest_bank_bit;
 	iris_hfi_gen2_create_packet(hdr,
 				    HFI_PROP_UBWC_HBB,
 				    HFI_HOST_FLAGS_NONE,
diff --git a/drivers/media/platform/qcom/iris/iris_platform_common.h b/drivers/media/platform/qcom/iris/iris_platform_common.h
index 3c5f3f68b722..8421711dbe60 100644
--- a/drivers/media/platform/qcom/iris/iris_platform_common.h
+++ b/drivers/media/platform/qcom/iris/iris_platform_common.h
@@ -73,7 +73,6 @@ struct tz_cp_config {
 
 struct ubwc_config_data {
 	u32	max_channels;
-	u32	highest_bank_bit;
 	u32	bank_swzl_level;
 	u32	bank_swz2_level;
 	u32	bank_swz3_level;
diff --git a/drivers/media/platform/qcom/iris/iris_platform_gen2.c b/drivers/media/platform/qcom/iris/iris_platform_gen2.c
index c70cfc2fc553..5ae996d19ffd 100644
--- a/drivers/media/platform/qcom/iris/iris_platform_gen2.c
+++ b/drivers/media/platform/qcom/iris/iris_platform_gen2.c
@@ -633,7 +633,6 @@ static const struct platform_clk_data sm8550_clk_table[] = {
 
 static struct ubwc_config_data ubwc_config_sm8550 = {
 	.max_channels = 8,
-	.highest_bank_bit = 16,
 	.bank_swzl_level = 0,
 	.bank_swz2_level = 1,
 	.bank_swz3_level = 1,

-- 
2.47.3

