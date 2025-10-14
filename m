Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C4DA3BD79A0
	for <lists+dri-devel@lfdr.de>; Tue, 14 Oct 2025 08:44:30 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AB71A10E096;
	Tue, 14 Oct 2025 06:44:27 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="U9OxYsCz";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lj1-f182.google.com (mail-lj1-f182.google.com
 [209.85.208.182])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6131510E096
 for <dri-devel@lists.freedesktop.org>; Tue, 14 Oct 2025 06:44:26 +0000 (UTC)
Received: by mail-lj1-f182.google.com with SMTP id
 38308e7fff4ca-3737d0920e6so53538071fa.1
 for <dri-devel@lists.freedesktop.org>; Mon, 13 Oct 2025 23:44:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1760424265; x=1761029065; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=f5+eQwI0Mb1HF7qS+pk7CGxcaFFpKMarYKASKjNogEU=;
 b=U9OxYsCzNHkbzOwHgPGEOM0OwUuyjQraCqyr3+IcpA+mqxoeM771i5f4z1QFTQcxPY
 u4KgVWfXEMPFjDZrp7NV18SxmPJoIJGD6c3/TWifbfUuuaBlkBXkgYhjVdV6TlmLNbcd
 Jbu7JQr2EKP9gzXE4xomtUjm+y7XRgK769f+4RvU6VXO0ycOVOwxJ0zDDBkXVWPOJgHh
 Gze4PAmUgmtjcWdudOfAtMyUCHRPX/bXIUSHJwoNsxn5Uab2zMTlTeQb5gv+UizYTGPH
 WA1IpVU9bK+6qPGPmg/bZO6lP+5ry3u2sdwm87t5+9+PE2fwEFgP++c/p0qzTRT9t6oy
 4iWw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1760424265; x=1761029065;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=f5+eQwI0Mb1HF7qS+pk7CGxcaFFpKMarYKASKjNogEU=;
 b=Lgv9NFBoB3Kg+UPP/ELSlrrlPSkkpyLk71KDUqHojc8+gB4wK3Nvv9D0CGq37WePf0
 ZwaW5Afeg8fC9gDXkLKsGDsRpibJdLhah5jqnXyIiYjINjAbSa4BVboiLLzOspoclnHC
 Rl+N+AHS+WVk4SLNfnBy6UFItJzxQ7GSCgwSR3A7kYrJ0VJXdZBGlhTe9hoLa0HJ9Idv
 vhR8kHKOzdplgE5b1FEEYNGYpAiUSFwdG6rxDgcAu4LFsg7OvRxuGok7dX9DeNEqJRVg
 NSmFvuu/g0qns3drZC8PE5846aKszpMchG/dW7NNih8vtuWOTOYhaSriTQLs3kR8ZSpb
 3k2Q==
X-Forwarded-Encrypted: i=1;
 AJvYcCU0NpoX5W32NCHfXsbhla2/eYORqlg0y15r61oXtvLEgqMD0S0jvhuqAmPgUXJRcdC+oyYtKMApWY0=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YyrDETk7tiOjwJM5bLdpXL+wmj0+iUHc6Yt6VDSVow/9cn+67Pp
 6xBdnpYklXR0UXF8MegSZu86rzIHFIYpyxPreAwkOI/myjbEWQcVavhM
