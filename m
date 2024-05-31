Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id CA6668D74D8
	for <lists+dri-devel@lfdr.de>; Sun,  2 Jun 2024 13:08:28 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A0AC110E097;
	Sun,  2 Jun 2024 11:08:17 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="BBwQU50G";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pf1-f195.google.com (mail-pf1-f195.google.com
 [209.85.210.195])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 70BE210E1E9
 for <dri-devel@lists.freedesktop.org>; Fri, 31 May 2024 13:56:21 +0000 (UTC)
Received: by mail-pf1-f195.google.com with SMTP id
 d2e1a72fcca58-7024d560b32so310165b3a.1
 for <dri-devel@lists.freedesktop.org>; Fri, 31 May 2024 06:56:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1717163781; x=1717768581; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=f88cGD1FnhKDUsKAgEZDQuP7J2A9CwKyo3RmWwbI5bQ=;
 b=BBwQU50GLP51hIPszhPF52qTNT/pnz7E69DPSwxucfwa3JhGmXFAz8baV6sxPK0BAv
 PvgA6hgIsErtM0b5niw+4kLO4JA3Q+enVtJVLhsNUJD1yJ9i5w2lGQzdJhIk3BvKEyQf
 U0YefRhpAAdHWDEjInul0Pvfi5HjV9rJjPumYw+xSpW+3o/h/O23cHmNBOWSS9sLDcgQ
 0XVYcj0xP+GKZTYMjsNY9RCkLbbN5nknyiaxnlJxNcnu34/qBUyvc+BlPGYJJWzmyvNt
 KW0ntY9VxW2eUrV8qMeEwBU+6PXEkrOTaKlm4ck/55cFUX6a4Ps41y2/qcfhLbWdqgFF
 ObYQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1717163781; x=1717768581;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=f88cGD1FnhKDUsKAgEZDQuP7J2A9CwKyo3RmWwbI5bQ=;
 b=gd8q10wpzhP4tTJHHDqhr1uCIrAx6ZZxOYX8O9T2LCFgMX9i/fPceibp4zzd8dq/Uv
 vQ2Htfy5okEW0ouKWP3cvbbqGhbkOguI0moQzgnqLhjjyTpifyyT2DQnhIlUR4ujjKWz
 Cu9fGgiBW6VJtr/xLz4VZPav5ThARXY6V+CHq0bvwzzjO/yh8JiCZY4Szl9NsdTzNtwl
 sJ6q+MOpnACKon/nLqHuJV/xdUpzCkgIqGpHDIuviM0hvUGwuc1ERw6lhpRx29HpRn+x
 M622WHJZkylDXtdPVOJKTznFyVsYarpQ7NtXvygdmQnueXVXOqQibjI23APlsdx9OXF5
 7Lmw==
X-Gm-Message-State: AOJu0Yx94I9p/bxj+IgRiN0m30/td3ApYUCgqzWcwDy3naxT4ngatKsx
 FRD0d24mCbuT94mqkHFvp9tWE9JvXNGh8jHijO8S+1dGVAthOuJ/
X-Google-Smtp-Source: AGHT+IH0YvPVxX9fRnTayrr8VgcSelULPtfRp4cHSupfP06wOlbiydiTaJIbBywey0DS9wr+x4JdqQ==
X-Received: by 2002:a05:6a00:8a11:b0:702:496d:d8b5 with SMTP id
 d2e1a72fcca58-702496dda20mr2357058b3a.6.1717163780807; 
 Fri, 31 May 2024 06:56:20 -0700 (PDT)
Received: from lhy-a01-ubuntu22.. ([106.39.42.164])
 by smtp.gmail.com with ESMTPSA id
 d2e1a72fcca58-702423cdda4sm1398882b3a.32.2024.05.31.06.56.15
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 31 May 2024 06:56:20 -0700 (PDT)
From: Huai-Yuan Liu <qq810974084@gmail.com>
To: thierry.reding@gmail.com, mperttunen@nvidia.com, airlied@gmail.com,
 daniel@ffwll.ch, jonathanh@nvidia.com
Cc: dri-devel@lists.freedesktop.org, linux-tegra@vger.kernel.org,
 linux-kernel@vger.kernel.org, baijiaju1990@gmail.com,
 Huai-Yuan Liu <qq810974084@gmail.com>
Subject: [PATCH] drm/tegra: fix a possible null pointer dereference
Date: Fri, 31 May 2024 21:56:08 +0800
Message-Id: <20240531135608.194168-1-qq810974084@gmail.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Mailman-Approved-At: Sun, 02 Jun 2024 11:08:14 +0000
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

In malidp_tegra_crtc_reset, new memory is allocated with kzalloc, but 
no check is performed. Before calling __drm_atomic_helper_crtc_reset, 
mw_state should be checked to prevent possible null pointer dereferene.

Fixes: b7e0b04ae450 ("drm/tegra: Convert to using __drm_atomic_helper_crtc_reset() for reset.")
Signed-off-by: Huai-Yuan Liu <qq810974084@gmail.com>
---
 drivers/gpu/drm/tegra/dc.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/tegra/dc.c b/drivers/gpu/drm/tegra/dc.c
index be61c9d1a4f0..7648e129c212 100644
--- a/drivers/gpu/drm/tegra/dc.c
+++ b/drivers/gpu/drm/tegra/dc.c
@@ -1388,7 +1388,8 @@ static void tegra_crtc_reset(struct drm_crtc *crtc)
 	if (crtc->state)
 		tegra_crtc_atomic_destroy_state(crtc, crtc->state);
 
-	__drm_atomic_helper_crtc_reset(crtc, &state->base);
+	if (state)
+		__drm_atomic_helper_crtc_reset(crtc, &state->base);
 }
 
 static struct drm_crtc_state *
-- 
2.34.1

