Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id B5C46478AC4
	for <lists+dri-devel@lfdr.de>; Fri, 17 Dec 2021 13:02:47 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 90A7010E4C1;
	Fri, 17 Dec 2021 12:02:45 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x435.google.com (mail-wr1-x435.google.com
 [IPv6:2a00:1450:4864:20::435])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9A41310E4C1
 for <dri-devel@lists.freedesktop.org>; Fri, 17 Dec 2021 12:02:43 +0000 (UTC)
Received: by mail-wr1-x435.google.com with SMTP id v11so3550820wrw.10
 for <dri-devel@lists.freedesktop.org>; Fri, 17 Dec 2021 04:02:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to:user-agent;
 bh=Tr5yIEZjQYZ2p+adwGkgkF8tDqXpc5OjOnc2gRNbi6o=;
 b=WaFceP/6+niHOPu1d/clw3GWr7WhtmO372bdP1SuJHU2qWfwWdGzTweDpjn0dDsF+U
 RN3pqpZP5gd9Ar1gU4E0C79SY1mcRC5xm8TjB+8S+B6EkUfMr+e+BSXVBOvPj+2F7XrT
 fcB8L2laS422LftltYamYC8scAZUzvI90T8cJGRxSezH7EnVgIO4VIo1a+O2Qu9yp1Ad
 4CArAkwOl6dZ85gRc+lSdKLOFBWuwYqh1UrywgAwkKfgPGbjymoEO1wgqCPcntDMNmxP
 pd7ccQoz3AfLSTE1FoAqEtU+1OE2AjRUWfmK/QNWDGypH+oS1SBDbH7mDNTh0et8rgaY
 NO0w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=Tr5yIEZjQYZ2p+adwGkgkF8tDqXpc5OjOnc2gRNbi6o=;
 b=npbiWgCwPN9xxNUABSmKTnPHAbkNivWIR2h5woYlWUx5IbXEAel7IBf66S5Jhra5CV
 PKZZKy3yIBMhvche93ojBpOStZNhDJp/X/rpfWBva1rUKAFtBcXldW0HGEAMe5rS2By8
 MOQvrBFcc4GbJDlzVcUVAlZ/Ge1mxt1KL28alCyA3qDYxZEfRmuW24DzY6MIHyzCS1Oq
 uCIAFjyljLVJw4VDXPK2Oxq/QWF4NGx+EH/Mgr78M/y9o60fvNa0X1riXtWoSYnX/fr0
 webxeDuLBMNl20cPX6Ht/kt2ANM3X6irnIwGvxg4WT4YDJEuNhsiOizYApoBFfTslP5t
 JxOw==
X-Gm-Message-State: AOAM533Mrz1L53SeQxo2gMf4s3IzOjans5LNLmEncqtagwfMAm45DxjM
 nqk0oBfFj8ySCo3cUT//ZyQ=
X-Google-Smtp-Source: ABdhPJw4ZQ3dUuPlJoFNie09ZzRDgUHAXf1rEhM78HrqZ7fZQsb18VvFg7K/ACzkxKgaYL2sk031Kg==
X-Received: by 2002:adf:d1c2:: with SMTP id b2mr2294759wrd.114.1639742562100; 
 Fri, 17 Dec 2021 04:02:42 -0800 (PST)
Received: from orome ([193.209.96.43])
 by smtp.gmail.com with ESMTPSA id f8sm553090wry.16.2021.12.17.04.02.39
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 17 Dec 2021 04:02:41 -0800 (PST)
Date: Fri, 17 Dec 2021 13:02:37 +0100
From: Thierry Reding <thierry.reding@gmail.com>
To: Dmitry Osipenko <digetx@gmail.com>
Subject: Re: [PATCH v4 04/22] dt-bindings: host1x: Document optional HDMI
 sound-dai-cells
Message-ID: <Ybx8XdLGGiQsNMTq@orome>
References: <20211204143725.31646-1-digetx@gmail.com>
 <20211204143725.31646-5-digetx@gmail.com> <YbtLJeIxXlVyQhd3@orome>
 <Ybxwovlw2GARzqUO@sirena.org.uk>
 <4edfbff2-ffd9-1c33-de0c-013a29dc286c@gmail.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="IXj1HCadON8JMIEA"
