Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D2D94AED06F
	for <lists+dri-devel@lfdr.de>; Sun, 29 Jun 2025 22:16:48 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C0C4C10E367;
	Sun, 29 Jun 2025 20:16:46 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="Q7ALFKfM";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com
 [205.220.180.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 00FFD10E369
 for <dri-devel@lists.freedesktop.org>; Sun, 29 Jun 2025 20:16:42 +0000 (UTC)
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 55TJaqme029289
 for <dri-devel@lists.freedesktop.org>; Sun, 29 Jun 2025 20:16:42 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:date:from:in-reply-to:message-id
 :mime-version:references:subject:to; s=qcppdkim1; bh=F07tE0vJpnj
 OaneIx6xxhc1GKaxYebaabLke4Ul+Piw=; b=Q7ALFKfMm4jtxOyMHeY5EvUsq9l
 61NeJT5RolmYbyHuoiatb8eVQF2oSjXO4pFTJAJuyb4/9Oa8Xy26VyJMLyqOc0wc
 NoeaixiziPKm/tDFHfcGmG0Dl3lgsi+yTz49pgmSpKB3nSRWCDgSBJNLlbcBtjbt
 qGDsnIvnooFT2Dvh2GlBUjCepQE1jD//ALAcLEmnYZHkfOP75uioT9764trMl5Tx
 34cevQHLeC/j6WGXQrWAwVPmMa5IQNUfXYIqPlKkOcLh3fe6Quc0Bm7nqjPGv5yw
 3P06RIHL1OSeZTTTLE/hpHkLdAlw3TtaU22dTkb3IZRXNQHkvB3hMgo5zxg==
Received: from mail-pg1-f198.google.com (mail-pg1-f198.google.com
 [209.85.215.198])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 47j7qm2msy-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
 for <dri-devel@lists.freedesktop.org>; Sun, 29 Jun 2025 20:16:42 +0000 (GMT)
Received: by mail-pg1-f198.google.com with SMTP id
 41be03b00d2f7-b31814efd1cso2882138a12.3
 for <dri-devel@lists.freedesktop.org>; Sun, 29 Jun 2025 13:16:41 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1751228200; x=1751833000;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=F07tE0vJpnjOaneIx6xxhc1GKaxYebaabLke4Ul+Piw=;
 b=qJAbUJAmaLPNK+0dU/PdmYHBeVIc9w6DDTAwCMP4MtQbyc/TZeuOZwqhbP1TYyuVPi
 SLp0QsPPn5HgPJLqSJnGWhBG3EfbEhIQyNBibxOseKxZnpTpn2OSR5No/LuoYk7si1hs
 u8AT3KWrOQzCdK9kh1VZ4cwsaWbyxIBDpnNrrnvvlL6v+gHTqJpP4TqC4CI1hIL7q99x
 I2HUx08t5WIzP27n67KvQ9K/vOM2tdAKxHSxB+1rL3zjemlgCwW3BDTD++F1ibIVcBA/
 lmTgG4dmfxXLRLMkeO4/1GFj/D6bE6J9zCjmQoKSNEyP3ryHXySUI6YnAsZLJlOHLypg
 Z7Mg==
X-Gm-Message-State: AOJu0YyMJuZ1f1ITDkrnicjsJ/QenU3NJVQLS6M8hU2MPK4ubOy6Bope
 VxLny34MWVNAMvPPEPUDsP2grH9xPQs3tYeUAKTK/czT5Kxjt5vtvIMUojHzRMFSeTUkR46Smcf
 4aJ61W8ajhSrac5UwWDWJYf4XeXGg4tuo0MDm61uGVNaQkC2turIO2Kwg3ICpux7FvEcBbzxfe4
 BMtAY=
X-Gm-Gg: ASbGnctqNDrQYYMolvRo+ci22ZLY6nvyeC0ePdfv0tXXlZSa5cSTN6ljTAfpQNIHDg9
 ZmKtD+yZxz6jPA0q/g2qnb8H3yHpjhXDyACud6Jdqk745YoBd0XGnbTiDGWvEI6zs1G5u/Q+Jkc
 gUwY/hqkrFsLSlQVspqltjaEG3HHo4aJDsqpACyKVXflxTDx7EHn/+ivYXjHVNx1fV40Wx/1J84
 3HiFcaXCweOUJ69teyMWgvhfVF09g/ipPs7Tj1Qr1CgQ0dF7z0P7+8EM1EKAwtvqrCr/8HJSla2
 /txrRGhf11YFu5ON5UJvCOJQEcAyIgqAGw==
X-Received: by 2002:a05:6a21:329c:b0:220:7994:1df1 with SMTP id
 adf61e73a8af0-220a16e46d5mr18754430637.31.1751228200535; 
 Sun, 29 Jun 2025 13:16:40 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEELqQu+0TYmCQ+TNpM1MfGezE3TlblWt0dkgODaaYVhQOuwJeIcM6JHGprl9661zvuA9IyEQ==
X-Received: by 2002:a05:6a21:329c:b0:220:7994:1df1 with SMTP id
 adf61e73a8af0-220a16e46d5mr18754407637.31.1751228200109; 
 Sun, 29 Jun 2025 13:16:40 -0700 (PDT)
Received: from localhost ([2601:1c0:5000:d5c:5b3e:de60:4fda:e7b1])
 by smtp.gmail.com with ESMTPSA id
 41be03b00d2f7-b34e300d808sm6372068a12.14.2025.06.29.13.16.39
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 29 Jun 2025 13:16:39 -0700 (PDT)
From: Rob Clark <robin.clark@oss.qualcomm.com>
To: dri-devel@lists.freedesktop.org
Cc: linux-arm-msm@vger.kernel.org, freedreno@lists.freedesktop.org,
 Connor Abbott <cwabbott0@gmail.com>,
 Antonino Maniscalco <antomani103@gmail.com>,
 Danilo Krummrich <dakr@redhat.com>, Rob Clark <robdclark@chromium.org>,
 Rob Clark <robin.clark@oss.qualcomm.com>,
 Dmitry Baryshkov <lumag@kernel.org>,
 Abhinav Kumar <abhinav.kumar@linux.dev>,
 Jessica Zhang <jessica.zhang@oss.qualcomm.com>,
 Sean Paul <sean@poorly.run>,
 Marijn Suijten <marijn.suijten@somainline.org>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 linux-kernel@vger.kernel.org (open list)
Subject: [PATCH v9 16/42] drm/msm: Split out helper to get iommu prot flags
Date: Sun, 29 Jun 2025 13:12:59 -0700
Message-ID: <20250629201530.25775-17-robin.clark@oss.qualcomm.com>
X-Mailer: git-send-email 2.50.0
In-Reply-To: <20250629201530.25775-1-robin.clark@oss.qualcomm.com>
References: <20250629201530.25775-1-robin.clark@oss.qualcomm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Authority-Analysis: v=2.4 cv=C4TpyRP+ c=1 sm=1 tr=0 ts=68619f2a cx=c_pps
 a=Qgeoaf8Lrialg5Z894R3/Q==:117 a=xqWC_Br6kY4A:10 a=6IFa9wvqVegA:10
 a=cm27Pg_UAAAA:8 a=EUspDBNiAAAA:8 a=pGLkceISAAAA:8 a=8Ft5guHMEotweHOT_P0A:9
 a=x9snwWr2DeNwDh03kgHS:22
X-Proofpoint-ORIG-GUID: g1VaaLlw23-RibZtS591gwqtA2uJ6Tyb
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNjI5MDE3MiBTYWx0ZWRfXxZZHXHgirYe5
 DrC4gco2v80FTUrk84KlGrcs+wdieFMaxwIjAbhP2V83XuDVGOdQnPEhcUe54Nn6/KWbDgc0nBs
 5hnklpp0NjRvapp91WIqkS3u5iOBDBXrzXqQJxzBunbSwyDSODAlOxrG3RLL/saQ1qr0V3rh+fm
 JJbEbeU/YcmLOqfZff3vw8yoLAIWwbvFeU4EAdI4OAoe58lBOYD3mV0ke+EkYNVzVH9eYpybRHp
 K9gbWb6z3T997q6Xxp6f+7J1N69u0e1WmZarMD0CMwD3hCjFxY8xC1nbYZ81bfRBgn3Ki3LvSB7
 a1HDeW9D9XtEMwV1N5iO1gJlTd2yeIlJNRYaNn4xGJkS+riT8UhHlNxxvY5QQnKmdxs2slURDid
 B3tgKZx4X6zTv5XH43Muz5Not/mT4UJAKYxMNZWfnxkyfTNCankynOGQRNcBTQJ0MjwrNDCA
X-Proofpoint-GUID: g1VaaLlw23-RibZtS591gwqtA2uJ6Tyb
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.7,FMLib:17.12.80.40
 definitions=2025-06-27_05,2025-06-27_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 phishscore=0 suspectscore=0 bulkscore=0 lowpriorityscore=0
 clxscore=1015 priorityscore=1501 spamscore=0 mlxscore=0 mlxlogscore=999
 adultscore=0 malwarescore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2505280000
 definitions=main-2506290172
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

From: Rob Clark <robdclark@chromium.org>

We'll re-use this in the vm_bind path.

Signed-off-by: Rob Clark <robdclark@chromium.org>
Signed-off-by: Rob Clark <robin.clark@oss.qualcomm.com>
Tested-by: Antonino Maniscalco <antomani103@gmail.com>
Reviewed-by: Antonino Maniscalco <antomani103@gmail.com>
---
 drivers/gpu/drm/msm/msm_gem.c | 12 ++++++++++--
 drivers/gpu/drm/msm/msm_gem.h |  1 +
 2 files changed, 11 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/msm/msm_gem.c b/drivers/gpu/drm/msm/msm_gem.c
index 763bafcff4cc..20d5e4b4d057 100644
--- a/drivers/gpu/drm/msm/msm_gem.c
+++ b/drivers/gpu/drm/msm/msm_gem.c
@@ -462,10 +462,9 @@ static struct drm_gpuva *get_vma_locked(struct drm_gem_object *obj,
 	return vma;
 }
 
-int msm_gem_pin_vma_locked(struct drm_gem_object *obj, struct drm_gpuva *vma)
+int msm_gem_prot(struct drm_gem_object *obj)
 {
 	struct msm_gem_object *msm_obj = to_msm_bo(obj);
-	struct page **pages;
 	int prot = IOMMU_READ;
 
 	if (!(msm_obj->flags & MSM_BO_GPU_READONLY))
@@ -477,6 +476,15 @@ int msm_gem_pin_vma_locked(struct drm_gem_object *obj, struct drm_gpuva *vma)
 	if (msm_obj->flags & MSM_BO_CACHED_COHERENT)
 		prot |= IOMMU_CACHE;
 
+	return prot;
+}
+
+int msm_gem_pin_vma_locked(struct drm_gem_object *obj, struct drm_gpuva *vma)
+{
+	struct msm_gem_object *msm_obj = to_msm_bo(obj);
+	struct page **pages;
+	int prot = msm_gem_prot(obj);
+
 	msm_gem_assert_locked(obj);
 
 	pages = msm_gem_get_pages_locked(obj, MSM_MADV_WILLNEED);
diff --git a/drivers/gpu/drm/msm/msm_gem.h b/drivers/gpu/drm/msm/msm_gem.h
index 892e4132fa72..a18872ab1393 100644
--- a/drivers/gpu/drm/msm/msm_gem.h
+++ b/drivers/gpu/drm/msm/msm_gem.h
@@ -158,6 +158,7 @@ struct msm_gem_object {
 #define to_msm_bo(x) container_of(x, struct msm_gem_object, base)
 
 uint64_t msm_gem_mmap_offset(struct drm_gem_object *obj);
+int msm_gem_prot(struct drm_gem_object *obj);
 int msm_gem_pin_vma_locked(struct drm_gem_object *obj, struct drm_gpuva *vma);
 void msm_gem_unpin_locked(struct drm_gem_object *obj);
 void msm_gem_unpin_active(struct drm_gem_object *obj);
-- 
2.50.0

