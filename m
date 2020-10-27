Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 45E0229AD25
	for <lists+dri-devel@lfdr.de>; Tue, 27 Oct 2020 14:22:50 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E61E16E1B6;
	Tue, 27 Oct 2020 13:22:45 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ej1-x644.google.com (mail-ej1-x644.google.com
 [IPv6:2a00:1450:4864:20::644])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A981E6E1B6
 for <dri-devel@lists.freedesktop.org>; Tue, 27 Oct 2020 13:22:45 +0000 (UTC)
Received: by mail-ej1-x644.google.com with SMTP id s15so2183085ejf.8
 for <dri-devel@lists.freedesktop.org>; Tue, 27 Oct 2020 06:22:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to:user-agent;
 bh=ZMLUYGMKoX9mKM6hDiFyPEhjDprJlxdJ1WTRfMKyP3o=;
 b=AgscIiz/pERLbak/64dOBSVrQjrer1k1W4rN96P2GE8s24Ot2tsq74Mop+nf+k8O64
 USgcYj5qC/+ZKvi8H3Eo6e41crmISbsdAVO/06qsOffAwkjAYKEOofP8vtUird56wk/d
 GKwMasQu73FQXM5+iI48RUDn+3nT/NnuhuvNtW5bOtzo1mhiBY8HI9ImOMnM5/qdiQgS
 cojP+e4gwkt/67ITRbk+0dLzv2RQX6yr/bvHTgZQOrCXv80bg6A7v4MmnOUDB93b0x6l
 WMLs8fwiOZSDQ2srq85Dm/uCJALWK9garTb6IpK8yc62eSkf0ENXmt2at855k5o26AYA
 CNrQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=ZMLUYGMKoX9mKM6hDiFyPEhjDprJlxdJ1WTRfMKyP3o=;
 b=EIJqJ//rimm+SP1ShQnAVpp8x+u+ku+i8GZ4bfuo9Z8ko7SdFB/UCKkOfuOzvSPQZS
 YfdR/vA7kRuLRbs7g15Js1Z3UETq4aNJWayuhkz+a1RdAQ08QgK1oOgiu+J/gws4T3iO
 R0J4CnpO2NTdmcycoBt8jli9ZgNYwjTms4Lb1PSscr8ORdfOTBVdjRT80K5FkROew8RC
 ygNhj+pf4Z0AH2mLPGfL0Qz5uzO0lYBk8NVbe9r8Rpbik2oe+wXjHNjSnur3Oez28/bE
 9/q3RoKMlv3Hf3ov2dusMz8fQt9UlXEjWad5jlvRcWKknfLSiOj6GrYUNGxayg8feHVP
 O5vA==
X-Gm-Message-State: AOAM530PgmwTm448SqkhLfUFFrjOMUgvn1eiyUFoa51vjCfkyjDHyses
 v7WGH7CvokT43wh0jnMUPuw=
X-Google-Smtp-Source: ABdhPJyXjL8T6wqFPXMxyLMjoLY2xwFyK+FBv6JSqLvEj07I/7AQUFo9ETL4qG15rMkiYl4RgDoDTQ==
X-Received: by 2002:a17:906:12cf:: with SMTP id
 l15mr2526427ejb.540.1603804964390; 
 Tue, 27 Oct 2020 06:22:44 -0700 (PDT)
Received: from localhost ([217.111.27.204])
 by smtp.gmail.com with ESMTPSA id t5sm977859edw.45.2020.10.27.06.22.42
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 27 Oct 2020 06:22:43 -0700 (PDT)
Date: Tue, 27 Oct 2020 14:22:41 +0100
From: Thierry Reding <thierry.reding@gmail.com>
To: Dmitry Osipenko <digetx@gmail.com>
Subject: Re: [PATCH v6 08/52] dt-bindings: memory: tegra20: emc: Document
 mfd-simple compatible and statistics sub-device
Message-ID: <20201027132241.GG1822510@ulmo>
References: <20201025221735.3062-1-digetx@gmail.com>
 <20201025221735.3062-9-digetx@gmail.com>
MIME-Version: 1.0
In-Reply-To: <20201025221735.3062-9-digetx@gmail.com>
User-Agent: Mutt/1.14.7 (2020-08-29)
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
Content-Type: multipart/mixed; boundary="===============1140998270=="
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


--===============1140998270==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="8bBEDOJVaa9YlTAt"
Content-Disposition: inline


--8bBEDOJVaa9YlTAt
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Oct 26, 2020 at 01:16:51AM +0300, Dmitry Osipenko wrote:
> External Memory Controller can gather various hardware statistics that
> are intended to be used for debugging purposes and for dynamic frequency
> scaling of memory bus.
>=20
> Document the new mfd-simple compatible and EMC statistics sub-device.
> The subdev contains EMC DFS OPP table and interconnect paths to be used
> for dynamic scaling of system's memory bandwidth based on EMC utilization
> statistics.
>=20
> Signed-off-by: Dmitry Osipenko <digetx@gmail.com>
> ---
>  .../memory-controllers/nvidia,tegra20-emc.txt | 43 +++++++++++++++++--
>  1 file changed, 40 insertions(+), 3 deletions(-)

Why does this have to be modelled as a separate device? Isn't this just
using a couple of registers out of the EMC register range? If so, this
would better just be integrated into the parent node and implemented as
part of the EMC driver. No need to further complicate things by adding
a dummy child.

Thierry

--8bBEDOJVaa9YlTAt
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEEiOrDCAFJzPfAjcif3SOs138+s6EFAl+YHyEACgkQ3SOs138+
s6EvOA/9GFUCJRzhojvUyJHzwHHS7x6T3glDA/XF4WmogDP9ijUclThlH5xzRkCP
Lg0hU+S5WFRyfvIJOAA6D1Ou1b1TT9Enr0dO0+Jfq3ShIvaoRBe0XP/vqaKpKqXn
P7VLT3lbs/3ZMzABDnFGSUvLwFqMlfdjXdDEExTOhDbpnoYSaleCiPtFqn4a1yye
1yHG0aZ6zGO4Tyarc9v/ftAXiTMDfVDDUyj1sNwGeeqdlOpVT3nL7tP/8U1IFNOs
5OKk4KGV3AkP/teJOjiw7DJeQpfEItcXvcmSTZx+MzHUUwqdk0my72MUIfDLA8SB
8aB67dBJSUTExjlxSLGU+8GLVKvWrCr0cUMtU018rNNRrMAoazNfOmlU6i02eGx9
ZfzTFqCdKShZVKBJkOHEaxLXt7DJuiwQ1aYzHNVlyNMQpmA8adEfmZPFWWuYLohd
Hn8mGk0ORL5p2sdw5xXwJMOlsE+p5rKiwOsrxI4sCQ4q5stu29jiv7zruPE5pX1n
Utq15ldrFwf1VNjrbm9K0XgAfEVbrBVc7Kg2xMeMCbpTRwuRQk22jF/aaCBUjGue
h4brYNuSOCLxUdcs2NuE6suO+rYJgtT5nehI9PJXG/Y66zyc2Uxui3VqIyZdybID
ZkeKK5fxiMuuyeYPzMU/sAA37rG5xZsOKVVyOOkJOlipMX2gioo=
=a8kD
-----END PGP SIGNATURE-----

--8bBEDOJVaa9YlTAt--

--===============1140998270==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel

--===============1140998270==--
