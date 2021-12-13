Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 275A647324B
	for <lists+dri-devel@lfdr.de>; Mon, 13 Dec 2021 17:54:29 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6E2E810E79B;
	Mon, 13 Dec 2021 16:54:25 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from new4-smtp.messagingengine.com (new4-smtp.messagingengine.com
 [66.111.4.230])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D4E2710E79B
 for <dri-devel@lists.freedesktop.org>; Mon, 13 Dec 2021 16:54:24 +0000 (UTC)
Received: from compute6.internal (compute6.nyi.internal [10.202.2.46])
 by mailnew.nyi.internal (Postfix) with ESMTP id 2761D5801DF;
 Mon, 13 Dec 2021 11:54:24 -0500 (EST)
Received: from mailfrontend1 ([10.202.2.162])
 by compute6.internal (MEProxy); Mon, 13 Dec 2021 11:54:24 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cerno.tech; h=
 date:from:to:cc:subject:message-id:references:mime-version
 :content-type:in-reply-to; s=fm1; bh=5QiXVE5U69Mg35ZnXupLr9UQK/P
 btYmTEolYnD06NLQ=; b=Wo0vGCLKL8TnuTpXGT6aMvo+mVKt398ERba+hPmKEpD
 gOePnZzc1ep1dbKyuY+Lfwjm6wv2bnuOXdY2DxQrTnXblLzMA1aW/ZZlgWKCinex
 qLYAiCk4VBc9hBNJymRlHd6Av8CH7Mg4ewH1ilB/4oZV7s/04CDnUFqsVQMcl7X9
 PBeTW1MVMrUoDUVPm17s+YBkvyjUyb3TpAwFoZd0cvJM2coh067tGxyR0qgysVTH
 uk0QSjkvQNo/sOPyqdI+PxHIsYSBr0g7G0t8auXAXn3XKF0KNvxB9iNZydMYdFU7
 o8GVqr0u+VoU3lK1LgE+0SaW8yUAvfRsUDaOwis3BqQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to:x-me-proxy
 :x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm1; bh=5QiXVE
 5U69Mg35ZnXupLr9UQK/PbtYmTEolYnD06NLQ=; b=ZCDCuoiG2EevFdkafU9Se9
 B/mFoXSFNhWwJJaJgDYnpWVKqMZ9JTtBCJ6dKh+Ch/pmqSuFbd5JyDoNgLMx9aFP
 DxEHJ44FL68CaQKrglWZozAZYYlRoLVBLoanNcLHH1LY0B4C1cgxBNGxt36VCByg
 8+ldqgMa8Z06/9ft5Bzy5AFuWu6VJkR5HlvUUcfnTF5Z/3fCOuN6/IAHjCpjnYPY
 U3RBcccw0SN1784eiorhY/+lE9U5Y/Rmhk0vHmhhuqfQmo0GTRPSVrWH8E+na9Tf
 8Y1ol1NvLSmVmX4/S3RfGaxSvU9FkskliyOMF/Py7aAhuYhp62JuFOPMkVemcWwg
 ==
X-ME-Sender: <xms:v3q3YXa_-t7aZl7Gfmo_XFzhI2zw37moXstAZ5Ex16CyoonePGsaGg>
 <xme:v3q3YWalhVXN6BQm3cmstHqi7P_ud8qw_7Eyr5tEbh-1Bg54z5NShJYE_1MH5Pwea
 TBHYOq75W7Vl9veY00>
