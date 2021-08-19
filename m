Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id E88833F1A3F
	for <lists+dri-devel@lfdr.de>; Thu, 19 Aug 2021 15:21:26 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DC60E6E932;
	Thu, 19 Aug 2021 13:21:20 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x436.google.com (mail-wr1-x436.google.com
 [IPv6:2a00:1450:4864:20::436])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C00506E932
 for <dri-devel@lists.freedesktop.org>; Thu, 19 Aug 2021 13:21:19 +0000 (UTC)
Received: by mail-wr1-x436.google.com with SMTP id u16so9117708wrn.5
 for <dri-devel@lists.freedesktop.org>; Thu, 19 Aug 2021 06:21:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to:user-agent;
 bh=xtcA0Q51Ab2gDUHvKWadMAS32FJIwcbf7uqdag4aFgw=;
 b=lz3AxdkSOdaxsff8Al6AfTWQciSBbKeqxN29m/KMRbWKXw4/fgyKk+WmJ3QyUOixzN
 4y+KG309qv8rkghhhHNRjVwzQahlcuEF8Doq0LiHQSzU/UrguSZVcFsLMmJayxgm0ij7
 DqTbzqfCmAxDcIkhQyStvyWV+ku8uSeeX7dE8YJzyIVUpP80wgthC25SMYweNXtTQxd2
 jUYpv3DiHYgCuk8SxMaErfJkgf/6GXvet2x/3DRJNApy/VuzLhZHOeod4kvyeZkQA9ku
 C/I1gCo8fSlZRTkrqgpt1DYoLIzTdJHzUmyJQGy3YGKvzsZRU31V8uTvRHxX3uAQWw49
 Yagw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=xtcA0Q51Ab2gDUHvKWadMAS32FJIwcbf7uqdag4aFgw=;
 b=hQ3UBn1etjzaGZM9MuRS2b/seN6qZOceFRtTulJ/O/Y7G+QRnKCWwLU7XA1yQo8k8w
 oUkQRvy64D7nb6Z46Da1C2efAyc7Rj/jJ1HjeCjN/HETjWO7Rn2jydhcq/M1QMAF4wOP
 IFSX9r1rxJAgNdXHaQsYYu6REl0a3BsWiP3SvOZq96RzKWvGp33FZdsYJrnZiC2mBmrz
 EiQMfZ89wI+mjwQa7my8VAdW+7FcoWmxxgWkdWzyv+Q5gDDtcDN6Pxq8Eovx/rRB3ld8
 K2T5AgMirGoCdE01vwecYkp6btgkUT9nwA4nc8EI+g2lEnR9XkS61hz+dzKn+HjkVbn1
 uH+Q==
X-Gm-Message-State: AOAM533PV9J39sWbcJAlLDp5xmhB7uUdutaraHFEuPmNp32jXbzykEqK
 j9j/rv7ioKzQYAha+zJrwKU=
X-Google-Smtp-Source: ABdhPJz39Bt2kVM50Mk8FByewEg3lcDVqz/jK/N/qbprIAZwm7opqauve4ARpLRYoIa5SH1Y+OoKXw==
X-Received: by 2002:a5d:4c87:: with SMTP id z7mr3961844wrs.284.1629379278262; 
 Thu, 19 Aug 2021 06:21:18 -0700 (PDT)
Received: from localhost ([217.111.27.204])
 by smtp.gmail.com with ESMTPSA id l17sm7319377wmq.44.2021.08.19.06.21.16
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 19 Aug 2021 06:21:16 -0700 (PDT)
Date: Thu, 19 Aug 2021 15:21:15 +0200
From: Thierry Reding <thierry.reding@gmail.com>
To: Dmitry Osipenko <digetx@gmail.com>
Cc: Jonathan Hunter <jonathanh@nvidia.com>,
 Ulf Hansson <ulf.hansson@linaro.org>,
 Viresh Kumar <vireshk@kernel.org>, Stephen Boyd <sboyd@kernel.org>,
 Peter De Schrijver <pdeschrijver@nvidia.com>,
 Mikko Perttunen <mperttunen@nvidia.com>,
 Peter Chen <peter.chen@kernel.org>, Mark Brown <broonie@kernel.org>,
 Lee Jones <lee.jones@linaro.org>,
 Uwe =?utf-8?Q?Kleine-K=C3=B6nig?= <u.kleine-koenig@pengutronix.de>,
 Nishanth Menon <nm@ti.com>, Vignesh Raghavendra <vigneshr@ti.com>,
 Richard Weinberger <richard@nod.at>,
 Miquel Raynal <miquel.raynal@bootlin.com>,
 Lucas Stach <dev@lynxeye.de>, Stefan Agner <stefan@agner.ch>,
 Adrian Hunter <adrian.hunter@intel.com>,
 Mauro Carvalho Chehab <mchehab@kernel.org>,
 Rob Herring <robh+dt@kernel.org>,
 Michael Turquette <mturquette@baylibre.com>,
 linux-kernel@vger.kernel.org, linux-tegra@vger.kernel.org,
 linux-pm@vger.kernel.org, linux-usb@vger.kernel.org,
 linux-staging@lists.linux.dev, linux-spi@vger.kernel.org,
 linux-pwm@vger.kernel.org, linux-mtd@lists.infradead.org,
 linux-mmc@vger.kernel.org, linux-media@vger.kernel.org,
 dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org,
 linux-clk@vger.kernel.org
