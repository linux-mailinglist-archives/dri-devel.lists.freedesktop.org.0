Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 36FAD2B77DF
	for <lists+dri-devel@lfdr.de>; Wed, 18 Nov 2020 09:01:56 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 244C96E41A;
	Wed, 18 Nov 2020 08:01:26 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x444.google.com (mail-wr1-x444.google.com
 [IPv6:2a00:1450:4864:20::444])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 774D06E342
 for <dri-devel@lists.freedesktop.org>; Wed, 18 Nov 2020 07:36:44 +0000 (UTC)
Received: by mail-wr1-x444.google.com with SMTP id c17so1083643wrc.11
 for <dri-devel@lists.freedesktop.org>; Tue, 17 Nov 2020 23:36:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id;
 bh=DOwVj8Qr1jJUzo42Jge6HKQMp0YWtvTLoJKMGFVjtXM=;
 b=B05obr0UlFKG1WYy2PPoekrb54GhRGB0DoQF2QO75qXYA7565aiT0jFxiRz+s0jKsh
 aUDRScj3R8XKwsB5UoZzzwhx2x2AsWQyvHcOz8bZOPGwMJ310hKzgpMTOOvIZXg+LLCB
 5ujrNoxYQUap5n4aZ2ljADL6KjjHGUCdPl3zcQNwtC6ex9yra8sI7bmnkWMJsWTLhJ5V
 RsxJGhEBFbX5r0piCdEh8vatL7ryH2qt9n9urLRuhmy6UCEby25J3mGCZ548Ui4rDqO9
 oC+hPibHcgWS00XMk5yfMz42M/6l5zOeNAUhofF0F97P+9M55jO4EK35RBdSU4WBFJ51
 VrOA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id;
 bh=DOwVj8Qr1jJUzo42Jge6HKQMp0YWtvTLoJKMGFVjtXM=;
 b=jukNpMbgF9uixUosWEOYAmOXXf5B0qvceAI2IayP+1+t4vwT8nssD0LTGwFSdmACo9
 gBi30RNVB1eh+oWizGUHPTRRIkQKSNp87IRVyTzJc9Q9xjVg4p/+0ekIPIxwIBwSJjK4
 FA8RD7JFgJMy5LbY9cMuWRf1JqNxF6/1dyfEzqzH/0hgZfO2yVEL4Py/YhmIGqG6ImXD
 il3HjKw+H0gyEOsKQ3ttLHLdu8nJlHKXk0NKMXM8SaD1qtwSk8ve9aOxtJDkcVF7h/8j
 ife3NE1wVvL1aZKDcYivJVyyi4uKiWM2xIC8B8X8HGc1TvDV8WcjLi6ozFwqSXGI4xIC
 NGrQ==
X-Gm-Message-State: AOAM533PT9pEnZmLopuNO+P8b0/O/2DRQbNvMApOHTijk+DXSkpn64m5
 +dAJ2x4W9b/+6i4zrrQz7K0=
X-Google-Smtp-Source: ABdhPJzMNoj0DUEeSiOWma/YdZpEj4KgvqemM+RVhsjaCzcs62Iq87k/98mj04GfFJGCRgE4NydYyw==
X-Received: by 2002:a5d:4dd0:: with SMTP id f16mr1346781wru.8.1605685003150;
 Tue, 17 Nov 2020 23:36:43 -0800 (PST)
Received: from rum-mikhail-dt.world.mentorg.com (nat-rum.mentorg.com.
 [139.181.33.34])
 by smtp.gmail.com with ESMTPSA id b14sm30188632wrq.47.2020.11.17.23.36.41
 (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
 Tue, 17 Nov 2020 23:36:42 -0800 (PST)
From: mdurnev@gmail.com
X-Google-Original-From: mikhail_durnev@mentor.com
To: linux-kernel@vger.kernel.org
Subject: [PATCH 0/3] drm/mipi-dbi: Type B bus support, drm/tiny: MRB2801
Date: Wed, 18 Nov 2020 17:35:42 +1000
Message-Id: <1605684945-29727-1-git-send-email-mikhail_durnev@mentor.com>
X-Mailer: git-send-email 2.7.4
X-Mailman-Approved-At: Wed, 18 Nov 2020 08:01:05 +0000
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
Cc: mikhail_durnev@mentor.com, dri-devel@lists.freedesktop.org
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
