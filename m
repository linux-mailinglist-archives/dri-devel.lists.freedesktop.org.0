Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 71846AA7F0E
	for <lists+dri-devel@lfdr.de>; Sat,  3 May 2025 09:17:17 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C784910E375;
	Sat,  3 May 2025 07:17:12 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="nLdV+a9l";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com
 [205.220.168.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C819B10E36B
 for <dri-devel@lists.freedesktop.org>; Sat,  3 May 2025 07:17:11 +0000 (UTC)
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 5434Ck8Z008672
 for <dri-devel@lists.freedesktop.org>; Sat, 3 May 2025 07:17:11 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 2XRxC+rcd4lvez8neQ9jCV1W0aJMb78tI+WpAHrRAYk=; b=nLdV+a9lAEhrHXPe
 Q9nhSZ4GwJdEzH0xbmoOqR+VsmGlYeUJQw3e95TpAfMkUwVukHBeyPqzgK+6Hep6
 DVkHpV1u5YOlFOyWlxEsqyYcNyuSlwbLnJCQBiykrf99R0pXlKPs7EhKhNA8kquF
 Eokmwikl5lM3TNoNmZdNgGakNQE/3Ha2ie0hZzMBiBE+9xA9XwnbNNDucSS4/cg3
 5ScIFT4iykt7w99qGk5L5VDdLlW2LfBFy+IE6tNdqykOJW7HRrAMgMLXWtua0P4g
 1nRwvXr0uC4pHsFpud0mNWcwTrPUJKGXA0zOIkirO02OMqhkdkE38Q8Gi7zCgdmn
 aV7qzg==
Received: from mail-qt1-f198.google.com (mail-qt1-f198.google.com
 [209.85.160.198])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 46dbwfg6bb-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
 for <dri-devel@lists.freedesktop.org>; Sat, 03 May 2025 07:17:11 +0000 (GMT)
Received: by mail-qt1-f198.google.com with SMTP id
 d75a77b69052e-4768f9fea35so71029171cf.2
 for <dri-devel@lists.freedesktop.org>; Sat, 03 May 2025 00:17:10 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1746256630; x=1746861430;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=2XRxC+rcd4lvez8neQ9jCV1W0aJMb78tI+WpAHrRAYk=;
 b=sENvlSMrEGFdPdqbXRagmWjyPspSTRS5VmAdNCmIOtI1l0peCZvksP+GWI13bPcQMb
 SOh1/jdv2T2WAoVWveNL1+4HQK1mAgl6NS5nqz5Tzyti6D97phUr/jDD89+gXEEvM027
 K1U0xJVWmqxKpH7EAQSGjnRPAiXfGS3ZN6elCdOElJ5A9S0J7tQZjQ4v7nLacTaeFw/g
 ZCzNRhq4Phjyojb/HLPJKczIODWQ3KxOD3HMg7FEt4a6S76tMoXYX21qPa5hA/kXNg6U
 nKXoE51fs0/+w1twsj1qUz0Y7X/j1GCm3i5csEG7DTlgC9hYQ0PipObrKOFaJnJOWz1G
 wliA==
X-Forwarded-Encrypted: i=1;
 AJvYcCXMWRCx0ZKYU6FVDr/Nd6deBatvijK64aOm5+b7TvLCi6ff3+WN4hUkznKEZJ8hf48RRK/B+XECFEQ=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yx4DqTX6pnP3rNa2bnO84BD1GWZ6Doq6H3Zo0SoMgR02jRLmSJw
 GFTp+TxQp2se7EjaiKtiPDKIC3OvGO+9VO66bYymgvHRVoxndXU39PjAFi764fd/xGyU0Wu+FrQ
 ha5ySoUpqVe+GMBYMgeXIz6Njs0Slo+Jwn/kIhuyy1rbJUir7xi0mrfRjqof6kphPuSc=
X-Gm-Gg: ASbGnctByz1Mi+bNXblgHI29NKoxXEvd8twVZRah9dFE1g9JXCzYN7OBKxNPO5jSRAY
 hRiZwXSivEVqpHerYytKqGR5hlq7hN4DKEMGCMZMP4dkaFsa2Z1hUSZiS/H//CcUC6Asvc6ysO1
 +binwonz7jC/Ky8a2Bqs7UeoPqZBMoT8uvwI6ZbVBRrfnEHxnfe9KpDbsXI/nC5cW60XlSVEDEk
 O5T91vscGDy89p5CF9kS5pZHOAsNTUBaHg5mczoALPZC6HwJVB2AIBf/xroWo+pJqxOUIRKPVDI
 KeSlqrnYMsxMdWQVE4z84fDvLyneZcUHq2ECkbZ/dkGLxedanTBPLJ0UAd+Le+RtVfZ/2inWYqZ
 /bDma6lqX3EgEsnTRc+er5I3o
X-Received: by 2002:a05:622a:1b21:b0:472:1aed:c8b4 with SMTP id
 d75a77b69052e-48e00f621cdmr1472281cf.34.1746256629861; 
 Sat, 03 May 2025 00:17:09 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEm0jFYRk4k9eoPqumXYa2PPwJCKZO+0EXUpA1YyKCnSe4V9HXyQYhK9M9D3KaH0j278whFHA==
X-Received: by 2002:a05:622a:1b21:b0:472:1aed:c8b4 with SMTP id
 d75a77b69052e-48e00f621cdmr1471971cf.34.1746256629495; 
 Sat, 03 May 2025 00:17:09 -0700 (PDT)
Received: from umbar.lan
 (2001-14ba-a0c3-3a00-264b-feff-fe8b-be8a.rev.dnainternet.fi.
 [2001:14ba:a0c3:3a00:264b:feff:fe8b:be8a])
 by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-54ea94c5557sm692816e87.84.2025.05.03.00.17.07
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 03 May 2025 00:17:08 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Date: Sat, 03 May 2025 10:17:01 +0300
Subject: [PATCH v2 02/11] drm/msm: move helper calls to msm_kms.c
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250503-msm-gpu-split-v2-2-1292cba0f5ad@oss.qualcomm.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=3518;
 i=dmitry.baryshkov@oss.qualcomm.com; h=from:subject:message-id;
 bh=AdrdjdzHPQQcBxZ5qmg59kaGK1b5+B2F6XfHvaKYS9k=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBoFcLtYTbd5OzodcUJUnhRC27sbJGt58qYgYGzq
 PktPPGoqoKJATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCaBXC7QAKCRCLPIo+Aiko
 1WTaCACkFesjPuDPmfjrkI3mXxI7MJlsZxMTfbupVgyVn8kuECSUdTvpyb2lvKN0QMPPqaQTGMI
 tYW8W+qJLW900BgRbT6SAxk8uzwHKoGgpygtcxF1zFzPLk8cmdBm9PTZOIqY+iRESHItwlJdc65
 06Pjaj64nLPcgspOxq/5Yy1kRBoq8P5x0fqA1VctfLyCpPTlFCDiuXGr2+LlsX0JJxQVW88FTP1
 jhcsCdBYXgpn7+SXLT4C2S8s4WA8nQujmklB+iMx/TllElINZEKtFXQfcNrgb+YflWqBe9gURn6
 Y0Eu9ReRVjJgW+0VJpej2ThHEp2O+oloMspMttM4k+lbcMYc
X-Developer-Key: i=dmitry.baryshkov@oss.qualcomm.com; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A
X-Proofpoint-ORIG-GUID: POJpfyJdF4SMp1GlE6tj0eXhHJRLLITx
X-Proofpoint-GUID: POJpfyJdF4SMp1GlE6tj0eXhHJRLLITx
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNTAzMDA2MSBTYWx0ZWRfX0hF695mg1bay
 yxTQdVmYTDVs/BO1mXsnlgODxxSmyLjMOnsy+ey9YCE/MXIEvyhbItqyIqQu/rT3JgF50/Z4yDu
 Oq6NROabYHgS7bgBbBrFvR8s3XL6JXtzGyACLLSow2Dk5FZLjJmimMRjOadlpN6LJlNsAja0niT
 nmr7iIo85ilNcYsXwzv3NzQLNF8pdueEz4KcdqtOWov69AL9ubCMSdAlaa5RRBx/CjzmjW90Vyv
 AECFYuxKTuCMzzlDNuDV1s2ORI70D9jhhtvwT3Kr3dSOVWA1hpoTb10pk9s8ny72s0uiECEIlys
 GnjKqxAiCFvlPpifmNNgV/26F/xdxJkl8+jJgEzk9nc2aXE4f4IuTffJingLN7O1afOTm93K9Yo
 vGpPXkbtze06mOCIkGUB/GnjZcBFh1JghpvvbSv3rCIpCcDFptPJqr/eBqQqr3+aHXg3Ffiv
X-Authority-Analysis: v=2.4 cv=AfqxH2XG c=1 sm=1 tr=0 ts=6815c2f7 cx=c_pps
 a=mPf7EqFMSY9/WdsSgAYMbA==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=dt9VzEwgFbYA:10 a=COk6AnOGAAAA:8 a=EUspDBNiAAAA:8 a=5yuRF9vT8A_X6ws8YtoA:9
 a=QEXdDO2ut3YA:10 a=dawVfQjAaf238kedN5IG:22 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-05-03_03,2025-04-30_01,2025-02-21_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 clxscore=1015 priorityscore=1501 phishscore=0 impostorscore=0
 mlxscore=0 adultscore=0 lowpriorityscore=0 suspectscore=0 mlxlogscore=999
 spamscore=0 bulkscore=0 classifier=spam authscore=0 authtc=n/a authcc=
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

Extract two more KMS-related codepieces to msm_kms.c, removing last
pieces of KMS code from msm_drv.c.

Reviewed-by: Abhinav Kumar <quic_abhinavk@quicinc.com>
Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
---
 drivers/gpu/drm/msm/msm_drv.c |  9 +++------
 drivers/gpu/drm/msm/msm_kms.c | 20 ++++++++++++++++++++
 drivers/gpu/drm/msm/msm_kms.h |  2 ++
 3 files changed, 25 insertions(+), 6 deletions(-)

diff --git a/drivers/gpu/drm/msm/msm_drv.c b/drivers/gpu/drm/msm/msm_drv.c
index 78cea9d4999488648b4131a2da425fb349d1b664..2c6997c85fbbc3767315ca3a166a99b322f1218a 100644
--- a/drivers/gpu/drm/msm/msm_drv.c
+++ b/drivers/gpu/drm/msm/msm_drv.c
@@ -11,7 +11,6 @@
 #include <linux/of_address.h>
 #include <linux/uaccess.h>
 
-#include <drm/clients/drm_client_setup.h>
 #include <drm/drm_drv.h>
 #include <drm/drm_file.h>
 #include <drm/drm_ioctl.h>
@@ -79,7 +78,7 @@ static int msm_drm_uninit(struct device *dev)
 	if (ddev->registered) {
 		drm_dev_unregister(ddev);
 		if (priv->kms)
-			drm_atomic_helper_shutdown(ddev);
+			msm_drm_kms_unregister(dev);
 	}
 
 	msm_gem_shrinker_cleanup(ddev);
@@ -275,10 +274,8 @@ static int msm_drm_init(struct device *dev, const struct drm_driver *drv)
 	if (ret)
 		goto err_msm_uninit;
 
-	if (priv->kms_init) {
-		drm_kms_helper_poll_init(ddev);
-		drm_client_setup(ddev, NULL);
-	}
+	if (priv->kms_init)
+		msm_drm_kms_post_init(dev);
 
 	return 0;
 
diff --git a/drivers/gpu/drm/msm/msm_kms.c b/drivers/gpu/drm/msm/msm_kms.c
index 184a4503fef0deff7234a3ce332e0bf564fbce46..49a56873100b2fdcded3eb6adcc7032bf404212c 100644
--- a/drivers/gpu/drm/msm/msm_kms.c
+++ b/drivers/gpu/drm/msm/msm_kms.c
@@ -13,6 +13,7 @@
 #include <drm/drm_drv.h>
 #include <drm/drm_mode_config.h>
 #include <drm/drm_vblank.h>
+#include <drm/clients/drm_client_setup.h>
 
 #include "disp/msm_disp_snapshot.h"
 #include "msm_drv.h"
@@ -217,6 +218,15 @@ struct msm_gem_address_space *msm_kms_init_aspace(struct drm_device *dev)
 	return aspace;
 }
 
