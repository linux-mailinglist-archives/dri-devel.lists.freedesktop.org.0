Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id A2AA52CF1C2
	for <lists+dri-devel@lfdr.de>; Fri,  4 Dec 2020 17:20:16 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6E92D6E19A;
	Fri,  4 Dec 2020 16:20:14 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ej1-x641.google.com (mail-ej1-x641.google.com
 [IPv6:2a00:1450:4864:20::641])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 84EF96E19A
 for <dri-devel@lists.freedesktop.org>; Fri,  4 Dec 2020 16:20:13 +0000 (UTC)
Received: by mail-ej1-x641.google.com with SMTP id 7so9520175ejm.0
 for <dri-devel@lists.freedesktop.org>; Fri, 04 Dec 2020 08:20:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to:user-agent;
 bh=035wWkNcQ1j/nClUbKgpC4qFMyacZpddWNDtASSt8zk=;
 b=RVwC7rXLNVM/WW+lIEXEvod+oQJMf3BbR8yKrYlPT9p6jZKxLIBADh0Vt8mUyr/s+0
 eT6twdK3TzOp6LNSd+cQFUhHWgUtxmxfQmuQ8GUUite4935p0D8QSgnhqQuuhVAk5j4m
 Nh9j45XXUjatvNABsebWxHoc1MnG2G8xDCQbibGqz9uozsJQizhaxU/T4ZypYhWqr6xN
 T2lGddZbFgxUDKVa+Z0SCzmVTiu8JBEq/oWad/1+q9+DKIq0PeohU0WbQL55Cj+uMT3R
 aKJBoyrR9sJTi12xBw9yO4OwDl2cq2WRro8qEjAvA+bJw5PRgbgy80WVSj426YCTZy9s
 Vjew==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=035wWkNcQ1j/nClUbKgpC4qFMyacZpddWNDtASSt8zk=;
 b=CqjCX/OuR8MUFtCFgDQ1Qa3EJuqvyAdN6ZCfpIxkdWJbhY46Ltj0T+QfRNjEeO2mKQ
 uCL8KM+Cnox049BzDx31Ncfa4RB1DhNIEIbbZj7Z9AtWCTAGNppvefTc6y5282Mzo9BM
 lOxfBSTONH9N9/4FPiGMFOU0lJq/15brZ1u5PiS9tV/A/pmFCrEQx+ih9CX9zshDfCXH
 id1QGUjZUfqM3AQCuzN2K80wq5o6CAXpQPiNYtRHXB3rZbfg+TJpZ/i/HS+cf/Ytb7LK
 rLF0PMjtl/mx1vGwe0DYBSfj2QtOr06h2w5eYgo5tUGc95wTVvapsJnXhla2PLhCHMUl
 zjVA==
X-Gm-Message-State: AOAM5304mwJrIhe2H45VDlz9sYQ7l19M1GosemECMjfwrCtQxKDaaduX
 QgXbiNaxfWYUgu3H3WLwt30=
X-Google-Smtp-Source: ABdhPJwBwoR6getHAK2tH0Nrb/IrJb+AU/KJjtdwJouNJ/xJKA6T1sMLaeAZQXXerBfC8gKVBvp5CA==
X-Received: by 2002:a17:907:60a:: with SMTP id
 wp10mr7967611ejb.205.1607098812155; 
 Fri, 04 Dec 2020 08:20:12 -0800 (PST)
Received: from localhost ([62.96.65.119])
 by smtp.gmail.com with ESMTPSA id 65sm3780181edj.83.2020.12.04.08.20.10
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 04 Dec 2020 08:20:10 -0800 (PST)
Date: Fri, 4 Dec 2020 17:20:09 +0100
From: Thierry Reding <thierry.reding@gmail.com>
To: Dmitry Osipenko <digetx@gmail.com>
Subject: Re: [PATCH v11 02/10] memory: tegra20: Support hardware versioning
 and clean up OPP table initialization
Message-ID: <X8phuUGCBrp5JGMv@ulmo>
References: <20201203192439.16177-1-digetx@gmail.com>
 <20201203192439.16177-3-digetx@gmail.com>
