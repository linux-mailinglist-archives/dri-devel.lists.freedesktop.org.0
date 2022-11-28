Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 4AC2063A2A4
	for <lists+dri-devel@lfdr.de>; Mon, 28 Nov 2022 09:19:52 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 63BA310E2A3;
	Mon, 28 Nov 2022 08:19:49 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from out5-smtp.messagingengine.com (out5-smtp.messagingengine.com
 [66.111.4.29])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6BD9010E2A4
 for <dri-devel@lists.freedesktop.org>; Mon, 28 Nov 2022 08:19:45 +0000 (UTC)
Received: from compute5.internal (compute5.nyi.internal [10.202.2.45])
 by mailout.nyi.internal (Postfix) with ESMTP id C32335C013B;
 Mon, 28 Nov 2022 03:19:42 -0500 (EST)
Received: from mailfrontend2 ([10.202.2.163])
 by compute5.internal (MEProxy); Mon, 28 Nov 2022 03:19:42 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cerno.tech; h=cc
 :cc:content-transfer-encoding:date:date:from:from:in-reply-to
 :message-id:mime-version:reply-to:sender:subject:subject:to:to;
 s=fm2; t=1669623582; x=1669709982; bh=3N/SfcTOuzx4Y/m8hSni9Wofv
 8VWO9oPL6Rhphkdkqg=; b=DxYWV0u2Eu63lNQhHJyEKqpWitxipjGYDxo2IKeCx
 L3es6Rz5hcGM3wCd+KrEqoTZBi76+M9PPbTGs9u8ohP64Ncti1Pha4Ra+6V+3O5Q
 mxlx3ahx179ytEggkmhxBPbXhyl/9No2pAH9zPR92Sbv+oO9KBzsCr06LDXC1ChO
 tOfdylUJeJOeAQnsqfzA9Xxpzzm0RO6coy4MSiXxrJ7vZBWXCgMgxLSWIEiJ+16B
 2c+qNohxatMPZZihOnMFmVQCmrTElU6r8+hRyhM57h52ro9gl6SmlXw4OAAs6acJ
 /e0OB1Wk2y2TNAWGEelRBDUOsICjgnb3yRBrCKOD5Prhg==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:cc:content-transfer-encoding:date:date
 :feedback-id:feedback-id:from:from:in-reply-to:message-id
 :mime-version:reply-to:sender:subject:subject:to:to:x-me-proxy
 :x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm1; t=
 1669623582; x=1669709982; bh=3N/SfcTOuzx4Y/m8hSni9Wofv8VWO9oPL6R
 hphkdkqg=; b=a0rH2qF+OnzNDNQa5/8ihimBR/uRfSvR9aXzMhhcqu40nmmu5p4
 2xtrC3jM30sRhr5tBltaAUpDVoKXCGuoSVmrXG4IskAtkUu0rGR++43OrbGdBS82
 HP1w66mNp2BSH/WwQiyZgkMn1Ip7wd2xH6dteHWCTpBmk5jGz55EdRXJV3PIA+46
 ax/Kyxl+SO5Kk4SraOFTo2hly6T12wBj5FPeB91arxMMyReB7ka6eOQ5PLDNQtFn
 NM26WyAURewWUm1m8yB0pUBOAgOh5iZqvY2M3Zff3KGDCz5gfc1Y3vvXrqFzaNxQ
 +NkzQYjNuO4R/6mIKFNlALAatbrnbTXYzTg==
X-ME-Sender: <xms:Hm-EY9u6MoUpKpEaflRBT_4ObtomBsuvK0BrjlJ_ELUb3IFrBvInkg>
 <xme:Hm-EY2dtVL6b-rjJr7kJ5IhU0HJ-LOTWbEfiu7IJKO6yFwmUf77W6UuLuFra-8dUC
 wqUXHVq4CG7KIIHu8I>
X-ME-Received: <xmr:Hm-EYwx3kQi8MoVETWVRrMheQuHFVYtOk4H54w6kDmiOFFSiCbizqFrIooX89oz1KZ8ippCbTNyTXKTVgOMuAOBzxXHFhXILiyfMtiHxC4YozQ>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvgedrjedugdduvddtucetufdoteggodetrfdotf
 fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
 uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
 cujfgurhephffvvefufffkofgggfestdekredtredttdenucfhrhhomhepofgrgihimhgv
 ucftihhprghrugcuoehmrgigihhmvgestggvrhhnohdrthgvtghhqeenucggtffrrghtth
 gvrhhnpeektedujeeijeefhfejuedtudegtdejffffvdettdeigeekffeileelgeevgfdv
 vdenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepmhgrihhlfhhrohhmpehmrg
 igihhmvgestggvrhhnohdrthgvtghh
X-ME-Proxy: <xmx:Hm-EY0Pk18LPslsjPaycZNGLcn290fMwgk3PSVXi8OehkCNwzvX9zw>
 <xmx:Hm-EY98mCLF-Vwlmtun9Lo7qYXtjsYCmXXfCYKoxbCu3mDz3I-agvg>
 <xmx:Hm-EY0WD32v9dIDBJEwaK99_CSqt2rpEiyr2FJxpZnpkv9d-By7KGg>
 <xmx:Hm-EYwU8sROM7KtVz4D88g5sKMhrBmvddLcNCNUtsLLrz42ZlfcZxw>
Feedback-ID: i8771445c:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Mon,
 28 Nov 2022 03:19:41 -0500 (EST)
From: Maxime Ripard <maxime@cerno.tech>
To: Daniel Vetter <daniel.vetter@intel.com>, David Airlie <airlied@linux.ie>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Thomas Zimmermann <tzimmermann@suse.de>, Maxime Ripard <maxime@cerno.tech>
Subject: [PATCH 1/3] drm/doc: Fix title underline length
Date: Mon, 28 Nov 2022 09:19:36 +0100
Message-Id: <20221128081938.742410-1-maxime@cerno.tech>
X-Mailer: git-send-email 2.38.1
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
Cc: kernel test robot <lkp@intel.com>, dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

The underline length for the new Analog TV properties section doesn't
match the title length, resulting in a warning.

Fixes: 7d63cd8526f1 ("drm/connector: Add TV standard property")
Reported-by: kernel test robot <lkp@intel.com>
Signed-off-by: Maxime Ripard <maxime@cerno.tech>
---
 Documentation/gpu/drm-kms.rst | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/Documentation/gpu/drm-kms.rst b/Documentation/gpu/drm-kms.rst
index 321f2f582c64..c92d425cb2dd 100644
--- a/Documentation/gpu/drm-kms.rst
+++ b/Documentation/gpu/drm-kms.rst
@@ -521,7 +521,7 @@ HDMI Specific Connector Properties
    :doc: HDMI connector properties
 
 Analog TV Specific Connector Properties
-----------------------------------
+---------------------------------------
 
 .. kernel-doc:: drivers/gpu/drm/drm_connector.c
    :doc: Analog TV Connector Properties
-- 
2.38.1

