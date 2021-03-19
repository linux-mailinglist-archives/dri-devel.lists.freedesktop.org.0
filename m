Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 3EE3B341751
	for <lists+dri-devel@lfdr.de>; Fri, 19 Mar 2021 09:24:56 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5E2DA6E99C;
	Fri, 19 Mar 2021 08:24:44 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ej1-x62e.google.com (mail-ej1-x62e.google.com
 [IPv6:2a00:1450:4864:20::62e])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A83086E9A3
 for <dri-devel@lists.freedesktop.org>; Fri, 19 Mar 2021 08:24:42 +0000 (UTC)
Received: by mail-ej1-x62e.google.com with SMTP id u9so8276446ejj.7
 for <dri-devel@lists.freedesktop.org>; Fri, 19 Mar 2021 01:24:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=U3+jQ9deg+F+hwlthzV/g98whTMSIMZPgh43ftXDf7Y=;
 b=OnTiL+kaW2zPMVdE6HXbsGxQ56nJJiDEZgsDJm5nTCAM4F/hYTuXOK2NTbkdhYGdNn
 UZMIHFqal4fYkP7086YR1KXfPAi/0CN+sG8/46L+IAM8dNP1vslB5d59gCck8HYzsxBX
 8OThjxGNbudGNQnMUlKQnrHaV4SeVJNDrOTuMKO2LAtp6PnZ9U75IsnFx32iuV4wLwfR
 XWhNw0uh22NIzQJ2aYGDTtCC5F6jAkh2TdHE5uwhbYDJrmsIshJDfYDky345zQdyg1hr
 76QZn0QUO3HPNj3coc1puorPSUkz0ygttAur5sEkxr6gt0JwQXwqn3E7UHaUJ0x2BUI0
 zBkg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=U3+jQ9deg+F+hwlthzV/g98whTMSIMZPgh43ftXDf7Y=;
 b=m8BjjWWOOiRga3kS60jG0tRRVVpeykqWfIlh+fPH00Kj9XsfWD6WOvy5dl6eVw+5YM
 fKJoLXMHtyGxpRch7uXIHt57eefLHmm7l267sUFb+hTdS8c+qfFqf2SUNWW9yz9SO9xB
 rCnzJsLY6Wvo/787wt4b08WMWU7cRjEFXcnukCDTrJWBf8FOoJaS4gD+ajlBNc1Iekhl
 c1KteWV968si2ZRD0y8bzuU9UFakFYpbZpUU6IkcXcNPgHOnUJxP5sdaPmsbS5rD1wLx
 rqwLfA0EZqD5H9O2bcjyRt0hPGTl87NuuMbnBVLoLTqhD9xq5d2qi5OMkwqG/E6OGQGs
 A8kg==
X-Gm-Message-State: AOAM532n958TsGJgj0546DO6oCZnadPV/uL6jozr5jrBSBQ9qGQm+NXQ
 KhcsxOLUfC4IeljW3phPSG+vYQ==
X-Google-Smtp-Source: ABdhPJzRvstPWZ77izvKn3KAab+DmdytKTVll16/lNiRi658rs93jLltp05EkycgqyLl7Df3JOnGwA==
X-Received: by 2002:a17:907:2112:: with SMTP id
 qn18mr2967233ejb.220.1616142281401; 
 Fri, 19 Mar 2021 01:24:41 -0700 (PDT)
Received: from dell.default ([91.110.221.194])
 by smtp.gmail.com with ESMTPSA id b18sm3273727ejb.77.2021.03.19.01.24.40
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 19 Mar 2021 01:24:40 -0700 (PDT)
From: Lee Jones <lee.jones@linaro.org>
To: lee.jones@linaro.org
Subject: [PATCH 09/19] drm/nouveau/nvkm/engine/gr/gf100: Demote non-conformant
 kernel-doc header
Date: Fri, 19 Mar 2021 08:24:18 +0000
Message-Id: <20210319082428.3294591-10-lee.jones@linaro.org>
X-Mailer: git-send-email 2.27.0
In-Reply-To: <20210319082428.3294591-1-lee.jones@linaro.org>
References: <20210319082428.3294591-1-lee.jones@linaro.org>
MIME-Version: 1.0
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
Cc: David Airlie <airlied@linux.ie>, nouveau@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 Ben Skeggs <bskeggs@redhat.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Fixes the following W=1 kernel build warning(s):

 drivers/gpu/drm/nouveau/nvkm/engine/gr/gf100.c:992: warning: Function parameter or member 'gr' not described in 'gf100_gr_wait_idle'

Cc: Ben Skeggs <bskeggs@redhat.com>
Cc: David Airlie <airlied@linux.ie>
Cc: Daniel Vetter <daniel@ffwll.ch>
Cc: dri-devel@lists.freedesktop.org
Cc: nouveau@lists.freedesktop.org
Signed-off-by: Lee Jones <lee.jones@linaro.org>
---
 drivers/gpu/drm/nouveau/nvkm/engine/gr/gf100.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/nouveau/nvkm/engine/gr/gf100.c b/drivers/gpu/drm/nouveau/nvkm/engine/gr/gf100.c
index 397ff4fe9df89..69e6008f99196 100644
--- a/drivers/gpu/drm/nouveau/nvkm/engine/gr/gf100.c
+++ b/drivers/gpu/drm/nouveau/nvkm/engine/gr/gf100.c
@@ -982,7 +982,7 @@ gf100_gr_zbc_init(struct gf100_gr *gr)
 	}
 }
 
-/**
+/*
  * Wait until GR goes idle. GR is considered idle if it is disabled by the
  * MC (0x200) register, or GR is not busy and a context switch is not in
  * progress.
-- 
2.27.0

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
