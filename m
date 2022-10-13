Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 8AD7D5FD6B4
	for <lists+dri-devel@lfdr.de>; Thu, 13 Oct 2022 11:13:30 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3CD5A10E552;
	Thu, 13 Oct 2022 09:13:16 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from out1-smtp.messagingengine.com (out1-smtp.messagingengine.com
 [66.111.4.25])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7E91E10E552
 for <dri-devel@lists.freedesktop.org>; Thu, 13 Oct 2022 09:13:13 +0000 (UTC)
Received: from compute2.internal (compute2.nyi.internal [10.202.2.46])
 by mailout.nyi.internal (Postfix) with ESMTP id 9A09B5C00EE;
 Thu, 13 Oct 2022 05:13:11 -0400 (EDT)
Received: from mailfrontend2 ([10.202.2.163])
 by compute2.internal (MEProxy); Thu, 13 Oct 2022 05:13:11 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cerno.tech; h=cc
 :cc:content-transfer-encoding:content-type:date:date:from:from
 :in-reply-to:message-id:mime-version:reply-to:sender:subject
 :subject:to:to; s=fm3; t=1665652391; x=1665738791; bh=0vEYkd8bix
 r3ku/BHWvI3mqVBiV48ootD5ag5Hu/HHs=; b=Yh3pLrftscvxWZtmtj2ioiEcla
 HOolYJoyvOR6PpCbsDWE+ZVDSKmQ8W7TPQYWBVFujwouweDFk2x9Cm/rDPRIQBjH
 /YvRcoR6N32KNORhClIO8IP8NKfzKXQSCxhU7U+7yxjHIweS9HDx3wfnC43Cz7s0
 eZy3qaUnFMxg2O/l4X8A6PHZS2AjGQNfVAINthPzPvlK6zRAoYIpciY6tCw4jwYj
 SV1Fth+TEUtpqLgC4Cik3xP164nTX2sKObQ2X7pHroO0tr+fBUNw1RVoEr9HCQ/s
 N0nULHp5CRf1Utg0WxPwRR2Im3ePeHlHYRPQZx3g8yeuxe8nNIHl/ucRb4QA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:cc:content-transfer-encoding
 :content-type:date:date:feedback-id:feedback-id:from:from
 :in-reply-to:message-id:mime-version:reply-to:sender:subject
 :subject:to:to:x-me-proxy:x-me-proxy:x-me-sender:x-me-sender
 :x-sasl-enc; s=fm3; t=1665652391; x=1665738791; bh=0vEYkd8bixr3k
 u/BHWvI3mqVBiV48ootD5ag5Hu/HHs=; b=LXt6dKGuNXrYQt30Ggwp18QnOBHiG
 xhsHYdDkoc3nODgNBUQ854lSgT/HxinHmQ91tx8dLVfVwNPxhySmPwk4DY0qapi4
 ZwT2dWwHgg2JAGd5eC9VnT+AQNcX+kKYdKzTKNrLcPsjQlGLUWtaZ0hMCuFeleQ7
 Vqm5l/K4v/qy9C94QOv/8cBZ1cKMRbCEPd+dcSk5XVljkH5aQPlTOhuQnwa/ggC0
 AxJgR1Wqc+m7PvbU9XeiWa2hnaBjvRV61KgPWjounO2Xu65ADbHA3mvkTdwKLv8W
 AyAahZRXPeIkcQkSLP3Gd2BSvFGt9xXE36M7uMaUmzaOWQhYZcsC3Qlog==
X-ME-Sender: <xms:ptZHYwU-qJ3y48ADIPjsH9KXPAt3JKJwuEhOH4173vMVifcdhPlztg>
 <xme:ptZHY0kC7RLRBC0Q2nCu5lERDC_f7XpPvAkusgBloIV-p8YivaqGIoqUqAaSEQczG
 RCQlKaTl8xgxPcmGtE>
