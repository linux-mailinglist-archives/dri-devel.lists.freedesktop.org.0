Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C99AB6BE339
	for <lists+dri-devel@lfdr.de>; Fri, 17 Mar 2023 09:23:29 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5798210EE31;
	Fri, 17 Mar 2023 08:23:26 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from ams.source.kernel.org (ams.source.kernel.org
 [IPv6:2604:1380:4601:e00::1])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5E5F010EE6D;
 Fri, 17 Mar 2023 08:23:17 +0000 (UTC)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ams.source.kernel.org (Postfix) with ESMTPS id 17FE8B824F6;
 Fri, 17 Mar 2023 08:23:16 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 04A5CC433D2;
 Fri, 17 Mar 2023 08:23:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1679041394;
 bh=6xz1uCbkWtjZs2Q0ANTPzJEjYEFLDL038s8KDW4l2mA=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=iSsZWkbUfkRmRmaipEb+M2TM5CfWPNYoOgI+yjn8bECGSQXB4ZTd9VBq+M3wJ3/ho
 gSF6Efo3dy8DGiHOZuCD/F1FzZRYin5R51ZC/VWpwQmyyFHJABxcng0Hw5ZD7Oe4kT
 Y9N693N6/Cb9uKoXvRQFJx+nyc9YX3UrykmYss3aZm5E47DVZwdb0NomCyvCgmXN5F
 3CVUW9/5hLVS4ob+boH+5X3dJ+l5HRFP9cBSOPIfxYam54SERYuSRkCB2rRNlgJMbU
 KgMiJ2Gg/KBGKJ5LiHRh9nFyAH/dlQC2RmqZDwygDZy3H/5ZFRtkmHvsiADImgZ12J
 SidvwpnvHEUQg==
From: Lee Jones <lee@kernel.org>
To: lee@kernel.org,
	dri-devel@lists.freedesktop.org
Subject: [PATCH 23/37] drm/nouveau/nvkm/engine/fifo/gf100: Staticify local
 function gf100_fifo_nonstall_block()
Date: Fri, 17 Mar 2023 08:17:04 +0000
Message-Id: <20230317081718.2650744-24-lee@kernel.org>
X-Mailer: git-send-email 2.40.0.rc1.284.g88254d51c5-goog
In-Reply-To: <20230317081718.2650744-1-lee@kernel.org>
References: <20230317081718.2650744-1-lee@kernel.org>
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
Cc: Karol Herbst <kherbst@redhat.com>, nouveau@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, Ben Skeggs <bskeggs@redhat.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Fixes the following W=1 kernel build warning(s):

 drivers/gpu/drm/nouveau/nvkm/engine/fifo/gf100.c:451:1: warning: no previous prototype for ‘gf100_fifo_nonstall_block’ [-Wmissing-prototypes]

Cc: Ben Skeggs <bskeggs@redhat.com>
Cc: Karol Herbst <kherbst@redhat.com>
Cc: Lyude Paul <lyude@redhat.com>
Cc: David Airlie <airlied@gmail.com>
Cc: Daniel Vetter <daniel@ffwll.ch>
Cc: dri-devel@lists.freedesktop.org
Cc: nouveau@lists.freedesktop.org
Signed-off-by: Lee Jones <lee@kernel.org>
---
 drivers/gpu/drm/nouveau/nvkm/engine/fifo/gf100.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/nouveau/nvkm/engine/fifo/gf100.c b/drivers/gpu/drm/nouveau/nvkm/engine/fifo/gf100.c
index 5bb65258c36d8..6c94451d0faad 100644
--- a/drivers/gpu/drm/nouveau/nvkm/engine/fifo/gf100.c
+++ b/drivers/gpu/drm/nouveau/nvkm/engine/fifo/gf100.c
@@ -447,7 +447,7 @@ gf100_fifo_nonstall_allow(struct nvkm_event *event, int type, int index)
 	spin_unlock_irqrestore(&fifo->lock, flags);
 }
 
-void
+static void
 gf100_fifo_nonstall_block(struct nvkm_event *event, int type, int index)
 {
 	struct nvkm_fifo *fifo = container_of(event, typeof(*fifo), nonstall.event);
-- 
2.40.0.rc1.284.g88254d51c5-goog

