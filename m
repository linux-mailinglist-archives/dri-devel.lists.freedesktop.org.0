Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 6365E63F365
	for <lists+dri-devel@lfdr.de>; Thu,  1 Dec 2022 16:14:55 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 661DD10E5E1;
	Thu,  1 Dec 2022 15:14:49 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from new4-smtp.messagingengine.com (new4-smtp.messagingengine.com
 [66.111.4.230])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2F9B110E14B
 for <dri-devel@lists.freedesktop.org>; Thu,  1 Dec 2022 15:14:43 +0000 (UTC)
Received: from compute6.internal (compute6.nyi.internal [10.202.2.47])
 by mailnew.nyi.internal (Postfix) with ESMTP id 73DC858026A;
 Thu,  1 Dec 2022 10:14:40 -0500 (EST)
Received: from mailfrontend2 ([10.202.2.163])
 by compute6.internal (MEProxy); Thu, 01 Dec 2022 10:14:40 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cerno.tech; h=cc
 :cc:content-transfer-encoding:content-type:date:date:from:from
 :in-reply-to:message-id:mime-version:reply-to:sender:subject
 :subject:to:to; s=fm2; t=1669907680; x=1669914880; bh=DTOyFy9mgY
 6K0EmS3p5o015O+QaYiDsF9aJUFI4jKho=; b=gFsDqtWcwGD8wM2YLWHsusuQ6f
 7cyVd58FEIdFJz/nXZbXwRGlY4KT5y0nqspUIr22+HPZG+ImenU2xO/ijQUZmqP+
 YI9S5dONVf/CiG48qlvBdc308bHUCa5TZdwtmQD+2/54ZHrvpci/5zaKZuStMKlf
 5ejBeoou7dtCAl8Zh8Zbu4pusEdM1qtXsolwyvP0j/0g522xN6uC/VBCPCIDJxUC
 lUzRqIm/aU/p8d1Lwu1mJHUTdBsRhNNDzSfrbdAoJrJRfSuV6hCw5aUrFGpDscpR
 r4Po0ZR3d4qJ1R46/m0D2S7nRPpl8rpoR0zV7EtyGykkwGXLRBe8E2oK4f6g==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:cc:content-transfer-encoding
 :content-type:date:date:feedback-id:feedback-id:from:from
 :in-reply-to:message-id:mime-version:reply-to:sender:subject
 :subject:to:to:x-me-proxy:x-me-proxy:x-me-sender:x-me-sender
 :x-sasl-enc; s=fm1; t=1669907680; x=1669914880; bh=DTOyFy9mgY6K0
 EmS3p5o015O+QaYiDsF9aJUFI4jKho=; b=rcPIMGLiSVI31GkQoa3NLrTIbqYMK
 P/Ld8m/3k+pFSNMOG3Q+z/ACoO9Hf9jAMnJE4Nwq2evHQHQKue7HeMDyNHd0r/D1
 Th3yl9+AYcXfpWCVOKhTNu1BDkD/sve+57PumKzqLAMcjD6slsRkyvJGDPoPfgTl
 psSDQuS7o1ulbgP+vX8nvI4XnKvKPUkO31mkAGErcroeM8cJRC0QO4QP+iUP6KiR
 apdMcijhZFhtVJp9EmeUPc17RF3x5t7PbqOI5IUZJXh0WIObuO6RGAK9Za+VmoDz
 iwvYFnRjAFVrenNWzJLwxlIB7p1E+QRoSbBLGOfvPf12I4sTu3/Rp9VQA==
X-ME-Sender: <xms:38SIY19kIQt1m6KnSXalUn_5vWvqszRGrCoXMUEdlxVBJUmKybjF0A>
 <xme:38SIY5sy7-4p1UyLgRMe-LhSdrCM1DsB0YwEyYRN5crA2pMfOo7ARWtwSor0PXwil
 cBdlInvDw6a6FeVDTE>
X-ME-Received: <xmr:38SIYzAmlKuCA7Nq8BlUkYtaIZCBi-7iojjTzG5mYDhiZovNxRJtr0SwejkXg6jQ3ub6EYoBsRYXPx1YayripmVbz4p3TFBbFwn5AR0HbIFF7Q>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvhedrtdehgdejhecutefuodetggdotefrodftvf
 curfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfghnecu
 uegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenuc
 fjughrpefugggtgffhfffkvfevofesthekredtredtjeenucfhrhhomhepofgrgihimhgv
 ucftihhprghrugcuoehmrgigihhmvgestggvrhhnohdrthgvtghhqeenucggtffrrghtth
 gvrhhnpeelueevteetffdvveelgfffleegudeufeelveefvddugeehkeefkeehjeeikeeg
 udenucffohhmrghinhepkhgvrhhnvghlrdhorhhgnecuvehluhhsthgvrhfuihiivgeptd
 enucfrrghrrghmpehmrghilhhfrhhomhepmhgrgihimhgvsegtvghrnhhordhtvggthh
