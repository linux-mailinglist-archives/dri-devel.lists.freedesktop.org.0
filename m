Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 7EF5256034D
	for <lists+dri-devel@lfdr.de>; Wed, 29 Jun 2022 16:41:31 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8165F10E753;
	Wed, 29 Jun 2022 14:41:29 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from wout4-smtp.messagingengine.com (wout4-smtp.messagingengine.com
 [64.147.123.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4001410E9AB
 for <dri-devel@lists.freedesktop.org>; Wed, 29 Jun 2022 14:41:28 +0000 (UTC)
Received: from compute3.internal (compute3.nyi.internal [10.202.2.43])
 by mailout.west.internal (Postfix) with ESMTP id 43F0232005BC;
 Wed, 29 Jun 2022 10:41:24 -0400 (EDT)
Received: from mailfrontend1 ([10.202.2.162])
 by compute3.internal (MEProxy); Wed, 29 Jun 2022 10:41:24 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cerno.tech; h=cc
 :cc:content-transfer-encoding:content-type:date:date:from:from
 :in-reply-to:in-reply-to:message-id:mime-version:references
 :reply-to:sender:subject:subject:to:to; s=fm1; t=1656513683; x=
 1656600083; bh=g2nwPkMPHPLpwxphAubkSukYdb+2IeUegRCkuDBl3Zs=; b=n
 +/5MAyCIQZh7sMc2i0MK7Aes884mmMIdG+jzaQ/fjTw5fiJ0Idk0zWunyc0Gi7aN
 F1Dha6eQjUeKhue+2zHECwRS1lnpOBzT1DxgSoi1O/uYraBEhnzHyjaIRazltqxB
 PpM9eS+xPwgwughxBnv4jlq0dLzWjEKgP3vMkcT3iHlYx3HYGP1UOK6vuMph4PSK
 +Tx3ys/xKF+iOinQkfjSC24L0M8Uv2f0UfI9JGexlnPPjK7c9KTWbJrU6Q9abN+D
 pXff+Tspz2UD2Ip+8UjSvhRHz0jRciATkNZsiqs9NM4d6xhBKJKtK9WTe6WFJfAt
 fsvuoKL9JBkw2aF/ArMiw==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:cc:content-transfer-encoding
 :content-type:date:date:feedback-id:feedback-id:from:from
 :in-reply-to:in-reply-to:message-id:mime-version:references
 :reply-to:sender:subject:subject:to:to:x-me-proxy:x-me-proxy
 :x-me-sender:x-me-sender:x-sasl-enc; s=fm2; t=1656513683; x=
 1656600083; bh=g2nwPkMPHPLpwxphAubkSukYdb+2IeUegRCkuDBl3Zs=; b=A
 ffea0i6+00flHrO5+NxHnRYLP4sSKe6DIHLkUxwD4XP4wPM7lEN6TCGrz1dtKk8t
 B03t7jOBJ3nB+gxaVIfiNoi2c5JNInIR4SY+Dqg4rjuYHZSMjfEORV/N4k9QVLpN
 Cp14jtpeQmUcj/9rOyrVzcNQbEiDUk9wvRHoD9CRohZ/yPUJCtoNSiaN7GfZPY+e
 v0KnJi7pUxMiTWgKjZbZ6YJuaTGLqaN1qWup6TptwAaxEdb72pk0YjHAC3rHqlbQ
 xM8isr1EWNAzEKKBBy/IapFI7vbw1x6ICsTZ+OdCTslCuxHiSl+xybPzbVw9buZy
 kgn7Xv6SQoe+86iv4Im5g==
X-ME-Sender: <xms:k2S8YqkYXrJd-FxQ6JyFuhdSnSjEouQazwklCg7a0orqSFCroSQQCg>
 <xme:k2S8Yh1y-g3erl2iqmJz-ZyL_VL98SO0e6fYF4OrBeqaEjt-8p4RADFMaqUNr3BzI
 mk8Vic8MdStEzDsfpk>
X-ME-Received: <xmr:k2S8Yor8REZk4CF8GFMKPnP_QAks4nJOLd4_ZN46CSwLLg6MjZYNKD-sBI125qoOIhBXCcbxbidJ48tlIjvuyiTDiahiq6R-j0l6UTs>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvfedrudegledgjeelucetufdoteggodetrfdotf
 fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
 uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
 cujfgurhepfffhvfevuffkfhggtggugfgjsehtqhertddttddunecuhfhrohhmpeforgig
 ihhmvgcutfhiphgrrhguuceomhgrgihimhgvsegtvghrnhhordhtvggthheqnecuggftrf
 grthhtvghrnhepleelfeeileelteetfedvieekfeefffevhfdtvefgheevudevheejvddv
 ieeltdeinecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehmrghilhhfrhhomh
 epmhgrgihimhgvsegtvghrnhhordhtvggthh
X-ME-Proxy: <xmx:k2S8YunuXqa4Grar7clG3pcOkvDtuqBeQfhl_3Lft64dWe9Xotj_tg>
 <xmx:k2S8Yo3TIKowhDqdjjWUfQpZhvB1cE-ms0su0kagnkFff7eLhfJYxg>
 <xmx:k2S8Yltd7brT_YjkVtbgKGmWSDvpt6bfBOrAZ9tWX7DICQsTz3iCiw>
 <xmx:k2S8YrTllsZJRajQNkT8fIk9q2Jgw4zx1Ktg2qyQn-cFBuxAUtKI1w>
Feedback-ID: i8771445c:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Wed,
 29 Jun 2022 10:41:22 -0400 (EDT)
Date: Wed, 29 Jun 2022 16:41:20 +0200
From: Maxime Ripard <maxime@cerno.tech>
To: Philipp Zabel <p.zabel@pengutronix.de>
Subject: Re: [PATCH v3 03/71] drm/encoder: Introduce drmm_encoder_init
Message-ID: <20220629144120.4fjfvs2clr2ma7j5@houat>
References: <20220629123510.1915022-1-maxime@cerno.tech>
 <20220629123510.1915022-4-maxime@cerno.tech>
 <1c926f032f1af5d48c227e711dbb6b07b9c1de2f.camel@pengutronix.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <1c926f032f1af5d48c227e711dbb6b07b9c1de2f.camel@pengutronix.de>
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
Cc: David Airlie <airlied@linux.ie>, Daniel Vetter <daniel.vetter@intel.com>,
 dri-devel@lists.freedesktop.org, Thomas Zimmermann <tzimmermann@suse.de>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Wed, Jun 29, 2022 at 03:32:12PM +0200, Philipp Zabel wrote:
> On Mi, 2022-06-29 at 14:34 +0200, Maxime Ripard wrote:
> > The DRM-managed function to register an encoder is
> > drmm_encoder_alloc() and its variants, which will allocate the underlyi=
ng
> > structure and initialisation the encoder.
> >=20
> > However, we might want to separate the structure creation and the encod=
er
> > initialisation, for example if the structure is shared across multiple =
DRM
> > entities, for example an encoder and a connector.
> >=20
> > Let's create an helper to only initialise an encoder that would be pass=
ed
> > as an argument.
>=20
> Daniel pointed out here [1],=A0that it might be good to check the passed
> encoders are actually in drmm managed memory.

Yeah that's a good idea. I thought about it, but I have no idea how we
can even tell from a pointer if it's drmm managed?

Maxime
