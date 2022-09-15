Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 4103D5B96BD
	for <lists+dri-devel@lfdr.de>; Thu, 15 Sep 2022 10:57:44 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 63F0610E169;
	Thu, 15 Sep 2022 08:57:38 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from wout4-smtp.messagingengine.com (wout4-smtp.messagingengine.com
 [64.147.123.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 60FE210E169
 for <dri-devel@lists.freedesktop.org>; Thu, 15 Sep 2022 08:57:33 +0000 (UTC)
Received: from compute2.internal (compute2.nyi.internal [10.202.2.46])
 by mailout.west.internal (Postfix) with ESMTP id 55E153200ACE;
 Thu, 15 Sep 2022 04:57:31 -0400 (EDT)
Received: from mailfrontend1 ([10.202.2.162])
 by compute2.internal (MEProxy); Thu, 15 Sep 2022 04:57:32 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cerno.tech; h=cc
 :cc:content-type:date:date:from:from:in-reply-to:in-reply-to
 :message-id:mime-version:references:reply-to:sender:subject
 :subject:to:to; s=fm2; t=1663232250; x=1663318650; bh=9glwTz4c50
 AzANN1a3FHpJHFXzJY1B25m9AFHGViGC8=; b=xDypjv7zdS9e2gHQZws3GTTEnH
 2rq3YLmq1KfhDpOF8KFKbLsMrUXWfNkF7yIlIZz/IcyYDguh99CZv48rg9ZYLcyj
 e0P7q/RIrzNkPF0SBy/f03gRUUR9mlD+q7HPrcVl2NaCr50Uyqyo7rsXV3shO8f4
 ssgwEWRt8rls+h/7jXWqB50EKc3beJAgCmkkbcIIIwn8Tje5jucDKRlja0DYmYVQ
 rvSIF3ZA9ODAXEcCusvj74sSRrSyhhA4U3PRkt8v4/QWosj3cQ8wzkC2pm1/rkvy
 SUXxINygqxuDhNX7MkX2M12UFdHnMSvstI9+DA3/NBzrOvjK6LyWCVJJ+mKg==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:cc:content-type:date:date:feedback-id
 :feedback-id:from:from:in-reply-to:in-reply-to:message-id
 :mime-version:references:reply-to:sender:subject:subject:to:to
 :x-me-proxy:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=
 fm2; t=1663232250; x=1663318650; bh=9glwTz4c50AzANN1a3FHpJHFXzJY
 1B25m9AFHGViGC8=; b=uET4lJ106HjGjY2CJhWmgaIacb6UeR3ReLITT/XOPNjs
 bswVZ3Mxb/NtwY8EBW8ly8IKzZaH/ymyOfa15U28mTHP8ZcwjmFwj7lnFJMB56xH
 sY+slAkWtbP/S1IzMVTFBZ58Ge/zN7DlqJR22uwlh9jl8xymnzzFqNuqX8c9jLb6
 CL556v3nyMdTu/AK2DWPIuMN6F1adcTXL4ZQMfHnkb3kaZwzi9g0t+Jy3Qu/lv1K
 bDVlMxlbegvDa2R8HhVSSt85xSsI/OLIPmbN6b0RYnmC8tC3L9RPta8dvRww/eId
 Q4m7lYT1iPoz3q6THSaOMkqHTSo5p5cXi8LLcop/Wg==
X-ME-Sender: <xms:-ugiY9BtIfUcaNAoq8yHMt9s7o3fJB4Ns_2LamrbYNBrlKEBlJ6wQQ>
 <xme:-ugiY7i9mkvIRH2nsCqHFANDMRSks9kEr5yYVZ1lTiGww0ddjx7bGVdGrtK_OvaWO
 B2slXr7-9cAkfULsXY>
X-ME-Received: <xmr:-ugiY4lvVqTYBX_L4Cp_Scnn9odK-YwK9D3gvdOVI-Hn3XZJwEcbpXT8oHE>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvfedrfedukedguddtucetufdoteggodetrfdotf
 fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
 uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
 cujfgurhepfffhvfevuffkfhggtggujgesghdtreertddtvdenucfhrhhomhepofgrgihi
 mhgvucftihhprghrugcuoehmrgigihhmvgestggvrhhnohdrthgvtghhqeenucggtffrrg
 htthgvrhhnpedtleekjeeiudefvdfhieffteelhfeivdeliefgieeugffhvdelieffjeei
 geetjeenucffohhmrghinhepkhgvrhhnvghlrdhorhhgnecuvehluhhsthgvrhfuihiivg
 eptdenucfrrghrrghmpehmrghilhhfrhhomhepmhgrgihimhgvsegtvghrnhhordhtvggt
 hh
X-ME-Proxy: <xmx:-ugiY3z_MYYYtmYcOtdowe5h3pfS7IBNFasUqN_XJX0pyZH73eYO7g>
 <xmx:-ugiYyT0Zlks3YllblspSTA5S7jOb0WL_7CeD7hljOB1jHo050vBKg>
 <xmx:-ugiY6bnRFoZHHAjZCEWwdAm4lQ2Jqj3lG1CwOiUxPE6PkA-l7CAYQ>
 <xmx:-ugiY-o_rnudp4f_lkcQQTcYEHOSrzEnsBxUi-zW8rPOpim_9IvAaA>
Feedback-ID: i8771445c:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Thu,
 15 Sep 2022 04:57:29 -0400 (EDT)
Date: Thu, 15 Sep 2022 10:55:20 +0100
From: Maxime Ripard <maxime@cerno.tech>
To: Stephen Boyd <sboyd@kernel.org>
Subject: Re: [PATCH v1 2/7] clk: bcm: rpi: Add a function to retrieve the
 maximum
Message-ID: <20220915095520.ib7pixhteuahno3p@penduick>
References: <20220815-rpi-fix-4k-60-v1-0-c52bd642f7c6@cerno.tech>
 <20220815-rpi-fix-4k-60-v1-2-c52bd642f7c6@cerno.tech>
 <20220914155035.88E45C433C1@smtp.kernel.org>
 <50e8f1e8-806a-3599-7cbe-0c7d4bec1c51@i2se.com>
 <20220914180508.0EDD9C433D6@smtp.kernel.org>
 <c221873f-f230-0cce-e120-7e3cc732cf00@i2se.com>
 <20220914182101.92286C433D6@smtp.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="cohslk2tp5ouqtkq"
Content-Disposition: inline
In-Reply-To: <20220914182101.92286C433D6@smtp.kernel.org>
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
 Emma Anholt <emma@anholt.net>, David Airlie <airlied@linux.ie>,
 Ray Jui <rjui@broadcom.com>, Michael Turquette <mturquette@baylibre.com>,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>,
 linux-rpi-kernel@lists.infradead.org, Dom Cobley <popcornmix@gmail.com>,
 linux-clk@vger.kernel.org, linux-arm-kernel@lists.infradead.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


--cohslk2tp5ouqtkq
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi,

On Wed, Sep 14, 2022 at 11:20:59AM -0700, Stephen Boyd wrote:
> Quoting Stefan Wahren (2022-09-14 11:09:04)
> > Am 14.09.22 um 20:05 schrieb Stephen Boyd:
> > > Quoting Stefan Wahren (2022-09-14 10:45:48)
> > >> Am 14.09.22 um 17:50 schrieb Stephen Boyd:
> > >>> Furthermore, I wonder if even that part needs to be implemented.  W=
hy
> > >>> not make a direct call to rpi_firmware_property() and get the max r=
ate?
> > >>> All of that can live in the drm driver. Making it a generic API that
> > >>> takes a 'struct clk' means that it looks like any clk can be passed,
> > >>> when that isn't true. It would be better to restrict it to the one =
use
> > >>> case so that the scope of the problem doesn't grow. I understand th=
at it
> > >>> duplicates a few lines of code, but that looks like a fair tradeoff=
 vs.
> > >>> exposing an API that can be used for other clks in the future.
> > >> it would be nice to keep all the Rpi specific stuff out of the DRM
> > >> driver, since there more users of it.
> > > Instead of 'all' did you mean 'any'?
> > yes
>=20
> Another idea is to populate an OPP table in the rpi firmware driver for
> this platform device with the adjusted max frequency. That would be an
> SoC/firmware agnostic interface that expresses the constraints. I'm
> almost certain we talked about this before.

Yeah, that rings a bell too.

I found the thread:
https://lore.kernel.org/linux-clk/20220629092900.inpjgl7st33dwcak@houat/

Admittedly, I don't know the OPP stuff that well, but I was always under
the impression that it was to express the operating range of a device.
We're not quite in this case here, since we want to get the range of one
of the clock that feeds the device but might or might not affect the
frequency of the device itself.

I'm ok with your proposal to create a custom function in the firmware
driver though, and I don't believe it would be an obstacle to any board
we might upstream in the future that wouldn't have use the RPi firmware,
so I'll work on that.

Thanks!
Maxime

--cohslk2tp5ouqtkq
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABMIAB0WIQTXEe0+DlZaRlgM8LOIQ8rmN6G3ywUCYyL2iAAKCRCIQ8rmN6G3
y5uhAP9aDhPjrMOhLevmYWWSADNr2THfUSCVC8ereIs5u7/VtgD+MOROIPNhAcP7
6CWkpUKG+RJncxWL1BzgCyU4dC87I6M=
=vFIC
-----END PGP SIGNATURE-----

--cohslk2tp5ouqtkq--
