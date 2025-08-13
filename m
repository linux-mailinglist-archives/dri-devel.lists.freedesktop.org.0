Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B7AFAB24B12
	for <lists+dri-devel@lfdr.de>; Wed, 13 Aug 2025 15:51:05 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0A9C510E71C;
	Wed, 13 Aug 2025 13:51:04 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; secure) header.d=estudante.ufscar.br header.i=@estudante.ufscar.br header.b="T8s3ZxPN";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pl1-f175.google.com (mail-pl1-f175.google.com
 [209.85.214.175])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 905B210E71C
 for <dri-devel@lists.freedesktop.org>; Wed, 13 Aug 2025 13:51:02 +0000 (UTC)
Received: by mail-pl1-f175.google.com with SMTP id
 d9443c01a7336-23fe2be6061so6845235ad.0
 for <dri-devel@lists.freedesktop.org>; Wed, 13 Aug 2025 06:51:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=estudante.ufscar.br; s=google; t=1755093062; x=1755697862;
 darn=lists.freedesktop.org; 
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=LUvezD/YP4/BWL9WTYanNDY2Y50PSfkJDab/A2rW7GU=;
 b=T8s3ZxPN+5LzE7hf+viYb9TvwKc5LrW2UKMz99KAfj3eV6HLapf2a0AwrO/Mu2ploF
 gLpcp6qBBofSBFLJG/eXcbbrb/MuQQ7+NBu+3I/K/IEa9n7jdDsEHCDWlooONHhhMeev
 M/NvUlnw0pUNi4ptrS7MdcD6CXOxaFfjSftfY=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1755093062; x=1755697862;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=LUvezD/YP4/BWL9WTYanNDY2Y50PSfkJDab/A2rW7GU=;
 b=uZOUG7UrfdifjduTONr3Jg6px/9GAzzkhUIzdvDZS7AjyIYbkeJWmq6nxJU6yLlFSU
 wn8JkFn3XgjXh1yecEVSQksJNBm2q8ljKGmNKa/Ngu367bvCSlUZm4ljiDsU+YZWczLY
 JEMvDyd0XEYFhZgDJDAWHbNRI1YTMCRMHxO0GzWKVPwCU5yIKnapycHHlvIrcy+P+X7s
 8Kptbc8xHAwTSL0ALlgZdgRPjjSmsDT50HR/fHVwxLzih5Fm3mxZfKDuYxGGHVBO3ND0
 ae+U3PXYDGcaxTvTGHxaU2YxE5OQ5L5owDlCU/k5UqokDc9AXHt2EBLr5jfKGRMNb2yD
 VUUg==
X-Forwarded-Encrypted: i=1;
 AJvYcCWFm6/aEwuBaZ6k/t7sFq5RsBy4H+3q1ePKUaZgTCpO1DEgKNfe6U81AgOsq3+a1bmMXBjkEZErSrI=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YzZ0feXcq4apL7MHkrKvNioQoV4KI7zs0A6Pbh0FvGWvZchZeXe
 wUR2lg2qyfLO6vmiiy0MatArlxiD7qYajLN5x5ztiSgvY9TnThF6OkkuZ71a548sAcg=
X-Gm-Gg: ASbGnctzhPcE3meJoulul/v+DEiAF81EkbIM25iuBANM418991BRBdS5QxCKOgAZ30F
 E12LV9zvcruGi9VcRqfW+mmOJTmR7M3I/XaXDui00WKCOYIZZwxGMSN2O7xc8EEOjJGTNYXtIkD
 wy2BzKF3sSolVJUOrE+qWKpvkontt+eqQWjx2ha+baBNpMpOjHnoebj5Nm+AMBLGJ8M6sSb/4lD
 ICPQngo8i+DjvsezRDBjBekqvWy2OxWrecRSvAIShHO6WWvS+8qaphTdLY5stpLjXHbBwJqjpLJ
 9R244evob9JHVLcea8TQLegGiOGlhfeH+/0l0ncy+eAg4tLV+LoO+deh2lE5/uQsTz4N0ULYELk
 3B+Jh7Mg1UHK6jUQGp4nwhI1GgIUwKnFI
