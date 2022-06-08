Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 9E73D542096
	for <lists+dri-devel@lfdr.de>; Wed,  8 Jun 2022 03:08:51 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 24A5310E418;
	Wed,  8 Jun 2022 01:08:45 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-oi1-x22f.google.com (mail-oi1-x22f.google.com
 [IPv6:2607:f8b0:4864:20::22f])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 285EB10E418
 for <dri-devel@lists.freedesktop.org>; Wed,  8 Jun 2022 01:08:42 +0000 (UTC)
Received: by mail-oi1-x22f.google.com with SMTP id k11so26144579oia.12
 for <dri-devel@lists.freedesktop.org>; Tue, 07 Jun 2022 18:08:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=usp.br; s=usp-google;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=+J857YNMMMQ5w3bvE9jqHH7YibIuROCxLYRf6MrAtu8=;
 b=MDWHVEE5OzY2DQyQ6red2gjy4n7vHwB0kVupUVsK5YtAByOH1rcy1BcZF0I5gThZv+
 nkqWYntc7WmFACew50y/zloW9F3wE1JZ5HoLQ3mouSSvObEV1duXayqZEkqHN5kCfA4K
 RRQoNDbLG1un4AJqo84pbrHcHsKgQ1sDguHC+mU+NVdL+4+ptDJ7GTdV2cbmwevLdAmn
 NpJ/s14zJAdCCO+//dnaS1InAShvzQxwf/HUGOxvJQNiS7YNhs+dp+WPglZAhSkmS1z6
 q8tCeZkOAlqB4fXjuio19j9Rjh9X/0ZIO1xaAmHFdMotm8glE9VJWJjiILw9TTXuupaJ
 CQrw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=+J857YNMMMQ5w3bvE9jqHH7YibIuROCxLYRf6MrAtu8=;
 b=q7qm3WLb8wDji5oZ5VeZsY0NDDgQoV6L1st/U2A82mSFfrptQio1AWGSEuBKdYWe76
 8QveUXQle6gfim6TN9gqsSHySaXl58f13wxq11HAR7YCRRsXncfTUYptp50QfuI4kFqo
 8Bs/6R5Ko6gdH9SsOaXm4DjJxLplBkML3clAsuut+hITkKaTqm4ZycB5GkkkejPugpVO
 7xmssbc/Vd6itUr4SRjXh0QUYBehy/PDUTqEzwLu3AAUebXn9FytdLD7qCF8MV69azu6
 vD36nCERdQ6G0OvAPUk6DrwkNnhwJ7w4Lln30AO2yB1T63PeNtqnZFHqQ+E6+C/KyHoJ
 YVtQ==
X-Gm-Message-State: AOAM532gav17CBF2B0/ZbWUPI0Mbbo7i6GDo+ITFGgOG7VKx8SBRcxUj
 cJND6k8Z35qSPjHpf+4HVKMLVw==
X-Google-Smtp-Source: ABdhPJzaStOKqusIYDyA9WQTKYmuvCovHNIne/xhtvCG3axak5i3/Hvca/m43z48uh+Eo6XCrAYMMg==
X-Received: by 2002:a05:6808:1151:b0:32e:362f:d4b4 with SMTP id
 u17-20020a056808115100b0032e362fd4b4mr1052688oiu.244.1654650521895; 
 Tue, 07 Jun 2022 18:08:41 -0700 (PDT)
Received: from fedora.. ([2804:14d:8084:84c6:fe26:c42d:aab9:fa8a])
 by smtp.gmail.com with ESMTPSA id
 c16-20020a544e90000000b0032b1b84f4e3sm10343057oiy.22.2022.06.07.18.08.34
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 07 Jun 2022 18:08:41 -0700 (PDT)
From: =?UTF-8?q?Ma=C3=ADra=20Canal?= <maira.canal@usp.br>
To: Harry Wentland <harry.wentland@amd.com>, Leo Li <sunpeng.li@amd.com>,
 Rodrigo Siqueira <Rodrigo.Siqueira@amd.com>,
 Alex Deucher <alexander.deucher@amd.com>, christian.koenig@amd.com,
 Dmytro Laktyushkin <Dmytro.Laktyushkin@amd.com>, Jun Lei <jun.lei@amd.com>,
 Nicholas Choi <Nicholas.Choi@amd.com>,
 Harrison Chiu <harrison.chiu@amd.com>,
 Mark Yacoub <markyacoub@chromium.org>, Sean Paul <seanpaul@chromium.org>,
 Daniel Vetter <daniel@ffwll.ch>,
 Javier Martinez Canillas <javierm@redhat.com>,
 Isabella Basso <isabbasso@riseup.net>, magalilemes00@gmail.com,
 tales.aparecida@gmail.com, mwen@igalia.com, andrealmeid@riseup.net,
 David Gow <davidgow@google.com>, Daniel Latypov <dlatypov@google.com>,
 brendanhiggins@google.com
Subject: [RFC 0/3] drm/amd/display: Introduce KUnit to Display Mode Library
Date: Tue,  7 Jun 2022 22:07:07 -0300
Message-Id: <20220608010709.272962-1-maira.canal@usp.br>
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
Cc: =?UTF-8?q?Ma=C3=ADra=20Canal?= <maira.canal@usp.br>,
 kunit-dev@googlegroups.com, dri-devel@lists.freedesktop.org,
 amd-gfx@lists.freedesktop.org, linux-kernel@vger.kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

