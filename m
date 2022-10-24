Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 3239660C44C
	for <lists+dri-devel@lfdr.de>; Tue, 25 Oct 2022 08:55:36 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5AE5F10E173;
	Tue, 25 Oct 2022 06:54:15 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-oa1-x33.google.com (mail-oa1-x33.google.com
 [IPv6:2001:4860:4864:20::33])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DA7F910E246;
 Mon, 24 Oct 2022 11:34:07 +0000 (UTC)
Received: by mail-oa1-x33.google.com with SMTP id
 586e51a60fabf-13ae8117023so11466936fac.9; 
 Mon, 24 Oct 2022 04:34:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=M5UZCFr57jSJwSGj5ycrkruVZLCd8UXEKFZXMqgDVks=;
 b=Psp+OumkznpHgLnHiwYw1sf7aYrjPL/PaHFRiGICufnccSw4s/W0nDvOmlyKc62du7
 YXWX5R/gNmEIxXhnywOAB37LcLDhGS0vTvsnSRcHiBXpqLg6p61frKpXRT65cqPqMViU
 KiYrs77nldrzFFyh8s0gPXh7e7AMOGyabsPE3NasIY8F14cVLczp60Ttfveo5WBxxpZw
 1oKr3NDgOfVJx8M/N+meVaUihFfwhMXZLT0/sS8MxDyTH/3bZjNPlyO74DIDk8TGjvdT
 CpbJQwEVgdW911yK/ZqlHW3zujwxb3GEL/73kSEd4d2OJAxnXuOOkvoqRIK67s2WSWvZ
 Ya0Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=M5UZCFr57jSJwSGj5ycrkruVZLCd8UXEKFZXMqgDVks=;
 b=UkkSlka3DDuyYG5xdBkzS2W0l4sub8KmJv6Iy78HzL8T0Acqr3Nyhd15MI0T3GKAUI
 Whe3s/PtOL/lGmaBGlR3Fbs37HSS3eIP9Z0QJMnN85r0LTksRCftGOPHwyI+wE/6RsNS
 XuyBvNOTFYpH+WD7CZ6olw6msIQsKy2ZHwrfYQQydXEpH4IFHOqfB2iMzWntYjXTjkf8
 c/p6dQu8VdmqtBhGl+zVYeqwbjGMkcxBpX+P1/kjJ8tQb79rtIvNUhHI0S2By97/8pbk
 K9iXpTui6casY3W6T1gif2uBb+JtoWXhiqoTm43UlFbvbfF5oQ5yJHlV7Jkk/gdKr6nB
 B44A==
X-Gm-Message-State: ACrzQf0fQgJo1OZHopTIpPr3GfJjikwXSZ47w4lXvSSmxrREPzRzRxRY
 wdUMbd8qVcs2a7FQQqXgi6qNNOJC9y0L/A==
X-Google-Smtp-Source: AMsMyM4HCOsEjlNPhwJeL0z0TQZEZazmrwv7DoO6SLiYtb/47ToNb4OWYAXijKmn6cFMZUl/a+Pq4g==
X-Received: by 2002:a05:6870:5804:b0:12a:f192:27de with SMTP id
 r4-20020a056870580400b0012af19227demr20359146oap.224.1666611246967; 
 Mon, 24 Oct 2022 04:34:06 -0700 (PDT)
Received: from smeagol.fibertel.com.ar ([201.235.4.68])
 by smtp.gmail.com with ESMTPSA id
 a12-20020a056870618c00b0013b92b3ac64sm1996787oah.3.2022.10.24.04.34.04
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 24 Oct 2022 04:34:06 -0700 (PDT)
From: =?UTF-8?q?Joaqu=C3=ADn=20Ignacio=20Aramend=C3=ADa?= <samsagax@gmail.com>
To: bas@basnieuwenhuizen.nl
Subject: [PATCH v2] drm/amd/display: Revert logic for plane modifiers
Date: Mon, 24 Oct 2022 08:33:59 -0300
Message-Id: <20221024113359.5575-1-samsagax@gmail.com>
X-Mailer: git-send-email 2.38.1
In-Reply-To: <CAP+8YyFUoFhh1+CEKrs48JV5CiorSSfe6qg90TyUrDoBtzcPhA@mail.gmail.com>
References: <CAP+8YyFUoFhh1+CEKrs48JV5CiorSSfe6qg90TyUrDoBtzcPhA@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Mailman-Approved-At: Tue, 25 Oct 2022 06:54:01 +0000
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

Cc: <stable@vger.kernel.org> # 6.0.x
Signed-off-by: Joaquín Ignacio Aramendía <samsagax@gmail.com>
Reviewed-by: Bas Nieuwenhuizen <bas@basnieuwenhuizen.nl>
---
Removed asic_id and excess newlines. Resend with correct Cc line.
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