Subject: Re: [PATCH v8 19/34] pwm: tegra: Add runtime PM and OPP support
Message-ID: <YR5ay6+r0hJsUbhy@orome.fritz.box>
References: <20210817012754.8710-1-digetx@gmail.com>
 <20210817012754.8710-20-digetx@gmail.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="vMbaQMXyoWqaG8Xh"
Content-Disposition: inline
In-Reply-To: <20210817012754.8710-20-digetx@gmail.com>
User-Agent: Mutt/2.1.1 (e2a89abc) (2021-07-12)
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


--vMbaQMXyoWqaG8Xh
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Aug 17, 2021 at 04:27:39AM +0300, Dmitry Osipenko wrote:
> The PWM on Tegra belongs to the core power domain and we're going to
> enable GENPD support for the core domain. Now PWM must be resumed using
> runtime PM API in order to initialize the PWM power state. The PWM clock
> rate must be changed using OPP API that will reconfigure the power domain
> performance state in accordance to the rate. Add runtime PM and OPP
> support to the PWM driver.
>=20
> Signed-off-by: Dmitry Osipenko <digetx@gmail.com>
> ---
>  drivers/pwm/pwm-tegra.c | 104 ++++++++++++++++++++++++++++++++--------
>  1 file changed, 85 insertions(+), 19 deletions(-)

Can this be safely applied independently of the rest of the series, or
are there any dependencies on earlier patches?

Thierry

--vMbaQMXyoWqaG8Xh
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEEiOrDCAFJzPfAjcif3SOs138+s6EFAmEeWskACgkQ3SOs138+
s6GqkA//VEToPW4lCrJibs4kkno3t/HJrCc3QIgrT3KY7KgdOtg6fmvLz/8Bjja0
ut1YS/ozbt7FAgaf8YTyKMFOo8dv21DBdpit0bIWZWYvwh6P2SKB3p+1cFVN9jHZ
lXkRdCUVYqPSGJ2tEHZ6WZBA8KGc198UL3n5PzUQZhh4jRWgfXNLsI2Trp3uwr+T
9/v/xWmil3wiFAgf8H6GLwZ/M3+O9Q32eq6QI0SZOiE/Lj9mwPdZQXixXgDDk2td
dU/CQgmygPCYlcpVcwC1gmvzWcQp6Bffa/3xaRR2vIjSSZtjshQ08B01OOM3Wr/G
qcghnLX0Q3QooNx6alRRv+P1SZXW8u7xcL0HysovbD8IDpOgLBJYXo8IaCHfSlyF
EVVRXB8gMIQip8taMkL6jRVExNuNFDuIs6i2b/KaP2cd2p1mePZw1kS4vf8NJHX6
mJFe0u8P5aik2tEnXP4/M9J9+ZtMLxnRTqB3aK+chmG/KUA66hyMjM3DeEnxfIBL
6YcKjFjKUXVviacmnu+9PDPO4g43XS0M5um6eTtGYkV76kF/KlPYtLuLJG80QIgv
njHN5UN2AgTwaeSZYbDjZ/ldsO9H0aedYvFSyXUQio9GvHSws9WeJD+FVdXKmODO
mS+oMleXMvwiTrWNXKoEG5mTYd2GjUZ7mHsN36quci2pc+ZmYSE=
=0tJv
-----END PGP SIGNATURE-----

--vMbaQMXyoWqaG8Xh--
