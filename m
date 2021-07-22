Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D5F593D1ED1
	for <lists+dri-devel@lfdr.de>; Thu, 22 Jul 2021 09:19:18 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0E2E66EE03;
	Thu, 22 Jul 2021 07:19:17 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from new2-smtp.messagingengine.com (new2-smtp.messagingengine.com
 [66.111.4.224])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6FE7F6EE03
 for <dri-devel@lists.freedesktop.org>; Thu, 22 Jul 2021 07:19:16 +0000 (UTC)
Received: from compute6.internal (compute6.nyi.internal [10.202.2.46])
 by mailnew.nyi.internal (Postfix) with ESMTP id AA5D1580A89;
 Thu, 22 Jul 2021 03:19:15 -0400 (EDT)
Received: from mailfrontend1 ([10.202.2.162])
 by compute6.internal (MEProxy); Thu, 22 Jul 2021 03:19:15 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cerno.tech; h=
 date:from:to:cc:subject:message-id:references:mime-version
 :content-type:content-transfer-encoding:in-reply-to; s=fm3; bh=p
 GUrYEwTJWxb00jR9voM7UpAPJOx9r172pFnflkjti0=; b=LAAUnSpG93dCyODtN
 REzGsm0Dt3R5L4lnlfi8q5hob2KCaLnuI11/eGAsXBSmfPrfp441fD4ygsPoYQmX
 IAU0iZDnnoR00gLR2a+VvEEkUGkZYcP1AC4hK8pn8Q+Or6EXEJyAlwNWJAAUgGNc
 FkySNcekHJJouCUdc0Qzq1POZMmIwzot7ui3/xthTGTyi6N5dPdqobWoerHRf4fE
 LGsNtWeGlyr4ts5tt4dAXYxAVpwDvkFRW704AlnW0KXZIA3akkbLTYUkxZSodUZt
 osIRugOjkWILrGrxtMZAPwr7e7kfLg3pKBZ9Ww1lHg9APHnu72Z9AevsD6S8POsl
 TNpZQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-transfer-encoding:content-type
 :date:from:in-reply-to:message-id:mime-version:references
 :subject:to:x-me-proxy:x-me-proxy:x-me-sender:x-me-sender
 :x-sasl-enc; s=fm3; bh=pGUrYEwTJWxb00jR9voM7UpAPJOx9r172pFnflkjt
 i0=; b=aYc+nI/gPfcOu5CFxzGkYcba6gbxviD2XdiYj+SbH8DezLxBAmkjUSs9+
 3x50SZHmAKO6UFVaqEirsQxHqKzUcuvOCkPcPu6z+cacxgSo/p9WCrnqmKImfUaY
 I5I19eUtB04S8y8yygNSevA3qAAZ3hsFUMgxKzzTl6spmiRUwTGpQWajlq6WSQZ5
 MugIo0sn4lK3pYltt/L9nC9cfmAnHXENhwG8HEkHNmF3hBRQ+XPVqQ5ORnZICOpm
 w1rLKChW6bMCaLjGwvvcXCsBmItVGM2CAFbOIINNKdXHKxvbzdNWZv6kolT4r7mw
 H3JKWUkZ0azAyKTPQWa8PJHjLwgNw==
X-ME-Sender: <xms:8Bv5YNAvui7DnxvETxporT66kBrDbenjq9jq5gUIVJ2-C0QO41Ztqw>
 <xme:8Bv5YLhX8ecGvDHuApfYub80wUg9_pTR-O7BZzDXUtU1eEsyZTub6291kjjmQEkHo
 dsUiFSsvAvxv5s8hyc>
X-ME-Received: <xmr:8Bv5YIkBkvuzOc57gZxb6CbeX4Rggxcclg_UcPVwg_C4QjgfkOJT6fpK3C02PbTKpVVVVVlOywIb2OHEJ00SZ6CQrxjXsoPjvxTx>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvtddrfeehgdduudeiucetufdoteggodetrfdotf
 fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
 uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
 cujfgurhepfffhvffukfhfgggtugfgjgesthhqredttddtvdenucfhrhhomhepofgrgihi
 mhgvucftihhprghrugcuoehmrgigihhmvgestggvrhhnohdrthgvtghhqeenucggtffrrg
 htthgvrhhnpefgjeettdejgffgffdvteeutdehtdehgeehueetkeefgefhtdetjeekledu
 gedvudenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepmhgrihhlfhhrohhmpe
 hmrgigihhmvgestggvrhhnohdrthgvtghh
X-ME-Proxy: <xmx:8Bv5YHwpu8c4EQ4tU5_7aUl_xz919iSBFe9ACcS_kXhJZcpubvgy7w>
 <xmx:8Bv5YCTWiTQ4KAhNuP4J-qhhYd-Mdktqm11HM-MXMiBTV7MKFtbwlw>
 <xmx:8Bv5YKYhK1cZssL7riwZzueX-JuOsVblTRk_MjELAsTq4J-xbuyz6w>
 <xmx:8xv5YLDh071K2X7S0FRF3Utro3dXptoYi6eZLrr_wrKY84XrAG1OFg>
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Thu,
 22 Jul 2021 03:19:12 -0400 (EDT)
Date: Thu, 22 Jul 2021 09:19:09 +0200
From: Maxime Ripard <maxime@cerno.tech>
To: Sam Ravnborg <sam@ravnborg.org>
Subject: Re: [PATCH v1 2/7] drm/bridge: Drop unused drm_bridge_chain functions
Message-ID: <20210722071909.3sefghktl4dolhao@gilmour>
References: <20210722062246.2512666-1-sam@ravnborg.org>
 <20210722062246.2512666-3-sam@ravnborg.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <20210722062246.2512666-3-sam@ravnborg.org>
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

On Thu, Jul 22, 2021 at 08:22:41AM +0200, Sam Ravnborg wrote:
> The drm_bridge_chain_{pre_enable,enable,disable,post_disable} has no
> users left and we have atomic variants that should be used.
> Drop them so they do not gain new users.
>=20
> Adjust a few comments to avoid references to the dropped functions.
>=20
> Signed-off-by: Sam Ravnborg <sam@ravnborg.org>
> Cc: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
> Cc: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>
> Cc: Maxime Ripard <mripard@kernel.org>
> Cc: Thomas Zimmermann <tzimmermann@suse.de>
> Cc: Andrzej Hajda <a.hajda@samsung.com>
> Cc: Neil Armstrong <narmstrong@baylibre.com>
> Cc: Robert Foss <robert.foss@linaro.org>
> Cc: Daniel Vetter <daniel@ffwll.ch>

Reviewed-by: Maxime Ripard <maxime@cerno.tech>

Maxime
