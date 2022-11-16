Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 203E462B638
	for <lists+dri-devel@lfdr.de>; Wed, 16 Nov 2022 10:17:41 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5477410E449;
	Wed, 16 Nov 2022 09:17:38 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from out2-smtp.messagingengine.com (out2-smtp.messagingengine.com
 [66.111.4.26])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D79B110E44C
 for <dri-devel@lists.freedesktop.org>; Wed, 16 Nov 2022 09:17:23 +0000 (UTC)
Received: from compute5.internal (compute5.nyi.internal [10.202.2.45])
 by mailout.nyi.internal (Postfix) with ESMTP id 018D05C0135;
 Wed, 16 Nov 2022 04:17:23 -0500 (EST)
Received: from mailfrontend2 ([10.202.2.163])
 by compute5.internal (MEProxy); Wed, 16 Nov 2022 04:17:23 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cerno.tech; h=cc
 :cc:content-transfer-encoding:date:date:from:from:in-reply-to
 :in-reply-to:message-id:mime-version:references:reply-to:sender
 :subject:subject:to:to; s=fm2; t=1668590242; x=1668676642; bh=Rw
 Uykb/iqubbswUUCNf44Y0WfA2Nq+FieB2GLHcmZE8=; b=hV1oWcE8PhoZbG2Ojx
 dDaWg4TWokIevb1x6PD121oKeXobpaClxv/KhYdyASLEa/Mc6EdJ0ECQjbYyIh9d
 A+/lyz1h70/jCseOGHyATJQ6nd+8Md2HhdD6hTNYDSk857pN1GqnasxstUgGKeZF
 SCPPGdP0OBYI/jEO4+eLKPILwWFX7OVe24X5u2EYPi5FS25wjAcJDqHqmJfsQHvS
 8YDoryeQiyhacpSd2QfsvAxDWxZ63daQNJDFpzP1TsK6rpV7fQwwUCGS1I/7OgvN
 czOtchPJK88dh4N7qpSk0e6JSJu2PabpnenVtJlppOLXM1LXcFdhnnm4SsMzddcZ
 MDbg==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:cc:content-transfer-encoding:date:date
 :feedback-id:feedback-id:from:from:in-reply-to:in-reply-to
 :message-id:mime-version:references:reply-to:sender:subject
 :subject:to:to:x-me-proxy:x-me-proxy:x-me-sender:x-me-sender
 :x-sasl-enc; s=fm1; t=1668590242; x=1668676642; bh=RwUykb/iqubbs
 wUUCNf44Y0WfA2Nq+FieB2GLHcmZE8=; b=LDAhTobKekHP7uP4Vd2rpJ/4UjDl6
 jqh3VlR7FZSK8mFgb83GfkTf3qHLyUcdEerdnKu/6CDp/hYeSLwtrsp1UVzkdTm5
 s/7dwC6+4NCAL7Cf7fiQGf4BWT+IwZBC1lYmmzHf0k/P6jHF2aJqwEGLg+kPrukr
 JcCKKkh5GY4GV0SyDHEXBFa3TLD6S5xWSe4KW/sZr9z8KzNR8t+/94wOCMSxl3av
 5Tma3+JQ5dtIqIhZAwfM3d3/YZcTwfLyWgxZWSHuT3QNksd2wblzUom5tCvQb5F/
 p6qc2yeodt4zkwt6BVxv8mItOrnkE5x2BzFytfhvflFxUFzPEbjBCwv3A==
X-ME-Sender: <xms:oap0Y6RJiqLB3N_1rRkk2nCtwQZcVfnTUmruI02HF7ONf7Oe5xMmTg>
 <xme:oap0Y_zOMNZVwlFvyIryQ7PzkVe6aQd7p_VSwE01Gu0Su-p7X6wNnz4SWvF79CwzU
 y61xKhtm0Gu7aXV6zw>
X-ME-Received: <xmr:oap0Y33hblx8HR00X0VtIvXwUjKUxEc9Wc5Et70wfXvqSoSieV4b5SOxQ_PqvnikAOc21pAO3XlQx-0QriiOXWlmf-dWn9y9Nh97xz_hTWePTA>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvgedrgeehgdduvdekucetufdoteggodetrfdotf
 fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
 uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
 cujfgurhephffvvefufffkofgjfhgggfestdekredtredttdenucfhrhhomhepofgrgihi
 mhgvucftihhprghrugcuoehmrgigihhmvgestggvrhhnohdrthgvtghhqeenucggtffrrg
 htthgvrhhnpeelkeefteduhfekjeeihfetudfguedvveekkeetteekhfekhfdtlefgfedu
 vdejhfenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepmhgrihhlfhhrohhmpe
 hmrgigihhmvgestggvrhhnohdrthgvtghh
X-ME-Proxy: <xmx:oap0Y2C864NHHId6olyX99wchc10kezZyiUOPt9zddUNWMG8P6uQ0A>
 <xmx:oap0Yzg5YRu1cNHpZlY-x3TtSoW0OPiE29OM6LFdguFk3eqee5H22Q>
 <xmx:oap0YypJVNKSRxHOBCJgG_1PVoyJ9Dc0YBzW2KeEKI9MSWInEin5Zg>
 <xmx:oqp0Y8blhpkQ8vM29pyz72964zPRoqJPU7dCpzQr_GPSCcPbLfq-Tg>
Feedback-ID: i8771445c:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Wed,
 16 Nov 2022 04:17:21 -0500 (EST)
From: Maxime Ripard <maxime@cerno.tech>
To: Daniel Vetter <daniel.vetter@intel.com>, David Airlie <airlied@linux.ie>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Thomas Zimmermann <tzimmermann@suse.de>, Maxime Ripard <maxime@cerno.tech>,
 Florian Fainelli <f.fainelli@gmail.com>
Subject: [PATCH 3/3] firmware: raspberrypi: Fix type assignment
Date: Wed, 16 Nov 2022 10:17:12 +0100
Message-Id: <20221116091712.1309651-3-maxime@cerno.tech>
X-Mailer: git-send-email 2.38.1
In-Reply-To: <20221116091712.1309651-1-maxime@cerno.tech>
References: <20221116091712.1309651-1-maxime@cerno.tech>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
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
Cc: bcm-kernel-feedback-list@broadcom.com, linux-rpi-kernel@lists.infradead.org,
 dri-devel@lists.freedesktop.org, kernel test robot <lkp@intel.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

We silently cast an unsigned int into a __le32 which makes sparse
complain. Moreover, we never actually convert endianness between the
CPU's and the expected little-endian value. Fix both at once by calling
cpu_to_le32().

Fixes: 40c31955e4e9 ("firmware: raspberrypi: Provide a helper to query a clock max rate")
Reported-by: kernel test robot <lkp@intel.com>
Signed-off-by: Maxime Ripard <maxime@cerno.tech>
---
 include/soc/bcm2835/raspberrypi-firmware.h | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/include/soc/bcm2835/raspberrypi-firmware.h b/include/soc/bcm2835/raspberrypi-firmware.h
index ab955591cb72..73cac8d0287e 100644
--- a/include/soc/bcm2835/raspberrypi-firmware.h
+++ b/include/soc/bcm2835/raspberrypi-firmware.h
@@ -170,7 +170,7 @@ struct rpi_firmware_clk_rate_request {
 
 #define RPI_FIRMWARE_CLK_RATE_REQUEST(_id)	\
 	{					\
-		.id = _id,			\
+		.id = cpu_to_le32(_id),		\
 	}
 
 #if IS_ENABLED(CONFIG_RASPBERRYPI_FIRMWARE)
-- 
2.38.1

