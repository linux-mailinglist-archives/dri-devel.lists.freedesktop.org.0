Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 04C4215D36E
	for <lists+dri-devel@lfdr.de>; Fri, 14 Feb 2020 09:08:33 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 823116EB4C;
	Fri, 14 Feb 2020 08:08:12 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from out1-smtp.messagingengine.com (out1-smtp.messagingengine.com
 [66.111.4.25])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 878A46E492
 for <dri-devel@lists.freedesktop.org>; Fri, 14 Feb 2020 07:52:28 +0000 (UTC)
Received: from compute3.internal (compute3.nyi.internal [10.202.2.43])
 by mailout.nyi.internal (Postfix) with ESMTP id C1F1722116;
 Fri, 14 Feb 2020 02:52:22 -0500 (EST)
Received: from mailfrontend1 ([10.202.2.162])
 by compute3.internal (MEProxy); Fri, 14 Feb 2020 02:52:22 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cerno.tech; h=
 date:from:to:cc:subject:message-id:references:mime-version
 :content-type:in-reply-to; s=fm2; bh=FfWukEscDXi4AiOAUwFnISerJNT
 2ulBjdIfmoaDjhfE=; b=Z38/5FwBT6wIDGSePzDRMo4642ClZld+yNMGR+vLRsU
 i//MH128GCl2EtPqPWssIZtyhUta6Lw3Wo4ML3zsXaYLjdgUh/xNqotb6ulJj7Oj
 ZaI7JPGJ+ZhcJbQaYrSqmPBJnCvTAc9I31cBKDM3KI9TbnyQaLrj1uRdyoKgPxqW
 x0bw+3KIkKsztIzi1aOFr0AzETpp/qhh7n6vPKg9cFeTIdGCkiO9Ew8fIZyq53HA
 yf4X4Q+pK2lLRYCakC52ZHY1WlQvtUC7hztnclpIBUZkSC41Rpw6V6A/rwWU9Zvx
 onXwUPrzr+SPawEUEPMRsNFwuEi4/ey4Emo9cFlVVkQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to:x-me-proxy
 :x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm2; bh=FfWukE
 scDXi4AiOAUwFnISerJNT2ulBjdIfmoaDjhfE=; b=NKi+uOWDuThMPIsLcRNOoE
 pS45sqNDvq/FkiQsUlp3x7GL3fXbid8Lf6Twi3KWAOqzQ2yS9bg/A5aJyLjn40Vl
 9rNx2u+tevyM+/VWRYMfC3uOCtMrpOnma/9u3fA9+nnGTGXUlC+fQUc1EtVfL7Q4
 hfZudf8aRpKr4J4NFoYNwgmMBKsfxnHG1MAzMF8ypK0E3Dl3KLkfpsLtB4kQ1a4K
 JqP6q/rxcVyWFVt5KmrCE4fdWwQXcARiWuHavWUGJbaWYcRcHGmxUELLuza0FoB+
 0u7Gek7FOTABf7sl+ud1ty6KqpCz8c2aDV+KTeHCuRLa/XoF/jDHiJtzs6anzAJQ
 ==
X-ME-Sender: <xms:tFFGXkpA1pzCRTjqvFgfaRva6i4lwuyCJbVIZvPMBCW62UBf7O6Qpg>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedugedrieelgdduudegucetufdoteggodetrfdotf
 fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
 uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
 cujfgurhepfffhvffukfhfgggtuggjsehgtderredttddvnecuhfhrohhmpeforgigihhm
 vgcutfhiphgrrhguuceomhgrgihimhgvsegtvghrnhhordhtvggthheqnecukfhppeeltd
 drkeelrdeikedrjeeinecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehmrghi
 lhhfrhhomhepmhgrgihimhgvsegtvghrnhhordhtvggthh
X-ME-Proxy: <xmx:tFFGXhNgSQ0iQpv9OGOEJ9A-R0hYHZn5-IGI6hKLnQkheCGLD25Dog>
 <xmx:tFFGXmqDL0f1yuNg8MzbGYMnPazFMFH-sSXv3mquJ4AAXF1GVu8bZA>
 <xmx:tFFGXsETKERymYp8JggfZEbg-xP5EPPbomwoGFk_1eJd_c6aTPK4HQ>
 <xmx:tlFGXpbe3nccuQN2oSfBiDUIqwk5IRAeB6NPDoZmwGd0H_qTP64QSg>
