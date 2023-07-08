Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B64F674BCD2
	for <lists+dri-devel@lfdr.de>; Sat,  8 Jul 2023 10:40:48 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E020610E0C7;
	Sat,  8 Jul 2023 08:40:42 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from aposti.net (aposti.net [89.234.176.197])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 063C210E0C7
 for <dri-devel@lists.freedesktop.org>; Sat,  8 Jul 2023 08:40:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=crapouillou.net;
 s=mail; t=1688805636;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding;
 bh=kZp/RuTQA9sv6le/NdMKkvZz1qlquoEfqK2QgHrlgBk=;
 b=J9y0FOqnmMfGk1BCYAQa7QaGavIpGz2/AHbajLggP+WjAmsu9+p8Byugu9B/MYr2G+altw
 3qrac/FtnmYpqJeSU/IOFriu9y33/ZySeB4Ztquv69DXCS2BXqxv3Ln60QyvMelixdRqRv
 2i7rcThlMWnQe2kW4gIyp2T4Y1aMFpM=
From: Paul Cercueil <paul@crapouillou.net>
To: Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Rob Herring <robh+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>,
 Alim Akhtar <alim.akhtar@samsung.com>,
 Neil Armstrong <neil.armstrong@linaro.org>, Sam Ravnborg <sam@ravnborg.org>
Subject: [PATCH v2 0/3] Galaxy S2 (i9100) panel updates v2
Date: Sat,  8 Jul 2023 10:40:24 +0200
Message-Id: <20230708084027.18352-1-paul@crapouillou.net>
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

Follow-up on my patchset that fixes the display of the Samsung Galaxy S2
when running PostmarketOS.

The first two patches update the LD9040 panel driver so that it looks
much better, and supports setting the backlight.

The third patch fixes the size of the panel in the Device Tree. The
previous values were completely bogus and caused Phosh (PmOS' UI) to
display tiny icons and text as it thought the DPI was much lower.

Changes since V1:
[1/3]: Remove spurious new line
[2/3]: Remove .get_brightness() callback, use bl_get_data() and
       backlight_get_brightness()

Cheers,
-Paul

Paul Cercueil (3):
  drm/panel: ld9040: Use better magic values
  drm/panel: ld9040: Register a backlight device
  ARM: dts: exynos/i9100: Fix LCD screen's physical size

 arch/arm/boot/dts/exynos4210-i9100.dts       |  4 +-
 drivers/gpu/drm/panel/panel-samsung-ld9040.c | 42 +++++++++++++++++---
 2 files changed, 38 insertions(+), 8 deletions(-)

-- 
2.40.1