X-Google-Smtp-Source: AGHT+IG8in/qa3phnh+0UkFnmtlB5U0mTorEWFP95SCT61Ry23ZRijINM1ZCiKIvVCS+AQrqT+K+UA==
X-Received: by 2002:a17:903:1a8e:b0:240:20a8:cc22 with SMTP id
 d9443c01a7336-2430e8a8a2bmr33071065ad.4.1755093062055; 
 Wed, 13 Aug 2025 06:51:02 -0700 (PDT)
Received: from localhost.localdomain ([2804:14c:4a5:8ac9::1709])
 by smtp.gmail.com with ESMTPSA id
 d9443c01a7336-241e8aaf855sm326965955ad.168.2025.08.13.06.50.59
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 13 Aug 2025 06:51:01 -0700 (PDT)
From: Luiz Otavio Mello <luiz.mello@estudante.ufscar.br>
To: rodrigo.vivi@intel.com, jani.nikula@linux.intel.com,
 joonas.lahtinen@linux.intel.com, simona@ffwll.ch, airlied@gmail.com,
 tursulin@ursulin.net
Cc: intel-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 mairacanal@riseup.net, Luiz Otavio Mello <luiz.mello@estudante.ufscar.br>
Subject: [PATCH 2/9 v3] drm/i915: Remove struct_mutex in i915_irq.c
Date: Wed, 13 Aug 2025 10:50:26 -0300
Message-ID: <20250813135035.144762-3-luiz.mello@estudante.ufscar.br>
X-Mailer: git-send-email 2.50.1
In-Reply-To: <20250813135035.144762-1-luiz.mello@estudante.ufscar.br>
References: <20250813135035.144762-1-luiz.mello@estudante.ufscar.br>
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

Remove struct_mutex from ivb_parity_work() function.

The ivb_parity_work runs in a workqueue so it cannot race with itself.

Also, it is not protecting anything with the other remaining usage of
struct_mutex.

Signed-off-by: Luiz Otavio Mello <luiz.mello@estudante.ufscar.br>
Suggested-by: Rodrigo Vivi <rodrigo.vivi@intel.com>
Reviewed-by: Rodrigo Vivi <rodrigo.vivi@intel.com>
---
 drivers/gpu/drm/i915/i915_irq.c | 6 ------
 1 file changed, 6 deletions(-)

diff --git a/drivers/gpu/drm/i915/i915_irq.c b/drivers/gpu/drm/i915/i915_irq.c
index cdfb09464134..83b08dacd194 100644
--- a/drivers/gpu/drm/i915/i915_irq.c
+++ b/drivers/gpu/drm/i915/i915_irq.c
@@ -163,11 +163,6 @@ static void ivb_parity_work(struct work_struct *work)
 	u32 misccpctl;
 	u8 slice = 0;
 
-	/* We must turn off DOP level clock gating to access the L3 registers.
-	 * In order to prevent a get/put style interface, acquire struct mutex
-	 * any time we access those registers.
-	 */
-	mutex_lock(&dev_priv->struct_mutex);
 
 	/* If we've screwed up tracking, just let the interrupt fire again */
 	if (drm_WARN_ON(&dev_priv->drm, !dev_priv->l3_parity.which_slice))
@@ -225,7 +220,6 @@ static void ivb_parity_work(struct work_struct *work)
 	gen5_gt_enable_irq(gt, GT_PARITY_ERROR(dev_priv));
 	spin_unlock_irq(gt->irq_lock);
 
-	mutex_unlock(&dev_priv->struct_mutex);
 }
 
 static irqreturn_t valleyview_irq_handler(int irq, void *arg)
-- 
2.50.1

