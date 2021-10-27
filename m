Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 43B0F43D248
	for <lists+dri-devel@lfdr.de>; Wed, 27 Oct 2021 22:11:05 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3B0F06E8E6;
	Wed, 27 Oct 2021 20:11:02 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from new4-smtp.messagingengine.com (new4-smtp.messagingengine.com
 [66.111.4.230])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0B2486E8EB;
 Wed, 27 Oct 2021 20:10:58 +0000 (UTC)
Received: from compute6.internal (compute6.nyi.internal [10.202.2.46])
 by mailnew.nyi.internal (Postfix) with ESMTP id 16B1F580591;
 Wed, 27 Oct 2021 16:10:57 -0400 (EDT)
Received: from mailfrontend2 ([10.202.2.163])
 by compute6.internal (MEProxy); Wed, 27 Oct 2021 16:10:57 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cerno.tech; h=
 from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-type:content-transfer-encoding; s=fm1; bh=
 Dfp3E3JPhSmIpFg9M1/Ete1dD1LEPWgNYA18tMqJ7P4=; b=NQj/XFQOPEHpVIsO
 RXVPiD3/ouN/UISxM1oaoXgRBWaTOA3h4QeyfnrBCbEsar8WfjZtyyBMJ3wXs8sv
 Y27VB0bewsMc0rMVzQfqoTR0KdeXBf3xXBhqmPYHmTosHR9uXo6ZUAtKugZz3EH2
 BxXZN38MLqr2isMl+x/FA6JaMljtaurQjJTeXsKbj1mzgrpV78VwvBd7fTgmM0lj
 fBXL4geKC51sBzjyAsAobMKRYTN8CUtNEpr8GC1bGFriMVayN4laIsy//xc9suNu
 5V7iYqRgIBHHVSskAfxUO7IYJ4JXzX5e/UN0Uym40ADcSa/pIqciuqjOAvum83A4
 tbH4bw==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-transfer-encoding:content-type
 :date:from:in-reply-to:message-id:mime-version:references
 :subject:to:x-me-proxy:x-me-proxy:x-me-sender:x-me-sender
 :x-sasl-enc; s=fm1; bh=Dfp3E3JPhSmIpFg9M1/Ete1dD1LEPWgNYA18tMqJ7
 P4=; b=gRqB24nroTRe9Dnqr+XU0cPijUPrOXaCcYv17Wz2pK6bXEdoDeNjQ8OYL
 fxwTVeDTV6EhpYAmerkR+MKcEu8w78vnAec1tJ6PhZVgC1JxQ+nwmDsrG9Br73I6
 0zrCrhb5P+4nAEv/6Ry3EJYmEocbzLPLfPPI6rhh0Dpwbaf6w7wkObU1huk/H/QS
 QV/to0aN7xA8KBBwayhsItrsKi7RHAyuSI095m23SP7/fvZqzC9dgHyI7XVr+PlQ
 9t46ClBsp506F7kis0U5spK7UTikX9dYEgDMG32R17WmjWwiEotBeXzGMVRiq2bF
 krgeqJeHYf0WjvcRsT9YeuIK6WdiA==
X-ME-Sender: <xms:ULJ5YQrcm7j5sDlmlG3sSjd9cimmHxMSfk2HfZZqXfIa-75fZrG1oA>
 <xme:ULJ5YWrIO29ZrahsnkKGLYA4utvtIbY_vTJ-hKzB1R3A5L1HRnL51phkVFYO3wsSN
 QUaAsRpVqvLKSS-Y5w>
X-ME-Received: <xmr:ULJ5YVPpm7eVEdZHoReibsRP1_ioCT8JSo7aMTxfSJmx_lkWZk083hnWCIBFKAt6ICqwlUzRMyi7zcbMlZ1aoW3AFDbTMtazrSerBpyE>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvtddrvdegtddgheefucetufdoteggodetrfdotf
 fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
 uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
 cujfgurhephffvufffkffojghfgggtgfesthekredtredtjeenucfhrhhomhepofgrgihi
 mhgvucftihhprghrugcuoehmrgigihhmvgestggvrhhnohdrthgvtghhqeenucggtffrrg
 htthgvrhhnpeejuefggeekfffgueevtddvudffhfejffejjedvvdduudethefhfefhfeeg
 ieekkeenucevlhhushhtvghrufhiiigvpeefnecurfgrrhgrmhepmhgrihhlfhhrohhmpe
 hmrgigihhmvgestggvrhhnohdrthgvtghh
X-ME-Proxy: <xmx:ULJ5YX5WaphSjP7CJ8v_D7VuTSueSu2OhZlH68-W1DjACg809bCM4w>
 <xmx:ULJ5Yf7LZ6sSZ0T53eWUkCfWIVlB0pDPBrtkQFURPPcHoTRQnRgM7g>
 <xmx:ULJ5YXirhg8A5yHSP24BUfWTlIR4_z04EHM6CWG1HNygM8xw9x063w>
 <xmx:UbJ5YT70G5n8vHV7pvPvO73_heY0dGcSRHHWoju59e4aDDz6h7UU7w>
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Wed,
 27 Oct 2021 16:10:55 -0400 (EDT)
From: Maxime Ripard <maxime@cerno.tech>
To: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Thierry Reding <thierry.reding@gmail.com>,
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
 John Stultz <john.stultz@linaro.org>,
 Seung-Woo Kim <sw0312.kim@samsung.com>, Sean Paul <sean@poorly.run>,
 Inki Dae <inki.dae@samsung.com>, Chen Feng <puck.chen@hisilicon.com>,
 dri-devel@lists.freedesktop.org, linux-samsung-soc@vger.kernel.org,
 freedreno@lists.freedesktop.org, linux-arm-msm@vger.kernel.org,
 Joonyoung Shim <jy0922.shim@samsung.com>,
 Xinliang Liu <xinliang.liu@linaro.org>
Subject: Re: (subset) [PATCH v6 11/21] drm/bridge: ps8640: Switch to devm
 MIPI-DSI helpers
Date: Wed, 27 Oct 2021 22:09:42 +0200
Message-Id: <163532324664.18245.8400657494513082961.b4-ty@cerno.tech>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20211025151536.1048186-12-maxime@cerno.tech>
References: <20211025151536.1048186-1-maxime@cerno.tech>
 <20211025151536.1048186-12-maxime@cerno.tech>
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

On Mon, 25 Oct 2021 17:15:26 +0200, Maxime Ripard wrote:
> Let's switch to the new devm MIPI-DSI function to register and attach
> our secondary device. This also avoids leaking the device on removal.
> 
> 

Applied to drm/drm-misc (drm-misc-next).

Thanks!
Maxime
