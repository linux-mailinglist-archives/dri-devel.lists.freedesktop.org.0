Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 00C90AA7F12
	for <lists+dri-devel@lfdr.de>; Sat,  3 May 2025 09:17:23 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 45FE810E376;
	Sat,  3 May 2025 07:17:14 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="iRs2dOwM";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com
 [205.220.168.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2B37B10E376
 for <dri-devel@lists.freedesktop.org>; Sat,  3 May 2025 07:17:13 +0000 (UTC)
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 5436E5Nb007801
 for <dri-devel@lists.freedesktop.org>; Sat, 3 May 2025 07:17:12 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 R6N0tvqMMnaFd6rXphyiPbtd6QUTPIJgEbiauM+ZAzk=; b=iRs2dOwMq5IQqXmF
 KjALF2RGDnzu0JmOj2OA5fsPDQjdmzzlF1Q3cGTH5e9icMWt0Muq2htKsbpxKmCp
 k4/HYa+BZg0X9Amp7Uc2oWOcOUnhXcNfnGEhxjxEdNjOZ7og47o4byRINAgVFTCz
 iXMyuglhw03Je6IGvBwhZ9+3NpKmcpW20QjE0GHLbdTsWFP4yQ6uqSt6KAqayeFp
 pqtIUe2gM1y+F6p3s2HqYXNQvjAAiuH159ShXLV5Uik2HPCFb+/0yQk9qVYZtrtG
 iK2LmG9LYjSxKxDWcS93MaZMuEhoi6gzG05T7n+lb8hwNsFVvSXie/BBc7ynSXbi
 Wx443A==
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com
 [209.85.222.199])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 46dcakg5eg-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
 for <dri-devel@lists.freedesktop.org>; Sat, 03 May 2025 07:17:12 +0000 (GMT)
Received: by mail-qk1-f199.google.com with SMTP id
 af79cd13be357-7c54a6b0c70so258307885a.0
 for <dri-devel@lists.freedesktop.org>; Sat, 03 May 2025 00:17:12 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1746256631; x=1746861431;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=R6N0tvqMMnaFd6rXphyiPbtd6QUTPIJgEbiauM+ZAzk=;
 b=XjddL20TCjItH6vN6Qf16v07OLi12ELR10G1PETPd7s8aXZrYO5MBTUrg4+dRuGRj3
 L1+fWxqGFiXeQRLK8+YkNv2bJYhxE3jlnlyl08lUpcdzdVaZE0SZ86QkQgt7NdjYxkv2
 5ogRZc3V2HjBUvkDVQ1Nz95FewlbF9mIM6MVx4XkjoEJfDBIerxshkLZTEewauBgVCeA
 t1L1nMuVUpZQOG6Mtfqd2/+tiSaw5zq15CyxRPqMcEqZrrgQ1oqmh9NSlAqY/kbqkt8A
 1r7tIV82pfHY/mcu/70O4o78q5HhN9Rep8ogYissDgX676je8b3VR2Nco3e9ceXxiM15
 5Bzw==
X-Forwarded-Encrypted: i=1;
 AJvYcCWuQBKoChp7Z0W6uRyBlT2q86XddyLs+dGmb+XOMswJPjkIBcjUov8UNFCBYyhkyqNI5BbdyrOMkKM=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YwIr5PKkyQqlQkL9CTJptp7EFqga0B2D257FtM8ixohkIOYY5nc
 mrmJ2TrHwn7KeK1PO5ZKIPFOnWVQoH0p1KYJYnlIg3j31oA71/Fd4gDh/FGZ12d+77R/sG8ZHz5
 esUA6PL6WKytJ7SQfgKu0eiFCQlPT5fAxnv32PikC5cNuPzOPafDM9pcrqi9fV56dQSI=
X-Gm-Gg: ASbGncuSuX4ob4BoH827uGVCUcYEPaU/Z+YaqiERWxV7OtrN0LDuUARSUq1Ylb7ry0e
 04/adBttL/YkDWyScE+moM9xikANRMKLlJMr+1r6mcvZvKKD28TQwl0aTikdwneu5syyR+SISTe
 kSZh8znDoVJ9V9OrVnWHf5QBN2aGxElgX1hLUGkLqKjD3gpaPqyY5wT4SVwxJtWKofLgvwvcKPP
 ZV6+jEhYvEJh6cC1tn4p83Vz62OtqRM0aVtUSQmDeyL0dPR4UP8gwGdozh8+KQR8Vu/W1VGEdMe
 tMniMjhKUFSjg1PxV/fXJRU+XPUtZVwpnDN0CeYeUwi1PGs5ZvRTmDmsHWgL+N4+qRdwTJI488/
 v6ELO+J9VLzSmJGCT/xcvqnla
X-Received: by 2002:a05:620a:f05:b0:7c5:4b91:6a44 with SMTP id
 af79cd13be357-7cae3a99ff9mr20443885a.19.1746256631329; 
 Sat, 03 May 2025 00:17:11 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEO8pkqYTjfx0aYWe9ZJaRvk9TWmCpxmnFrPc/lMoywrhWLT1B4JmwtyoYh9Yf3IJ2pBAI5QQ==
