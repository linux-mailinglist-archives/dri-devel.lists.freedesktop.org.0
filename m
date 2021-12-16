Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id E02C74775C0
	for <lists+dri-devel@lfdr.de>; Thu, 16 Dec 2021 16:21:39 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D8BD110E4FF;
	Thu, 16 Dec 2021 15:21:33 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-x334.google.com (mail-wm1-x334.google.com
 [IPv6:2a00:1450:4864:20::334])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2D7DB89E59
 for <dri-devel@lists.freedesktop.org>; Thu, 16 Dec 2021 15:21:32 +0000 (UTC)
Received: by mail-wm1-x334.google.com with SMTP id
 o19-20020a1c7513000000b0033a93202467so18331008wmc.2
 for <dri-devel@lists.freedesktop.org>; Thu, 16 Dec 2021 07:21:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to:user-agent;
 bh=EDnhGOt5yt/Q5eHlMXrXDwNEP6fA2fIbiM7ZWpn1ct8=;
 b=VHbrRdbkAMmFFx50VrmdFx9wt32X9gRxBKtODT+TJlanscSWIdaAF192rfa9sWV/cy
 tVzlZmLMyzQay1zy8gagBymEOoZBs5xF6SmJD6a08yxZyWVOW4a2dBCDz3J+Zn2wEIja
 ylRxqj7soRPq0jFA6bIkTqWwz8NLSEsHwfuWjyqbeQwL+O0+nEU0fS2Kkls5J59wF+fr
 3pytUFm7qVuXCqBXBNvvu+ArGZNwhtqoA2+uk1vMiWV8wxFZGhxQvMjWWPGe+Fs2tvdU
 oUMDoANzX03Sg+eHQlL6DeWjKQULxnf6HgQVrWgfqmHQG3dL4qMfC3PWUxWR0vdIRX+i
 kh3A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=EDnhGOt5yt/Q5eHlMXrXDwNEP6fA2fIbiM7ZWpn1ct8=;
 b=QsMraDTwX9L0sFdx6uiH/7jlXwNNUlRFDQXp5GBVDNIflYPv70DpNH5z8zFnm21p3O
 EG0oHHDJBsVmEjDLDBWjHX7JqWcto110M4GcGuJX7qVLM1OV0qDptBUTPIrtLLRbswat
 AEWFlodLShS3+PIYEbg8Wd3n+nJO1LK2U450jJZaSgAKvDgnu0AJNzyyd1vNbfZ/MYv2
 CyWPYaiLgSPAjnXrVeLE95DCXjnSmmf8fiBofx6fVb44Aa2pIQ81xS9kc5KGimOtlek3
 u9jewF1R7xJN9OtyrQVaF1KBF8Buq0RXL9iASnkE9QcxuXVVRKxutbUrgOVfhji2RL4n
 EwDw==
X-Gm-Message-State: AOAM530L5cBH6bCsGtoFwEgLKIoRC55B5LmE/pBti6NbpIhEBqIQAGx9
 D6esYpLISXi5SPR/70BDMDA=
X-Google-Smtp-Source: ABdhPJwilYtfCADToZ6QkaMbt5zJnumtsxOZMAuNZ4D/GKs7xcdpDggrZGVjGtSduqPc33LbKVcHpQ==
X-Received: by 2002:a1c:740c:: with SMTP id p12mr1586709wmc.140.1639668090773; 
 Thu, 16 Dec 2021 07:21:30 -0800 (PST)
Received: from orome ([193.209.96.43])
 by smtp.gmail.com with ESMTPSA id j11sm4945091wrt.3.2021.12.16.07.21.28
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 16 Dec 2021 07:21:30 -0800 (PST)
Date: Thu, 16 Dec 2021 16:21:26 +0100
From: Thierry Reding <thierry.reding@gmail.com>
To: Dmitry Osipenko <digetx@gmail.com>
Subject: Re: [PATCH v4 09/22] ASoC: tegra20: spdif: Use more resource-managed
 helpers
Message-ID: <YbtZdqCz6qHS2JZL@orome>
References: <20211204143725.31646-1-digetx@gmail.com>
 <20211204143725.31646-10-digetx@gmail.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="8bk+QQaNEhaPh30H"
Content-Disposition: inline
In-Reply-To: <20211204143725.31646-10-digetx@gmail.com>
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


--8bk+QQaNEhaPh30H
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Sat, Dec 04, 2021 at 05:37:12PM +0300, Dmitry Osipenko wrote:
> Use resource-managed helpers to make code cleaner. Driver's remove callba=
ck
> isn't needed anymore since driver is completely resource-managed now.
>=20
> Signed-off-by: Dmitry Osipenko <digetx@gmail.com>
> ---
>  sound/soc/tegra/tegra20_spdif.c | 33 +++++++++------------------------
>  sound/soc/tegra/tegra_pcm.c     |  6 ++++++
>  sound/soc/tegra/tegra_pcm.h     |  1 +
>  3 files changed, 16 insertions(+), 24 deletions(-)

Acked-by: Thierry Reding <treding@nvidia.com>

--8bk+QQaNEhaPh30H
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEEiOrDCAFJzPfAjcif3SOs138+s6EFAmG7WXYACgkQ3SOs138+
s6HnzhAAhjmsSsHNiLAo22R/O+NXEzqlLxBG/882IqtVa8bWgdNLWvx5VilbasbL
lJUVTEs+mVr5JYQlrHEXsMKXfb9Cc+hq/dcWSU/aQaFIp5Vy/xhFZ4iKsbwJkr5J
JoWpkvNdSqSHUFOSib3Ck5mQqeByyQbm8RVDBUtsZpD1JskZRJyqgvHF14KOsEjF
PvKp73zUoSEAU/rhbn2NhgIqnmdwXBwdUSbr3JBOtIUKe5E5uxtVu0fsFvNnoSFg
3U7FLsVMR01x2zcJ1aebebVS/Ii/oQHXABzPra2sGcDPnfAM75db7fGdvyCPxrdC
Wy3WxVcAgz5jqSYF7m4CBX9JO0uLpFJGkeP6ok2HplasPrjvbrzyVXkaUdX0/NFW
aDdZXRMgt38QkLUxd5O5FsjlQSIPhI2/nXdB6cocmKzyOC+aBlEWc/K2zsJKkPcx
sL1y0YUGWJkYZZS/DKlplMR5FIwhuX3v8tJBIwfx/1Mrk2Spp4ggbh5xml8Wi+9m
uI1mXNZP5MyiO1V4CuRIAfi+vVT72uxrb8HT8WYRkrt7IYPhqujU2TCmw93Yzk5F
MHNkJOwsFmmY9TvA1dWb5GXi7gXPPiwEWv4uOvtc8T1hX9gGAyajEbQzIvwNO/DK
eOoAS1lWs84wnYx2OpOJKK+5MkxlvgklCor9YrSdKEDW44AraMI=
=XTa0
-----END PGP SIGNATURE-----

--8bk+QQaNEhaPh30H--