Content-Disposition: inline
In-Reply-To: <4edfbff2-ffd9-1c33-de0c-013a29dc286c@gmail.com>
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
Cc: devicetree@vger.kernel.org, alsa-devel@alsa-project.org,
 Arnd Bergmann <arnd@arndb.de>, linux-kernel@vger.kernel.org,
 Takashi Iwai <tiwai@suse.com>, Liam Girdwood <lgirdwood@gmail.com>,
 Rob Herring <robh+dt@kernel.org>, Jaroslav Kysela <perex@perex.cz>,
 Mark Brown <broonie@kernel.org>, dri-devel@lists.freedesktop.org,
 Agneli <poczt@protonmail.ch>, linux-tegra@vger.kernel.org,
 Jonathan Hunter <jonathanh@nvidia.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


--IXj1HCadON8JMIEA
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, Dec 17, 2021 at 02:55:48PM +0300, Dmitry Osipenko wrote:
> 17.12.2021 14:12, Mark Brown =D0=BF=D0=B8=D1=88=D0=B5=D1=82:
> > On Thu, Dec 16, 2021 at 03:20:21PM +0100, Thierry Reding wrote:
> >> On Sat, Dec 04, 2021 at 05:37:07PM +0300, Dmitry Osipenko wrote:
> >>> Document new optional sound-dai-cells property of HDMI node. This nod=
e will
> >>> be used as endpoint of HDMI sound DAI graph.
> >=20
> >> It's probably best for this to go through ASoC along with the other
> >> audio-related bindings.
> >=20
> >> Alternatively, I've just sent out a patch that converts the host1x
> >> bindings to json-schema, so I could work this into that as well.
> >=20
> > It doesn't apply to the ASoC tree for whatever reason so probably best
> > to roll it in with those JSON updates.
> >=20
>=20
> This hos1tx binding patch indeed will conflict with the Thierry's patch.
>=20
> Thierry, will you be able to take the binding patches into the Tegra
> tree and resolve all those hos1tx binding conflicts there?

Yes, I'll resolve all of those conflicts in the Tegra tree.

Thierry

--IXj1HCadON8JMIEA
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEEiOrDCAFJzPfAjcif3SOs138+s6EFAmG8fFsACgkQ3SOs138+
s6FWeg/9GfUWMsG7ET7lTWIluD+NlBnxKZMQQv2ePOl0oO/rXL1g7lHXKNCtqoPr
0P2+MNx6LDXX3zq7WJoP/Ts8RreqKqLh2VFVxPokNLjqq+2oOsNN4H/9Pvxl7Mul
KykMDqmDS0ZlohgxgQjNqwLW5EkwT43qjCWQV40GnI+SpNCMNgDlXMoqQBFE8reR
EQW3+gQ7i99YNHFRc+nhWsgDBBVJj89enFz/oiWp7krWeyaqfoUGvfB9KE1RCiOE
goq9Z9pgWxQVH5L2SWXWyAwh4xILuYbMs9pfifhMBEB39s37oE+jwXtlGpd2S5Pq
qyGmvgf41hDis7N2zZT85Z91vYrhlr/CA9GcePCJivYJ1avIbW8jvbFs22qpWciD
o0mf+WVo0AACdCgBuF1KTHdtU84b5Y9ZJO5GWk3RpVlbDFSFapg1v8x9xJhqLKh0
MvEa8dSjq2aoHs5fwOoGkJ5vVfyI9/11Cig0W2Np4gMc50QNXU0frOYdtyS5nkkr
UNNTtPRrgPXBmIlZ51cXbgMvmq6wBWfF/stgG77ng6KZaT+ImT1UH6FQNQ6d+VuA
FUOMdPVz1JvAQ9fygkKzntQMRLtT3D8W2TW5aVAffthBewy5+jCU18hbMOr/AmyD
ESy8QsQtlltZIOAhXm3i/2R0U1qAyHw0PTkXojmJey0W7RmpMow=
=9EvD
-----END PGP SIGNATURE-----

--IXj1HCadON8JMIEA--
