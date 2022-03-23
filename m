Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 315C64E4EB0
	for <lists+dri-devel@lfdr.de>; Wed, 23 Mar 2022 09:51:52 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 839DA10E59B;
	Wed, 23 Mar 2022 08:51:48 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from wout5-smtp.messagingengine.com (wout5-smtp.messagingengine.com
 [64.147.123.21])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3B17410E59B
 for <dri-devel@lists.freedesktop.org>; Wed, 23 Mar 2022 08:51:46 +0000 (UTC)
Received: from compute2.internal (compute2.nyi.internal [10.202.2.46])
 by mailout.west.internal (Postfix) with ESMTP id 0B0FC3200C4A;
 Wed, 23 Mar 2022 04:51:43 -0400 (EDT)
Received: from mailfrontend1 ([10.202.2.162])
 by compute2.internal (MEProxy); Wed, 23 Mar 2022 04:51:44 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cerno.tech; h=cc
 :cc:content-type:date:date:from:from:in-reply-to:in-reply-to
 :message-id:mime-version:references:reply-to:sender:subject
 :subject:to:to; s=fm3; bh=F9M2I+3m5383hh01Q4rw+Q7eh2cWbcFSUcjzbo
 ebKQE=; b=zJVdHWUg9SmFe9vt/aJgAUICqpCYrHT7IYBjVYIs10QpE4V5ITHkPS
 X5Xb8lXHj1ie6x1zSkq3+//NkOkzWd0MutXF7ThRQGZXXpUuwG0IMN4BSnxk35Vg
 LfdG+nD/A96s+l95aIdyuP5vLi2a4fm7wPK2i1rZSF5aR5G9K8nLR8U3hszkwoiY
 kTpZT4XZ3qhr1dSdSB5j2s6A361eYOUWPKhTD00ANxWpfAU5vPWdq/Qyw0RL3I4k
 hogvVYUmk2IkrXYSODTQ+t6a3W7JltXNhrBbElfxLgniA8lrM3PM6s+oaICmpY/T
 BOxlIKMXAWimI/cjqI/X1iZBOIPPJaiA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:cc:content-type:date:date:from:from
 :in-reply-to:in-reply-to:message-id:mime-version:references
 :reply-to:sender:subject:subject:to:to:x-me-proxy:x-me-proxy
 :x-me-sender:x-me-sender:x-sasl-enc; s=fm3; bh=F9M2I+3m5383hh01Q
 4rw+Q7eh2cWbcFSUcjzboebKQE=; b=Hmf9vAgJL1q7x0VUnmDwc0tHtwpybeKJh
 nxOtKUOa1NoTQ/SJr+4jG60UP2qi49N8KO9IOzCLN3gj7NL4T3e5V9nSvkBPIt75
 fJs8/xGK5MiK0I7Ki0yo5ki/omJOaQ+jmOlfHtIRTS9wVGr/z09mSjleUG+tnLrY
 wKh+LDN0k549v43qBeYlR06/kl/cOrHKgwssxr4i5VwFY6o5UJio/zzuQvh79WDT
 NMOV2bShWt18yH7s98jMKiMYejP/l+5D1YaOQyevfiNCztpt/5pOEHySpqme3kLL
 GofxnKhj1mbAUAODBMwf8Y4L7VkrpWSVSSC0tsxem3/A2iUmqXQVQ==
X-ME-Sender: <xms:n986YpAJzcgsibHiBn4mTn1DA9fmaCjNOeOcGaLgMWMyVm6ea6OX8g>
 <xme:n986YniOmq4dwsg9Zd39bQqGoCr45rHIyx5lgueoVEI9GN_oyuafa7imV_lNVrAT5
 0NEFCd22jfFGFPF48s>
X-ME-Received: <xmr:n986YknRzpFum28ukV52a3fBdEvQ0bS0KppKu3FXZ0gf0Vo4YgpOd9onsy9yLvjoKcnzWqhHnycTvRzM7Fve9RD6qKRbVVHGqT0uwbg>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvvddrudegiedguddvfecutefuodetggdotefrod
 ftvfcurfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfgh
 necuuegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmd
 enucfjughrpeffhffvuffkfhggtggujgesghdtreertddtvdenucfhrhhomhepofgrgihi
 mhgvucftihhprghrugcuoehmrgigihhmvgestggvrhhnohdrthgvtghhqeenucggtffrrg
 htthgvrhhnpeduhedugeelgeegieetheekteegudfffeeuudfhuefhudeihfelheelheef
 hfehleenucffohhmrghinhepkhgvrhhnvghlrdhorhhgpdgsohhothhlihhnrdgtohhmne
 cuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehmrghilhhfrhhomhepmhgrgihi
 mhgvsegtvghrnhhordhtvggthh
