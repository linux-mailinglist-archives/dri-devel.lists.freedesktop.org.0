Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 8DD443F1D9C
	for <lists+dri-devel@lfdr.de>; Thu, 19 Aug 2021 18:17:10 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1B3A16E8BE;
	Thu, 19 Aug 2021 16:17:06 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-x332.google.com (mail-wm1-x332.google.com
 [IPv6:2a00:1450:4864:20::332])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C50756E8BE
 for <dri-devel@lists.freedesktop.org>; Thu, 19 Aug 2021 16:17:04 +0000 (UTC)
Received: by mail-wm1-x332.google.com with SMTP id f10so4178036wml.2
 for <dri-devel@lists.freedesktop.org>; Thu, 19 Aug 2021 09:17:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to:user-agent;
 bh=60qINEW/AajNCq1e+l/+W08Fyl6DoGCIURNuZ7bsdck=;
 b=uTqJWSeNGF+lF+nvNnEIkEavsCZHzmRSicfBPYqjqhCUMol7qkO7p4zdXBxXzeS4vT
 LUXoyy4jqxt9JRa9GA2emnqvcgjM5m2JH6xpgqUnHRqrvhXJ0ra+UdQrGTHBIigAbPLh
 VtxYJrYzvVlZAFn9BLoC03dGbU6/D7G3RL7V20nMcs7xOj6F0WluZa6ULpmAHfq5dHWJ
 HXoLsG3Ntc0X9376FP560pBl7c5j6ef3ByAkw7chpgshwtvTwJMn4sKZPsmEYVKGvuIs
 umScIh5+iEwTdQ0CShvhEEtGLV53HAS6lzbT7CRVhL1cxI0eKkOyVSJRLsE+nSFs10iz
 Va5w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=60qINEW/AajNCq1e+l/+W08Fyl6DoGCIURNuZ7bsdck=;
 b=QmU/ATQ55pt5+5M9+TnuSq8CPa7O9a8cHZpbzV/MiZsVyHqeH9dtxP+dMFW4YA7686
 NDx8aY4UfoIbr6PUiKjNHpYFhYtZVOyTA/+9Ph01tao4B939mlpFPFebL2ONF3HXUj34
 vy3T4k6d7zUxEc2YYLJ/8+dx0OOx4LWiFdTFoJ7IG0W+rN3FkHGda02EJgJlTe4EsMYR
 JXaUfxJpj4WKY0h1YOfLeTnLXncnEe5JbiKDjLUWfggzvofSKZqwuchri+/99NbHjO4J
 ybYxaNVIX/P/FwMOJLcWbPzt+tqFw56/sbKzBhgxo2wMU2zOC4cIdjs8T+KqE/ypXPXr
 40jg==
X-Gm-Message-State: AOAM531JdBQRSR8oDQLHu7YEBxuLhJW+B0UM2V9e8g6cCJySkYIQszRR
 4Yp1fl/+Omk1H0NB2y8/Imk=
X-Google-Smtp-Source: ABdhPJx2olGrXmJhDc92ifXD/T9C9Dyg3QQIU/AaBjuCkLci0TRvThG/zCRGsYcF6TD012k/6ZhEWA==
X-Received: by 2002:a1c:26c5:: with SMTP id m188mr14633566wmm.19.1629389823304; 
 Thu, 19 Aug 2021 09:17:03 -0700 (PDT)
Received: from localhost ([217.111.27.204])
 by smtp.gmail.com with ESMTPSA id e25sm3956144wra.90.2021.08.19.09.17.01
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 19 Aug 2021 09:17:02 -0700 (PDT)
Date: Thu, 19 Aug 2021 18:17:01 +0200
From: Thierry Reding <thierry.reding@gmail.com>
To: Ulf Hansson <ulf.hansson@linaro.org>
Cc: Dmitry Osipenko <digetx@gmail.com>, Jonathan Hunter <jonathanh@nvidia.com>,
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
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 linux-tegra <linux-tegra@vger.kernel.org>,
 Linux PM <linux-pm@vger.kernel.org>,
 Linux USB List <linux-usb@vger.kernel.org>,
 linux-staging@lists.linux.dev, linux-spi@vger.kernel.org,
 linux-pwm@vger.kernel.org, linux-mtd@lists.infradead.org,
 linux-mmc <linux-mmc@vger.kernel.org>,
 Linux Media Mailing List <linux-media@vger.kernel.org>,
 dri-devel <dri-devel@lists.freedesktop.org>,
 DTML <devicetree@vger.kernel.org>, linux-clk <linux-clk@vger.kernel.org>
