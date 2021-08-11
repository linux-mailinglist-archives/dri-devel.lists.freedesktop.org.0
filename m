Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id CE4F83E8911
	for <lists+dri-devel@lfdr.de>; Wed, 11 Aug 2021 06:04:18 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0AB126E09F;
	Wed, 11 Aug 2021 04:04:14 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pj1-x1036.google.com (mail-pj1-x1036.google.com
 [IPv6:2607:f8b0:4864:20::1036])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 429E96E09F
 for <dri-devel@lists.freedesktop.org>; Wed, 11 Aug 2021 04:04:13 +0000 (UTC)
Received: by mail-pj1-x1036.google.com with SMTP id
 g12-20020a17090a7d0cb0290178f80de3d8so2455000pjl.2
 for <dri-devel@lists.freedesktop.org>; Tue, 10 Aug 2021 21:04:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=fbwUx6GXMW3Dlbo+z8/PAtWbJ3o5iFRSxzkJeC/usms=;
 b=ZJMhvRiTqCDwUxYRTOl/tQ3ZrcwQRdfkTnKLRM9rrG2BzQgb9GyKMNEEQJvIHqhkti
 +nB/72X9mDNKoh2dAEGEnhfyTSAIYR4PZfaWXvUEmeY7E3Oolvfp+8BsWCCSkPBl+Zs5
 jPhWdKUXjZUTt4CPznAZEzHRZwNWkvYSDc6Co=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=fbwUx6GXMW3Dlbo+z8/PAtWbJ3o5iFRSxzkJeC/usms=;
 b=LqmN9FVQ00wXNzR8V75w0OIy85TYaRVE1qZJ9XmRjkIYk8grrpKSaYx7pjrLR28u9z
 fXIQCPb5pxHka9PZimSpcNDOg7Z5caG+xZdYTjwo13EFjUb1VcH9xzi9inqzBSyop9Jh
 xjQq2J3rVi3avK6jSD5lGrL411CnY2Rnw7f+wuwUc6AKksoqOBc6GwXEtJRzNAtZrFu8
 VCyWJArnKTwyw+8bjqdWb32/Zgg8v4T5HzqGoX8AJpafjM/U6D+ahHAE/xkzfnhNadEt
 /jQRM3Npbm+1zGhyUDuAj0YpDiqcBCgbJoivUqDOD/gdRJAWfuJP6buCn1vZzBepgqmR
 /wTA==
X-Gm-Message-State: AOAM532EnEieiNcq4tr8yNGtF2IEeLdzM0/Frje1HTu2xrRF5WrneGD1
 K14bYTZKGA/6RffoqGSKuKJRPg==
X-Google-Smtp-Source: ABdhPJzC8qyLxsD74RrEYm1akGKAJ19CTxyB+xOtz4fHbmd7qToqju7UJNrumgFryRNQsjk7HrotbA==
X-Received: by 2002:a17:90a:de0b:: with SMTP id
 m11mr8549187pjv.39.1628654652916; 
 Tue, 10 Aug 2021 21:04:12 -0700 (PDT)
Received: from localhost ([2401:fa00:8f:203:1e5c:70cb:3289:1b5b])
 by smtp.gmail.com with UTF8SMTPSA id ns4sm4654607pjb.51.2021.08.10.21.04.11
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 10 Aug 2021 21:04:12 -0700 (PDT)
From: David Stevens <stevensd@chromium.org>
To: Gerd Hoffmann <kraxel@redhat.com>
Cc: dri-devel@lists.freedesktop.org,
	David Stevens <stevensd@chromium.org>
Subject: [PATCH] drm/virtio: set non-cross device blob uuid_state
Date: Wed, 11 Aug 2021 13:04:01 +0900
Message-Id: <20210811040401.1264234-1-stevensd@chromium.org>
X-Mailer: git-send-email 2.32.0.605.g8dce9f2422-goog
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

Blob resources without the cross device flag don't have a uuid to share
with other virtio devices. When exporting such blobs, set uuid_state to
STATE_ERR so that virtgpu_virtio_get_uuid doesn't hang.

Signed-off-by: David Stevens <stevensd@chromium.org>
---
 drivers/gpu/drm/virtio/virtgpu_prime.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/drivers/gpu/drm/virtio/virtgpu_prime.c b/drivers/gpu/drm/virtio/virtgpu_prime.c
index 807a27a16365..e45dbf14b307 100644
--- a/drivers/gpu/drm/virtio/virtgpu_prime.c
+++ b/drivers/gpu/drm/virtio/virtgpu_prime.c
@@ -98,6 +98,8 @@ struct dma_buf *virtgpu_gem_prime_export(struct drm_gem_object *obj,
 		} else {
 			bo->uuid_state = STATE_ERR;
 		}
+	} else if (!(bo->blob_flags & VIRTGPU_BLOB_FLAG_USE_CROSS_DEVICE)) {
+		bo->uuid_state = STATE_ERR;
 	}
 
 	exp_info.ops = &virtgpu_dmabuf_ops.ops;
-- 
2.32.0.605.g8dce9f2422-goog

