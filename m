Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 1356051DDB5
	for <lists+dri-devel@lfdr.de>; Fri,  6 May 2022 18:40:12 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5236810F200;
	Fri,  6 May 2022 16:40:09 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x42a.google.com (mail-wr1-x42a.google.com
 [IPv6:2a00:1450:4864:20::42a])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8938810F200
 for <dri-devel@lists.freedesktop.org>; Fri,  6 May 2022 16:40:08 +0000 (UTC)
Received: by mail-wr1-x42a.google.com with SMTP id c11so10736322wrn.8
 for <dri-devel@lists.freedesktop.org>; Fri, 06 May 2022 09:40:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=5XmAlB868Me7XdZm7tKpDsuLZe0k+kDPLDXK6yzVvWA=;
 b=PzJABz2jL/6nfUgPV/pAvQ0bftjwk0rISzuPHbJet20Rn6ESk8rvVp2ER72NRLEpxZ
 as3pyMWT/VlkC9z6gxtjTVcrMtsIiGAQE4kNZYZTJ3QX1HZ/mUfGYegXJ+9h1Nw1qp95
 /sMsd/froLJG8eciRGmO+YnMRUCERElsH/7P0fbu/cnuOJ2ZHbIcYFzeLTgcvt5tFRag
 krnMQ/imDctXRhECMXQlFc46/m4p5S6XQEpN9C/XudvDrQVNEDjeB/f6DxYB6uspP+DM
 RHENUN9HsUhvYI7ySNzIh7uaaX0t91dV2vtRDO28yl94yI/oAxZ8OV3IsPdWwJoW1WlS
 8Kuw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=5XmAlB868Me7XdZm7tKpDsuLZe0k+kDPLDXK6yzVvWA=;
 b=YuUZK1aJ9RycHIPgydDicgvNPczy8LjJoBg4+XNuXl44wP7UXxWCdiJdaSvDa2FozJ
 briqzaM6bK91yi76Wcx/hICRquiB1IcaR4Seo97Dh3PJlWQ3r8Jp0S70DdTvZgde9giU
 6MGiOaDf5/BocVSAZXxJz4oD87K317BycgE0384hiev8tCvdf16BgwxrpDjTp+CX8i4j
 MbbytM5CHUK1ojcN9hOGZkJXibEIuPmq46WwdgLuDsJEDPhWjqnlB69cBpTcOfHJZcmr
 Axt2O8+JzeaYcUA7zcd9S2D5HRNECl/Xg2s0749nsyZZS1uL9nWl6UH2xdVK20DeSZ31
 boMA==
X-Gm-Message-State: AOAM5328JuEH6zd1v9Bw/S+ETco8e3PwoQqTFJDedPX3tMI4PimxxjjA
 C5cl1ebzjJZ0ml7eTRByN1M=
X-Google-Smtp-Source: ABdhPJx97TTbsp/OHW/LF/B6Lbrx21gRnToqU+JQN7hU5s6+zwVIzeuNundhawEpsoEWLnItgOTZPQ==
X-Received: by 2002:a05:6000:1883:b0:205:c0cb:33c6 with SMTP id
 a3-20020a056000188300b00205c0cb33c6mr3488480wri.39.1651855206855; 
 Fri, 06 May 2022 09:40:06 -0700 (PDT)
Received: from localhost ([62.96.65.119]) by smtp.gmail.com with ESMTPSA id
 p13-20020a05600c1d8d00b003942a244f3dsm4913622wms.22.2022.05.06.09.40.05
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 06 May 2022 09:40:05 -0700 (PDT)
From: Thierry Reding <thierry.reding@gmail.com>
To: Dave Airlie <airlied@gmail.com>,
	Daniel Vetter <daniel@ffwll.ch>
Subject: [GIT PULL] drm/tegra: Changes for v5.19-rc1
Date: Fri,  6 May 2022 18:40:04 +0200
Message-Id: <20220506164004.3922226-1-thierry.reding@gmail.com>
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

The following changes since commit 3123109284176b1532874591f7c81f3837bbdc17:

  Linux 5.18-rc1 (2022-04-03 14:08:21 -0700)

are available in the Git repository at:

  https://gitlab.freedesktop.org/drm/tegra.git tags/drm/tegra/for-5.19-rc1

for you to fetch changes up to cb7e1abc2c73633e1eefa168ab2dad6e838899c9:

  drm/tegra: gem: Do not try to dereference ERR_PTR() (2022-05-06 15:52:49 +0200)

Thanks,
Thierry

----------------------------------------------------------------
drm/tegra: Changes for v5.19-rc1

Only a few fixes this time, and some debuggability improvements.

----------------------------------------------------------------
Arnd Bergmann (1):
      drm/tegra: vic: Fix unused-function warnings

Jon Hunter (1):
      gpu: host1x: Show all allocated syncpts via debugfs

Randy Dunlap (1):
      gpu: host1x: Fix a kernel-doc warning

Thierry Reding (2):
      gpu: host1x: Do not use mapping cache for job submissions
      drm/tegra: gem: Do not try to dereference ERR_PTR()

 drivers/gpu/drm/tegra/gem.c |  1 +
 drivers/gpu/drm/tegra/vic.c |  5 ++---
 drivers/gpu/host1x/debug.c  | 11 +++++++----
 drivers/gpu/host1x/job.c    |  4 ++--
 include/linux/host1x.h      |  6 ++++++
 5 files changed, 18 insertions(+), 9 deletions(-)
