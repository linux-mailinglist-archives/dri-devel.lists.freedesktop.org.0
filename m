Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 12CA538C1BE
	for <lists+dri-devel@lfdr.de>; Fri, 21 May 2021 10:25:53 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EB9876E4B3;
	Fri, 21 May 2021 08:25:48 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-x336.google.com (mail-wm1-x336.google.com
 [IPv6:2a00:1450:4864:20::336])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CF5306E4B3
 for <dri-devel@lists.freedesktop.org>; Fri, 21 May 2021 08:25:22 +0000 (UTC)
Received: by mail-wm1-x336.google.com with SMTP id u133so10629867wmg.1
 for <dri-devel@lists.freedesktop.org>; Fri, 21 May 2021 01:25:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ffwll.ch; s=google;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=VuTwYX4Q26caaR9IN1tjc2go7zoMoQua0a3RckpZLx0=;
 b=L+KIDk7nhsI/m97OqsOzeJ8QOYgeF4E8st1gFL5OjUrpBEbmbjBBlvXrkC2k+ne5cW
 8TG39wbXCJd0f3YENUG4pgtsG9qpmPNOKeJrwZthCU6t6An4NNLqCyq48XvZhhdgmdOn
 oFA8Yrr8BXuUxqaJzwl9FiwGJK3ll7uvJ3+1Y=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=VuTwYX4Q26caaR9IN1tjc2go7zoMoQua0a3RckpZLx0=;
 b=iCaREaTuZU9Gd3e1C8TOD/1ehpV23mLyLAQrSJRth5KVuGMLzbmDqs+MoOUdfH38so
 2MqjZE+yrkd9u56VEaC93ab7y+Ja+vqg59FuuaRHKJKjLXqjm53EPIG5Y9NzpjXBWjt2
 MOjZhM9hkMc9YPOFgmsyv4le4f1Jh+KjhfrRRMkIWACgzOQnvI0Ntay5dYIlAluSWhut
 he1aiGn8LbPxCJ3fETkPMlnKv7M8o9zbJC4x740JyBVAZ7RcxBL2YPgXmcLWTEQkWCDE
 njekhhv9fHGTX6b+6yLiCp+i6wGv1uc1kkjlOnXBBGw5Tf4tMDNp/9hQfX2g6PquqODl
 lDMQ==
X-Gm-Message-State: AOAM532iHg491jgeDEm0cpbBBZPDIKBqaFuTSXteUVqSlWp2K0N8VgZc
 VHpGz92j9ZGkzUck2Py0blJspy29uMlj0A==
X-Google-Smtp-Source: ABdhPJwpq8MvTk0i71/cS6Xwd8UgAniNeakCY1BQO7ahoqJqMzvB7DSqVR/JYfS3O+UIO1Toqi+nCQ==
X-Received: by 2002:a05:600c:2c1:: with SMTP id 1mr147948wmn.93.1621585521662; 
 Fri, 21 May 2021 01:25:21 -0700 (PDT)
Received: from phenom.ffwll.local ([2a02:168:57f4:0:efd0:b9e5:5ae6:c2fa])
 by smtp.gmail.com with ESMTPSA id n13sm1250976wrg.75.2021.05.21.01.25.20
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 21 May 2021 01:25:21 -0700 (PDT)
From: Daniel Vetter <daniel.vetter@ffwll.ch>
To: DRI Development <dri-devel@lists.freedesktop.org>
Subject: [PATCH] drm/doc: Includ fence chain api
Date: Fri, 21 May 2021 10:24:57 +0200
Message-Id: <20210521082457.1656333-1-daniel.vetter@ffwll.ch>
X-Mailer: git-send-email 2.31.0
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
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
Cc: Daniel Vetter <daniel.vetter@ffwll.ch>, linaro-mm-sig@lists.linaro.org,
 Daniel Vetter <daniel.vetter@intel.com>,
 =?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>,
 linux-media@vger.kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

We have this nice kerneldoc, but forgot to include it.

Signed-off-by: Daniel Vetter <daniel.vetter@intel.com>
Cc: Sumit Semwal <sumit.semwal@linaro.org>
Cc: "Christian König" <christian.koenig@amd.com>
Cc: linux-media@vger.kernel.org
Cc: linaro-mm-sig@lists.linaro.org
---
 Documentation/driver-api/dma-buf.rst | 9 +++++++++
 1 file changed, 9 insertions(+)

diff --git a/Documentation/driver-api/dma-buf.rst b/Documentation/driver-api/dma-buf.rst
index 7f37ec30d9fd..7f21425d9435 100644
--- a/Documentation/driver-api/dma-buf.rst
+++ b/Documentation/driver-api/dma-buf.rst
@@ -178,6 +178,15 @@ DMA Fence Array
 .. kernel-doc:: include/linux/dma-fence-array.h
    :internal:
 
+DMA Fence Chain
+~~~~~~~~~~~~~~~
+
+.. kernel-doc:: drivers/dma-buf/dma-fence-chain.c
+   :export:
+
+.. kernel-doc:: include/linux/dma-fence-chain.h
+   :internal:
+
 DMA Fence uABI/Sync File
 ~~~~~~~~~~~~~~~~~~~~~~~~
 
-- 
2.31.0

