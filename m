Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 4B65D4D1618
	for <lists+dri-devel@lfdr.de>; Tue,  8 Mar 2022 12:21:33 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D25E410E5F2;
	Tue,  8 Mar 2022 11:21:30 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from wout5-smtp.messagingengine.com (wout5-smtp.messagingengine.com
 [64.147.123.21])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 420FD10E70D
 for <dri-devel@lists.freedesktop.org>; Tue,  8 Mar 2022 11:21:30 +0000 (UTC)
Received: from compute2.internal (compute2.nyi.internal [10.202.2.46])
 by mailout.west.internal (Postfix) with ESMTP id E8A7E3201F1A;
 Tue,  8 Mar 2022 06:21:28 -0500 (EST)
Received: from mailfrontend1 ([10.202.2.162])
 by compute2.internal (MEProxy); Tue, 08 Mar 2022 06:21:29 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cerno.tech; h=cc
 :cc:content-transfer-encoding:content-type:date:date:from:from
 :in-reply-to:in-reply-to:message-id:mime-version:references
 :reply-to:sender:subject:subject:to:to; s=fm2; bh=z0dgs/nLCUEaUJ
 97BFyT/rCTk7+HqMDGbw7diAaTdns=; b=GN7F0izHr81GDr5frIi6xPLCzYz+jt
 ukmpT5nyALjeSmeruURmsrsvap6CE1EVyh3rsvET76J5HKfMEqH/idj3eFZX7B32
 AbCGRfF72vDYNNrzw+xPRAHar4PAkglACh2sfWR3Lh5RuT9+dnBudylszFFHNlYh
 wdsZqHJUcCIU3rHN4R/UGAyIqwfWXNtM8wRuiMbatDQyxAPc3kovgRaWOJzLDwWc
 7ty6ogW5fTPREkMEOGZu0EWhXA1f3gUGwwDI5pusMeSKHUHQwUUaTXOWIZk8wWf5
 s70jPeU+Dx4fgnJGVNtjrULbQhMDtOnMUSgBL8V/fGCBgYhTYkMpQlcQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:cc:content-transfer-encoding
 :content-type:date:date:from:from:in-reply-to:in-reply-to
 :message-id:mime-version:references:reply-to:sender:subject
 :subject:to:to:x-me-proxy:x-me-proxy:x-me-sender:x-me-sender
 :x-sasl-enc; s=fm2; bh=z0dgs/nLCUEaUJ97BFyT/rCTk7+HqMDGbw7diAaTd
 ns=; b=GQZbptD/6VPdyd4eIBaHYSVetin3f36RFf/9M5p6PmqB8UkZDzYIxZNPy
 ifzwE97AHi9c+D5ZUJEHaX7g/7WTRW9Wncz8RnEkouvEWfZpz+D258lBFg7xBGC/
 UgfICrRXVazPUf8tWymQxkjkgaigGAGVi6+Cj66xKfGcTMWmj8vX1/5LcKv5aZoh
 x3FUMlmKbf9h9DrF52J8mD5HmZ3BjQrgqWmKnrg5AaR3CLoqlXWf1PcyMMNoa+8E
 6uKz1MBV8KlkSe6pmDZfGj3T7B1GMiFq5pWXolsOyOqYWMWh/juXmqHxigPCbkvN
 IDNChSVrp2h+qlm5p+2s+C6UWam0g==
X-ME-Sender: <xms:ODwnYpxJ8Mo_K4WILGV5QX1Pg2cm2q7I7wAagjmW9XcwkKbyEAtHYg>
 <xme:ODwnYpSbN7Y6i9QO55WKZqOVd17arPog10sXFbuJnjQMqKmRgIc9IS5iRTeFk6SSq
 WcK1zQqe7clFz2wOMQ>
X-ME-Received: <xmr:ODwnYjWOREdAI8DiBIGvdldQj7XygAU5mYO7ipevdeSbW-1TnQ8xxN962B22hUjSUnUzcL41E6NK9URhe1OvJojEbPvwdRF4DABisIw>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvvddrudduiedgvdejucetufdoteggodetrfdotf
 fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
 uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
 cujfgurhephffvufffkffojghfgggtgfesthekredtredtjeenucfhrhhomhepofgrgihi
 mhgvucftihhprghrugcuoehmrgigihhmvgestggvrhhnohdrthgvtghhqeenucggtffrrg
 htthgvrhhnpeejuefggeekfffgueevtddvudffhfejffejjedvvdduudethefhfefhfeeg
 ieekkeenucevlhhushhtvghrufhiiigvpedunecurfgrrhgrmhepmhgrihhlfhhrohhmpe
 hmrgigihhmvgestggvrhhnohdrthgvtghh
X-ME-Proxy: <xmx:ODwnYriWs0PlaAC1vqbU8kMHXximACFoTnHrypbRezQvUVIUGCQuZQ>
 <xmx:ODwnYrBAxOoTY_0oGhAf5ZUn47DQAO5Yh7fuXYCdKAcaUB59iAT2IA>
 <xmx:ODwnYkJH1AqMpTkIgw88UrPzoFTyARbaeMACGgMcIxZBQkm3Dpdbcw>
 <xmx:ODwnYv5efASGlGa3B0UcwTCkO2sfZ3rjbOHF7fWnFza2nRRWit9gCA>
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Tue,
 8 Mar 2022 06:21:27 -0500 (EST)
From: Maxime Ripard <maxime@cerno.tech>
To: =?UTF-8?q?Jos=C3=A9=20Exp=C3=B3sito?= <jose.exposito89@gmail.com>,
 andrzej.hajda@intel.com
Subject: Re: (subset) [PATCH] drm/bridge: ti-sn65dsi83: switch to
 devm_drm_of_get_bridge
Date: Tue,  8 Mar 2022 12:21:06 +0100
Message-Id: <164673846305.2436174.3713832532943884361.b4-ty@cerno.tech>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20220228183724.25030-1-jose.exposito89@gmail.com>
References: <20220228183724.25030-1-jose.exposito89@gmail.com>
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

On Mon, 28 Feb 2022 19:37:24 +0100, José Expósito wrote:
> The function "drm_of_find_panel_or_bridge" has been deprecated in
> favor of "devm_drm_of_get_bridge".
> 
> Switch to the new function and reduce boilerplate.
> 
> 

Applied to drm/drm-misc (drm-misc-next).

Thanks!
Maxime
