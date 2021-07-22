Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 671813D1F09
	for <lists+dri-devel@lfdr.de>; Thu, 22 Jul 2021 09:31:54 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A8A6E6ED06;
	Thu, 22 Jul 2021 07:31:52 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from new2-smtp.messagingengine.com (new2-smtp.messagingengine.com
 [66.111.4.224])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 39E6E6ED06
 for <dri-devel@lists.freedesktop.org>; Thu, 22 Jul 2021 07:31:52 +0000 (UTC)
Received: from compute4.internal (compute4.nyi.internal [10.202.2.44])
 by mailnew.nyi.internal (Postfix) with ESMTP id 6A3305816CC;
 Thu, 22 Jul 2021 03:31:51 -0400 (EDT)
Received: from mailfrontend1 ([10.202.2.162])
 by compute4.internal (MEProxy); Thu, 22 Jul 2021 03:31:51 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cerno.tech; h=
 date:from:to:cc:subject:message-id:references:mime-version
 :content-type:content-transfer-encoding:in-reply-to; s=fm3; bh=/
 I4etZeEnDA+034NbHZPFsmfe1xdUqAONXI0N+Ofdbw=; b=YjaVhF5u4EalTcQYp
 XlPYecVWnReNLESjPxrTCjYsnol4ZeRqrKS5P38PSBDXdoHhF+4COp3FV/g06IOZ
 MmLDQEwcUMFHQcpKnDyfcuJEAJH9GC4PzHAuyTwLHiUaunpp/cTB9ZVf/AACyeyp
 ZCXcTbPWf2s0brf0XpJGU9UWi5TYyYvpG4zQ4Hf8v/+/akL6J+o7GCWpCO4n8v/y
 qsaO15WyXkWK/vMZeCZpGEmfJe/AIHgtQn/XtBFW8dyLo9dwRnd5lLJsSj8PK3lG
 kV6OBPTDhp9EwAqRZthIFtQCANlMS6N4jTZ8MPx1iPEWDYLVPLJJkmJJkod1Lxsy
 MOBvA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-transfer-encoding:content-type
 :date:from:in-reply-to:message-id:mime-version:references
 :subject:to:x-me-proxy:x-me-proxy:x-me-sender:x-me-sender
 :x-sasl-enc; s=fm3; bh=/I4etZeEnDA+034NbHZPFsmfe1xdUqAONXI0N+Ofd
 bw=; b=lhxmBOXhDcB7NXHcrBa4kzZTu6EMGfRieJNn0yCuwVLvyOZc4gk5/BPRe
 BGyVHpnstMUbAmeBxnxfIFo2qgKYpIcvCiq5DN+E2B8btE3EUX8dREB4PGkXBdmk
 W3j4y0AIJXgetK6OSMS561pNqUiMQoQ5Cy7328r00yUToHzRTxLpgsNpgTJ8cCm6
 8fIzfAbGz7jEvzS40MVr2NWVS4Nc7ycJ0A7HzJt73o2hVO07XKp28hyirCTr6mVE
 Ve40+jylhLivequ5ooJR0D47r0UF07mDeAt/8NKt6hAc6h6UPfHg6nrig6OEIaRN
 /Ce9R+JYMl0lJBVsxE1tc7GmmKWNw==
X-ME-Sender: <xms:5R75YPNyQXq_eIj371inR-SaYJGCBw8pjTGFROTtfjPJXhda43qlDg>
 <xme:5R75YJ9fHtWShxIw8ZJdk9cJl06xvCFDUM5-bY-UPd-S4gAFeeq2J2JNaARsTSHqe
 3oR7yjkpl_MZcpipFk>
