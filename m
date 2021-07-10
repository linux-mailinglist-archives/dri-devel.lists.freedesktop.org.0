Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 6A8A13C356D
	for <lists+dri-devel@lfdr.de>; Sat, 10 Jul 2021 18:02:57 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A35306EB3F;
	Sat, 10 Jul 2021 16:02:52 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from out4-smtp.messagingengine.com (out4-smtp.messagingengine.com
 [66.111.4.28])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A9D0C6EB3F
 for <dri-devel@lists.freedesktop.org>; Sat, 10 Jul 2021 16:02:51 +0000 (UTC)
Received: from compute1.internal (compute1.nyi.internal [10.202.2.41])
 by mailout.nyi.internal (Postfix) with ESMTP id 4CEBE5C002F;
 Sat, 10 Jul 2021 12:02:48 -0400 (EDT)
Received: from mailfrontend1 ([10.202.2.162])
 by compute1.internal (MEProxy); Sat, 10 Jul 2021 12:02:48 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cerno.tech; h=
 date:from:to:cc:subject:message-id:references:mime-version
 :content-type:content-transfer-encoding:in-reply-to; s=fm3; bh=z
 W06szIiBrMGAi65CJ/NkhxAJ0WRU6/KP3EHLpvEGnc=; b=Hq46CQ2xOTyEBZ1af
 rDOLaJEOsgeB3p6iY5OdNV7u0kUJ1aiK0Bbmuta/g7G5HFVwPG+g0aBLg7CNxdjd
 EJGDJkSWxMg0QyFqNSIpjMeYlNTpInAJ9v4xxQYK7wUdn0idhoQ11vlT1NrGz8NF
 5dJIpvKgGXJmPR/D//0SV6bXHW8LYvQWPdeM9RFjpViJcLjpvWkdDaHlp+8SxbLl
 ETzor6igZMQ7pcfHGr8DjoqAOWuK+KAh99Vnh5ZTgIqFYCDlgaOD/x9O5ZaO3E/g
 JUkTNaYP7oKdelyd6VWm9z2gvcoC4yg8a6rwYCQKuxo44cPCcz4nL0dVU1q3uBpL
 8FiRA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-transfer-encoding:content-type
 :date:from:in-reply-to:message-id:mime-version:references
 :subject:to:x-me-proxy:x-me-proxy:x-me-sender:x-me-sender
 :x-sasl-enc; s=fm3; bh=zW06szIiBrMGAi65CJ/NkhxAJ0WRU6/KP3EHLpvEG
 nc=; b=sGkk0RKsqAa80pWVhxMHg4DKiy0t7RxftQLvKzn47WXQTjlwvtzLl6ISF
 l+h0mOgLLWbWCd3jmViduX2fbR4ytV7hvlVv8R701ThmLOEbctlh21OFfMttHVM9
 sQk9OzmdHrHGMTlQlvopOgkJfUiwG/qdKxJ7J/RuUBsoeJycqhh9hHABHQrLvjIb
 nnGFYyUkq+6Q81kylDaM8TX6P0pvaQDcl1tUYuBgLA5RnmlszLOJtlGfi5LUmLmg
 I8kZjE5MdiUQ5bxiFNbdtPkRlQ6wEH2SeSx6aosyWERshgecoIR5WWvlTsyewuzy
 cp9f7d8iYnv/kCNyLh1MM7rSSlCNQ==
X-ME-Sender: <xms:psTpYGL52hm_XnAiLesTeDrlAqOXUw9QeaNewBxH2PCntLxoEVCAhQ>
 <xme:psTpYOJWmOhKjpfPTXoCGDZ9K_Ro5Wu6OZeSwL9h2sqc-oLfmce0EprhFFawJqEZK
 ZHxv4V1pbTFz_O54J0>
X-ME-Received: <xmr:psTpYGtipPIgLBu17WNlivHVX-KxVuKCkW4uC4CXcxyDvUJaa04kw2fL97HtbP_LTcv16QUnEGTdXn-y1EPKzmIe1oliKuJVDJk5>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvtddrtdekgdelhecutefuodetggdotefrodftvf
 curfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfghnecu
 uegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenuc
 fjughrpeffhffvuffkfhggtggugfgjsehtqhertddttddvnecuhfhrohhmpeforgigihhm
 vgcutfhiphgrrhguuceomhgrgihimhgvsegtvghrnhhordhtvggthheqnecuggftrfgrth
 htvghrnhepgfejtedtjefggfffvdetuedthedtheegheeuteekfeeghfdtteejkeeludeg
 vddunecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehmrghilhhfrhhomhepmh
 grgihimhgvsegtvghrnhhordhtvggthh
X-ME-Proxy: <xmx:psTpYLZ18cm-7JGXedCIwsNOTZSyS5bBpit79kqpZ5JCEUvcRLUT-g>
 <xmx:psTpYNZmnH91G5K3jWf5TOqBsx-lq9GnfwDVOi7ZvVjQaVaIZlE7wg>
 <xmx:psTpYHCpKrwZOS_zsfQOpIoqyAIV0UfqwoTuhKu2gcexyFj6ZSdS4A>
 <xmx:qMTpYCN7YbJYOA0SeRP-Dhv66stLUVryz60IgOKBG47JKzLV9dUL8g>
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Sat,
 10 Jul 2021 12:02:46 -0400 (EDT)
Date: Sat, 10 Jul 2021 18:02:44 +0200
From: Maxime Ripard <maxime@cerno.tech>
To: Sam Ravnborg <sam@ravnborg.org>
Subject: Re: [PATCH 1/1] drm: bridge: Mark deprecated operations in
 drm_bridge_funcs
Message-ID: <20210710160244.pfsw4rjd4ru2mlmm@gilmour>
References: <20210710084240.281063-1-sam@ravnborg.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <20210710084240.281063-1-sam@ravnborg.org>
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
Cc: David Airlie <airlied@linux.ie>, dri-devel@lists.freedesktop.org,
 Andrzej Hajda <a.hajda@samsung.com>,
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
 Thomas Zimmermann <tzimmermann@suse.de>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Sat, Jul 10, 2021 at 10:42:40AM +0200, Sam Ravnborg wrote:
> drm_bridge_funcs includes several duplicated operations as atomic
> variants has been added over time.
> New bridge drivers shall use the atomic variants - mark the deprecated
> operations to try to avoid usage in new bridge drivers.
>=20
> Signed-off-by: Sam Ravnborg <sam@ravnborg.org>
> Cc: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
> Cc: Andrzej Hajda <a.hajda@samsung.com>
> Cc: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>
> Cc: Maxime Ripard <mripard@kernel.org>
> Cc: Thomas Zimmermann <tzimmermann@suse.de>
> Cc: David Airlie <airlied@linux.ie>
> Cc: Daniel Vetter <daniel@ffwll.ch>

Acked-by: Maxime Ripard <maxime@cerno.tech>

Thanks!
Maxime
