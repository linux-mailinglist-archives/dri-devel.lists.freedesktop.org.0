Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 7224A9161F6
	for <lists+dri-devel@lfdr.de>; Tue, 25 Jun 2024 11:09:38 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B553D10E2F4;
	Tue, 25 Jun 2024 09:09:34 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=microchip.com header.i=@microchip.com header.b="1yCPyd2c";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from esa.microchip.iphmx.com (esa.microchip.iphmx.com
 [68.232.154.123])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 47B8410E0BE
 for <dri-devel@lists.freedesktop.org>; Tue, 25 Jun 2024 09:09:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
 t=1719306573; x=1750842573;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=r6fuS4iXNYY0gxO3bxmrjdmcyomSmCDYU0r8I6w8lSU=;
 b=1yCPyd2c729omtzIJr5/U3I9gzsLeBWwqAnbbp7eyEaedRZWn8yGMUbX
 xZnYDJb/JpTjlGYpSn/gpLs1OIsHDQjNqF4gcAwuZlHiUh5hWzho95RAF
 5Sc7cWFKJfBXBChumcanlj2evjMtEOXDuElblEVooJfrQaWrUCKiZo6nl
 aK8Q00C4eq3vLBEjVI7iWoVQkT8tIoGr7tr9kTywnlu0bMXFHRUOvrVkQ
 4eminv2JS82oS00842j7WCN8pd1b3+IzIDKH4GsEq6uB3SOmya74OE2vA
 Zq5JxNvAZjVhKw+1SNTIUxb0tV9sBjq7u+aS5wTTfPldiUg9eaSDU9wEL g==;
X-CSE-ConnectionGUID: VUslT87US1uPmx+Nea0QOA==
X-CSE-MsgGUID: ptazfcsATBqRk1hUoXo57g==
X-IronPort-AV: E=Sophos;i="6.08,263,1712646000"; d="scan'208";a="29096475"
X-Amp-Result: SKIPPED(no attachment in message)
Received: from unknown (HELO email.microchip.com) ([170.129.1.10])
 by esa2.microchip.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256;
 25 Jun 2024 02:09:31 -0700
Received: from chn-vm-ex03.mchp-main.com (10.10.85.151) by
 chn-vm-ex03.mchp-main.com (10.10.85.151) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Tue, 25 Jun 2024 02:09:01 -0700
Received: from che-lt-i67131.microchip.com (10.10.85.11) by
 chn-vm-ex03.mchp-main.com (10.10.85.151) with Microsoft SMTP Server id
 15.1.2507.35 via Frontend Transport; Tue, 25 Jun 2024 02:08:55 -0700
From: Manikandan Muralidharan <manikandan.m@microchip.com>
To: <megi@xff.cz>, <javierm@redhat.com>, <neil.armstrong@linaro.org>,
 <quic_jesszhan@quicinc.com>, <maarten.lankhorst@linux.intel.com>,
 <mripard@kernel.org>, <tzimmermann@suse.de>, <airlied@gmail.com>,
 <daniel@ffwll.ch>, <robh@kernel.org>, <krzk+dt@kernel.org>,
 <conor+dt@kernel.org>, <dri-devel@lists.freedesktop.org>,
 <devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>
CC: <manikandan.m@microchip.com>
Subject: [PATCH 0/4] Panel HIMAX support for Microchip's AC40T08A MIPI display
Date: Tue, 25 Jun 2024 14:38:49 +0530
Message-ID: <20240625090853.343176-1-manikandan.m@microchip.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
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

This patch series adds panel himax display controller support for the
Microchip's AC40T08A MIPI display.

Manikandan Muralidharan (4):
  dt-bindings: display: himax-hx8394: remove reset-gpio from required
    properties
  drm/panel: himax-hx8394: switch to devm_gpiod_get_optional() for
    reset_gpio
  dt-bindings: display: himax-hx8394: Add Microchip AC40T08A MIPI
    Display panel
  drm/panel: himax-hx8394: Add Support for Microchip AC40T08A MIPI
    Display Panel

 .../bindings/display/panel/himax,hx8394.yaml  |   2 +-
 drivers/gpu/drm/panel/panel-himax-hx8394.c    | 153 +++++++++++++++++-
 2 files changed, 153 insertions(+), 2 deletions(-)

-- 
2.25.1

