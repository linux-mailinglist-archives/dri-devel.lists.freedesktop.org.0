Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id F0BE9AA7F10
	for <lists+dri-devel@lfdr.de>; Sat,  3 May 2025 09:17:23 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C8AE410E378;
	Sat,  3 May 2025 07:17:13 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="kR8en2yb";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com
 [205.220.168.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7E99210E1BA
 for <dri-devel@lists.freedesktop.org>; Sat,  3 May 2025 07:17:10 +0000 (UTC)
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 5434vpEc023576
 for <dri-devel@lists.freedesktop.org>; Sat, 3 May 2025 07:17:10 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 sEr7zBFz0n6zl511rF6sE9zKKxRwyqeRpnXZOdeaNiQ=; b=kR8en2yb463z93zV
 5rKVRy9cKJ9H61s5luCEHfYYubme1UaBDZpvWvaccuC5C0SshcbsAW414TZrBcm2
 hFNwuAdtEQRSvk9S5k53U2o94TXbRNBRckJGVQz2ADL93xTomiM4Z4uUqTn3dcys
 Sr9WVuDlLF8NORP06OkDVYliGFMUhAjn5bYXJTfMpGSQ/9OIt/Qpk3eZloN1l2Ek
 3lcMviJ3UDt/lu7Bb01ubu13733KxV8fq0XljF3OLPzqTh3oMpcBqfxf+/e15TK1
 +vU+zOFqDUggNdnqvlb8WjFrZAe36I/j7h0ZOy0prsL2HwqFHg75T1WBnhP1LdUi
 zPw/ag==
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com
 [209.85.222.198])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 46da3rratr-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
 for <dri-devel@lists.freedesktop.org>; Sat, 03 May 2025 07:17:09 +0000 (GMT)
Received: by mail-qk1-f198.google.com with SMTP id
 af79cd13be357-7c9255d5e8cso112020885a.1
 for <dri-devel@lists.freedesktop.org>; Sat, 03 May 2025 00:17:09 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1746256628; x=1746861428;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=sEr7zBFz0n6zl511rF6sE9zKKxRwyqeRpnXZOdeaNiQ=;
 b=ud2U88lAA1jf5PsH45rgxwYDkLxwbFkQiULI3LL75ueWMbeyWucssXQ3bQUsQGX1C9
 5YEx2uJoMn391ZATrwISrawcphblv/H3B3SSxoKiDIYWmemlDEYG94+8RwAmz9zCFxaX
 yGF8Nub2ohdVOy3MvcctbPZAIcf/xqLWZZwly4MwMQrbdSW9g2HHRdkpHMISnLg/0szt
 pg4TokNMt34N14yX2o161R1ar5tYE/1evFfHJ8YTupqjVFqSdZxBLsHF6ni5MRNYzzKF
 pppDB9nFz0d/TszsrwOrsXsRLfk0pPkVl9YOx287YtoNNX3GzqSa2rJ8cphX20dHsXCg
 2b7g==
X-Forwarded-Encrypted: i=1;
 AJvYcCWYu1BL/Mw4ppL0IuSez9pLxTGkW1Y7YXSdX4+vfrkzoDFmN2OJ0SX/AJDRP8n1uY5oaaoMi3wlV2c=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yw6AXRbi0DnllglPN+gtjvAFmH9w6moB8LToaEylQA0cAu19Fli
 hqXbX9MNXUhl48dYayDg8Hs0P8VvIAIInPuvYGeKkS1HKKO2askCoK3hd1JcULYHp4t2PnZBveF
 qf8TR1hIQsTRyC+4dO5VoIOPn9lwFT2UXFJTu6zuTOFJzd3cOKxPqkkfghCXC5MnDaVkx+VYRzm
 01MA==
