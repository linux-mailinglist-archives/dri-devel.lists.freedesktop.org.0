Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C95C0AC6569
	for <lists+dri-devel@lfdr.de>; Wed, 28 May 2025 11:13:43 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0D2EC10E5BA;
	Wed, 28 May 2025 09:13:42 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; secure) header.d=ffwll.ch header.i=@ffwll.ch header.b="PmiCbTJi";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-f45.google.com (mail-wm1-f45.google.com
 [209.85.128.45])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3A61C10E5BC
 for <dri-devel@lists.freedesktop.org>; Wed, 28 May 2025 09:13:25 +0000 (UTC)
Received: by mail-wm1-f45.google.com with SMTP id
 5b1f17b1804b1-441d437cfaaso27230845e9.1
 for <dri-devel@lists.freedesktop.org>; Wed, 28 May 2025 02:13:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ffwll.ch; s=google; t=1748423604; x=1749028404; darn=lists.freedesktop.org; 
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=qE1J46FoBAJitXj1m8vWSPEGkQ+jGKiXPyegG+/SpTI=;
 b=PmiCbTJiy/w+Uxkr17yglQg2jGmRmGXcvQUmg1TbS6mYkO4v0vXwJ9FgXV3KRmnyJg
 csVs4Q72d5oFGNIOWqkKi54IxJSfHiq3UU9jillzZICMrizshWPFFAyUU1oRdGObJ0K0
 sZ17gsUsQUjfh8aLW5yRMKkSDuKww9MI+SPrw=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1748423604; x=1749028404;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=qE1J46FoBAJitXj1m8vWSPEGkQ+jGKiXPyegG+/SpTI=;
 b=gDArYNYlzla6iDOXQKe11dT3fLeGQIe2dAFt86NC13KYDMOjf0HmRiLS3DcfL2BFnE
 Qk9F5NqQqYXdmPqS3fxqnipBy1YUhPS6SouFu1FdZq8hC7Ca5FICU5gdhWYL5eV+RviT
 U3ClHhZdq1PzGs0a41flOGDOv3RWikydFGHdSNKAxIsVoFvCLbR0yN+J/6clmMoRzZf6
 Eb6UOmncdojRlLLhOFb8Ne/PtD+6ormqKBmDk+3ldeTq1k1MnmAgDARA6wVBImOl4/HB
 ZWtVS2nhqdL+pjpR3SRXLsA9hicZ7WWBh7X693l+KYB7NbSqjplPq6eQux17lLAniOsf
 YD5w==
X-Gm-Message-State: AOJu0YzEGs/jyDmxFQgIiYwK6Ly2gBZ3xEC5UkSL3FFkxxvRjxfGS1HF
 hotWwsFLItCQRpkpepmWb9UyYyFvRLcurDxazHj2ThIH4NoRUpKIsdTs95qnbeTtNzsX06YOKQz
 0FCmF
X-Gm-Gg: ASbGncv/TJtkppYPatFgfVW5+OpeXn8Pxgazd5t4sxwayieoXf1Zn2OBPTy1ybxKlOp
 MsOwRRelm9NUpsE8mvFMyq+O5n35iB6WsEfP+46TtiUTlmetgTdwLr+c3YGwC+4unVd737iAeDe
 RAC7skZ5hQJBc6gDENEHPM8gNWxgW3+/VMbd8rEoIoRyJgatMiLFj3/MPgh8A2Ftm4ruNXCog8E
 GiPBB5d4WwMIh7CbGSn0i0J4V6tab3g84ej8/+vT0JPCpondUcudyYGKSwjb+F3Idmr2RYm+S2n
 IlGfeU6ja1P6P+YlrzrpsTluUDpzSzfNkUpkJ6Q03nlZmWrzef4A37mI+QZJ2Ks=
X-Google-Smtp-Source: AGHT+IEl4ra8RUOaI+5/H5P2jSSuex3Nu8eBIcc9Q+A1x9PSyFfWR4vZKMKNUZELTXvYj6FyAPzHSA==
X-Received: by 2002:a05:600c:35d3:b0:442:f4a3:b5ec with SMTP id
 5b1f17b1804b1-44c9301650cmr163046715e9.4.1748423603663; 
 Wed, 28 May 2025 02:13:23 -0700 (PDT)
Received: from phenom.ffwll.local ([2a02:168:57f4:0:5485:d4b2:c087:b497])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-4500e1d85b5sm14811715e9.32.2025.05.28.02.13.22
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 28 May 2025 02:13:23 -0700 (PDT)
From: Simona Vetter <simona.vetter@ffwll.ch>
To: DRI Development <dri-devel@lists.freedesktop.org>
Cc: intel-xe@lists.freedesktop.org, Simona Vetter <simona.vetter@ffwll.ch>,
 Jeff Hugo <jeff.hugo@oss.qualcomm.com>,
 Carl Vanderlip <quic_carlv@quicinc.com>, linux-arm-msm@vger.kernel.org,
 Simona Vetter <simona.vetter@intel.com>
Subject: [PATCH 4/8] accel/qaic: delete qaic_bo.handle
Date: Wed, 28 May 2025 11:13:02 +0200
Message-ID: <20250528091307.1894940-5-simona.vetter@ffwll.ch>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250528091307.1894940-1-simona.vetter@ffwll.ch>
References: <20250528091307.1894940-1-simona.vetter@ffwll.ch>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
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

Handles are per-file, not global, so this makes no sense. Plus it's
set only after calling drm_gem_handle_create(), and drivers are not
allowed to further intialize a bo after that function has published it
already.

It is also entirely unused, which helps enormously with removing it
:-)

Since we're still holding a reference to the bo nothing bad can
happen, hence not cc: stable material.

Cc: Jeff Hugo <jeff.hugo@oss.qualcomm.com>
Cc: Carl Vanderlip <quic_carlv@quicinc.com>
Cc: linux-arm-msm@vger.kernel.org
Signed-off-by: Simona Vetter <simona.vetter@ffwll.ch>
Signed-off-by: Simona Vetter <simona.vetter@intel.com>
---
 drivers/accel/qaic/qaic.h      | 2 --
 drivers/accel/qaic/qaic_data.c | 1 -
 2 files changed, 3 deletions(-)

diff --git a/drivers/accel/qaic/qaic.h b/drivers/accel/qaic/qaic.h
index 0dbb8e32e4b9..7817ce18b8f2 100644
--- a/drivers/accel/qaic/qaic.h
+++ b/drivers/accel/qaic/qaic.h
@@ -213,8 +213,6 @@ struct qaic_bo {
 	bool			sliced;
 	/* Request ID of this BO if it is queued for execution */
 	u16			req_id;
-	/* Handle assigned to this BO */
-	u32			handle;
 	/* Wait on this for completion of DMA transfer of this BO */
 	struct completion	xfer_done;
 	/*
diff --git a/drivers/accel/qaic/qaic_data.c b/drivers/accel/qaic/qaic_data.c
index 1bce1af7c72c..797289e9d780 100644
--- a/drivers/accel/qaic/qaic_data.c
+++ b/drivers/accel/qaic/qaic_data.c
@@ -731,7 +731,6 @@ int qaic_create_bo_ioctl(struct drm_device *dev, void *data, struct drm_file *fi
 	if (ret)
 		goto free_bo;
 
-	bo->handle = args->handle;
 	drm_gem_object_put(obj);
 	srcu_read_unlock(&qdev->dev_lock, qdev_rcu_id);
 	srcu_read_unlock(&usr->qddev_lock, usr_rcu_id);
-- 
2.49.0

