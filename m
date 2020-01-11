Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 2F455137AC1
	for <lists+dri-devel@lfdr.de>; Sat, 11 Jan 2020 01:48:45 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CDD8B6E1EE;
	Sat, 11 Jan 2020 00:48:40 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-x334.google.com (mail-wm1-x334.google.com
 [IPv6:2a00:1450:4864:20::334])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BB8436E1E9
 for <dri-devel@lists.freedesktop.org>; Sat, 11 Jan 2020 00:48:38 +0000 (UTC)
Received: by mail-wm1-x334.google.com with SMTP id d73so3852808wmd.1
 for <dri-devel@lists.freedesktop.org>; Fri, 10 Jan 2020 16:48:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=OcMhrvj/gjIvMQAc5+infCgbhuX8evOJ6JvKbRK/FOg=;
 b=PJBHT0X8tCYaS3KRSjgP43ajcEMx3HxIl+8Dx2LBuUifw28J2G8411DOL9gh6u5vhL
 Mii57wFwge16LvOz2V1gZoUg8XCDiCyQ34KHUge+ZexQFi8zfk8WpSQjlWoNz4T6EncJ
 i44Da532aChdLGWRr9OnuSfj8JIP5o3r4gsKclxsyfLiY/J1+DTHr3wheNrL2QXpdi3W
 xkFL4jK3RvuFMjKiBikNvoUt4Ru7kkdkV18qZV0Aquum+G8RkntFkm6mikKs/HMtZ0uA
 n1GkG+29898Rpy+zT2wOHYG8M7cKQtWFtqQ2MNfORERBr2HV51A4W16P66R1QSgD+l5L
 xNUA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=OcMhrvj/gjIvMQAc5+infCgbhuX8evOJ6JvKbRK/FOg=;
 b=IjvQ+eiRR5WIoj/+HgDngPZ22DmbXrDWhWWEu/P9kqL01d9zbzQp6m/qIeT6cW36tu
 uFkpyYF8nXua4cmra4eZD2GlZXAn5UEgQBElSleMc7yddT5zyEncRP0yie7efuwSttV5
 2eF45kyBjgmPcZScpF36OalPickPjxV0/SGVDadX06VuJfH8S7/6oftnEDcGllBr16Fd
 q9pyrPF+9WGKdDM0dOo+HjYBqJcyD1mR2v4G88rHmKodgWr1kHR/wmGIaYKGZKldpvax
 IwC+XY5cgoboFl0Bc++a0W7raAVE0LqOpTGp15GHgZcZWKub2JjfxUNHjt7W2nMz+gkE
 oAvg==
X-Gm-Message-State: APjAAAVNvkHp8gmyX2wLbn3clSQ/ybtZrqVDV3RFBLcyi93sMMMv1+05
 YKhALSenNXHfvXXgsBoIGUf8NLIT
X-Google-Smtp-Source: APXvYqxr7PY+wprKAWhRPJBmHhPjnjtaxOZFEgbIzbdUN+3vXc6aKIilncMjIhQtFgqfU6Q/glMwrg==
X-Received: by 2002:a7b:c764:: with SMTP id x4mr7233451wmk.116.1578703717204; 
 Fri, 10 Jan 2020 16:48:37 -0800 (PST)
Received: from localhost (p2E5BEF3F.dip0.t-ipconnect.de. [46.91.239.63])
 by smtp.gmail.com with ESMTPSA id w19sm4114350wmc.22.2020.01.10.16.48.36
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 10 Jan 2020 16:48:36 -0800 (PST)
From: Thierry Reding <thierry.reding@gmail.com>
To: Dave Airlie <airlied@gmail.com>
Subject: [GIT PULL] drm/tegra: Changes for v5.6-rc1
Date: Sat, 11 Jan 2020 01:48:35 +0100
Message-Id: <20200111004835.2412858-1-thierry.reding@gmail.com>
X-Mailer: git-send-email 2.24.1
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

The following changes since commit e42617b825f8073569da76dc4510bfa019b1c35a:

  Linux 5.5-rc1 (2019-12-08 14:57:55 -0800)

are available in the Git repository at:

  git://anongit.freedesktop.org/tegra/linux tags/drm/tegra/for-5.6-rc1

for you to fetch changes up to 033ccdb7f6b11701623507339646013b4ce389d3:

  gpu: host1x: Remove dev_err() on platform_get_irq() failure (2020-01-10 17:05:12 +0100)

Thanks,
Thierry

----------------------------------------------------------------
drm/tegra: Changes for v5.6-rc1

This contains a small set of mostly fixes and some minor improvements.

----------------------------------------------------------------
Arnd Bergmann (1):
      drm/tegra: sor: Mark PM functions as __maybe_unused

Thierry Reding (3):
      gpu: host1x: Rename "parent" to "host"
      drm/tegra: Do not implement runtime PM
      drm/tegra: output: Implement system suspend/resume

YueHaibing (1):
      gpu: host1x: Remove dev_err() on platform_get_irq() failure

 drivers/gpu/drm/tegra/dc.c     | 147 +++++++++++++++++-------------
 drivers/gpu/drm/tegra/dpaux.c  |   2 +-
 drivers/gpu/drm/tegra/drm.c    |   4 +-
 drivers/gpu/drm/tegra/drm.h    |   2 +
 drivers/gpu/drm/tegra/dsi.c    | 177 ++++++++++++++++++++----------------
 drivers/gpu/drm/tegra/gr2d.c   |   4 +-
 drivers/gpu/drm/tegra/gr3d.c   |   4 +-
 drivers/gpu/drm/tegra/hdmi.c   | 118 +++++++++++++-----------
 drivers/gpu/drm/tegra/hub.c    | 198 ++++++++++++++++++++++++-----------------
 drivers/gpu/drm/tegra/hub.h    |   2 +-
 drivers/gpu/drm/tegra/output.c |  16 ++++
 drivers/gpu/drm/tegra/sor.c    | 163 ++++++++++++++++++++-------------
 drivers/gpu/drm/tegra/vic.c    |   8 +-
 drivers/gpu/host1x/bus.c       |  79 +++++++++++++++-
 drivers/gpu/host1x/dev.c       |   4 +-
 drivers/gpu/host1x/syncpt.c    |   2 +-
 include/linux/host1x.h         |  15 +++-
 17 files changed, 593 insertions(+), 352 deletions(-)
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
