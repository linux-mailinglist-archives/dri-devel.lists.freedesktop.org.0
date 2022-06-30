Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D2262560E32
	for <lists+dri-devel@lfdr.de>; Thu, 30 Jun 2022 02:48:29 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1165D10EDBF;
	Thu, 30 Jun 2022 00:48:25 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-oi1-x232.google.com (mail-oi1-x232.google.com
 [IPv6:2607:f8b0:4864:20::232])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 49E5110EDBF
 for <dri-devel@lists.freedesktop.org>; Thu, 30 Jun 2022 00:48:23 +0000 (UTC)
Received: by mail-oi1-x232.google.com with SMTP id w193so23961036oie.5
 for <dri-devel@lists.freedesktop.org>; Wed, 29 Jun 2022 17:48:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=usp.br; s=usp-google;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=mykVnHbeQW+l2iyfJ8F9xbjt9jbjgY1NaySMWjFVNdA=;
 b=SYYqtfaV+J0RLCvkkk/a9fdo29MnKGSyuNNR2kuiUSmO9JijEQy0e5g9+7G+Hc02Rx
 9sm8c+oXBsXlugFOXZbgsCd/QYwEi4KfvtjrBUzieSNegEMIhh5Qb2HQMLxKFhgRB7BR
 W8nYqftgfUOMKm6asj/4LEwth5sUWG3UqRroiMATlYUnWGXz73psYxbpGhmPS7W5lcuO
 csEEjtbN8wI/3KNpsKTw/V3FnDc0gyxuFVF+kgDpVybmwPO/3yA5dwYpU2N6H6flxDAv
 BJNrOJI/yzlHFsAuSW4GhMs0z3sK0y+RPuqvUuar2n7ci60OGkNVZHEFKBTOQ1JoI8B6
 kQEw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=mykVnHbeQW+l2iyfJ8F9xbjt9jbjgY1NaySMWjFVNdA=;
 b=5anriaLgYJQiFsvT6JgrjxxPp9CyS1kmQAk1sbT6ZvlocabAmR9rdu0BrxFGQIycu7
 k6osIbAQp1YhH+8Sg8sFQ/FmcmnJBcZwxLw8u+qaeyBE4zoopL29XKZRk0V/VDHhZkLF
 MYNrT+qOIjwcTCjXtZSQryXTMSoiW92gQFJdS9EksK6T5AHPt7MArjoYebqd8lK4pKAl
 iVYKLPKaDihR7D1nvrJXbJ/H2GxW+3yP3IuWHhJMZrFOSrrtmfDxbAIP+KaO0Ksv/Blv
 soQnXVyUkxnzw7cTYUMEq6O9Jk3BqijklcwwOfSzxaEW51RRDvFsULIOPxAxkQwAWAcc
 Thzw==
X-Gm-Message-State: AJIora/GSDXGEnJYC8RhKkr6uaem/6hqLF3hJAUKkqYSSnri9NsjLFzO
 b5HBZcEGfBA1IL91xx5Rxv8L7g==
X-Google-Smtp-Source: AGRyM1sibQLdY4N/mA26soxLDUODr85LQ5WOxUWO6HI0OSdsiYNA7dsU+++hKEvK8hkCSc3hv0boiw==
X-Received: by 2002:aca:786:0:b0:32e:3005:813a with SMTP id
 128-20020aca0786000000b0032e3005813amr3963536oih.135.1656550102903; 
 Wed, 29 Jun 2022 17:48:22 -0700 (PDT)
Received: from fedora.. ([2804:14d:8084:84c6:fe26:c42d:aab9:fa8a])
 by smtp.gmail.com with ESMTPSA id
 r10-20020a056808210a00b00325cda1ff8esm9432250oiw.13.2022.06.29.17.48.16
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 29 Jun 2022 17:48:22 -0700 (PDT)
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
Subject: [PATCH v3 0/9] drm: selftest: Convert to KUnit
Date: Wed, 29 Jun 2022 21:46:02 -0300
Message-Id: <20220630004611.114441-1-maira.canal@usp.br>
X-Mailer: git-send-email 2.36.1
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

