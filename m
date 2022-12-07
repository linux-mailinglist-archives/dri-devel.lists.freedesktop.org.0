Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id D16DC6457C4
	for <lists+dri-devel@lfdr.de>; Wed,  7 Dec 2022 11:27:28 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 344B410E38F;
	Wed,  7 Dec 2022 10:27:22 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from out3-smtp.messagingengine.com (out3-smtp.messagingengine.com
 [66.111.4.27])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2544E10E38F
 for <dri-devel@lists.freedesktop.org>; Wed,  7 Dec 2022 10:27:17 +0000 (UTC)
Received: from compute5.internal (compute5.nyi.internal [10.202.2.45])
 by mailout.nyi.internal (Postfix) with ESMTP id 7C93F5C0114;
 Wed,  7 Dec 2022 05:27:15 -0500 (EST)
Received: from mailfrontend1 ([10.202.2.162])
 by compute5.internal (MEProxy); Wed, 07 Dec 2022 05:27:15 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cerno.tech; h=cc
 :cc:content-transfer-encoding:content-type:date:date:from:from
 :in-reply-to:message-id:mime-version:reply-to:sender:subject
 :subject:to:to; s=fm2; t=1670408835; x=1670495235; bh=loLEWF9/Hm
 qi4zpCJxwmMjkK/vA2L1bwza6NoHA9Kbc=; b=PpkJDUMfjfnmhoYYGZxyQgUL7T
 d1TlwuTPBSsGVB8ELxNhpZjzsfnLHZXApLQ5nKdjOrMEHWUG8z9LEg/f6R7bs6RL
 Ivvw/pXy3VCV05fbkEfdR0n+J4oDMHfysqv++7jSDSLkfQ4Wbo2gBx2m57zupLCf
 5dFWACyLgQq/N1RE3earoj/qjt3pMmIc4Xm1pSyFF9ljkmWHGUSgPpm0hf3pibSK
 bJQFPIlpD1IA8RNcrNJE324VeOUMS+01bROOUK7KqBoAOP+NcarHYNZEfnY4zqUA
 0Yr8I/teOEuRjjpriiAPbg5uW6nJFA3ZM7TCX+pqQqsLkK8kxN9Nhg03lQwg==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:cc:content-transfer-encoding
 :content-type:date:date:feedback-id:feedback-id:from:from
 :in-reply-to:message-id:mime-version:reply-to:sender:subject
 :subject:to:to:x-me-proxy:x-me-proxy:x-me-sender:x-me-sender
 :x-sasl-enc; s=fm1; t=1670408835; x=1670495235; bh=loLEWF9/Hmqi4
 zpCJxwmMjkK/vA2L1bwza6NoHA9Kbc=; b=QSbQJ6r1cM7ZZDUHUFeUP+i3vobGj
 vIWAKpFEzpIcVT3f/zQxqc8AbdhSWRrt+yK/fGB4NtVW0y6ShRiuIjA4z0nK1bKr
 Cxs8McLNSnhwwVGJWAeiKTpzLp6801m6d2TssAwxXl5KSYcRbUL71/tZJshI9N61
 Gy8Fb8MKNEbjWhvHQV0VRMHAz/tbgi1jDXgwhaYSKzKE1NeRe+VvxNIssW19qdwJ
 /BoQsovIP/7JhYVuIDF91evqmkl9stD8U/47BnaTPwCkqT6OdOB16kD6dtPTC9Iv
 tRA7AD1Pwz06Z3375HikhFF2GPdRtbF7EK7d18cn8hGnttfVAy20p/lLQ==
X-ME-Sender: <xms:g2qQY4GNeBKTSX3a7s58HVibk65yx-gk_SsdduvmEnQpWnyqDaWQRg>
 <xme:g2qQYxVCWMWm_F9ljE-rrX4w9OJwRGatnUgIYraPQVIskGyPPD90Rk-qLkIO1H2HP
 0kLu-45brUYlNUAiXk>
X-ME-Received: <xmr:g2qQYyJZr2rwsIBIghgxU5R8J1WTpuRh9I7gE6mU7ANKkkkE3S58ts5m_-eDWl4vxZbS22S4peO2wNdSx4W0g_4efjlZQgvNdUI5eSzFGYU-SA>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvhedrudekgddugecutefuodetggdotefrodftvf
 curfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfghnecu
 uegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenuc
 fjughrpefugggtgffhfffkvfevofesthejredtredtjeenucfhrhhomhepofgrgihimhgv
 ucftihhprghrugcuoehmrgigihhmvgestggvrhhnohdrthgvtghhqeenucggtffrrghtth
 gvrhhnpeevgfeiffffhfeugedvvdffgfevhfelgfehueeujeeiffejfffgleelvdffgeek
 keenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepmhgrihhlfhhrohhmpehmrg
 igihhmvgestggvrhhnohdrthgvtghh
