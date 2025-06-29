Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 73D1FAED0A3
	for <lists+dri-devel@lfdr.de>; Sun, 29 Jun 2025 22:17:30 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 98A6210E369;
	Sun, 29 Jun 2025 20:17:28 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="otwO/6/Q";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com
 [205.220.180.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A91F310E37E
 for <dri-devel@lists.freedesktop.org>; Sun, 29 Jun 2025 20:17:17 +0000 (UTC)
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 55TAEgsN011214
 for <dri-devel@lists.freedesktop.org>; Sun, 29 Jun 2025 20:17:17 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:date:from:in-reply-to:message-id
 :mime-version:references:subject:to; s=qcppdkim1; bh=ufkxvlCaXqE
 +JOcTp0SgGPSX3GCc3cmG0IREiQb02Vo=; b=otwO/6/QlbufEGIIqV3elURmoR5
 wmZaq0AzynUV8kft65Y8NbAAcDNbInMYLYrGRj08kPp58lLq0q4cbfGrAuijlpM0
 hEn9AoB+RVt9NflNd2jHG+exUbH9f3WzmUTzhaL4fREj5GN5C1ts1Kfnlm5vl36w
 8mEHa3lROIUKe058VXHnc0Ar431lBJiDsXevih5IdyFM8uXNVsyiK+A8Q/1IiRs0
 0D5gPAtedVAQHDWSVdkxXRUtGmK2lZuWftjlN+WX1pT3bRF+40r+5Mx/PRFEBmFR
 P6IZKg2lQ7CG6cTUxcPSKgZgbMKmbD9WdSa4DygOLZSQMgQHyi110G3hi5w==
Received: from mail-pg1-f198.google.com (mail-pg1-f198.google.com
 [209.85.215.198])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 47j7qm2mvp-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
 for <dri-devel@lists.freedesktop.org>; Sun, 29 Jun 2025 20:17:16 +0000 (GMT)
Received: by mail-pg1-f198.google.com with SMTP id
 41be03b00d2f7-b3183193374so1161172a12.1
 for <dri-devel@lists.freedesktop.org>; Sun, 29 Jun 2025 13:17:16 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1751228235; x=1751833035;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=ufkxvlCaXqE+JOcTp0SgGPSX3GCc3cmG0IREiQb02Vo=;
 b=FNKIgLoeTgx/RBNnGOxW2lvzkYI556QOWonMXOGc6fn03575V5KlxR3gl+yKqX0ZM0
 8IoBj+W1lgy+gpHUnf9Y3CJYJWk6v52xAR7mMK6qikUGK5LSOU5s9s2zFYEPzYqcl5Uf
 kxSJp+dcFcCtZ5hR5lVCb9lI9zelgo8TV2WLX7f2BKBo2M6nLyuARVwLPfYme0NzElY7
 ZKTon88kONo6wq+W3GV747s1ZQ63QxYhPYIdlal0GxQzBQpLUEBNYQ7FEgRgPB3LLoXF
 DX6MtyKI5/xZDPUVLWLP4E4Sq8VeRR+l8GwU424aFF9yoARrEC6mvR9l6dg4rYPaOl0R
 ky6w==
X-Gm-Message-State: AOJu0YzKMQnsCrZ5dlo2Q6PcGbmduHWmh8e5fEcg3WvDGzUzgOJU2sdO
 8YVMjOph4OWS5KqXO1ZDKiohMwBGNg0slovMpPKdAJAEHzTFGSxV7Y/UWz1NbnEebtg/fpImnO4
 L3nqZHwX8AHVZpLs8iBPnSNU0s27C24X0Y1PlzZNPeCUTj9mgWEc7QFJBpx1106aZ3cH9v2i4LT
 M7gZM=
X-Gm-Gg: ASbGncv+MuUShJTdVr2YHmwlQdkOeCeNrbHsqS3NrC5V33XZ/XMYmF+bcByiOjOuqWc
 dkheZ7Q9oagIJzgZz3qbQ+ybdiNWeOPW3Ma40FhyPATy2mjO7JW37qtaKuRc7/NkZpy1ZGYQoKf
 7aX0bdTE/wuIAHe9pfeapqYyoqo4IX5RUGQ8WDFAXL4HHY1o/hc59G05DB7rdtzOU2ynNDQiwBg
 LrUkWEzVxs6XKyOefM80M6CiRFeXNQIH2Ng3Uy3QQXafQqZ4b+ad5OTNjV772QMlZMM76ubgFXR
 Iv6647Do43kqyQEILoAYYN0j9N/NKQMlBQ==
X-Received: by 2002:a17:903:1a27:b0:234:b735:dca8 with SMTP id
 d9443c01a7336-23ac2d86b33mr141348155ad.6.1751228235221; 
 Sun, 29 Jun 2025 13:17:15 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFJvTw3e2vrywZVxfjZlEoy2MYDh/wxsQwXvulz3VBukHFPPCVpgZZypcbvOisjgkgC2KTm8Q==
X-Received: by 2002:a17:903:1a27:b0:234:b735:dca8 with SMTP id
 d9443c01a7336-23ac2d86b33mr141348005ad.6.1751228234806; 
 Sun, 29 Jun 2025 13:17:14 -0700 (PDT)
Received: from localhost ([2601:1c0:5000:d5c:5b3e:de60:4fda:e7b1])
 by smtp.gmail.com with ESMTPSA id
 d9443c01a7336-23acb2f24c7sm63539985ad.82.2025.06.29.13.17.14
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 29 Jun 2025 13:17:14 -0700 (PDT)
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
Subject: [PATCH v9 39/42] drm/msm: use trylock for debugfs
Date: Sun, 29 Jun 2025 13:13:22 -0700
Message-ID: <20250629201530.25775-40-robin.clark@oss.qualcomm.com>
X-Mailer: git-send-email 2.50.0
In-Reply-To: <20250629201530.25775-1-robin.clark@oss.qualcomm.com>
References: <20250629201530.25775-1-robin.clark@oss.qualcomm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Authority-Analysis: v=2.4 cv=C4TpyRP+ c=1 sm=1 tr=0 ts=68619f4c cx=c_pps
 a=Qgeoaf8Lrialg5Z894R3/Q==:117 a=xqWC_Br6kY4A:10 a=6IFa9wvqVegA:10
 a=cm27Pg_UAAAA:8 a=EUspDBNiAAAA:8 a=pGLkceISAAAA:8 a=UIWvmcERRd2or3XT2GcA:9
 a=x9snwWr2DeNwDh03kgHS:22
X-Proofpoint-ORIG-GUID: 8DnVkBRvcs6dSdx2j_Uo6QGPjgya8WeN
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNjI5MDE3MiBTYWx0ZWRfX0gT71eDLuMNy
 gZUPjU2l/WEK0Kam3ljT3hrrzLWs1FCUV4hkzXlCUrVaQtp8CyEWpLMT+jA2x4J7y9W3QhbZthL
 YH+fV9mp8Gz5I5soCDOI/Sup4nTSKbM68CLM7elUXiRsValaOC8DJxhmBWl0N3d1fwlkP0tLVXp
 Ztwil0UCR4lu1/MrWOwi3/l3Pd4+GWBLObxyi/ZyMUmUiTslVVJvdF/2blniVSL6LiVxi+jg1Ki
 OFuszfyJnnzD/2LrA4YIKzK/THZQ/+Qi52ujzJVf+pphxWgIM486OonzbvtkMfxgUCYMUFHWvPS
 tUS/Gdb4t3NCan3B+F0/HRBVZr8xvetQkq23VxDQ9S5Afk2Dobjn2aPX2Vb7iI+588Txi3SPIwT
 CTIzycoPFE6n7h41PgsH7cHGjCPFS8aje/gU+vsx0Ifox0yeF32p3F/pj4rtAUn3qSJoCiFg
X-Proofpoint-GUID: 8DnVkBRvcs6dSdx2j_Uo6QGPjgya8WeN
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

