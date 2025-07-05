Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id AE30DAF9F89
	for <lists+dri-devel@lfdr.de>; Sat,  5 Jul 2025 12:02:45 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0165A10E20C;
	Sat,  5 Jul 2025 10:02:44 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="hlxieKwj";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com
 [205.220.180.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8BF6F10E37A
 for <dri-devel@lists.freedesktop.org>; Sat,  5 Jul 2025 10:02:42 +0000 (UTC)
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 5659U6cN029670
 for <dri-devel@lists.freedesktop.org>; Sat, 5 Jul 2025 10:02:41 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 4F90/3W/LUSFn38dXcUegvIFvXJs8yXbN6RnwBBqeTQ=; b=hlxieKwjlAhXJ2wM
 kaSl17R9dNl5jCLRHVouR96BkS6q+FcU83GvxCa500HtX9zVo/IWYT9hVtR9xqV6
 XeJ34Gngz9dyxzI4pIHBGB362Q1Di5vJbzvWDenmMrk4bRFqqMB7071oUForoJnB
 VUq4F+SaVt4Bdb7rwZjFNOth+bHFHX3qGszj9BNOdDSbFh6zUuJB88HU+EWQSMHj
 Okta6NioMo4Dn1xRX0o5bvODou++SSHDF+hLfwPbDBX9kSp7XszDqmBzCTrHcJ73
 vlMWDF8SGTJyUh7TYQC4pizU8Phbuuwk+DaItnBEQhhjzUEaaDBg7FQXjpRnGzyK
 f8P+Hw==
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com
 [209.85.222.199])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 47pucm8mw0-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
 for <dri-devel@lists.freedesktop.org>; Sat, 05 Jul 2025 10:02:41 +0000 (GMT)
Received: by mail-qk1-f199.google.com with SMTP id
 af79cd13be357-7d22790afd2so214484885a.2
 for <dri-devel@lists.freedesktop.org>; Sat, 05 Jul 2025 03:02:41 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1751709761; x=1752314561;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=4F90/3W/LUSFn38dXcUegvIFvXJs8yXbN6RnwBBqeTQ=;
 b=RWT+bxOtw3ZdAf9eDyjPLgQhAu7QwS3dgJNfG/CO7LyxDSK3RfzoKxAEh3ZP5FBPpU
 Gm3QVhbWu/xkRtFu32D+smf9+QARZzCrQmgzWRCXkEf4Ent8+e4biis9qEADeu6fRhc1
 Wwvb9ZPzNsG3PRLLyoMdkhTS8sKrhCbUbDjGd3smXme13oOjCXR94heBrjdLgOQPP3ND
 rJJxyGENEZB11QugqM7FSOXGfbsNJHklet6ICemEt3B9FT3qLfDL+SoVEzaLM7tAelqL
 BQgzvzPlP+M/LZgZL2i/xGKcnYq1JQsp/HT9KZaOIH2KS+vT97gBNDqUDQJugLqc1Kks
 kIQg==
X-Forwarded-Encrypted: i=1;
 AJvYcCUf2qOLTz00Ljhe8BZGAl8PPwJvjaDvscuoILK6q/7bJqQX5i9Cnha0fMu4h+grzKiBUXKJDWQspv8=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YyOT9soUJbPKFEPapTFU8sGyIJmDMIP4mHj9m+JaXrAPK2WIGKz
 Mf14GeXa1gTV1RnSmei46oVYHXViyHYobXgGU7qzkMR1MdpFPBJkTWDMxq+NAlXQrQcl52/cJet
 5zaPTXEoinQZY89i5UyeSbWmVnyjl5fwljDe0nLcEClKU8uv6up5l1Gb37ttSwYtnvOh7AoQ=
