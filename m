Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 55CDF2CF1E1
	for <lists+dri-devel@lfdr.de>; Fri,  4 Dec 2020 17:27:35 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 65B946E199;
	Fri,  4 Dec 2020 16:27:31 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ed1-x541.google.com (mail-ed1-x541.google.com
 [IPv6:2a00:1450:4864:20::541])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7B9A06E199
 for <dri-devel@lists.freedesktop.org>; Fri,  4 Dec 2020 16:27:29 +0000 (UTC)
Received: by mail-ed1-x541.google.com with SMTP id q16so6413886edv.10
 for <dri-devel@lists.freedesktop.org>; Fri, 04 Dec 2020 08:27:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to:user-agent;
 bh=T+HmOhYRAWoPzFvO+6AKczOw7jzGt+H4bxGuXLCQXoc=;
 b=kgiRgJ4ywoZVvlEdS4dzVI217OLzYENw/cza8A9shThLkxM/Vo/JQhk1OFW+iwbf8p
 faqrHR4b0hyVBjAlknDZRqu5bNRkd1mMhJKxJuE+31Go9GbP7LcCSSw7WMt2KQqF+jnp
 nac4bYVxJ8GzsKoxFjCJTUGBOFwvRPzSEza0YzSseFzSvguVeQ1oOXIkKrvYZg1LRvis
 cuP011H/Rq04vO7HYRunZBmJ7vXbGr/7Hv8gnUIC5g75DzPP/+kqMsMqs3FUJxsSm2EN
 Na3R59zfW/HnR9eNGEzKA6RRdpSTpUCkBi6skZyrKB3QHHBeql3rinhsWPnH2THiFv/n
 HiTg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=T+HmOhYRAWoPzFvO+6AKczOw7jzGt+H4bxGuXLCQXoc=;
 b=B9ueLeR4KIioYfQxEhn+erjaVn3JHqX3II6tgkQ2yA7/giqksjbFgYME9GwmG8KdKu
 Gx4nW8o3xensItQ+4TsHtytkv9lhZxEAD5GuEm+gvZ3RxCnu1cvGohgt1XthWQNBYEKS
 FilpmRzoPju5K4INGo0AlvduesS/K31385F4rLNgj8SU5XKEUvMhz1a7p9Ff6C+BV0J8
 EGK+X+gYSKkP6HrM4rn9MlQBnz29uDgIbquJTG/rgFE36ZQcIGhbWAn6fGlI7UTnD/JB
 sSLKfx1BHmBiyECPjgnC1gzxZ9BC9rUaGReUkL+lR5d4w3vuKLQDXbYKNbi9XGqN3Llk
 hyWA==
X-Gm-Message-State: AOAM532JplL62eNcMosW4TY1l7nkY6gj0m9rFMZfuDFyXAXSU7dEV3fJ
 M73HI2kRQFT6QumSq5qBazQ=
X-Google-Smtp-Source: ABdhPJz4k6hB4aIWeMlptTvr8/KtGOvqe1S5zLT5t102zABDLV44vRb0th7M+TZOofj//Zr2RU6sgw==
X-Received: by 2002:a05:6402:746:: with SMTP id
 p6mr8397102edy.313.1607099248170; 
 Fri, 04 Dec 2020 08:27:28 -0800 (PST)
Received: from localhost ([62.96.65.119])
 by smtp.gmail.com with ESMTPSA id b7sm3521209ejj.85.2020.12.04.08.27.26
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 04 Dec 2020 08:27:26 -0800 (PST)
Date: Fri, 4 Dec 2020 17:27:25 +0100
From: Thierry Reding <thierry.reding@gmail.com>
To: Dmitry Osipenko <digetx@gmail.com>
Subject: Re: [PATCH v11 03/10] memory: tegra30: Support interconnect framework
Message-ID: <X8pjbV/gEIOp/2sM@ulmo>
References: <20201203192439.16177-1-digetx@gmail.com>
 <20201203192439.16177-4-digetx@gmail.com>
MIME-Version: 1.0
In-Reply-To: <20201203192439.16177-4-digetx@gmail.com>
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
Content-Type: multipart/mixed; boundary="===============1709403943=="
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


--===============1709403943==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="bTHofWPXsdPAY1Vz"
Content-Disposition: inline


--bTHofWPXsdPAY1Vz
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Dec 03, 2020 at 10:24:32PM +0300, Dmitry Osipenko wrote:
> Now Internal and External memory controllers are memory interconnection
> providers. This allows us to use interconnect API for tuning of memory
> configuration. EMC driver now supports OPPs and DVFS. MC driver now
> supports tuning of memory arbitration latency, which needs to be done
> for ISO memory clients, like a Display client for example.
>=20
> Tested-by: Peter Geis <pgwipeout@gmail.com>
> Acked-by: Georgi Djakov <georgi.djakov@linaro.org>
> Signed-off-by: Dmitry Osipenko <digetx@gmail.com>
> ---
>  drivers/memory/tegra/Kconfig       |   1 +
>  drivers/memory/tegra/tegra30-emc.c | 344 +++++++++++++++++++++++++++--
>  drivers/memory/tegra/tegra30.c     | 173 ++++++++++++++-
>  3 files changed, 496 insertions(+), 22 deletions(-)

Acked-by: Thierry Reding <treding@nvidia.com>

--bTHofWPXsdPAY1Vz
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEEiOrDCAFJzPfAjcif3SOs138+s6EFAl/KY20ACgkQ3SOs138+
s6Engg//drHa8HENx4EvSwA5eoE9FKgNLKJPQdW/7BBtgBPmv0ImXomL5kKddSn5
O6SomluwfhV8QxJZR4eiIv04ptvLC8CuKtY21mgZFLZwJRBrVYq40h+VIqt3guAd
y5nEw3fALyFOeqOK76P80q2Qa7aLQguoPzfaa3dsDsBfnNG/CbgBj9vCL868UoB9
3u7oEv58jd+3YYx4HhlilcoHQp9yL2S5N3PEt/9hxxVTo+k6j6Vxk5+LnUz4Afl3
JsP4sOuwvFxWDIPoghYuaCc5dZ9qJurZ9z1SRIf6sYl/NU2t5ob+0Ec3f8X5OcuR
6tL1vHwlZ9UbB5t+qOJDfwdPO4Lx2dcxT70lxsBimV3Jc0i2oamRDMhK5VTBlKoQ
11GwxrrrS5uxuIr/60KA94IAptu+X98Nn9sZEJznuMZvKbBUBC6X2vJGd9WuL7uD
rx9xU3rulWs9BsBf9Rd+LeiJFpdVIukDTerJTIDsx2x9FEVc1m5gnz/2yVkcpCdU
AvpsRwbwO5pcl56U+fZ/EwljblwRLY3sX3mGTA7vk2PKSgigLDgB7itXStFPNR5j
PLMih36DUjxruXDwUK9R2P4o9Uxfb+A26WwPd/o84qIHj6hJneG3kW0WioV6dnwk
oItg/WELcMS+7DveCKW2IdpVkzJMc4PzeNqeGZxYvIbZc1BSPL4=
=UulD
-----END PGP SIGNATURE-----

--bTHofWPXsdPAY1Vz--

--===============1709403943==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel

--===============1709403943==--
