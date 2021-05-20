Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 067FD38AD54
	for <lists+dri-devel@lfdr.de>; Thu, 20 May 2021 14:03:09 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 07B316F40E;
	Thu, 20 May 2021 12:03:02 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-x32d.google.com (mail-wm1-x32d.google.com
 [IPv6:2a00:1450:4864:20::32d])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 850FF6F40C
 for <dri-devel@lists.freedesktop.org>; Thu, 20 May 2021 12:02:56 +0000 (UTC)
Received: by mail-wm1-x32d.google.com with SMTP id u133so9024317wmg.1
 for <dri-devel@lists.freedesktop.org>; Thu, 20 May 2021 05:02:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=lGLjcLP6XbktLbs6h51Tzfo9UCd4ALnwNCABJxfHlD8=;
 b=RswVceEghKvRou9H+Y+n/4SGLr0iHCK4YwE3OtciUiXOYGX33RrcazH0XHhG0gM+FR
 gDrggVWuc+eJ1ovzgkuY+nVHRfRMrHXKxfrg+GjAq4UJ/sIPYyWgLURB/U1ydhi+rjL4
 a0gT7DPM+iyP3Hdl+CY7cNrDKLkgXD97xlVuD0YpS0TAa4vANNYC4IZAtHLY7yOiIGnZ
 TsXH7/P3K+/tLqt6ivBjAxI4vTZTF19wicEn7EeqL1MYCjzYWyLcJe3EkWuV3k4dV2u7
 WSngNPnxaWDxif2K48yALBZJ+wpI3RYui68JmuoX7vY6B1uSkUmP+m9gPbGh1rpieE3S
 mQ5A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=lGLjcLP6XbktLbs6h51Tzfo9UCd4ALnwNCABJxfHlD8=;
 b=K5Rxi3R7iJAHz3DucuOB2w2zmaTAPHSLKHMCvQ0sGGAiqE+2Xk0uyDSrBqR1Gxo8ni
 LTs8tZbjI1y/6T6HqQJ1Otx7Xvab3BcGDzP74HIeWgTqVgFS0avYP5MqJsSSs+Q2Buf7
 KwWKiA6L8p/OJl0QghNNnKKIra9uV+z9BeInxduCZAPFG+5R/1kd+c69Tn2TaRiNtlMM
 YwL1RAm6ikMUKoXUQM6PwJu1MxNtYH+UPezBlU9i7xos+ubBVazls0G0ix+xOiH/yNZU
 bZVs+jkQRpSfNaR69km6aLfJ6vox0y3YeBeht9BAHxptu2ASpDWc8UdE9rEy23F2TnXK
 FY7g==
X-Gm-Message-State: AOAM530XSQoCFfEBpfFpvnBvq32QKCtYESbLbeELl19IqQQK73/9v+LM
 RG3YEoU072APp04KmSiDjZJRwQ==
X-Google-Smtp-Source: ABdhPJxYJE37rXT7HUjUcMLnTidaMQQQNRQYf0bEaPu9Z9ouJiVKZK37ju5F7bwa1KL/1nYfylvzFg==
X-Received: by 2002:a1c:e241:: with SMTP id z62mr3728499wmg.135.1621512175250; 
 Thu, 20 May 2021 05:02:55 -0700 (PDT)
Received: from dell.default ([91.110.221.215])
 by smtp.gmail.com with ESMTPSA id j10sm2886332wrt.32.2021.05.20.05.02.54
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 20 May 2021 05:02:54 -0700 (PDT)
From: Lee Jones <lee.jones@linaro.org>
To: lee.jones@linaro.org
Subject: [PATCH 03/38] drm/radeon/radeon_cs: Fix incorrectly documented
 function 'radeon_cs_parser_fini'
Date: Thu, 20 May 2021 13:02:13 +0100
Message-Id: <20210520120248.3464013-4-lee.jones@linaro.org>
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
Cc: David Airlie <airlied@linux.ie>, linux-kernel@vger.kernel.org,
 amd-gfx@lists.freedesktop.org,
 =?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>,
 linaro-mm-sig@lists.linaro.org, Jerome Glisse <glisse@freedesktop.org>,
 dri-devel@lists.freedesktop.org, Alex Deucher <alexander.deucher@amd.com>,
 linux-media@vger.kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Fixes the following W=1 kernel build warning(s):

 drivers/gpu/drm/radeon/radeon_cs.c:417: warning: expecting prototype for cs_parser_fini(). Prototype was for radeon_cs_parser_fini() instead

Cc: Alex Deucher <alexander.deucher@amd.com>
Cc: "Christian König" <christian.koenig@amd.com>
Cc: David Airlie <airlied@linux.ie>
Cc: Daniel Vetter <daniel@ffwll.ch>
Cc: Sumit Semwal <sumit.semwal@linaro.org>
Cc: Jerome Glisse <glisse@freedesktop.org>
Cc: amd-gfx@lists.freedesktop.org
Cc: dri-devel@lists.freedesktop.org
Cc: linux-media@vger.kernel.org
Cc: linaro-mm-sig@lists.linaro.org
Signed-off-by: Lee Jones <lee.jones@linaro.org>
---
 drivers/gpu/drm/radeon/radeon_cs.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/radeon/radeon_cs.c b/drivers/gpu/drm/radeon/radeon_cs.c
index 48162501c1ee6..80a3bee933d6d 100644
--- a/drivers/gpu/drm/radeon/radeon_cs.c
+++ b/drivers/gpu/drm/radeon/radeon_cs.c
@@ -405,7 +405,7 @@ static int cmp_size_smaller_first(void *priv, const struct list_head *a,
 }
 
 /**
- * cs_parser_fini() - clean parser states
+ * radeon_cs_parser_fini() - clean parser states
  * @parser:	parser structure holding parsing context.
  * @error:	error number
  * @backoff:	indicator to backoff the reservation
-- 
2.31.1

