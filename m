Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A5A2660F80C
	for <lists+dri-devel@lfdr.de>; Thu, 27 Oct 2022 14:52:55 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CF96610E610;
	Thu, 27 Oct 2022 12:52:52 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from wout5-smtp.messagingengine.com (wout5-smtp.messagingengine.com
 [64.147.123.21])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 79BFC10E610
 for <dri-devel@lists.freedesktop.org>; Thu, 27 Oct 2022 12:52:50 +0000 (UTC)
Received: from compute4.internal (compute4.nyi.internal [10.202.2.44])
 by mailout.west.internal (Postfix) with ESMTP id 450EA3200319;
 Thu, 27 Oct 2022 08:52:48 -0400 (EDT)
Received: from mailfrontend2 ([10.202.2.163])
 by compute4.internal (MEProxy); Thu, 27 Oct 2022 08:52:49 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cerno.tech; h=cc
 :cc:content-transfer-encoding:content-type:date:date:from:from
 :in-reply-to:message-id:mime-version:reply-to:sender:subject
 :subject:to:to; s=fm3; t=1666875167; x=1666961567; bh=w4o6iJ7JBa
 uRcECwk6ayW6TZMn6N9eDIwjNyi4S//jM=; b=MXPNuijom34tZHHhczZJN9FsX+
 RY1Gc9b5msDYB4o8xUH0ZNiceXpFJTPUu4cz38SibgDuKsA3hJLUILYbqHymnSo9
 glxrM5VwDx6uxa8Us4i6D9Og7CyBNvhoEpKtfD2hiTj5DwgXTcGOWemi++/CuRm7
 XCaCbb5iOS36GGMHfEY9UCcRRMOHDj+JSxJ3ukNMjtr19+4dxq3mF82b5T3ZYg0C
 8+gjr8XZP5cT3R/hw7ldzfaE2aqXX9k7t5VkAIbdzgNNP25RmeYLd1lUJkzCD3XD
 /luzTcUhRKji/Wh6Tz3Hldl3RHCrC7GbkR7tssm36K21m2j67mGLHpqiEvsw==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:cc:content-transfer-encoding
 :content-type:date:date:feedback-id:feedback-id:from:from
 :in-reply-to:message-id:mime-version:reply-to:sender:subject
 :subject:to:to:x-me-proxy:x-me-proxy:x-me-sender:x-me-sender
 :x-sasl-enc; s=fm3; t=1666875167; x=1666961567; bh=w4o6iJ7JBauRc
 ECwk6ayW6TZMn6N9eDIwjNyi4S//jM=; b=NBiLE0bo4USWxeGoE3J2bg69LK0WX
 Sp8PxzJZC52gfbRiulzbehfoivLxB5mrLAKWTm1RbEs3o6F6B059pC5yKzytPvpQ
 SOmXWUqyA709nKlxQ85BgSmrkduzUyYva+FLwoQjdtbaTKRNgWfg3QtCpTMcZKxW
 Q1QCne6KBKoEGDoDn8eFsQhPPyHz1MkPyltqtW27X9aB8SdXeHxzl3RAuyjaoznO
 CVuaV6xzR1iSFU8OXVnKl2Aqo301GZuo1XCinthCBkY9go8tIjAd4bAuGNIqYOIV
 1BnbKye+iTWD1kJPXxObpQLo2Sl2ohi8q9ELv4R7QajcaXaJT3vZBIvog==
X-ME-Sender: <xms:Hn9aY1q7ckPZo00GWOvUiSBRkSUHeKf5-ltYRm8-hkslcmkOQD1Rqw>
 <xme:Hn9aY3q9GtcxX43EAEct-PuzbMoxm6Ck6-ic9QlWlEfTGY8LMr3B_jYpgUfAA_faC
 aQjhgmGk8kihALEf0I>
X-ME-Received: <xmr:Hn9aYyOhdgyRs5rmilu5Fx4xYPGiovNxRPCQqUvNXPwcxsqvHMPTNtg9u5oQAzHYtxMem4TbQ9_NMjKKy__KY0vuQNF2yyosJtNadQdtyDbQcA>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvgedrtdeggdehhecutefuodetggdotefrodftvf
 curfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfghnecu
 uegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenuc
 fjughrpefugggtgffhfffkvfevofesthekredtredtjeenucfhrhhomhepofgrgihimhgv
 ucftihhprghrugcuoehmrgigihhmvgestggvrhhnohdrthgvtghhqeenucggtffrrghtth
 gvrhhnpeelueevteetffdvveelgfffleegudeufeelveefvddugeehkeefkeehjeeikeeg
 udenucffohhmrghinhepkhgvrhhnvghlrdhorhhgnecuvehluhhsthgvrhfuihiivgeptd
 enucfrrghrrghmpehmrghilhhfrhhomhepmhgrgihimhgvsegtvghrnhhordhtvggthh
