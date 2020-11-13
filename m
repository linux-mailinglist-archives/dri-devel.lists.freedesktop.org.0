Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 123602B3AE2
	for <lists+dri-devel@lfdr.de>; Mon, 16 Nov 2020 02:07:41 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D7A1489CE0;
	Mon, 16 Nov 2020 01:07:22 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from new2-smtp.messagingengine.com (new2-smtp.messagingengine.com
 [66.111.4.224])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 20E986E53C
 for <dri-devel@lists.freedesktop.org>; Fri, 13 Nov 2020 15:32:22 +0000 (UTC)
Received: from compute6.internal (compute6.nyi.internal [10.202.2.46])
 by mailnew.nyi.internal (Postfix) with ESMTP id 13CB458032A;
 Fri, 13 Nov 2020 10:32:19 -0500 (EST)
Received: from mailfrontend2 ([10.202.2.163])
 by compute6.internal (MEProxy); Fri, 13 Nov 2020 10:32:19 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cerno.tech; h=
 from:to:cc:subject:date:message-id:content-type:mime-version
 :content-transfer-encoding; s=fm1; bh=7Zmgsv4bn6m3O58vV2b3+wNJJw
 TAQp+Lmd3f32mWRH4=; b=iKwpJqWWdMUWEN685FlV3gicMdrsWD9Lfg0cy0OB4F
 uJNz8P4rIL8+h9xnDvVJ4Vtt+iWfRxXO6AaG38+5A6zLgmC5xP+OwaqcaMNj0bqn
 /zGmeTWGkNbGNpzANZsmGhUkbTZp2ZkK5fdsKvLeATkmFJhWh47E9ycIRP1kPRwE
 gMJeo/VSgIFQJunZbEj+4viPnoM0Gesd/LZxNbBIRnHdxcd9qcqe1EjkbTSp8sWj
 4bu8MjmVpfIcmAN9aTYL16j6ibldN8tw98yOZwaW6BNkOOSsy4vfgEUd46CmMD1s
 gvd2TA1PHWH1Wa6DpOIKvz7wUAGdbcX/6NC9hQit6biQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-transfer-encoding:content-type
 :date:from:message-id:mime-version:subject:to:x-me-proxy
 :x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm1; bh=7Zmgsv
 4bn6m3O58vV2b3+wNJJwTAQp+Lmd3f32mWRH4=; b=CVIXaz06R0qdepac6VfUAA
 2zpKqKpJu+SFoq0b9dO+LK8yk6DB5UEG0EC+tBWja6/E3NY2QuDFllqYtmD9+Wcr
 H4OXFatu08gnmFgvxHzj3j5riKrFPHFwQ48vD5VtEuX2Ou5Qg75FCx2ZJKkuzjPc
 nJgJT/Nw1svD3penLAjwKgo1skQE9RhTd1PG9sfdBTY87xw5CvACxWmCzMRpH8DP
 9ArdhDsGd09989ldJbpggDMyzYA5fRuqsYEzT+y9O8g8DEgWCRkym1Sgq5gNt2N/
 aQsSbuSshUXI7ZXT86RDp1kmQTfDyxKK8hHdF4CFXH4FcmF+mWOYlT2Q2G5IJ2mw
 ==
X-ME-Sender: <xms:AaeuX8tqKDUZ2ts1s1GKLzLlaQYMUC1qKIqYQpmbrJ8hE7nd6N6N1A>
 <xme:AaeuX5f2Qbd7FM4_4ujycFqfM7mirLLFud3sqgZP3iQ-yeuoFfcjA4aTmgqy-R807
 3ilXKPczbV3xDa1GG8>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedujedruddvhedgjeejucetufdoteggodetrfdotf
 fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
 uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
 cujfgurhephffvufffkffotggggfesthhqredtredtjeenucfhrhhomhepofgrgihimhgv
 ucftihhprghrugcuoehmrgigihhmvgestggvrhhnohdrthgvtghhqeenucggtffrrghtth
 gvrhhnpeetieekgfffkeegkeeltdehudetteejgfekueevhffhteegudfgkedtueegfffg
 feenucfkphepledtrdekledrieekrdejieenucevlhhushhtvghrufhiiigvpedtnecurf
 grrhgrmhepmhgrihhlfhhrohhmpehmrgigihhmvgestggvrhhnohdrthgvtghh
X-ME-Proxy: <xmx:AaeuX3wANoeftHijL3xRCa9kjxqRdQyTcF-L52Ca5U_DC7-TOdv05A>
 <xmx:AaeuX_MIoVUHHtnbwhP8R5PMWFgC6d68RrSVC3YXYMODAj3uCuV_1w>
 <xmx:AaeuX8_l4llH0S6Z_z0-1Rwf_H1ZpJBPJtBYQC2EnU6XFWBsj2Ogqg>
 <xmx:A6euXwXOmjTlvVIMuZzrb-2kyQ4xRiJEAw3NNLbDYMr7DUXv6FSmpg>
Received: from localhost (lfbn-tou-1-1502-76.w90-89.abo.wanadoo.fr
 [90.89.68.76])
 by mail.messagingengine.com (Postfix) with ESMTPA id 58BA43064AAA;
 Fri, 13 Nov 2020 10:32:17 -0500 (EST)
From: Maxime Ripard <maxime@cerno.tech>
To: Mark Rutland <mark.rutland@arm.com>, Rob Herring <robh+dt@kernel.org>,
 Frank Rowand <frowand.list@gmail.com>, Eric Anholt <eric@anholt.net>,
 Daniel Vetter <daniel.vetter@intel.com>, David Airlie <airlied@linux.ie>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Thomas Zimmermann <tzimmermann@suse.de>, Maxime Ripard <maxime@cerno.tech>
Subject: [PATCH 0/8] vc4: Convert to drm_atomic_helper_commit
Date: Fri, 13 Nov 2020 16:29:48 +0100
Message-Id: <20201113152956.139663-1-maxime@cerno.tech>
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
