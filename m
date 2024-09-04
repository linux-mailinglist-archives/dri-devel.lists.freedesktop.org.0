Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 354A096ADCD
	for <lists+dri-devel@lfdr.de>; Wed,  4 Sep 2024 03:25:19 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6E03910E677;
	Wed,  4 Sep 2024 01:25:16 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=testtoast.com header.i=@testtoast.com header.b="0f4xHQt4";
	dkim=pass (2048-bit key; unprotected) header.d=messagingengine.com header.i=@messagingengine.com header.b="TLF2lO6o";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from fhigh1-smtp.messagingengine.com
 (fhigh1-smtp.messagingengine.com [103.168.172.152])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 98C6A10E677
 for <dri-devel@lists.freedesktop.org>; Wed,  4 Sep 2024 01:25:15 +0000 (UTC)
Received: from phl-compute-05.internal (phl-compute-05.phl.internal
 [10.202.2.45])
 by mailfhigh.phl.internal (Postfix) with ESMTP id AC09D1140211;
 Tue,  3 Sep 2024 21:25:14 -0400 (EDT)
Received: from phl-mailfrontend-02 ([10.202.2.163])
 by phl-compute-05.internal (MEProxy); Tue, 03 Sep 2024 21:25:14 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=testtoast.com;
 h=cc:cc:content-transfer-encoding:content-type:date:date:from
 :from:in-reply-to:message-id:mime-version:reply-to:subject
 :subject:to:to; s=fm1; t=1725413114; x=1725499514; bh=F9GS1iarqN
 zWAu0wrF3qX++6UW4sw7BgASdGNkCp5Lc=; b=0f4xHQt4ShvaB3N2Znz3d7asWY
 AXoQEjYT/RHmOcdqpQv0sWVvUiYZ+4Ez8oAaDVy9QAMGihl34RVqILnz86eVOl25
 GHTpHK/kLIp+BXn0v1KBNbW9ySQ7eE+5ecNKFNBHxv0Bx+xOF/TZZEoiRsHQMnSa
 ENnKf4vOpH5z/wlcb3Epnv2mFXAOm101Jzf8PhZomTN3wLtpMZF1dJalcUkUbdtj
 P9FPLtsgfJm+LY5aXS1ml+egRKDSR1YAqwrbCholshlVnslFBPBn3U4vdeU41D/U
 mKFYnTBtHFk+Zlmim1ZxH9f3aeegvoCu9CpaECj9/BloWls7mO5ptFOlqQHg==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:cc:content-transfer-encoding
 :content-type:date:date:feedback-id:feedback-id:from:from
 :in-reply-to:message-id:mime-version:reply-to:subject:subject:to
 :to:x-me-proxy:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=
 fm1; t=1725413114; x=1725499514; bh=F9GS1iarqNzWAu0wrF3qX++6UW4s
 w7BgASdGNkCp5Lc=; b=TLF2lO6o1OYWzfkLxbesby2jv5ngPa2KNC0EbKW132fz
 3UzGfA7b8kPUZzCvoj+7vglouyOkV3szoGLN9rrbn0aaGsFU//fDlhMWU0HDnjKx
 w0k7FN3AVYRvBmTUKe23nozbJF/4CKLvHDql36FrCsJWeLA1hjIMBnvXSi3LNMMG
 ygUXXxt6GGneacKC/0ntHV65AiCjuGy7XLoT0h6R6fbT2oj8rN5X0q/+tRUZbtDk
 7BrRHa0YO5pynP3Qs80g3cTSdPSTYhkRy0b5HA3LlcKlCzQrNxfC/Nzw4wdu08NT
 FGrL12hd61+qE6hNECC0d70zI9FRa4R65BttaZydxg==
X-ME-Sender: <xms:-bbXZgea2g8jbt9KM1XK6enlNtiiRUaFOeTfj6gsFoVPpZ60Vsg5BA>
 <xme:-bbXZiP73345AYWGMBXwqxjfj_2f5237CSPxYy3JRJYCNWeI5PLguELKHjpMjGSaH
 6kOpQA-jxamXDuQPw>
