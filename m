Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 999F156C164
	for <lists+dri-devel@lfdr.de>; Fri,  8 Jul 2022 22:54:32 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E577B10EADD;
	Fri,  8 Jul 2022 20:54:28 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from aposti.net (aposti.net [89.234.176.197])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EEC2710EAD3
 for <dri-devel@lists.freedesktop.org>; Fri,  8 Jul 2022 20:54:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=crapouillou.net;
 s=mail; t=1657313659; h=from:from:sender:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-transfer-encoding:content-transfer-encoding:
 in-reply-to:references; bh=gGn/JAlWhoA8iZTvGC0UpxYEbo4/opBKC6mgkgtoZZg=;
 b=dikaKTtrVfFhrGpuWBud1iEnvFCdCR0Lo/FEL/l9tXtz5jld3GUTyXsACSIMqRKppcTcMz
 4OQjsJ24SK/Bqlfjqut4yRa3yCGQnFFM4qixAyH6D6p/H7lGWnYoLYqGvzQWZ63iu/ZHwv
 Q7QoFkGJyq/exJiipzNKgkB+sNip2ZY=
From: Paul Cercueil <paul@crapouillou.net>
To: David Airlie <airlied@linux.ie>,
	Daniel Vetter <daniel@ffwll.ch>
Subject: [PATCH 0/6] drm/ingenic: JZ4760(B) support and random changes
Date: Fri,  8 Jul 2022 21:54:00 +0100
Message-Id: <20220708205406.96473-1-paul@crapouillou.net>
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
Cc: Sam Ravnborg <sam@ravnborg.org>, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, linux-mips@vger.kernel.org,
 Paul Cercueil <paul@crapouillou.net>, list@opendingux.net,
 Christophe Branchereau <cbranchereau@gmail.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi,

A small set of changes to the ingenic-drm driver.

The most notable thing is that ingenic-ipu is now its own platform
driver.

Cheers,
-Paul

Paul Cercueil (6):
  dt-bindings/display: ingenic: Add compatible string for the JZ4760(B)
  drm/ingenic: Fix MODULE_LICENSE() string
  drm/ingenic: Add support for the JZ4760(B)
  drm/ingenic: Don't request full modeset if property is not modified
  drm/ingenic: Make IPU driver its own module
  drm/ingenic: Use the new PM macros

 .../bindings/display/ingenic,lcd.yaml         |  2 +
 drivers/gpu/drm/ingenic/Kconfig               |  2 +-
 drivers/gpu/drm/ingenic/Makefile              |  2 +-
 drivers/gpu/drm/ingenic/ingenic-drm-drv.c     | 72 +++++++++++--------
 drivers/gpu/drm/ingenic/ingenic-drm.h         |  3 -
 drivers/gpu/drm/ingenic/ingenic-ipu.c         | 10 ++-
 6 files changed, 53 insertions(+), 38 deletions(-)

-- 
2.35.1

