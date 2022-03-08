Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id CBCDA4D1617
	for <lists+dri-devel@lfdr.de>; Tue,  8 Mar 2022 12:21:30 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1D94910E700;
	Tue,  8 Mar 2022 11:21:28 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from wout5-smtp.messagingengine.com (wout5-smtp.messagingengine.com
 [64.147.123.21])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AA10510E5D5
 for <dri-devel@lists.freedesktop.org>; Tue,  8 Mar 2022 11:21:26 +0000 (UTC)
Received: from compute5.internal (compute5.nyi.internal [10.202.2.45])
 by mailout.west.internal (Postfix) with ESMTP id 608553201C39;
 Tue,  8 Mar 2022 06:21:25 -0500 (EST)
Received: from mailfrontend1 ([10.202.2.162])
 by compute5.internal (MEProxy); Tue, 08 Mar 2022 06:21:26 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cerno.tech; h=cc
 :cc:content-transfer-encoding:content-type:date:date:from:from
 :in-reply-to:in-reply-to:message-id:mime-version:references
 :reply-to:sender:subject:subject:to:to; s=fm2; bh=WQGU1J9bbr3315
 rs6JgpybcLnc3CGCNSMmh1icWwJ2w=; b=EzBZmiAwJM9vaCsbffQ9rSI/xG9kgH
 W7FJPJxo6sbSSpjRQIbTsHRgX2RIuBhwPJqVzyFyUusP80oqgbuzxLxt8h9ZTXAE
 R06sk46QdqCEtrXvoV0S5aBvTkq6HdHCy13oycDTQ3FaPk/sHGnNLatY6Rm3BrdP
 v1vwXLZNAtXlfoVs6Re19UJZv020I4CqZKJ1LAoRx/GROTA9oqT5E773AOJgDg4y
 ZrTJDncxBzngUbN0ShF9tN4fPuHRNW9Qrn0pnbAlFRxWshOZ/h1S3dFQIG23nCaq
 OPcf7HF+JwJjQCyX7ZGIjnEgdY7Vt4dQNQX2ayTesZh90jp6vudBUIow==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:cc:content-transfer-encoding
 :content-type:date:date:from:from:in-reply-to:in-reply-to
 :message-id:mime-version:references:reply-to:sender:subject
 :subject:to:to:x-me-proxy:x-me-proxy:x-me-sender:x-me-sender
 :x-sasl-enc; s=fm2; bh=WQGU1J9bbr3315rs6JgpybcLnc3CGCNSMmh1icWwJ
 2w=; b=D1gBGIHAzdD6IonqNeul+eWiN74KpQCCJml95QKv5ze8BHSP8NWZCk5bv
 /5iICYG4GfealB52uUM2hHeji68f5tQwDi276N9Mo3NwmMsd0M8d1PmIci8+cmA3
 HTjQ1qUV+3DjHLQ0p2YXxLvFBXpQPqneukUJRWSVptMWKIet9oe36jahjNmj0NeU
 K/hYney2Utj5nIwgS5kqpJ3Vy9+wfHqCyD8hLJSCOCcNKAsSvj/Ybj5G0D/OP19H
 jhRelpGaf0vXAze8j+WBvOgl1VY2J2YONO7eG6Kamm6jOtGppQRfrOI8nsM8vnS3
 ukZ0RjU6vTe0WEz0Kz+G+G5qHDY8g==
X-ME-Sender: <xms:NDwnYo05Mxk2Zw430nOJzoClOqdc8FraBIih_64SoC8DCkD9rBZxUQ>
 <xme:NDwnYjFLdlwbfT3ODMJ5k_aZCCpsGOR97_M_YwdKoucDBFPFs8perdz_43Fs0BY8Y
 b63-5FkRoLa95IZNqU>
X-ME-Received: <xmr:NDwnYg5ieGwG6dgIVNIoWgas08Z-8NwiJCKi86eP7CmQqE4Smf_lpJOQhsgP43CyBBVJmwfQ8uW1cMkRuEw-23Qt-Bs_GyaK8zbAK04>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvvddrudduiedgvdeiucetufdoteggodetrfdotf
 fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
 uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
 cujfgurhephffvufffkffojghfgggtgfesthekredtredtjeenucfhrhhomhepofgrgihi
 mhgvucftihhprghrugcuoehmrgigihhmvgestggvrhhnohdrthgvtghhqeenucggtffrrg
 htthgvrhhnpeejuefggeekfffgueevtddvudffhfejffejjedvvdduudethefhfefhfeeg
 ieekkeenucevlhhushhtvghrufhiiigvpedvnecurfgrrhgrmhepmhgrihhlfhhrohhmpe
 hmrgigihhmvgestggvrhhnohdrthgvtghh
X-ME-Proxy: <xmx:NDwnYh3AJSX3D6yawmq_YZd9Tv0mloaqXPTQ06gBpVkS2U9wc1hR_g>
 <xmx:NDwnYrGerDga9K5aQJrujzQRJdKsK1e9pAx6y0PfEbG3f681Ebce0Q>
 <xmx:NDwnYq8zJYJ45yK69b3qteD8ozcKiZf92LRqi2lAmJmEkTCAdsCHCg>
 <xmx:NDwnYj8_rJVpYNxm_DKOhVw1AOpdRgNLpG4YNFVGBvl4rjbKxwKQwA>
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Tue,
 8 Mar 2022 06:21:24 -0500 (EST)
From: Maxime Ripard <maxime@cerno.tech>
To: =?UTF-8?q?Jos=C3=A9=20Exp=C3=B3sito?= <jose.exposito89@gmail.com>,
 andrzej.hajda@intel.com
Subject: Re: (subset) [PATCH] drm/bridge: tc358775: switch to
 devm_drm_of_get_bridge
Date: Tue,  8 Mar 2022 12:21:05 +0100
Message-Id: <164673846305.2436174.6327272600175269390.b4-ty@cerno.tech>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20220228183537.24600-1-jose.exposito89@gmail.com>
References: <20220228183537.24600-1-jose.exposito89@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
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
Cc: jernej.skrabec@gmail.com, narmstrong@baylibre.com, airlied@linux.ie,
 robert.foss@linaro.org, jonas@kwiboo.se, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, Maxime Ripard <maxime@cerno.tech>,
 Laurent.pinchart@ideasonboard.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Mon, 28 Feb 2022 19:35:37 +0100, José Expósito wrote:
> The function "drm_of_find_panel_or_bridge" has been deprecated in
> favor of "devm_drm_of_get_bridge".
> 
> Switch to the new function and reduce boilerplate.
> 
> 

Applied to drm/drm-misc (drm-misc-next).

Thanks!
Maxime