X-ME-Received: <xmr:v3q3YZ9o6WGGBnz2DZHaY0s8cky-25B2oYS1tbSVeHfyNSbYDdrTeIHBIMiMwh0N0PvCB8jtLvbPdEnfVdzOW0OCiZW3VZyDWy9bCtt4>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvuddrkeekgdelgecutefuodetggdotefrodftvf
 curfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfghnecu
 uegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenuc
 fjughrpeffhffvuffkfhggtggujgesghdtreertddtvdenucfhrhhomhepofgrgihimhgv
 ucftihhprghrugcuoehmrgigihhmvgestggvrhhnohdrthgvtghhqeenucggtffrrghtth
 gvrhhnpeevveefffduveeitdegtefhhfetueffteefffdvheevvdehteethedvleffgfej
 vdenucffohhmrghinhepkhgvrhhnvghlrdhorhhgnecuvehluhhsthgvrhfuihiivgeptd
 enucfrrghrrghmpehmrghilhhfrhhomhepmhgrgihimhgvsegtvghrnhhordhtvggthh
X-ME-Proxy: <xmx:v3q3YdrR1_0X47QzI8HtSWViN8YdIAAz7gIoJ3DXKPm5GBtA6WlWag>
 <xmx:v3q3YSr6qbi-Xeeb3nGqObgm3jwRDz6n0WCD7Rg0_P8jppohH12OMQ>
 <xmx:v3q3YTTcv-LNTaCVeLMLNvv5iTtXdhJHr8E0RzFSqIBOCY-cPJ4Rzg>
 <xmx:wHq3YYhKI9VF7Vso7A04DMP4uHx4rfWnn9XTjjzbcyARRzY2PTxK9w>
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Mon,
 13 Dec 2021 11:54:23 -0500 (EST)
Date: Mon, 13 Dec 2021 17:54:22 +0100
From: Maxime Ripard <maxime@cerno.tech>
To: Guillaume Ranquet <granquet@baylibre.com>
Subject: Re: [PATCH v6 7/7] drm/mediatek: Add mt8195 DisplayPort driver
Message-ID: <20211213165422.54n3oh72tjcb3a67@houat>
References: <20211110130623.20553-1-granquet@baylibre.com>
 <20211110130623.20553-8-granquet@baylibre.com>
 <20211115101129.lyxxmb6i7paaonwi@gilmour>
 <CABnWg9tNPGZSi1RLqF5+Qs1GHtynyVoOzAyw+i9mPRYEoByk8g@mail.gmail.com>
 <20211116145112.xyoxzfll6exysnvt@gilmour>
 <CABnWg9uhuchdWyBeTacR6Cy0A9OHziUi051BQ5wsZVU0ajYjyA@mail.gmail.com>
 <20211125143034.tzikvlxxl6fdhsif@gilmour>
 <CABnWg9tcWdfPQwNtFhqVZxCriT848fy42VHoQZs3X2UmL4LYSA@mail.gmail.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
 protocol="application/pgp-signature"; boundary="ylwd6onewg73wtcp"
Content-Disposition: inline
In-Reply-To: <CABnWg9tcWdfPQwNtFhqVZxCriT848fy42VHoQZs3X2UmL4LYSA@mail.gmail.com>
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
Cc: Chun-Kuang Hu <chunkuang.hu@kernel.org>, David Airlie <airlied@linux.ie>,
 Thomas Zimmermann <tzimmermann@suse.de>, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, Markus Schneider-Pargmann <msp@baylibre.com>,
 linux-mediatek@lists.infradead.org, Matthias Brugger <matthias.bgg@gmail.com>,
 linux-arm-kernel@lists.infradead.org, kernel test robot <lkp@intel.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


