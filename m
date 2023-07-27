Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E3FD1765938
	for <lists+dri-devel@lfdr.de>; Thu, 27 Jul 2023 18:52:37 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3316D10E5C5;
	Thu, 27 Jul 2023 16:52:35 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ej1-x62d.google.com (mail-ej1-x62d.google.com
 [IPv6:2a00:1450:4864:20::62d])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5AED610E5C5
 for <dri-devel@lists.freedesktop.org>; Thu, 27 Jul 2023 16:52:34 +0000 (UTC)
Received: by mail-ej1-x62d.google.com with SMTP id
 a640c23a62f3a-99357737980so155380566b.2
 for <dri-devel@lists.freedesktop.org>; Thu, 27 Jul 2023 09:52:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20221208; t=1690476753; x=1691081553;
 h=user-agent:in-reply-to:content-disposition:mime-version:references
 :message-id:subject:cc:to:from:date:from:to:cc:subject:date
 :message-id:reply-to;
 bh=xJllZA/hraC0sGa6pdxU7i7KaLRbEl/1PrBlJ7UILBI=;
 b=h4p6ZXuU1vBEdSNIlOBnFuw7qqVQhirfehuF2YLpk2ocsttal5BhgebbKvctlmB4F0
 XyKMJP7UueyCw0y1Mgz+fk+fqt81Lhxb8Jbdy7ihMZ9HRmsA6jq0iZQn+k9P6Aq/8fWJ
 A1aeurTe7LQy+rN5H65VZH9i+o1m128BkwIRPkn+659fev3T1ABYOl0CbJGmsTOyri96
 J2NgAZ4zBY5SCfiAlIGYbC6oRtC2vx8b27YZuj10xGTqN7RzXxqJBexCfHKx2cm98S7Q
 JHN7C5stc/2PAkrl3+MercEf0DNKcAjUAJ5j90AOHT5MVaqVPcUQgr/nYB9gO34dZ3w1
 BRsQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1690476753; x=1691081553;
 h=user-agent:in-reply-to:content-disposition:mime-version:references
 :message-id:subject:cc:to:from:date:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=xJllZA/hraC0sGa6pdxU7i7KaLRbEl/1PrBlJ7UILBI=;
 b=NFe/Jo3dRHT6LWQL3nz7RraUsX8UFHd39R8AZkUm/2PTPl9a4k5+RYdA7QxyZ30ICh
 ZkZwSLtvA7N9BJ7Sfw2wkZMAGDVPFfaBxQVbeO24eJEaGsz5bh4vR7KomKBz7cvtlRRX
 ehbj6xwnmsezHUJt8YJcSXAikvPpL4OXqD6WeoYU2Q1x9N+SwNn9C/tzSY6mgKX9PEDu
 cmLl2ba/zRxoEtOrCNHonJh3y/ajPls0xtzftDI5nLHhQPE5dUUKAHFacfAJRo6ceaDV
 9r7baqaR38r797RT/19vffqzjcF4guHQPJTQcBbLZyMa2bztDrDhxt+4kBmQlC5ce4eo
 DMdw==
X-Gm-Message-State: ABy/qLYGor6h2/U6WlzEZl1F4h/TS9Dc/OfMJBiYC6dAMeyZbdb/XV12
 KJoXhftqij+mf6vI328UBJhZIH4LIrA=
X-Google-Smtp-Source: APBJJlExqeBOXFYv5p5Mp+mstGgDsEmtwT2utg6+6JlXRrZAxSp13C7iJaOCi05XZSssVb3al3ifxw==
X-Received: by 2002:a17:906:292:b0:992:4250:5462 with SMTP id
 18-20020a170906029200b0099242505462mr2748008ejf.50.1690476752525; 
 Thu, 27 Jul 2023 09:52:32 -0700 (PDT)
Received: from orome (p200300e41f1bd600f22f74fffe1f3a53.dip0.t-ipconnect.de.
 [2003:e4:1f1b:d600:f22f:74ff:fe1f:3a53])
 by smtp.gmail.com with ESMTPSA id
 k13-20020a170906970d00b009893f268b92sm983139ejx.28.2023.07.27.09.52.31
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 27 Jul 2023 09:52:32 -0700 (PDT)
Date: Thu, 27 Jul 2023 18:52:30 +0200
From: Thierry Reding <thierry.reding@gmail.com>
To: Svyatoslav Ryhel <clamor95@gmail.com>
Subject: Re: [PATCH v2 0/2] Support bridge/connector by Tegra HDMI
Message-ID: <ZMKgzmVCCGqpuVEQ@orome>
References: <20230618085046.10081-1-clamor95@gmail.com>
 <ZMKIonuTnoXcuc95@orome>
 <97EE0F0B-D1EE-43B1-A13E-510DB8FA2798@gmail.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="NiHFY5kYNQQB57jG"
