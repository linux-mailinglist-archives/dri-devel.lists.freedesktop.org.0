Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id E200B41A9FF
	for <lists+dri-devel@lfdr.de>; Tue, 28 Sep 2021 09:42:07 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0E1286E0D0;
	Tue, 28 Sep 2021 07:42:05 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pj1-x1029.google.com (mail-pj1-x1029.google.com
 [IPv6:2607:f8b0:4864:20::1029])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C973A6E0D0
 for <dri-devel@lists.freedesktop.org>; Tue, 28 Sep 2021 07:42:03 +0000 (UTC)
Received: by mail-pj1-x1029.google.com with SMTP id
 d13-20020a17090ad3cd00b0019e746f7bd4so1129426pjw.0
 for <dri-devel@lists.freedesktop.org>; Tue, 28 Sep 2021 00:42:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=sender:from:to:cc:subject:date:message-id;
 bh=IsyJwynNv9ch1Auj0dl613hO+cW2WdGqFZdpoxNZiWY=;
 b=B3XvJzJDus2vAqGISVUzohmySABNF2fd+F06Y35x3v/6lGsCh5MoBlV4gkPppodhZY
 /kvlxJSSUnQYsheFhUTLEuuQZZX0SvuucKLJFz7RtEJXhU1hF1FaAzoVCtI6fajPNnqZ
 YGZnfu2nHAD5AqXTpx92ZQHK9YIkIq97d4pqErCB1JsEytI7c7Vy6xoVPGQ5tZkFFhhO
 1tSDDr423lTxvrXWgYKzJxTPYlOTUWMQGgujNRm4WbGnBtHf2OiFyiIqx7dBltBszn5y
 IsQnjS5BKQ9x0jonHYAPyb6HPuJUAkJsnXWmtkwTI9MxNYrdyLXUZQa/LJjO1CBzN8SK
 jySQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id;
 bh=IsyJwynNv9ch1Auj0dl613hO+cW2WdGqFZdpoxNZiWY=;
 b=oEkHnghI8BP4R68QGVq/lpzkdE2ymutztxd6UCKfpc1kRanSTwEoOD2ZfNWjP1hKVc
 27a4ttQ28S4NJEmNdDe5MiGYIu/LGUeVy/lp2veJ2NKmUlyZKSZ9B1Aifz7MSdpREyv8
 js1mYkmwI+ZLyTr7cxMgw2MsCkBJLYJapkxIDHIqPbRJ72K5Hnc3/qsChCABM1+MSdQk
 TeN07X3O52Xq7cAChWasC7n06+fqLAGjGo9AurXGJCxURzH95W+/9Pw94jPW+SnH1ZuU
 gWe3kN8I0CahMN1Pb64jp2GVKuDvPfe2qYJHqU78R21HQXGLuVtaEl1fnhOBemasMn0u
 awxQ==
X-Gm-Message-State: AOAM532BE2+Cx7N38lbdUNqenStyX1rNM7Zzyofp6hlfUoclKR/fbVPM
 J/Vql7mjb1485KatysVHAUc=
X-Google-Smtp-Source: ABdhPJzFyeluqmsWzB4csMFXPKwe7IoeAP8YxULsyegqnNqLjUzmqQotaMAEwmTjk/H7JjxbmsTMug==
X-Received: by 2002:a17:902:bf07:b0:138:e32d:9f2e with SMTP id
 bi7-20020a170902bf0700b00138e32d9f2emr3746955plb.59.1632814923330; 
 Tue, 28 Sep 2021 00:42:03 -0700 (PDT)
Received: from daeinki-virtual-machine.localdomain ([58.124.60.88])
 by smtp.gmail.com with ESMTPSA id a10sm19015557pfn.48.2021.09.28.00.42.01
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 28 Sep 2021 00:42:02 -0700 (PDT)
From: Inki Dae <inki.dae@samsung.com>
To: airlied@linux.ie
Cc: dri-devel@lists.freedesktop.org,
	linux-samsung-soc@vger.kernel.org
Subject: [GIT PULL] exynos-drm-fixes
Date: Tue, 28 Sep 2021 16:41:58 +0900
Message-Id: <20210928074158.2942-1-inki.dae@samsung.com>
X-Mailer: git-send-email 2.17.1
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

Hi Dave,

   Just one clean up to use helper function.

Please kindly let me know if there is any problem.

Thanks,
Inki Dae

The following changes since commit 6880fa6c56601bb8ed59df6c30fd390cc5f6dd8f:

  Linux 5.15-rc1 (2021-09-12 16:28:37 -0700)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/daeinki/drm-exynos tags/exynos-drm-fixes-for-v5.15-rc4

for you to fetch changes up to 17ac76e050c51497e75871a43aa3328ba54cdafd:

  drm/exynos: Make use of the helper function devm_platform_ioremap_resource() (2021-09-16 14:05:07 +0900)

----------------------------------------------------------------
One cleanup
- Use devm_platform_ioremap_resource() helper function instead of old
  one.

----------------------------------------------------------------
Cai Huoqing (1):
      drm/exynos: Make use of the helper function devm_platform_ioremap_resource()

 drivers/gpu/drm/exynos/exynos5433_drm_decon.c | 4 +---
 drivers/gpu/drm/exynos/exynos_drm_dsi.c       | 4 +---
 drivers/gpu/drm/exynos/exynos_drm_fimc.c      | 5 +----
 drivers/gpu/drm/exynos/exynos_drm_fimd.c      | 4 +---
 drivers/gpu/drm/exynos/exynos_drm_g2d.c       | 5 +----
 drivers/gpu/drm/exynos/exynos_drm_gsc.c       | 6 +-----
 drivers/gpu/drm/exynos/exynos_drm_rotator.c   | 4 +---
 drivers/gpu/drm/exynos/exynos_drm_scaler.c    | 4 +---
 drivers/gpu/drm/exynos/exynos_hdmi.c          | 4 +---
 9 files changed, 9 insertions(+), 31 deletions(-)