--ylwd6onewg73wtcp
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Dec 02, 2021 at 06:48:12AM -0800, Guillaume Ranquet wrote:
> Hi,
>=20
> Quoting Maxime Ripard (2021-11-25 15:30:34)
> > On Wed, Nov 24, 2021 at 01:45:21PM +0000, Guillaume Ranquet wrote:
> > > Hi,
> > > Thanks for all your input, really appreciated.
> > >
> > > Quoting Maxime Ripard (2021-11-16 15:51:12)
> > > > Hi,
> > > >
> > > > On Mon, Nov 15, 2021 at 09:33:52AM -0500, Guillaume Ranquet wrote:
> > > > > Quoting Maxime Ripard (2021-11-15 11:11:29)
> > > > > > > The driver creates a child device for the phy. The child devi=
ce will
> > > > > > > never exist without the parent being active. As they are shar=
ing a
> > > > > > > register range, the parent passes a regmap pointer to the chi=
ld so that
> > > > > > > both can work with the same register range. The phy driver se=
ts device
> > > > > > > data that is read by the parent to get the phy device that ca=
n be used
> > > > > > > to control the phy properties.
> > > > > >
> > > > > > If the PHY is in the same register space than the DP controller=
, why do
> > > > > > you need a separate PHY driver in the first place?
> > > > >
> > > > > This has been asked by Chun-Kuang Hu in a previous revision of th=
e series:
> > > > >
> > > > > https://lore.kernel.org/linux-mediatek/CAAOTY_-+T-wRCH2yw2XSm=3DZ=
baBbqBQ4EqpU2P0TF90gAWQeRsg@mail.gmail.com/
> > > >
> > > > It's a bit of a circular argument though :)
> > > >
> > > > It's a separate phy driver because it needs to go through another
> > > > maintainer's tree, but it needs to go through another maintainer's =
tree
> > > > because it's a separate phy driver.
> > > >
> > > > It doesn't explain why it needs to be a separate phy driver? Why ca=
n't
> > > > the phy setup be done directly in the DP driver, if it's essentiall=
y a
> > > > single device?
> > > >
> > > > That being said, usually what those kind of questions mean is that
> > > > you're missing a comment or something in the commit log to provide =
that
> > > > context in the first place, so it would be great to add that context
> > > > here.
> > > >
> > > > And it will avoid the situation we're now in where multiple reviewe=
rs
> > > > ask the same questions over and over again :)
> > > >
> > > At first I didn't understand your reply, then I realized I gave you
> > > the wrong link...
> > > my bad! I'm struggling a bit with mail reviews, but I'll get there ev=
entually.
> > >
> > > The driver and phy were a single driver until v2 of this patch series
> > > and the phy setup
> > > was done directly in the driver (single driver, single C file).
> > > Here's the relevant link to the discussion between Chun-Kuang and Mar=
kus
> > >
> > > https://lore.kernel.org/linux-mediatek/CAAOTY__cJMqcAieEraJ2sz4gi0Zs-=
aiNXz38_x7dPQea6HvYEg@mail.gmail.com/#t
> > >
> > > I'll try to find a way to make it clearer for v7.
> >
> > OK, it makes sense then :)
> >
> > There's something weird though: the devices definitely look like they're
> > in a separate register range, yet you mention a regmap to handle the
> > shared register range. That range doesn't seem described anywhere in the
> > device tree though? What is it for?
>
> My understanding is that 0x1000 to 0x1fff controls the phy
> functionalities and 0x2000 to 0x4fff controls "non-phy"
> functionalities. And you are right, there's no description of that in
> the device tree whatsoever. The ranges are in the same actual device
> and thus it has been decided to not have dt-bindings for the phy
> device.

Sure, that last part makes sense, but then I'm not sure why you don't
have the full register range in the device node you have in the DT?

> The phy driver is a child of the DP driver that we register using
> platform_device_register_data() and we pass along the same regmap as
> the DP driver in its platform data.

Especially if it's used by something, it should be described in the DT
somewhere.

Maxime

--ylwd6onewg73wtcp
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQRcEzekXsqa64kGDp7j7w1vZxhRxQUCYbd6vgAKCRDj7w1vZxhR
xT/XAP4gcBznOdZEodDfrTWXsySCTdZkPIjixaXYaZygMv/DvAEAzYR8zGWt+4Lo
KRYSF1p0RUF9kFGbzn1FJomiL38MuwI=
=Rzng
-----END PGP SIGNATURE-----

--ylwd6onewg73wtcp--
