Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 2EF8A605ABD
	for <lists+dri-devel@lfdr.de>; Thu, 20 Oct 2022 11:13:42 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 414D810E550;
	Thu, 20 Oct 2022 09:13:34 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from wnew2-smtp.messagingengine.com (wnew2-smtp.messagingengine.com
 [64.147.123.27])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CEB7B10E55D
 for <dri-devel@lists.freedesktop.org>; Thu, 20 Oct 2022 09:13:23 +0000 (UTC)
Received: from compute3.internal (compute3.nyi.internal [10.202.2.43])
 by mailnew.west.internal (Postfix) with ESMTP id 2CE182B05D99;
 Thu, 20 Oct 2022 05:13:19 -0400 (EDT)
Received: from mailfrontend1 ([10.202.2.162])
 by compute3.internal (MEProxy); Thu, 20 Oct 2022 05:13:21 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cerno.tech; h=cc
 :cc:content-transfer-encoding:content-type:date:date:from:from
 :in-reply-to:message-id:mime-version:reply-to:sender:subject
 :subject:to:to; s=fm3; t=1666257198; x=1666264398; bh=mv2l83sdMQ
 mtXju3veEb4whzGm3TG5FEEnnJETaLmU0=; b=BxEVtRx6zZlm/4oz1s4/rXCq5V
 UTXhSIg+tVvrQ04rq2/U+z8TMdLIIzn6IdPd+JkYezGQJnvdt9tXwWbaDjPIfNG6
 svZnaickH0ICblusxnNzaDzJcymxV7YK6kntoPLwrym9eJaK3JByUV6nf1aN7W/c
 xFDRUfjYqGefWoFuULeuBq+5s3c47f9J60I+tIFYFE8WPxva3v3jwQnB50za5Fcd
 82zhVK4ciHu6icvtNyJioGX6T99myPCM/M+GnMrOzKRWhuAOeKI+14ZMaknj9f1p
 Eol1vyUplgUic9ou2Mm2paYB0Ci8KBUGuuYKIwHKc7QVQX1QAI3jAiiuUNqg==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:cc:content-transfer-encoding
 :content-type:date:date:feedback-id:feedback-id:from:from
 :in-reply-to:message-id:mime-version:reply-to:sender:subject
 :subject:to:to:x-me-proxy:x-me-proxy:x-me-sender:x-me-sender
 :x-sasl-enc; s=fm3; t=1666257198; x=1666264398; bh=mv2l83sdMQmtX
 ju3veEb4whzGm3TG5FEEnnJETaLmU0=; b=QEEg+PXFOEd85QjJFC/Va3yUAWSMC
 6S2teTxbPm6TnUqKuJ1dOVe4p8mHEyd70BY5EHE5mTaDesxC1HEqe+NLHnm2uqRh
 BTkXxclxCtakA9pIRJLZgA1ihzMTIjrUKl3pwa7OTQI3axE6D27c9fT/oO2xyzzQ
 NpdrsBgnDG9ksSZ3Yvie+GeQqPSdIe9Mm3QVOXAQV0Jq8HlppmhxhMElE3Lfz3bg
 fCf9MlJ4e7E59gPFlTX7Tzh7qiuVgSBJLRWFgjkz2CSZPnyX9NdKreyEtXbNnKPb
 k3I/sXciyhuwjXyj3nRUa7zBmGzNzue5F11OSSdzCMvQQ9kl7QsINYviw==
X-ME-Sender: <xms:LhFRYxcQZkPA_8AaJgOD4xpIWJilbk_MTwhWwQmKjUdaUAh57jVWpA>
 <xme:LhFRY_OfE3Q8z_9MsPJ_DTY7l32Ubi0lYqFxpmOffTW3YJ6BEhfPTYBsqZos7m5Fl
 _mCQ5jkDsjH92fZTs4>
