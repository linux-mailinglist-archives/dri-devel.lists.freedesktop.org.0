Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 1278063ABAA
	for <lists+dri-devel@lfdr.de>; Mon, 28 Nov 2022 15:56:45 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1CD3610E1F1;
	Mon, 28 Nov 2022 14:56:41 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from wnew1-smtp.messagingengine.com (wnew1-smtp.messagingengine.com
 [64.147.123.26])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2E00E10E1F1
 for <dri-devel@lists.freedesktop.org>; Mon, 28 Nov 2022 14:56:37 +0000 (UTC)
Received: from compute5.internal (compute5.nyi.internal [10.202.2.45])
 by mailnew.west.internal (Postfix) with ESMTP id 7C2DA2B04FDA;
 Mon, 28 Nov 2022 09:56:31 -0500 (EST)
Received: from mailfrontend1 ([10.202.2.162])
 by compute5.internal (MEProxy); Mon, 28 Nov 2022 09:56:34 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cerno.tech; h=cc
 :cc:content-transfer-encoding:content-type:date:date:from:from
 :in-reply-to:message-id:mime-version:reply-to:sender:subject
 :subject:to:to; s=fm2; t=1669647390; x=1669654590; bh=aieeswS2ub
 zxcYdTOR9CWF5pSt1Hc0WFcbPhHOr9AOI=; b=Wqk9Zvdg7ui5E+ylAyTe8D3woE
 fpYe4Ff/Rtk8z1Jk2tIGTn4IK3RQ5EVdMLU6RVMIvn2flsaLgQyIO3Gd0LmYZlkQ
 6XFAu3lgmBybMMNGWL+oGFvzCc9gn2D4MOmR4xODTb+PXWL0OtDDMYDxR0x24nnn
 vMA1WO9JQzMrIMFzNKzWQlKTJznJK8Do0CdnNXRG2J2ZgtpUTZxPmZyojDnDZgL4
 VvBpyhYQCaYWgLD49F0+L27weoBzsJKfsK7/KszcX/Cm8aDTc7TqlgcC1FrCC+Y5
 eMEf7AfOL+3qldRNilJR/G+5yxxJQrdsxpfJB6g2nGze0FOwGBbR8p0dtYqA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:cc:content-transfer-encoding
 :content-type:date:date:feedback-id:feedback-id:from:from
 :in-reply-to:message-id:mime-version:reply-to:sender:subject
 :subject:to:to:x-me-proxy:x-me-proxy:x-me-sender:x-me-sender
 :x-sasl-enc; s=fm1; t=1669647390; x=1669654590; bh=aieeswS2ubzxc
 YdTOR9CWF5pSt1Hc0WFcbPhHOr9AOI=; b=aiiGEPbJdvrli967D33dR27TymkVa
 Ie4sCI5IihSXucEZAM0QheSixCf/WXKM3U/PBpbLq3sxB1T35iv3vpDervjN0n93
 xsPlxzgXVc6YWyq/5uvXknw7iPrMz0AbBHJO+EqT6i9q0/Jr5SabuA2ozjHBuOHW
 3LdQobMfpYysOsuQQUck372u01DT3EsPjHbIdLOP9YvAjhPNParPIpwd7GrGoXTV
 YVdz5tBAq1dJv+BlwIjNNEnzT+fRC/M+iRGOZeFfCn065izQp6W6epaBVCbI4Bxb
 sSbq/zbZd/GrXxD2ldHTDxT2L0klXyA47PIntDBSfghuRAFjRSD9NSuMw==
X-ME-Sender: <xms:HcyEY0rhQ2tRS7IyicYFYUrKxFMLSMYcetHBskRMhGVSUZVbpPJw0w>
 <xme:HcyEY6qEfcxJY78C00l4cDHnVGzVlQWiP6rkDwPFAgLn3IexhRoYaqAMnj02MVi5_
 WQeSPO40bTzelIk4g4>
X-ME-Received: <xmr:HcyEY5OQuoansM6QUWpHohC2HIBz1-0E1NYnOC2GqeM--hdxwChr9VmRf57RVSe0pndojHf6Q3uy1SqRo4GWJV8fnXhRrQAiSCxFe44H2_O6Sg>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvgedrjedvgdejudcutefuodetggdotefrodftvf
 curfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfghnecu
 uegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenuc
 fjughrpefugggtgffhfffkvfevofesthekredtredtjeenucfhrhhomhepofgrgihimhgv
 ucftihhprghrugcuoehmrgigihhmvgestggvrhhnohdrthgvtghhqeenucggtffrrghtth
 gvrhhnpeelueevteetffdvveelgfffleegudeufeelveefvddugeehkeefkeehjeeikeeg
 udenucffohhmrghinhepkhgvrhhnvghlrdhorhhgnecuvehluhhsthgvrhfuihiivgeptd
 enucfrrghrrghmpehmrghilhhfrhhomhepmhgrgihimhgvsegtvghrnhhordhtvggthh
