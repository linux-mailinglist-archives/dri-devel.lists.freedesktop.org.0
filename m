Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 15C6A495035
	for <lists+dri-devel@lfdr.de>; Thu, 20 Jan 2022 15:34:30 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8CE2189F49;
	Thu, 20 Jan 2022 14:34:25 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from wout4-smtp.messagingengine.com (wout4-smtp.messagingengine.com
 [64.147.123.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2B06789F49
 for <dri-devel@lists.freedesktop.org>; Thu, 20 Jan 2022 14:34:23 +0000 (UTC)
Received: from compute1.internal (compute1.nyi.internal [10.202.2.41])
 by mailout.west.internal (Postfix) with ESMTP id 2E9453200F72;
 Thu, 20 Jan 2022 09:34:21 -0500 (EST)
Received: from mailfrontend2 ([10.202.2.163])
 by compute1.internal (MEProxy); Thu, 20 Jan 2022 09:34:21 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cerno.tech; h=cc
 :cc:content-transfer-encoding:content-type:date:date:from:from
 :in-reply-to:message-id:mime-version:reply-to:sender:subject
 :subject:to:to; s=fm1; bh=obwHIxOpczJ8YsM5Ary7YpyYT6D7lDEJcwV9qL
 rQ5NM=; b=JeF8G4zjiflLS4wrYaUJIOudSNuahhfb7wKxV00lDufkZFA9Mq/ycd
 Q8/iMwbLhnzM/ohp5ZW0H2F7AP2NdTYV6dq3lRiXP9yd8pozzjdLRv2lR+ss/SYq
 fDz/v47Lmm0+S16rMSNjauXguCwGVaBHBQyQk76e7KfqmND6kNYIbecHyyhCA0aP
 NrFqYRin4Pz25hAhs7Lsg+K9YqFURYjA2RtzLxNJLzDZjX7VmILYXZCZiYnuQPao
 vamX6gxFu5x4fp3l7olJFl05Y0GsFvhA4rgh9JqlZ43ykx168nwo6kncn49Yv0Ts
 b+CHeFAxd5fQbCmqCkzXX9CbnuPCwbhg==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:cc:content-transfer-encoding
 :content-type:date:date:from:from:in-reply-to:message-id
 :mime-version:reply-to:sender:subject:subject:to:to:x-me-proxy
 :x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm1; bh=obwHIx
 OpczJ8YsM5Ary7YpyYT6D7lDEJcwV9qLrQ5NM=; b=QFRCSveXpG5VbiasnluYNy
 HeZIFbbLpUNrqNhufGrln54yVzS938P6HRPW0aua5IhA7y+fAcev7xkWi0qiNV6N
 VakDpm821ypW2IpYRJOti4vrbaDJb0sJOZ3+a6zDpsnI1LTq5nkf6R76wBYfs9t2
 0xg6iJa2+xNADEED2KFPiWM+uCY97IK5tCZmpbYFhv1XxbXJB3CZmCZq1O6OJjXN
 XU626mIn8WlxuBe8QIpoEoVDKmIsEyrGh5J3bIU9G+0296mNsqqCIe5Uo1CHQpfV
 8botUu3zFrJbwJZIpWdcq3TeR80C0QEzBOXEa7TQe71YiQDRaa8hSfNY1giKO77Q
 ==
X-ME-Sender: <xms:7HLpYY3l2MK2TJgpnCbipluMexmNjyKWq0gdM-dG-fSIBC7UAjYPDA>
 <xme:7HLpYTGHiABwdoO_mFwRW9sr9jvljBkOowcAeUM0ti16aN4kdou-Mmy62IgPjTRY8
 EOf3xzhQAqYYs5U8Lw>
X-ME-Received: <xmr:7HLpYQ7uI_rF96sBqvdc10zxHDy0Ahk4QWFKUCvfg_Tgedc_HweXsLKWc-JEZ7QCc19SzDfgB0AXx6Jm8S4TxJW1m5xVomiow98N5X0>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvvddrudekgdeigecutefuodetggdotefrodftvf
 curfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfghnecu
 uegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenuc
 fjughrpefhvffufffkofgtggfgsehtqhertdertdejnecuhfhrohhmpeforgigihhmvgcu
 tfhiphgrrhguuceomhgrgihimhgvsegtvghrnhhordhtvggthheqnecuggftrfgrthhtvg
 hrnhepteetledtudejhffftdeugfduffelleelheejgeegffduvddvgfdvhffhlefgteff
 necuffhomhgrihhnpehkvghrnhgvlhdrohhrghenucevlhhushhtvghrufhiiigvpedtne
 curfgrrhgrmhepmhgrihhlfhhrohhmpehmrgigihhmvgestggvrhhnohdrthgvtghh
X-ME-Proxy: <xmx:7HLpYR1c-KZlB9nad9GnvjVg_wBr49VsBXCbBV9s3SM8wmibvcO4ZA>
 <xmx:7HLpYbEKgYe1Di-eageFA_bTY299DOzhWOEAkbJKzGJbO4WJ6MYGFA>
 <xmx:7HLpYa8vn3tI0OS0iU0FeHJEcqkLMZK6YYcfLtXYX8Bw-jCOC3aDkQ>
 <xmx:7HLpYa0_VshJ0UNBKODvwKAZldkUyWma3b8YqlWcxrUnQeMmW7b2Tg>
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Thu,
 20 Jan 2022 09:34:19 -0500 (EST)
From: Maxime Ripard <maxime@cerno.tech>
To: Mike Turquette <mturquette@baylibre.com>, Stephen Boyd <sboyd@kernel.org>
Subject: [PATCH v3 00/10] clk: Improve clock range handling
Date: Thu, 20 Jan 2022 15:34:07 +0100
Message-Id: <20220120143417.543744-1-maxime@cerno.tech>
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
  clk: Add Kunit tests for rate=0D
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
 drivers/clk/Kconfig               |   7 +=0D
 drivers/clk/Makefile              |   1 +=0D
 drivers/clk/bcm/clk-raspberrypi.c | 125 ++++++-=0D
 drivers/clk/clk-rate-test.c       | 603 ++++++++++++++++++++++++++++++=0D
 drivers/clk/clk.c                 |  51 ++-=0D
 drivers/gpu/drm/vc4/vc4_hdmi.c    |  13 -=0D
 drivers/gpu/drm/vc4/vc4_kms.c     |  11 +=0D
 include/linux/clk.h               |  11 +=0D
 8 files changed, 767 insertions(+), 55 deletions(-)=0D
 create mode 100644 drivers/clk/clk-rate-test.c=0D
=0D
-- =0D
2.34.1=0D
=0D
