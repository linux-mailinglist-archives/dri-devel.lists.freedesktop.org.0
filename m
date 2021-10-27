Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C372A43D26B
	for <lists+dri-devel@lfdr.de>; Wed, 27 Oct 2021 22:11:38 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 81D4B6E8E4;
	Wed, 27 Oct 2021 20:11:36 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from wnew2-smtp.messagingengine.com (wnew2-smtp.messagingengine.com
 [64.147.123.27])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E6CCE6E8E4;
 Wed, 27 Oct 2021 20:11:32 +0000 (UTC)
Received: from compute4.internal (compute4.nyi.internal [10.202.2.44])
 by mailnew.west.internal (Postfix) with ESMTP id B72582B0145F;
 Wed, 27 Oct 2021 16:11:30 -0400 (EDT)
Received: from mailfrontend2 ([10.202.2.163])
 by compute4.internal (MEProxy); Wed, 27 Oct 2021 16:11:32 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cerno.tech; h=
 from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-type:content-transfer-encoding; s=fm1; bh=
 6atZqtpSx4EZuaG2FI/FIKYGpNwqxCmQKMZM9t8WbgA=; b=SV3sCieRsOC5s3xo
 5NwUoGRu77lURvw0Lt+L9GjcEhDl7HIjj+uncR90Zu95Je7+YG3JI3kyDboQVBWL
 KklqS9KBQX67PiLbmjJpGgyO924pq+74OLqk8azQd7EyzTTZoJHPJXbO5zUEwemL
 LTGUIi2rmbzcSmTo8RycygCkyJ0U3pwMVSMqzjYD3KyZtlxqU2lQMBKC6ZHSAcb8
 jwZbpuASYOvGUOQLMRSz4IClpjLTVaROZGZTQooJUAmabO1QBJCfCe9eSbmZYms0
 xyY/GJL8yOG4gqD2bTN/8Z/XCK8VnuVWikeqKncB6ma/MYM+GHLJ1VCSVoDx6uXM
 tBLeVw==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-transfer-encoding:content-type
 :date:from:in-reply-to:message-id:mime-version:references
 :subject:to:x-me-proxy:x-me-proxy:x-me-sender:x-me-sender
 :x-sasl-enc; s=fm1; bh=6atZqtpSx4EZuaG2FI/FIKYGpNwqxCmQKMZM9t8Wb
 gA=; b=h2hMTIaEmiyELvuXOkH/rs6Pfvw+4FDtejojAVcmLaWn7zmazYNautGCU
 dNDSz9zYOnK0v1s98ObbMHXEmdhChBMI16eF64Py7AXW4VdQp/5O0Rmm/pNhNJPZ
 OiQ+Jc9SaaLlvmV9pzoyfwXdTnLESOpCdbPrefOy+V/rgNIEvD7KfgceRtZOIY9f
 W5DuRHjNQrkT7rQnb/QvomyjR/M/O2HHCKwoAxcyKntaXQUBivw+qs1XyA2fYKJL
 ORsxOy0fDVHbSi6KKWvaZueFRiH0y0Ba1WIZAJfSWTHblssuf3IENek/haAI5qRt
 9Uxryvb7hoMVGmqKk12s7vh8CkKPQ==
X-ME-Sender: <xms:crJ5YRexFw_VGzR5f8sUECYKSfaTbs0V557X7qkHWeLWqf06zaUf2Q>
 <xme:crJ5YfMsWzEqSZuL0RpTaPa4eh3sd9pK5o4ycx-tRowvvdUqJm8WaALOeaZpXquLu
 6pQB9zMokKuSMsredU>
X-ME-Received: <xmr:crJ5YajNmA8Pie-WJ7Bc6cNsLZ_M2M45t5e2H2BuPhGHoskcpTy9heOWWvuLBGD5eHB2bhBTaaxilyXmvTRPU1oTZoMR_CmNwMRB1wXY>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvtddrvdegtddguddutdcutefuodetggdotefrod
 ftvfcurfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfgh
 necuuegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmd
 enucfjughrpefhvffufffkofgjfhggtgfgsehtkeertdertdejnecuhfhrohhmpeforgig
 ihhmvgcutfhiphgrrhguuceomhgrgihimhgvsegtvghrnhhordhtvggthheqnecuggftrf
 grthhtvghrnhepjeeugfegkeffgfeuvedtvddufffhjeffjeejvddvudduteehhfefhfef
 geeikeeknecuvehluhhsthgvrhfuihiivgepgeenucfrrghrrghmpehmrghilhhfrhhomh
 epmhgrgihimhgvsegtvghrnhhordhtvggthh
X-ME-Proxy: <xmx:crJ5Ya_sl3g68pJgqBvxd-LVeWClQgnN7Ynp6tDlV3Y7VfYHJ1jcMg>
 <xmx:crJ5YdvE7AYcLEmCMMgZ0Gr-vC3esQOfsKgjGkaF-tkwLXkY1S6b1g>
 <xmx:crJ5YZEvd5A8Vi5c0ifwqn_3mlnoKKSVv-FwKA-J4HZ6Iv8Ue6dugQ>
 <xmx:crJ5Ydd4xWHb6a-NYa_2ZHDxu5z_Pwd42FNM0IQ7hZ7u-Qmhht-SUwNGrOI>
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Wed,
 27 Oct 2021 16:11:29 -0400 (EDT)
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
 John Stultz <john.stultz@linaro.org>, Chen Feng <puck.chen@hisilicon.com>,
 linux-samsung-soc@vger.kernel.org, Inki Dae <inki.dae@samsung.com>,
 dri-devel@lists.freedesktop.org, Seung-Woo Kim <sw0312.kim@samsung.com>,
 Sean Paul <sean@poorly.run>, freedreno@lists.freedesktop.org,
 linux-arm-msm@vger.kernel.org, Joonyoung Shim <jy0922.shim@samsung.com>,
 Xinliang Liu <xinliang.liu@linaro.org>
Subject: Re: (subset) [PATCH v6 18/21] drm/bridge: tc358775: Switch to devm
 MIPI-DSI helpers
Date: Wed, 27 Oct 2021 22:09:49 +0200
Message-Id: <163532324664.18245.7775660548785516205.b4-ty@cerno.tech>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20211025151536.1048186-19-maxime@cerno.tech>
References: <20211025151536.1048186-1-maxime@cerno.tech>
 <20211025151536.1048186-19-maxime@cerno.tech>
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

On Mon, 25 Oct 2021 17:15:33 +0200, Maxime Ripard wrote:
> Let's switch to the new devm MIPI-DSI function to register and attach
> our secondary device. This also avoids leaking the device when we detach
> the bridge.
> 
> 

Applied to drm/drm-misc (drm-misc-next).

Thanks!
Maxime
