Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 367D8978615
	for <lists+dri-devel@lfdr.de>; Fri, 13 Sep 2024 18:47:53 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AD39510EC8A;
	Fri, 13 Sep 2024 16:47:50 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="dxp3WfnE";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from nyc.source.kernel.org (nyc.source.kernel.org [147.75.193.91])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E998510EC8A
 for <dri-devel@lists.freedesktop.org>; Fri, 13 Sep 2024 16:47:49 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by nyc.source.kernel.org (Postfix) with ESMTP id 2A3A8A456CB;
 Fri, 13 Sep 2024 16:47:41 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 331EBC4CEC0;
 Fri, 13 Sep 2024 16:47:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1726246068;
 bh=u5+27xyUUOfs9JlsXpfN9e9YD2zu86QlM9sNV0ZIPIs=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=dxp3WfnEec3z+Qchn+RvKHnza6/Hd4uDbbnNLerZze1hvLkeiDERjv7JNPfYXMTxB
 +yG0urQnyu1DGsT6N96ZYFogXCsf8vCxMHJz2AmbL7uWO9AYnat8RjV9ZRrxpyd/jB
 I7UdijVMgYL6yyQ9rdOqmqQ9Wr2qvbwlRAGZNw27Z1WaL/Lm3Lus+q6bJ2dBqTlFMQ
 ith8yad7QZFl49dI9nKDsriqsuhifcF1gqEjnNPWNFpdkHI7C6XOzA7ijcBblDRW9s
 pTDf4jG85eiowyGp7EFgovmeIki1pSyssjiMGhONgjuRyePS8bf7DPKQZzU4eYsv/q
 +WL06gHoXA3ew==
Date: Fri, 13 Sep 2024 17:47:40 +0100
From: Conor Dooley <conor@kernel.org>
To: Dzmitry Sankouski <dsankouski@gmail.com>
Cc: Krzysztof Kozlowski <krzk@kernel.org>, Sebastian Reichel <sre@kernel.org>,
 Bjorn Andersson <andersson@kernel.org>,
 Michael Turquette <mturquette@baylibre.com>,
 Stephen Boyd <sboyd@kernel.org>,
 Neil Armstrong <neil.armstrong@linaro.org>,
 Jessica Zhang <quic_jesszhan@quicinc.com>, Sam Ravnborg <sam@ravnborg.org>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>,
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Lee Jones <lee@kernel.org>,
 Dmitry Torokhov <dmitry.torokhov@gmail.com>,
 Pavel Machek <pavel@ucw.cz>, Liam Girdwood <lgirdwood@gmail.com>,
 Mark Brown <broonie@kernel.org>,
 Uwe =?iso-8859-1?Q?Kleine-K=F6nig?= <ukleinek@kernel.org>,
 Konrad Dybcio <konrad.dybcio@linaro.org>,
 Chanwoo Choi <cw00.choi@samsung.com>, phone-devel@vger.kernel.org,
 linux-pm@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
 dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org,
 linux-input@vger.kernel.org, linux-leds@vger.kernel.org,
 linux-pwm@vger.kernel.org, linux-samsung-soc@vger.kernel.org
Subject: Re: [PATCH v3 04/23] dt-bindings: mfd: add maxim,max77705
Message-ID: <20240913-platter-reset-2ec8d7c7295a@spud>
References: <20240618-starqltechn_integration_upstream-v3-0-e3f6662017ac@gmail.com>
 <20240618-starqltechn_integration_upstream-v3-4-e3f6662017ac@gmail.com>
 <13a650f4-7ca7-4c95-b536-9814a22f00ff@kernel.org>
 <CABTCjFCOTd5V5WyRbD1OCS9Hatk0mOCtNy5WWfp0KkUBgqXs+A@mail.gmail.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="ye/AKZ4nM3H9W2aP"
Content-Disposition: inline
In-Reply-To: <CABTCjFCOTd5V5WyRbD1OCS9Hatk0mOCtNy5WWfp0KkUBgqXs+A@mail.gmail.com>
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


--ye/AKZ4nM3H9W2aP
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, Sep 13, 2024 at 05:51:56PM +0300, Dzmitry Sankouski wrote:
> =D1=87=D1=82, 20 =D0=B8=D1=8E=D0=BD. 2024=E2=80=AF=D0=B3. =D0=B2 18:46, K=
rzysztof Kozlowski <krzk@kernel.org>:
> >
> > On 18/06/2024 15:59, Dzmitry Sankouski wrote:
> > > maxim,max77705 is MAX77705 pmic binding part
> > >
> > > Signed-off-by: Dzmitry Sankouski <dsankouski@gmail.com>
> > > ---
> > >  .../devicetree/bindings/mfd/maxim,max77705.yaml    | 112 +++++++++++=
++++++++++
> >
> > Your patch order is totally messed. Not tested by automation. Only
> > limited review follows.
> >
> Hmm, not sure what was wrong. I sent version 4 to myself with `b4 send
> --reflect`, the order looks good.

I suspect that the order that he is referring to is not what you think,
and that the patches do appear in the order to him that they did to you,
but that order you committed changes is likely not bisectable due
dependencies coming after their users.

--ye/AKZ4nM3H9W2aP
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCZuRsrAAKCRB4tDGHoIJi
0sARAP9HtB47ae3VUBdcqtRSXtfh9F/QtUAtZQYTV93JLHGAvwEAgE6iBhZNSP8y
/bl7XakNdZvek3z1WJ6OStgIn8KeBQ4=
=yLFY
-----END PGP SIGNATURE-----

--ye/AKZ4nM3H9W2aP--
