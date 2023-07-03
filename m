Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 4DC1074650C
	for <lists+dri-devel@lfdr.de>; Mon,  3 Jul 2023 23:47:32 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1C1D410E0C8;
	Mon,  3 Jul 2023 21:47:28 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from aposti.net (aposti.net [89.234.176.197])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 55A0C10E0C8
 for <dri-devel@lists.freedesktop.org>; Mon,  3 Jul 2023 21:47:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=crapouillou.net;
 s=mail; t=1688420843;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding;
 bh=vwdXKx+U3iVVC3c7K/sn3Jj32FLhI0XzSGIe5REnjno=;
 b=XQ8ve/K5+LEPdWWGqH7Es/WRYg3CgtONQPWtjiIgc39X0EEeaaKnVfYjZpgQaGDcLjgbuR
 ebyQrrEc6ZYBkP81N47E0Av1GhhqjwXAWns4fxlVmz+k6cmjJ5OwytOTBGNvTyOfDUgEg/
 DjN2VuXN+uZIChZ3zeD1bINYTHLILGc=
From: Paul Cercueil <paul@crapouillou.net>
To: Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Rob Herring <robh+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>,
 Alim Akhtar <alim.akhtar@samsung.com>,
 Neil Armstrong <neil.armstrong@linaro.org>, Sam Ravnborg <sam@ravnborg.org>
Subject: [PATCH 0/3] Galaxy S2 (i9100) panel updates
Date: Mon,  3 Jul 2023 23:47:12 +0200
Message-Id: <20230703214715.623447-1-paul@crapouillou.net>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam: Yes
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
Cc: devicetree@vger.kernel.org, linux-samsung-soc@vger.kernel.org,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 Paul Cercueil <paul@crapouillou.net>, linux-arm-kernel@lists.infradead.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi,

Here's a small patchset that I created while playing with PostmarketOS
on my Samsung Galaxy S2.

The first two patches update the LD9040 panel driver so that it looks
much better, and supports setting the backlight.

The third patch fixes the size of the panel in the Device Tree. The
previous values were completely bogus and caused Phosh (PmOS' UI) to
display tiny icons and text as it thought the DPI was much lower.

Cheers,
-Paul

Paul Cercueil (3):
  drm/panel: ld9040: Use better magic values
  drm/panel: ld9040: Register a backlight device
  ARM: dts: exynos/i9100: Fix LCD screen's physical size

 arch/arm/boot/dts/exynos4210-i9100.dts       |  4 +-
 drivers/gpu/drm/panel/panel-samsung-ld9040.c | 51 ++++++++++++++++++--
 2 files changed, 48 insertions(+), 7 deletions(-)

-- 
2.40.1