X-ME-Proxy: <xmx:38SIY5fOhkF77oKPr4rQxgZV_gtr6berdqXWn5Qsau22fxPfenKCrw>
 <xmx:38SIY6NkeaUC2Wq5mjLFGBH5PCTHBUm4c4mL5VTlluGU-zuOAN_OPg>
 <xmx:38SIY7nnRCYX6GgztTOP2uw_Y1Qh-dvKO-ZKf25ZTaYaiYSM-9WnUQ>
 <xmx:4MSIYyN_yOKAKE3q8H4m2CLZJXEAToTtLrW67twN1WoZ8e5gmU6Wgw>
Feedback-ID: i8771445c:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Thu,
 1 Dec 2022 10:14:38 -0500 (EST)
Subject: [PATCH v3 00/20] drm: Introduce Kunit Tests to VC4
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-b4-tracking: H4sIACPEiGMC/4XNTQrCMBAF4KuUrB3Jj22jK+8hLibtaIMlkSQNSOndHdy5EFfDe/C+WUWm5CmLU7
 OKRNVnHwMHs2vEMGG4E/iRs9BSa6W0gfT08FiCL1Aolwy2R2Pt4aixN4JXDjOBSxiGiXdhmWcuJ59L
 TK/Pl6r4XH6DVYEE2SqUznUSVXceKIW4L8TilbGq/wCaAbpRS2OrrOvMF7Bt2xvyO93N9QAAAA==
From: Maxime Ripard <maxime@cerno.tech>
Date: Thu, 01 Dec 2022 16:11:31 +0100
Message-Id: <20221123-rpi-kunit-tests-v3-0-4615a663a84a@cerno.tech>
To: Maxime Ripard <mripard@kernel.org>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Daniel Vetter <daniel@ffwll.ch>, Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>
X-Mailer: b4 0.10.1
X-Developer-Signature: v=1; a=openpgp-sha256; l=6304; i=maxime@cerno.tech;
 h=from:subject:message-id; bh=QwXN0BjifN+XFp8m2Z2UT3ezZprFcYlKKcC3I7smYoY=;
 b=owGbwMvMwCX2+D1vfrpE4FHG02pJDMkdR9STn567vySxepHlycyjTuISc5wn7NZbVXZ+Um6Cx787
 ckITOkpZGMS4GGTFFFlihM2XxJ2a9bqTjW8ezBxWJpAhDFycAjCRmHJGhg8LuT3yO+MaCpw+mHSkiN
 U6vmFVE7qpw3Kq5LL9jtQ71gz/Cw+d0VvI0XT47sR9/2/UCx5/cmWblevnsCNtb6NakrR6OQA=
X-Developer-Key: i=maxime@cerno.tech; a=openpgp;
 fpr=BE5675C37E818C8B5764241C254BCFC56BF6CE8D
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
Cc: David Gow <davidgow@google.com>, Dave Stevenson <dave.stevenson@raspberrypi.com>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Maíra Canal <mcanal@igalia.com>, Javier Martinez Canillas <javierm@redhat.com>, dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org, linaro-mm-sig@lists.linaro.org, Brendan Higgins <brendan.higgins@linux.dev>, Maxime Ripard <maxime@cerno.tech>, linux-kselftest@vger.kernel.org, kunit-dev@googlegroups.com, Maíra Canal <mairacanal@riseup.net>, linux-media@vger.kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi,

This series introduce Kunit tests to the vc4 KMS driver, but unlike what we
have been doing so far in KMS, it actually tests the atomic modesetting code.

In order to do so, I've had to improve a fair bit on the Kunit helpers already
found in the tree in order to register a full blown and somewhat functional KMS
driver.

It's of course relying on a mock so that we can test it anywhere. The mocking
approach created a number of issues, the main one being that we need to create
a decent mock in the first place, see patch 22. The basic idea is that I
created some structures to provide a decent approximation of the actual
hardware, and that would support both major architectures supported by vc4.

This is of course meant to evolve over time and support more tests, but I've
focused on testing the HVS FIFO assignment code which is fairly tricky (and the
tests have actually revealed one more bug with our current implementation). I
used to have a userspace implementation of those tests, where I would copy and
paste the kernel code and run the tests on a regular basis. It's was obviously
fairly suboptimal, so it seemed like the perfect testbed for that series.

It can be run using:
./tools/testing/kunit/kunit.py run \
        --kunitconfig=drivers/gpu/drm/vc4/tests/.kunitconfig \
        --cross_compile aarch64-linux-gnu- --arch arm64

Let me know what you think,
Maxime

To: David Airlie <airlied@gmail.com>
To: Daniel Vetter <daniel@ffwll.ch>
To: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>
To: Maxime Ripard <mripard@kernel.org>
To: Thomas Zimmermann <tzimmermann@suse.de>
Cc: Dave Stevenson <dave.stevenson@raspberrypi.com>
Cc: Javier Martinez Canillas <javierm@redhat.com>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: Maíra Canal <mairacanal@riseup.net>
Cc: Brendan Higgins <brendan.higgins@linux.dev>
Cc: David Gow <davidgow@google.com>
Cc: linux-kselftest@vger.kernel.org
Cc: kunit-dev@googlegroups.com
Cc: dri-devel@lists.freedesktop.org
Cc: linux-kernel@vger.kernel.org
Cc: linux-media@vger.kernel.org
Cc: linaro-mm-sig@lists.linaro.org
Signed-off-by: Maxime Ripard <maxime@cerno.tech>