X-Gm-Gg: ASbGncu9oSekBEcv+xXMsd4QEDcGXM1utGrvXUa9GpzP39+0ayshWZungu6nF9W6ZxO
 zNBFi6B8rVsKAfUPG99KbLqN1LIWPk2JKEPClyhVhtFJwsuFrc86V2Iyfxh0VBd1E5z7jPqSKkK
 8T4X9y/YfiW4dy9O11KGE8eliv09Hy3eEL1kU8KOt09sIrW8HN7L9HWgCd0vrQJZqz8L4evBa6w
 SeXJnf/N0jDD2FQXTgzXoYzjn3Y+HC7hCdS2DJl9nyeGRNoZIMd0eXq4HdpRrNpADaERXDtJIZa
 LmI3f95xQynDJkylYNEXOTqT+yWsN+LIdnnXmeIzDrBMPeTfxR/yPBWw3+ZXp8YJCK0pfZmUFkH
 Lw2p2iSmlWknnbNDD6ZM4JCHvC7S1/FGpJYY=
X-Received: by 2002:a05:620a:2915:b0:7ca:f02a:4d2b with SMTP id
 af79cd13be357-7d5dcc7295dmr751766685a.12.1751709760459; 
 Sat, 05 Jul 2025 03:02:40 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGulStBJHLwU8HwDOIF+guVJVHi5pOC4lXhzr0md3WFCORD6oDXM4sw08Hi8v5tjavsA5Phzg==
X-Received: by 2002:a05:620a:2915:b0:7ca:f02a:4d2b with SMTP id
 af79cd13be357-7d5dcc7295dmr751761785a.12.1751709759816; 
 Sat, 05 Jul 2025 03:02:39 -0700 (PDT)
Received: from umbar.lan
 (2001-14ba-a0c3-3a00-264b-feff-fe8b-be8a.rev.dnainternet.fi.
 [2001:14ba:a0c3:3a00:264b:feff:fe8b:be8a])
 by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-556384c0558sm526274e87.209.2025.07.05.03.02.38
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 05 Jul 2025 03:02:38 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Date: Sat, 05 Jul 2025 13:02:29 +0300
Subject: [PATCH v4 04/10] drm/msm: get rid of msm_drm_private::num_crtcs
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250705-msm-gpu-split-v4-4-fb470c481131@oss.qualcomm.com>
References: <20250705-msm-gpu-split-v4-0-fb470c481131@oss.qualcomm.com>
In-Reply-To: <20250705-msm-gpu-split-v4-0-fb470c481131@oss.qualcomm.com>
To: Rob Clark <robin.clark@oss.qualcomm.com>,
 Dmitry Baryshkov <lumag@kernel.org>,
 Abhinav Kumar <abhinav.kumar@linux.dev>,
 Jessica Zhang <jessica.zhang@oss.qualcomm.com>,
 Sean Paul <sean@poorly.run>,
 Marijn Suijten <marijn.suijten@somainline.org>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Konrad Dybcio <konradybcio@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
 freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=4457;
 i=dmitry.baryshkov@oss.qualcomm.com; h=from:subject:message-id;
 bh=TPCljJOCE+lAGVk6fcBbNqkJA6qavoaTCAklWifT78M=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBoaPgzYU4YT/9DG03zg0Djt3R1PL8JY+Bj6d5l7
 Jy5NeZZsRWJATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCaGj4MwAKCRCLPIo+Aiko
 1RNICACdfxbPAPjg77KvBwb9W88X1WwjulbLAGup29/00hSU5LfPUKuPHIC1AGOb47UA8NQkDgU
 csHLBA/YtesFD/a8GBOrrsPD/+U4hvdxgz1zB7pCYWEaQ6KkaIV8Ik6dYuq+IM9AyFot6npA+3q
 kNrQyx4GsanMOM/yabLUABnMF+FN6qLhWWIQuVjaylxysF6nfmQacD+bhsGweItMagZdarQN1Ei
 t7BBFBE6BsX0MzZu655r3l1k5VNRPfEoni093XRWjYqKspik/l318q1/jC97N3ucZBiNrO96DTZ
 Uvucvl2Bde5N16GieoyH7eLmNenk4HeTMwhg79l4TGcaM9Ko
X-Developer-Key: i=dmitry.baryshkov@oss.qualcomm.com; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A
X-Authority-Analysis: v=2.4 cv=GdQXnRXL c=1 sm=1 tr=0 ts=6868f841 cx=c_pps
 a=HLyN3IcIa5EE8TELMZ618Q==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=Wb1JkmetP80A:10 a=EUspDBNiAAAA:8 a=F-HcN3iq_yGV61sY1bgA:9 a=QEXdDO2ut3YA:10
 a=bTQJ7kPSJx9SKPbeHEYW:22
