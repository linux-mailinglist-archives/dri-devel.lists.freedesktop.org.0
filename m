Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id F1B2F5499A3
	for <lists+dri-devel@lfdr.de>; Mon, 13 Jun 2022 19:17:53 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 635A810E5BF;
	Mon, 13 Jun 2022 17:17:49 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-x333.google.com (mail-wm1-x333.google.com
 [IPv6:2a00:1450:4864:20::333])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 457B510E58C
 for <dri-devel@lists.freedesktop.org>; Mon, 13 Jun 2022 17:17:48 +0000 (UTC)
Received: by mail-wm1-x333.google.com with SMTP id
 x6-20020a1c7c06000000b003972dfca96cso3475122wmc.4
 for <dri-devel@lists.freedesktop.org>; Mon, 13 Jun 2022 10:17:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=pND07IjUi7Nx4XC5+/AEJ436yBfHgMDn/iUw0DqnEmg=;
 b=UsJF7TH60A7l1RZn8ij0aH+0Cb9cxMAvucUlaQ7stS5YRrsZem6rXXWIGD1eH/eQOq
 xSIZ864+UWhpOVq2PXc7etly3451uxTOdQ2VuqRCG2OBDDnknPr1w4bwFG/GEZtMQ5NA
 8IkL4zi6qxZ5d0mTaBkNbu9rWt+sQZrnHVoofGR9tqPbPe7azOZgwbF33AicgX3OiZRG
 IuJv3QYQhSBxeDxEk7Qjsgm4HvLucFuMydOI/0ryZ6hiFz4G9bINup2eF1kqlTC8QMB+
 nG6UCqFdZnienPgdZfEBo99xHwrv0BowjhYq15uGdvznL4PCxwlY/hWn8DTCoc1zeWhD
 aDsw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=pND07IjUi7Nx4XC5+/AEJ436yBfHgMDn/iUw0DqnEmg=;
 b=0eDVVhUTGka9KIbpk34vKhOhActa3jSe0tV7et3fEdj3BDLw+b+sae9cuZlUpM4qf1
 ysa+LPBwhZfqcukBMypQrKTaWa6NK3GgR0CoB0rxSNmwxM6m1jzHmU+HsOLGbZeCYJr8
 BYFX0Udxqb5CPiRMLkqL5n443a97hSsERZDWTXLOxWY4xcl6Tx3qFWHweUoCj3t4Hptz
 yUpyyLk40JjW8IH2mfPX7TOwb7TUhzAHmp14NC5fNkObZzXbFwtNm9hV75RAd2UmtkNx
 NXaY3hR6b5YOg+E2BQFrHxgaL8KXDwua79WPKXIoiLEubJao3Hz9qQ0iBgGn9n7obVtL
 /ueA==
X-Gm-Message-State: AOAM530JAiYzWdoVpTuxcLWYlwTw6jriEVs54dS9Fxl2Rhwt65doHjaG
 WaYY8hQWEBY3O4tfKnCSagw=
X-Google-Smtp-Source: ABdhPJwaZorMRFk5irMBRXjwuJdiDDebX+XtYnqXQ1rbRV3iYvd5x2d9LtUgLlPVFhDdoC0ehIxIIw==
X-Received: by 2002:a05:600c:1e2a:b0:39c:51f8:80d4 with SMTP id
 ay42-20020a05600c1e2a00b0039c51f880d4mr550978wmb.192.1655140666586; 
 Mon, 13 Jun 2022 10:17:46 -0700 (PDT)
Received: from localhost.localdomain ([94.73.36.128])
 by smtp.gmail.com with ESMTPSA id
 a10-20020a056000100a00b0020d106c0386sm9016129wrx.89.2022.06.13.10.17.45
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 13 Jun 2022 10:17:45 -0700 (PDT)
From: =?UTF-8?q?Jos=C3=A9=20Exp=C3=B3sito?= <jose.exposito89@gmail.com>
To: javierm@redhat.com
Subject: [PATCH v3 0/3] KUnit tests for drm_format_helper
Date: Mon, 13 Jun 2022 19:17:35 +0200
Message-Id: <20220613171738.111013-1-jose.exposito89@gmail.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
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
Cc: dri-devel@lists.freedesktop.org, davidgow@google.com, airlied@linux.ie,
 dlatypov@google.com, linux-kernel@vger.kernel.org, tzimmermann@suse.de,
 =?UTF-8?q?Jos=C3=A9=20Exp=C3=B3sito?= <jose.exposito89@gmail.com>,
 kunit-dev@googlegroups.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hello everyone,

Here is the v3 of the series, including the documentation, previously
sent as a standalone patch [1], and changes suggested during review.

Thanks a lot,
José Expósito

RFC -> v1: https://lore.kernel.org/dri-devel/20220530102017.471865-1-jose.exposito89@gmail.com/T/

 - Add .kunitconfig (Maxime Ripard)
 - Fix memory leak (Daniel Latypov)
 - Make config option generic (Javier Martinez Canillas):
   DRM_FORMAR_HELPER_TEST -> DRM_KUNIT_TEST
 - Remove DISABLE_STRUCTLEAK_PLUGIN (Daniel Latypov)

v1 -> v2: https://lore.kernel.org/dri-devel/20220606095516.938934-1-jose.exposito89@gmail.com/T/

 Thomas Zimmermann:
 - Add DRM_RECT_INIT() macro
 - Move tests to drivers/gpu/drm/kunit
 - Improve test documentation

v2 -> v3: https://lore.kernel.org/dri-devel/20220612161248.271590-1-jose.exposito89@gmail.com/T/

 - Use designated initializer in DRM_RECT_INIT (Jani Nikula)
 - Simplify the "conversion_buf_size" helper

[1] https://lore.kernel.org/dri-devel/20220606180940.43371-1-jose.exposito89@gmail.com/T/

José Expósito (3):
  drm/rect: Add DRM_RECT_INIT() macro
  drm/format-helper: Add KUnit tests for drm_fb_xrgb8888_to_rgb332()
  drm/doc: Add KUnit documentation

 Documentation/gpu/drm-internals.rst           |  32 ++++
 drivers/gpu/drm/Kconfig                       |  16 ++
 drivers/gpu/drm/Makefile                      |   1 +
 drivers/gpu/drm/kunit/.kunitconfig            |   3 +
 drivers/gpu/drm/kunit/Makefile                |   3 +
 .../gpu/drm/kunit/drm_format_helper_test.c    | 160 ++++++++++++++++++
 include/drm/drm_rect.h                        |  16 ++
 7 files changed, 231 insertions(+)
 create mode 100644 drivers/gpu/drm/kunit/.kunitconfig
 create mode 100644 drivers/gpu/drm/kunit/Makefile
 create mode 100644 drivers/gpu/drm/kunit/drm_format_helper_test.c

-- 
2.25.1

