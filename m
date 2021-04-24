Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id D2642369F07
	for <lists+dri-devel@lfdr.de>; Sat, 24 Apr 2021 08:18:44 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AAB526EC89;
	Sat, 24 Apr 2021 06:18:40 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from desiato.infradead.org (desiato.infradead.org
 [IPv6:2001:8b0:10b:1:d65d:64ff:fe57:4e05])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CA6AE6EC89
 for <dri-devel@lists.freedesktop.org>; Sat, 24 Apr 2021 06:18:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:MIME-Version
 :Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
 Content-Description:In-Reply-To:References;
 bh=UHtbsdbpwbNeabtBKPBRJb+nauxP3JoNafFlth/EW7A=; b=FnPqf4LID0GMM7t7Il58IshBFO
 i2IuSZMm5y5kZMGogqLKyn1tSWaI6PdpZNYjGGs7HMr/GwzXHzgHr7/96LxNgPrZgDZbkoJ++VNGb
 KDXHKXn2Xgs5aHFhLwiL8TDx//RkFJWltyE7d2U+FKWbHQ92yXFFl3v3gyP5bO4VYPc/R8cy/0fgL
 80BZFAmQYWfvHF89pPu+0Xo8nWppaEOb1XCaJUCCeptAHEVhxPuXRE7qryUUDhhUMpftlsFcyC+Af
 cfRsVnjLC6NI2+yOzuWUJEnm+XyLBacNHtTYGu0n3ymuX0V/fbb7mVuTGw0VarLcL11aNZYkoiGBh
 6NJq6RPw==;
Received: from [2601:1c0:6280:3f0::df68] (helo=smtpauth.infradead.org)
 by desiato.infradead.org with esmtpsa (Exim 4.94 #2 (Red Hat Linux))
 id 1laBcT-0038ar-Qg; Sat, 24 Apr 2021 06:18:22 +0000
From: Randy Dunlap <rdunlap@infradead.org>
To: linux-kernel@vger.kernel.org
Subject: [PATCH] drm: bridge: add missing word in Analogix help text
Date: Fri, 23 Apr 2021 23:18:17 -0700
Message-Id: <20210424061817.7339-1-rdunlap@infradead.org>
X-Mailer: git-send-email 2.26.2
MIME-Version: 1.0
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
Cc: Maxime Ripard <maxime@cerno.tech>, Neil Armstrong <narmstrong@baylibre.com>,
 David Airlie <airlied@linux.ie>, Torsten Duwe <duwe@suse.de>,
 Randy Dunlap <rdunlap@infradead.org>, Robert Foss <robert.foss@linaro.org>,
 Vasily Khoruzhick <anarsoul@gmail.com>, Andrzej Hajda <a.hajda@samsung.com>,
 dri-devel@lists.freedesktop.org, Icenowy Zheng <icenowy@aosc.io>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Insert a missing word "power" in Kconfig help text.

Fixes: 6aa192698089 ("drm/bridge: Add Analogix anx6345 support")
Signed-off-by: Randy Dunlap <rdunlap@infradead.org>
Cc: Andrzej Hajda <a.hajda@samsung.com>
Cc: Neil Armstrong <narmstrong@baylibre.com>
Cc: Robert Foss <robert.foss@linaro.org>
Cc: David Airlie <airlied@linux.ie>
Cc: Daniel Vetter <daniel@ffwll.ch>
Cc: dri-devel@lists.freedesktop.org
Cc: Icenowy Zheng <icenowy@aosc.io>
Cc: Vasily Khoruzhick <anarsoul@gmail.com>
Cc: Torsten Duwe <duwe@suse.de>
Cc: Maxime Ripard <maxime@cerno.tech>
---
 drivers/gpu/drm/bridge/analogix/Kconfig |    2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

--- linux-next-20210423.orig/drivers/gpu/drm/bridge/analogix/Kconfig
+++ linux-next-20210423/drivers/gpu/drm/bridge/analogix/Kconfig
@@ -6,7 +6,7 @@ config DRM_ANALOGIX_ANX6345
 	select DRM_KMS_HELPER
 	select REGMAP_I2C
 	help
-	  ANX6345 is an ultra-low Full-HD DisplayPort/eDP
+	  ANX6345 is an ultra-low power Full-HD DisplayPort/eDP
 	  transmitter designed for portable devices. The
 	  ANX6345 transforms the LVTTL RGB output of an
 	  application processor to eDP or DisplayPort.
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
