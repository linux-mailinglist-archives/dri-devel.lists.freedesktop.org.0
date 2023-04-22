Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 30D906EBB43
	for <lists+dri-devel@lfdr.de>; Sat, 22 Apr 2023 22:50:50 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8916710E1A0;
	Sat, 22 Apr 2023 20:50:44 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from dfw.source.kernel.org (dfw.source.kernel.org
 [IPv6:2604:1380:4641:c500::1])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AF23D10E18F
 for <dri-devel@lists.freedesktop.org>; Sat, 22 Apr 2023 20:50:30 +0000 (UTC)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 7716361376;
 Sat, 22 Apr 2023 20:50:28 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B0297C4339B;
 Sat, 22 Apr 2023 20:50:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1682196627;
 bh=7zeW/xv++SWINuXHU/MUsAajCSk6VKuZ5VI+UwjVzBY=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=YizmBtL0rRsM3d+Df6GBDq/V9QiNOcl0Xv1c43rft7AAu2fuqHImyp63WRVLj44xk
 iSPwrBtUCVY3O0368OleeeyNlnKWBbikBoVMEgLDWAaprOuQv7E2xUDZMEdiwbph+1
 wBbSZjfd1U1KanoouNkBIWr6xNO6owrq8YSXK7zLfjsoC3BQ8v9/lt8GapL7dcguZt
 TPH3pePHTaaJfDIEABArHMG1alA2fZ131vqH0anad/I1cLstX3P4lHmBPUpAmqt9Rw
 3Ys+5GJ/JYyBb0MoHb6QAfrJ7+y0QFi524ePijpUos1ksTrvfsyW7/EaLghMxJOt6z
 BEf8/b49KE8vw==
Received: by mercury (Postfix, from userid 1000)
 id 0FEDC1066CC3; Sat, 22 Apr 2023 22:50:25 +0200 (CEST)
From: Sebastian Reichel <sre@kernel.org>
To: Sebastian Reichel <sre@kernel.org>
Subject: [PATCH v2 04/13] drm/panel: sitronix-st7789v: remove unused constants
Date: Sat, 22 Apr 2023 22:50:03 +0200
Message-Id: <20230422205012.2464933-5-sre@kernel.org>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230422205012.2464933-1-sre@kernel.org>
References: <20230422205012.2464933-1-sre@kernel.org>
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
Cc: devicetree@vger.kernel.org,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Gerald Loacker <gerald.loacker@wolfvision.net>,
 Sam Ravnborg <sam@ravnborg.org>, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, Rob Herring <robh+dt@kernel.org>,
 Thierry Reding <thierry.reding@gmail.com>,
 Michael Riesch <michael.riesch@wolfvision.net>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

ST7789V_COLMOD_RGB_FMT_18BITS and ST7789V_COLMOD_CTRL_FMT_18BITS
are unused in favour of MIPI_DCS_PIXEL_FMT_18BIT, remove them.

Signed-off-by: Sebastian Reichel <sre@kernel.org>
---
 drivers/gpu/drm/panel/panel-sitronix-st7789v.c | 3 ---
 1 file changed, 3 deletions(-)

diff --git a/drivers/gpu/drm/panel/panel-sitronix-st7789v.c b/drivers/gpu/drm/panel/panel-sitronix-st7789v.c
index e4d8dea1db36..f7566551b5e2 100644
--- a/drivers/gpu/drm/panel/panel-sitronix-st7789v.c
+++ b/drivers/gpu/drm/panel/panel-sitronix-st7789v.c
@@ -15,9 +15,6 @@
 #include <drm/drm_modes.h>
 #include <drm/drm_panel.h>
 
-#define ST7789V_COLMOD_RGB_FMT_18BITS		(6 << 4)
-#define ST7789V_COLMOD_CTRL_FMT_18BITS		(6 << 0)
-
 #define ST7789V_RAMCTRL_CMD		0xb0
 #define ST7789V_RAMCTRL_RM_RGB			BIT(4)
 #define ST7789V_RAMCTRL_DM_RGB			BIT(0)
-- 
2.39.2

