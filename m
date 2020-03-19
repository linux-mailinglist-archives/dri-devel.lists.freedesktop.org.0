Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 97CED18C141
	for <lists+dri-devel@lfdr.de>; Thu, 19 Mar 2020 21:24:53 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 98A2D6EA66;
	Thu, 19 Mar 2020 20:24:51 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lj1-x22c.google.com (mail-lj1-x22c.google.com
 [IPv6:2a00:1450:4864:20::22c])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 81C906EA66
 for <dri-devel@lists.freedesktop.org>; Thu, 19 Mar 2020 20:24:50 +0000 (UTC)
Received: by mail-lj1-x22c.google.com with SMTP id o10so4026471ljc.8
 for <dri-devel@lists.freedesktop.org>; Thu, 19 Mar 2020 13:24:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=mdrIQmho9YA/kAHPZNiEWnNNq2YhqEBYKtZzwoiwvo0=;
 b=nvt+PD++JxPzRnaNS7fYoTeYOyu9uK061XteJjrnHtJwQoqTbvyV5HvXQFxcB2JOre
 vY6/c72+qDsWbq1dGG+sohIIpyBjY80xcyjivHuSmZAFyfiHo+E36CcA30djKWHXc4d1
 s4VfaY+AtJREMj/SxRlNwh0/+fxinNX2ydP5YHxJTctdzlMAu0U2TW7Vp6GRYv/bc7Of
 FWUVksFw8WFU5Omuh9+qjubzC0FBCVZcnR8jBiMVasp/RzsvupYs0LrNQv5XGsv7+TTr
 F0lNO6FdUay+rDkk0dT4nBoAkjJO2MbwN4EJJRtoPYQiV/LRBbIS0BrLTnUXiqC3uPOJ
 69OA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=mdrIQmho9YA/kAHPZNiEWnNNq2YhqEBYKtZzwoiwvo0=;
 b=SmdN5el/W5qoc+rpAIxW2eA8jJJUp0qSYC1Dhy8j9r2lggC8iEkbfm7B8hmuJbEJgL
 CSFt+GwvC5s3gkC5nuPpNqnZaPcDhmAPCIzzWtOIyUU9o/5fiS8MU+T3eAQwSz9mZzz7
 MFxi6Yk6vs1I2qyjFPh9SRySGRX8iTX+x5spCP/6q/7wEO9q1/XhN7yixCrX7EbMGNv9
 8jk24Lqvq5x8TqtK2NH0v99PvcauE1y79rW0/Ok4j80LmSO7JGtkcMF2Eiqu3/6mxfBg
 65hXh6U4n6SaGSvJno538CVeQ2Lx4Us0PRn75wGH4hivCwRqDhtCbDRXWgUSyqrRRb8O
 eb3w==
X-Gm-Message-State: ANhLgQ0vWp9Sx5fDL0LUEif4GYZMlhvR84IahKPbqV1tSJ6bqFZu0lYl
 KoCrT9CQwEf42xcHaNbkVr4Pb17dXlw=
X-Google-Smtp-Source: ADFU+vvqJC7FRtMfMQbtuJk05lbYzvP9s+2MbErCezqUwwaeFPugs/A/+EJQeQyxlG7GYTAQ0lQiVg==
X-Received: by 2002:a2e:b0c1:: with SMTP id g1mr1073243ljl.22.1584649488379;
 Thu, 19 Mar 2020 13:24:48 -0700 (PDT)
Received: from sroland-t5810.vmware.com (46-126-183-173.dynamic.hispeed.ch.
 [46.126.183.173])
 by smtp.gmail.com with ESMTPSA id v3sm2074372lfp.8.2020.03.19.13.24.47
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 19 Mar 2020 13:24:47 -0700 (PDT)
From: rscheidegger.oss@gmail.com
X-Google-Original-From: sroland@vmware.com
To: dri-devel@lists.freedesktop.org
Subject: [PATCH 00/17] drm/vmwgfx add support for GL4
Date: Thu, 19 Mar 2020 21:23:57 +0100
Message-Id: <20200319202414.9296-1-sroland@vmware.com>
X-Mailer: git-send-email 2.17.1
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
Cc: linux-graphics-maintainer@vmware.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: "Roland Scheidegger (VMware)" <rscheidegger.oss@gmail.com>

