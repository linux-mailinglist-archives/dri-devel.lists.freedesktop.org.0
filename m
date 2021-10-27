Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 7B70143D246
	for <lists+dri-devel@lfdr.de>; Wed, 27 Oct 2021 22:10:59 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9CD306E8EA;
	Wed, 27 Oct 2021 20:10:56 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from wnew2-smtp.messagingengine.com (wnew2-smtp.messagingengine.com
 [64.147.123.27])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EE8936E8E4;
 Wed, 27 Oct 2021 20:10:53 +0000 (UTC)
Received: from compute6.internal (compute6.nyi.internal [10.202.2.46])
 by mailnew.west.internal (Postfix) with ESMTP id 849B72B01468;
 Wed, 27 Oct 2021 16:10:51 -0400 (EDT)
Received: from mailfrontend2 ([10.202.2.163])
 by compute6.internal (MEProxy); Wed, 27 Oct 2021 16:10:53 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cerno.tech; h=
 from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-type:content-transfer-encoding; s=fm1; bh=
 Lx7NehLtNjssyUKQ4o2uSrTDISlp8TSCOVErsOA8ocs=; b=gYLIS2I8CYYlluH+
 nNf/pZ4WuMz4fr8mQ99L3Mv20sY/zEY5n/0k1EPkTQyIXFnvFteggIPeWCUri3GX
 cr5ijgMxQ2vCUL2EpFHFJxAK2baOwoev4O6Alg/pyk9vxLlf5FuQ6lQNNQZbb94c
 P0Qnpzvn/GIDSfqRSBzE8YYjrhQz3qp0rB4JqG4321ZcL7KeoplG6D5xibEBmFDx
 Y2qyGGhQQ14MKTPORRCOOOApUnqXa2SsoypXJ58q5mGPny87PzmZMfwY+RFu0+5K
 RsOq6X4qoEd19vBHyGJcFm9tiigP7ZQUaH2TAkidY5VYX/OlqXmedFWJu4fwxLtf
 B8cSaw==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-transfer-encoding:content-type
 :date:from:in-reply-to:message-id:mime-version:references
 :subject:to:x-me-proxy:x-me-proxy:x-me-sender:x-me-sender
 :x-sasl-enc; s=fm1; bh=Lx7NehLtNjssyUKQ4o2uSrTDISlp8TSCOVErsOA8o
 cs=; b=U2vhF2wZtKBuSPO9eRr6gq7s7aTEooeelLKN5B2R/vJZQj8l6PH9iUOdu
 w/hz3GN0qMRnUuE6SK+gGTnNO9dqGuzorMRTRddOcY8kLPCq2t5EYWb4ncQDie/1
 t1Dfyq6wL3gXdOedFgiYEZt7WcBZB841woycyS3RfEAIGSCt6tgT0KhksnehYepP
 ++preLC2ypB1+Ap4HpGGCfd/rCdPS1dbZKpFAJxzrw5WktVlAQYh2L+HHEGUpoPX
 uyAGgyj4OwXO0E7FVYKjfYrkrzQO6qjrMX1F0xbe9yHqeJdasXO30n1ivYzk/75M
 cqzzV/R4RYc/OxLft2Y8yKriYzmow==
X-ME-Sender: <xms:S7J5YR9c15iGYWJw4hPBXEB_9MdVryne86vuOMgmilYdcfk9aLAVyw>
 <xme:S7J5YVsvAKcNyS2afJ_BKCRSIcowJbGCeeKCwLBy4NXoHwzPW-nCWifFp9J107H0u
 2xHAqjP0tY6P8ElVnU>
X-ME-Received: <xmr:S7J5YfBD5M5n-Jkawk86uqKrJR9qZ_g4HJVx_CJsczjcXNduvy3WOizHqmAS16j8UlUXnE9Ny1DNy3exumdAbSYsbKWwjk9fpGx8sLmM>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvtddrvdegtddgheefucetufdoteggodetrfdotf
 fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
 uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
 cujfgurhephffvufffkffojghfgggtgfesthekredtredtjeenucfhrhhomhepofgrgihi
 mhgvucftihhprghrugcuoehmrgigihhmvgestggvrhhnohdrthgvtghhqeenucggtffrrg
 htthgvrhhnpeejuefggeekfffgueevtddvudffhfejffejjedvvdduudethefhfefhfeeg
 ieekkeenucevlhhushhtvghrufhiiigvpedvnecurfgrrhgrmhepmhgrihhlfhhrohhmpe
 hmrgigihhmvgestggvrhhnohdrthgvtghh
X-ME-Proxy: <xmx:S7J5YVf5XTI6pc9qEwCT0H8vX-l2pDt3nCZCUhUDl-0Es8VT67wtlA>
 <xmx:S7J5YWMYf2qMTowNcQli157kMBuCxFydHqX8Ric3SlrZw1IRbRIatA>
 <xmx:S7J5YXnwMF7eXZbH7wsyODieBB4F3trA7Djstxv_bIMS1UZ6Jgepew>
 <xmx:S7J5Yb_NOTY3vYvGJtbM1XeuBoUt0GeFVz1iitOyfwviEmaa3PiebIGaalg>
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Wed,
 27 Oct 2021 16:10:50 -0400 (EDT)
From: Maxime Ripard <maxime@cerno.tech>
To: Thierry Reding <thierry.reding@gmail.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Robert Foss <robert.foss@linaro.org>, Sam Ravnborg <sam@ravnborg.org>,
 Neil Armstrong <narmstrong@baylibre.com>, Jonas Karlman <jonas@kwiboo.se>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 David Airlie <airlied@linux.ie>, Maxime Ripard <maxime@cerno.tech>,
 Andrzej Hajda <a.hajda@samsung.com>,
 Daniel Vetter <daniel.vetter@intel.com>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 Jernej Skrabec <jernej.skrabec@gmail.com>
Cc: Xinwei Kong <kong.kongxinwei@hisilicon.com>,
 Kyungmin Park <kyungmin.park@samsung.com>, linux-kernel@vger.kernel.org,
 Tian Tao <tiantao6@hisilicon.com>, Rob Clark <robdclark@gmail.com>,
 John Stultz <john.stultz@linaro.org>, Chen Feng <puck.chen@hisilicon.com>,
 linux-samsung-soc@vger.kernel.org, dri-devel@lists.freedesktop.org,
 Sean Paul <sean@poorly.run>, Inki Dae <inki.dae@samsung.com>,
 Seung-Woo Kim <sw0312.kim@samsung.com>, freedreno@lists.freedesktop.org,
 linux-arm-msm@vger.kernel.org, Joonyoung Shim <jy0922.shim@samsung.com>,
 Xinliang Liu <xinliang.liu@linaro.org>
Subject: Re: (subset) [PATCH v6 10/21] drm/bridge: lt9611uxc: Register and
 attach our DSI device at probe
Date: Wed, 27 Oct 2021 22:09:41 +0200
Message-Id: <163532324663.18245.2148142661233883361.b4-ty@cerno.tech>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20211025151536.1048186-11-maxime@cerno.tech>
References: <20211025151536.1048186-1-maxime@cerno.tech>
 <20211025151536.1048186-11-maxime@cerno.tech>
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Mon, 25 Oct 2021 17:15:25 +0200, Maxime Ripard wrote:
> In order to avoid any probe ordering issue, the best practice is to move
> the secondary MIPI-DSI device registration and attachment to the
> MIPI-DSI host at probe time. Let's do this.
> 
> 

Applied to drm/drm-misc (drm-misc-next).

Thanks!
Maxime