X-ME-Received: <xmr:LhFRY6jEczM4sSrBObhNEKexSd_4WHlkTY-LqNTzwOZcbX7RXO6kA13d07oaRjbdHAqzsxC5bBCQ3Znwze60V6a2vdq-fjAYUKs2C75RUI0eKQ>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvfedrfeeliedguddvucetufdoteggodetrfdotf
 fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
 uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
 cujfgurhephffugggtgfffkffvvefosehtkeertdertdejnecuhfhrohhmpehmrgigihhm
 vgestggvrhhnohdrthgvtghhnecuggftrfgrthhtvghrnhepledtieefgfffteeuheeufe
 fgvddtgfejgeeuteeitdetleeifeettdevhfelgfehnecuffhomhgrihhnpehkvghrnhgv
 lhdrohhrghenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepmhgrihhlfhhroh
 hmpehmrgigihhmvgestggvrhhnohdrthgvtghh
X-ME-Proxy: <xmx:LhFRY68XvSqpHk11cCJPMmRqD8ozWu5Zp0jcIO8XBF5x6WXd8QFr4g>
 <xmx:LhFRY9sTYukmqTb7j4C-xSJiOkpAKg0RLlkBgEpsVE4Spbgluoc_xg>
 <xmx:LhFRY5HSYzWRTTQKXgnFunkziG7iPsssXtjhVZhjLb53wo3hrdQ0Cg>
 <xmx:LhFRY0MGu7ij_6PcDK_w_0j6wGuqQ32S9Q7GDtXKzKjLrYUqLelH7VPbw08>
Feedback-ID: i8771445c:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Thu,
 20 Oct 2022 05:13:18 -0400 (EDT)
From: maxime@cerno.tech
Subject: [PATCH v4 0/7] drm/vc4: Fix the core clock behaviour
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-b4-tracking: H4sIAOgQUWMC/32OQQ6CMBBFr2K6dkg7hRZceQ/jAspUGpNiWtJoCHd3cOdCV5P/k/f+rCJTCpTF6b
 CKRCXkMEcO9fEg3NTHG0EYOQuUiLJVDaRHAB+eUN/BSFAWrTaNrLEbBTNDnwmG1Ec37VQxldzrKeRl
 Tq/PSkE+l1/CgiChazVaM7TaGzw7SnGuFmLjlVVF/8U14941xvJDSnn6wrdtewMpF4xY8QAAAA==
Date: Thu, 20 Oct 2022 11:12:08 +0200
Message-Id: <20220815-rpi-fix-4k-60-v4-0-a1b40526df3e@cerno.tech>
To: Daniel Vetter <daniel@ffwll.ch>, Emma Anholt <emma@anholt.net>,
 Michael Turquette <mturquette@baylibre.com>, 
 Stephen Boyd <sboyd@kernel.org>, Maxime Ripard <mripard@kernel.org>,
 Ray Jui <rjui@broadcom.com>, 
 Florian Fainelli <f.fainelli@gmail.com>, David Airlie <airlied@linux.ie>,
 Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>,
 Scott Branden <sbranden@broadcom.com>
X-Mailer: b4 0.10.1
X-Developer-Signature: v=1; a=openpgp-sha256; l=3056; i=maxime@cerno.tech;
 h=from:subject:message-id; bh=JajlL/w8KB/aQRhFW6egN7UoNaJPWKWmvTwp05GGwV8=;
 b=owGbwMvMwCX2+D1vfrpE4FHG02pJDMmBAi/zDu5mcGPaPFNp0ZPjVt/m17Nv7rmydWZL5G1Z79nn
 Q9pXdZSyMIhxMciKKbLECJsviTs163UnG988mDmsTCBDGLg4BWAil40Y/oe8dH+w5f0Jjdm5cx/rNW
 51N7Zdvt+7du6UWRNMpBZYuIYw/NP94p4743//uYPBD3XfLp195lDsosclH3IChQXY7Aq5YngA
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
 dri-devel@lists.freedesktop.org, Maxime Ripard <maxime@cerno.tech>,
 Dom Cobley <popcornmix@gmail.com>, linux-clk@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-rpi-kernel@lists.infradead.org
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
