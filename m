Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 032DD8CE9B0
	for <lists+dri-devel@lfdr.de>; Fri, 24 May 2024 20:29:06 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E696E10F5A1;
	Fri, 24 May 2024 18:29:03 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=raspberrypi.com header.i=@raspberrypi.com header.b="mpbif4pf";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-f98.google.com (mail-wm1-f98.google.com
 [209.85.128.98])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4179210EA0E
 for <dri-devel@lists.freedesktop.org>; Fri, 24 May 2024 18:27:53 +0000 (UTC)
Received: by mail-wm1-f98.google.com with SMTP id
 5b1f17b1804b1-42108856c33so6188855e9.1
 for <dri-devel@lists.freedesktop.org>; Fri, 24 May 2024 11:27:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=raspberrypi.com; s=google; t=1716575271; x=1717180071;
 darn=lists.freedesktop.org; 
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=Xql1CWOkqvawpbosdHCKSvgqjnwNVKxpQqZxh7tM+T4=;
 b=mpbif4pfrxO33qAeHeENVFCo7ucjLoyt2ArelS/a3IPaVXHAf2n2CojbXUklJJXrPM
 tOkAHTJORZYobdE8ns2VJj8i+x/qTwCyPETXVlBOHVu2ookHCNsuZjPxlZTqztUvconH
 AvQnFTu2VZ6CPSXucdZUhtzyOUpQLg88U+C50//sEK/XoRlD7NjJWEqAaWnLpkU0Gf0I
 OLupyOjji7kbTRJD7/g/ee47UgrkGsvZnC3NE61AJ+C/nPj0djfDm1Mc1s9QoNIYWzAT
 0qPIDaoGHP2G4i3cyqEsG6AGy26/eWApdXRxePgZc0nK4jYHe9tDtZwNXL9Y8w9ruRpf
 JRXA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1716575271; x=1717180071;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=Xql1CWOkqvawpbosdHCKSvgqjnwNVKxpQqZxh7tM+T4=;
 b=YdPhif9CyaUqVWu7b6Ncpuh5PSoMThvFPll3/mc3NQdO+vUrTjOPA4xDESjXG7PFme
 fz9Cn3JQtRU6/PDprRfBVh6uRkeMPTI91rgKUI9wy0557tYheDsVzGWnI6m1pljLZ1ZV
 wKWJwQyK+/DiulXEj4ofninpNe8UWGvSQctbFZPOXcmcbhjC+VtI/EVnceDxJ/S4XgaY
 mXH6XdKZf7+U2RznPpuzF0oesRQJlRbvA7+gKk+TiVqczMo+3ujS9tcsbbIxRyNOI67A
 pF6ziJXOblUwGAk9SRc4qwGzljaQus6RODGES8KRmEbCwnVk7o2mIkjVz3xj62UQXEjJ
 R6GQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCVQAJ7BhyD4lolHaDxYKSX9EuXCp7PP573D9SxQh6tfz5y3utqFbMhorSqaUMlkC0B3Gv5XOri+gImQEPQ8kGTmeJAufzoyAvBLnrhrDuIK
X-Gm-Message-State: AOJu0Yz64TUAaKf0B0LV0dKM9WwSmYAoGGCFkC1k+7QKflZLfRSpAAsO
 /KtMJwQAyqTXM5yAMuhYSpZHMDkEONTPHL5bz151bC801Kn3HutP45/YBkm1NDcJwCpLoKE20RU
 ss3Jn7JWSNOHlHyg/ylJmgB/OnHT8nVdq
X-Google-Smtp-Source: AGHT+IEv4pOsw1zoXJUhXCDnkIg536hPcEoYyVLGKEBIg1WFslqr8Kj1DBgMYFhuBxYsZGvlD4sKieE6j1gT
X-Received: by 2002:a05:6000:1753:b0:354:fce5:4cc3 with SMTP id
 ffacd0b85a97d-354fce54d2dmr4599736f8f.19.1716575271168; 
 Fri, 24 May 2024 11:27:51 -0700 (PDT)
Received: from raspberrypi.com ([188.39.149.98])
 by smtp-relay.gmail.com with ESMTPS id
 ffacd0b85a97d-35579d7b436sm63138f8f.14.2024.05.24.11.27.50
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 24 May 2024 11:27:51 -0700 (PDT)
X-Relaying-Domain: raspberrypi.com
From: Dave Stevenson <dave.stevenson@raspberrypi.com>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>,
 Florian Fainelli <florian.fainelli@broadcom.com>,
 Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>, 
 Ray Jui <rjui@broadcom.com>, Scott Branden <sbranden@broadcom.com>,
 Vinod Koul <vkoul@kernel.org>, Maxime Ripard <mripard@kernel.org>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>,
 Daniel Vetter <daniel@ffwll.ch>, Ulf Hansson <ulf.hansson@linaro.org>,
 Mark Brown <broonie@kernel.org>, Christoph Hellwig <hch@lst.de>,
 Marek Szyprowski <m.szyprowski@samsung.com>,
 Robin Murphy <robin.murphy@arm.com>, Liam Girdwood <lgirdwood@gmail.com>,
 Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>,
 Vladimir Murzin <vladimir.murzin@arm.com>,
 Phil Elwell <phil@raspberrypi.com>, Stefan Wahren <wahrenst@gmx.net>,
 Serge Semin <Sergey.Semin@baikalelectronics.ru>
