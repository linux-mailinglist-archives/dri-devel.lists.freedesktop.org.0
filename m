Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 9F68B5B8CA5
	for <lists+dri-devel@lfdr.de>; Wed, 14 Sep 2022 18:15:21 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2379510E972;
	Wed, 14 Sep 2022 16:15:15 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from wout1-smtp.messagingengine.com (wout1-smtp.messagingengine.com
 [64.147.123.24])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DC0A510E00D
 for <dri-devel@lists.freedesktop.org>; Wed, 14 Sep 2022 16:15:08 +0000 (UTC)
Received: from compute2.internal (compute2.nyi.internal [10.202.2.46])
 by mailout.west.internal (Postfix) with ESMTP id ADD773200A47;
 Wed, 14 Sep 2022 12:15:04 -0400 (EDT)
Received: from mailfrontend2 ([10.202.2.163])
 by compute2.internal (MEProxy); Wed, 14 Sep 2022 12:15:06 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cerno.tech; h=cc
 :cc:content-type:date:date:from:from:in-reply-to:in-reply-to
 :message-id:mime-version:references:reply-to:sender:subject
 :subject:to:to; s=fm2; t=1663172104; x=1663258504; bh=P7L2M3/QwQ
 QV+BhHnSTWfJbZqDvMBCiXVeYbVx8YGkU=; b=2sbkhWFPhTMpwQYi30Crgjun7y
 6SSollWw43tIrUy/gKS8DAEN6b11J2GBD6ZCt9CkYloWYnX9VZMKsUwQ1ErYDHdx
 wEIiP6IbbEugF6+nvtcJ1IpH6FO1C7wTyObQOd70b1xA+P+i7kA36QbBfYumUVYu
 RpD+8e2FGV910jr5inDIUeiehHKjyiHP2uhYrrXiSELODP2MzeHiDvYVB14mpwzn
 t6xKYyYZrwFkVpO5GBh2PciDJ6Hb2M0DxKIa3Ra6Cwi5X9OgnJpchvIcERx26TvN
 aP0h8DZGV3B4J1WkaGkE+9S8HfHi6gEjZgdEoR7DB+xPoChX43omeRJFYyBg==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:cc:content-type:date:date:feedback-id
 :feedback-id:from:from:in-reply-to:in-reply-to:message-id
 :mime-version:references:reply-to:sender:subject:subject:to:to
 :x-me-proxy:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=
 fm2; t=1663172104; x=1663258504; bh=P7L2M3/QwQQV+BhHnSTWfJbZqDvM
 BCiXVeYbVx8YGkU=; b=X/vAU0WfPT777EzQTStl3FNv7jQAhd8QQqSx0AJkuDK7
 zaPyJr4OJi3+w4LQGLsW/nnm8qjcTOvNNA2k2EALAx7qqZbcBw+SYS7t3OUSibqD
 c5rdwz4Gxgnp7w7IOqO/+I454Bjd3daulgIMs8RXmhj/qjV2fvEymK1GmYHX+J29
 uD5M72gdHh0tk9OV4NhtgXNhxRa24rsyUHpC+sT55Ke+vluqnCO5cchvZDzI5SMl
 m/zuHYn96D99WjkMpoFEQS88vTFhkiBJTOU1zLq36NV7NHWSN8YUUIa3KU36EEHW
 Bjm59LV5bplh5PXKJvt04kHdTxVCBzD+aUdvISG6xg==
X-ME-Sender: <xms:B_4hYynx_MY7ynsM9No_Cn0gIQbzkk8tRNoiZF6uoJE5tBNJjTgOmQ>
 <xme:B_4hY52gHyLUw16O-xw9R4VSYNkwZmrRl4VCB5LvZvMraffQCDyO210fawiHpdp4g
 s_zuTPkwAt7sQYw8Y0>
X-ME-Received: <xmr:B_4hYwrJ4B-pKuQGBeDk9-pOv7EhaZtmzpg3802FtT1TXh4ESUmNay8QH1HH>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvfedrfeduiedguddtudcutefuodetggdotefrod
 ftvfcurfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfgh
 necuuegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmd
 enucfjughrpeffhffvvefukfhfgggtuggjsehgtderredttddvnecuhfhrohhmpeforgig
 ihhmvgcutfhiphgrrhguuceomhgrgihimhgvsegtvghrnhhordhtvggthheqnecuggftrf
 grthhtvghrnhepteefffefgfektdefgfeludfgtdejfeejvddttdekteeiffejvdfgheeh
 fffhvedunecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehmrghilhhfrhhomh
 epmhgrgihimhgvsegtvghrnhhordhtvggthh
