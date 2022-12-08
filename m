Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 93F04646B38
	for <lists+dri-devel@lfdr.de>; Thu,  8 Dec 2022 09:58:54 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 073F410E47F;
	Thu,  8 Dec 2022 08:58:50 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from out4-smtp.messagingengine.com (out4-smtp.messagingengine.com
 [66.111.4.28])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8282C10E47E
 for <dri-devel@lists.freedesktop.org>; Thu,  8 Dec 2022 08:58:34 +0000 (UTC)
Received: from compute6.internal (compute6.nyi.internal [10.202.2.47])
 by mailout.nyi.internal (Postfix) with ESMTP id AA21E5C00E0;
 Thu,  8 Dec 2022 03:58:33 -0500 (EST)
Received: from mailfrontend2 ([10.202.2.163])
 by compute6.internal (MEProxy); Thu, 08 Dec 2022 03:58:33 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cerno.tech; h=cc
 :cc:content-transfer-encoding:content-type:date:date:from:from
 :in-reply-to:in-reply-to:message-id:mime-version:references
 :reply-to:sender:subject:subject:to:to; s=fm3; t=1670489913; x=
 1670576313; bh=ZR2txHX9cVfBdo1T1R2ZVRBAIYB8L7wIgSvoebPArBk=; b=g
 e6aHgCTQsdgR36lwHDxSlZVHYz0RkuL5yaurJdhG4KXZWF0gUoIwy5eYVnDiYmnK
 jaDNQwyJThqEjPNNb4cuyIpCYB8EL7VAZxWaSeIKX3vvK5LV7MRtYcdb/reEklGs
 T6H3h8pLg0uErqms32PeLkH7I/wap/jikuRR84RHeSTo4BfN0HwfLjt2EvwgaeeV
 8PSb5NTflu670j3At8mBos6sdtgQXUaLxQcq5mTuoaToJYdUe9aUPtRH+pwUTdz4
 hzkMi4ZpWYGDzp2DZ4/pPGzWZXvmuBM1vPF1q/QULrLxJfBmDphZubulgYz8ni9/
 n+5BERwR7zkGeY/n5aBDw==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:cc:content-transfer-encoding
 :content-type:date:date:feedback-id:feedback-id:from:from
 :in-reply-to:in-reply-to:message-id:mime-version:references
 :reply-to:sender:subject:subject:to:to:x-me-proxy:x-me-proxy
 :x-me-sender:x-me-sender:x-sasl-enc; s=fm2; t=1670489913; x=
 1670576313; bh=ZR2txHX9cVfBdo1T1R2ZVRBAIYB8L7wIgSvoebPArBk=; b=F
 L/G/DTaebsISNtxCF4B3pTu0JZElZe4O7FskmugfxyGsmKB1uFrGFX372m2HvAEu
 0M3OUPF2vNUVYIdcoMgD8TpJxpqwIHVIer/ZdtWMv1cFjmEKez4tzFLGzp4qGUIL
 d9IGXG/z0RXV/ysOzeyCKkfF/RVbV+jpfGx3avdI72t4JLPN+tUj1F8JtUQQo7Ct
 pV3fvsH2GFV++A7hw7Tutrac415ma3tYd00blQJMS4Os421vrCxrkcIoeAkDRIkN
 kQ9HZmIlybHIfO17OLzaCf0HnxpAKKkNc9RUad7jLKiOlAURPgbVW4eulH5eV37u
 uZiPwJsw4UvXWDKmG7atQ==
X-ME-Sender: <xms:OKeRYyYWTaHFQGRBM4dTr4in8bxmp5_tjwUnetcy7nkO_JA5ebOObw>
 <xme:OKeRY1autpZtVwHSuKStguY672DYqs9hew4-vmxg2tykfNQnu3W3juUK87QgW8lWj
 75kCB96PmMDLYQA-Cw>
