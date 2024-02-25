Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 7E8C986296F
	for <lists+dri-devel@lfdr.de>; Sun, 25 Feb 2024 07:47:35 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C716510E273;
	Sun, 25 Feb 2024 06:47:30 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=atomide.com header.i=@atomide.com header.b="piIAc2PE";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail5.25mail.st (mail5.25mail.st [74.50.62.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E45E710E273
 for <dri-devel@lists.freedesktop.org>; Sun, 25 Feb 2024 06:47:28 +0000 (UTC)
Received: from localhost (91-158-86-216.elisa-laajakaista.fi [91.158.86.216])
 by mail5.25mail.st (Postfix) with ESMTPSA id 621426049D;
 Sun, 25 Feb 2024 06:47:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=atomide.com;
 s=25mailst; t=1708843648;
 bh=YKwC/ei/4U0z7yRBMBOlycIs3Tdvan58ObTypyZhS8s=;
 h=From:To:Cc:Subject:Date:From;
 b=piIAc2PERi+kMc/Tlm4QZJucjdb8100JLjfzCFxUBxO55hHO7ozpP4mpgu3m9DVDi
 TxZSpFqariESKNoh2d/R3wVHzSZqoyN2KS1noZd9tIPQabz7W0dZSnAHgUbrdTpK3D
 NUxPubA37ed5DnzbKSZ+et6NcitZND895TpyhQhllElwR7YjZAYrji8QhonqOsvVg2
 2v50qFhGNhfIxMHb1g2EqWN38HwuFpb/EzLm4Jmyv1/EsRqhSakj0iwpTLjmbUtllB
 vyu+yT+W/NBoHb8ck0ov9ClUMPUWwTVw6kvYM6r3gyTrZAQ0ipmis3VAXRcOhxLwk/
 ZwUc8p1L3Cxmw==
From: Tony Lindgren <tony@atomide.com>
To: Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>,
 Daniel Vetter <daniel@ffwll.ch>, Helge Deller <deller@gmx.de>,
 Javier Martinez Canillas <javierm@redhat.com>,
 Sam Ravnborg <sam@ravnborg.org>
Cc: dri-devel@lists.freedesktop.org,
	linux-fbdev@vger.kernel.org
Subject: [PATCH v2 0/2] Fixes for omapdrm console
Date: Sun, 25 Feb 2024 08:46:53 +0200
Message-ID: <20240225064700.48035-1-tony@atomide.com>
X-Mailer: git-send-email 2.43.1
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

Here are two fixes for omapdrm console.

Regards,

Tony

Changes since v1:

- Add FB_GEN_DEFAULT_DEFERRED_DMAMEM_OPS to use with
  FB_DEFAULT_DEFERRED_OPS as suggested by Thomas

Tony Lindgren (2):
  drm/omapdrm: Fix console by implementing fb_dirty
  drm/omapdrm: Fix console with deferred ops

 drivers/gpu/drm/omapdrm/omap_fbdev.c | 39 +++++++++++++++++++---------
 include/linux/fb.h                   |  4 +++
 2 files changed, 31 insertions(+), 12 deletions(-)

-- 
2.43.1
