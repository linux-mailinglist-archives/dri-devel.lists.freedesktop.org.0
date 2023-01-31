Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 3E76468374A
	for <lists+dri-devel@lfdr.de>; Tue, 31 Jan 2023 21:09:04 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3817D10E393;
	Tue, 31 Jan 2023 20:09:00 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-qv1-xf2a.google.com (mail-qv1-xf2a.google.com
 [IPv6:2607:f8b0:4864:20::f2a])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 63CB410E393
 for <dri-devel@lists.freedesktop.org>; Tue, 31 Jan 2023 20:08:58 +0000 (UTC)
Received: by mail-qv1-xf2a.google.com with SMTP id lc15so3964127qvb.7
 for <dri-devel@lists.freedesktop.org>; Tue, 31 Jan 2023 12:08:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=zCsFrFxTu2Wx/3OnYl4yRwvfLp07q19BSTrZLYzDynI=;
 b=Tlq6vZ3Z+bOChVvdcjQhHB9km22BDOkkZ/qWueLyVRqyLF/yYjO5mWrVeLXmvQb9Hf
 dKM4M8ZGRrZQ/dS3TmSu2sqPQR3T5tCBu6Kt24m6IvM6wKf20RvJstZ6r7/A3rXylWKt
 RtYPf4cKcW09My0AGcaGdQQFGg6xotxnFBJxo=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=zCsFrFxTu2Wx/3OnYl4yRwvfLp07q19BSTrZLYzDynI=;
 b=q0U/ts6IX4PBNMUV0KUosfqIC+l2FiG2tqkUirFScTqHOeLsEtcumLyC2d6A6wrciR
 VHydE7WAHndQ1AHgX6OpPa9PldqGTt3ZdNPkvteSniFzMr8f+6pSriPdUJbOIsUD6Cto
 4bWIUptfxb0C6prP4qZZXGUrY+xpxBALF8gxV5Dsji+5pGKiv2jsTPZHm8ReNYQKxGUL
 95CWap7TR44rkNEijEi8esLlzV0JlWcIsBAjLKIZsDxHPkahy6bj64JNUwjj4Qx0N1Yg
 MXqDiJTrvXeVqClP7afvG2syjgkPLtUHd3sPVurJW/ZmLhD7R+GA83tE6DWxG/I+rc55
 VV9Q==
X-Gm-Message-State: AO0yUKU+C7oygh2kiaymsJ5j21gG+ZAnZ80MUtcvyhZNu5SX5ykaHQ92
 NoxIR3OuqyYXMllFJ+uZ8PDcVA==
X-Google-Smtp-Source: AK7set85WIQ9wkzkoIEEQYoy3mBKFMptDGQsWp5LC2F/fasO0rQjL8HOj7i6LoFemKwmeMixeByhbQ==
X-Received: by 2002:a0c:e909:0:b0:538:861f:cfd7 with SMTP id
 a9-20020a0ce909000000b00538861fcfd7mr255616qvo.42.1675195737469; 
 Tue, 31 Jan 2023 12:08:57 -0800 (PST)
Received: from greenjustin3.nyc.corp.google.com
 ([2620:0:1003:314:502d:723:d741:14cd])
 by smtp.gmail.com with ESMTPSA id
 m186-20020a37bcc3000000b007068b49b8absm10658782qkf.62.2023.01.31.12.08.56
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 31 Jan 2023 12:08:57 -0800 (PST)
From: Justin Green <greenjustin@chromium.org>
To: linux-mediatek@lists.infradead.org,
	dri-devel@lists.freedesktop.org
Subject: [PATCH 0/2 v6] drm/mediatek: Add support for 10-bit overlays
Date: Tue, 31 Jan 2023 15:08:40 -0500
Message-Id: <20230131200842.341272-1-greenjustin@chromium.org>
X-Mailer: git-send-email 2.39.1.456.gfc5497dd1b-goog
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
Cc: chunkuang.hu@kernel.org, Justin Green <greenjustin@chromium.org>,
 airlied@linux.ie, jason-jh.lin@mediatek.com, justin.yeh@mediatek.com,
 wenst@chromium.org, matthias.bgg@gmail.com,
 angelogioacchino.delregno@collabora.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

This patch series adds support for 10-bit overlays to the Mediatek DRM driver.
Specifically, we add support for AR30 and BA30 overlays on MT8195 devices and
lay the groundwork for supporting more 10-bit formats on more devices.

1. Refactor plane initialization logic to allow individual DDP components to
provide their supported pixel formats.

2. Add AR30 and BA30 support to the MT8195 overlay driver.


Version history:
v6:
 * Refactor patch into patch series.
 * Add formats directly to private data.

v5:
* Removed some dead defines.
* Refactored mtk_ovl_set_afbc().

v4:
* Move modifier validation to format_mod_supported function.
* Add modifiers to drm_universal_plane_init() call.
* Make comparisons to DRM_FORMAT_MOD_LINEAR explicit rather than relying on
  DRM_FORMAT_LINEAR being equal to 0.
* Gate AFBC control bit writes on device compatibility.

v3:
* Replaced pitch bitshift math with union based approach.
* Refactored overlay register writes to shared code between non-AFBC and
  AFBC.
* Minor code cleanups.

v2:
* Marked mtk_ovl_set_afbc as static.
* Reflowed some lines to fit column limit.


Justin Green (2):
  drm/mediatek: Refactor pixel format logic
  drm/mediatek: Add support for AR30 and BA30 overlays

 drivers/gpu/drm/mediatek/mtk_disp_drv.h     |  4 +
 drivers/gpu/drm/mediatek/mtk_disp_ovl.c     | 89 +++++++++++++++++++++
 drivers/gpu/drm/mediatek/mtk_disp_rdma.c    | 38 +++++++++
 drivers/gpu/drm/mediatek/mtk_drm_crtc.c     |  4 +-
 drivers/gpu/drm/mediatek/mtk_drm_ddp_comp.c |  4 +
 drivers/gpu/drm/mediatek/mtk_drm_ddp_comp.h | 20 +++++
 drivers/gpu/drm/mediatek/mtk_drm_plane.c    | 24 ++----
 drivers/gpu/drm/mediatek/mtk_drm_plane.h    |  3 +-
 8 files changed, 168 insertions(+), 18 deletions(-)

-- 
2.39.1.456.gfc5497dd1b-goog

