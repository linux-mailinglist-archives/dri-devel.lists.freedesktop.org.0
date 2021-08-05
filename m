Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 2D14E3E1C87
	for <lists+dri-devel@lfdr.de>; Thu,  5 Aug 2021 21:21:24 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 53751887B3;
	Thu,  5 Aug 2021 19:21:18 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from aposti.net (aposti.net [89.234.176.197])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CF4ED6EB30
 for <dri-devel@lists.freedesktop.org>; Thu,  5 Aug 2021 19:21:16 +0000 (UTC)
From: Paul Cercueil <paul@crapouillou.net>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Rob Herring <robh@kernel.org>, "Rafael J . Wysocki" <rafael@kernel.org>,
 David Airlie <airlied@linux.ie>, Daniel Vetter <daniel@ffwll.ch>,
 Sam Ravnborg <sam@ravnborg.org>
Cc: list@opendingux.net, linux-kernel@vger.kernel.org,
 linux-mips@vger.kernel.org, dri-devel@lists.freedesktop.org,
 Paul Cercueil <paul@crapouillou.net>
Subject: [PATCH 0/2] gpu/drm: ingenic: Handle disabled drivers
Date: Thu,  5 Aug 2021 21:21:07 +0200
Message-Id: <20210805192110.90302-1-paul@crapouillou.net>
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

Hi,

A small patchset to make sure that the ingenic-drm driver won't fail to
probe if an optional device (e.g. HDMI chip) has its driver disabled in
the kernel config.

Since most of the boards using the ingenic-drm driver have a LCD panel
attached, the drivers for external devices (be it a HDMI transmitter or
a TV encoder) really are optional and shouldn't prevent the DRM driver
from probing.

Cheers,
-Paul

Paul Cercueil (2):
  drivers core: Export driver_deferred_probe_check_state()
  gpu/drm: ingenic: Add workaround for disabled drivers

 drivers/base/dd.c                         |  1 +
 drivers/gpu/drm/ingenic/ingenic-drm-drv.c | 12 ++++++++++++
 2 files changed, 13 insertions(+)

-- 
2.30.2