+void msm_drm_kms_unregister(struct device *dev)
+{
+	struct platform_device *pdev = to_platform_device(dev);
+	struct msm_drm_private *priv = platform_get_drvdata(pdev);
+	struct drm_device *ddev = priv->dev;
+
+	drm_atomic_helper_shutdown(ddev);
+}
+
 void msm_drm_kms_uninit(struct device *dev)
 {
 	struct platform_device *pdev = to_platform_device(dev);
@@ -366,3 +376,13 @@ void msm_kms_shutdown(struct platform_device *pdev)
 	if (drm && drm->registered && priv->kms)
 		drm_atomic_helper_shutdown(drm);
 }
+
+void msm_drm_kms_post_init(struct device *dev)
+{
+	struct platform_device *pdev = to_platform_device(dev);
+	struct msm_drm_private *priv = platform_get_drvdata(pdev);
+	struct drm_device *ddev = priv->dev;
+
+	drm_kms_helper_poll_init(ddev);
+	drm_client_setup(ddev, NULL);
+}
diff --git a/drivers/gpu/drm/msm/msm_kms.h b/drivers/gpu/drm/msm/msm_kms.h
index e52649bbee7dc6a80abfecf7f8d5bcfad3d8f60b..26cbb662e7533fdfd55fb7f200b99c79c3fd3211 100644
--- a/drivers/gpu/drm/msm/msm_kms.h
+++ b/drivers/gpu/drm/msm/msm_kms.h
@@ -200,6 +200,8 @@ static inline void msm_kms_destroy(struct msm_kms *kms)
 		for_each_if (drm_crtc_mask(crtc) & (crtc_mask))
 
 int msm_drm_kms_init(struct device *dev, const struct drm_driver *drv);
+void msm_drm_kms_post_init(struct device *dev);
+void msm_drm_kms_unregister(struct device *dev);
 void msm_drm_kms_uninit(struct device *dev);
 
 #endif /* __MSM_KMS_H__ */

-- 
2.39.5