X-ME-Received: <xmr:OKeRY8_WEY_6bRqSkW-JWtMZHkxd03cJwMB-uBKk8g1M7IS7LMImaKFC_pUx87oBrZT1vol9n_FDfHuK855nu_6CTR-JAQqqfAbas0vu2dCzxg>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvhedrudelgdduvdekucetufdoteggodetrfdotf
 fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
 uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
 cujfgurhephffvvegjfhfukfffgggtgffosehtkeertdertdejnecuhfhrohhmpeforgig
 ihhmvgcutfhiphgrrhguuceomhgrgihimhgvsegtvghrnhhordhtvggthheqnecuggftrf
 grthhtvghrnhepieefieeglefhheekledtteejteeuleetueevkeeuveffudehffefhffh
 hefgheeinecuvehluhhsthgvrhfuihiivgepudenucfrrghrrghmpehmrghilhhfrhhomh
 epmhgrgihimhgvsegtvghrnhhordhtvggthh
X-ME-Proxy: <xmx:OKeRY0rcTb941ZAjmfzMAePXqw_nkA6nPZabwAcDRvmAqxOBza4pbA>
 <xmx:OKeRY9oLjeR8N4XPZ0_FIfB_ScT1SWtkRQY6Jpxt4_bwxwi9lKSO5g>
 <xmx:OKeRYySEkoKSb0PKoEgroaCTnLgZ8cti_ObhFabD8FibH5jl--yTBw>
 <xmx:OaeRYywR6MoRcRccWsJU2Kf577QpcyZBmZNZbTOSlKAcRSGbedzyGA>
Feedback-ID: i8771445c:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Thu,
 8 Dec 2022 03:58:32 -0500 (EST)
From: Maxime Ripard <maxime@cerno.tech>
To: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 David Airlie <airlied@gmail.com>, 
 dri-devel@lists.freedesktop.org, Daniel Vetter <daniel@ffwll.ch>,
 Dave Stevenson <dave.stevenson@raspberrypi.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>
In-Reply-To: <20221205173328.1395350-1-dave.stevenson@raspberrypi.com>
References: <20221205173328.1395350-1-dave.stevenson@raspberrypi.com>
Subject: Re: [PATCH v4 0/6] DSI host and peripheral initialisation ordering
Message-Id: <167048989079.2773435.446019153004923200.b4-ty@cerno.tech>
Date: Thu, 08 Dec 2022 09:58:10 +0100
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-Mailer: b4 0.10.1
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
Cc: Marek Vasut <marex@denx.de>, Neil Armstrong <neil.armstrong@linaro.org>,
 Jernej Skrabec <jernej.skrabec@gmail.com>,
 Chun-Kuang Hu <chunkuang.hu@kernel.org>, Jonas Karlman <jonas@kwiboo.se>,
 Douglas Anderson <dianders@chromium.org>, Robert Foss <robert.foss@linaro.org>,
 Frieder Schrempf <frieder.schrempf@kontron.de>,
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
 Jagan Teki <jagan@amarulasolutions.com>,
 Andrzej Hajda <andrzej.hajda@intel.com>, andrzej.hajda@gmail.com,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Mon, 5 Dec 2022 17:33:22 +0000, Dave Stevenson wrote:
> Changes from v3
> - Add patch to remove use of drm_bridge_chain from the MTK DP driver, copying the
>   same pattern as Sam used for ps8640.
> - Add comment for why we update the bridge pointer in drm_atomic_bridge_chain_post_disable
> - Add Frieder's tags
> 
> Changes from v2 (sorry it's taken me a while to get around to these):
> - Added Sam's patches to drop drm_bridge_chain functions
> - Renamed upstream to previously (Sam)
> - Moved copying of panel->prepare_prev_first to bridge->pre_enable_prev_first
>   from drm_panel_bridge_add_typed to devm_drm_panel_bridge_add_typed (Jagan)
> 
> [...]

Applied to drm/drm-misc (drm-misc-next).

Thanks!
Maxime
