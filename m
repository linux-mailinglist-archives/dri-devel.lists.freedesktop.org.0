Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 8B2BEAECD4C
	for <lists+dri-devel@lfdr.de>; Sun, 29 Jun 2025 16:08:15 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6CC0E10E2BA;
	Sun, 29 Jun 2025 14:08:13 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="H8KtDQ7+";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com
 [205.220.180.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E04F310E340
 for <dri-devel@lists.freedesktop.org>; Sun, 29 Jun 2025 14:08:06 +0000 (UTC)
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 55TDUN89013224
 for <dri-devel@lists.freedesktop.org>; Sun, 29 Jun 2025 14:08:06 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:date:from:in-reply-to:message-id
 :mime-version:references:subject:to; s=qcppdkim1; bh=fDzBgQEKZYU
 G26jz6qIHJn61zKgVSXScxT3NVbL/LOU=; b=H8KtDQ7+cji0fJIzrUl/zXGdgqM
 brV9B5h7udP7kKwVaaeC/bphrM4sg6sl15tQaH80GAu7rg6eFeypRFlWOIf9ebYM
 VI8q/JIuiRZwZHtxAESM5XZZu26s+pqWR/QwA9T7YyNfrlBzbuedAT+krdxWfX9Z
 wCkXRR36xJFvREGsbAk5STh/F5a/o/C0WxYsQQcgrTquELfXXVwxAq1s8UWDgGP7
 LsO6HhQjm5LE0hpJuNM7fpyIU31ZSkkv1G6aBjTz5spAhQFhXVKKIBkqy/5Fwmxq
 CjfCXCJx1daD2hhSjietLeHWyFczxIR6cb3WuNwuMtbcIkt/loomiXZVY6Q==
Received: from mail-pl1-f198.google.com (mail-pl1-f198.google.com
 [209.85.214.198])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 47j801t7sn-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
 for <dri-devel@lists.freedesktop.org>; Sun, 29 Jun 2025 14:08:05 +0000 (GMT)
Received: by mail-pl1-f198.google.com with SMTP id
 d9443c01a7336-235e3f93687so19019125ad.2
 for <dri-devel@lists.freedesktop.org>; Sun, 29 Jun 2025 07:08:05 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1751206084; x=1751810884;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=fDzBgQEKZYUG26jz6qIHJn61zKgVSXScxT3NVbL/LOU=;
 b=A7J3eXdHkS1RkvrgtqtcOUP2WWRXEjFI+0cCAuVzD3YJXBZBYZWS2amGDt+Hp02lzW
 86aPvUh5XKqEvQuwubkRu7A59fUS2K/XybtZtcLHXPV0m4sJI/GN/UMudLv0MzaOaqOH
 04IKe3wdCwhMzdsavie9NYCjjllUvRRG//odj2Hm4RlRLZiWcPCQkGisHf9rmzdnf7NQ
 F78a/BwEUEiHMB5nEChK8J8S/5yQmH2zJYJeu7+UGp4vR+YFa8oV1gNxPoeoOQradi5N
 lW0mezUhyVFWx1/dNXagVTY32M2tNq1dbTOxY+lx2M4vfiCGlKaRemEedPJF+s34/S4n
 MOEA==
X-Gm-Message-State: AOJu0Yyl+9Cf2fHmPATp2TcLuAZ9uaJsgTfAoTXlXe3QS7wF2l2lHIDT
 NQQwKxIZjTuhLNhaYcN7FyAgzc4Hdh4vEiEgwlAyEb84uv2FKpu0Na36BEhGs3WthL3BgszIc4+
 dO0VdH+MmTfATPDanopKng1IOfRqpbi9XRZhpsnPDXeYm1zsFGmAOHUC/T3qcJR4u9QsaOLo7ml
 hqTaw=
X-Gm-Gg: ASbGncuYI9q0PVaDtR5D0oMH1IS3ExLxTM0TfLmWCI+s9cLZbmn4gXTdIMs+aD+XNGN
 i9FGWt+zDYWjvtpodEGsMdmtMgyPVRNXAX0VA1eYP1uEz9rUVZd2pQ/Hgv3o08Jr6OgRvKcAI2d
 ZrfaB1jEBLwvDUgHQWO1u7f/BmVYQZU6u9W8SgPMzwC0XcmezgqHcHQA2ylzYIjDLywItpu3Jte
 iOtxHubpnMdc9i4y1ADIjxd87lE85riLy7oJWAj7Wf90Z55aiQhzkYwePX7zZdQCerW3kWYAt68
 7KexbPWqA4uhFpXZfo+EF4OTei43FkfO
X-Received: by 2002:a17:902:e54b:b0:235:eb8b:9968 with SMTP id
 d9443c01a7336-23ac463470cmr169136405ad.36.1751206084538; 
 Sun, 29 Jun 2025 07:08:04 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHkyc5NqpGoUysSULZkt4YI8T4ojjTyZxoY3YnC9AbbMNNhL19AVyCjD/gR1PB/UUJsbTP6lQ==
X-Received: by 2002:a17:902:e54b:b0:235:eb8b:9968 with SMTP id
 d9443c01a7336-23ac463470cmr169136005ad.36.1751206084070; 
 Sun, 29 Jun 2025 07:08:04 -0700 (PDT)
Received: from localhost ([2601:1c0:5000:d5c:5b3e:de60:4fda:e7b1])
 by smtp.gmail.com with ESMTPSA id
 d9443c01a7336-23acb3adeabsm57654565ad.159.2025.06.29.07.08.03
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 29 Jun 2025 07:08:03 -0700 (PDT)
From: Rob Clark <robin.clark@oss.qualcomm.com>
To: dri-devel@lists.freedesktop.org
Cc: freedreno@lists.freedesktop.org, linux-arm-msm@vger.kernel.org,
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
Subject: [PATCH v8 30/42] drm/msm: Use DMA_RESV_USAGE_BOOKKEEP/KERNEL
Date: Sun, 29 Jun 2025 07:03:33 -0700
Message-ID: <20250629140537.30850-31-robin.clark@oss.qualcomm.com>
X-Mailer: git-send-email 2.50.0
In-Reply-To: <20250629140537.30850-1-robin.clark@oss.qualcomm.com>
References: <20250629140537.30850-1-robin.clark@oss.qualcomm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-GUID: CuL6B2AyHQulndVvA3ctMWXtKQRCqkf5
X-Authority-Analysis: v=2.4 cv=YPWfyQGx c=1 sm=1 tr=0 ts=686148c5 cx=c_pps
 a=MTSHoo12Qbhz2p7MsH1ifg==:117 a=xqWC_Br6kY4A:10 a=6IFa9wvqVegA:10
 a=cm27Pg_UAAAA:8 a=EUspDBNiAAAA:8 a=pGLkceISAAAA:8 a=8Ft5guHMEotweHOT_P0A:9
 a=GvdueXVYPmCkWapjIL-Q:22
X-Proofpoint-ORIG-GUID: CuL6B2AyHQulndVvA3ctMWXtKQRCqkf5
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNjI5MDExOSBTYWx0ZWRfX+nlDq4FoE6cB
 mK5NBuYuxzA9Ebnc1TGXzv/OMEoO293lUfEIz3tQPQoHCICR+cWoXuZI1e9hXHq1NziuMaOz/cZ
 9FZI/xl1r+cECO5Gdj+VJiwMwtbkEd/RwF+xIK4UdTEiTilaf0SzxdUaFb5swvByQmPuu3q9fWZ
 jOqkHEBtktKSZmXpeGApKiKs1TtUtgFW1lwQqWeJKo9N4WgYM1XyjxLKmLl1h5twQFsU2LNhZI8
 zIThUTIdHohBUWzUtHkHeDswDvyNr5V1T1BhAwjL/0DDbs9tkB87WAD/z2iKk6UnLK/UBhcnX7v
 hrkDc1zmjVGoNHMlP8/qfPQb5hrpYSLASfc1tTlzIYsczHtcbeEf+PBCe7MYU32V1AYBuVWUVYG
 wuMQ9JZU5Gf9ZfXt+DUSiEIuFYzKsHbljoVRGP91cuamqK+EK1Q3/+bOE3ewpyetW1+pyzZp
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.7,FMLib:17.12.80.40
 definitions=2025-06-27_05,2025-06-27_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 mlxlogscore=999 mlxscore=0 malwarescore=0 suspectscore=0
 lowpriorityscore=0 clxscore=1015 impostorscore=0 adultscore=0
 priorityscore=1501 bulkscore=0 phishscore=0 classifier=spam authscore=0
 authtc=n/a authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2505280000 definitions=main-2506290119
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

Any place we wait for a BO to become idle, we should use BOOKKEEP usage,
to ensure that it waits for _any_ activity.

Signed-off-by: Rob Clark <robdclark@chromium.org>
Signed-off-by: Rob Clark <robin.clark@oss.qualcomm.com>
Tested-by: Antonino Maniscalco <antomani103@gmail.com>
Reviewed-by: Antonino Maniscalco <antomani103@gmail.com>
---
 drivers/gpu/drm/msm/msm_gem.c          | 6 +++---
 drivers/gpu/drm/msm/msm_gem_shrinker.c | 2 +-
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/drivers/gpu/drm/msm/msm_gem.c b/drivers/gpu/drm/msm/msm_gem.c
index 100d159d52e2..b688d397cc47 100644
--- a/drivers/gpu/drm/msm/msm_gem.c
+++ b/drivers/gpu/drm/msm/msm_gem.c
@@ -93,8 +93,8 @@ static void msm_gem_close(struct drm_gem_object *obj, struct drm_file *file)
 	 * TODO we might need to kick this to a queue to avoid blocking
 	 * in CLOSE ioctl
 	 */
-	dma_resv_wait_timeout(obj->resv, DMA_RESV_USAGE_READ, false,
-			      msecs_to_jiffies(1000));
+	dma_resv_wait_timeout(obj->resv, DMA_RESV_USAGE_BOOKKEEP, false,
+			      MAX_SCHEDULE_TIMEOUT);
 
 	msm_gem_lock_vm_and_obj(&exec, obj, ctx->vm);
 	put_iova_spaces(obj, ctx->vm, true);
@@ -895,7 +895,7 @@ bool msm_gem_active(struct drm_gem_object *obj)
 	if (to_msm_bo(obj)->pin_count)
 		return true;
 
-	return !dma_resv_test_signaled(obj->resv, dma_resv_usage_rw(true));
+	return !dma_resv_test_signaled(obj->resv, DMA_RESV_USAGE_BOOKKEEP);
 }
 
 int msm_gem_cpu_prep(struct drm_gem_object *obj, uint32_t op, ktime_t *timeout)
diff --git a/drivers/gpu/drm/msm/msm_gem_shrinker.c b/drivers/gpu/drm/msm/msm_gem_shrinker.c
index 5faf6227584a..1039e3c0a47b 100644
--- a/drivers/gpu/drm/msm/msm_gem_shrinker.c
+++ b/drivers/gpu/drm/msm/msm_gem_shrinker.c
@@ -139,7 +139,7 @@ evict(struct drm_gem_object *obj, struct ww_acquire_ctx *ticket)
 static bool
 wait_for_idle(struct drm_gem_object *obj)
 {
-	enum dma_resv_usage usage = dma_resv_usage_rw(true);
+	enum dma_resv_usage usage = DMA_RESV_USAGE_BOOKKEEP;
 	return dma_resv_wait_timeout(obj->resv, usage, false, 10) > 0;
 }
 
-- 
2.50.0