X-ME-Received: <xmr:ptZHY0bno18vJzTRqJ2Gz7u4BDtGxpSLz7gsGJFCd2AdzuYRLBP5pEt0W0jv5rg3-KJAnBew4COp5PbgeOTlcawQw9sWOlIPDWBL>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvfedrfeektddgudegucetufdoteggodetrfdotf
 fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
 uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
 cujfgurhepufggtgfghfffkffvvefosehtkeertdertdejnecuhfhrohhmpeforgigihhm
 vgcutfhiphgrrhguuceomhgrgihimhgvsegtvghrnhhordhtvggthheqnecuggftrfgrth
 htvghrnhepleeuveetteffvdevlefgffelgeduueefleevfedvudegheekfeekheejieek
 gedunecuffhomhgrihhnpehkvghrnhgvlhdrohhrghenucevlhhushhtvghrufhiiigvpe
 dtnecurfgrrhgrmhepmhgrihhlfhhrohhmpehmrgigihhmvgestggvrhhnohdrthgvtghh
X-ME-Proxy: <xmx:ptZHY_XI_Sd7wb1FY_VcNo5eQiBOgttHJCfRvypgQ1gRyLUt4iELMw>
 <xmx:ptZHY6lyuv0o5yiHSSUK39B679xESKkyOZOkWKxbEtHDc9ht65TIBg>
 <xmx:ptZHY0dEGU6A_xK52Ys8ARXwmhNjvgHUTC07ZAmPst4CBsCRKQqGPA>
 <xmx:p9ZHY02zSNfYQkQHTl6gNo4i20sdeXn4YcZvUTyrdfULbKc27YKgCQ>
Feedback-ID: i8771445c:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Thu,
 13 Oct 2022 05:13:09 -0400 (EDT)
Subject: [PATCH v3 0/7] drm/vc4: Fix the core clock behaviour
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-b4-tracking: H4sIAKPWR2MC/3WNwQqDMBBEf0Vy7krcaNSe+h+lhySudSlESSS0SP69sfeehjfwZg4RKTBFca0OES
 hx5NUXUJdKuMX4JwFPhQVKRDk0HYSNYeY3tC/QEpoee6U72eI4ieJYEwlsMN4tp5V0Lc964biv4fN7
 SVji/m8wIUgYB4W9toOaNd4cBb/WO5XFR875C++5PxqyAAAA
From: Maxime Ripard <maxime@cerno.tech>
Date: Thu, 13 Oct 2022 11:13:07 +0200
Message-Id: <20220815-rpi-fix-4k-60-v3-0-fc56729d11fe@cerno.tech>
To: Florian Fainelli <f.fainelli@gmail.com>,
 Michael Turquette <mturquette@baylibre.com>, Emma Anholt <emma@anholt.net>, 
 Stephen Boyd <sboyd@kernel.org>, Ray Jui <rjui@broadcom.com>,
 Scott Branden <sbranden@broadcom.com>, 
 Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>,
 Daniel Vetter <daniel@ffwll.ch>, 
 David Airlie <airlied@linux.ie>, Maxime Ripard <mripard@kernel.org>
X-Mailer: b4 0.11.0-dev-7da52
X-Developer-Signature: v=1; a=openpgp-sha256; l=2888; i=maxime@cerno.tech;
 h=from:subject:message-id; bh=q5AgOh+USgAmEBoawabygqWU6QbAvt2sDptobotpAq8=;
 b=owGbwMvMwCX2+D1vfrpE4FHG02pJDMnu15b0S4qxu4mmZoZ1PdOP0bCo1bFZZVU/89SDLXGsffty
 taM7SlkYxLgYZMUUWWKEzZfEnZr1upONbx7MHFYmkCEMXJwCMJH3jowMC1O8bSL4a4+lvz6xe9Pr9w
 eC3HbO5gwubtddnmuUfMKklJHhTuqyaNVV77MyDhjZW1eluRsaVQhZVytWu0XXPjge/54LAA==
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
Cc: Stefan Wahren <stefan.wahren@i2se.com>, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, linux-rpi-kernel@lists.infradead.org,
 Dom Cobley <popcornmix@gmail.com>, linux-clk@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, Maxime Ripard <maxime@cerno.tech>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi,