X-Received: by 2002:a05:620a:f05:b0:7c5:4b91:6a44 with SMTP id
 af79cd13be357-7cae3a99ff9mr20441985a.19.1746256630977; 
 Sat, 03 May 2025 00:17:10 -0700 (PDT)
Received: from umbar.lan
 (2001-14ba-a0c3-3a00-264b-feff-fe8b-be8a.rev.dnainternet.fi.
 [2001:14ba:a0c3:3a00:264b:feff:fe8b:be8a])
 by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-54ea94c5557sm692816e87.84.2025.05.03.00.17.09
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 03 May 2025 00:17:09 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Date: Sat, 03 May 2025 10:17:02 +0300
Subject: [PATCH v2 03/11] drm/msm/mdp4: get rid of mdp4_crtc.id
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250503-msm-gpu-split-v2-3-1292cba0f5ad@oss.qualcomm.com>
References: <20250503-msm-gpu-split-v2-0-1292cba0f5ad@oss.qualcomm.com>
In-Reply-To: <20250503-msm-gpu-split-v2-0-1292cba0f5ad@oss.qualcomm.com>
To: Rob Clark <robdclark@gmail.com>, Abhinav Kumar <quic_abhinavk@quicinc.com>,
 Dmitry Baryshkov <lumag@kernel.org>, Sean Paul <sean@poorly.run>,
 Marijn Suijten <marijn.suijten@somainline.org>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Konrad Dybcio <konradybcio@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
 freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=3130;
 i=dmitry.baryshkov@oss.qualcomm.com; h=from:subject:message-id;
 bh=npSuxvWMmhzKLh8mAO06E84f1kOeMHWURDV7gpjmnuQ=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBoFcLtto2vqAsBNHAxZIqy1DBh8+q2si90ocVxb
 arA9opd+w2JATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCaBXC7QAKCRCLPIo+Aiko
 1R7OB/0W4E9JqKrkJs0hOC+CF5VnWoPE7MsErFPX5GI8LFHKdd88bcdMGp3fSWR+w5uWuNNUylw
 og+IFhEVLrHyTTn71oQnTOPWyvpdDS9McnBONDrBUrYTDep81AiMhEaUTpDBPoqG0JSfc8Ee3jQ
 p5gWy8MQRBtFUlD6/2fHor6yTRio+Av/4GFNLY7/lWIrtzJrEMOrPjU0us5tTdfM5QXgnn4HUcs
 5hnpD3Y+TZjO3a5UzorXPcsvnmip//CcuZNqHSNgD5FiUXMnsaDmzIJYp7OHCdxd0KnYihnTCMR
 E53tLbVTUm6fLnHNI+Vx7oRq8K5co5FK2uSdBfolUU8aM1ND
X-Developer-Key: i=dmitry.baryshkov@oss.qualcomm.com; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNTAzMDA2MSBTYWx0ZWRfXwh1ddKVbEow8
 KQSj+46/21k/0wEXatzkx367oCIaOPdfig7Jo5/CakpHhbVVuEwLs44dXH912CMzL47vuAfIwkO
 k5KGsLfu5exQNywo6VjfFwf0LGNzZmvMB3ufGhuAv7o86nUWrolwHppm3tWs68gcDaBwiYgniZ1
 dcUyCzf60WT59rSO0F4mhQlCOFbrdolmilSM5/zB90KkDjjM5X0bCndFya4xp0GdMI3xKdcegAj
 Knn/y2LD91M8wZaRP3MBgsZN8QIMI0mH6FXfCwkJ5IRrpqD38MOYfPQf77iC5uODgaaNNcFKTHR
 KB7SG8rwyZEXyaURiFxbahzrjtGDQHmKFhkaVBS6BSkdr14aU5VjCEUjdakct/5kDpAZIHD49h+
 LhRNTMcUDMmawbAC6zaFd6piYHfONusVBAkAkPvMjM9hGN79ETPUZZSMjCDYxff9l39HxWHp
X-Proofpoint-ORIG-GUID: nEv-Qaliu9vCrYzHkniZHzuy9xSczCGP
X-Authority-Analysis: v=2.4 cv=JtvxrN4C c=1 sm=1 tr=0 ts=6815c2f8 cx=c_pps
 a=HLyN3IcIa5EE8TELMZ618Q==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=dt9VzEwgFbYA:10 a=EUspDBNiAAAA:8 a=JeS6effYNUkig2QXyjUA:9 a=QEXdDO2ut3YA:10
 a=bTQJ7kPSJx9SKPbeHEYW:22
X-Proofpoint-GUID: nEv-Qaliu9vCrYzHkniZHzuy9xSczCGP
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-05-03_03,2025-04-30_01,2025-02-21_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 impostorscore=0 bulkscore=0 spamscore=0 phishscore=0
 lowpriorityscore=0 mlxscore=0 suspectscore=0 mlxlogscore=999 clxscore=1015
 malwarescore=0 priorityscore=1501 classifier=spam authscore=0 authtc=n/a
 authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2504070000 definitions=main-2505030061
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

