Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id D28B533F411
	for <lists+dri-devel@lfdr.de>; Wed, 17 Mar 2021 16:44:12 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5F6506E5C1;
	Wed, 17 Mar 2021 15:44:04 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from new2-smtp.messagingengine.com (new2-smtp.messagingengine.com
 [66.111.4.224])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E8C176E598
 for <dri-devel@lists.freedesktop.org>; Wed, 17 Mar 2021 15:44:02 +0000 (UTC)
Received: from compute6.internal (compute6.nyi.internal [10.202.2.46])
 by mailnew.nyi.internal (Postfix) with ESMTP id 4EC99580A59;
 Wed, 17 Mar 2021 11:44:00 -0400 (EDT)
Received: from mailfrontend2 ([10.202.2.163])
 by compute6.internal (MEProxy); Wed, 17 Mar 2021 11:44:00 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cerno.tech; h=
 from:to:cc:subject:date:message-id:content-type:mime-version
 :content-transfer-encoding; s=fm2; bh=CAiLDoSItx0pSC/FiIbuGbnFu0
 7dNe1kfG4anUIh7Bk=; b=RVQr81k/rj6dKOgOYExs3DPP1/0upyQIGjpSPIvtgd
 95aGFyiH8xppUMRHfumPG94vpmNSe5ZUw1MtzF8HzFxIaNgKyX3euyAtO97MBPP7
 xLvWHOonxeMCrQ4snCJujKTBMVGnm3JeQfLQPxquJZESE+xFTO4TF1j+W+b0BizT
 /VOKXwgWVCpr8WDK5JAHE4cr5LIihhUhS+mzA9PBLSHPl6f/kC9/oI1ozfv1E4k7
 6bmsdjwhodcjeMWtkp+ANq/beMviFunUC2jknt+W3rU08OUvai3RjcLcQZBtahnx
 11dOlyFe2lzQ96rRjKmwGbKdLHidkK61BksxDWBY10Ig==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-transfer-encoding:content-type
 :date:from:message-id:mime-version:subject:to:x-me-proxy
 :x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm2; bh=CAiLDo
 SItx0pSC/FiIbuGbnFu07dNe1kfG4anUIh7Bk=; b=trviWG83ysLajWnUe0dQZ0
 DrT0IF4IcQvX0VXuonJYlr73xP8A8UXDmq1l5F/5DhdI0L9eDddOUZvQnIyi2816
 LBj/NtpfGTvU47Yk8OINohvxydtUbCCpVBn4M+wVi/LLvfv5kUEiVWEKAhNoiyhG
 s6g5pnvTRRLl7Tes/2cbBg9hkQBihS044usV1UI+Yt/C7/pKTN4dj6Oml0qXFt1U
 aSo+yWKNaKKJu+ngKFPaB/dgGPnxyUl4uFyW7X3K7jjHedPBDb1iZ8Doqkm85Ynt
 YkW1UY00SccdhiORHvVBG2hv8StF1+nYp9VNzD6FP+j06f0IWNjpqbICYPytwkTQ
 ==
X-ME-Sender: <xms:uiNSYA_q4Cn5uOiphdNhUJxXGqm0BxQ7edFw1aUp-u3RhuaWk7t51g>
 <xme:uiNSYIs-1_ab6bOk8e7zY6CGVP36hpFD0U88_tr-5NnZq-QPSMLaipz4-8SG3MIs6
 z9XGsfkMif8WlUccLU>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeduledrudefgedgkedvucetufdoteggodetrfdotf
 fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
 uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
 cujfgurhephffvufffkffotggggfesthhqredtredtjeenucfhrhhomhepofgrgihimhgv
 ucftihhprghrugcuoehmrgigihhmvgestggvrhhnohdrthgvtghhqeenucggtffrrghtth
 gvrhhnpeetieekgfffkeegkeeltdehudetteejgfekueevhffhteegudfgkedtueegfffg
 feenucfkphepledtrdekledrieekrdejieenucevlhhushhtvghrufhiiigvpedtnecurf
 grrhgrmhepmhgrihhlfhhrohhmpehmrgigihhmvgestggvrhhnohdrthgvtghh
X-ME-Proxy: <xmx:uiNSYGDbWqW9M_FLdqhddcMuBKpyxyfnmkxhu2SFK-tUKbiU-SlkQg>
 <xmx:uiNSYAcUK8ohlpAx7EY8dg1hJjso7TcUUcPdhNAYieS5EtQs0U1JOQ>
 <xmx:uiNSYFOVDY1jSWqNU35kkbGtgUQOrPzIj_oLkX3f3NEehnFP51ijpQ>
 <xmx:wCNSYLt46h2ZW81pfu9pplqQwNw8GD2PKGfXI7fIiUr7l4sETwIftQ>