X-ME-Proxy: <xmx:n986YjweRmdAm-IhElpeqZHwIQfFkHjqgHWSI49mqRml2TaqQqD0TQ>
 <xmx:n986YuSLmBuYrYqwQgEviDV_ryFhuaHFJbUVfTbXwWFNI909zHXSiw>
 <xmx:n986YmYEufxUy13E0HvzHbYih1uO7qEWCWNNjLM9EQ7Vf1ULbqWfig>
 <xmx:n986YhGe6A-DDNi9KvJEKRYc53buZpSte5_ycVitwDA33QSMX_vY9w>
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Wed,
 23 Mar 2022 04:51:42 -0400 (EDT)
Date: Wed, 23 Mar 2022 09:51:40 +0100
From: Maxime Ripard <maxime@cerno.tech>
To: Dmitry Osipenko <dmitry.osipenko@collabora.com>
Subject: Re: [PATCH v7 06/12] clk: Always set the rate on clk_set_range_rate
Message-ID: <20220323085140.ifeclmttkrqo55ru@houat>
References: <20220225143534.405820-1-maxime@cerno.tech>
 <20220225143534.405820-7-maxime@cerno.tech>
 <7720158d-10a7-a17b-73a4-a8615c9c6d5c@collabora.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
 protocol="application/pgp-signature"; boundary="cicq5zfd5kk2y3zt"
Content-Disposition: inline
In-Reply-To: <7720158d-10a7-a17b-73a4-a8615c9c6d5c@collabora.com>
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
Cc: Dom Cobley <dom@raspberrypi.com>, Tim Gover <tim.gover@raspberrypi.com>,
 Dave Stevenson <dave.stevenson@raspberrypi.com>,
 Stephen Boyd <sboyd@kernel.org>, Mike Turquette <mturquette@baylibre.com>,
 dri-devel@lists.freedesktop.org, linux-clk@vger.kernel.org,
 linux-tegra@vger.kernel.org, Phil Elwell <phil@raspberrypi.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


--cicq5zfd5kk2y3zt
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi,

