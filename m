Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 042F55B1B4C
	for <lists+dri-devel@lfdr.de>; Thu,  8 Sep 2022 13:23:42 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A6F3A10EA9E;
	Thu,  8 Sep 2022 11:23:25 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from wnew3-smtp.messagingengine.com (wnew3-smtp.messagingengine.com
 [64.147.123.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2063910EA96;
 Thu,  8 Sep 2022 11:23:20 +0000 (UTC)
Received: from compute3.internal (compute3.nyi.internal [10.202.2.43])
 by mailnew.west.internal (Postfix) with ESMTP id E85232B05D9F;
 Thu,  8 Sep 2022 07:23:16 -0400 (EDT)
Received: from mailfrontend1 ([10.202.2.162])
 by compute3.internal (MEProxy); Thu, 08 Sep 2022 07:23:19 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cerno.tech; h=cc
 :cc:content-transfer-encoding:content-type:date:date:from:from
 :in-reply-to:in-reply-to:message-id:mime-version:references
 :reply-to:sender:subject:subject:to:to; s=fm2; t=1662636196; x=
 1662643396; bh=LRXHHYqivNqoVLbWqJK32thupyw+X6RFeaqN+1YtJGU=; b=d
 sC+SqVQmxl2y5Nk0Wo2cxN30d9BbikQWddcTN8RCpYICpF8LlCzKr/kBw19ppyX4
 o5/Uu5DKj0x+wBViDK44z4s5rYsczPE5rRPizWZPx2W/S/EF4mgUgfHju2nQCV6M
 XDUg2pHR79vZl8sHJsWDbAhhDy/3lmdVlYqf84KZ3VCU/gFaGv9ee4EZ3ZbeSVfu
 gCULjFlhER8GApHWb8tOv6e4TXbHQeUvXbj1gie6NLufr9c/UdVBNemHUAYptAH0
 yy611N/bBISEJ9I39w1Wsi+/AbHEVXH6ZXf7MHgK9zjiEHacfhdveCkxqv1ZjX2D
 dWfxwdLMnrkJN8rQXtSMQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:cc:content-transfer-encoding
 :content-type:date:date:feedback-id:feedback-id:from:from
 :in-reply-to:in-reply-to:message-id:mime-version:references
 :reply-to:sender:subject:subject:to:to:x-me-proxy:x-me-proxy
 :x-me-sender:x-me-sender:x-sasl-enc; s=fm2; t=1662636196; x=
 1662643396; bh=LRXHHYqivNqoVLbWqJK32thupyw+X6RFeaqN+1YtJGU=; b=Y
 oMzWULxQE204GYN9jXkFiDp/SoaiWo8KEv/4aMIhp2VFvErCXC8WuotjstL+KeKZ
 yFnkPjVloE/igCxgmN+K/18lbV8maVuyl2HwNDcTC3o70GOWpL+rmv3erG9UKIA4
 ihQ05wbBTBbpk/0SdRh6TxGMDqqxQKfJZdo/0ajVrpKQyIy8ONaYi7WUSbx6zZL5
 MiEU4ZM7BALznq/KKN/TvqvL/fJUVCWCFNFWr8HUsVeFMZuzRHuCt9z6uqdiyIqR
 NytajlftLikd2QSuJ+2TYREmhFVuSNeKLojERFsy/VQFhWrz9vKx4U3caGn/2Mz2
 IVSocSEk13MrU+xJRvBJw==
X-ME-Sender: <xms:o9AZY6AbUi_7GQjeOkhCGnRYVgsoNbvNm_0WAbYlh9qtRsDM-R2IRQ>
 <xme:o9AZY0ifPWrh6dba4HNwntIYw7gT_rfcI9QS7dB0v7UWlSfqlStY5k5F8o1rFEN_E
 cfXzqw7T_U0XA2B4Yw>
X-ME-Received: <xmr:o9AZY9nZF9ejuwKTvotqXwpWb4P9AAPWaJGA8GOEo6NHvVPExn9Wg5jVCQ>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvfedrfedtvddggedtucetufdoteggodetrfdotf
 fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
 uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
 cujfgurhepfffhvfevuffkfhggtggugfgjsehtqhertddttddunecuhfhrohhmpeforgig
 ihhmvgcutfhiphgrrhguuceomhgrgihimhgvsegtvghrnhhordhtvggthheqnecuggftrf
 grthhtvghrnhepteejiedvkeelhedtlefgkefgkefhheefteevleekgfejgeekfffhveff
 tdegiedvnecuffhomhgrihhnpehmohguvgdrihhmnecuvehluhhsthgvrhfuihiivgeptd
 enucfrrghrrghmpehmrghilhhfrhhomhepmhgrgihimhgvsegtvghrnhhordhtvggthh
X-ME-Proxy: <xmx:o9AZY4wj0Em0p9wdifA1dOoRtWl4K3h5H3piyQJ28cO5-mrSsTLtEA>
 <xmx:o9AZY_Su4tYf9Zjqdx-PntTwrcOdJQFCp8Hq5iCim6nyfT3CbHH0PQ>
 <xmx:o9AZYzZSiolL2P5NuabaWmahY6CGSAdKWzeBR8P23J9g-ILVnC2Urg>
 <xmx:pNAZY_zR36dG-f0hFKJ3mCUS5uoKF2GMiVvKl18RO68d8Co3ppVWHNpYewU>
Feedback-ID: i8771445c:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Thu,
 8 Sep 2022 07:23:15 -0400 (EDT)
Date: Thu, 8 Sep 2022 13:23:12 +0200
From: Maxime Ripard <maxime@cerno.tech>
To: Noralf =?utf-8?Q?Tr=C3=B8nnes?= <noralf@tronnes.org>
Subject: Re: [PATCH v2 32/41] drm/vc4: vec: Convert to the new TV mode property
Message-ID: <20220908112312.hlb7mzneuxnethhr@houat>
References: <20220728-rpi-analog-tv-properties-v2-0-459522d653a7@cerno.tech>
 <20220728-rpi-analog-tv-properties-v2-32-459522d653a7@cerno.tech>
 <199cf4b3-8ace-e047-3050-b810cf0c6b63@tronnes.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <199cf4b3-8ace-e047-3050-b810cf0c6b63@tronnes.org>
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
Cc: Karol Herbst <kherbst@redhat.com>, David Airlie <airlied@linux.ie>,
 nouveau@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 Phil Elwell <phil@raspberrypi.com>, Emma Anholt <emma@anholt.net>,
 Samuel Holland <samuel@sholland.org>,
 Jernej Skrabec <jernej.skrabec@gmail.com>, Chen-Yu Tsai <wens@csie.org>,
 Geert Uytterhoeven <geert@linux-m68k.org>, Ben Skeggs <bskeggs@redhat.com>,
 linux-sunxi@lists.linux.dev, Thomas Zimmermann <tzimmermann@suse.de>,
 intel-gfx@lists.freedesktop.org, Hans de Goede <hdegoede@redhat.com>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>, linux-arm-kernel@lists.infradead.org,
 Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>,
 Dom Cobley <dom@raspberrypi.com>,
 Dave Stevenson <dave.stevenson@raspberrypi.com>, linux-kernel@vger.kernel.org,
 Mateusz Kwiatkowski <kfyatek+publicgit@gmail.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Noralf,

On Tue, Aug 30, 2022 at 09:01:08PM +0200, Noralf Tr=F8nnes wrote:
> > +static const struct drm_prop_enum_list tv_mode_names[] =3D {
>=20
> Maybe call it legacy_tv_mode_enums?
>=20
> >=20
> > +	{ VC4_VEC_TV_MODE_NTSC, "NTSC", },
> >=20
> > +	{ VC4_VEC_TV_MODE_NTSC_J, "NTSC-J", },
> >=20
> > +	{ VC4_VEC_TV_MODE_PAL, "PAL", },
> >=20
> > +	{ VC4_VEC_TV_MODE_PAL_M, "PAL-M", },
>=20
> If you use DRM_MODE_TV_MODE_* here you don't need to translate the value
> using the switch statement in get/set property, you can use the value
> directly to get/set tv.mode.

I'm sorry, I'm not quite sure what you mean by that. If we expose the
DRM_MODE_TV_MODE_* properties there, won't that change the values the
userspace will need to use to set that property?

Maxime
