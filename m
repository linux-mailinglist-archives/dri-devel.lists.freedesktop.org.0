Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 521A029AD07
	for <lists+dri-devel@lfdr.de>; Tue, 27 Oct 2020 14:17:59 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EE1946E087;
	Tue, 27 Oct 2020 13:17:54 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ej1-x641.google.com (mail-ej1-x641.google.com
 [IPv6:2a00:1450:4864:20::641])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 11B506E087
 for <dri-devel@lists.freedesktop.org>; Tue, 27 Oct 2020 13:17:54 +0000 (UTC)
Received: by mail-ej1-x641.google.com with SMTP id gs25so2199886ejb.1
 for <dri-devel@lists.freedesktop.org>; Tue, 27 Oct 2020 06:17:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to:user-agent;
 bh=EGpkeOfJT8udzeeIP4D/m8toDPn+ozlWLbY7PJ5zipc=;
 b=PsNia79cOr0HXyMjtoBqTMfRZXSgpo7wEbpHhVjyO9Twd9DSmEM3Hl84UaG/uw3sqc
 1LfAfh6BzFS8ZNmoFyerno7f+Lglr1jTDW3AkIyHWzXi5F5PvBQ8PD2cCAtmLLgZ8A2D
 MFaO5+AJ0NArVLX4FbzPMZVfm4Fx1WEw7j2pp513V6EWviR7Ipn4znFKJ0gVJTjjArQa
 PUmlExVC6tFALpenIG/SMKdmTivjOLUPgt1sVX4mqR9eSvSStAmKn6Cw7HaqGyuoTLkD
 smZ4CO5Vw5fWgli6tY6I6NPn2pILXadp/7LRXZZE89cgtmDsrIykazj9sJy5VoD/zoJw
 TjXw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=EGpkeOfJT8udzeeIP4D/m8toDPn+ozlWLbY7PJ5zipc=;
 b=SDif+XMZ9r1/oLGW31Z55gfW7jrXHwtB1E8aCJRmeat+MjpgSV5wi4Y1oqAO8UdRO/
 Thmwn6qccdm7vWcTr6dwJfuX2YMKbaqrQm0svyFgXM32hHkJm7QB10XG2k5AnmxHk8d4
 G6xoxfT3QWyRlyA8G81+Qh83G63JTHqHmHizIkghF1Qd4uj2OBMoBC0wCmpUmHBSebUq
 ohZ7Hoaq5pzUCjDf8SwIai83EPzIEojlV5J0FnMYH8IG0kZnVySegKPU5bLPNZQLzqqH
 Dtnf8rR1igTL5VZUNoTTD08mXySHx2CLrZfDi4OaCXk8YfX+g7RexfGcpHBPNAhCN8Lf
 262w==
X-Gm-Message-State: AOAM532sNt8E9UJ4lQLrQPfEd0YmzK0hyGjF/UPYVSQGOwNr9lDz7Oz+
 mlX4c3eDjcxAvT9qA6usQw8=
X-Google-Smtp-Source: ABdhPJzjO83UYzZfmiS5gD2nhgDucOtcUmApVHzzYJnXM5u3pHlpkb4B+1kWphmu/QKhI+9fXCU/zA==
X-Received: by 2002:a17:906:cb82:: with SMTP id
 mf2mr2280977ejb.435.1603804672760; 
 Tue, 27 Oct 2020 06:17:52 -0700 (PDT)
Received: from localhost ([217.111.27.204])
 by smtp.gmail.com with ESMTPSA id v1sm936585eds.47.2020.10.27.06.17.51
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 27 Oct 2020 06:17:51 -0700 (PDT)
Date: Tue, 27 Oct 2020 14:17:50 +0100
From: Thierry Reding <thierry.reding@gmail.com>
To: Dmitry Osipenko <digetx@gmail.com>
Subject: Re: [PATCH v6 02/52] soc/tegra: fuse: Export tegra_read_ram_code()
Message-ID: <20201027131750.GE1822510@ulmo>
References: <20201025221735.3062-1-digetx@gmail.com>
 <20201025221735.3062-3-digetx@gmail.com>
MIME-Version: 1.0
In-Reply-To: <20201025221735.3062-3-digetx@gmail.com>
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
Content-Type: multipart/mixed; boundary="===============0570497118=="
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


--===============0570497118==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="47eKBCiAZYFK5l32"
Content-Disposition: inline


--47eKBCiAZYFK5l32
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Oct 26, 2020 at 01:16:45AM +0300, Dmitry Osipenko wrote:
> The tegra_read_ram_code() is used by EMC drivers and we're going to make
> these driver modular, hence this function needs to be exported.
>=20
> Signed-off-by: Dmitry Osipenko <digetx@gmail.com>
> ---
>  drivers/soc/tegra/fuse/tegra-apbmisc.c | 2 ++
>  1 file changed, 2 insertions(+)

I'm not a big fan of exporting yet another of these tiny helpers, but I
don't have any better ideas, so:

Acked-by: Thierry Reding <treding@nvidia.com>

--47eKBCiAZYFK5l32
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEEiOrDCAFJzPfAjcif3SOs138+s6EFAl+YHfsACgkQ3SOs138+
s6Ge8g/+K11Rea4lesG6yOqiV+tgr808eTB04GzTxW2YHYQXECxOM+h5veIlJO7A
MNYFWTnWUcUT3fG4FQUhXiy4w1h+1TpkZYiOHRxkmnCGkxhVXm7Tk9w//ndatBIo
TMSNpgcluGaAz+SZrn08yVu+0Xifrf2QC3SRXEBbYDvV2HjNvHeqSokDG4R8u4at
RM8krhnRarN612d5xkR09ffTFGdoAtfwrJ+0XS6JJpHQ/djZr2hJhY7h6oYUoz0D
pOFX1JyXcIeomkw5cKSdyE1KN+VhhsIL5emAdXDrsWdkUIjEvnprBRPDMXQmR57V
Y0OYvmldkVyDSCznhJtqinLMmXHuRWkD80KvB5sBcgk60AoIDZelvsQlHisSRYIL
jaMidBbtFkwoBxLPJ+3ReUyx8gWI7HY/bNNI2zpv1NSXdpPtdbAX1J78Fkp/xLKw
WsriAUbGiZ4WlDcNFVrJZuDSsVd6ZEroRgu1ksHU1tH0Fv8S9q2zNEL7gdR7WX6f
49mHeSGvNM9JZsVXspMdpqmnW1A8/906ZdxiZQVq6l+7UabjxQt/atWMONdDPtl4
BOEhsa3H55FM1pnAxhF32Cl98x4hjOqm/dpo0wSmnVKl7fU/dB7uY6UlC6wNbObz
XdVJigEdvPWZq83816gX5thEgB8Dt4rSzLGbtwoP09PQrjyBUM0=
=7Edt
-----END PGP SIGNATURE-----

--47eKBCiAZYFK5l32--

--===============0570497118==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel

--===============0570497118==--
