Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 7768B5521D5
	for <lists+dri-devel@lfdr.de>; Mon, 20 Jun 2022 18:06:53 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F015B10E052;
	Mon, 20 Jun 2022 16:06:49 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x42a.google.com (mail-wr1-x42a.google.com
 [IPv6:2a00:1450:4864:20::42a])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AB62610E03F
 for <dri-devel@lists.freedesktop.org>; Mon, 20 Jun 2022 16:06:48 +0000 (UTC)
Received: by mail-wr1-x42a.google.com with SMTP id o16so15332570wra.4
 for <dri-devel@lists.freedesktop.org>; Mon, 20 Jun 2022 09:06:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=lg3ipiFQfydsWyAiWbeBt+zNJSN4+YJgCL2RNA61+gA=;
 b=gid0i80f9EvBzSgeZqk4RJxFFKLu1jA+LglKxOnYvBD82Q20hpZ8eRlhP0pv4Md/bg
 pseQrJxdoYJ4aikuzaDclk6NEt7B9j8EXka0anuCG5I0PrwhRFUE//bu/ijEtJmXZ7Wy
 ncEwL+a/0RkFqAgO5tEQo0v7dJLUC5+40KaCW6t7bPmzQjcInldQYDmMF5yLNLaFuaOu
 +4ev3iHQSdVelpHl1/MtpcQGFt79MR1qxCrwSgbvZ/Q7QmTYroqqka/zgh3Ry2hWcFFA
 0dJaaig2x4IJImS7QIChXxiHaOXw0sqErBVoi0IgOtFcsIQCri73lEpHmr5xK1QzJh0c
 tk6Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=lg3ipiFQfydsWyAiWbeBt+zNJSN4+YJgCL2RNA61+gA=;
 b=wLRgHref4TXe5LWSTNJrGSly4B4i2JYDJ0FKTW58prj/YvMcoS2g+ZqHiqphMtlurO
 PhureyTE7ijcRFFg3dtM2vNYyHZI4pJeiSxjlULN0arojgNsGfb/X+EcYBfQrjV3F8Do
 Qlgx/QWBYYjwtcbSrGRuTemaicoxnuo2rQlvPEJH8pFXODVC2Jn9HqHB1AydtnynKJMy
 iLodCpb94Jirz/44Bk0+bpqU7U3iHtKq52rN1An89xy9lzvPKFR1G0XUbFRGlUt3cu3y
 GrdNxsFvNE/D4cmZrJwUpV+UnCl5TNdBY5F7bJND1h92DgtBk3M7X0PXBNchejgcNZea
 48VQ==
X-Gm-Message-State: AJIora+Lh9QsfvfbNLAFdSrLE13WXruFJFUzAzVyYzRkdAp1bP84zofq
 fThTL7H+rVhjtSA3ImECOZI=
X-Google-Smtp-Source: AGRyM1tzn+SF6ChwEcxH3JHDBmTgOCpsJFCyvsaq1Ad8QH684/qCuoBFyH3Ljhl2le4AnKJSmHlduA==
X-Received: by 2002:a5d:4243:0:b0:21b:8483:31d with SMTP id
 s3-20020a5d4243000000b0021b8483031dmr13943734wrr.691.1655741204157; 
 Mon, 20 Jun 2022 09:06:44 -0700 (PDT)
Received: from localhost.localdomain ([94.73.36.128])
 by smtp.gmail.com with ESMTPSA id
 h14-20020a5d430e000000b0021b90cc66a1sm2986096wrq.2.2022.06.20.09.06.43
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 20 Jun 2022 09:06:43 -0700 (PDT)
From: =?UTF-8?q?Jos=C3=A9=20Exp=C3=B3sito?= <jose.exposito89@gmail.com>
To: javierm@redhat.com
Subject: [PATCH v4 0/3] KUnit tests for drm_format_helper
Date: Mon, 20 Jun 2022 18:06:37 +0200
Message-Id: <20220620160640.3790-1-jose.exposito89@gmail.com>
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
Cc: dri-devel@lists.freedesktop.org, davidgow@google.com,
 magalilemes00@gmail.com, airlied@linux.ie, maira.canal@usp.br,
 dlatypov@google.com, linux-kernel@vger.kernel.org,
 =?UTF-8?q?Jos=C3=A9=20Exp=C3=B3sito?= <jose.exposito89@gmail.com>,
 tzimmermann@suse.de, tales.aparecida@gmail.com, isabbasso@riseup.net,
 kunit-dev@googlegroups.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hello everyone,

Following the style used in the selftest to KUnit series [1] and the AMD
series [2], the tests were moved to the "tests" folder.
In addition, to be consistent naming functions, I renamed the
kunit_suite and the test cases to use underscores as suggested in [3].

It is not clear yet whether we want to have one or multiple Kconfig
symbols and select which test should be built. However, refactoring from
one approach to the other is quite simple, so I think we should be fine
choosing the simpler option now and refactoring if required.

Thanks a lot,
José Expósito

[1] https://lore.kernel.org/dri-devel/20220615135824.15522-1-maira.canal@usp.br/T/
[2] https://lore.kernel.org/dri-devel/20220608010709.272962-1-maira.canal@usp.br/
[3] https://www.kernel.org/doc/html/latest/dev-tools/kunit/style.html

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

v3 -> v4: https://lore.kernel.org/dri-devel/20220616183852.GA12343@elementary/T/

 - Move the source to the "tests" folder
 - Use "_" in kunit_suite and cases:
   https://www.kernel.org/doc/html/latest/dev-tools/kunit/style.html
 - Reviewed-by and Acked-by tags

José Expósito (3):
  drm/rect: Add DRM_RECT_INIT() macro
  drm/format-helper: Add KUnit tests for drm_fb_xrgb8888_to_rgb332()
  drm/doc: Add KUnit documentation

 Documentation/gpu/drm-internals.rst           |  32 ++++
 drivers/gpu/drm/Kconfig                       |  16 ++
 drivers/gpu/drm/Makefile                      |   1 +
 drivers/gpu/drm/tests/.kunitconfig            |   3 +
 drivers/gpu/drm/tests/Makefile                |   3 +
 .../gpu/drm/tests/drm_format_helper_test.c    | 161 ++++++++++++++++++
 include/drm/drm_rect.h                        |  16 ++
 7 files changed, 232 insertions(+)
 create mode 100644 drivers/gpu/drm/tests/.kunitconfig
 create mode 100644 drivers/gpu/drm/tests/Makefile
 create mode 100644 drivers/gpu/drm/tests/drm_format_helper_test.c

-- 
2.25.1

