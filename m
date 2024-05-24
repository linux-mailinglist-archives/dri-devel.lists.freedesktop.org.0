Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 8146E8CE90A
	for <lists+dri-devel@lfdr.de>; Fri, 24 May 2024 19:09:30 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0B90310EF66;
	Fri, 24 May 2024 17:09:28 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=testtoast.com header.i=@testtoast.com header.b="huAbhYas";
	dkim=pass (2048-bit key; unprotected) header.d=messagingengine.com header.i=@messagingengine.com header.b="qR4IQPQZ";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from wfout8-smtp.messagingengine.com
 (wfout8-smtp.messagingengine.com [64.147.123.151])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 65BB810EF17
 for <dri-devel@lists.freedesktop.org>; Fri, 24 May 2024 10:41:32 +0000 (UTC)
Received: from compute7.internal (compute7.nyi.internal [10.202.2.48])
 by mailfout.west.internal (Postfix) with ESMTP id 6A6B91C001EE;
 Fri, 24 May 2024 06:35:42 -0400 (EDT)
Received: from mailfrontend2 ([10.202.2.163])
 by compute7.internal (MEProxy); Fri, 24 May 2024 06:35:43 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=testtoast.com;
 h=cc:cc:content-transfer-encoding:content-type:date:date:from
 :from:in-reply-to:message-id:mime-version:reply-to:subject
 :subject:to:to; s=fm1; t=1716546942; x=1716633342; bh=5cp+XF5O4d
 FnbIFqilsGbObYzqL1dndcbCQatCHcyxg=; b=huAbhYaseh3eyQXos959srLJH1
 /4Okwxz6TkjZCamBryKjRziT8mk9z07caAgbs70URslA/WE+jXD2AxP1Jc7OrooS
 +l/Z/MZN2lJIhpr4Qiu78lTz0ld4PfwcwGzTgeLImRPw0xjyw7LtKnXPgJi8YxXG
 +c025zV3zevexFRBazxH1GL9oAcKirFmVVNK3gF9ryZynvnC+T75+LC0afZx9zKt
 2YgZR+YbmUecgG5mQCoL8ePN7Dcjy1nDaNjvFOKsHy2loyzUI2t4eatMOIn4pLRT
 pWpYnKrYfsDwlpTbjZca3KfERAIwirXn9S/4soSGJIxhEqTJN1iooTCyqY2Q==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:cc:content-transfer-encoding
 :content-type:date:date:feedback-id:feedback-id:from:from
 :in-reply-to:message-id:mime-version:reply-to:subject:subject:to
 :to:x-me-proxy:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=
 fm1; t=1716546942; x=1716633342; bh=5cp+XF5O4dFnbIFqilsGbObYzqL1
 dndcbCQatCHcyxg=; b=qR4IQPQZ8aJrkGCtPSd5YgxZJMAVHZi1Cp22dsbgefFE
 tfLea+IdXChuwXTMFDSlkp484WNunGmXeeuA1uOUpZEOtKmHQc00ch/TXFchqzMD
 UYrznVxZmpQBmsqdCHg/YEXJNRbRxTwFc9FkZyWmibaaZdFcSooKThj1cCjW2I71
 E967zmX8uwYZVvhP/yP05W/ISR7RSQAiLR9i6e+QtIdaZjIy2whC9urFeG7FAXkh
 lNWCshGrYnHH9fG8sAgXyIXd6dl8aOK4cDmPLlDudyZFcHZ2dtPIbXtcGvQxJyWh
 0uan+c9mQOig00F9/TjMaxSApgv93CEnRMDSoY7xPA==
X-ME-Sender: <xms:fW1QZgeY6oUtVgqBxzEnadhrGnF2G7iI4XD-8uotA-Krip75oJWguA>
 <xme:fW1QZiMh40nz0azukLvrBScMgsdUpUOgyVGovevy1ggOJixyMZtAltDjZFZfEaSim
 pcRtmBFfTHBgVRs1A>
X-ME-Received: <xmr:fW1QZhjmHmPA-YoqBgeWtdO015tn9oad2MNtsq9Fs-dYZJDYINLxeuYjT6_OucXI-xwUCvfnBChjNpy8nH9WxVNgekOlUIlvidkBlAmTzg4aLSjN>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvledrvdeikedgvdekucetufdoteggodetrfdotf
 fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
 uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
 cujfgurhephffvvefufffkofgggfestdekredtredttdenucfhrhhomheptfihrghnucgh
 rghlkhhlihhnuceorhihrghnsehtvghsthhtohgrshhtrdgtohhmqeenucggtffrrghtth
 gvrhhnpeduvdeuudeugedtueffteevveegheehvdfhfeduudevkefggfeftdehgeethffh
 ffenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepmhgrihhlfhhrohhmpehrhi
 grnhesthgvshhtthhorghsthdrtghomh
X-ME-Proxy: <xmx:fW1QZl_05Cn7D5qClypfvhJMmmENuHyzxGXBU_QWXGLJw9d6HYchag>
 <xmx:fW1QZssq4W9isViLyiYGQkqHDjrsFOpqYgMm8p9C5YsCbiffUoLTlg>
 <xmx:fW1QZsE2XO0Yxc-BXSrCKVYpyzkT2Dxav2HQEV_2bfuxLRFzbNyS9g>
 <xmx:fW1QZrNH_jOTftwsF20_J03ws9i1lznOmIXbPl7KH64HLDNW0QK7tQ>
 <xmx:fm1QZt_iyTVwX2JjZ0I-_DZs2o1oahxAghbh0xoJsbCRMUd-i_9jNwvh>
Feedback-ID: idc0145fc:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Fri,
 24 May 2024 06:35:36 -0400 (EDT)
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
Subject: [PATCH 0/2]  Add WL-355608-A8 panel
Date: Fri, 24 May 2024 22:33:12 +1200
Message-ID: <20240524103506.187277-1-ryan@testtoast.com>
X-Mailer: git-send-email 2.45.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Mailman-Approved-At: Fri, 24 May 2024 17:09:22 +0000
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

The WL_355608_A8 panel is a VGA LCD display with an NV3052C-compatible driver IC, used in a number of Anbernic handheld gaming devices. This patch adds a device tree binding, and support for the display timings and init sequence to the NV3052C SPI/RGB driver.

Regards,

Ryan

Ryan Walklin (2):
  dt-bindings: display: panel: Add WL-355608-A8 panel
  drm: panel: nv3052c: Add WL-355608-A8 panel

 .../bindings/display/panel/wl-355608-a8.yaml  |  68 ++++++
 .../gpu/drm/panel/panel-newvision-nv3052c.c   | 225 ++++++++++++++++++
 2 files changed, 293 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/display/panel/wl-355608-a8.yaml

-- 
2.45.1

