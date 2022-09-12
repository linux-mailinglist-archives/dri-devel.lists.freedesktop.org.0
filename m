Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 7EF425B6753
	for <lists+dri-devel@lfdr.de>; Tue, 13 Sep 2022 07:28:35 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 89A4610E602;
	Tue, 13 Sep 2022 05:28:07 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-oa1-x2e.google.com (mail-oa1-x2e.google.com
 [IPv6:2001:4860:4864:20::2e])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CF2C710E43E;
 Mon, 12 Sep 2022 22:34:59 +0000 (UTC)
Received: by mail-oa1-x2e.google.com with SMTP id
 586e51a60fabf-1280590722dso27360453fac.1; 
 Mon, 12 Sep 2022 15:34:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date;
 bh=JV7ELz4kPbM5zN+d1pRguKa83wMKNN5UKfm4nAD4taw=;
 b=kCcu/2IKnox3u9+zK7lOqIRhYf9kr9vm3wsCj6PU5aFX4J98EbdN3EDa3TwpJ7UOjG
 LrnkokkVHZ/HdP4mvJQ2zl1TorLnQAk/Lic9RGmM4+aEMy8t3Xqsv7q8wWAZIxh2/FZD
 0z1+iOprlAiRrxc97dK6joWlmaz2nQNuCZN3oAHD0U8Dc1rt88vQ7gNJW/clEROtn1dK
 CD8gBneUBtutD/k+d5MAGVg+hS3oWiIdHQfRYIBIi1dFinQQ9zcv7eyoc5ckeVBfgJVg
 RbTcdNEaepR3KjIAZKGQrbYJDGgluBGDuKWchI8Ikd5THNJP7cFUPP5chxAU4/kooJ4S
 RvYg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date;
 bh=JV7ELz4kPbM5zN+d1pRguKa83wMKNN5UKfm4nAD4taw=;
 b=Elj58pFoNuhMnPSn9IQDQ+Jcli/YJtP1C/7P1w7zAZ9aakeHQIqI+w3Vw/T/mwGe2M
 9fa+1GDLU8AFxrH02B1aVwULPA6wF2kiKp8kYMmQUJufVnEm2s3gKfptyLdFl2oRCjAO
 pGJJiXqgLj4mFJxxUM2XgqUSUcd+WBCGHADu8fuNbgqr4hz8k3tgBiE8Ug5buLKmw7nL
 tmRrzTV3FqRvfgYiMh4ZHZbk45atjv3pkB9QPYwhsIvWkeSslRYlUPBIlkawvFcBHIV1
 ImEd3xrWL7FpkMSIY5HXucIP+y+gmJqCM+B5ub8s/hccGra+eNVioheJDVqK7kSiTzK+
 YYgA==
X-Gm-Message-State: ACgBeo3rqc3rJe4pclA2TdosxQfkC5RXVBK9mBo+fHuLWPkxTpy7uzdX
 BrJ+PRB0nRnWaYO0J1QDh7s=
X-Google-Smtp-Source: AA6agR7JuQ8AmkzZbiUb9JdfEksEYlWBob/c8uwbXZHDEDVTUf++BgJE+mLxqMRCQ2uPr3LIKZ0eAg==
X-Received: by 2002:aca:1810:0:b0:34f:b8d6:7999 with SMTP id
 h16-20020aca1810000000b0034fb8d67999mr230929oih.231.1663022098970; 
 Mon, 12 Sep 2022 15:34:58 -0700 (PDT)
Received: from macondo.. ([2804:431:e7cd:8cb3:36b6:6fa1:2fec:e29b])
 by smtp.gmail.com with ESMTPSA id
 ep15-20020a056870a98f00b00127ebb410a4sm6016444oab.11.2022.09.12.15.34.55
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 12 Sep 2022 15:34:58 -0700 (PDT)
From: Rafael Mendonca <rafaelmendsr@gmail.com>
To: Harry Wentland <harry.wentland@amd.com>, Leo Li <sunpeng.li@amd.com>,
 Rodrigo Siqueira <Rodrigo.Siqueira@amd.com>,
 Alex Deucher <alexander.deucher@amd.com>,
 =?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>,
 "Pan, Xinhui" <Xinhui.Pan@amd.com>, David Airlie <airlied@linux.ie>,
 Daniel Vetter <daniel@ffwll.ch>, Wayne Lin <Wayne.Lin@amd.com>,
 Mikita Lipski <mikita.lipski@amd.com>,
 Nicholas Kazlauskas <Nicholas.Kazlauskas@amd.com>
Subject: [PATCH] drm/amdgpu: Fix memory leak in hpd_rx_irq_create_workqueue()
Date: Mon, 12 Sep 2022 19:34:32 -0300
Message-Id: <20220912223433.630364-1-rafaelmendsr@gmail.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Mailman-Approved-At: Tue, 13 Sep 2022 05:27:54 +0000
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
Cc: dri-devel@lists.freedesktop.org, Rafael Mendonca <rafaelmendsr@gmail.com>,
 amd-gfx@lists.freedesktop.org, linux-kernel@vger.kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

If construction of the array of work queues to handle hpd_rx_irq offload
work fails, we need to unwind. Destroy all the created workqueues and
the allocated memory for the hpd_rx_irq_offload_work_queue struct array.

Fixes: 8e794421bc98 ("drm/amd/display: Fork thread to offload work of hpd_rx_irq")
Signed-off-by: Rafael Mendonca <rafaelmendsr@gmail.com>
---
 drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c | 10 +++++++++-
 1 file changed, 9 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c
index 5140d9c2bf3b..6a2e455c5466 100644
--- a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c
+++ b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c
@@ -1295,13 +1295,21 @@ static struct hpd_rx_irq_offload_work_queue *hpd_rx_irq_create_workqueue(struct
 
 		if (hpd_rx_offload_wq[i].wq == NULL) {
 			DRM_ERROR("create amdgpu_dm_hpd_rx_offload_wq fail!");
-			return NULL;
+			goto out_err;
 		}
 
 		spin_lock_init(&hpd_rx_offload_wq[i].offload_lock);
 	}
 
 	return hpd_rx_offload_wq;
+
+out_err:
+	for (i = 0; i < max_caps; i++) {
+		if (hpd_rx_offload_wq[i].wq)
+			destroy_workqueue(hpd_rx_offload_wq[i].wq);
+	}
+	kfree(hpd_rx_offload_wq);
+	return NULL;
 }
 
 struct amdgpu_stutter_quirk {
-- 
2.34.1

