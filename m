Return-Path: <dri-devel-bounces@lists.freedesktop.org>
Delivered-To: lists+dri-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id GKMEEy8Fq2kMZgEAu9opvQ
	(envelope-from <dri-devel-bounces@lists.freedesktop.org>)
	for <lists+dri-devel@lfdr.de>; Fri, 06 Mar 2026 17:47:43 +0100
X-Original-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id F1A96225608
	for <lists+dri-devel@lfdr.de>; Fri, 06 Mar 2026 17:47:42 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 31A3E10EDF2;
	Fri,  6 Mar 2026 16:47:41 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="RUo/ZWRh";
	dkim=pass (2048-bit key; unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="Qq+Ix7ys";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com
 [205.220.180.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9018C10EDEE
 for <dri-devel@lists.freedesktop.org>; Fri,  6 Mar 2026 16:47:37 +0000 (UTC)
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 626Fr5Gh1424358
 for <dri-devel@lists.freedesktop.org>; Fri, 6 Mar 2026 16:47:36 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 Aie/7ZFKISr7ex2L2qy7vWj/+PsvZZhXHj0gPDXAjM8=; b=RUo/ZWRh/8xT01VC
 bRYEW5v8dCgJtq+Jio/JoywLt2w5tQffzAwEQYS0dEX00XMymcOxEXbIyL4Xt4jm
 aas/XjwGagNROUYBqF2qn4KMLrctlO5dTIkfTgbkpuTSg6dwxWbxuqQoXGjQ41zK
 yonQti4zSCCn/1iIBcBzTFEJTnmUuRwfXWLhX1OKXjVhfKxJ6pCDYP2Rkw7/WYM7
 iMy9z4APiIWIiJSgXOCyZ5PrYG8pLCf4++K2iLGqhFDvKhFnC9k/VSIH1RtV3Qb1
 PQXlwqh332s+MFRAtQUQQCYH0Em5HONvXNNRXDm+eppn6D0v49AB00dA4ZO3Lv6y
 uk+fMg==
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com
 [209.85.222.199])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4cqrf5t7xf-1
 (version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
 for <dri-devel@lists.freedesktop.org>; Fri, 06 Mar 2026 16:47:36 +0000 (GMT)
Received: by mail-qk1-f199.google.com with SMTP id
 af79cd13be357-8c711251ac5so5155856685a.1
 for <dri-devel@lists.freedesktop.org>; Fri, 06 Mar 2026 08:47:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oss.qualcomm.com; s=google; t=1772815656; x=1773420456;
 darn=lists.freedesktop.org; 
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:from:to:cc:subject:date:message-id
 :reply-to; bh=Aie/7ZFKISr7ex2L2qy7vWj/+PsvZZhXHj0gPDXAjM8=;
 b=Qq+Ix7yslo2LCEHxyCz+J+jIbGnuYwbfb206LQgHZ2DsGyU4VcAXB4XnkRlzkXJGgc
 05KbaeDeGRW69La/yPWY2y6fAXEBQAhzybbc03HAzijQ+NvULujCgI00I91UgBGs5+G7
 GKXQiQOmNxiT+1YoRqF04Wz/soAyBcxCNAIhtVDHeCaenH326KVhJHtUpBzedbjv9nXP
 YbNW+trYCPfU0b+kSskzF/Sw+ouCpHo3JYEaQaZq+qHimdVNcfQSmlfT0z6OmCy4x5WE
 QJhPGTzwp9Ujjnlm+0jYu6iJNa7TyQ3J1xIocO/iBPOeZ28kGHfEil80mBwjbot1z0NP
 vVmQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1772815656; x=1773420456;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
 :cc:subject:date:message-id:reply-to;
 bh=Aie/7ZFKISr7ex2L2qy7vWj/+PsvZZhXHj0gPDXAjM8=;
 b=VSYKwWBpt7cp7ULZQBku5AdKMUedsbODKtg0G0yKFQP453poaVL/xDU+DzfFt8uJ39
 WeBhDDlCIcpE8ySGbiU1vRXBR3RDqflwgRAub57asfii1ZkWC0afpkLCHhnPlv++/C8A
 3fw8Nrw9muLDN7fN/b/xxf4rzn0T5JxgZlbZKX88DfuKHKBwqStw3FFNmF6+iVeus40j
 nWpG7PcHiLjEuVP02rSUVLjFmp/aDEbh4kKXDleGjA2AK9smUjzdwANZWe5t5ccVnC55
 5gE5+nmvtznFGBsoFcoxbk+SQiXTm/485T2LvjEXa3aRtUeGp6KZi2Rqo4Qn+pUsuveE
 T5CA==
X-Forwarded-Encrypted: i=1;
 AJvYcCVy+Acw8qouFyD8g8EfKTUYQka40kUBWlLuoB5nYMn63oQia49MLzGWofQyDlYdlwGXGopueaIBDVs=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YziDShR4uJBf38q8F8uCOFx7s3TIuTA7LxsO1Zk4TtdB1hEcHjX
 j3T3wvGcpPlS3JRanqElx0gs3vg20AMCN9vIvBQuip4gwFfOKg1UsuvsyVMLDe89Mf2Ng3GvSPV
 AoY56FOE6LnQjdd8JupYkLtdF52zeU3xN1cHrHOfwFK9OqYKPWKYBuf0jyblWbHokvRAZRuk=
X-Gm-Gg: ATEYQzxcvJ/9LAY12GFICtMo6vrVTrA15wCui/eI4CEQHT0VpswFSWjcZ7cMrxFo5xo
 o4Nwm8MOi3aDEzNYlJyksRzSCS/VxXk0S6mD0UiqFMF1Qd2LudJR0QCy1ovp/4Ki77L8ByyjZMJ
 9njyzcNQEwfskh0QpkGnSFCic1YXdX/Y5hMPo6QDmqyi9LgC/8BmwCpljcjGF5RNuGurR+YTi5n
 v0xsy7deL6poCMOAqMpozUqIVRcuVMoNBpzA8tIuSME29HFNDxJxUrsO/YMLJzAuQZRnJom3x7w
 7qrcaK6SIT+8AQ4h/+XUeSCmwD13N2SlRuNpM5Ar89NY8yZq7m1xmqTf68fA6/0Sw8FQCYuIjqV
 ARfZacjkKsGl4LIUvEZ3jlOWuF3yby40HJjVL2Sf6o6XLh4dlWDel++PiJZpFxwoblooQkFRYAq
 mTkARdeoq4pbnhOhu/NBbB3wuefXFvmTyBNQo=
X-Received: by 2002:a05:620a:4093:b0:8c7:106c:cbd4 with SMTP id
 af79cd13be357-8cd6d324021mr353872985a.12.1772815656010; 
 Fri, 06 Mar 2026 08:47:36 -0800 (PST)
X-Received: by 2002:a05:620a:4093:b0:8c7:106c:cbd4 with SMTP id
 af79cd13be357-8cd6d324021mr353869385a.12.1772815655528; 
 Fri, 06 Mar 2026 08:47:35 -0800 (PST)
Received: from umbar.lan
 (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi.
 [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
 by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-5a13eaebd0asm213804e87.51.2026.03.06.08.47.34
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 06 Mar 2026 08:47:34 -0800 (PST)
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Date: Fri, 06 Mar 2026 18:47:19 +0200
Subject: [PATCH 13/24] drm/msm/mdss: use new helper to set ubwc_swizzle
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260306-ubwc-rework-v1-13-9cfdff12f2bb@oss.qualcomm.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=1997;
 i=dmitry.baryshkov@oss.qualcomm.com; h=from:subject:message-id;
 bh=qsOpdLggOXLMpfbLwFYg8PlGDKmsRsIEs54oYjYlw/0=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBpqwUOwmtRsGD4tC9puPqHYNiohxXzcLjDEA5Uh
 CAgwY2R9lSJATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCaasFDgAKCRCLPIo+Aiko
 1dcOB/9RSpFMP6nY1bR64RNcJvTiVkU2qOr2TrLnNTTJdrKYmebkWCnVJR4OawMqK9lHX1rn1QK
 oZwfQDrzMkq7vhgODaLuZwp9Lz+zZcLVBcS3QbxMSUtQXvFw/DewIC2Nllol7BQ2iH0vndNjg2M
 m7fEzvOEKpZz23v2ndm5pM9L4omgJZzSnYo7ueL1glzcdLBH6CdBK7er1EnEY5Sw2pqFjqb4zr2
 AMHgLiltIygWZWI9zOZe7jGued11wULPqYWI6NzkKZd77RCFz94sL0NKXKRMy3YyodMHq0DU6tC
 pKBBos0H9ueHjLKhp79Q39DtztobCoXWvzSIeP1IuAxjciSM
X-Developer-Key: i=dmitry.baryshkov@oss.qualcomm.com; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A
X-Proofpoint-ORIG-GUID: Zi0QxJYBZMFwmHIVr8CFJFiQyijff0Qt
X-Proofpoint-GUID: Zi0QxJYBZMFwmHIVr8CFJFiQyijff0Qt
X-Authority-Analysis: v=2.4 cv=L+oQguT8 c=1 sm=1 tr=0 ts=69ab0528 cx=c_pps
 a=HLyN3IcIa5EE8TELMZ618Q==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22 a=EUspDBNiAAAA:8
 a=o1f3_DkCrcuZBLJIWnwA:9 a=QEXdDO2ut3YA:10 a=bTQJ7kPSJx9SKPbeHEYW:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzA2MDE1OSBTYWx0ZWRfXwQhgBSUzEW1x
 IS3z7QC9aOYgK22HBwAms3aDcUsKI0z2OgnBUvLL7bxl9ORclKboRU2jLrBlfVpYr9MCPE73n9e
 6Dvd/8B5jzaylnaWBBi0phq5KBDkKRn6/xMmjI6lCJfQsMcWc9Mr+k3oVlj5vqhU510OlfjhOri
 6T8g4nBlv4EKIS3nHdMpwIF++ZDVR5QxWyeRT2tp37JykRTgoxGQ2Soo31fd8/G2T2jBvuTSiDf
 UaqW53tAketZOp10oKiHCIsmMXYfs8oJrh6o1/F8Sy5kEupftLNrwKi+zj52r1GeEAYf5iaHDj/
 9thitDDN3xCA50RW+Z7wKnQWaNLpvuIYgRLWmLfAtDEMo7pRGwoWCrvSbAqMN9sDt7WAJLhU6vc
 RgyopyO9sbrJGIoC2Ep2qmOY6R0vM9DHIFZmMG7IShZRH23U1sO8w2ApbSKSkRh26j1X54RRGHV
 Sf5OaNvC4ViLeAn8sCg==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-06_05,2026-03-06_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 suspectscore=0 adultscore=0 bulkscore=0 priorityscore=1501
 phishscore=0 impostorscore=0 lowpriorityscore=0 spamscore=0 malwarescore=0
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
X-Rspamd-Queue-Id: F1A96225608
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
	NEURAL_HAM(-0.00)[-0.985];
	TAGGED_RCPT(0.00)[dri-devel];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[qualcomm.com:dkim,qualcomm.com:email,gabe.freedesktop.org:rdns,gabe.freedesktop.org:helo]
X-Rspamd-Action: no action

Use freshly defined helper instead of using the raw value from the
database.

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
---
 drivers/gpu/drm/msm/msm_mdss.c | 7 ++++---
 1 file changed, 4 insertions(+), 3 deletions(-)

diff --git a/drivers/gpu/drm/msm/msm_mdss.c b/drivers/gpu/drm/msm/msm_mdss.c
index 90a4b579776a..2c2cfefe9b9a 100644
--- a/drivers/gpu/drm/msm/msm_mdss.c
+++ b/drivers/gpu/drm/msm/msm_mdss.c
@@ -169,7 +169,8 @@ static int _msm_mdss_irq_domain_add(struct msm_mdss *msm_mdss)
 static void msm_mdss_setup_ubwc_v4(struct msm_mdss *msm_mdss)
 {
 	const struct qcom_ubwc_cfg_data *data = msm_mdss->mdss_data;
-	u32 value = MDSS_UBWC_STATIC_UBWC_SWIZZLE(data->ubwc_swizzle & 0x1) |
+	u32 value = MDSS_UBWC_STATIC_UBWC_SWIZZLE(qcom_ubwc_swizzle(data) &
+						  UBWC_SWIZZLE_ENABLE_LVL1) |
 		    MDSS_UBWC_STATIC_HIGHEST_BANK_BIT(data->highest_bank_bit - 13);
 
 	value |= MDSS_UBWC_STATIC_UBWC_MIN_ACC_LEN(qcom_ubwc_min_acc_length_64b(data));
@@ -180,7 +181,7 @@ static void msm_mdss_setup_ubwc_v4(struct msm_mdss *msm_mdss)
 static void msm_mdss_setup_ubwc_v5(struct msm_mdss *msm_mdss)
 {
 	const struct qcom_ubwc_cfg_data *data = msm_mdss->mdss_data;
-	u32 value = MDSS_UBWC_STATIC_UBWC_SWIZZLE(data->ubwc_swizzle) |
+	u32 value = MDSS_UBWC_STATIC_UBWC_SWIZZLE(qcom_ubwc_swizzle(data)) |
 		    MDSS_UBWC_STATIC_HIGHEST_BANK_BIT(data->highest_bank_bit - 13);
 
 	if (qcom_ubwc_bank_spread(data))
@@ -200,7 +201,7 @@ static void msm_mdss_setup_ubwc_v5(struct msm_mdss *msm_mdss)
 static void msm_mdss_setup_ubwc_v6(struct msm_mdss *msm_mdss)
 {
 	const struct qcom_ubwc_cfg_data *data = msm_mdss->mdss_data;
-	u32 value = MDSS_UBWC_STATIC_UBWC_SWIZZLE(data->ubwc_swizzle) |
+	u32 value = MDSS_UBWC_STATIC_UBWC_SWIZZLE(qcom_ubwc_swizzle(data)) |
 		    MDSS_UBWC_STATIC_HIGHEST_BANK_BIT(data->highest_bank_bit - 13);
 	u32 prediction_mode;
 

-- 
2.47.3

