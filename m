Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 927E74260BD
	for <lists+dri-devel@lfdr.de>; Fri,  8 Oct 2021 01:53:23 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 24C046E044;
	Thu,  7 Oct 2021 23:53:19 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 083D66E044
 for <dri-devel@lists.freedesktop.org>; Thu,  7 Oct 2021 23:53:17 +0000 (UTC)
Received: by mail.kernel.org (Postfix) with ESMTPSA id 1254360F46;
 Thu,  7 Oct 2021 23:53:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1633650797;
 bh=y0qzneFXNeP9iCdOlPbYWTtbepyVfClijM/4p7T8XlA=;
 h=From:To:Cc:Subject:Date:From;
 b=W2kBPG+HleHUlHNFB3OZK0Y3M2Io8JMGKILpQdHpQgTdqWPucHcEt8k2RVIpPZ13t
 aMPsX1nQtJ03z877pN86lqk5AhA3k1n+5laIm6GnHUFMoiuNtOht7Gf97eP8Hn+uf0
 M53wCttwkvYru0DamLxOqJCWOffruMNdDpGIfgp5TlZcghmgPW+wHYpWFWobyhP+0R
 ThGZEH5hnnft47AAQ38F+98mCWkLy/c4lU1MQCcJgvXE+Q9PXugzKQTqYmShGjvBLT
 hf3CdD038lKs4Is7J97D1jdiYzrGFGx8LfIwXDjeoYKP/fEXQLzGeQsvitYsudc+tw
 LEXGCQPVgiGwA==
From: Chun-Kuang Hu <chunkuang.hu@kernel.org>
To: Philipp Zabel <p.zabel@pengutronix.de>, David Airlie <airlied@linux.ie>,
 Daniel Vetter <daniel@ffwll.ch>, Enric Balletbo Serra <eballetbo@gmail.com>
Cc: linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 linux-mediatek@lists.infradead.org, Chun-Kuang Hu <chunkuang.hu@kernel.org>
Subject: [PATCH 0/5] Revert series "CMDQ refinement of Mediatek DRM driver"
Date: Fri,  8 Oct 2021 07:53:05 +0800
Message-Id: <20211007235310.14626-1-chunkuang.hu@kernel.org>
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

Commit c1ec54b7b5af
("drm/mediatek: Use mailbox rx_callback instead of cmdq_task_cb")
would cause numerous mtk cmdq mailbox driver warning:

WARNING: CPU: 0 PID: 0 at drivers/mailbox/mtk-cmdq-mailbox.c:198
cmdq_task_exec_done+0xb8/0xe0

So revert that patch and all the patches depend on that patch.

Chun-Kuang Hu (5):
  Revert "drm/mediatek: Clear pending flag when cmdq packet is done"
  Revert "drm/mediatek: Add cmdq_handle in mtk_crtc"
  Revert "drm/mediatek: Detect CMDQ execution timeout"
  Revert "drm/mediatek: Remove struct cmdq_client"
  Revert "drm/mediatek: Use mailbox rx_callback instead of cmdq_task_cb"

 drivers/gpu/drm/mediatek/mtk_drm_crtc.c | 157 ++++--------------------
 1 file changed, 24 insertions(+), 133 deletions(-)

-- 
2.25.1

