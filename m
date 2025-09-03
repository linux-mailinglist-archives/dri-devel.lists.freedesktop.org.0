Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id BBBC5B41C3F
	for <lists+dri-devel@lfdr.de>; Wed,  3 Sep 2025 12:52:07 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EBEFD10E755;
	Wed,  3 Sep 2025 10:52:05 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="e6U74QPb";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com
 [205.220.168.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A5EE510E76C
 for <dri-devel@lists.freedesktop.org>; Wed,  3 Sep 2025 10:52:04 +0000 (UTC)
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 583AVXLf021861
 for <dri-devel@lists.freedesktop.org>; Wed, 3 Sep 2025 10:52:04 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 OwmE1FNHyvfTAhAmN4j1rp824OtCLZj2GOAqHhiwg4A=; b=e6U74QPb/N7zGnP6
 s+sxCMTohZzHnMvhKBWCdKwxmvW/SDpeKZGnK4VO5JfFiIfQa2YleN9/hqDoPtLl
 0B5SsETXDzYGzN+nSMmC53mJWDK9AEh7a6PCezm6mNT+ix3zDu5NFRROVuYEBsTY
 0DO2KD7bsPiLae0KI7Kq02d+Hnxn41JX5BZUJ+dCVaW9JTI4MO3duHeD3k3FADnY
 JkoMZ7/uiI9aYBApmN8aG9N32PUuLx7W2Y2/xX0sw4JQ5z2x/Sq/yCk75TvSQFXv
 Tv+Bvh9MlvzzLdqYt9JFuK5Ek7UtX0zXywJG/xz1TvRaKa/z1DsmLNO/B1SWBqvn
 CMlyBQ==
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com
 [209.85.222.199])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 48ur8s3dxn-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
 for <dri-devel@lists.freedesktop.org>; Wed, 03 Sep 2025 10:52:04 +0000 (GMT)
Received: by mail-qk1-f199.google.com with SMTP id
 af79cd13be357-80584b42d15so479967885a.3
 for <dri-devel@lists.freedesktop.org>; Wed, 03 Sep 2025 03:52:04 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1756896721; x=1757501521;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=OwmE1FNHyvfTAhAmN4j1rp824OtCLZj2GOAqHhiwg4A=;
 b=HQsociBg9rImFYjYUSeN/itXSzvPDuirEFsXCdoTJDSUCWBw/Qigm0FMTrU1a5uqwc
 BFikURFBs5bwCwXjm9/nR7Jiiriys8CNKYKbfmyM1N1BCUVkswpHh9JG69Ua7wbw33Ha
 pgXqCQOKhKFijS7NjiymnIBUrZyW45QaldI4ETjcaTXXF88Yf/OQSilvMkm8ZlQvWCkx
 D6bIlVA10zvjm06IcSX1Rx+ZbHqYX1q2SlWVjdyTousHZk8viQlsd7uCT5gp4/nw8jgp
 TsS4w4E71OhE3GO7DECEO38PQrvQ4dI3qHiLiJtXHfcuOJHAv74ejrePYUKN8NPa3YKN
 kVYw==
X-Forwarded-Encrypted: i=1;
 AJvYcCWNGYsGpzYhqt76558FKy6pZkWud1JY4nlcYI+u6d9jKvFZ2LJnBxp77AU3J34pfn7nAiGkwjLaOIE=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yz2cLMOBZZuN7yVt2wE3mCLG8Iu2zCMBIHTZPQg4y3mhpdIpdID
 VaJ2wKyg5SX+AfEdZxJKMzFxTDYkKN3VyFQOCoCDBs2n4MJ+Gl8gG08CwuuWq1QqVAcil/ZWn5/
 3tXyPMr+WeYmYIJeu0EW91mMCO1h8AImskDrtZsBt5WxcJRCKiRGWpCGyggV4KMmkbNIdWA0=
X-Gm-Gg: ASbGnct09WLRhEHo1ebeLxXmua8A9lFHw3GoL+fC6nVjX2i+dQ+Wn/0R5TdAY2nmia1
 MFCZgb6SGZgr/g07Gg9Xv9fLXrT2BUNi+CFxolqqDfkJan0SaNY2OVZLqkhQZY+H02qmPZKCL7/
 Z7pIvuIuYfCdjnJHRSqyUP0OAkmpWCL5c9uDe6qF7+2V1ckw0yeJa/z0hceUb6P/1y5rA75oWqR
 vFRkejeqtBGXM0Q2JzLdiNuME4xEagJ1PvVhL8ZH65l9OiUM19ta/+cOF3itR6+SeG+Mf/JHkJo
 P3SqqzLnPE6ytQ56piPgTDw7Isz570TwKzOyQ8y9vIUXLPuEmkhgmixhn5aipzjuhnKUOfiTF95
 q9tZWv2VOFZia6I5tMic5RsVtoirERrfkp4k4rwNWY0RLiTru+C5J