X-Gm-Gg: ASbGncsSnJygFNKi/hB7qDhbiFydmXBFdZneoCsymhKPE7b9nicawoSZF4CEjotgsST
 EwqbfDxKVOWSoDjcBbMX9jq6zRALtceICxO9KrspgctufMLQG1BZaAJJ3T/sN21rRXvUrfEvPpH
 t7daHnOHORG/RMQ3kMTZE1QYJM8juNQs4746s78kOUP4xQke6oPSlPPaYiyKbrNJI4ECSOV6gze
 jAAnmVkmZYa/ZtzZI1QmYLZZI3Asx5xb5sYnf7D/d6gAhqidTxd1qfYSlQxgQNUOHGVC4er9MvO
 KlOp9x821w3l+CL+MKvwqCgDSa3jc2qt9yjmCGQbtUoFD1MNc8bd5RfBgOowrnVOQLkQWs34BZP
 jhbKWXAPRVbc2RhlP2EMDrj3vBaRH2ma9Qx7KOpG+4MSellqLgjFZZ0CUfuJPCVlCQl/+GeY2g1
 PUpqEV4Aa7ZBICIWAsZfkM7nu6bX0E7QhPSvOEiGRjxvMNXA==
X-Google-Smtp-Source: AGHT+IFmJuJ2Gq+zrXFJtzs/AN5vXoWk3MaDdcP/25nb997AM9Z7OgvW2leEKAh+3KjJwP/5Rhr/KA==
X-Received: by 2002:a05:651c:35c5:b0:36f:77e6:d25a with SMTP id
 38308e7fff4ca-37609efd7d5mr59354151fa.43.1760424264333; 
 Mon, 13 Oct 2025 23:44:24 -0700 (PDT)
Received: from localhost.localdomain
 (broadband-109-173-93-221.ip.moscow.rt.ru. [109.173.93.221])
 by smtp.gmail.com with ESMTPSA id
 38308e7fff4ca-3762e7b47ddsm37943311fa.21.2025.10.13.23.44.23
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 13 Oct 2025 23:44:24 -0700 (PDT)
From: Alexandr Sapozhnikov <alsp705@gmail.com>
To: Jani Nikula <jani.nikula@linux.intel.com>,
 Joonas Lahtinen <joonas.lahtinen@linux.intel.com>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>,
 Tvrtko Ursulin <tursulin@ursulin.net>, David Airlie <airlied@gmail.com>,
 Daniel Vetter <daniel@ffwll.ch>
Cc: Alexandr Sapozhnikov <alsp705@gmail.com>, intel-gfx@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 linux-media@vger.kernel.org, lvc-project@linuxtesting.org
Subject: [PATCH v2] drm/i915/gem: handle drm_vma_node_allow_once() return value
Date: Tue, 14 Oct 2025 09:44:16 +0300
Message-ID: <20251014064420.11-1-alsp705@gmail.com>
X-Mailer: git-send-email 2.43.0
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

Add missing return value handling of drm_vma_node_allow_once() 
since the failure to insert the file tag for the node should 
indicate the whole mmap_offset_attach() failed as well.

v2: update changelog and return error directly as Chris Wilson, 
    Andi Shyti and Ville Syrjala suggested.
link to v1: https://lore.kernel.org/all/20251002084828.11-1-alsp705@gmail.com/

Found by Linux Verification Center (linuxtesting.org) with svace.

Signed-off-by: Alexandr Sapozhnikov <alsp705@gmail.com>
---
 drivers/gpu/drm/i915/gem/i915_gem_mman.c | 7 +++++--
 1 file changed, 5 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/i915/gem/i915_gem_mman.c b/drivers/gpu/drm/i915/gem/i915_gem_mman.c
index 75f5b0e871ef..eb76f8f2bd95 100644
--- a/drivers/gpu/drm/i915/gem/i915_gem_mman.c
+++ b/drivers/gpu/drm/i915/gem/i915_gem_mman.c
@@ -758,8 +758,11 @@ mmap_offset_attach(struct drm_i915_gem_object *obj,
 	mmo = insert_mmo(obj, mmo);
 	GEM_BUG_ON(lookup_mmo(obj, mmap_type) != mmo);
 out:
-	if (file)
-		drm_vma_node_allow_once(&mmo->vma_node, file);
+	if (file) {
+		err = drm_vma_node_allow_once(&mmo->vma_node, file);
+		if (err)
+			return ERR_PTR(err);
+	}
 	return mmo;
 
 err:
-- 
2.43.0
