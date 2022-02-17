Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C04D34BA97C
	for <lists+dri-devel@lfdr.de>; Thu, 17 Feb 2022 20:16:32 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E4F8D10E40F;
	Thu, 17 Feb 2022 19:16:30 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ej1-x629.google.com (mail-ej1-x629.google.com
 [IPv6:2a00:1450:4864:20::629])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1AF8710E3F8
 for <dri-devel@lists.freedesktop.org>; Thu, 17 Feb 2022 19:16:29 +0000 (UTC)
Received: by mail-ej1-x629.google.com with SMTP id k25so9573169ejp.5
 for <dri-devel@lists.freedesktop.org>; Thu, 17 Feb 2022 11:16:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=CCwNIlXAZWZJUVV5yDfrYRA4cFSXUrx9sbZ5mmkUKNc=;
 b=G+AekBmdfQ0a9bxmZ9jWUwRUlAO0sv5qVX6RPDukFhhOYBcNXlnRQfP0k80ffE1oye
 px78g3w7p+7B/szHNUydbnTpRwfLiPdpFKb+6D8O9mEqHbtwjSOsQOMSeTjzvsz5uKw7
 fEyCZkcyI4OFWxxet+OFLzszLV/TVEG7nLaHqm7AxkkaSAUlhjfFWwUk5iBcSSGYf/S4
 brI8638rlPxk+bs0eyViV3Aq9NJVMlVLQYZpfaNOXVmq3XeC52c0gM02t5pNnPMcgSn9
 eP0JTA+tAJv9mWqZ19bCE+io3miECqy8GzS7/RqI0e5pQqnpTW0gqjrJoWzPrQK5bdqQ
 xKxQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=CCwNIlXAZWZJUVV5yDfrYRA4cFSXUrx9sbZ5mmkUKNc=;
 b=cxPOxb3K9WwGvg3P7mhWtISG1OGnE2uTUAKhi5E6zfOtJxVxcB6zXigS/x0lvd+kUy
 JCldX/eHvEilpXghGbD/hTXwOEBPl7YlRQ3oHIB5zYa3nc7ZKP3cG7Ikv5Q5vSLrMy0X
 YP4uKKFk7jqdaMmCQifjW4nrPSR6TGeLEqr9WZEzn//Mw6jkx3NikAKngilgXvvDx25l
 e7KA5lF4RmwrxwEzLL17wQZcfDDgqsvXAPZ8ZGWMoi7iSnKv/vpTmmbDZcYB9BjeZsUo
 zcUZflLUWqGrUNTfYbLjQL38qJSk9xqpxj2wGzYiJCFDLjIPKCeF3U9NrLUit726Hs9F
 H1Kw==
X-Gm-Message-State: AOAM532Am6sedkmJNrlDIMNSpVBn5B5C9XyJwaleFvSsbrT1KSXyi8Gx
 RkHxcGOAtdvcp9OB+8B7p1QNqNRzpws=
X-Google-Smtp-Source: ABdhPJzyihI0kvofqnsyf9Be23/8AnlYgXHFIGrlZegBhBlRFN80Q7gB7DuY6mGBTWDTpb2t84M7tg==
X-Received: by 2002:a17:906:7197:b0:6cd:ef8f:ecbf with SMTP id
 h23-20020a170906719700b006cdef8fecbfmr3489806ejk.18.1645125387546; 
 Thu, 17 Feb 2022 11:16:27 -0800 (PST)
Received: from localhost
 (p200300e41f0a6900000000000000043a.dip0.t-ipconnect.de.
 [2003:e4:1f0a:6900::43a])
 by smtp.gmail.com with ESMTPSA id w17sm3742289edd.18.2022.02.17.11.16.26
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 17 Feb 2022 11:16:26 -0800 (PST)
From: Thierry Reding <thierry.reding@gmail.com>
To: Thierry Reding <thierry.reding@gmail.com>
Subject: [PATCH libdrm v2 00/25] Update Tegra support
Date: Thu, 17 Feb 2022 20:16:00 +0100
Message-Id: <20220217191625.2534521-1-thierry.reding@gmail.com>
X-Mailer: git-send-email 2.35.1
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
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
Cc: linux-tegra@vger.kernel.org, Dmitry Osipenko <digetx@gmail.com>,
 dri-devel@lists.freedesktop.org,
 =?UTF-8?q?Micha=C5=82=20Miros=C5=82aw?= <mirq-linux@rere.qmqm.pl>
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

Changes in v2:
- implement vic_clear() as a helper using ->fill() (Michał Mirosław)
- rebase and fix a couple of Meson errors/warnings

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
 tegra/tegra.c                | 386 +++++++++++-----------
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
 tests/tegra/vic.c            | 184 +++++++++++
 tests/tegra/vic.h            | 181 +++++++++++
 tests/tegra/vic30.c          | 458 +++++++++++++++++++++++++++
 tests/tegra/vic30.h          | 439 ++++++++++++++++++++++++++
 tests/tegra/vic40.c          | 370 ++++++++++++++++++++++
 tests/tegra/vic40.h          | 285 +++++++++++++++++
 tests/tegra/vic41.c          | 374 ++++++++++++++++++++++
 tests/tegra/vic41.h          | 372 ++++++++++++++++++++++
 tests/tegra/vic42.c          | 374 ++++++++++++++++++++++
 tests/tegra/vic42.h          | 597 +++++++++++++++++++++++++++++++++++
 34 files changed, 7068 insertions(+), 260 deletions(-)
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
2.35.1

