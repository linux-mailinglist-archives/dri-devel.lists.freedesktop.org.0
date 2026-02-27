Return-Path: <dri-devel-bounces@lists.freedesktop.org>
Delivered-To: lists+dri-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id QNIBKEnkoWm+wwQAu9opvQ
	(envelope-from <dri-devel-bounces@lists.freedesktop.org>)
	for <lists+dri-devel@lfdr.de>; Fri, 27 Feb 2026 19:36:57 +0100
X-Original-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 32BBB1BC0C6
	for <lists+dri-devel@lfdr.de>; Fri, 27 Feb 2026 19:36:57 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D9CF110EBE2;
	Fri, 27 Feb 2026 18:36:53 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="glUMHt0k";
	dkim=pass (2048-bit key; unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="VAqAE4A1";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com
 [205.220.168.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2CE6E10EBE2
 for <dri-devel@lists.freedesktop.org>; Fri, 27 Feb 2026 18:36:52 +0000 (UTC)
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 61RH0JLT3495752
 for <dri-devel@lists.freedesktop.org>; Fri, 27 Feb 2026 18:36:51 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 KGJMLgt7ilTd+P7ELHPD6A2rgqs3i38pd9WfoMUHTow=; b=glUMHt0kD+/cBU0j
 L6M5kNoBLeNadKa1sU+oFK9gHlfuwXbbVzD3A3do0gNWCCz7DhFzsWnB9QhV7C2x
 10AfS96BASSuk3CWVeNPB1G4N13hcc1wdbS/ENelNtpbFTB4S56EnY9a+dN6sXRa
 7KBmj9s3j4YEr5tbetahfTvbiZyLBu8uhHwh/M3lIt8Q2Mf99/6WaZ/nG7dFb7HC
 rskZ6/vLgqPI0wWMQ2v5gQ91gMJ8blqVB8yvbG4O19q95PqDgElTQJMQKZ4NIRrg
 3r66su0ZRx6nrdPhtsZf0HyvtPZgJfb79u/mDwQmh0ILvLjxotX9Qqdey7AaX1lB
 kULUpQ==
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com
 [209.85.222.197])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4cjt99vu9r-1
 (version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
 for <dri-devel@lists.freedesktop.org>; Fri, 27 Feb 2026 18:36:51 +0000 (GMT)
Received: by mail-qk1-f197.google.com with SMTP id
 af79cd13be357-8cb3a129cd2so2374740685a.0
 for <dri-devel@lists.freedesktop.org>; Fri, 27 Feb 2026 10:36:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oss.qualcomm.com; s=google; t=1772217411; x=1772822211;
 darn=lists.freedesktop.org; 
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:from:to:cc:subject:date:message-id
 :reply-to; bh=KGJMLgt7ilTd+P7ELHPD6A2rgqs3i38pd9WfoMUHTow=;
 b=VAqAE4A1aX4wQc2fvG9NMNyJ6yUQ25hcnSxBd10Sp09BSPzvhxh5ZfBCRVfWhXo38S
 bGyjz1DGcwYkos8oGLBcCP/2Ui+OoyYa1il2TlQFZ49JrDFGSC7s/4Odlp4D7MDSu2Tb
 igZfC07sn0ghI1S5It2/HZ8NzTgccTR8f7z4j4CdGLNvFu5zNNO7ZkSS5WMoNQ5Z2TU2
 pxOYr3WsFgLOwjyhxoX1X5NoyJ8ypjSAOskjdg5DGOMp10Fet3JnzDx98CX2M3GsjF1b
 ibks8TcdJtWtxeGRcyRy0UIUtGI7acCgmKS+czGGzEL2vTRIXUOInJZGgUk+14+ZrKaA
 sRoQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1772217411; x=1772822211;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
 :cc:subject:date:message-id:reply-to;
 bh=KGJMLgt7ilTd+P7ELHPD6A2rgqs3i38pd9WfoMUHTow=;
 b=BGvZ0gQtW7GCyPmsgjpvc7LtMV3zs69+mVbHh7W/l5tLqb+fnFSC8DeyoJlOlPNDJZ
 SPmAspOVp66ptRmpOgDN62JQpvoJ9wQlyYUOWDjsmfynUOLzCI+mf2SrN7r3SsXXN8L7
 fcqAcRmKK0ppCnJ1uoeFPudxKz8mNk8RXocZWrVN+FGsQnZbiudhoCCTwlGEVRalDnRs
 nEw4/a8djPFI+3h250+w9rjbAvO1ykUXuWuzDiHijQYgRpOo7/oLAzAW3E+lKyWdGJAh
 0OdAq+1xSMWyOMZZGWtFpftP4CmsDQKrnUuEiW7z6FuRAPqArDSpWakJ1ulQrz9FnPl0
 4gIQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCWdd2/H1N2AMcv6wvRVYhP9Ak/Zo2hN4uoaLeuqIFBHry93A/+ihLR2cSKaBtz2RHjgQ53IdP2S6Tg=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yxnct0Y3NaNDk0KbQ0kMlpk22zLuFtcSyuzqTboAaZkI0CMDWfR
 FuAHvRhzPZZlC17GIEoeFvELZF3EBo+Kr5neSe0FNK30JWg8Q7nIkqHst+if6JETmrxB+SysWDz
 ULpr7SQmIb0zhaVcV9UzQ5begrwXyHQYJr84PqveFoEV3lTqFHHs9QHTbWOp3WR5WJXHLeAY=
X-Gm-Gg: ATEYQzwh4cEcTwHm4ZC8388EUHnNfDQIceoGMPELm2NJjP/Ae9g4rFx+jvu9upCZmkg
 HL8deHPJa90v6h7G7zNxp2vtXytu5lzexGu0BW2Q8/5SIae7JV2cx2kim0XV7X4zM5vGBPsrJ4Y
 KvIrg7PLxOM7zF1AnUMx/dgNRZNofBQYP7wBFvy9zSqul2EbPiEuYlJRA/wPr8wx2I1devMq0QY
 GmE78gUBqJQGKUyxyJAVl1wVZOZdJ7eh/QOTv262B23n2GJdFc2sgAf+VPBilVZUoWgAvd9xOxJ
 qvPPyYFA3n8LrJnieMKI20Gy0r/R3LYEi1PueeCiML+mTuIXIfKjVdUK683hv0UR6lNPT4EM351
 K5JkVQ6V1mgMimdYAO4bl5WL3JKOiBG2HQ/d4UXwMLVMBXDax0Hh9bjlqXsgO4MWBaHRVDKlcjb
 9vBJKUg/JpTJYvzXVWLax/2bFlSkKEQCpUGUM=
X-Received: by 2002:a05:620a:25cc:b0:8c7:79d:f91b with SMTP id
 af79cd13be357-8cbbf3527d4mr897662485a.6.1772217410534; 
 Fri, 27 Feb 2026 10:36:50 -0800 (PST)
X-Received: by 2002:a05:620a:25cc:b0:8c7:79d:f91b with SMTP id
 af79cd13be357-8cbbf3527d4mr897659485a.6.1772217410096; 
 Fri, 27 Feb 2026 10:36:50 -0800 (PST)
Received: from umbar.lan
 (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi.
 [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
 by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-5a115bca0e6sm117082e87.29.2026.02.27.10.36.49
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 27 Feb 2026 10:36:49 -0800 (PST)
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Date: Fri, 27 Feb 2026 20:36:40 +0200
Subject: [PATCH 1/7] drm/msm/dpu: drop VBIF_NRT handling
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260227-drop-vbif-nrt-v1-1-2b97d0438182@oss.qualcomm.com>
References: <20260227-drop-vbif-nrt-v1-0-2b97d0438182@oss.qualcomm.com>
In-Reply-To: <20260227-drop-vbif-nrt-v1-0-2b97d0438182@oss.qualcomm.com>
To: Rob Clark <robin.clark@oss.qualcomm.com>,
 Dmitry Baryshkov <lumag@kernel.org>,
 Abhinav Kumar <abhinav.kumar@linux.dev>,
 Jessica Zhang <jesszhan0024@gmail.com>, Sean Paul <sean@poorly.run>,
 Marijn Suijten <marijn.suijten@somainline.org>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>
Cc: linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
 freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=openpgp-sha256; l=2654;
 i=dmitry.baryshkov@oss.qualcomm.com; h=from:subject:message-id;
 bh=MnKwn4c8r7VoVfNPJZe9fCXyDmkqEkobHa7wzCeEoMg=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBpoeQ9O8t/pet96OPdRmkeW2M1nsgKUF8BZQaIy
 7wH4sk3MeiJATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCaaHkPQAKCRCLPIo+Aiko
 1WVNB/wPuWJbRQaFjbKoUYgouaJh+77RW6B49NPjzsfRGMyMwuGGomiKiB7jhO6ELJXNmodaC7c
 0shroZMSYTNwuRfQPqaZJ2ZG4zwx9cA4NgmsubFMiOdnBNiOVggi2aGuBzBmf5XmFSX9RWF4/I4
 CblybVJzv+5+4IGY3xWyuYZ7DVwMbRk8pc3mIAUT+3l2EFX57tFP38leFWrBCeTjie5+Awnv115
 bwwtxYRM3XWzqxSDSEM7sFgRR6MGgbhEYRCB2U9X8REYd8ybMcMPVmtvJ8+2ZgrrWAn20IluM1+
 6UkxVg7osSYPXdvCYg9lI6VEt1lIiKdWO9plBYoq7/wN3c6+
X-Developer-Key: i=dmitry.baryshkov@oss.qualcomm.com; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A
X-Authority-Analysis: v=2.4 cv=IZWKmGqa c=1 sm=1 tr=0 ts=69a1e443 cx=c_pps
 a=50t2pK5VMbmlHzFWWp8p/g==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=HzLeVaNsDn8A:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22 a=EUspDBNiAAAA:8
 a=ygBLsu7f3sOcc8VWtk4A:9 a=QEXdDO2ut3YA:10 a=IoWCM6iH3mJn3m4BftBB:22
X-Proofpoint-GUID: O8o_6D_gHKWYY8WODn6Sn7t5F6HvUoXF
X-Proofpoint-ORIG-GUID: O8o_6D_gHKWYY8WODn6Sn7t5F6HvUoXF
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMjI3MDE2NCBTYWx0ZWRfX54gi2SNeSwMl
 Xy+dQCv5hsgKUy/WZaEdPWl2HGwYI0ZGATajgpNO1Ev502x7RsfgxzvIuRmy99WC7qcnWLYf5ve
 igh3YMkg9z7x4vnLm+jgXPW+UCZWDSlk6y57AyWUSCKWHN4YpVVQSVtjI/krKXfUg6bmRc9XbhA
 gjKs6X7vQYmAFiq43nhdHNWQ8wRy5RHYC9VIsK0X8cHImEU9k13+HkmLg6+wsgeE6TSAOGMo9RP
 Jmaw23p+2s9auJV1T1+N+GATp0D8jjPNw2+ZGdv5Q4E0OKLfDkUOWpmZirBGMjTpOdnlL6IzFuQ
 K4RLHlHe+2LD4LvEbt8H+T79eci9NO3CsyVsIZwW7i668t4dw1qPNh0qKGtHulFK1ZUCYYvCNAR
 FdAKYpYTY5SLz1u3A6U+uOV9dvySh4Ff4v2nSpTCI6Jt/nyh4WkURuG1+v+MlEsPKF4Z4iqntFF
 pBx7pnVkK+a9ncguBNw==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-02-27_03,2026-02-27_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 impostorscore=0 clxscore=1015 adultscore=0 lowpriorityscore=0
 priorityscore=1501 suspectscore=0 malwarescore=0 spamscore=0 phishscore=0
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
	FORGED_RECIPIENTS(0.00)[m:robin.clark@oss.qualcomm.com,m:lumag@kernel.org,m:abhinav.kumar@linux.dev,m:jesszhan0024@gmail.com,m:sean@poorly.run,m:marijn.suijten@somainline.org,m:airlied@gmail.com,m:simona@ffwll.ch,m:linux-arm-msm@vger.kernel.org,m:freedreno@lists.freedesktop.org,m:linux-kernel@vger.kernel.org,m:konrad.dybcio@oss.qualcomm.com,s:lists@lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FREEMAIL_TO(0.00)[oss.qualcomm.com,kernel.org,linux.dev,gmail.com,poorly.run,somainline.org,ffwll.ch];
	FORGED_SENDER_MAILLIST(0.00)[];
	ARC_NA(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[13];
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
X-Rspamd-Queue-Id: 32BBB1BC0C6
X-Rspamd-Action: no action

The second VBIF instance, VBIF_NRT, is only used for the separate inline
rotator block. It is unsupported by the DPU driver and will require a
separate driver (or separate instance of the DPU device).

The only possible user of VBIF_NRT is writeback on MSM8996, however
writeback on that platform is currently unsupported and it's not worth
keeping extra complexity for the sake of that single legacy platform.

None of the hardware catalogs entries actually declare VBIF_NRT, so it
is left in its default state.

Stop pretending that DPU driver cares about VBIF_NRT and drop it.

Reported-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
---
 drivers/gpu/drm/msm/disp/dpu1/dpu_hw_mdss.h |  1 -
 drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c     | 14 --------------
 drivers/gpu/drm/msm/disp/dpu1/dpu_vbif.c    |  2 --
 3 files changed, 17 deletions(-)

diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_mdss.h b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_mdss.h
index 046b683d4c66..f3cb827034cc 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_mdss.h
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_mdss.h
@@ -286,7 +286,6 @@ enum dpu_wd_timer {
 
 enum dpu_vbif {
 	VBIF_RT,
-	VBIF_NRT,
 	VBIF_MAX,
 };
 
diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c
index 61d7e65469b3..16f129625795 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c
@@ -1357,14 +1357,6 @@ static int dpu_kms_mmap_mdp5(struct dpu_kms *dpu_kms)
 		return ret;
 	}
 
-	dpu_kms->vbif[VBIF_NRT] = msm_ioremap_mdss(mdss_dev,
-						   dpu_kms->pdev,
-						   "vbif_nrt_phys");
-	if (IS_ERR(dpu_kms->vbif[VBIF_NRT])) {
-		dpu_kms->vbif[VBIF_NRT] = NULL;
-		DPU_DEBUG("VBIF NRT is not defined");
-	}
-
 	return 0;
 }
 
@@ -1390,12 +1382,6 @@ static int dpu_kms_mmap_dpu(struct dpu_kms *dpu_kms)
 		return ret;
 	}
 
-	dpu_kms->vbif[VBIF_NRT] = msm_ioremap_quiet(pdev, "vbif_nrt");
-	if (IS_ERR(dpu_kms->vbif[VBIF_NRT])) {
-		dpu_kms->vbif[VBIF_NRT] = NULL;
-		DPU_DEBUG("VBIF NRT is not defined");
-	}
-
 	return 0;
 }
 
diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_vbif.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_vbif.c
index 2a551e455aa3..ede38b3c6f8c 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_vbif.c
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_vbif.c
@@ -24,8 +24,6 @@ static const char *dpu_vbif_name(enum dpu_vbif idx)
 	switch (idx) {
 	case VBIF_RT:
 		return "VBIF_RT";
-	case VBIF_NRT:
-		return "VBIF_NRT";
 	default:
 		return "??";
 	}

-- 
2.47.3

