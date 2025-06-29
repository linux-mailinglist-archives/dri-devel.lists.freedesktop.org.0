Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 7454FAECD66
	for <lists+dri-devel@lfdr.de>; Sun, 29 Jun 2025 16:08:33 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 87EBA10E02E;
	Sun, 29 Jun 2025 14:08:31 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="N15+P78H";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com
 [205.220.180.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A94F310E34D
 for <dri-devel@lists.freedesktop.org>; Sun, 29 Jun 2025 14:08:19 +0000 (UTC)
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 55TAh20c010025
 for <dri-devel@lists.freedesktop.org>; Sun, 29 Jun 2025 14:08:19 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:date:from:in-reply-to:message-id
 :mime-version:references:subject:to; s=qcppdkim1; bh=ufkxvlCaXqE
 +JOcTp0SgGPSX3GCc3cmG0IREiQb02Vo=; b=N15+P78HFqJ2QDE4lj0Bqkg67/D
 C1V94pwkSemNSxnav6EC9uQNEn3T5V3CT4/rs5lihNXj4oSuN4423eoHYr4IVTVz
 yE4xRjsO1+Q7SOuXZxmY20VdxujXoUlj+kEqrvdiy/u80I3PSajyNStFuW8NxpqO
 hGaMCU+VUnc2MVaSJqaCJ6K+UOX8/tOHPo9KwyFTXNueddSWoSmBz6Yl544HohLe
 timFtgFDPhlkN/IRG+H7P7Dyxii9cXkLR4s2QTmamE+JDpLcgg31jcEtAqsr7f8h
 9Dw6UWpYHuYKoRbW3RM6pUdQ8KncCX9Ccz/5QX4ps8UIjZzasAl4fa/OksA==
Received: from mail-pj1-f70.google.com (mail-pj1-f70.google.com
 [209.85.216.70])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 47j801t7tv-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
 for <dri-devel@lists.freedesktop.org>; Sun, 29 Jun 2025 14:08:18 +0000 (GMT)
Received: by mail-pj1-f70.google.com with SMTP id
 98e67ed59e1d1-313d346dc8dso3741502a91.1
 for <dri-devel@lists.freedesktop.org>; Sun, 29 Jun 2025 07:08:18 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1751206097; x=1751810897;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=ufkxvlCaXqE+JOcTp0SgGPSX3GCc3cmG0IREiQb02Vo=;
 b=uAPODEUcPduWoKRlh3u+GmMRrN22Y0TeOXnDZ8xIDI3rbcXEKS71p12ah56P8WCp29
 ozD1SIYbj5dLiojrC7MgQW8kjmrb5d8IEZFmWV38c79XDe2Hk+rf7Yc1bsb1BiFHUNcF
 Dwmyvj3oOpz8YIkNYL9Vsnir+o2pu6erPiiE290h3Z6JID3x6t6uMtHAjEOZodL/+frP
 erODc9x3JLjnKQSacDfbTgUZDESbNz6TyyPFG5GiTnxO1I7p5VOlfvRB5/gjHG273Hu6
 NEhWvmdqwy34XQ+kwyNctDJv/a8bvuwZj+YM/mhCzEKMV1sY9+6RioMWV9KFfmxbKgdF
 /Etw==
X-Gm-Message-State: AOJu0Yw70BSaI2tneL01r/iqfdib/3KWzoPfJi1Jcl6VJaJg/tTJylNF
 593/SYCdEKiDUKohF/tGt31+HRM54g4YdhG/RlIBZIVDoXsro1Ux3pMSo4XG+6mJWBcpWCaO9C+
 vxKnzN9vof6OUHqieEvfRifX7nGIFX45/LhKEkI87POEgMT/67RoOmL9bGM/X4rrK3oIOw7AUBZ
 uXys4=
X-Gm-Gg: ASbGncuDqTFXJ84x4eTQigNIMvmV5/eR4buBqcl+BvtjVkJdyeVMpkTlvwuF+2q+5/N
 Hw4Q+eSro+wjLhhrEPMoakeLubx/I1pcexLg09mCztI1YPfkLWr8QbRoF2+yWZLVU4Z7U6SVkQX
 HC6D4CUBHRnj9FYO+4ZyC3VDI15FA8Fd5mOdKODfvDfMHtgm1BsUtmVk7YsOf2+JZpJWHD9oFT9
 9xHdtDxkwGOJWsm1TkM2zmi3Zp3TSQW4sNPW5Tta7935ik34fzn1dFsfIVPrnZkM4wXUFo++FSw
 xnuYqBm7KcIB0734hyDfuigRU/mdZq8T
X-Received: by 2002:a17:90b:5347:b0:311:ba2e:bdc9 with SMTP id
 98e67ed59e1d1-318c930f9c3mr14566737a91.27.1751206097267; 
 Sun, 29 Jun 2025 07:08:17 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHJayQhQWhT5vTJXy0mRK+FWWNsp3OY4G0Nbi/rEwA8XLYXa5Wnw/fbVSwXi+QB7lNSjIGwcQ==
X-Received: by 2002:a17:90b:5347:b0:311:ba2e:bdc9 with SMTP id
 98e67ed59e1d1-318c930f9c3mr14566701a91.27.1751206096824; 
 Sun, 29 Jun 2025 07:08:16 -0700 (PDT)
Received: from localhost ([2601:1c0:5000:d5c:5b3e:de60:4fda:e7b1])
 by smtp.gmail.com with ESMTPSA id
 98e67ed59e1d1-318c13921b4sm6582806a91.1.2025.06.29.07.08.16
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 29 Jun 2025 07:08:16 -0700 (PDT)
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
Subject: [PATCH v8 39/42] drm/msm: use trylock for debugfs
Date: Sun, 29 Jun 2025 07:03:42 -0700
Message-ID: <20250629140537.30850-40-robin.clark@oss.qualcomm.com>
X-Mailer: git-send-email 2.50.0
In-Reply-To: <20250629140537.30850-1-robin.clark@oss.qualcomm.com>
References: <20250629140537.30850-1-robin.clark@oss.qualcomm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-GUID: ctfi2B1YC4P5EPZmFQHsn0--UF3jcWBS
X-Authority-Analysis: v=2.4 cv=YPWfyQGx c=1 sm=1 tr=0 ts=686148d2 cx=c_pps
 a=0uOsjrqzRL749jD1oC5vDA==:117 a=xqWC_Br6kY4A:10 a=6IFa9wvqVegA:10
 a=cm27Pg_UAAAA:8 a=EUspDBNiAAAA:8 a=pGLkceISAAAA:8 a=UIWvmcERRd2or3XT2GcA:9
 a=mQ_c8vxmzFEMiUWkPHU9:22
X-Proofpoint-ORIG-GUID: ctfi2B1YC4P5EPZmFQHsn0--UF3jcWBS
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNjI5MDExOSBTYWx0ZWRfX+vWMkiuoVeP9
 xC7T1gc9mAA2+Qi/FFXIX96WfSz1RfkcKrfXEnNkMwRxJgFKV3aTGSIJNvka61Xonfhsh98ch8P
 n7hMsrOqaVLehIPLIQJ7pPoBhycWmBvVvaIgxA4nH7LAb+l+/0g6g2cptcKWH8x9x9xjYjQDGPg
 SwU1rLLEBt0St7nYv867CVBPnCqusCQeNJ17pfkRDsGlUoX1bVZsRoJnkQQNSSo+hy3eSxcqb+L
 SsTi3m3aE7NuVSBs1GJoBlIdb0jwFG8n/wp9n8T75caem/T1p7GcCMNqUO16Vjcf9+XIqzmVzPl
 veYTJhCndjYtKHsvIo7nQZqn4rlSTHUIPDZYOd+GPXD4y+gHTkUL5m9JnpiHROIt08mIIsLxP7v
 jo8WMswQ1hCYtaFbZa8HLjbzc23GgBT2DVb5d3Jm3GEgh0r0xwFSJyPz+NBz9H7gLuDg6TFy
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
Tested-by: Antonino Maniscalco <antomani103@gmail.com>
Reviewed-by: Antonino Maniscalco <antomani103@gmail.com>
---
 drivers/gpu/drm/msm/msm_gem.c | 3 ++-
 drivers/gpu/drm/msm/msm_gem.h | 6 ++++++
 2 files changed, 8 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/msm/msm_gem.c b/drivers/gpu/drm/msm/msm_gem.c
index e3ccda777ef3..3e87d27dfcb6 100644
--- a/drivers/gpu/drm/msm/msm_gem.c
+++ b/drivers/gpu/drm/msm/msm_gem.c
@@ -938,7 +938,8 @@ void msm_gem_describe(struct drm_gem_object *obj, struct seq_file *m,
 	uint64_t off = drm_vma_node_start(&obj->vma_node);
 	const char *madv;
 
-	msm_gem_lock(obj);
+	if (!msm_gem_trylock(obj))
+		return;
 
 	stats->all.count++;
 	stats->all.size += obj->size;
diff --git a/drivers/gpu/drm/msm/msm_gem.h b/drivers/gpu/drm/msm/msm_gem.h
index ce5e90ba935b..1ce97f8a30bb 100644
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
2.50.0