X-ME-Proxy: <xmx:Hn9aYw56bw4fn04EJ5p8B5I_xXLFq_lmO4rH6k-yVh6g1lSD2CqjaQ>
 <xmx:Hn9aY05QSzJ2RGm9VGucSw0sefEPaApgyUTtjiuq4yZaAVIZHgVvJg>
 <xmx:Hn9aY4jhBUFPxDHE7oqLLr7e-XXPLzD5df97VYTD5hZLtnxEjFP9TQ>
 <xmx:H39aYxMvlnj5pUpwtB8Ii_uNNmC8g6CsZDIdETayLTWiES-Qe_ornw>
Feedback-ID: i8771445c:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Thu,
 27 Oct 2022 08:52:46 -0400 (EDT)
Subject: [PATCH v5 0/7] drm/vc4: Fix the core clock behaviour
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-b4-tracking: H4sIABh/WmMC/33OTQrCMBAF4KtI1k5JJj9tXXkPcdGkiQ1CK0kJSundnboTsavhDXxvZmHZp+gzOx
 0WlnyJOU4jBX08MDd0481D7Ckz5Ii8ERrSI0KIT1B3MBxEjbU0mitse0bGdtmDTd3ohk0VU/FtPcQ8
 T+n1uVKQxuVfYUHg0DYSa2MbGQyenU/jVM2eGq9UVeQul8SD06amh4QI/oerXa6Id8IqrtH0QX7zdV
 3fMcTxOTABAAA=
From: Maxime Ripard <maxime@cerno.tech>
Date: Thu, 27 Oct 2022 14:52:40 +0200
Message-Id: <20220815-rpi-fix-4k-60-v5-0-fe9e7ac8b111@cerno.tech>
To: Stephen Boyd <sboyd@kernel.org>, Florian Fainelli <f.fainelli@gmail.com>,
 Maxime Ripard <mripard@kernel.org>, Scott Branden <sbranden@broadcom.com>,
 Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>, 
 Michael Turquette <mturquette@baylibre.com>, Daniel Vetter <daniel@ffwll.ch>,
 Emma Anholt <emma@anholt.net>, 
 David Airlie <airlied@linux.ie>, Ray Jui <rjui@broadcom.com>
X-Mailer: b4 0.11.0-dev-99e3a
X-Developer-Signature: v=1; a=openpgp-sha256; l=3256; i=maxime@cerno.tech;
 h=from:subject:message-id; bh=D7FuhEopp2x9ehqwCkLl3TXHQsSl1JIzkh6YWIJGp30=;
 b=owGbwMvMwCX2+D1vfrpE4FHG02pJDMlR9TL/V8u61orwucrJzQ2+6yl7bo66mRHjGfNvgj+8Oudw
 fL/aUcrCIMbFICumyBIjbL4k7tSs151sfPNg5rAygQxh4OIUgIk8KWL4K/wnfP8hedcH8vHTK8+H7s
 1YLfHKPNbzJP9aI47QA+W+dgz/jBrX2G3JvcBx4V/35V//C5Q2Xe2JP/tjxizNp80ZvpGPuQA=
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
Cc: Stefan Wahren <stefan.wahren@i2se.com>,
 Dave Stevenson <dave.stevenson@raspberrypi.com>, linux-kernel@vger.kernel.org,
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
Changes in v5:
- Changed the bool name
- Change type of variable storing the max rate to unsigned int
- Link to v4: https://lore.kernel.org/r/20220815-rpi-fix-4k-60-v4-0-a1b40526df3e@cerno.tech

Changes in v4:
- Move the rpi_firmware_of_match to avoid confusion
- Link to v3: https://lore.kernel.org/r/20220815-rpi-fix-4k-60-v3-0-fc56729d11fe@cerno.tech

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

 drivers/clk/bcm/clk-raspberrypi.c          | 19 -----------
 drivers/firmware/raspberrypi.c             | 38 ++++++++++++++++++----
 drivers/gpu/drm/vc4/vc4_drv.h              | 16 +++++++++
 drivers/gpu/drm/vc4/vc4_hdmi.c             | 25 +++++++-------
 drivers/gpu/drm/vc4/vc4_hdmi.h             |  8 -----
 drivers/gpu/drm/vc4/vc4_hvs.c              | 26 +++++++++++++++
 drivers/gpu/drm/vc4/vc4_kms.c              | 13 +++++---
 include/soc/bcm2835/raspberrypi-firmware.h | 52 ++++++++++++++++++++++++++++++
 8 files changed, 147 insertions(+), 50 deletions(-)
---
base-commit: 9abf2313adc1ca1b6180c508c25f22f9395cc780
change-id: 20220815-rpi-fix-4k-60-17273650429d

Best regards,
-- 
Maxime Ripard <maxime@cerno.tech>
