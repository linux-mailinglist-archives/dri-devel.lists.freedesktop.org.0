Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id AD5771FEC3B
	for <lists+dri-devel@lfdr.de>; Thu, 18 Jun 2020 09:18:26 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 453D76EAE1;
	Thu, 18 Jun 2020 07:17:35 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lj1-x241.google.com (mail-lj1-x241.google.com
 [IPv6:2a00:1450:4864:20::241])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1858D6E190
 for <dri-devel@lists.freedesktop.org>; Wed, 17 Jun 2020 22:27:56 +0000 (UTC)
Received: by mail-lj1-x241.google.com with SMTP id 9so4856484ljv.5
 for <dri-devel@lists.freedesktop.org>; Wed, 17 Jun 2020 15:27:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=3D9xQhWZ3+YNDU2r3XFRC5VYoSXlYv2ysEuYOTTgQ9M=;
 b=un8se91FM/g6jWvRAyHnx+IUi/eX7BKAQqq6Z2OB8CfQ//QMLl2IMo6RFV2TF3qk4s
 qIAybcRM+CUXrSX+5Snhy0T73NiNIOT+vdWGw8zQWXbM6wh32a1ynuUfaMGVD59wEcSg
 kMc7rwuFWLfJ97dQnTM+OK0Lw9U9msQgdYCK11ju+lpeO23kuD1TSYGZ944zoj/Wl1hs
 m+N8lOGSJpOpYwmxlKiapIIx5uuw1SH5bOV2/R+zPKBZZdvFnQsD91Nb5hnVow/oCtlr
 +r6LLBTAfL5bbNOv9AOLMtjKBPI0U9vVLjzHk5tmmT010oguOyIaSs5O5eqQ8RJ3S/e1
 Z0cg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=3D9xQhWZ3+YNDU2r3XFRC5VYoSXlYv2ysEuYOTTgQ9M=;
 b=O3XHpYY48x80kdNAobEukDdj4sA9Q8ex1aGzFOdSrevdCONTqDM5XIS6+DsWYYfx2a
 3MzX+ujZ4pG63CjJttKworwRaHOJvWOsoMLN4N04lKFhNu+c3IB4Naos6jAC6rImPdcQ
 W1SYT4gtVVoGzteiSdD3T8CqPDr4FMC9yiuocUp/oLmXWo+t5m97rTSyEiYQzNvYjEsH
 AMiJiR8FZj+mriBfFCy9tqUqUaZB7FPvoghbLaZfN30/4XsqTZI5gmjnbArnFgafiHSJ
 yrix4r7ikiO3kzxojPmDz2pRwrlNQBTaRLNGIduOtTjT6xYKMfElHyrfnpAj2QG2cEZ8
 koyA==
X-Gm-Message-State: AOAM530TjBw/5PdJ8JjGTrNva5MQffqY1GkIfM9MhG6HQFqgQTwCZVul
 KmR13M9W06165BGqibEkrZ8=
X-Google-Smtp-Source: ABdhPJzEGsBdGJFrpea3RjyykDqUrbmbjFAu/LCuXYLIg2VKoB8KYemorANMJW815Fpx/HLak+SjYQ==
X-Received: by 2002:a2e:800b:: with SMTP id j11mr744710ljg.467.1592432874394; 
 Wed, 17 Jun 2020 15:27:54 -0700 (PDT)
Received: from localhost.localdomain (79-139-237-54.dynamic.spd-mgts.ru.
 [79.139.237.54])
 by smtp.gmail.com with ESMTPSA id a1sm210378ljk.133.2020.06.17.15.27.53
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 17 Jun 2020 15:27:53 -0700 (PDT)
From: Dmitry Osipenko <digetx@gmail.com>
To: Thierry Reding <thierry.reding@gmail.com>, Sam Ravnborg <sam@ravnborg.org>,
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
 Rob Herring <robh+dt@kernel.org>, Frank Rowand <frowand.list@gmail.com>
Subject: [PATCH v8 0/7] Support DRM bridges on NVIDIA Tegra
Date: Thu, 18 Jun 2020 01:26:56 +0300
Message-Id: <20200617222703.17080-1-digetx@gmail.com>
X-Mailer: git-send-email 2.26.0
MIME-Version: 1.0
X-Mailman-Approved-At: Thu, 18 Jun 2020 07:17:31 +0000
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
Cc: linux-tegra@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hello,

This series adds initial support for the DRM bridges to NVIDIA Tegra DRM
driver. This is required by newer device-trees where we model the LVDS
encoder bridge properly.

Changelog:

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

Dmitry Osipenko (7):
  of_graph: add of_graph_presents()
  drm/of: Make drm_of_find_panel_or_bridge() to check graph's presence
  drm/tegra: output: Don't leak OF node on error
  drm/tegra: output: Support DRM bridges
  drm/tegra: output: rgb: Support LVDS encoder bridge
  drm/tegra: output: rgb: Wrap directly-connected panel into DRM bridge
  drm/panel-simple: Add missing connector type for some panels

 drivers/gpu/drm/drm_of.c             |   9 +++
 drivers/gpu/drm/panel/panel-simple.c |   7 ++
 drivers/gpu/drm/tegra/drm.h          |   2 +
 drivers/gpu/drm/tegra/output.c       |  21 ++++--
 drivers/gpu/drm/tegra/rgb.c          | 102 ++++++++++++++-------------
 drivers/of/property.c                |  52 +++++++++++---
 include/linux/of_graph.h             |   6 ++
 7 files changed, 137 insertions(+), 62 deletions(-)

-- 
2.26.0

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
