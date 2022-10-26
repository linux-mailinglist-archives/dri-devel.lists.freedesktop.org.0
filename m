Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 7827F60E558
	for <lists+dri-devel@lfdr.de>; Wed, 26 Oct 2022 18:14:09 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E413A10E36E;
	Wed, 26 Oct 2022 16:14:04 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from new4-smtp.messagingengine.com (new4-smtp.messagingengine.com
 [66.111.4.230])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 17B2410E36E
 for <dri-devel@lists.freedesktop.org>; Wed, 26 Oct 2022 16:14:03 +0000 (UTC)
Received: from compute5.internal (compute5.nyi.internal [10.202.2.45])
 by mailnew.nyi.internal (Postfix) with ESMTP id 68E30580391;
 Wed, 26 Oct 2022 12:14:02 -0400 (EDT)
Received: from mailfrontend2 ([10.202.2.163])
 by compute5.internal (MEProxy); Wed, 26 Oct 2022 12:14:02 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cerno.tech; h=cc
 :cc:content-transfer-encoding:content-type:date:date:from:from
 :in-reply-to:in-reply-to:message-id:mime-version:references
 :reply-to:sender:subject:subject:to:to; s=fm3; t=1666800842; x=
 1666808042; bh=vl4HoCVHol4hKpd3C0NRQB0WtcoXr8XO2mxUe95jG5k=; b=k
 HuPJk+Z+MVjBFThX2bL31VSIB3rNDDJhE/pYNzaKPpPDS9b8Cv+tjApM5le7weJp
 /8rkYXMXQ/CHScPvqf9QYNqV8wKSWDp+5lIuimE3hW9f3MwHl1B1jz3q50qMiVJd
 Z1+YmO2Kq5HybJBW7HQS/5ebgJ7DpEH0gbeNFo9PrC5L82Qj9q3G8M8eTgmcBH3/
 OEZKNU0WDFIzZ/9qDHHTrHLDweUcQ8Q/ekM9KxISyDg7zHy9Aky6mrH9wBa1intS
 f4AgU750rpT1ZBMVLgC2CbkR9SEtdTspePcFYF2yfIhVtyFhcAwCI9Rkdo/NG1Gt
 zRhfzPMYLMi+qtZIUnFTg==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:cc:content-transfer-encoding
 :content-type:date:date:feedback-id:feedback-id:from:from
 :in-reply-to:in-reply-to:message-id:mime-version:references
 :reply-to:sender:subject:subject:to:to:x-me-proxy:x-me-proxy
 :x-me-sender:x-me-sender:x-sasl-enc; s=fm3; t=1666800842; x=
 1666808042; bh=vl4HoCVHol4hKpd3C0NRQB0WtcoXr8XO2mxUe95jG5k=; b=a
 Yz0u0LfjWEAx+IauSzyx6J6Jx0+Ste7fQG986DfcUpa/U0AVvmwmN4OpuEM9b+wl
 SNSGY58UpHxMtbWFd8dP5qHLuSzqFXiuJ/YO5YI7VAlTQzGogF12ouVe6tcwtE/1
 AR2I+24KZm/R8+neC2Nu9oBUq1DdzUzSPZ9WU2iDSpjcQXiZmRnoz7frCR0GlAR/
 yuUQkmXgv72zOoScIgQvnXbjQmrj04hFwnFWTlyCwpcOXB1JOlQxZKOBNtZoo5FS
 eecnSfT51jxlg3umLwiBzGmu+JlLOcP5VNDh8nWm0XxpDZM1944R3Yh1/t6xvAAw
 VYyWSbiioqoBjJEbep9RQ==
X-ME-Sender: <xms:ylxZY76wbOw6LPoafFdmAi1D4qNUZ7fHylFPIncWIF_bz2hJwLqeHg>
 <xme:ylxZYw4RMEx7JEd3L98fJTC6r16PJHfIojRbjxwB7GXm9XMnvPItRfvbjvIernaol
 zecaHunUfouYQ5H5fY>
