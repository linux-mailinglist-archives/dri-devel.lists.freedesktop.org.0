Return-Path: <dri-devel-bounces@lists.freedesktop.org>
Delivered-To: lists+dri-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id kI5rL1PkoWmUwwQAu9opvQ
	(envelope-from <dri-devel-bounces@lists.freedesktop.org>)
	for <lists+dri-devel@lfdr.de>; Fri, 27 Feb 2026 19:37:07 +0100
X-Original-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 5D4E91BC116
	for <lists+dri-devel@lfdr.de>; Fri, 27 Feb 2026 19:37:07 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 68DC210EBEE;
	Fri, 27 Feb 2026 18:37:05 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="DgYKNAC4";
	dkim=pass (2048-bit key; unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="QhyaUqP8";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com
 [205.220.168.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 085CA10E126
 for <dri-devel@lists.freedesktop.org>; Fri, 27 Feb 2026 18:37:03 +0000 (UTC)
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 61RH0Iu4151880
 for <dri-devel@lists.freedesktop.org>; Fri, 27 Feb 2026 18:37:02 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 n+4gYFk5re0nH67EqAjd5y6zdk0Xk7vxJi2bsbftFBk=; b=DgYKNAC4Q9b7GUmK
 lBJXRyNs9TIM9MOq3UV4jSu7EF49ufXQZzjJ24826Q0vCxs4ArhtxSVplw5mmSIy
 1AfOW+dxv1RYDqPB141heq32tJZ031qw0t+10oFXMXk3IQpFZHy+v3R5/KPs8R7R
 OASIIHo09J6+V7RgNTcPIEtdbmNm4eXL/4pfMnEjSRymNAO89zZAs4gwBNmrlFpz
 0tlyfPaGp8v/BwVB/auo4HZdW5LMGFNCDq5L5/ByJ4uNC8d/hLML+TJbghG7IFR/
 AUdCeCpZErvUAgbtuEPZm4dUXsEPT98MwhF2XZyuJAm0W15XQI5hRzu4TLf5K35I
 jL5VDg==
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com
 [209.85.222.199])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4cju4r4k09-1
 (version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
 for <dri-devel@lists.freedesktop.org>; Fri, 27 Feb 2026 18:37:02 +0000 (GMT)
Received: by mail-qk1-f199.google.com with SMTP id
 af79cd13be357-8cb3b6b37d8so1667635185a.3
 for <dri-devel@lists.freedesktop.org>; Fri, 27 Feb 2026 10:37:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oss.qualcomm.com; s=google; t=1772217421; x=1772822221;
 darn=lists.freedesktop.org; 
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:from:to:cc:subject:date:message-id
 :reply-to; bh=n+4gYFk5re0nH67EqAjd5y6zdk0Xk7vxJi2bsbftFBk=;
 b=QhyaUqP8bboTflwvHBsiWtflCbOwry842Ww8GnL5YlT30TpYki726Y9SqS3ALGBC7j
 IGew9MkWp95BuQiGS86Yl9up3nQ2PKC1DVFW7qw7bj935258Hz6ui5YFDRKA6jv+K34+
 qaj+WXCHVwJco/adot1MgKfZphoZpY6zni1grgyPy2gO9pUo7/Z7ekLPIsOHDMXM6xqJ
 FLFJvTcA+IO9yD54avf3yG0a5//h8HtZK/ASE3ytKvlwFZUahRWGsx5D0fR5pIasEOfp
 fH68tIF82jck81l1A7d/wP75MgoRmDUtknao3GhEqG3wTff/i8vVYkebO0UlukK5jaUa
 q+wg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1772217421; x=1772822221;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
 :cc:subject:date:message-id:reply-to;
 bh=n+4gYFk5re0nH67EqAjd5y6zdk0Xk7vxJi2bsbftFBk=;
 b=qTLKw6sANGmRCbNUuSQ91JtPqffSk+/m0lmyYo/t5s2IV+zcTMWYhBrZbx9d1mvlMv
 +V84Wg/HJu3G5riRRkMSgSjVCOm8DfcXel6I31Q8F0493IG0yDyntc5EK4MTDI0Lzax7
 L1YSWORS1PV4pmc+udgQvZ2rHjDMbTmGDKAayH8LGeuEQ2/3IEc0VEyupYkleeEjwCmI
 nlTPCC+fS2wvJwp2rVENEO5BMm+lBIX3f7U4IC8Rvg1d9uHOVbsA47cfwcRODH7OT/bI
 CIscctSqtRSZ3TjJE7wYKx8/20yAEOr40x2E60xhmo9U0fO6dq/TUkM/8UCK9TUZTcVE
 wO/A==
X-Forwarded-Encrypted: i=1;
 AJvYcCVNRSt+3pytznktNNATGVYoybxMOwp67dN6gyxDFaBDlYb2RVc42el9bn+vfxsDsJz2KgSpYjHHAGw=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YywUSS2bsiW7wI2sZDp5OcTRlZOHH1x4DH9KD2Bf7L6wcIj+HEt
 ag/3yhCmHfUX0gopBTIcY/iMA8/ufzskZ7mL1s0ijPbB/yTo3Nc0aspxBF3FmUrw7G+FA48nJEV
 nnuyprHt1ztP72wTbVNg8AUL1Eq3ct92YYQswufYZnzQtELZxqkDxrASL2K+AOwUd0dG5Qfw=
X-Gm-Gg: ATEYQzyfClbcGVL0YAImxBtxaHut8XJO46o6qVzOsS8PSfcMJvVpT5RtEwp32oRyqPD
 Vx7Hama5rwqAEk8YZx9MEQvsg8s5ICKcuC7cOGYDB/5Uy+EneB1wtFeGVS6cd/H2CoviC9ujELH
 Zerac1T3b+BeQtkJe50iCUIoWdH7iCktcIAEo1CZdh6HdgdWixGkp+BxKS/pBLgTS47KFmqLwxS
 rHWLr/KgD/l20yKQNrOSZUPpmEr5iOS0ndNvKNEQDtLzE8qjqnvsSa9fYPQfYgE1SiApGyBXciX
 cmuG9lRAY2wXGm85o8jG6TyEcbvZLCs4JERTnx4S3aGwCQq5mT5JtKOlIn87d5Ytl3aD55nJi9K
 4RbQ1KTbfEVL6YrzmqVeWefLFWrTDHa57s3xtiNWSFUkK3hxOnKurxLldUxEmcrNPvwI7PGdPmo
 7qyWkSOZ9lQ5VewCMenSFBW0ZHVlQcNlr+NYA=
X-Received: by 2002:a05:620a:4608:b0:8c9:f8e5:9f12 with SMTP id
 af79cd13be357-8cbc8dfb5afmr473791385a.57.1772217421431; 
 Fri, 27 Feb 2026 10:37:01 -0800 (PST)
X-Received: by 2002:a05:620a:4608:b0:8c9:f8e5:9f12 with SMTP id
 af79cd13be357-8cbc8dfb5afmr473787585a.57.1772217420934; 
 Fri, 27 Feb 2026 10:37:00 -0800 (PST)
Received: from umbar.lan
 (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi.
 [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
 by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-5a115bca0e6sm117082e87.29.2026.02.27.10.36.59
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 27 Feb 2026 10:37:00 -0800 (PST)
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Date: Fri, 27 Feb 2026 20:36:46 +0200
Subject: [PATCH 7/7] drm/msm/dpu: drop VBIF index from the struct dpu_hw_vbif
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260227-drop-vbif-nrt-v1-7-2b97d0438182@oss.qualcomm.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=4106;
 i=dmitry.baryshkov@oss.qualcomm.com; h=from:subject:message-id;
 bh=dte0nYEc0ewgpu8HO4OB4g6OuUwdq1FY8Aaod4fPrG4=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBpoeQ+dq1W256FoCKe9hdi2ebZ+9ZiAVPssnNZf
 XLXCG6HqBGJATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCaaHkPgAKCRCLPIo+Aiko
 1Qk4B/0RZT+xLbthmmGio2SIYM+9NC87C2Z601o3sEKm9T+cJqs/Jqeg1brX/+qJWpB6VjERwkQ
 LcRCQj563cJSuTxT4YcKSb6+4nSp7IuEOQ4X4NbBDw6P7e9M8s2B6Aq/nK7v7tRBkhZ0e3Tl8ZI
 ZvpOMT8Cl7HxG2dTtBAYIlMstpswFJfNWcVlO06frSwnydUd5M01ZlIuKyx6Fpc0SqV/i7cgZC8
 9Nf4WpYUAt36xK081daO3TLgf7+VLeBGSYziDWcelCOGL+k6v++TcKnPRoCse7xzfQ7jZOMAY8A
 jB4IS7ughAhRshQE7fhWKU0Y2R/SB+xWWhtbe1xQAPWg3B1c
X-Developer-Key: i=dmitry.baryshkov@oss.qualcomm.com; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMjI3MDE2NCBTYWx0ZWRfX/Wi216yHmBWb
 nzcAej/HcSpbjNs5lnb+ipIernahsYVR8Ogr6q4QlfLZCoEEs6qQc1DFuG5lkWVRQwurlJk9fNl
 FgfQJ/opBbpqL0qjwMr7EmtHwy2a/3Or1G3CepVXYcIuqEDRt35ETR9UNB69gIwHrD1btSyx1e6
 T+2Tp0Z+YsLB38WQHCTXAumq8C6/FCXhFTVq/KYX0ZakSzgSLieYbwZzY/9Q2Q6JyECE0qGfMts
 ybGvvmD2hDtL3yJuMKh9GRsZTHejwxA1EreZzvQMPS4fykK7AxyVcIQH7cBEDGMwF8Zl1qhoJPD
 vicwJu2plhsSrRZPLMkFxQWBHkxU6eJnsZwcPxv6XUAmF8P60n06c2IbX10KDxufHkRgkwzhGaP
 Tqf67uORXJbN3P9juLBWwbK4wbz22JI8qEQOsXQRHBORAT0Vk8AQZpmbm/JesY6AC5iVsRDX70w
 MkkKfoo5ppKlSdA6JaQ==
X-Proofpoint-GUID: jKwoanRXjYJmZ0IbwU8RZBcrxDF9Up4q
X-Authority-Analysis: v=2.4 cv=KZzfcAYD c=1 sm=1 tr=0 ts=69a1e44e cx=c_pps
 a=HLyN3IcIa5EE8TELMZ618Q==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=HzLeVaNsDn8A:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22 a=EUspDBNiAAAA:8
 a=Rro-Jn1WIAMZ-BlAJUcA:9 a=QEXdDO2ut3YA:10 a=bTQJ7kPSJx9SKPbeHEYW:22
X-Proofpoint-ORIG-GUID: jKwoanRXjYJmZ0IbwU8RZBcrxDF9Up4q
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-02-27_03,2026-02-27_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 lowpriorityscore=0 priorityscore=1501 suspectscore=0
 malwarescore=0 bulkscore=0 adultscore=0 phishscore=0 spamscore=0
 impostorscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2602130000
 definitions=main-2602270164
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
X-Rspamd-Queue-Id: 5D4E91BC116
X-Rspamd-Action: no action

Since we don't support and don't use VBIF_NRT, VBIF_RT is the only
possible VBIF type. To simplify the driver, drop vbif_idx from the VBIF
instance structure. As the last users of VBIF_RT and enum dpu_vbif are
gone, drop them too.

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
---
 drivers/gpu/drm/msm/disp/dpu1/dpu_hw_mdss.h |  4 ----
 drivers/gpu/drm/msm/disp/dpu1/dpu_hw_vbif.c |  1 -
 drivers/gpu/drm/msm/disp/dpu1/dpu_hw_vbif.h |  1 -
 drivers/gpu/drm/msm/disp/dpu1/dpu_vbif.c    | 30 ++++++++---------------------
 4 files changed, 8 insertions(+), 28 deletions(-)

diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_mdss.h b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_mdss.h
index a169628eb512..0e65bf5ddc4a 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_mdss.h
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_mdss.h
@@ -284,10 +284,6 @@ enum dpu_wd_timer {
 	WD_TIMER_MAX
 };
 
-enum dpu_vbif {
-	VBIF_RT,
-};
-
 /**
  * enum dpu_3d_blend_mode
  * Desribes how the 3d data is blended
diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_vbif.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_vbif.c
index de70d6b00972..112df3f31e2b 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_vbif.c
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_vbif.c
@@ -236,7 +236,6 @@ struct dpu_hw_vbif *dpu_hw_vbif_init(struct drm_device *dev,
 	/*
 	 * Assign ops
 	 */
-	c->idx = VBIF_RT;
 	c->cap = cfg;
 	_setup_vbif_ops(&c->ops, c->cap->features);
 
diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_vbif.h b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_vbif.h
index 9ac49448e432..96ec4e35e549 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_vbif.h
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_vbif.h
@@ -98,7 +98,6 @@ struct dpu_hw_vbif {
 	struct dpu_hw_blk_reg_map hw;
 
 	/* vbif */
-	enum dpu_vbif idx;
 	const struct dpu_vbif_cfg *cap;
 
 	/* ops */
diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_vbif.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_vbif.c
index d33231f1d50b..0c6fa9bb0cb6 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_vbif.c
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_vbif.c
@@ -11,16 +11,6 @@
 #include "dpu_hw_vbif.h"
 #include "dpu_trace.h"
 
-static const char *dpu_vbif_name(enum dpu_vbif idx)
-{
-	switch (idx) {
-	case VBIF_RT:
-		return "VBIF_RT";
-	default:
-		return "??";
-	}
-}
-
 /**
  * _dpu_vbif_wait_for_xin_halt - wait for the xin to halt
  * @vbif:	Pointer to hardware vbif driver
@@ -52,12 +42,10 @@ static int _dpu_vbif_wait_for_xin_halt(struct dpu_hw_vbif *vbif, u32 xin_id)
 
 	if (!status) {
 		rc = -ETIMEDOUT;
-		DPU_ERROR("%s client %d not halting. TIMEDOUT.\n",
-				dpu_vbif_name(vbif->idx), xin_id);
+		DPU_ERROR("VBIF client %d not halting. TIMEDOUT.\n", xin_id);
 	} else {
 		rc = 0;
-		DRM_DEBUG_ATOMIC("%s client %d is halted\n",
-				dpu_vbif_name(vbif->idx), xin_id);
+		DRM_DEBUG_ATOMIC("VBIF client %d is halted\n", xin_id);
 	}
 
 	return rc;
@@ -97,10 +85,10 @@ static void _dpu_vbif_apply_dynamic_ot_limit(struct dpu_hw_vbif *vbif,
 		}
 	}
 
-	DRM_DEBUG_ATOMIC("%s xin:%d w:%d h:%d fps:%d pps:%llu ot:%u\n",
-			dpu_vbif_name(vbif->idx), params->xin_id,
-			params->width, params->height, params->frame_rate,
-			pps, *ot_lim);
+	DRM_DEBUG_ATOMIC("VBIF xin:%d w:%d h:%d fps:%d pps:%llu ot:%u\n",
+			 params->xin_id,
+			 params->width, params->height, params->frame_rate,
+			 pps, *ot_lim);
 }
 
 /**
@@ -143,8 +131,7 @@ static u32 _dpu_vbif_get_ot_limit(struct dpu_hw_vbif *vbif,
 	}
 
 exit:
-	DRM_DEBUG_ATOMIC("%s xin:%d ot_lim:%d\n",
-			dpu_vbif_name(vbif->idx), params->xin_id, ot_lim);
+	DRM_DEBUG_ATOMIC("VBIF xin:%d ot_lim:%d\n", params->xin_id, ot_lim);
 	return ot_lim;
 }
 
@@ -252,8 +239,7 @@ void dpu_vbif_clear_errors(struct dpu_kms *dpu_kms)
 	if (vbif && vbif->ops.clear_errors) {
 		vbif->ops.clear_errors(vbif, &pnd, &src);
 		if (pnd || src) {
-			DRM_DEBUG_KMS("%s: pnd 0x%X, src 0x%X\n",
-				      dpu_vbif_name(vbif->idx), pnd, src);
+			DRM_DEBUG_KMS("VBIF: pnd 0x%X, src 0x%X\n", pnd, src);
 		}
 	}
 }

-- 
2.47.3

