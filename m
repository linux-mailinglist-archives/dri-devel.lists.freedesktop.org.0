Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 33D5229ADE4
	for <lists+dri-devel@lfdr.de>; Tue, 27 Oct 2020 14:50:58 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 538D86E1B7;
	Tue, 27 Oct 2020 13:50:56 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ed1-x541.google.com (mail-ed1-x541.google.com
 [IPv6:2a00:1450:4864:20::541])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 777E96E1B7
 for <dri-devel@lists.freedesktop.org>; Tue, 27 Oct 2020 13:50:55 +0000 (UTC)
Received: by mail-ed1-x541.google.com with SMTP id l24so1496142edj.8
 for <dri-devel@lists.freedesktop.org>; Tue, 27 Oct 2020 06:50:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to:user-agent;
 bh=UpTv+N44qmDZNKSKOpBL1gv18cc8KZ331d2Wj1p0YQg=;
 b=iVBDSqXPbyhMom5M/1h/9OcQTUUSnjymUB4Hbi7C7uMD/QVVeedzxVl2zLQa4ESuR9
 gdsutuRaBNgvI0Hwfwndoil8xPNV2vDfT5jcPE8fanTz0J1XvfVP0MfF/kMdV4tH6MCn
 iO9xdNfMEX41DdMg2t0HvKjNjBvzi1WnJubsffwjg+NyFtfH9q3ZsHw+tHAMAcaIghLH
 VNgDS2enn8MUaA+nOhVH+mU6Map5nA6SoyNr5cAKK6hdjwr63AglMPcnhU5QbeXyUWPg
 yzKckeFV2spRM2FHSK7C47aAfkbmRN0RgBDEDeRFY9YdYrhm/p4QVskIzctUV8UIymWS
 GeTQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=UpTv+N44qmDZNKSKOpBL1gv18cc8KZ331d2Wj1p0YQg=;
 b=LPxXvoIXL6vhyDcIzYPNG1cxsPBOlOEVIMnOtEmgRtu23QUkZHJZjncDcog6pBAMCI
 8uvquaA1wiPUarDqOT5yz3qrnMFM1KQ3RNTRx4CPzqrVK6zL2Z+2XAC3eAbjxFRDmXvQ
 YyjTI/ZjgoFogR7OL7unDg+oD1s2hQ6w9SD5NAHe+z7ixKCSMM9oBJ2k2o0Ymkwzk+0e
 hbWCcS7i30kVUkjL9MAN2uSjLeofPy1T5HZlwKDdpO3iaFHhqa7CymXluNsj+cNw6qjj
 6hKXZFSrLs6Nfbdc29ONuotrdBhu798NKTza5vbhgBGAho6FPTaAitchbwoZ/o2ubz7G
 2bgg==
X-Gm-Message-State: AOAM531JGDpJjzcxOrDrwaS1cryieZln97c0ogcpa0BFGPHsx+ZdR9r5
 NIYjoyliSL7WAzpFcjF6uaY=
X-Google-Smtp-Source: ABdhPJzoug3kqXmwuIlVZWpSCnC1WqKifa1HHV8r4AwHgTv48ReSSRME9k3xx42F9bEE4Xx6QKYLwQ==
X-Received: by 2002:a50:9ec6:: with SMTP id a64mr2283115edf.382.1603806653958; 
 Tue, 27 Oct 2020 06:50:53 -0700 (PDT)
Received: from localhost ([217.111.27.204])
 by smtp.gmail.com with ESMTPSA id b8sm999899edv.20.2020.10.27.06.50.52
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 27 Oct 2020 06:50:52 -0700 (PDT)
Date: Tue, 27 Oct 2020 14:50:51 +0100
From: Thierry Reding <thierry.reding@gmail.com>
To: Dmitry Osipenko <digetx@gmail.com>
Subject: Re: [PATCH v6 31/52] memory: tegra20-emc: Use
 devm_platform_ioremap_resource()
Message-ID: <20201027135051.GL1822510@ulmo>
References: <20201025221735.3062-1-digetx@gmail.com>
 <20201025221735.3062-32-digetx@gmail.com>
MIME-Version: 1.0
In-Reply-To: <20201025221735.3062-32-digetx@gmail.com>
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
Content-Type: multipart/mixed; boundary="===============2023667978=="
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


--===============2023667978==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="fDERRRNgB4on1jOB"
Content-Disposition: inline


--fDERRRNgB4on1jOB
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Oct 26, 2020 at 01:17:14AM +0300, Dmitry Osipenko wrote:
> Use devm_platform_ioremap_resource() helper which makes code a bit
> cleaner.
>=20
> Signed-off-by: Dmitry Osipenko <digetx@gmail.com>
> ---
>  drivers/memory/tegra/tegra20-emc.c | 4 +---
>  1 file changed, 1 insertion(+), 3 deletions(-)

I'm not a fan of this helper, to be honest, because I think all the
churn that we've seen with the conversions isn't really worth the 1 or 2
lines that it saves, but hey, looks like this is pretty broadly
accepted, so if Krzysztof likes it:

Acked-by: Thierry Reding <treding@nvidia.com>

--fDERRRNgB4on1jOB
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEEiOrDCAFJzPfAjcif3SOs138+s6EFAl+YJbsACgkQ3SOs138+
s6G9URAAtj7PIBjSjv1nses5GEAWNmBaiDfGSjpiLUkmRQdPi+MiY6E8ka3TCPaQ
Ekhqca6aM48b4MSYkHBvSpuECG8SZMrpXTofBh11pu4OaydcdUUASsgySz/x6ARu
zK+qwwSxvPvtq6a4YYcbts0aJu4y0Gk9Sw4zXjMl0mvuB03J0yTYlWgJuFGNv92K
gGqj4cUqhkHR3WcJ9rmv7wgYo78DfNhYvM0Ux5EemnRiGpzWljNDYpTVwPaK/vlT
D9WcDj3EZpxi/hwCZLy8IsIhamHoM+BZGtkuXh77BNqz1zpKLCj+YuC4pg4D6+ux
UN3UmGNW5HK7HIc2eqMOXd7srzlQZc9jYyt0VSxYeukp5/KYCwVHhVT2zL1ryxfK
lVnWEu1SMM4+pRFLRWvgHUoTsfA0QW//fFdvB8x0nH1mEO0LLKFrnY4ariB1j9/a
wpcwTfKlSTw75KeK2sjOIQFZsVtlorIqPhRyS57fqPstxeoVfDQ8n6z+OjuZ6TWQ
Br5RGkUloMKCM0f92oWT0oPJCFUrkNFrMrXdETQ3Y0vcHQeJaER36h8ddCxB0PJt
fEOT+057askejUvy4Tx+xXPw4zfxPBUZcZq4b2n6VRfAojW66mC+rv7Y1FHVSAbo
aU/pmuqSUPw4Z8eNVQe7ZHQjHvHVulA8PmLWXvCMfjlJBhErFf4=
=ihq2
-----END PGP SIGNATURE-----

--fDERRRNgB4on1jOB--

--===============2023667978==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel

--===============2023667978==--
