Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 304142C7FAD
	for <lists+dri-devel@lfdr.de>; Mon, 30 Nov 2020 09:25:16 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F20A789D49;
	Mon, 30 Nov 2020 08:25:11 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-x343.google.com (mail-wm1-x343.google.com
 [IPv6:2a00:1450:4864:20::343])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C2C3C6E3FE
 for <dri-devel@lists.freedesktop.org>; Mon, 30 Nov 2020 06:25:01 +0000 (UTC)
Received: by mail-wm1-x343.google.com with SMTP id 3so18987383wmg.4
 for <dri-devel@lists.freedesktop.org>; Sun, 29 Nov 2020 22:25:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id;
 bh=DOwVj8Qr1jJUzo42Jge6HKQMp0YWtvTLoJKMGFVjtXM=;
 b=sGT3jHR1Lpg6J/cscTV6SprEJMQO/IQgZ6rgCJR2LbVrnH2XZA1hMJEecrj+JsOFoO
 T4W8ZwSBJumN/XLD7ZZ7Bi7haUaM1ufCGLYiA4JkYsoG2kzbRxJ3t96e5rolDjy9NR3p
 HD15p8aYXegZTKV6Nb9OOd93RDaRuuKCvFqR/CnqTUDTVLoUbvXh098ay17ra8i+KS05
 ZNeoYCkduElKgFBAKDYzSpzRTl1judAXyVUfaP6TxuykryYh06W7bu/s4gnmlvI4/XFV
 PpY+MnieDmpAwDIRQz2v1QpiztAouzIKA6N9Jc8n04PQpJlPe0PaOpAtogOA48tTZk3V
 mDTQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id;
 bh=DOwVj8Qr1jJUzo42Jge6HKQMp0YWtvTLoJKMGFVjtXM=;
 b=oSMOg7LTs4YcA/ZObYDwdPuzRZwBRQ4QWyxuuXxz0DUDvUJaT6+DGWQK2asx4UuEna
 npHtaDJV2Qyx4uz8nNLGYMUcdrZRpDG4CLzJveHB98qjFJ+0+MpE9+tTzaaUnPBTUM5L
 7UDXwIYSWC5uHNxPJaQoegJthPSIBgvK7gPJvo1waF9usPdr9TUN7ruxlg/5h3m1JoJ+
 +OoXSIZgv+NiLMXxaPXdQGCa436GTHgebit6wSkA172XYqhpl9pJVciptCnllgB0/mfL
 oaTlBa4uFWHyYwUHdLNQc7yTcdp5cfgOXDh7mOnPKMzNQcLODPXTgwbKInipgE0hQ21W
 wAsw==
X-Gm-Message-State: AOAM5315b9grbVfnZDhnJC+z9ZfO3h4Z5ldNmt8nP66G2syMPfPNB3Td
 iMPSQw3KLX9tUuxwF9b9sY4=
X-Google-Smtp-Source: ABdhPJyUTBklttSIadpw/0QiG8ulLfCer6rgpQXN891ZfFXsr+JmFBYLepRAb53ADNI+CTBgyQRySA==
X-Received: by 2002:a05:600c:2:: with SMTP id
 g2mr21355073wmc.156.1606717500432; 
 Sun, 29 Nov 2020 22:25:00 -0800 (PST)
Received: from rum-mikhail-dt.world.mentorg.com (nat-rum.mentorg.com.
 [139.181.33.34])
 by smtp.gmail.com with ESMTPSA id u129sm22594649wme.9.2020.11.29.22.24.58
 (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
 Sun, 29 Nov 2020 22:24:59 -0800 (PST)
From: mdurnev@gmail.com
X-Google-Original-From: mikhail_durnev@mentor.com
To: linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 noralf@tronnes.org
Subject: [PATCH v1 0/3] drm/mipi-dbi: Type B bus support, drm/tiny: MRB2801
Date: Mon, 30 Nov 2020 16:23:56 +1000
Message-Id: <1606717439-18383-1-git-send-email-mikhail_durnev@mentor.com>
X-Mailer: git-send-email 2.7.4
X-Mailman-Approved-At: Mon, 30 Nov 2020 08:25:11 +0000
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

Mikhail Durnev (3):
  drm/mipi-dbi: Add support for Type B
  drm/tiny: Add driver for ili9341 with parallel bus
  dt-bindings: panel: Add bindings for MRB2801

 .../devicetree/bindings/display/ronbo,mrb2801.txt  |  42 +++
 drivers/gpu/drm/drm_mipi_dbi.c                     | 116 ++++++++-
 drivers/gpu/drm/tiny/Kconfig                       |  13 +
 drivers/gpu/drm/tiny/Makefile                      |   1 +
 drivers/gpu/drm/tiny/ili9341_gpio.c                | 290 +++++++++++++++++++++
 include/drm/drm_mipi_dbi.h                         |  30 ++-
 6 files changed, 490 insertions(+), 2 deletions(-)
 create mode 100644 Documentation/devicetree/bindings/display/ronbo,mrb2801.txt
 create mode 100644 drivers/gpu/drm/tiny/ili9341_gpio.c

-- 
2.7.4

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