MIME-Version: 1.0
In-Reply-To: <20201203192439.16177-3-digetx@gmail.com>
User-Agent: Mutt/2.0.2 (d9268908) (2020-11-20)
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
Cc: devicetree@vger.kernel.org, Mikko Perttunen <cyndis@kapsi.fi>,
 dri-devel@lists.freedesktop.org, Nicolas Chauvet <kwizart@gmail.com>,
 Stephen Boyd <sboyd@kernel.org>, Viresh Kumar <vireshk@kernel.org>,
 Peter De Schrijver <pdeschrijver@nvidia.com>, linux-pm@vger.kernel.org,
 linux-kernel@vger.kernel.org, Krzysztof Kozlowski <krzk@kernel.org>,
 Georgi Djakov <georgi.djakov@linaro.org>, Chanwoo Choi <cw00.choi@samsung.com>,
 Kyungmin Park <kyungmin.park@samsung.com>, Rob Herring <robh+dt@kernel.org>,
 MyungJoo Ham <myungjoo.ham@samsung.com>, Peter Geis <pgwipeout@gmail.com>,
 linux-tegra@vger.kernel.org, Jonathan Hunter <jonathanh@nvidia.com>,
 Michael Turquette <mturquette@baylibre.com>
Content-Type: multipart/mixed; boundary="===============0974076818=="
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


--===============0974076818==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="CqLZrd1Ou7JwelE5"
Content-Disposition: inline


--CqLZrd1Ou7JwelE5
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Dec 03, 2020 at 10:24:31PM +0300, Dmitry Osipenko wrote:
> Support hardware versioning, which is now required for Tegra20 EMC OPP.
> Clean up OPP table initialization by using a error code returned by OPP
> API for judging about the OPP table presence in a device-tree and remove
> OPP regulator initialization because we're now going to use power domain
> instead of a raw regulator. This puts Tegra20 EMC OPP preparation on par
> with the Tegra30/124 EMC drivers.
>=20
> Signed-off-by: Dmitry Osipenko <digetx@gmail.com>
> ---
>  drivers/memory/tegra/tegra20-emc.c | 48 +++++++++++++-----------------
>  1 file changed, 20 insertions(+), 28 deletions(-)

Acked-by: Thierry Reding <treding@nvidia.com>

--CqLZrd1Ou7JwelE5
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEEiOrDCAFJzPfAjcif3SOs138+s6EFAl/KYbYACgkQ3SOs138+
s6E9YhAAnOW3eb6mWSwXsc8ATDZpYmZzCt5wUz/tcuNcBgmEuAEVp2nrgpLPnTUt
Z0RZg4fL9ZotBwu4tVStVGgIZpO0gzJo9DSYGiNWT52+ra3MWsuFiK7BYkkHAuwL
wu+P6UOOYFNO8MZVxNlitgTILStuH5M+Jc0wRf1AGLMKtmdSe7AU9uw+sL5YmVXB
HJEQPxKEOtTCiZYRkooNuX7+mGyIYUiejglm9Zrcv11dHRY393QokuQTlTHn6sbW
rIU4MpcArmq+8QN29f7fmztCgCvWesZFfIyZjZooKEYE9gGeUKXAqmi/zvQ/2JZp
Hlycx3udPsV21QQW+scftfWJm7s3lPw04X60FPrYzPm+DN2PpZc7HIlbC/g4gcUD
p4Pa27/kvn89RKDBNtfVAgk821zgeXmTSKI97ydjfKtibefTChay5jGDpqh979r8
3cKMU38k/ogdRprC6Z8Quv6u6b53uz0wjXBpmlEPRRmzNck1egsx9prQ8eiKIG9o
a93VcDOFRRG3eeiWjv8JmHFGNIGq9QILlMDNWh6jxbJt/WJ5ZGJ+1vbORrk4JbBA
RIUvhzkzxt9UD0PS9/pFoAyaec0CjQL8X1u/6U9JW2vENqYCoxCiUDVxJ2t4hVUK
RHEQDUzlURczgksNpLikJ4H1MIQ7Cb1a9mGst3BiGX/7LOEUt60=
=LWwG
-----END PGP SIGNATURE-----

--CqLZrd1Ou7JwelE5--

--===============0974076818==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel

--===============0974076818==--
