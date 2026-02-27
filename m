Return-Path: <dri-devel-bounces@lists.freedesktop.org>
Delivered-To: lists+dri-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id QHRZFVnkoWm+wwQAu9opvQ
	(envelope-from <dri-devel-bounces@lists.freedesktop.org>)
	for <lists+dri-devel@lfdr.de>; Fri, 27 Feb 2026 19:37:13 +0100
X-Original-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id EE4511BC144
	for <lists+dri-devel@lfdr.de>; Fri, 27 Feb 2026 19:37:12 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E3A0610EBE3;
	Fri, 27 Feb 2026 18:37:10 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="oQaAyuiS";
	dkim=pass (2048-bit key; unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="ZP0ABeIf";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com
 [205.220.180.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F3C6910EBE9
 for <dri-devel@lists.freedesktop.org>; Fri, 27 Feb 2026 18:36:58 +0000 (UTC)
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 61RH0fFP527828
 for <dri-devel@lists.freedesktop.org>; Fri, 27 Feb 2026 18:36:58 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 /Mm3L5n1VZ9S77ktWqS8w18v1vJNzHKjRMTXqXcL5jg=; b=oQaAyuiS9eNefbL9
 tV/wqaAUhIPnQABVgId1X3R/BKe2S1gtprDUR9jRarYx2dM1inc62D9ZuDa7jJB+
 9xwQThU8pYjmJM8EeU5o7m9Ip/v85H7C4THsKP03rG0i7e72asK/OgZYFu3np0TG
 Jy4OfBgCY/OYCEGqLH4DFSaCJ5734sT0FQcXK0uQ3YvWUvhXpKIXq7MDz4UNm0oB
 FbifJZqpkcmnp5lqwKfzrESNpug2jW3j9g2v7t06P65Bk1ovydF1MWAQztZU2EVY
 rzcWhoTvkBPZYn/LKkEgPo5tLYU6OquYDNUlhtE9j9r66tWWDIhkhTsQI/fB05Mg
 T1FkYQ==
Received: from mail-qv1-f69.google.com (mail-qv1-f69.google.com
 [209.85.219.69])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4cjw23bxm5-1
 (version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
 for <dri-devel@lists.freedesktop.org>; Fri, 27 Feb 2026 18:36:58 +0000 (GMT)
Received: by mail-qv1-f69.google.com with SMTP id
 6a1803df08f44-899b08be91cso296207766d6.0
 for <dri-devel@lists.freedesktop.org>; Fri, 27 Feb 2026 10:36:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oss.qualcomm.com; s=google; t=1772217417; x=1772822217;
 darn=lists.freedesktop.org; 
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:from:to:cc:subject:date:message-id
 :reply-to; bh=/Mm3L5n1VZ9S77ktWqS8w18v1vJNzHKjRMTXqXcL5jg=;
 b=ZP0ABeIfjgNbq2W+0jrHPvFmOZCTCgjEHlQXLkCFWPlxfdBqYQulOXX8fx9R+WuoSC
 P9pIu8/94u/UfPz5BNFAdaJxBBIJyYZC6NvL1MJVLrciQexvQrnGxrKLL82z2egLSZKH
 0nb5AeQdJatE80gXQWahWVyX8mCQVOnH+Ww3J1zOaut+Ej4MrzL8BTW5AAG9jZr1l9zk
 BsdGvrODZbyvmwjJeKhNR7nJVMOmfSvP1WKQEPNIMJu5XKbToQM+zULaf1qOEhHbNu4e
 cGZSCsclj9WZnFXXslqQiPPtBTQNLMt9mUGDMx9dsn4xAlLdF6B0m89mob15Ov8edIzh
 B9EQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1772217417; x=1772822217;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
 :cc:subject:date:message-id:reply-to;
 bh=/Mm3L5n1VZ9S77ktWqS8w18v1vJNzHKjRMTXqXcL5jg=;
 b=Gi3xIcmGHGEannk2uxO+lI56v439PtXtdBwDaJtEmQAD/2uLWzat30txks0VGyYDzP
 vD4ma906RhWhHaldO9tAIC/o2jJ1Hl4fjFs7Y8RxEua/pflhGhMsmC7mNU9GuY3Rjd64
 uh3curCdGvY+C3LltA16c2XWuYNOMM1GWGjmU7sNR+b18fEKySw56MKwK2VlJuiMX/PE
 89o1lUtfBgQG+tpZ0lGaL+135sDExydeYF9cCcieotcb9naJ9pzRWEc5tuEqzpI4iwgN
 NZPaRMR1f8zN5z2Xjqp06JmDajnP+77nZKGJhFWOsj7LEbMNLp44GwABBOzXvekXw3SJ
 uMzQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCXRNel9Z9qgMRegkkCDeIf5/Wuo+DjAzpxlVCVfGiLHPZUZFgTIquVFsoLmJszVuQMVkGTQDh0ciVg=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YyK5VY0642H/08pCoYRj52UeKiYEqgGXhBNZDO+R1ExO84VuKcx
 k3tCWE4bLTod8bIEOL/tSZqMtmHPWy9oO2SMrtokhsnPHU+Z6rJMls1ESBYY0Uv9Q9e+39kd8I3
 QjcOsCJZAN0PyjEQSYahE0UIqFY/g0hsLvc7nZE6NtQzyPW1LNL7FvGUYMzL6sWOwW8zxepU=
X-Gm-Gg: ATEYQzwiY3sV619u4Ywts9sMZxiQGrwvzarjnUlm4rIk2kkE17Jqjru3AUcPTvYnbv2
 QxKdM4ySC/EM3cOwPh6rVhJ5lytU2pctFqUDvjlx0NiIRwRg/3NsipuJndJrmTWalttys4OLrSX
 3HA/F9TuPTLZh/FsB8RzHpheTs/hwzNlWgih+N9/lF+WGn1D9gc7vDWktulG4iYnkFMn9WzXDav
 JCPSF7j33Un1mKdy49JGQ6ekHr7LKdXsXZBWe3nqqXSS8K07v2hPkIMQHv7uUNoUteZtMSf93bT
 uVD61LsmKEUWcHpF9x2oUFUxQaErFFjJJi9S8quaUwbYNKaHyCRLFAyPkEYjv2IAJUwbwfvFu+A
 edO3IstCcgBcpjUeRqKO5lq3SXpMs4o9MSFo/kR0UyBUT/aJFHxhTuPL+eKYDa0WRLUA0D7dAH2
 Emy1SaAle0AyCqgSajDcJBjZm2o0JHOSJawAQ=
X-Received: by 2002:a05:620a:4011:b0:8c9:fb29:e1a3 with SMTP id
 af79cd13be357-8cbc8ef6bc7mr512790385a.48.1772217417341; 
 Fri, 27 Feb 2026 10:36:57 -0800 (PST)
X-Received: by 2002:a05:620a:4011:b0:8c9:fb29:e1a3 with SMTP id
 af79cd13be357-8cbc8ef6bc7mr512786085a.48.1772217416863; 
 Fri, 27 Feb 2026 10:36:56 -0800 (PST)
Received: from umbar.lan
 (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi.
 [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
 by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-5a115bca0e6sm117082e87.29.2026.02.27.10.36.56
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 27 Feb 2026 10:36:56 -0800 (PST)
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Date: Fri, 27 Feb 2026 20:36:43 +0200
Subject: [PATCH 4/7] drm/msm/dpu: drop VBIF id, base and name from the catalog
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260227-drop-vbif-nrt-v1-4-2b97d0438182@oss.qualcomm.com>
References: <20260227-drop-vbif-nrt-v1-0-2b97d0438182@oss.qualcomm.com>
In-Reply-To: <20260227-drop-vbif-nrt-v1-0-2b97d0438182@oss.qualcomm.com>
To: Rob Clark <robin.clark@oss.qualcomm.com>,
 Dmitry Baryshkov <lumag@kernel.org>,
 Abhinav Kumar <abhinav.kumar@linux.dev>,
 Jessica Zhang <jesszhan0024@gmail.com>, Sean Paul <sean@poorly.run>,
 Marijn Suijten <marijn.suijten@somainline.org>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>
Cc: linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
 freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=openpgp-sha256; l=3909;
 i=dmitry.baryshkov@oss.qualcomm.com; h=from:subject:message-id;
 bh=S9urinrm97a3tn0MebL8/S1O8BaYIJcXVyoMPjUkJqA=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBpoeQ+CwjYEc896d2hqJ0Ee+odN7dBHl7b7AB91
 cdjqFd6Y/WJATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCaaHkPgAKCRCLPIo+Aiko
 1QvpB/93wIfzoBNtsweJO61t0aiG5sRt2DjU6qiftXksBsD+WybqC+nfFt0/2bfKmfbwLTchMEi
 glGWAVbrB0UawhV4IgxHKZ34/FXiYDbOO6TacVTb3zswtkIvwMgYS/j5gS4mk6Da7EQY7eavbaQ
 aTxWXkGOMSoXzXSRjHdGIM5jvJ7FrTd7EysRqDVdZtUbbRBhh60HiKx7+lOCNw349u55WvMYsfr
 jMtJHWJ/0M4Eh3yRhWNc6ersyJyYCeCU5A7eM0xOrWu9pmHragRiCWHbAuvZoeqB/ItL+QsHbtN
 OXlPqlnMSbvaapdqMI9mhKSut4v1UeR8/TVc1hSYZottX/bB
X-Developer-Key: i=dmitry.baryshkov@oss.qualcomm.com; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A
X-Proofpoint-GUID: Ug8zuddYHaS8PeGaIvuk5t6B-2LvXnE7
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMjI3MDE2NCBTYWx0ZWRfXw0SPfbJujcJM
 VafAhcj3EN3vjgKa7rieV5gzzP+bU576VrAMNZ3O3igV9DVygMMDM/UdjQ8/E+1ek5WUhcOB3ay
 9b3DQPUe8nilkda3EWsl0SLM9d5PqKyCTxX/8yiiPnw12ifaBKvbqHG/WrWDIXEE9PMZhQPGLkE
 wMH3j1Wkt7VjmCAhHs4B5Y/KRbCqqAjwPufF/ZkT3FUGq5/6r7ASR2Myb39tdXULkTTTx4grGZv
 mIhwOFU1Olu++M/P9X4f/XyrsviYccwGZCqzsoHyj4EuESXzAKeYu+Hic1IacssK9U31qJJPMnF
 4G8NmtqD+kX7/uQeHQNq9eVIbB9pAg3tcw1T/lR65XguAxBQaR6Wn0X6l0UR3FSJnvJf5tkcnrI
 rasO0dRcucLYwOkYaUH1kMh0PZlqAlELDrfT1hVZh23X3bi+L+IOGAzW49zos9JvLNSUXRsQl04
 WdfCJVEc0dO03YNd9Vw==
X-Authority-Analysis: v=2.4 cv=cJHtc1eN c=1 sm=1 tr=0 ts=69a1e44a cx=c_pps
 a=wEM5vcRIz55oU/E2lInRtA==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=HzLeVaNsDn8A:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22 a=EUspDBNiAAAA:8
 a=6fVEOi8AC71Pdc0kXHcA:9 a=QEXdDO2ut3YA:10 a=OIgjcC2v60KrkQgK7BGD:22
X-Proofpoint-ORIG-GUID: Ug8zuddYHaS8PeGaIvuk5t6B-2LvXnE7
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-02-27_03,2026-02-27_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 impostorscore=0 lowpriorityscore=0 phishscore=0 adultscore=0
 spamscore=0 clxscore=1015 priorityscore=1501 suspectscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2602130000 definitions=main-2602270164
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
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-1.31 / 15.00];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	MAILLIST(-0.20)[mailman];
	R_SPF_ALLOW(-0.20)[+ip4:131.252.210.177:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MIME_GOOD(-0.10)[text/plain];
	RWL_MAILSPIKE_GOOD(-0.10)[131.252.210.177:from];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_RECIPIENTS(0.00)[m:robin.clark@oss.qualcomm.com,m:lumag@kernel.org,m:abhinav.kumar@linux.dev,m:jesszhan0024@gmail.com,m:sean@poorly.run,m:marijn.suijten@somainline.org,m:airlied@gmail.com,m:simona@ffwll.ch,m:linux-arm-msm@vger.kernel.org,m:freedreno@lists.freedesktop.org,m:linux-kernel@vger.kernel.org,s:lists@lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FREEMAIL_TO(0.00)[oss.qualcomm.com,kernel.org,linux.dev,gmail.com,poorly.run,somainline.org,ffwll.ch];
	FORGED_SENDER_MAILLIST(0.00)[];
	ARC_NA(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[12];
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
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[dri-devel];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[oss.qualcomm.com:mid,oss.qualcomm.com:dkim,gabe.freedesktop.org:helo,gabe.freedesktop.org:rdns,qualcomm.com:email,qualcomm.com:dkim]
X-Rspamd-Queue-Id: EE4511BC144
X-Rspamd-Action: no action

For all the platforms VBIF id is VBIF_RT, the name and base are also
fixed. Drop those fields from the catalog.

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
---
 drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c | 15 +++++----------
 drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.h |  5 ++---
 drivers/gpu/drm/msm/disp/dpu1/dpu_hw_vbif.c    |  4 ++--
 3 files changed, 9 insertions(+), 15 deletions(-)

diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c
index 94c70b7b789e..35c75e11fe82 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c
@@ -514,8 +514,7 @@ static const struct dpu_vbif_dynamic_ot_cfg msm8998_ot_rdwr_cfg[] = {
 };
 
 static const struct dpu_vbif_cfg msm8996_vbif = {
-	.name = "vbif_rt", .id = VBIF_RT,
-	.base = 0, .len = 0x1040,
+	.len = 0x1040,
 	.default_ot_rd_limit = 32,
 	.default_ot_wr_limit = 16,
 	.features = BIT(DPU_VBIF_QOS_REMAP) | BIT(DPU_VBIF_QOS_OTLIM),
@@ -540,8 +539,7 @@ static const struct dpu_vbif_cfg msm8996_vbif = {
 };
 
 static const struct dpu_vbif_cfg msm8998_vbif = {
-	.name = "vbif_rt", .id = VBIF_RT,
-	.base = 0, .len = 0x1040,
+	.len = 0x1040,
 	.default_ot_rd_limit = 32,
 	.default_ot_wr_limit = 32,
 	.features = BIT(DPU_VBIF_QOS_REMAP) | BIT(DPU_VBIF_QOS_OTLIM),
@@ -568,8 +566,7 @@ static const struct dpu_vbif_cfg msm8998_vbif = {
 };
 
 static const struct dpu_vbif_cfg sdm845_vbif = {
-	.name = "vbif_rt", .id = VBIF_RT,
-	.base = 0, .len = 0x1040,
+	.len = 0x1040,
 	.features = BIT(DPU_VBIF_QOS_REMAP),
 	.xin_halt_timeout = 0x4000,
 	.qos_rp_remap_size = 0x40,
@@ -586,8 +583,7 @@ static const struct dpu_vbif_cfg sdm845_vbif = {
 };
 
 static const struct dpu_vbif_cfg sm8550_vbif = {
-	.name = "vbif_rt", .id = VBIF_RT,
-	.base = 0, .len = 0x1040,
+	.len = 0x1040,
 	.features = BIT(DPU_VBIF_QOS_REMAP),
 	.xin_halt_timeout = 0x4000,
 	.qos_rp_remap_size = 0x40,
@@ -604,8 +600,7 @@ static const struct dpu_vbif_cfg sm8550_vbif = {
 };
 
 static const struct dpu_vbif_cfg sm8650_vbif = {
-	.name = "vbif_rt", .id = VBIF_RT,
-	.base = 0, .len = 0x1074,
+	.len = 0x1074,
 	.features = BIT(DPU_VBIF_QOS_REMAP),
 	.xin_halt_timeout = 0x4000,
 	.qos_rp_remap_size = 0x40,
diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.h b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.h
index fda4f3bdd797..38280d776c72 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.h
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.h
@@ -587,8 +587,7 @@ struct dpu_vbif_qos_tbl {
 
 /**
  * struct dpu_vbif_cfg - information of VBIF blocks
- * @id                 enum identifying this block
- * @base               register offset of this block
+ * @len:               length of hardware block
  * @features           bit mask identifying sub-blocks/features
  * @ot_rd_limit        default OT read limit
  * @ot_wr_limit        default OT write limit
@@ -602,7 +601,7 @@ struct dpu_vbif_qos_tbl {
  * @memtype            array of xin memtype definitions
  */
 struct dpu_vbif_cfg {
-	DPU_HW_BLK_INFO;
+	u32 len;
 	unsigned long features;
 	u32 default_ot_rd_limit;
 	u32 default_ot_wr_limit;
diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_vbif.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_vbif.c
index af76ad8a8103..de70d6b00972 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_vbif.c
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_vbif.c
@@ -230,13 +230,13 @@ struct dpu_hw_vbif *dpu_hw_vbif_init(struct drm_device *dev,
 	if (!c)
 		return ERR_PTR(-ENOMEM);
 
-	c->hw.blk_addr = addr + cfg->base;
+	c->hw.blk_addr = addr;
 	c->hw.log_mask = DPU_DBG_MASK_VBIF;
 
 	/*
 	 * Assign ops
 	 */
-	c->idx = cfg->id;
+	c->idx = VBIF_RT;
 	c->cap = cfg;
 	_setup_vbif_ops(&c->ops, c->cap->features);
 

-- 
2.47.3

