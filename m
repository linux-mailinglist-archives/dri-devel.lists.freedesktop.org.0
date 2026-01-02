Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 9C8D4CEDFE9
	for <lists+dri-devel@lfdr.de>; Fri, 02 Jan 2026 08:55:22 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8D96410E055;
	Fri,  2 Jan 2026 07:55:19 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="NdgqqMWX";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from sea.source.kernel.org (sea.source.kernel.org [172.234.252.31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9461A10E055
 for <dri-devel@lists.freedesktop.org>; Fri,  2 Jan 2026 07:55:18 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sea.source.kernel.org (Postfix) with ESMTP id 2C74344273;
 Fri,  2 Jan 2026 07:55:18 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7F83AC116B1;
 Fri,  2 Jan 2026 07:55:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1767340518;
 bh=pOnKyluOFkW2N+u900uU1w6ot1ZQJr+Jq/KOEnjgfZU=;
 h=Date:Subject:Cc:From:To:References:In-Reply-To:From;
 b=NdgqqMWXvqkjNpDjD8aQSm+E5nZXDdEbJTJ1qQ5erI4m+6RsR4CQ32EKznn+4kSXV
 aY56PD7oxNvBUOr6ZUwhqe3nfj93uX+zsZrPsM2pR34X9GHZf31J5/Akb7ZHgR4UBK
 XTx8D2836y/iG0zXPKBArfeBjG0oBjuX9UkkLhOpxqRT2pJf7atCZA8xD2EWtRAXBx
 I/0VbIgMmSkNOoBe5H6StvBs6oZIEd9vqIK5US1EyifRP3D/WkpQYCa/Q57BDTWPzy
 MgYf8L4uXhj2N5DPwTPBpzmKxXoGdWPCF9+KMFCQ5oyya29ZLm/HcI/0nCu+BYm6j0
 QfueNXF+FND+A==
Mime-Version: 1.0
Content-Type: multipart/signed;
 boundary=1b07cf6eaa5d19226fd67d51c3e66b8bf06a0a75186b45da8bdf50e1e5cb;
 micalg=pgp-sha384; protocol="application/pgp-signature"
Date: Fri, 02 Jan 2026 08:55:13 +0100
Message-Id: <DFDXXBFG13CK.385K2HM9FOWS6@kernel.org>
Subject: Re: [PATCH v2 2/4] clk: keystone: don't cache clock rate
Cc: "Frank Binns" <frank.binns@imgtec.com>, "Matt Coster"
 <matt.coster@imgtec.com>, "Maarten Lankhorst"
 <maarten.lankhorst@linux.intel.com>, "Maxime Ripard" <mripard@kernel.org>,
 "Thomas Zimmermann" <tzimmermann@suse.de>, "David Airlie"
 <airlied@gmail.com>, "Simona Vetter" <simona@ffwll.ch>, "Rob Herring"
 <robh@kernel.org>, "Krzysztof Kozlowski" <krzk+dt@kernel.org>, "Conor
 Dooley" <conor+dt@kernel.org>, "Vignesh Raghavendra" <vigneshr@ti.com>,
 "Tero Kristo" <kristo@kernel.org>, "Andrew Davis" <afd@ti.com>, "Santosh
 Shilimkar" <ssantosh@kernel.org>, "Michael Turquette"
 <mturquette@baylibre.com>, "Stephen Boyd" <sboyd@kernel.org>, "Kevin
 Hilman" <khilman@baylibre.com>, "Randolph Sapp" <rs@ti.com>,
 <linux-clk@vger.kernel.org>, <dri-devel@lists.freedesktop.org>,
 <devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
 <linux-arm-kernel@lists.infradead.org>
From: "Michael Walle" <mwalle@kernel.org>
To: "Nishanth Menon" <nm@ti.com>
X-Mailer: aerc 0.20.0
References: <20251223124729.2482877-1-mwalle@kernel.org>
 <20251223124729.2482877-3-mwalle@kernel.org>
 <20251230201233.n36d5fiensqyb6fc@splice>
In-Reply-To: <20251230201233.n36d5fiensqyb6fc@splice>
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

--1b07cf6eaa5d19226fd67d51c3e66b8bf06a0a75186b45da8bdf50e1e5cb
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8

On Tue Dec 30, 2025 at 9:12 PM CET, Nishanth Menon wrote:
> On 13:47-20251223, Michael Walle wrote:
>> The TISCI firmware will return 0 if the clock or consumer is not
>> enabled although there is a stored value in the firmware. IOW a call to
>> set rate will work but at get rate will always return 0 if the clock is
>> disabled.
>> The clk framework will try to cache the clock rate when it's requested
>> by a consumer. If the clock or consumer is not enabled at that point,
>> the cached value is 0, which is wrong. Thus, disable the cache
>> altogether.
>>=20
>> Signed-off-by: Michael Walle <mwalle@kernel.org>
>> Reviewed-by: Kevin Hilman <khilman@baylibre.com>
>> Reviewed-by: Randolph Sapp <rs@ti.com>
>> ---
>>  drivers/clk/keystone/sci-clk.c | 8 ++++++++
>>  1 file changed, 8 insertions(+)
>>=20
>> diff --git a/drivers/clk/keystone/sci-clk.c b/drivers/clk/keystone/sci-c=
lk.c
>> index 9d5071223f4c..0a1565fdbb3b 100644
>> --- a/drivers/clk/keystone/sci-clk.c
>> +++ b/drivers/clk/keystone/sci-clk.c
>> @@ -333,6 +333,14 @@ static int _sci_clk_build(struct sci_clk_provider *=
provider,
>> =20
>>  	init.ops =3D &sci_clk_ops;
>>  	init.num_parents =3D sci_clk->num_parents;
>> +
>> +	/*
>> +	 * A clock rate query to the SCI firmware will return 0 if either the
>> +	 * clock itself is disabled or the attached device/consumer is disable=
d.
>> +	 * This makes it inherently unsuitable for the caching of the clk
>> +	 * framework.
>> +	 */
>> +	init.flags =3D CLK_GET_RATE_NOCACHE;
>>  	sci_clk->hw.init =3D &init;
>> =20
>>  	ret =3D devm_clk_hw_register(provider->dev, &sci_clk->hw);
>> --=20
>> 2.47.3
>>=20
>
> Reviewed-by: Nishanth Menon <nm@ti.com>
>
> I wish there was a better scheme, but inherently, just like SCMI and
> other systems where power management co-processor controls clocks, there
> is no real feasible caching scheme I can think of. I wonder if Stephen
> or others have a thought on this?
>
> That said, I wonder if we need fixes tag to this? I am sure there are
> other clocks susceptible to this as well. I wonder if
> commit 3c13933c6033 ("clk: keystone: sci-clk: add support for
> dynamically probing clocks") is the appropriate tag?

From my previous versions of this patch:

> Regarding a Fixes: tag. I didn't include one because it might have a
> slight performance impact because the firmware has to be queried
> every time now and it doesn't have been a problem for now. OTOH I've
> enabled tracing during boot and there were just a handful
> clock_{get/set}_rate() calls.

I'm still undecided if this needs a Fixes tag or not. Strictly
speaking it would need one. Although, I'm not sure it's the one
you mentioned, because the culprit is the "we return 0 if the clock
or it's consumer is disabled", which then caches the wrong value.
So it is probably the very first commit b745c0794e2f ("clk:
keystone: Add sci-clk driver support").

-michael

--1b07cf6eaa5d19226fd67d51c3e66b8bf06a0a75186b45da8bdf50e1e5cb
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iKgEABMJADAWIQTIVZIcOo5wfU/AngkSJzzuPgIf+AUCaVd54hIcbXdhbGxlQGtl
cm5lbC5vcmcACgkQEic87j4CH/gcUQGAg2jdevhmzIo3MpxW/fmQhTzma7f+Pz6n
47sV9LU70CQ37MlbGTA2td+AP2lBAewMAYCpZT5T5yRgVP3N00Tn5GVG4Ag10GUP
WDnpYZrhnC6qDHRhIUdH2Nn1H0y4a99g1XY=
=VIxe
-----END PGP SIGNATURE-----

--1b07cf6eaa5d19226fd67d51c3e66b8bf06a0a75186b45da8bdf50e1e5cb--
