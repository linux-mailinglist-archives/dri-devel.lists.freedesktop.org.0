Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 48C4123C18D
	for <lists+dri-devel@lfdr.de>; Tue,  4 Aug 2020 23:32:31 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B47F06E4CB;
	Tue,  4 Aug 2020 21:32:19 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x442.google.com (mail-wr1-x442.google.com
 [IPv6:2a00:1450:4864:20::442])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BDE8D6E4CB
 for <dri-devel@lists.freedesktop.org>; Tue,  4 Aug 2020 21:32:17 +0000 (UTC)
Received: by mail-wr1-x442.google.com with SMTP id c15so2516018wrs.11
 for <dri-devel@lists.freedesktop.org>; Tue, 04 Aug 2020 14:32:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=basnieuwenhuizen-nl.20150623.gappssmtp.com; s=20150623;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=b+1e/zR9eX5UJqDul9zd3rxIwvyWrjdXQtgp2gt2efI=;
 b=2RuORQvslwnvp+GW88Xo7jgdzNZ8TPDXWt3QKKJZZ815T5L3fW5TnznKDtomkYyh+T
 8EGR8EOYCDuxBb4ItXcPPm81nsi9XWRBnTv9C+epOHq8AFFWwdrDIjCj3ZTEObbfoCla
 JC6gYWliDJ85/28MwultlvNovoY5nk8UYYRDNlAC81+pWucgnIxHiczMJ/t1b42tbjEV
 Ts7sjLK0zJHapEc++SSIe8Aej96tIb87y8Pu8F3eNryM19sQBEwdkZMqQ+ti+oj0cVeS
 v2RsVXHaT+Bz+hPW2n3neoe7H7onTI0E9sVt0e0MaHM+xDy9Edj3oWjr7vGSklcZcMCs
 Ku9g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=b+1e/zR9eX5UJqDul9zd3rxIwvyWrjdXQtgp2gt2efI=;
 b=WVrsjzqWF1KdnBrKC+weePJSmekrDmJz5dxLvgcDCDBZhWVXxT8xPu1hEDeJax9irI
 m0SIMxXJDa71ncXUV+LCrcrZ2OShP9GTrmd+K5hmxwR7xfYKqBqUr2EvlVi/HfeCtCqX
 3nrPuWZxbiJxy4rnLhLOoBcIg5qfO+sOu/NPBXXsECKb5l+sbtC/N8W+YLxTf3ua463x
 V+9UJioIvXjhC8PDjPs4TXYgXClc8jtdKxxPSDl2v8v5xh7txifUnPzolFOENgdHjVDu
 A/1UVU6AKVxU/gYm4F2cgVguiX1Y67EnV8DS42DtMU1W7w3Sp9K9Pd8o9tVRb/2aJsEM
 5JxA==
X-Gm-Message-State: AOAM532mQF0akMZy/DYsZn68YA18EUlYfMWbNAdRe0QVgGeFBG9hic+w
 LSVWoacLN1B4WKGGQ0e/2+OLog==
X-Google-Smtp-Source: ABdhPJxX5ivWcNPm0zgrk/f/TUCU0hgBYlRWLrdlWWY7fybPAFL+q8icBOtMIBwPi6j5aucVZ1L7vw==
X-Received: by 2002:a5d:42c2:: with SMTP id t2mr20883010wrr.396.1596576736238; 
 Tue, 04 Aug 2020 14:32:16 -0700 (PDT)
Received: from localhost.localdomain
 ([2a02:aa12:a77f:2000:ce92:471f:873f:fc56])
 by smtp.gmail.com with ESMTPSA id x11sm97612wmc.33.2020.08.04.14.32.15
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 04 Aug 2020 14:32:15 -0700 (PDT)
From: Bas Nieuwenhuizen <bas@basnieuwenhuizen.nl>
To: amd-gfx@lists.freedesktop.org
Subject: [PATCH 8/8] drm/amd/display: Expose modifiers.
Date: Tue,  4 Aug 2020 23:31:19 +0200
Message-Id: <20200804213119.25091-9-bas@basnieuwenhuizen.nl>
X-Mailer: git-send-email 2.28.0
In-Reply-To: <20200804213119.25091-1-bas@basnieuwenhuizen.nl>
References: <20200804213119.25091-1-bas@basnieuwenhuizen.nl>
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
Cc: maraeo@gmail.com, dri-devel@lists.freedesktop.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

