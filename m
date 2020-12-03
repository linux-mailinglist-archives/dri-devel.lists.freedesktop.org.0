Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 5742A2CE9B4
	for <lists+dri-devel@lfdr.de>; Fri,  4 Dec 2020 09:34:02 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 17CE96E15A;
	Fri,  4 Dec 2020 08:33:36 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-x344.google.com (mail-wm1-x344.google.com
 [IPv6:2a00:1450:4864:20::344])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 921FE6E0C6
 for <dri-devel@lists.freedesktop.org>; Thu,  3 Dec 2020 10:28:38 +0000 (UTC)
Received: by mail-wm1-x344.google.com with SMTP id f190so3376591wme.1
 for <dri-devel@lists.freedesktop.org>; Thu, 03 Dec 2020 02:28:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id;
 bh=wyWoP5jyt4pdrp5btFVKihgluvIPDgPMzZdR+o5haPA=;
 b=hw6/q45nxmmWi7sNrk66g5wxJBuqR8V2jrzzmO+AB4VonjAcd5xyq+jLx6PPcK+McE
 SVy4Lkep/8tZU545XcJCcbqdcOPYIGcZRw8b/YG7SEovgLH3GIlHQwXqWwowbAbiYlYW
 jqgmH2m0soKlYpmj859+v3bDUDHUe5W4rBfsh8piF/h/hKLAjTsT0OpG5Pq+Uj+SdgQz
 b62WeixHJHZnN9FuxBgwSIWr3obNL6/zNN17+PiqXiD58WcmfEpY+PKNJN8CcV7kIyqB
 P2hy5YdMzf3RXKCBOoeS5KjmYyivDcUj2dg8/ihkOpdF+tsw80XKQ/IdWMnHkPlrWsKK
 pplQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id;
 bh=wyWoP5jyt4pdrp5btFVKihgluvIPDgPMzZdR+o5haPA=;
 b=Mbex3achB3zLH6Q7wH+V3fnrXO4upYnKW79wzpbZ7fxuBTorMDlXmgotCZBRjDriyR
 u/byd6rFWTWzBi719ryOerxZNzcYBTqdChlaL87U615/U+9nPxXOl0Wgts2GnOQaOFe5
 /3vWLpScNvb7YHuCLIcklT5o6XWW0u3VDlLjsss0fEVomMzR4//1pjzAY4brjPmt+qFl
 0a32PXCBt+39di6tUlU2EYuANeUVQ+ZxEC0Q0UjOMYkzAjW4PlGwRHLEev69uH9DG6PS
 bkiLmOgcIMMoom5pybaNkYLT0cOBIM1Tw3btH6plh72QztLdDgxqppJ6l0JUNGc7wPM+
 JXeg==
X-Gm-Message-State: AOAM531u3rt1vO3gKmdXaF5QXTYlRNPil+p6cW5q4M2hgp6JOlXIrbba
 KycXv3+fGtUsyJiXb730KRE=
X-Google-Smtp-Source: ABdhPJwnYzay01lLTx+5UOxeAHUD2SIw2hzQJ97P7sMnMzN398unva76/FQzyTVlCM6VnylxnBuQYw==
X-Received: by 2002:a1c:b0c4:: with SMTP id z187mr2505071wme.113.1606991317108; 
 Thu, 03 Dec 2020 02:28:37 -0800 (PST)