X-ME-Proxy: <xmx:g2qQY6Hr-OK3xK9sJjnIYtQm5Ze1X-MzzXm_713VpAEReqsDjCcdMw>
 <xmx:g2qQY-W9Xlrz7XmZQRV4oaVP3pe2KMhqWhFuxMCfkct-DrS0MQPyCQ>
 <xmx:g2qQY9M09b55Sdme-UcQ1znxQkrBG3Fx9b_-xxKvPm1xNS5fmhmwGw>
 <xmx:g2qQY_sarJDSZ5yPd1Bv2HPVAMVa-ahQYfAx7Z-TML3JdLyIgO8g_A>
Feedback-ID: i8771445c:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Wed,
 7 Dec 2022 05:27:14 -0500 (EST)
Subject: [PATCH 0/6] drm/vc4: dsi: Conversion to bridge
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAHNpkGMC/w3LQQqAMAwAwa9IzhZqRER/0zTBBqRKg16kfzfHZd
 gPTJqKwT580ORV06t6TOMAuaR6SFD2BoyIE8Y1tFsDmwZqyq5xk5loicyC4BMlE7dUc/GtPufZ+w
 9avD+4ZQAAAA==
From: Maxime Ripard <maxime@cerno.tech>
Date: Wed, 07 Dec 2022 11:22:43 +0100
Message-Id: <20221207-rpi-dsi-bridge-v1-0-8f68ee0b0adb@cerno.tech>
To: Emma Anholt <emma@anholt.net>, Maxime Ripard <mripard@kernel.org>,
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>
X-Mailer: b4 0.11.0-dev-8c583
X-Developer-Signature: v=1; a=openpgp-sha256; l=1178; i=maxime@cerno.tech;
 h=from:subject:message-id; bh=wiRS50xN096d81HEbkRBXzZ5VsP627i9wgG9QKVbDkc=;
 b=owGbwMvMwCX2+D1vfrpE4FHG02pJDMkTMkv6WZTrlyZdSJ8y0SKcPWlmn4XEukK5uTF9DFqWjfFy
 a3Z1lLIwiHExyIopssQImy+JOzXrdScb3zyYOaxMIEMYuDgFYCI2ZYwMy7askeLeE9DGtYBBqvESR2
 /023ONahvmCIiqlKsxrXg7iZFh2mcGk5+3tbxeeh4zO/usvl1E49oBntAPZ1r4Z+mb3brCAAA=
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
Cc: Maxime Ripard <maxime@cerno.tech>, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org,
 Dave Stevenson <dave.stevenson@raspberrypi.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi,

This series converts the vc4 DSI driver to a bridge. It's been in use for a
while on the downstream tree.

Let me know what you think,
Maxime

To: Emma Anholt <emma@anholt.net>
To: Maxime Ripard <mripard@kernel.org>
To: David Airlie <airlied@gmail.com>
To: Daniel Vetter <daniel@ffwll.ch>
Cc: dri-devel@lists.freedesktop.org
Cc: linux-kernel@vger.kernel.org
Cc: Dave Stevenson <dave.stevenson@raspberrypi.com>
Signed-off-by: Maxime Ripard <maxime@cerno.tech>

---
Dave Stevenson (6):
      drm/vc4: dsi: Rename bridge to out_bridge
      drm/vc4: dsi: Move initialisation to encoder_mode_set
      drm/vc4: dsi: Remove splitting the bridge chain from the driver
      drm/vc4: dsi: Convert to use atomic operations
      drm/vc4: dsi: Convert to using a bridge instead of encoder
      drm/vc4: dsi: Remove entry to ULPS from vc4_dsi post_disable

 drivers/gpu/drm/vc4/vc4_dsi.c | 173 ++++++++++++++++++++++++------------------
 1 file changed, 99 insertions(+), 74 deletions(-)
---
base-commit: 99e2d98adc738597abcc5d38b03d0e9858db5c00
change-id: 20221207-rpi-dsi-bridge-09e3bb50dde2

Best regards,
-- 
Maxime Ripard <maxime@cerno.tech>
