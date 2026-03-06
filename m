Return-Path: <dri-devel-bounces@lists.freedesktop.org>
Delivered-To: lists+dri-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id OE2iGT0Fq2nDZQEAu9opvQ
	(envelope-from <dri-devel-bounces@lists.freedesktop.org>)
	for <lists+dri-devel@lfdr.de>; Fri, 06 Mar 2026 17:47:57 +0100
X-Original-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 17C422256AC
	for <lists+dri-devel@lfdr.de>; Fri, 06 Mar 2026 17:47:56 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D0F0D10EE08;
	Fri,  6 Mar 2026 16:47:54 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="J9vrYKmO";
	dkim=pass (2048-bit key; unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="PsjXmU6K";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com
 [205.220.180.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 278E310EDFE
 for <dri-devel@lists.freedesktop.org>; Fri,  6 Mar 2026 16:47:50 +0000 (UTC)
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 626Fr9kN2008677
 for <dri-devel@lists.freedesktop.org>; Fri, 6 Mar 2026 16:47:49 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 qJ6Ex/AAn1uIE82cXCit/bkBSE8pPV30Id+vTgVPV2k=; b=J9vrYKmOpF8vAjb6
 rPQvnradRPJjIzoN6HQ5mybVzIeyN38qibCV8fZ4NxdzlvFgEdAieL50o3JnhlW2
 QXOjeEpI4nE9F33/BDfQlsqTlmvg+voePvZPZytd6HR/7GmUvuyxYQrvrsSKplfi
 YzebplJhuaIunDpNXUN1EgIkmcJeiYlKu/WTJ1k1Zyom90uBWRL9+RW4+5CPMlfO
 Kc5LYz9qjL36vrDGs+FkCUqzry3+O2ZLJGcsaf0z+rgWj5dIBgEhZfeBKBQKNLvg
 4WchuuexcRAL33Amt252zUgn8z+el3Ascttq0AwgVKzT9A5ZS4mXSWYKDfqd2v25
 f0QHow==
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com
 [209.85.222.197])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4cqv9ahcm8-1
 (version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
 for <dri-devel@lists.freedesktop.org>; Fri, 06 Mar 2026 16:47:49 +0000 (GMT)
Received: by mail-qk1-f197.google.com with SMTP id
 af79cd13be357-8cb52a9c0eeso6931295785a.2
 for <dri-devel@lists.freedesktop.org>; Fri, 06 Mar 2026 08:47:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oss.qualcomm.com; s=google; t=1772815668; x=1773420468;
 darn=lists.freedesktop.org; 
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:from:to:cc:subject:date:message-id
 :reply-to; bh=qJ6Ex/AAn1uIE82cXCit/bkBSE8pPV30Id+vTgVPV2k=;
 b=PsjXmU6K7LHFZSlZLIEv1p9KizApKH8qXHq9d0rU5C1aXLdqW9HrpDwzWk0mOTAcdz
 TNUkYP+qZRnxMJqBaMOeYT0gC5n6qJW9Ck/1pmGjIxi99ELDNO4uYjHqkv1dFfzJmKkq
 X7RaJRaLVaM6028UZqCI2pt7nAMBo2peN2m0KNOINg2/FflPdPYe7sycMjdO75F6UjUY
 Le1zvBNbmSE6CiYygH56P+oZU98MTsMwohW00Pfh1o6eB1NmBOJVJLpXgdBYHVCYGPPh
 KhWXLoyqeCuP3zD2JsKoX9HapL93ot6QXL4zpj8Hl36EE6kGRcI/2WdAebB4d42yx+0a
 yIyg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1772815668; x=1773420468;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
 :cc:subject:date:message-id:reply-to;
 bh=qJ6Ex/AAn1uIE82cXCit/bkBSE8pPV30Id+vTgVPV2k=;
 b=ct+2YR6v4ZPH+RanIEmPYQpX79sFOPdlHDXAHsiV6duPofOHUj1lnLZLF+zGT0cOMJ
 Fe2sXOyn3WvSzpymElfA3p9KJwP3UXLrrCMcLRUoLtQSQvaGJapTK1XWlAi4vfK7U10a
 bZneune/dl3NvCufJ7CR9m3rBsL2Ma8IXeQZZtlX4hQ+NWSt73aGsNkvTd2iR1mL3wrv
 eyu1EiL9T044azLF7OKFo9raHhdE8LXiGcF34sJFYNFPmC1Xdr4RsdNysCBx+zgfQR/1
 p9vuuXyikRYT+HVoH6vf1v1tvzLUB8RhnaiQvoBN+lTb6S4zCLnX/nmsoDnQlch4+OVI
 9Fsw==
X-Forwarded-Encrypted: i=1;
 AJvYcCWhQQQkVePkmHUA5TC21wHmhcueOAqR/c7G6R5tM3SnIJRq0mnBWTJQnpkfzFPoWz2kqkZ5JAXT+TM=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yx9liGH3mm+sPOaxmPGzTnP7ILSLmJNCCxJdi/+7xjjJWH7nLbV
 hA9grpeFHmPpRdFm3DJXqppZJCvSYOySfl7Rl0Yc7x8egYSaNFBLl5bDpHH6XT7VGrJc8d4T8xb
 MT/r3WaQwX7AU87zEykos5jEYyNS+Why8c9sJSTqkxBpO1QL8IwhUXBkgJpVv6/wZKsYea6o=
X-Gm-Gg: ATEYQzwWWwd8akVeT3jY+Enn2aL5fiwQgoqHg0A563vJoXW7cmMMo85yVZT0WVtxEzG
 LapBgy3Jf98GJd/H3nokLVJvyyF1QDebtgXOr1GzdjUjmWII+godPEWLgZx5DdhddyKPrT7OKOw
 rItJKK/vCMPt0uzoiYEdy/nRTtxjvz4SfbB0YHYIZ4KQGCrodpjlRdM0gSsW2NTihyG5o5eXvUb
 M/Y5UZwyXcmGENO2PPl1ulihiKiKww1Dpfb9QnzRgQtW4B4/iwIUT+VqbDTtlsYkbW7cKFzbeJn
 b7Rq+jtCznGEzCdsF65HQOvvxEjB6fzOyDYTNrrK+Ai2Xh5O4m3bB8m2AsOnqBchFDWEhVVwIu7
 xj7UOZidVPFDFVlKaBdkzsNWcwe24O6rPGsj83X1Uvg03qkm5F71RGJZ7RJfIqLqq7oSq1SpMZU
 m2MGwrieSK3uhI+2SyoFN59/u6rDzzlaQ7b0o=
X-Received: by 2002:a05:620a:29c1:b0:8cb:55cc:6245 with SMTP id
 af79cd13be357-8cd6d3ed360mr340182885a.12.1772815668531; 
 Fri, 06 Mar 2026 08:47:48 -0800 (PST)
X-Received: by 2002:a05:620a:29c1:b0:8cb:55cc:6245 with SMTP id
 af79cd13be357-8cd6d3ed360mr340178785a.12.1772815668030; 
 Fri, 06 Mar 2026 08:47:48 -0800 (PST)
Received: from umbar.lan
 (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi.
 [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
 by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-5a13eaebd0asm213804e87.51.2026.03.06.08.47.46
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 06 Mar 2026 08:47:46 -0800 (PST)
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Date: Fri, 06 Mar 2026 18:47:27 +0200
Subject: [PATCH 21/24] soc: qcom: ubwc: drop macrotile_mode from the database
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260306-ubwc-rework-v1-21-9cfdff12f2bb@oss.qualcomm.com>
References: <20260306-ubwc-rework-v1-0-9cfdff12f2bb@oss.qualcomm.com>
In-Reply-To: <20260306-ubwc-rework-v1-0-9cfdff12f2bb@oss.qualcomm.com>
To: Rob Clark <robin.clark@oss.qualcomm.com>,
 Dmitry Baryshkov <lumag@kernel.org>,
 Abhinav Kumar <abhinav.kumar@linux.dev>,
 Jessica Zhang <jesszhan0024@gmail.com>, Sean Paul <sean@poorly.run>,
 Marijn Suijten <marijn.suijten@somainline.org>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Bjorn Andersson <andersson@kernel.org>,
 Konrad Dybcio <konradybcio@kernel.org>,
 Akhil P Oommen <akhilpo@oss.qualcomm.com>
Cc: linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
 freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=openpgp-sha256; l=5167;
 i=dmitry.baryshkov@oss.qualcomm.com; h=from:subject:message-id;
 bh=v7QXktkShy+wyahjFgEkbZoSxJ/5hj9cJD9SDRJzeIA=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBpqwUPRKAvBaKiSIudQZ6xcRbzFB5Ni1CIbhtqf
 LAVbZ5TkD+JATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCaasFDwAKCRCLPIo+Aiko
 1duWB/9x/MZJSqKyKCvfl+tFrH5M2zgQzGC5zoXk01bxR5/XZp1OqdW6dAkklTyaVff+nePOaZk
 ZvV9hZnsPlfBZvPs0pPseyE69Hn83m0sL4a9Pj3NJITfWfMM7T1QDGHU9jF+A5lt6Oi0iXJiJMC
 PhzPdMROuMJ4ESsMZO7HPohhGAViLefRSlQnI0/htVQF7JaVnb6U324uAu4vInd8Rq0/+UNjheu
 BVANPv2Qdgds1ErPS7t4qZ9EnkQeq5goawF+DLORk52IBPdJGzTkxVdiTbeEgc4RAeTGNumI+aw
 g2WI6UsKDZrdvxuyuk9sww+UT8Q3ujOcI5uoPlxBB8ldn8xF
X-Developer-Key: i=dmitry.baryshkov@oss.qualcomm.com; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A
X-Proofpoint-GUID: JUHAoz32V2O2fRocrYIVupbt1Fp7zlfc
X-Proofpoint-ORIG-GUID: JUHAoz32V2O2fRocrYIVupbt1Fp7zlfc
X-Authority-Analysis: v=2.4 cv=G4wR0tk5 c=1 sm=1 tr=0 ts=69ab0535 cx=c_pps
 a=50t2pK5VMbmlHzFWWp8p/g==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22 a=EUspDBNiAAAA:8
 a=lOjMx_-Oxa8n0LcNG1gA:9 a=QEXdDO2ut3YA:10 a=IoWCM6iH3mJn3m4BftBB:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzA2MDE1OSBTYWx0ZWRfX/LkRk/j1ZXUn
 HfWBj2ZOi8+zPQwKUdyYAwU2/nJENjdZTxCxGyxzn1e5cdBdVGtZCBjMSpDMAbChMpsrqcPMXig
 1Obuk2gkswDdQ30tEbsUTdBmCmx3N5vmxxDGi+JulXeqU1EBNAbiPeduc2kW6K+grUmBobjdd5A
 QUt4cXA1H80cZr1KraVm6hc94Du13G95UQszPlP1W73hqpOf8o4te1khMPB4fwyH35/lKP6DSfA
 J7i1N+v9T6wf2Y31PxU8khteiqcDZ85ZJqWHsmYFEYMmkjlAsvcaqL9rx+dS5wgSEc4YgjFEdc2
 gIotDWYXGf6rzBHNE4+yUx26ulisj3xAKL9V+LG0XTSIS724dTc+PCaH/EDqFkxFe6TLehVsAtJ
 n6er+UZBlz652Udv5m/eXSG5TrD7nYoF2QeQgWOVT7c9dMGA+0Xc460sxgdOPPiB/XAImgbsRRd
 UcJRlJtkyT4iroCHZaA==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-06_05,2026-03-06_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 clxscore=1015 phishscore=0 bulkscore=0 impostorscore=0
 adultscore=0 malwarescore=0 lowpriorityscore=0 spamscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2602130000 definitions=main-2603060159
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
X-Rspamd-Queue-Id: 17C422256AC
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-1.31 / 15.00];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	MAILLIST(-0.20)[mailman];
	R_SPF_ALLOW(-0.20)[+ip4:131.252.210.177:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MIME_GOOD(-0.10)[text/plain];
	RWL_MAILSPIKE_GOOD(-0.10)[131.252.210.177:from];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_RECIPIENTS(0.00)[m:robin.clark@oss.qualcomm.com,m:lumag@kernel.org,m:abhinav.kumar@linux.dev,m:jesszhan0024@gmail.com,m:sean@poorly.run,m:marijn.suijten@somainline.org,m:airlied@gmail.com,m:simona@ffwll.ch,m:andersson@kernel.org,m:konradybcio@kernel.org,m:akhilpo@oss.qualcomm.com,m:linux-arm-msm@vger.kernel.org,m:freedreno@lists.freedesktop.org,m:linux-kernel@vger.kernel.org,s:lists@lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FREEMAIL_TO(0.00)[oss.qualcomm.com,kernel.org,linux.dev,gmail.com,poorly.run,somainline.org,ffwll.ch];
	FORGED_SENDER_MAILLIST(0.00)[];
	ARC_NA(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[15];
	FORGED_SENDER(0.00)[dmitry.baryshkov@oss.qualcomm.com,dri-devel-bounces@lists.freedesktop.org];
	MIME_TRACE(0.00)[0:+];
	FORWARDED(0.00)[dri-devel@lists.freedesktop.org];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	ASN(0.00)[asn:6366, ipnet:131.252.0.0/16, country:US];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	RCVD_COUNT_FIVE(0.00)[6];
	FROM_NEQ_ENVFROM(0.00)[dmitry.baryshkov@oss.qualcomm.com,dri-devel-bounces@lists.freedesktop.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[dri-devel@lists.freedesktop.org];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	NEURAL_HAM(-0.00)[-0.986];
	TAGGED_RCPT(0.00)[dri-devel];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[qualcomm.com:dkim,qualcomm.com:email,gabe.freedesktop.org:rdns,gabe.freedesktop.org:helo]
X-Rspamd-Action: no action

All the users have been migrated to using qcom_ubwc_macrotile_mode()
instead of reading the raw value from the config structure. Drop the
field from struct qcom_ubwc_cfg_data and replace it with the calculated
value. Split single UBWC_3_0 into UBWC_3_0 (no macrotile mode) and
UBWC_3_1 (with macrotile mode).

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
---
 drivers/soc/qcom/ubwc_config.c | 15 ++-------------
 include/linux/soc/qcom/ubwc.h  | 18 ++++++++----------
 2 files changed, 10 insertions(+), 23 deletions(-)

diff --git a/drivers/soc/qcom/ubwc_config.c b/drivers/soc/qcom/ubwc_config.c
index 070bf97e134e..51de36f5f40b 100644
--- a/drivers/soc/qcom/ubwc_config.c
+++ b/drivers/soc/qcom/ubwc_config.c
@@ -21,7 +21,6 @@ static const struct qcom_ubwc_cfg_data kaanapali_data = {
 	.ubwc_swizzle = UBWC_SWIZZLE_ENABLE_LVL2 |
 			UBWC_SWIZZLE_ENABLE_LVL3,
 	.highest_bank_bit = 16,
-	.macrotile_mode = true,
 };
 
 static const struct qcom_ubwc_cfg_data msm8937_data = {
@@ -49,15 +48,13 @@ static const struct qcom_ubwc_cfg_data sa8775p_data = {
 	.ubwc_enc_version = UBWC_4_0,
 	.ubwc_swizzle = UBWC_SWIZZLE_ENABLE_LVL3,
 	.highest_bank_bit = 13,
-	.macrotile_mode = true,
 };
 
 static const struct qcom_ubwc_cfg_data sar2130p_data = {
-	.ubwc_enc_version = UBWC_3_0, /* 4.0.2 in hw */
+	.ubwc_enc_version = UBWC_3_1,
 	.ubwc_swizzle = UBWC_SWIZZLE_ENABLE_LVL2 |
 			UBWC_SWIZZLE_ENABLE_LVL3,
 	.highest_bank_bit = 13,
-	.macrotile_mode = true,
 };
 
 static const struct qcom_ubwc_cfg_data sc7180_data = {
@@ -68,11 +65,10 @@ static const struct qcom_ubwc_cfg_data sc7180_data = {
 };
 
 static const struct qcom_ubwc_cfg_data sc7280_data = {
-	.ubwc_enc_version = UBWC_3_0,
+	.ubwc_enc_version = UBWC_3_1,
 	.ubwc_swizzle = UBWC_SWIZZLE_ENABLE_LVL2 |
 			UBWC_SWIZZLE_ENABLE_LVL3,
 	.highest_bank_bit = 14,
-	.macrotile_mode = true,
 };
 
 static const struct qcom_ubwc_cfg_data sc8180x_data = {
@@ -80,7 +76,6 @@ static const struct qcom_ubwc_cfg_data sc8180x_data = {
 	.ubwc_swizzle = UBWC_SWIZZLE_ENABLE_LVL2 |
 			UBWC_SWIZZLE_ENABLE_LVL3,
 	.highest_bank_bit = 16,
-	.macrotile_mode = true,
 };
 
 static const struct qcom_ubwc_cfg_data sc8280xp_data = {
@@ -88,7 +83,6 @@ static const struct qcom_ubwc_cfg_data sc8280xp_data = {
 	.ubwc_swizzle = UBWC_SWIZZLE_ENABLE_LVL2 |
 			UBWC_SWIZZLE_ENABLE_LVL3,
 	.highest_bank_bit = 16,
-	.macrotile_mode = true,
 };
 
 static const struct qcom_ubwc_cfg_data sdm670_data = {
@@ -155,7 +149,6 @@ static const struct qcom_ubwc_cfg_data sm8250_data = {
 			UBWC_SWIZZLE_ENABLE_LVL3,
 	/* TODO: highest_bank_bit = 15 for LP_DDR4 */
 	.highest_bank_bit = 16,
-	.macrotile_mode = true,
 };
 
 static const struct qcom_ubwc_cfg_data sm8350_data = {
@@ -164,7 +157,6 @@ static const struct qcom_ubwc_cfg_data sm8350_data = {
 			UBWC_SWIZZLE_ENABLE_LVL3,
 	/* TODO: highest_bank_bit = 15 for LP_DDR4 */
 	.highest_bank_bit = 16,
-	.macrotile_mode = true,
 };
 
 static const struct qcom_ubwc_cfg_data sm8550_data = {
@@ -173,7 +165,6 @@ static const struct qcom_ubwc_cfg_data sm8550_data = {
 			UBWC_SWIZZLE_ENABLE_LVL3,
 	/* TODO: highest_bank_bit = 15 for LP_DDR4 */
 	.highest_bank_bit = 16,
-	.macrotile_mode = true,
 };
 
 static const struct qcom_ubwc_cfg_data sm8750_data = {
@@ -181,7 +172,6 @@ static const struct qcom_ubwc_cfg_data sm8750_data = {
 	.ubwc_swizzle = 6,
 	/* TODO: highest_bank_bit = 15 for LP_DDR4 */
 	.highest_bank_bit = 16,
-	.macrotile_mode = true,
 };
 
 static const struct qcom_ubwc_cfg_data glymur_data = {
@@ -189,7 +179,6 @@ static const struct qcom_ubwc_cfg_data glymur_data = {
 	.ubwc_swizzle = 0,
 	/* TODO: highest_bank_bit = 15 for LP_DDR4 */
 	.highest_bank_bit = 16,
-	.macrotile_mode = true,
 };
 
 static const struct of_device_id qcom_ubwc_configs[] __maybe_unused = {
diff --git a/include/linux/soc/qcom/ubwc.h b/include/linux/soc/qcom/ubwc.h
index 405d83f8d95b..d4a0cfb133fa 100644
--- a/include/linux/soc/qcom/ubwc.h
+++ b/include/linux/soc/qcom/ubwc.h
@@ -33,15 +33,6 @@ struct qcom_ubwc_cfg_data {
 	 * DDR bank.  This should ideally use DRAM type detection.
 	 */
 	int highest_bank_bit;
-
-	/**
-	 * @macrotile_mode: Macrotile Mode
-	 *
-	 * Whether to use 4-channel macrotiling mode or the newer
-	 * 8-channel macrotiling mode introduced in UBWC 3.1. 0 is
-	 * 4-channel and 1 is 8-channel.
-	 */
-	bool macrotile_mode;
 };
 
 #define UBWC_1_0 0x10000000
@@ -80,9 +71,16 @@ static inline bool qcom_ubwc_min_acc_length_64b(const struct qcom_ubwc_cfg_data
 	return cfg->ubwc_enc_version == UBWC_1_0;
 }
 
+/*
+ * @qcom_ubwc_macrotile_mode: whether to use 4-channel or 8-channel macrotiling
+ *
+ * The 8-channel macrotiling mode was introduced in UBWC 3.1.
+ *
+ * Returns: false for the 4-channel and true for 8-channel.
+ */
 static inline bool qcom_ubwc_macrotile_mode(const struct qcom_ubwc_cfg_data *cfg)
 {
-	return cfg->macrotile_mode;
+	return cfg->ubwc_enc_version >= UBWC_3_1;
 }
 
 static inline bool qcom_ubwc_bank_spread(const struct qcom_ubwc_cfg_data *cfg)

-- 
2.47.3