Content-Disposition: inline
In-Reply-To: <97EE0F0B-D1EE-43B1-A13E-510DB8FA2798@gmail.com>
User-Agent: Mutt/2.2.10 (2023-03-25)
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
Cc: devicetree@vger.kernel.org, Conor Dooley <conor+dt@kernel.org>,
 Maxim Schwalm <maxim.schwalm@gmail.com>, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, Mikko Perttunen <mperttunen@nvidia.com>,
 Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 linux-tegra@vger.kernel.org, Dmitry Osipenko <digetx@gmail.com>,
 Jonathan Hunter <jonathanh@nvidia.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


--NiHFY5kYNQQB57jG
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Jul 27, 2023 at 07:24:56PM +0300, Svyatoslav Ryhel wrote:
>=20
>=20
> 27 =D0=BB=D0=B8=D0=BF=D0=BD=D1=8F 2023 =D1=80. 18:09:22 GMT+03:00, Thierr=
y Reding <thierry.reding@gmail.com> =D0=BD=D0=B0=D0=BF=D0=B8=D1=81=D0=B0=D0=
=B2(-=D0=BB=D0=B0):
> >On Sun, Jun 18, 2023 at 11:50:44AM +0300, Svyatoslav Ryhel wrote:
> >> This patch adds support for the bridge/connector attached to the
> >> HDMI output, allowing to model the hardware properly. It keeps
> >> backwards compatibility with existing bindings and is required
> >> by devices which have a simple or MHL bridge connected to HDMI
> >> output like ASUS P1801-T or LG P880/P895 or HTC One X.
> >>=20
> >> Tested on ASUS Transformers which have no dedicated bridge but
> >> have type d HDMI connector directly available. Tests went smoothly.
> >
> >If I understand correctly, we still need the drm/tegra patch to be
> >applied before the DT change, otherwise the driver won't know what to do
> >about the connector, right?
> >
> >That shouldn't be big problem, but it means that the patches need to be
> >staged in correctly to avoid breaking things.
>=20
> Patchset contains drm/tegra patch

I understand, but my point is that if we apply the DT patch before the
driver patch, then the display won't be correctly initialized because
the old driver code only looks within the HDMI node for the additional
properties. Only after the drm/tegra patch is applied will the move in
DT be recognized by the driver.

So for now I've picked up the drm/tegra patch and then I'll apply the DT
change later on.

Thierry

--NiHFY5kYNQQB57jG
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEEiOrDCAFJzPfAjcif3SOs138+s6EFAmTCoM4ACgkQ3SOs138+
s6EMFg/8DWd4RP4PN5NZCmhwr4RSpxepUKij2HEMxzuYsXkeK4MnmAV3WfQi9eWT
6X4gUfyxo+OenRA80NfmbkmfTg6XnS3UwcMXXtPvwWTrbsQsxB6PiTQ+LgV2Az9w
pTtaP2bUSxVm8T6QPq+mAsoXLHJivaT+ynAbPZXDdAIJ8p+72QNkyQO2QjFSoEbl
QoCMCKWcnp4yxnmrCYtTKBQNYKZC15Bwi8VLkQCmaQQ+30ioe6BYfSoKNvmClKMu
ZLu7sbVVQrzddTVVng0gt/04eQuqMSbBgp0gRGmcwGZav3b7RwMK4ZUpbyCFN2De
TqtJOhR3XzWhPx98IGmsN0NbcfGPk4lBXYvcD9SxL2aZwMzwTCwpAsorH+tTBI1I
bjCa5Iebi3aqIl88Te+z3ec4vxHk2X+++7YZOaid8JBtOXlPR+ece8KA551MBgUJ
8zHP5ESGPm1onjW07aotlTLOIBYYVGA+wKtBtaHbFVWLGWEzZPKAwjcgqAanSwyv
jYICptKYIsK/HIhTdIHP3kXEuXUk9MDKMseBky4gVrq2odu8qQG8zGZJjDVakCMx
nQKwA8T5xYlr3/eAqZ9fFnDWRfVuC7Il5Z/CHwRRJr6S5dqlUjp1EFlVvqkKqrfC
j/h/dz/fVouHa8Spx0W03i1sWaFckYcYELF3u/aJSYnnzr4tFC0=
=QV1N
-----END PGP SIGNATURE-----

--NiHFY5kYNQQB57jG--
