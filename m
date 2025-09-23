Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 38961B9522D
	for <lists+dri-devel@lfdr.de>; Tue, 23 Sep 2025 11:07:45 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8E9E410E5B6;
	Tue, 23 Sep 2025 09:07:43 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="q3m+U6KH";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from tor.source.kernel.org (tor.source.kernel.org [172.105.4.254])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6191E10E5B6
 for <dri-devel@lists.freedesktop.org>; Tue, 23 Sep 2025 09:07:42 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by tor.source.kernel.org (Postfix) with ESMTP id 77CBE60280;
 Tue, 23 Sep 2025 09:07:41 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id ADF76C116B1;
 Tue, 23 Sep 2025 09:07:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1758618461;
 bh=kkCA8SAuPlhfPf3erMCajqMN5ix6aRl7bFBdFcZEqRM=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=q3m+U6KH9WiE7acahlltWpsy+84oMewDE/TQ5owV4ijWPp5icWn03RwVcgUjBc5gS
 zXTUDNGiHIbCrbV9C/iYOeNGz+M5m+BGWUKgHcgqvv+2CaTkbDZWIDq0WK2sLlOxCE
 04yk/Pq7o+L4cbjk8HtcVEYXpt+N5+caHnL1x8r5637Ith7QRC0JdwIcHlYLwobVwe
 IYN9qboRdoRAb5DO5lcPXnQF1CHt0GCSThptzuNU91oOFv6Q+R543hdrSjlgilb6kk
 Rw9QTdfe0ovaIqYnaLZWrp8YFhj3KlVeQtqH/vCyGPkiJ4b/auE+cDvm3tcNEhMsfJ
 muJVgYi9XANYQ==
Date: Tue, 23 Sep 2025 11:07:38 +0200
From: Maxime Ripard <mripard@kernel.org>
To: Kevin Hilman <khilman@kernel.org>
Cc: Michael Walle <mwalle@kernel.org>, 
 Frank Binns <frank.binns@imgtec.com>, Matt Coster <matt.coster@imgtec.com>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Thomas Zimmermann <tzimmermann@suse.de>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>,
 Nishanth Menon <nm@ti.com>, 
 Vignesh Raghavendra <vigneshr@ti.com>, Tero Kristo <kristo@kernel.org>, 
 Santosh Shilimkar <ssantosh@kernel.org>,
 Michael Turquette <mturquette@baylibre.com>, 
 Stephen Boyd <sboyd@kernel.org>, Andrew Davis <afd@ti.com>,
 dri-devel@lists.freedesktop.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-clk@vger.kernel.org
Subject: Re: [PATCH 2/3] clk: keystone: don't cache clock rate
Message-ID: <20250923-brave-zebu-of-growth-a6426b@penduick>
References: <20250915143440.2362812-1-mwalle@kernel.org>
 <20250915143440.2362812-3-mwalle@kernel.org>
 <7hv7lhp0e8.fsf@baylibre.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha384;
 protocol="application/pgp-signature"; boundary="3iw34lfkiliihfo7"
Content-Disposition: inline
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


--3iw34lfkiliihfo7
Content-Type: text/plain; protected-headers=v1; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
Subject: Re: [PATCH 2/3] clk: keystone: don't cache clock rate
MIME-Version: 1.0

On Wed, Sep 17, 2025 at 08:24:47AM -0700, Kevin Hilman wrote:
> Michael Walle <mwalle@kernel.org> writes:
>=20
> > The TISCI firmware will return 0 if the clock or consumer is not
> > enabled although there is a stored value in the firmware. IOW a call to
> > set rate will work but at get rate will always return 0 if the clock is
> > disabled.
> > The clk framework will try to cache the clock rate when it's requested
> > by a consumer. If the clock or consumer is not enabled at that point,
> > the cached value is 0, which is wrong.
>=20
> Hmm, it also seems wrong to me that the clock framework would cache a
> clock rate when it's disabled.  On platforms with clocks that may have
> shared management (eg. TISCI or other platforms using SCMI) it's
> entirely possible that when Linux has disabled a clock, some other
> entity may have changed it.

It doesn't really help that the CCF doesn't seem to agree on if it
should do that in the first place :)

In the original clk API definition, you're not supposed to call
clk_get_rate() when the clock is disabled.

https://elixir.bootlin.com/linux/v6.16.8/source/include/linux/clk.h#L746

However, it's been allowed by the CCF since forever:

https://elixir.bootlin.com/linux/v6.16.8/source/drivers/clk/clk.c#L1986

But then, some drivers will return 0 as a valid value, and not an error
code (whatever 0Hz for a clock means).

It's kind of a mess, and very regression prone, so I don't really expect
it to change anytime soon.

Maxime

--3iw34lfkiliihfo7
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iJUEABMJAB0WIQTkHFbLp4ejekA/qfgnX84Zoj2+dgUCaNJjVAAKCRAnX84Zoj2+
ds0nAX9cnO1qMu1gRrt93wqZ3E7heejWdZkXiLTOlsXu2u9hW0VAjJeUYt9/k6vh
40iU+joBf0oNZk2TNHK5NY8d4PR+uru6sGDJqMFK0BBGGGWdlzNH5mgiIfgwVMdV
1rDRIy6m2g==
=8+3Q
-----END PGP SIGNATURE-----

--3iw34lfkiliihfo7--