X-ME-Proxy: <xmx:B_4hY2kBcM3YeHVUau-qSf4cNwIh3QtLyqoTHSPdYWUOePHofCjGeg>
 <xmx:B_4hYw20BLH_CF5baE7SMOcLjqkZ6euDl4dxa0qs_9yb5rQ3Wqkzow>
 <xmx:B_4hY9vzpltCZs5WlKM8J48o9tV8O_pAzpSlHFB3SlxgT7GkDAr2uw>
 <xmx:CP4hY73-YNqFGQa4Y-uNY4H7AJEtYJcuvIi5N3X4vLuOs4Nrrd_KPg>
Feedback-ID: i8771445c:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Wed,
 14 Sep 2022 12:15:03 -0400 (EDT)
Date: Wed, 14 Sep 2022 17:15:02 +0100
From: Maxime Ripard <maxime@cerno.tech>
To: Stephen Boyd <sboyd@kernel.org>
Subject: Re: [PATCH v1 2/7] clk: bcm: rpi: Add a function to retrieve the
 maximum
Message-ID: <20220914161502.faiaccuxydyrdr6e@penduick>
References: <20220815-rpi-fix-4k-60-v1-0-c52bd642f7c6@cerno.tech>
 <20220815-rpi-fix-4k-60-v1-2-c52bd642f7c6@cerno.tech>
 <20220914155035.88E45C433C1@smtp.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="lzv5z4zggisvled2"
Content-Disposition: inline
In-Reply-To: <20220914155035.88E45C433C1@smtp.kernel.org>
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
Cc: Florian Fainelli <f.fainelli@gmail.com>,
 Scott Branden <sbranden@broadcom.com>, Emma Anholt <emma@anholt.net>,
 David Airlie <airlied@linux.ie>, Ray Jui <rjui@broadcom.com>,
 Michael Turquette <mturquette@baylibre.com>, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org,
 Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>,
 linux-rpi-kernel@lists.infradead.org, Dom Cobley <popcornmix@gmail.com>,
 linux-clk@vger.kernel.org, linux-arm-kernel@lists.infradead.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


--lzv5z4zggisvled2
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi Stephen,

Thanks for reviewing that series

On Wed, Sep 14, 2022 at 08:50:33AM -0700, Stephen Boyd wrote:
> Quoting Maxime Ripard (2022-08-15 08:31:24)
> > @@ -254,6 +255,33 @@ static int raspberrypi_fw_dumb_determine_rate(stru=
ct clk_hw *hw,
> >         return 0;
> >  }
> > =20
> > +unsigned long rpi_firmware_clk_get_max_rate(struct clk *clk)
> > +{
> > +       const struct raspberrypi_clk_data *data;
> > +       struct raspberrypi_clk *rpi;
> > +       struct clk_hw *hw;
> > +       u32 max_rate;
> > +       int ret;
> > +
> > +       if (!clk)
> > +               return 0;
> > +
> > +       hw =3D  __clk_get_hw(clk);
>=20
> Ideally we don't add more users of this API. I should document that :/

What should be the proper way to implement this?

> It begs the question though, why do we need this API to take a 'struct
> clk'?  Can it simply hardcode the data->id value for the clk you care
> about and call rpi_firmware_property() directly (or some wrapper of it)?

You mean push it down to the consumer?

We will have two users of that function eventually. The KMS driver, and
the codec driver that isn't upstream yet. AFAIK, both are using a
different clock, so we can' really hardcode it, and duplicating it at
the consumer level would be weird.

> Furthermore, I wonder if even that part needs to be implemented.  Why
> not make a direct call to rpi_firmware_property() and get the max rate?
> All of that can live in the drm driver. Making it a generic API that
> takes a 'struct clk' means that it looks like any clk can be passed,
> when that isn't true. It would be better to restrict it to the one use
> case so that the scope of the problem doesn't grow. I understand that it
> duplicates a few lines of code, but that looks like a fair tradeoff vs.
> exposing an API that can be used for other clks in the future.

So we'll want to have that function shared between the KMS and codec
drivers eventually. The clock id used by both drivers is stored in the
DT so we would create a function (outside of the clock drivers) that
would parse the clocks property, get the ID, and then queries the
firmware for it. Would that make sense?

Maxime

--lzv5z4zggisvled2
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABMIAB0WIQTXEe0+DlZaRlgM8LOIQ8rmN6G3ywUCYyH+BgAKCRCIQ8rmN6G3
y8NdAQDNNVcy/hcyBCUGwW5D6Ba/bwnP5KpSp6uvbGHgAZ7/HQD/XIuX+7fGvFsy
YBf5MZIJ0Vmh5SvM654kpU7dr8di1Hw=
=F783
-----END PGP SIGNATURE-----

--lzv5z4zggisvled2--
