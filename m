Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id CA763680E48
	for <lists+dri-devel@lfdr.de>; Mon, 30 Jan 2023 13:58:33 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0126C10E241;
	Mon, 30 Jan 2023 12:58:31 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from new3-smtp.messagingengine.com (new3-smtp.messagingengine.com
 [66.111.4.229])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C397B10E241
 for <dri-devel@lists.freedesktop.org>; Mon, 30 Jan 2023 12:58:30 +0000 (UTC)
Received: from compute6.internal (compute6.nyi.internal [10.202.2.47])
 by mailnew.nyi.internal (Postfix) with ESMTP id 1926B582282;
 Mon, 30 Jan 2023 07:58:30 -0500 (EST)
Received: from mailfrontend2 ([10.202.2.163])
 by compute6.internal (MEProxy); Mon, 30 Jan 2023 07:58:30 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cerno.tech; h=cc
 :cc:content-transfer-encoding:content-type:date:date:from:from
 :in-reply-to:in-reply-to:message-id:mime-version:references
 :reply-to:sender:subject:subject:to:to; s=fm1; t=1675083510; x=
 1675090710; bh=53rVXwlYlsFng8t5pHWKg2MIJxmNnLUwuFkZj4u4pFc=; b=J
 29+54jAlHYmGRXiCwzNZfVRGWLyeLTe28rRLzjF73vzpAPEn7DGnKTKutMChWV7f
 irwR0CcZebbLlQx3Q5GNUvaJGyZ52BVFLEUlRLVgTODqAZPUdq3/r0+dXQzK1C03
 WwE4wEoXcoSvcyu+i54UaxnaB69dSRWYkcyK7PHV093y69hdINSdpVuNNLjIAiaS
 N9p6Q6LUvE17hjTHZ20WpowESHMaRTesBOJUtSNTCO9Tx8qXqxN5+tU9grdfx6dS
 vO+oPhfgrLbL636T6o1KnETlqI9cbzJku6K4oVx5qaebsaDeL8tDVHlS3wgDczp9
 O2mZ/uwA0cYnE6p8BdKLQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:cc:content-transfer-encoding
 :content-type:date:date:feedback-id:feedback-id:from:from
 :in-reply-to:in-reply-to:message-id:mime-version:references
 :reply-to:sender:subject:subject:to:to:x-me-proxy:x-me-proxy
 :x-me-sender:x-me-sender:x-sasl-enc; s=fm3; t=1675083510; x=
 1675090710; bh=53rVXwlYlsFng8t5pHWKg2MIJxmNnLUwuFkZj4u4pFc=; b=m
 oXSd9d67ZYDMVn5jAVk8GyI3u8VwZqugxCL2f8XJgemR/6cX6ro4Bi/PT3mzRLz/
 SOZldaskhZWAhdQz1GK0wQTArefkuycxea3CpebvajZQ5ubBT2B+hDBUCliY2FCr
 73sUElbmVnaoOg/KoSnIhHBC3IgH/vBGnjFNnqAjLWM7wXpfwuZ61wWlphYEXSYF
 utcJDl/oYFKiOvDoFoHv7fA1W6nZea2nJgyYYzp9n6XRTpWiZtENqQtqzMF3OjoH
 0P8GTggVOjYXLXJONcllEJawR/zjoDWPbi2RzRLNKlPrctf2lm4oRecDG8qVujJB
 LlRal2FKmL0N8Ck9iIfOA==
X-ME-Sender: <xms:9b7XY9llLbS4rxMFsvR4MjZTP4MpqKsGp85HHUsfW9a9GgF7kenQDQ>
 <xme:9b7XY41v19rRnKqYCvKlbIMg3wlN41iSH7wSZKHJEzHaGrdx5iJChj7NN8NTxL20s
 bz8EvcvdTvz513yFzY>
X-ME-Received: <xmr:9b7XYzqFT88veX3wyrMfw-LkL_RRvT-kX0_alL0Q75qGeO3HYcCEkO1sidpACZ-w-yxExeq3HndqTyxA0UEmiy3VPCK0XBBHKJSiEB6P5LQ1oA>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvhedrudefvddggeejucetufdoteggodetrfdotf
 fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
 uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
 cujfgurhepfffhvfevuffkfhggtggugfgjsehtqhertddttddvnecuhfhrohhmpeforgig
 ihhmvgcutfhiphgrrhguuceomhgrgihimhgvsegtvghrnhhordhtvggthheqnecuggftrf
 grthhtvghrnheptefgleeggfegkeekgffgleduieduffejffegveevkeejudektdduueet
 feetfefgnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehmrghilhhfrhhomh
 epmhgrgihimhgvsegtvghrnhhordhtvggthh
