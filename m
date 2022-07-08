Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 2FC1056C14C
	for <lists+dri-devel@lfdr.de>; Fri,  8 Jul 2022 22:31:11 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 245A710E816;
	Fri,  8 Jul 2022 20:31:09 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-oa1-x2a.google.com (mail-oa1-x2a.google.com
 [IPv6:2001:4860:4864:20::2a])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 531FA10E831
 for <dri-devel@lists.freedesktop.org>; Fri,  8 Jul 2022 20:31:07 +0000 (UTC)
Received: by mail-oa1-x2a.google.com with SMTP id
 586e51a60fabf-10bf634bc50so73301fac.3
 for <dri-devel@lists.freedesktop.org>; Fri, 08 Jul 2022 13:31:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=usp.br; s=usp-google;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=pd8YkNDiDu3oM3vugMaeJlBRepYD2LNfA5/ZK9a8FCY=;
 b=c7GWI4FjKP8Zf4DT+zIaXhdSDSzdPiFkeJx4Z41D8JHnhBQS0IJ7/n/UDH3LXP4pGW
 M6wpzhSS/1uL3HsWMmNusieS6kd00e0ns7y2qnI1B79xIS+oQ/6BeXK3ZZoX/vEWpgjw
 kllTCIxt2V4oea6sSZ/IjQfDLU6k7gzux+hT9OU5zj35fVeFOwIzuCtpGuJ38IqXYcAX
 UFDArmYMTx1VNiP4qf9lGlYyFPgk4d8YySzZSCPIQ7F1w8S73GTkF24r9ymfFY2kiYk3
 krTuNS/jxGImaxoeAUmjH9rM01ayEH4fYglP/o5LzHFAjaSlNHs2AV4fvy/PSit4Jy2F
 HQpw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=pd8YkNDiDu3oM3vugMaeJlBRepYD2LNfA5/ZK9a8FCY=;
 b=YAECOz3xzX7/Pgw9tgs8NnzV+kYmEyTScSkDWnPdcPt2THwAJZB6+VIHZ6LkdIu2EN
 PBda2K9VcQ3bDb3+wVfHkxmXR47N/rZiJR39mCMbymAyBDYqNJjIb4ePRAm0DGmL0qZ4
 a7TorSpmMs8GvrtuPJHJrkWXSTYI2tKdInflN9kZYupu+FZdsJvDBk3Ne8A5w1rt5J1G
 8Fatbt2tfZx5yHRLYBHOZPiflE498nsYK/U/tCYYhly1tC/19OgMy5/mk3XR5jae2XIt
 V8tLoKdxB6DO9RvYuZoT2l+q49fdSWWuti+CYzeceZ6m3ZjoCIwM2zrBlRniyTPibNd5
 b/7w==
X-Gm-Message-State: AJIora/eUCifhu2X416v3eOeYcvG1ox1D1vIaaTO/SPzu/kI1/p4rG/x
 B6NR+8sSDvt4ErTg9zgJeqvkbQ==
X-Google-Smtp-Source: AGRyM1tA3sT7jHAHp1LoODm9LHVgtnfmCHw0qpHxlAVZr9PapaUwx0VSnahXFzNoP/CqRMxE9+6GPg==
X-Received: by 2002:a05:6870:339a:b0:f2:d065:be1f with SMTP id
 w26-20020a056870339a00b000f2d065be1fmr1012447oae.69.1657312266571; 
 Fri, 08 Jul 2022 13:31:06 -0700 (PDT)
Received: from fedora.. ([143.107.182.242]) by smtp.gmail.com with ESMTPSA id
 ci10-20020a05683063ca00b0061c309b1dc2sm742225otb.39.2022.07.08.13.30.58
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 08 Jul 2022 13:31:06 -0700 (PDT)
From: =?UTF-8?q?Ma=C3=ADra=20Canal?= <maira.canal@usp.br>
To: Isabella Basso <isabbasso@riseup.net>, magalilemes00@gmail.com,
 tales.aparecida@gmail.com, mwen@igalia.com, andrealmeid@riseup.net,
 siqueirajordao@riseup.net, Trevor Woerner <twoerner@gmail.com>,
 leandro.ribeiro@collabora.com, n@nfraprado.net,
 Daniel Vetter <daniel@ffwll.ch>, Shuah Khan <skhan@linuxfoundation.org>,
 David Airlie <airlied@linux.ie>, Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, michal.winiarski@intel.com,
 Javier Martinez Canillas <javierm@redhat.com>,
 =?UTF-8?q?Jos=C3=A9=20Exp=C3=B3sito?= <jose.exposito89@gmail.com>,
 David Gow <davidgow@google.com>, Daniel Latypov <dlatypov@google.com>,
 brendanhiggins@google.com
