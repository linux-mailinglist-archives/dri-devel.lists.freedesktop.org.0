Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id A014F4C10BC
	for <lists+dri-devel@lfdr.de>; Wed, 23 Feb 2022 11:56:14 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 17FF010E650;
	Wed, 23 Feb 2022 10:56:11 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from out5-smtp.messagingengine.com (out5-smtp.messagingengine.com
 [66.111.4.29])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 55E0410E658
 for <dri-devel@lists.freedesktop.org>; Wed, 23 Feb 2022 10:56:09 +0000 (UTC)
Received: from compute3.internal (compute3.nyi.internal [10.202.2.43])
 by mailout.nyi.internal (Postfix) with ESMTP id 24CA65C0212;
 Wed, 23 Feb 2022 05:56:05 -0500 (EST)
Received: from mailfrontend2 ([10.202.2.163])
 by compute3.internal (MEProxy); Wed, 23 Feb 2022 05:56:05 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cerno.tech; h=cc
 :cc:content-transfer-encoding:content-type:date:date:from:from
 :in-reply-to:message-id:mime-version:reply-to:sender:subject
 :subject:to:to; s=fm2; bh=VJE7vQ9R0jzqf9a1z2Z+VxG6/9IvctHOAohFAR
 oJ454=; b=g1cWv8QxuEXGDeESQSSKqtHhOTSGi/zXYJZSeFtHP3oiinJ70ODgwD
 EhNoDxmEzNhHPIe/emve++0jt4lN4xYr9tDNlYc5hj5DytxOoSk5rI2UbMN9zUsX
 iAtTNPEfgxGVReA73OUp1ZnPgpmytlKqeWpVotsgsOOHt2A2ovTzq76Ti1c8xi9l
 34lwSnASagTU27P/PsJqEdzWJjOf6AT1ixjbXpQ2CB8fLXfDmB2Hc/dBffaCfO4j
 3LcIe1a4pE8Ed0KJGM81c6YzFhqPp6obXS6WEZ3GfmjkjP4c1EotVTVKtpk1hgN6
 t2H4uZ9NFfDdhqhcCJIbCQgSLzo7S0dA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:cc:content-transfer-encoding
 :content-type:date:date:from:from:in-reply-to:message-id
 :mime-version:reply-to:sender:subject:subject:to:to:x-me-proxy
 :x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm2; bh=VJE7vQ
 9R0jzqf9a1z2Z+VxG6/9IvctHOAohFARoJ454=; b=YSvnu4YC51huteCvirBXEg
 FTGICfkxAvZEimndmWan771m0cUZt+nF1B90U7dDmN8V9OzXbA90cRfWQNCBGmXn
 0EliWBITwDU1v5Jj2QFVWeCrtu/s3hCARtbEaQ+/5v0itNttUkRstmUWxpjYQnal
 0hLC115sYo+DfJXTyeIHXPQK4kncTgl0af2GSXH/yuWCMdrS20T/D7HM15eenURf
 wvqExfzPyvWzj7RzLFCQXFWvv8/OMVMeAoerjB43t0bm9BwpJerrgHgB6NLk8ASD
 /B4MqESqNvd5V3PU7PFEzTD2QQjYRBwM4mBOiU4QBYv3lL5NeSBEpRi8llg+hkmg
 ==
X-ME-Sender: <xms:xBIWYh9dhacKMmOITLjftALaJTk9IZk3O1EeAvzVmJ8hXinOiqemQA>
 <xme:xBIWYluc_CcuECiwKG0k69tjNqVPsdgdxZxmiUAdNfdsHJv7xVYqSHeUHRp4cqWdH
 jxaVjj1q2gWowVPBig>
X-ME-Received: <xmr:xBIWYvCsTABjE6hgfL9rs1k96eAVmlaGwuXf3TNPhEHYCJ4xPKTjXJ3YRXBGiwV5VqSyVqBv7l-CKzPev4G9RSoEA8mb0VumsEBr10E>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvvddrledtgddvudcutefuodetggdotefrodftvf
 curfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfghnecu
 uegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenuc
 fjughrpefhvffufffkofgtggfgsehtqhertdertdejnecuhfhrohhmpeforgigihhmvgcu
 tfhiphgrrhguuceomhgrgihimhgvsegtvghrnhhordhtvggthheqnecuggftrfgrthhtvg
 hrnhepteetledtudejhffftdeugfduffelleelheejgeegffduvddvgfdvhffhlefgteff
 necuffhomhgrihhnpehkvghrnhgvlhdrohhrghenucevlhhushhtvghrufhiiigvpedtne
 curfgrrhgrmhepmhgrihhlfhhrohhmpehmrgigihhmvgestggvrhhnohdrthgvtghh
X-ME-Proxy: <xmx:xBIWYleuKNbipWsg7UvqRStDtmkgdJD_uY6BWt3N3pWtJd3aWRr1DQ>
 <xmx:xBIWYmMpbCL149nhMc-F_FlBS70Qo5yW1uB2UMVJIH9mVLdU_XpR7A>
 <xmx:xBIWYnktZ1flV4ezPVNY2jR_8iq91_TV_ge9W9Yqd7_MCLmJCY9vrQ>
 <xmx:xRIWYlfzAQxvQftUutV9p733hj1f7UaHCXqJI2AFy84NwKb-9xyfoA>
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Wed,
 23 Feb 2022 05:56:03 -0500 (EST)
