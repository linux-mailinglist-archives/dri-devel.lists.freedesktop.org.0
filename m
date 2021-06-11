Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 0F5E03A4702
	for <lists+dri-devel@lfdr.de>; Fri, 11 Jun 2021 18:50:28 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 582226E207;
	Fri, 11 Jun 2021 16:50:24 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-x333.google.com (mail-wm1-x333.google.com
 [IPv6:2a00:1450:4864:20::333])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 399616E207
 for <dri-devel@lists.freedesktop.org>; Fri, 11 Jun 2021 16:50:23 +0000 (UTC)
Received: by mail-wm1-x333.google.com with SMTP id
 v206-20020a1cded70000b02901a586d3fa23so8940094wmg.4
 for <dri-devel@lists.freedesktop.org>; Fri, 11 Jun 2021 09:50:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=nVmUib6sDfDxsq9PQu+EpPYJQfq0CrzzM05aiercm/U=;
 b=KhhZl/b2Ow3W3yc2DcOr0wyxc3rUaJAjd1ueuuU/Y9RCqpWRkC2VDwJ53fipizSte3
 clfOV8Y+wC38okeLQyYfXvYpCrUBRFvCEIH7nSR5S2zStuRmlOAvT8DxHk6+OJ49eqqF
 jFSpNLnrf5P/ZIWDbpPhLyDz0dDP35sbQaX08u7ofZs5rXQ/UHgF56FKrV7SPQZ4p+KM
 pgBwBJ6T/O6EE0Re24ilA31254pb+TmpDMiFmva7JCgbObT5hU7eHmZR1sSL5jXJ8mho
 fbzCS1Qber1ydUEBmw6vNnV3thhtT4VWRnI82dk+rShSU9PVekwpkifuBjAWYxa6qmzU
 EjzQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=nVmUib6sDfDxsq9PQu+EpPYJQfq0CrzzM05aiercm/U=;
 b=s5YyixHMJDKUkWFe4RzPloZdx4JoxMTOgg5UhJa78cPcJ/3ZkOyZvtCnLAEfGVrOD1
 9DKljL026JBI4YkUv9PRDYZAO1MP5gzjUYsb1heQfHqaf1XulaZMY8a2ELfjsyZ0lnq6
 FD/gHO5oW4lE2w5LadquZ0KhXsdVlenSNBqpiutwucIXdj4ZEQSkPutt9NpicUlSdC+b
 Mri427xeA130P2RM/tb3lhlgoCO3pMxKwioaus+cJ5D/n7MAVGz6xhApJdKIyeKm4DOB
 77XFS7J/z/iggGWC9N+lFfikEwiZwSkm6imden7M3rIDHK46SIg7OBgt2phWpKqjs5Fj
 rcOg==
X-Gm-Message-State: AOAM5322pou0TQTvnhhA9+Ec+lrUrIR2rDEv71qquS/7Q0/e1NYAYyNE
 rA2TVrE0xhBu453IlxBpL1I=
X-Google-Smtp-Source: ABdhPJwUq5NIrEyc+uROlerUgrn1IVIULU9QdvwWIINCESl1ccBvHB535Tag9zaAcvORuocModFwlA==
X-Received: by 2002:a05:600c:430a:: with SMTP id
 p10mr4956881wme.155.1623430221767; 
 Fri, 11 Jun 2021 09:50:21 -0700 (PDT)
Received: from localhost ([62.96.65.119])
 by smtp.gmail.com with ESMTPSA id r3sm6307970wmq.8.2021.06.11.09.50.20
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 11 Jun 2021 09:50:21 -0700 (PDT)
From: Thierry Reding <thierry.reding@gmail.com>
To: Dave Airlie <airlied@gmail.com>
Subject: [GIT PULL] drm/tegra: Changes for v5.14-rc1
Date: Fri, 11 Jun 2021 18:51:57 +0200
Message-Id: <20210611165157.3569315-1-thierry.reding@gmail.com>
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
Cc: linux-tegra@vger.kernel.org, dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Dave,

The following changes since commit 671cc352acd3e2b2832b59787ed8027d9f80ccc9:

  drm/tegra: Correct DRM_FORMAT_MOD_NVIDIA_SECTOR_LAYOUT (2021-05-31 14:29:44 +0200)

are available in the Git repository at:

  ssh://git.freedesktop.org/git/tegra/linux.git tags/drm/tegra/for-5.14-rc1

for you to fetch changes up to 46f99eebda08963e24efdacec5c95fc66b90f600:

  drm/tegra: Don't call SET_APPLICATION_ID in VIC boot (2021-06-11 18:48:36 +0200)

Note that I've based this on the drm/tegra/for-5.13-rc5 fixes PR that
I sent out last week for simplicity.

Thanks,
Thierry

----------------------------------------------------------------
drm/tegra: Changes for v5.14-rc1

The two major changes here are fixed YUV support as well as scaling on
Tegra186 and later. This allows Tegra DRM to be used, for example, as a
video sink for the kmssink gstreamer plugin. The remainder of the
changes are minor fixes.

----------------------------------------------------------------
Mikko Perttunen (1):
      drm/tegra: Don't call SET_APPLICATION_ID in VIC boot

Tan Zhongjun (1):
      drm/tegra: Remove superfluous error messages around platform_get_irq()

Thierry Reding (2):
      drm/tegra: hub: Fix YUV support
      drm/tegra: hub: Implement basic scaling support

 drivers/gpu/drm/tegra/dc.c    |   2 +-
 drivers/gpu/drm/tegra/dc.h    |  26 ++++++
 drivers/gpu/drm/tegra/dpaux.c |   4 +-
 drivers/gpu/drm/tegra/hub.c   | 182 +++++++++++++++++++++++++++++++++++++++---
 drivers/gpu/drm/tegra/plane.c |  23 +++++-
 drivers/gpu/drm/tegra/plane.h |   3 +-
 drivers/gpu/drm/tegra/vic.c   |   2 -
 drivers/gpu/drm/tegra/vic.h   |   1 -
 8 files changed, 223 insertions(+), 20 deletions(-)
