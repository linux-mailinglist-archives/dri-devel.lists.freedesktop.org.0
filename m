Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id BEFD32CDF7E
	for <lists+dri-devel@lfdr.de>; Thu,  3 Dec 2020 21:15:37 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 568F36E038;
	Thu,  3 Dec 2020 20:15:34 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EF82A6EC1A
 for <dri-devel@lists.freedesktop.org>; Thu,  3 Dec 2020 20:15:32 +0000 (UTC)
Date: Thu, 3 Dec 2020 21:15:23 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1607026532;
 bh=sTLisENEUL1Kv4Gz8uUtUdHhZyPXG36W6EFw4wIEQvg=;
 h=From:To:Cc:Subject:References:In-Reply-To:From;
 b=ZSDST5lJb21dROcR57sKm7LwP0X3KrZicV4vjl4MnY8wyN/ah9rq2kHPfQb+7WGy/
 373wjhiEnu4m+vYcKQYuHQsu1NoFon76VbN9Q4RUvwpTGVeffdni9evz0J92DUxqna
 cU48ClV+lvqfmlPKcj3ZgaDxIoPeUZUqbUfCGolZlbnLaMG6HulC/UpYKpwVwW3os8
 QoLUXffxYDxpOVED+mN/erN5qz5B0a307VbLVQUsY9ksJERlmuQSHTq9TY3NzZysD4
 xs81xIrAFNVHnSMvYn08BD3hm8c7jpytk+QBXZGnJQVOhXc3R/bfu0+UZswvy/evtn
 MDUw1MTOmB8aQ==
From: Wolfram Sang <wsa@kernel.org>
To: Bjorn Andersson <bjorn.andersson@linaro.org>
Subject: Re: [PATCH] Revert "i2c: qcom-geni: Disable DMA processing on the
 Lenovo Yoga C630"
Message-ID: <20201203201523.GA3585@kunai>
Mail-Followup-To: Wolfram Sang <wsa@kernel.org>,
 Bjorn Andersson <bjorn.andersson@linaro.org>,
 Andy Gross <agross@kernel.org>,
 Akash Asthana <akashast@codeaurora.org>,
 Mukesh Savaliya <msavaliy@codeaurora.org>,
 Sumit Semwal <sumit.semwal@linaro.org>,
 Christian =?utf-8?B?S8O2bmln?= <christian.koenig@amd.com>,
 Steev Klimaszewski <steev@kali.org>,
 Shawn Guo <shawn.guo@linaro.org>, linux-arm-msm@vger.kernel.org,
 linux-i2c@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-media@vger.kernel.org, dri-devel@lists.freedesktop.org,
 linaro-mm-sig@lists.linaro.org
References: <20201124185743.401946-1-bjorn.andersson@linaro.org>
MIME-Version: 1.0
In-Reply-To: <20201124185743.401946-1-bjorn.andersson@linaro.org>
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
Cc: linaro-mm-sig@lists.linaro.org, linux-arm-msm@vger.kernel.org,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 Steev Klimaszewski <steev@kali.org>,
 Christian =?utf-8?B?S8O2bmln?= <christian.koenig@amd.com>,
 Akash Asthana <akashast@codeaurora.org>, Andy Gross <agross@kernel.org>,
 linux-i2c@vger.kernel.org, Mukesh Savaliya <msavaliy@codeaurora.org>,
 linux-media@vger.kernel.org
Content-Type: multipart/mixed; boundary="===============0351403585=="
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


--===============0351403585==
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="u3/rZRmxL6MmkK24"
Content-Disposition: inline


--u3/rZRmxL6MmkK24
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Nov 24, 2020 at 12:57:43PM -0600, Bjorn Andersson wrote:
> A combination of recent bug fixes by Doug Anderson and the proper
> definition of iommu streams means that this hack is no longer needed.
> Let's clean up the code by reverting '127068abe85b ("i2c: qcom-geni:
> Disable DMA processing on the Lenovo Yoga C630")'.
>=20
> Signed-off-by: Bjorn Andersson <bjorn.andersson@linaro.org>
> ---

Added another ack from Caleb and applied to for-next, thanks!


--u3/rZRmxL6MmkK24
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAl/JR1cACgkQFA3kzBSg
Kbb+gg//Uss4phLY7CH1vEfZhKbhoLdilPpKsolr8PnK/C8XLY2X7Os1NS88WNJp
Y47uFbVlPeH03Y415omWj35uB9Rx95Oe1y5dwKcD/M8lBC6PZD0R9zXUswkuspZY
u3TzNmlTZfh9N/i2A0S3zJibePIdpfXe1H1LlMND/oFik/Kfi66aM+nPAVOAER46
y+I8peLv0fDKZ4moscpaZJQAGivsB75bNoB6II77Sit6Ip+Y8YR/RB7aOQ3rd572
FbyTYcvxyjsGfsEIGzH/uxR+39tJv62jmnSK7n2CxBhEYKvjVv8Qm4tmhumjgYdm
SXOZ+TeHhU/ecp6crtIT53KiGC//uMqry3hXnloZ0IOkMlPB92Mp6F5E32SwWvtY
sEZjLDchVsDFcKoj6Ya7JuuT33736fW426BwKQEbUXpC3QMnLC1gDjwYotmRBEG1
CxzSjsVzaRFsDY5fzmmggx74gHQ2Cat6HbrvpgensnHX46o3SsPt4vB0eKHvtDJ4
oDCtKh2xURGJzq3CneR9qFSDtTvUmMrF/MxIpTw5GaWfp3O+GXgIAMkZsFQYR4YN
rTJlLRmhyoJfxHDwJarGeI6A1RK+1RWJ8UpKItZ6C8aAZALpBKVDnaAEWnUxfiMh
6CxWnINqceXPu9fo6mi5ZTwpuVMXautJ5Y2vr4bWkecXgOdJHMg=
=Uqhs
-----END PGP SIGNATURE-----

--u3/rZRmxL6MmkK24--

--===============0351403585==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel

--===============0351403585==--