From: Maxime Ripard <maxime@cerno.tech>
To: Mike Turquette <mturquette@baylibre.com>, Stephen Boyd <sboyd@kernel.org>
Subject: [PATCH v6 00/12] clk: Improve clock range handling
Date: Wed, 23 Feb 2022 11:55:48 +0100
Message-Id: <20220223105600.1132593-1-maxime@cerno.tech>
X-Mailer: git-send-email 2.35.1
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
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
Cc: Dom Cobley <dom@raspberrypi.com>, Tim Gover <tim.gover@raspberrypi.com>,
 Dave Stevenson <dave.stevenson@raspberrypi.com>,
 dri-devel@lists.freedesktop.org, linux-clk@vger.kernel.org,
 Maxime Ripard <maxime@cerno.tech>, Phil Elwell <phil@raspberrypi.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi,=0D
=0D
This is a follow-up of the discussion here:=0D
https://lore.kernel.org/linux-clk/20210319150355.xzw7ikwdaga2dwhv@gilmour/=
=0D
=0D
and here:=0D
https://lore.kernel.org/all/20210914093515.260031-1-maxime@cerno.tech/=0D
=0D
While the initial proposal implemented a new API to temporarily raise and l=
ower=0D
clock rates based on consumer workloads, Stephen suggested an=0D
alternative approach implemented here.=0D
=0D
The main issue that needed to be addressed in our case was that in a=0D
situation where we would have multiple calls to clk_set_rate_range, we=0D
would end up with a clock at the maximum of the minimums being set. This=0D
would be expected, but the issue was that if one of the users was to=0D
relax or drop its requirements, the rate would be left unchanged, even=0D
though the ideal rate would have changed.=0D
=0D
So something like=0D
=0D
clk_set_rate(user1_clk, 1000);=0D
clk_set_min_rate(user1_clk, 2000);=0D
clk_set_min_rate(user2_clk, 3000);=0D
clk_set_min_rate(user2_clk, 1000);=0D
=0D
Would leave the clock running at 3000Hz, while the minimum would now be=0D
2000Hz.=0D
=0D
This was mostly due to the fact that the core only triggers a rate=0D
change in clk_set_rate_range() if the current rate is outside of the=0D
boundaries, but not if it's within the new boundaries.=0D
=0D
That series changes that and will trigger a rate change on every call,=0D
with the former rate being tried again. This way, providers have a=0D
chance to follow whatever policy they see fit for a given clock each=0D
time the boundaries change.=0D
=0D
This series also implements some kunit tests, first to test a few rate=0D
related functions in the CCF, and then extends it to make sure that=0D
behaviour has some test coverage.=0D
=0D
Let me know what you think=0D
Maxime=0D
=0D
Changes from v5:=0D
  - Changed clk_hw_create_clk for clk_hw_get_clk since the former isn't=0D
    exported to modules.=0D
  - Added fix for clk_hw_get_clk=0D
=0D
Changes from v4:=0D
  - Rename the test file=0D
  - Move all the tests to the first patch, and fix them up as fixes are don=
e=0D
  - Improved the test conditions=0D
  - Added more tests=0D
  - Improved commit messages=0D
  - Fixed a regression where two disjoints clock ranges would now be accept=
ed=0D
=0D
Changes from v3:=0D
  - Renamed the test file and Kconfig option=0D
  - Add option to .kunitconfig=0D
  - Switch to kunit_kzalloc=0D
  - Use KUNIT_EXPECT_* instead of KUNIT_ASSERT_* where relevant=0D
  - Test directly relevant calls instead of going through a temporary varia=
ble=0D
  - Switch to more precise KUNIT_ASSERT_* macros where relevant=0D
=0D
Changes from v2:=0D
  - Rebased on current next=0D
  - Rewrote the whole thing according to Stephen reviews=0D
  - Implemented some kunit tests=0D
=0D
Changes from v1:=0D
  - Return NULL in clk_request_start if clk pointer is NULL=0D
  - Test for clk_req pointer in clk_request_done=0D
  - Add another user in vc4=0D
  - Rebased on top of v5.15-rc1=0D
=0D
Maxime Ripard (12):=0D
  clk: Fix clk_hw_get_clk() when dev is NULL=0D
  clk: Introduce Kunit Tests for the framework=0D
  clk: Enforce that disjoints limits are invalid=0D
  clk: Always clamp the rounded rate=0D
  clk: Use clamp instead of open-coding our own=0D
  clk: Always set the rate on clk_set_range_rate=0D
  clk: Add clk_drop_range=0D
  clk: bcm: rpi: Add variant structure=0D
  clk: bcm: rpi: Set a default minimum rate=0D
  clk: bcm: rpi: Run some clocks at the minimum rate allowed=0D
  drm/vc4: Add logging and comments=0D
  drm/vc4: hdmi: Remove clock rate initialization=0D
=0D
 drivers/clk/.kunitconfig          |   1 +=0D
 drivers/clk/Kconfig               |   7 +=0D
 drivers/clk/Makefile              |   1 +=0D
 drivers/clk/bcm/clk-raspberrypi.c | 125 ++++-=0D
 drivers/clk/clk.c                 |  76 ++-=0D
 drivers/clk/clk_test.c            | 790 ++++++++++++++++++++++++++++++=0D
 drivers/gpu/drm/vc4/vc4_hdmi.c    |  13 -=0D
 drivers/gpu/drm/vc4/vc4_kms.c     |  11 +=0D
 include/linux/clk.h               |  11 +=0D
 9 files changed, 980 insertions(+), 55 deletions(-)=0D
 create mode 100644 drivers/clk/clk_test.c=0D
=0D
-- =0D
2.35.1=0D
=0D