There is no reason to store CRTC id, it's a part of the drm_crtc. Drop
this member and use drm_crtc.name for the warning message.

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
---
 drivers/gpu/drm/msm/disp/mdp4/mdp4_crtc.c | 7 ++-----
 drivers/gpu/drm/msm/disp/mdp4/mdp4_kms.c  | 2 +-
 drivers/gpu/drm/msm/disp/mdp4/mdp4_kms.h  | 2 +-
 3 files changed, 4 insertions(+), 7 deletions(-)

diff --git a/drivers/gpu/drm/msm/disp/mdp4/mdp4_crtc.c b/drivers/gpu/drm/msm/disp/mdp4/mdp4_crtc.c
index 5e1e62256c382426f70d21a5312fb40dda68d695..7596b45e234bdcf1b7cf37c4a8d39862f48819a8 100644
--- a/drivers/gpu/drm/msm/disp/mdp4/mdp4_crtc.c
+++ b/drivers/gpu/drm/msm/disp/mdp4/mdp4_crtc.c
@@ -17,7 +17,6 @@
 struct mdp4_crtc {
 	struct drm_crtc base;
 	char name[8];
-	int id;
 	int ovlp;
 	enum mdp4_dma dma;
 	bool enabled;
@@ -539,7 +538,7 @@ static void mdp4_crtc_wait_for_flush_done(struct drm_crtc *crtc)
 			mdp4_crtc->flushed_mask),
 		msecs_to_jiffies(50));
 	if (ret <= 0)
-		dev_warn(dev->dev, "vblank time out, crtc=%d\n", mdp4_crtc->id);
+		dev_warn(dev->dev, "vblank time out, crtc=%s\n", mdp4_crtc->base.name);
 
 	mdp4_crtc->flushed_mask = 0;
 
@@ -624,7 +623,7 @@ static void mdp4_crtc_flip_cleanup(struct drm_device *dev, void *ptr)
 
 /* initialize crtc */
 struct drm_crtc *mdp4_crtc_init(struct drm_device *dev,
-		struct drm_plane *plane, int id, int ovlp_id,
+		struct drm_plane *plane, int ovlp_id,
 		enum mdp4_dma dma_id)
 {
 	struct drm_crtc *crtc = NULL;
@@ -639,8 +638,6 @@ struct drm_crtc *mdp4_crtc_init(struct drm_device *dev,
 
 	crtc = &mdp4_crtc->base;
 
-	mdp4_crtc->id = id;
-
 	mdp4_crtc->ovlp = ovlp_id;
 	mdp4_crtc->dma = dma_id;
 
diff --git a/drivers/gpu/drm/msm/disp/mdp4/mdp4_kms.c b/drivers/gpu/drm/msm/disp/mdp4/mdp4_kms.c
index 7e942c1337b3597d557abd3e2e418c3958e5eb3f..00920bd44f6f73099ff2c293473e427caa49b873 100644
--- a/drivers/gpu/drm/msm/disp/mdp4/mdp4_kms.c
+++ b/drivers/gpu/drm/msm/disp/mdp4/mdp4_kms.c
@@ -338,7 +338,7 @@ static int modeset_init(struct mdp4_kms *mdp4_kms)
 			goto fail;
 		}
 
-		crtc  = mdp4_crtc_init(dev, plane, priv->num_crtcs, i,
+		crtc  = mdp4_crtc_init(dev, plane, i,
 				mdp4_crtcs[i]);
 		if (IS_ERR(crtc)) {
 			DRM_DEV_ERROR(dev->dev, "failed to construct crtc for %s\n",
diff --git a/drivers/gpu/drm/msm/disp/mdp4/mdp4_kms.h b/drivers/gpu/drm/msm/disp/mdp4/mdp4_kms.h
index f9d988076337cb6fb63af8e76be59b2eb34ab327..fb348583dc84de5c57c77fdf246894e9334af514 100644
--- a/drivers/gpu/drm/msm/disp/mdp4/mdp4_kms.h
+++ b/drivers/gpu/drm/msm/disp/mdp4/mdp4_kms.h
@@ -185,7 +185,7 @@ void mdp4_crtc_set_config(struct drm_crtc *crtc, uint32_t config);
 void mdp4_crtc_set_intf(struct drm_crtc *crtc, enum mdp4_intf intf, int mixer);
 void mdp4_crtc_wait_for_commit_done(struct drm_crtc *crtc);
 struct drm_crtc *mdp4_crtc_init(struct drm_device *dev,
-		struct drm_plane *plane, int id, int ovlp_id,
+		struct drm_plane *plane, int ovlp_id,
 		enum mdp4_dma dma_id);
 
 long mdp4_dtv_round_pixclk(struct drm_encoder *encoder, unsigned long rate);

-- 
2.39.5