Subject: [PATCH v5 0/9] drm: selftest: Convert to KUnit
Date: Fri,  8 Jul 2022 17:30:43 -0300
Message-Id: <20220708203052.236290-1-maira.canal@usp.br>
X-Mailer: git-send-email 2.35.3
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
Cc: linux-kernel@vger.kernel.org,
 =?UTF-8?q?Ma=C3=ADra=20Canal?= <maira.canal@usp.br>,
 dri-devel@lists.freedesktop.org, linux-kselftest@vger.kernel.org,
 kunit-dev@googlegroups.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi everyone,

Here is the v5 of the conversion of selftests to KUnit. Since the v4, the only
fix was checking the checkpatch warnings and checks (Thank you Javier).

Thanks for your attention and any feedback is welcomed!

Best Regards,
- Maíra Canal

v1 -> v2: https://lore.kernel.org/dri-devel/20220615135824.15522-1-maira.canal@usp.br/T/

- The suites not longer end in _tests (David Gow).
- Remove the TODO entry involving the conversion of selftests to KUnit (Javier Martinez Canillas).
- Change the filenames to match the documentation: use *_test.c (Javier Martinez Canillas).
- Add MODULE_LICENSE to all tests (kernel test robot).
- Make use of a generic symbol to group all tests - DRM_KUNIT_TEST (Javier Martinez Canillas).
- Add .kunitconfig on the first patch (it was on the second patch of the series).
- Straightforward conversion of the drm_cmdline_parser tests without functional changes (Shuah Khan)
- Add David's Tested-by tags.

v2 -> v3: https://lore.kernel.org/dri-devel/20220621200926.257002-1-maira.canal@usp.br/

- Rebase it on top of the drm-misc-next with drm_format_helper KUnit tests.
- Change KUNIT_EXPECT_FALSE to KUNIT_EXPECT_EQ on drm_format_test (Daniel Latypov).
- Add Daniel's Acked-by tag.

v3 -> v4: https://lore.kernel.org/dri-devel/9185aadb-e459-00fe-70be-3675f6f3ef4c@redhat.com/T/

- Add blank line after #include <kunit/test.h>  (Javier Martinez Canillas).
- Make the order of the tags chronological  (Javier Martinez Canillas).
- Add Copywrite to the tests (Javier Martinez Canillas).
- Add  Javier Martinez Canillas's Reviewed-By tag.

v4 -> v5: https://lore.kernel.org/dri-devel/20220702131116.457444-1-maira.canal@usp.br/T/

- Fix checkpatch warnings and checks (Javier Martinez Canillas).

Arthur Grillo (1):
  drm: selftest: convert drm_mm selftest to KUnit