Received: from localhost (lfbn-tou-1-1502-76.w90-89.abo.wanadoo.fr
 [90.89.68.76])
 by mail.messagingengine.com (Postfix) with ESMTPA id 3C955108006A;
 Wed, 17 Mar 2021 11:43:54 -0400 (EDT)
From: Maxime Ripard <maxime@cerno.tech>
To: Andrzej Hajda <a.hajda@samsung.com>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Daniel Vetter <daniel.vetter@intel.com>, David Airlie <airlied@linux.ie>,
 Jernej Skrabec <jernej.skrabec@siol.net>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Thomas Zimmermann <tzimmermann@suse.de>, Maxime Ripard <maxime@cerno.tech>,
 Neil Armstrong <narmstrong@baylibre.com>, Jonas Karlman <jonas@kwiboo.se>
Subject: [PATCH 00/18] drm/vc4: hdmi: Add Support for the YUV output
Date: Wed, 17 Mar 2021 16:43:34 +0100
Message-Id: <20210317154352.732095-1-maxime@cerno.tech>
X-Mailer: git-send-email 2.30.2
MIME-Version: 1.0
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
Cc: Tim Gover <tim.gover@raspberrypi.com>,
 Dave Stevenson <dave.stevenson@raspberrypi.com>,
 dri-devel@lists.freedesktop.org, bcm-kernel-feedback-list@broadcom.com,
 linux-rpi-kernel@lists.infradead.org, Phil Elwell <phil@raspberrypi.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi,

Here's an attempt at support the HDMI YUV output on the BCM2711 SoC found on
the RaspberryPi4.

I took the same approach than what dw-hdmi did already, turning a bunch of
functions found in that driver into helpers since they were fairly generic.

However, it feels a bit clunky overall and there's a few rough edges that
should be addressed in a generic manner:

  - while the format negociation makes sense for a bridge, it feels a bit
    over-engineered for a simple encoder where that setting could be a simple
    switch (and possibly a property?)

  - more importantly, whether we're choosing an YUV output or not is completely
    hidden away from the userspace even though it might have some effect on the
    visual quality output (thinking about YUV420 and YUV422 here mostly).

  - Similarly, the list we report is static and the userspace cannot change or
    force one mode over the other. We will always pick YUV444 over RGB444 if
    both are available for example.

While the first one might just be due to a lack of helpers, the second and
third ones are also feeling a bit inconsistent with how we're handling the
10/12 bit output for example

Let me know what you think,
Maxime

Maxime Ripard (18):
  drm: Introduce new HDMI helpers
  drm/bridge: Add HDMI output fmt helper
  drm/bridge: dw-hdmi: Use helpers
  drm/vc4: txp: Properly set the possible_crtcs mask
  drm/vc4: crtc: Skip the TXP
  drm/vc4: Rework the encoder retrieval code
  drm/vc4: hdmi: Add full range RGB helper
  drm/vc4: hdmi: Use full range helper in csc functions
  drm/vc4: hdmi: Remove limited_rgb_range
  drm/vc4: hdmi: Convert to bridge
  drm/vc4: hdmi: Move XBAR setup to csc_setup
  drm/vc4: hdmi: Replace CSC_CTL hardcoded value by defines
  drm/vc4: hdmi: Define colorspace matrices
  drm/vc4: hdmi: Change CSC callback prototype
  drm/vc4: hdmi: Rework the infoframe prototype
  drm/vc4: hdmi: Support HDMI YUV output
  drm/vc4: hdmi: Move the pixel rate calculation to a helper
  drm/vc4: hdmi: Force YUV422 if the rate is too high

 drivers/gpu/drm/Makefile                  |   2 +-
 drivers/gpu/drm/bridge/synopsys/dw-hdmi.c | 268 ++-------------
 drivers/gpu/drm/drm_bridge.c              | 118 +++++++
 drivers/gpu/drm/drm_hdmi.c                | 170 +++++++++
 drivers/gpu/drm/vc4/vc4_crtc.c            |  59 +++-
 drivers/gpu/drm/vc4/vc4_drv.c             |  41 +++
 drivers/gpu/drm/vc4/vc4_drv.h             |  26 +-
 drivers/gpu/drm/vc4/vc4_hdmi.c            | 399 +++++++++++++++-------
 drivers/gpu/drm/vc4/vc4_hdmi.h            |  13 +-
 drivers/gpu/drm/vc4/vc4_hdmi_regs.h       |   6 +
 drivers/gpu/drm/vc4/vc4_regs.h            |  19 ++
 drivers/gpu/drm/vc4/vc4_txp.c             |   2 +-
 include/drm/drm_bridge.h                  |   6 +
 include/drm/drm_hdmi.h                    |  24 ++
 14 files changed, 770 insertions(+), 383 deletions(-)
 create mode 100644 drivers/gpu/drm/drm_hdmi.c
 create mode 100644 include/drm/drm_hdmi.h

-- 
2.30.2

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
