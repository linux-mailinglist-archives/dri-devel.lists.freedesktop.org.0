Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B15657942EA
	for <lists+dri-devel@lfdr.de>; Wed,  6 Sep 2023 20:15:49 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id ABC7810E6EF;
	Wed,  6 Sep 2023 18:15:40 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtp1.axis.com (smtp1.axis.com [195.60.68.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C2BBC10E055
 for <dri-devel@lists.freedesktop.org>; Wed,  6 Sep 2023 16:30:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=axis.com; q=dns/txt; s=axis-central1; t=1694017833;
 x=1725553833; h=from:subject:date:message-id:mime-version:
 content-transfer-encoding:to:cc;
 bh=znBSTq5RS9Z8jmekHXsRIOZBs9Z3TiIq9C1uuLxH85g=;
 b=ezA6huP0Tkcb0sreLlA0frc+LspbsqEYqu7Wy6Q4Qqmas6+JlMOqOO1j
 2zp8EDxUY8scEvE6KHUJ/zPxFZvN280S3TcnvW7UIIwiPvT1+ZplZ9ICM
 8yviX1ChDYcq6d7WERj0CpxPBzjjwgInwAXOey3J+7Lm0IBvTpR6pP97A
 U79j2HOUoPR51CIpoCN7otCBsrmgfKYjJ0xhaa2n81TbiCPT8yeoSj0x6
 EJ0JdU89ANcSepM7Cx30oLaPs6dUrp0VW50aVgGXk7rDVifFPW3rve8wM
 kioKsd1CWAScxOHKIUT+QmcyBTrQfEsRiHSnjjgEqJktoM+GAaL8+i8F8 Q==;
From: Stefan x Nilsson <stefan.x.nilsson@axis.com>
Subject: [PATCH 0/2] Add st7735s drm driver and Winstar panel
Date: Wed, 6 Sep 2023 18:22:15 +0200
Message-ID: <20230906-st7735s-v1-0-add92677c190@axis.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIADin+GQC/6tWKk4tykwtVrJSqFYqSi3LLM7MzwNyDHUUlJIzE
 vPSU3UzU4B8JSMDI2MDCyNT3eISc3Nj02LdtCTLVCODVAtDAyNzJaDqgqLUtMwKsEnRsbW1AAP
 mLhlZAAAA
To: David Lechner <david@lechnology.com>, David Airlie <airlied@gmail.com>,
 Daniel Vetter <daniel@ffwll.ch>, Rob Herring <robh+dt@kernel.org>, "Krzysztof
 Kozlowski" <krzysztof.kozlowski+dt@linaro.org>, Conor Dooley
 <conor+dt@kernel.org>
X-Mailer: b4 0.12.3
X-Mailman-Approved-At: Wed, 06 Sep 2023 18:15:36 +0000
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
Cc: Stefan x Nilsson <stefan.x.nilsson@axis.com>, devicetree@vger.kernel.org,
 kernel@axis.com, linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Add a new driver for the Sitronix st7735s display controller
together with a 0.96" 80x160 color TFT display by Winstar.

The driver is very similar to the st7735r driver, but uses a
different pipe_enable sequence and also allows for an
optional regulator to be specified using devicetree.

Signed-off-by: Stefan x Nilsson <stefan.x.nilsson@axis.com>
---
Stefan x Nilsson (2):
      dt-bindings: display: Add st7735s driver
      drm: tiny: Add st7735s driver

 .../bindings/display/sitronix,st7735s.yaml         |  81 +++++++
 MAINTAINERS                                        |   7 +
 drivers/gpu/drm/tiny/Kconfig                       |  14 ++
 drivers/gpu/drm/tiny/Makefile                      |   1 +
 drivers/gpu/drm/tiny/st7735s.c                     | 264 +++++++++++++++++++++
 5 files changed, 367 insertions(+)
---
base-commit: b715dcd3db4a9a57b3fbe7820db37cae930f0867
change-id: 20230825-st7735s-fb9e20e81027

Best regards,
-- 
Stefan x Nilsson <stefan.x.nilsson@axis.com>

