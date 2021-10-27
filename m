Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id C36F043D242
	for <lists+dri-devel@lfdr.de>; Wed, 27 Oct 2021 22:10:48 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 035946E8E8;
	Wed, 27 Oct 2021 20:10:46 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from wnew2-smtp.messagingengine.com (wnew2-smtp.messagingengine.com
 [64.147.123.27])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C77746E8E6;
 Wed, 27 Oct 2021 20:10:42 +0000 (UTC)
Received: from compute4.internal (compute4.nyi.internal [10.202.2.44])
 by mailnew.west.internal (Postfix) with ESMTP id 9D1212B0145A;
 Wed, 27 Oct 2021 16:10:40 -0400 (EDT)
Received: from mailfrontend1 ([10.202.2.162])
 by compute4.internal (MEProxy); Wed, 27 Oct 2021 16:10:42 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cerno.tech; h=
 from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-type:content-transfer-encoding; s=fm1; bh=
 2FWX8QzGSUDjKY8Gs1qquyf+CVeWlK+7ZJEZcuzQfXQ=; b=JIKrb8qvIYtQVf4Q
 VkggMUkBfTzrXAuxfZ3sBNBivySnrZ1W0o6FIvhw6ED6tl29WQWKVKm7xyaHfqzL
 kNEvIf5Msb4YdHOSjx6Xf/82HqUPJE5WPsgsM0R27uzHxdD32F+8D2jvbXPANU/I
 I2a7jatIWANgSSZCNG45YozjaqZaNN7BvoCc5hCx0fMYA3MG99An8EbLRxo7K7DM
 iuiwi0BLWVV7HDEKUp3sAl5YP3ct5c6l2iIZg7jSv2BcaBInCJeacH1IHTegCEg5
 FZTuwQ0zxAip7rb+7EszUCbH/0pGT7SLfympvx1WcAGBe38LXymN1BOTgnut5HVl
 yQ42Xg==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-transfer-encoding:content-type
 :date:from:in-reply-to:message-id:mime-version:references
 :subject:to:x-me-proxy:x-me-proxy:x-me-sender:x-me-sender
 :x-sasl-enc; s=fm1; bh=2FWX8QzGSUDjKY8Gs1qquyf+CVeWlK+7ZJEZcuzQf
 XQ=; b=KXGMMZv6tYk4Z4mRrbwVCGnwzstAtXPBrm9qO11evEo7kMsNiSDklPBUr
 qnJt6jJ4lXD4x2A2H5CsAdolZlSpTwf1BG/rbnB7el20XOxBkBzpyrARKKB8g4B6
 D3BD8LbmGaACTTt25qX+eGIkZgCMxyt4pflQOXZFZIIYlTNV+I0yJ02zrfBUeWys
 PlJ02kFaE2mAULz89AKeQXNmvbEgrj4XvvvzYFo2dYM6zFduPgAhK/OQwq9ikqRS
 ZSPmQVMyO3ZZ1F+pIQR9XD2MTIyb46xSiRmfY6RN8kLrnc+7LriVqcDISJ/kd+hx
 3mK3+d+OgrCosfnbDSMtb3wvu7r8w==
X-ME-Sender: <xms:QLJ5YTGDsw02Kc5UD37GdkDPfL2_V0P9V9QcFxzI_NXPo19qBrIQBA>
 <xme:QLJ5YQX-btRu2A0Ind2zI32cH0otiSYUj3QCnQ1miKRrywRPrGc5fZlXykTzeJgFU
 UcVCZlCcrXa-l4MIMQ>
X-ME-Received: <xmr:QLJ5YVL-dqVrenKrv7nYab-DmOHi-ucMFIpBr8LbOvCZoHv6lGpRYgkaAFkxDs1eUPQ-N-g4dySQK5Hvkc7aNPsX0aVy00KuQaKEKWe3>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvtddrvdegtddguddutdcutefuodetggdotefrod
 ftvfcurfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfgh
 necuuegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmd
 enucfjughrpefhvffufffkofgjfhggtgfgsehtkeertdertdejnecuhfhrohhmpeforgig
 ihhmvgcutfhiphgrrhguuceomhgrgihimhgvsegtvghrnhhordhtvggthheqnecuggftrf
 grthhtvghrnhepjeeugfegkeffgfeuvedtvddufffhjeffjeejvddvudduteehhfefhfef
 geeikeeknecuvehluhhsthgvrhfuihiivgepudenucfrrghrrghmpehmrghilhhfrhhomh
 epmhgrgihimhgvsegtvghrnhhordhtvggthh
X-ME-Proxy: <xmx:QLJ5YRFhozBrP60vIjQf_72Sufc7nIR1NfmyDE-s10ya8BaLB9c_5Q>
 <xmx:QLJ5YZVetfSJgss0RLTcChkrmZJmztOLnUzsgW667m6oV5DCq-4_FA>
 <xmx:QLJ5YcO_dQyfXWPHDuIBlTtSgcLhWCB7XzvfFXTy7SYHRv3xq5YwNA>
 <xmx:QLJ5YQkKmrK8fdE-YfdKPog2eEtvsHRJE41Andi2WI0H5hE1k2D_5tOgZL0>
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Wed,
 27 Oct 2021 16:10:39 -0400 (EDT)
From: Maxime Ripard <maxime@cerno.tech>
To: Thierry Reding <thierry.reding@gmail.com>, Sam Ravnborg <sam@ravnborg.org>,
 Robert Foss <robert.foss@linaro.org>,
 Neil Armstrong <narmstrong@baylibre.com>,
 Daniel Vetter <daniel.vetter@intel.com>, Jonas Karlman <jonas@kwiboo.se>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 David Airlie <airlied@linux.ie>, Maxime Ripard <maxime@cerno.tech>,
 Andrzej Hajda <a.hajda@samsung.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 Jernej Skrabec <jernej.skrabec@gmail.com>
Cc: Xinwei Kong <kong.kongxinwei@hisilicon.com>,
 Kyungmin Park <kyungmin.park@samsung.com>, linux-kernel@vger.kernel.org,
 Tian Tao <tiantao6@hisilicon.com>, Rob Clark <robdclark@gmail.com>,
 John Stultz <john.stultz@linaro.org>, Sean Paul <sean@poorly.run>,
 linux-samsung-soc@vger.kernel.org, dri-devel@lists.freedesktop.org,
 Seung-Woo Kim <sw0312.kim@samsung.com>, Inki Dae <inki.dae@samsung.com>,
 Chen Feng <puck.chen@hisilicon.com>, freedreno@lists.freedesktop.org,
 linux-arm-msm@vger.kernel.org, Joonyoung Shim <jy0922.shim@samsung.com>,
 Xinliang Liu <xinliang.liu@linaro.org>
Subject: Re: (subset) [PATCH v6 08/21] drm/bridge: lt9611: Register and attach
 our DSI device at probe
Date: Wed, 27 Oct 2021 22:09:39 +0200
Message-Id: <163532324663.18245.9675185315904771018.b4-ty@cerno.tech>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20211025151536.1048186-9-maxime@cerno.tech>
References: <20211025151536.1048186-1-maxime@cerno.tech>
 <20211025151536.1048186-9-maxime@cerno.tech>
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

On Mon, 25 Oct 2021 17:15:23 +0200, Maxime Ripard wrote:
> In order to avoid any probe ordering issue, the best practice is to move
> the secondary MIPI-DSI device registration and attachment to the
> MIPI-DSI host at probe time. Let's do this.
> 
> 

Applied to drm/drm-misc (drm-misc-next).

Thanks!
Maxime
