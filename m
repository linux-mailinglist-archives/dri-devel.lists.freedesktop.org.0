Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 0C5E92B3AE8
	for <lists+dri-devel@lfdr.de>; Mon, 16 Nov 2020 02:07:54 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A8B5D89D30;
	Mon, 16 Nov 2020 01:07:24 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from new2-smtp.messagingengine.com (new2-smtp.messagingengine.com
 [66.111.4.224])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 86BE16E527
 for <dri-devel@lists.freedesktop.org>; Fri, 13 Nov 2020 15:29:02 +0000 (UTC)
Received: from compute6.internal (compute6.nyi.internal [10.202.2.46])
 by mailnew.nyi.internal (Postfix) with ESMTP id CDDDC5804E5;
 Fri, 13 Nov 2020 10:29:01 -0500 (EST)
Received: from mailfrontend2 ([10.202.2.163])
 by compute6.internal (MEProxy); Fri, 13 Nov 2020 10:29:01 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cerno.tech; h=
 from:to:cc:subject:date:message-id:content-type:mime-version
 :content-transfer-encoding; s=fm1; bh=7Zmgsv4bn6m3O58vV2b3+wNJJw
 TAQp+Lmd3f32mWRH4=; b=WRPfIfSHGU3sAl1UCiB9Aa75i4yfD2u10zYRTYeRvF
 fCwWwGiWM6xYxRSbFNhySqG4W5ItSVQBzgI2e62eyoU7K+0tQKyeuFXcvVNrFu6X
 jfuqjZPiKHU9NjUHK0W2+zVk4Cg6hVeR5cXpwPpmBTBGp0tlizMYhPRZNm4r/mJA
 hNLbbKvg/UUfDzS4FasWpvzgmvwOZNBTMFZFgpuz4j6dVmimjhYFZAypdslmIanl
 gGt/AvChh8FqEeIuSSlCWIqb7xK5+jbl59xkvNBGfaL9QCvbzSakAJaq8CR447BC
 R9sAALqQ7iNQNRIgYmUVN6scj3X7pd7dEVvANHDCXETA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-transfer-encoding:content-type
 :date:from:message-id:mime-version:subject:to:x-me-proxy
 :x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm1; bh=7Zmgsv
 4bn6m3O58vV2b3+wNJJwTAQp+Lmd3f32mWRH4=; b=GsQS8GfFe9tTtDUOvyR8j1
 CUl73cMBGvjtsyGxZXOPLNWpe8yWBLTFInxb7Q15/C0Eu4kwOXRW91gg6VQzDh/d
 bqpt5ezxpYaceEkMRNMYcU+CyBse7sUHR3QwwBg14FrSFHuG7VIDGhR33ztmaHhN
 Qt3/NbgisTxb31kpmT0aMyVBav3PmyiM+uFnfV+5vOEyf5fqzGjUpUbh/8Vnq4kP
 +28rTYXS88M/XemrJF+fnuB8nxIyVt39B+0s4uuWQ0LHQt1Uiqjm69AAJ9pZHW0c
 yMrBSBRwGMdocpSvAFBVzMVAJRZ2VE0osFE6Nq6IRzFYUGKKFRcRYa1fDzNlGeCA
 ==
X-ME-Sender: <xms:PaauX_ynIF1AXkZWYi8onJZduqoYyJxOdfCk9koLRAiRc3NAoYw38A>
 <xme:PaauX3QKGqpZ-tVSCoQBn3Gtruaw5HEdOh40TeK4hZ3shOvHDxo7vKGjYtT9YnrzT
 7JawkDuXCEfXJUx3Ho>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedujedruddvhedgjeeiucetufdoteggodetrfdotf
 fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
 uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
 cujfgurhephffvufffkffotggggfesthhqredtredtjeenucfhrhhomhepofgrgihimhgv
 ucftihhprghrugcuoehmrgigihhmvgestggvrhhnohdrthgvtghhqeenucggtffrrghtth
 gvrhhnpeetieekgfffkeegkeeltdehudetteejgfekueevhffhteegudfgkedtueegfffg
 feenucfkphepledtrdekledrieekrdejieenucevlhhushhtvghrufhiiigvpedunecurf
 grrhgrmhepmhgrihhlfhhrohhmpehmrgigihhmvgestggvrhhnohdrthgvtghh
