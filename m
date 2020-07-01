Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 81E0121048E
	for <lists+dri-devel@lfdr.de>; Wed,  1 Jul 2020 09:12:35 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2C0F76E819;
	Wed,  1 Jul 2020 07:12:08 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lj1-x243.google.com (mail-lj1-x243.google.com
 [IPv6:2a00:1450:4864:20::243])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AFF7F6E39E
 for <dri-devel@lists.freedesktop.org>; Wed,  1 Jul 2020 02:23:56 +0000 (UTC)
Received: by mail-lj1-x243.google.com with SMTP id s1so25093745ljo.0
 for <dri-devel@lists.freedesktop.org>; Tue, 30 Jun 2020 19:23:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=nvr/jRTYh5p79EJHgRVjtIVXR7dCxg+y/MPsoTOfU1I=;
 b=WoYAlKEI0M/ZUuy+X60Yv/oWWyznPy8EY9r6J/DS/wonoXT2anz1uzkT2qqVnllZyY
 2qiV9/bK1CX/J2qXWSxs3ccgrnDnjuHhdF/R/MA/5zh92vuwWoLcnRo8w2CkfcYklEuQ
 LYlw2gEvU3Kw+MmaW2NWW39GVpA5yOSbZeY/IrG1BtrewFI0+iidROpw+sqzPtUICTaW
 WfvnHqy7LX/IcpdeL1Hx1f3qRWmzLdCMQPXrM+rIdWCEpucagZbrtkQxpxT6P4+3Wtlc
 pvt7xkZD9KxkyFps7Cyjwo8P6MMNugcNT2ocDFFq4lWLUcQcSdLOLbf7qLI65edhqCls
 +LKQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=nvr/jRTYh5p79EJHgRVjtIVXR7dCxg+y/MPsoTOfU1I=;
 b=LYOUBc5/Iova7dfh1hWKuYFFy/zByUpF9zPbc7mM6T/Ap+fcXrncmbWCkGlR+Bz2lF
 JWCKuI9azbtB2KlvE+b/EBp7bHKs8u7D7KiEFTWvNK0kVoQ/c/9lsk5pZDgIllcKeQab
 pxgeqL3rsLnw9lCOLMPSKCe7P//bDcw6Zt0udWl2ynVyOHBEvMo06T/WGcw6mTuMDtAO
 i2TVhG8YYeitKHXRJ/JKDmEtSnqVLDB2pSY4KZdtuW3K679CfF3YoHS9mfX1o309GYH3
 QxaQYncT0e5Z52so6yS1MaVZ2O3nr7cBD2+lxtOo5VMYYk+GGVK1Uww+yRiZRqCOUhUf
 eGTg==
X-Gm-Message-State: AOAM533+8FQRjhkcbXhUrKYCz6WtEyx5zn0Rcb79hTb4nKLEyM+cIrQ7
 YFfR59rY1NCETzFC6vTE7K6Z6rwNDgo=
X-Google-Smtp-Source: ABdhPJynfKDs57phATNENoEqpC7f/CYs+VTA4XlQ57qn8bDJ9RKMiLXH513hGbDMXBjTGz9S7DSjyw==
X-Received: by 2002:a2e:6f14:: with SMTP id k20mr11807223ljc.224.1593570235056; 
 Tue, 30 Jun 2020 19:23:55 -0700 (PDT)
Received: from localhost.localdomain (79-139-237-54.dynamic.spd-mgts.ru.
 [79.139.237.54])
 by smtp.gmail.com with ESMTPSA id f21sm1303557ljj.121.2020.06.30.19.23.54
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 30 Jun 2020 19:23:54 -0700 (PDT)
From: Dmitry Osipenko <digetx@gmail.com>
To: Thierry Reding <thierry.reding@gmail.com>, Sam Ravnborg <sam@ravnborg.org>,
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Subject: [PATCH v9 0/4] Support DRM bridges on NVIDIA Tegra
Date: Wed,  1 Jul 2020 05:21:24 +0300
Message-Id: <20200701022128.12968-1-digetx@gmail.com>
X-Mailer: git-send-email 2.26.0
MIME-Version: 1.0
X-Mailman-Approved-At: Wed, 01 Jul 2020 07:12:04 +0000
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
Cc: linux-tegra@vger.kernel.org, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hello,

