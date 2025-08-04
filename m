Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id F0B1AB19CFC
	for <lists+dri-devel@lfdr.de>; Mon,  4 Aug 2025 09:54:44 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8B85B10E146;
	Mon,  4 Aug 2025 07:54:42 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; secure) header.d=braiins.cz header.i=@braiins.cz header.b="d9xh3gxo";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ua1-f46.google.com (mail-ua1-f46.google.com
 [209.85.222.46])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 98ADD10E146
 for <dri-devel@lists.freedesktop.org>; Mon,  4 Aug 2025 07:54:40 +0000 (UTC)
Received: by mail-ua1-f46.google.com with SMTP id
 a1e0cc1a2514c-88bbfe763ecso894858241.3
 for <dri-devel@lists.freedesktop.org>; Mon, 04 Aug 2025 00:54:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=braiins.cz; s=google; t=1754294079; x=1754898879; darn=lists.freedesktop.org;
 h=cc:to:subject:message-id:date:from:mime-version:from:to:cc:subject
 :date:message-id:reply-to;
 bh=VELw0d1ZO538ytGI/V/v64gnXmWpxwhgeyUPbBpA3Ok=;
 b=d9xh3gxoLXrIAKAap+U8nXS1cxLU4S6Ce2osB3+SHbk2XNI0Zspt/B+BHOZpvhYqrY
 TL4nu2nvYNhEIWtXMdHq98H9DD3fRtQOdjbCMB44N/Fc0ricrW+RbNeLGH6oSzjUXZgm
 qbpy33sxMMSRPZHz5JULhFfoQBC3FFoHPSepKlR4NwtRZCyMn6VQt6DAlBVNOB31UyqL
 0y7Adp1OnKs6HvSk81jQuedVusklpijb8khydUO9gxh70BZOtxrLRoISCogHjwUgLlne
 8P7soaBBokf8xUDYHQ7bjK9qgQe7T6XMCBPjtuKdCvYue+YsPI0++GnvRZ/CJCQd8XIV
 WQ9g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1754294079; x=1754898879;
 h=cc:to:subject:message-id:date:from:mime-version:x-gm-message-state
 :from:to:cc:subject:date:message-id:reply-to;
 bh=VELw0d1ZO538ytGI/V/v64gnXmWpxwhgeyUPbBpA3Ok=;
 b=jeN50auBT0aa83rY6DCqoJsTAvbBDqrvfMFZHeeYHE+K4Om6EA5ZF7nWOKUTsHRSTa
 jfzq21t5qGTAwcY8YCERIekpDJh7qaoyj56bjJY8nrD0SwCjQ0UkKGwLj6D6Ahju0RGH
 BnFMQ/dnrsN8I3iAFp1lAONkALXwX3xVbmAeZlNKxa2Utnz4spexS0d8WEfogP9B0b4k
 ijnr3nIUQOa7Eh0VdQK4lqusGC3iUTaGbxOa5MajGMlJxIUQdavPEbo0hLXgyUEnmzp5
 9M+t5M+K/um4vAvwa3mftM/BF5gCAB8ol0YqmxL0Z1MAvv14fq52TAaUXoqrE3wzziVO
 fC7w==
X-Gm-Message-State: AOJu0Yz7+3cbTqxq0AqUViOuAYqYqIsqb8uZpMl0nIvApRaN5dZ/Rd4F
 KsbqemYcPsFFllRbcEEtwS/yVy+YmnXvbUGQnRGea5MxUuDvCjvLDlUYAIeIXsxgDTKzZnj57ho
 7Qva+cJXne+S52qpHszu81Vae5FZ0xXdyvY3FbgBjnnMWe01v4EHRp3M=
X-Gm-Gg: ASbGncsTTBrpntdp5JZKQ1OAP68/DUBNogjlJky1GyATTqi2zU77EMA86o1Az64JZmV
 dU3sksXjBxhfjBaUTnypoEqWiB8CIjohBtzQ6Zg9y7xiX2h4fPxySGq+Pc7OIwlP9V328p2bFNg
 WGoGulpPdLyKLKMDYh66gGkxXaahrOEmRtDwITv4jjho+jXB8BGDwQSsMhxuPibmz55Q0CiWqW5
 P/LySRrki1YKU3jiZvKmdvfA2pUZh31NXgdivJ0
X-Google-Smtp-Source: AGHT+IEu+govnR4Jd560VsjbMn6zm7jcHxNB8lVmMEiXHMeJeMnOhwdgNgmrnxGKfn8/85PwtRzHhO4Z3ivHmmiXfAw=
X-Received: by 2002:a05:6102:41a3:b0:4f1:2ec7:af39 with SMTP id
 ada2fe7eead31-4fdc430d567mr2717963137.18.1754294079239; Mon, 04 Aug 2025
 00:54:39 -0700 (PDT)
MIME-Version: 1.0
From: =?UTF-8?B?Sm9zZWYgTHXFoXRpY2vDvQ==?= <josef.lusticky@braiins.cz>
Date: Mon, 4 Aug 2025 09:54:28 +0200
X-Gm-Features: Ac12FXzwLTv1ihSx1itHwXyCDwv8jLhsCgiaBXXsrjcRBl-tiZ3V0--OVJkxNkc
Message-ID: <CACnTymakHbAH1eSP8y99_yOp08R4mV=M922ym9YGdT-V-xdKfQ@mail.gmail.com>
Subject: GPU acceleration with SPI displays (TinyDRM)
To: dri-devel@lists.freedesktop.org
Cc: noralf@tronnes.org, Alex Lanzano <lanzano.alex@gmail.com>
Content-Type: text/plain; charset="UTF-8"
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

Hello,
is it possible to use GPU acceleration with TinyDRM drivers?
I am testing on STM32MP157c SoC with Vivante GC400 GPU and I use
Mesa3D 24.0.9 (rootfs generated with Buildroot 2025.02.3) and kernel
5.10.176.

To compare, I also have the same system but with a MIPI DSI display.
While kmscube renders at 60 fps with the MIPI DSI display, I get only
11 fps with the SPI display (TinyDRM driver).

Is there some architectural limitation, either in Mesa, kernel, or HW-related?
I suppose both setups use kernel's KMS as renderer only (kmsro), thus
it should render at the same framerate into framebuffer.
The difference in HW is the peripheral the displays use - MIPI DSI
display utilizes LTDC peripheral (kmscube loads
/usr/lib/dri/stm_dri.so) vs. SPI display uses just SPI (ksmcube loads
/usr/lib/dri/ili9225_dri.so). Both .so files are hard links.
Both open /dev/dri/renderD128 (GPU).

The MIPI DSI display is connected to the DSI Host peripheral which
just transcodes the parallel RGB pixel stream from the LTDC (LCD
Timing Display Controller) peripheral of the STM SoC.
The display driver is drivers/gpu/drm/panel/panel-sitronix-st7703.c (DRM panel).

The SPI display driver uses the kernel's TinyDRM API and its driver is
drivers/gpu/drm/tiny/ili9225.c , but I can change to any other driver
if needed (eventually to the generic panel-mipi-dbi-spi).
Could rewriting the TinyDRM driver to a panel driver in
drivers/gpu/drm/panel/ help?

I also tried software rendering "softpipe" (disabled GPU in
device-tree) and it renders 7 fps on both systems. Thus, I suppose,
that some form of GPU acceleration is already used.

Mesa reports the same loaded GL-extensions on both systems and apart
from loaded .so files everything seems to be the same.

Best regards
Josef Lusticky
