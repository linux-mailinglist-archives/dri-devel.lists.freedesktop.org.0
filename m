Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id AB58B4772E2
	for <lists+dri-devel@lfdr.de>; Thu, 16 Dec 2021 14:15:06 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CF8B410FD38;
	Thu, 16 Dec 2021 13:15:01 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x432.google.com (mail-wr1-x432.google.com
 [IPv6:2a00:1450:4864:20::432])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EA19910FD38
 for <dri-devel@lists.freedesktop.org>; Thu, 16 Dec 2021 13:14:59 +0000 (UTC)
Received: by mail-wr1-x432.google.com with SMTP id i22so14348835wrb.13
 for <dri-devel@lists.freedesktop.org>; Thu, 16 Dec 2021 05:14:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to:user-agent;
 bh=plntCnoEf4l+2O6n5K2//4k94Xfcj+XZd/AAN0qmlKg=;
 b=FIO7dAYdQsogQTPmvKNLvcHJmvCg6gKD4gaQUApx/L1OHKB+gdGjuTQwMR7iPm8Au8
 4eDzFvrkcAOZXcQn5eov/jIed7iuyilK/FrmhhV9f8ipnM83966znpVIWxQ0y8rENrx/
 DR0dxbZOtzzl9ogZGBI4oY+EmvHQRGx2Ld8d2c1XyIEbnaK/FbMQjYo43feaOZmMoGu8
 UWjWd+D5bnSeZfuFe/mxr8MKKfHSA6tbWcxKs/BtvaTwP4U2sCSA86AZ5Wi7VNnPQfPJ
 tqn7Slclo/4qiAkuAew92t2U+kRMWgGGC7e1ZxGxqC6qyRRNj5UDm262Don06h799XPa
 /fuA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=plntCnoEf4l+2O6n5K2//4k94Xfcj+XZd/AAN0qmlKg=;
 b=if5WI5j8LarcsbUm4o3DnO+tQqWsWC8uShyQNqLF9MSOI3Grm9eFSCXztxVNz6r6v/
 wPmDX4ET4bVg2b2yhBWnDrPTwL8ohAHmK55HOewiKg2m+aGaY0HjlJCC87am1cYRcby3
 OG/qeF2zzsvSH5UscRhT2TknYAbAUuEHYH8xjz4mAAF7IxU47kkIXX+6tpiCEmqyfwoX
 tIsVWRiqNl85n43or7Vfoo1DGSrBUFMjv7DmW0pSPm1k24SkqLIh8Fx/dB2umNYsUGEG
 1bIA5p4nM3M1uqF2Ng0oSwA/D9cGJu7lkcGdL1MPevMACmt9vARZZNbc2Nvp00fgulzm
 xDeg==
X-Gm-Message-State: AOAM531TCwhN4ExOEusUohMucc344gfhFwyx7+x43Y2U24NvvjXWb8J8
 7ZLXwVqD4ee9wfNEZNOqORg=
X-Google-Smtp-Source: ABdhPJxZUIxe16AL1U6OVyWzVyNBqRDFNcocl3pvTG2D4/71hffD8CvlNr25wmCQpMbdSJzLa6QbkQ==
X-Received: by 2002:a05:6000:1787:: with SMTP id
 e7mr8860261wrg.433.1639660498311; 
 Thu, 16 Dec 2021 05:14:58 -0800 (PST)
Received: from orome ([193.209.96.43])
 by smtp.gmail.com with ESMTPSA id x1sm4651630wru.40.2021.12.16.05.14.54
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 16 Dec 2021 05:14:57 -0800 (PST)
Date: Thu, 16 Dec 2021 14:14:52 +0100
From: Thierry Reding <thierry.reding@gmail.com>
To: Dmitry Osipenko <digetx@gmail.com>
Subject: Re: [PATCH v16 00/40] NVIDIA Tegra power management patches for 5.17
Message-ID: <Ybs7zKQY1uJCJ2f3@orome>
References: <20211130232347.950-1-digetx@gmail.com> <YboP9IFMUrUnEzrU@orome>
 <6baf6013-fbb2-b42f-5b26-2d10a2ca9374@gmail.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="GBkk6fJUCkERZf+c"
