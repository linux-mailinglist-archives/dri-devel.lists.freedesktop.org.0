Return-Path: <dri-devel-bounces@lists.freedesktop.org>
Delivered-To: lists+dri-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id aFuFOS8Fq2nDZQEAu9opvQ
	(envelope-from <dri-devel-bounces@lists.freedesktop.org>)
	for <lists+dri-devel@lfdr.de>; Fri, 06 Mar 2026 17:47:43 +0100
X-Original-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 89C6D22560F
	for <lists+dri-devel@lfdr.de>; Fri, 06 Mar 2026 17:47:43 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 87D4510EDF3;
	Fri,  6 Mar 2026 16:47:41 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="b3OMDOX5";
	dkim=pass (2048-bit key; unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="iibqT6d8";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com
 [205.220.180.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9FCF710EDED
 for <dri-devel@lists.freedesktop.org>; Fri,  6 Mar 2026 16:47:36 +0000 (UTC)
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 626Fr5af2008561
 for <dri-devel@lists.freedesktop.org>; Fri, 6 Mar 2026 16:47:35 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 wJB79bVUZrsbxSexjswx340+SsqpUDunWLmQTkIAkcU=; b=b3OMDOX5BD8+4950
 W/lo6or1iwD9WF2ECLHehO6KeYMuvr7U+Mzz+hf7LkAWmIZEHUj+SEMhC6vIRfgU
 PbrDrr8q5QB2buqRY53bAcuJtoIEyxZkSJTnI2fakhSF9mp7CShcn8mAN+Wd0Gd+
 mbyjLI3uQOdLdyc6x34HVCkXYDtUP3489D47J9vc8j3sQgwxbATDRl8KIxHyJvSM
 mHVWeXtB2yeY+RAvXlLG9wiaN0145ECceJNeMKJ8xxEm6KYwHCqWzKYuNWoAELvT
 Yo7kqDbGjhRtlVLK0NCJy+bUr8tkrWjvzx+FnDa5sr/cp9KgGDlKQTGHlLQLlLNo
 4YSrMQ==
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com
 [209.85.222.197])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4cqv9ahckd-1
 (version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
 for <dri-devel@lists.freedesktop.org>; Fri, 06 Mar 2026 16:47:35 +0000 (GMT)
Received: by mail-qk1-f197.google.com with SMTP id
 af79cd13be357-8c70cff1da5so4928238385a.2
 for <dri-devel@lists.freedesktop.org>; Fri, 06 Mar 2026 08:47:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oss.qualcomm.com; s=google; t=1772815655; x=1773420455;
 darn=lists.freedesktop.org; 
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:from:to:cc:subject:date:message-id
 :reply-to; bh=wJB79bVUZrsbxSexjswx340+SsqpUDunWLmQTkIAkcU=;
 b=iibqT6d86p/rgq5tCvn+K8CjdPMcoSPCZvyJzXOpAQTiysdA6EnmxEvvBVMgrxRzUF
 kWe4gOouvwxLZg84SD8TVKiL6qB5u+RB7MjX9rbuoquoYq24YARszyopp/v/7aA3qaOX
 QkNI5PWNcHXlK35ha2bD1pKPnA/rrr9BO05l918DpyReoy9W47j+7UIuru6nahXHDcdr
 H6zTBo0meZKg8ZvptiYuNBjm/EoLAm7HCx9LsAHO75JnfuXi1fD8n5aK3DpwfgOo42Vx
 d4JH7DdEvTZRW3+JSjtzrpwx26o3SjNWLfnZBvRnCoLHS2QxPw9WJ5dzNi2sKnE9Ito6
 14jw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1772815655; x=1773420455;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
 :cc:subject:date:message-id:reply-to;
 bh=wJB79bVUZrsbxSexjswx340+SsqpUDunWLmQTkIAkcU=;
 b=Uzc237NLkEW2ZnvuaGsHdlJkdV157OGw9NbiagFO+p6W/6ba9HOfS/NRpeOAmr9HhS
 XhyDF7FgQWiFTm1oOp8afF/nAC2JDPA2Ur8ELJrPAAbFa7wPdg04kK268UevF4xa0/6i
 Nk1kpM6kJyCisHeGW6WB8BPpV9CVFaiw2Whrgp+JlOKwj1lupeHufdI3avFKDn3YCRB0
 PRKcoRIINwScHD9qkNPXciVpHr4e+/ykyfaFR7lqGxMUJVW8NFwFXlckx/JWyIp68Sm4
 KR6nBaId4vPnVGf9qZrMNhwDXo9z5s+N6DTtC/EB3YOFJdbK/UprGRYmxfATQL1sm+pV
 O/6Q==
X-Forwarded-Encrypted: i=1;
 AJvYcCW8flB1Umx33MzF2hNRsQftA6UCru51RiNmKagjkNa86O4QhMDHFCFb4cC5qrh7W2eeCMma4qMD8ik=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YyJq65cAauJr4agFy/EAN7kZYXsdfQBb5pFxdUnJgwWMa7ouUBB
 6xB1XLcAcfxpLM+JkOiqS2BAcLk/YVoyIRv1Z4ACDYWq/KSIazwTHPGambEJfsHyWLnSRL/5XER
 yXks+nAa3XXMDSMwvHjscTyBT5HEzwppXEYx2y3VAxTHOqiPqMtDqsmTsgxL3QHH6m8dtmYI=
X-Gm-Gg: ATEYQzwW90c3VjVKw/kM4bV2CBfQE+elIlbxACB6dW4CplTyOSsfx9F5p8+LtA0Ctgq
 4UFR2c0+nLUEhljBX+dyVfzvGkXwWGcluqfbtmd5Xax8Zw7y0IlxHXsaxMS5SJPtxuF7kpH3zgU
 jSfZWWBaOrH9Fs8JMnEICSL6KGHKV8Mt18IbElWHfiUnaeaL2o8kXGzpI43v0HTBeawUF2ImRYH
 mHfPkjIhBOBYMhaFZnFamWfuBQQ7eVye8weCF72wQcs5QrvAI+To/OJeaCajgIMnqHjt9jXNOFi
 jRctfoClvcN6traAGEzAeTzEzzVWlTalkL+jpuXzb41sVgeR09d06uuABcnUS4vJ8ovdcZm2z+i
 D61M4fqoFzisUdNQ4/GDxtkR6FdV2Z/rhBC4lH/bW+smnbJBbefUAfEW6xr/CLl1bJYCPKj4kEi
 sBON9O+5k6cT8kTL7ZzUeGZlzg6XCNEaBbYLI=
X-Received: by 2002:a05:620a:4721:b0:8c9:eacc:dc16 with SMTP id
 af79cd13be357-8cd6d37176fmr366711885a.29.1772815654735; 
 Fri, 06 Mar 2026 08:47:34 -0800 (PST)
X-Received: by 2002:a05:620a:4721:b0:8c9:eacc:dc16 with SMTP id
 af79cd13be357-8cd6d37176fmr366705185a.29.1772815654039; 
 Fri, 06 Mar 2026 08:47:34 -0800 (PST)
Received: from umbar.lan
 (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi.
 [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
 by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-5a13eaebd0asm213804e87.51.2026.03.06.08.47.32
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 06 Mar 2026 08:47:33 -0800 (PST)
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Date: Fri, 06 Mar 2026 18:47:18 +0200
Subject: [PATCH 12/24] drm/msm/dpu: use new helper to set ubwc_swizzle
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260306-ubwc-rework-v1-12-9cfdff12f2bb@oss.qualcomm.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=1592;
 i=dmitry.baryshkov@oss.qualcomm.com; h=from:subject:message-id;
 bh=BQXxAsNkcgoIebP1VAZBuBHx3qvfk0HLeeYsTxoyeyM=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBpqwUO8Ex+JPWJ+F1STr1Fz8blrRQSL1616YHar
 fhCWu7KFZ6JATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCaasFDgAKCRCLPIo+Aiko
 1eLWB/4qKS9M2QSk4gBgTzuR+lBoo3EFQLXIn28BVsW9tNK5u4BmuuHD8+4m1d6vzLWv4w/VNVL
 QIlcjUamaXYmVv+YncwGEG/H+ZQuywNypjD0+rjZwiy+ip9aJvCydE81IeOnU91amSAI5shWxzz
 GaQLVVo7eImBApIUz73/Z+STHTKj+Bj2xtMnVH0urEW9YwHjiZ48To8lTKRhXeou25f3cFluJhF
 aDmnNeOAxwtBJ4njrgMNDcNlJaN0ndH8+/Qxc0s8jqRzkL293BMDIvOFM3guxLs2V9tj//4tH+A
 U+pHfC27wAaO2QxuSmkyC6nu1uMV7MfWWNv5/a3D5ZTPJINj
X-Developer-Key: i=dmitry.baryshkov@oss.qualcomm.com; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A
X-Proofpoint-GUID: L6DT8RoPWqWk3QipCDu4-NcI5ycyH4-o
X-Proofpoint-ORIG-GUID: L6DT8RoPWqWk3QipCDu4-NcI5ycyH4-o
X-Authority-Analysis: v=2.4 cv=G4wR0tk5 c=1 sm=1 tr=0 ts=69ab0527 cx=c_pps
 a=50t2pK5VMbmlHzFWWp8p/g==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22 a=EUspDBNiAAAA:8
 a=46QewcZEoJiMQYndSOUA:9 a=QEXdDO2ut3YA:10 a=IoWCM6iH3mJn3m4BftBB:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzA2MDE1OSBTYWx0ZWRfXyaUYZQHDnDdF
 aqZ0F8pDOPMINEvx/kXTiTe523yfEw5ls5m2ZwPfUt+A8UvvNlsKzYvS7KV5bE/CM2gITctjud+
 KM200aZcSFP+TxVSjM6OiMm+xKiMAifBjAWmLCVU5YNerYrqCHHP7C0DrR0v3zTUxFKwZQxsZzx
 ZzzpldjaJwNX9mQ4Tpoz1un48IKG5f4PxNzzBAgsQ4CNtpZ6VHYdwIlJcGEHeH9zMF2USvvoBqt
 ZglpcJCAOPJ7ibSyYkzKa0Cxg4Y0cYeCRZi8wGWvrgfEyNwXTAAwfyZLsd5BvvdICfuebGGjWVR
 NLEOlDN05a14+GZecCDLD7f1SQjH+UFZJZCCP8OJu+u4N11AiDafUrBcpmgw+FzzLhbH/Tqr9h1
 /sB7OmBNzC2rIRyBV+XljL9eN7o8a8YYSWDTfXPclB3JnPEtyNABBEt2SQvcI9WlfYkU4g9olrc
 jWxtgQxHB3gVwqgrGSA==
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
X-Rspamd-Queue-Id: 89C6D22560F
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
	NEURAL_HAM(-0.00)[-0.984];
	TAGGED_RCPT(0.00)[dri-devel];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[qualcomm.com:dkim,qualcomm.com:email,gabe.freedesktop.org:rdns,gabe.freedesktop.org:helo]
X-Rspamd-Action: no action

Use freshly defined helper instead of using the raw value from the
database.

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
---
 drivers/gpu/drm/msm/disp/dpu1/dpu_hw_sspp.c | 7 ++++---
 1 file changed, 4 insertions(+), 3 deletions(-)

diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_sspp.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_sspp.c
index d3da70009234..6089a58074ac 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_sspp.c
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_sspp.c
@@ -318,13 +318,14 @@ void dpu_hw_setup_format_impl(struct dpu_sw_pipe *pipe, const struct msm_format
 
 		if (ctx->ubwc->ubwc_enc_version == UBWC_1_0) {
 			fast_clear = fmt->alpha_enable ? BIT(31) : 0;
-			ctrl_val = fast_clear | (ctx->ubwc->ubwc_swizzle & 0x1) |
+			ctrl_val = fast_clear |
+				(qcom_ubwc_swizzle(ctx->ubwc) & UBWC_SWIZZLE_ENABLE_LVL1) |
 				BIT(8) | (hbb << 4);
 		} else if (ctx->ubwc->ubwc_enc_version == UBWC_2_0) {
 			fast_clear = fmt->alpha_enable ? BIT(31) : 0;
-			ctrl_val = fast_clear | ctx->ubwc->ubwc_swizzle | (hbb << 4);
+			ctrl_val = fast_clear | qcom_ubwc_swizzle(ctx->ubwc) | (hbb << 4);
 		} else if (ctx->ubwc->ubwc_enc_version == UBWC_3_0) {
-			ctrl_val = BIT(30) | (ctx->ubwc->ubwc_swizzle) | (hbb << 4);
+			ctrl_val = BIT(30) | qcom_ubwc_swizzle(ctx->ubwc) | (hbb << 4);
 		} else if (ctx->ubwc->ubwc_enc_version == UBWC_4_0) {
 			ctrl_val = MSM_FORMAT_IS_YUV(fmt) ? 0 : BIT(30);
 		} else if (ctx->ubwc->ubwc_enc_version <= UBWC_6_0) {

-- 
2.47.3