---
Changes in v3:
- Add a Kconfig option for the KUnit helpers
- Switch to EXPORT_SYMBOL_GPL for the helpers
- Add some documentation on how to run the tests
- Add some documentation for __vc4_crtc_init
- Fix KUnit casing
- Link to v2: https://lore.kernel.org/r/20221123-rpi-kunit-tests-v2-0-efe5ed518b63@cerno.tech

Changes in v2:
- Added some documentation for public functions
- Removed the fake device probe/remove workqueue 
- Made sure the tests could be compiled as modules
- Moved the vc4 tests in the vc4 module
- Applied some of the preliminary patches
- Rebased on top of current drm-misc-next branch
- Fixed checkpatch issues
- Introduced BCM2835 (Pi0-3) tests for muxing
- Introduced tests to cover past bugs we had
- Link to v1: https://lore.kernel.org/r/20221123-rpi-kunit-tests-v1-0-051a0bb60a16@cerno.tech

---
Maxime Ripard (20):
      drm/tests: helpers: Move the helper header to include/drm
      drm/tests: Introduce a config option for the KUnit helpers
      drm/tests: helpers: Document drm_kunit_device_init()
      drm/tests: helpers: Switch to EXPORT_SYMBOL_GPL
      drm/tests: helpers: Rename the device init helper
      drm/tests: helpers: Remove the name parameter
      drm/tests: helpers: Create the device in another function
      drm/tests: helpers: Switch to a platform_device
      drm/tests: helpers: Make sure the device is bound
      drm/tests: helpers: Allow for a custom device struct to be allocated
      drm/tests: helpers: Allow to pass a custom drm_driver
      drm/tests: Add a test for DRM managed actions
      drm/vc4: Move HVS state to main header
      drm/vc4: crtc: Introduce a lower-level crtc init helper
      drm/vc4: crtc: Make encoder lookup helper public
      drm/vc4: hvs: Provide a function to initialize the HVS structure
      drm/vc4: tests: Introduce a mocking infrastructure
      drm/vc4: tests: Fail the current test if we access a register
      drm/vc4: tests: Add unit test suite for the PV muxing
      Documentation: gpu: vc4: Add KUnit Tests Section

 Documentation/gpu/vc4.rst                       |   16 +
 drivers/gpu/drm/Kconfig                         |    7 +
 drivers/gpu/drm/Makefile                        |    2 +-
 drivers/gpu/drm/tests/Makefile                  |    5 +-
 drivers/gpu/drm/tests/drm_client_modeset_test.c |   19 +-
 drivers/gpu/drm/tests/drm_kunit_helpers.c       |  106 ++-
 drivers/gpu/drm/tests/drm_kunit_helpers.h       |   11 -
 drivers/gpu/drm/tests/drm_managed_test.c        |   71 ++
 drivers/gpu/drm/tests/drm_modes_test.c          |   19 +-
 drivers/gpu/drm/tests/drm_probe_helper_test.c   |   20 +-
 drivers/gpu/drm/vc4/Kconfig                     |   16 +
 drivers/gpu/drm/vc4/Makefile                    |    7 +
 drivers/gpu/drm/vc4/tests/.kunitconfig          |   13 +
 drivers/gpu/drm/vc4/tests/vc4_mock.c            |  200 +++++
 drivers/gpu/drm/vc4/tests/vc4_mock.h            |   63 ++
 drivers/gpu/drm/vc4/tests/vc4_mock_crtc.c       |   41 +
 drivers/gpu/drm/vc4/tests/vc4_mock_output.c     |  138 +++
 drivers/gpu/drm/vc4/tests/vc4_mock_plane.c      |   47 +
 drivers/gpu/drm/vc4/tests/vc4_test_pv_muxing.c  | 1039 +++++++++++++++++++++++
 drivers/gpu/drm/vc4/vc4_crtc.c                  |  120 ++-
 drivers/gpu/drm/vc4/vc4_dpi.c                   |   13 +-
 drivers/gpu/drm/vc4/vc4_drv.c                   |    4 +-
 drivers/gpu/drm/vc4/vc4_drv.h                   |   91 +-
 drivers/gpu/drm/vc4/vc4_dsi.c                   |    9 +-
 drivers/gpu/drm/vc4/vc4_hdmi_regs.h             |    4 +
 drivers/gpu/drm/vc4/vc4_hvs.c                   |   81 +-
 drivers/gpu/drm/vc4/vc4_kms.c                   |   25 +-
 drivers/gpu/drm/vc4/vc4_txp.c                   |   15 +-
 drivers/gpu/drm/vc4/vc4_vec.c                   |   13 +-
 include/drm/drm_kunit_helpers.h                 |   91 ++
 30 files changed, 2132 insertions(+), 174 deletions(-)
---
base-commit: 199557fab92548f8e9d5207e385097213abe0cab
change-id: 20221123-rpi-kunit-tests-87a388492a73

Best regards,
-- 
Maxime Ripard <maxime@cerno.tech>