X-ME-Received: <xmr:-bbXZhi4oxY-xIwlOc81pfq20ov5wEuYS42JWSAxK7R0XiOM_Le_JFWhD1pm1_AwXRmhT6XIFoZP3EE>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeeftddrudehiedggeegucetufdoteggodetrfdotf
 fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdggtfgfnhhsuhgsshgtrhhisggvpdfu
 rfetoffkrfgpnffqhgenuceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnh
 htshculddquddttddmnecujfgurhephffvvefufffkofgggfestdekredtredttdenucfh
 rhhomheptfihrghnucghrghlkhhlihhnuceorhihrghnsehtvghsthhtohgrshhtrdgtoh
 hmqeenucggtffrrghtthgvrhhnpeduvdeuudeugedtueffteevveegheehvdfhfeduudev
 kefggfeftdehgeethffhffenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepmh
 grihhlfhhrohhmpehrhigrnhesthgvshhtthhorghsthdrtghomhdpnhgspghrtghpthht
 ohepudeipdhmohguvgepshhmthhpohhuthdprhgtphhtthhopegurhhiqdguvghvvghlse
 hlihhsthhsrdhfrhgvvgguvghskhhtohhprdhorhhgpdhrtghpthhtohepuggvvhhitggv
 thhrvggvsehvghgvrhdrkhgvrhhnvghlrdhorhhgpdhrtghpthhtohepnhgvihhlrdgrrh
 hmshhtrhhonhhgsehlihhnrghrohdrohhrghdprhgtphhtthhopehquhhitggpjhgvshhs
 iihhrghnsehquhhitghinhgtrdgtohhmpdhrtghpthhtohepshgrmhesrhgrvhhnsghorh
 hgrdhorhhgpdhrtghpthhtoheprghirhhlihgvugesghhmrghilhdrtghomhdprhgtphht
 thhopegurghnihgvlhesfhhffihllhdrtghhpdhrtghpthhtohepmhgrrghrthgvnhdrlh
 grnhhkhhhorhhstheslhhinhhugidrihhnthgvlhdrtghomhdprhgtphhtthhopehmrhhi
 phgrrhgusehkvghrnhgvlhdrohhrgh
X-ME-Proxy: <xmx:-bbXZl9eHoZQIFMdAvP3iwBk-KZ8HFnlKadvZ3qLTW-bpFRlq6zWFw>
 <xmx:-bbXZstMjwEInmWjUu6-v9SbvkXHj53uVU__0zD4Xo8YIv3bq2Bd4Q>
 <xmx:-bbXZsGwDL9UAYYLkZkbRHSudmxov32FFN_s1RM4IE1CPWihPbBxNg>
 <xmx:-bbXZrM5voH7f-wwRhiuJ0zrIac0gthyXYJXax5U0dPNJZ4WL7LFNg>
 <xmx:-rbXZt90v5faqOPLh3SD7tLSItQnQaem6Au92RQmE7FpNa7wvI_JSu7_>
Feedback-ID: idc0145fc:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Tue,
 3 Sep 2024 21:25:08 -0400 (EDT)
From: Ryan Walklin <ryan@testtoast.com>
To: dri-devel@lists.freedesktop.org,
	devicetree@vger.kernel.org
Cc: Neil Armstrong <neil.armstrong@linaro.org>,
 Jessica Zhang <quic_jesszhan@quicinc.com>, Sam Ravnborg <sam@ravnborg.org>,
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>,
 Hironori KIKUCHI <kikuchan98@gmail.com>,
 Chris Morgan <macroalpha82@gmail.com>, Ryan Walklin <ryan@testtoast.com>
Subject: [PATCH v3 0/2] Correct WL-355608-A8 panel compatible
Date: Wed,  4 Sep 2024 13:23:20 +1200
Message-ID: <20240904012456.35429-1-ryan@testtoast.com>
X-Mailer: git-send-email 2.46.0
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi,

V3 of this patch updated to reflect discussion and agreement to use the integrating vendor prefix and device names for this display panel.

The previous patch adding support for this panel [1] referred to previously by its serial number only. As discussed after the patch was committed, the preference is to use the integrating device vendor and name in this circumstance.

This series corrects the panel compatible to reflect the integrating vendor (Anbernic, already in the vendor prefix table) and device names (adding fallbacks for the variants using the same panel), and updates the NV3052C panel driver with the new compatible.

Ryan Walklin (2):
  dt-bindings: display: panel: Rename WL-355608-A8 panel to
    rg35xx-*-panel
  drm: panel: nv3052c: Correct WL-355608-A8 panel compatible

 ...08-a8.yaml => anbernic,rg35xx-plus-panel.yaml} | 15 +++++++++++----
 drivers/gpu/drm/panel/panel-newvision-nv3052c.c   |  2 +-
 2 files changed, 12 insertions(+), 5 deletions(-)
 rename Documentation/devicetree/bindings/display/panel/{wl-355608-a8.yaml => anbernic,rg35xx-plus-panel.yaml} (67%)

-- 
2.46.0