X-ME-Received: <xmr:ylxZYycvEnQHxINgxB2NMsMMxwidJ4oyuuyXFJSMSxDVYv4kvc6u2oI-ckOqINqB7B9EsvUvtaBeTCLd2eWIluC9JwG3amZNzCj3Bd0lsjt5VQ>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvgedrtddvgdelkecutefuodetggdotefrodftvf
 curfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfghnecu
 uegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenuc
 fjughrpefhfffvvefukfhfgggtugfgjgesthhqredttddtvdenucfhrhhomhepmhgrgihi
 mhgvsegtvghrnhhordhtvggthhenucggtffrrghtthgvrhhnpedvtefggeffuefhkedufe
 ffgffhgfehheetheeghfffkeduhfegffeukeelvdejgfenucevlhhushhtvghrufhiiigv
 pedtnecurfgrrhgrmhepmhgrihhlfhhrohhmpehmrgigihhmvgestggvrhhnohdrthgvtg
 hh
X-ME-Proxy: <xmx:ylxZY8KJ8lDG0xoRDbi2GZFj37IGlLOWVHe-inCtSb7_Z0OgcgSRXw>
 <xmx:ylxZY_K3JNY1kNEblIQpL0844ZBIRCWbbjezaB8yMmX3CccYnYYRSg>
 <xmx:ylxZY1xa5BqHrqU63O33u8FxrLuKqFUaYQW7DvorUOPG47KurxI7Wg>
 <xmx:ylxZY-iNus2sFSmqe0Ag17HMnGIb4egq_-vyrY2myOIPspbfq7h9UQ>
Feedback-ID: i8771445c:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Wed,
 26 Oct 2022 12:14:01 -0400 (EDT)
From: maxime@cerno.tech
Date: Wed, 26 Oct 2022 18:14:00 +0200
To: Dave Stevenson <dave.stevenson@raspberrypi.com>
Subject: Re: [PATCH v4 5/7] drm/vc4: hdmi: Rework hdmi_enable_4kp60 detection
 code
Message-ID: <20221026161400.ppg6a5ckycpdkhmn@houat>
References: <20220815-rpi-fix-4k-60-v4-0-a1b40526df3e@cerno.tech>
 <20220815-rpi-fix-4k-60-v4-5-a1b40526df3e@cerno.tech>
 <CAPY8ntBUJRKOkw4VxWL97zj13+DLtMG6rBgGCrvA+HHaAZ7Zvg@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <CAPY8ntBUJRKOkw4VxWL97zj13+DLtMG6rBgGCrvA+HHaAZ7Zvg@mail.gmail.com>
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
Cc: Stefan Wahren <stefan.wahren@i2se.com>,
 Florian Fainelli <f.fainelli@gmail.com>, Scott Branden <sbranden@broadcom.com>,
 Emma Anholt <emma@anholt.net>, Stephen Boyd <sboyd@kernel.org>,
 Ray Jui <rjui@broadcom.com>, Michael Turquette <mturquette@baylibre.com>,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 David Airlie <airlied@linux.ie>,
 Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>,
 linux-rpi-kernel@lists.infradead.org, Dom Cobley <popcornmix@gmail.com>,
 linux-clk@vger.kernel.org, linux-arm-kernel@lists.infradead.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Dave,

On Wed, Oct 26, 2022 at 05:00:25PM +0100, Dave Stevenson wrote:
> > +
> > +               node =3D rpi_firmware_find_node();
> > +               if (!node)
> > +                       return -EINVAL;
> > +
> > +               firmware =3D rpi_firmware_get(node);
> > +               of_node_put(node);
> > +               if (!firmware)
> > +                       return -EPROBE_DEFER;
> > +
> >                 hvs->core_clk =3D devm_clk_get(&pdev->dev, NULL);
> >                 if (IS_ERR(hvs->core_clk)) {
> >                         dev_err(&pdev->dev, "Couldn't get core clock\n"=
);
> >                         return PTR_ERR(hvs->core_clk);
> >                 }
> >
> > +               max_rate =3D rpi_firmware_clk_get_max_rate(firmware,
> > +                                                        RPI_FIRMWARE_C=
ORE_CLK_ID);
> > +               rpi_firmware_put(firmware);
> > +               if (max_rate >=3D 550000000)
> > +                       hvs->vc5_hdmi_enable_scrambling =3D true;
> > +
> > +               hvs->max_core_rate =3D max_rate;
>=20
> I was going to query the reason for storing this value, but it's used
> when we get to patch 7/7.
> I won't quibble about having it as an unused value for 2 patches.

Yeah, it felt natural to do it in that patch, even though it's indeed
only useful in a couple of patches.

Maxime
