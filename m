Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 14C6662D6CF
	for <lists+dri-devel@lfdr.de>; Thu, 17 Nov 2022 10:29:22 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9703E10E58B;
	Thu, 17 Nov 2022 09:29:11 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from wnew2-smtp.messagingengine.com (wnew2-smtp.messagingengine.com
 [64.147.123.27])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3998410E58A;
 Thu, 17 Nov 2022 09:29:00 +0000 (UTC)
Received: from compute2.internal (compute2.nyi.internal [10.202.2.46])
 by mailnew.west.internal (Postfix) with ESMTP id 82DDB2B069CA;
 Thu, 17 Nov 2022 04:28:57 -0500 (EST)
Received: from mailfrontend1 ([10.202.2.162])
 by compute2.internal (MEProxy); Thu, 17 Nov 2022 04:28:59 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cerno.tech; h=cc
 :cc:content-transfer-encoding:content-type:date:date:from:from
 :in-reply-to:in-reply-to:message-id:mime-version:references
 :reply-to:sender:subject:subject:to:to; s=fm2; t=1668677337; x=
 1668684537; bh=4NgGrmomYwc9SKGU8ML12KMRl2AoH7TtGxG7Dp0NBYw=; b=i
 QO1sLsoF4+dc8819cLry6lHCsi5gQHLl9aTteBhIh+sqmia6+Ucc96vEaepeZtnL
 KT+2wMvyUWOP60TP1qvU+7TXmjeBmUuqRm9AP3Mi7xpvV7tcgEnKWMdxhI52wKwj
 c09Bp3Hd8qcNMfnRUjEUfJ/+YB1OvciZpm0Kawjfi2TicaNgR0ZyGTJ9Wedx9E7S
 GHlb/2DtlYkcdZleAJGpAqUE0wEtuXYfYfOaUFHL8ZfyJlRDywwThMHKagc0krsC
 tYcI29dBr5C7Tr1t8ODfDBnyQ3vAuZTsvZQxFj524JMw1a789Ai40Yw3JB63X2O1
 SY30crHIzE368sWtSteeA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:cc:content-transfer-encoding
 :content-type:date:date:feedback-id:feedback-id:from:from
 :in-reply-to:in-reply-to:message-id:mime-version:references
 :reply-to:sender:subject:subject:to:to:x-me-proxy:x-me-proxy
 :x-me-sender:x-me-sender:x-sasl-enc; s=fm1; t=1668677337; x=
 1668684537; bh=4NgGrmomYwc9SKGU8ML12KMRl2AoH7TtGxG7Dp0NBYw=; b=d
 JcWOY2boc0QkMAuh1DVP0v2Vi2Ne6AP985gf8aq8No8doGrGHanu4wkjUpUHDNBj
 0JEOwnahBAzrNSwpgqHA6V2iIU8ayqLeAtBvdMCQGeuvPJwtr6XCfvZVI3Hzm6L9
 1Yu3352DnxURkY17FbMa7oMgAH2V8tp3VnRcZEzoU5myP87Vvfx7TXKsvTOekSlj
 8CWRb19PTD+QigiIsVNnqxaKsyjDkTAtF9upPKmJsl5oEay8XFCX8GZhg05jhvwZ
 EaIn8ZPN3F2zUondajFbmwfB9iCmjUrnBzUpD3bkTPqnoBPqm8YI9jUwTg3FCk8+
 ETEjbVbM3aviqbzDHt8EA==
X-ME-Sender: <xms:2P51Y9MMV4asOLKqEndQN4eszUqEkmXoiFZdj9PRu-fLd0TZTrf1Qw>
 <xme:2P51Y_8jEH2pUOlhwAeo1lMlrsU8R5LE6EY3hKcyvshqxWeThTXQXwtoogQgfG349
 k5R-MR_31n6z0HcKPE>
X-ME-Received: <xmr:2P51Y8TFqghVeSEOgaxos_tfXBuTAm0KAqdvKjAuMQCUnT93xeb_FewriwcjqHqmnTMcUR5oCEh_-L0VpQpfccl0G_sFWqG39Q5-9wUqSy7-Cw>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvgedrgeekgddtfecutefuodetggdotefrodftvf
 curfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfghnecu
 uegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenuc
 fjughrpefhfffugggtgffkfhgjvfevofesthekredtredtjeenucfhrhhomhepofgrgihi
 mhgvucftihhprghrugcuoehmrgigihhmvgestggvrhhnohdrthgvtghhqeenucggtffrrg
 htthgvrhhnpeduudduhfevjeetfeegvdffvdevvdejudegudekjeehtdelhfffveethfej
 ledtveenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepmhgrihhlfhhrohhmpe
 hmrgigihhmvgestggvrhhnohdrthgvtghh
