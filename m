Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 4E3E16B0CE8
	for <lists+dri-devel@lfdr.de>; Wed,  8 Mar 2023 16:34:27 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1FBF010E607;
	Wed,  8 Mar 2023 15:34:20 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-qt1-x82a.google.com (mail-qt1-x82a.google.com
 [IPv6:2607:f8b0:4864:20::82a])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D591710E607
 for <dri-devel@lists.freedesktop.org>; Wed,  8 Mar 2023 15:34:17 +0000 (UTC)
Received: by mail-qt1-x82a.google.com with SMTP id y10so18472831qtj.2
 for <dri-devel@lists.freedesktop.org>; Wed, 08 Mar 2023 07:34:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=chromium.org; s=google; t=1678289657;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=rJPmzdZE4NSQdkz7wFZ0jochMCQuk6LumCoRhBy4k2I=;
 b=VakQlAXPBwXadUCnmy2qfP2seck4Mcu4X2hhm8QJIhsMasnL/ScseQIP6fkikJJauh
 r4z9bsiNUoCTbjYA9jN0bdUho8reXLT9yzOseDXTgEIddxl1Gk2gocrTKU7QZTQ2Ezve
 IvZU5EFRkzm2GELvjrkQMbVjAziM8VazNi614=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1678289657;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=rJPmzdZE4NSQdkz7wFZ0jochMCQuk6LumCoRhBy4k2I=;
 b=rn7wWmYm0G7Utv4CexJGHj0UmpR6YgSogUUFPPWdE2GEMjWfWB011eNQpPdKMczaPM
 5p66E10Qy1nhRb56uAOWnGM/B/6hn9BVySoPk25I7JD1B0sDd8V9VzLCVdq5wJTweyyv
 wpDSRXqJRc/nGWklwyZLdTaR9SUKNzEjt0ZfsN236mCeIX2IvzbvpjIWocwL1pBzcNq3
 yTU2TqKIaTyAr1DMeZiCgYSwOz3o2XYuREsx17DWOggJctu5oJxNnQG4Kc2JHFh5tPFf
 i+WMPMQrvl3wuNTbjDo/GQskpEBBCbvCAUV11RZVautM6wgdhojQ25cbfllG9vFygarh
 oTCA==
X-Gm-Message-State: AO0yUKX+b/UfVUTcVThqb4aYBikNI/kUnuldUyE00ExKGBLrbEBTQsgu
 YKO21uD5I6MBFHB3sQZTpgG51w==
X-Google-Smtp-Source: AK7set94y1LoGb6TI2c5F8OOyhxTynG9RJHPpWlMkkXZiFAVpPpXIBgOHtqCI0Ftilyiq6xU6yVpGQ==
X-Received: by 2002:ac8:7d84:0:b0:3b9:fb0e:adba with SMTP id
 c4-20020ac87d84000000b003b9fb0eadbamr31631153qtd.25.1678289656877; 
 Wed, 08 Mar 2023 07:34:16 -0800 (PST)
Received: from greenjustin3.nyc.corp.google.com
 ([2620:0:1003:314:8752:d0ab:8bcc:f9a8])
 by smtp.gmail.com with ESMTPSA id
 c134-20020ae9ed8c000000b0073d873df3fesm10506884qkg.30.2023.03.08.07.34.16
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 08 Mar 2023 07:34:16 -0800 (PST)
From: Justin Green <greenjustin@chromium.org>
To: linux-mediatek@lists.infradead.org,
	dri-devel@lists.freedesktop.org
Subject: [PATCH v7 RESEND 0/3] drm/mediatek: Add support for 10-bit overlays
Date: Wed,  8 Mar 2023 10:33:55 -0500
Message-Id: <20230308153358.333297-1-greenjustin@chromium.org>
X-Mailer: git-send-email 2.40.0.rc0.216.gc4246ad0f0-goog
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
Cc: chunkuang.hu@kernel.org, greenjustin@chromium.org,
 jason-jh.lin@mediatek.com, justin.yeh@mediatek.com, wenst@chromium.org,
 matthias.bgg@gmail.com, angelogioacchino.delregno@collabora.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

This patch series adds support for 10-bit overlays to the Mediatek DRM driver.
Specifically, we add support for AR30 and BA30 overlays on MT8195 devices and
lay the groundwork for supporting more 10-bit formats on more devices.

1. Refactor plane initialization logic to allow individual DDP components to
provide their supported pixel formats.

2. Add AR30 and BA30 support to overlay driver.

3. Enable AR30 and BA30 overlays on MT8195.


Version history:
v2:
 * Rebase and resolve merge conflicts with the AFBC patch.
v3:
 * Moved 10-bit support detection to mtk_disk_ovl.c
v4:
 * Moved formats to mtk_disp_ovl.c and mtk_disp_rdma.c
v5:
 * Minor style adjustments per checkpatch.pl
v6:
 * Refactor patch into patch series.
 * Add formats directly to private data.
v7:
 * Gate setting OVL_CLRFMT_EXT register on compatibility.
 * Split patches for adding 10-bit support and enabling 10-bit support on
   MT8195.


Justin Green (3):
  drm/mediatek: Refactor pixel format logic
  drm/mediatek: Add support for AR30 and BA30 overlays
  drm/mediatek: Enable AR30 and BA30 overlays on MT8195

 drivers/gpu/drm/mediatek/mtk_disp_drv.h     |  4 +
 drivers/gpu/drm/mediatek/mtk_disp_ovl.c     | 94 +++++++++++++++++++++
 drivers/gpu/drm/mediatek/mtk_disp_rdma.c    | 38 +++++++++
 drivers/gpu/drm/mediatek/mtk_drm_crtc.c     |  4 +-
 drivers/gpu/drm/mediatek/mtk_drm_ddp_comp.c |  4 +
 drivers/gpu/drm/mediatek/mtk_drm_ddp_comp.h | 20 +++++
 drivers/gpu/drm/mediatek/mtk_drm_plane.c    | 24 ++----
 drivers/gpu/drm/mediatek/mtk_drm_plane.h    |  3 +-
 8 files changed, 173 insertions(+), 18 deletions(-)

-- 
2.39.1.456.gfc5497dd1b-goog

