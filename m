Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id F053643D257
	for <lists+dri-devel@lfdr.de>; Wed, 27 Oct 2021 22:11:32 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BC0A46E8F2;
	Wed, 27 Oct 2021 20:11:30 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from wnew2-smtp.messagingengine.com (wnew2-smtp.messagingengine.com
 [64.147.123.27])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 175106E8F1;
 Wed, 27 Oct 2021 20:11:28 +0000 (UTC)
Received: from compute1.internal (compute1.nyi.internal [10.202.2.41])
 by mailnew.west.internal (Postfix) with ESMTP id 830D82B01464;
 Wed, 27 Oct 2021 16:11:25 -0400 (EDT)
Received: from mailfrontend2 ([10.202.2.163])
 by compute1.internal (MEProxy); Wed, 27 Oct 2021 16:11:27 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cerno.tech; h=
 from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-type:content-transfer-encoding; s=fm1; bh=
 +TyiGKVp3TxhyEgA15gu2H6+Zebed0ACoq4xI/dHetw=; b=F0nvGhTNZcQWumBi
 994c4knPo/vV/nwWoP/X2/KI9VMRXDartFh2bJwxZ5GjWDbGlVHiVq2e1RCHTjHx
 O6ZbdRVIza1bclLlB/PFPUup3TDkF1H5mYp3XJIIEyDbcS2v8J/X9pGwsGv6J/x+
 cIHJXCeivUIBPPW3FKDzOcIMHEnwqZUyLRsZDO6gN6QncVN285bmzIIuj4YSiwZ2
 k66JmlgssbUCetwmq7FccHwnjRCXNUH96TpvdNYcbQjhUhyAlTLXOdJz6flK+lFy
 1a1glYRkyNyt4Gkpyicv1avSAmlMXUQZkyctBc5URynCwz7+OMxlI6zG0aCtIqc4
 vIrtXg==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-transfer-encoding:content-type
 :date:from:in-reply-to:message-id:mime-version:references
 :subject:to:x-me-proxy:x-me-proxy:x-me-sender:x-me-sender
 :x-sasl-enc; s=fm1; bh=+TyiGKVp3TxhyEgA15gu2H6+Zebed0ACoq4xI/dHe
 tw=; b=lye6WM5cgXTs5O7+J2FT1nFE6MeeAKMTKxL55ksuWzxPXJ6fWvWIbLhfu
 /+C3o3KvPlGyAgHTzAvZCZrkuHpQ2TU6jaYV8z/4q7tamtYTfQOw2QRLo1fw/lsc
 1nW+OhbNICHmRFbWlBaul3OsKkOmCClif9zoa8cqPWxiaAB54Ilejma0QI5fhzmT
 obDsXEk0BMYBraXYuNVN2tJcZFFsebQn06zjagDCtpAvg8P5h/MeqGSZDIISLeaX
 8MfYE4EmLn3m+4a3kJwDZM+PmewrA1vmUCe02bgqFr7VyYsKU5pFpSmJ31atPSDg
 tx2oSt4oyM+/UqF7XplF30MchwPHg==
X-ME-Sender: <xms:bbJ5YSNC9Il7N6L63Gur6OSXG-ZFM4TK11Lqm-hG1lxwhXhv0u9jeA>
 <xme:bbJ5YQ-3pcrzXp4COYCkHAS0_u3n4GF1CZv_Hlun2vge0XtAVYw997-D2zINVPEKr
 BgtZuwXn_rxgURvq_E>
X-ME-Received: <xmr:bbJ5YZTDOuZohYH4UCIKsam-78H-at_6-N4-UxQRxbJ7KSJnienBEDdF3_UsUL4sT3H5MTmz3G909OvgH_1twFH-n8FuJr_snqvY_LJ2>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvtddrvdegtddguddutdcutefuodetggdotefrod
 ftvfcurfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfgh
 necuuegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmd
 enucfjughrpefhvffufffkofgjfhggtgfgsehtkeertdertdejnecuhfhrohhmpeforgig
 ihhmvgcutfhiphgrrhguuceomhgrgihimhgvsegtvghrnhhordhtvggthheqnecuggftrf
 grthhtvghrnhepjeeugfegkeffgfeuvedtvddufffhjeffjeejvddvudduteehhfefhfef
 geeikeeknecuvehluhhsthgvrhfuihiivgepgeenucfrrghrrghmpehmrghilhhfrhhomh
 epmhgrgihimhgvsegtvghrnhhordhtvggthh
X-ME-Proxy: <xmx:bbJ5YSuqD7xBD8vlkUROWZtCyQDBz9ii8zKZWRdezX_p23TsNY_ceg>
 <xmx:bbJ5YafadYsEqiQiWck6CIZl6eH3yNNgn2RTE2vpxBn4BGdy-TrrKA>
 <xmx:bbJ5YW2_eijQ7CPU_FvXF7NwzWdWwcXmN0zVYC8nRfvTHeGjy_z_Hw>
 <xmx:bbJ5YbMmegkqV9R6Sg28AuJuRhDopyE1oL7WnQ70GadbTmLiotaUfq-Sz8E>
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Wed,
 27 Oct 2021 16:11:24 -0400 (EDT)
From: Maxime Ripard <maxime@cerno.tech>
To: Thierry Reding <thierry.reding@gmail.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Sam Ravnborg <sam@ravnborg.org>, Robert Foss <robert.foss@linaro.org>,
 Neil Armstrong <narmstrong@baylibre.com>, Jonas Karlman <jonas@kwiboo.se>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 David Airlie <airlied@linux.ie>, Maxime Ripard <maxime@cerno.tech>,
 Andrzej Hajda <a.hajda@samsung.com>,
 Daniel Vetter <daniel.vetter@intel.com>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 Jernej Skrabec <jernej.skrabec@gmail.com>
Cc: Xinwei Kong <kong.kongxinwei@hisilicon.com>,
 Kyungmin Park <kyungmin.park@samsung.com>,
 Tian Tao <tiantao6@hisilicon.com>, linux-kernel@vger.kernel.org,
 Rob Clark <robdclark@gmail.com>, John Stultz <john.stultz@linaro.org>,
 Chen Feng <puck.chen@hisilicon.com>, linux-samsung-soc@vger.kernel.org,
 Seung-Woo Kim <sw0312.kim@samsung.com>, dri-devel@lists.freedesktop.org,
 Sean Paul <sean@poorly.run>, Inki Dae <inki.dae@samsung.com>,
 freedreno@lists.freedesktop.org, linux-arm-msm@vger.kernel.org,
 Joonyoung Shim <jy0922.shim@samsung.com>,
 Xinliang Liu <xinliang.liu@linaro.org>
Subject: Re: (subset) [PATCH v6 17/21] drm/bridge: sn65dsi86: Register and
 attach our DSI device at probe
Date: Wed, 27 Oct 2021 22:09:48 +0200
Message-Id: <163532324664.18245.1011234274824423865.b4-ty@cerno.tech>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20211025151536.1048186-18-maxime@cerno.tech>
References: <20211025151536.1048186-1-maxime@cerno.tech>
 <20211025151536.1048186-18-maxime@cerno.tech>
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

On Mon, 25 Oct 2021 17:15:32 +0200, Maxime Ripard wrote:
> In order to avoid any probe ordering issue, the best practice is to move
> the secondary MIPI-DSI device registration and attachment to the
> MIPI-DSI host at probe time. Let's do this.
> 
> 

Applied to drm/drm-misc (drm-misc-next).

Thanks!
Maxime
