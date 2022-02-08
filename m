Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 97CFF4AE2D3
	for <lists+dri-devel@lfdr.de>; Tue,  8 Feb 2022 22:08:35 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BC11910E27D;
	Tue,  8 Feb 2022 21:08:32 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-x333.google.com (mail-wm1-x333.google.com
 [IPv6:2a00:1450:4864:20::333])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E6CAF10E24B
 for <dri-devel@lists.freedesktop.org>; Tue,  8 Feb 2022 21:08:30 +0000 (UTC)
Received: by mail-wm1-x333.google.com with SMTP id
 l35-20020a05600c1d2300b0034d477271c1so162339wms.3
 for <dri-devel@lists.freedesktop.org>; Tue, 08 Feb 2022 13:08:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ffwll.ch; s=google;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=eaQEqDf6woJi3JiGI0Bz61Ya75WtHMc/MVZQW5TAKz8=;
 b=Egg8oW7w6vMCpi1QxSmX4D765EsgDJVXy+e89vdOj8VcgxsKKhCN6MHYC5vkBV761s
 UZkEzvw/pVj18r5pq4K0q9wZy7ZoHXN1MAbHYkOa+oJLstJKNQv5k6+g7Gk+7eItm4GS
 7OnwkrdQ5S0dTeSDESYXlh317nK1+2lW6IHTs=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=eaQEqDf6woJi3JiGI0Bz61Ya75WtHMc/MVZQW5TAKz8=;
 b=oynoqXXFsFt7/DJdnDfN8QZYVoRye08Olm0NJ0Xk+kAfLnz/iWOnIzY5ASOSeipoFZ
 QvkuSMhU0MWJUiGi8SnsX2TO8zI9NBNjcAWGDBaaaNYdGRSiZYMjMerW0yLzpQFBQmaR
 sGqYZqHg0FBo5Vd7N8eQCTUllFg1IkZsGovwXjAfVt2aWh/MCPaC2DP1Z9WgTqUCwd0t
 GpRdoTBKD5hagb69f5PZpdC1WrRitOtFobrUZl88//E8fcg5psKMdhBJEN/WhotWvNgw
 yeuBIJOHsJJWRERe9GcAWYM43e9gry542sy/E7PjkUu5MN5N8F/6BlncqZ6IFcL2jst+
 N9Gw==
X-Gm-Message-State: AOAM530tOt6tlXezQ2PMOBgFyHw4yNMda6nhJHBey48DhGwOszTiNAsC
 WhigVPG0IOaV73xk/z8dwm5RPdemEhIc+w==
X-Google-Smtp-Source: ABdhPJyXbSnYegLxjgnRWGI973+iKOjTBJ+gW9TXNIyD3WsZiijJNxjj56AALEMQ0pOnnNO/sxirJw==
X-Received: by 2002:a05:600c:4854:: with SMTP id
 j20mr1210243wmo.78.1644354509133; 
 Tue, 08 Feb 2022 13:08:29 -0800 (PST)
Received: from phenom.ffwll.local ([2a02:168:57f4:0:efd0:b9e5:5ae6:c2fa])
 by smtp.gmail.com with ESMTPSA id o14sm3033561wmr.3.2022.02.08.13.08.28
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 08 Feb 2022 13:08:28 -0800 (PST)
From: Daniel Vetter <daniel.vetter@ffwll.ch>
To: DRI Development <dri-devel@lists.freedesktop.org>
Subject: [PATCH v2 00/19] fbcon patches, take two
Date: Tue,  8 Feb 2022 22:08:05 +0100
Message-Id: <20220208210824.2238981-1-daniel.vetter@ffwll.ch>
X-Mailer: git-send-email 2.34.1
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
Cc: Daniel Vetter <daniel.vetter@ffwll.ch>,
 Intel Graphics Development <intel-gfx@lists.freedesktop.org>,
 linux-fbdev@vger.kernel.org, LKML <linux-kernel@vger.kernel.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi all,

Second round, mostly just compile fixed and some minor polish to commit
messages. Also MAINTAINERS patch and fbcon scrolling patches are out
because they landed already.

There's still a handful here that need review (and somehow intel-gfx-ci
just keeled over on this).

Cheers, Daniel

Daniel Vetter (19):
  fbcon: delete a few unneeded forward decl
  fbcon: Move fbcon_bmove(_rec) functions
  fbcon: Introduce wrapper for console->fb_info lookup
  fbcon: delete delayed loading code
  fbdev/sysfs: Fix locking
  fbcon: Use delayed work for cursor
  fbcon: Replace FBCON_FLAGS_INIT with a boolean
  fb: Delete fb_info->queue
  fbcon: Extract fbcon_open/release helpers
  fbcon: Ditch error handling for con2fb_release_oldinfo
  fbcon: move more common code into fb_open()
  fbcon: use lock_fb_info in fbcon_open/release
  fbcon: Consistently protect deferred_takeover with console_lock()
  fbcon: Move console_lock for register/unlink/unregister
  fbcon: Move more code into fbcon_release
  fbcon: untangle fbcon_exit
  fbcon: Maintain a private array of fb_info
  Revert "fbdev: Prevent probing generic drivers if a FB is already
    registered"
  fbdev: Make registered_fb[] private to fbmem.c

 drivers/video/fbdev/core/fbcon.c   | 692 ++++++++++++++---------------
 drivers/video/fbdev/core/fbcon.h   |   8 +-
 drivers/video/fbdev/core/fbmem.c   |  35 +-
 drivers/video/fbdev/core/fbsysfs.c |   2 +
 drivers/video/fbdev/efifb.c        |  11 -
 drivers/video/fbdev/simplefb.c     |  11 -
 include/linux/fb.h                 |   8 +-
 7 files changed, 342 insertions(+), 425 deletions(-)

-- 
2.34.1

