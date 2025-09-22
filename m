Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C4C28B9320A
	for <lists+dri-devel@lfdr.de>; Mon, 22 Sep 2025 21:48:15 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4911910E509;
	Mon, 22 Sep 2025 19:48:08 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="ajaKTL4I";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lj1-f173.google.com (mail-lj1-f173.google.com
 [209.85.208.173])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0E3F710E45C
 for <dri-devel@lists.freedesktop.org>; Mon, 22 Sep 2025 14:43:24 +0000 (UTC)
Received: by mail-lj1-f173.google.com with SMTP id
 38308e7fff4ca-3635bd94dadso34716101fa.1
 for <dri-devel@lists.freedesktop.org>; Mon, 22 Sep 2025 07:43:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1758552202; x=1759157002; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=F0lMUB1ROfKuK75/vGdOophe58nNykYwwEOWTGObV+k=;
 b=ajaKTL4Iyu4Pv0nxTdWVXJtP+2leEDB5vFTE93k5UsAdYSYXenGLYyIfuOk9v66nnc
 64df7YiKzuy2/MRhSP5AMuvuFT8vFEotajR6dPT7HQTbUFB1fqTWcPe3rsEoGucN0LOH
 2EheQRWDAbpMTOYH3dNQcqZCCfTxjwNDJ5OLn0xPxBhWPQG/PW7+rdcjw/t40pIIgJQI
 c1xaXnd3idyH4C5Ut/9EVz49fRgM3JbLBqH5YGgnTwCW/QoNac1Lkp5Nego8rGjUuvro
 smMg2pc9UiSg5z84bGWUyw3nMeBcbNw+IPc56lscTCEUieSOefc/AU7HUrdzak5M4Eng
 Eq8Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1758552202; x=1759157002;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=F0lMUB1ROfKuK75/vGdOophe58nNykYwwEOWTGObV+k=;
 b=aodwpmgymSsgJbOxXEOUnWJ/NSzTfNG76L8uJpmy8SrNgse0I5tvPOKlWwBe8WpqTB
 7zUPxm6X1nZw0IYMbE+IAY5Q51p2/UfFigM8km4bwI19PJXMNXrUA5DXzrS27xEbqcqy
 /Bqaj24aHsA2pu+QpkJK5FyknyMX7ATPBRQLX4p4RUF6cYWB7e3S1tNFZOVv+AAXDtI/
 JceXVwTq3wGPV3Fa4j+LKL5SSCR9KBp/FlwFm/xKb9dVPY0zg11PdmrnvtaHpzmupOag
 nBe5rZXZ7mOvwVmxUtLqzTCIJwe+boomGh0CcJ5uCetSw7BMbAfSyveD+VHUUxRLEsi+
 68eA==
X-Forwarded-Encrypted: i=1;
 AJvYcCVFv/euMuhorF2E33pwNidL0b50u/Cpy8S1C1Ned6Me44D+9LPnIj3+OZwS3W7YWjUN8RKTDFzUxNQ=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Ywy9fl/BVERVqdGYYYhd+FR90mS0QeaKf9/P853Jbw3ut7u1bRp
 5w03k0YAJ4Q5XDFOXzYZrI1YCOeWE1gHMkA0GkBdtYmL2ONbZsVqFEvi
X-Gm-Gg: ASbGncu67CbhjgB4gsm3YI46WVUHe9uvLXvJH02xzHFlyH14cj2xf/VRiJgvAIhH8Nj
 dDEEIz1zcUGEdVjVhwVJGYmduYN0t6IO7nHwKyzT5PwOagbX6lePf9tReHUepzdH0QHisl/hdtl
 eKIA9FvA7Yqi5Tri9DuNb/+gTsV5UoMouRQjX6RxSnHZ+Qv5hqrefV6FCr9zE2dM4gieMPzKXHc
 08Q0lTrhODysA3paZ7K1JkRy4TQxB6kd3OfhjVM2GogsPS6TNacC0jUjzaWvTaz+ZvmxMpxH3qc
 9ZPJnE3MU15HvRHVH5XEtlSZ8dU2qRxNWRSJ3cjr92A+HyyLw7UARO2C+qOn2rIIKuBPxzuFEMs
 R01TalsUTJ/MSFr6DtIMlG3ZKXx7z24vT+EU/k/SgHUVmSuthTJm1/Fzc5q0wuNrNRjEHtSxpFM
 hUKj3TwJrh2TSWU8Sw
X-Google-Smtp-Source: AGHT+IG0k8GFm/GzeFNoiWTic6tM3XN6hehF7mLWcX6QsOfPfppRRO6H9eJxef5vfYTewNG17se7sA==
X-Received: by 2002:a05:651c:545:b0:36b:4cc1:15ff with SMTP id
 38308e7fff4ca-36b4cc116b5mr18512911fa.5.1758552201998; 
 Mon, 22 Sep 2025 07:43:21 -0700 (PDT)
Received: from localhost.localdomain
 (broadband-109-173-93-221.ip.moscow.rt.ru. [109.173.93.221])
 by smtp.gmail.com with ESMTPSA id
 38308e7fff4ca-3673e015747sm15960611fa.62.2025.09.22.07.43.21
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 22 Sep 2025 07:43:21 -0700 (PDT)
From: Alexandr Sapozhnkiov <alsp705@gmail.com>
To: Jani Nikula <jani.nikula@linux.intel.com>,
 Joonas Lahtinen <joonas.lahtinen@linux.intel.com>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>,
 Tvrtko Ursulin <tursulin@ursulin.net>, David Airlie <airlied@gmail.com>,
 Daniel Vetter <daniel@ffwll.ch>, intel-gfx@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org
Cc: Alexandr Sapozhnikov <alsp705@gmail.com>, linux-media@vger.kernel.org,
 lvc-project@linuxtesting.org
Subject: [PATCH 5.10] gpu/i915: fix error return in mmap_offset_attach()
Date: Mon, 22 Sep 2025 17:43:16 +0300
Message-ID: <20250922144318.26-1-alsp705@gmail.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Mailman-Approved-At: Mon, 22 Sep 2025 19:47:43 +0000
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

From: Alexandr Sapozhnikov <alsp705@gmail.com>

Return value of function 'drm_vma_node_allow', called 
at i915_gem_mman.c:670, is not checked, but it is usually 
checked for this function

Found by Linux Verification Center (linuxtesting.org) with SVACE.
Signed-off-by: Alexandr Sapozhnikov <alsp705@gmail.com>

---
 drivers/gpu/drm/i915/gem/i915_gem_mman.c | 7 +++++--
 1 file changed, 5 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/i915/gem/i915_gem_mman.c b/drivers/gpu/drm/i915/gem/i915_gem_mman.c
index a2195e28b625..adaef8f09d59 100644
--- a/drivers/gpu/drm/i915/gem/i915_gem_mman.c
+++ b/drivers/gpu/drm/i915/gem/i915_gem_mman.c
@@ -706,8 +706,11 @@ mmap_offset_attach(struct drm_i915_gem_object *obj,
 	mmo = insert_mmo(obj, mmo);
 	GEM_BUG_ON(lookup_mmo(obj, mmap_type) != mmo);
 out:
-	if (file)
-		drm_vma_node_allow_once(&mmo->vma_node, file);
+	if (file) {
+		err = drm_vma_node_allow_once(&mmo->vma_node, file);
+		if (err)
+			goto err;
+	}
 	return mmo;
 
 err:
-- 
2.43.0

