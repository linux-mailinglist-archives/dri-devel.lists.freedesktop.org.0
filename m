Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 9543C5183FD
	for <lists+dri-devel@lfdr.de>; Tue,  3 May 2022 14:13:54 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C8DDF10F86A;
	Tue,  3 May 2022 12:13:52 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from wout5-smtp.messagingengine.com (wout5-smtp.messagingengine.com
 [64.147.123.21])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1C04A10F76C
 for <dri-devel@lists.freedesktop.org>; Tue,  3 May 2022 12:13:50 +0000 (UTC)
Received: from compute4.internal (compute4.nyi.internal [10.202.2.44])
 by mailout.west.internal (Postfix) with ESMTP id BFED1320097E;
 Tue,  3 May 2022 08:13:47 -0400 (EDT)
Received: from mailfrontend2 ([10.202.2.163])
 by compute4.internal (MEProxy); Tue, 03 May 2022 08:13:48 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cerno.tech; h=cc
 :cc:content-transfer-encoding:content-type:date:date:from:from
 :in-reply-to:message-id:mime-version:reply-to:sender:subject
 :subject:to:to; s=fm3; t=1651580027; x=1651666427; bh=4kr9H9vb88
 H9aWHTvEtFCsJbyLtv7DyoTOexq9VzQUQ=; b=w8IbTybfNG6f+SEk0LdFSflvLH
 DAsOAI8vinIPfxTV59UXX/m2qnzVQC9LrJgRW4I8YTxE7uDY6ZE2sWKWSGqcQ12J
 9t7KqxQFbneEhqsaDxAc+ozBEAq5RrnlV8H6R37r74CZ4FtLY4cie2UNa8dxJnkJ
 I0eWMuaWmkna1ZMldm/RpNJRZgb4Hb4t7VYolG/JhgePIfj30JOoL8e3xv1PpCf7
 SJBdCeooknbzMdnzz+X+KZsWbVvaB0LORW1Q5GOHFSq+hLWcSLQqCqgzzVWnr+Pg
 9U5y+IvcJ6U1d05dfr+IfCC1V0uB+vDRxLttD5+bL+LFJeyRRLOOHT91AjPg==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:cc:content-transfer-encoding
 :content-type:date:date:from:from:in-reply-to:message-id
 :mime-version:reply-to:sender:subject:subject:to:to:x-me-proxy
 :x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm1; t=
 1651580027; x=1651666427; bh=4kr9H9vb88H9aWHTvEtFCsJbyLtv7DyoTOe
 xq9VzQUQ=; b=bD1ncg+/tNq4MP0hCXY7t77xDFZS18KVV7IrGIETMwbE6lqKt6U
 qqe8zpXfl+dxAUcP48ujP49VgoPCWPN0jQpD0ysTqJ2Uyegw6X/P+k6NCRfYsqlT
 jpoWjhUDkiUxC/yIYfzabgxEnTzLazQdQEJoOYcJTGudIKG1/T9aWu3lnHzbHqq3
 YnrvFDJVdbOwdC9ZhLvHbraiabAZhDRrP21FLgw5UCl5geXe4CPGqUB10w2CJx6H
 FTXSqkhVNuFziaeOYrGdWElwoBeQQrE3CrMR/QjeP1z/TJ6Z0Eus/LzgIsaf75k2
 H+ZbUvSFCCpQ6qeT3Jn0tX9sD7g4Cmjgfbg==
X-ME-Sender: <xms:eRxxYvqJdsEItEYSrMyA0V5MYoQATG1bAj5y67_3WUcwfZm1s2o3tQ>
 <xme:eRxxYpp33SX6ysLF9M5fxHyyxW-CYujxtxQxAwoOYfmmfy4yf5ohL-gfcyiub7uXS
 2iKUmLCAluXLzax71M>
X-ME-Received: <xmr:eRxxYsOgGN6nJO9tFq2RAL0OCZUC8IeBqbKvtDDDWA9TBcvDcBZBFvyFqIgZXDWRup8tsRj71kigGgCW2r1_UWgPaAc9sZZKexzA_gg>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvfedrvdejgdeglecutefuodetggdotefrodftvf
 curfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfghnecu
 uegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenuc
 fjughrpefhvfevufffkffotggggfesthhqredtredtjeenucfhrhhomhepofgrgihimhgv
 ucftihhprghrugcuoehmrgigihhmvgestggvrhhnohdrthgvtghhqeenucggtffrrghtth
 gvrhhnpeelhefhgeefiedtgeeggfduffdtkeefleekfedvheeiudejgffgveekudetfeeu
 keenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepmhgrihhlfhhrohhmpehmrg
 igihhmvgestggvrhhnohdrthgvtghh
X-ME-Proxy: <xmx:eRxxYi4Rk0MFMLgVhxxQzlxXVqq_A5I8P9_FBqumFsLHl9UfTA7U9Q>
 <xmx:eRxxYu5oud1Bb_pRVTSa9dem-Ltf2RueZhRjigRR1M7Us8g_4A5hcg>
 <xmx:eRxxYqgdhpzqBPgAG5GWGFUKH0OtSHc7rKYwt0AqFRqjSxneSqJ3uw>
 <xmx:exxxYgQbwzgBthhxf6VcOu0mnTNUodfjuZyc94vrSAneaN_uQCoyYA>
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Tue,
 3 May 2022 08:13:44 -0400 (EDT)