X-Gm-Gg: ASbGncs3qMUjGUzMrKEPOSWMzw1h3/HT9Mnd9vuPjsoNgaMMwF3xTci8lrzuHgVxBtN
 MSY/SgGXKbsJ+7ddSxCOZdelhDdwzdVoJq6EoFBUfdCFBKxDDlmlrH4nsZfhP1Fm/zA8QiMIqkP
 BZ00O86+J2H1Y2zN+nXAeDqVZEIU5yZZehIOZbn8m0+75Y3LO3XIMhYZJ4XCkTWeBppo7c4Rejc
 KEkBeUW/Ao9lRfjgSP2jU4v3eA9oVq8uGqe3cCaGqdzwvstrD9OiWirJ2ieq5P7ccTfDuGscbi+
 Y8mDHQYcn7Qllq1XgN2yIwzcSv8rkCFeWmC2Xas9uac0XEfW7SQ/NhYTncM/dmMqL5DdrDasj9l
 LiCaeNNth3tOQL/CvFwJZ34Py
X-Received: by 2002:a05:620a:1aa8:b0:7c7:f7ba:270a with SMTP id
 af79cd13be357-7cae3b02eb6mr22423385a.47.1746256628069; 
 Sat, 03 May 2025 00:17:08 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHxuNK5ghGmRyT7NP7q1v3xNaoSOvLMEMVKgRq2QIsX8OvQ5tOrV+Q08LD59YnphsQP4UwjZQ==
X-Received: by 2002:a05:620a:1aa8:b0:7c7:f7ba:270a with SMTP id
 af79cd13be357-7cae3b02eb6mr22419985a.47.1746256627581; 
 Sat, 03 May 2025 00:17:07 -0700 (PDT)
Received: from umbar.lan
 (2001-14ba-a0c3-3a00-264b-feff-fe8b-be8a.rev.dnainternet.fi.
 [2001:14ba:a0c3:3a00:264b:feff:fe8b:be8a])
 by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-54ea94c5557sm692816e87.84.2025.05.03.00.17.05
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 03 May 2025 00:17:05 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Date: Sat, 03 May 2025 10:17:00 +0300
Subject: [PATCH v2 01/11] drm/msm: move wq handling to KMS code
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250503-msm-gpu-split-v2-1-1292cba0f5ad@oss.qualcomm.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=7139;
 i=dmitry.baryshkov@oss.qualcomm.com; h=from:subject:message-id;
 bh=zJfl99w8gPUfrdwYMYw+1yKgLUvglxsypWiv2LeoqZ8=;
 b=owGbwMvMwMXYbdNlx6SpcZXxtFoSQ4boobfHTQTqHF1uisX+dGBK1t6sn6/8uFzuS26Yqazb1
 oVO4g6djMYsDIxcDLJiiiw+BS1TYzYlh33YMbUeZhArE8gUBi5OAbjIVg6G6bMaDurPTfJIWbJ8
 luKJ5tnRJ+c5/E3/q3e4ue1eleKa4tlVHa2utw+G5n300nfrWrLAwU3uXlfnndCnHyIWTZz9YdO
 P+lM3ooO1Ok+vOWiTe2B2kKrSnzIni3TTymmqfCKh/jFbYjUuV86z/B3RKfz8hNyMsmtuhYs1a0
 XnLl90zvmxbAefSubVoFm71rxkcVrP4xg3WcMwbNk0nm9uyW6/haflz75/ecU/0z92V5ZlbPRTu
 d4p2OKRuHXZ7h8vnhXNSbzo7G5Vd31xUXPfYRmZvM28mxYYLeEXmLFtk8+0UA6Gi6cc4y+xfrDn
 Me60XVN9r/Wu9ps7M2WqnbNbWT4lWd01rPmyppY/cGUEAA==
X-Developer-Key: i=dmitry.baryshkov@oss.qualcomm.com; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A
X-Proofpoint-ORIG-GUID: JKKiGfllZD2_ussQiLQ4z7XAqB4n7cc0
X-Authority-Analysis: v=2.4 cv=cpWbk04i c=1 sm=1 tr=0 ts=6815c2f5 cx=c_pps
 a=qKBjSQ1v91RyAK45QCPf5w==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=dt9VzEwgFbYA:10 a=EUspDBNiAAAA:8 a=lygNIV2IR02mpmLRnqcA:9 a=QEXdDO2ut3YA:10
 a=NFOGd7dJGGMPyQGDc5-O:22