X-Received: by 2002:a05:6214:1245:b0:704:f7d8:7030 with SMTP id
 6a1803df08f44-70fac8e562fmr189977186d6.50.1756896721243; 
 Wed, 03 Sep 2025 03:52:01 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFz3YLnuQheLnctM3oOo4lxrx9NLlPPW3v2YzHyl9FZ5QeuhI/S48AL9YBg7OeJCK0FwoFezQ==
X-Received: by 2002:a05:6214:1245:b0:704:f7d8:7030 with SMTP id
 6a1803df08f44-70fac8e562fmr189976356d6.50.1756896720171; 
 Wed, 03 Sep 2025 03:52:00 -0700 (PDT)
Received: from umbar.lan
 (2001-14ba-a0c3-3a00-264b-feff-fe8b-be8a.rev.dnainternet.fi.
 [2001:14ba:a0c3:3a00:264b:feff:fe8b:be8a])
 by smtp.gmail.com with ESMTPSA id
 38308e7fff4ca-337f5032df6sm9373431fa.39.2025.09.03.03.51.59
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 03 Sep 2025 03:51:59 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Date: Wed, 03 Sep 2025 13:51:52 +0300
Subject: [PATCH v2 4/4] drm/msm/mdp4: use msm_kms_init_vm() instead of
 duplicating it
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250903-msm-no-iommu-v2-4-993016250104@oss.qualcomm.com>
References: <20250903-msm-no-iommu-v2-0-993016250104@oss.qualcomm.com>
In-Reply-To: <20250903-msm-no-iommu-v2-0-993016250104@oss.qualcomm.com>
To: Rob Clark <robin.clark@oss.qualcomm.com>,
 Dmitry Baryshkov <lumag@kernel.org>,
 Abhinav Kumar <abhinav.kumar@linux.dev>,
 Jessica Zhang <jessica.zhang@oss.qualcomm.com>,
 Sean Paul <sean@poorly.run>,
 Marijn Suijten <marijn.suijten@somainline.org>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Antonino Maniscalco <antomani103@gmail.com>,
 Konrad Dybcio <konradybcio@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
 freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=5112;
 i=dmitry.baryshkov@oss.qualcomm.com; h=from:subject:message-id;
 bh=AgKTuTphksgFdjbRBscbGOKdDdsPzucjkQBsXfU1L0U=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBouB3Hyns3bJmUAeJWzCRLgAN6ruv2VcZVu6b1W
 St6rwyfI9mJATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCaLgdxwAKCRCLPIo+Aiko
 1ZmICACBatdifNHq+RNnmtvLJqxuWiOBZ0gmol+G/G31x1B9tK7hwPbFI/ZneQuj9aQuFtTQt68
 r+Is4bOuwuS53H25Zj9SIWKWFbUgwvg23l117x+Se9C8FYpg/Vi8y9aYRzMYNfrHamGQcqxH8Qp
 XMyRMpe2S9c+V1fRmxXb/4wlAceycYENzRnheqQu8mqxmDPDxA5Y85trDxynmALGTXpvoAOtSRf
 GCPGbkOUUM4fDSbNtVJW1sH21f5S1BELVF4oVChcnBrV1etTzBO82HkD5YpzdmNrOC3WDe6akkH
 wp6m+DF960c+UGTRu5NK+u5kbu09PuQjrEtaBqJPKMBNoGPU
X-Developer-Key: i=dmitry.baryshkov@oss.qualcomm.com; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwODMwMDAxOSBTYWx0ZWRfX745Xhbv0bV4A
 cYdhx8E/kL2uh/Vcew8DixEX5ROAIxDW9Jfx837oTVYjqfUXJ3e0u724k+ie3NHKYLNjwini+Oc
 MD81DClChIhlzHtpWs8HnOWiMBqEz3B+6Mf4Mn+SveUr1v5+KLjMgRIv3qIW9kRW3LJA/8NWabC
 PND0Ni7d4vbDjBQ/0M+6WAPeMifd5kM3ULHL8o/HOfgJznxS4BSJ2RQHbVYvx2ogRwnLg+uIYyE
 SLMSefiHBw9UtxIJK19D+WzXbr+l2PuG/Y5jG+0ZhNZDZiEM0pbq+dNXeARvejAbW5YG5ZopAat
 aTw1yufF0v+E1uuDKYZ/Gm4tNggjYclYk0twIeEc45+Jakv8QxT6jk/gQsDE/MxjVWI3ZaR/2wq
 Q5wVsucg
