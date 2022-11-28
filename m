Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 8393F63A2F9
	for <lists+dri-devel@lfdr.de>; Mon, 28 Nov 2022 09:28:58 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 40E2210E2B0;
	Mon, 28 Nov 2022 08:28:55 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from new3-smtp.messagingengine.com (new3-smtp.messagingengine.com
 [66.111.4.229])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F3D3710E2B0
 for <dri-devel@lists.freedesktop.org>; Mon, 28 Nov 2022 08:28:51 +0000 (UTC)
Received: from compute3.internal (compute3.nyi.internal [10.202.2.43])
 by mailnew.nyi.internal (Postfix) with ESMTP id 511A0580359;
 Mon, 28 Nov 2022 03:28:51 -0500 (EST)
Received: from mailfrontend2 ([10.202.2.163])
 by compute3.internal (MEProxy); Mon, 28 Nov 2022 03:28:51 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cerno.tech; h=cc
 :cc:content-type:date:date:from:from:in-reply-to:in-reply-to
 :message-id:mime-version:references:reply-to:sender:subject
 :subject:to:to; s=fm2; t=1669624131; x=1669631331; bh=eSw6zYZByW
 ByEDrCysf/g+5Jcl5hSRg/8bMKEi7byJA=; b=RK2iFwcTILH+rxCpDiolq8IuMD
 Se/mvVBHNiP9dtE38pmjN5VvqgAwUjcU7eCKpGJ1SC9zUHOLF39v5Nu+5gOnTy1F
 I13Dmrr+03vwmmLh0rgFa3Nyln5FZkl+bZsg7MBkpyuF15hIecHazX2UhADzKJnx
 1XCJvL/27J8tdBMzk9KxevPSBHZgG8upFmWkZP+a8DO2Dl1VrJxUOfApmrU+oFxk
 jxEM+RMAwayqXtn8Djma7aiN2rU2rEdsa02GojTysuh1stw/AbMt04rZjRnjiS/k
 gdzmyCPsg9XPzTkAs6DYIl1SbRlphIbpNGOcE1WBzhp65EiSoGJCrv+ER24w==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:cc:content-type:date:date:feedback-id
 :feedback-id:from:from:in-reply-to:in-reply-to:message-id
 :mime-version:references:reply-to:sender:subject:subject:to:to
 :x-me-proxy:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=
 fm1; t=1669624131; x=1669631331; bh=eSw6zYZByWByEDrCysf/g+5Jcl5h
 SRg/8bMKEi7byJA=; b=goMhNEZKCeiZiKNWKEYSto86uSLDQOZQ8C6vsJjoOrNc
 4hTtlWPbV9ioZ7GZ/m78y8mnrHjXz9FMVPvmJuTS3ZQy6uWbfkbPlhzewiUID0ul
 inqXeabvNva6YW4BBiNTPKpowPcZbQgUdmxTgfqHmqZULurR2XRohtC36kq5rkh6
 ka80c1ShwTqav5e5Yc5fLeovT+febBf52Z6Et2NKvsfir2BC2D+wR3lXPQtzE44I
 93BgX7cOMPQQ9ZcxbGjTuHs12gJNbU5sBEAFEZV2ikDAvNCELBQT0XAgrgzwtbWQ
 EoE/yb3f8aKqmCegQrOCBB2PPwBlDIA85S/30bbS3Q==
X-ME-Sender: <xms:QnGEY2AJPUgTwL-nWShZB4L-gSdEIDJ5UxgiQ7Vbb0yUBJTxovpNcg>
 <xme:QnGEYwha38SyklzSJwycmreaZpaJiNAHl84BJK_csHLM0bJOWPBSRS-2BKYxa0qGq
 wa2xraYwAQAbqXI8EE>
