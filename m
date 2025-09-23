Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id DD226B9623F
	for <lists+dri-devel@lfdr.de>; Tue, 23 Sep 2025 16:05:00 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3723410E61F;
	Tue, 23 Sep 2025 14:04:59 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="BOda4Zr+";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com
 [205.220.168.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C319A10E61F
 for <dri-devel@lists.freedesktop.org>; Tue, 23 Sep 2025 14:04:57 +0000 (UTC)
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 58N8H79e023696
 for <dri-devel@lists.freedesktop.org>; Tue, 23 Sep 2025 14:04:56 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:date:from:message-id:mime-version
 :subject:to; s=qcppdkim1; bh=qF7JNnnC6auZa30uLt13ZSI6pihLUX73qMp
 x0C1fb54=; b=BOda4Zr+Z+o0FBg4piDvNbmefDrgjEeT2fGTBubRDbKmioOlKb8
 o5TfpFoeX070XHy9n41ON7M3QC1sGCjyCfETn+lH3ekRxxHKuSKtYOW3gZpAtsNW
 YMtocaj/mjwqoTxfHbKDYENh6a7KM6maUvnkWWlTtOAlpBYnC3O77UfO0Ti6zZOG
 Nnwh6MRZ7+wcMMA1i65+mc96kUSAmdskM7jNQ3pbJdWK5FOu3ZujvrqsQmb/8brr
 /IPvgpn1oB8Tvh1WUMvRvJs8puGsq7QU+/7smkLVrrMvWCO+Ti4uFMjIfP1CSehh
 vnj+s1BY5utHaJ3zzEVqSzNUAMCl1Y0JYMg==
Received: from mail-pf1-f197.google.com (mail-pf1-f197.google.com
 [209.85.210.197])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 49b3nyck19-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
 for <dri-devel@lists.freedesktop.org>; Tue, 23 Sep 2025 14:04:55 +0000 (GMT)
Received: by mail-pf1-f197.google.com with SMTP id
 d2e1a72fcca58-77e12c8feb9so4077144b3a.0
 for <dri-devel@lists.freedesktop.org>; Tue, 23 Sep 2025 07:04:54 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1758636293; x=1759241093;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=qF7JNnnC6auZa30uLt13ZSI6pihLUX73qMpx0C1fb54=;
 b=rAAfC3e/RH+S6Fs/dYNBXj8QsUUv0TX3922W3InVDsRaIj3jKk0sV4az0OJvwha7ye
 ni6db9fTAvQrTcMpvUcFeJh/tLD3M8Wdg8f2hLWr3Rvl9o9Z0c0Pq4RieafqJCmpV27r
 78I1bJdHMxS8OEL4DiIqgCBDbG+qRS0agcUVWD4kDW1EpQoLeTk6SX1SHYIFUyFraUfe
 uwZ2YKUl153FNrbQM81AVGcupHeMP7mV9u/P8+W/xKIQDZlw//0raTJ+OB9O6ymgPqow
 qRqS/A7NKKChspf4zvM7DH9aEFqZlf6/4qJsTyqrUvAJTY/08mHeKaAyuwrzWKu6Z1sD
 tPhA==
X-Gm-Message-State: AOJu0YwKpx6A0lzevDYhdbtG5vigo2SbXMI8uQ9Wd9Ug+PGxuWEYiW3a
 Ms6/sSr3eyj/yONX/pnG4voWBfk0WDR8HTSD0jh6lbi4iYc7yXrcsHV+nnfpwQwbgziWTwJMf7H
 PtpcFXaR2x9ptd/CqTfRvrrpj1r1Ue5VSydY/Shn+RaB+HtT7EnwYi65FEFpj+Z6LEtn0e07nP3
 y7DW4=
X-Gm-Gg: ASbGncs+qVgbfu2oAS1skuNRJszAwAJrLBBEKOEqugrlllev4VmN4y3+iFtZwB/lIqV
 /TAZS/odWGK7ERP7UV4UW3el7glggHd0ih07fup9rh0haNB4jhl/aZvXVcouNNyfpx2qvS5Is9j
 otESPKKJFRQDYgyhKQy9Bqa7oHil2HOgPBmfvAGZekowHbrg+VoB0veDLIBTsW1lXLBbm91m+0c
 SCPeyLJgbckrV6vU7frlE10BUcjaxU7mX18DJ9pLm+XsMYWcNCl+4norZGZBQtIKcSP4ClF3k1p
 snyUL3IhSrW2b/6kLBp4w1SMrOcJYqx7WLEIuRr/5cz59YX89Fg=
X-Received: by 2002:a05:6a00:2389:b0:77e:eb28:c59d with SMTP id
 d2e1a72fcca58-77f5483555bmr2964421b3a.5.1758636292689; 
 Tue, 23 Sep 2025 07:04:52 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHriibLVf2iW30g+eltTQYpwyfphiwc7EROq76RBdBzt9+tjnANNboDPlS44Gb5y7K/RblhCQ==
X-Received: by 2002:a05:6a00:2389:b0:77e:eb28:c59d with SMTP id
 d2e1a72fcca58-77f5483555bmr2964368b3a.5.1758636291921; 
 Tue, 23 Sep 2025 07:04:51 -0700 (PDT)
Received: from localhost ([2601:1c0:5000:d5c:5b3e:de60:4fda:e7b1])
 by smtp.gmail.com with ESMTPSA id
 d2e1a72fcca58-77f2deca77asm7401739b3a.98.2025.09.23.07.04.51
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 23 Sep 2025 07:04:51 -0700 (PDT)
From: Rob Clark <robin.clark@oss.qualcomm.com>
To: dri-devel@lists.freedesktop.org
Cc: freedreno@lists.freedesktop.org, linux-arm-msm@vger.kernel.org,
 Rob Clark <robin.clark@oss.qualcomm.com>,
 Stephan Gerhold <stephan.gerhold@linaro.org>,
 Dmitry Baryshkov <lumag@kernel.org>,
 Abhinav Kumar <abhinav.kumar@linux.dev>,
 Jessica Zhang <jessica.zhang@oss.qualcomm.com>,
 Sean Paul <sean@poorly.run>,
 Marijn Suijten <marijn.suijten@somainline.org>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 linux-kernel@vger.kernel.org (open list)
Subject: [PATCH] drm/msm: Fix GEM free for imported dma-bufs
Date: Tue, 23 Sep 2025 07:04:40 -0700
Message-ID: <20250923140441.746081-1-robin.clark@oss.qualcomm.com>
X-Mailer: git-send-email 2.51.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Authority-Analysis: v=2.4 cv=EuPSrTcA c=1 sm=1 tr=0 ts=68d2a907 cx=c_pps
 a=rEQLjTOiSrHUhVqRoksmgQ==:117 a=xqWC_Br6kY4A:10 a=yJojWOMRYYMA:10
 a=KKAkSRfTAAAA:8 a=EUspDBNiAAAA:8 a=9zJA0kw6ANc6jqlDSAsA:9
 a=2VI0MkxyNR6bbpdq8BZq:22 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-GUID: l28L5KMrMzbMFU3ls5Ri-2wc_8vWcNb6
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwOTIyMDA5MCBTYWx0ZWRfXy3MvdIBfeG9q
 YujuqWDg/MZKBgtwP8U+6TdSLVhk57Dno1gHvXuqoRQ63Jk2ywqwxn9NdXdR2x0UahAkO2O48k5
 cKWU6XmIzfp5xfgcoJO9u52Xmf8ZybR9YtIDjVW++iwjAu/FWtva2Cybui+7YO/2CEPZ0LtXENF
 6ivrFuLQunKDz+kuqBUirXxcynkyjLWMZlzjOGJd67EtMm32gkPrYuqUOIWGUhxzwnNook3GT6N
 4q51+cj03Wt+9zHUI0yDpzjmFnObWa+cBZC+SRE58pyChJCgnOEX1oR6DUJiPSW+poHqD0N7XVB
 /WUrxkmTXaiOZk1msTnZq9vMUoiLg/zsnH7ivoPagFSNKpG6AVE2IuobMpAWXUDf3m5u5pgyngJ
 4XS56wI0
X-Proofpoint-ORIG-GUID: l28L5KMrMzbMFU3ls5Ri-2wc_8vWcNb6
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1117,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-09-23_03,2025-09-22_05,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 suspectscore=0 malwarescore=0 spamscore=0 adultscore=0
 clxscore=1015 priorityscore=1501 impostorscore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2507300000 definitions=main-2509220090
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

Imported dma-bufs also have obj->resv != &obj->_resv.  So we should
check both this condition in addition to flags for handling the
_NO_SHARE case.

Fixes this splat that was reported with IRIS video playback:

    ------------[ cut here ]------------
    WARNING: CPU: 3 PID: 2040 at drivers/gpu/drm/msm/msm_gem.c:1127 msm_gem_free_object+0x1f8/0x264 [msm]
    CPU: 3 UID: 1000 PID: 2040 Comm: .gnome-shell-wr Not tainted 6.17.0-rc7 #1 PREEMPT
    pstate: 81400005 (Nzcv daif +PAN -UAO -TCO +DIT -SSBS BTYPE=--)
    pc : msm_gem_free_object+0x1f8/0x264 [msm]
    lr : msm_gem_free_object+0x138/0x264 [msm]
    sp : ffff800092a1bb30
    x29: ffff800092a1bb80 x28: ffff800092a1bce8 x27: ffffbc702dbdbe08
    x26: 0000000000000008 x25: 0000000000000009 x24: 00000000000000a6
    x23: ffff00083c72f850 x22: ffff00083c72f868 x21: ffff00087e69f200
    x20: ffff00087e69f330 x19: ffff00084d157ae0 x18: 0000000000000000
    x17: 0000000000000000 x16: ffffbc704bd46b80 x15: 0000ffffd0959540
    x14: 0000000000000000 x13: 0000000000000000 x12: 0000000000000000
    x11: ffffbc702e6cdb48 x10: 0000000000000000 x9 : 000000000000003f
    x8 : ffff800092a1ba90 x7 : 0000000000000000 x6 : 0000000000000020
    x5 : ffffbc704bd46c40 x4 : fffffdffe102cf60 x3 : 0000000000400032
    x2 : 0000000000020000 x1 : ffff00087e6978e8 x0 : ffff00087e6977e8
    Call trace:
     msm_gem_free_object+0x1f8/0x264 [msm] (P)
     drm_gem_object_free+0x1c/0x30 [drm]
     drm_gem_object_handle_put_unlocked+0x138/0x150 [drm]
     drm_gem_object_release_handle+0x5c/0xcc [drm]
     drm_gem_handle_delete+0x68/0xbc [drm]
     drm_gem_close_ioctl+0x34/0x40 [drm]
     drm_ioctl_kernel+0xc0/0x130 [drm]
     drm_ioctl+0x360/0x4e0 [drm]
     __arm64_sys_ioctl+0xac/0x104
     invoke_syscall+0x48/0x104
     el0_svc_common.constprop.0+0x40/0xe0
     do_el0_svc+0x1c/0x28
     el0_svc+0x34/0xec
     el0t_64_sync_handler+0xa0/0xe4
     el0t_64_sync+0x198/0x19c
    ---[ end trace 0000000000000000 ]---
    ------------[ cut here ]------------

Reported-by: Stephan Gerhold <stephan.gerhold@linaro.org>
Fixes: de651b6e040b ("drm/msm: Fix refcnt underflow in error path")
Signed-off-by: Rob Clark <robin.clark@oss.qualcomm.com>
---
 drivers/gpu/drm/msm/msm_gem.c | 10 +++++++---
 1 file changed, 7 insertions(+), 3 deletions(-)

diff --git a/drivers/gpu/drm/msm/msm_gem.c b/drivers/gpu/drm/msm/msm_gem.c
index 9f0f5b77f1bd..3aea9b493375 100644
--- a/drivers/gpu/drm/msm/msm_gem.c
+++ b/drivers/gpu/drm/msm/msm_gem.c
@@ -1121,12 +1121,16 @@ static void msm_gem_free_object(struct drm_gem_object *obj)
 		put_pages(obj);
 	}
 
-	if (obj->resv != &obj->_resv) {
+	/*
+	 * In error paths, we could end up here before msm_gem_new_handle()
+	 * has changed obj->resv to point to the shared resv.  In this case,
+	 * we don't want to drop a ref to the shared r_obj that we haven't
+	 * taken yet.
+	 */
+	if ((msm_obj->flags & MSM_BO_NO_SHARE) && (obj->resv != &obj->_resv)) {
 		struct drm_gem_object *r_obj =
 			container_of(obj->resv, struct drm_gem_object, _resv);
 
-		WARN_ON(!(msm_obj->flags & MSM_BO_NO_SHARE));
-
 		/* Drop reference we hold to shared resv obj: */
 		drm_gem_object_put(r_obj);
 	}
-- 
2.51.0

