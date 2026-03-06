Return-Path: <dri-devel-bounces@lists.freedesktop.org>
Delivered-To: lists+dri-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 6Bj+HikFq2nDZQEAu9opvQ
	(envelope-from <dri-devel-bounces@lists.freedesktop.org>)
	for <lists+dri-devel@lfdr.de>; Fri, 06 Mar 2026 17:47:37 +0100
X-Original-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 2E4FD2255CD
	for <lists+dri-devel@lfdr.de>; Fri, 06 Mar 2026 17:47:37 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7E23310EDEB;
	Fri,  6 Mar 2026 16:47:35 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="YT1MJ58+";
	dkim=pass (2048-bit key; unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="ZgOOFDOR";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com
 [205.220.180.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CC8FE10EDDE
 for <dri-devel@lists.freedesktop.org>; Fri,  6 Mar 2026 16:47:29 +0000 (UTC)
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 626Fqum51424174
 for <dri-devel@lists.freedesktop.org>; Fri, 6 Mar 2026 16:47:29 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 2imLQEZ3DP0uNNL0l/EieMjW7GOO6W8UDPQGg+15sw8=; b=YT1MJ58+zS/vxieL
 iQToHMG6NFJ7+kvIo5dasQKgmMzRg//1iAV+FAm+/iMgLQKJ1Uk909c/QKTzH9sN
 JhkDTO1nxVAx23B5XgGqSDvzYQZvzSZGfQ/y312ohYTjtOy654y4ww3zxaDRbhVq
 LQvLJDVeRfSnjT9OY/57cnGjdU+ZCu4tqltF0jLho9PFBzkc756zElueWOLoTmfi
 Rr73VKW5qY3qyiWOBr2CvEPMWAKhVXkb9HqgSa8moUloE589Egwpk7phuCsYomk/
 JxnUF96Of8zvS05q5ePWpVCE/3YsKURQktRR8MyTolcn/vSfZzJThJXzWIoBw2pH
 EO3LXw==
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com
 [209.85.222.197])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4cqrf5t7wp-1
 (version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
 for <dri-devel@lists.freedesktop.org>; Fri, 06 Mar 2026 16:47:28 +0000 (GMT)
Received: by mail-qk1-f197.google.com with SMTP id
 af79cd13be357-8cb42f56c4aso5399448385a.3
 for <dri-devel@lists.freedesktop.org>; Fri, 06 Mar 2026 08:47:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oss.qualcomm.com; s=google; t=1772815648; x=1773420448;
 darn=lists.freedesktop.org; 
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:from:to:cc:subject:date:message-id
 :reply-to; bh=2imLQEZ3DP0uNNL0l/EieMjW7GOO6W8UDPQGg+15sw8=;
 b=ZgOOFDORUG8Go/QYpSIWsYzpyl3G9V9qakCKD/0rhFo113LghTqgOIYuWYL+JOS3qz
 tb8rfc+6QsDaO3Bd6JjVshAzs9Q6BXbZNIiLV0mvvraEqCuIaKaxbcpwdXbaVrjr78Li
 JWJMGZ6+efQYifFfmO83Eu/uTMp/pFp/sqYhFtTPLkMSxb+rLW9Il8oGOmaRu5jEro/w
 +L4uj2kLgFhyqI6Lu/m4xH+/26XbjA+AaUNSwvHCF4TLPtlXKl+Wo61T7h8TPqjGpejI
 MCDqtXc5iSs+OEUZjaZunxCZIUVwos0J719ZfwtoYLdRoCjV6yeUN30NkiaMTMvSVo99
 voCA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1772815648; x=1773420448;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
 :cc:subject:date:message-id:reply-to;
 bh=2imLQEZ3DP0uNNL0l/EieMjW7GOO6W8UDPQGg+15sw8=;
 b=wHtTufsgeuBx/7iZ5KVcmmk9Or505TTIYxLVl7BArh7juW+f57ASVWO2hCclWn08HO
 eeza0dSHkQOYn7zhs0aZYkYxAJhciKELD//vEAOxHrudBiEu4i7s7S8JSz/+JcCiXDgi
 oKwx1IYssbaKjnjoP4Wx4FfhWnx/gtYfzal5L7LOVCju9IImiPq+Mr7TqOodoxsVB9Es
 r5KdI98kHkXgvupbFqYV+QCpNd2hVdxOOFULHiib4hPpvXtUY63jLvnF9cwBjvzJz6Ze
 U7Wj290VzutXyJtc3Qi/AMoitMA31o3OzcNP0b/NITYtv9NNdyf2+gzrijKOk4eIgVNq
 4oUw==
X-Forwarded-Encrypted: i=1;
 AJvYcCXKlh0yIKtj1TWm98xhxrMLZtBZEeC5dMSBNaeTcIPvpMXvPTF6ZaqbCx1GGSQrO5ooDbJQHRGVc7Q=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YyxWnVzHx8U8bshAwU58107eAvmfZij1Y2/4qTQsV/8a5o6Y6jN
 f6WhUEMHwu9IATKdfiirsRUuUquCUhiu929qPTOf335t8UfD6E6T+bLEVQgEeQhjo89EjWaQWct
 UwPgEpxundzbjpmHUKO1jSvSK0uzRkNGin1PJOWjxdxr9k5zPWRhSnS3JxDuYiAfJVxtuwB0=
X-Gm-Gg: ATEYQzzcYcMhyvuAjKXlvTr5aYRoJz7DEDzvAzXuyg6fq/0Pl6bRP5uEiC0d9ZBCx9z
 Dk4W6tMLO+nb1ktrtXasMhFEcI8OASbFtbt8tq74qr8JHonpyED5og26H3fYj8w0Qk3Ife+X1Xw
 E7evVgfjGEP1DoMEA1QdKtp+B72cX5IyTb4holWAemg/kYisLPhZspm6pENnIpHytpAnYd9iX86
 VaYdbv12CtcE7c/7goojBjFJvBp0RLdAJlrz2vhf0T5So4Z16tyaikYoffxmomFfdGMFWp1j07w
 quEDMpUTZBxronQkaES4h0pqYG6TJMkDC5rK8NIxsaxZlNvA8bPt2f2LAqM0G5E7q2clzxNM0Tx
 KaIkxwBLyWaQ27DRxEiYaLU5YHKvSfV2SbangVlVgM4uHLLzvcw7lpOevoMrDaB3YrtbfGcFGKT
 ELCENgbPGE6ejPW++z6Z/X53/kQb4fiTU6QWA=
X-Received: by 2002:a05:620a:1a9b:b0:8cb:4c23:3de2 with SMTP id
 af79cd13be357-8cd6d4fc41amr337641785a.76.1772815648298; 
 Fri, 06 Mar 2026 08:47:28 -0800 (PST)
X-Received: by 2002:a05:620a:1a9b:b0:8cb:4c23:3de2 with SMTP id
 af79cd13be357-8cd6d4fc41amr337638085a.76.1772815647750; 
 Fri, 06 Mar 2026 08:47:27 -0800 (PST)
Received: from umbar.lan
 (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi.
 [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
 by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-5a13eaebd0asm213804e87.51.2026.03.06.08.47.26
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 06 Mar 2026 08:47:26 -0800 (PST)
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Date: Fri, 06 Mar 2026 18:47:14 +0200
Subject: [PATCH 08/24] drm/msm/adreno: use new helper to set macrotile_mode
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260306-ubwc-rework-v1-8-9cfdff12f2bb@oss.qualcomm.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=1533;
 i=dmitry.baryshkov@oss.qualcomm.com; h=from:subject:message-id;
 bh=2pmZHdByL6nsS8Ik/InzKdBxSCO/78Oop/N0tOJ6bIw=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBpqwUN3jF8qXyArrCcHGzumnoU/rLkRvcjzIeeW
 u3qt/YDcJKJATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCaasFDQAKCRCLPIo+Aiko
 1Y7oB/kBzsVGYGRPO8u6SXF9W5IddIs+b2Kkr6+hZ2mQBAry76g7CM7RK16IvDydZ5Oz0QWS2co
 F4m6FvQpl9umm6E5jdlKnyWijC6NERW46twWfyKw5Za7W14lI/dvgJEtUJzni/tVTfoBAFj79lb
 0/tbqV9/co5GDj9wmVKJXOPOPgezW7ZqPWsAC84yIfifeoXnm2s6MtO1iCIK62ai2Fhbo0oeeke
 rwJz2JaxIe5xch9IztaFL7uo6SXBkoHQcqiDol+v9AThjfxel1nZcoqUos+8nuV3CU1IRRETm1M
 OSy0rXgqC6Kn5y6PfOuSaswu34+aYvBWPDJam3SpRRs8yslg
X-Developer-Key: i=dmitry.baryshkov@oss.qualcomm.com; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A
X-Proofpoint-ORIG-GUID: xh0TMtFMPed_bkg-6enC2AoMWku6FiZP
X-Proofpoint-GUID: xh0TMtFMPed_bkg-6enC2AoMWku6FiZP
X-Authority-Analysis: v=2.4 cv=L+oQguT8 c=1 sm=1 tr=0 ts=69ab0520 cx=c_pps
 a=50t2pK5VMbmlHzFWWp8p/g==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22 a=EUspDBNiAAAA:8
 a=8BxV0iZMnHvn5dZpj2MA:9 a=QEXdDO2ut3YA:10 a=IoWCM6iH3mJn3m4BftBB:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzA2MDE1OSBTYWx0ZWRfX0lucLyHykNEk
 eN39r7KAj8DGj3IyZPxet1g6nKCx0XDCiVhjOCRjsH7S9SxpglYzrzI/5HlkVdjy82BExIPBZhJ
 5HJJpDwdgODJowqCZg1fBB0ORZiHM7HW3j4z4tk4djvVAeVJJZOE1g3pX4S0RY1MHDSd/x6gKlJ
 2KGgfa7szdNgTPYD7TpQv1J2OOsyEobbfOP79A4mNAGbulaDySZiaVSVB9eW9G+HlkuwqlhZ1ah
 eFCF96eQOFx7J679oCJ1TcLyszcoVZ7w+BRl56l5VtEF7TX2JgY0WpmGrb1PKORBvBeFtuZmfIK
 iB3YVXQzTwtqBWkYDXKiuHJ6pVWDY5afEL9RMm6x1jRTEckiwjKeK8ZTbL4FEvq2TGbOtwIgCtA
 rypDUt8ZjVAIinCvmk252CBwHssFfIq3zRR96uIKXBkq/W8SfxgjRmoiPmi4SxO7yMLITfrzi+c
 aMOqBZw721/SXspP0mg==
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
X-Rspamd-Queue-Id: 2E4FD2255CD
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
	NEURAL_HAM(-0.00)[-0.983];
	TAGGED_RCPT(0.00)[dri-devel];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[gabe.freedesktop.org:rdns,gabe.freedesktop.org:helo,qualcomm.com:dkim,qualcomm.com:email]
X-Rspamd-Action: no action

Use freshly defined helper instead of using the raw value from the
database.

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
---
 drivers/gpu/drm/msm/adreno/a6xx_gpu.c   | 2 +-
 drivers/gpu/drm/msm/adreno/adreno_gpu.c | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/msm/adreno/a6xx_gpu.c b/drivers/gpu/drm/msm/adreno/a6xx_gpu.c
index 2027e479d5b1..56a820ffa613 100644
--- a/drivers/gpu/drm/msm/adreno/a6xx_gpu.c
+++ b/drivers/gpu/drm/msm/adreno/a6xx_gpu.c
@@ -787,7 +787,7 @@ static void a6xx_set_ubwc_config(struct msm_gpu *gpu)
 		  min_acc_len_64b << 23 | hbb_lo << 21);
 
 	gpu_write(gpu, REG_A6XX_RBBM_NC_MODE_CNTL,
-		  cfg->macrotile_mode);
+		  qcom_ubwc_macrotile_mode(cfg));
 }
 
 static void a7xx_patch_pwrup_reglist(struct msm_gpu *gpu)
diff --git a/drivers/gpu/drm/msm/adreno/adreno_gpu.c b/drivers/gpu/drm/msm/adreno/adreno_gpu.c
index d5fe6f6f0dec..4814233d8dba 100644
--- a/drivers/gpu/drm/msm/adreno/adreno_gpu.c
+++ b/drivers/gpu/drm/msm/adreno/adreno_gpu.c
@@ -435,7 +435,7 @@ int adreno_get_param(struct msm_gpu *gpu, struct msm_context *ctx,
 		*value = adreno_gpu->ubwc_config->ubwc_swizzle;
 		return 0;
 	case MSM_PARAM_MACROTILE_MODE:
-		*value = adreno_gpu->ubwc_config->macrotile_mode;
+		*value = qcom_ubwc_macrotile_mode(adreno_gpu->ubwc_config);
 		return 0;
 	case MSM_PARAM_UCHE_TRAP_BASE:
 		*value = adreno_gpu->uche_trap_base;

-- 
2.47.3

