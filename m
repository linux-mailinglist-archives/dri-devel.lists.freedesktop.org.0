Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 36F1C3FEE24
	for <lists+dri-devel@lfdr.de>; Thu,  2 Sep 2021 14:54:31 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 222286E529;
	Thu,  2 Sep 2021 12:54:22 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from albert.telenet-ops.be (albert.telenet-ops.be
 [IPv6:2a02:1800:110:4::f00:1a])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 678536E526
 for <dri-devel@lists.freedesktop.org>; Thu,  2 Sep 2021 12:54:19 +0000 (UTC)
Received: from ramsan.of.borg ([IPv6:2a02:1810:ac12:ed20:7822:25bf:8b52:7a36])
 by albert.telenet-ops.be with bizsmtp
 id p0pF2500F13ssow060pFq8; Thu, 02 Sep 2021 14:49:16 +0200
Received: from rox.of.borg ([192.168.97.57])
 by ramsan.of.borg with esmtps (TLS1.3) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.93)
 (envelope-from <geert@linux-m68k.org>)
 id 1mLm9a-001Ldn-NY; Thu, 02 Sep 2021 14:49:14 +0200
Received: from geert by rox.of.borg with local (Exim 4.93)
 (envelope-from <geert@linux-m68k.org>)
 id 1mLm9a-00BK7c-B1; Thu, 02 Sep 2021 14:49:14 +0200
From: Geert Uytterhoeven <geert@linux-m68k.org>
To: Sumit Semwal <sumit.semwal@linaro.org>,
 =?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>,
 Daniel Vetter <daniel.vetter@ffwll.ch>,
 Hridya Valsaraju <hridya@google.com>
Cc: Chris Wilson <chris@chris-wilson.co.uk>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 linux-media@vger.kernel.org, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, Geert Uytterhoeven <geert@linux-m68k.org>
Subject: [PATCH 0/3] dma-buf: Add missing dependencies on DMA_SHARED_BUFFER
Date: Thu,  2 Sep 2021 14:49:10 +0200
Message-Id: <20210902124913.2698760-1-geert@linux-m68k.org>
X-Mailer: git-send-email 2.25.1
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

	Hi Sumit, Christian,

This patch series adds missing dependencies on DMA_SHARED_BUFFER to
various options of DMA-BUF, and drops a bogus select.

As drivers/dma-buf/Kconfig contains interleaved options that select or
depend on DMA_SHARED_BUFFER, they can't be wrapped inside a big
"if DMA_SHARED_BUFFER / endif" block.

Thanks!

Geert Uytterhoeven (3):
  dma-buf: DMABUF_MOVE_NOTIFY should depend on DMA_SHARED_BUFFER
  dma-buf: DMABUF_DEBUG should depend on DMA_SHARED_BUFFER
  dma-buf: DMABUF_SYSFS_STATS should depend on DMA_SHARED_BUFFER

 drivers/dma-buf/Kconfig | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

-- 
2.25.1

Gr{oetje,eeting}s,

						Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
							    -- Linus Torvalds