Received: from rum-mikhail-dt.world.mentorg.com (nat-rum.mentorg.com.
 [139.181.33.34])
 by smtp.gmail.com with ESMTPSA id o13sm847589wmc.44.2020.12.03.02.28.35
 (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
 Thu, 03 Dec 2020 02:28:36 -0800 (PST)
From: mdurnev@gmail.com
X-Google-Original-From: mikhail_durnev@mentor.com
To: linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 noralf@tronnes.org
Subject: [PATCH v3 0/3] drm/mipi-dbi: Type B bus support, drm/tiny: MRB2801
Date: Thu,  3 Dec 2020 20:28:10 +1000
Message-Id: <1606991293-29539-1-git-send-email-mikhail_durnev@mentor.com>
X-Mailer: git-send-email 2.7.4
X-Mailman-Approved-At: Fri, 04 Dec 2020 08:33:34 +0000
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
Cc: mikhail_durnev@mentor.com
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: Mikhail Durnev <mikhail_durnev@mentor.com>

Hi All,

This patch series is aiming at extending the mipi-dbi bus driver
to support Intel 8080 type parallel bus (Type B) over GPIO and
adding a new driver for ILI9341 display panels with 8- or 16-bit
parallel interface.

It was tested with the MRB2801 display module [1] that had
a connector compatible with the ALIENTEK STM32 development board.
The module was connected to Raspberry Pi 3 via GPIO pins.

The parallel bus is implemented partially. It supports only write
operations from the host to the display. Read operations would
require switching GPIO mode between input and output back and
forth. But this implementation is very simple, and GPIO mode can
be set for all used pins to output once at initialization.
The RD pin of the display has to always receive the logic high
signal to make sure the data bus pins from the dislay side are
always in the high impedance state. Otherwise the display module
as well as the GPIO controller of the host can be damaged.
To be on the safe side I recommend using protective resistors
for all GPIO pins conneced to DB pins of the display. Resistors
of 10 kOhms are just fine for RPi 3. The WR and DC pins may not
work well with 10K resistors. Although there is no need to protect
them, you can try using 1K resistors if you want.

Bit banging is used to transmit data over the parallel bus from
host to display. There are two numbers that contol timings. They
should be defined in the device tree via the wr-up-down-delays
property. The first number is related to the write control pulse
duration, and the second number is related to the write cycle
duration. For ILI9341, the write pulse cannot be shorter than 15 ns,
and the write duration cannot be shorter than 66 ns. Delays of
10 and 51 ns respectively allow to meet the specifications on
RPi 3. Faster machines may need values closer to 15 and 66.

[1] http://www.lcdwiki.com/2.8inch_16BIT_Module_ILI9341_SKU:MRB2801

Signed-off-by: Mikhail Durnev <mikhail_durnev@mentor.com>

v2 -> v3:
	- Fixed build errors reported by the kernel test robot

v1 -> v2:
	- Moved the definition of mipi_dbi_machine_little_endian()
	  out of the "#if IS_ENABLED(CONFIG_SPI)" clause. That static
	  function is used in mipi_dbi_gpio_init which does not need
	  CONFIG_SPI enabled

v0 -> v1:
	- Rebased on v5.10-rc6
	- Replaced "dbi->spi = 0;" with "dbi->spi = NULL;" in
	  mipi_dbi_gpio_init

v0:
	- Based on branch rpi-5.10.y
	- Tested on Raspberry Pi 3 Model B V 1.2

Mikhail Durnev (3):
  drm/mipi-dbi: Add support for Type B
  drm/tiny: Add driver for ili9341 with parallel bus
  dt-bindings: panel: Add bindings for MRB2801

 .../devicetree/bindings/display/ronbo,mrb2801.txt  |  42 +++
 drivers/gpu/drm/drm_mipi_dbi.c                     | 134 +++++++++-
 drivers/gpu/drm/tiny/Kconfig                       |  13 +
 drivers/gpu/drm/tiny/Makefile                      |   1 +
 drivers/gpu/drm/tiny/ili9341_gpio.c                | 284 +++++++++++++++++++++
 include/drm/drm_mipi_dbi.h                         |  30 ++-
 6 files changed, 493 insertions(+), 11 deletions(-)
 create mode 100644 Documentation/devicetree/bindings/display/ronbo,mrb2801.txt
 create mode 100644 drivers/gpu/drm/tiny/ili9341_gpio.c

-- 
2.7.4

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