This series updates vmwgfx to support newer vmware svga device protocol
and expose new commands to userspace..
This is required for supporting newer GL4 features in the guest.

This syncs up the device headers, adds support for the new commands,
and also refactors some code (in particular around surface definition)
to more easily support the new commands.

Preliminary mesa userspace code using these new vmwgfx features can be
found at: https://gitlab.freedesktop.org/bhenden/mesa



Deepak Rawat (16):
  drm/vmwgfx: Also check for SVGA_CAP_DX before reading DX context
    support
  drm/vmwgfx: Sync legacy multisampling device capability
  drm/vmwgfx: Deprecate logic ops commands
  drm/vmwgfx: Use enum to represent graphics context capabilities
  drm/vmwgfx: Sync virtual device headers for new feature
  drm/vmwgfx: Add a new enum for SM5 graphics context capability
  drm/vmwgfx: Read new register for GB memory when available
  drm/vmwgfx: Support SM5 shader type in command buffer
  drm/vmwgfx: Add support for UA view commands
  drm/vmwgfx: Add support for indirect and dispatch commands
  drm/vmwgfx: Rename stream output target binding tracker struct
  drm/vmwgfx: Add support for streamoutput with mob commands
  drm/vmwgfx: Split surface metadata from struct vmw_surface
  drm/vmwgfx: Refactor surface_define to use vmw_surface_metadata
  drm/vmwgfx: Add surface define v4 command
  drm/vmwgfx: Add SM5 param for userspace

Thomas Hellstrom (1):
  drm/vmwgfx: Use vmwgfx version 2.18 to signal SM5 compatibility

 drivers/gpu/drm/vmwgfx/Makefile               |   2 +-
 .../drm/vmwgfx/device_include/svga3d_cmd.h    | 161 +++-
 .../vmwgfx/device_include/svga3d_devcaps.h    | 787 +++++++++---------
 .../gpu/drm/vmwgfx/device_include/svga3d_dx.h | 466 ++++++++++-
 .../drm/vmwgfx/device_include/svga3d_limits.h |  36 +-
 .../device_include/svga3d_surfacedefs.h       |  58 +-
 .../drm/vmwgfx/device_include/svga3d_types.h  | 347 +++++++-
 .../gpu/drm/vmwgfx/device_include/svga_reg.h  | 382 ++++++---
 .../drm/vmwgfx/device_include/svga_types.h    |   1 +
 drivers/gpu/drm/vmwgfx/vmwgfx_binding.c       | 213 ++++-
 drivers/gpu/drm/vmwgfx/vmwgfx_binding.h       |  33 +-
 drivers/gpu/drm/vmwgfx/vmwgfx_context.c       |  28 +-
 drivers/gpu/drm/vmwgfx/vmwgfx_cotable.c       |   6 +-
 drivers/gpu/drm/vmwgfx/vmwgfx_drv.c           |  59 +-
 drivers/gpu/drm/vmwgfx/vmwgfx_drv.h           | 152 +++-
 drivers/gpu/drm/vmwgfx/vmwgfx_execbuf.c       | 429 +++++++++-
 drivers/gpu/drm/vmwgfx/vmwgfx_ioctl.c         |  18 +-
 drivers/gpu/drm/vmwgfx/vmwgfx_kms.c           |  43 +-
 drivers/gpu/drm/vmwgfx/vmwgfx_mob.c           |   2 +-
 drivers/gpu/drm/vmwgfx/vmwgfx_so.c            |  12 +-
 drivers/gpu/drm/vmwgfx/vmwgfx_so.h            |   7 +
 drivers/gpu/drm/vmwgfx/vmwgfx_stdu.c          |  61 +-
 drivers/gpu/drm/vmwgfx/vmwgfx_streamoutput.c  | 387 +++++++++
 drivers/gpu/drm/vmwgfx/vmwgfx_surface.c       | 608 +++++++-------
 include/uapi/drm/vmwgfx_drm.h                 |  16 +-
 25 files changed, 3252 insertions(+), 1062 deletions(-)
 create mode 100644 drivers/gpu/drm/vmwgfx/vmwgfx_streamoutput.c

-- 
2.17.1

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
