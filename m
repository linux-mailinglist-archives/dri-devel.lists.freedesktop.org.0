Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 46E6E444BDA
	for <lists+dri-devel@lfdr.de>; Thu,  4 Nov 2021 01:11:29 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9F7DC6F504;
	Thu,  4 Nov 2021 00:11:26 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-qk1-x72b.google.com (mail-qk1-x72b.google.com
 [IPv6:2607:f8b0:4864:20::72b])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BD2526F4FC
 for <dri-devel@lists.freedesktop.org>; Thu,  4 Nov 2021 00:11:24 +0000 (UTC)
Received: by mail-qk1-x72b.google.com with SMTP id bi29so4116816qkb.5
 for <dri-devel@lists.freedesktop.org>; Wed, 03 Nov 2021 17:11:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=ldaITbI5aA53gX27Irh5cs529cit45pJ5kDRMPtArFw=;
 b=A8OoQhRkXS5iw7b1q+y9i/Rrcw4ikDDalyO7spXfW7B/tswcARUq2RtE2ZcmI1VGsP
 piPLlJV/RwO9XilBRtqy3q26TpLYoj5XUHjRv2gaxvLwTqte8fLW+7GV5Ek5jhPgeMEM
 fNaOMOTwDY6r1DGkRsqC/WNqzmBhf+SsbWDK1b3OzYcZOvHHwf5gFmy3rzlAEcD3x0Cu
 +V9cmITIY5uRhc4fkw1B8qgKGYuquVETW0WngOrxXwsnZVW+B1jRr80zEzPpAN+5/Cdt
 qIoUiOw3WkxvuSQnnOcA+uwyXI7T72VO/KMt9L4evXMCvDMumVrP08sSnPZoUia3FVNf
 8P3A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=ldaITbI5aA53gX27Irh5cs529cit45pJ5kDRMPtArFw=;
 b=yj+iTE3i6av1Y0XErGdpbJCuKQcsq4UCT9N2Sau90ByUcvgwU73tqDpewIjTli+hYM
 M8zUTahW9VE+V3G3GuTMm7cyKmoS+ZO/YYpBMYz+O2RNCqMB0/as1m0MVnigDC2RjghH
 4dlUcDedGT9lWC3frywdeniy1eSOSrff0USc9SOJR6H1ixR7jlsqHQPCkX+TKqYRAGQK
 Z2APaiZ5uzDraHCpjY/yDMyiTil+qtBlrHJLLz4Sc3hqDb3axzmRLNt6jEOHq3LOtF6r
 /rqenYMFhUzB6ka3/Cf1Oxjxxnx5xLXjiw8v7/yVn7bICWgJiMt+H8BXRydfhBDb0hYQ
 fKWA==
X-Gm-Message-State: AOAM530aog9m8M2jTL5xNPCAG2CFuHhJYx9Agpxmo8dk4q7hG2NjS2PG
 W1KQ74c0RhSVwc6Os8lLfk4=
X-Google-Smtp-Source: ABdhPJyNhnSjvCoQQ00/f4NkpkFtlR9celuD9VAjKgY9mtoxx5jbLdtw8xs30JlygeKekTqvgPC8tw==
X-Received: by 2002:a37:ae83:: with SMTP id x125mr38287139qke.37.1635984683785; 
 Wed, 03 Nov 2021 17:11:23 -0700 (PDT)
Received: from localhost.localdomain ([2804:14c:485:504a:3210:abc8:574d:4d09])
 by smtp.gmail.com with ESMTPSA id
 y25sm2634000qkj.15.2021.11.03.17.11.22
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 03 Nov 2021 17:11:23 -0700 (PDT)
From: Fabio Estevam <festevam@gmail.com>
To: p.zabel@pengutronix.de
Subject: [PATCH] Revert "drm/imx: Annotate dma-fence critical section in
 commit path"
Date: Wed,  3 Nov 2021 21:11:12 -0300
Message-Id: <20211104001112.4035691-1-festevam@gmail.com>
X-Mailer: git-send-email 2.25.1
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
Cc: dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

This reverts commit f4b34faa08428d813fc3629f882c503487f94a12.

Since commit f4b34faa0842 ("drm/imx: Annotate dma-fence critical section in
commit path") the following possible circular dependency is detected:

[    5.001811] ======================================================
[    5.001817] WARNING: possible circular locking dependency detected
[    5.001824] 5.14.9-01225-g45da36cc6fcc-dirty #1 Tainted: G        W
[    5.001833] ------------------------------------------------------
[    5.001838] kworker/u8:0/7 is trying to acquire lock:
[    5.001848] c1752080 (regulator_list_mutex){+.+.}-{3:3}, at: regulator_lock_dependent+0x40/0x294
[    5.001903]
[    5.001903] but task is already holding lock:
[    5.001909] c176df78 (dma_fence_map){++++}-{0:0}, at: imx_drm_atomic_commit_tail+0x10/0x160
[    5.001957]
[    5.001957] which lock already depends on the new lock.
...

Revert it for now.

Tested on a imx6q-sabresd.

Fixes: f4b34faa0842 ("drm/imx: Annotate dma-fence critical section in commit path")
Signed-off-by: Fabio Estevam <festevam@gmail.com>
---
 drivers/gpu/drm/imx/imx-drm-core.c | 2 --
 1 file changed, 2 deletions(-)

diff --git a/drivers/gpu/drm/imx/imx-drm-core.c b/drivers/gpu/drm/imx/imx-drm-core.c
index 9558e9e1b431..cb685fe2039b 100644
--- a/drivers/gpu/drm/imx/imx-drm-core.c
+++ b/drivers/gpu/drm/imx/imx-drm-core.c
@@ -81,7 +81,6 @@ static void imx_drm_atomic_commit_tail(struct drm_atomic_state *state)
 	struct drm_plane_state *old_plane_state, *new_plane_state;
 	bool plane_disabling = false;
 	int i;
-	bool fence_cookie = dma_fence_begin_signalling();
 
 	drm_atomic_helper_commit_modeset_disables(dev, state);
 
@@ -112,7 +111,6 @@ static void imx_drm_atomic_commit_tail(struct drm_atomic_state *state)
 	}
 
 	drm_atomic_helper_commit_hw_done(state);
-	dma_fence_end_signalling(fence_cookie);
 }
 
 static const struct drm_mode_config_helper_funcs imx_drm_mode_config_helpers = {
-- 
2.25.1

