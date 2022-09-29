Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 9BA925EFAB0
	for <lists+dri-devel@lfdr.de>; Thu, 29 Sep 2022 18:33:16 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2A16210EADD;
	Thu, 29 Sep 2022 16:32:02 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from new4-smtp.messagingengine.com (new4-smtp.messagingengine.com
 [66.111.4.230])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C05F310EADE;
 Thu, 29 Sep 2022 16:31:40 +0000 (UTC)
Received: from compute3.internal (compute3.nyi.internal [10.202.2.43])
 by mailnew.nyi.internal (Postfix) with ESMTP id 2D57F580801;
 Thu, 29 Sep 2022 12:31:40 -0400 (EDT)
Received: from mailfrontend1 ([10.202.2.162])
 by compute3.internal (MEProxy); Thu, 29 Sep 2022 12:31:40 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cerno.tech; h=cc
 :cc:content-transfer-encoding:content-type:date:date:from:from
 :in-reply-to:in-reply-to:message-id:mime-version:references
 :reply-to:sender:subject:subject:to:to; s=fm2; t=1664469100; x=
 1664476300; bh=1I5s/1zpCjSGpoFmO3Rk6tuMvkKjJTg9c9dj+mVtszw=; b=D
 TN9qyudxRjVdDCM2ip7Ln4OzbPyKtbq9MmHWpKYh89Kk8jTPj6NlfyTvoayROdY2
 uFNwX4Lomh8xELTYqggB6mZV6IRR28zhHnDkPRO4wCW2aZWRg3yduMtiw36+9MAI
 3RCBwoHubSlkvmF0vAdB8V1tEpz20zqEJ+vqxnyMfck72iJeXDZvW1khtzBs7mJP
 BreRrreuPyP36lv9hShYofKI8fl24FyGG7bOpd1gxBBMfePzusywCD8e8bcuWLLv
 tmKn7MYNiza9RlnzxWzec6hfvapq+5Co+U/++Gb94QUx7T9yyqtLSQ205dAmiIaY
 bY7UR0WF584+GT6lHcrJA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:cc:content-transfer-encoding
 :content-type:date:date:feedback-id:feedback-id:from:from
 :in-reply-to:in-reply-to:message-id:mime-version:references
 :reply-to:sender:subject:subject:to:to:x-me-proxy:x-me-proxy
 :x-me-sender:x-me-sender:x-sasl-enc; s=fm2; t=1664469100; x=
 1664476300; bh=1I5s/1zpCjSGpoFmO3Rk6tuMvkKjJTg9c9dj+mVtszw=; b=s
 OIQFu7l13VybJ+x9sj4W2J8R01cSZjaGISCoXltQUhzd/lWRG2cDNHoBt/bBX50q
 Ay40RTGdjA2ozz33UHgiLI1O39PcgrujhVO+TT38Wg60D5iL13p+jOVD+arORkVI
 U1WfRDZk6p760GxoYKM275mIHQYMH86hGW/gLnieJ6Ymc8IrtBcRNTC8METNn4pN
 OLh07kskesE1UdDTus8rSlv9qGwbK/hooABQLzMQ4RL+LoJzQVCJOiavpUJIyhpM
 BsgvAPsavyxDTjq/+hvcdhMwjyANp07N+T5v5OvUCMoSZ/AALPv/YI1lVPKE8xkO
 D9zwTWnyFuR1aqzQHEJ+A==
X-ME-Sender: <xms:a8g1Y1fCa-g09ecTANAf9P0Sa2Eg7ARk2lAVIRlF_4sLPByCBV7FPg>
 <xme:a8g1YzMFpqj3YL2E-K4dZ-vyLw3WvVdAb3kkTRqJ-OUzvY1mzc12wYJIQrptxVn6V
 Qq1B16CJTMdzSgCcLY>
X-ME-Received: <xmr:a8g1Y-hgwPP0nc2GP8V1Eb1UbfrrQxUPhxVDaf7fK66znVBqCpnmLqBYRuIp>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvfedrfeehtddguddtfecutefuodetggdotefrod
 ftvfcurfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfgh
 necuuegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmd
 enucfjughrpefhfffugggtgffkfhgjvfevofesthekredtredtjeenucfhrhhomhepofgr
 gihimhgvucftihhprghrugcuoehmrgigihhmvgestggvrhhnohdrthgvtghhqeenucggtf
 frrghtthgvrhhnpeduudduhfevjeetfeegvdffvdevvdejudegudekjeehtdelhfffveet
 hfejledtveenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepmhgrihhlfhhroh
 hmpehmrgigihhmvgestggvrhhnohdrthgvtghh
