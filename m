Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id AF3046BE340
	for <lists+dri-devel@lfdr.de>; Fri, 17 Mar 2023 09:23:36 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 18BE310EE89;
	Fri, 17 Mar 2023 08:23:33 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from dfw.source.kernel.org (dfw.source.kernel.org
 [IPv6:2604:1380:4641:c500::1])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0545A10EE7B;
 Fri, 17 Mar 2023 08:23:20 +0000 (UTC)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 807EA62238;
 Fri, 17 Mar 2023 08:23:19 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7A2BDC4339E;
 Fri, 17 Mar 2023 08:23:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1679041399;
 bh=ciB1YiiAM1ovHPUGbTG5kNi6VdvUFX0BZ6yHmDLAVbo=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=iyHtUEUyhGwOKADGCi6dbzzHT/fXHlGHDFuwh6/xQT8h1JUF6N80E3gyYwfk9WXVX
 nJTOXlMOqvLIoSaopqy9ObD6jeGwjbZC6zKMNtG0vMww2LEMNt+OuO5543hqfwKuyF
 V6r2KhJKcMMEmwRi9SVKGbpCkyuOBtfwNoN/+1ErtF9ATO+q0uvNwdn7kT5mFZ7z+N
 TspdSrSdRylNcb6S7atD8YDdS+bzjoEjsc0phuAN+HCCGTX1b0/nVvdLLKAc1JeIwT
 RaFVEeLUywBHXvGuUu6TXveQAc88VcqlDT6MbIaqfAn/ehK9u4iv0v8G/vg7cvs9ul
 HjnqKUifi52hA==
From: Lee Jones <lee@kernel.org>
To: lee@kernel.org,
	dri-devel@lists.freedesktop.org
Subject: [PATCH 25/37] drm/nouveau/nvkm/engine/gr/tu102: Staticify local
 function gf100_fifo_nonstall_block()
Date: Fri, 17 Mar 2023 08:17:06 +0000
Message-Id: <20230317081718.2650744-26-lee@kernel.org>
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

 drivers/gpu/drm/nouveau/nvkm/engine/gr/tu102.c:210:1: warning: no previous prototype for ‘tu102_gr_load’ [-Wmissing-prototypes]

Cc: Ben Skeggs <bskeggs@redhat.com>
Cc: Karol Herbst <kherbst@redhat.com>
Cc: Lyude Paul <lyude@redhat.com>
Cc: David Airlie <airlied@gmail.com>
Cc: Daniel Vetter <daniel@ffwll.ch>
Cc: dri-devel@lists.freedesktop.org
Cc: nouveau@lists.freedesktop.org
Signed-off-by: Lee Jones <lee@kernel.org>
---
 drivers/gpu/drm/nouveau/nvkm/engine/gr/tu102.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/nouveau/nvkm/engine/gr/tu102.c b/drivers/gpu/drm/nouveau/nvkm/engine/gr/tu102.c
index 3b6c8100a2428..10a7e59482a6f 100644
--- a/drivers/gpu/drm/nouveau/nvkm/engine/gr/tu102.c
+++ b/drivers/gpu/drm/nouveau/nvkm/engine/gr/tu102.c
@@ -206,7 +206,7 @@ tu102_gr_av_to_init_veid(struct nvkm_blob *blob, struct gf100_gr_pack **ppack)
 	return gk20a_gr_av_to_init_(blob, 64, 0x00100000, ppack);
 }
 
-int
+static int
 tu102_gr_load(struct gf100_gr *gr, int ver, const struct gf100_gr_fwif *fwif)
 {
 	int ret;
-- 
2.40.0.rc1.284.g88254d51c5-goog

