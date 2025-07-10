Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 04486AFFF2A
	for <lists+dri-devel@lfdr.de>; Thu, 10 Jul 2025 12:25:54 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4932E10E21A;
	Thu, 10 Jul 2025 10:25:52 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.b="JDhQ9M65";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.129.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B994410E21A
 for <dri-devel@lists.freedesktop.org>; Thu, 10 Jul 2025 10:25:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1752143149;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=1ND1pGEOAughrkErjCqE+57XmE0dcte7108oeuugxKk=;
 b=JDhQ9M65vBAKEfj3jcvJNSemxn7z3veEDQBcX3Rexy1eWjnNG5YEfOPjQADPnZk011PRU0
 M2ufPy15bRmV+iJhWTmxZV5n7kRILincKrUCbqYDp+UaKPC8ZTVNCd7V+Vd+UyIEN7+b1A
 zwbPqhiZqKRVCoKdXr6BdLlTJSM/eeY=
Received: from mail-wr1-f72.google.com (mail-wr1-f72.google.com
 [209.85.221.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-465-6ATB4-iSPHeGTVTvFuRfNg-1; Thu, 10 Jul 2025 06:25:48 -0400
X-MC-Unique: 6ATB4-iSPHeGTVTvFuRfNg-1
X-Mimecast-MFC-AGG-ID: 6ATB4-iSPHeGTVTvFuRfNg_1752143147
Received: by mail-wr1-f72.google.com with SMTP id
 ffacd0b85a97d-3a503f28b09so561406f8f.0
 for <dri-devel@lists.freedesktop.org>; Thu, 10 Jul 2025 03:25:48 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1752143147; x=1752747947;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=1ND1pGEOAughrkErjCqE+57XmE0dcte7108oeuugxKk=;
 b=ikl70VWSCFo3nUsDT5SzymR0foae0Ox8/FNJwgm4Wn0DKyriVttUTBlxgGGv3btq4P
 wXQBa6E8rMku8vpmTmsm0Odbi77O/SQ/+OxVjNByJ5k/9L9SWAC3TpTc9dxg0WJCKfey
 cf4g/KAoQlg2yFvl4u8oL9Svmn73TbIMVGZJtJzRy+WrCTNuE0cu7DVLFt4EMvfum2o+
 e3pWJHHdLV4BvFYZq6zUsl2/0ACG+QGWMUb/dvT2msdZWnBLY475A0XL61IsAmSjRuKn
 YG7SfWDfAZRzWF1vXbDm71LemOs+gNqu9rGd4hSKM77qp+6SraqrDxjMFX2MYXUnD33k
 KcZA==
X-Forwarded-Encrypted: i=1;
 AJvYcCVvxIeG5nViB0RMsndEwirCCQSIG+326v2b9d63AWJGs/tmzrx/ZODmC5pykSQwQua8KQ9cyvDgbWA=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Ywk6kxl8q+HYASiKHCkCxL4pn2gbbzixP/o2ZEX8fJX4b0w5vK0
 wXbqWUQY//IY7PjGvwz4gOyqe52tVIybCzHkV5DOPHTwhv/N4r7kWqsWqjK0l1MMEwGUohY0tFT
 RpcmifJP3CR7VA4JnPA6kRHf8tbCKhRUjY72NrtLwj7UOGSOicnJA5yipmFN1lvwGeAaxRQ==
X-Gm-Gg: ASbGnctcXxoULeIX0g8mYadhvBm1bcmiO6NdQUCt/61ip0YoF9oaYOBKMM7ZSql/6Lr
 0stijKRUSN2B+EBt/8FxYn42ri4QmtEmXsxDBN+s0D+XSTRvjgFjYIbqWh0cXttbX2vkXVaL4r2
 UI6vkk0fFrcRdXkrgoyU0mezzvLvoE/Asjj3833FoD8X28xP00vlh7KPIX7fZgfVYIyUTbJsOAZ
 dq2I7Q+lTJG9M1XCSeUsVbaeXpQvrc6zBWMrR3QlAan/rkgQX82mgbZLLWEMTp+Izna1Qfglp2r
 3rhldAQ/T7WXR9WCqZUcrOAXP6B7ci4vsnMJYNoD2mi22k8=
X-Received: by 2002:a05:6000:230a:b0:3b5:e78f:f4b3 with SMTP id
 ffacd0b85a97d-3b5e7f142e5mr2661630f8f.11.1752143146940; 
 Thu, 10 Jul 2025 03:25:46 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGw0Fp3hGMQ2ioeBb7L40qD3wSKjLbm3xoYLDE8V5zfgO85zTk2YhsvuUsIz4ABFDvjQSMY4g==
X-Received: by 2002:a05:6000:230a:b0:3b5:e78f:f4b3 with SMTP id
 ffacd0b85a97d-3b5e7f142e5mr2661593f8f.11.1752143146504; 
 Thu, 10 Jul 2025 03:25:46 -0700 (PDT)
Received: from localhost (62-151-111-63.jazzfree.ya.com. [62.151.111.63])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-3b5e8e26daasm1512820f8f.91.2025.07.10.03.25.45
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 10 Jul 2025 03:25:45 -0700 (PDT)
From: Javier Martinez Canillas <javierm@redhat.com>
To: linux-kernel@vger.kernel.org
Cc: ipedrosa@redhat.com, Javier Martinez Canillas <javierm@redhat.com>,
 Conor Dooley <conor+dt@kernel.org>, David Airlie <airlied@gmail.com>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Marcus Folkesson <marcus.folkesson@gmail.com>,
 Maxime Ripard <mripard@kernel.org>, Rob Herring <robh@kernel.org>,
 Simona Vetter <simona@ffwll.ch>, Thomas Zimmermann <tzimmermann@suse.de>,
 devicetree@vger.kernel.org, dri-devel@lists.freedesktop.org
Subject: [PATCH 0/3] drm/sitronix/st7571-i2c: Add support for the ST7567
 Controller
Date: Thu, 10 Jul 2025 12:24:32 +0200
Message-ID: <20250710102453.101078-1-javierm@redhat.com>
X-Mailer: git-send-email 2.49.0
MIME-Version: 1.0
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: KABbzZujcxNwg7WCLyp1xQzFla2v2BwOO6TrGHf2gUI_1752143147
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
content-type: text/plain; charset="US-ASCII"; x-default=true
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

This patch-series adds support for the Sitronix ST7567 Controller, which is is a
monochrome Dot Matrix LCD Controller that has SPI, I2C and parallel interfaces.

The st7571-i2c driver only has support for I2C so displays using other transport
interfaces are currently not supported.

The DRM_FORMAT_R1 pixel format and data commands are the same than what is used
by the ST7571 controller, so only is needed a different callback that implements
the expected initialization sequence for the ST7567 chip.

Patch #1 adds a Device Tree binding schema for the ST7567 Controller.

Patch #2 makes the "reset-gpios" property in the driver to be optional since that
isn't needed for the ST7567.

Patch #3 finally extends the st7571-i2c driver to also support the ST7567 device.


Javier Martinez Canillas (3):
  dt-bindings: display: Add Sitronix ST7567 LCD Controller
  drm/sitronix/st7571-i2c: Make the reset GPIO to be optional
  drm/sitronix/st7571-i2c: Add support for the ST7567 Controller

 .../bindings/display/sitronix,st7567.yaml     | 63 +++++++++++++++++++
 MAINTAINERS                                   |  1 +
 drivers/gpu/drm/sitronix/st7571-i2c.c         | 55 +++++++++++++++-
 3 files changed, 117 insertions(+), 2 deletions(-)
 create mode 100644 Documentation/devicetree/bindings/display/sitronix,st7567.yaml

-- 
2.49.0

base-commit: 93eacfcdfbb590d9ed6889d381d5a586dd1ac860
branch: drm-st7567

