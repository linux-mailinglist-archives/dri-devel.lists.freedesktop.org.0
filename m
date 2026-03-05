Return-Path: <dri-devel-bounces@lists.freedesktop.org>
Delivered-To: lists+dri-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id DxJVJsfJqWmVFAEAu9opvQ
	(envelope-from <dri-devel-bounces@lists.freedesktop.org>)
	for <lists+dri-devel@lfdr.de>; Thu, 05 Mar 2026 19:21:59 +0100
X-Original-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 35085216F09
	for <lists+dri-devel@lfdr.de>; Thu, 05 Mar 2026 19:21:59 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 480CA10E085;
	Thu,  5 Mar 2026 18:21:56 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="TcpQIZGQ";
	dkim=pass (2048-bit key; unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="KLK2io2C";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com
 [205.220.180.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F125F10E085
 for <dri-devel@lists.freedesktop.org>; Thu,  5 Mar 2026 18:21:54 +0000 (UTC)
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 625AFoWP456076
 for <dri-devel@lists.freedesktop.org>; Thu, 5 Mar 2026 18:21:54 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:message-id
 :mime-version:subject:to; s=qcppdkim1; bh=kzn/Z5bw8Ia071qhOd3mvT
 Rpo1/fZve5V3cUsd4M82k=; b=TcpQIZGQFaSUPDl3+IedSaeMSqdcfbKVf+30Lo
 YDS4btWhTW56WlQVFcRVkRr2jzH41PcLFmpv/5ZUElydSQBCx/QQMmmbfnI1aeXh
 wN1Q34IrBgz6dEkddJVwrzzfJqxzlcepViFVjZF0l9pjkK7GdGAg4LoREpSWTjTJ
 TCj6ETZfV1SODyPQnzFL6oCkR60UgXjYQkT43ZZ82wlYug9ImdV9l44dajXAWj79
 rEOKrbKm6g9ZBr0BNnYo06Rni9eo/fQ+oWMhjF9PH7AufaTIfCqoB/JjWZtFIipR
 XWZowoG2tFkA6dhIf0/rkenbraa415sZiZGzpu/NywPdBJ7g==
Received: from mail-pl1-f197.google.com (mail-pl1-f197.google.com
 [209.85.214.197])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4cps0wmdxd-1
 (version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
 for <dri-devel@lists.freedesktop.org>; Thu, 05 Mar 2026 18:21:53 +0000 (GMT)
Received: by mail-pl1-f197.google.com with SMTP id
 d9443c01a7336-2ae47b3adacso47539275ad.3
 for <dri-devel@lists.freedesktop.org>; Thu, 05 Mar 2026 10:21:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oss.qualcomm.com; s=google; t=1772734913; x=1773339713;
 darn=lists.freedesktop.org; 
 h=cc:to:message-id:content-transfer-encoding:mime-version:subject
 :date:from:from:to:cc:subject:date:message-id:reply-to;
 bh=kzn/Z5bw8Ia071qhOd3mvTRpo1/fZve5V3cUsd4M82k=;
 b=KLK2io2CP53Tgi7bMhCJI0iO0nQ0rKNqLyxR4vkyyxt5LFbFmf4n1d7Qio6+iq5pon
 A005KdbzcH6crcfTLea+qNIMgtHzaY07LzdYbEtRaObEF7HnEg7kwwDaaSzjlaFc31qM
 Lh8HSVGo2G3H9QqWI/tUG5udhJc5f2OMQfcrHp+DC7qXwyEwA5Lfo3thkvTv/qLz3CsS
 8N4qfyc7KnFDTMx+PaPEjOkUZqzkwT4Lr+OqyCRiIdKPBANAzXa9BqNrS8pBedFzh8eV
 zratJsSd0r6h9jVUmYBgOkn7M6uQ4/W74CgG5Mxo+05YIxx9kqWGLCgigSkfTQ5/LKLD
 54DQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1772734913; x=1773339713;
 h=cc:to:message-id:content-transfer-encoding:mime-version:subject
 :date:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=kzn/Z5bw8Ia071qhOd3mvTRpo1/fZve5V3cUsd4M82k=;
 b=PgwyWXHSr3gQM/pP1vSeg7tOE0spjiaTVNVaR0oFGUiyGvL6l2dan1mRZoOnisyldu
 vMmD6SS7jWf9i4M//jKNuh2RlHL8xYxIUUmXCeWZJMCgHgWcNo6RPGJnlKZEL7N1mAWW
 Tk5YKd4liss5VquXTF2KRt5bhM98G3Blv1V/N4jELrkvMXeHEOWEItbHFpfENsWFUycS
 5WqvlbIGkT/Douo4Rdlvpd2sNTSImwoQ4i1ng8h9QxeDXI++d2WeusthUErmWNbGSPtb
 0bbHcERPYUe0yUVfWE7bjoAOjCZQRCanaIrn+IvR/MHvyx9V4spmp0wcIU7ZvQCrv01E
 nWqA==
X-Forwarded-Encrypted: i=1;
 AJvYcCUBLjLICWnCBDBfV+JYVMnsGKfdj5Tny+gzDb/kWey/3OEm1iaQ9D2a+tIHFXf7HmPpP2mTUB9WxvM=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YxWn8sBicpkC0+/ZRQ5C8ZzW7EKLkZhIDHW4RKt+hzKuWuoMrW3
 fYPipUf3Q4NvX3OJEP6sbef7iwsqt5HzQX0MX0yyMJyKK7b/5F5Qa9MKW+YRi/B5wxdPXVkeLLd
 RdgtH40Uf2Em3iuRRLnmubcdFtN/31XESOFtDAf91D6zgdrpq7gvL03jDXNiaetE3gvi0v0s=
X-Gm-Gg: ATEYQzyshdK7wKcMsgTEcnQRij4vhgXs7XXwTPTbmrOsnKyA2jUXsmVJ1MYpQcSy4aO
 H1bCKO2iVee0fNmiichDQeOylL6Ok3SxZYhrJdGXAuZzQAw33mVtuV3ArO/F0b+HwuQHb7bUwJu
 S3xf9SJjlJde1W3zlzTB9sbzyqTFeIO0Dkc4y4wKWBFPkSg3TPLra7ssHOnnW+zQkIkcZdJbL6w
 0PWM4VC2i8g/oXQdhIkbuzG/p7pCXAjcHFsn6PzHfCprmSMgNIKQiKIyaG8aJdqlqIRkKoAhpSG
 1DHbBwUS4oHxOQwB3au2AJDVUBZ4PxigNQ+jDl+HqPBc9uENvL608PBnLao4myw+1UqNxUgelt6
 VoUl1fuH7VTsX8X+JRHWvGnEwkfK2jVVab7xLQDdMEtDMiA==
X-Received: by 2002:a17:903:3846:b0:2ae:5275:4d52 with SMTP id
 d9443c01a7336-2ae80292b1amr5866365ad.53.1772734912848; 
 Thu, 05 Mar 2026 10:21:52 -0800 (PST)
X-Received: by 2002:a17:903:3846:b0:2ae:5275:4d52 with SMTP id
 d9443c01a7336-2ae80292b1amr5866075ad.53.1772734912343; 
 Thu, 05 Mar 2026 10:21:52 -0800 (PST)
Received: from hu-akhilpo-hyd.qualcomm.com ([202.46.23.25])
 by smtp.gmail.com with ESMTPSA id
 d9443c01a7336-2adfb5c183bsm238554615ad.24.2026.03.05.10.21.48
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 05 Mar 2026 10:21:51 -0800 (PST)
From: Akhil P Oommen <akhilpo@oss.qualcomm.com>
Date: Thu, 05 Mar 2026 23:51:16 +0530
Subject: [PATCH] drm/msm/a8xx: Fix ubwc config related to swizzling
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260305-a8xx-ubwc-fix-v1-1-d99b6da4c5a9@oss.qualcomm.com>
X-B4-Tracking: v=1; b=H4sIAJvJqWkC/yWMSw7CMAwFrxJ5jUUI4qNeBXXhJC54kRaStkSqe
 ncssniLedLMBoWzcIHObJB5lSLTqHA6GAgvGp+MEpXBWXe1Z3tButeKi/8GHKQi3TiSi4O3jkC
 dd2a9/71H3zjzZ9Hs3E7wVBjDlJLMnYk5YSrpqMPm9fv+A99qQGKUAAAA
X-Change-ID: 20260305-a8xx-ubwc-fix-a7eda2dfb02a
To: Rob Clark <robin.clark@oss.qualcomm.com>, Sean Paul <sean@poorly.run>,
 Konrad Dybcio <konradybcio@kernel.org>,
 Dmitry Baryshkov <lumag@kernel.org>,
 Abhinav Kumar <abhinav.kumar@linux.dev>,
 Jessica Zhang <jesszhan0024@gmail.com>,
 Marijn Suijten <marijn.suijten@somainline.org>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>
Cc: linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
 freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 Akhil P Oommen <akhilpo@oss.qualcomm.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1772734907; l=1645;
 i=akhilpo@oss.qualcomm.com; s=20240726; h=from:subject:message-id;
 bh=t10gycm7XN6yp836FuswCQpUYixNfUW82DsaMspLZuM=;
 b=wP9Gmp7/cuBD9ZtEtl7gNjgUsY4RTnj0lBI/zX7KxJHHjUHQXjxTpoQzJDaAOkHT+/9yR7DZB
 6Vru41JFGJlCg1+Pvw1LU4jkTmufP2U2zkp2gY7QkrTX0+L1Ej+9m0K
X-Developer-Key: i=akhilpo@oss.qualcomm.com; a=ed25519;
 pk=lmVtttSHmAUYFnJsQHX80IIRmYmXA4+CzpGcWOOsfKA=
X-Proofpoint-GUID: v7Fp6zsm7bVcJjLQf0XE5H_IMwUq4bdi
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzA1MDE1MSBTYWx0ZWRfX6jRm6XtCYL9K
 X5bZvNwE/r6N1zx0Qs/NMdGasqKlQm1WDiV3njWsDMoKioRQ+1fcIss99nLxrX87Lcs4ZhUzpjv
 FEtDti8Fv1V/MSEgu588ugKbq74+5gzBxsH3970M8kz6onkaoemyQHbSRnch71JsWigEeuQu7bU
 ZBUbSyA2QDjTj+oeB3P6iHEwrw8yE34LxBaQLQpTinhSzPd6ApFzs5wfmVIHFVTevAqfu8w7822
 ZLw0GGnMLc+aO9w4+MzEAb4lrPft4qyZRAk+jARYwXsb4B+UWgr8FtIf5EAP5Vbyb4Br85DkjjB
 FYQRFgNHEZdib7nSDSadtF7SGPsGyQlkB1ICUK1KMf4TyUMu72Wq2wZ8Na+6I1VVwOEMdBX5y2J
 mnMcKXIedaiFL//HAvsT7Q4HuBgYh2J1SBjvoyErB48P1NFH7NaNXXfUfCTVYFW8auieilADNs+
 E9uz7O3H+onT7GkSmWA==
X-Authority-Analysis: v=2.4 cv=OYWVzxTY c=1 sm=1 tr=0 ts=69a9c9c1 cx=c_pps
 a=cmESyDAEBpBGqyK7t0alAg==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22
 a=EUspDBNiAAAA:8 a=gtd1DNuhXpllK-bHf4IA:9 a=QEXdDO2ut3YA:10
 a=1OuFwYUASf3TG4hYMiVC:22
X-Proofpoint-ORIG-GUID: v7Fp6zsm7bVcJjLQf0XE5H_IMwUq4bdi
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-05_05,2026-03-04_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 impostorscore=0 adultscore=0 clxscore=1015 priorityscore=1501
 spamscore=0 malwarescore=0 bulkscore=0 lowpriorityscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2602130000 definitions=main-2603050151
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
X-Rspamd-Queue-Id: 35085216F09
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-1.31 / 15.00];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	MAILLIST(-0.20)[mailman];
	R_SPF_ALLOW(-0.20)[+ip4:131.252.210.177:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MIME_GOOD(-0.10)[text/plain];
	RWL_MAILSPIKE_GOOD(-0.10)[131.252.210.177:from];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:robin.clark@oss.qualcomm.com,m:sean@poorly.run,m:konradybcio@kernel.org,m:lumag@kernel.org,m:abhinav.kumar@linux.dev,m:jesszhan0024@gmail.com,m:marijn.suijten@somainline.org,m:airlied@gmail.com,m:simona@ffwll.ch,m:linux-arm-msm@vger.kernel.org,m:freedreno@lists.freedesktop.org,m:linux-kernel@vger.kernel.org,m:akhilpo@oss.qualcomm.com,s:lists@lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	FREEMAIL_TO(0.00)[oss.qualcomm.com,poorly.run,kernel.org,linux.dev,gmail.com,somainline.org,ffwll.ch];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	FORWARDED(0.00)[dri-devel@lists.freedesktop.org];
	FORGED_SENDER(0.00)[akhilpo@oss.qualcomm.com,dri-devel-bounces@lists.freedesktop.org];
	ARC_NA(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[14];
	FORGED_SENDER_FORWARDING(0.00)[];
	RCVD_COUNT_FIVE(0.00)[6];
	FROM_NEQ_ENVFROM(0.00)[akhilpo@oss.qualcomm.com,dri-devel-bounces@lists.freedesktop.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:6366, ipnet:131.252.0.0/16, country:US];
	PREVIOUSLY_DELIVERED(0.00)[dri-devel@lists.freedesktop.org];
	MID_RHS_MATCH_FROM(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[dri-devel];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	TO_DN_SOME(0.00)[]
X-Rspamd-Action: no action

To disable l2/l3 swizzling in A8x, set the respective bits in both
GRAS_NC_MODE_CNTL and RB_CCU_NC_MODE_CNTL registers. This is required
for Glymur where it is recommended to keep l2/l3 swizzling disabled.

Fixes: 288a93200892 ("drm/msm/adreno: Introduce A8x GPU Support")
Signed-off-by: Akhil P Oommen <akhilpo@oss.qualcomm.com>
---
 drivers/gpu/drm/msm/adreno/a8xx_gpu.c | 14 ++++++++++++--
 1 file changed, 12 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/msm/adreno/a8xx_gpu.c b/drivers/gpu/drm/msm/adreno/a8xx_gpu.c
index 5a320f5bde41..b1887e0cf698 100644
--- a/drivers/gpu/drm/msm/adreno/a8xx_gpu.c
+++ b/drivers/gpu/drm/msm/adreno/a8xx_gpu.c
@@ -310,11 +310,21 @@ static void a8xx_set_ubwc_config(struct msm_gpu *gpu)
 	hbb = cfg->highest_bank_bit - 13;
 	hbb_hi = hbb >> 2;
 	hbb_lo = hbb & 3;
-	a8xx_write_pipe(gpu, PIPE_BV, REG_A8XX_GRAS_NC_MODE_CNTL, hbb << 5);
-	a8xx_write_pipe(gpu, PIPE_BR, REG_A8XX_GRAS_NC_MODE_CNTL, hbb << 5);
+
+	a8xx_write_pipe(gpu, PIPE_BV, REG_A8XX_GRAS_NC_MODE_CNTL,
+			hbb << 5 |
+			level3_swizzling_dis << 4 |
+			level2_swizzling_dis << 3);
+
+	a8xx_write_pipe(gpu, PIPE_BR, REG_A8XX_GRAS_NC_MODE_CNTL,
+			hbb << 5 |
+			level3_swizzling_dis << 4 |
+			level2_swizzling_dis << 3);
 
 	a8xx_write_pipe(gpu, PIPE_BR, REG_A8XX_RB_CCU_NC_MODE_CNTL,
 			yuvnotcomptofc << 6 |
+			level3_swizzling_dis << 5 |
+			level2_swizzling_dis << 4 |
 			hbb_hi << 3 |
 			hbb_lo << 1);
 

---
base-commit: ac47870fd795549f03d57e0879fc730c79119f4b
change-id: 20260305-a8xx-ubwc-fix-a7eda2dfb02a

Best regards,
-- 
Akhil P Oommen <akhilpo@oss.qualcomm.com>

