Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 34E494D1612
	for <lists+dri-devel@lfdr.de>; Tue,  8 Mar 2022 12:21:23 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C5A1010E5CC;
	Tue,  8 Mar 2022 11:21:20 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from wout5-smtp.messagingengine.com (wout5-smtp.messagingengine.com
 [64.147.123.21])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8CF2A10E5CC
 for <dri-devel@lists.freedesktop.org>; Tue,  8 Mar 2022 11:21:19 +0000 (UTC)
Received: from compute4.internal (compute4.nyi.internal [10.202.2.44])
 by mailout.west.internal (Postfix) with ESMTP id 06C743201D2F;
 Tue,  8 Mar 2022 06:21:17 -0500 (EST)
Received: from mailfrontend2 ([10.202.2.163])
 by compute4.internal (MEProxy); Tue, 08 Mar 2022 06:21:19 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cerno.tech; h=cc
 :cc:content-transfer-encoding:content-type:date:date:from:from
 :in-reply-to:in-reply-to:message-id:mime-version:references
 :reply-to:sender:subject:subject:to:to; s=fm2; bh=pKOLDup6CMOwYt
 Ms01f3OYDYeaQCLPa97H9UsprugUY=; b=VvA4Pnhx9qU+d6MYTfyKTF1k3A5N7c
 QU5i6l3JMTARjoJTfOz/EG7PtNQe4RFT2gmmGQtOKevu68uc2IrdU0lDonp6rNJo
 G29IoRJEvJ4fitmEqz36A/KKc9Z7FI7bLIWrbsGwUt7JjHLtYbuHF/FAmbnxcOLS
 HorFClux16n9nX3CicIXKZBYfXEWgmezXOlfsPWertrQkp5Y9SBQ1P8YdBQzEqkf
 iw7O1/1qJh7xAehTRuZV/59wVQyUmbM/kuB/QyAKH4sSX+XzwWr9rQ8WfFwdv3Fr
 qPH1qWulQXWnpGV/RWrTAsJPMXNbnlP3yHFzPI5BaB9BWTam9IHkEePQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:cc:content-transfer-encoding
 :content-type:date:date:from:from:in-reply-to:in-reply-to
 :message-id:mime-version:references:reply-to:sender:subject
 :subject:to:to:x-me-proxy:x-me-proxy:x-me-sender:x-me-sender
 :x-sasl-enc; s=fm2; bh=pKOLDup6CMOwYtMs01f3OYDYeaQCLPa97H9Usprug
 UY=; b=c43SFXaZPv1kn4o+X4jmfEC62HVt7ROIE+BsQbrQDdtAfBdSlfbs9fTCu
 PJU1t9uvnDo6xPQZJNAWlspwmo3zSY4XNqWt1itsbzgM2t6N9cstdJGypmWC7TMA
 OIwKQqnOWzynePjh0jX9B3IyR3lFRl+dpn8ES/icwky7XSEmlFuxDy9AGOkJqu7p
 gIFVdUJoa7FFOspXX40r61EMS+AkMT6tWlaDfcZVsWApl1pYGFXWyseL2spZlW12
 OHsL3JQJFMKvGCvQkz1cRMmrAI8dD0XP1QKxEYuKAiEXgY6gBB67Yp8s9S1UT9vY
 Qig0IPtzYBFuQzod0j6wXCJYJa+DQ==
X-ME-Sender: <xms:LTwnYi96AiL9MsDM26SVXo1Nuf8sqa50MpadeP0GEUDjBnqO-nwrOQ>
 <xme:LTwnYitcHmJscRYdbhviUC-W4Ds8W-yZVakWQN_v1v_BU7gDg3qB3h-4ajRFuL3Zs
 iEywKhG6yXT2EZ8pt8>
X-ME-Received: <xmr:LTwnYoA4wEZUI8B7cULCj-R_ZseNnEyqeUn5j0NcrHSxQVISqW0Bd-8rzOjMHtO7YTKru9Qv68zgpohysWOPtQWlH2aM-SXp3K3G6O4>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvvddrudduiedgvdeiucetufdoteggodetrfdotf
 fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
 uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
 cujfgurhephffvufffkffojghfgggtgfesthekredtredtjeenucfhrhhomhepofgrgihi
 mhgvucftihhprghrugcuoehmrgigihhmvgestggvrhhnohdrthgvtghhqeenucggtffrrg
 htthgvrhhnpeejuefggeekfffgueevtddvudffhfejffejjedvvdduudethefhfefhfeeg
 ieekkeenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepmhgrihhlfhhrohhmpe
 hmrgigihhmvgestggvrhhnohdrthgvtghh
X-ME-Proxy: <xmx:LTwnYqd6fi050ppkI1keeu99pDV8lOn7uRT4hesNwyItYqn2_HMUbw>
 <xmx:LTwnYnMHRCEhiI-aDiHS8vagCevvyjaRRftk2X3qXZv_do31L72zyA>
 <xmx:LTwnYkkak2GQstm9tyfkp9AN3lBfihK6eNYpv1bI4ednGT5lp3QISg>
 <xmx:LTwnYlsRt7uck-OuMmWt5Lzgs0QgEeF12SgO4o3Rzifw7CCE5NJR6w>
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Tue,
 8 Mar 2022 06:21:17 -0500 (EST)
From: Maxime Ripard <maxime@cerno.tech>
To: =?UTF-8?q?Jos=C3=A9=20Exp=C3=B3sito?= <jose.exposito89@gmail.com>,
 andrzej.hajda@intel.com
Subject: Re: (subset) [PATCH] drm/bridge: parade-ps8640: switch to
 devm_drm_of_get_bridge
Date: Tue,  8 Mar 2022 12:21:03 +0100
Message-Id: <164673846305.2436174.333287001156624230.b4-ty@cerno.tech>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20220228183131.23494-1-jose.exposito89@gmail.com>
References: <20220228183131.23494-1-jose.exposito89@gmail.com>
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
 dri-devel@lists.freedesktop.org, linux-mediatek@lists.infradead.org,
 Maxime Ripard <maxime@cerno.tech>, matthias.bgg@gmail.com,
 linux-arm-kernel@lists.infradead.org, Laurent.pinchart@ideasonboard.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Mon, 28 Feb 2022 19:31:31 +0100, José Expósito wrote:
> The function "drm_of_find_panel_or_bridge" has been deprecated in
> favor of "devm_drm_of_get_bridge".
> 
> Switch to the new function and reduce boilerplate.
> 
> 

Applied to drm/drm-misc (drm-misc-next).

Thanks!
Maxime