From: Maxime Ripard <maxime@cerno.tech>
To: Daniel Vetter <daniel.vetter@intel.com>, David Airlie <airlied@linux.ie>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Thomas Zimmermann <tzimmermann@suse.de>, Maxime Ripard <maxime@cerno.tech>
Subject: [PATCH 00/14] drm/vc4: Properly separate v3d on BCM2711,
 and fix frame ordering
Date: Tue,  3 May 2022 14:13:27 +0200
Message-Id: <20220503121341.983842-1-maxime@cerno.tech>
X-Mailer: git-send-email 2.35.1
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
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
Cc: Melissa Wen <mwen@igalia.com>, dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi,=0D
=0D
Here's a series that fixes a significant issue we missed when adding suppor=
t=0D
for the BCM2711 / RaspberryPi4 in the vc4 driver.=0D
=0D
Indeed, before the introduction of the BCM2711 support, the GPU was fairly=
=0D
intertwined with the display hardware, and was thus supported by the vc4=0D
driver. Among other things, the driver needed to accomodate for a bunch of=
=0D
hardware limitations (such as a lack of IOMMU) by implementing a custom mem=
ory=0D
management backend, tied with the v3d hardware.=0D
=0D
On the BCM2711, that GPU got moved into a completely separate hardware bloc=
k=0D
and thus we gained a new driver for it, v3d.=0D
=0D
However, when we introduced the display support for the BCM2711 in vc4, we=
=0D
didn't properly split out the v3d-related functions and ended up reusing a=
=0D
significant portion of the code supposed to be backed by the v3d.=0D
=0D
This created a bunch of easy to miss issues that would only pop up with IGT=
=0D
tests, or when heavily testing some features (like asynchronous page-flippi=
ng).=0D
=0D
This series properly does the split now by creating separate code path wher=
e=0D
relevant, adds a loud complain when we use a v3d entry-point on the BCM2711=
,=0D
and fixes an issue where we would just ignore any fence on an asynchronous=
=0D
page-flip, resulting in frames appearing out-of-order for some workloads.=0D
=0D
Let me know what you think,=0D
Maxime=0D
=0D
Maxime Ripard (14):=0D
  drm/vc4: plane: Prevent async update if we don't have a dlist=0D
  drm/vc4: Consolidate Hardware Revision Check=0D
  drm/vc4: bo: Rename vc4_dumb_create=0D
  drm/vc4: bo: Split out Dumb buffers fixup=0D
  drm/vc4: drv: Register a different driver on BCM2711=0D
  drm/vc4: kms: Register a different drm_mode_config_funcs on BCM2711=0D
  drm/vc4: plane: Register a different drm_plane_helper_funcs on BCM2711=0D
  drm/vc4: drv: Skip BO Backend Initialization on BCM2711=0D
  drm/vc4: crtc: Use an union to store the page flip callback=0D
  drm/vc4: crtc: Move the BO handling out of common page-flip callback=0D
  drm/vc4: crtc: Move the BO Handling out of Common Page-Flip Handler=0D
  drm/vc4: crtc: Don't call into BO Handling on Async Page-Flips on=0D
    BCM2711=0D
  drm/vc4: crtc: Fix out of order frames during asynchronous page flips=0D
  drm/vc4: Warn if some v3d code is run on BCM2711=0D
=0D
 drivers/gpu/drm/vc4/vc4_bo.c               |  62 ++++++-=0D
 drivers/gpu/drm/vc4/vc4_crtc.c             | 193 +++++++++++++++------=0D
 drivers/gpu/drm/vc4/vc4_drv.c              |  97 +++++++++--=0D
 drivers/gpu/drm/vc4/vc4_drv.h              |  19 +-=0D
 drivers/gpu/drm/vc4/vc4_gem.c              |  40 +++++=0D
 drivers/gpu/drm/vc4/vc4_hvs.c              |  18 +-=0D
 drivers/gpu/drm/vc4/vc4_irq.c              |  16 ++=0D
 drivers/gpu/drm/vc4/vc4_kms.c              |  24 ++-=0D
 drivers/gpu/drm/vc4/vc4_perfmon.c          |  41 +++++=0D
 drivers/gpu/drm/vc4/vc4_plane.c            |  29 +++-=0D
 drivers/gpu/drm/vc4/vc4_render_cl.c        |   4 +=0D
 drivers/gpu/drm/vc4/vc4_v3d.c              |  15 ++=0D
 drivers/gpu/drm/vc4/vc4_validate.c         |  16 ++=0D
 drivers/gpu/drm/vc4/vc4_validate_shaders.c |   4 +=0D
 14 files changed, 470 insertions(+), 108 deletions(-)=0D
=0D
-- =0D
2.35.1=0D
=0D
