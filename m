Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 87E34398CF3
	for <lists+dri-devel@lfdr.de>; Wed,  2 Jun 2021 16:33:47 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7900E6ECC9;
	Wed,  2 Jun 2021 14:33:29 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-x333.google.com (mail-wm1-x333.google.com
 [IPv6:2a00:1450:4864:20::333])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 81F416ECC3
 for <dri-devel@lists.freedesktop.org>; Wed,  2 Jun 2021 14:33:27 +0000 (UTC)
Received: by mail-wm1-x333.google.com with SMTP id
 o2-20020a05600c4fc2b029019a0a8f959dso1825646wmq.1
 for <dri-devel@lists.freedesktop.org>; Wed, 02 Jun 2021 07:33:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=SjYtCEx4Gm+TGSpGlmvvhCGW5wnbP6a4KsRuIEipo4s=;
 b=gofFevHTLNP8OF2mr2XqTcfqX1D3ngKNuZkPIThUZ73Sp9nI1B1Y8Tv/hVti3HkZ4s
 tWgT8IUhvVnFoBxbeWx3jn/nCNincbNXHzx9B6lZygFD3Cmrl1/GliP9x5+FqnKxuPfm
 edhx4dGvfjtFqI2hI0dZirgAh2HzbbwtsnovQrHetfPrP5AImxGrEqUHfmWDl53UHqKs
 /+0zrGfOn8gh9ia/+b83GKKJBPIOXAVM31QEAOYOYsPQyU57Q/x0kj+ovAtNleLZnv5t
 00TuL9IjHwDR0WWej7u0zyCtlYD2ZkTnzOWAQUY+i5DZV7ZSP+s5VOJj084G1ZggEaNK
 yZfg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=SjYtCEx4Gm+TGSpGlmvvhCGW5wnbP6a4KsRuIEipo4s=;
 b=s8VMhEaReQLTZfA6iKS9+P0Sq4BHlYMoNvXG5FyXaHhmLDCfbIO3JE1EXTkvaEU8k+
 sP0ecwI4Cn7hYa3y0j7GuWqnOfDM+Ckd1s5DtZCMPWbKrTvmPGSvx7E6lGBLstfN5nhW
 48M3vc4M1FxhdBbzGO7jnUEW+IKREOuZyT+Vz97bfakd1bVH2bhxS+aLFp3hZ22HfCmp
 KtDE5AEDOeMypeUHhPCtHjkWmRi7TUXBqABD7GB6rdrcHgVpFLd+yeaGfRfcu5bj5Vyr
 Q0LAeNF09pGbYiLXn0YBUb1WdTEjBQjU/63j4z1nJ2ucnhAn1kbNlGzxFbpUfKQ0aFnF
 aPOw==
X-Gm-Message-State: AOAM5302K3w7F3uZIZrnkiCyPypGzoSzNMHKh8EsJqjbJoHTWScYGB5o
 BDF+gGSVLecxbqoLgVlGEtK9qA==
X-Google-Smtp-Source: ABdhPJx3OI3S8vnYR8EVGsMrIxEMMmnLlVVY9ywmN5evmDEYm9hwef+Z9UJbAvOn0EMCoEwbTJPJvg==
X-Received: by 2002:a7b:cbc2:: with SMTP id n2mr5534394wmi.116.1622644406183; 
 Wed, 02 Jun 2021 07:33:26 -0700 (PDT)
Received: from dell.default ([91.110.221.214])
 by smtp.gmail.com with ESMTPSA id o11sm132315wrq.93.2021.06.02.07.33.25
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 02 Jun 2021 07:33:25 -0700 (PDT)
From: Lee Jones <lee.jones@linaro.org>
To: lee.jones@linaro.org
Subject: [RESEND 15/26] drm/nouveau/nvkm/subdev/mc/tu102: Make functions
 called by reference static
Date: Wed,  2 Jun 2021 15:32:49 +0100
Message-Id: <20210602143300.2330146-16-lee.jones@linaro.org>
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