X-ME-Proxy: <xmx:9b7XY9lB6RhJJJXzoe9y1HTSjKxyXi95tk1gE60_6lJpFfOh6pDrwQ>
 <xmx:9b7XY73DyUr6A-ZJROHTvAn1Jg2w820Ia-Zkt8UOyiIS8ycbNovVHg>
 <xmx:9b7XY8vB5vaW_w_2Ow1v-lntW-fDcwFBuHG5APhiJHN1kVSeFbr6ig>
 <xmx:9r7XYy7CP7NMDtbdLzenZdqVleKo60Q1aZiOdiVikevZu7PmhrJL0A>
Feedback-ID: i8771445c:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Mon,
 30 Jan 2023 07:58:29 -0500 (EST)
Date: Mon, 30 Jan 2023 13:58:28 +0100
From: Maxime Ripard <maxime@cerno.tech>
To: Jagan Teki <jagan@amarulasolutions.com>
Subject: Re: [RESEND PATCH v11 02/18] drm: bridge: panel: Add
 devm_drm_of_dsi_get_bridge helper
Message-ID: <20230130125828.qkqsq6ax5mojkdbq@houat>
References: <20230123151212.269082-1-jagan@amarulasolutions.com>
 <20230123151212.269082-3-jagan@amarulasolutions.com>
 <20230126121227.qcnftqvgiz44egpg@houat>
 <CAMty3ZB6QiqgQN_zWEXULHiipQWU_VaWxDWf9W8OTVQvkACu5A@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <CAMty3ZB6QiqgQN_zWEXULHiipQWU_VaWxDWf9W8OTVQvkACu5A@mail.gmail.com>
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
Cc: dri-devel@lists.freedesktop.org,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Andrzej Hajda <andrzej.hajda@intel.com>, Fancy Fang <chen.fang@nxp.com>,
 Marek Szyprowski <m.szyprowski@samsung.com>, Marek Vasut <marex@denx.de>,
 linux-samsung-soc@vger.kernel.org, Joonyoung Shim <jy0922.shim@samsung.com>,
 Neil Armstrong <narmstrong@linaro.org>,
 Frieder Schrempf <frieder.schrempf@kontron.de>,
 Tommaso Merciai <tommaso.merciai@amarulasolutions.com>,
 NXP Linux Team <linux-imx@nxp.com>,
 Michael Nazzareno Trimarchi <michael@amarulasolutions.com>,
 Matteo Lisi <matteo.lisi@engicam.com>, Adam Ford <aford173@gmail.com>,
 linux-arm-kernel@lists.infradead.org, Seung-Woo Kim <sw0312.kim@samsung.com>,
 Robert Foss <robert.foss@linaro.org>,
 Kyungmin Park <kyungmin.park@samsung.com>,
 linux-amarula <linux-amarula@amarulasolutions.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Thu, Jan 26, 2023 at 08:48:48PM +0530, Jagan Teki wrote:
> On Thu, Jan 26, 2023 at 5:42 PM Maxime Ripard <maxime@cerno.tech> wrote:
> >
> > Hi,
> >
> > On Mon, Jan 23, 2023 at 08:41:56PM +0530, Jagan Teki wrote:
> > > Add devm OF helper to return the next DSI bridge in the chain.
> > >
> > > Unlike general bridge return helper devm_drm_of_get_bridge, this
> > > helper uses the dsi specific panel_or_bridge helper to find the
> > > next DSI device in the pipeline.
> > >
> > > Helper lookup a given child DSI node or a DT node's port and
> > > endpoint number, find the connected node and return either
> > > the associated struct drm_panel or drm_bridge device.
> >
> > I'm not sure that using a device managed helper is the right choice
> > here. The bridge will stay longer than the backing device so it will
> > create a use-after-free. You should probably use a DRM-managed action
> > here instead.
>=20
> Thanks for the comments. If I understand correctly we can use
> drmm_panel_bridge_add instead devm_drm_panel_bridge_add once we found
> the panel or bridge - am I correct?

It's not that we can, it's that the devm_panel_bridge_add is unsafe:
when the module is removed the device will go away and all the devm
resources freed, but the DRM device sticks around until the last
application with a fd open closes that fd.

Maxime
