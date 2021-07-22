Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id F1B723D1F0A
	for <lists+dri-devel@lfdr.de>; Thu, 22 Jul 2021 09:32:13 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1D3D56EDF0;
	Thu, 22 Jul 2021 07:32:12 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from new2-smtp.messagingengine.com (new2-smtp.messagingengine.com
 [66.111.4.224])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4746E6F384
 for <dri-devel@lists.freedesktop.org>; Thu, 22 Jul 2021 07:32:10 +0000 (UTC)
Received: from compute4.internal (compute4.nyi.internal [10.202.2.44])
 by mailnew.nyi.internal (Postfix) with ESMTP id 69F4B5816CC;
 Thu, 22 Jul 2021 03:32:09 -0400 (EDT)
Received: from mailfrontend2 ([10.202.2.163])
 by compute4.internal (MEProxy); Thu, 22 Jul 2021 03:32:09 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cerno.tech; h=
 date:from:to:cc:subject:message-id:references:mime-version
 :content-type:content-transfer-encoding:in-reply-to; s=fm3; bh=X
 FqgXhrVncJn1RmeEackjt647URidH76/zWxbiz4y74=; b=AkZLmqOOm6LOkSrq/
 97CnYUYDmaOBlK5QdmE658LXMgy9gYXjI3r7nwXNtIk3w6q9eHlpFqsj0mjNDu8w
 YWwR68MBVhn3Jh8p5V8rSGEBud1SSE6S4gwjv7QXfvoCTsECvR/3dI4V5gwANs7w
 m0S6Jh+cCGRQ78aRofVIheE34p6qJ/wOZHuyEBSFzGhwPsJk2BxgqEh6n9kg8Rcd
 JfELl/e2WwKdIG8DatVDAzPFNLLI94hCGAmC+GuoNHfEBLy9kkBNyVN9ZOLdv+GI
 D2eYDSGajFZoAlENom1HmPdn2iAAFjbHZ6/UX2MmfaY1UBlSM+8uyI25W9Sr/aZR
 qdKLA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-transfer-encoding:content-type
 :date:from:in-reply-to:message-id:mime-version:references
 :subject:to:x-me-proxy:x-me-proxy:x-me-sender:x-me-sender
 :x-sasl-enc; s=fm3; bh=XFqgXhrVncJn1RmeEackjt647URidH76/zWxbiz4y
 74=; b=d4MmOL+DYKXen08+/PINeptmHTcC9xaDGHGYTAB8lomgFzXV60+pyiHxq
 7TxTX4WbXKpTHJ0p1pItoTs7uIgGIE3Tc0LhFzDaUv+L2Vu6H7Phd4R9C8ra2Gxi
 neBRi+1lDCn795F3Q3bl3xSfeov8agXn39Q8Gtc0PsgAbVtOzvQd6ilvTBL7MhDm
 n+hKyU9NSs78og8KK41dC24Zgk5S2VWMBWFhJsdWi+WcrP8hHLeX+yvZ7xn1RW4v
 96/mkLH4UXI7bN6vWN6uUgH98n2iBIjyUw9zG1Bas1vt6KTxUDZ9KkQz11cFoWXW
 kMaDF/jdIXKDwTZ8oaDUEPh1iiMXw==
X-ME-Sender: <xms:-R75YMLMZdANodbo7gxj2h0GWyWlQpruBalRWi7ZaHecsyfNyuL6Zw>
 <xme:-R75YMKWHHi5RXNBddB_iUXTvdUsw1bHDLTOPYEFmPtn5_TNTsWbl36g_F6yhfzqp
 2lkTU3giYL1AOLt0nM>
X-ME-Received: <xmr:-R75YMvU1gE90FeqJf0DCkF1bqosmheDVH9r6KzjyOJauZv7ON1yGe5Wa6ZYxkA7jqd0kchhVg1lXXOcWeX8XxNhcdrvb5gFOCK1>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvtddrfeehgdduudelucetufdoteggodetrfdotf
 fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
 uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
 cujfgurhepfffhvffukfhfgggtugfgjgesthhqredttddtvdenucfhrhhomhepofgrgihi
 mhgvucftihhprghrugcuoehmrgigihhmvgestggvrhhnohdrthgvtghhqeenucggtffrrg
 htthgvrhhnpefgjeettdejgffgffdvteeutdehtdehgeehueetkeefgefhtdetjeekledu
 gedvudenucevlhhushhtvghrufhiiigvpedunecurfgrrhgrmhepmhgrihhlfhhrohhmpe
 hmrgigihhmvgestggvrhhnohdrthgvtghh
X-ME-Proxy: <xmx:-R75YJZorkVlvAHZnPjF2bBBuQLw0N8uxKEH1WoL_VklMWUUmLB4QA>
 <xmx:-R75YDYQxRcnzwewyf8pKwJxKufVwRYyyzhZlpytjDK7g8Usq6Y1OA>
 <xmx:-R75YFAHJ3LkmiSsbHwPO_Y4xoT-4j76URwqJt6p9qzzaUeP0-ahXQ>
 <xmx:-R75YLJ_nAfsRn8uId0TjaDbktSTencVNUNSH8ZsdQlYmO3nI5wQHQ>
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Thu,
 22 Jul 2021 03:32:08 -0400 (EDT)
Date: Thu, 22 Jul 2021 09:32:07 +0200
From: Maxime Ripard <maxime@cerno.tech>
To: Sam Ravnborg <sam@ravnborg.org>
Subject: Re: [PATCH v1 6/7] drm/bridge: Drop drm_bridge_chain_mode_fixup
Message-ID: <20210722073207.bsbydwc2f43ri7iy@gilmour>
References: <20210722062246.2512666-1-sam@ravnborg.org>
 <20210722062246.2512666-7-sam@ravnborg.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <20210722062246.2512666-7-sam@ravnborg.org>
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

On Thu, Jul 22, 2021 at 08:22:45AM +0200, Sam Ravnborg wrote:
> There are no users left and we do not want to have this function
> available.
>=20
> drm_atomic_bridge_check() is used to call the mode_fixup() operation for
> the chained bridges and there is no need for drm_atomic_bridge_check().
> Drop it.
>=20
> Signed-off-by: Sam Ravnborg <sam@ravnborg.org>
> Cc: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
> Cc: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>
> Cc: Maxime Ripard <mripard@kernel.org>
> Cc: Thomas Zimmermann <tzimmermann@suse.de>
> Cc: David Airlie <airlied@linux.ie>
> Cc: Daniel Vetter <daniel@ffwll.ch>

Reviewed-by: Maxime Ripard <maxime@cerno.tech>

Maxime
