Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 1468E20799B
	for <lists+dri-devel@lfdr.de>; Wed, 24 Jun 2020 18:53:08 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C554D8906D;
	Wed, 24 Jun 2020 16:53:04 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ed1-x529.google.com (mail-ed1-x529.google.com
 [IPv6:2a00:1450:4864:20::529])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1A3EB6E11A
 for <dri-devel@lists.freedesktop.org>; Wed, 24 Jun 2020 16:53:04 +0000 (UTC)
Received: by mail-ed1-x529.google.com with SMTP id e15so2022045edr.2
 for <dri-devel@lists.freedesktop.org>; Wed, 24 Jun 2020 09:53:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=8ykskx82s4AmCuTWYxay1plvnN+S8KauOmt7zyXl/Vs=;
 b=l/C+4LhE0NI8HOY7ODUg13gL6Ulp1iai1hMujVDBu6QPnqzazBz6eTLyNslEhSAJs5
 EIWAYACp+NGKasRZnkxIBlXDV8616u/7LttwKW4IuMeOsvdrSUCA4FXL3y3qeazcEj/L
 PPlDZ8YlNhM9VDB712YQi0Z/7Ghylge8LS5VaAvWR4kYaNDgB9cH4zHpy0Gax9/QXC/m
 0ewwq5CFmYjLbSe6ts32uZ2PNQiaYOPtAqI36PO9xbatxFxww5qpg2UPoHC1nyzXFQJs
 PxpARezCOsrqdNupn3YHPalXILFjuTCjkI6MeecZ13knfCHF1lYaYQyDtp3+alld+JM/
 8yUA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=8ykskx82s4AmCuTWYxay1plvnN+S8KauOmt7zyXl/Vs=;
 b=OhEH+RQzpnAXQ/xQxs2zjxs8OPyFaGY94MtinafYeaMB2/1mBxqyTFSgH9O4XrmU/D
 dsJ35FWr6aJgdab8bEvXmdRTtZ5QHrtyBTSQbMwMerFP1Nq4hFN0grVJDZOyfC9FST6L
 8qL1F0Mi0UYiDo1yzB3hR9379wsAI0uwHTF4KOVvZOoHK00F6a3ogienKnJ9t5Cnh2vN
 oy2aeo/skRd0mNGI/RUvFV3iLwsjl4YvqAbcGxDQn8Z9r6SpiuB9HCbsihRJR61zuolw
 YTSBnb8DnmalgsN0NSUs8sa+8G72lksUbLq0beAA4Dw03BrSDYTaYK330axmzL6KKaiK
 6EKQ==
X-Gm-Message-State: AOAM533BYw+dMxCjikgL8Lgno29Ztun6S00yyfdo4kVi3bJQNARVie/e
 T+KrT6x4nmjV+1BSDphlq2I=
X-Google-Smtp-Source: ABdhPJxOK2EfCi4iXbYQR1XqwiHBAgTKwQWnt5sFo9PHvNZ/MoCiRcDA3smtZgyi51Xc949pIgZGbA==
X-Received: by 2002:a05:6402:1c8f:: with SMTP id
 cy15mr17846851edb.308.1593017582672; 
 Wed, 24 Jun 2020 09:53:02 -0700 (PDT)
Received: from localhost ([62.96.65.119])
 by smtp.gmail.com with ESMTPSA id n17sm15695902ejj.75.2020.06.24.09.53.01
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 24 Jun 2020 09:53:01 -0700 (PDT)
From: Thierry Reding <thierry.reding@gmail.com>
To: Dave Airlie <airlied@gmail.com>
Subject: [GIT PULL] drm/tegra: Fixes for v5.8-rc3
Date: Wed, 24 Jun 2020 18:52:54 +0200
Message-Id: <20200624165254.2763104-1-thierry.reding@gmail.com>
X-Mailer: git-send-email 2.27.0
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
Cc: linux-tegra@vger.kernel.org, dri-devel@lists.freedesktop.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Dave,

The following changes since commit b3a9e3b9622ae10064826dccb4f7a52bd88c7407:

  Linux 5.8-rc1 (2020-06-14 12:45:04 -0700)

are available in the Git repository at:

  git://anongit.freedesktop.org/tegra/linux tags/drm/tegra/for-5.8-rc3

for you to fetch changes up to fce3a51d9b31312aa12ecb72ffabfc4c7b40bdc6:

  drm/tegra: Add zpos property for cursor planes (2020-06-16 19:03:25 +0200)

Thanks,
Thierry

----------------------------------------------------------------
drm/tegra: Fixes for v5.8-rc3

This contains a fairly random assortment of fixes for various minor
issues.

----------------------------------------------------------------
Christophe JAILLET (1):
      gpu: host1x: Clean up debugfs in error handling path

Colton Lewis (1):
      gpu: host1x: Correct trivial kernel-doc inconsistencies

Nicolin Chen (1):
      drm/tegra: hub: Do not enable orphaned window group

Thierry Reding (4):
      gpu: host1x: Register child devices
      drm/tegra: hub: Register child devices
      gpu: host1x: Detach driver on unregister
      drm/tegra: Add zpos property for cursor planes

 drivers/gpu/drm/tegra/dc.c  |  1 +
 drivers/gpu/drm/tegra/hub.c | 17 +++++++++++++++--
 drivers/gpu/host1x/bus.c    |  9 +++++++++
 drivers/gpu/host1x/dev.c    | 11 +++++++++--
 include/linux/host1x.h      |  3 +++
 5 files changed, 37 insertions(+), 4 deletions(-)
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
