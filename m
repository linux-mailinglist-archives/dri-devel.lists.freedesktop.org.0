Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id F265C29ADCA
	for <lists+dri-devel@lfdr.de>; Tue, 27 Oct 2020 14:49:23 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 09D3B6EB70;
	Tue, 27 Oct 2020 13:49:22 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ed1-x544.google.com (mail-ed1-x544.google.com
 [IPv6:2a00:1450:4864:20::544])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 338A86EB70
 for <dri-devel@lists.freedesktop.org>; Tue, 27 Oct 2020 13:49:21 +0000 (UTC)
Received: by mail-ed1-x544.google.com with SMTP id dn5so1496157edb.10
 for <dri-devel@lists.freedesktop.org>; Tue, 27 Oct 2020 06:49:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to:user-agent;
 bh=ZnQkxwgJ6i77+EDy7ii9SL2QSN3TsUPUF8gJzK7Sz2A=;
 b=C7L5ldZS0nW165WCgAWiA78F1DltzHr7uZvwIfgu1OR/PFMoHIvrDUhqmqdm91jLrr
 Uj5J7Ya4bD9GzRepdajFDKjbOzaAl75KTAaDA0T5oEZTcVIty8EFB+b7SDRB8xBBnsIz
 zaDtz8ScVAj9CunFwLuFXIgxuIav8MLQcKF7gmthk+m5ng3sRxXv3ibUiYPnpC3x2/rk
 Mzhejt14ZLAl6FDU6uZ2odTOGyT6W0C9aa1BsDTWo0lmDCu/S2itQoIy0cHBf/R2Pzow
 akVuSt4RXLEuo1VaifHUoWeN/aMhccy8yExyntXeCZAaQia1BtsQdTfFxfQ1JTpsvgZu
 71CQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=ZnQkxwgJ6i77+EDy7ii9SL2QSN3TsUPUF8gJzK7Sz2A=;
 b=tIOaIUfIsgStz6EDMJAkwMCi23BFYUyYwwAdnBi67n3NRvPW7LkbHAk7NUb8pL7ERT
 w8TIXszA/7BHvyUvtKuiMQ3XEACuN0cjD+YthH/hNe3zUFvAVXvhq8fCfXMPyu4BNKWg
 r0hgl3jMj613dhK5k3yPqZpFgR6Kr8Eju0E9iZthaP9LG6/9cRrLpKf2kUYY848cj3w4
 1LfERgrOOmU0cA3hdi7RW+OEgFtJ9LPlSxBYqGMj5LbWvdEfaUmFv0B/ZMMxLjUbuVPX
 sQCrNWkuPxfkWNn8374/my9f8aIiz3i2Ajbg0f7ny2WWz1ZvsYhRWzFKjLoCWQi5yfK/
 JK4Q==
X-Gm-Message-State: AOAM5324FW91yhspdkfmx0CSRvKijRcGl5PZPe9OgNl2GnfLVwACRtOG
 pOm6xbh3FBR++VBqXDEh46E=
X-Google-Smtp-Source: ABdhPJyLImSrLnd0UnDtq1WDozpOz5Rbs7Y3xGZeJh9Wqk/YZ8OSbRrxILNooHJBec1dYS8bHABScQ==
X-Received: by 2002:a50:ab5b:: with SMTP id t27mr2314325edc.281.1603806559858; 
 Tue, 27 Oct 2020 06:49:19 -0700 (PDT)
Received: from localhost ([217.111.27.204])
 by smtp.gmail.com with ESMTPSA id k18sm1012491eds.93.2020.10.27.06.49.18
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 27 Oct 2020 06:49:18 -0700 (PDT)
Date: Tue, 27 Oct 2020 14:49:17 +0100
From: Thierry Reding <thierry.reding@gmail.com>
To: Dmitry Osipenko <digetx@gmail.com>
Subject: Re: [PATCH v6 30/52] memory: tegra20-emc: Make driver modular
Message-ID: <20201027134917.GK1822510@ulmo>
References: <20201025221735.3062-1-digetx@gmail.com>
 <20201025221735.3062-31-digetx@gmail.com>
MIME-Version: 1.0
In-Reply-To: <20201025221735.3062-31-digetx@gmail.com>
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
Content-Type: multipart/mixed; boundary="===============0534760453=="
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


--===============0534760453==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="yiup30KVCQiHUZFC"
Content-Disposition: inline


--yiup30KVCQiHUZFC
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Oct 26, 2020 at 01:17:13AM +0300, Dmitry Osipenko wrote:
> This patch adds modularization support to the Tegra20 EMC driver. Driver
> now can be compiled as a loadable kernel module.
>=20
> Signed-off-by: Dmitry Osipenko <digetx@gmail.com>
> ---
>  drivers/memory/tegra/Kconfig       |  2 +-
>  drivers/memory/tegra/tegra20-emc.c | 17 ++++++++++++-----
>  2 files changed, 13 insertions(+), 6 deletions(-)

Acked-by: Thierry Reding <treding@nvidia.com>

--yiup30KVCQiHUZFC
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEEiOrDCAFJzPfAjcif3SOs138+s6EFAl+YJV0ACgkQ3SOs138+
s6EUag/+OjWxEB4buJmoqYw0Rv+8ij1VT1G6Sh9iz75VISwmL6uRFeB3kAECbmpO
HY3HsZImaMg9qrDj+FRpXO+1mdKNUB3Bj0nhX3r39Ng6kfj+JQ1LB5p0zjGMXGpj
JECXzD7KIS21xiMZQDZKWF+FJQeJNwNZiBtQlpR1+CNtdLOL8kb3nwRfV1u/fwmG
v835gDSON0zLC5xgNpSchOvuf2SUze90N65hb9S7C8eo0U9fsBa64quS8+kzi/qn
h6rQVPUoElFh+rtthgslcgN/a7eiiKRfjxXfgX3yEcmEPwP6p2uCvZakf98y5stC
33H0Okyq1HynFA60lvAiArx+1U5iv6BFuMtQZelKAqMyZTiEMAUNYHWdSlEdNYp2
92HoBL98MkYM8fD1RHEhx95HFNEWnalA+45HKKLSU75YMkNSad4eQofRjFMr8+f9
45ewjoYSiPmWBsiIJ5SQrI5N7E/UWG1Stg25xAIBqBscCQXLMgv+3rkbxLe4oW/O
babLseIhIVNtYzP1bIcewYmSig/tmYG00RzBpQIddXESAzppjc4VtXRTk0mPWMJy
uk4aIKZHeher/uKxvDincboDjZvvyIqEV+Gt4NDnuDPubtdA/hQjwLXZaxNOWEhB
lFBJkwdhiry9LprfiUKk7GxygvRAd0qYjFM/SRB0cLyb/g7aR6E=
=TBNL
-----END PGP SIGNATURE-----

--yiup30KVCQiHUZFC--

--===============0534760453==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel

--===============0534760453==--
