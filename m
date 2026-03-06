Return-Path: <dri-devel-bounces@lists.freedesktop.org>
Delivered-To: lists+dri-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id CJH3HiEFq2nDZQEAu9opvQ
	(envelope-from <dri-devel-bounces@lists.freedesktop.org>)
	for <lists+dri-devel@lfdr.de>; Fri, 06 Mar 2026 17:47:29 +0100
X-Original-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 2B692225586
	for <lists+dri-devel@lfdr.de>; Fri, 06 Mar 2026 17:47:29 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8528010EDDD;
	Fri,  6 Mar 2026 16:47:26 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="jQHU/CJH";
	dkim=pass (2048-bit key; unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="BucMKcMK";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com
 [205.220.180.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3BF2710EDB4
 for <dri-devel@lists.freedesktop.org>; Fri,  6 Mar 2026 16:47:24 +0000 (UTC)
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 626Fr27H550043
 for <dri-devel@lists.freedesktop.org>; Fri, 6 Mar 2026 16:47:23 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 ylSabl4CClj6t/w9cxf3ZToG54oIITlqCJttWo/AVWg=; b=jQHU/CJHY5MIn6ZY
 aCSa4lqOAqgPrFoHJiZLiatiMeY3RG7EoVpygYZKTT+feeX0KHXAChnzoNtelO48
 zbrLl1vLkjDaJLWiYYdI+RwCOF4DSXOTT5+IHLWeZt9vNxXGMTBu+F4Ou3Lz95rs
 Rt+7KUNev0Rtgr/aFoUFV0RdAbn83m4TfVPZ4NZ/6Y3hZnJzqW3qvZoSoXzzj51j
 geHtdb16JctMLyLShtDDoV2zpu3iQ4x+V4QKUt4uvBmIwa+PDxGtQdkD8b8C+I1I
 ZNLXNe4PS2eiEV/qGU5Iw4SYHnhspL/H+uSIVitmv0mgac5uYpEbnYmPQcsK4ZOZ
 +1IIpg==
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com
 [209.85.222.199])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4cqruka66t-1
 (version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
 for <dri-devel@lists.freedesktop.org>; Fri, 06 Mar 2026 16:47:23 +0000 (GMT)
Received: by mail-qk1-f199.google.com with SMTP id
 af79cd13be357-8cb706313beso1228029985a.3
 for <dri-devel@lists.freedesktop.org>; Fri, 06 Mar 2026 08:47:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oss.qualcomm.com; s=google; t=1772815643; x=1773420443;
 darn=lists.freedesktop.org; 
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:from:to:cc:subject:date:message-id
 :reply-to; bh=ylSabl4CClj6t/w9cxf3ZToG54oIITlqCJttWo/AVWg=;
 b=BucMKcMKOi7kVGdWT47GWMSRPbAPFV3SO1k7YWqJ1WgnFRZO8isBJ/05jE5YCUs5KB
 hw9HRybhbGhny3FXkWgPUKAH/zv+JSnrZ1PVrhHCPMeJ9Hr+Hstk46EmbsayGqRqormw
 IRTONBn35bMYeEu+KwpLIWGO7WuN1+3L3h434jg8HY5x0AMyOzEjDZTGmLK7k41yn86W
 CsBFNZA8jiH/LkOO2zt5sjhSA0pOThgS74y1hP6R62s504rvbK7ZPLtMBtGm9014te1y
 TPum059aTkEAWvg9/lJ6+26ElFnKY7xgSJq/57gah2HmVKEQh+KkAxCTzmH3CU+RwXb7
 M3Wg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1772815643; x=1773420443;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
 :cc:subject:date:message-id:reply-to;
 bh=ylSabl4CClj6t/w9cxf3ZToG54oIITlqCJttWo/AVWg=;
 b=i9nm2vZ9GhIN7TcaeedJ+VnvfVSFlWk3NhtRkV6/OoVLWb0UChDQuHpTxmF+xx6LIY
 ijrd8disvXRL9R648Fkc7fQSu9AcrAXYpv/2Lip7+SQ6f64j6APLkl0hl7YTnndY0HR0
 j4thiAy/mYB+LgjQVpA0LNojHDR71Vw6oLncKi6BPRDlcOaTwLBjzuu6ptt/7nRSzGjb
 s4vacTgx2LN7YgJUpdGxK+krwwwVWFbDyn2i+/btmq0QrkkpxkCzKqybo57FIDquthn4
 CaxLr+dleInJUbE8Kpt7ND+xwL4ySTPnocQer9GprTUtf3L3wJxbyJ+ss9nhIiU8ngdk
 WPpA==
X-Forwarded-Encrypted: i=1;
 AJvYcCVsuiu6ChbYlqNGJYu8M982k0ICqjgMe8OPjlAByv01Hxg6Zs0FXXyN2Ux6+Tb7hwdv8xKRT5DosAk=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YxOPdjBKuGSyHDUsXzN8+DXX/st+TUS+nJWUiDdazzO/uycyemN
 Pc+pS4j3k3a9aaimOsQPzOlh2lGl0RcWLA04zzYgCaUTnSgbT0EGaZyPFyN+5xgovT72sp+Dsvb
 YvX3fSR5DSHQEsRaI/1ZsQq/NOrr65IBGibgI2YNTaCubQAwfcjqLm9C3fuNmrJJKwgYrUfo=
X-Gm-Gg: ATEYQzz7pleRTEtoxOz8Se1EKEnaW75Ra1TCHzZyyCawGQLiEu1VeFDJl4brQuMTf4f
 yD7NUVtt2QxN834bjm903ORqOcJ3khFibPbordFyis7P6A/4D6YfHhbv5qyzYK/gCwc2H94Oiv6
 p8gAfjgK8TOFKjH8tg3ttrcGqNTB1fq2wgGfUaKJz9Yl91Hi1BkBH6MzQQC4UMr7uOf/OhkE2oM
 nC8O8boRsqnLDa/Qpyi7jsMD9eBGl3uuxMcr6OmPyuG0vl6DvsScit4ctWrGnu3QntnUEQjg7DO
 2WgIBbtLhbyRp6luZjcauX7MJ+B592bpma5VWD8np52Tj/7P9HWYk/mVEppiluMXP+L0WlEgSRl
 uEIe0yYQegK+G/aNuxK/AsP5Fz7xJT/eyari4WIAUdQ8qJNsuQ+xQHieAh1JqzQwUqQ5UCNTnxf
 rpMIQr2uTAIGAjXihBzicndutVgjhEV7A6F+g=
X-Received: by 2002:a05:620a:46a6:b0:8cb:4ef2:f3b4 with SMTP id
 af79cd13be357-8cd6d48d6bdmr344384085a.73.1772815642617; 
 Fri, 06 Mar 2026 08:47:22 -0800 (PST)
X-Received: by 2002:a05:620a:46a6:b0:8cb:4ef2:f3b4 with SMTP id
 af79cd13be357-8cd6d48d6bdmr344378085a.73.1772815642060; 
 Fri, 06 Mar 2026 08:47:22 -0800 (PST)
Received: from umbar.lan
 (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi.
 [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
 by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-5a13eaebd0asm213804e87.51.2026.03.06.08.47.20
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 06 Mar 2026 08:47:21 -0800 (PST)
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Date: Fri, 06 Mar 2026 18:47:11 +0200
Subject: [PATCH 05/24] drm/msm/adreno: use qcom_ubwc_version_tag() helper
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260306-ubwc-rework-v1-5-9cfdff12f2bb@oss.qualcomm.com>
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
 freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=openpgp-sha256; l=2867;
 i=dmitry.baryshkov@oss.qualcomm.com; h=from:subject:message-id;
 bh=dSBWM2x+kwZjmcQFVewwgxBgzRu48ixGoJYbIjzhJjM=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBpqwUNAqeJoTbTsD3xfc25tA2JTYbYyry1SyyAB
 JBOvxzy/+KJATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCaasFDQAKCRCLPIo+Aiko
 1Up4CACjWn/4ferCxCSGdGqQBb4i8bAXXaYWwL4r+o7o1tnvLZy9TM5DgjZtTw6j9wSifHZVjJQ
 KpB0lVk3zwj1ON9SsrFJ6HvaP5dKhfhCBShpUBLB//PBv/ho+l3htScn1PPfLY1jjb2nCEjAzE9
 gwhanlPxIrIzvd2h0MxJhZ5dsQK7w0mGxrAY0TrvsiNzOVM76gd2ILAGl2rK2ZwnuYfVKiv4W8g
 BDhBVO5jiqVAkW8UI7PkdFFQUbCSKIo/NQ7HksoTxx1y61/Gba7feWW/PRgFNJqOSxT5ZqnTMwx
 VDurHEwjSuCaWkIwV1eur+Cdc/iv1KbnCIk9j1Y6gAT3JbmA
X-Developer-Key: i=dmitry.baryshkov@oss.qualcomm.com; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzA2MDE1OSBTYWx0ZWRfX9aZMoL47aIoy
 jgIvt1UTLRqzbhuBKYW6mSIb5E2Hb/YHBbphG/DmT6Xy6Ex3YxcHdr/qgMw0xRCXm5sEbul+JO7
 GHmczHn/+ffBXR0DAscabwe3+bWuLZncuRdV6uMrBrPZgaVDPZkgvcRFjv3tMY/CiGL8mbdU0dN
 izjCGerCQMq/n9wR/SxVABgjxLmDnikzmxqRQKz9ubWVwc58qQJQ1JV1rIh4VXf7PPZaA61hEsI
 r7LkqWjSXJwL5UuhOAXOmlDFOoodyqYgEC/s/7TNMrKeA5yxARZL4rOoEv+Rwoc3ESltyBv0f12
 gLUVTHuD+0k0jen7HVn12vhxq5o0cZKhO9Rre+9ODSAMUj+Rw6MW1AMrURpyOwERBgDBVMzrYV0
 lDhbOENQFvDaz8/z4dwWeGFqbKxcMqJ4ZWCOumqdEhin21ysfAKBg6aI+19plFfWs55Bn2qbs5E
 3+eBdTsg2ag1fQqyPvw==
X-Proofpoint-ORIG-GUID: iE6H5wjIK4-ePz0uIiB9-BfBV-bI6aEp
X-Authority-Analysis: v=2.4 cv=DvZbOW/+ c=1 sm=1 tr=0 ts=69ab051b cx=c_pps
 a=HLyN3IcIa5EE8TELMZ618Q==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22 a=EUspDBNiAAAA:8
 a=QjZuzksZpR1x1fsoQ4cA:9 a=QEXdDO2ut3YA:10 a=bTQJ7kPSJx9SKPbeHEYW:22
X-Proofpoint-GUID: iE6H5wjIK4-ePz0uIiB9-BfBV-bI6aEp
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-06_05,2026-03-06_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 impostorscore=0 malwarescore=0 bulkscore=0 adultscore=0
 suspectscore=0 clxscore=1015 phishscore=0 priorityscore=1501 spamscore=0
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
X-Rspamd-Queue-Id: 2B692225586
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-1.31 / 15.00];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	MAILLIST(-0.20)[mailman];
	R_SPF_ALLOW(-0.20)[+ip4:131.252.210.177:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MIME_GOOD(-0.10)[text/plain];
	RWL_MAILSPIKE_GOOD(-0.10)[131.252.210.177:from];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_RECIPIENTS(0.00)[m:robin.clark@oss.qualcomm.com,m:lumag@kernel.org,m:abhinav.kumar@linux.dev,m:jesszhan0024@gmail.com,m:sean@poorly.run,m:marijn.suijten@somainline.org,m:airlied@gmail.com,m:simona@ffwll.ch,m:andersson@kernel.org,m:konradybcio@kernel.org,m:akhilpo@oss.qualcomm.com,m:linux-arm-msm@vger.kernel.org,m:freedreno@lists.freedesktop.org,m:linux-kernel@vger.kernel.org,m:konrad.dybcio@oss.qualcomm.com,s:lists@lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FREEMAIL_TO(0.00)[oss.qualcomm.com,kernel.org,linux.dev,gmail.com,poorly.run,somainline.org,ffwll.ch];
	FORGED_SENDER_MAILLIST(0.00)[];
	ARC_NA(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[16];
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
	DBL_BLOCKED_OPENRESOLVER(0.00)[gabe.freedesktop.org:rdns,gabe.freedesktop.org:helo,qualcomm.com:dkim,qualcomm.com:email]
X-Rspamd-Action: no action

Use new helper defined to program UBWC version to the hardware.

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
---
 drivers/gpu/drm/msm/adreno/a8xx_gpu.c |  8 +++-----
 drivers/gpu/drm/msm/msm_mdss.c        | 16 +---------------
 2 files changed, 4 insertions(+), 20 deletions(-)

diff --git a/drivers/gpu/drm/msm/adreno/a8xx_gpu.c b/drivers/gpu/drm/msm/adreno/a8xx_gpu.c
index b1887e0cf698..6dc1d81fcaeb 100644
--- a/drivers/gpu/drm/msm/adreno/a8xx_gpu.c
+++ b/drivers/gpu/drm/msm/adreno/a8xx_gpu.c
@@ -272,35 +272,33 @@ static void a8xx_set_ubwc_config(struct msm_gpu *gpu)
 	bool rgb565_predicator = false, amsbc = false;
 	bool ubwc_mode = qcom_ubwc_get_ubwc_mode(cfg);
 	u32 ubwc_version = cfg->ubwc_enc_version;
-	u32 hbb, hbb_hi, hbb_lo, mode = 1;
+	u32 hbb, hbb_hi, hbb_lo, mode;
 	u8 uavflagprd_inv = 2;
 
 	switch (ubwc_version) {
 	case UBWC_6_0:
 		yuvnotcomptofc = true;
-		mode = 5;
 		break;
 	case UBWC_5_0:
 		amsbc = true;
 		rgb565_predicator = true;
-		mode = 4;
 		break;
 	case UBWC_4_0:
 		amsbc = true;
 		rgb565_predicator = true;
 		fp16compoptdis = true;
 		rgba8888_lossless = true;
-		mode = 2;
 		break;
 	case UBWC_3_0:
 		amsbc = true;
-		mode = 1;
 		break;
 	default:
 		dev_err(&gpu->pdev->dev, "Unknown UBWC version: 0x%x\n", ubwc_version);
 		break;
 	}
 
+	mode = qcom_ubwc_version_tag(cfg);
+
 	/*
 	 * We subtract 13 from the highest bank bit (13 is the minimum value
 	 * allowed by hw) and write the lowest two bits of the remaining value
diff --git a/drivers/gpu/drm/msm/msm_mdss.c b/drivers/gpu/drm/msm/msm_mdss.c
index 9f81f43283b9..798a23fbc906 100644
--- a/drivers/gpu/drm/msm/msm_mdss.c
+++ b/drivers/gpu/drm/msm/msm_mdss.c
@@ -204,7 +204,7 @@ static void msm_mdss_setup_ubwc_v6(struct msm_mdss *msm_mdss)
 	const struct qcom_ubwc_cfg_data *data = msm_mdss->mdss_data;
 	u32 value = MDSS_UBWC_STATIC_UBWC_SWIZZLE(data->ubwc_swizzle) |
 		    MDSS_UBWC_STATIC_HIGHEST_BANK_BIT(data->highest_bank_bit - 13);
-	u32 ver, prediction_mode;
+	u32 prediction_mode;
 
 	if (data->ubwc_bank_spread)
 		value |= MDSS_UBWC_STATIC_UBWC_BANK_SPREAD;
@@ -222,20 +222,6 @@ static void msm_mdss_setup_ubwc_v6(struct msm_mdss *msm_mdss)
 	else
 		prediction_mode = 1;
 
-	if (data->ubwc_enc_version >= UBWC_6_0)
-		ver = 5;
-	else if (data->ubwc_enc_version >= UBWC_5_0)
-		ver = 4;
-	else if (data->ubwc_enc_version >= UBWC_4_3)
-		ver = 3;
-	else if (data->ubwc_enc_version >= UBWC_4_0)
-		ver = 2;
-	else if (data->ubwc_enc_version >= UBWC_3_0)
-		ver = 1;
-	else /* UBWC 1.0 and 2.0 */
-		ver = 0;
-
-	writel_relaxed(ver, msm_mdss->mmio + REG_MDSS_UBWC_CTRL_2);
 	writel_relaxed(prediction_mode, msm_mdss->mmio + REG_MDSS_UBWC_PREDICTION_MODE);
 }
 

-- 
2.47.3

