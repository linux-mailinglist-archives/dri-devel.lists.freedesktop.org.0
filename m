Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 6DB752C9949
	for <lists+dri-devel@lfdr.de>; Tue,  1 Dec 2020 09:24:04 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 256876E4DD;
	Tue,  1 Dec 2020 08:23:44 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x442.google.com (mail-wr1-x442.google.com
 [IPv6:2a00:1450:4864:20::442])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DC55589956
 for <dri-devel@lists.freedesktop.org>; Mon, 30 Nov 2020 23:06:05 +0000 (UTC)
Received: by mail-wr1-x442.google.com with SMTP id l1so18584412wrb.9
 for <dri-devel@lists.freedesktop.org>; Mon, 30 Nov 2020 15:06:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id;
 bh=kQXnB1X19UeBITbciJ7mvtj+74IYaiZ+Jn+cqruHHuk=;
 b=LCMThEDvu5tOOImUt1qTvDRzbSFoV1ytPweqan7G2TAver5sFM0wxdKmQswXwqOgi1
 1kxyHgfaILs5ogIR4gCYCVTrHoSnNT8elnmZRUr/Vg2p2xiHePhRVUgvgBtahfsRZB1X
 mJQO8SJwaqhPZnyUBVnOQ/UW1l+SLOmFj/2bDXMtpCPu4JXxIQy+dOcbNARpbosuY8fo
 RAEHs1FFLfAFMhkEpvvKK08OE/HOAjbYuD0Jce3OhlmmRU3Pxne5vLPAqJpA0FE2FpmV
 QIkB3usO7IYZoUBRe40FHm9lyi7o7DAkAhZVNmNskIXzYd18nnJowvEudud4sCcBOB6e
 d4PQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id;
 bh=kQXnB1X19UeBITbciJ7mvtj+74IYaiZ+Jn+cqruHHuk=;
 b=TtEaBTng02IpVtc3jg2UMmy75tdDi4CIJWJOKR2hLNBf0jEoynuwHUZiCzmiesbIDd
 AypeiY52RaGsWFTgh8ujlE0VJhlVmwkHy/NSMtPLKqNv54mKPGs20n2vm4vReVJqOlei
 y+l6jfMAx9xhenKr7UGLygCh+T87bTXBkoUQb5reOUzCGOoi+CRhtiGXXvbEI82Epp8F
 5wZQEJCLRuLQr23lQRaRQAZ6VJiBM4GtF6iex6UKGZ3zJJU0sjeD/vrKxw/TOdFosf04
 1hZ0seZ/dlq0lDBwAmSCRlUTPa7DsmoHfeKJ1iyq1UGtAi9V3PfCD2raDwNYjNyOosW7
 BuHA==
X-Gm-Message-State: AOAM532kuSPW8SEOji9LA2C/zVUFAkGeGW8Rg4LW28wC0SPM1Jsa1wSK
 KWYNDCGaWQiMRRsOB7pLQI0=
X-Google-Smtp-Source: ABdhPJxogWIeS5K+Kyg7YwmOZbfVwi3gZv+XxvAAulYn9B9YxZTJVU0NtcryfTpz4BaRVmXiQSXPDA==
X-Received: by 2002:adf:f3cf:: with SMTP id g15mr30941507wrp.71.1606777564616; 
 Mon, 30 Nov 2020 15:06:04 -0800 (PST)
Received: from rum-mikhail-dt.world.mentorg.com (nat-rum.mentorg.com.
 [139.181.33.34])
 by smtp.gmail.com with ESMTPSA id p4sm30427985wrm.51.2020.11.30.15.06.02
 (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
 Mon, 30 Nov 2020 15:06:04 -0800 (PST)
From: mdurnev@gmail.com
X-Google-Original-From: mikhail_durnev@mentor.com
To: linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 noralf@tronnes.org
Subject: [PATCH v2 0/3] drm/mipi-dbi: Type B bus support, drm/tiny: MRB2801
Date: Tue,  1 Dec 2020 09:05:33 +1000
Message-Id: <1606777536-14783-1-git-send-email-mikhail_durnev@mentor.com>
X-Mailer: git-send-email 2.7.4
X-Mailman-Approved-At: Tue, 01 Dec 2020 08:23:37 +0000
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
 drivers/gpu/drm/tiny/ili9341_gpio.c                | 290 +++++++++++++++++++++
 include/drm/drm_mipi_dbi.h                         |  30 ++-
 6 files changed, 499 insertions(+), 11 deletions(-)
 create mode 100644 Documentation/devicetree/bindings/display/ronbo,mrb2801.txt
 create mode 100644 drivers/gpu/drm/tiny/ili9341_gpio.c

-- 
2.7.4

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
