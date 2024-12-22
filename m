Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 56C9E9FA30C
	for <lists+dri-devel@lfdr.de>; Sun, 22 Dec 2024 01:21:00 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3681810E150;
	Sun, 22 Dec 2024 00:20:57 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=treblig.org header.i=@treblig.org header.b="ORAF57tE";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx.treblig.org (mx.treblig.org [IPv6:2a00:1098:5b::1])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A6A1A10E083
 for <dri-devel@lists.freedesktop.org>; Sun, 22 Dec 2024 00:20:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=treblig.org
 ; s=bytemarkmx;
 h=MIME-Version:Message-ID:Date:Subject:From:Content-Type:From
 :Subject; bh=c9bK0tKwci1YyKNp6YjLfSoh5vE+GhpA15ktUn5c77c=; b=ORAF57tEicYabLyE
 VJGpSun9Na7kHOxuic1PgPVle7xST6qMZxHNGFhlNsXoWcyHICISPvXv3Egf6ycrZpu4McmGe6EWy
 qYrVxJnVlliLc4TXQGC8ZQGN4ArdEqu4yr0LwPQ2c6VBt/Y1Zd/gxtunVugkcQCqN2XD/PDiCs9qO
 35uwgbyAya2DYQMUk1bE1U9hl3XykwLdud8kzO5K0c14ceCwAycG8HA+1mssfoZ+mO39dM6VF8aIw
 elbWAYweuwcI8UwxFU3ULGNUYSX0yaVpLXxrBvo57pdVPQX2NT86pGzNGYx3d17YMT8uKCw0A2CXp
 N/87rpjjjemNl7cB1A==;
Received: from localhost ([127.0.0.1] helo=dalek.home.treblig.org)
 by mx.treblig.org with esmtp (Exim 4.96)
 (envelope-from <linux@treblig.org>) id 1tP9i8-006iX5-1b;
 Sun, 22 Dec 2024 00:20:44 +0000
From: linux@treblig.org
To: zhenyuw@linux.intel.com, zhi.wang.linux@gmail.com,
 jani.nikula@linux.intel.com, joonas.lahtinen@linux.intel.com,
 rodrigo.vivi@intel.com, tursulin@ursulin.net,
 intel-gvt-dev@lists.freedesktop.org, intel-gfx@lists.freedesktop.org
Cc: airlied@gmail.com, simona@ffwll.ch, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, "Dr. David Alan Gilbert" <linux@treblig.org>
Subject: [PATCH 0/3] drm/i915/gvt: Deadcoding
Date: Sun, 22 Dec 2024 00:20:40 +0000
Message-ID: <20241222002043.173080-1-linux@treblig.org>
X-Mailer: git-send-email 2.47.1
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

From: "Dr. David Alan Gilbert" <linux@treblig.org>

Remove a bunch of long unused functions from
the gvt code.

Signed-off-by: Dr. David Alan Gilbert <linux@treblig.org>


Dr. David Alan Gilbert (3):
  drm/i915/gvt: Remove intel_gvt_ggtt_h2g<->index
  drm/i915/gvt: Remove unused intel_vgpu_decode_sprite_plane
  drm/i915/gvt: Remove unused intel_gvt_in_force_nonpriv_whitelist

 drivers/gpu/drm/i915/gvt/fb_decoder.c | 117 --------------------------
 drivers/gpu/drm/i915/gvt/fb_decoder.h |   2 -
 drivers/gpu/drm/i915/gvt/gtt.c        |  66 ---------------
 drivers/gpu/drm/i915/gvt/gvt.h        |   6 --
 drivers/gpu/drm/i915/gvt/handlers.c   |  17 ----
 drivers/gpu/drm/i915/gvt/mmio.h       |   3 -
 6 files changed, 211 deletions(-)

-- 
2.47.1