X-ME-Received: <xmr:5R75YOToywd2CDXgnGOhG2FFcylD_zeyeeGP0Amn7qTlT46-HMRWxHyngE7pmcQUeUammWx9BIj7HSipnxV_Vy5RXbBDbwPLED-Q>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvtddrfeehgdduudelucetufdoteggodetrfdotf
 fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
 uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
 cujfgurhepfffhvffukfhfgggtugfgjgesthhqredttddtvdenucfhrhhomhepofgrgihi
 mhgvucftihhprghrugcuoehmrgigihhmvgestggvrhhnohdrthgvtghhqeenucggtffrrg
 htthgvrhhnpefgjeettdejgffgffdvteeutdehtdehgeehueetkeefgefhtdetjeekledu
 gedvudenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepmhgrihhlfhhrohhmpe
 hmrgigihhmvgestggvrhhnohdrthgvtghh
X-ME-Proxy: <xmx:5R75YDttIjQxfKXs6iCjAnMonygpfTAHBZGpDk-T0EPMcn1BvBlhmQ>
 <xmx:5R75YHdIczkQBdCzTtq7lf4jeun2p2IewT6l-5rPCH-tZN1LQ53_nA>
 <xmx:5R75YP1gy4ngQkPyOmpsTIz5Ac4lCfy2iWt3op8WxDLhWIV7VwHTbQ>
 <xmx:5x75YCueZJDnY4KgZT8DhHnfLEX-zJbZf7o1N7AZe4_PElbcm__WRQ>
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Thu,
 22 Jul 2021 03:31:49 -0400 (EDT)
Date: Thu, 22 Jul 2021 09:31:48 +0200
From: Maxime Ripard <maxime@cerno.tech>
To: Sam Ravnborg <sam@ravnborg.org>
Subject: Re: [PATCH v1 5/7] drm/mediatek: Drop chain_mode_fixup call in
 mode_valid()
Message-ID: <20210722073148.rkgsvam37ytafykf@gilmour>
References: <20210722062246.2512666-1-sam@ravnborg.org>
 <20210722062246.2512666-6-sam@ravnborg.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <20210722062246.2512666-6-sam@ravnborg.org>
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
Cc: Chun-Kuang Hu <chunkuang.hu@kernel.org>,
 Dafna Hirschfeld <dafna.hirschfeld@collabora.com>,
 Thomas Zimmermann <tzimmermann@suse.de>, Jonas Karlman <jonas@kwiboo.se>,
 David Airlie <airlied@linux.ie>, Robert Foss <robert.foss@linaro.org>,
 Neil Armstrong <narmstrong@baylibre.com>, dri-devel@lists.freedesktop.org,
 Andrzej Hajda <a.hajda@samsung.com>, linux-mediatek@lists.infradead.org,
 Jernej Skrabec <jernej.skrabec@gmail.com>,
 Matthias Brugger <matthias.bgg@gmail.com>,
 linux-arm-kernel@lists.infradead.org,
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Thu, Jul 22, 2021 at 08:22:44AM +0200, Sam Ravnborg wrote:
> The mode_valid implementation had a call to
> drm_bridge_chain_mode_fixup() which would be wrong as the mode_valid is
> not allowed to change anything - only to validate the mode.
>=20
> As the next bridge is often/always a connector the call had no effect
> anyway. So drop it.
>=20
> From the git history I could see this call was included in the original
> version of the driver so there was no help there to find out why it was
> added in the first place. But a lot has changed since the initial driver
> were added and is seems safe to remove the call now.
>=20
> Signed-off-by: Sam Ravnborg <sam@ravnborg.org>
> Cc: Chun-Kuang Hu <chunkuang.hu@kernel.org>
> Cc: Philipp Zabel <p.zabel@pengutronix.de>
> Cc: Matthias Brugger <matthias.bgg@gmail.com>
> Cc: Dafna Hirschfeld <dafna.hirschfeld@collabora.com>
> Cc: linux-mediatek@lists.infradead.org
> Cc: linux-arm-kernel@lists.infradead.org

Reviewed-by: Maxime Ripard <maxime@cerno.tech>

Maxime