X-Proofpoint-GUID: JKKiGfllZD2_ussQiLQ4z7XAqB4n7cc0
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNTAzMDA2MSBTYWx0ZWRfXzLHIhdz9KNL6
 IvIb87+OSCzEJdGhPl1IvPVII4fDJkpRZVzn7lVL5p7TNSEdR2fWIKRJj9F5vtRKhuYrgILUxnP
 Cy3mQSA/uXluQIneyradWfZLTInlXCqY7serxKc8+iu3tIdjUt88BvTjJnoz5czbUS2s2/e316p
 D9N4H8Lcb15Tzn3ZCnsNrFF9mBsKFuBQhUS1P4fJf/LX8346un920Q0RHfGNJ3UohCjaQEG3WLX
 2LArRzOEgEAfoZ1fz5B3R7ZPxE+Fg1FCD6FqcK36buZFqrc76Xcn0xywrnzUuiKNoV3Zg5rfmb6
 nRuzQJhIZ4tV5YnHmhxV3jsbkxs3vX4VsiP8GbKndITTTJSYYX+CepLrX2gbgw1sg3fsndFGzMx
 5A7fzzDezOCi8eD2b9yAK5nNCBjdm/K4fVhDtYdSfQ2ObTTB7nkWGIOvBlDGvINZ591MP9A6
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-05-03_03,2025-04-30_01,2025-02-21_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 mlxscore=0 spamscore=0 lowpriorityscore=0 phishscore=0 adultscore=0
 malwarescore=0 suspectscore=0 bulkscore=0 priorityscore=1501 mlxlogscore=999
 clxscore=1015 impostorscore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2504070000
 definitions=main-2505030061
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

The global workqueue is only used for vblanks inside KMS code. Move
allocation / flushing / deallcation of it to msm_kms.c

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
---
 drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c |  2 +-
 drivers/gpu/drm/msm/disp/mdp4/mdp4_crtc.c   |  2 +-
 drivers/gpu/drm/msm/disp/mdp5/mdp5_crtc.c   |  2 +-
 drivers/gpu/drm/msm/msm_drv.c               | 21 ++-------------------
 drivers/gpu/drm/msm/msm_drv.h               |  2 --
 drivers/gpu/drm/msm/msm_kms.c               | 11 +++++++++--
 drivers/gpu/drm/msm/msm_kms.h               |  8 ++++++++
 7 files changed, 22 insertions(+), 26 deletions(-)

diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c
index f9c46180b8f7ace9122e74015244334c1f13ef2b..1aaed1cd9ec58fed3230acda4c283f0eedf3a9f0 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c
@@ -980,7 +980,7 @@ static int dpu_encoder_resource_control(struct drm_encoder *drm_enc,
 			return 0;
 		}
 
