Return-Path: <dri-devel-bounces@lists.freedesktop.org>
Delivered-To: lists+dri-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id EMBID1TkoWmUwwQAu9opvQ
	(envelope-from <dri-devel-bounces@lists.freedesktop.org>)
	for <lists+dri-devel@lfdr.de>; Fri, 27 Feb 2026 19:37:08 +0100
X-Original-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C3AE01BC118
	for <lists+dri-devel@lfdr.de>; Fri, 27 Feb 2026 19:37:07 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6B9E610EBEF;
	Fri, 27 Feb 2026 18:37:05 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="Dmjd9Nrm";
	dkim=pass (2048-bit key; unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="g+yVWebc";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com
 [205.220.168.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1878D10EBED
 for <dri-devel@lists.freedesktop.org>; Fri, 27 Feb 2026 18:37:02 +0000 (UTC)
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 61RH0EUH3495692
 for <dri-devel@lists.freedesktop.org>; Fri, 27 Feb 2026 18:37:01 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 bC4OwYK0WXchZ0n/YT8oYdnIO5WKpNPqkJXXEobBytw=; b=Dmjd9NrmHF4Su2Ph
 v/3T3MfHPFOg0z7JIMI0qbgIaLTuwcgQ1kQE0T0UwK32lQBUgDe6m4/edXT8DDuE
 By4zbyV4TI91t5PfqfkO5ujcppSvxbxChTiysgubFUBbR+Rw4Fj/Sk4oMVEiYp7w
 2p3YwJRr5/KbYfuaVKHTxosjjThCcF1B2ullHJPh/2n7TphX1jTWF1oYlEC4SUW2
 mK7fiqPmF1Avztk/IlRU24x6Ob+WUU7jY1MJ/Vw6y/hAtbWzWYxug1SpyxV4IhqH
 PRJgrQPUi8pS7EePXmqXMATTQrbvFi1gwPL9fNKFPCwiaAF41kwuJP4VNJBCJPjQ
 bHSO8A==
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com
 [209.85.222.198])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4cjt99vuap-1
 (version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
 for <dri-devel@lists.freedesktop.org>; Fri, 27 Feb 2026 18:37:01 +0000 (GMT)
Received: by mail-qk1-f198.google.com with SMTP id
 af79cd13be357-8cb4817f3c8so1630504785a.3
 for <dri-devel@lists.freedesktop.org>; Fri, 27 Feb 2026 10:37:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oss.qualcomm.com; s=google; t=1772217420; x=1772822220;
 darn=lists.freedesktop.org; 
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:from:to:cc:subject:date:message-id
 :reply-to; bh=bC4OwYK0WXchZ0n/YT8oYdnIO5WKpNPqkJXXEobBytw=;
 b=g+yVWebcujNr4oVoWe0EsUUPXcACYKgmxZwmWHBrpYW7alM2a0VG4pWHvk1vLIXgkz
 dMTrAD025FMb8rWRZnEVxQnOpdrimuIIjoqqEEtmuH+4UNfcGDOmBe5hCJkvUwdvSW4Q
 fL1Q0sdkjgeulbPZaEu68xQgpouj0lOSij/vSMio2cS1BMg8Akta7XVDdjNR32nK07Jb
 53xJWlur3LZ3PBmTGoEOz+PhFZPdHdSMNsy8H0p3tvCe9e7QmVJrxrqTW67sLrC7Yk5a
 Z8oJdjyhxpS3/bfqvUoriNtOGA70t+nahXknZQy+9cKlb4x0jHwPqq50nVLFI/hdi1lD
 8VIw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1772217420; x=1772822220;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
 :cc:subject:date:message-id:reply-to;
 bh=bC4OwYK0WXchZ0n/YT8oYdnIO5WKpNPqkJXXEobBytw=;
 b=AtfEkhSBxEDC1k8qa7zMAbSAIdIu6JHdZ8gUH2kJBsbMAbGkpuqQ5ih5QPf4jDnl/N
 9qqEyrqAA7BAXLRXDlqVOqslywycEB6hxoaZIxc8tUhB5jXDWShyBiJ+43HIyDgHqsUx
 O4E+otUoL/qmL0CoeozbYpOJucb+GXNj00/DFgnXDTdRLw73+tfapvyoii3P4JgByuCh
 EWYJiDizWOy0NDoM06jkm5xvKtuj+cUlilnY8vdQqA9CKTWuALN2ZWFmq0QO11BnO0PA
 ztehftzuHXVEhMAjG9GY2DNauJzIBNGteNKjvXBU4GVV7zWIyqOI0ULzBdsWy+MF8Qo6
 Gb8g==
X-Forwarded-Encrypted: i=1;
 AJvYcCUNjYplrUd58l4/3y78GY92E3URuMLUw5jr+KHql7zaK7pNVImT99L1R4/YTBlA0W92la+rXFQS8Kc=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yy1M6SKHKyi727q/B9osWWMxAKokMjmY18KMs/nmIF5VEAKIIq5
 UV4z+egvXHMGVGaPl8VZD01pKd7aDCbJSPTqDiiJlgxSVJQXaNTLpIdV6knaCeKl6twHieW50QV
 UKmNq1hEv2p6dY9X0an6bDv/6Zgrl4hitNJSXoRUOeK68pmQvAPtbEIR38LsvZdDoTHdqLaY=
X-Gm-Gg: ATEYQzw5phFqOEtJO6SQDPphmwjtnCyc8DRfDUaqpBV3xAeJ86kj678j3zpmJ3q/8yK
 jNEWrU5Nvp1p/cRn9Lr8VHy/FJDwXYuRmAu2hqUak6gKsv/uOuB4CsbYB5PInuIy9MAgaLAoYJQ
 HeDq3RFpSLso6nbVvj8MPdH7lrZj5TtNRIsAWJQwf2vqmwB0RC+3gaRYjBsyG/8G/Qcj9xJC5tl
 Ny7ubIRfszht3a2auQnpu7F5xxprRg2u6YdoDnkoLSXm1x2R83/igpE2TEzAfLh2Hx/LBYfluYB
 RQnGWrZh63vf8VK0PpBGI4wOe3ADmcGND9kOMAV+nRRULJ7HceODsOPN6MxVo5m4LoC3zsCCLer
 CwwrJeMVzTv16G4idgexz+rRIIq2GxxkkRgtF7MxF2KWVjbA/IaUeCZILaVFJR+Tptg5wCzquFG
 c8AGDgXbL0chaAXoupMOnhOSA3VYPFlPjNaQg=
X-Received: by 2002:a05:620a:4626:b0:8b2:e1d7:ca6a with SMTP id
 af79cd13be357-8cbc8e3750cmr509210285a.75.1772217420359; 
 Fri, 27 Feb 2026 10:37:00 -0800 (PST)
X-Received: by 2002:a05:620a:4626:b0:8b2:e1d7:ca6a with SMTP id
 af79cd13be357-8cbc8e3750cmr509204385a.75.1772217419726; 
 Fri, 27 Feb 2026 10:36:59 -0800 (PST)
Received: from umbar.lan
 (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi.
 [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
 by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-5a115bca0e6sm117082e87.29.2026.02.27.10.36.58
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 27 Feb 2026 10:36:59 -0800 (PST)
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Date: Fri, 27 Feb 2026 20:36:45 +0200
Subject: [PATCH 6/7] drm/msm/dpu: drop VBIF index from the VBIF params
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260227-drop-vbif-nrt-v1-6-2b97d0438182@oss.qualcomm.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=7138;
 i=dmitry.baryshkov@oss.qualcomm.com; h=from:subject:message-id;
 bh=VurcZtQ6s0/YP/v7Sm5xJziSsCDBKjb5TpLb/Bs7EUQ=;
 b=owGbwMvMwMXYbdNlx6SpcZXxtFoSQ+bCJ3ZvdkmemeFRdvPf09c/u144RWwvKTyVoy7urrxAl
 bU1R/NAJ6MxCwMjF4OsmCKLT0HL1JhNyWEfdkythxnEygQyhYGLUwAmsngd+/8MJo7CvJ873Xad
 d/7mUZ+vxrCSM+OkQpHv9fJpnMtvVc0Pbq+909l6/sSZ6DmLXWJUmD/WTko8c439sg9Xacr1y/t
 CTF4EJR516VStiL1jzdm69pKjl2VqqSr/iwl1n8r0wuZZP5PM0fkQKrTsiXP0rNsFG6deuqVvPX
 G5pHNSWJsO71q1VLbZ6+bc1mu+xfywL5Rv6X2GDL2kql4xQ78FKhslLu5VvrN2dh6D+wwRJifJ3
 g1vu2RWeZ8VzWx6/M+udtm6ww2cQs+/ak8Wdn1++cw9fn22BOfmP+VvXhSuDfuSG9NY1u0sXDnZ
 7HASQ0PZI4vIuKyC3d9WnojqE/9XmnK8nee8nP9Fkd7bAA==
X-Developer-Key: i=dmitry.baryshkov@oss.qualcomm.com; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A
X-Authority-Analysis: v=2.4 cv=IZWKmGqa c=1 sm=1 tr=0 ts=69a1e44d cx=c_pps
 a=qKBjSQ1v91RyAK45QCPf5w==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=HzLeVaNsDn8A:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22 a=EUspDBNiAAAA:8
 a=kWJvl8zPePrAsXnfLXgA:9 a=QEXdDO2ut3YA:10 a=NFOGd7dJGGMPyQGDc5-O:22
X-Proofpoint-GUID: LiYqdA6D4oy48e4Wq-vw88Mthi2yk5G1
X-Proofpoint-ORIG-GUID: LiYqdA6D4oy48e4Wq-vw88Mthi2yk5G1
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMjI3MDE2NCBTYWx0ZWRfXwcb1EByUbZcU
 2yDqDsz+wtCZO+hm0V83otLZ0KYkMRN3L+JwugcKWvNc0M3F2waymIGkOZzd31FebQOgKU30R/X
 YXPPNG2ROR2g0fe9OpIEmZ/0NnAvcLsSb2xFrV7Z9Gn7HDfLT8yxj1GEpb5fMCCCfK1gtS2lJWq
 laPVvDUKzNr4/uwOoj7je4dXTrNfL7eOrAKcLKKatpSQCJCXitZ+EVyjba0YvkHb37uKdW2zPEh
 nHqpqOD3oKObOuxUOWc+5Dpja/dzZuf1dFjNytvMiaNJf/g/ybyK+jZ6s0Ro/fxvwS6mMJ+Rh/i
 kR5P5dG/oOrYoyd1/EMlakkL/yAMUv9gVejvWrYnrPq8yJ9x7Mx0Z43zCTqyzxhEX5BM0u5uCD7
 C+8RE7AvhTT5rbkWUbQaaMtDeVjll3oAH8gEznmujQuafLYBwgjKDpJM8JxK+ECB0cHWJ2JiLbD
 fL+qIPDZz068Yq5n02Q==
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
X-Rspamd-Queue-Id: C3AE01BC118
X-Rspamd-Action: no action

Since we don't support and don't use VBIF_NRT, VBIF_RT is the only
possible VBIF type. To simplify the driver, drop vbif_idx from the VBIF
parameter structures.

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
---
 drivers/gpu/drm/msm/disp/dpu1/dpu_encoder_phys_wb.c |  5 +----
 drivers/gpu/drm/msm/disp/dpu1/dpu_plane.c           |  5 +----
 drivers/gpu/drm/msm/disp/dpu1/dpu_trace.h           | 19 +++++++------------
 drivers/gpu/drm/msm/disp/dpu1/dpu_vbif.c            | 11 +++++------
 drivers/gpu/drm/msm/disp/dpu1/dpu_vbif.h            |  4 ----
 5 files changed, 14 insertions(+), 30 deletions(-)

diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder_phys_wb.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder_phys_wb.c
index 73021aaa8d3f..22433bfbea1e 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder_phys_wb.c
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder_phys_wb.c
@@ -71,7 +71,6 @@ static void dpu_encoder_phys_wb_set_ot_limit(
 	ot_params.is_wfd = !dpu_encoder_helper_get_cwb_mask(phys_enc);
 	ot_params.frame_rate = drm_mode_vrefresh(&phys_enc->cached_mode);
 	/* XXX: WB on MSM8996 should use VBIF_NRT */
-	ot_params.vbif_idx = VBIF_RT;
 	ot_params.rd = false;
 
 	if (!_dpu_encoder_phys_wb_clk_force_ctrl(hw_wb, phys_enc->dpu_kms->hw_mdp,
@@ -110,14 +109,12 @@ static void dpu_encoder_phys_wb_set_qos_remap(
 
 	memset(&qos_params, 0, sizeof(qos_params));
 	/* XXX: WB on MSM8996 should use VBIF_NRT */
-	qos_params.vbif_idx = VBIF_RT;
 	qos_params.xin_id = hw_wb->caps->xin_id;
 	qos_params.num = hw_wb->idx - WB_0;
 	qos_params.is_rt = dpu_encoder_helper_get_cwb_mask(phys_enc);
 
-	DPU_DEBUG("[qos_remap] wb:%d vbif:%d xin:%d is_rt:%d\n",
+	DPU_DEBUG("[qos_remap] wb:%d xin:%d is_rt:%d\n",
 			qos_params.num,
-			qos_params.vbif_idx,
 			qos_params.xin_id, qos_params.is_rt);
 
 	if (!_dpu_encoder_phys_wb_clk_force_ctrl(hw_wb, phys_enc->dpu_kms->hw_mdp,
diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_plane.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_plane.c
index 547d084f2944..6d23e10b493b 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_plane.c
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_plane.c
@@ -374,7 +374,6 @@ static void _dpu_plane_set_ot_limit(struct drm_plane *plane,
 	ot_params.height = drm_rect_height(&pipe_cfg->src_rect);
 	ot_params.is_wfd = !pdpu->is_rt_pipe;
 	ot_params.frame_rate = frame_rate;
-	ot_params.vbif_idx = VBIF_RT;
 	ot_params.rd = true;
 
 	if (!_dpu_plane_sspp_clk_force_ctrl(pipe->sspp, dpu_kms->hw_mdp,
@@ -402,14 +401,12 @@ static void _dpu_plane_set_qos_remap(struct drm_plane *plane,
 	bool forced_on = false;
 
 	memset(&qos_params, 0, sizeof(qos_params));
-	qos_params.vbif_idx = VBIF_RT;
 	qos_params.xin_id = pipe->sspp->cap->xin_id;
 	qos_params.num = pipe->sspp->idx - SSPP_VIG0;
 	qos_params.is_rt = pdpu->is_rt_pipe;
 
-	DPU_DEBUG_PLANE(pdpu, "pipe:%d vbif:%d xin:%d rt:%d\n",
+	DPU_DEBUG_PLANE(pdpu, "pipe:%d xin:%d rt:%d\n",
 			qos_params.num,
-			qos_params.vbif_idx,
 			qos_params.xin_id, qos_params.is_rt);
 
 	if (!_dpu_plane_sspp_clk_force_ctrl(pipe->sspp, dpu_kms->hw_mdp,
diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_trace.h b/drivers/gpu/drm/msm/disp/dpu1/dpu_trace.h
index cb24ad2a6d8d..805d117493da 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_trace.h
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_trace.h
@@ -72,23 +72,20 @@ TRACE_EVENT(dpu_perf_set_danger_luts,
 );
 
 TRACE_EVENT(dpu_perf_set_ot,
-	TP_PROTO(u32 pnum, u32 xin_id, u32 rd_lim, u32 vbif_idx),
-	TP_ARGS(pnum, xin_id, rd_lim, vbif_idx),
+	TP_PROTO(u32 pnum, u32 xin_id, u32 rd_lim),
+	TP_ARGS(pnum, xin_id, rd_lim),
 	TP_STRUCT__entry(
 			__field(u32, pnum)
 			__field(u32, xin_id)
 			__field(u32, rd_lim)
-			__field(u32, vbif_idx)
 	),
 	TP_fast_assign(
 			__entry->pnum = pnum;
 			__entry->xin_id = xin_id;
 			__entry->rd_lim = rd_lim;
-			__entry->vbif_idx = vbif_idx;
 	),
-	TP_printk("pnum:%d xin_id:%d ot:%d vbif:%d",
-			__entry->pnum, __entry->xin_id, __entry->rd_lim,
-			__entry->vbif_idx)
+	TP_printk("pnum:%d xin_id:%d ot:%d",
+			__entry->pnum, __entry->xin_id, __entry->rd_lim)
 )
 
 TRACE_EVENT(dpu_cmd_release_bw,
@@ -861,17 +858,15 @@ TRACE_EVENT(dpu_rm_reserve_lms,
 );
 
 TRACE_EVENT(dpu_vbif_wait_xin_halt_fail,
-	TP_PROTO(enum dpu_vbif index, u32 xin_id),
-	TP_ARGS(index, xin_id),
+	TP_PROTO(u32 xin_id),
+	TP_ARGS(xin_id),
 	TP_STRUCT__entry(
-		__field(	enum dpu_vbif,	index	)
 		__field(	u32,		xin_id	)
 	),
 	TP_fast_assign(
-		__entry->index = index;
 		__entry->xin_id = xin_id;
 	),
-	TP_printk("index:%d xin_id:%u", __entry->index, __entry->xin_id)
+	TP_printk("xin_id:%u", __entry->xin_id)
 );
 
 TRACE_EVENT(dpu_pp_connect_ext_te,
diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_vbif.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_vbif.c
index a4c5ca13179b..d33231f1d50b 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_vbif.c
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_vbif.c
@@ -180,8 +180,7 @@ void dpu_vbif_set_ot_limit(struct dpu_kms *dpu_kms,
 	if (ot_lim == 0)
 		return;
 
-	trace_dpu_perf_set_ot(params->num, params->xin_id, ot_lim,
-		params->vbif_idx);
+	trace_dpu_perf_set_ot(params->num, params->xin_id, ot_lim);
 
 	vbif->ops.set_limit_conf(vbif, params->xin_id, params->rd, ot_lim);
 
@@ -189,7 +188,7 @@ void dpu_vbif_set_ot_limit(struct dpu_kms *dpu_kms,
 
 	ret = _dpu_vbif_wait_for_xin_halt(vbif, params->xin_id);
 	if (ret)
-		trace_dpu_vbif_wait_xin_halt_fail(vbif->idx, params->xin_id);
+		trace_dpu_vbif_wait_xin_halt_fail(params->xin_id);
 
 	vbif->ops.set_halt_ctrl(vbif, params->xin_id, false);
 }
@@ -214,7 +213,7 @@ void dpu_vbif_set_qos_remap(struct dpu_kms *dpu_kms,
 	vbif = dpu_kms->hw_vbif;
 
 	if (!vbif || !vbif->cap) {
-		DPU_ERROR("invalid vbif %d\n", params->vbif_idx);
+		DPU_ERROR("invalid vbif\n");
 		return;
 	}
 
@@ -232,8 +231,8 @@ void dpu_vbif_set_qos_remap(struct dpu_kms *dpu_kms,
 	}
 
 	for (i = 0; i < qos_tbl->npriority_lvl; i++) {
-		DRM_DEBUG_ATOMIC("%s xin:%d lvl:%d/%d\n",
-				dpu_vbif_name(params->vbif_idx), params->xin_id, i,
+		DRM_DEBUG_ATOMIC("VBIF xin:%d lvl:%d/%d\n",
+				params->xin_id, i,
 				qos_tbl->priority_lvl[i]);
 		vbif->ops.set_qos_remap(vbif, params->xin_id, i,
 				qos_tbl->priority_lvl[i]);
diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_vbif.h b/drivers/gpu/drm/msm/disp/dpu1/dpu_vbif.h
index 62e47ae1e3ee..f47a89cb34ea 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_vbif.h
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_vbif.h
@@ -15,24 +15,20 @@ struct dpu_vbif_set_ot_params {
 	u32 frame_rate;
 	bool rd;
 	bool is_wfd;
-	u32 vbif_idx;
 };
 
 struct dpu_vbif_set_memtype_params {
 	u32 xin_id;
-	u32 vbif_idx;
 	bool is_cacheable;
 };
 
 /**
  * struct dpu_vbif_set_qos_params - QoS remapper parameter
- * @vbif_idx: vbif identifier
  * @xin_id: client interface identifier
  * @num: pipe identifier (debug only)
  * @is_rt: true if pipe is used in real-time use case
  */
 struct dpu_vbif_set_qos_params {
-	u32 vbif_idx;
 	u32 xin_id;
 	u32 num;
 	bool is_rt;

-- 
2.47.3

