Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 946787881C4
	for <lists+dri-devel@lfdr.de>; Fri, 25 Aug 2023 10:14:05 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DE86610E62B;
	Fri, 25 Aug 2023 08:13:59 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 074ED10E62B
 for <dri-devel@lists.freedesktop.org>; Fri, 25 Aug 2023 08:13:58 +0000 (UTC)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 728ED66EEB;
 Fri, 25 Aug 2023 08:13:57 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 60304C433C8;
 Fri, 25 Aug 2023 08:13:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1692951236;
 bh=YVk25x/sSU7KEodueNZY7jdyqVwGHD8I8MTwcv0HBcY=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=jf5c9teWfTlMZp6cHwEiPogx9JME0pEgI1Vbwmam7Q1cOGt/82i3FwrEXwALY8pxA
 dAqlWhAZlzITVWqTD5hyFzs0j1Ipv4PEgRkcI38v8vAyE8im6SomovcAkG3BTnjOm1
 KoVjdE+zKmXXxoODTr4nSiQi5KTSGKXUsE0+Wly8Kbep68N13q7RVBPwmu9p5Azkoc
 9//5olSOeJEff5SzXXugigY2z2saBGCytS51glbKeggPr5lKvzc25w3j/LaU/7n8+5
 RI7Q9dr4GzUzT1fhP6KNTnOxZgvrZx3B5SMgg7wAJM+65RHpg/aHsaUN8cqu9BawgP
 HpGM73RZRKCyg==
Date: Fri, 25 Aug 2023 10:13:53 +0200
From: Maxime Ripard <mripard@kernel.org>
To: Frank Oltmanns <frank@oltmanns.dev>
Subject: Re: [PATCH 0/3] Make Allwinner A64's pll-mipi keep its rate when
 parent rate changes
Message-ID: <zrjpbtf7qwaj2tjvfz2no534tmz5j4yudp45tung2w5x2zcl6y@bal3bclzze4e>
References: <20230825-pll-mipi_keep_rate-v1-0-35bc43570730@oltmanns.dev>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
 protocol="application/pgp-signature"; boundary="eowkeu32rskmvnge"
Content-Disposition: inline
In-Reply-To: <20230825-pll-mipi_keep_rate-v1-0-35bc43570730@oltmanns.dev>
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
Cc: dri-devel@lists.freedesktop.org, Icenowy Zheng <uwu@icenowy.me>,
 Samuel Holland <samuel@sholland.org>, Stephen Boyd <sboyd@kernel.org>,
 Michael Turquette <mturquette@baylibre.com>, linux-kernel@vger.kernel.org,
 Jernej Skrabec <jernej.skrabec@gmail.com>, linux-sunxi@lists.linux.dev,
 Chen-Yu Tsai <wens@csie.org>, Ondrej Jirman <x@xnux.eu>,
 linux-clk@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 Icenowy Zheng <icenowy@aosc.io>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


--eowkeu32rskmvnge
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi,

On Fri, Aug 25, 2023 at 07:36:36AM +0200, Frank Oltmanns wrote:
> I would like to make the Allwinner A64's pll-mipi to keep its rate when
> its parent's (pll-video0) rate changes. Keeping pll-mipi's rate is
> required, to let the A64 drive both an LCD and HDMI display at the same
> time, because both have pll-video0 as an ancestor.
>=20
> PATCH 1 adds this functionality as a feature into the clk framework (new
> flag: CLK_KEEP_RATE).
>=20
> Cores that use this flag, store a rate as req_rate when it or one of its
> descendants requests a new rate.
>=20
> That rate is then restored in the clk_change_rate recursion, which walks
> through the tree. It will reach the flagged core (e.g. pll-mipi) after
> the parent's rate (e.g. pll-video0) has already been set to the new
> rate. It will then call determine_rate (which requests the parent's
> current, i.e. new, rate) to determine a rate that is close to the
> flagged core's previous rate. Afterward it will re-calculate the rates
> for the flagged core's subtree.

I don't think it's the right way forward. It makes the core logic more
complicated, for something that is redundant with the notifiers
mechanism that has been the go-to for that kind of things so far.

It's not really obvious to me why the notifiers don't work there.

> This work is inspired by an out-of-tree patchset [1] [2] [3].
> Unfortunately, the patchset uses clk_set_rate() in a notifier callback,
> which the following comment on clk_notifier_register() forbids: "The
> callbacks associated with the notifier must not re-enter into the clk
> framework by calling any top-level clk APIs." [4] Furthermore, that
> out-of-tree patchset no longer works with the current linux-next,
> because setting pll-mipi is now also resetting pll-video0 [5].

Is it because of the "The callbacks associated with the notifier must
not re-enter into the clk framework by calling any top-level clk APIs."
comment?

If so, I think the thing we should emphasize is that it's about *any
top-level clk API*, as in clk_set_rate() or clk_set_parent().

The issue is that any consumer-facing API is taking the clk_prepare lock
and thus we would have reentrancy. But we're a provider there, and none
of the clk_hw_* functions are taking that lock. Neither do our own function.

So we could call in that notifier our set_rate callback directly, or we
could create a clk_hw_set_rate() function.

The first one will create cache issue between the actual rate that the
common clock framework is running and the one we actually enforced, but
we could create a function to flush the CCF cache.

The second one is probably simpler.


Another option could be that we turn clk_set_rate_exclusive into
something more subtle that allows to change a parent rate as long as the
clock rate doesn't. It would ease the requirement that
clk_set_rate_exclusive() has on a clock subtree (which I think prevents
its usage to some extent), but I have no issue on how that would work in
practice.

So yeah, I think adding a clk_hw_set_rate() that would be callable from
a notifier is the right way forward there.

Maxime

--eowkeu32rskmvnge
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQRcEzekXsqa64kGDp7j7w1vZxhRxQUCZOhivQAKCRDj7w1vZxhR
xawrAQDXTz7ob5/J2vw49XyCzcbpbZrstccYpgBThY1SZyXjYwEA45sertGOozw2
pmFuwh+868GL2/YEUfeODgXdaZ4xTgs=
=exoj
-----END PGP SIGNATURE-----

--eowkeu32rskmvnge--
