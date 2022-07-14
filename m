Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 613245747F9
	for <lists+dri-devel@lfdr.de>; Thu, 14 Jul 2022 11:13:12 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C877D14B56E;
	Thu, 14 Jul 2022 09:13:01 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from wout5-smtp.messagingengine.com (wout5-smtp.messagingengine.com
 [64.147.123.21])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A13C918A27C
 for <dri-devel@lists.freedesktop.org>; Thu, 14 Jul 2022 09:13:00 +0000 (UTC)
Received: from compute5.internal (compute5.nyi.internal [10.202.2.45])
 by mailout.west.internal (Postfix) with ESMTP id 43E433200908;
 Thu, 14 Jul 2022 05:12:56 -0400 (EDT)
Received: from mailfrontend2 ([10.202.2.163])
 by compute5.internal (MEProxy); Thu, 14 Jul 2022 05:12:57 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cerno.tech; h=cc
 :cc:content-transfer-encoding:content-type:date:date:from:from
 :in-reply-to:message-id:mime-version:reply-to:sender:subject
 :subject:to:to; s=fm2; t=1657789975; x=1657876375; bh=wmxfeNypvk
 QSNQ5U3djGP1YKFiB6lAFLxWlpywPyaP4=; b=KZnTLmouqf2qOqLBGQ5aiM+tAm
 y7+YvmSKU7t+gG3ekTYdF7zAIqHjd5mqxKT5qt8EgE0kBb98mp77Ddr3Tydrsgyy
 qLlISL6EZFsfI89Gj7zehGZSyLxRHCQ/JkyreyZranKIezQDqCQJnoyRqh9Lfl3d
 f2ROzqKWxIQ3gyWHu4IhoocXneeMJbq6JOH1sfbo0CRKzjSL/el6FNKHqroSjje6
 F+fxqEPKCe7Ok8YE/YNz1e03MWC6vQZ6+nYWkMxMzUgDuOFN6+b4RSUKqb4gPNmr
 iAyYC9L9VmGDGEcZCpSqCWViF/XcJT830YKinpA+2kAxjvOKZxpVP+g44RqA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:cc:content-transfer-encoding
 :content-type:date:date:feedback-id:feedback-id:from:from
 :in-reply-to:message-id:mime-version:reply-to:sender:subject
 :subject:to:to:x-me-proxy:x-me-proxy:x-me-sender:x-me-sender
 :x-sasl-enc; s=fm3; t=1657789975; x=1657876375; bh=wmxfeNypvkQSN
 Q5U3djGP1YKFiB6lAFLxWlpywPyaP4=; b=LDozUQy+Fou5GtITOejP6uxsiVrnQ
 eVi5gvmroNgL32Vi58fQxzTNM3Ac1IReesDZqz0qk+Z8A/kgcE5z537Esktg9wuJ
 Y6p/FjqGYuD3+GwoXEuzGx5F2r7RNKmRtxH8hnyKQ/t+VJjap9f0ZLZTztYCAlAA
 oJWB312QYT9LD5Nva6S1xIznlzYFQt9ASILUMWjbpU8Sh6mOEdtQgrA7hNVpb8LG
 IalH9iclrOWDfeDPIUZhQyp3ZcMv3suMf55Dqzs89TxtZyutDixl12wvQTVM3Htq
 dC5+VAAId+AyWZv0Drz0Ds9ZM2rlR4siadTrt3NGZZSL1ISTJUWzGAfVw==
X-ME-Sender: <xms:F97PYrw39hEfXEcwJFKrug6sXfSC20Z5u_TjoPqRN6nmWA7Nk2ubKA>
 <xme:F97PYjS_Lo2hMkFR5P10F1Mo3uLNZp1RPlZ7q5ZqdqV4Lr_VM34Lk624qXzTRlr97
 IfKPqc8CcgZ90dchgU>
X-ME-Received: <xmr:F97PYlV5AHAmQd6Ov3DQvqevTPOgVCYcFrFECAR1rxpuK9g4J_NdH2AZSGjyohg1cBUwgOZt-r1O3BEY7spvb-bTWljM0n4ZxjnY7Lo>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvfedrudejledgudefucetufdoteggodetrfdotf
 fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
 uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
 cujfgurhephffvvefufffkofgtggfgsehtkeertdertdejnecuhfhrohhmpeforgigihhm
 vgcutfhiphgrrhguuceomhgrgihimhgvsegtvghrnhhordhtvggthheqnecuggftrfgrth
 htvghrnhepveegfeekveeuleetleeljeetkeduiedukeehtdetteehhfefveegleefudfh
 tddvnecuffhomhgrihhnpehkvghrnhgvlhdrohhrghenucevlhhushhtvghrufhiiigvpe
 dtnecurfgrrhgrmhepmhgrihhlfhhrohhmpehmrgigihhmvgestggvrhhnohdrthgvtghh