X-ME-Proxy: <xmx:a8g1Y-8evWqN1oRc7SFU6EuFG2HEyhH8LeRvg4XeXkW5SV3IaOWEZQ>
 <xmx:a8g1Yxuq6F7UGDhmBjnGbxYskE3MKhY_5RqmbOCipguEZOsMnRQfbg>
 <xmx:a8g1Y9FLry1qDSwVgQrAGqbJHDUnbOK2GvvpsRUMybAxKCdflpW6cA>
 <xmx:bMg1Yy4GJYiPuNLCsfeDbWEdcTdyKx10XTGU71YTLL-TLo-hvwfesQ>
Feedback-ID: i8771445c:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Thu,
 29 Sep 2022 12:31:38 -0400 (EDT)
From: Maxime Ripard <maxime@cerno.tech>
Date: Thu, 29 Sep 2022 18:31:07 +0200
Subject: [PATCH v4 13/30] drm/modes: parse_cmdline: Add support for named modes
 containing dashes
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20220728-rpi-analog-tv-properties-v4-13-60d38873f782@cerno.tech>
References: <20220728-rpi-analog-tv-properties-v4-0-60d38873f782@cerno.tech>
In-Reply-To: <20220728-rpi-analog-tv-properties-v4-0-60d38873f782@cerno.tech>
To: Jernej Skrabec <jernej.skrabec@gmail.com>, Chen-Yu Tsai <wens@csie.org>,
 Karol Herbst <kherbst@redhat.com>, 
 Samuel Holland <samuel@sholland.org>, Lyude Paul <lyude@redhat.com>,
 Jani Nikula <jani.nikula@linux.intel.com>, 
 Daniel Vetter <daniel@ffwll.ch>, Thomas Zimmermann <tzimmermann@suse.de>,
 Emma Anholt <emma@anholt.net>, 
 Joonas Lahtinen <joonas.lahtinen@linux.intel.com>,
 Ben Skeggs <bskeggs@redhat.com>, David Airlie <airlied@linux.ie>, 
 Rodrigo Vivi <rodrigo.vivi@intel.com>,
 Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>
X-Mailer: b4 0.11.0-dev-7da52
X-Developer-Signature: v=1; a=openpgp-sha256; l=1145; i=maxime@cerno.tech;
 h=from:subject:message-id; bh=JqGOlPvL+KASIYkApYp15NnwUkb64P4yDvkjl3bgitE=;
 b=owGbwMvMwCX2+D1vfrpE4FHG02pJDMmmJ9wvnIsVdrOc9bHjlvXjRJboCxz3DPo6zqY+cOsJFrVX
 Pvuwo5SFQYyLQVZMkSVG2HxJ3KlZrzvZ+ObBzGFlAhnCwMUpABPpW8PI0DH30XneVRzNrDNYf/z4Oq
 W0cr2jJC9LqoXBq7mRTRZ8jUAVl39p8bYu15HvEH1S3GMjHh1bIvr8g03qqacbi2XnCTICAA==
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

From: Geert Uytterhoeven <geert@linux-m68k.org>

It is fairly common for named video modes to contain dashes (e.g.
"tt-mid" on Atari, "dblntsc-ff" on Amiga).  Currently such mode names
are not recognized, as the dash is considered to be a separator between
mode name and bpp.

Fix this by skipping any dashes that are not followed immediately by a
digit when looking for the separator.

Signed-off-by: Geert Uytterhoeven <geert@linux-m68k.org>
Reviewed-by: Hans de Goede <hdegoede@redhat.com>
Signed-off-by: Maxime Ripard <maxime@cerno.tech>
---
 drivers/gpu/drm/drm_modes.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/drivers/gpu/drm/drm_modes.c b/drivers/gpu/drm/drm_modes.c
index 99809ea09ce3..c0dceff51cac 100644
--- a/drivers/gpu/drm/drm_modes.c
+++ b/drivers/gpu/drm/drm_modes.c
@@ -2284,6 +2284,8 @@ bool drm_mode_parse_command_line_for_connector(const char *mode_option,
 
 	/* Try to locate the bpp and refresh specifiers, if any */
 	bpp_ptr = strnchr(name, options_off, '-');
+	while (bpp_ptr && !isdigit(bpp_ptr[1]))
+		bpp_ptr = strnchr(bpp_ptr + 1, options_off, '-');
 	if (bpp_ptr)
 		bpp_off = bpp_ptr - name;
 

-- 
b4 0.11.0-dev-7da52