Maíra Canal (8):
  drm: selftest: convert drm_damage_helper selftest to KUnit
  drm: selftest: convert drm_cmdline_parser selftest to KUnit
  drm: selftest: convert drm_rect selftest to KUnit
  drm: selftest: convert drm_format selftest to KUnit
  drm: selftest: convert drm_plane_helper selftest to KUnit
  drm: selftest: convert drm_dp_mst_helper selftest to KUnit
  drm: selftest: convert drm_framebuffer selftest to KUnit
  drm: selftest: convert drm_buddy selftest to KUnit

 Documentation/gpu/todo.rst                    |   11 -
 drivers/gpu/drm/Kconfig                       |   20 +-
 drivers/gpu/drm/Makefile                      |    1 -
 drivers/gpu/drm/selftests/Makefile            |    8 -
 .../gpu/drm/selftests/drm_buddy_selftests.h   |   15 -
 .../gpu/drm/selftests/drm_cmdline_selftests.h |   68 -
 drivers/gpu/drm/selftests/drm_mm_selftests.h  |   28 -
 .../gpu/drm/selftests/drm_modeset_selftests.h |   40 -
 drivers/gpu/drm/selftests/drm_selftest.c      |  109 --
 drivers/gpu/drm/selftests/drm_selftest.h      |   41 -
 drivers/gpu/drm/selftests/test-drm_buddy.c    |  994 -------------
 .../drm/selftests/test-drm_cmdline_parser.c   | 1141 ---------------
 .../drm/selftests/test-drm_damage_helper.c    |  668 ---------
 drivers/gpu/drm/selftests/test-drm_format.c   |  280 ----
 .../drm/selftests/test-drm_modeset_common.c   |   32 -
 .../drm/selftests/test-drm_modeset_common.h   |   52 -
 drivers/gpu/drm/selftests/test-drm_rect.c     |  223 ---
 drivers/gpu/drm/tests/Makefile                |    4 +-
 drivers/gpu/drm/tests/drm_buddy_test.c        |  756 ++++++++++
 .../gpu/drm/tests/drm_cmdline_parser_test.c   | 1078 ++++++++++++++
 .../gpu/drm/tests/drm_damage_helper_test.c    |  634 +++++++++
 .../drm_dp_mst_helper_test.c}                 |   89 +-
 drivers/gpu/drm/tests/drm_format_test.c       |  287 ++++
 .../drm_framebuffer_test.c}                   |   77 +-
 .../test-drm_mm.c => tests/drm_mm_test.c}     | 1248 +++++++----------
 .../drm_plane_helper_test.c}                  |  122 +-
 drivers/gpu/drm/tests/drm_rect_test.c         |  214 +++
 27 files changed, 3652 insertions(+), 4588 deletions(-)
 delete mode 100644 drivers/gpu/drm/selftests/Makefile
 delete mode 100644 drivers/gpu/drm/selftests/drm_buddy_selftests.h
 delete mode 100644 drivers/gpu/drm/selftests/drm_cmdline_selftests.h
 delete mode 100644 drivers/gpu/drm/selftests/drm_mm_selftests.h
 delete mode 100644 drivers/gpu/drm/selftests/drm_modeset_selftests.h
 delete mode 100644 drivers/gpu/drm/selftests/drm_selftest.c
 delete mode 100644 drivers/gpu/drm/selftests/drm_selftest.h
 delete mode 100644 drivers/gpu/drm/selftests/test-drm_buddy.c
 delete mode 100644 drivers/gpu/drm/selftests/test-drm_cmdline_parser.c
 delete mode 100644 drivers/gpu/drm/selftests/test-drm_damage_helper.c
 delete mode 100644 drivers/gpu/drm/selftests/test-drm_format.c
 delete mode 100644 drivers/gpu/drm/selftests/test-drm_modeset_common.c
 delete mode 100644 drivers/gpu/drm/selftests/test-drm_modeset_common.h
 delete mode 100644 drivers/gpu/drm/selftests/test-drm_rect.c
 create mode 100644 drivers/gpu/drm/tests/drm_buddy_test.c
 create mode 100644 drivers/gpu/drm/tests/drm_cmdline_parser_test.c
 create mode 100644 drivers/gpu/drm/tests/drm_damage_helper_test.c
 rename drivers/gpu/drm/{selftests/test-drm_dp_mst_helper.c => tests/drm_dp_mst_helper_test.c} (72%)
 create mode 100644 drivers/gpu/drm/tests/drm_format_test.c
 rename drivers/gpu/drm/{selftests/test-drm_framebuffer.c => tests/drm_framebuffer_test.c} (86%)
 rename drivers/gpu/drm/{selftests/test-drm_mm.c => tests/drm_mm_test.c} (55%)
 rename drivers/gpu/drm/{selftests/test-drm_plane_helper.c => tests/drm_plane_helper_test.c} (57%)
 create mode 100644 drivers/gpu/drm/tests/drm_rect_test.c

-- 
2.35.3

