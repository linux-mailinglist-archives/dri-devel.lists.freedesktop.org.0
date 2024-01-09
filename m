Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 59F08827FB7
	for <lists+dri-devel@lfdr.de>; Tue,  9 Jan 2024 08:47:50 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CD21B10E38F;
	Tue,  9 Jan 2024 07:47:39 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ej1-x62e.google.com (mail-ej1-x62e.google.com
 [IPv6:2a00:1450:4864:20::62e])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 48EAA10E385;
 Tue,  9 Jan 2024 07:47:38 +0000 (UTC)
Received: by mail-ej1-x62e.google.com with SMTP id
 a640c23a62f3a-a28b1095064so282597066b.2; 
 Mon, 08 Jan 2024 23:47:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1704786457; x=1705391257; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
 :reply-to; bh=EZGJdA0F++2P/K37coEne46KHwvd4SnYzLgJWUGLPe8=;
 b=IJcsFiLwQI3LguyXk5WUTUBzcyVzBeO7GwNMmRS4LplI1M4ddeWBbzgBdNvwtaZ20r
 NlQuFV6aImGZUnOz7OTkDmeimMw6tDQReFQtM0nOoEt0nwNXdjZ47f5V1bHLDk1PYJbG
 LNn3nFctVMR0kTnuc7FWW3B+XP817E0C9Qh6xh02sZ3sOKWttl4+KPR2TNJHMJNAFET6
 3L7NlbQMp6ZNossCUWU03btatOG2zUbiJ3GUghWZ2BFe3E4ehWAzIiigW7dypRpF/9St
 gTVJ1OZl/Iv1q8a1rRDE8ahFw9nZABHq0ukozTYW1vkStYxweLivsn3RBUmUGOLl9+Hd
 gSiw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1704786457; x=1705391257;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=EZGJdA0F++2P/K37coEne46KHwvd4SnYzLgJWUGLPe8=;
 b=Zb4IBbedYGmqFTOe7FRlCK4H8asPPDVFCVwySyWoZbzuWuwciGb+kY6MAq/dX4/WxO
 Bro/1Pxbm9xlq0YexeTMK1+cgD0oZgOdQxjjw36aZjXwDp+FSekw1OcAy7ZHhpGTUErL
 vuKUAl59ZfCvEJpDQ8nIKvFpKSF8vHSqAHIS4Oo/lu1m3eLOD7yRem4f3uTWgGBkV70w
 /ImrpzLgTIFTDCVtJ+1b6nmdBVVA2AXKsn29y+5cbr+Z1lVi6MhB9aTTPxUURc8zMxXC
 CqBBsVR/nbC1cRjry/FaCYDdkYvnHxdp3Kp0Ua3NG8GN7qbGZwwGDxNTt/gNPWXJHPPk
 TyPA==
X-Gm-Message-State: AOJu0YzrkJ42LKNol1QzhiGksyeFo7IVyut/G894AVL18OUd9sW0SMeV
 zgffBeHMIDtkZxWdH/8IoEU=
X-Google-Smtp-Source: AGHT+IETzfqsQQXixEWnqVidPoyPRElJZ0UIV3RuwJt3ww1s2MftmjawOcbNy+hMy2AaPc1lJZGXBw==
X-Received: by 2002:a17:907:8687:b0:a28:a7f4:65dc with SMTP id
 qa7-20020a170907868700b00a28a7f465dcmr155448ejc.299.1704786456762; 
 Mon, 08 Jan 2024 23:47:36 -0800 (PST)
Received: from able.fritz.box ([2a00:e180:15f1:d900:3a74:b44a:2376:22bd])
 by smtp.gmail.com with ESMTPSA id
 bm3-20020a170906c04300b00a2a4efe7d3dsm731563ejb.79.2024.01.08.23.47.35
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 08 Jan 2024 23:47:36 -0800 (PST)
From: "=?UTF-8?q?Christian=20K=C3=B6nig?=" <ckoenig.leichtzumerken@gmail.com>
X-Google-Original-From: =?UTF-8?q?Christian=20K=C3=B6nig?=
 <christian.koenig@amd.com>
To: zack.rusin@broadcom.com, thomas.hellstrom@linux.intel.com,
 lyude@redhat.com, kherbst@redhat.com, jani.nikula@linux.intel.com,
 nouveau@lists.freedesktop.org, intel-gfx@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org
Subject: [PATCH 5/5] drm/amdgpu: use GTT only as fallback for VRAM|GTT
Date: Tue,  9 Jan 2024 08:47:29 +0100
Message-Id: <20240109074729.3646-6-christian.koenig@amd.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20240109074729.3646-1-christian.koenig@amd.com>
References: <20240109074729.3646-1-christian.koenig@amd.com>
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Try to fill up VRAM as well by setting the busy flag on GTT allocations.

This fixes the issue that when VRAM was evacuated for suspend it's never
filled up again unless the application is restarted.

Signed-off-by: Christian König <christian.koenig@amd.com>
---
 drivers/gpu/drm/amd/amdgpu/amdgpu_object.c | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_object.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_object.c
index f110dfdc4feb..979cecf18f17 100644
--- a/drivers/gpu/drm/amd/amdgpu/amdgpu_object.c
+++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_object.c
@@ -173,6 +173,12 @@ void amdgpu_bo_placement_from_domain(struct amdgpu_bo *abo, u32 domain)
 			abo->flags & AMDGPU_GEM_CREATE_PREEMPTIBLE ?
 			AMDGPU_PL_PREEMPT : TTM_PL_TT;
 		places[c].flags = 0;
+		/*
+		 * When GTT is just an alternative to VRAM make sure that we
+		 * only use it as fallback and still try to fill up VRAM first.
+		 */
+		if (domain & abo->preferred_domains & AMDGPU_GEM_DOMAIN_VRAM)
+			places[c].flags |= TTM_PL_FLAG_BUSY;
 		c++;
 	}
 
-- 
2.34.1