Here is the v3 of the conversion of selftests to KUnit. Since the v2, there
have been minor fixes. drm_format_test received the biggest change: the
KUNIT_EXPECT_FALSE and KUNIT_EXPECT_TRUE macros were changed to KUNIT_EXPECT_EQ,
as suggested by Daniel.

Most of all, the patches were rebased on top of the recently applied patches
for drm_format_helper tests (8f456104915f), in order to avoid conflicts when
applying the tests.

Thanks for your attention and any feedback is welcomed!

Best Regards,
- Maíra Canal

v1 -> v2: https://lore.kernel.org/dri-devel/20220615135824.15522-1-maira.canal@usp.br/T/

- The suites not longer end in _tests (David Gow).
- Remove the TODO entry involving the conversion of selftests to KUnit (Javier
Martinez Canillas).
- Change the filenames to match the documentation: use *_test.c (Javier Martinez
Canillas).
- Add MODULE_LICENSE to all tests (kernel test robot).
- Make use of a generic symbol to group all tests - DRM_KUNIT_TEST (Javier
Martinez Canillas).
- Add .kunitconfig on the first patch (it was on the second patch of the series).
- Straightforward conversion of the drm_cmdline_parser tests without functional
changes (Shuah Khan).
- Add David's Tested-by tags.

v2 -> v3: https://lore.kernel.org/dri-devel/20220621200926.257002-1-maira.canal@usp.br/

- Rebase it on top of the drm-misc-next with drm_format_helper KUnit tests.
- Change KUNIT_EXPECT_FALSE to KUNIT_EXPECT_EQ on drm_format_test (Daniel Latypov).
- Add Daniel's Acked-by tag.

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
 drivers/gpu/drm/selftests/test-drm_buddy.c    |  994 --------------
 .../drm/selftests/test-drm_cmdline_parser.c   | 1141 -----------------
 .../drm/selftests/test-drm_damage_helper.c    |  668 ----------
 drivers/gpu/drm/selftests/test-drm_format.c   |  280 ----
 .../drm/selftests/test-drm_modeset_common.c   |   32 -
 .../drm/selftests/test-drm_modeset_common.h   |   52 -
 drivers/gpu/drm/tests/Makefile                |    4 +-
 drivers/gpu/drm/tests/drm_buddy_test.c        |  748 +++++++++++
 .../gpu/drm/tests/drm_cmdline_parser_test.c   | 1078 ++++++++++++++++
 .../gpu/drm/tests/drm_damage_helper_test.c    |  634 +++++++++
 .../drm_dp_mst_helper_test.c}                 |   84 +-
 drivers/gpu/drm/tests/drm_format_test.c       |  284 ++++
 .../drm_framebuffer_test.c}                   |   25 +-
 .../test-drm_mm.c => tests/drm_mm_test.c}     | 1135 +++++++---------
 .../drm_plane_helper_test.c}                  |  103 +-
 .../test-drm_rect.c => tests/drm_rect_test.c} |  124 +-
 26 files changed, 3385 insertions(+), 4342 deletions(-)
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
 create mode 100644 drivers/gpu/drm/tests/drm_buddy_test.c
 create mode 100644 drivers/gpu/drm/tests/drm_cmdline_parser_test.c
 create mode 100644 drivers/gpu/drm/tests/drm_damage_helper_test.c
 rename drivers/gpu/drm/{selftests/test-drm_dp_mst_helper.c => tests/drm_dp_mst_helper_test.c} (73%)
 create mode 100644 drivers/gpu/drm/tests/drm_format_test.c
 rename drivers/gpu/drm/{selftests/test-drm_framebuffer.c => tests/drm_framebuffer_test.c} (96%)
 rename drivers/gpu/drm/{selftests/test-drm_mm.c => tests/drm_mm_test.c} (58%)
 rename drivers/gpu/drm/{selftests/test-drm_plane_helper.c => tests/drm_plane_helper_test.c} (62%)
 rename drivers/gpu/drm/{selftests/test-drm_rect.c => tests/drm_rect_test.c} (53%)

-- 
2.36.1