-		queue_delayed_work(priv->wq, &dpu_enc->delayed_off_work,
+		queue_delayed_work(priv->kms->wq, &dpu_enc->delayed_off_work,
 				   msecs_to_jiffies(dpu_enc->idle_timeout));
 
 		trace_dpu_enc_rc(DRMID(drm_enc), sw_event,
diff --git a/drivers/gpu/drm/msm/disp/mdp4/mdp4_crtc.c b/drivers/gpu/drm/msm/disp/mdp4/mdp4_crtc.c
index b8610aa806eaeb540e76a6a17283faea6f482a99..5e1e62256c382426f70d21a5312fb40dda68d695 100644
--- a/drivers/gpu/drm/msm/disp/mdp4/mdp4_crtc.c
+++ b/drivers/gpu/drm/msm/disp/mdp4/mdp4_crtc.c
@@ -511,7 +511,7 @@ static void mdp4_crtc_vblank_irq(struct mdp_irq *irq, uint32_t irqstatus)
 
 	if (pending & PENDING_CURSOR) {
 		update_cursor(crtc);
-		drm_flip_work_commit(&mdp4_crtc->unref_cursor_work, priv->wq);
+		drm_flip_work_commit(&mdp4_crtc->unref_cursor_work, priv->kms->wq);
 	}
 }
 
diff --git a/drivers/gpu/drm/msm/disp/mdp5/mdp5_crtc.c b/drivers/gpu/drm/msm/disp/mdp5/mdp5_crtc.c
index 0f653e62b4a008e3bafe09ee7fb4399e1fccb722..fce2365753e22850e56521e82b9d9dca29c09280 100644
--- a/drivers/gpu/drm/msm/disp/mdp5/mdp5_crtc.c
+++ b/drivers/gpu/drm/msm/disp/mdp5/mdp5_crtc.c
@@ -1196,7 +1196,7 @@ static void mdp5_crtc_vblank_irq(struct mdp_irq *irq, uint32_t irqstatus)
 	}
 
 	if (pending & PENDING_CURSOR)
-		drm_flip_work_commit(&mdp5_crtc->unref_cursor_work, priv->wq);
+		drm_flip_work_commit(&mdp5_crtc->unref_cursor_work, priv->kms->wq);
 }
 
 static void mdp5_crtc_err_irq(struct mdp_irq *irq, uint32_t irqstatus)
diff --git a/drivers/gpu/drm/msm/msm_drv.c b/drivers/gpu/drm/msm/msm_drv.c
index f316e6776f672e7a97268f716040d0cf73256c4b..78cea9d4999488648b4131a2da425fb349d1b664 100644
--- a/drivers/gpu/drm/msm/msm_drv.c
+++ b/drivers/gpu/drm/msm/msm_drv.c
@@ -82,13 +82,6 @@ static int msm_drm_uninit(struct device *dev)
 			drm_atomic_helper_shutdown(ddev);
 	}
 
-	/* We must cancel and cleanup any pending vblank enable/disable
-	 * work before msm_irq_uninstall() to avoid work re-enabling an
-	 * irq after uninstall has disabled it.
-	 */
-
-	flush_workqueue(priv->wq);
-
 	msm_gem_shrinker_cleanup(ddev);
 
 	msm_perf_debugfs_cleanup(priv);
@@ -104,8 +97,6 @@ static int msm_drm_uninit(struct device *dev)
 	ddev->dev_private = NULL;
 	drm_dev_put(ddev);
 
-	destroy_workqueue(priv->wq);
-
 	return 0;
 }
 
@@ -227,12 +218,6 @@ static int msm_drm_init(struct device *dev, const struct drm_driver *drv)
 	ddev->dev_private = priv;
 	priv->dev = ddev;
 
-	priv->wq = alloc_ordered_workqueue("msm", 0);
-	if (!priv->wq) {
-		ret = -ENOMEM;
-		goto err_put_dev;
-	}
-
 	INIT_LIST_HEAD(&priv->objects);
 	mutex_init(&priv->obj_lock);
 
@@ -253,12 +238,12 @@ static int msm_drm_init(struct device *dev, const struct drm_driver *drv)
 	if (priv->kms_init) {
 		ret = drmm_mode_config_init(ddev);
 		if (ret)
-			goto err_destroy_wq;
+			goto err_put_dev;
 	}
 
 	ret = msm_init_vram(ddev);
 	if (ret)
-		goto err_destroy_wq;
+		goto err_put_dev;
 
 	dma_set_max_seg_size(dev, UINT_MAX);
 
@@ -304,8 +289,6 @@ static int msm_drm_init(struct device *dev, const struct drm_driver *drv)
 
 err_deinit_vram:
 	msm_deinit_vram(ddev);
-err_destroy_wq:
-	destroy_workqueue(priv->wq);
 err_put_dev:
 	drm_dev_put(ddev);
 
