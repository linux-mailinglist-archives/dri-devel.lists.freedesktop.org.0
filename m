Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id CC1E03912DB
	for <lists+dri-devel@lfdr.de>; Wed, 26 May 2021 10:48:33 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9055E6EC5A;
	Wed, 26 May 2021 08:48:23 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x433.google.com (mail-wr1-x433.google.com
 [IPv6:2a00:1450:4864:20::433])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E2F006E4C5
 for <dri-devel@lists.freedesktop.org>; Wed, 26 May 2021 08:47:42 +0000 (UTC)
Received: by mail-wr1-x433.google.com with SMTP id v12so204308wrq.6
 for <dri-devel@lists.freedesktop.org>; Wed, 26 May 2021 01:47:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=SjYtCEx4Gm+TGSpGlmvvhCGW5wnbP6a4KsRuIEipo4s=;
 b=k1w7aNlLT1e33HjFRfzfE/UNKNo0S/GpjOvyoBjBf/hSBqbU+mHpuVOC4MwqDZJDv0
 snC2Kzgy1Bmynda/6vGqWZAcIoOhIL201vTq6tYQVFZD/1G23DST+cA1Bn0EErZVOVWh
 J+81I50IbJqyFwwd+QKxO+UmcFzA0CQpPxsEmbzJrBnenMZs+9twXLjtaCkJvWf4LXLL
 HjC+MCrFrmUZNx2KrSyaJHPpyqc+jQiJZ0HlkjWoceJSs5UR2J4Lk4BMmvZSPhCMLLJB
 eeMSoO4uXccH9L0S4w9Rk9YQ5zJkC5Z/f2nJmK6Kl/ob+2DCmdVDD51nnJdAiYtHcGFO
 5z3w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=SjYtCEx4Gm+TGSpGlmvvhCGW5wnbP6a4KsRuIEipo4s=;
 b=ns9vtMYpguCqjuml3rC8zFzsY3v3bagddOizW2WVJplIkPKSfjXO+KvgSl8GXLkmuV
 RoL2Y3cri5YHIjstJlHrdPftQ9angJpBF9cedUuZmO5MRJtQ6ZQr87w3wcdlJhysPvjP
 8izEjmgHFnvSCoSJ64DLQeqVzfc+m023IRkHB/XLlOBNhEqJfCVWMcnNo7dXQMqhH0oq
 cjGT27//qRWjkpWtAzvWOMguqFCsjChLP1B9H5QV23dkTbk1jVK2SLvEYQYS/3FERJzQ
 7qjMWcjAno/wW4NZgT+Ze7R8/0L6DKLXy5NyDyhRt3KPvT2rNFPM8ZTSINzlHYZMjMiQ
 RvHw==
X-Gm-Message-State: AOAM533fAC5uFj+t7RBWM94S6sACWMkoLgw5dWmH2URqt0MXXAM2Ne4z
 ySOhPxgCuB9MFkaHS77/dzyjpQ==
X-Google-Smtp-Source: ABdhPJxkBloP9sj4QDUuVgg6Pp0GCfuC1kUavbMKW3GJ7C1DQ9Z+b1WzJFjhv91nuhvw1t+89Vvu6g==
X-Received: by 2002:adf:f9d0:: with SMTP id w16mr32450663wrr.336.1622018861604; 
 Wed, 26 May 2021 01:47:41 -0700 (PDT)
Received: from dell.default ([91.110.221.223])
 by smtp.gmail.com with ESMTPSA id l18sm18911918wrt.97.2021.05.26.01.47.40
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 26 May 2021 01:47:41 -0700 (PDT)
From: Lee Jones <lee.jones@linaro.org>
To: lee.jones@linaro.org
Subject: [PATCH 11/34] drm/nouveau/nvkm/subdev/mc/tu102: Make functions called
 by reference static
Date: Wed, 26 May 2021 09:47:03 +0100
Message-Id: <20210526084726.552052-12-lee.jones@linaro.org>
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
Cc: David Airlie <airlied@linux.ie>, nouveau@lists.freedesktop.org,
 Alistair Popple <apopple@nvidia.com>, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, Ben Skeggs <bskeggs@redhat.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Fixes the following W=1 kernel build warning(s):

 drivers/gpu/drm/nouveau/nvkm/subdev/mc/tu102.c:50:1: warning: no previous prototype for ‘tu102_mc_intr_unarm’ [-Wmissing-prototypes]
 drivers/gpu/drm/nouveau/nvkm/subdev/mc/tu102.c:62:1: warning: no previous prototype for ‘tu102_mc_intr_rearm’ [-Wmissing-prototypes]
 drivers/gpu/drm/nouveau/nvkm/subdev/mc/tu102.c:74:1: warning: no previous prototype for ‘tu102_mc_intr_mask’ [-Wmissing-prototypes]

Cc: Ben Skeggs <bskeggs@redhat.com>
Cc: David Airlie <airlied@linux.ie>
Cc: Daniel Vetter <daniel@ffwll.ch>
Cc: Alistair Popple <apopple@nvidia.com>
Cc: dri-devel@lists.freedesktop.org
Cc: nouveau@lists.freedesktop.org
Signed-off-by: Lee Jones <lee.jones@linaro.org>
---
 drivers/gpu/drm/nouveau/nvkm/subdev/mc/tu102.c | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/drivers/gpu/drm/nouveau/nvkm/subdev/mc/tu102.c b/drivers/gpu/drm/nouveau/nvkm/subdev/mc/tu102.c
index 58db83ebadc5f..a96084b34a788 100644
--- a/drivers/gpu/drm/nouveau/nvkm/subdev/mc/tu102.c
+++ b/drivers/gpu/drm/nouveau/nvkm/subdev/mc/tu102.c
@@ -46,7 +46,7 @@ tu102_mc_intr_update(struct tu102_mc *mc)
 		nvkm_wr32(device, 0xb81610, 0x6);
 }
 
-void
+static void
 tu102_mc_intr_unarm(struct nvkm_mc *base)
 {
 	struct tu102_mc *mc = tu102_mc(base);
@@ -58,7 +58,7 @@ tu102_mc_intr_unarm(struct nvkm_mc *base)
 	spin_unlock_irqrestore(&mc->lock, flags);
 }
 
-void
+static void
 tu102_mc_intr_rearm(struct nvkm_mc *base)
 {
 	struct tu102_mc *mc = tu102_mc(base);
@@ -70,7 +70,7 @@ tu102_mc_intr_rearm(struct nvkm_mc *base)
 	spin_unlock_irqrestore(&mc->lock, flags);
 }
 
-void
+static void
 tu102_mc_intr_mask(struct nvkm_mc *base, u32 mask, u32 intr)
 {
 	struct tu102_mc *mc = tu102_mc(base);
-- 
2.31.1