Received: from localhost (lfbn-tou-1-1502-76.w90-89.abo.wanadoo.fr
 [90.89.68.76])
 by mail.messagingengine.com (Postfix) with ESMTPA id 249683280066;
 Fri, 14 Feb 2020 02:52:20 -0500 (EST)
Date: Fri, 14 Feb 2020 08:52:18 +0100
From: Maxime Ripard <maxime@cerno.tech>
To: Andrey Lebedev <andrey.lebedev@gmail.com>
Subject: Re: [PATCH v2 2/2] ARM: sun7i: dts: Add LVDS panel support on A20
Message-ID: <20200214075218.huxdhmd4qfoakat2@gilmour.lan>
References: <20200210195633.GA21832@kedthinkpad>
 <20200212222355.17141-2-andrey.lebedev@gmail.com>
 <20200213094304.hf3glhgmquypxpyf@gilmour.lan>
 <20200213200823.GA28336@kedthinkpad>
MIME-Version: 1.0
In-Reply-To: <20200213200823.GA28336@kedthinkpad>
X-Mailman-Approved-At: Fri, 14 Feb 2020 08:07:58 +0000
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
Cc: airlied@linux.ie, linux-sunxi@googlegroups.com,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 Andrey Lebedev <andrey@lebedev.lt>, wens@csie.org,
 linux-arm-kernel@lists.infradead.org
Content-Type: multipart/mixed; boundary="===============1809700687=="
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


--===============1809700687==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="x5jathax6z2l7lsv"
Content-Disposition: inline


--x5jathax6z2l7lsv
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi,

On Thu, Feb 13, 2020 at 10:08:23PM +0200, Andrey Lebedev wrote:
> On Thu, Feb 13, 2020 at 10:43:04AM +0100, Maxime Ripard wrote:
> > On Thu, Feb 13, 2020 at 12:23:57AM +0200, andrey.lebedev@gmail.com wrote:
> > > From: Andrey Lebedev <andrey@lebedev.lt>
> > >
> > > Define pins for LVDS channels 0 and 1, configure reset line for tcon0 and
> > > provide sample LVDS panel, connected to tcon0.
> > >
> > > Signed-off-by: Andrey Lebedev <andrey@lebedev.lt>
> >
> > And this prefix should be ARM: dts: sun7i ;)
>
> Ah, thanks, I think I've got the pattern now!
>
> > > +			/omit-if-no-ref/
> > > +			lcd_lvds0_pins: lcd_lvds0_pins {
> >
> > underscores in the node names will create a dtc warning at
> > compilation, you should use lcd-lvds0-pins instead.

It's silenced by default, but you'll get them with W=1

> You're right, I wasn't following the naming convention here. dtc doesn't
> produce any warning on this though. Fixed that anyway.
>
> > This will create a spurious warning message for TCON1, since we
> > adjusted the driver to tell it supports LVDS, but there's no LVDS
> > reset line, so we need to make it finer grained.
>
> Yes, I can attribute two of the messages in my dmesg log [1] to this
> ("Missing LVDS properties" and "LVDS output disabled". "sun4i-tcon
> 1c0d000.lcd-controller" is indeed tcon1). And yes, I can see how they
> can be confusing to someone.
>
> I'd need some pointers on how to deal with that though (if we want to do
> it in this scope).

Like I was mentionning, you could introduce a new compatible for each
TCON (tcon0 and tcon1) and only set the support_lvds flag for tcon0

Maxime

--x5jathax6z2l7lsv
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRcEzekXsqa64kGDp7j7w1vZxhRxQUCXkZRsgAKCRDj7w1vZxhR
xVn9AP0VqLi8/MHY79s8QWyp+/otjpGvsgLBU2Zk6DQhh8ltugD+NXF9PEFDFa8/
e3b3qvGzp/u5wrJVKi3rJiHrzi/5OAM=
=c3MI
-----END PGP SIGNATURE-----

--x5jathax6z2l7lsv--

--===============1809700687==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel

--===============1809700687==--