X-ME-Received: <xmr:QnGEY5ndvGSvKlL3ei078S4p6VOzKM0bKxfOy8unWkLMpwl1pMJwHqNrn2Jfg0l68VOax0IXYpeBvNcdKkKWHdxEznWQ4Eh9hazoLoGKXh1o7A>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvgedrjedugdduvddvucetufdoteggodetrfdotf
 fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
 uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
 cujfgurhepfffhvfevuffkfhggtggujgesghdtreertddtvdenucfhrhhomhepofgrgihi
 mhgvucftihhprghrugcuoehmrgigihhmvgestggvrhhnohdrthgvtghhqeenucggtffrrg
 htthgvrhhnpeetfefffefgkedtfefgledugfdtjeefjedvtddtkeetieffjedvgfehheff
 hfevudenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepmhgrihhlfhhrohhmpe
 hmrgigihhmvgestggvrhhnohdrthgvtghh
X-ME-Proxy: <xmx:QnGEY0w8cc-fnQFD1xJkwpIya0fmt5MiJ1DiO---Yjf4tML_WbgI-Q>
 <xmx:QnGEY7S4tsmG9Sl8oZfcDr5es45j7LDN9U7p3iqPVb4C4aJc2yUqWg>
 <xmx:QnGEY_b4lOuqsTVGSjBVmzmMrsLVgLogjWfKvspbQkNh3YX4GHYZHA>
 <xmx:Q3GEY8TU3A90DfPutu-y6NNrEAT1SpQloi6bj4QWcA6c3QhgkIHxZA>
Feedback-ID: i8771445c:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Mon,
 28 Nov 2022 03:28:50 -0500 (EST)
Date: Mon, 28 Nov 2022 09:28:49 +0100
From: Maxime Ripard <maxime@cerno.tech>
To: Geert Uytterhoeven <geert@linux-m68k.org>
Subject: Re: [PATCH/RFC 3/3] drm: atari: Add a DRM driver for Atari graphics
 hardware
Message-ID: <20221128082849.jixumay2q5r3f23r@houat>
References: <cover.1669406380.git.geert@linux-m68k.org>
 <9ef3ed30a45a367db0231ea2e98f6f37ba860b4c.1669406382.git.geert@linux-m68k.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
 protocol="application/pgp-signature"; boundary="rsjyngjy5j33h3zh"
Content-Disposition: inline
In-Reply-To: <9ef3ed30a45a367db0231ea2e98f6f37ba860b4c.1669406382.git.geert@linux-m68k.org>
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
Cc: Michael Schmitz <schmitzmic@gmail.com>, linux-fbdev@vger.kernel.org,
 Thomas Zimmermann <tzimmermann@suse.de>, Helge Deller <deller@gmx.de>,
 linux-m68k@vger.kernel.org, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


--rsjyngjy5j33h3zh
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi,

On Fri, Nov 25, 2022 at 09:31:10PM +0100, Geert Uytterhoeven wrote:
> +// FIXME create dynamically from atari_drm_modes[]?

Not necessarily, but they should have proper descriptors at the very least.

> +static const struct drm_named_mode atari_drm_named_modes[] =
> +{
> +	{ .name = "st-low" },
> +	{ .name = "st-mid" },
> +	{ .name = "st-high" },
> +	{ .name = "tt-low" },
> +	{ .name = "tt-mid" },
> +	{ .name = "tt-high" },
> +	{ .name = "vga" },
> +	{ .name = "vga70" },
> +	{ .name = "qvga" },
> +	{ .name = "hvga" },
> +	{ .name = "falh" },
> +	{ /* sentinel */ }
> +};

I'm really not convinced about per-driver named modes. This will only
lead to each driver having its own set of undocumented and obscure mode
names that will just make everything work.

And some of them in that list are completely generic: VGA, QVGA, HVGA at
least should definitely be part of the generic named modes.

Maxime

--rsjyngjy5j33h3zh
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQRcEzekXsqa64kGDp7j7w1vZxhRxQUCY4RxQQAKCRDj7w1vZxhR
xfMnAP93kyXjMFffjjRpWN5fHp8WKE3Jg4utXdhfbIjQtUx51gEAln73V6oGNd7N
/JYs3SvDr/bqiGUDKjqbA2eGjCNfuwY=
=wePj
-----END PGP SIGNATURE-----

--rsjyngjy5j33h3zh--
