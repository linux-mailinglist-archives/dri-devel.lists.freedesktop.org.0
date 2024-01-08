Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 8E0638278BC
	for <lists+dri-devel@lfdr.de>; Mon,  8 Jan 2024 20:50:29 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C9EA910E2C3;
	Mon,  8 Jan 2024 19:50:24 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pg1-x52d.google.com (mail-pg1-x52d.google.com
 [IPv6:2607:f8b0:4864:20::52d])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A255910E2C3;
 Mon,  8 Jan 2024 19:50:23 +0000 (UTC)
Received: by mail-pg1-x52d.google.com with SMTP id
 41be03b00d2f7-5cdbc4334edso669447a12.3; 
 Mon, 08 Jan 2024 11:50:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1704743422; x=1705348222; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=2R0zlBz2DXccrkgQnIyzHmDUvfxpJFjGNN3AHHEOyFM=;
 b=RrU7NJnxoTd52adz0stpROQc4ncEAY5MlGz6/Jgy3wjBBskVNCl6dJjNPeN3YMA9Z3
 tiAVqRhwKPUQjUwA/ODDgCoH6KV2cW0ymC372N5Oc6nykyalG4iC2YPa3YfQZLkR1CDW
 D71lI0nXTV5G+vrgz72ZjQklkA1d/bANWCGS7YcF5gHVIzhnJ0lCG7o+0fBpyjPv5zk3
 m2wf+ES9zrQ7n2TqFGpeIdsJiYtm8YzUQdQLjl++umHPj5TARD2/qbDj2EpAYbUdhcap
 EyWFP0EISJkl32Fq5vPdvuuDzCzN7PLMj5Era20AKIS0TDKQWlr+At/vIgwVcfJJo6t0
 bVWg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1704743422; x=1705348222;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=2R0zlBz2DXccrkgQnIyzHmDUvfxpJFjGNN3AHHEOyFM=;
 b=ftXXTaPFin/ahX+a4GklFpuw/xwOvomcbyDOhMwB2eCqvwvbViFZJcmBBwQk+jPOYX
 8Jz/l0QD4XRyTiReFQqqqHfWsrToijRTuehGKyAXP0mIjbhfIPvbscjlr9g9E8lx4aIh
 7oYrxne6s1BctkaM7/OrZ+YVqU7ZxBSJC1sXBfp/v73/jd+dmDYCH7dCw+xka0MFcHsW
 GW6Dv1HZFrd1VgSgjqMNeyGgRJ40HVUkxqnCN76cR+Q8AOyuXy2IwYNRnO61b5z6eNQ+
 4dVT8UvFqp7Auerd/IJ4FApcLtIX4f3KYZGT8fAxexziwzQAV0OD6kVvj4Ozr6NfbEwJ
 /KeQ==
X-Gm-Message-State: AOJu0YwEb3OMpeKJS76XW8YKjlYi2O+qXEeftdBPOrfSd/sx4Oq8k7Yk
 Q+ab1byNTM1NS0z8IzhOOJ8XpkwXn3M=
X-Google-Smtp-Source: AGHT+IFf7bb+iQyGZCfeOZ4yETzKVzgPT8q475MfZ+Nn78kr9SK7zahR4amHIomcUp8eIV9KVHXxbw==
X-Received: by 2002:a17:90a:9742:b0:28d:7b8c:1038 with SMTP id
 i2-20020a17090a974200b0028d7b8c1038mr863770pjw.43.1704743422053; 
 Mon, 08 Jan 2024 11:50:22 -0800 (PST)
