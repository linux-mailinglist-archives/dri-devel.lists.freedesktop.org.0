Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id AC062B83E61
	for <lists+dri-devel@lfdr.de>; Thu, 18 Sep 2025 11:48:49 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4310810E68A;
	Thu, 18 Sep 2025 09:48:46 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="J2b4bvny";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from tor.source.kernel.org (tor.source.kernel.org [172.105.4.254])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0938910E68A
 for <dri-devel@lists.freedesktop.org>; Thu, 18 Sep 2025 09:48:44 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by tor.source.kernel.org (Postfix) with ESMTP id 3FFEC6013E;
 Thu, 18 Sep 2025 09:48:44 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7188FC4CEF1;
 Thu, 18 Sep 2025 09:48:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1758188923;
 bh=G6UtyHUyxSaifPv2pVQU3+E+zPh48AFOKmgPtR63JuY=;
 h=Date:From:To:Subject:Cc:References:In-Reply-To:From;
 b=J2b4bvnyCB1hOIq0nXuoaz4YXQ76vylR0qq8+ZZntww0EUcIRhx687K2XAdbMdTgr
 QeQtnxymNSkiun/Q3spIYBSNKEEmPm3qEy7jDuPQl7TjlGRtYqhK1X1Pvh7XjEe4pk
 E4xuBBs1RM/nBv1+c/vATpxZLzI55HDRO0oU0Z614tpBnWE3UDD1y1tx6GbbZmPqU6
 rmS00uFVndoqfgzG/GQZp1FNaaQjWCLdEaZpHhJoXmisC3ZerfslRUCjbJ4IVzB9Bc
 1jDxXIMKO40472hwo+RlGhlcqMY4LdO1830bAhfKVSGmCc4CfTIO7KVOfWeS0/JrJc
 KXWyjQ7VvXVGg==
Content-Type: multipart/signed;
 boundary=1fecadb09047536cf39b2c2fe88ea2cebdc9c9ca55c9ebcbd19b674ed89b;
 micalg=pgp-sha384; protocol="application/pgp-signature"
Date: Thu, 18 Sep 2025 11:48:34 +0200
Message-Id: <DCVTYCVUCXWH.LAMARC8K4UNU@kernel.org>
From: "Michael Walle" <mwalle@kernel.org>
To: "Kevin Hilman" <khilman@kernel.org>, "Frank Binns"
 <frank.binns@imgtec.com>, "Matt Coster" <matt.coster@imgtec.com>, "Maarten
 Lankhorst" <maarten.lankhorst@linux.intel.com>, "Maxime Ripard"
 <mripard@kernel.org>, "Thomas Zimmermann" <tzimmermann@suse.de>, "David
 Airlie" <airlied@gmail.com>, "Simona Vetter" <simona@ffwll.ch>, "Rob
 Herring" <robh@kernel.org>, "Krzysztof Kozlowski" <krzk+dt@kernel.org>,
 "Conor Dooley" <conor+dt@kernel.org>, "Nishanth Menon" <nm@ti.com>,
 "Vignesh Raghavendra" <vigneshr@ti.com>, "Tero Kristo" <kristo@kernel.org>,
 "Santosh Shilimkar" <ssantosh@kernel.org>, "Michael Turquette"
 <mturquette@baylibre.com>, "Stephen Boyd" <sboyd@kernel.org>
Subject: Re: [PATCH 2/3] clk: keystone: don't cache clock rate
Cc: "Andrew Davis" <afd@ti.com>, <dri-devel@lists.freedesktop.org>,
 <devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
 <linux-arm-kernel@lists.infradead.org>, <linux-clk@vger.kernel.org>
X-Mailer: aerc 0.16.0
References: <20250915143440.2362812-1-mwalle@kernel.org>
 <20250915143440.2362812-3-mwalle@kernel.org> <7hv7lhp0e8.fsf@baylibre.com>
In-Reply-To: <7hv7lhp0e8.fsf@baylibre.com>
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

--1fecadb09047536cf39b2c2fe88ea2cebdc9c9ca55c9ebcbd19b674ed89b
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8

On Wed Sep 17, 2025 at 5:24 PM CEST, Kevin Hilman wrote:
> Michael Walle <mwalle@kernel.org> writes:
>
> > The TISCI firmware will return 0 if the clock or consumer is not
> > enabled although there is a stored value in the firmware. IOW a call to
> > set rate will work but at get rate will always return 0 if the clock is
> > disabled.
> > The clk framework will try to cache the clock rate when it's requested
> > by a consumer. If the clock or consumer is not enabled at that point,
> > the cached value is 0, which is wrong.
>
> Hmm, it also seems wrong to me that the clock framework would cache a
> clock rate when it's disabled.  On platforms with clocks that may have
> shared management (eg. TISCI or other platforms using SCMI) it's
> entirely possible that when Linux has disabled a clock, some other
> entity may have changed it.
>
> Could another solution here be to have the clk framework only cache when
> clocks are enabled?

It's not just the clock which has to be enabled, but also it's
consumer. I.e. for this case, the GPU has to be enabled, until that
is the case the get_rate always returns 0. The clk framework already
has support for the runtime power management of the clock itself,
see for example clk_recalc().

> > Thus, disable the cache altogether.
> >
> > Signed-off-by: Michael Walle <mwalle@kernel.org>
> > ---
> > I guess to make it work correctly with the caching of the linux
> > subsystem a new flag to query the real clock rate is needed. That
> > way, one could also query the default value without having to turn
> > the clock and consumer on first. That can be retrofitted later and
> > the driver could query the firmware capabilities.
> >
> > Regarding a Fixes: tag. I didn't include one because it might have a
> > slight performance impact because the firmware has to be queried
> > every time now and it doesn't have been a problem for now. OTOH I've
> > enabled tracing during boot and there were just a handful
> > clock_{get/set}_rate() calls.
>
> The performance hit is not just about boot time, it's for *every*
> [get|set]_rate call.  Since TISCI is relatively slow (involves RPC,
> mailbox, etc. to remote core), this may have a performance impact
> elsewhere too.

Yes of course. I have just looked what happened during boot and
(short) after the boot. I haven't had any real application running,
though, so that's not representative.

> That being said, I'm hoping it's unlikely that
> [get|set]_rate calls are in the fast path.
>
> All of that being said, I think the impacts of this patch are pretty
> minimal, so I don't have any real objections.
>
> Reviewed-by: Kevin Hilman <khilman@baylibre.com>

Thanks!

-michael

--1fecadb09047536cf39b2c2fe88ea2cebdc9c9ca55c9ebcbd19b674ed89b
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iKgEABMJADAWIQTIVZIcOo5wfU/AngkSJzzuPgIf+AUCaMvVcxIcbXdhbGxlQGtl
cm5lbC5vcmcACgkQEic87j4CH/ieAwF+NhC0QChHEdPzBo2eq6c4gPSFFsfbpOZw
yyhFNhdMeM/qzGsGyod+WUxyFBlyK3JRAYDoKCAopPEvlQH6lpl7sfIGHzNEl+Ii
sNWwWzCJKZdbLMn4731FC8c/X9xYrCfTL8U=
=CEaS
-----END PGP SIGNATURE-----

--1fecadb09047536cf39b2c2fe88ea2cebdc9c9ca55c9ebcbd19b674ed89b--
