Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D2608609AE0
	for <lists+dri-devel@lfdr.de>; Mon, 24 Oct 2022 09:02:06 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 55CE610E284;
	Mon, 24 Oct 2022 07:02:02 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-oa1-x2f.google.com (mail-oa1-x2f.google.com
 [IPv6:2001:4860:4864:20::2f])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E3D0D10E237;
 Mon, 24 Oct 2022 03:12:59 +0000 (UTC)
Received: by mail-oa1-x2f.google.com with SMTP id
 586e51a60fabf-13b23e29e36so9809513fac.8; 
 Sun, 23 Oct 2022 20:12:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=k8/YknSbFQ9UGuXWJAjoOa3rxaDwNTtu301KrN7t33w=;
 b=UxW4It4842ubChhEIJFFyORGE03n8vikDzc0DCblWfILHwUmLC2KDL7Nawf2ibu/s4
 bJ3P4MNzCZS/3py1/tt6al5dqe2dkStiqrd7TpbROmT7ho/ta89ga7xaanV2IQU8zSA1
 U8H+WmKvzZHIjfDX2clipcOQuKPK2lP9vXjCo1jVfWozHFaiOSheRF2HnvE6VzR9cIZI
 /GDdt5Yhspedsy6f8xmqRJeme8Gqz4M2nIhRBQrA08CFsjdklwimZKTubIU3zjSM7NIE
 Nl/pdsUbbDYcqfKUdJEFeBxL4MzYtYtnlGVjwCbvnsd6zfaBljXJxLQZAI+LxRsGfH1j
 65LQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=k8/YknSbFQ9UGuXWJAjoOa3rxaDwNTtu301KrN7t33w=;
 b=D6RIrHgkbvVmzYK2v09nd5iEH55v19I4LPfzqFQ2tj3FHorts+1q5Q8AuUhLtxXzPU
 syrSvipLwGKPwuyyft5JmFYEDy0xQUQsvnCg1suRjsQ7FjQwnkdER0ElLhcRW3SiODtr
 xJwC5aK4bUn853uYd8gLuCEu0GKBT0Ic3kDS2ZUBk+AJ6c+U0WG8nlQDsgGD0Kj0u02A
 wiLS6oIaMk9O91ZpDd85okAGz7PychbqIzkBxPHlBHuf7m82KMJG08pvE3C3Qhe7MJiL
 CQOV/tWig5nqsz3ryM5G0+laCHN8ElC3O3COSO9dwHt7HisLP1UaT/d5rciYqovCFdZV
 5Zgw==
X-Gm-Message-State: ACrzQf0HrCAAupVxOBvm9/xa94BtkKCci7XePZFBhnnk/6iblSvair8n
 7p6sk4Ine71iMfgmaYDghUw=
X-Google-Smtp-Source: AMsMyM7L0LKAAY7nIqLru3fQ3w74W+rIn2GGQpRe5Auk6BgV2ePrtS3ZJuk5WtSyg/77xfECL2c5aQ==
X-Received: by 2002:a05:6870:4284:b0:13b:91b7:89a8 with SMTP id
 y4-20020a056870428400b0013b91b789a8mr2946370oah.284.1666581179060; 
 Sun, 23 Oct 2022 20:12:59 -0700 (PDT)
Received: from smeagol.fibertel.com.ar ([201.235.4.68])
 by smtp.gmail.com with ESMTPSA id
 a12-20020a056870618c00b0013b92b3ac64sm1599365oah.3.2022.10.23.20.12.56
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 23 Oct 2022 20:12:58 -0700 (PDT)
From: =?UTF-8?q?Joaqu=C3=ADn=20Ignacio=20Aramend=C3=ADa?= <samsagax@gmail.com>
To: bas@basnieuwenhuizen.nl
Subject: [PATCH v2] drm/amd/display: Revert logic for plane modifiers
Date: Mon, 24 Oct 2022 00:08:33 -0300
Message-Id: <20221024030832.119039-1-samsagax@gmail.com>
X-Mailer: git-send-email 2.38.1
In-Reply-To: <CAP+8YyFUoFhh1+CEKrs48JV5CiorSSfe6qg90TyUrDoBtzcPhA@mail.gmail.com>
References: <CAP+8YyFUoFhh1+CEKrs48JV5CiorSSfe6qg90TyUrDoBtzcPhA@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Mailman-Approved-At: Mon, 24 Oct 2022 07:01:57 +0000
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
Cc: sunpeng.li@amd.com, Xinhui.Pan@amd.com, rodrigo.siqueira@amd.com,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 amd-gfx@lists.freedesktop.org, alexander.deucher@amd.com,
 stable@vger.kernel.org, christian.koenig@amd.com, samsagax@gmail.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

