Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B6693A57B3C
	for <lists+dri-devel@lfdr.de>; Sat,  8 Mar 2025 15:49:40 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 03AFF10E227;
	Sat,  8 Mar 2025 14:49:38 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="CRgodqMo";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ej1-f43.google.com (mail-ej1-f43.google.com
 [209.85.218.43])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 79A1D10E227;
 Sat,  8 Mar 2025 14:49:36 +0000 (UTC)
Received: by mail-ej1-f43.google.com with SMTP id
 a640c23a62f3a-abbd96bef64so449911566b.3; 
 Sat, 08 Mar 2025 06:49:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1741445375; x=1742050175; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=RRs8q/E+YxEHfYzeqhGXM8vaWWky3KZk5dtfm8gcKag=;
 b=CRgodqMoHX7SUQ5OAXrfLsbm+tP8xKPGW/82Qf/fPt3SuFSnaNzJ3V/pk5VHooMJau
 4CAWFF9D3OsZYPBwlq1fWZ1Dsf1azPUMBZzRziV5TlheALkjJaJKiCJFZuzHqAKexbwY
 e//eeX8/Bh7Tou6rXMgOWWIg2lVh58xcu6MMLcVjr/Yo8mzwxFISPlywb2iGWIEjg2KA
 7J0M8vJP6IH3ggZr2bp6eh/GoO1Oh0bV2IrIfe3Zop3lGCTYgflCsoR7qfG7rMEIE8VH
 fW9sbFaWxq5HESIRvoX/x9CiIXJL8SLGyjrBv7D72S5HbsvEud4J8rPkhuDY7uGDckbn
 V9aA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1741445375; x=1742050175;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=RRs8q/E+YxEHfYzeqhGXM8vaWWky3KZk5dtfm8gcKag=;
 b=h+mBUnhz6YH+f6PL1HUqNPxL+doIvSo8TctTup9LhGurISHgIoxci745NAC+fAG3as
 KB3c8KCQjRbxQsydeRHgzH0QSBJAN8WoKMonN0+uDZfLgnjxzv3vg3flmyJ0yr+zYu9P
 MVuOFoRjYYTF3wH8vDz1AUmw44KLRTCsaHPaPLSTRwJj+zGAkiZC+I0vRGnR5d1kqPkm
 YMDTxT+qztpIKA2hNS2LOIMwvdDtTarMdFkE2W+CiWYdg0emUS7yg8pHQdly4BYCxZ5E
 32+IJJVMo0BU0+hvAfK20jcB3BhR+TLjXqXOjplkBeG1iLMraQSEfilpoNAZfc0u6aph
 CI4A==
X-Forwarded-Encrypted: i=1;
 AJvYcCVXArp2Z1/BxDKIitgCjfZ1E8rDW/ek8X81PI6nSUq1llp26KypOp0BbUhv6UiS+1IP9FrpVZL36JjD@lists.freedesktop.org,
 AJvYcCW6X3kzrs7t3YZ6cR6uFw7w+wqJ04LsOBItLcOgqrF/pDrB1ztyz+8N9nsUnrCK3D3BIA7QwCgY+wU=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YwjRKDLZ+qvjDHS5XUDVA8WstI3HezRSxsCzoqmI74TmHMMeEee
 HLB3mxl8whcFMpHC8Kq5lG2QHu2EvlZGzvfrAvOOw9DnWb19SmTLo/ccng==
X-Gm-Gg: ASbGncsV868d49AI4iHq4L7YgewlvD8XoewhNH+5iFgplT7iNp8tRmLquSGhRu7vBoD
 WdsF9Q3J2dHoQafhaf+PJnjzfw7P4LF2agmDI/SCuYPVYzX0vXAgE+TjDxqBYCEgNPNhnN9nvTK
 tfKNPivH4acz/Tiwm0PofPXJOo16rcfIu3SAJ/P2JFEvB1VbP0n7tNLmSDnvJxZcnFiixdmAZNj
 jswupGPkv0WVHalq2yrpleptoCSGQJiWJwx0bWBdJHzIh6/T2/EZJM24KXeMPJ+bcUAz45ywivC
 FNlfaJs1JhLg4zXWrV2o+7egM8lzD7puC8y+YuT97ukZLA==
X-Google-Smtp-Source: AGHT+IH3iWpTp/kADlD2HLaPKcJqEBeUrsjaLWMoTc5IY7cK4QXHzs4NBpWr7xZoA4gbaakl4pzjbQ==
X-Received: by 2002:a17:907:6d01:b0:abf:6cc9:7ef2 with SMTP id
 a640c23a62f3a-ac252ba35cemr875905866b.42.1741445374674; 
 Sat, 08 Mar 2025 06:49:34 -0800 (PST)
Received: from qasdev.Home ([2a02:c7c:6696:8300:f465:a080:411e:5b2d])
 by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-ac2394fda1asm444581766b.78.2025.03.08.06.49.32
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 08 Mar 2025 06:49:34 -0800 (PST)
From: Qasim Ijaz <qasdev00@gmail.com>
To: robdclark@gmail.com, quic_abhinavk@quicinc.com,
 dmitry.baryshkov@linaro.org, sean@poorly.run,
 marijn.suijten@somainline.org, airlied@gmail.com, simona@ffwll.ch,
 quic_jesszhan@quicinc.com
Cc: linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
 freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org
Subject: [PATCH] drm/msm/dpu: reorder pointer operations after sanity checks
 to avoid NULL deref
Date: Sat,  8 Mar 2025 14:48:39 +0000
Message-Id: <20250308144839.33849-1-qasdev00@gmail.com>
X-Mailer: git-send-email 2.39.5
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

_dpu_encoder_trigger_start dereferences "struct dpu_encoder_phys *phys" 
before the sanity checks which can lead to a NULL pointer dereference if 
phys is NULL. 

Fix this by reordering the dereference after the sanity checks.

Signed-off-by: Qasim Ijaz <qasdev00@gmail.com>
Fixes: 8144d17a81d9 ("drm/msm/dpu: Skip trigger flush and start for CWB")
---
 drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c
index 0eed93a4d056..ba8b2a163232 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c
@@ -1667,8 +1667,6 @@ static void _dpu_encoder_trigger_flush(struct drm_encoder *drm_enc,
  */
 static void _dpu_encoder_trigger_start(struct dpu_encoder_phys *phys)
 {
-	struct dpu_encoder_virt *dpu_enc = to_dpu_encoder_virt(phys->parent);
-
 	if (!phys) {
 		DPU_ERROR("invalid argument(s)\n");
 		return;
@@ -1679,6 +1677,8 @@ static void _dpu_encoder_trigger_start(struct dpu_encoder_phys *phys)
 		return;
 	}
 
+	struct dpu_encoder_virt *dpu_enc = to_dpu_encoder_virt(phys->parent);
+
 	if (phys->parent->encoder_type == DRM_MODE_ENCODER_VIRTUAL &&
 	    dpu_enc->cwb_mask) {
 		DPU_DEBUG("encoder %d CWB enabled, skipping\n", DRMID(phys->parent));
-- 
2.39.5

