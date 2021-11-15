Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 93A6C450075
	for <lists+dri-devel@lfdr.de>; Mon, 15 Nov 2021 09:56:01 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 055496EBA8;
	Mon, 15 Nov 2021 08:55:59 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5A4DF6EBA8
 for <dri-devel@lists.freedesktop.org>; Mon, 15 Nov 2021 08:55:58 +0000 (UTC)
Received: by mail.kernel.org (Postfix) with ESMTPSA id 1D85961BF5;
 Mon, 15 Nov 2021 08:55:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1636966558;
 bh=KymEuSb1ZBu9d4ip60ZapuAOc2fPUmm65BckI1F9t+0=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=LdZ6xF0xp+O72e2bWrz1JbVB8H175gzm3ebqcgB4b1TFRnEbOtg/Co/2UVmy2RSYO
 K4PGopsAL2+EPUBQXn3pIZuRLnOiV7Z4ZHRzhRaGpOOilkyT8qB7djWEyRGQxY+o07
 0pURtU5ha6Bqhqi3VRo20hpuTebBqhRUMgKKcND/ItqTEUbbBG6gtFAFRdgoUlbWQv
 nllnKfHGybN+48IS6aBEK9XM+8ihm/vdNwSp8OLBPdHs4lV1MKpoIy38LN4jK4yIhT
 e7DvDqpq2WV2gb8/H5hLIdnkM9Qc2HOyUeSrulI8xZE0lHPXJ5SUm3GD7JPkNCpR/k
 kEJCWgx/yAgzA==
From: Arnd Bergmann <arnd@kernel.org>
To: Vinod Koul <vkoul@kernel.org>
Subject: [PATCH 11/11] dmaengine: remove slave_id config field
Date: Mon, 15 Nov 2021 09:54:03 +0100
Message-Id: <20211115085403.360194-12-arnd@kernel.org>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <20211115085403.360194-1-arnd@kernel.org>
References: <20211115085403.360194-1-arnd@kernel.org>
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
Cc: alsa-devel@alsa-project.org, dri-devel@lists.freedesktop.org,
 Bjorn Andersson <bjorn.andersson@linaro.org>, linux-tegra@vger.kernel.org,
 Thierry Reding <thierry.reding@gmail.com>, linux-mtd@lists.infradead.org,
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
 linux-spi@vger.kernel.org, Robert Jarzmik <robert.jarzmik@free.fr>,
 Chunyan Zhang <zhang.lyra@gmail.com>, linux-staging@lists.linux.dev,
 Michal Simek <michal.simek@xilinx.com>, Jon Hunter <jonathanh@nvidia.com>,
 Andy Gross <agross@kernel.org>, bcm-kernel-feedback-list@broadcom.com,
 linux-serial@vger.kernel.org, Orson Zhai <orsonzhai@gmail.com>,
 Nicolas Saenz Julienne <nsaenz@kernel.org>, Arnd Bergmann <arnd@arndb.de>,
 Manivannan Sadhasivam <mani@kernel.org>, linux-arm-msm@vger.kernel.org,
 dmaengine@vger.kernel.org, Mark Brown <broonie@kernel.org>,
 linux-rpi-kernel@lists.infradead.org, Jaroslav Kysela <perex@perex.cz>,
 Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
 linux-arm-kernel@lists.infradead.org, Scott Branden <sbranden@broadcom.com>,
 Hyun Kwon <hyun.kwon@xilinx.com>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, linux-mmc@vger.kernel.org,
 Takashi Iwai <tiwai@suse.com>, linux-kernel@vger.kernel.org,
 Laxman Dewangan <ldewangan@nvidia.com>, Baolin Wang <baolin.wang7@gmail.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: Arnd Bergmann <arnd@arndb.de>

All references to the slave_id field have been removed, so
remove the field as well to prevent new references from
creeping in again.

Signed-off-by: Arnd Bergmann <arnd@arndb.de>
---
 include/linux/dmaengine.h | 4 ----
 1 file changed, 4 deletions(-)

diff --git a/include/linux/dmaengine.h b/include/linux/dmaengine.h
index 9000f3ffce8b..0349b35235e6 100644
--- a/include/linux/dmaengine.h
+++ b/include/linux/dmaengine.h
@@ -418,9 +418,6 @@ enum dma_slave_buswidth {
  * @device_fc: Flow Controller Settings. Only valid for slave channels. Fill
  * with 'true' if peripheral should be flow controller. Direction will be
  * selected at Runtime.
- * @slave_id: Slave requester id. Only valid for slave channels. The dma
- * slave peripheral will have unique id as dma requester which need to be
- * pass as slave config.
  * @peripheral_config: peripheral configuration for programming peripheral
  * for dmaengine transfer
  * @peripheral_size: peripheral configuration buffer size
@@ -448,7 +445,6 @@ struct dma_slave_config {
 	u32 src_port_window_size;
 	u32 dst_port_window_size;
 	bool device_fc;
-	unsigned int slave_id;
 	void *peripheral_config;
 	size_t peripheral_size;
 };
-- 
2.30.2

