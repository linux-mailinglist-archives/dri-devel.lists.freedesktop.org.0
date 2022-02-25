Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id BC6A04C4ACA
	for <lists+dri-devel@lfdr.de>; Fri, 25 Feb 2022 17:32:59 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C991B10E5D4;
	Fri, 25 Feb 2022 16:32:55 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x430.google.com (mail-wr1-x430.google.com
 [IPv6:2a00:1450:4864:20::430])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4E8A710E5D4
 for <dri-devel@lists.freedesktop.org>; Fri, 25 Feb 2022 16:32:54 +0000 (UTC)
Received: by mail-wr1-x430.google.com with SMTP id j22so5281931wrb.13
 for <dri-devel@lists.freedesktop.org>; Fri, 25 Feb 2022 08:32:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=pcnpMGkUTwrOq6wVD6KDZaXy5/GdTI9lT9U97nS7O4s=;
 b=OT2dbyd+i3BammGBmQ7seIq+G/W89xOguMk7ZOmU3RGt+q+4q5MOMApY2hmn1v4ZtS
 tRWfhh6zV8GBPDv4M4WgpjiAcIISYhGN62/un1z6+/nOOGGZZWPVecsX4NL6MPjH6hSK
 aPM9DX2aNuk4Saw4NyJvi+dfgL1B5g00JPqzDvL1lI86n4jwEE5zozq69DuRVLXiz2tb
 oeRZ4loKnhca4NC10OovgafbKlSFMcIUXrIEykKiv+pNn08tAbcjWLE04l9loLcHWCnA
 MPOH0XkCZjT4XDGkLHt37wTw17Tyn3XsE4k62M0tmr4IZyifU7DNQuPXO+srQaH/JAKg
 gcTQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=pcnpMGkUTwrOq6wVD6KDZaXy5/GdTI9lT9U97nS7O4s=;
 b=Fbgasm9txrsKNcN5sAyU8NIsny8OTkkjIG8KkdlveDcRzizAplP3DLH9To7PvkKm6n
 dsj/7L6qoiyOwAyDg3ASuU920XUOyW0D1yCmRqa8onRkFA4cLfau3RzPyiXzhAj3WdnO
 tUZLfA9JEUAj7n4HclJLPPbNuc15RGMxVo7ex6WHyrlpah5p7BEjI/cEcpRtHOUf0Q2Y
 Os86yVVgnQrJL8nxSdTgXdLjtQCfxmUu/7W/V0D/yHELee52oXWmqf527rdK7XStonvQ
 W6eZ6FUNPPFM4AIrWMd8rHsXwQAcUmVDF4yMUTNfvjMlo1iEZD+X5wZBA/IhxHOdoZge
 ukjQ==
X-Gm-Message-State: AOAM53332BnohoqXGEWdnQDuqi/GobPWxu2XXbmcKJGHapYyjSNKXLR7
 Kl2PWfgj0N1UDyiggYg/wKUSdVZYODA=
X-Google-Smtp-Source: ABdhPJxHrcf/hcepc+TJ2lVBWStLolYNEo/QWbjcFrnuG5b+myntxby6A1xyg7CzQ3cgZOw640/yTQ==
X-Received: by 2002:a5d:410c:0:b0:1ef:766b:ef5b with SMTP id
 l12-20020a5d410c000000b001ef766bef5bmr1692763wrp.183.1645806772593; 
 Fri, 25 Feb 2022 08:32:52 -0800 (PST)
Received: from localhost ([62.96.65.119]) by smtp.gmail.com with ESMTPSA id
 t14-20020a5d460e000000b001edc107e4f7sm3985207wrq.81.2022.02.25.08.32.51
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 25 Feb 2022 08:32:51 -0800 (PST)
From: Thierry Reding <thierry.reding@gmail.com>
To: Dave Airlie <airlied@gmail.com>,
	Daniel Vetter <daniel@ffwll.ch>
Subject: [GIT PULL] drm/tegra: Changes for v5.18-rc1
Date: Fri, 25 Feb 2022 17:32:50 +0100
Message-Id: <20220225163250.1063101-1-thierry.reding@gmail.com>
X-Mailer: git-send-email 2.35.1
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
Cc: linux-tegra@vger.kernel.org, dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Dave, Daniel,

The following changes since commit 8913e1aea4b32a866343b14e565c62cec54f3f78:

  drm/tegra: dpaux: Populate AUX bus (2022-02-23 13:00:37 +0100)

are available in the Git repository at:

  https://gitlab.freedesktop.org/drm/tegra.git tags/drm/tegra/for-5.18-rc1

for you to fetch changes up to b53c24f69199b88671293de503f1f999a762f4f9:

  drm/tegra: Support YVYU, VYUY and YU24 formats (2022-02-25 16:37:40 +0100)

Thanks,
Thierry

----------------------------------------------------------------
drm/tegra: Changes for v5.18-rc1

This contains a couple more minor fixes that didn't seem urgent enough
for v5.17. On top of that this improves YUV format support on older
chips.

----------------------------------------------------------------
Christophe JAILLET (2):
      gpu: host1x: Fix an error handling path in 'host1x_probe()'
      gpu: host1x: Fix a memory leak in 'host1x_remove()'

Dmitry Osipenko (1):
      drm/tegra: Use dev_err_probe()

Miaoqian Lin (1):
      drm/tegra: Fix reference leak in tegra_dsi_ganged_probe

Thierry Reding (3):
      drm/tegra: Fix planar formats on Tegra186 and later
      drm/tegra: Support semi-planar formats on Tegra114+
      drm/tegra: Support YVYU, VYUY and YU24 formats

chiminghao (1):
      drm/tegra: dpaux: Remove unneeded variable

 drivers/gpu/drm/tegra/dc.c    | 50 ++++++++++++++++++-----------
 drivers/gpu/drm/tegra/dc.h    |  7 +++++
 drivers/gpu/drm/tegra/dpaux.c |  3 +-
 drivers/gpu/drm/tegra/dsi.c   |  4 ++-
 drivers/gpu/drm/tegra/hdmi.c  | 34 ++++++--------------
 drivers/gpu/drm/tegra/hub.c   | 24 ++++++++------
 drivers/gpu/drm/tegra/plane.c | 73 ++++++++++++++++++++++++++++++++++++++-----
 drivers/gpu/drm/tegra/plane.h |  2 +-
 drivers/gpu/host1x/dev.c      |  8 +++--
 9 files changed, 140 insertions(+), 65 deletions(-)
