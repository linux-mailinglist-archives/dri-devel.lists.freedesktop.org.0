Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 215C32A9181
	for <lists+dri-devel@lfdr.de>; Fri,  6 Nov 2020 09:35:58 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D0A5B6EE21;
	Fri,  6 Nov 2020 08:35:05 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from new3-smtp.messagingengine.com (new3-smtp.messagingengine.com
 [66.111.4.229])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 384536ED7C
 for <dri-devel@lists.freedesktop.org>; Thu,  5 Nov 2020 13:57:02 +0000 (UTC)
Received: from compute6.internal (compute6.nyi.internal [10.202.2.46])
 by mailnew.nyi.internal (Postfix) with ESMTP id 8C8AC58034B;
 Thu,  5 Nov 2020 08:57:00 -0500 (EST)
Received: from mailfrontend1 ([10.202.2.162])
 by compute6.internal (MEProxy); Thu, 05 Nov 2020 08:57:00 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cerno.tech; h=
 from:to:cc:subject:date:message-id:content-type:mime-version
 :content-transfer-encoding; s=fm1; bh=/SUue8If/RDXoikA8wmeLjgste
 Ds4PEf/i891dT0R/c=; b=vQlB0JudV+keM3oRXB26O3sX44vPzM/JU70TGVs2GK
 WmDxJ665BZO2yY/illL8KgDILz4GjTRP8NiSShlF1ua1hTXL1UV16c9s0KFnJbJn
 JymybJcHH6nJ/qBRclMTeh3V0sWid0RW2Ri3EUhLXmYc/ZJ63+a6a5LBclYOnwsw
 LAb2E53jbuWJ9bjzHG0/3NcIn/mlnHtt5ZE3q2DwagE4xAG+WQijfp5STg1/Gixl
 Gph2o3OlEEyajy3vDEi+ZNLNxHwu/c+aIV0xbMRmbHhPRyQA8O+GysZACgX27jvh
 diSpsWkhzQkI6ItXUdz6ykou2y3yKdZZIHeqWGeh3SGQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-transfer-encoding:content-type
 :date:from:message-id:mime-version:subject:to:x-me-proxy
 :x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm1; bh=/SUue8
 If/RDXoikA8wmeLjgsteDs4PEf/i891dT0R/c=; b=KT+K6Y5RthbYOgUM4SC+SF
 otWeM+YLBTTws4GM322vng6rKhnBFjHfzQo7J7cpoGAHpDGDJJ1BF8r4Ofq/Xt1c
 wjir1TiIKJDYl3MRjPCckxwBI9dGDVuxcQoZBu6LyXtINYJhllaTubRM+XXHWw/1
 pWmo0uKW0IPt+pbMH/M0o+a70Sj/MqNzCnyUSOiPdeYPWUVsoTBxrJyS8YLehkP+
 w5hZWsv45jCSh3w3Zji6MHxr/a/Q4MTE0f8HiJ6eP7vXAqAslsVd37fLn/61j+KO
 KoMKjit/u7f6oxvFIRgTf9VSG+VpBvw7D98NZUHET5EUHZG9KFejns+iAEtbOpBA
 ==
X-ME-Sender: <xms:qgSkX6yXANzLIIpAQqQMazRi5RigCn3ppkVH9nA-BcWMi-jY5vGxbg>
 <xme:qgSkX2Q4C3c-L-bqmYxAqnEtGYjGkI3fr90ZjLHMdDA6qmQX_Fg6jJqItiJ-kfIx7
 SfU2eIjlKD1hj_QJxE>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedujedruddtjedgheelucetufdoteggodetrfdotf
 fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
 uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
 cujfgurhephffvufffkffotggggfesthhqredtredtjeenucfhrhhomhepofgrgihimhgv
 ucftihhprghrugcuoehmrgigihhmvgestggvrhhnohdrthgvtghhqeenucggtffrrghtth
 gvrhhnpeetieekgfffkeegkeeltdehudetteejgfekueevhffhteegudfgkedtueegfffg
 feenucfkphepledtrdekledrieekrdejieenucevlhhushhtvghrufhiiigvpedtnecurf
 grrhgrmhepmhgrihhlfhhrohhmpehmrgigihhmvgestggvrhhnohdrthgvtghh
X-ME-Proxy: <xmx:qgSkX8UyAXCxErjJcln57g736-ZcIAG7DefeHw1vrUvQr1XI8YFLpw>
 <xmx:qgSkXwgIn6weNMT6YvfPXCUyBdPJxuCD7PME4gDw4QiWGoJqnw482Q>
 <xmx:qgSkX8BfkfSyGXWqKiW2CACO4EnuIOnCUqco8SCc9alBpnKZtSO5Dg>
 <xmx:rASkX6SDFqFcfyvrpxLtOxe6afbv3AqK8rHW8ImMRR9G0OAxv8rtdw>
Received: from localhost (lfbn-tou-1-1502-76.w90-89.abo.wanadoo.fr
 [90.89.68.76])
 by mail.messagingengine.com (Postfix) with ESMTPA id 76EFB3280261;
 Thu,  5 Nov 2020 08:56:58 -0500 (EST)
From: Maxime Ripard <maxime@cerno.tech>
To: Eric Anholt <eric@anholt.net>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Thomas Zimmermann <tzimmermann@suse.de>, Maxime Ripard <maxime@cerno.tech>,
 Daniel Vetter <daniel.vetter@intel.com>, David Airlie <airlied@linux.ie>,
 Mark Rutland <mark.rutland@arm.com>, Rob Herring <robh+dt@kernel.org>,
 Frank Rowand <frowand.list@gmail.com>
Subject: [PATCH v3 0/7] drm/vc4: Rework the HVS muxing code
Date: Thu,  5 Nov 2020 14:56:49 +0100
Message-Id: <20201105135656.383350-1-maxime@cerno.tech>
X-Mailer: git-send-email 2.28.0
MIME-Version: 1.0
X-Mailman-Approved-At: Fri, 06 Nov 2020 08:34:42 +0000
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
 dri-devel@lists.freedesktop.org, Hoegeun Kwon <hoegeun.kwon@samsung.com>,
 bcm-kernel-feedback-list@broadcom.com, linux-rpi-kernel@lists.infradead.org,
 Phil Elwell <phil@raspberrypi.com>, linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi,

Here's a second attempt at fixing the current issues we have with the
muxing code that results in a PV muxing its HVS muxing when only another
CRTC is modified by a state, or vblank timeouts when trying to wait for a
vblank on a single CRTC while another one is inactive but enabled.

Let me know what you think,
Maxime

Changes from v1:
  - Dropped the code trying to access all the CRTCs (whether in the state
    or not) state
  - Added Hoegeun Kwon's tags
  - Fixed a build bisection error
  - Cleaned up the private state using drmm_add_action_or_reset
  - Rebased on current linux next

Maxime Ripard (7):
  drm/vc4: kms: Switch to drmm_add_action_or_reset
  drm/vc4: kms: Remove useless define
  drm/vc4: kms: Rename NUM_CHANNELS
  drm/vc4: kms: Split the HVS muxing check in a separate function
  drm/vc4: kms: Document the muxing corner cases
  drm/vc4: kms: Store the unassigned channel list in the state
  drm/vc4: kms: Don't disable the muxing of an active CRTC

 drivers/gpu/drm/vc4/vc4_drv.h |   2 +
 drivers/gpu/drm/vc4/vc4_kms.c | 247 +++++++++++++++++++++++++---------
 2 files changed, 185 insertions(+), 64 deletions(-)

-- 
2.28.0

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
