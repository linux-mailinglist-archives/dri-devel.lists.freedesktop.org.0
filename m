Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E31014C479C
	for <lists+dri-devel@lfdr.de>; Fri, 25 Feb 2022 15:35:41 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 82F9E10E133;
	Fri, 25 Feb 2022 14:35:38 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from out5-smtp.messagingengine.com (out5-smtp.messagingengine.com
 [66.111.4.29])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0669710E133
 for <dri-devel@lists.freedesktop.org>; Fri, 25 Feb 2022 14:35:37 +0000 (UTC)
Received: from compute3.internal (compute3.nyi.internal [10.202.2.43])
 by mailout.nyi.internal (Postfix) with ESMTP id 659165C019C;
 Fri, 25 Feb 2022 09:35:36 -0500 (EST)
Received: from mailfrontend1 ([10.202.2.162])
 by compute3.internal (MEProxy); Fri, 25 Feb 2022 09:35:36 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cerno.tech; h=cc
 :cc:content-transfer-encoding:content-type:date:date:from:from
 :in-reply-to:message-id:mime-version:reply-to:sender:subject
 :subject:to:to; s=fm2; bh=Juzjua8jYlBft4SEQd07qHqC1W7ZuAm2h029ZN
 WElVs=; b=AhqKI5E7ua7VGTuzVdWgo7je5BnT0yyoK0b0k8czZNJIwCdOWHBOLL
 e1C/ZIPBss1SrpmWfzxnXHCavespr3ftWL+gNGTd49pLOkvc5uNcERv+EOpl+AiU
 26IXGR+sC8AMI7Sqf61xUF/DFDlVJyl40HotAc6zyEZdRP4pjUquJxkeC5WSvtwb
 a5ZvsRyhqKlMQeNJcVzTqaa/9EBm5CnV3NNAgXG4+BmjCcZPt05g9frYiTL6u5cy
 KCpjiytup5cuAhrz5XDq2nVqXRJ6Re1YM3IrjQjt5v1/WVcbbTaoX8y0rR0cZ70d
 lTR+oAuToql6VOgzrhW+2YdH7VNjKh2Q==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:cc:content-transfer-encoding
 :content-type:date:date:from:from:in-reply-to:message-id
 :mime-version:reply-to:sender:subject:subject:to:to:x-me-proxy
 :x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm2; bh=Juzjua
 8jYlBft4SEQd07qHqC1W7ZuAm2h029ZNWElVs=; b=g1Sj7uvL7Jdo7lzDn6Qp8I
 UtQrEV5pmOByQKWmEW08VzFTKg4FPuhZYoBVAC1lj2aBUmOBoLrFVlu8+57NX5Ws
 m0dfFqU0RI30YvmpZ5rug2bxUdkXGkKeoWe0w+AB+AapZy8TReAjnEl+GBlNsSpK
 6weA+XHyX+H1gYCx2eFpF8Y6IM7cg0f79D3XHYdspiMsvWmIUXRYaAXHulsouLKn
 mO6QSH6s3r7PZtW4+/yfqcvKL5DYBoLofJzb4kkSRdk6a71o05kpttdy+0ST7wo0
 1UyzHdHxSJZHmWIX38DyNVehzt+bH/uud4fEML+O5t3CBsBBg4iiHkfNSYuakQbg
 ==
X-ME-Sender: <xms:OOkYYg71LWyVkZKsarptUhaI4ua8-o0DAhlbqQfN77rtIXQSgLNu2g>
 <xme:OOkYYh4Hmq7D86nTrHCdBeMo24NGj8gIRgbzK5YrkTOFvXNdJxYO7FDfu3cw_b-wm
 4m0rWLY6-u3Qfj7wOU>
X-ME-Received: <xmr:OOkYYvdTAkWSU5GCvs61rPokOszdJEYjGrv-QhyY2g_Yo3Ar5n2TjU04-w8yo6VBUc1dXHdkzB98CuYJqzvxt-LCc4jT4pFU3ZifDI8>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvvddrleeggdeijecutefuodetggdotefrodftvf
 curfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfghnecu
 uegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenuc
 fjughrpefhvffufffkofgtggfgsehtqhertdertdejnecuhfhrohhmpeforgigihhmvgcu
 tfhiphgrrhguuceomhgrgihimhgvsegtvghrnhhordhtvggthheqnecuggftrfgrthhtvg
 hrnhepteetledtudejhffftdeugfduffelleelheejgeegffduvddvgfdvhffhlefgteff
 necuffhomhgrihhnpehkvghrnhgvlhdrohhrghenucevlhhushhtvghrufhiiigvpedtne
 curfgrrhgrmhepmhgrihhlfhhrohhmpehmrgigihhmvgestggvrhhnohdrthgvtghh
X-ME-Proxy: <xmx:OOkYYlIWBVjVOZwmys0bf4UWh8DsKd9GK3k7Q5HiYboVdi66CSxuZQ>
 <xmx:OOkYYkLxE_groasVRYcaL7oeu7jShTVFq9q3yt6zwY8ZP5x6aI0s9Q>
 <xmx:OOkYYmyh_bBdX56SrcBn04mwMHgWnpWtRXNEa2U_4HUKP0seoBZ_Eg>
 <xmx:OOkYYtqUK_UUyw72B97OWH74QRYFI3KQ3D7CFkaOEiZQVuUfu8DCSQ>
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Fri,
 25 Feb 2022 09:35:35 -0500 (EST)
From: Maxime Ripard <maxime@cerno.tech>
To: Mike Turquette <mturquette@baylibre.com>, Stephen Boyd <sboyd@kernel.org>
Subject: [PATCH v7 00/12] clk: Improve clock range handling
Date: Fri, 25 Feb 2022 15:35:22 +0100
Message-Id: <20220225143534.405820-1-maxime@cerno.tech>
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
 dri-devel@lists.freedesktop.org, Phil Elwell <phil@raspberrypi.com>,
 Maxime Ripard <maxime@cerno.tech>, linux-clk@vger.kernel.org
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
Changes from v6:=0D
  - Removed unused header=0D
  - Used more fitting KUNIT macros=0D
  - Enhanced some comments=0D
  - Reworded a commit message=0D
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
 drivers/clk/clk_test.c            | 795 ++++++++++++++++++++++++++++++=0D
 drivers/gpu/drm/vc4/vc4_hdmi.c    |  13 -=0D
 drivers/gpu/drm/vc4/vc4_kms.c     |  11 +=0D
 include/linux/clk.h               |  11 +=0D
 9 files changed, 985 insertions(+), 55 deletions(-)=0D
 create mode 100644 drivers/clk/clk_test.c=0D
=0D
-- =0D
2.35.1=0D
=0D
