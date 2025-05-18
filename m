Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 04E3DABAF75
	for <lists+dri-devel@lfdr.de>; Sun, 18 May 2025 12:55:35 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 17B4B10E2A0;
	Sun, 18 May 2025 10:55:32 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="nahe8YxR";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com
 [205.220.180.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E297910E29D
 for <dri-devel@lists.freedesktop.org>; Sun, 18 May 2025 10:55:29 +0000 (UTC)
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 54I6Gnba011978
 for <dri-devel@lists.freedesktop.org>; Sun, 18 May 2025 10:55:29 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 2XRxC+rcd4lvez8neQ9jCV1W0aJMb78tI+WpAHrRAYk=; b=nahe8YxRHW5xg9PY
 dXbIVB/TrD8zdCizJb8GHcupO550BKaGOv8QR3LQzTXbmj5omcdhp4FHBySECvkF
 lzkFQIK3B1YnxBW2v0kuFheHrpmH4/3G0OtTNl6+8LVxnuA2VB7uxifRjEJ/EUPn
 m9XuvYzU2O5XCfwArnxbCodmFsbBnuCkSxUq/EOhOrcmlWTUg1aFTx4h8adrBLZX
 JZycjE7CamaZurPG2gGMsdyociQjb77zX3LArgiQyvzgo7BxjeDizFkos4IWJBAs
 ZdnpDz6AfmYf9wwdaybR+FX413ik3Z5ye+s21yQ7esJjFq2ptA0EKVgBbHMZLS92
 /gDnXw==
Received: from mail-qt1-f199.google.com (mail-qt1-f199.google.com
 [209.85.160.199])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 46pjmesv1r-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
 for <dri-devel@lists.freedesktop.org>; Sun, 18 May 2025 10:55:28 +0000 (GMT)
Received: by mail-qt1-f199.google.com with SMTP id
 d75a77b69052e-478f78ff9beso113993471cf.1
 for <dri-devel@lists.freedesktop.org>; Sun, 18 May 2025 03:55:28 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1747565728; x=1748170528;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=2XRxC+rcd4lvez8neQ9jCV1W0aJMb78tI+WpAHrRAYk=;
 b=iM4lkq/lzJWM1lkkYnSF+7c1cP84ZPLvWOiDobtKPOHpTId7zbmYUW2c6l3h+vYrFE
 NL7Pp3rv6ELKwE+i/Dj9DnW9e82dDscPtmp4J3UqAZBCwC0/FcQFsNg0LkO5v+YzCh2K
 YKxkpRk0+1vT1mlmX7/ACVToT7vYudvYofyU3cbu9ev5X7iawnDt4kKj01mPcJoL3wRF
 wqUzuNq+gjWPYwq1aexXvUYm0vYDNYG9k5h/ovLh5q2z4Z0jsxzWki4VMn2c9V3B7EhB
 mmIg9DTAZY73/fKGoT5kpfTfRdyCj+bJ5EQdG2AzNgGPhsOvUBONFQpVsgo4bIGjJiX8
 JNGw==
X-Forwarded-Encrypted: i=1;
 AJvYcCXEXIpEkAH5x0bg6Zxu8EIv8Epahattx3Nt2ASy0m95u81VdJ5kf8PyuAIzNsgGqvKrSLyMsz4QaSc=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yyl6MUOLoNRkrNWgTLayC9dFRwJJ7/5uKdrjxEdDUIKvj0iPeIX
 /OxC+Zs19eYPBy7b4bJ6ihzRPhAO3XhI+ANVDAr/RJrw2Og1YOB8pkr4HTZOUH6xvOJPHNHND0m
 vSPln6u27B6+FewcGnGNovyxquUTqo1wxzqyMa861mNmh0JePhpZbu5jHNS4I3oh5WLs+/ws=
X-Gm-Gg: ASbGncuzE//XgnQJZHOuWxuFY4bBe5R9ZIi+R+V9cD2ZEWpRYzoqte5R3lxQVMRMH3t
 y1fEsdwC9NFrkrAvRn49hLL/xeug0rtrB1qxSnIhlsNfCottZcZ1YO1lqmZD65FECaRhie6pL1O
 wJ/IkZ3LGT0b+v6nqliGDv9btnwgkdi3m492ylXpZoDd7KLxPRA78YmVfH6mhgTX9z2GOXQ1CeR
 JxQ+UNFvPWwuyzDO1i/PYb1F7riJgcvshCRyEHrxGfMx9ewQP1ajCP2FjeOJYWchoe7yl/ojJzP
 WeCD7nA54CMikSzQ2gbkvQH5E9zfVUERSjIcCKTfxk2PsHk8XqSR0qHkgNTPZ5Hil8s+LP1pr8d
 ksqNkRuNeKN0DAbdr/xQNQ5vl
X-Received: by 2002:a05:6214:260e:b0:6e8:f470:2b11 with SMTP id
 6a1803df08f44-6f8b2c95b78mr153800236d6.23.1747565728067; 
 Sun, 18 May 2025 03:55:28 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGfwzLMkmBkdbwjFViOIMLrKHJUrUiuLpJ8M0qtJYTrZeZHRoKtHam4c0qJtlboNh/7FpPSgA==
X-Received: by 2002:a05:6214:260e:b0:6e8:f470:2b11 with SMTP id
 6a1803df08f44-6f8b2c95b78mr153799976d6.23.1747565727641; 
 Sun, 18 May 2025 03:55:27 -0700 (PDT)
Received: from umbar.lan
 (2001-14ba-a0c3-3a00-264b-feff-fe8b-be8a.rev.dnainternet.fi.
 [2001:14ba:a0c3:3a00:264b:feff:fe8b:be8a])
 by smtp.gmail.com with ESMTPSA id
 38308e7fff4ca-328085cf8ccsm14314451fa.99.2025.05.18.03.55.26
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 18 May 2025 03:55:26 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Date: Sun, 18 May 2025 13:55:20 +0300
Subject: [PATCH v3 02/11] drm/msm: move helper calls to msm_kms.c
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250518-msm-gpu-split-v3-2-0e91e8e77023@oss.qualcomm.com>
References: <20250518-msm-gpu-split-v3-0-0e91e8e77023@oss.qualcomm.com>
In-Reply-To: <20250518-msm-gpu-split-v3-0-0e91e8e77023@oss.qualcomm.com>
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
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBoKbyZDa8XSHH8mycqheTvtaIQ9DTALExlx1ErQ
 VrWxLqtNBOJATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCaCm8mQAKCRCLPIo+Aiko
 1bufB/9xNZEFnQ3iUAr5/qfQECmudD+538OkFFnwxzChSUqhOVDUvBNMhKH9eMIKYqXiLTyXbnr
 NXQh5FdSYae51nMVEfLiy/HVdJJ9kUtpxF3iB2aV3dhMYiGvIppuxe3QrXX77Cd+d2ovZNCtf6E
 O9qjdbopuZWbMr/1dE2f7aNOJPsTb6Ofl6L6pNnLTRIiHSQ9mpVLM5q9qumb21edQiWxtqKlWwc
 C/TuIQ5Uk1moxvvnCTasRV44BeM5UGg4oIz+NJHjU6iUTSKi0pKXvp/sw9SS9AHQ+owMLqmNsOa
 spGY/zt8ns9QKuPTUuDuYflG4mXrcFZgMMKdfreD94+z+NXL
X-Developer-Key: i=dmitry.baryshkov@oss.qualcomm.com; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A
X-Authority-Analysis: v=2.4 cv=RoDFLDmK c=1 sm=1 tr=0 ts=6829bca0 cx=c_pps
 a=WeENfcodrlLV9YRTxbY/uA==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=dt9VzEwgFbYA:10 a=COk6AnOGAAAA:8 a=EUspDBNiAAAA:8 a=5yuRF9vT8A_X6ws8YtoA:9
 a=QEXdDO2ut3YA:10 a=kacYvNCVWA4VmyqE58fU:22 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-ORIG-GUID: jVI8A0WNgJe9uc1-FJoaR32iThYrIpDI
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNTE4MDEwNCBTYWx0ZWRfX9nwWvtXTC4s1
 t30wPw2T9SUFWEJQ4JEPSqR+kIzRyKgAWmNQei0yuDB3FMY81kOWrEt+9umo9Z+9Tlu7OKn3yDA
 AFKl9uCg8CH+YPC1MqpaKdBHGHvxgFo9iL1t0gkC9KUsfYgRY/tWTEeIFCoOidndvr4AU4HN7Ml
 IBl33cirph1I3ohI03oBcHyOwGq39y+euYEbYtSpbkyQsqZOdmMDp4Ky4YgG6GLygWx+k9MSfkZ
 0uqhyywrva91cRZwkQFOZvO6mr/hGQLRmyL38wKpR7+U0S93qyC6YG4htq+3x8UzPONXDW8MOD3
 S4vEu2+mpFr21uMjvxwSu1HXPkov+THURjRUSJq4+CZmo3qzvlELCfhyOD70upI5G4R242r7nAl
 /Fa3Jd1AloTW0tRNjlzkYcTo4nFYQnTlznhOA+6R7gx6iGJG3D8V1j1FUh4nW9c1bOTExdAt
X-Proofpoint-GUID: jVI8A0WNgJe9uc1-FJoaR32iThYrIpDI
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-05-18_05,2025-05-16_03,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 impostorscore=0 malwarescore=0 adultscore=0 lowpriorityscore=0
 clxscore=1015 bulkscore=0 priorityscore=1501 mlxscore=0 mlxlogscore=999
 phishscore=0 spamscore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2505070000
 definitions=main-2505180104
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

