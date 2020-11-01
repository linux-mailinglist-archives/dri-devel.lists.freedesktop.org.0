Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id EA0012A2079
	for <lists+dri-devel@lfdr.de>; Sun,  1 Nov 2020 18:38:23 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 463476EB3E;
	Sun,  1 Nov 2020 17:38:16 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from aposti.net (aposti.net [89.234.176.197])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9382989E3B
 for <dri-devel@lists.freedesktop.org>; Sun,  1 Nov 2020 09:32:16 +0000 (UTC)
From: Paul Cercueil <paul@crapouillou.net>
To: Thierry Reding <thierry.reding@gmail.com>, Sam Ravnborg <sam@ravnborg.org>,
 Rob Herring <robh+dt@kernel.org>
Subject: [PATCH 0/3] drm/panel: ABT Y030XX067A panel support
Date: Sun,  1 Nov 2020 09:31:46 +0000
Message-Id: <20201101093150.8071-1-paul@crapouillou.net>
MIME-Version: 1.0
X-Mailman-Approved-At: Sun, 01 Nov 2020 17:36:56 +0000
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
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, Paul Cercueil <paul@crapouillou.net>,
 od@zcrc.me, Christophe Branchereau <cbranchereau@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi,

This patchset is for adding support for the Asia Better Technology (aka.
ABT) Y030XX067A 3.0" 320x480 24-bit LCD IPS panel.

While being 320x480 it is actually 4:3 with non-square pixels, and
requires a specific bus format, as the pixel ordering changes each line
(RGB on odd lines, GRB on even lines).

Patch #1 adds the abt,* vendor prefix.
Patch #2 adds the abt,y030xx067a panel binding documentation.
Patch #3 adds the MEDIA_BUS_FMT_RGB888_3X8_DELTA media bus format.
Patch #4 adds the driver itself.

Cheers,
-Paul

Paul Cercueil (4):
  dt-bindings: vendor-prefixes: Add abt vendor prefix
  dt-bindings: display: Add ABT Y030XX067A panel bindings
  media: uapi: Add MEDIA_BUS_FMT_RGB888_3X8_DELTA media bus format
  drm/panel: Add ABT Y030XX067A 3.0" 320x480 panel

 .../display/panel/abt,y030xx067a.yaml         |  54 +++
 .../devicetree/bindings/vendor-prefixes.yaml  |   2 +
 drivers/gpu/drm/panel/Kconfig                 |   9 +
 drivers/gpu/drm/panel/Makefile                |   1 +
 drivers/gpu/drm/panel/panel-abt-y030xx067a.c  | 363 ++++++++++++++++++
 include/uapi/linux/media-bus-format.h         |   3 +-
 6 files changed, 431 insertions(+), 1 deletion(-)
 create mode 100644 Documentation/devicetree/bindings/display/panel/abt,y030xx067a.yaml
 create mode 100644 drivers/gpu/drm/panel/panel-abt-y030xx067a.c

-- 
2.28.0

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