X-Proofpoint-GUID: hWuWK4BDHJJW2mr6inNiM9d3gn27mY9a
X-Proofpoint-ORIG-GUID: hWuWK4BDHJJW2mr6inNiM9d3gn27mY9a
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNzA1MDA2NCBTYWx0ZWRfX9L6rxBlv3KYX
 jWkb+7x+N6sCyOSahn3osva427KuygwX14osae/KrA7Ro3CbLBrQCq7eIFviH+BYQakL/Ht7Ujs
 h0At+s1FKbAVcCJyPC6xZ09CmOmXOhKlWHGLmkmRvREgMWNDxVSg6KTrKPjwZCRcBUTSvAxCdV9
 RQsMuW2MEzlE+zvYslZ2koet/pazBik7cpwEuc4Da/WAR5y0LB+2rni9wIwC6vCc3PFyNjc5PJK
 tPh9GQjC+n68Rh+Tn4dHO5M9suhIBDYCD+iC7ZsTyi/PXIHZoXTras8flY8iOk5E2Y4eWmCb+y/
 6FaUI24z+t96nEO/r5tU76ewjoJe5IjGpnCGPjCKNwdtekvXG0q4BH71PEKL0/nLtSx2Y9zBAsR
 nnGN+LY8DWXfRxqdO2H4DNQ54J+zHOdzyi7KIxFdMpoTbfqvryuki8Yk4YcloMCtZKrgkIKL
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.7,FMLib:17.12.80.40
 definitions=2025-07-04_07,2025-07-04_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 phishscore=0 adultscore=0 bulkscore=0 clxscore=1015
 spamscore=0 suspectscore=0 mlxlogscore=999 priorityscore=1501 impostorscore=0
 malwarescore=0 mlxscore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2505280000
 definitions=main-2507050064
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

Drop superfluous msm_drm_private::num_crtcs in favour of using
drm_mode_config::num_crtc or MAX_CRCS as appropriate.

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
---
 drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c  | 3 +--
 drivers/gpu/drm/msm/disp/mdp4/mdp4_kms.c | 3 ---
 drivers/gpu/drm/msm/disp/mdp5/mdp5_kms.c | 4 +---
 drivers/gpu/drm/msm/msm_drv.h            | 2 --
 drivers/gpu/drm/msm/msm_kms.c            | 4 ++--
 5 files changed, 4 insertions(+), 12 deletions(-)

diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c
index e63a62664f39d73033e65adab5a90fd43c844a78..7025f521b70e501eefa69ddcdba64d38e0ca5465 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c
@@ -875,12 +875,11 @@ static int _dpu_kms_drm_obj_init(struct dpu_kms *dpu_kms)
 			ret = PTR_ERR(crtc);
 			return ret;
 		}
-		priv->num_crtcs++;
 	}
 
 	/* All CRTCs are compatible with all encoders */
 	drm_for_each_encoder(encoder, dev)
-		encoder->possible_crtcs = (1 << priv->num_crtcs) - 1;
+		encoder->possible_crtcs = (1 << dev->mode_config.num_crtc) - 1;
 
 	return 0;
 }
