Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B50F93F999C
	for <lists+dri-devel@lfdr.de>; Fri, 27 Aug 2021 15:23:27 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 762E56E938;
	Fri, 27 Aug 2021 13:23:13 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-x32f.google.com (mail-wm1-x32f.google.com
 [IPv6:2a00:1450:4864:20::32f])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D4DFE6E938
 for <dri-devel@lists.freedesktop.org>; Fri, 27 Aug 2021 13:23:11 +0000 (UTC)
Received: by mail-wm1-x32f.google.com with SMTP id y195so1019829wmc.2
 for <dri-devel@lists.freedesktop.org>; Fri, 27 Aug 2021 06:23:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=Q07/zJ4l6bN3OVZuHzMIPljl9eKvXtVjqqFXO7nBrYg=;
 b=Qa/F0OHWuNdvNTeGwwzuJyQl4PCdCElOVQUmdS20Zx1c6OtCdjwI4nl+in9wXXdl6Y
 Ke19wsFlJdpxqaLTGNXmTdEnZbaEvR4jFyBJ38Do+XMz1YZt+cBYwC3/ymiQ4Y1ybYjO
 dVt9+77fBK+lgYIsl5Waf6UspSG6cMiW3h+qBeJbCv8vipkLvcFmIJglH3at3MhFvN8a
 hz1nbxkGGb7EByOkixRkKCqJwPwQrBIhXzviGRB2EYeNA1jf1Pox8KYrmnZNRNUP3DdD
 DuGSCgqQO+27vQWC4dMIEkBHk3Gt5ikMJV8NfxdEdlNWNC1XoS8hKXZcTy3ZDzP8GjPb
 IiNA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=Q07/zJ4l6bN3OVZuHzMIPljl9eKvXtVjqqFXO7nBrYg=;
 b=PosVWvQo/3WE1yElXse3obEOZfTDcCJJpRIlDZuYMNlGuOJvrAYFFtRH3WFB+zGgEF
 Irb/uEa96hee2uKNJ4Y6vfag8nuAe2bu302dhO0STaoUA/ryXnY0Yaywi0NHXdxSmWuQ
 p/6gfPrwPYbfwIIzv0Ujh+WncCrQWlJERdvZxNuJPigd+WhPQ7DJlVhlQbpJKsw2AsPG
 z/dUPxAKqOwETo9kD6VZahTue2o6no+VTTpugcB74JS+MpAphewGp9HYyLmY9w16tw+N
 kAm7twSeGHgysNzc6yTBVYkw3EPssvqSrduoUjqHJd/z1whC6+Txxz2OfMNiDPPyjyez
 ezLg==
X-Gm-Message-State: AOAM532T625e/qJ6s5yJg4sZ7gjvOXqjxxmYQy5mw/iIJ7EWLuVX4c9j
 PGa6rWOLLsXP75I7gCLwTc0=
X-Google-Smtp-Source: ABdhPJzraMp57uBGM/dCEdchH23yRAeM2wMJDlQMk0lw3VNwgDIyA7NiR66CbiNk+KB22MDwOw9Zkg==
X-Received: by 2002:a7b:c1c7:: with SMTP id a7mr9005149wmj.181.1630070590361; 
 Fri, 27 Aug 2021 06:23:10 -0700 (PDT)
Received: from localhost ([217.111.27.204])
 by smtp.gmail.com with ESMTPSA id n10sm6292100wrw.76.2021.08.27.06.23.08
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 27 Aug 2021 06:23:09 -0700 (PDT)
From: Thierry Reding <thierry.reding@gmail.com>
To: Thierry Reding <thierry.reding@gmail.com>
Cc: dri-devel@lists.freedesktop.org,
	linux-tegra@vger.kernel.org
Subject: [PATCH libdrm 00/25] Update Tegra support
Date: Fri, 27 Aug 2021 15:22:40 +0200
Message-Id: <20210827132305.3572077-1-thierry.reding@gmail.com>
X-Mailer: git-send-email 2.32.0
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

From: Thierry Reding <treding@nvidia.com>

Hi all,

this is the userspace part of the kernel patches that were recently
merged into drm-next:

  https://patchwork.freedesktop.org/series/92378/

The goal is to provide a userspace implementation of the UAPI exposed by
the kernel and show its usage in some test programs that can also be
used for basic sanity testing. More complete userspace implementations
are available here:

  * https://github.com/cyndis/vaapi-tegra-driver
  * https://github.com/grate-driver/xf86-video-opentegra
  * https://github.com/grate-driver/grate

Thierry