Subject: Re: [PATCH v8 19/34] pwm: tegra: Add runtime PM and OPP support
Message-ID: <YR6D/QMDakjlD5Ve@orome.fritz.box>
References: <20210817012754.8710-1-digetx@gmail.com>
 <20210817012754.8710-20-digetx@gmail.com>
 <YR5ay6+r0hJsUbhy@orome.fritz.box>
 <CAPDyKFqr6NYO89io+6EfwrtELhTMps-tpGcAVbmuQ1_NnOD7Ew@mail.gmail.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="v92KmlAbafaPcAq1"
Content-Disposition: inline
In-Reply-To: <CAPDyKFqr6NYO89io+6EfwrtELhTMps-tpGcAVbmuQ1_NnOD7Ew@mail.gmail.com>
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


--v92KmlAbafaPcAq1
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Aug 19, 2021 at 04:04:50PM +0200, Ulf Hansson wrote:
> On Thu, 19 Aug 2021 at 15:21, Thierry Reding <thierry.reding@gmail.com> w=
rote:
> >
> > On Tue, Aug 17, 2021 at 04:27:39AM +0300, Dmitry Osipenko wrote:
> > > The PWM on Tegra belongs to the core power domain and we're going to
> > > enable GENPD support for the core domain. Now PWM must be resumed usi=
ng
> > > runtime PM API in order to initialize the PWM power state. The PWM cl=
ock
> > > rate must be changed using OPP API that will reconfigure the power do=
main
> > > performance state in accordance to the rate. Add runtime PM and OPP
> > > support to the PWM driver.
> > >
> > > Signed-off-by: Dmitry Osipenko <digetx@gmail.com>
> > > ---
> > >  drivers/pwm/pwm-tegra.c | 104 ++++++++++++++++++++++++++++++++------=
--
> > >  1 file changed, 85 insertions(+), 19 deletions(-)
> >
> > Can this be safely applied independently of the rest of the series, or
> > are there any dependencies on earlier patches?
>=20
> Just to make sure we don't rush something in, I would rather withhold
> all runtime PM related patches in the series, until we have agreed on
> how to fix the in genpd/opp core parts. Simply, because those may very
> well affect the deployments in the drivers.

Okay, understood. I didn't realize this may have an impact on how
drivers need to cooperate. I'll hold off on applying any of these
patches until the discussion has settled, then.

Thierry

--v92KmlAbafaPcAq1
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEEiOrDCAFJzPfAjcif3SOs138+s6EFAmEeg/oACgkQ3SOs138+
s6HxGg//Ql/ilCJ6m24EOkbDMDHwSFLN7MYgmfi1Muvarf/bqQFb1LIOonS0qeTr
fHvvi587/6LtOdHE0PNwTl0SEz5UpxSojnZdTDjV2/JdSgy7LeJ2RBbeZ7kxVCMP
3ud/I9kVkE1BaAtRzX0sqNJOIDA2MG00wBq08+PNS9ihOvipqypiweD5JSaB5MSi
Gof9qhzVOZV/ONjRZ7Ib0kjig/qx0+lpJ2W/15QdU4/OHp9QP/ONoinEIk9WPaXU
QveXwGDwo27fi1MQQKsQCwoytQZaaFjqyy3gnZNiAjY6fUikfa0TSvjZBXGJduvf
YXJJIt1dy09Zk589NliTddgaZE4anOdgW7c02KwLSLw4RxsAgFG8xfj1Z8i9DhWs
GQGNkYNXlia3rj7uiU6dJGLlhtyNblI96fNGXqnlhnIkuDJvYuKm9BRs9e9gGDva
qvsD03sjGzToLh26dSvTZa6KPqK7pgqkPyOxP4PuqUNECw5IOfVNXd5S4JKQMHat
QDO1QwVz9eg29cSSX7oziTvc7b1iS0IqVdtfiDa/SzWC7sdCVn+hCVD+SR5vEDHY
6KcokLAcDqd8YXs71HDqDz4G3L+P17bEoHjcYIz/zJl+c5r+JDmxuhCHL0Ak7KlO
BxfqqqYVBPahJsnmVcGVnAMavszy2PwqEQXM9PGZYEevCsi83lo=
=yoaX
-----END PGP SIGNATURE-----

--v92KmlAbafaPcAq1--
