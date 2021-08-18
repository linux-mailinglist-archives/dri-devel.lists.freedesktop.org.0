Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id F36C13F03D3
	for <lists+dri-devel@lfdr.de>; Wed, 18 Aug 2021 14:41:23 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B5DF46E584;
	Wed, 18 Aug 2021 12:41:18 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-x331.google.com (mail-wm1-x331.google.com
 [IPv6:2a00:1450:4864:20::331])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 75D1C6E584
 for <dri-devel@lists.freedesktop.org>; Wed, 18 Aug 2021 12:41:17 +0000 (UTC)
Received: by mail-wm1-x331.google.com with SMTP id
 x2-20020a1c7c02000000b002e6f1f69a1eso4285071wmc.5
 for <dri-devel@lists.freedesktop.org>; Wed, 18 Aug 2021 05:41:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=uZAPhX+VRT0+zIBhSL6SCOTLLnMplq+LWNcok53Ws3w=;
 b=onfEfOxQYoF+a8qU2x61VOBJrzjDHAstnxzW6zGSre5KbQdBOVly2I7x26Hl2lZNbp
 pQ4rKO4AxWQR1KjtXdb7p/CRqlG8kPScH6MCMZWXyww5UI2qbboFWfJqP6E4NCu97cw4
 Oo4gKbsyojmv/mu1wiy7qWGirW88V2ncIvrTXLVayf3qRR7QPLyF9158IBmBYQSkxYft
 i4w1xUFEGwpGYXcxkGWpOXXKtqm8hSEHtvm7T4Buf3bFEMFDyQy70D5wditE/oW/1hM4
 BCKco4zzy98f/ZBod4dlTsepd9D4/r+zJfnCBzxx+Px8XV1Zg4fGs3azs6Mj3qimHHsW
 X3UA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=uZAPhX+VRT0+zIBhSL6SCOTLLnMplq+LWNcok53Ws3w=;
 b=hCSh9fArWObfZ8NES9ccM4SxjET18yPcfPHEvJZWr19gmuA4i+IoUl7U7dIXoLfOgJ
 JLNr9CfCPipCBvX71CP4d0rotH6nzy1jlOnI0MDefc6X6WaglCPfVJ2cGnZg8hTdIith
 5RHeqtmy4kWqkDIUn/zV2U5HpMNFUpWY/b9w1eCsAhEHX1R8OQEVcsCxva5uwfHP6ZV6
 I/A7SHUJaUIRIwJ7qbL4ZgDSmiqG1Y2/AZ2w3D1ij4IL1s2+mssyRZM5UZ7QfdFN2IRH
 gCUFyAo0gnfM9sEshMi1rHyt4XwUYht4gJ6H074XtJZRi5tJZdXkGw2cfWMsnMnDIwP+
 cYHw==
X-Gm-Message-State: AOAM532TzfOgZdjWQ6SbQs/eY5L9H9MyU/sq9ivdE9JyVRKZnvefrmEW
 tika9PrGpHxQ77sNeHj7C5I=
X-Google-Smtp-Source: ABdhPJwMNKElc3mMVCtoj2HEUn6d5ePvfz81G1zAIxYIDk10lE9hSomFsNs711+ZPErCAs0lDCkW8w==
X-Received: by 2002:a7b:cf31:: with SMTP id m17mr8258237wmg.109.1629290475788; 
 Wed, 18 Aug 2021 05:41:15 -0700 (PDT)
Received: from localhost.localdomain (arl-84-90-178-246.netvisao.pt.
 [84.90.178.246])
 by smtp.gmail.com with ESMTPSA id a11sm5720454wrq.6.2021.08.18.05.41.14
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 18 Aug 2021 05:41:15 -0700 (PDT)
From: Lukas Bulwahn <lukas.bulwahn@gmail.com>
To: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@linux.ie>,
 Daniel Vetter <daniel@ffwll.ch>, dri-devel@lists.freedesktop.org
Cc: Sandy Huang <hjc@rock-chips.com>,
 =?UTF-8?q?Heiko=20St=C3=BCbner?= <heiko@sntech.de>,
 Emma Anholt <emma@anholt.net>,
 =?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>,
 Arnd Bergmann <arnd@arndb.de>, Tomi Valkeinen <tomi.valkeinen@ti.com>,
 linux-arm-kernel@lists.infradead.org, linux-rockchip@lists.infradead.org,
 kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org,
 Lukas Bulwahn <lukas.bulwahn@gmail.com>
Subject: [PATCH 0/5] Kconfig symbol clean-up on gpu
Date: Wed, 18 Aug 2021 14:41:09 +0200
Message-Id: <20210818124114.28545-1-lukas.bulwahn@gmail.com>
X-Mailer: git-send-email 2.26.2
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