X-ME-Proxy: <xmx:PaauX5UDywQ6NThDLcN6QC_H2wWq7fC0nJi1gCkKtfzh-krURrANXQ>
 <xmx:PaauX5jQ5zcx0t8Kbc8fZRdpLP9EAwJw4ZuNJ00MabZSjmBfmt5i1A>
 <xmx:PaauXxAlgGvGJkR-qNpXTQgTLXvVMVb9yGKkAO9Sc8Qy_etIxIyiqQ>
 <xmx:PaauX5ZWnq8AsQ4tEY4EOmZ8vgvQFxsBF4354ZrK_YDlQXDeCdzvSg>
Received: from localhost (lfbn-tou-1-1502-76.w90-89.abo.wanadoo.fr
 [90.89.68.76])
 by mail.messagingengine.com (Postfix) with ESMTPA id 401313064AB4;
 Fri, 13 Nov 2020 10:29:01 -0500 (EST)
From: Maxime Ripard <maxime@cerno.tech>
To: Mark Rutland <mark.rutland@arm.com>, Rob Herring <robh+dt@kernel.org>,
 Frank Rowand <frowand.list@gmail.com>, Eric Anholt <eric@anholt.net>,
 Daniel Vetter <daniel.vetter@intel.com>, David Airlie <airlied@linux.ie>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Thomas Zimmermann <tzimmermann@suse.de>, Maxime Ripard <maxime@cerno.tech>
Subject: [PATCH 0/8] vc4: Convert to drm_atomic_helper_commit
Date: Fri, 13 Nov 2020 16:28:51 +0100
Message-Id: <20201113152859.139335-1-maxime@cerno.tech>
X-Mailer: git-send-email 2.28.0
MIME-Version: 1.0
X-Mailman-Approved-At: Mon, 16 Nov 2020 01:07:21 +0000
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
Cc: devicetree@vger.kernel.org, Tim Gover <tim.gover@raspberrypi.com>,
 Dave Stevenson <dave.stevenson@raspberrypi.com>,
 dri-devel@lists.freedesktop.org, bcm-kernel-feedback-list@broadcom.com,
 linux-rpi-kernel@lists.infradead.org, Phil Elwell <phil@raspberrypi.com>,
 linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi,

Here's a conversion of vc4 to remove the hand-rolled atomic_commit helper from
vc4 in favour of the generic one.

This requires some rework of vc4, but also a new hook and some documentation
for corner-cases in the DRM core that have been reported and explained by
Daniel recently.

Let me know what you think,
Maxime

Maxime Ripard (8):
  drm: Introduce an atomic_commit_setup function
  drm: Document use-after-free gotcha with private objects
  drm/vc4: kms: Move HVS state helpers around
  drm/vc4: kms: Simplify a bit the private obj state hooks
  drm/vc4: Simplify a bit the global atomic_check
  drm/vc4: kms: Wait on previous FIFO users before a commit
  drm/vc4: kms: Remove async modeset semaphore
  drm/vc4: kms: Convert to atomic helpers

 drivers/gpu/drm/drm_atomic_helper.c      |   6 +
 drivers/gpu/drm/vc4/vc4_crtc.c           |  13 --
 drivers/gpu/drm/vc4/vc4_drv.h            |   2 -
 drivers/gpu/drm/vc4/vc4_kms.c            | 269 +++++++++++------------
 include/drm/drm_atomic.h                 |  18 ++
 include/drm/drm_modeset_helper_vtables.h |  18 ++
 6 files changed, 173 insertions(+), 153 deletions(-)

-- 
2.28.0

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
