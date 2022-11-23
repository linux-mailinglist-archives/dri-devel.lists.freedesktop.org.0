Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 044A4636390
	for <lists+dri-devel@lfdr.de>; Wed, 23 Nov 2022 16:28:47 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7F41610E575;
	Wed, 23 Nov 2022 15:28:43 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from wnew2-smtp.messagingengine.com (wnew2-smtp.messagingengine.com
 [64.147.123.27])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 78F3410E572
 for <dri-devel@lists.freedesktop.org>; Wed, 23 Nov 2022 15:28:38 +0000 (UTC)
Received: from compute5.internal (compute5.nyi.internal [10.202.2.45])
 by mailnew.west.internal (Postfix) with ESMTP id 58F6E2B069AE;
 Wed, 23 Nov 2022 10:28:33 -0500 (EST)
Received: from mailfrontend2 ([10.202.2.163])
 by compute5.internal (MEProxy); Wed, 23 Nov 2022 10:28:35 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cerno.tech; h=cc
 :cc:content-transfer-encoding:content-type:date:date:from:from
 :in-reply-to:message-id:mime-version:reply-to:sender:subject
 :subject:to:to; s=fm2; t=1669217312; x=1669224512; bh=sfcj948ykx
 6duQ3ByisVajLNdP1+tXdvy57uQ1P6vrI=; b=mu2K0anAimZ+hLqPX//LMY5PyF
 UlZIA9jmYPgPWxUv0YVkHB6g/vg6AIQc42RWPMbcW0NgSTlr3PXcKB4q0+s2+rvx
 btDvzSiulnvyQvFUg0jOcoEpwM1Pjp0reEgnZW8StWXhW9hruYE/hUxV3MwkA2j3
 OxgNyQbWtdvBMBa0dFddKy4bQ41UIXgKgY8gm79nLkRvgdh6Kou5CFgIl5MglYq9
 K+XnozlV4Z2V8u3VDLo/Y7YiGp6pFn8a5GFqomP5dxLF8iMco1l4T+IiorZCNs9I
 oW8z1enLgoZ6AnTZdZjhX2ZQWXMb9/zna3k4WT7noiX7L64WF44XSjLtBlrQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:cc:content-transfer-encoding
 :content-type:date:date:feedback-id:feedback-id:from:from
 :in-reply-to:message-id:mime-version:reply-to:sender:subject
 :subject:to:to:x-me-proxy:x-me-proxy:x-me-sender:x-me-sender
 :x-sasl-enc; s=fm1; t=1669217312; x=1669224512; bh=sfcj948ykx6du
 Q3ByisVajLNdP1+tXdvy57uQ1P6vrI=; b=EehV9e84rV4w+tMkt8QY/07bJcKk8
 hBVH35AHsuJs69XRNxe0CoZwL8RYWaZOqU14c+faYaAQYG6L6tWsE7jvs1Q+zu2i
 UuNQyj3cA5bW/Wo7GnzTCBSzd19hQOu/TP2wr6D2U5p0Aaz7u3QglyeIXz6MEFB9
 Fgh0ptvtWIx3reYm1QRFu6Qy74i0dueLkLRKAuBv5G/PGQaroDQduQVeJ0anqw/S
 KaoqQR3yNYEakSi2CCbxJGvawDTbS+I2EDbesW+1kr5eBSXqUg8tJCimSNm5u6XO
 D2wawI4iJZHZnr8X3kHHVW1h5ovvwOHWx/dZga/SWcE76YMhMRsgjP+Kw==
X-ME-Sender: <xms:IDx-Yz2XkZfU3cJaXmkhE6TxOLefKWzLjxIcQ-xqMPtWEqUk54a59g>
 <xme:IDx-YyFPEPE8OVOSh9GfdTRu_ZAGT9s3ifcr2j6P82xBvJLSufDTyMRoYzcT54KhJ
 3DtOckCP3ScGonbWp0>