X-ME-Proxy: <xmx:2P51Y5u496sMwG3S7iII9tytf0i6RJpGDlWlozgGIE-Kg8M5QVAkFA>
 <xmx:2P51Y1egfJ0vFT2uR_erlrC0pX3BdJj-PjopwAs-JaO31cXIXAdJkw>
 <xmx:2P51Y10LOclbMfiCZweLP7Q7DEZztO1pmSFwL2Xc8JmADATsSq6HuA>
 <xmx:2f51Y8raTk3qhggnxl0wZ7WpxDxZ0yMJIA1auvUFtEQRiwTc-FNBd_XC9aQ>
Feedback-ID: i8771445c:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Thu,
 17 Nov 2022 04:28:56 -0500 (EST)
From: Maxime Ripard <maxime@cerno.tech>
Date: Thu, 17 Nov 2022 10:28:44 +0100
Subject: [PATCH v10 01/19] drm/tests: client: Mention that we can't use
 MODULE_ macros
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20220728-rpi-analog-tv-properties-v10-1-256dad125326@cerno.tech>
References: <20220728-rpi-analog-tv-properties-v10-0-256dad125326@cerno.tech>
In-Reply-To: <20220728-rpi-analog-tv-properties-v10-0-256dad125326@cerno.tech>
To: Samuel Holland <samuel@sholland.org>,
 Jernej Skrabec <jernej.skrabec@gmail.com>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>, 
 Joonas Lahtinen <joonas.lahtinen@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Ben Skeggs <bskeggs@redhat.com>, 
 Chen-Yu Tsai <wens@csie.org>, David Airlie <airlied@linux.ie>,
 Jani Nikula <jani.nikula@linux.intel.com>, 
 Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>, Emma Anholt <emma@anholt.net>,
 Karol Herbst <kherbst@redhat.com>, 
 Lyude Paul <lyude@redhat.com>, Thomas Zimmermann <tzimmermann@suse.de>,
 Daniel Vetter <daniel@ffwll.ch>
X-Mailer: b4 0.11.0-dev-99e3a
X-Developer-Signature: v=1; a=openpgp-sha256; l=827; i=maxime@cerno.tech;
 h=from:subject:message-id; bh=NpRKFTAwisXPM+4aytVHyBJ/Bx9dnEtGRSrnOQ+3/HI=;
 b=owGbwMvMwCX2+D1vfrpE4FHG02pJDMml/y44Ol+7bVbjlxHw+7rZum8fD+3bqyvWt8jmx00D5vgb
 FaccO0pZGMS4GGTFFFlihM2XxJ2a9bqTjW8ezBxWJpAhDFycAjCR22kM/5QFSpyEA98nSrmEFzBJP3
 gUKnrbdXt5U/rlEL+KDQGPbRn+WR1susKy/NBBS0nhNuY5q3Zd1p3j0rSqZ5dy1c2mwxW83AA=
X-Developer-Key: i=maxime@cerno.tech; a=openpgp;
 fpr=BE5675C37E818C8B5764241C254BCFC56BF6CE8D
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
Cc: Dom Cobley <dom@raspberrypi.com>, Dave Stevenson <dave.stevenson@raspberrypi.com>, Phil Elwell <phil@raspberrypi.com>, nouveau@lists.freedesktop.org, intel-gfx@lists.freedesktop.org, linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org, Mateusz Kwiatkowski <kfyatek+publicgit@gmail.com>, Hans de Goede <hdegoede@redhat.com>, Noralf Trønnes <noralf@tronnes.org>, Geert Uytterhoeven <geert@linux-m68k.org>, Maxime Ripard <maxime@cerno.tech>, linux-sunxi@lists.linux.dev, linux-arm-kernel@lists.infradead.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

That file is included directly, so we can't use any MODULE macro. Let's
leave a comment to avoid any future mistake.

Signed-off-by: Maxime Ripard <maxime@cerno.tech>
---
 drivers/gpu/drm/tests/drm_client_modeset_test.c | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/drivers/gpu/drm/tests/drm_client_modeset_test.c b/drivers/gpu/drm/tests/drm_client_modeset_test.c
index 362a5fbd82f5..cdae1e4c762a 100644
--- a/drivers/gpu/drm/tests/drm_client_modeset_test.c
+++ b/drivers/gpu/drm/tests/drm_client_modeset_test.c
@@ -96,3 +96,8 @@ static struct kunit_suite drm_test_pick_cmdline_test_suite = {
 };
 
 kunit_test_suite(drm_test_pick_cmdline_test_suite);
+
+/*
+ * This file is included directly by drm_client_modeset.c so we can't
+ * use any MODULE_* macro here.
+ */

-- 
b4 0.11.0-dev-99e3a
