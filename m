Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 691524775AD
	for <lists+dri-devel@lfdr.de>; Thu, 16 Dec 2021 16:18:55 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0448610EB55;
	Thu, 16 Dec 2021 15:18:53 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x42f.google.com (mail-wr1-x42f.google.com
 [IPv6:2a00:1450:4864:20::42f])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B701810EB55
 for <dri-devel@lists.freedesktop.org>; Thu, 16 Dec 2021 15:18:51 +0000 (UTC)
Received: by mail-wr1-x42f.google.com with SMTP id u17so44851990wrt.3
 for <dri-devel@lists.freedesktop.org>; Thu, 16 Dec 2021 07:18:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to:user-agent;
 bh=0NW4fFRtdMsPlhmkKhcfTmNZmyEs9QhErqbczxjv6B0=;
 b=kRAuUi3pHfp0vlymF4VGBZuEwSgT02dIRWqOT35hkagh6ntcNm8yIFOd8aC3cbEjeV
 oLvppbAZRB8W2b4GctTPRBCxTvug8AbYTh4eU9SKY464yhzZoIZbkU7NStoyhZo028uP
 30G79hCtFKOTQZ41pob7oCKdpmnUyzF/WOr8HOUrKPj7pgtBjorDAt1r+B0SffNGb2nx
 PWYlXg3FMnVSoyx70RZYYypH0u6HTgYkYxQ9HgAu5RfJiVfJbT+9OBeFuOIHwD+kdpCQ
 wyyVlh6+vxWWobNr7aCMpPy2K3Psu4wUGD2t3a6B0oxiAEEZJtpoBjFYAB3fPwOhvgRJ
 rXHA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=0NW4fFRtdMsPlhmkKhcfTmNZmyEs9QhErqbczxjv6B0=;
 b=s+sLXMbCbQwhSM1nzREd3mBe4VtH5do/Gi+kift+f3fupdNJ74t8VLEfcllayFlDYL
 7uPLjQdbbRpR+uLH6GN5rf31HNsnQmE8EGJp2sRqzu44rUAPPwlV/MFN5mktGiOjIa/s
 FNW0Gopi1DpsiAXANHcEJOTwJ50jFnefe87f6CYsFse7otysbwa1gfcXCAWwI6qyT/jI
 ZzKgvXO8EcI2AUGhSamYgO7+eeikKPCGTAbcPz+sHOkXTWhDdXa4VgLuRL9OPydsi9EM
 fXDrHvuboayiWP7CyrS8R7es99lNQjEKBcLIad6tmR8Yoj0DA/0b8MW3R9YxpgsHUxjP
 PKxg==
X-Gm-Message-State: AOAM533XdtW7yB2iZFlYSyQnKzyZ7Ai52R7N8NJwn1i9tnDTiBQ2SS0M
 FySbp0YVAB//R45Cby4sebY=
X-Google-Smtp-Source: ABdhPJyy3q6RwT0+pTgk+dWoIRgzvgCOOBY61BwzAcTietGzu7v354AVmOOir3fo/hsmJoWX4Pt/IQ==
X-Received: by 2002:adf:ea50:: with SMTP id j16mr8909726wrn.719.1639667930246; 
 Thu, 16 Dec 2021 07:18:50 -0800 (PST)
Received: from orome ([193.209.96.43])
 by smtp.gmail.com with ESMTPSA id q13sm1597560wrr.64.2021.12.16.07.18.47
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 16 Dec 2021 07:18:48 -0800 (PST)
Date: Thu, 16 Dec 2021 16:18:45 +0100
From: Thierry Reding <thierry.reding@gmail.com>
To: Dmitry Osipenko <digetx@gmail.com>
Subject: Re: [PATCH v4 08/22] ASoC: tegra20: spdif: Improve driver's code
Message-ID: <YbtY1TfX3rdVbkzG@orome>
References: <20211204143725.31646-1-digetx@gmail.com>
 <20211204143725.31646-9-digetx@gmail.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="TtAaL1I0tfYEZFLw"
Content-Disposition: inline
In-Reply-To: <20211204143725.31646-9-digetx@gmail.com>
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


--TtAaL1I0tfYEZFLw
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Sat, Dec 04, 2021 at 05:37:11PM +0300, Dmitry Osipenko wrote:
> - Clean up whitespaces, defines and variables.
>=20
> - Remove obsolete code.
>=20
> - Adhere to upstream coding style.
>=20
> - Don't override returned error code.
>=20
> - Replace pr_err with dev_err.
>=20
> No functional changes are made by this patch. This is a minor code's
> refactoring that will ease further maintenance of the driver.
>=20
> Signed-off-by: Dmitry Osipenko <digetx@gmail.com>
> ---
>  sound/soc/tegra/tegra20_spdif.c | 49 ++++++++++++---------------------
>  1 file changed, 18 insertions(+), 31 deletions(-)

Acked-by: Thierry Reding <treding@nvidia.com>

--TtAaL1I0tfYEZFLw
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEEiOrDCAFJzPfAjcif3SOs138+s6EFAmG7WNUACgkQ3SOs138+
s6GwvxAAvJ61geFKAbm8cP5N+pEbKgtEihkMw5PcFuU3W2atATXHSqSBZfJLV4ze
A8EQ0s+6vh51dP9aXYxgKU3eiuilqw97kCSNPEwmq9kOiDe/ls7Z/hoEW/Djsir5
wHOa7uBq4+10I4UNMlJQNs5XX9+bp1ajTmH5ia/KiTcburoqT1P/UllLwjboBgRm
k9P3LKjBckI8u9wRx9meYGxA712IxAyOmbdlfHa7SlGKwXZw7aO3K2wuls7QAdZw
NTSkpLHUbgQW9VIAyRIIA2iczZHlwm60Y43Bo6RRTlx8vH1pPlTikqFB+VMZHH4E
awm7aD0p+VpvM+gBN2+cjmwlWsUXvVp34rQYZ4dR+bY078R4EOTA+nyMS4Z+693G
kNwjF+02na0InBnxDg3VFKCCd+O72A+r5ydXcWDw88FhNy5D4kUIZl+EFBKBmMb4
AWl/HxMmM13IVSfu4NpgpCpjqNaOAQokybxCH4YHs9JIUcHAP9XZR2IKTVxZaerC
NxQqpp9BfrOiIevdNifxpp7XL7DA6yjpck7iYMFzrcZDkc2gmIb9jiS2Cn8Szwjq
emDETf5gob2Pn4atJkeP5koMR57wmi70y7ulhTqtJtNjGCUlW2ahYykNoTjaueiw
b/nN6nrnayfCg8YIh81xMas2Q81sANyy8a3JLwTj+0HqHBovOWI=
=wYWM
-----END PGP SIGNATURE-----

--TtAaL1I0tfYEZFLw--
