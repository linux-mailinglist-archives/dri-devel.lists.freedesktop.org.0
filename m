Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 6565F33CAC6
	for <lists+dri-devel@lfdr.de>; Tue, 16 Mar 2021 02:16:58 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E3A9A89F03;
	Tue, 16 Mar 2021 01:16:53 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com
 [IPv6:2001:4b98:dc2:55:216:3eff:fef7:d647])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E306489F03
 for <dri-devel@lists.freedesktop.org>; Tue, 16 Mar 2021 01:16:52 +0000 (UTC)
Received: from pendragon.ideasonboard.com (62-78-145-57.bb.dnainternet.fi
 [62.78.145.57])
 by perceval.ideasonboard.com (Postfix) with ESMTPSA id 985353E7;
 Tue, 16 Mar 2021 02:16:49 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
 s=mail; t=1615857409;
 bh=Hgbqd8Cd5Ye3hrhJdsv+WhRfFX7ASpgoXKVkl47SXVM=;
 h=Date:From:To:Cc:Subject:From;
 b=u1uvCJpJDmMGvjwly84P7UvZj5XNIFmdFIreBvi+XemXGIZU4652G+YuXFJPqk+j3
 qK0mDc0XpqSurUSMeq+9jSec6DiScycK0PvoI93xZDqctmX2VWbqiZSGdoVAEKAMQv
 icdKpC4/p32M8HwBLOd8KRB1vCspMhX4lzx5wDPI=
Date: Tue, 16 Mar 2021 03:16:13 +0200
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: dri-devel@lists.freedesktop.org
Subject: [GIT FIXES FOR v5.12] R-Car DU fix
Message-ID: <YFAG3ZMcWd1qW/Oo@pendragon.ideasonboard.com>
MIME-Version: 1.0
Content-Disposition: inline
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
Cc: Kieran Bingham <kieran.bingham@ideasonboard.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

The following changes since commit 4042160c2e5433e0759782c402292a90b5bf458d:

  drm/nouveau: fix dma syncing for loops (v2) (2021-03-12 11:21:47 +1000)

are available in the Git repository at:

  git://linuxtv.org/pinchartl/media.git tags/du-fixes-20210316

for you to fetch changes up to 7a1adbd2399023177508836c2b13a6c723035409:

  drm: rcar-du: Use drmm_encoder_alloc() to manage encoder (2021-03-16 03:12:36 +0200)

----------------------------------------------------------------
R-Car DU v5.12 fix

----------------------------------------------------------------
Kieran Bingham (1):
      drm: rcar-du: Use drmm_encoder_alloc() to manage encoder

 drivers/gpu/drm/rcar-du/rcar_du_encoder.c | 31 ++++++-------------------------
 1 file changed, 6 insertions(+), 25 deletions(-)


-- 
Regards,

Laurent Pinchart
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
