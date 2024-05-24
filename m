Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 71B018CE97B
	for <lists+dri-devel@lfdr.de>; Fri, 24 May 2024 20:28:04 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C23DB10EC27;
	Fri, 24 May 2024 18:27:57 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=raspberrypi.com header.i=@raspberrypi.com header.b="HT2nFQxf";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-f98.google.com (mail-wm1-f98.google.com
 [209.85.128.98])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 71B6910EB19
 for <dri-devel@lists.freedesktop.org>; Fri, 24 May 2024 18:27:53 +0000 (UTC)
Received: by mail-wm1-f98.google.com with SMTP id
 5b1f17b1804b1-42108856c33so6188955e9.1
 for <dri-devel@lists.freedesktop.org>; Fri, 24 May 2024 11:27:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=raspberrypi.com; s=google; t=1716575272; x=1717180072;
 darn=lists.freedesktop.org; 
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=BSFDj4ol3AWAL0GeTo1h24EE4RwMrFwKLsNkcBtWgJ8=;
 b=HT2nFQxf/8S5vEtojzm6CwwhTO4Cuc82i+p/rDFjXtdiaJi+wVpy5bxSBkv9HjVwbO
 PC9QYJ7XVtDTr8D/NTS9G5FXPcw3itciiQEOniyzuYbkypSIHubfL5UF9KfuUFP5CmII
 q8StyIXMvHE/u9sCKUShqd3w7BGZkdb6gMGZA8ihmkdC8+M3REeRpaACmKmFpz45UGWf
 lqRb5cKaWhPIkoeUQt4zqnhzhfu+3/T5d3kC7Zb7lhGMfrK/YocBe1oEFZLo3x/FV2sH
 nOSXeenAPZuXnK7d6UHFmgwyQ4GR5dYEiMK3v0XsqJpWc/OxQ0ggnMmW9c7LLBIxCktz
 m/uQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1716575272; x=1717180072;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=BSFDj4ol3AWAL0GeTo1h24EE4RwMrFwKLsNkcBtWgJ8=;
 b=LfojyEYuKr+luEuXXCt4gdc26RQF8/kgB/09Spp5r3glKZxgx2PyGC0wZLQyJJzj/l
 cV1qApaO3h269FLVMqR7jtoCcf3C55D4abmOUeS83f0xyh0dr/UAudzNwFPWZ2tiQDnF
 6wICvxsR0OTMrIh62b3DFgWp+bu329pPyjDK/hJJbuovXnyB3xJHMhdVhFcRHxhV0Vtx
 d4nQiW/ZCHs+kBhbh5qduBD2+tlTMKVUhHzJDx+eMLWASBNhH8IzqeVAg/kQU3T6UHf1
 F3xZRdKlFfGY1t4K1PinzW0XZ6Yo+8GqOBVYOBFlhYbzq2ID6sA4okvI3OZ5GbywDWJy
 Q7fw==
X-Forwarded-Encrypted: i=1;
 AJvYcCXEYHHGAtJO70uEZaoGVMiSPSP0QLTeU1heNBklZTxBEKSTn9F/4qo4szGEQoPrar030SA/23qExXs2LIPyNjC3TjDK0vzT2hpto5fpqHlP
X-Gm-Message-State: AOJu0Yyms9mVsA7FkYPVVxVWrsRj8B/9cnXQJ8kASfUj37VaO7IMEcwC
 CXmPqEG4vmwp87FWvdMcjZTeb5JokUFUo0oVS9ajcr8YJpzM56kuz8kBfogsR310O5UVUI753GH
 FlgldfmKPXhzShLtC7Cjw0Y0kD+xCMrpI
X-Google-Smtp-Source: AGHT+IGoEzQFTvVJkKaznbn3tsRrsBHXrR2xRBfQSwJwq8OyKLj9sbB3e3hIegjaXdW0XFK+xVpzR1K4PrIS
X-Received: by 2002:a05:600c:4695:b0:41a:4623:7ee9 with SMTP id
 5b1f17b1804b1-421015b3ccemr57035725e9.10.1716575271904; 
 Fri, 24 May 2024 11:27:51 -0700 (PDT)
Received: from raspberrypi.com ([188.39.149.98])
 by smtp-relay.gmail.com with ESMTPS id
 5b1f17b1804b1-4210890571asm1226495e9.7.2024.05.24.11.27.51
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
Subject: [PATCH 01/18] dma-direct: take dma-ranges/offsets into account in
 resource mapping
Date: Fri, 24 May 2024 19:26:45 +0100
Message-Id: <20240524182702.1317935-2-dave.stevenson@raspberrypi.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20240524182702.1317935-1-dave.stevenson@raspberrypi.com>
References: <20240524182702.1317935-1-dave.stevenson@raspberrypi.com>
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

From: Serge Semin <Sergey.Semin@baikalelectronics.ru>

A basic device-specific linear memory mapping was introduced back in
commit ("dma: Take into account dma_pfn_offset") as a single-valued offset
preserved in the device.dma_pfn_offset field, which was initialized for
instance by means of the "dma-ranges" DT property. Afterwards the
functionality was extended to support more than one device-specific region
defined in the device.dma_range_map list of maps. But all of these
improvements concerned a single pointer, page or sg DMA-mapping methods,
while the system resource mapping function turned to miss the
corresponding modification. Thus the dma_direct_map_resource() method now
just casts the CPU physical address to the device DMA address with no
dma-ranges-based mapping taking into account, which is obviously wrong.
Let's fix it by using the phys_to_dma_direct() method to get the
device-specific bus address from the passed memory resource for the case
of the directly mapped DMA.

Fixes: 25f1e1887088 ("dma: Take into account dma_pfn_offset")
Signed-off-by: Serge Semin <Sergey.Semin@baikalelectronics.ru>
Signed-off-by: Dave Stevenson <dave.stevenson@raspberrypi.com>
---
 kernel/dma/direct.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/kernel/dma/direct.c b/kernel/dma/direct.c
index 4d543b1e9d57..916a16959575 100644
--- a/kernel/dma/direct.c
+++ b/kernel/dma/direct.c
@@ -509,7 +509,7 @@ int dma_direct_map_sg(struct device *dev, struct scatterlist *sgl, int nents,
 dma_addr_t dma_direct_map_resource(struct device *dev, phys_addr_t paddr,
 		size_t size, enum dma_data_direction dir, unsigned long attrs)
 {
-	dma_addr_t dma_addr = paddr;
+	dma_addr_t dma_addr = phys_to_dma_direct(dev, paddr);
 
 	if (unlikely(!dma_capable(dev, dma_addr, size, false))) {
 		dev_err_once(dev,
-- 
2.34.1

