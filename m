Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 13FE0ACF6F2
	for <lists+dri-devel@lfdr.de>; Thu,  5 Jun 2025 20:33:55 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CC83910E985;
	Thu,  5 Jun 2025 18:33:52 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="oT7dY6ZW";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com
 [205.220.180.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C220710E9D7
 for <dri-devel@lists.freedesktop.org>; Thu,  5 Jun 2025 18:33:50 +0000 (UTC)
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 555GpfM3000738
 for <dri-devel@lists.freedesktop.org>; Thu, 5 Jun 2025 18:33:50 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:date:from:in-reply-to:message-id
 :mime-version:references:subject:to; s=qcppdkim1; bh=eqq9rbaAioE
 9x/Vr1cLJypF4bAqJQvBM2Xsa5cd3ZNI=; b=oT7dY6ZWx7dyYOYToij2tW+L4Oj
 09gGE9IIAf8cZNxnCLF0QUnYTrlfQnMh8kPGizzYBkugN3Zm843uF8xj+GRE2oVW
 2A/H0ly2shTaTL+Zlhy1GsF3L3CcAcQnJFHEwzOitJIV9513TwkRQZSkuMMV5/HU
 ERPcW9E+c3VVSG2WXVKvAbbc8/xdyYzioCL58CUkjmrPCwjojKGewmOY2g81Wo+M
 jdRg/on3fMHpD7FCz3yi/5F0jXLEGh1F9GUaLlj9Z9wANRDmq8uQZCKNPmbROQzz
 bpeUj9CmQCl1TvDyjkl1mDmVc7xjNJACsVF8Qy4JgsOvWjUFin1WMgb8n8Q==
Received: from mail-pf1-f198.google.com (mail-pf1-f198.google.com
 [209.85.210.198])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 471sfv17y9-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
 for <dri-devel@lists.freedesktop.org>; Thu, 05 Jun 2025 18:33:34 +0000 (GMT)
Received: by mail-pf1-f198.google.com with SMTP id
 d2e1a72fcca58-7394772635dso960508b3a.0
 for <dri-devel@lists.freedesktop.org>; Thu, 05 Jun 2025 11:33:34 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1749148401; x=1749753201;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=eqq9rbaAioE9x/Vr1cLJypF4bAqJQvBM2Xsa5cd3ZNI=;
 b=bKW9FnD7SVTJdNpVeRMU/9WruWwE6os+Jkbhhfja3CQGnBg9n+B+j+56xj0chhGUKr
 mJMVuA0JKxqKIAzY0AG9pi7qTY78EXuR+2k53A1dj9bW7Q+XjSA0BDEc79QRHAIZUCxO
 fsq+LIx2GsUB8PqY70fPw+xnqqPY04DSVKBbXLoPCizbTU9JuPfhJUkIF9PijlN1a27l
 h1A/5O5zfcMq/1WuNgeWB4F8O/e9xDJ63o5F6bwziy+zGeMcOQ8R+mAIfC1S+gOinST7
 fngeMmo1ODzjUGq1+TcKszuAlCT0fKRiHxHu/Kr9QWojIbhSr8dwzMhg/L0SWW+o+iiu
 igjQ==
X-Gm-Message-State: AOJu0YxvefmWgaznIHowN9UDrhnqfufoSzb77aWIxa4A8d0ZiBZpJ8/f
 DBVuzOSeYC0KCNEfHy6btHQdGNan5AHtIdLmg4lIwCPI6QODQTE0Us68cf2S840jDhxKyvPNSZQ
 m6YCrJu2MwbEEIZSVDbdx0RQzQHCd7it1cQO+O6hjB4mWaAUh1Hwa+rvwrmOcPl0HBkvSmxhf5c
 F7vD8=
X-Gm-Gg: ASbGncuzqaKxESPYyssARcptBJHKbL6h4Twy4iBcLtmekq8wXygNqXr0dJvKPj8wFvf
 EXqP4wMeZNc6Ce60cfPLcuQOFMkQ3wY5qiPz1xvra65zlT9cV7SWroo+/kZEIs3Im+h4QHijJCu
 ho9x8wIWKb02OUTmYHOVsfFQRoHtS058djVhPGNokbrXmflN7NykRVL002eOLOdAPQ3fjcMYTH5
 Fm5pX66HFXplELkaizoiH1Zf+As7khO4PHT9vEYh79BnWVL7sS0lKUTiO6GJCT3Aa6rngaA8Bfp
 vhdIph4xA59bMSSK1/iU9g==
X-Received: by 2002:a05:6a21:998d:b0:1f5:8179:4f47 with SMTP id
 adf61e73a8af0-21ee257ac7fmr368478637.20.1749148400886; 
 Thu, 05 Jun 2025 11:33:20 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEv2c+RdwYHEoeR38pw2sdo71gINKvZO5oyAxjTcUM0ezUYPn99pL8wCFAVNClAdFPkoX+B/A==
X-Received: by 2002:a05:6a21:998d:b0:1f5:8179:4f47 with SMTP id
 adf61e73a8af0-21ee257ac7fmr368441637.20.1749148400493; 
 Thu, 05 Jun 2025 11:33:20 -0700 (PDT)
Received: from localhost ([2601:1c0:5000:d5c:89fa:e299:1a34:c1f5])
 by smtp.gmail.com with ESMTPSA id
 41be03b00d2f7-b2f5f668354sm8116a12.42.2025.06.05.11.33.19
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 05 Jun 2025 11:33:20 -0700 (PDT)
From: Rob Clark <robin.clark@oss.qualcomm.com>
To: dri-devel@lists.freedesktop.org
Cc: freedreno@lists.freedesktop.org, linux-arm-msm@vger.kernel.org,
 Connor Abbott <cwabbott0@gmail.com>, Rob Clark <robdclark@chromium.org>,
 Rob Clark <robin.clark@oss.qualcomm.com>, Rob Clark <robdclark@gmail.com>,
 Abhinav Kumar <quic_abhinavk@quicinc.com>,
 Dmitry Baryshkov <lumag@kernel.org>, Sean Paul <sean@poorly.run>,
 Marijn Suijten <marijn.suijten@somainline.org>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 linux-kernel@vger.kernel.org (open list)
Subject: [PATCH v6 37/40] drm/msm: use trylock for debugfs
Date: Thu,  5 Jun 2025 11:29:22 -0700
Message-ID: <20250605183111.163594-38-robin.clark@oss.qualcomm.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250605183111.163594-1-robin.clark@oss.qualcomm.com>
References: <20250605183111.163594-1-robin.clark@oss.qualcomm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Authority-Analysis: v=2.4 cv=CY8I5Krl c=1 sm=1 tr=0 ts=6841e30d cx=c_pps
 a=m5Vt/hrsBiPMCU0y4gIsQw==:117 a=xqWC_Br6kY4A:10 a=6IFa9wvqVegA:10
 a=cm27Pg_UAAAA:8 a=EUspDBNiAAAA:8 a=UIWvmcERRd2or3XT2GcA:9
 a=IoOABgeZipijB_acs4fv:22
X-Proofpoint-ORIG-GUID: SQ0lv48QrUshmyN2mDmW7zGahRTDBBzW
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNjA1MDE2NiBTYWx0ZWRfX1HdXPIdKy64l
 bOilK676za4byWNYqtpnkX+wHTSmpgQ3zL8Jcu0+ccodd2na4a6pgz5KMQNNm2lI1wB3XJkTGmr
 NVE6s1EbhkJP0DN2bLOf9U9RRzrMRqoTcny0ezGJhx8ss9z8oJfGHJkI+iWvKy753F0DtJaOAhv
 H1qLy5Iul92NxJnWqVAMCRB1urgZScsB25wVaJipawjj5g/b9buFg2sWQNFYFSJ6De9xIJyjgVn
 wLD/iqR0FyFiFydvB81itF/0Sdx3xhxmI9TALa+jxpU3Vu50CyByijwQYAuWpGBWXQTkaZAbQLe
 S71WDUiAvj3/5zFGaYVzyw48SnhP72SEAKi26kIebIlz1P4r2YtNiyWe+kfM/vXrW1ESopD7RHu
 j7iglTTdIXrRzEfbyLxOwFQe5n6IRSrIURQfNmnDe2w0y5urqTccTSDdV6wSzE1ezeByz7Gv
X-Proofpoint-GUID: SQ0lv48QrUshmyN2mDmW7zGahRTDBBzW
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-06-05_05,2025-06-05_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 mlxscore=0 adultscore=0 bulkscore=0 suspectscore=0
 malwarescore=0 clxscore=1015 lowpriorityscore=0 spamscore=0 impostorscore=0
 phishscore=0 mlxlogscore=999 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2505280000
 definitions=main-2506050166
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

This resolves a potential deadlock vs msm_gem_vm_close().  Otherwise for
_NO_SHARE buffers msm_gem_describe() could be trying to acquire the
shared vm resv, while already holding priv->obj_lock.  But _vm_close()
might drop the last reference to a GEM obj while already holding the vm
resv, and msm_gem_free_object() needs to grab priv->obj_lock, a locking
inversion.

OTOH this is only for debugfs and it isn't critical if we undercount by
skipping a locked obj.  So just use trylock() and move along if we can't
get the lock.

Signed-off-by: Rob Clark <robdclark@chromium.org>
Signed-off-by: Rob Clark <robin.clark@oss.qualcomm.com>
---
 drivers/gpu/drm/msm/msm_gem.c | 3 ++-
 drivers/gpu/drm/msm/msm_gem.h | 6 ++++++
 2 files changed, 8 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/msm/msm_gem.c b/drivers/gpu/drm/msm/msm_gem.c
index e415e6e32a59..b882647144bb 100644
--- a/drivers/gpu/drm/msm/msm_gem.c
+++ b/drivers/gpu/drm/msm/msm_gem.c
@@ -946,7 +946,8 @@ void msm_gem_describe(struct drm_gem_object *obj, struct seq_file *m,
 	uint64_t off = drm_vma_node_start(&obj->vma_node);
 	const char *madv;
 
-	msm_gem_lock(obj);
+	if (!msm_gem_trylock(obj))
+		return;
 
 	stats->all.count++;
 	stats->all.size += obj->size;
diff --git a/drivers/gpu/drm/msm/msm_gem.h b/drivers/gpu/drm/msm/msm_gem.h
index 57252b5e08d0..9671c4299cf8 100644
--- a/drivers/gpu/drm/msm/msm_gem.h
+++ b/drivers/gpu/drm/msm/msm_gem.h
@@ -280,6 +280,12 @@ msm_gem_lock(struct drm_gem_object *obj)
 	dma_resv_lock(obj->resv, NULL);
 }
 
+static inline bool __must_check
+msm_gem_trylock(struct drm_gem_object *obj)
+{
+	return dma_resv_trylock(obj->resv);
+}
+
 static inline int
 msm_gem_lock_interruptible(struct drm_gem_object *obj)
 {
-- 
2.49.0