Cc: devicetree@vger.kernel.org, linux-rpi-kernel@lists.infradead.org,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
 dmaengine@vger.kernel.org, dri-devel@lists.freedesktop.org,
 linux-mmc@vger.kernel.org, linux-spi@vger.kernel.org,
 iommu@lists.linux.dev, linux-sound@vger.kernel.org,
 Dave Stevenson <dave.stevenson@raspberrypi.com>
Subject: [PATCH 00/18] BCM2835 DMA mapping cleanups and fixes
Date: Fri, 24 May 2024 19:26:44 +0100
Message-Id: <20240524182702.1317935-1-dave.stevenson@raspberrypi.com>
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi All

This series initially cleans up the BCM2835 DMA driver in preparation for
supporting the 40bit version. It then fixes up the incorrect mapping behaviour
we've had to date.

The cleanups are based on Stefan Wahren's RFC [1], with a couple of minor bugs
fixed, but stopping before actually adding the 40bit support. If we can sort
the mapping issue, it avoids having to have workarounds in the 40bit support.

The mapping issues were discussed in [2].
Up until this point all DMA users have been passing in dma addresses rather than
CPU physical addresses, and the DMA driver has been using those directly rather
than using dma_map_resource() to map them.
The DT has also been missing some of the required mappings in "dma-ranges", but
they have been present in "ranges". I've therefore duplicated the minimum amount
of of_dma_get_range and translate_phys_to_dma to be able to use "ranges" as 
discussed in that thread. I'm assuming that sort of code is not desirable in the
core code as it shouldn't be necessary, so keeping it contained within a driver
is the better solution.

When Andrea posted our downstream patches in [3], Robin Murphy stated that
dma_map_resource is the correct API, but as it currently doesn't check the
dma_range_map we need Sergey Semin's patch [4].
There seemed to be no follow up over the implications of it. I've therefore
included it in the series at least for discussion. If it's not acceptable then
I'm not sure of the route forward in fixing this mapping issue.

I'm expecting there to be some discussion, but also acknowledge that merging this
will need to be phased with the patches 1-13 needing to be merged before any of
14-17, and then 18 merged last to remove the workaround. I suspect that's the
least of my worries though.


I will apologise in advance if I don't respond immediately to comments - I'm
out of the office for the next week, but do appreciate any feedback.

Thanks
  Dave

[1] https://lore.kernel.org/linux-arm-kernel/13ec386b-2305-27da-9765-8fa3ad71146c@i2se.com/T/
[2] https://lore.kernel.org/linux-arm-kernel/CAPY8ntBua=wPVUj+SM0WGcUL0fT56uEHo8YZUTMB8Z54X_aPRw@mail.gmail.com/T/
[3] https://lore.kernel.org/lkml/cover.1706948717.git.andrea.porta@suse.com/T/
[4] https://lore.kernel.org/linux-iommu/20220610080802.11147-1-Sergey.Semin@baikalelectronics.ru/

Dave Stevenson (7):
  ARM: dts: bcm283x: Update to use dma-channel-mask
  dmaengine: bcm2835: Add function to handle DMA mapping
  dmaengine: bcm2835: Add backwards compatible handling until clients
    updated
  dmaengine: bcm2835: Use dma_map_resource to map addresses
  dmaengine: bcm2835: Read ranges if dma-ranges aren't mapped
  arm: dt: Add dma-ranges to the bcm283x platforms
  dmaengine: bcm2835: Revert the workaround for DMA addresses

Phil Elwell (4):
  mmc: bcm2835: Use phys addresses for slave DMA config
  spi: bcm2835: Use phys addresses for slave DMA config
  drm/vc4: Use phys addresses for slave DMA config
  ASoC: bcm2835-i2s: Use phys addresses for DAI DMA

Serge Semin (1):
  dma-direct: take dma-ranges/offsets into account in resource mapping

Stefan Wahren (6):
  dmaengine: bcm2835: Support common dma-channel-mask
  dmaengine: bcm2835: move CB info generation into separate function
  dmaengine: bcm2835: move CB final extra info generation into function
  dmaengine: bcm2835: make address increment platform independent
  dmaengine: bcm2385: drop info parameters
  dmaengine: bcm2835: pass dma_chan to generic functions

 arch/arm/boot/dts/broadcom/bcm2711.dtsi       |  14 +-
 .../arm/boot/dts/broadcom/bcm2835-common.dtsi |   2 +-
 arch/arm/boot/dts/broadcom/bcm2835.dtsi       |   3 +-
 arch/arm/boot/dts/broadcom/bcm2836.dtsi       |   3 +-
 arch/arm/boot/dts/broadcom/bcm2837.dtsi       |   3 +-
 drivers/dma/bcm2835-dma.c                     | 432 ++++++++++++++----
 drivers/gpu/drm/vc4/vc4_hdmi.c                |  15 +-
 drivers/mmc/host/bcm2835.c                    |  17 +-
 drivers/spi/spi-bcm2835.c                     |  23 +-
 kernel/dma/direct.c                           |   2 +-
 sound/soc/bcm/bcm2835-i2s.c                   |  18 +-
 11 files changed, 383 insertions(+), 149 deletions(-)

-- 
2.34.1

