Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 40C97477591
	for <lists+dri-devel@lfdr.de>; Thu, 16 Dec 2021 16:16:47 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 04D1510E388;
	Thu, 16 Dec 2021 15:16:45 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x434.google.com (mail-wr1-x434.google.com
 [IPv6:2a00:1450:4864:20::434])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 42EF010E36A
 for <dri-devel@lists.freedesktop.org>; Thu, 16 Dec 2021 15:16:44 +0000 (UTC)
Received: by mail-wr1-x434.google.com with SMTP id t18so44749915wrg.11
 for <dri-devel@lists.freedesktop.org>; Thu, 16 Dec 2021 07:16:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to:user-agent;
 bh=YY9FZgJmPcsrvv1dDjxqyVtz1nIgdkKk67xLM0ZtgAc=;
 b=GZcyGrESDUijhcGlmAgDyEACRWE72v4x7GWiBc6yS2aH74dRCA1Y3+gZd+icRAsgk/
 jbEcpMe5d5KSkMbBICkq/rqdm7In9kQza4dIWoDlt2lPrFbK3yY4LA8oGN5UKwJqj1Dt
 YaxYzweyskLjTCLMPGTDmov4lCKWtXsCmBnQys9ei1xj2X9jFCDK3SYckJ5caCREGz2L
 z7W9HEj7osEIDxJl8Qr9dzT/KRzzkF56K6qj+GTSCbZsWklb/NK/uE5WFRQj5QHUK0CB
 hrYBrYek82ZOp7Zf8HpnFsJWo3rPyNWJDYBbyQ0wWfUJnyWKH5PEwcujoLmeJqg5pNPt
 P1Wg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=YY9FZgJmPcsrvv1dDjxqyVtz1nIgdkKk67xLM0ZtgAc=;
 b=AxPq8wcU88PLSWRohdzZ8mf76dPsrO6mRNXB3/CQWTxZtBTNJbK8UOQ1K1pl+OPM6N
 Lkw2EbgYVVbuS00ANLmlGXSiADGbr0VBJmfY9R62ORlmwfLoibaCLTLrauwELp3yJj3n
 v4cP5Js1mKvohJfC5r7mQFeVxqSNPXxxXFzU957NYveNeqAH95jD0NT8j83ae/NUqIwW
 EwAKMGJ8PLh/U012Jp7u17NFPrKU52RqCOlWcOeQt5BQg+bvbc6xnng1y4pfWOJ/oosV
 8rGItX2DlQfZlMLguV3+LesJXbytGh5rt8A9wpyLreKj3Aaomez3ZranbV8o7zgi0C1y
 II1A==
X-Gm-Message-State: AOAM531qTE9UdZ2T7twKsMRj2UqjA/dO3EXWaOkShQW8EM9bs/YLBLrx
 jcdwe4ZbdvIKXgDNqxcOHF0=
X-Google-Smtp-Source: ABdhPJxBH32FXzbEF9kfDCQM7O3XzmCGCPyYvwo7dy80ekk+7njHTBz0zzBJAx5/tRWBcopUFGXr/g==
X-Received: by 2002:adf:f189:: with SMTP id h9mr9495198wro.463.1639667802831; 
 Thu, 16 Dec 2021 07:16:42 -0800 (PST)
Received: from orome ([193.209.96.43])
 by smtp.gmail.com with ESMTPSA id b132sm4989939wmd.38.2021.12.16.07.16.40
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 16 Dec 2021 07:16:41 -0800 (PST)
Date: Thu, 16 Dec 2021 16:16:38 +0100
From: Thierry Reding <thierry.reding@gmail.com>
To: Dmitry Osipenko <digetx@gmail.com>
Subject: Re: [PATCH v4 06/22] ASoC: tegra20-spdif: stop setting slave_id
Message-ID: <YbtYVss3y8lgK1Z3@orome>
References: <20211204143725.31646-1-digetx@gmail.com>
 <20211204143725.31646-7-digetx@gmail.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="f5K+xSKWjsvh7cW7"
Content-Disposition: inline
In-Reply-To: <20211204143725.31646-7-digetx@gmail.com>
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


--f5K+xSKWjsvh7cW7
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Sat, Dec 04, 2021 at 05:37:09PM +0300, Dmitry Osipenko wrote:
> From: Arnd Bergmann <arnd@arndb.de>
>=20
> The DMA resource is never set up anywhere, and passing this as slave_id
> has not been the proper procedure in a long time.
>=20
> As a preparation for removing all slave_id references from the ALSA code,
> remove this one.
>=20
> According to Dmitry Osipenko, this driver has never been used and
> the mechanism for configuring DMA would not work as it is implemented,
> so this part will get rewritten when the driver gets put into use
> again in the future.
>=20
> Reviewed-by: Dmitry Osipenko <digetx@gmail.com>
> Signed-off-by: Arnd Bergmann <arnd@arndb.de>
> ---
>  sound/soc/tegra/tegra20_spdif.c | 1 -
>  1 file changed, 1 deletion(-)

In case you want to pick this up into the ASoC tree and Vinod removes it
=66rom the DMA tree:

Acked-by: Thierry Reding <treding@nvidia.com>

--f5K+xSKWjsvh7cW7
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEEiOrDCAFJzPfAjcif3SOs138+s6EFAmG7WFYACgkQ3SOs138+
s6Hi7A//WvSC6HaD4dz2sE4APvQvLcrg7UUf4Q12zWYMoso91uXcLGSE4K7y12yD
bkRiCDYCsAmW2VCzapWMjLeTvpoUvVQPVDnZyXT/iY53m8GThFqnhNUZV+SUu4hx
oYuH2I7i+2frmjS9b7HglTBshVz6ALvn+vCmS7sXzYbGVsv4BYc338j2P5s6R0NT
AcoYb6/pav05eUTHLq086ipVUz9FxstCDhqq4A0x/7SJcY7TvVTzel9aqD6nfEiF
LGzc7df6QzFkTkhu91FPKi0RiumCbQw4d4Gdm7c3wk3f6s6dLJoZ90HCCmxT9I+Y
jUPPIjpmZl70RNDoWByu884ySe3b02sSGY1a5oLcOuBYx/M34rMo0mj71zHEKdQi
IrD1Ayniv0NRnwNwkR7CwGJtMjB2mO15h8uEL5ujqWFHAqkwd3pNOx8m3DPo8pP0
hpgHdTy0ogufgEy+Zs/V+w17WQVH/++zlxRJHvjfjWaAmJgBIP5jDJKpOtsZFxjd
YLY35vN7331mQkzZZPfYyCna7q1qHEOm3UwRNzyVp0fuozZHl0GQBRQDB8q7emQB
RROAE/QWJd7we/mF85Wfs8nKfYinG/iLM22oMZ6ZHIa81CoIiAXV7Ao89pDxCHcX
A8b8dTnu42raqD/1R1Pb549QpdaPaIRHl6d43FzCPuETRCMIbpk=
=o3sP
-----END PGP SIGNATURE-----

--f5K+xSKWjsvh7cW7--
