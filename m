Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C82AF5A4E6F
	for <lists+dri-devel@lfdr.de>; Mon, 29 Aug 2022 15:47:45 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7FB9410F270;
	Mon, 29 Aug 2022 13:47:40 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from wout4-smtp.messagingengine.com (wout4-smtp.messagingengine.com
 [64.147.123.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8FE3610F270
 for <dri-devel@lists.freedesktop.org>; Mon, 29 Aug 2022 13:47:37 +0000 (UTC)
Received: from compute5.internal (compute5.nyi.internal [10.202.2.45])
 by mailout.west.internal (Postfix) with ESMTP id D688D3200645;
 Mon, 29 Aug 2022 09:47:35 -0400 (EDT)
Received: from mailfrontend1 ([10.202.2.162])
 by compute5.internal (MEProxy); Mon, 29 Aug 2022 09:47:36 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cerno.tech; h=cc
 :cc:content-transfer-encoding:content-type:date:date:from:from
 :in-reply-to:message-id:mime-version:reply-to:sender:subject
 :subject:to:to; s=fm3; t=1661780855; x=1661867255; bh=8uI+A4jRtE
 x9t1rVb1JP0DWYZLFfMo6lYB2LyDh9UG0=; b=VVMst0QKK0MFP17PcTk2MD0Nr2
 d7x8/YvrC9WfoQpXhPjrf9HZ5k+RMP2Bybj089HeBTcrz4Go+rl4atDO8FuX7deg
 0GEm6hbGxAkfeIx2UcclPybSYXJt4defx7xucjgH91rJhNjIgVhfbrcojNgODfPz
 OBnmiYUu1/ZmP61qvhChrvDsfyYUmUmFOFgbT0psvz1mdmBXqzrQWY0wPDukugHc
 4Gd5k64LfeHT88900hcqPiWrpXv40up8+5E96utDQknN7yCL89RbvJ7K41Q4F/i3
 2SNDzM/dm/LJbxh4W3ylFjpMKEmprUo1NSKp2i06BAaB2kF7DJggiFv/+OLg==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:cc:content-transfer-encoding
 :content-type:date:date:feedback-id:feedback-id:from:from
 :in-reply-to:message-id:mime-version:reply-to:sender:subject
 :subject:to:to:x-me-proxy:x-me-proxy:x-me-sender:x-me-sender
 :x-sasl-enc; s=fm1; t=1661780855; x=1661867255; bh=8uI+A4jRtEx9t
 1rVb1JP0DWYZLFfMo6lYB2LyDh9UG0=; b=gjOKBMxP7x2BYoom59oErihiuZ9Hk
 R4XH8VelQ82UDYzbXmwVFaGlOQDzv4vwRFK6duMVlGH+Z487dfG8C0pN8OCPZpzH
 TI3oF2/IFL5lxDC/T8xkk2DWUPEqfz7DCZhxeWFnavuGG9tLhRL39BUxq++i7tYA
 oEXUNJIEL+62HTq9ySpVwKs9WFtyKDZZTqI4LpRTwdPPw2KL2ttsnQX2oQZ0Ubqv
 WRdXhKknP/2mRzxhw4pktO3FP8tm5Ob6G99Iphs9fpmIYXUAF/EnSyIcX8sTe+yF
 yBzu59WDidvNUv+NZu6LlU9eSJJKzJleetLRk6B03rX0PdDpVcstfPMkA==
X-ME-Sender: <xms:dsMMYxOAbqatBiVvHl77ervNKXOyxFLFFKRV82GUqd_AvQ8L-H3EJw>
 <xme:dsMMYz-2l_e40O9WHOEjIdFNG52dDmPjthDiGxo_Q8oR_fnaiVjz6GZLQAAhU7ob5
 eL3v5QpmzK0vD_vUHA>
X-ME-Received: <xmr:dsMMYwSLyVTsVYSmjrIKC4PfD4ahytHueWilyAp7U1GG4FGDTulcDQ5vfmFq>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvfedrvdekuddgjedtucetufdoteggodetrfdotf
 fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
 uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
 cujfgurhephffvvefufffkofgtggfgsehtkeertdertdejnecuhfhrohhmpeforgigihhm
 vgcutfhiphgrrhguuceomhgrgihimhgvsegtvghrnhhordhtvggthheqnecuggftrfgrth
 htvghrnhepveegfeekveeuleetleeljeetkeduiedukeehtdetteehhfefveegleefudfh
 tddvnecuffhomhgrihhnpehkvghrnhgvlhdrohhrghenucevlhhushhtvghrufhiiigvpe
 dtnecurfgrrhgrmhepmhgrihhlfhhrohhmpehmrgigihhmvgestggvrhhnohdrthgvtghh
X-ME-Proxy: <xmx:dsMMY9s0SRHqMYvi6nF1Cxre_9lHHVZDAcXdle68MfLOOgiSQUMe-w>
 <xmx:dsMMY5cH0AG_WRE-58ky0QvDfo0Aki3zyaTDgCCYYrvghULkmx6Uog>
 <xmx:dsMMY52Bfx6CWGFqnMednWasyHArJzNxuwGsEImLaX2Uyzt_3aOR1A>
 <xmx:d8MMY15CUSYeVGeprjprY5KYBJgrMq06rCtmvjZeL_4eWr9c0euf2Q>
Feedback-ID: i8771445c:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Mon,
 29 Aug 2022 09:47:33 -0400 (EDT)
From: Maxime Ripard <maxime@cerno.tech>
To: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Thomas Zimmermann <tzimmermann@suse.de>, Maxime Ripard <maxime@cerno.tech>,
 Daniel Vetter <daniel.vetter@intel.com>, David Airlie <airlied@linux.ie>
Subject: [PATCH v4 0/8] drm/vc4: Reset HDMI link at hotplug
Date: Mon, 29 Aug 2022 15:47:23 +0200
Message-Id: <20220829134731.213478-1-maxime@cerno.tech>
X-Mailer: git-send-email 2.37.1
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

Changes from v3 (https://lore.kernel.org/dri-devel/20220714091252.2089015-1-maxime@cerno.tech/):
  - Rebased on drm-misc-next-2022-08-20-1

Changes from v2 (https://lore.kernel.org/dri-devel/20211118103814.524670-1-maxime@cerno.tech/):
  - Rebased on next-20220713
  - Dropped the generic helpers and put them into vc4

Changes from v1 (https://lore.kernel.org/dri-devel/20211102145944.259181-1-maxime@cerno.tech/):
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
 drivers/gpu/drm/vc4/vc4_hdmi.c            | 308 ++++++++++++++--------
 drivers/gpu/drm/vc4/vc4_hdmi.h            |  12 +-
 3 files changed, 218 insertions(+), 115 deletions(-)

-- 
2.37.1

