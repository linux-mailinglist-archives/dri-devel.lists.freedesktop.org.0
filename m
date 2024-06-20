Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C766B910A89
	for <lists+dri-devel@lfdr.de>; Thu, 20 Jun 2024 17:48:15 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A549F10EAB6;
	Thu, 20 Jun 2024 15:48:10 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=raspberrypi.com header.i=@raspberrypi.com header.b="IvRfBAgR";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-f99.google.com (mail-wm1-f99.google.com
 [209.85.128.99])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1D5EF10EAA4
 for <dri-devel@lists.freedesktop.org>; Thu, 20 Jun 2024 15:47:15 +0000 (UTC)
Received: by mail-wm1-f99.google.com with SMTP id
 5b1f17b1804b1-424720e73e0so10641565e9.0
 for <dri-devel@lists.freedesktop.org>; Thu, 20 Jun 2024 08:47:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=raspberrypi.com; s=google; t=1718898433; x=1719503233;
 darn=lists.freedesktop.org; 
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=Lrs5ov/GAi+kC1QzK87V/iQzEXMxtTazxlBr/Ldqi/g=;
 b=IvRfBAgRv6eV57x/wpXNLqZEwHoOD8PceWO7HQ7qdGzCwuWgc3L7I+l49j9iSqNuIf
 LOBYIWf8sZOMPOEQHIcRZNUKDkUKbLFEZOGziKYm+SRfkAJXzHrBx3Mtn16ML5ADlvzs
 ajY4Xc5BdZ4V+DfPxL7h1tirlkIdoayeXDYI5DSOjdFIsqneFOB/0Ymn2k31MN+BU2rD
 TKKJv192jLWiaVXzB4JknNlTY4GnKTSJUHRrwCZkX8yTb8B4oTOjSTKPBUjZKbKy/54w
 8+8MPFb80lucnyX8pQkPJyA4zc3H3L+IDH6NilvTvlYSh1jO1d89sOcPJktuioXpGXR8
 /sWw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1718898433; x=1719503233;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=Lrs5ov/GAi+kC1QzK87V/iQzEXMxtTazxlBr/Ldqi/g=;
 b=KKj06djYlfXBDFp3HSaG8scw++cuNIfOLHboUx4QEqd/KFDB27MdT/FOVAVR1P4Pq4
 1VCr7OGrvUvwB7FU/77G5L0cer0Lz0Z3os5MivN03skVgKNsKd1uu06AVS/cgKxnq6Gl
 kbmC+HHCFYdGtrGe3iWlGBsKn2Z/HX7P1JLHc2CqOg97nu2GQHWYlAA9c9Ktzg5igEDR
 IKm3mkhNhGFnuxk4+1Vz9CHckBbJma/UIPosKf1gbmJYw12xx8m1mULsf9zQwG/EK1eA
 uq/2Og22clxwKTQ47p5a/eN+01t6YTGb9CdWj96i/k+EoImCiPt1ok1sdbFbwTP967fF
 NNRw==
X-Forwarded-Encrypted: i=1;
 AJvYcCW/CueMItk/JztXLWxKGIns/YDMKpIz9Uua+0ucDxZQyjz33T43GAqIv8BnL3B/yETwW4jDEzxJDKSNJ7bj3DqvBG6ffXP6RlFgZ1fYWohn
X-Gm-Message-State: AOJu0Yy6fRiBa2Esx+nKJKRdyG5u+Ev4LnjfFPRpsRuGwmttJ7wfr0ph
 /fp9Q+ibFq/qz+BjVeEeHIXejnIHRzo0+J9+djVn7ASEfWExeKna7jqowU65JVlfrwSLMfkFkNH
 vQYqPJKAifMJtC3Ox1rkN7JIsxnaNR7Al
X-Google-Smtp-Source: AGHT+IE6A2xe1SEeU4HiTwP3kmQuJpDyT7ivNmayJwlW27FNEfujcoxMS1yzDtZEKpk4fJ8j+j5WB151iRZ0
X-Received: by 2002:a05:600c:4f45:b0:424:777d:dcc with SMTP id
 5b1f17b1804b1-424777d1648mr38922835e9.0.1718898433659; 
 Thu, 20 Jun 2024 08:47:13 -0700 (PDT)
Received: from raspberrypi.com ([188.39.149.98])
 by smtp-relay.gmail.com with ESMTPS id
 5b1f17b1804b1-4247d208aedsm3310495e9.41.2024.06.20.08.47.13
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 20 Jun 2024 08:47:13 -0700 (PDT)
X-Relaying-Domain: raspberrypi.com
From: Dave Stevenson <dave.stevenson@raspberrypi.com>
To: Maxime Ripard <mripard@kernel.org>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>,
 Daniel Vetter <daniel@ffwll.ch>, dri-devel@lists.freedesktop.org
Cc: Maxime Ripard <maxime@cerno.tech>,
 Dave Stevenson <dave.stevenson@raspberrypi.com>
Subject: [PATCH 28/31] drm/vc4: hvs: Rework LBM alignment
Date: Thu, 20 Jun 2024 16:46:29 +0100
Message-Id: <20240620154632.4125308-29-dave.stevenson@raspberrypi.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20240620154632.4125308-1-dave.stevenson@raspberrypi.com>
References: <20240620154632.4125308-1-dave.stevenson@raspberrypi.com>
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

From: Maxime Ripard <maxime@cerno.tech>

With the introduction of the support for BCM2712, the check of whether
we're running on vc5 or not to compute the LBM alignment requirement
doesn't work anymore.

Moreover, the LBM size will need to be computed in words for the
BCM2712, while we've had sizes in bytes so far.

Aligning on either 64 or 32 words is thus fairly harmful on BCM2712, so
let's just explicitly align the size when needed, and then call
drm_mm_insert_node_generic() with an alignment of 1.

Signed-off-by: Maxime Ripard <mripard@kernel.org>
Signed-off-by: Dave Stevenson <dave.stevenson@raspberrypi.com>
---
 drivers/gpu/drm/vc4/vc4_plane.c | 8 ++++++--
 1 file changed, 6 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/vc4/vc4_plane.c b/drivers/gpu/drm/vc4/vc4_plane.c
index a4965226595d..4c61ef4f4142 100644
--- a/drivers/gpu/drm/vc4/vc4_plane.c
+++ b/drivers/gpu/drm/vc4/vc4_plane.c
@@ -756,6 +756,11 @@ static int vc4_plane_allocate_lbm(struct drm_plane_state *state)
 	if (!lbm_size)
 		return 0;
 
+	if (vc4->gen == VC4_GEN_5)
+		lbm_size = ALIGN(lbm_size, 64);
+	else if (vc4->gen == VC4_GEN_4)
+		lbm_size = ALIGN(lbm_size, 32);
+
 	drm_dbg_driver(drm, "[PLANE:%d:%s] LBM Allocation Size: %u\n",
 		       plane->base.id, plane->name, lbm_size);
 
@@ -771,8 +776,7 @@ static int vc4_plane_allocate_lbm(struct drm_plane_state *state)
 		spin_lock_irqsave(&vc4->hvs->mm_lock, irqflags);
 		ret = drm_mm_insert_node_generic(&vc4->hvs->lbm_mm,
 						 &vc4_state->lbm,
-						 lbm_size,
-						 vc4->gen == VC4_GEN_5 ? 64 : 32,
+						 lbm_size, 1,
 						 0, 0);
 		spin_unlock_irqrestore(&vc4->hvs->mm_lock, irqflags);
 
-- 
2.34.1