Thierry Reding (25):
  tegra: Indent according to .editorconfig
  tegra: Remove unused IOCTL implementations
  tegra: Extract common buffer object allocation code
  tegra: Fix mmap() of GEM buffer objects
  tegra: Add flink helpers
  tegra: Add PRIME support helpers
  tegra: Make API more consistent
  tegra: Install tegra-openclose test
  tegra: Update for new UABI
  tegra: Include private.h in list of source files
  tegra: Add channel APIs
  tegra: Add job and push buffer APIs
  tegra: Add syncpoint APIs
  tests: tegra: Add helper library for tests
  tests: tegra: Add gr2d-fill test
  tests: tegra: Add syncpt-wait test
  tests: tegra: Add syncpoint timeout test
  tests: tegra: Add VIC support
  tests: tegra: Add VIC 3.0 support
  tests: tegra: Add VIC 4.0 support
  tests: tegra: Add VIC 4.1 support
  tests: tegra: Add VIC 4.2 support
  tests: tegra: Add VIC clear test
  tests: tegra: Add VIC blit test
  tests: tegra: Add VIC flip test

 include/drm/tegra_drm.h      | 429 +++++++++++++++++++++++--
 tegra/channel.c              | 195 ++++++++++++
 tegra/job.c                  | 187 +++++++++++
 tegra/meson.build            |   7 +-
 tegra/private.h              |  85 ++++-
 tegra/pushbuf.c              | 184 +++++++++++
 tegra/syncpt.c               | 101 ++++++
 tegra/tegra-symbols.txt      |  27 +-
 tegra/tegra.c                | 392 ++++++++++++-----------
 tegra/tegra.h                |  95 +++++-
 tests/tegra/.gitignore       |   3 +-
 tests/tegra/drm-test-tegra.c | 147 +++++++++
 tests/tegra/drm-test-tegra.h |  55 ++++
 tests/tegra/drm-test.c       | 248 +++++++++++++++
 tests/tegra/drm-test.h       |  72 +++++
 tests/tegra/gr2d-fill.c      | 146 +++++++++
 tests/tegra/host1x.h         |  34 ++
 tests/tegra/meson.build      |  88 +++++-
 tests/tegra/openclose.c      |  52 +--
 tests/tegra/syncpt-timeout.c | 163 ++++++++++
 tests/tegra/syncpt-wait.c    | 151 +++++++++
 tests/tegra/vic-blit.c       | 333 +++++++++++++++++++
 tests/tegra/vic-clear.c      | 173 ++++++++++
 tests/tegra/vic-flip.c       | 333 +++++++++++++++++++
 tests/tegra/vic.c            | 177 +++++++++++
 tests/tegra/vic.h            | 181 +++++++++++
 tests/tegra/vic30.c          | 509 +++++++++++++++++++++++++++++
 tests/tegra/vic30.h          | 439 ++++++++++++++++++++++++++
 tests/tegra/vic40.c          | 412 ++++++++++++++++++++++++
 tests/tegra/vic40.h          | 285 +++++++++++++++++
 tests/tegra/vic41.c          | 416 ++++++++++++++++++++++++
 tests/tegra/vic41.h          | 372 ++++++++++++++++++++++
 tests/tegra/vic42.c          | 423 +++++++++++++++++++++++++
 tests/tegra/vic42.h          | 597 +++++++++++++++++++++++++++++++++++
 34 files changed, 7248 insertions(+), 263 deletions(-)
 create mode 100644 tegra/channel.c
 create mode 100644 tegra/job.c
 create mode 100644 tegra/pushbuf.c
 create mode 100644 tegra/syncpt.c
 create mode 100644 tests/tegra/drm-test-tegra.c
 create mode 100644 tests/tegra/drm-test-tegra.h
 create mode 100644 tests/tegra/drm-test.c
 create mode 100644 tests/tegra/drm-test.h
 create mode 100644 tests/tegra/gr2d-fill.c
 create mode 100644 tests/tegra/host1x.h
 create mode 100644 tests/tegra/syncpt-timeout.c
 create mode 100644 tests/tegra/syncpt-wait.c
 create mode 100644 tests/tegra/vic-blit.c
 create mode 100644 tests/tegra/vic-clear.c
 create mode 100644 tests/tegra/vic-flip.c
 create mode 100644 tests/tegra/vic.c
 create mode 100644 tests/tegra/vic.h
 create mode 100644 tests/tegra/vic30.c
 create mode 100644 tests/tegra/vic30.h
 create mode 100644 tests/tegra/vic40.c
 create mode 100644 tests/tegra/vic40.h
 create mode 100644 tests/tegra/vic41.c
 create mode 100644 tests/tegra/vic41.h
 create mode 100644 tests/tegra/vic42.c
 create mode 100644 tests/tegra/vic42.h

-- 
2.32.0