X-ME-Received: <xmr:IDx-Yz6v1dICxHCjOl2RVIXb7fuOASbqmZE-SO17LFxhsk7fkX-xJy_WcnjGNxrTUDJ9EncwK2paiwUGRRXzn1MQaBavx4p4lcQaSwgj1_bklg>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvgedriedugdejgecutefuodetggdotefrodftvf
 curfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfghnecu
 uegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenuc
 fjughrpefugggtgffhfffkvfevofesthekredtredtjeenucfhrhhomhepofgrgihimhgv
 ucftihhprghrugcuoehmrgigihhmvgestggvrhhnohdrthgvtghhqeenucggtffrrghtth
 gvrhhnpedvheefjeethfeggedugeevjeeiteefueegheevffetjeekudefleetuddtueeg
 heenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepmhgrihhlfhhrohhmpehmrg
 igihhmvgestggvrhhnohdrthgvtghh
X-ME-Proxy: <xmx:IDx-Y429eFYFpfTLnW82gx5JBeX1N_1J0K7kr6eWRFq2XjGEJpm90Q>
 <xmx:IDx-Y2En9Yu2an2SwMyqneimqllQoUbvQpn7iOvXb9BP6J6shHBe4g>
 <xmx:IDx-Y5-GFcV88kcCQa4Y_D0xcRFa0jWrjBttRrdusQLrdGtfUC1wAg>
 <xmx:IDx-Y4lfubpiTrFExdogPC3SE7PYWs8C_1qaLEDgv2-dX9FcPPpW5dJ5qlI>
Feedback-ID: i8771445c:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Wed,
 23 Nov 2022 10:28:31 -0500 (EST)
Subject: [PATCH 00/24] drm: Introduce Kunit Tests to VC4
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-b4-tracking: H4sIAHY7fmMC/w3LQQqEMAwAwK9IzgZsKlj9TXSDBiVKU72If98e5zAvuGQVh6l5IcujrqdVhLaBZW
 NbBfVXDdQRhUAR86W436YFi3hxTAPHlPqReIhQ18wuOGe2ZavP7uP4vj8lxm4IZgAAAA==
From: Maxime Ripard <maxime@cerno.tech>
Date: Wed, 23 Nov 2022 16:25:42 +0100
Message-Id: <20221123-rpi-kunit-tests-v1-0-051a0bb60a16@cerno.tech>
To: Maxime Ripard <mripard@kernel.org>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Daniel Vetter <daniel@ffwll.ch>, David Airlie <airlied@gmail.com>,
 Thomas Zimmermann <tzimmermann@suse.de>
