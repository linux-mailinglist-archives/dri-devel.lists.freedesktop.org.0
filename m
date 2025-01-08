Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 9F4ADA06804
	for <lists+dri-devel@lfdr.de>; Wed,  8 Jan 2025 23:14:59 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 81A1A10E43C;
	Wed,  8 Jan 2025 22:14:56 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=broadcom.com header.i=@broadcom.com header.b="fHnjckm1";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-qt1-f170.google.com (mail-qt1-f170.google.com
 [209.85.160.170])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A7F0F10E43C
 for <dri-devel@lists.freedesktop.org>; Wed,  8 Jan 2025 22:14:55 +0000 (UTC)
Received: by mail-qt1-f170.google.com with SMTP id
 d75a77b69052e-46792996074so1946281cf.0
 for <dri-devel@lists.freedesktop.org>; Wed, 08 Jan 2025 14:14:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=broadcom.com; s=google; t=1736374435; x=1736979235;
 darn=lists.freedesktop.org; 
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=eaBTFdI7UtWQtXUMWeGe2RWOPdqcGSzy9foh7WyJ8u8=;
 b=fHnjckm1zJ1Q9eAXlyinoPerEzHZb1iGb6PFUfgeVtT4P5ueHtDL42UZDnnY/cAjoJ
 RTtbLaqwFy/7ZhtnlXhPzmOlmkREvcSQkaoPf9L/Rl6NrgkDOKNU3Q7pgA2dcqtmJVrH
 mjwaB2TAfGzh76dyPpoMD2nbEmCvXA6YKPMrA=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1736374435; x=1736979235;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=eaBTFdI7UtWQtXUMWeGe2RWOPdqcGSzy9foh7WyJ8u8=;
 b=OiK8uDYrsRI6B+r4EnSFjluppPRtatSsNZOR+601YNRtsn5qM15RH5uj5VknBWOyR7
 RXPzK1R+zIqofiLQn4U8zqRoqSLqS0pmH8Ccq22hBkxTISI8E0MbzbavNFhGBniBH7aM
 5APo/7X61ofhdukYus35LXlUsX0dxK4H3pkbltofFdO/9oGgoAYFT9Uzn/sCENkgKVUx
 2qIFDixbITXXU+QMtWd2nERKrKMaw3S/D/V4qr4bv6BCiI1vt5c02QdtvJikGilPJTU3
 6gs+J9jcDfdm47WiXeG2VJHwD5W0pkAKyMMO9XRYCYJDNfumsUsLze74atye3b1pNMIP
 tv0g==
X-Gm-Message-State: AOJu0YxtldBrj9nzIbMc0xz/nDtyPmoMPh3fFSQg0vwKL/c75esTcEx0
 zoc3Unsb5DrdpahubFSdu8deZQ+2igm6bGokXwMtdEyl/14FzSHwa5xd1a1TCmBJbuHb7BHJngm
 yFcZebVv1SwDTnwrx/hsVFa0ZsTZ6RLDil5Jix5rZJ3erYFxc+2x6l/Nuln3IoWMySXP6v+tFFj
 IcVERDgna13bDmOIgJ6NVCuxC+vtyT+LEihTFheQ3fI7zy7nVvhg==
X-Gm-Gg: ASbGnctEEox9NMRJqmWg1+c+x7n2XUTbcq+HULiQlKLt8AWIAH0qMybmZchHHMKoWe6
 OE0T4QkoHX72wU6teYH2ek2XS+dORGcLeBCyN1EgpsgXP+/XKPMFQq8bwsC81tbL5aaYUUhQ95b
 8/gnGqK90MoegWY2//X/DwrhX/qpXacYn3de5CCuBBddc4RPx/+gg53bId5LW89bNKHqqqreWUM
 Dw4pY+/xrmVGXGNnIt2xfy6u4Tgcc7SEpf0670CRAg/yKhjakhp5PoCjiEWA9Nnt3GsjludAbEc
 kqB1y/+ngThVeIkc9azl6TRbLPSYBAxb
X-Google-Smtp-Source: AGHT+IHw9GYgEhyyD4XpBBuIkP6imSHqjpG9rrkxM/V+Vzz3NycuYb3iuaPZ/HBNEq+RN7rAmmQs9w==
X-Received: by 2002:a17:902:ea07:b0:217:9172:2ce1 with SMTP id
 d9443c01a7336-21a83f5db69mr60621925ad.22.1736367279574; 
 Wed, 08 Jan 2025 12:14:39 -0800 (PST)
Received: from mtt-opossum.dhcp.broadcom.net ([192.19.144.250])
 by smtp.gmail.com with ESMTPSA id
 d9443c01a7336-219dca02ac2sm330961265ad.272.2025.01.08.12.14.37
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 08 Jan 2025 12:14:39 -0800 (PST)
From: Ian Forbes <ian.forbes@broadcom.com>
To: dri-devel@lists.freedesktop.org
Cc: bcm-kernel-feedback-list@broadcom.com, ian.forbes@broadcom.com,
 zack.rusin@broadcom.com, martin.krastev@broadcom.com,
 maaz.mombasawala@broadcom.com
Subject: [PATCH] drm/vmwgfx: Remove busy_places
Date: Wed,  8 Jan 2025 14:13:55 -0600
Message-Id: <20250108201355.2521070-1-ian.forbes@broadcom.com>
X-Mailer: git-send-email 2.34.1
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

Unused since commit a78a8da51b36
("drm/ttm: replace busy placement with flags v6")

Signed-off-by: Ian Forbes <ian.forbes@broadcom.com>
---
 drivers/gpu/drm/vmwgfx/vmwgfx_bo.c | 1 -
 drivers/gpu/drm/vmwgfx/vmwgfx_bo.h | 1 -
 2 files changed, 2 deletions(-)

diff --git a/drivers/gpu/drm/vmwgfx/vmwgfx_bo.c b/drivers/gpu/drm/vmwgfx/vmwgfx_bo.c
index a0e433fbcba67..5f13285f83e0b 100644
--- a/drivers/gpu/drm/vmwgfx/vmwgfx_bo.c
+++ b/drivers/gpu/drm/vmwgfx/vmwgfx_bo.c
@@ -228,7 +228,6 @@ int vmw_bo_pin_in_start_of_vram(struct vmw_private *dev_priv,
 			     VMW_BO_DOMAIN_VRAM,
 			     VMW_BO_DOMAIN_VRAM);
 	buf->places[0].lpfn = PFN_UP(bo->resource->size);
-	buf->busy_places[0].lpfn = PFN_UP(bo->resource->size);
 	ret = ttm_bo_validate(bo, &buf->placement, &ctx);
 
 	/* For some reason we didn't end up at the start of vram */
diff --git a/drivers/gpu/drm/vmwgfx/vmwgfx_bo.h b/drivers/gpu/drm/vmwgfx/vmwgfx_bo.h
index 43b5439ec9f76..07749f0a5f294 100644
--- a/drivers/gpu/drm/vmwgfx/vmwgfx_bo.h
+++ b/drivers/gpu/drm/vmwgfx/vmwgfx_bo.h
@@ -83,7 +83,6 @@ struct vmw_bo {
 
 	struct ttm_placement placement;
 	struct ttm_place places[5];
-	struct ttm_place busy_places[5];
 
 	/* Protected by reservation */
 	struct ttm_bo_kmap_obj map;
-- 
2.34.1

