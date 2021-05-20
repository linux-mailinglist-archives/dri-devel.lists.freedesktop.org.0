Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 169C038AD73
	for <lists+dri-devel@lfdr.de>; Thu, 20 May 2021 14:03:51 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 246C86F42C;
	Thu, 20 May 2021 12:03:36 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x430.google.com (mail-wr1-x430.google.com
 [IPv6:2a00:1450:4864:20::430])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CE75B892DC
 for <dri-devel@lists.freedesktop.org>; Thu, 20 May 2021 12:03:18 +0000 (UTC)
Received: by mail-wr1-x430.google.com with SMTP id a4so17424152wrr.2
 for <dri-devel@lists.freedesktop.org>; Thu, 20 May 2021 05:03:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=d0nOIc1mzt8v7aTq8P9bTAYTfjAP1Kn9fRgBobUfORA=;
 b=ZCHECdMPQ0Pe1h9k9kzuKcqsiVmGcY0RaFk2/Uo7Jd0Oj/FbXRq9cfiLMqHYu5Q50V
 2BaorOWqD5ShyQ6E1DvzyyLfwG8BNwM8i6uSs9LOugICo7o0YWFtBpTjqeQZa5XQ9TJg
 s2yIsIi8JTdiv2VrJ6ErOC84MKKa0+xNvHdb4TyvnPjXdWnI4FtdJBjjjgHgHUtdDCA0
 gAo8ZoMYgSzZ6maczQ+QyihatSrk4GMM41jL+9tFzauV7/+8UM1bSbL7JY468aL2/sYh
 zOYI6p54xXxQREjKWvvbZpMm5wZR7N7BbkFHzHN+Hp1v1P0Nu1bSb2FRKojIsZ1dmJZe
 Ae3g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=d0nOIc1mzt8v7aTq8P9bTAYTfjAP1Kn9fRgBobUfORA=;
 b=b/cQYr4rq0vUy6Zigf5wW7clphR0IyGotouhbv4UTC9PQKYGWtzJwPPBGeE8dxNsRD
 n874QlCsaUCmBYa5ht+CEXXRe0rlzQDNiqDMTgz8KX7FqDldSNV/sgo4MeR4Ezdt+NDl
 cbt5OUJHxObR/9KBmRjUkq29ymS04aIv0687mr/WtN7kjFcaN5U+cuGxwsjvznTGoQ3H
 15yftOITlBk+0HtuFzeQ2HM5cMKwhiVpT8PT/AgRT4xuZF7OPEEfpEkyKONsQBfzk5L7
 +DU6ABo5nyqzS1WfjnXxjJ8zjJP+g9TT58/T5Hovl3IQrM0DO+tCTzjRvNbVL56+mdRk
 5ZiQ==
X-Gm-Message-State: AOAM5334rSykUafNZIxVqnXdhy/RLECcxtIOoGFkPPt0EMi0YCbzuZWX
 CoSz3hAddSihcsMtPRNrWfMdeg==
X-Google-Smtp-Source: ABdhPJxogKt9bFNGrmh6EK/JtPm7PPL/+ZIKAX6rKP8QgZWPF6yidqkW2wwqG5YDIrjwdrD88Q4RGA==
X-Received: by 2002:a5d:6381:: with SMTP id p1mr3973571wru.19.1621512197569;
 Thu, 20 May 2021 05:03:17 -0700 (PDT)
Received: from dell.default ([91.110.221.215])
 by smtp.gmail.com with ESMTPSA id j10sm2886332wrt.32.2021.05.20.05.03.16
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 20 May 2021 05:03:17 -0700 (PDT)
From: Lee Jones <lee.jones@linaro.org>
To: lee.jones@linaro.org
Subject: [PATCH 25/38] drm/msm/msm_gem: Demote kernel-doc abuses
Date: Thu, 20 May 2021 13:02:35 +0100
Message-Id: <20210520120248.3464013-26-lee.jones@linaro.org>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210520120248.3464013-1-lee.jones@linaro.org>
References: <20210520120248.3464013-1-lee.jones@linaro.org>
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

