Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A73A13C6728
	for <lists+dri-devel@lfdr.de>; Tue, 13 Jul 2021 01:50:26 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D2F6F89F33;
	Mon, 12 Jul 2021 23:50:22 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EE60D89F33
 for <dri-devel@lists.freedesktop.org>; Mon, 12 Jul 2021 23:50:21 +0000 (UTC)
Received: by mail.kernel.org (Postfix) with ESMTPSA id E145C608FE;
 Mon, 12 Jul 2021 23:50:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1626133821;
 bh=gUy0PrVeHFh0s36T5G5fu9zOhj3dvn5O88uSQ8Cwfms=;
 h=From:To:Cc:Subject:Date:From;
 b=kFB57WzxZdy4YGTAxV/3HyESb49xCZ10kHuoG3SuMpkVUGNGb6lAfwrdUbZJVGZXX
 dyzfipvn2hWiwarV7BSDlUlSXLy2VCa0f7CxHAHk5v2O49ycJ6si31rtiXGmeu/AQQ
 aQCYEqcbH+tgyD6gwoh98aAyXD93NxplI+vL8rQINR3q6buNRengZc5Ig3eNDQXJSZ
 g42AQYNYTcBb9rUovdZUw0Ipkb9gpVw8TyblxKWTd3F1swJqKUSzn9cnRG0MrvzJfe
 hFnmyLbkd7PvkbAF54Jbgpe/6TuNY/80yKktc1by5nZAsOtzIR2e4aX+6LIg+jquE/
 i1QwN00n1NHuA==
From: Chun-Kuang Hu <chunkuang.hu@kernel.org>
To: Philipp Zabel <p.zabel@pengutronix.de>, David Airlie <airlied@linux.ie>,
 Daniel Vetter <daniel@ffwll.ch>
Subject: [PATCH 0/4] CMDQ refinement of Mediatek DRM driver
Date: Tue, 13 Jul 2021 07:50:10 +0800
Message-Id: <20210712235014.42673-1-chunkuang.hu@kernel.org>
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
Cc: Chun-Kuang Hu <chunkuang.hu@kernel.org>, dri-devel@lists.freedesktop.org,
 linux-mediatek@lists.infradead.org, linux-kernel@vger.kernel.org,
 Yongqiang Niu <yongqiang.niu@mediatek.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

These refinements include using standard mailbox callback interface,
timeout detection, and a fixed cmdq_handle.

Chun-Kuang Hu (4):
  drm/mediatek: Use mailbox rx_callback instead of cmdq_task_cb
  drm/mediatek: Remove struct cmdq_client
  drm/mediatek: Detect CMDQ execution timeout
  drm/mediatek: Add cmdq_handle in mtk_crtc

 drivers/gpu/drm/mediatek/mtk_drm_crtc.c | 110 ++++++++++++++++++++----
 1 file changed, 91 insertions(+), 19 deletions(-)

-- 
2.25.1

