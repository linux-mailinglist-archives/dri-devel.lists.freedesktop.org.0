Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id B870143D27E
	for <lists+dri-devel@lfdr.de>; Wed, 27 Oct 2021 22:11:44 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 53C536E8EB;
	Wed, 27 Oct 2021 20:11:41 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from wnew2-smtp.messagingengine.com (wnew2-smtp.messagingengine.com
 [64.147.123.27])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C82196E8F3;
 Wed, 27 Oct 2021 20:11:37 +0000 (UTC)
Received: from compute1.internal (compute1.nyi.internal [10.202.2.41])
 by mailnew.west.internal (Postfix) with ESMTP id 9EDB12B0145C;
 Wed, 27 Oct 2021 16:11:35 -0400 (EDT)
Received: from mailfrontend2 ([10.202.2.163])
 by compute1.internal (MEProxy); Wed, 27 Oct 2021 16:11:37 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cerno.tech; h=
 from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-type:content-transfer-encoding; s=fm1; bh=
 RUg9cR6dIISAQRmgbME/s5vFNiGeb7kxE4/EhDHSj6E=; b=O04A4gn90CD6Bcj5
 9K8A2SYqa9eVJv/aR4NjqWrcwPtnS3Ji4bLbJKLwSdfIh/UKtu3f1ql9DwBmxVpe
 wdpDA3AU1meuO7a9BDfB8bL8gola5FxkZX1Jaucm5HP458M2Oi/xSYwnZPLe+L77
 RB2VCul7AGTM0DipuTArfEm0Xm6UeIHECpZ9GGD2bygHZAZhrV7TzLr0pqOPJuWY
 MjyaFalFoqvdwIg6x235nBsx63IYH60089tEWGYfOhC207+FNUGj0D7nUpr2Zhbt
 SVPKLG+gENsfG6aio3sscM0hd+T+bCdGkZO1Mv/fKgZedeOuxIv4rTUmaE3fxAh8
 rGKt3Q==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-transfer-encoding:content-type
 :date:from:in-reply-to:message-id:mime-version:references
 :subject:to:x-me-proxy:x-me-proxy:x-me-sender:x-me-sender
 :x-sasl-enc; s=fm1; bh=RUg9cR6dIISAQRmgbME/s5vFNiGeb7kxE4/EhDHSj
 6E=; b=UJB+0LW3R+YV0Rjrs6JGw9V+5AQZIc9tR9I6lB/gK7hLXm3fx973ZHuHV
 lCGfuf+IpOG/sELSAEh8KGi8dnhiSUAenQKML+trjBja3HvcKNFN9kbnCxglJT5n
 AHaKxnbBxXkMZSoNTGZmqQIe36S2RWwZ/2QHRwcIje5UPxIei5ZMkH4NRyNuVmdP
 nha3Z86j3AOfQ6U7eloHYIJW8do2WXf5NQHbAz2WUr3kqh5tmnebZWBMjIuIjE50
 Ma2bQ24GrPVfMXyqUC2vUBDK5gxcVhskB4By/Vt7w6kp0Y/OgUL9fuGui85ZQE1D
 v/2T0VuwPm/GageYOl+1CHgDqI0Cg==
X-ME-Sender: <xms:d7J5YXvNh8yhI_iBtAdS8uXZotfM_9ovp8dx00tUvJt3xKPH5_YggA>
 <xme:d7J5YYcbyXdiF7v7i7lnlAVD_k8fr0eVnk0WGeJO-TOY-l07gzJ0Nk3OhzjR0hrEL
 8dnj9Ux3ySL31QcaPE>
X-ME-Received: <xmr:d7J5YaxaMBm3rXM3FWhq3Aqvc0i41BgPsTX7jbcpwJdTdo9Dl6alYaqV6879NDptPD3MWtOAyZ-CWhqJS3PoAt5LNIOwjjZN1MIrKeLw>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvtddrvdegtddguddutdcutefuodetggdotefrod
 ftvfcurfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfgh
 necuuegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmd
 enucfjughrpefhvffufffkofgjfhggtgfgsehtkeertdertdejnecuhfhrohhmpeforgig
 ihhmvgcutfhiphgrrhguuceomhgrgihimhgvsegtvghrnhhordhtvggthheqnecuggftrf
 grthhtvghrnhepjeeugfegkeffgfeuvedtvddufffhjeffjeejvddvudduteehhfefhfef
 geeikeeknecuvehluhhsthgvrhfuihiivgepheenucfrrghrrghmpehmrghilhhfrhhomh
 epmhgrgihimhgvsegtvghrnhhordhtvggthh
X-ME-Proxy: <xmx:d7J5YWOPgC5phMpTjYNTrx4jmilTwXrzkkXkRRZnq4oD0Zd_zyWAFQ>
 <xmx:d7J5YX_DF5O2UryvCucqFiSrepv74MkqcsNoUg8eh7l3YWZrvldI-A>
 <xmx:d7J5YWXzvNZiJDPP816GF-7HXc2K0JpgEzGh51qOZ5CmIhBEeHXFqw>
 <xmx:d7J5Yau2fdGHPjEhRJONxoNQcoBA7uh3UmpGgJh6JrSEv5QBPMySsVL5pyc>
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Wed,
 27 Oct 2021 16:11:34 -0400 (EDT)
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
 linux-samsung-soc@vger.kernel.org, Sean Paul <sean@poorly.run>,
 Inki Dae <inki.dae@samsung.com>, dri-devel@lists.freedesktop.org,
 Seung-Woo Kim <sw0312.kim@samsung.com>, freedreno@lists.freedesktop.org,
 linux-arm-msm@vger.kernel.org, Joonyoung Shim <jy0922.shim@samsung.com>,
 Xinliang Liu <xinliang.liu@linaro.org>
Subject: Re: (subset) [PATCH v6 19/21] drm/bridge: tc358775: Register and
 attach our DSI device at probe
Date: Wed, 27 Oct 2021 22:09:50 +0200
Message-Id: <163532324665.18245.12856148244602778834.b4-ty@cerno.tech>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20211025151536.1048186-20-maxime@cerno.tech>
References: <20211025151536.1048186-1-maxime@cerno.tech>
 <20211025151536.1048186-20-maxime@cerno.tech>
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

On Mon, 25 Oct 2021 17:15:34 +0200, Maxime Ripard wrote:
> In order to avoid any probe ordering issue, the best practice is to move
> the secondary MIPI-DSI device registration and attachment to the
> MIPI-DSI host at probe time. Let's do this.
> 
> 

Applied to drm/drm-misc (drm-misc-next).

Thanks!
Maxime