This RFC is a preview of the work being developed by Isabella Basso [1],
Maíra Canal [2], and Tales Lelo [3], as part of their Google Summer of Code
projects [4], and Magali Lemes [5], as part of her capstone project.

Our main goal is to bring unit testing to the AMDPGU driver; in particular,
we'll focus on the Display Mode Library (DML) for DCN2.0 and some of the DCE
functions. The modern AMD Linux kernel graphics driver is the single largest
driver in the mainline Linux codebase [6]. As AMD releases new GPU models,
the size of AMDGPU drivers is only becoming even larger.

Assuring the drivers' quality and reliability becomes a complex task without
systematic testing, especially for graphic drivers - which usually involve
tons of complex calculations. Also, keeping bugs away becomes an increasingly
hard task with the introduction of new code. Moreover, developers might want
to refactor old code without fear of the introduction of new issues.

In that sense, it is possible to argue for the benefits of implementing unit
testing at the AMDGPU drivers. This implementation will help developers to
recognize bugs before they are merged into the mainline and also makes it
possible for future code refactors of the AMDGPU driver.

When analyzing the AMDGPU driver, a particular part of the driver highlights
itself as a good candidate for the implementation of unit tests: the Display
Mode Library (DML), as it is focused on mathematical operations.

For the implementation of the tests, we decided to go with the Kernel Unit
Testing Framework (KUnit). KUnit makes it possible to run test suites on
kernel boot or load the tests as a module. It reports all test case results
through a TAP (Test Anything Protocol) in the kernel log.

Moreover, KUnit unifies the test structure and provides tools to simplify the
testing for developers and CI systems.

That said, we developed a little snippet on what we intend to develop in our
summer. We planned the basic structure on how the tests will be introduced
into the codebase and, on the concern of the CI systems, developed a structure
where the unit tests can be introduced as modules and run on IGT (the IGT patch
will be introduced soon).

The way the modules are implemented might seem a little unusual for KUnit
developers. We need to call the KUnit init function inside the AMDGPU stack,
otherwise, the test won't compile as a module. So, the solution to this
problem was based on the unit tests for the Thunderbolt driver, which uses
KUnit and also tests a physical driver.

As kunit_test_suites() defines itself as an init_module(), it conflicts with
the existing one at amdgpu_drv. So, if we use kunit_test_suites(), we won't
be able to compile the tests as modules and, therefore, won't be able to use
IGT to run the tests. This problem with kunit_test_suites() was already
discussed in the KUnit mailing list, as can be seen in [7].

The first patch configures the basic structure of the KUnit Tests, setting the
proper Makefile, Kconfig, and init function. It also contains a simple test
involving DML logging, which is the pretext for building the testing structure.

The second patch adds KUnit tests to bw_fixed functions. This patch represents
what we intend to do on the rest of the DML modules: systematic testing of the
public functions of the DML, especially mathematically complicated functions.
Also, it shows how simple it is to add new tests to the DML with the structure
we built.

Any feedback or ideas for the project are welcome!

[1] https://crosscat.me
[2] https://mairacanal.github.io
[3] https://tales-aparecida.github.io/
[4] https://summerofcode.withgoogle.com/programs/2022/organizations/xorg-foundation
[5] https://magalilemes.github.io/
[6] https://www.phoronix.com/scan.php?page=news_item&px=AMDGPU-Closing-4-Million
[7] https://groups.google.com/g/kunit-dev/c/hbJbh8L37FU/m/EmszZE9qBAAJ

- Isabella Basso, Magali Lemes, Maíra Canal, and Tales Lelo

Magali Lemes (1):
  drm/amd/display: Introduce KUnit tests to the bw_fixed library

Maíra Canal (2):
  drm/amd/display: Introduce KUnit to DML
  drm/amd/display: Move bw_fixed macros to header file

 drivers/gpu/drm/amd/display/Kconfig           |   1 +
 .../gpu/drm/amd/display/amdgpu_dm/Makefile    |   5 +
 .../gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c |   3 +
 .../gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.h |   3 +
 .../drm/amd/display/amdgpu_dm/tests/Kconfig   |  41 +++
 .../drm/amd/display/amdgpu_dm/tests/Makefile  |  18 +
 .../amdgpu_dm/tests/calcs/bw_fixed_test.c     | 322 ++++++++++++++++++
 .../amdgpu_dm/tests/display_mode_lib_test.c   |  83 +++++
 .../amd/display/amdgpu_dm/tests/dml_test.c    |  26 ++
 .../amd/display/amdgpu_dm/tests/dml_test.h    |  21 ++
 .../drm/amd/display/dc/dml/calcs/bw_fixed.c   |  14 +-
 drivers/gpu/drm/amd/display/dc/inc/bw_fixed.h |  14 +
 12 files changed, 538 insertions(+), 13 deletions(-)
 create mode 100644 drivers/gpu/drm/amd/display/amdgpu_dm/tests/Kconfig
 create mode 100644 drivers/gpu/drm/amd/display/amdgpu_dm/tests/Makefile
 create mode 100644 drivers/gpu/drm/amd/display/amdgpu_dm/tests/calcs/bw_fixed_test.c
 create mode 100644 drivers/gpu/drm/amd/display/amdgpu_dm/tests/display_mode_lib_test.c
 create mode 100644 drivers/gpu/drm/amd/display/amdgpu_dm/tests/dml_test.c
 create mode 100644 drivers/gpu/drm/amd/display/amdgpu_dm/tests/dml_test.h

-- 
2.36.1