X-ME-Proxy: <xmx:F97PYlhzdfJLxPr1VvSgOxiVpl6kIjjRcRy6PrUJS3c8wohSnBHPAw>
 <xmx:F97PYtDwBqM7LF56z3pqxDPOS6gzigIEpjvdVd6hzgvNUQlie53vMA>
 <xmx:F97PYuIE9oZJhiv8uFY1SRsTh0dKPl8jx3EsflAOpbyCjuZ3R1k-2Q>
 <xmx:F97PYhsartt-GhIxWs13HDhr1BgsTqC0weWdVBh2vmgzCNncwRom7Q>
Feedback-ID: i8771445c:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Thu,
 14 Jul 2022 05:12:54 -0400 (EDT)
From: Maxime Ripard <maxime@cerno.tech>
To: Daniel Vetter <daniel.vetter@intel.com>, David Airlie <airlied@linux.ie>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Thomas Zimmermann <tzimmermann@suse.de>, Maxime Ripard <maxime@cerno.tech>
Subject: [PATCH v3 0/8] drm/vc4: Add generic helpers for HDMI scrambling
Date: Thu, 14 Jul 2022 11:12:44 +0200
Message-Id: <20220714091252.2089015-1-maxime@cerno.tech>
X-Mailer: git-send-email 2.36.1
Content-Type: text/plain; charset="utf-8"
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
Cc: Dom Cobley <dom@raspberrypi.com>, Tim Gover <tim.gover@raspberrypi.com>,
 Dave Stevenson <dave.stevenson@raspberrypi.com>,
 dri-devel@lists.freedesktop.org, Phil Elwell <phil@raspberrypi.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi,

This is a follow-up of the work to support the interactions between the hotplug
and the scrambling support for vc4:

https://lore.kernel.org/dri-devel/20210507150515.257424-11-maxime@cerno.tech/
https://lore.kernel.org/dri-devel/20211025152903.1088803-10-maxime@cerno.tech/
https://lore.kernel.org/dri-devel/20211118103814.524670-1-maxime@cerno.tech/

Ville feedback was that the same discussion happened some time ago for i915,
and resulted in a function to do an full disable/enable cycle on reconnection
to avoid breaking the HDMI 2.0 spec.

While the previous versions of this series was moving the current scrambling
related functions into generic helpers to consolidate that logic, it proved to
be difficult to rework existing drivers to make use of it without hardware to
test it on and thus the code is (for now) private to vc4.

I still believe that long term, the code to decide if the scrambler needs to be
enabled or not should be moved into a generic helper.

This also means that we would need to move the format output decision to a
generic helper, which also makes sense to me but it probably going to be
controversial.

Let me know what you think,
Maxime

Changes from v2:
  - Rebased on next-20220713
  - Dropped the generic helpers and put them into vc4

Changes from v1:
  - Dropped the 340MHz define
  - Make drm_mode_hdmi_requires_scrambling use the bpc
  - Make more drm_display_mode const in vc4
  - Dropped the tegra conversion
  - Added more comments

Maxime Ripard (8):
  drm/vc4: hdmi: Constify drm_display_mode
  drm/vc4: hdmi: Remove unused argument in vc4_hdmi_supports_scrambling
  drm/vc4: hdmi: Remove mutex in detect
  drm/vc4: hdmi: Simplify the hotplug handling
  drm/vc4: hdmi: Switch to detect_ctx
  drm/vc4: hdmi: Move vc4_hdmi_supports_scrambling() around
  drm/vc4: hdmi: Reset link on hotplug
  drm/scdc: Document hotplug gotchas

 drivers/gpu/drm/display/drm_scdc_helper.c |  13 +
 drivers/gpu/drm/vc4/vc4_hdmi.c            | 309 ++++++++++++++--------
 drivers/gpu/drm/vc4/vc4_hdmi.h            |  12 +-
 3 files changed, 220 insertions(+), 114 deletions(-)

-- 
2.36.1