Content-Disposition: inline
In-Reply-To: <6baf6013-fbb2-b42f-5b26-2d10a2ca9374@gmail.com>
User-Agent: Mutt/2.1.3 (987dde4c) (2021-09-10)
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
Cc: Nishanth Menon <nm@ti.com>, linux-pwm@vger.kernel.org,
 Ulf Hansson <ulf.hansson@linaro.org>, linux-clk@vger.kernel.org,
 linux-pm@vger.kernel.org, Stephen Boyd <sboyd@kernel.org>,
 Viresh Kumar <vireshk@kernel.org>,
 Peter De Schrijver <pdeschrijver@nvidia.com>, linux-mmc@vger.kernel.org,
 Adrian Hunter <adrian.hunter@intel.com>, dri-devel@lists.freedesktop.org,
 Mikko Perttunen <mperttunen@nvidia.com>, David Heidelberg <david@ixit.cz>,
 Uwe =?utf-8?Q?Kleine-K=C3=B6nig?= <u.kleine-koenig@pengutronix.de>,
 linux-tegra@vger.kernel.org, Jonathan Hunter <jonathanh@nvidia.com>,
 Lee Jones <lee.jones@linaro.org>, Michael Turquette <mturquette@baylibre.com>,
 linux-kernel@vger.kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


--GBkk6fJUCkERZf+c
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Dec 15, 2021 at 07:11:53PM +0300, Dmitry Osipenko wrote:
> 15.12.2021 18:55, Thierry Reding =D0=BF=D0=B8=D1=88=D0=B5=D1=82:
> > On Wed, Dec 01, 2021 at 02:23:07AM +0300, Dmitry Osipenko wrote:
> >> This series adds runtime PM support to Tegra drivers and enables core
> >> voltage scaling for Tegra20/30 SoCs, resolving overheating troubles.
> >>
> >> All patches in this series are interdependent and should go via Tegra =
tree
> >> for simplicity.
> >=20
> > So these can be applied in any order without breaking anything?
>=20
> Please notice that the word is *inter* dependent, not *in* dependent.
>=20
> There is a build dependency for the patches. The first two "soc/tegra"
> must be applied first.

Okay, so I've separated the first two patches out into a separate stable
branch that I can share between the Tegra and drm/tegra trees to pull in
the build dependency and then I've applied the driver patches to those
two trees and I've verified that the two branches build correctly. I've
not done any runtime testing, but I'll trust you on that.

> The "soc/tegra: pmc: Enable core domain support for Tegra20 and Tegra30"
> *must* be the last applied patch if we want to preserve bisectability.
> The core voltage scaling can be enabled only once all the drivers got
> the power management support.
>=20
> The rest could be applied out-of-order.

One last remaining question: I don't think I can apply that one patch if
it requires that all the others are enabled first because it would
basically create a circular dependency.

Can I pick up the final 7 patches (the DT ones) independently of that
one patch without things breaking? If so, one option we could try is to
wait for both Tegra and drm/tegra trees to get merged into v5.17-rc1 and
then send that one patch (which is only a 4-line diff) right after
v5.17-rc1 so that it makes it into v5.17-rc2. That avoids the circular
dependency and should get everything enabled for v5.17.

Do you see any problems with that?

Thierry

--GBkk6fJUCkERZf+c
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEEiOrDCAFJzPfAjcif3SOs138+s6EFAmG7O8oACgkQ3SOs138+
s6FaPxAAurtl9RVWzTQoPumQ6idPyH/LVTqdXH8uhMksiRkr4Y5/jwAgyN0Xds9g
0elHBQwMR1RuXgChY1mCtzK5Bd7KYuXtbRrDNDuzdNeErVVWhAmkLfpaWx4gtsn+
LnNMnNjGqhpJl+x4JET4cExLmzvsZPonV3KOJb11zqf0MHPPErBIUNVtN3fHEtEz
mH2WbH3Kt7f1ih6syH6w+LcwdZ9Z6nRxSfzXTX1Y8IFrncwmwU7UIVAJ0/iPNXso
7CVfEKEkR+3q2FNlHFpoZj+yeeSsk7pMC1EIHXIgjUqZmgVgZPbT4s02saWqsI0s
SUOo2uLBW8xIsSvUltCBsi8fQ36zj8gWz0brqiAQu47t7XB7oX8Z1m7Y+9GjuFoz
AlATrPX+VxyLryAxx4WgkYVarCHr67qjqRjZJ9LXqCES8IfwXxgNBRP7igTLkLzD
dkMkGxw+n7T1Ic6hH4/UPK44ZfpHDhE8Fl1zD2P/h0hBm9kcd7P+8GO3SnKETaKS
MsdJTA+1RUCdT/24s/obuMDA/3va8SoU6UEzaOqmsb+KujnSHb8kcR/NWHjAdDXP
325SFxssz92BU7jiOnooUw1BhqGio6Ufv+EEHJCataCIczKt9XogPtLJrcO94qo1
Qlb6JGF1/uUXQj3IaICdmPigTcyAdSuFM4pKXoyOL8HOToBjKcc=
=AIks
-----END PGP SIGNATURE-----

--GBkk6fJUCkERZf+c--
