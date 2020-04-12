Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E1B051A5FBC
	for <lists+dri-devel@lfdr.de>; Sun, 12 Apr 2020 20:20:28 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 874BC6E125;
	Sun, 12 Apr 2020 18:20:23 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-x131.google.com (mail-lf1-x131.google.com
 [IPv6:2a00:1450:4864:20::131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7FC206E125
 for <dri-devel@lists.freedesktop.org>; Sun, 12 Apr 2020 18:20:22 +0000 (UTC)
Received: by mail-lf1-x131.google.com with SMTP id k28so4975124lfe.10
 for <dri-devel@lists.freedesktop.org>; Sun, 12 Apr 2020 11:20:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=tY4gV3mbBh6YlZ2Mos/NaX4/rY14UmtFD7+t3Jb3dMw=;
 b=ROGEJ/CaGdsXBF+PbMesBFoHnpYqw7ZVM6SOtq5GVNwVH7JNVbYjZLzv1ohpJM5FKi
 9yji4QogiO9wbeUziw3EMOSYGKDXOyQSuxnXSkto+8bG4DRbKQ9+kRMivEUZnc8Q41vj
 GW+0MfxC5jUQX0SOEmjR7I9I57AVGTbYZEERr17C44weIY/7oc6XSfrJZYiHq+qPxkgm
 MY0XEfA7eiuPrSoRWtWrIJHVaAACeP/rdLUMOSzIsppr8S9ACK4KdOp5t00VwhaYAxvG
 vLWCdoJOe0/vqTEvmyYBmkEN0O2qtTmQ3g5EYShAMySr+h1z6SNs7YkoiBOoqp+VLysR
 wCPA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :mime-version:content-transfer-encoding;
 bh=tY4gV3mbBh6YlZ2Mos/NaX4/rY14UmtFD7+t3Jb3dMw=;
 b=Sn+KqbUssunl6DwZIXaGLhtCaybtYrdexkqtmia9mcvj0kqVJ1zQBGtqJMZHaSdlee
 a2C4zBKcme37la65Av4CiFM0BilCiO+OCExUF6wQdM4G1iHRmOOW20Ga3MJ7q6sPaxqy
 /190sHAT5N5E1CEZN/XXiT8SFSahxreJ0EpAL9n1LeWFLuKDKInF7DfazEJQs3UmdoRk
 D+ZW2sO3h2XJ3O5QHcVfwCgf9Q6Ita+W0WMUOrBEAIsbIj4e2X8i3uWMp8KHe9o3sAfL
 H5tQcUmnJ78N9GijQNcoLcuu/Z7IZcbMho/6OafwuuQzjBc6EnvhwoFA16wJYmXz4L8e
 7oZQ==
X-Gm-Message-State: AGi0PuYKTVJJnPA4T1+q20aaaCD/Jjyhfy2VxY1HVHW5HjK+rKNVduAG
 Go9kOUi6Otqjfslnfe1h3pg=
X-Google-Smtp-Source: APiQypIxqPYcw7sG0yOL2g9KSN6dtoshvVOHq2rXNtGX+hzY3j3+hLYI18RMgDenrT3GLFgvbP7kjQ==
X-Received: by 2002:a05:6512:1c5:: with SMTP id
 f5mr8183363lfp.138.1586715620757; 
 Sun, 12 Apr 2020 11:20:20 -0700 (PDT)
Received: from saturn.lan (18.158-248-194.customer.lyse.net. [158.248.194.18])
 by smtp.gmail.com with ESMTPSA id
 m13sm6434394lfk.12.2020.04.12.11.20.19
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 12 Apr 2020 11:20:20 -0700 (PDT)
From: Sam Ravnborg <sam@ravnborg.org>
To: devicetree@vger.kernel.org, Rob Herring <robh@kernel.org>,
 dri-devel@lists.freedesktop.org
Subject: [PATCH v1 0/4] dt-bindings: DT Schema variants of atmel lcdc, hlcdc
Date: Sun, 12 Apr 2020 20:20:08 +0200
Message-Id: <20200412182012.27515-1-sam@ravnborg.org>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
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
Cc: Alexandre Belloni <alexandre.belloni@bootlin.com>,
 Boris Brezillon <bbrezillon@kernel.org>,
 Nicolas Ferre <nicolas.ferre@microchip.com>, Hans Verkuil <hverkuil@xs4all.nl>,
 Mauro Carvalho Chehab <mchehab@kernel.org>, linux-media@vger.kernel.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

The following four patches update the bindings for Atmel
LCDC, HLCDC display controllers to DT Schema.

The bindings were re-written in DT Schema format,
and examples adjusted/updated to fit.

This patch-set introduces a new endpoint property in video-interfaces
used to tell if red and blue wiring is reversed.
Red and blue wires are reversed as the LCDC IP natively supports BGR
whereas most SW expects RGB. With the wires reversed the SW thinks
the IP supports RGB.
See more details in the changelog of the patch.

The Atmel lcdc binding deprecate a lot of properties in other
to update it to an up-to-date binding. There are no users of the
updated binding, thats something I work on.

Note a big difference between LCDC and HLCDC.
LCDC has all in one binding (interrupts, pwm, display controller).
HLCDC has individual sub-nodes for the PWM and the display contoller.

When posting an update on the old atmel,lcdc.txt file the feedback
was back then that we did not want the split like done for hlcdc.
And it makes for a simpler binding in this way - so feedback looks right.

Despite that Microchip has purchased Atmel, the atmel name is kept.
Also the files are placed in a directory named atmel/.

Feedback welcome!

	Sam

Sam Ravnborg (4):
      dt-bindings: display: convert atmel-hlcdc to DT Schema
      dt-bindings: display: convert atmel lcdc to DT Schema
      dt-bindings: media: add wiring property to video-interfaces
      dt-bindings: display: add port support to atmel lcdc

 .../devicetree/bindings/display/atmel,lcdc.txt     |  88 --------
 .../devicetree/bindings/display/atmel/hlcdc-dc.txt |  75 -------
 .../bindings/display/atmel/hlcdc-dc.yaml           | 102 +++++++++
 .../devicetree/bindings/display/atmel/lcdc.yaml    | 229 +++++++++++++++++++++
 .../devicetree/bindings/media/video-interfaces.txt |   3 +
 .../devicetree/bindings/mfd/atmel-hlcdc.txt        |  55 -----
 .../devicetree/bindings/mfd/atmel-hlcdc.yaml       |  78 +++++++
 .../devicetree/bindings/pwm/atmel-hlcdc-pwm.txt    |  29 ---
 .../devicetree/bindings/pwm/atmel-hlcdc-pwm.yaml   |  39 ++++
 9 files changed, 451 insertions(+), 247 deletions(-)


_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
