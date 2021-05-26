Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id DF5F63912DC
	for <lists+dri-devel@lfdr.de>; Wed, 26 May 2021 10:48:34 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 07D036EC61;
	Wed, 26 May 2021 08:48:25 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x436.google.com (mail-wr1-x436.google.com
 [IPv6:2a00:1450:4864:20::436])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6A9576EC3D
 for <dri-devel@lists.freedesktop.org>; Wed, 26 May 2021 08:48:03 +0000 (UTC)
Received: by mail-wr1-x436.google.com with SMTP id n2so267535wrm.0
 for <dri-devel@lists.freedesktop.org>; Wed, 26 May 2021 01:48:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=JvuBm7KpIXmVjvwi2OsKGMdogxy/zdINv8FqDSEvNYM=;
 b=Lqd5jcfBOyTJPW2tFudt8CJv9J24bMfUhxeVIJZ8LmLI4SntnbTDRQQKyC6gpxAHXz
 9bN24AK6T739jCAH8GscQi8AgLUwd+1GsQcwK5rlRKI9kY7T5vOPO8+dZWVsWF1LSCZ3
 vG+j9kMH6Avl7hje6v2lDCjezgRtIi2s8bjtXVftIff6+ZLU1WMKEWszoAmYPFPG+d0M
 l9HPG8kGlyHpAOjOVi8ub43lhmZysDxIVeNgKCjW/MPBpSpJ6EgC0SlVBD4MLyN3Lhk6
 xoqjjLeGwk8V6oZ2P+P27keDN+hsF4syPgMq8Kv2GGg9MDJI2j+cjGbUixn0xhZfGkxW
 N0RQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=JvuBm7KpIXmVjvwi2OsKGMdogxy/zdINv8FqDSEvNYM=;
 b=MVJZkDJhpR+SzY+d9649kEGeBOYLSqAbfvucAzAQstE8doOVVI6Ex+IbLw1oGC5vzq
 yF7WdFCw5enMIxHimOK3CxT3VaArY0u/3jcpu93xMFo0HTh5wds2U4bYziVT+pFGp/wn
 XU/Sf25vRpEsgS488Nyma46x5QylFYLMvuyERsglmcPvGr53424sv8jyDbvWK93GS1td
 5dyVwee8gI/kRnJhalpBrHz0LHCLweyj+BhCZfX3kbw4ivLM4fGtz25pCv3mj4Kk2BKO
 vm0ukJKct2pzqgqgT6XWaL31ffcd0NB1HMH3I9bGMtvtILJQ3nh7OPKA4MQTQaLpldFh
 Ylkg==
X-Gm-Message-State: AOAM5320P9/fRJl2ow/PZP2clR6yFYYfiN8Ap2zNOgNNWU72qEIXco8w
 pEOnOaQuc5O15z4EkDOZhrKJ0A==
X-Google-Smtp-Source: ABdhPJwxA+jqhLj0tvDnM1PGh5FH/QBEyrCkQJOeG+4sHZp0/bgWOd+eUHWE5+4mhkN/TVbBG84CAQ==
X-Received: by 2002:a5d:4346:: with SMTP id u6mr31620387wrr.304.1622018882087; 
 Wed, 26 May 2021 01:48:02 -0700 (PDT)
Received: from dell.default ([91.110.221.223])
 by smtp.gmail.com with ESMTPSA id l18sm18911918wrt.97.2021.05.26.01.48.01
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 26 May 2021 01:48:01 -0700 (PDT)
From: Lee Jones <lee.jones@linaro.org>
To: lee.jones@linaro.org
Subject: [PATCH 30/34] drm/vgem/vgem_drv: Standard comment blocks should not
 use kernel-doc format
Date: Wed, 26 May 2021 09:47:22 +0100
Message-Id: <20210526084726.552052-31-lee.jones@linaro.org>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210526084726.552052-1-lee.jones@linaro.org>
References: <20210526084726.552052-1-lee.jones@linaro.org>
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
Cc: Ben Widawsky <ben@bwidawsk.net>, David Airlie <airlied@linux.ie>,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 linaro-mm-sig@lists.linaro.org,
 =?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>,
 linux-media@vger.kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Fixes the following W=1 kernel build warning(s):

 drivers/gpu/drm/vgem/vgem_drv.c:47: warning: expecting prototype for This is vgem, a (non-hardware(). Prototype was for DRIVER_NAME() instead

Cc: David Airlie <airlied@linux.ie>
Cc: Daniel Vetter <daniel@ffwll.ch>
Cc: Sumit Semwal <sumit.semwal@linaro.org>
Cc: "Christian König" <christian.koenig@amd.com>
Cc: Adam Jackson <ajax@redhat.com>
Cc: Ben Widawsky <ben@bwidawsk.net>
Cc: dri-devel@lists.freedesktop.org
Cc: linux-media@vger.kernel.org
Cc: linaro-mm-sig@lists.linaro.org
Signed-off-by: Lee Jones <lee.jones@linaro.org>
---
 drivers/gpu/drm/vgem/vgem_drv.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/vgem/vgem_drv.c b/drivers/gpu/drm/vgem/vgem_drv.c
index a0e75f1d5d016..bf38a7e319d14 100644
--- a/drivers/gpu/drm/vgem/vgem_drv.c
+++ b/drivers/gpu/drm/vgem/vgem_drv.c
@@ -25,7 +25,7 @@
  *	Ben Widawsky <ben@bwidawsk.net>
  */
 
-/**
+/*
  * This is vgem, a (non-hardware-backed) GEM service.  This is used by Mesa's
  * software renderer and the X server for efficient buffer sharing.
  */
-- 
2.31.1

