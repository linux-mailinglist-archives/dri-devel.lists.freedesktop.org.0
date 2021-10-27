Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 1149E43D24D
	for <lists+dri-devel@lfdr.de>; Wed, 27 Oct 2021 22:11:08 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9A3846E8ED;
	Wed, 27 Oct 2021 20:11:05 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from wnew2-smtp.messagingengine.com (wnew2-smtp.messagingengine.com
 [64.147.123.27])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 26E306E8EC;
 Wed, 27 Oct 2021 20:11:03 +0000 (UTC)
Received: from compute2.internal (compute2.nyi.internal [10.202.2.42])
 by mailnew.west.internal (Postfix) with ESMTP id E88BE2B01463;
 Wed, 27 Oct 2021 16:11:00 -0400 (EDT)
Received: from mailfrontend1 ([10.202.2.162])
 by compute2.internal (MEProxy); Wed, 27 Oct 2021 16:11:02 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cerno.tech; h=
 from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-type:content-transfer-encoding; s=fm1; bh=
 l4Xrcim1NeZ0A3wLC0VIRJabGj7nDwOIrT1lj2KJTfs=; b=LMFxdXaUrKPrgfx3
 dU0WlzjALNOfhhYji3EVlrO3kO1tSDhPt8xEkbVI7IEcTYqlzTFgK/DDxQ/z3ZlH
 EdnmBxigUTczLut4EMXJQt2sQMP3ubKH4K6GaOE1TXVaMzeBKl6aL+i70b9Dc5Gc
 VgHet5JUG/gV8F2gXZu7MoeVZ59sZ+dJC7j5Xmww0HeHSxY4hqWiC5WfNCO26YTt
 omrZHzuQMUAXB7li/T9x2L2Bj0mzfDA9sB+eNNByzXKVtk1VudbazcbkyRPsKW3h
 knKOcnQTVibG5SPjujJZFi/YB7q1E5tN7o2ZeLCGrk54XGTV9sOYlsLam/OUEIEK
 z7kvLg==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-transfer-encoding:content-type
 :date:from:in-reply-to:message-id:mime-version:references
 :subject:to:x-me-proxy:x-me-proxy:x-me-sender:x-me-sender
 :x-sasl-enc; s=fm1; bh=l4Xrcim1NeZ0A3wLC0VIRJabGj7nDwOIrT1lj2KJT
 fs=; b=V+Uw+iE4mGVzZKYZ6w56Cqor+uljVP6j2EGPCGh6+klg0fbWJXlZ499go
 BqoRTfFHeg3fNuK0ntFBPGCJonShKtgtpP2tBd+1uBroJ1Dr16MVEolCFEAZVJEw
 NzyyYWAI701xGdfcyqGcFcBCw6b58udSYp0RVgA6v3RcT7iqbtzGos0IAXRqNJIJ
 QfHp6ws8EXHWz9nMxmvC3GlDbxO3JbtLfpZ7lAYYrCjG4Alz7HZJh9feFsr4WknI
 8RSnXM9n97Ci44XbHcAXMl+dEFKPlKuZSF3AS+KbpOAvAKjOrk56XXN79opNkuOn
 VTHcf3bWu2oxD5F5QnGLNlYlaeBVQ==
X-ME-Sender: <xms:U7J5YXyUzj3hzhpwjXWPLPjXYtRvh6Bo7zDW16T5_DAoY_YxVCxFKg>
 <xme:U7J5YfS8opwbXCK-b_kj8FkOqvvTbGYlIf5IOEVVM1_bf5i8t_tKmVVbOgopoTlt4
 mAtrPvsoOkTrSGWdd4>
X-ME-Received: <xmr:U7J5YRUEXqenTDDSnwiDeWvCRk1pchvIXaw_Vr-KXsCT3ygX9nj535aqWZMtTJm4nlFor0PMHaPsFSyLTy4wznxKkjg44U_IUMgS5FD8>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvtddrvdegtddguddutdcutefuodetggdotefrod
 ftvfcurfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfgh
 necuuegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmd
 enucfjughrpefhvffufffkofgjfhggtgfgsehtkeertdertdejnecuhfhrohhmpeforgig
 ihhmvgcutfhiphgrrhguuceomhgrgihimhgvsegtvghrnhhordhtvggthheqnecuggftrf
 grthhtvghrnhepjeeugfegkeffgfeuvedtvddufffhjeffjeejvddvudduteehhfefhfef
 geeikeeknecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehmrghilhhfrhhomh
 epmhgrgihimhgvsegtvghrnhhordhtvggthh
X-ME-Proxy: <xmx:U7J5YRgH8vhs5KBLFGcOHg3C2hnrOh_Mhjw7we5y6oxc12dosoNlYw>
 <xmx:U7J5YZBZ0AelwOAiWH9gac1vpeeu5UqZTy4rHroD-9zYzbx0UXV6DQ>
 <xmx:U7J5YaIe1HW67C0TC80zN7QZ7LR81BkWGlMP5ivsANaAc1OrU-grOg>
 <xmx:VLJ5YWhEBPWGIEpxOwBwfp55Vkqc13_-o-3jMS9Hud7VGcSij6Fa9aZ7yGg>
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Wed,
 27 Oct 2021 16:10:58 -0400 (EDT)
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
 Kyungmin Park <kyungmin.park@samsung.com>, linux-kernel@vger.kernel.org,
 Tian Tao <tiantao6@hisilicon.com>, Rob Clark <robdclark@gmail.com>,
 John Stultz <john.stultz@linaro.org>, Sean Paul <sean@poorly.run>,
 dri-devel@lists.freedesktop.org, Seung-Woo Kim <sw0312.kim@samsung.com>,
 Inki Dae <inki.dae@samsung.com>, Chen Feng <puck.chen@hisilicon.com>,
 linux-samsung-soc@vger.kernel.org, freedreno@lists.freedesktop.org,
 linux-arm-msm@vger.kernel.org, Joonyoung Shim <jy0922.shim@samsung.com>,
 Xinliang Liu <xinliang.liu@linaro.org>
Subject: Re: (subset) [PATCH v6 12/21] drm/bridge: ps8640: Register and attach
 our DSI device at probe
Date: Wed, 27 Oct 2021 22:09:43 +0200
Message-Id: <163532324664.18245.16998495633292862458.b4-ty@cerno.tech>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20211025151536.1048186-13-maxime@cerno.tech>
References: <20211025151536.1048186-1-maxime@cerno.tech>
 <20211025151536.1048186-13-maxime@cerno.tech>
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

On Mon, 25 Oct 2021 17:15:27 +0200, Maxime Ripard wrote:
> In order to avoid any probe ordering issue, the best practice is to move
> the secondary MIPI-DSI device registration and attachment to the
> MIPI-DSI host at probe time. Let's do this.
> 
> 

Applied to drm/drm-misc (drm-misc-next).

Thanks!
Maxime
