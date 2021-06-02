Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 51C98398CEB
	for <lists+dri-devel@lfdr.de>; Wed,  2 Jun 2021 16:33:43 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5C3186ECC0;
	Wed,  2 Jun 2021 14:33:26 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x42c.google.com (mail-wr1-x42c.google.com
 [IPv6:2a00:1450:4864:20::42c])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 951226ECBF
 for <dri-devel@lists.freedesktop.org>; Wed,  2 Jun 2021 14:33:24 +0000 (UTC)
Received: by mail-wr1-x42c.google.com with SMTP id f2so2516760wri.11
 for <dri-devel@lists.freedesktop.org>; Wed, 02 Jun 2021 07:33:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=d0nOIc1mzt8v7aTq8P9bTAYTfjAP1Kn9fRgBobUfORA=;
 b=tSzVDkn4KcWdhzDzNsZip5cu2zKF7f0SGaGpOeWTuwCH+0fxCugizjmJtvChNK7t+V
 mpDrlynprH5KJmIgn42ZQ/o5zYEvQ4vWLMnvKG8Ed2o7L7HWVaFJG8hn368YWJ1nd2LW
 4c746lB6R99b2g91Dwsihqjq/phbUmYHQmENAbEMiWVDBCMX5qsuKWp4lY775RukY5Di
 uubL1YluRv3Cs1hoU2hG30XhYEZtvTNlISLKXEeHvgS3XyefTL9FQKHXjDCT7eCskiWG
 9o1d7XI5noxEdG5lRVRx1J+GyQyt0ikUWamSHmpNQxwryL3VHl6CqkIFjXJbXNLc7HxC
 kqLQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=d0nOIc1mzt8v7aTq8P9bTAYTfjAP1Kn9fRgBobUfORA=;
 b=Be/hRgazmrxF46eRuovAVEQ5qAcJZFZtowlyH5PvQkbVA0YZVMy6QeR53JqXEwvoFH
 A9oK6QtylhqOL+F40PNfnEqwFLrq5k2bstjGqhJsgtXJpmC1RDxnlRkpPfF7BlGWZMyN
 e5xq2paAK6S1Mfcs0fvkhddix/i+l7iZadz4ze4ZQrV9vvTZP/b11+iVW7fwOsw0zywF
 NAX5S30WcyFEP4UU8f8bjOvbwzuzEwbE4G+oUXXzmGKaoMN1oegX3NXbBpy3hWAhTBgB
 z0O5OY/RXLi8/gGzo/i1NbgxiG0ysontfeaprnUpL/9UvToMhRoH8YUiwCOh8GPksKOR
 ZFHg==
X-Gm-Message-State: AOAM532kWxhX/ISFkyeJ/9AeIbMpd73ZNU/xnbP7Op6981Tu0QwIH1xl
 ggJbJQc4FoIgBWk22zw1GQBxOw==
X-Google-Smtp-Source: ABdhPJyuJWVPFCq8ke4Ux8r5rzSxfpfkMshp25BkWH+joTfvu5tLeJqfuuvJvUX1vOUfItFxxByl1Q==
X-Received: by 2002:adf:ef06:: with SMTP id e6mr22764784wro.393.1622644403125; 
 Wed, 02 Jun 2021 07:33:23 -0700 (PDT)
Received: from dell.default ([91.110.221.214])
 by smtp.gmail.com with ESMTPSA id o11sm132315wrq.93.2021.06.02.07.33.21
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 02 Jun 2021 07:33:22 -0700 (PDT)
From: Lee Jones <lee.jones@linaro.org>
To: lee.jones@linaro.org
Subject: [RESEND 12/26] drm/msm/msm_gem: Demote kernel-doc abuses
Date: Wed,  2 Jun 2021 15:32:46 +0100
Message-Id: <20210602143300.2330146-13-lee.jones@linaro.org>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210602143300.2330146-1-lee.jones@linaro.org>
References: <20210602143300.2330146-1-lee.jones@linaro.org>
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
Cc: freedreno@lists.freedesktop.org, David Airlie <airlied@linux.ie>,
 linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org,
 =?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>,
 linaro-mm-sig@lists.linaro.org, Sean Paul <sean@poorly.run>,
 linux-media@vger.kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Fixes the following W=1 kernel build warning(s):

 drivers/gpu/drm/msm/msm_gem.c:364: warning: This comment starts with '/**', but isn't a kernel-doc comment. Refer Documentation/doc-guide/kernel-doc.rst
 drivers/gpu/drm/msm/msm_gem.c:763: warning: This comment starts with '/**', but isn't a kernel-doc comment. Refer Documentation/doc-guide/kernel-doc.rst

Cc: Rob Clark <robdclark@gmail.com>
Cc: Sean Paul <sean@poorly.run>
Cc: David Airlie <airlied@linux.ie>
Cc: Daniel Vetter <daniel@ffwll.ch>
Cc: Sumit Semwal <sumit.semwal@linaro.org>
Cc: "Christian König" <christian.koenig@amd.com>
Cc: linux-arm-msm@vger.kernel.org
Cc: dri-devel@lists.freedesktop.org
Cc: freedreno@lists.freedesktop.org
Cc: linux-media@vger.kernel.org
Cc: linaro-mm-sig@lists.linaro.org
Signed-off-by: Lee Jones <lee.jones@linaro.org>
---
 drivers/gpu/drm/msm/msm_gem.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/msm/msm_gem.c b/drivers/gpu/drm/msm/msm_gem.c
index 56df86e5f7400..15434deb19334 100644
--- a/drivers/gpu/drm/msm/msm_gem.c
+++ b/drivers/gpu/drm/msm/msm_gem.c
@@ -372,7 +372,7 @@ static void del_vma(struct msm_gem_vma *vma)
 	kfree(vma);
 }
 
-/**
+/*
  * If close is true, this also closes the VMA (releasing the allocated
  * iova range) in addition to removing the iommu mapping.  In the eviction
  * case (!close), we keep the iova allocated, but only remove the iommu
@@ -773,7 +773,7 @@ void msm_gem_purge(struct drm_gem_object *obj)
 			0, (loff_t)-1);
 }
 
-/**
+/*
  * Unpin the backing pages and make them available to be swapped out.
  */
 void msm_gem_evict(struct drm_gem_object *obj)
-- 
2.31.1