diff --git a/drivers/gpu/drm/msm/disp/mdp4/mdp4_kms.c b/drivers/gpu/drm/msm/disp/mdp4/mdp4_kms.c
index 6d938abe29ee7283de2b1535d3d0159bf09d6dff..1aa7d65afbd0b4e8a231d1d4ff7a7120e8b7391e 100644
--- a/drivers/gpu/drm/msm/disp/mdp4/mdp4_kms.c
+++ b/drivers/gpu/drm/msm/disp/mdp4/mdp4_kms.c
@@ -297,7 +297,6 @@ static int mdp4_modeset_init_intf(struct mdp4_kms *mdp4_kms,
 static int modeset_init(struct mdp4_kms *mdp4_kms)
 {
 	struct drm_device *dev = mdp4_kms->dev;
-	struct msm_drm_private *priv = dev->dev_private;
 	struct drm_plane *plane;
 	struct drm_crtc *crtc;
 	int i, ret;
@@ -347,8 +346,6 @@ static int modeset_init(struct mdp4_kms *mdp4_kms)
 			ret = PTR_ERR(crtc);
 			goto fail;
 		}
-
-		priv->num_crtcs++;
 	}
 
 	/*
diff --git a/drivers/gpu/drm/msm/disp/mdp5/mdp5_kms.c b/drivers/gpu/drm/msm/disp/mdp5/mdp5_kms.c
index b6e6bd1f95eebf890a8dced129854e8e19e60c9c..4c9e79fc00e9d8ca8de294c83559e72a2e48d1d2 100644
--- a/drivers/gpu/drm/msm/disp/mdp5/mdp5_kms.c
+++ b/drivers/gpu/drm/msm/disp/mdp5/mdp5_kms.c
@@ -375,7 +375,6 @@ static int modeset_init_intf(struct mdp5_kms *mdp5_kms,
 static int modeset_init(struct mdp5_kms *mdp5_kms)
 {
 	struct drm_device *dev = mdp5_kms->dev;
-	struct msm_drm_private *priv = dev->dev_private;
 	unsigned int num_crtcs;
 	int i, ret, pi = 0, ci = 0;
 	struct drm_plane *primary[MAX_BASES] = { NULL };
@@ -443,7 +442,6 @@ static int modeset_init(struct mdp5_kms *mdp5_kms)
 			DRM_DEV_ERROR(dev->dev, "failed to construct crtc %d (%d)\n", i, ret);
 			goto fail;
 		}
-		priv->num_crtcs++;
 	}
 
 	/*
@@ -451,7 +449,7 @@ static int modeset_init(struct mdp5_kms *mdp5_kms)
 	 * crtcs for the encoders
 	 */
 	drm_for_each_encoder(encoder, dev)
-		encoder->possible_crtcs = (1 << priv->num_crtcs) - 1;
+		encoder->possible_crtcs = (1 << dev->mode_config.num_crtc) - 1;
 
 	return 0;
 
diff --git a/drivers/gpu/drm/msm/msm_drv.h b/drivers/gpu/drm/msm/msm_drv.h
index 33d668a18ff3613b40341df540d504ffff65b2a7..88ce305792fd89f280b39bd92888a18abd0343e3 100644
--- a/drivers/gpu/drm/msm/msm_drv.h
+++ b/drivers/gpu/drm/msm/msm_drv.h
@@ -175,8 +175,6 @@ struct msm_drm_private {
 		struct mutex lock;
 	} lru;
 
-	unsigned int num_crtcs;
-
 	struct msm_drm_thread event_thread[MAX_CRTCS];
 
 	struct notifier_block vmap_notifier;
diff --git a/drivers/gpu/drm/msm/msm_kms.c b/drivers/gpu/drm/msm/msm_kms.c
index 9541dd7f56c9ea0f1d63c77b8ad8e7bc8cb46508..a63d014c19039835de47fb3fb610ce67652b5d2c 100644
--- a/drivers/gpu/drm/msm/msm_kms.c
+++ b/drivers/gpu/drm/msm/msm_kms.c
@@ -245,7 +245,7 @@ void msm_drm_kms_uninit(struct device *dev)
 	flush_workqueue(kms->wq);
 
 	/* clean up event worker threads */
-	for (i = 0; i < priv->num_crtcs; i++) {
+	for (i = 0; i < MAX_CRTCS; i++) {
 		if (priv->event_thread[i].worker)
 			kthread_destroy_worker(priv->event_thread[i].worker);
 	}
@@ -313,7 +313,7 @@ int msm_drm_kms_init(struct device *dev, const struct drm_driver *drv)
 		sched_set_fifo(ev_thread->worker->task);
 	}
 
-	ret = drm_vblank_init(ddev, priv->num_crtcs);
+	ret = drm_vblank_init(ddev, ddev->mode_config.num_crtc);
 	if (ret < 0) {
 		DRM_DEV_ERROR(dev, "failed to initialize vblank\n");
 		goto err_msm_uninit;

-- 
2.39.5