X-Proofpoint-GUID: JX2MYLlS6scqjSTfVQ9upHgsd4t_C2-H
X-Proofpoint-ORIG-GUID: JX2MYLlS6scqjSTfVQ9upHgsd4t_C2-H
X-Authority-Analysis: v=2.4 cv=PNkP+eqC c=1 sm=1 tr=0 ts=68b81dd4 cx=c_pps
 a=HLyN3IcIa5EE8TELMZ618Q==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=yJojWOMRYYMA:10 a=EUspDBNiAAAA:8 a=gwGsY3v9svKR4hS8clgA:9
 a=+jEqtf1s3R9VXZ0wqowq2kgwd+I=:19 a=QEXdDO2ut3YA:10 a=bTQJ7kPSJx9SKPbeHEYW:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1117,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-09-03_06,2025-08-28_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 bulkscore=0 priorityscore=1501 impostorscore=0 clxscore=1015
 suspectscore=0 adultscore=0 phishscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2507300000 definitions=main-2508300019
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

Use the msm_kms_init_vm() function to allocate memory manager instead of
hand-coding a copy of it. Although MDP4 platforms don't have MDSS
device, it's still safe to use the function as all MDP4 devices have
IOMMU and the parent of the MDP4 is the root SoC device.

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
---
 drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c  |  2 +-
 drivers/gpu/drm/msm/disp/mdp4/mdp4_kms.c | 27 ++++-----------------------
 drivers/gpu/drm/msm/disp/mdp5/mdp5_kms.c |  2 +-
 drivers/gpu/drm/msm/msm_drv.h            |  2 +-
 drivers/gpu/drm/msm/msm_kms.c            |  5 ++---
 5 files changed, 9 insertions(+), 29 deletions(-)

diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c
index a306077647c317af9345eeff13082230906b5767..4e5a8ecd31f7570beb45fd1629a131e70aaefea8 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c
@@ -1110,7 +1110,7 @@ static int _dpu_kms_mmu_init(struct dpu_kms *dpu_kms)
 {
 	struct drm_gpuvm *vm;
 
-	vm = msm_kms_init_vm(dpu_kms->dev);
+	vm = msm_kms_init_vm(dpu_kms->dev, dpu_kms->dev->dev->parent);
 	if (IS_ERR(vm))
 		return PTR_ERR(vm);
 
diff --git a/drivers/gpu/drm/msm/disp/mdp4/mdp4_kms.c b/drivers/gpu/drm/msm/disp/mdp4/mdp4_kms.c
index 66bfa96965be275270751cba770521cfde2a7004..1d2a1e4f6ce7d02516b9497a494bb1e46297f55a 100644
--- a/drivers/gpu/drm/msm/disp/mdp4/mdp4_kms.c
+++ b/drivers/gpu/drm/msm/disp/mdp4/mdp4_kms.c
@@ -391,11 +391,9 @@ static void read_mdp_hw_revision(struct mdp4_kms *mdp4_kms,
 
 static int mdp4_kms_init(struct drm_device *dev)
 {
-	struct platform_device *pdev = to_platform_device(dev->dev);
 	struct msm_drm_private *priv = dev->dev_private;
 	struct mdp4_kms *mdp4_kms = to_mdp4_kms(to_mdp_kms(priv->kms));
 	struct msm_kms *kms = NULL;
-	struct msm_mmu *mmu;
 	struct drm_gpuvm *vm;
 	int ret;
 	u32 major, minor;
@@ -458,30 +456,13 @@ static int mdp4_kms_init(struct drm_device *dev)
 	mdp4_disable(mdp4_kms);
 	mdelay(16);
 
-	if (!device_iommu_mapped(&pdev->dev)) {
-		DRM_DEV_INFO(dev->dev, "no IOMMU, bailing out\n");
-		ret = -ENODEV;
+	vm = msm_kms_init_vm(mdp4_kms->dev, NULL);
+	if (IS_ERR(vm)) {
+		ret = PTR_ERR(vm);
 		goto fail;
 	}
 
-	mmu = msm_iommu_new(&pdev->dev, 0);
-	if (IS_ERR(mmu)) {
-		ret = PTR_ERR(mmu);
-		goto fail;
-	} else {
-		vm  = msm_gem_vm_create(dev, mmu, "mdp4",
-					0x1000, 0x100000000 - 0x1000,
-					true);
-
-		if (IS_ERR(vm)) {
-			if (!IS_ERR(mmu))
-				mmu->funcs->destroy(mmu);
-			ret = PTR_ERR(vm);
-			goto fail;
-		}
-
-		kms->vm = vm;
-	}
+	kms->vm = vm;
 
 	ret = modeset_init(mdp4_kms);
 	if (ret) {
diff --git a/drivers/gpu/drm/msm/disp/mdp5/mdp5_kms.c b/drivers/gpu/drm/msm/disp/mdp5/mdp5_kms.c
index 5b6ca8dd929e1870b7228af93da03886524f5f20..61edf6864092664afe474cc8d1fd097ca495ebb8 100644
--- a/drivers/gpu/drm/msm/disp/mdp5/mdp5_kms.c
+++ b/drivers/gpu/drm/msm/disp/mdp5/mdp5_kms.c
@@ -534,7 +534,7 @@ static int mdp5_kms_init(struct drm_device *dev)
 	}
 	mdelay(16);
 
-	vm = msm_kms_init_vm(mdp5_kms->dev);
+	vm = msm_kms_init_vm(mdp5_kms->dev, pdev->dev.parent);
 	if (IS_ERR(vm)) {
 		ret = PTR_ERR(vm);
 		goto fail;
diff --git a/drivers/gpu/drm/msm/msm_drv.h b/drivers/gpu/drm/msm/msm_drv.h
index 9875ca62e9adb12dca9bcc74e2825b0364372a54..f4c20dc91cc600d8ab72bce002cbe6b9fdf9a720 100644
--- a/drivers/gpu/drm/msm/msm_drv.h
+++ b/drivers/gpu/drm/msm/msm_drv.h
@@ -229,7 +229,7 @@ void msm_crtc_disable_vblank(struct drm_crtc *crtc);
 int msm_register_mmu(struct drm_device *dev, struct msm_mmu *mmu);
 void msm_unregister_mmu(struct drm_device *dev, struct msm_mmu *mmu);
 
-struct drm_gpuvm *msm_kms_init_vm(struct drm_device *dev);
+struct drm_gpuvm *msm_kms_init_vm(struct drm_device *dev, struct device *mdss_dev);
 bool msm_use_mmu(struct drm_device *dev);
 
 int msm_ioctl_gem_submit(struct drm_device *dev, void *data,
diff --git a/drivers/gpu/drm/msm/msm_kms.c b/drivers/gpu/drm/msm/msm_kms.c
index 725367157d90e45854cb8a22ea25a3fa3bb218be..6e5e94f5c9a7474d014e73b0b7bd06a94939ed1e 100644
--- a/drivers/gpu/drm/msm/msm_kms.c
+++ b/drivers/gpu/drm/msm/msm_kms.c
@@ -177,12 +177,11 @@ static int msm_kms_fault_handler(void *arg, unsigned long iova, int flags, void
 	return -ENOSYS;
 }
 
-struct drm_gpuvm *msm_kms_init_vm(struct drm_device *dev)
+struct drm_gpuvm *msm_kms_init_vm(struct drm_device *dev, struct device *mdss_dev)
 {
 	struct drm_gpuvm *vm;
 	struct msm_mmu *mmu;
 	struct device *mdp_dev = dev->dev;
-	struct device *mdss_dev = mdp_dev->parent;
 	struct msm_drm_private *priv = dev->dev_private;
 	struct msm_kms *kms = priv->kms;
 	struct device *iommu_dev;
@@ -193,7 +192,7 @@ struct drm_gpuvm *msm_kms_init_vm(struct drm_device *dev)
 	 */
 	if (device_iommu_mapped(mdp_dev))
 		iommu_dev = mdp_dev;
-	else if (device_iommu_mapped(mdss_dev))
+	else if (mdss_dev && device_iommu_mapped(mdss_dev))
 		iommu_dev = mdss_dev;
 	else {
 		drm_info(dev, "no IOMMU, bailing out\n");

-- 
2.47.2