diff --git a/drivers/gpu/drm/msm/msm_drv.h b/drivers/gpu/drm/msm/msm_drv.h
index a65077855201746c37ee742364b61116565f3794..cc603bd4729e909e9381a3c277db262b13361de6 100644
--- a/drivers/gpu/drm/msm/msm_drv.h
+++ b/drivers/gpu/drm/msm/msm_drv.h
@@ -177,8 +177,6 @@ struct msm_drm_private {
 		struct mutex lock;
 	} lru;
 
-	struct workqueue_struct *wq;
-
 	unsigned int num_crtcs;
 
 	struct msm_drm_thread event_thread[MAX_CRTCS];
diff --git a/drivers/gpu/drm/msm/msm_kms.c b/drivers/gpu/drm/msm/msm_kms.c
index 35d5397e73b4c5cb90b1770e8570277e782be7ec..184a4503fef0deff7234a3ce332e0bf564fbce46 100644
--- a/drivers/gpu/drm/msm/msm_kms.c
+++ b/drivers/gpu/drm/msm/msm_kms.c
@@ -137,7 +137,7 @@ static int vblank_ctrl_queue_work(struct msm_drm_private *priv,
 	vbl_work->enable = enable;
 	vbl_work->priv = priv;
 
-	queue_work(priv->wq, &vbl_work->work);
+	queue_work(priv->kms->wq, &vbl_work->work);
 
 	return 0;
 }
@@ -227,6 +227,13 @@ void msm_drm_kms_uninit(struct device *dev)
 
 	BUG_ON(!kms);
 
+	/* We must cancel and cleanup any pending vblank enable/disable
+	 * work before msm_irq_uninstall() to avoid work re-enabling an
+	 * irq after uninstall has disabled it.
+	 */
+
+	flush_workqueue(kms->wq);
+
 	/* clean up event worker threads */
 	for (i = 0; i < priv->num_crtcs; i++) {
 		if (priv->event_thread[i].worker)
@@ -261,7 +268,7 @@ int msm_drm_kms_init(struct device *dev, const struct drm_driver *drv)
 	ret = priv->kms_init(ddev);
 	if (ret) {
 		DRM_DEV_ERROR(dev, "failed to load kms\n");
-		return ret;
+		goto err_msm_uninit;
 	}
 
 	/* Enable normalization of plane zpos */
diff --git a/drivers/gpu/drm/msm/msm_kms.h b/drivers/gpu/drm/msm/msm_kms.h
index 43b58d052ee6aae0ce34d09c88e1e1c34f9c52ef..e52649bbee7dc6a80abfecf7f8d5bcfad3d8f60b 100644
--- a/drivers/gpu/drm/msm/msm_kms.h
+++ b/drivers/gpu/drm/msm/msm_kms.h
@@ -153,6 +153,8 @@ struct msm_kms {
 	struct mutex commit_lock[MAX_CRTCS];
 	unsigned pending_crtc_mask;
 	struct msm_pending_timer pending_timers[MAX_CRTCS];
+
+	struct workqueue_struct *wq;
 };
 
 static inline int msm_kms_init(struct msm_kms *kms,
@@ -165,6 +167,10 @@ static inline int msm_kms_init(struct msm_kms *kms,
 
 	kms->funcs = funcs;
 
+	kms->wq = alloc_ordered_workqueue("msm", 0);
+	if (!kms->wq)
+		return -ENOMEM;
+
 	for (i = 0; i < ARRAY_SIZE(kms->pending_timers); i++) {
 		ret = msm_atomic_init_pending_timer(&kms->pending_timers[i], kms, i);
 		if (ret) {
@@ -181,6 +187,8 @@ static inline void msm_kms_destroy(struct msm_kms *kms)
 
 	for (i = 0; i < ARRAY_SIZE(kms->pending_timers); i++)
 		msm_atomic_destroy_pending_timer(&kms->pending_timers[i]);
+
+	destroy_workqueue(kms->wq);
 }
 
 #define for_each_crtc_mask(dev, crtc, crtc_mask) \

-- 
2.39.5

