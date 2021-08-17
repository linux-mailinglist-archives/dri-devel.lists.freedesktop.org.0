Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id EAFA73EE418
	for <lists+dri-devel@lfdr.de>; Tue, 17 Aug 2021 04:02:22 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 796276E0DF;
	Tue, 17 Aug 2021 02:02:17 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-x12b.google.com (mail-lf1-x12b.google.com
 [IPv6:2a00:1450:4864:20::12b])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 259E26E0A2
 for <dri-devel@lists.freedesktop.org>; Tue, 17 Aug 2021 02:02:15 +0000 (UTC)
Received: by mail-lf1-x12b.google.com with SMTP id g13so38229032lfj.12
 for <dri-devel@lists.freedesktop.org>; Mon, 16 Aug 2021 19:02:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=LeDUZerYgs0/VRyn6Vbc3mu8D8SEh6Gle5d+UtLhMUo=;
 b=erVnpZgPdz0Cy7RoxFgipeGYgGcmWFIZirHU2Yk4K7PY6mna1YszI5U80zIgc98RLd
 vC8K0TfqnJvLWnvy8Soo0VFS6/9k0e8F6tA9qHxnGXUG2ZzQyW7Daag1X1nMMcxudKuF
 NRoEdf5nrRKOrErz1duotOlt5J6nhWtiHU/+Ps6bQcjhpNMkrlBPnM/Qws7WNzxEWerv
 xbXemK9jxt+gLLgRdCn3gG0hXFqEj22GSuUXkwnBj/9GdaIgUSz4Mbpl5b+ejDZMFtsX
 h6kD2adhiS9WizUTw1PkgQT2hFheMzDPjdpQGh8JvWtzpCmWqx4GEBkv9gWC4rajAInn
 Sp0g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=LeDUZerYgs0/VRyn6Vbc3mu8D8SEh6Gle5d+UtLhMUo=;
 b=dLHZ+8WnEBYNPOBt616z/oIVakR85BzRGZA0CN5RfiNoA50mfYRrbNkhMLk5Dzx4vo
 IWIOSh15qzs8jdwFloTwAlUIQxMyh10Zti+uIvUS1hG9NzCaqoMTQCpwqSfi3zSfcVXa
 c7PV7Fv/r2YLqu/TGqyhZP19d7XkpxwCEQORKy52FUNUT+usmXK5hgmnKOfEGPtz8s54
 mNQui1CS5OospNF7fXry+RMtZIlLhfIQctOF0n+RM+jRJnaQrhzJK7sJEZEX/xpmthQH
 hZnLo/Qhwj41g+U2NpmUaPO8hzWUM+ooJ/T1r3WQjul9KQ8skXdoZjE2AHilmjKiq/f+
 V2EQ==
X-Gm-Message-State: AOAM531LZTOMYaPf+wNW2q17iRK+Puij8mnSyXvYrL6BaVLBhrDcKoMh
 Ewi1Zt1p/j5C1uPeUBYhtMU=
X-Google-Smtp-Source: ABdhPJzYaXnJVVykD6dXfLHQucjLE9tpup4cVMAKU8bG+LamEsyXCVKCBt2Z/pt9EtUeqkJuA+IC/A==
X-Received: by 2002:a05:6512:ea4:: with SMTP id
 bi36mr562765lfb.414.1629165733349; 
 Mon, 16 Aug 2021 19:02:13 -0700 (PDT)
Received: from localhost.localdomain (46-138-85-91.dynamic.spd-mgts.ru.
 [46.138.85.91])
 by smtp.gmail.com with ESMTPSA id i24sm51729lfc.293.2021.08.16.19.02.12
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 16 Aug 2021 19:02:13 -0700 (PDT)
From: Dmitry Osipenko <digetx@gmail.com>
To: Thierry Reding <thierry.reding@gmail.com>,
 Jonathan Hunter <jonathanh@nvidia.com>, Mikko Perttunen <cyndis@kapsi.fi>
Cc: dri-devel@lists.freedesktop.org,
	linux-tegra@vger.kernel.org
Subject: [PATCH v1 1/3] drm/tegra: dc: Remove unused variables
Date: Tue, 17 Aug 2021 05:01:51 +0300
Message-Id: <20210817020153.25378-2-digetx@gmail.com>
X-Mailer: git-send-email 2.32.0
In-Reply-To: <20210817020153.25378-1-digetx@gmail.com>
References: <20210817020153.25378-1-digetx@gmail.com>
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

Remove unused variables from tegra_crtc_update_memory_bandwidth().

Fixes: 04d5d5df9df7 ("drm/tegra: dc: Support memory bandwidth management")
Reported-by: kernel test robot <lkp@intel.com>
Signed-off-by: Dmitry Osipenko <digetx@gmail.com>
---
 drivers/gpu/drm/tegra/dc.c | 3 ---
 drivers/gpu/drm/tegra/dc.h | 6 ------
 2 files changed, 9 deletions(-)

diff --git a/drivers/gpu/drm/tegra/dc.c b/drivers/gpu/drm/tegra/dc.c
index 16c7aabb94d3..a29d64f87563 100644
--- a/drivers/gpu/drm/tegra/dc.c
+++ b/drivers/gpu/drm/tegra/dc.c
@@ -1845,7 +1845,6 @@ tegra_crtc_update_memory_bandwidth(struct drm_crtc *crtc,
 				   bool prepare_bandwidth_transition)
 {
 	const struct tegra_plane_state *old_tegra_state, *new_tegra_state;
-	const struct tegra_dc_state *old_dc_state, *new_dc_state;
 	u32 i, new_avg_bw, old_avg_bw, new_peak_bw, old_peak_bw;
 	const struct drm_plane_state *old_plane_state;
 	const struct drm_crtc_state *old_crtc_state;
@@ -1858,8 +1857,6 @@ tegra_crtc_update_memory_bandwidth(struct drm_crtc *crtc,
 		return;
 
 	old_crtc_state = drm_atomic_get_old_crtc_state(state, crtc);
-	old_dc_state = to_const_dc_state(old_crtc_state);
-	new_dc_state = to_const_dc_state(crtc->state);
 
 	if (!crtc->state->active) {
 		if (!old_crtc_state->active)
diff --git a/drivers/gpu/drm/tegra/dc.h b/drivers/gpu/drm/tegra/dc.h
index f0cb691852a1..40378308d527 100644
--- a/drivers/gpu/drm/tegra/dc.h
+++ b/drivers/gpu/drm/tegra/dc.h
@@ -35,12 +35,6 @@ static inline struct tegra_dc_state *to_dc_state(struct drm_crtc_state *state)
 	return NULL;
 }
 
-static inline const struct tegra_dc_state *
-to_const_dc_state(const struct drm_crtc_state *state)
-{
-	return to_dc_state((struct drm_crtc_state *)state);
-}
-
 struct tegra_dc_stats {
 	unsigned long frames;
 	unsigned long vblank;
-- 
2.32.0

