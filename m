Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 595BC34AA6E
	for <lists+dri-devel@lfdr.de>; Fri, 26 Mar 2021 15:51:27 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 35B906F3FA;
	Fri, 26 Mar 2021 14:51:25 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x435.google.com (mail-wr1-x435.google.com
 [IPv6:2a00:1450:4864:20::435])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CC9DC6F3FA
 for <dri-devel@lists.freedesktop.org>; Fri, 26 Mar 2021 14:51:23 +0000 (UTC)
Received: by mail-wr1-x435.google.com with SMTP id e18so5920647wrt.6
 for <dri-devel@lists.freedesktop.org>; Fri, 26 Mar 2021 07:51:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=GBUopuwRuoU809B1RvDUEH/H8rKOYACoDyOwEHmoXWc=;
 b=Z+yZnpimiNbbiycvDQ5RIgnrO/2zLAts7i1gjj/fdmUpJca6mwGi6GanM1ojjleRpX
 GfCabLmrTdvO5Yuen8Ukx7J5Dq7rN9qkYsnV9SkEvfC6VsmJjlupkDRc5QXTQrWmoc8p
 RNWMWILC9pUi5Ls9KMip6XzXhtnW2tleP/LU390Im5rHTqxjHqq6Au+HCz/VyfbGLFqz
 i9iHxhIgxplXJbLy8IikUUY5JMejzPM2pTf/9eAopOwKrNQvNQ46V6PWvpbw4aXtp+Da
 y905sPFIZoVkZVhwN9VWfIU+kHWk7or0kKIPPnqqUg7atfVDLqv4BiM0xmcpkhcDR7al
 06Xw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=GBUopuwRuoU809B1RvDUEH/H8rKOYACoDyOwEHmoXWc=;
 b=tFF2LbbC6lacGURpQWMssWkQOsuqi/C0eIAwroMqt8nAd8YAdbe4cQL5tPXVz0baP9
 YY4qse2u20YXs+Ie87xfz/9WzjgdORLFHxh28UWOD8YVCkhEJV/bgvcEp8BYDdSWGC3+
 GwRokPBy/vDg+NCmByyGproCInR9ynWxzh5I0lqoGtoRtx0MVIbXsbu9+5y0Z7FihuQM
 sTfd++Jh9kknKLJ9GYUz+VjdFNBvhAoO+pxla6LDKyufYJRAi2VIrMT7PSVMnOdrnvdw
 gM9f4f3JFLm6pBBMIUTWu7ITMvWygqlK70st4rOPaaVm6pmUxFRcxbIM7Jcb4FlYxnkE
 Q9JQ==
X-Gm-Message-State: AOAM5337GDBHgc8NJMZ6b3Nv5XYTJ1n3GWsDRCkVOdLsskoDT2K5bPi4
 Jne6h0AhKlNbTkbJZFbbNA8=
X-Google-Smtp-Source: ABdhPJx4qpTguGUDobXvwQdijzOIGyAko1v4hxfrWV2ZDnLh6WaljMY8gK92Nv3iOiffb+/LgBoR4w==
X-Received: by 2002:a5d:628c:: with SMTP id k12mr14808648wru.316.1616770282500; 
 Fri, 26 Mar 2021 07:51:22 -0700 (PDT)
Received: from localhost ([62.96.65.119])
 by smtp.gmail.com with ESMTPSA id h62sm14048068wmf.37.2021.03.26.07.51.20
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 26 Mar 2021 07:51:21 -0700 (PDT)
From: Thierry Reding <thierry.reding@gmail.com>
To: Thierry Reding <thierry.reding@gmail.com>
Subject: [PATCH v2 00/10] drm/tegra: Various improvements
Date: Fri, 26 Mar 2021 15:51:29 +0100
Message-Id: <20210326145139.467072-1-thierry.reding@gmail.com>
X-Mailer: git-send-email 2.30.2
MIME-Version: 1.0
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
Cc: David Airlie <airlied@linux.ie>, James Jones <jajones@nvidia.com>,
 dri-devel@lists.freedesktop.org, Thomas Zimmermann <tzimmermann@suse.de>,
 linux-tegra@vger.kernel.org, Dmitry Osipenko <digetx@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: Thierry Reding <treding@nvidia.com>

Hi,

this fixes a couple of oddities like slightly off DMA masks and add
support for hardware cursors on newer chips as well as support for the
sector layout bit in NVIDIA framebuffer modifiers.

The first patch in this set is a small helper that I think might be
useful to other drivers eventually, but if it isn't it's easily
something I can carry in the Tegra driver. It'd be great to get an
Acked-by on it from one of the drm-misc maintainers so that I can take
it through the Tegra tree.

James, I've added you on Cc on this one because it makes use of the
extended framebuffer modifiers that you introduced a while back to
support the sector layout mux on Tegra194. It'd be great to get your
thoughts on this just so this is used as expected.

Changes in v2:
- add patch 2 that makes use of the new fourcc_mod_is_vendor() macro
- use more drm_rect helpers for hardware cursor support

Thanks,
Thierry

Thierry Reding (10):
  drm/fourcc: Add macros to determine the modifier vendor
  drm/arm: malidp: Use fourcc_mod_is_vendor() helper
  drm/tegra: dc: Inherit DMA mask
  drm/tegra: dc: Parameterize maximum resolution
  drm/tegra: dc: Implement hardware cursor on Tegra186 and later
  drm/tegra: fb: Add diagnostics for framebuffer modifiers
  drm/tegra: gem: Add a clarifying comment
  gpu: host1x: Add early init and late exit callbacks
  drm/tegra: Count number of display controllers at runtime
  drm/tegra: Support sector layout on Tegra194

 drivers/gpu/drm/arm/malidp_planes.c |   2 +-
 drivers/gpu/drm/tegra/dc.c          | 101 +++++++++++++++++++++++++---
 drivers/gpu/drm/tegra/dc.h          |   6 ++
 drivers/gpu/drm/tegra/drm.c         |  13 +++-
 drivers/gpu/drm/tegra/drm.h         |   5 ++
 drivers/gpu/drm/tegra/fb.c          |  10 +++
 drivers/gpu/drm/tegra/gem.h         |   6 ++
 drivers/gpu/drm/tegra/hub.c         |  41 ++++++++++-
 drivers/gpu/drm/tegra/plane.c       |  32 +++++++++
 drivers/gpu/host1x/bus.c            |  31 +++++++++
 include/linux/host1x.h              |   2 +
 include/uapi/drm/drm_fourcc.h       |   6 ++
 12 files changed, 241 insertions(+), 14 deletions(-)

-- 
2.30.2

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