Received: from localhost ([2a00:79e1:2e00:1301:e1c5:6354:b45d:8ffc])
 by smtp.gmail.com with ESMTPSA id
 fr18-20020a17090ae2d200b0028ae0184bfasm6753441pjb.49.2024.01.08.11.50.21
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 08 Jan 2024 11:50:21 -0800 (PST)
From: Rob Clark <robdclark@gmail.com>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH] drm/ci: Add msm tests
Date: Mon,  8 Jan 2024 11:50:15 -0800
Message-ID: <20240108195016.156583-1-robdclark@gmail.com>
X-Mailer: git-send-email 2.43.0
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
Cc: Rob Clark <robdclark@chromium.org>, linux-arm-msm@vger.kernel.org,
 open list <linux-kernel@vger.kernel.org>, Maxime Ripard <mripard@kernel.org>,
 Helen Koike <helen.koike@collabora.com>,
 Thomas Zimmermann <tzimmermann@suse.de>, freedreno@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: Rob Clark <robdclark@chromium.org>

The msm tests should skip on non-msm hw, so I think it should be safe to
enable everywhere.

Signed-off-by: Rob Clark <robdclark@chromium.org>
---
 drivers/gpu/drm/ci/testlist.txt | 49 +++++++++++++++++++++++++++++++++
 1 file changed, 49 insertions(+)

diff --git a/drivers/gpu/drm/ci/testlist.txt b/drivers/gpu/drm/ci/testlist.txt
index f82cd90372f4..eaeb751bb0ad 100644
--- a/drivers/gpu/drm/ci/testlist.txt
+++ b/drivers/gpu/drm/ci/testlist.txt
@@ -2910,3 +2910,52 @@ kms_writeback@writeback-invalid-parameters
 kms_writeback@writeback-fb-id
 kms_writeback@writeback-check-output
 prime_mmap_kms@buffer-sharing
+msm_shrink@copy-gpu-sanitycheck-8
+msm_shrink@copy-gpu-sanitycheck-32
+msm_shrink@copy-gpu-8
+msm_shrink@copy-gpu-32
+msm_shrink@copy-gpu-madvise-8
+msm_shrink@copy-gpu-madvise-32
+msm_shrink@copy-gpu-oom-8
+msm_shrink@copy-gpu-oom-32
+msm_shrink@copy-mmap-sanitycheck-8
+msm_shrink@copy-mmap-sanitycheck-32
+msm_shrink@copy-mmap-8
+msm_shrink@copy-mmap-32
+msm_shrink@copy-mmap-madvise-8
+msm_shrink@copy-mmap-madvise-32
+msm_shrink@copy-mmap-oom-8
+msm_shrink@copy-mmap-oom-32
+msm_shrink@copy-mmap-dmabuf-sanitycheck-8
+msm_shrink@copy-mmap-dmabuf-sanitycheck-32
+msm_shrink@copy-mmap-dmabuf-8
+msm_shrink@copy-mmap-dmabuf-32
+msm_shrink@copy-mmap-dmabuf-madvise-8
+msm_shrink@copy-mmap-dmabuf-madvise-32
+msm_shrink@copy-mmap-dmabuf-oom-8
+msm_shrink@copy-mmap-dmabuf-oom-32
+msm_mapping@ring
+msm_mapping@sqefw
+msm_mapping@shadow
+msm_submitoverhead@submitbench-10-bos
+msm_submitoverhead@submitbench-10-bos-no-implicit-sync
+msm_submitoverhead@submitbench-100-bos
+msm_submitoverhead@submitbench-100-bos-no-implicit-sync
+msm_submitoverhead@submitbench-250-bos
+msm_submitoverhead@submitbench-250-bos-no-implicit-sync
+msm_submitoverhead@submitbench-500-bos
+msm_submitoverhead@submitbench-500-bos-no-implicit-sync
+msm_submitoverhead@submitbench-1000-bos
+msm_submitoverhead@submitbench-1000-bos-no-implicit-sync
+msm_recovery@hangcheck
+msm_recovery@gpu-fault
+msm_recovery@gpu-fault-parallel
+msm_recovery@iova-fault
+msm_submit@empty-submit
+msm_submit@invalid-queue-submit
+msm_submit@invalid-flags-submit
+msm_submit@invalid-in-fence-submit
+msm_submit@invalid-duplicate-bo-submit
+msm_submit@invalid-cmd-idx-submit
+msm_submit@invalid-cmd-type-submit
+msm_submit@valid-submit
-- 
2.43.0