X-Mailer: b4 0.11.0-dev-d416f
X-Developer-Signature: v=1; a=openpgp-sha256; l=5288; i=maxime@cerno.tech;
 h=from:subject:message-id; bh=0zXO9W25DSsn0o8dbcsN08cbQfO2IsUfYCuV/Qka/vc=;
 b=owGbwMvMwCX2+D1vfrpE4FHG02pJDMl11lXyN5ckHluWv+WjAX/qNrXsSc3lu9t7Nx9dJyqRlqAa
 3vWzo5SFQYyLQVZMkSVG2HxJ3KlZrzvZ+ObBzGFlAhnCwMUpABNpTWX4p9+ZfY1b/1mhiCf7IhGDu4
 XXucIkeXaKbRHNv5z1addlVYb/jhc+vt7uk5fa9TIhzzU8QzJyeXf9nNawjde6O71/vC7hAwA=
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
Cc: David Gow <davidgow@google.com>, Brendan Higgins <brendan.higgins@linux.dev>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Dave Stevenson <dave.stevenson@raspberrypi.com>, Javier Martinez Canillas <javierm@redhat.com>, dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org, linaro-mm-sig@lists.linaro.org, Maíra Canal <mairacanal@riseup.net>, Maxime Ripard <maxime@cerno.tech>, linux-kselftest@vger.kernel.org, kunit-dev@googlegroups.com, linux-media@vger.kernel.org
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
Maxime Ripard (24):
      drm/tests: helpers: Rename the device init helper
      drm/tests: helpers: Remove the name parameter
      drm/tests: helpers: Create the device in another function
      drm/tests: helpers: Switch to a platform_device
      drm/tests: helpers: Make sure the device is bound
      drm/tests: kunit: Allow for a custom device struct to be allocated
      drm/tests: helpers: Allow to pass a custom drm_driver
      drm/tests: Add a test for DRM managed actions
      drm/atomic: Constify the old/new state accessors
      drm/vc4: kms: Sort the CRTCs by output before assigning them
      drm/vc4: Constify container_of wrappers
      drm/vc4: Move HVS state to main header
      drm/vc4: kms: Constify the HVS old/new state helpers
      drm/vc4: txp: Reorder the variable assignments
      drm/vc4: Add TXP encoder type
      drm/vc4: txp: Initialise the CRTC before the encoder and connector
      drm/vc4: crtc: Pass the device and data in vc4_crtc_init
      drm/vc4: crtc: Introduce a lower-level crtc init helper
      drm/vc4: crtc: Make encoder lookup helper public
      drm/vc4: crtc: Provide a CRTC name
      drm/vc4: hvs: Provide a function to initialize the HVS structure
      drm/vc4: tests: Introduce a mocking infrastructure
      drm/vc4: tests: Fail the current test if we access a register
      drm/vc4: tests: Add unit test suite for the PV muxing

 drivers/gpu/drm/drm_atomic.c                    |  12 +-
 drivers/gpu/drm/tests/Makefile                  |   1 +
 drivers/gpu/drm/tests/drm_client_modeset_test.c |  16 +-
 drivers/gpu/drm/tests/drm_kunit_helpers.c       | 116 +++--
 drivers/gpu/drm/tests/drm_kunit_helpers.h       |  39 +-
 drivers/gpu/drm/tests/drm_managed_test.c        |  68 +++
 drivers/gpu/drm/vc4/Kconfig                     |  15 +
 drivers/gpu/drm/vc4/Makefile                    |   1 +
 drivers/gpu/drm/vc4/tests/.kunitconfig          |  14 +
 drivers/gpu/drm/vc4/tests/Makefile              |   8 +
 drivers/gpu/drm/vc4/tests/vc4_mock.c            | 174 +++++++
 drivers/gpu/drm/vc4/tests/vc4_mock.h            |  58 +++
 drivers/gpu/drm/vc4/tests/vc4_mock_crtc.c       |  39 ++
 drivers/gpu/drm/vc4/tests/vc4_mock_output.c     |  97 ++++
 drivers/gpu/drm/vc4/tests/vc4_mock_plane.c      |  45 ++
 drivers/gpu/drm/vc4/tests/vc4_test_pv_muxing.c  | 624 ++++++++++++++++++++++++
 drivers/gpu/drm/vc4/vc4_crtc.c                  | 119 +++--
 drivers/gpu/drm/vc4/vc4_dpi.c                   |  13 +-
 drivers/gpu/drm/vc4/vc4_drv.c                   |   4 +-
 drivers/gpu/drm/vc4/vc4_drv.h                   | 113 ++++-
 drivers/gpu/drm/vc4/vc4_dsi.c                   |   9 +-
 drivers/gpu/drm/vc4/vc4_hdmi_regs.h             |   4 +
 drivers/gpu/drm/vc4/vc4_hvs.c                   |  81 +--
 drivers/gpu/drm/vc4/vc4_kms.c                   | 138 +++---
 drivers/gpu/drm/vc4/vc4_txp.c                   |  66 ++-
 drivers/gpu/drm/vc4/vc4_vec.c                   |  13 +-
 include/drm/drm_atomic.h                        |  32 +-
 27 files changed, 1678 insertions(+), 241 deletions(-)
---
base-commit: 35c3a2d02f0dc153a5f2f304ba33e1436b6a8d8f
change-id: 20221123-rpi-kunit-tests-87a388492a73

Best regards,
-- 
Maxime Ripard <maxime@cerno.tech>