On Tue, Mar 22, 2022 at 10:05:56PM +0300, Dmitry Osipenko wrote:
> On 2/25/22 17:35, Maxime Ripard wrote:
> > When we change a clock minimum or maximum using clk_set_rate_range(),
> > clk_set_min_rate() or clk_set_max_rate(), the current code will only
> > trigger a new rate change if the rate is outside of the new boundaries.
> >=20
> > However, a clock driver might want to always keep the clock rate to
> > one of its boundary, for example the minimum to keep the power
> > consumption as low as possible.
> >=20
> > Since they don't always get called though, clock providers don't have t=
he
> > opportunity to implement this behaviour.
> >=20
> > Let's trigger a clk_set_rate() on the previous requested rate every time
> > clk_set_rate_range() is called. That way, providers that care about the
> > new boundaries have a chance to adjust the rate, while providers that
> > don't care about those new boundaries will return the same rate than
> > before, which will be ignored by clk_set_rate() and won't result in a
> > new rate change.
> >=20
> > Suggested-by: Stephen Boyd <sboyd@kernel.org>
> > Signed-off-by: Maxime Ripard <maxime@cerno.tech>
> > ---
> >  drivers/clk/clk.c      | 45 ++++++++++++++++----------------
> >  drivers/clk/clk_test.c | 58 +++++++++++++++++++-----------------------
> >  2 files changed, 49 insertions(+), 54 deletions(-)
> >=20
> > diff --git a/drivers/clk/clk.c b/drivers/clk/clk.c
> > index c15ee5070f52..9bc8bf434b94 100644
> > --- a/drivers/clk/clk.c
> > +++ b/drivers/clk/clk.c
> > @@ -2373,28 +2373,29 @@ int clk_set_rate_range(struct clk *clk, unsigne=
d long min, unsigned long max)
> >  		goto out;
> >  	}
> > =20
> > -	rate =3D clk_core_get_rate_nolock(clk->core);
> > -	if (rate < min || rate > max) {
> > -		/*
> > -		 * FIXME:
> > -		 * We are in bit of trouble here, current rate is outside the
> > -		 * the requested range. We are going try to request appropriate
> > -		 * range boundary but there is a catch. It may fail for the
> > -		 * usual reason (clock broken, clock protected, etc) but also
> > -		 * because:
> > -		 * - round_rate() was not favorable and fell on the wrong
> > -		 *   side of the boundary
> > -		 * - the determine_rate() callback does not really check for
> > -		 *   this corner case when determining the rate
> > -		 */
> > -
> > -		rate =3D clamp(clk->core->req_rate, min, max);
> > -		ret =3D clk_core_set_rate_nolock(clk->core, rate);
> > -		if (ret) {
> > -			/* rollback the changes */
> > -			clk->min_rate =3D old_min;
> > -			clk->max_rate =3D old_max;
> > -		}
> > +	/*
> > +	 * Since the boundaries have been changed, let's give the
> > +	 * opportunity to the provider to adjust the clock rate based on
> > +	 * the new boundaries.
> > +	 *
> > +	 * We also need to handle the case where the clock is currently
> > +	 * outside of the boundaries. Clamping the last requested rate
> > +	 * to the current minimum and maximum will also handle this.
> > +	 *
> > +	 * FIXME:
> > +	 * There is a catch. It may fail for the usual reason (clock
> > +	 * broken, clock protected, etc) but also because:
> > +	 * - round_rate() was not favorable and fell on the wrong
> > +	 *   side of the boundary
> > +	 * - the determine_rate() callback does not really check for
> > +	 *   this corner case when determining the rate
> > +	 */
> > +	rate =3D clamp(clk->core->req_rate, min, max);
> > +	ret =3D clk_core_set_rate_nolock(clk->core, rate);
> > +	if (ret) {
> > +		/* rollback the changes */
> > +		clk->min_rate =3D old_min;
> > +		clk->max_rate =3D old_max;
> >  	}
> > =20
> >  out:
>
> NVIDIA Tegra30 no longer boots with this change.
>=20
> You can't assume that rate was requested by clk_set_rate() before
> clk_set_rate_range() is called, see what [1] does.

We don't, and it would be bad indeed.

We even have (multiple) tests to cover that case:
https://git.kernel.org/pub/scm/linux/kernel/git/clk/linux.git/tree/drivers/=
clk/clk_test.c?h=3Dclk-range&id=3Da9b269310ad9abb2f206fe814fd3afcadddce3aa#=
n242

> T30 memory rate now drops to min on boot when clk debug range is
> inited innocuously and CPU no longer can make any progress because
> display controller takes out whole memory bandwidth.
>=20
> [1]
> https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git/tree/=
drivers/memory/tegra/tegra30-emc.c#n1437
>=20
> If clk_set_rate() wasn't ever invoked and req_rate=3D0, then you must not
> change the clk rate if it's within the new range. Please revert this
> patch, thanks.

The whole point of this patch is to give an opportunity to every driver
to change the rate whenever the boundaries have changed, so we very much
want to have the option to change it if clk_set_rate() has never been
called.

However, I think the issue is why req_rate would be 0 in the first
place?

req_rate is initialized to what recalc_rate returns:
https://elixir.bootlin.com/linux/latest/source/drivers/clk/clk.c#L3607

So the case where req_rate is 0 shouldn't occur unless you had an
explicit clk_set_rate to 0, or if your clock was orphaned at some point.

Judging from the code, it seems like the latter is the most plausible.
Indeed, __clk_core_init() will set req_rate to 0 if the clock is
orphaned (just like rate and accuracy), and
clk_core_reparent_orphans_nolock will be in charge of updating them when
the clock is no longer an orphan.

However, clk_core_reparent_orphans_nolock() will update rate by calling
__clk_recalc_rate and accuracy by calling __clk_recalc_accuracies, but
it never sets req_rate.

I'm not sure if this is the right patch, Stephen will tell, but could
you test:

------------------------ >8 ------------------------

diff --git a/drivers/clk/clk.c b/drivers/clk/clk.c
index 9bc8bf434b94..c43340afedee 100644
--- a/drivers/clk/clk.c
+++ b/drivers/clk/clk.c
@@ -3479,6 +3479,7 @@ static void clk_core_reparent_orphans_nolock(void)
 			__clk_set_parent_after(orphan, parent, NULL);
 			__clk_recalc_accuracies(orphan);
 			__clk_recalc_rates(orphan, 0);
+			orphan->req_rate =3D orphan->rate;
 		}
 	}
 }

------------------------ >8 ------------------------

Maxime

--cicq5zfd5kk2y3zt
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQRcEzekXsqa64kGDp7j7w1vZxhRxQUCYjrflwAKCRDj7w1vZxhR
xSfZAP9hSMfZjOdlobFqCwZaycsyt8eFvkcipSAJf5yuxXuzxwEAllH2qwBrezuC
5+HjlqOdhVrM+Lk9twk9YdX494m1KgY=
=j69K
-----END PGP SIGNATURE-----

--cicq5zfd5kk2y3zt--