This expose modifier support on GFX9+.

Only modifiers that can be rendered on the current GPU are
added. This is to reduce the number of modifiers exposed.

The HW could expose more, but the best mechanism to decide
what to expose without an explosion in modifiers is still
to be decided, and in the meantime this should not regress
things from pre-modifiers and does not risk regressions as
we make up our mind in the future.

Signed-off-by: Bas Nieuwenhuizen <bas@basnieuwenhuizen.nl>
---
 .../gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c | 343 +++++++++++++++++-
 1 file changed, 342 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c
index c38257081868..6594cbe625f9 100644
--- a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c
+++ b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c
@@ -3891,6 +3891,340 @@ fill_gfx9_tiling_info_from_modifier(const struct amdgpu_device *adev,
 	}
 }
 
+enum dm_micro_swizzle {
+	MICRO_SWIZZLE_Z = 0,
+	MICRO_SWIZZLE_S = 1,
+	MICRO_SWIZZLE_D = 2,
+	MICRO_SWIZZLE_R = 3
+};
+
+static bool dm_plane_format_mod_supported(struct drm_plane *plane,
+					  uint32_t format,
+					  uint64_t modifier)
+{
+	struct amdgpu_device *adev = plane->dev->dev_private;
+	const struct drm_format_info *info = drm_format_info(format);
+
+	enum dm_micro_swizzle microtile = modifier_gfx9_swizzle_mode(modifier) & 3;
+
+	if (!info)
+		return false;
+
+	/*
+	 * We always have to allow this modifier, because core DRM still
+	 * checks LINEAR support if userspace does not provide modifers.
+	 */
+	if (modifier == DRM_FORMAT_MOD_LINEAR)
+		return true;
+
+	/*
+	 * The arbitrary tiling support for multiplane formats has not been hooked
+	 * up.
+	 */
+	if (info->num_planes > 1)
+		return false;
+
+	/*
+	 * For D swizzle the canonical modifier depends on the bpp, so check
+	 * it here.
+	 */
+	if (AMD_FMT_MOD_GET(TILE_VERSION, modifier) == AMD_FMT_MOD_TILE_VER_GFX9 &&
+	    adev->family >= AMDGPU_FAMILY_NV) {
+		if (microtile == MICRO_SWIZZLE_D && info->cpp[0] == 4)
+			return false;
+	}
+
+	if (adev->family >= AMDGPU_FAMILY_RV && microtile == MICRO_SWIZZLE_D &&
+	    info->cpp[0] < 8)
+		return false;
+
+	if (modifier_has_dcc(modifier)) {
+		/* Per radeonsi comments 16/64 bpp are more complicated. */
+		if (info->cpp[0] != 4)
+			return false;
+	}
+
+	return true;
+}
+
+static void
+add_modifier(uint64_t **mods, uint64_t *size, uint64_t *cap, uint64_t mod)
+{
+	if (!*mods)
+		return;
+
+	if (*cap - *size < 1) {
+		uint64_t new_cap = *cap * 2;
+		uint64_t *new_mods = kmalloc(new_cap * sizeof(uint64_t), GFP_KERNEL);
+
+		if (!new_mods) {
+			kfree(*mods);
+			*mods = NULL;
+			return;
+		}
+
+		memcpy(new_mods, *mods, sizeof(uint64_t) * *size);
+		kfree(*mods);
+		*mods = new_mods;
+		*cap = new_cap;
+	}
+
+	(*mods)[*size] = mod;
+	*size += 1;
+}
+
+static void
+add_gfx9_modifiers(const struct amdgpu_device *adev,
+		  uint64_t **mods, uint64_t *size, uint64_t *capacity)
+{
+	int pipes = ilog2(adev->gfx.config.gb_addr_config_fields.num_pipes);
+	int pipe_xor_bits = min(8, pipes +
+				ilog2(adev->gfx.config.gb_addr_config_fields.num_se));
+	int bank_xor_bits = min(8 - pipe_xor_bits,
+				ilog2(adev->gfx.config.gb_addr_config_fields.num_banks));
+	int rb = ilog2(adev->gfx.config.gb_addr_config_fields.num_se) +
+		 ilog2(adev->gfx.config.gb_addr_config_fields.num_rb_per_se);
+
+
+	if (adev->family == AMDGPU_FAMILY_RV) {
+		/*
+		 * No _D DCC swizzles yet because we only allow 32bpp, which
+		 * doesn't support _D on DCN
+		 */
+
+		/*
+		 * Always enable constant encoding, because the only unit that
+		 * didn't support it was CB. But on texture/display we can
+		 * always interpret it.
+		 */
+		add_modifier(mods, size, capacity, AMD_FMT_MOD |
+			    AMD_FMT_MOD_SET(TILE, AMD_FMT_MOD_TILE_GFX9_64K_S_X) |
+			    AMD_FMT_MOD_SET(TILE_VERSION, AMD_FMT_MOD_TILE_VER_GFX9) |
+			    AMD_FMT_MOD_SET(PIPE_XOR_BITS, pipe_xor_bits) |
+			    AMD_FMT_MOD_SET(BANK_XOR_BITS, bank_xor_bits) |
+			    AMD_FMT_MOD_SET(DCC, 1) |
+			    AMD_FMT_MOD_SET(DCC_INDEPENDENT_64B, 1) |
+			    AMD_FMT_MOD_SET(DCC_MAX_COMPRESSED_BLOCK, AMD_FMT_MOD_DCC_BLOCK_64B) |
+			    AMD_FMT_MOD_SET(DCC_CONSTANT_ENCODE, 1));
+
+		add_modifier(mods, size, capacity, AMD_FMT_MOD |
+			    AMD_FMT_MOD_SET(TILE, AMD_FMT_MOD_TILE_GFX9_64K_S_X) |
+			    AMD_FMT_MOD_SET(TILE_VERSION, AMD_FMT_MOD_TILE_VER_GFX9) |
+			    AMD_FMT_MOD_SET(PIPE_XOR_BITS, pipe_xor_bits) |
+			    AMD_FMT_MOD_SET(BANK_XOR_BITS, bank_xor_bits) |
+			    AMD_FMT_MOD_SET(DCC, 1) |
+			    AMD_FMT_MOD_SET(DCC_INDEPENDENT_64B, 1) |
+			    AMD_FMT_MOD_SET(DCC_MAX_COMPRESSED_BLOCK, AMD_FMT_MOD_DCC_BLOCK_64B) |
+			    AMD_FMT_MOD_SET(DCC_CONSTANT_ENCODE, 0));
+
+		add_modifier(mods, size, capacity, AMD_FMT_MOD |
+			    AMD_FMT_MOD_SET(TILE, AMD_FMT_MOD_TILE_GFX9_64K_S_X) |
+			    AMD_FMT_MOD_SET(TILE_VERSION, AMD_FMT_MOD_TILE_VER_GFX9) |
+			    AMD_FMT_MOD_SET(PIPE_XOR_BITS, pipe_xor_bits) |
+			    AMD_FMT_MOD_SET(BANK_XOR_BITS, bank_xor_bits) |
+			    AMD_FMT_MOD_SET(DCC, 1) |
+			    AMD_FMT_MOD_SET(DCC_RETILE, 1) |
+			    AMD_FMT_MOD_SET(DCC_INDEPENDENT_64B, 1) |
+			    AMD_FMT_MOD_SET(DCC_MAX_COMPRESSED_BLOCK, AMD_FMT_MOD_DCC_BLOCK_64B) |
+			    AMD_FMT_MOD_SET(DCC_CONSTANT_ENCODE, 1) |
+			    AMD_FMT_MOD_SET(RB, rb) |
+			    AMD_FMT_MOD_SET(PIPE, pipes));
+
+		add_modifier(mods, size, capacity, AMD_FMT_MOD |
+			    AMD_FMT_MOD_SET(TILE, AMD_FMT_MOD_TILE_GFX9_64K_S_X) |
+			    AMD_FMT_MOD_SET(TILE_VERSION, AMD_FMT_MOD_TILE_VER_GFX9) |
+			    AMD_FMT_MOD_SET(PIPE_XOR_BITS, pipe_xor_bits) |
+			    AMD_FMT_MOD_SET(BANK_XOR_BITS, bank_xor_bits) |
+			    AMD_FMT_MOD_SET(DCC, 1) |
+			    AMD_FMT_MOD_SET(DCC_RETILE, 1) |
+			    AMD_FMT_MOD_SET(DCC_INDEPENDENT_64B, 1) |
+			    AMD_FMT_MOD_SET(DCC_MAX_COMPRESSED_BLOCK, AMD_FMT_MOD_DCC_BLOCK_64B) |
+			    AMD_FMT_MOD_SET(DCC_CONSTANT_ENCODE, 0) |
+			    AMD_FMT_MOD_SET(RB, rb) |
+			    AMD_FMT_MOD_SET(PIPE, pipes));
+	}
+
+	add_modifier(mods, size, capacity, AMD_FMT_MOD |
+		    AMD_FMT_MOD_SET(TILE, AMD_FMT_MOD_TILE_GFX9_64K_D_X) |
+		    AMD_FMT_MOD_SET(TILE_VERSION, AMD_FMT_MOD_TILE_VER_GFX9) |
+		    AMD_FMT_MOD_SET(PIPE_XOR_BITS, pipe_xor_bits) |
+		    AMD_FMT_MOD_SET(BANK_XOR_BITS, bank_xor_bits));
+
+	if (adev->family == AMDGPU_FAMILY_RV) {
+		add_modifier(mods, size, capacity, AMD_FMT_MOD |
+			    AMD_FMT_MOD_SET(TILE, AMD_FMT_MOD_TILE_GFX9_64K_S_X) |
+			    AMD_FMT_MOD_SET(TILE_VERSION, AMD_FMT_MOD_TILE_VER_GFX9) |
+			    AMD_FMT_MOD_SET(PIPE_XOR_BITS, pipe_xor_bits) |
+			    AMD_FMT_MOD_SET(BANK_XOR_BITS, bank_xor_bits));
+	}
+
+	add_modifier(mods, size, capacity, AMD_FMT_MOD |
+		    AMD_FMT_MOD_SET(TILE, AMD_FMT_MOD_TILE_GFX9_64K_D) |
+		    AMD_FMT_MOD_SET(TILE_VERSION, AMD_FMT_MOD_TILE_VER_GFX9));
+
+	if (adev->family == AMDGPU_FAMILY_RV) {
+		add_modifier(mods, size, capacity, AMD_FMT_MOD |
+			    AMD_FMT_MOD_SET(TILE, AMD_FMT_MOD_TILE_GFX9_64K_S) |
+			    AMD_FMT_MOD_SET(TILE_VERSION, AMD_FMT_MOD_TILE_VER_GFX9));
+	}
+}
+
+static void
+add_gfx10_1_modifiers(const struct amdgpu_device *adev,
+		     uint64_t **mods, uint64_t *size, uint64_t *capacity)
+{
+	int pipe_xor_bits = ilog2(adev->gfx.config.gb_addr_config_fields.num_pipes);
+
+	add_modifier(mods, size, capacity, AMD_FMT_MOD |
+		    AMD_FMT_MOD_SET(TILE, AMD_FMT_MOD_TILE_GFX9_64K_R_X) |
+		    AMD_FMT_MOD_SET(TILE_VERSION, AMD_FMT_MOD_TILE_VER_GFX10) |
+		    AMD_FMT_MOD_SET(PIPE_XOR_BITS, pipe_xor_bits) |
+		    AMD_FMT_MOD_SET(DCC, 1) |
+		    AMD_FMT_MOD_SET(DCC_CONSTANT_ENCODE, 1) |
+		    AMD_FMT_MOD_SET(DCC_INDEPENDENT_64B, 1) |
+		    AMD_FMT_MOD_SET(DCC_MAX_COMPRESSED_BLOCK, AMD_FMT_MOD_DCC_BLOCK_64B));
+
+	add_modifier(mods, size, capacity, AMD_FMT_MOD |
+		    AMD_FMT_MOD_SET(TILE, AMD_FMT_MOD_TILE_GFX9_64K_R_X) |
+		    AMD_FMT_MOD_SET(TILE_VERSION, AMD_FMT_MOD_TILE_VER_GFX10) |
+		    AMD_FMT_MOD_SET(PIPE_XOR_BITS, pipe_xor_bits) |
+		    AMD_FMT_MOD_SET(DCC, 1) |
+		    AMD_FMT_MOD_SET(DCC_RETILE, 1) |
+		    AMD_FMT_MOD_SET(DCC_CONSTANT_ENCODE, 1) |
+		    AMD_FMT_MOD_SET(DCC_INDEPENDENT_64B, 1) |
+		    AMD_FMT_MOD_SET(DCC_MAX_COMPRESSED_BLOCK, AMD_FMT_MOD_DCC_BLOCK_64B));
+
+	add_modifier(mods, size, capacity, AMD_FMT_MOD |
+		    AMD_FMT_MOD_SET(TILE, AMD_FMT_MOD_TILE_GFX9_64K_R_X) |
+		    AMD_FMT_MOD_SET(TILE_VERSION, AMD_FMT_MOD_TILE_VER_GFX10) |
+		    AMD_FMT_MOD_SET(PIPE_XOR_BITS, pipe_xor_bits));
+
+	add_modifier(mods, size, capacity, AMD_FMT_MOD |
+		    AMD_FMT_MOD_SET(TILE, AMD_FMT_MOD_TILE_GFX9_64K_D_X) |
+		    AMD_FMT_MOD_SET(TILE_VERSION, AMD_FMT_MOD_TILE_VER_GFX10) |
+		    AMD_FMT_MOD_SET(PIPE_XOR_BITS, pipe_xor_bits));
+
+	add_modifier(mods, size, capacity, AMD_FMT_MOD |
+		    AMD_FMT_MOD_SET(TILE, AMD_FMT_MOD_TILE_GFX9_64K_S_X) |
+		    AMD_FMT_MOD_SET(TILE_VERSION, AMD_FMT_MOD_TILE_VER_GFX10) |
+		    AMD_FMT_MOD_SET(PIPE_XOR_BITS, pipe_xor_bits));
+
+	add_modifier(mods, size, capacity, AMD_FMT_MOD |
+		    AMD_FMT_MOD_SET(TILE, AMD_FMT_MOD_TILE_GFX9_64K_D) |
+		    AMD_FMT_MOD_SET(TILE_VERSION, AMD_FMT_MOD_TILE_VER_GFX10));
+
+	add_modifier(mods, size, capacity, AMD_FMT_MOD |
+		    AMD_FMT_MOD_SET(TILE, AMD_FMT_MOD_TILE_GFX9_64K_D) |
+		    AMD_FMT_MOD_SET(TILE_VERSION, AMD_FMT_MOD_TILE_VER_GFX9));
+
+	add_modifier(mods, size, capacity, AMD_FMT_MOD |
+		    AMD_FMT_MOD_SET(TILE, AMD_FMT_MOD_TILE_GFX9_64K_S) |
+		    AMD_FMT_MOD_SET(TILE_VERSION, AMD_FMT_MOD_TILE_VER_GFX9));
+}
+
+static void
+add_gfx10_3_modifiers(const struct amdgpu_device *adev,
+		     uint64_t **mods, uint64_t *size, uint64_t *capacity)
+{
+	int pipe_xor_bits = ilog2(adev->gfx.config.gb_addr_config_fields.num_pipes);
+	int pkrs = ilog2(adev->gfx.config.gb_addr_config_fields.num_pkrs);
+
+	add_modifier(mods, size, capacity, AMD_FMT_MOD |
+		    AMD_FMT_MOD_SET(TILE, AMD_FMT_MOD_TILE_GFX9_64K_R_X) |
+		    AMD_FMT_MOD_SET(TILE_VERSION, AMD_FMT_MOD_TILE_VER_GFX10_RBPLUS) |
+		    AMD_FMT_MOD_SET(PIPE_XOR_BITS, pipe_xor_bits) |
+		    AMD_FMT_MOD_SET(PACKERS, pkrs) |
+		    AMD_FMT_MOD_SET(DCC, 1) |
+		    AMD_FMT_MOD_SET(DCC_CONSTANT_ENCODE, 1) |
+		    AMD_FMT_MOD_SET(DCC_INDEPENDENT_64B, 1) |
+		    AMD_FMT_MOD_SET(DCC_INDEPENDENT_128B, 1) |
+		    AMD_FMT_MOD_SET(DCC_MAX_COMPRESSED_BLOCK, AMD_FMT_MOD_DCC_BLOCK_128B));
+
+	add_modifier(mods, size, capacity, AMD_FMT_MOD |
+		    AMD_FMT_MOD_SET(TILE, AMD_FMT_MOD_TILE_GFX9_64K_R_X) |
+		    AMD_FMT_MOD_SET(TILE_VERSION, AMD_FMT_MOD_TILE_VER_GFX10_RBPLUS) |
+		    AMD_FMT_MOD_SET(PIPE_XOR_BITS, pipe_xor_bits) |
+		    AMD_FMT_MOD_SET(PACKERS, pkrs) |
+		    AMD_FMT_MOD_SET(DCC, 1) |
+		    AMD_FMT_MOD_SET(DCC_RETILE, 1) |
+		    AMD_FMT_MOD_SET(DCC_CONSTANT_ENCODE, 1) |
+		    AMD_FMT_MOD_SET(DCC_INDEPENDENT_64B, 1) |
+		    AMD_FMT_MOD_SET(DCC_INDEPENDENT_128B, 1) |
+		    AMD_FMT_MOD_SET(DCC_MAX_COMPRESSED_BLOCK, AMD_FMT_MOD_DCC_BLOCK_128B));
+
+	add_modifier(mods, size, capacity, AMD_FMT_MOD |
+		    AMD_FMT_MOD_SET(TILE, AMD_FMT_MOD_TILE_GFX9_64K_R_X) |
+		    AMD_FMT_MOD_SET(TILE_VERSION, AMD_FMT_MOD_TILE_VER_GFX10_RBPLUS) |
+		    AMD_FMT_MOD_SET(PIPE_XOR_BITS, pipe_xor_bits) |
+		    AMD_FMT_MOD_SET(PACKERS, pkrs));
+
+	add_modifier(mods, size, capacity, AMD_FMT_MOD |
+		    AMD_FMT_MOD_SET(TILE, AMD_FMT_MOD_TILE_GFX9_64K_D_X) |
+		    AMD_FMT_MOD_SET(TILE_VERSION, AMD_FMT_MOD_TILE_VER_GFX10_RBPLUS) |
+		    AMD_FMT_MOD_SET(PIPE_XOR_BITS, pipe_xor_bits) |
+		    AMD_FMT_MOD_SET(PACKERS, pkrs));
+
+	add_modifier(mods, size, capacity, AMD_FMT_MOD |
+		    AMD_FMT_MOD_SET(TILE, AMD_FMT_MOD_TILE_GFX9_64K_S_X) |
+		    AMD_FMT_MOD_SET(TILE_VERSION, AMD_FMT_MOD_TILE_VER_GFX10_RBPLUS) |
+		    AMD_FMT_MOD_SET(PIPE_XOR_BITS, pipe_xor_bits) |
+		    AMD_FMT_MOD_SET(PACKERS, pkrs));
+
+	add_modifier(mods, size, capacity, AMD_FMT_MOD |
+		    AMD_FMT_MOD_SET(TILE, AMD_FMT_MOD_TILE_GFX9_64K_D) |
+		    AMD_FMT_MOD_SET(TILE_VERSION, AMD_FMT_MOD_TILE_VER_GFX10_RBPLUS));
+
+	add_modifier(mods, size, capacity, AMD_FMT_MOD |
+		    AMD_FMT_MOD_SET(TILE, AMD_FMT_MOD_TILE_GFX9_64K_D) |
+		    AMD_FMT_MOD_SET(TILE_VERSION, AMD_FMT_MOD_TILE_VER_GFX9));
+
+	add_modifier(mods, size, capacity, AMD_FMT_MOD |
+		    AMD_FMT_MOD_SET(TILE, AMD_FMT_MOD_TILE_GFX9_64K_S) |
+		    AMD_FMT_MOD_SET(TILE_VERSION, AMD_FMT_MOD_TILE_VER_GFX9));
+}
+
+static int
+get_plane_modifiers(const struct amdgpu_device *adev, unsigned int plane_type, uint64_t **mods)
+{
+	uint64_t size = 0, capacity = 128;
+	*mods = NULL;
+
+	/* We have not hooked up any pre-GFX9 modifiers. */
+	if (adev->family < AMDGPU_FAMILY_AI)
+		return 0;
+
+	*mods = kmalloc(capacity * sizeof(uint64_t), GFP_KERNEL);
+
+	if (plane_type == DRM_PLANE_TYPE_CURSOR) {
+		add_modifier(mods, &size, &capacity, DRM_FORMAT_MOD_LINEAR);
+		add_modifier(mods, &size, &capacity, DRM_FORMAT_MOD_INVALID);
+		return *mods ? 0 : -ENOMEM;
+	}
+
+	switch (adev->family) {
+	case AMDGPU_FAMILY_AI:
+	case AMDGPU_FAMILY_RV:
+		add_gfx9_modifiers(adev, mods, &size, &capacity);
+		break;
+	case AMDGPU_FAMILY_NV:
+		if (adev->asic_type >= CHIP_SIENNA_CICHLID)
+			add_gfx10_3_modifiers(adev, mods, &size, &capacity);
+		else
+			add_gfx10_1_modifiers(adev, mods, &size, &capacity);
+		break;
+	}
+
+	add_modifier(mods, &size, &capacity, DRM_FORMAT_MOD_LINEAR);
+
+	/* INVALID marks the end of the list. */
+	add_modifier(mods, &size, &capacity, DRM_FORMAT_MOD_INVALID);
+
+	if (!*mods)
+		return -ENOMEM;
+
+	return 0;
+}
+
 static void
 block_alignment(unsigned int blocksize_log2, unsigned int *width, unsigned int *height)
 {
@@ -5886,6 +6220,7 @@ static const struct drm_plane_funcs dm_plane_funcs = {
 	.reset = dm_drm_plane_reset,
 	.atomic_duplicate_state = dm_drm_plane_duplicate_state,
 	.atomic_destroy_state = dm_drm_plane_destroy_state,
+	.format_mod_supported = dm_plane_format_mod_supported,
 };
 
 static int dm_plane_helper_prepare_fb(struct drm_plane *plane,
@@ -6154,13 +6489,19 @@ static int amdgpu_dm_plane_init(struct amdgpu_display_manager *dm,
 	uint32_t formats[32];
 	int num_formats;
 	int res = -EPERM;
+	uint64_t *modifiers = NULL;
 
 	num_formats = get_plane_formats(plane, plane_cap, formats,
 					ARRAY_SIZE(formats));
 
+	res = get_plane_modifiers(dm->adev, plane->type, &modifiers);
+	if (res)
+		return res;
+
 	res = drm_universal_plane_init(dm->adev->ddev, plane, possible_crtcs,
 				       &dm_plane_funcs, formats, num_formats,
-				       NULL, plane->type, NULL);
+				       modifiers, plane->type, NULL);
+	kfree(modifiers);
 	if (res)
 		return res;
 
-- 
2.28.0

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