X-ME-Proxy: <xmx:HcyEY74MuwEOoJt49N5hckjLWSPQREb3Q5mDisGOJrI7JsH1IHrObQ>
 <xmx:HcyEYz7lgomuOaQAveczXqoAUWwXKmxuh0FSnXOY0mkgyzDKj-8w1g>
 <xmx:HcyEY7jrv8C8SqnDbg8WvhLft4E9TKhFxR2VASHp5KOwPGxL5h2cXw>
 <xmx:HsyEY4YerRA0sVSX_UP7sG0YMlnxx7_A4zV_lqHmE5lie8yELtYCxLpXv0c>
Feedback-ID: i8771445c:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Mon,
 28 Nov 2022 09:56:28 -0500 (EST)
Subject: [PATCH v2 00/17] drm: Introduce Kunit Tests to VC4
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-b4-tracking: H4sIAGnLhGMC/3WNwQrCMBBEf6Xk7EqSahs9+R/iYVMXs1jSkk0LUvrvLt49DW/gzWxGqDCJuTabKb
 Sy8JQV/KExQ8L8IuCnsvHWe+d8C2VmeC+ZK1SSKhB6bEM4XTz2rVErohDEgnlI6uVlHLVMLHUqn9/L
 6jTu/wdXBxbs2aGNsbPouttAJU/HSrr42Pf9CyOQTo60AAAA
From: Maxime Ripard <maxime@cerno.tech>
Date: Mon, 28 Nov 2022 15:53:29 +0100
Message-Id: <20221123-rpi-kunit-tests-v2-0-efe5ed518b63@cerno.tech>
To: Daniel Vetter <daniel@ffwll.ch>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, David Airlie <airlied@gmail.com>,
 Thomas Zimmermann <tzimmermann@suse.de>
X-Mailer: b4 0.11.0-dev-d416f
X-Developer-Signature: v=1; a=openpgp-sha256; l=5626; i=maxime@cerno.tech;
 h=from:subject:message-id; bh=TSOHW4fhDzzCbXUc46KOlaw5DmHmSvadYwAM9WVHvHc=;
 b=owGbwMvMwCX2+D1vfrpE4FHG02pJDMktp0uPijp6lRm33Ko00xJ25JqslWY6p7Vd+nlw022vmX0V
 M7M7SlkYxLgYZMUUWWKEzZfEnZr1upONbx7MHFYmkCEMXJwCMBFbP4b/DhMDm2eqppQcfDfnU3VLwV
 /rP2x7opQnvmzaP/nC2V3fzzEy3HkUsyrk1nz+k8fXHWZZfPOw+qqL78IyPcqPbf/euaO6jw8A
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
Cc: David Gow <davidgow@google.com>, Maíra Canal <mairacanal@riseup.net>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Dave Stevenson <dave.stevenson@raspberrypi.com>, Javier Martinez Canillas <javierm@redhat.com>, dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org, linaro-mm-sig@lists.linaro.org, Brendan Higgins <brendan.higgins@linux.dev>, Maxime Ripard <maxime@cerno.tech>, linux-kselftest@vger.kernel.org, kunit-dev@googlegroups.com, linux-media@vger.kernel.org
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
Maxime Ripard (17):
      drm/tests: helpers: Move the helper header to include/drm
      drm/tests: helpers: Document drm_kunit_device_init()
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

 drivers/gpu/drm/tests/Makefile                  |    1 +
 drivers/gpu/drm/tests/drm_client_modeset_test.c |   19 +-
 drivers/gpu/drm/tests/drm_kunit_helpers.c       |  106 ++-
 drivers/gpu/drm/tests/drm_kunit_helpers.h       |   11 -
 drivers/gpu/drm/tests/drm_managed_test.c        |   71 ++
 drivers/gpu/drm/tests/drm_modes_test.c          |   19 +-
 drivers/gpu/drm/tests/drm_probe_helper_test.c   |   20 +-
 drivers/gpu/drm/vc4/Kconfig                     |   15 +
 drivers/gpu/drm/vc4/Makefile                    |    7 +
 drivers/gpu/drm/vc4/tests/.kunitconfig          |   14 +
 drivers/gpu/drm/vc4/tests/vc4_mock.c            |  200 +++++
 drivers/gpu/drm/vc4/tests/vc4_mock.h            |   63 ++
 drivers/gpu/drm/vc4/tests/vc4_mock_crtc.c       |   41 +
 drivers/gpu/drm/vc4/tests/vc4_mock_output.c     |  138 +++
 drivers/gpu/drm/vc4/tests/vc4_mock_plane.c      |   47 +
 drivers/gpu/drm/vc4/tests/vc4_test_pv_muxing.c  | 1039 +++++++++++++++++++++++
 drivers/gpu/drm/vc4/vc4_crtc.c                  |  102 ++-
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
 27 files changed, 2087 insertions(+), 172 deletions(-)
---
base-commit: 199557fab92548f8e9d5207e385097213abe0cab
change-id: 20221123-rpi-kunit-tests-87a388492a73

Best regards,
-- 
Maxime Ripard <maxime@cerno.tech>