This file was split in commit 5d945cbcd4b16a29d6470a80dfb19738f9a4319f
("drm/amd/display: Create a file dedicated to planes") and the logic in
dm_plane_format_mod_supported() function got changed by a switch logic.
That change broke drm_plane modifiers setting on series 5000 APUs
(tested on OXP mini AMD 5800U and HP Dev One 5850U PRO)
leading to Gamescope not working as reported on GitHub[1]

To reproduce the issue, enter a TTY and run:

$ gamescope -- vkcube

With said commit applied it will abort. This one restores the old logic,
fixing the issue that affects Gamescope.

[1](https://github.com/Plagman/gamescope/issues/624)

Signed-off-by: Joaquín Ignacio Aramendía <samsagax@gmail.com>
Reviewed-by: Bas Nieuwenhuizen <bas@basnieuwenhuizen.nl>
---
Removed asic_id and excess newlines
---
 .../amd/display/amdgpu_dm/amdgpu_dm_plane.c   | 50 +++----------------
 1 file changed, 7 insertions(+), 43 deletions(-)

diff --git a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_plane.c b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_plane.c
index dfd3be49eac8..e6854f7270a6 100644
--- a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_plane.c
+++ b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_plane.c
@@ -1369,7 +1369,7 @@ static bool dm_plane_format_mod_supported(struct drm_plane *plane,
 {
 	struct amdgpu_device *adev = drm_to_adev(plane->dev);
 	const struct drm_format_info *info = drm_format_info(format);
-	struct hw_asic_id asic_id = adev->dm.dc->ctx->asic_id;
+	int i;

 	enum dm_micro_swizzle microtile = modifier_gfx9_swizzle_mode(modifier) & 3;

@@ -1386,49 +1386,13 @@ static bool dm_plane_format_mod_supported(struct drm_plane *plane,
 		return true;
 	}

-	/* check if swizzle mode is supported by this version of DCN */
-	switch (asic_id.chip_family) {
-	case FAMILY_SI:
-	case FAMILY_CI:
-	case FAMILY_KV:
-	case FAMILY_CZ:
-	case FAMILY_VI:
-		/* asics before AI does not have modifier support */
-		return false;
-	case FAMILY_AI:
-	case FAMILY_RV:
-	case FAMILY_NV:
-	case FAMILY_VGH:
-	case FAMILY_YELLOW_CARP:
-	case AMDGPU_FAMILY_GC_10_3_6:
-	case AMDGPU_FAMILY_GC_10_3_7:
-		switch (AMD_FMT_MOD_GET(TILE, modifier)) {
-		case AMD_FMT_MOD_TILE_GFX9_64K_R_X:
-		case AMD_FMT_MOD_TILE_GFX9_64K_D_X:
-		case AMD_FMT_MOD_TILE_GFX9_64K_S_X:
-		case AMD_FMT_MOD_TILE_GFX9_64K_D:
-			return true;
-		default:
-			return false;
-		}
-		break;
-	case AMDGPU_FAMILY_GC_11_0_0:
-	case AMDGPU_FAMILY_GC_11_0_1:
-		switch (AMD_FMT_MOD_GET(TILE, modifier)) {
-		case AMD_FMT_MOD_TILE_GFX11_256K_R_X:
-		case AMD_FMT_MOD_TILE_GFX9_64K_R_X:
-		case AMD_FMT_MOD_TILE_GFX9_64K_D_X:
-		case AMD_FMT_MOD_TILE_GFX9_64K_S_X:
-		case AMD_FMT_MOD_TILE_GFX9_64K_D:
-			return true;
-		default:
-			return false;
-		}
-		break;
-	default:
-		ASSERT(0); /* Unknown asic */
-		break;
+	/* Check that the modifier is on the list of the plane's supported modifiers. */
+	for (i = 0; i < plane->modifier_count; i++) {
+		if (modifier == plane->modifiers[i])
+			break;
 	}
+	if (i == plane->modifier_count)
+		return false;

 	/*
 	 * For D swizzle the canonical modifier depends on the bpp, so check
--
2.38.1

