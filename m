Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id B57BC4245BF
	for <lists+dri-devel@lfdr.de>; Wed,  6 Oct 2021 20:10:52 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1D468896FA;
	Wed,  6 Oct 2021 18:10:50 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x42a.google.com (mail-wr1-x42a.google.com
 [IPv6:2a00:1450:4864:20::42a])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 67016896FA
 for <dri-devel@lists.freedesktop.org>; Wed,  6 Oct 2021 18:10:49 +0000 (UTC)
Received: by mail-wr1-x42a.google.com with SMTP id j8so11393426wro.7
 for <dri-devel@lists.freedesktop.org>; Wed, 06 Oct 2021 11:10:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to:user-agent;
 bh=GspgEi7gEA8HlC3vcceIad74+YyXqZ7ccjt2Iv6I88k=;
 b=X/t65arTQ2h0TfkDWG9Fb9j5ihqzi7S7LGTmzM7Puv5SS9IKNQUdXRnd3gfHV4xMaA
 z4FdKO623Tfx+pF0cPHurvpZI0ZXfseBCmvjpR4l51hpIX5zXUCaTyJs14uq9Om1nOXa
 cUPDrEV+YlD1IWzmIRxE3sD3iv5JSd3aevHFuJ3jugIGgfJbR7YV28zbfB9LnymE+Y1m
 gqAjviDJ5460hOb5zgTI40CjjpU60za0MqmdaZBcH/og97CFwS7C5Ntfr1JtogmL1/lG
 hhtEFta+5IvjHxjr0odeEVeoza8v7BRU8in8/DHD6ygexz9kiDW4RoAZW/uTsXi61m42
 vq5A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=GspgEi7gEA8HlC3vcceIad74+YyXqZ7ccjt2Iv6I88k=;
 b=dVnKTaowK2x7UywCyafVcZVw+EjRZe9aW9hDDvgyRj+lYJM8L7pqYRVqp/EGgO6hiV
 cgV5Vu9a0uaq29qXjas6NYZiLb4WyM4cFOLbIAzYQVb8Prj1W+zZSZqDoBIGqoESpSgQ
 pQB6bzJQVO1PuGlqbELUpunsE8TlrBeN7FTTalk/V3LjiE/+bK2K7UTv6BLS8MAa5cZZ
 WwQna5LbZB85fHYsZ6O59aQtDf2Ox7LtP9QcC5YEQ0S4Ky39H659Xu3HsbPheVRazo/w
 MY8LYQLb4eJ47YzmsPKaOAX1z4+pWln1sYp+LMOFoKku0Z20cIkTgSSniAxVlq+BJ4UH
 +vMg==
X-Gm-Message-State: AOAM531gXElZ8BrrIbns1gz/0qk9fYEUwEv4DqnC/awWfdnl3LcguH3C
 6gKZIGSFAbF+F/jFX/opvbbXo3VGlNs=
X-Google-Smtp-Source: ABdhPJy3Ettrmaaq8Pz0c7di0tGBE+rNhEfv6yZG1nMmES+tYBawVl7ZQOsmqdiH8iNl71KqTC4TOQ==
X-Received: by 2002:adf:b19b:: with SMTP id q27mr30754701wra.125.1633543847935; 
 Wed, 06 Oct 2021 11:10:47 -0700 (PDT)
Received: from localhost ([217.111.27.204])
 by smtp.gmail.com with ESMTPSA id g2sm22717368wrb.20.2021.10.06.11.10.46
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 06 Oct 2021 11:10:47 -0700 (PDT)
Date: Wed, 6 Oct 2021 20:10:45 +0200
From: Thierry Reding <thierry.reding@gmail.com>
To: Dmitry Osipenko <digetx@gmail.com>
Cc: Jonathan Hunter <jonathanh@nvidia.com>,
 Maxim Schwalm <maxim.schwalm@gmail.com>,
 dri-devel@lists.freedesktop.org, linux-tegra@vger.kernel.org
Subject: Re: [PATCH v1 1/2] drm/tegra: dc: rgb: Move PCLK shifter programming
 to CRTC
Message-ID: <YV3mpcyZH3gox1Sl@orome.fritz.box>
References: <20210929222805.16511-1-digetx@gmail.com>
 <20210929222805.16511-2-digetx@gmail.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="hcR3Tid0854ooTCd"
Content-Disposition: inline
In-Reply-To: <20210929222805.16511-2-digetx@gmail.com>
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


--hcR3Tid0854ooTCd
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Sep 30, 2021 at 01:28:04AM +0300, Dmitry Osipenko wrote:
> Asus TF700T tablet uses TC358768 DPI->DSI bridge that sits between Tegra's
> DPI output and display panel input. Bridge requires to have stable PCLK
> output before RGB encoder is enabled because it uses PCLK by itself to
> clock internal logic and bridge is programmed before Tegra's encoder is
> enabled. Hence the PCLK clock shifter must be programmed when CRTC is
> enabled, otherwise clock is unstable and bridge hangs because of it.
> Move the shifter programming from RGB encoder into CRTC.
>=20
> Tested-by: Maxim Schwalm <maxim.schwalm@gmail.com> #TF700T
> Signed-off-by: Dmitry Osipenko <digetx@gmail.com>
> ---
>  drivers/gpu/drm/tegra/dc.c  | 6 ++++++
>  drivers/gpu/drm/tegra/rgb.c | 4 ----
>  2 files changed, 6 insertions(+), 4 deletions(-)

Applied, thanks.

Thierry

--hcR3Tid0854ooTCd
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEEiOrDCAFJzPfAjcif3SOs138+s6EFAmFd5qUACgkQ3SOs138+
s6FR/A/+NGf2CguKRUKNp8H/sTRc+RzTtuFEDFqFF+U19zdqVnoefpEUeMA2PPHl
NUya5kmyfmVGKY6ZgEl19dkbWM+QKJpbFez2u8bdBGIsvga9V14xQujvoLuyH37L
PGFtjNiZvgOiij2Mzz2iQIoBByOJX3a0rX6yvJ9HGiAUQINI55t8yVCEBE81OEsQ
wPeyTny/Je7vAZMw3lbwrv4zcozeOtDOKWJUL2+fbSeCz/KWXGbIxr5aTQY2do/O
cilgeCIJ5/FIEAT/l4v0ov8RNi4j4SbQM1KtzsM6UI5W8Ej90mgSk1djZzFoQ1BR
Evn9/5Ub73rw/5sQSZAVVcLSyDqHf5JXnIxNoNSDRHaXc3dJEEFI8PmA3D+VlHqP
A5ohpG3qxXHC//O2GDYRwchyu1rdZzLC06qzTYKsPhWriR50muw9E/Z8U2aXXqrW
D62dIv/EA6F3b+Zj1XqVVDjABtXO83UvPx1vHYZd+nBGdyfsSGPrN2YSlheQ2uKt
PEUSE5NwbIbUhUmlvvGePv5a88T0rJ2F3A6JgNQwANO8lAfFpGEgQUaMD9QGQPkV
V5oBSoXxkFdQaFLKnpgBAjMfIQCba4HsCu22hcTf7cxwmQ7gj8XCfcsckBG0RacK
6FN3qfe+IRmLcA9rB6FvkePsLTgrqeRL9IbfHFokOG3zh7jJpXk=
=Gm1s
-----END PGP SIGNATURE-----

--hcR3Tid0854ooTCd--
