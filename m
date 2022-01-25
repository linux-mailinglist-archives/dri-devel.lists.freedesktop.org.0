Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 51E9549B5D5
	for <lists+dri-devel@lfdr.de>; Tue, 25 Jan 2022 15:16:00 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A6DCC10E1AA;
	Tue, 25 Jan 2022 14:15:57 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from out1-smtp.messagingengine.com (out1-smtp.messagingengine.com
 [66.111.4.25])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C3B6A10E1AA
 for <dri-devel@lists.freedesktop.org>; Tue, 25 Jan 2022 14:15:55 +0000 (UTC)
Received: from compute2.internal (compute2.nyi.internal [10.202.2.46])
 by mailout.nyi.internal (Postfix) with ESMTP id 02AA95C0151;
 Tue, 25 Jan 2022 09:15:53 -0500 (EST)
Received: from mailfrontend1 ([10.202.2.162])
 by compute2.internal (MEProxy); Tue, 25 Jan 2022 09:15:53 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cerno.tech; h=cc
 :cc:content-transfer-encoding:content-type:date:date:from:from
 :in-reply-to:message-id:mime-version:reply-to:sender:subject
 :subject:to:to; s=fm1; bh=GThzqVct1ecqk2q3drmmDLq6ji2AfvsEb9Eaew
 0Hd70=; b=XET9TqPDlbHkrowxZFiWAt1ARfjUpEGmhqDNhA9Dclc7ARx/ToOF+7
 OZg3jr5hPrq9CYruqewlZMREF3+iEiQOxkdA04zgFBJetJGCvgsfISdF4oHB+rh7
 IamXmfnyBtsOPa22pvy2RoLrCm/5yFaE7+aK7RMMlmQLF80W08MykMqUA8V9y2I7
 feWide97BmFihS5tUfhuKwFCsHS2UmJNbpjjxtXP9L5ZnADDJHgbNAtMqqNoXNu/
 BPd5fixw6G5gF+JSObb6I4ehma3g7qXJxLqb+PTKxaMiRPfr6nzfao/BPmFKf+DN
 NrsOsRnW0dD2+MmxlOLg4QzrTnQB5ktw==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:cc:content-transfer-encoding
 :content-type:date:date:from:from:in-reply-to:message-id
 :mime-version:reply-to:sender:subject:subject:to:to:x-me-proxy
 :x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm1; bh=GThzqV
 ct1ecqk2q3drmmDLq6ji2AfvsEb9Eaew0Hd70=; b=HK3sN0RVIvcuJsN9etslcn
 tq6c0+13RqqUh8ppcj0FQW2GIe7CkNWyzhMLSxmfdJdG+3ToKUSTjeN0WLr78OlK
 L7vZFIYpqUDwfaGd+5ayf1fat5aI9qnsGXg/kMSrgr8+x6n5KbpVbB06+G5DV/Y5
 338itNvpMzg3VQMi5AgLLGdzPzPU5DQgiTPjD1e5E9myD+S+Z4/PYZ1aHoZ2Z66Y
 qPDKH9OjpSP/Pi77gjCPHayqP+s1Pr1AhS2ajS3CQTHPELX7gnnX/wYKvu2At6zN
 buDoX6zlcsuU84elDOCA2xaayPpVmdV9LA9dDWaljZGy/y0ct3wDOdC+XWfFkldw
 ==
X-ME-Sender: <xms:GAbwYQCBv9qxM0Dx5EVGsmVG5bb0coCDmOAoglO_NUNqRwGJkEg8cQ>
 <xme:GAbwYSgJZmUh7c84Eyl3qzBKSOg5-B66jqyFzBRhF0JJ8CgI-kmlDuuNmQOmHoa2d
 zq_gAsAwaiwgieFdsw>
X-ME-Received: <xmr:GAbwYTku7PDIJ6CQBYxymXq_mV5cWvonh7g-AVvWai1j5LyvImdnkFUrckeVZy0CXYbUPtud_39YPhNL15VvnXil6tDfrc56AFGq--M>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvvddrvdelgdeitdcutefuodetggdotefrodftvf
 curfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfghnecu
 uegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenuc
 fjughrpefhvffufffkofgtggfgsehtqhertdertdejnecuhfhrohhmpeforgigihhmvgcu
 tfhiphgrrhguuceomhgrgihimhgvsegtvghrnhhordhtvggthheqnecuggftrfgrthhtvg
 hrnhepteetledtudejhffftdeugfduffelleelheejgeegffduvddvgfdvhffhlefgteff
 necuffhomhgrihhnpehkvghrnhgvlhdrohhrghenucevlhhushhtvghrufhiiigvpedtne
 curfgrrhgrmhepmhgrihhlfhhrohhmpehmrgigihhmvgestggvrhhnohdrthgvtghh
X-ME-Proxy: <xmx:GAbwYWxQhhVWDqLdgyu7IYkEoU8jzz3onDMQeVQrqjnF-CIlybY-ZA>
 <xmx:GAbwYVQKRd7aOCgAlr1WVPSL_heUS-n2d-ejpx8G4IS9WwqIh1ezQQ>
 <xmx:GAbwYRZ6A4mZB2LcTP63r1Ydg1uWFzukLBFZyKN_ytifX-b_4BkiuA>
 <xmx:GAbwYWQthKPOyRx3aX4xKN8OwlS3SEQ_bERkbJWd1c3ud9Nh-iU3xw>
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Tue,
 25 Jan 2022 09:15:51 -0500 (EST)
From: Maxime Ripard <maxime@cerno.tech>
To: Mike Turquette <mturquette@baylibre.com>, Stephen Boyd <sboyd@kernel.org>
Subject: [PATCH v4 00/10] clk: Improve clock range handling
Date: Tue, 25 Jan 2022 15:15:39 +0100
Message-Id: <20220125141549.747889-1-maxime@cerno.tech>
X-Mailer: git-send-email 2.34.1
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
Maxime Ripard (10):=0D
  clk: Introduce Kunit Tests for the framework=0D
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
 drivers/clk/bcm/clk-raspberrypi.c | 125 +++++-=0D
 drivers/clk/clk-test.c            | 621 ++++++++++++++++++++++++++++++=0D
 drivers/clk/clk.c                 |  51 ++-=0D
 drivers/gpu/drm/vc4/vc4_hdmi.c    |  13 -=0D
 drivers/gpu/drm/vc4/vc4_kms.c     |  11 +=0D
 include/linux/clk.h               |  11 +=0D
 9 files changed, 786 insertions(+), 55 deletions(-)=0D
 create mode 100644 drivers/clk/clk-test.c=0D
=0D
-- =0D
2.34.1=0D
=0D