Dear DRM maintainers,

The script ./scripts/checkkconfigsymbols.py warns on invalid references to
Kconfig symbols (often, minor typos, name confusions or outdated references).

This patch series addresses all issues reported by ./scripts/checkkconfigsymbols.py
in ./drivers/gpu/ for Kconfig and Makefile files. Issues in the Kconfig and
Makefile files indicate some shortcomings in the overall build definitions, and
often are true actionable issues to address.

These issues can be identified and filtered by:

  ./scripts/checkkconfigsymbols.py | grep -E "drivers/gpu/.*(Kconfig|Makefile)" -B 1 -A 1

After applying this patch series on linux-next (next-20210817), the command
above yields just one further issues to address:

DRM_AMD_DC_DCE11_0
Referencing files: drivers/gpu/drm/amd/display/dc/dce100/Makefile

  Conclusion: No action required.
  Rationale:
    drivers/gpu/drm/amd/display/dc/dce100/Makefile refers to
    DRM_AMD_DC_DCE11_0 in a comment, after an "ifdef 0".


Please pick this patch series into your drm-next tree.

Best regards,

Lukas

Lukas Bulwahn (5):
  drm: rockchip: remove reference to non-existing config DRM_RGB
  drm: amdgpu: remove obsolete reference to config CHASH
  drm: v3d: correct reference to config ARCH_BRCMSTB
  drm: zte: remove obsolete DRM Support for ZTE SoCs
  drm: omap: remove obsolete selection of OMAP2_DSS in config DRM_OMAP

 drivers/gpu/drm/Kconfig              |   1 -
 drivers/gpu/drm/Makefile             |   1 -
 drivers/gpu/drm/omapdrm/Kconfig      |   1 -
 drivers/gpu/drm/rockchip/Kconfig     |   1 -
 drivers/gpu/drm/v3d/Kconfig          |   2 +-
 drivers/gpu/drm/zte/Kconfig          |  10 -
 drivers/gpu/drm/zte/Makefile         |  10 -
 drivers/gpu/drm/zte/zx_common_regs.h |  28 -
 drivers/gpu/drm/zte/zx_drm_drv.c     | 184 ------
 drivers/gpu/drm/zte/zx_drm_drv.h     |  34 -
 drivers/gpu/drm/zte/zx_hdmi.c        | 760 ----------------------
 drivers/gpu/drm/zte/zx_hdmi_regs.h   |  66 --
 drivers/gpu/drm/zte/zx_plane.c       | 537 ----------------
 drivers/gpu/drm/zte/zx_plane.h       |  26 -
 drivers/gpu/drm/zte/zx_plane_regs.h  | 120 ----
 drivers/gpu/drm/zte/zx_tvenc.c       | 400 ------------
 drivers/gpu/drm/zte/zx_tvenc_regs.h  |  27 -
 drivers/gpu/drm/zte/zx_vga.c         | 527 ---------------
 drivers/gpu/drm/zte/zx_vga_regs.h    |  33 -
 drivers/gpu/drm/zte/zx_vou.c         | 921 ---------------------------
 drivers/gpu/drm/zte/zx_vou.h         |  64 --
 drivers/gpu/drm/zte/zx_vou_regs.h    | 212 ------
 22 files changed, 1 insertion(+), 3964 deletions(-)
 delete mode 100644 drivers/gpu/drm/zte/Kconfig
 delete mode 100644 drivers/gpu/drm/zte/Makefile
 delete mode 100644 drivers/gpu/drm/zte/zx_common_regs.h
 delete mode 100644 drivers/gpu/drm/zte/zx_drm_drv.c
 delete mode 100644 drivers/gpu/drm/zte/zx_drm_drv.h
 delete mode 100644 drivers/gpu/drm/zte/zx_hdmi.c
 delete mode 100644 drivers/gpu/drm/zte/zx_hdmi_regs.h
 delete mode 100644 drivers/gpu/drm/zte/zx_plane.c
 delete mode 100644 drivers/gpu/drm/zte/zx_plane.h
 delete mode 100644 drivers/gpu/drm/zte/zx_plane_regs.h
 delete mode 100644 drivers/gpu/drm/zte/zx_tvenc.c
 delete mode 100644 drivers/gpu/drm/zte/zx_tvenc_regs.h
 delete mode 100644 drivers/gpu/drm/zte/zx_vga.c
 delete mode 100644 drivers/gpu/drm/zte/zx_vga_regs.h
 delete mode 100644 drivers/gpu/drm/zte/zx_vou.c
 delete mode 100644 drivers/gpu/drm/zte/zx_vou.h
 delete mode 100644 drivers/gpu/drm/zte/zx_vou_regs.h

-- 
2.26.2