This series adds initial support for the DRM bridges to NVIDIA Tegra DRM
driver. This is required by newer device-trees where we model the LVDS
encoder bridge properly.

Changelog:

v9: - Dropped the of-graph/drm-of patches from this series because they
      are now factored out into a standalone series [1].

      [1] https://patchwork.ozlabs.org/project/linux-tegra/list/?series=186813

    - The "drm/panel-simple: Add missing connector type for some panels"
      patch of v8 was already applied.

v8: - The new of_graph_get_local_port() helper is replaced with the
      of_graph_presents(), which simply checks the graph presence in a
      given DT node. Thank to Laurent Pinchart for the suggestion!

    - The of_graph_get_local_port() is still there, but now it isn't a public
      function anymore. In the review to v7 Laurent Pinchart suggested that
      the function's doc-comments and name could be improved and I implemented
      these suggestions in v8.

    - A day ago I discovered that devm_drm_panel_bridge_add() requires
      panel to have connector type to be properly set, otherwise function
      rejects panels with the incomplete description. So, I checked what
      LVDS panels are used on Tegra and fixed the missing connector types
      in this new patch:

        drm/panel-simple: Add missing connector type for some panels

v7: - Removed the obscure unused structs (which GCC doesn't detect, but CLANG
      does) in the patch "Wrap directly-connected panel into DRM bridge",
      which was reported by kernel test robot for v6.

v6: - Added r-b and acks from Rob Herring and Sam Ravnborg.

    - Rebased on a recent linux-next, patches now apply without fuzz.

v5: - Added new patches that make drm_of_find_panel_or_bridge() more usable
      if graph isn't defined in a device-tree:

        of_graph: add of_graph_get_local_port()
        drm/of: Make drm_of_find_panel_or_bridge() to check graph's presence

    - Updated "Support DRM bridges" patch to use drm_of_find_panel_or_bridge()
      directly and added WARN_ON(output->panel || output->bridge) sanity-check.

    - Added new "Wrap directly-connected panel into DRM bridge" patch, as
      was suggested by Laurent Pinchart.

v4: - Following review comments that were made by Laurent Pinchart to the v3,
      we now create and use the "bridge connector".

v3: - Following recommendation from Sam Ravnborg, the new bridge attachment
      model is now being used, i.e. we ask bridge to *not* create a connector
      using the DRM_BRIDGE_ATTACH_NO_CONNECTOR flag.

    - The bridge is now created only for the RGB (LVDS) output, and only
      when necessary. For now we don't need bridges for HDMI or DSI outputs.

    - I noticed that we're leaking OF node in the panel's error code path,
      this is fixed now by the new patch "Don't leak OF node on error".

v2: - Added the new "rgb: Don't register connector if bridge is used"
      patch, which hides the unused connector provided by the Tegra DRM
      driver when bridge is used, since bridge provides its own connector
      to us.

Dmitry Osipenko (4):
  drm/tegra: output: Don't leak OF node on error
  drm/tegra: output: Support DRM bridges
  drm/tegra: output: rgb: Support LVDS encoder bridge
  drm/tegra: output: rgb: Wrap directly-connected panel into DRM bridge

 drivers/gpu/drm/tegra/drm.h    |   2 +
 drivers/gpu/drm/tegra/output.c |  21 +++++--
 drivers/gpu/drm/tegra/rgb.c    | 102 +++++++++++++++++----------------
 3 files changed, 72 insertions(+), 53 deletions(-)

-- 
2.26.0

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
