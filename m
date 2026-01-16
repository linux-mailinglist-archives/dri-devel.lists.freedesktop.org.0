Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 568AFD2D2DF
	for <lists+dri-devel@lfdr.de>; Fri, 16 Jan 2026 08:28:01 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 89D6710E816;
	Fri, 16 Jan 2026 07:27:58 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="TOrJgAJN";
	dkim=pass (2048-bit key; unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="BNZTvdDB";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com
 [205.220.168.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 420EE10E817
 for <dri-devel@lists.freedesktop.org>; Fri, 16 Jan 2026 07:27:53 +0000 (UTC)
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 60FMkuND3892921
 for <dri-devel@lists.freedesktop.org>; Fri, 16 Jan 2026 07:27:52 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 JQwSpE841/w5w8K49zba/GNESKQ877/YE4Yy4Ses/40=; b=TOrJgAJNzi8qpOJZ
 XYT0Tk5ekbRg8Qss/oBJW4Nc4+H2IMEAUQBU9WOK/aWY6kFsOd6QpEph8f2Brrtb
 hhO4cRYLg35YBMab7rGO9RKbIxr87aW8CTkVM27FKy0qkqwycUyAyKXSeylgD0oK
 P2+hfDFQ6ICvliEcjmZbNnby5JNwgiv4Qi69YKWqRCQo9OkdcPeNecj1PpMsq2u2
 HmTCiWQoo2FHWl2XT4xXgu3/V2Js/EDyebe9P3jZYV6EHscYOZZP/N8ze3cjhh0A
 hle8B+E5mbGE09S84Q22KiRMS3yNy7fqQgm/pibj8HBYDjbnEfOsSy3f65R/AsjN
 sGG4Wg==
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com
 [209.85.222.199])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4bq9b097b7-1
 (version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
 for <dri-devel@lists.freedesktop.org>; Fri, 16 Jan 2026 07:27:52 +0000 (GMT)
Received: by mail-qk1-f199.google.com with SMTP id
 af79cd13be357-8b234bae2a7so513218785a.3
 for <dri-devel@lists.freedesktop.org>; Thu, 15 Jan 2026 23:27:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oss.qualcomm.com; s=google; t=1768548472; x=1769153272;
 darn=lists.freedesktop.org; 
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:from:to:cc:subject:date:message-id
 :reply-to; bh=JQwSpE841/w5w8K49zba/GNESKQ877/YE4Yy4Ses/40=;
 b=BNZTvdDB7DXl8Rc7fBZltkQ689CcPeS1DqAqjQI2kKpKwJJC1kiq2PWTlKypiPinj9
 shMOc7EpXbwio49N23O9t7KEhfUmgDwW7j3i/bz3rb0Sh6VzwB4OrD/h4RlOXbs2nkB4
 Kmx5lshYzTep9fvxzw+Hu1XIgt/KKKA666Gz8mRZ21DALY9HvHaru9Zph2/GJfAoo83i
 29lc547Tr7et0qNmNSxzEQghwWDip/ZOI88FF7+eht2h8SNpFJlxf52/9UpD9y5GqTMa
 iv0bfIHDBb/B9yC7PO7deW/nU1iJ4vzQlmBxtrYNrLZwaNnhq5YWhJIcYDlOYV1HsVwQ
 aTRw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1768548472; x=1769153272;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
 :cc:subject:date:message-id:reply-to;
 bh=JQwSpE841/w5w8K49zba/GNESKQ877/YE4Yy4Ses/40=;
 b=PA3gV5s1dHLTcmEA+7Pf4L5uhicDGsyJt5qWEdOptGZCayGGA70oYQf3kADmusq2U5
 X0ft/HLBvqosniRbWEc/1GyCH7dHHZvQbbnGnl6ZZptiE3Ses8GnpLgQ44KcRAe8wTNe
 xuc+PAiEruuB3Y3r1gmLZTwwEPXZXDn0KDWv1qL9Ovw/OskI5ehHeBDsH9yPTiMRa8Gw
 l4PO40aIa/rLiGUW0qhmlaqaVm70CQ2ImJUmcADLPKcHTfr+PuJp2Mxtt7ipp6ZofPMQ
 dA8eyko0RUA0mFvFrrEjLmhdJed+9TZbqYi341TPrD6tRuYqxQVziC0hfKwKEUaAIFCx
 kTeg==
X-Forwarded-Encrypted: i=1;
 AJvYcCV6QzPvgJoxvTT0u18OGczWvwzktvtFVxuv01p6y0U2qUkkit+cz5b+M9Y4e8vtEmULABVVbe80Xkk=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YyjQJGKdnmMy2n6FINulbnVeesuxU2FC0LU1yWWJPLF16bsaj7P
 6TsDCDCwy7V266KQVzEfK2DlzIIAdm071fJehnLmAtfFP8Gd4sXNfm2BYZ9NHh25cIB6q9XIfO/
 D7lH2qmZLbGleTFKgikAJy9jY1y/Yqy5LBj6kXTt1TTTKQDxQpWTv3VI81tg15cr+Tqj/p5U=
X-Gm-Gg: AY/fxX5P57JFr2Lvu7h/tQpVWo33Y3thvvTQcVHkf3Zpe7ERuTGAFJyI/oYp9nDCm4Y
 7vbSyF1axqPFNQE3I+ZZFjJ2sODl3BmP0gYlv2fkh+IlLRQ6jI0cYTcVjetn9KKrQGpH/odTj/u
 JsHm7JkYIYELZr7HSwbFulPMY9vDTF5Zx7gOit7Tbj+AbTXPPRTcrkRpMUdI5IGX2xDEvk1Sx40
 vS9VEjIZq626tEUhlTBS1S8rJUZE9u3SxoQUqbNAaBEd/Z52xsR81i8NsIrEfRZ4Ol4VZtxYOml
 Fh8nOYIHBFaS3LaprAmog7lIuBp8DzZznJJCOSsZw7AKyK4JpwMg71Bhga+AQY0JKU4YJR94Ar1
 d92M5lfaXdTdnOK81iN/k+9XZGv6eSLff2zT4IRd8//fqZBhJ8Y81YAmGBBGod1Aefga6c1REbA
 FW4rrUhV5SWEFWuDP/pwzarEk=
X-Received: by 2002:a05:620a:4544:b0:8c5:2b63:2d21 with SMTP id
 af79cd13be357-8c6a67bf47bmr289871485a.88.1768548471650; 
 Thu, 15 Jan 2026 23:27:51 -0800 (PST)
X-Received: by 2002:a05:620a:4544:b0:8c5:2b63:2d21 with SMTP id
 af79cd13be357-8c6a67bf47bmr289868485a.88.1768548471174; 
 Thu, 15 Jan 2026 23:27:51 -0800 (PST)
Received: from umbar.lan
 (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi.
 [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
 by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-59baf3976dbsm516941e87.66.2026.01.15.23.27.50
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 15 Jan 2026 23:27:50 -0800 (PST)
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Date: Fri, 16 Jan 2026 09:27:42 +0200
Subject: [PATCH v3 8/9] media: iris: don't specify max_channels in the
 source code
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260116-iris-ubwc-v3-8-662ac0e0761f@oss.qualcomm.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=2353;
 i=dmitry.baryshkov@oss.qualcomm.com; h=from:subject:message-id;
 bh=isNHAvh6bOOHjhw7YnHhExK2VyE29bdL8UUCGiIh8oI=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBpaehq4h46M3g3Zgg1RlTaVr5p9SW+M0K5Q8QHP
 Rku01mDAemJATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCaWnoagAKCRCLPIo+Aiko
 1UsJB/9om8iiVWFw7UE0znMS9RLRdli9Jy0yJxZQEPBAOmkpmYTAIdyDbNA+Sy4fDOGxcvv1fZU
 9R7yjlfqKHuCq2HpMqBZ3DjrdX9YOHMF3QWMCyky6IgNYylz3Pq4v47zD7Xbsn8/4xcsfGZSbUw
 27pDQIt6/M2ZYoteiYJK8JLjWLr+BQ5LRN26PuHZAhcpi5z/ixU+ay6QF11VrBFo/5e4qCGJNaH
 uIyo7HzDSFH4+fxcMVyRsb0ufCWrHKGXZWktJusuzSkxBlJA1uQrN9Qh9iyP9VmohUcVGN5Q1Rh
 kma2U96aQ5PqxbUHUJcgXi5/b46yCw5nakxIV6QBuisbepaC
X-Developer-Key: i=dmitry.baryshkov@oss.qualcomm.com; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A
X-Proofpoint-GUID: cD8oAZHrL5bZjoZ7oVcTUDM9A7VwqyRk
X-Proofpoint-ORIG-GUID: cD8oAZHrL5bZjoZ7oVcTUDM9A7VwqyRk
X-Authority-Analysis: v=2.4 cv=TcmbdBQh c=1 sm=1 tr=0 ts=6969e878 cx=c_pps
 a=HLyN3IcIa5EE8TELMZ618Q==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=vUbySO9Y5rIA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=EUspDBNiAAAA:8 a=KKAkSRfTAAAA:8 a=rTy9geyXzX0TkIcb0cAA:9 a=QEXdDO2ut3YA:10
 a=bTQJ7kPSJx9SKPbeHEYW:22 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMTE2MDA1NyBTYWx0ZWRfX4WxVdXR+6/wr
 7F9nh91dBiwym+w570Y8Xcgep2S7E1IdM7SLghiFDKFEarFPs3PLHsH1/xrqMjHSF4AWrvOiwzT
 WDR2jOuzdaNCStUVfatuh3hcKRM3kY69Id0CHfFUozp3+2OV1YNh0mqF7dwUfvLXdfOYUSp/Rrt
 rS68oRTlYftwLNjPrzgy2XqRtmVgVqSuhq7FeX4ftmGDQHozJRl0w8zzVfGJ5KGs5PcpnrBqnWH
 dAJlaCBGcpz6ap4nz9yxsuMdmuirQ4omJjndcXtVb/lZlmn+qj5mdilcDAcz2eeipL/WRXSqNJ8
 Y1UvagBmv4JwzM+JAod8ulDV91EnN43jyG+38tgJHNQMz/KPGeGwpqZQJAODMDOo+pHLJT/AvCb
 Rlk6fcYM6KLAStMOWMWNTR9FFwXz9/ZnoO230xT0/n+XsxbMMu4aOVtLU2aQyIWLAt8rPB4ulA2
 oID8FsHA4G0XKlnRoEw==
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

The UBWC max_channels spreading is specified in the Iris driver, but it
also can be calculated from the platform UBWC config. Use the platform
UBWC configuration instead of specifying it directly in the source.

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
index a49394b92768..0d05dd2afc07 100644
--- a/drivers/media/platform/qcom/iris/iris_hfi_gen2_packet.c
+++ b/drivers/media/platform/qcom/iris/iris_hfi_gen2_packet.c
@@ -140,7 +140,7 @@ void iris_hfi_gen2_packet_sys_init(struct iris_core *core, struct iris_hfi_heade
 				    &payload,
 				    sizeof(u32));
 
-	payload = core->iris_platform_data->ubwc_config->max_channels;
+	payload = qcom_ubwc_macrotile_mode(ubwc) ? 8 : 4;
 	iris_hfi_gen2_create_packet(hdr,
 				    HFI_PROP_UBWC_MAX_CHANNELS,
 				    HFI_HOST_FLAGS_NONE,
diff --git a/drivers/media/platform/qcom/iris/iris_platform_common.h b/drivers/media/platform/qcom/iris/iris_platform_common.h
index f99fcbb8fced..4abaf4615cea 100644
--- a/drivers/media/platform/qcom/iris/iris_platform_common.h
+++ b/drivers/media/platform/qcom/iris/iris_platform_common.h
@@ -72,7 +72,6 @@ struct tz_cp_config {
 };
 
 struct ubwc_config_data {
-	u32	max_channels;
 };
 
 struct platform_inst_caps {
diff --git a/drivers/media/platform/qcom/iris/iris_platform_gen2.c b/drivers/media/platform/qcom/iris/iris_platform_gen2.c
index c967db452dec..e78cda7e307d 100644
--- a/drivers/media/platform/qcom/iris/iris_platform_gen2.c
+++ b/drivers/media/platform/qcom/iris/iris_platform_gen2.c
@@ -632,7 +632,6 @@ static const struct platform_clk_data sm8550_clk_table[] = {
 };
 
 static struct ubwc_config_data ubwc_config_sm8550 = {
-	.max_channels = 8,
 };
 
 static struct tz_cp_config tz_cp_config_sm8550 = {

-- 
2.47.3

