Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 7B5D629ACB7
	for <lists+dri-devel@lfdr.de>; Tue, 27 Oct 2020 14:04:34 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 78E9489817;
	Tue, 27 Oct 2020 13:04:30 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ej1-x644.google.com (mail-ej1-x644.google.com
 [IPv6:2a00:1450:4864:20::644])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6E0B189817
 for <dri-devel@lists.freedesktop.org>; Tue, 27 Oct 2020 13:04:29 +0000 (UTC)
Received: by mail-ej1-x644.google.com with SMTP id bn26so2106871ejb.6
 for <dri-devel@lists.freedesktop.org>; Tue, 27 Oct 2020 06:04:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to:user-agent;
 bh=+uRUeR/hNBQddSgcO166WdWvgbjFImRejeVy9hATgyc=;
 b=EyA65ZmKIDgbELTunD6eswJw1OFdRTjqZkMMGk12M6zES+zDeaMqPelQX6kKcExW2J
 sQ8iFJZ9CWPIcrwJS8rtR54Sg2fRDNkjrxoAEr2F1hm2JzunOtnzqJXzvju2QG05bUtV
 GuETLblQo1JSSU9vVy/dnvp27xbPNFmE++fSxgqQqtJwgTDg0nEX7xkz2kZxT8cNtoFf
 N+7EJrKUC7Hr8h7m6TKxpVuFKYzjMV9ahPo4r5KCApNmevtp8OuYA43HNmRv3OGOMAuO
 B5qGrDa1ZA+fd6HNw9RLW4ZSf4OcVGvPVwN3gKJ4mXxFGyJ/PwIf2DVv5+7qtKg3dWC7
 n5LA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=+uRUeR/hNBQddSgcO166WdWvgbjFImRejeVy9hATgyc=;
 b=HxaoJXMwOTcX38h5ThnGBHZQZtQWG5B/IvUQKHf1S1bBy71z8SgqFAwjl2G/KnA6dM
 IByZ2f/bGnCZeOwcpMiUl1mySIl9nsOTKz+k7BWSLvTuwxg6VyDcxIaCazBj+RhA8LD3
 Esd4idlee2t6uPhfFSCoqawSKWCBQc8pfaojxziGgibwG4FBc7mwhAUnMrLDXXSWHwee
 PPW1R0u69T5RvgJ0syFRTTlyoiRa2O9OgQ3SwVpd6+pOK5IdErTLOuQ5xSppY3dkrBFB
 vJej8dIaQvcOSMEImnglnwlzA6+7McSUrH1t3Ybl3B6wPcj8iXeA2Sg56pbrO+d3YVli
 VfpA==
X-Gm-Message-State: AOAM530ggS/gULYvBf19uXortrC5K0CyDjEnXg3GmNVHw3FTRQGwLJdb
 4hQJOATjTva0+DYqg41H//Q=
X-Google-Smtp-Source: ABdhPJyN7OogsAv0LGMxmo8LCCXIRgHg56DytYueYZCsWNSDc01Fl6Cqpqd9fSVylgF/Cd9IrYWOuw==
X-Received: by 2002:a17:906:76d5:: with SMTP id
 q21mr2401953ejn.415.1603803868036; 
 Tue, 27 Oct 2020 06:04:28 -0700 (PDT)
Received: from localhost ([217.111.27.204])
 by smtp.gmail.com with ESMTPSA id p20sm1047296ejd.78.2020.10.27.06.04.25
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 27 Oct 2020 06:04:26 -0700 (PDT)
Date: Tue, 27 Oct 2020 14:04:24 +0100
From: Thierry Reding <thierry.reding@gmail.com>
To: Dmitry Osipenko <digetx@gmail.com>
Subject: Re: [PATCH v6 01/52] clk: tegra: Export Tegra20 EMC kernel symbols
Message-ID: <20201027130424.GD1822510@ulmo>
References: <20201025221735.3062-1-digetx@gmail.com>
 <20201025221735.3062-2-digetx@gmail.com>
MIME-Version: 1.0
In-Reply-To: <20201025221735.3062-2-digetx@gmail.com>
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
Content-Type: multipart/mixed; boundary="===============1293460914=="
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


--===============1293460914==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="pQhZXvAqiZgbeUkD"
Content-Disposition: inline


--pQhZXvAqiZgbeUkD
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Oct 26, 2020 at 01:16:44AM +0300, Dmitry Osipenko wrote:
> We're going to modularize Tegra EMC drivers and some of the EMC clk driver
> symbols need to be exported, let's export them.
>=20
> Signed-off-by: Dmitry Osipenko <digetx@gmail.com>
> ---
>  drivers/clk/tegra/clk-tegra20-emc.c | 3 +++
>  1 file changed, 3 insertions(+)

Acked-by: Thierry Reding <treding@nvidia.com>

--pQhZXvAqiZgbeUkD
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEEiOrDCAFJzPfAjcif3SOs138+s6EFAl+YGtgACgkQ3SOs138+
s6FhaQ//XAnzBLQ57FAARJLAiQ/+/J7Z6eHOKF54sUk1tMNp3gRDg1hMQU8FJuhj
GyqgQyr00w43RXQxTjb3hi27kHTfnRexwVLYwh24TloeOYix2+FYm6IT+eSfOPRJ
SnjM9Y/ZMWnq914HhBQoy05aOcz1Gy2nS643L68h3yyVlxPWtUBvw/S0YuPbO8MO
c0R5cXOTwN0RP/HQhnBjFlvP+ICC0yB3vq9q0UQBiZqQfEzXvneIpGPJUpjEMX/u
uICY++vfNgf+sX4VzvIUegPscYHIziI38tRQ6LkCO4gCfyMluZHPIF4Ko+te3nbs
eJP2LzTiGrVwaCNT5CY5JCQEtq6HgEDEcJLa/8hUgRGHaiEIOlcZ6MyrO1PXf1/u
HO7gyh1m/+OVsgA1TJuabKMinojW2y+hdD24FfE8Y8LUOEd+oopV/id+z3Ew/iOi
61Dk/ZzYyMFvoBTet9W+W9+O0B+j0RIeiaxPZcHrREfn2+kCdrNAadjXUVpOTHpf
glXrDyEcxHAKtxamXlgqmRFTzt6YTNUDtcqdfXcjGPMwy94un0Tyuff4b15IjEX3
83y19f9svCLYnPghUhd4/WOHA94lgfZztFs6z+2zM8FHXl/eSwZq7jytrWIWP2Qc
55r/DZspHda6fZOvFsYkvVDJaiRdZxy8OkfcedC6FWHQJGuhrKs=
=MO9E
-----END PGP SIGNATURE-----

--pQhZXvAqiZgbeUkD--

--===============1293460914==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel

--===============1293460914==--