Those patches used to be part of a larger clock fixes series:
https://lore.kernel.org/linux-clk/20220715160014.2623107-1-maxime@cerno.tech/

However, that series doesn't seem to be getting anywhere, so I've split out
these patches that fix a regression that has been there since 5.18 and that
prevents the 4k output from working on the RaspberryPi4.

Hopefully, we will be able to merge those patches through the DRM tree to avoid
any further disruption.

Let me know what you think,
Maxime

To: Florian Fainelli <f.fainelli@gmail.com>
To: Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>
To: Ray Jui <rjui@broadcom.com>
To: Scott Branden <sbranden@broadcom.com>
To: Michael Turquette <mturquette@baylibre.com>
To: Stephen Boyd <sboyd@kernel.org>
To: Emma Anholt <emma@anholt.net>
To: Maxime Ripard <mripard@kernel.org>
To: David Airlie <airlied@linux.ie>
To: Daniel Vetter <daniel@ffwll.ch>
Cc: Stefan Wahren <stefan.wahren@i2se.com>
Cc: linux-rpi-kernel@lists.infradead.org
Cc: linux-arm-kernel@lists.infradead.org
Cc: linux-kernel@vger.kernel.org
Cc: linux-clk@vger.kernel.org
Cc: dri-devel@lists.freedesktop.org
Cc: Dom Cobley <popcornmix@gmail.com>
Signed-off-by: Maxime Ripard <maxime@cerno.tech>

---
Changes in v3:
- Return UINT_MAX when the firmware call fails in the _get_max_rate function
- Link to v2: https://lore.kernel.org/r/20220815-rpi-fix-4k-60-v2-0-983276b83f62@cerno.tech

Changes in v2:
- Dropped the clock patches, made an ad-hoc function in the firmware driver
- Link to v1: https://lore.kernel.org/r/20220815-rpi-fix-4k-60-v1-0-c52bd642f7c6@cerno.tech

---
Dom Cobley (1):
      drm/vc4: hdmi: Add more checks for 4k resolutions

Maxime Ripard (6):
      firmware: raspberrypi: Introduce rpi_firmware_find_node()
      firmware: raspberrypi: Move the clock IDs to the firmware header
      firmware: raspberrypi: Provide a helper to query a clock max rate
      drm/vc4: hdmi: Fix hdmi_enable_4kp60 detection
      drm/vc4: hdmi: Rework hdmi_enable_4kp60 detection code
      drm/vc4: Make sure we don't end up with a core clock too high

 drivers/clk/bcm/clk-raspberrypi.c          | 18 -----------
 drivers/firmware/raspberrypi.c             | 27 ++++++++++++++++
 drivers/gpu/drm/vc4/vc4_drv.h              | 16 ++++++++++
 drivers/gpu/drm/vc4/vc4_hdmi.c             | 25 ++++++++-------
 drivers/gpu/drm/vc4/vc4_hdmi.h             |  8 -----
 drivers/gpu/drm/vc4/vc4_hvs.c              | 26 +++++++++++++++
 drivers/gpu/drm/vc4/vc4_kms.c              | 13 +++++---
 include/soc/bcm2835/raspberrypi-firmware.h | 51 ++++++++++++++++++++++++++++++
 8 files changed, 141 insertions(+), 43 deletions(-)
---
base-commit: 4fe89d07dcc2804c8b562f6c7896a45643d34b2f
change-id: 20220815-rpi-fix-4k-60-17273650429d

Best regards,
-- 
Maxime Ripard <maxime@cerno.tech>
