Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 473B98D46F3
	for <lists+dri-devel@lfdr.de>; Thu, 30 May 2024 10:23:36 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6C02710E140;
	Thu, 30 May 2024 08:23:34 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=testtoast.com header.i=@testtoast.com header.b="R4koJsgD";
	dkim=pass (2048-bit key; unprotected) header.d=messagingengine.com header.i=@messagingengine.com header.b="cmwSW2nD";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from wfhigh2-smtp.messagingengine.com
 (wfhigh2-smtp.messagingengine.com [64.147.123.153])
 by gabe.freedesktop.org (Postfix) with ESMTPS id ACBB510E140
 for <dri-devel@lists.freedesktop.org>; Thu, 30 May 2024 08:23:31 +0000 (UTC)
Received: from compute7.internal (compute7.nyi.internal [10.202.2.48])
 by mailfhigh.west.internal (Postfix) with ESMTP id 9A4C41800144;
 Thu, 30 May 2024 04:23:29 -0400 (EDT)
Received: from mailfrontend1 ([10.202.2.162])
 by compute7.internal (MEProxy); Thu, 30 May 2024 04:23:30 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=testtoast.com;
 h=cc:cc:content-transfer-encoding:content-type:date:date:from
 :from:in-reply-to:message-id:mime-version:reply-to:subject
 :subject:to:to; s=fm1; t=1717057409; x=1717143809; bh=1nD+zEVZEi
 FmMKsUN9POQ9akkpV8PDc9ZBtuTWX1uLI=; b=R4koJsgDBm1WuAOrgZij8t/FFE
 iA1XL6q+kOXLO4502tXdbSI3LOpzpimkIBwIcfU8QvUzn5nELN7dIrzF6yuRVFqf
 YCQNOnywwCqDx4elqU18NWoW2warEd2W4Kn+8rfEvRSCi64rUsIdPr9lmzqyVkh9
 6pDDmAz4S/oLX+8Ca8wgVmQ2TFf7JXDiqZPidH7mqWxOznM70O/rDIuF0nykYhn6
 lavTuI06DQlMX5L5r5dmYcfdi6YLdtApPklaM+7GuPVLzvrdX6f24FNzrb5gk6/o
 6O3Kd4CG+Hz9xzYXlJT57coAXVTsri98wYkwo/FtgewrrDYuwvLh+gQXPa/w==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:cc:content-transfer-encoding
 :content-type:date:date:feedback-id:feedback-id:from:from
 :in-reply-to:message-id:mime-version:reply-to:subject:subject:to
 :to:x-me-proxy:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=
 fm1; t=1717057409; x=1717143809; bh=1nD+zEVZEiFmMKsUN9POQ9akkpV8
 PDc9ZBtuTWX1uLI=; b=cmwSW2nD+NUU3U5d/ZBkSNSrHBDafSid9XycsJ5p6nrM
 PzBCzSCr9Cafv1V2LYiQQQZwTW3mvLLEEKp7lq3KPHEW9ABZ7DECAhN7WkyM4fc1
 I+QBFZjwEhpF1QIIMOFGN8GgklQDUzL1S3jcJ063YxfdFEYXw6P5csDn+1WX5mhS
 Y4IkqsaBAvTVBXZ5jB3d5pLGyU60tn7TjxF15wsjSUf47KOiZyY7w34pHPAyH0Lw
 IzGTl+a3fxEYIHQMKF3aMoXfNMJio0GXxtOL8naQgI2h08D0XVnX/oesJF46FqyC
 4IYQEtjDEPJNR/tUP5YhayYgDIugO3fOIFnc8L+eRg==
X-ME-Sender: <xms:gDdYZiyVG2p6pqXYNCGxPRMGkLiurFolCwB6B_dDwO3ZjOEho075VQ>
 <xme:gDdYZuQnSursPEsL2XrKi7J295OTi4suzrlXcqyQImDkVs4f410dXBIWcRgsBWe-b
 pJX8WDK6CFisquQlw>
X-ME-Received: <xmr:gDdYZkUs-tYZmP9TkJ0vsLmrhVyRbU1Qa089je4jVSMfQVWrVkPq47MfmGrmSsV_-i6WQ2g733DpLewaNzcd1YprrTSNd9fWVvDRzNfbrRJtsvIe>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvledrvdekgedgtdduucetufdoteggodetrfdotf
 fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
 uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
 cujfgurhephffvvefufffkofgggfestdekredtredttdenucfhrhhomheptfihrghnucgh
 rghlkhhlihhnuceorhihrghnsehtvghsthhtohgrshhtrdgtohhmqeenucggtffrrghtth
 gvrhhnpeduvdeuudeugedtueffteevveegheehvdfhfeduudevkefggfeftdehgeethffh
 ffenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepmhgrihhlfhhrohhmpehrhi
 grnhesthgvshhtthhorghsthdrtghomh
X-ME-Proxy: <xmx:gDdYZohDyjZEMUAn_vMyVRlIgD-K-4IOdW4c5bDkZuXbGlqscORdkA>
 <xmx:gDdYZkC1bnp5EEGwwc1aIhW7xLhhPv13c0KFfL2Cr8fawqeol_sqeQ>
 <xmx:gDdYZpJI4a8Md5tod46oO-BZneUgHBBCcJkDH1v-yWpkkqhL1hQmzw>
 <xmx:gDdYZrCjVD9kfLfs-AGLw71nbojffjFNgYoBJHkRxQ0zV-F2cmFwvw>
 <xmx:gTdYZs4sfH6pf6WhrazwWC3S5RkjqK8vgSXLVGzt5AupTnTFe3EPhRHi>
Feedback-ID: idc0145fc:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Thu,
 30 May 2024 04:23:23 -0400 (EDT)
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
 Chris Morgan <macroalpha82@gmail.com>,
 Andre Przywara <andre.przywara@arm.com>, John Watts <contact@jookia.org>,
 Ryan Walklin <ryan@testtoast.com>
Subject: [PATCH v2 0/2] Add WL-355608-A8 panel
Date: Thu, 30 May 2024 20:22:20 +1200
Message-ID: <20240530082318.40516-1-ryan@testtoast.com>
X-Mailer: git-send-email 2.45.1
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

Hello,

V2 of this patch with discussed and recommended compatible string fixes and updates to DT binding example code.

Original cover below.
--

The WL_355608_A8 panel is a VGA LCD display with an NV3052C-compatible driver IC, used in a number of Anbernic handheld gaming devices. This patch adds a device tree binding, and support for the display timings and init sequence to the NV3052C SPI/RGB driver.

Regards,

Ryan


Ryan Walklin (2):
  dt-bindings: display: panel: Add WL-355608-A8 panel
  drm: panel: nv3052c: Add WL-355608-A8 panel

 .../bindings/display/panel/wl-355608-a8.yaml  |  60 +++++
 .../gpu/drm/panel/panel-newvision-nv3052c.c   | 225 ++++++++++++++++++
 2 files changed, 285 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/display/panel/wl-355608-a8.yaml

-- 
2.45.1

