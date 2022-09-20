Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 0D8365BE655
	for <lists+dri-devel@lfdr.de>; Tue, 20 Sep 2022 14:53:10 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8D0AC10E670;
	Tue, 20 Sep 2022 12:53:02 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from wout4-smtp.messagingengine.com (wout4-smtp.messagingengine.com
 [64.147.123.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F213F10E1B6
 for <dri-devel@lists.freedesktop.org>; Tue, 20 Sep 2022 12:52:59 +0000 (UTC)
Received: from compute4.internal (compute4.nyi.internal [10.202.2.44])
 by mailout.west.internal (Postfix) with ESMTP id D0D723200A08;
 Tue, 20 Sep 2022 08:52:54 -0400 (EDT)
Received: from mailfrontend1 ([10.202.2.162])
 by compute4.internal (MEProxy); Tue, 20 Sep 2022 08:52:56 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cerno.tech; h=cc
 :cc:content-transfer-encoding:content-type:date:date:from:from
 :in-reply-to:message-id:mime-version:reply-to:sender:subject
 :subject:to:to; s=fm2; t=1663678374; x=1663764774; bh=yTlflAyOUF
 EqTJEaTdC+96VGs2mVc7ugO0+0lZWQg2U=; b=H6M/gJpSlbKCZd/GdDoOoo1Qjc
 XyEKmSV3x9jatUq1YyLH0TQTkc17SPVxw2NQ6G4b3Z1gZ+4AsmpaAJ+Bn3L1aXFn
 2pLPC/Ff+hr8esFrYWvOXC9MbkoAYhjGQmNjXKkVPtI+NPJ1HGQxwLs5fytRlUF5
 vkIlUth54gv7IWn4X9a0GEjX5V2607FoEkFrvAXAXpLcmJzmVSPzb5GHZwCsoNYG
 YKfsO6ZoQU7JSKb0EGu06eq23TTQrNYQg+zjbQ3MSGOIBNROvimJo5lhF69PQ506
 oF66VGiur5Y9QhnLZdoVyomIr7BdhAW9zXE7ANg2XCohuUVJI67Wht+rmBVw==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:cc:content-transfer-encoding
 :content-type:date:date:feedback-id:feedback-id:from:from
 :in-reply-to:message-id:mime-version:reply-to:sender:subject
 :subject:to:to:x-me-proxy:x-me-proxy:x-me-sender:x-me-sender
 :x-sasl-enc; s=fm2; t=1663678374; x=1663764774; bh=yTlflAyOUFEqT
 JEaTdC+96VGs2mVc7ugO0+0lZWQg2U=; b=toIdzmZ0aH158pNAkNigqiSNmS4tN
 x1kN7uA9KnLhEaEiI20Nmw30730yC+5Kq3SfgsGhcF8PbvXdQ1yuMaoj8SbRf43t
 HnT0621dgVsK8ZhcIr1bZkwTKLTd5LALjdfgRYxvroem9xwZw/3y3aSikXK6cH17
 P9NDm9E6rESOO+y4iJ8mFqZb0QeZ80wvGixFw5SX7UCIBLdm0HL5xFcoXRnYnMAM
 QJQZ8J2g8m376WWvuWfpphKQ9ts/WvMMLmeu9JkPfdkIN5JUFYlycj2BJnyRFApq
 XGqse/9JXNDZbHviz/baVvOBUOeTv7+fP9tGvR/ojkF+gcldpgIF7q4DQ==
X-ME-Sender: <xms:pbcpY3juFeVJ3fb8xAsHzK544zSjhTLN2_nJVvNZ4GLbsPts3MUofg>
 <xme:pbcpY0B1LG01L_7tUNZBVKNQrore1uDRx02J0wSgRtmc4MnK2mjPzlJiJdQrjqe4t
 EkshVFcsq_lfhk5sT4>
X-ME-Received: <xmr:pbcpY3HEpfsZSNLjpfVl2LDAsFNjTUWeS1fa0K1GumvYQbsduKjAf7yvSB6h>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvfedrfedvledgheekucetufdoteggodetrfdotf
 fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
 uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
 cujfgurhepufggtgfghfffkffvvefosehtkeertdertdejnecuhfhrohhmpeforgigihhm
 vgcutfhiphgrrhguuceomhgrgihimhgvsegtvghrnhhordhtvggthheqnecuggftrfgrth
 htvghrnhepleeuveetteffvdevlefgffelgeduueefleevfedvudegheekfeekheejieek
 gedunecuffhomhgrihhnpehkvghrnhgvlhdrohhrghenucevlhhushhtvghrufhiiigvpe
 dtnecurfgrrhgrmhepmhgrihhlfhhrohhmpehmrgigihhmvgestggvrhhnohdrthgvtghh
X-ME-Proxy: <xmx:pbcpY0SWIW8i9uIykmatpvIvuk1Q-47KILBQqj6d2Je91uhUBF9hWg>
 <xmx:pbcpY0zXQTk8fug1yO-6lsRe3qtoqpT6c4aKf9jNItOqd47Uv6iCaw>
 <xmx:pbcpY66PbWsVKF40k46l2NSc5AL0EWqxQcTxROlXpBsyRbjfqPgqMA>
 <xmx:prcpYwDP_8T5BkHA7O4q-PEK5yxcdUHxqkOz8oUvloNe3YWRBUMLlQ>
Feedback-ID: i8771445c:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Tue,
 20 Sep 2022 08:52:53 -0400 (EDT)
Subject: [PATCH v2 0/7] drm/vc4: Fix the core clock behaviour
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-b4-tracking: H4sIAAu3KWMC/xXLQQ5FQAwA0KtI1ypVDP5txigayZBOIj8RdzeWb/FuSGIqCX7FDSaXJj1iBpcFhM
 3HVVDnbGBipqHu0E7FRf/Y7ugI6577xnXU8jhDPpNPgpP5GLZvXa4itODgeV6uj6ouagAAAA==
From: Maxime Ripard <maxime@cerno.tech>
Date: Tue, 20 Sep 2022 14:50:19 +0200
Message-Id: <20220815-rpi-fix-4k-60-v2-0-983276b83f62@cerno.tech>
To: Daniel Vetter <daniel@ffwll.ch>, Florian Fainelli <f.fainelli@gmail.com>,
 David Airlie <airlied@linux.ie>, 
 Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>, 
 Michael Turquette <mturquette@baylibre.com>,
 Scott Branden <sbranden@broadcom.com>, Stephen Boyd <sboyd@kernel.org>, 
 Emma Anholt <emma@anholt.net>, Ray Jui <rjui@broadcom.com>,
 Maxime Ripard <mripard@kernel.org>
X-Mailer: b4 0.10.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=2654; i=maxime@cerno.tech;
 h=from:subject:message-id; bh=Usxpco6HT+dQTlqIqrK9EZazz1b2NzHvAwZ5ALguFI8=;
 b=owGbwMvMwCX2+D1vfrpE4FHG02pJDMma2/lKci8obSraqdT4JPT8aaZrb0WW/Tjan3kw3uaXbN3+
 /gMhHaUsDGJcDLJiiiwxwuZL4k7Net3JxjcPZg4rE8gQBi5OAZjIN2WG/+HiPR+jXzcu0ZlmGbpzcU
 Xc3JSSX91d3Q9eV2a5Bi71k2RkONl/605SfMe/TyIzA+R3X/A913Eigi9ySsEzxxsLLjAd5wMA
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
Cc: linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 Maxime Ripard <maxime@cerno.tech>, Dom Cobley <popcornmix@gmail.com>,
 linux-clk@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-rpi-kernel@lists.infradead.org
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
Cc: linux-rpi-kernel@lists.infradead.org
Cc: linux-arm-kernel@lists.infradead.org
Cc: linux-kernel@vger.kernel.org
Cc: linux-clk@vger.kernel.org
Cc: dri-devel@lists.freedesktop.org
Cc: Dom Cobley <popcornmix@gmail.com>
Signed-off-by: Maxime Ripard <maxime@cerno.tech>

---

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
 drivers/firmware/raspberrypi.c             | 22 +++++++++++++
 drivers/gpu/drm/vc4/vc4_drv.h              | 16 ++++++++++
 drivers/gpu/drm/vc4/vc4_hdmi.c             | 25 ++++++++-------
 drivers/gpu/drm/vc4/vc4_hdmi.h             |  8 -----
 drivers/gpu/drm/vc4/vc4_hvs.c              | 26 +++++++++++++++
 drivers/gpu/drm/vc4/vc4_kms.c              | 13 +++++---
 include/soc/bcm2835/raspberrypi-firmware.h | 51 ++++++++++++++++++++++++++++++
 8 files changed, 136 insertions(+), 43 deletions(-)
---
base-commit: 521a547ced6477c54b4b0cc206000406c221b4d6
change-id: 20220815-rpi-fix-4k-60-17273650429d

Best regards,
-- 
Maxime Ripard <maxime@cerno.tech>
