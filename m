Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 55B7A477588
	for <lists+dri-devel@lfdr.de>; Thu, 16 Dec 2021 16:15:41 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 00B8710ED68;
	Thu, 16 Dec 2021 15:15:39 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x433.google.com (mail-wr1-x433.google.com
 [IPv6:2a00:1450:4864:20::433])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4478D10ED68
 for <dri-devel@lists.freedesktop.org>; Thu, 16 Dec 2021 15:15:38 +0000 (UTC)
Received: by mail-wr1-x433.google.com with SMTP id q16so4006569wrg.7
 for <dri-devel@lists.freedesktop.org>; Thu, 16 Dec 2021 07:15:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to:user-agent;
 bh=7wfg2/f35dLEMNUi0braWFcvM9LG6JIBQ4wa0N2N+9Q=;
 b=K02jPVe6FfJPLsLfOx6aLSp6p2GvtVyyz7N6wDtzqIwXsRCI4cTDLOe3AKp/5WWZ9g
 sa+qFEoZ3X2OCvjCH4yFnmUGwx5VQOjbev+QAKRnZUMDQcVfYWE2/yLAzske3Jr4Id5A
 SKidD2w+NPbkRjjo7K2D+Bx8A9tJl/jFxUABwzf/HbgUSInjC40geoKXb4UmyeJrkJMT
 97XSUhRI2rjVTebRnT6+dh5GvtcMvepH3YeRMrGljKYUG9YXfTRfIX0NHDA6F/4XJvEi
 hblnDIJzfcFP9Gssy37L4EB/WzIcSXrDZWLJ3iTgUAUDsEgCKhJfnOh8wHEsuIn3WDkX
 /kHA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=7wfg2/f35dLEMNUi0braWFcvM9LG6JIBQ4wa0N2N+9Q=;
 b=P+Whnym7LqFf8xb0kmbtNzAdeaWe9RqYeTIBuaqV32EfUf0GT0/XmTEW4dCGXF5/eN
 /4KDYEYqHwx0AQi0d+QjIHNKesHaibKnNdMjoj5c0bdB/dTH22IahVLNu0mfZshaBpln
 nrOXUAPrcR3rVwRLh3lPJc8M01hbI9TZapbM0Kx6ba4QwVFMqXzlpGzk2yVvtClOq+c8
 DQUVgLpTbpsb9Gj5lI6jN9CC0ycctRJa4VZtTTz3LG5tj1vUPuoKutM3tKqTSd2N0lxN
 KgGCDU7V07RBvM/fpwCNYxLfGoRGNyBn/e1cOfjKb9C8CpnZtpByZJilk14Z7t/BOBZI
 /MIw==
X-Gm-Message-State: AOAM532GzrclY3ekDXJDVXBuAzWh/s1RscxpfFGNWUY6ElIFoKH+0Yj7
 WW0uofkOEDzuii+vEifbRjE=
X-Google-Smtp-Source: ABdhPJxIjZcHYAgIzHJzFSWBtF2xpwNn98/7KzUbICH6lYJeYtkqC0HoC7Z9nFPbaR5XJD+omsmD6Q==
X-Received: by 2002:a05:6000:18a8:: with SMTP id
 b8mr9330098wri.166.1639667736757; 
 Thu, 16 Dec 2021 07:15:36 -0800 (PST)
Received: from orome ([193.209.96.43])
 by smtp.gmail.com with ESMTPSA id n8sm3760461wri.47.2021.12.16.07.15.32
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 16 Dec 2021 07:15:34 -0800 (PST)
Date: Thu, 16 Dec 2021 16:15:30 +0100
From: Thierry Reding <thierry.reding@gmail.com>
To: Dmitry Osipenko <digetx@gmail.com>
Subject: Re: [PATCH v4 05/22] ASoC: tegra20: spdif: Set FIFO trigger level
Message-ID: <YbtYEml9OwaiO5IC@orome>
References: <20211204143725.31646-1-digetx@gmail.com>
 <20211204143725.31646-6-digetx@gmail.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="2AOAozvC3BJfdqc4"
Content-Disposition: inline
In-Reply-To: <20211204143725.31646-6-digetx@gmail.com>
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


--2AOAozvC3BJfdqc4
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Sat, Dec 04, 2021 at 05:37:08PM +0300, Dmitry Osipenko wrote:
> FIFO trigger level must be not less than the size of DMA burst, otherwise

"must be bigger than or equal to"?

> audio will be played x4 faster that it should be because part of the DMA

"faster than"

> data will be dropped on FIFO input buffer overflow.
>=20
> Signed-off-by: Dmitry Osipenko <digetx@gmail.com>
> ---
>  sound/soc/tegra/tegra20_spdif.c | 8 ++++++++
>  1 file changed, 8 insertions(+)

Makes sense:

Acked-by: Thierry Reding <treding@nvidia.com>

--2AOAozvC3BJfdqc4
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEEiOrDCAFJzPfAjcif3SOs138+s6EFAmG7WBAACgkQ3SOs138+
s6ESDA/8DbIeZESt+My1mOIlSYpY4fVQpZkFchjl7VTpEtVebjXYgEHv4vGjmjY/
OGd6DleF7MQc8GDZXXpTUgHXu6N3wR07FAPLv+2hwOy+ikYbSkvEcPRouU9bqXPP
q0YaU7Uk4Rap6tXZt5Hftj4s1bCaDY7IpLx+24RMJT2s8OJtgSnlqe1YOAiXyEBk
UZxAJztbek7OXcellOsfMj0ZctB68jS7cOt2/hQ/0W+q6hkwksORs2XbD69wDDsR
ffq4z7CoZhxtZe9dxxphzXb8UaRr+40QmIRmtGFXS986geXAybN37lh7WZvC+Q4E
FmQFh1xIdUqbGYdJfOCCsUnxdG1Fcp0+vuiJbRfWWgrKPQYvbSz1pyMyOFTgFxXH
GcBz20DGnj2X86pvObeTVeLJqz3s9joZwbzhTTgL6osmUp3urxyl7A4jhKVK6vYZ
lvUTBjpp9N7kKQ4HvKy3lc/mj3dt84Gn+Zxna1nw6MLlvwPp/81aUBq82sqISfiv
iX87GcjYWzna2P61nKCX0GvLDs3NIbvPPQeBJ+TCYYhnVuNphbgFNa7Br1eJH3PD
I7xZBuSgcMLy4LPatILEZHWk2fYrrX3Oa6kK4XbBiM+Cuux5orZ4VtDtWUtTxEX/
dT2QwTi4s7PLXBGNYeA55d1mVvcKhIMicExH/ZQam5cdA+zHQYw=
=Wn5s
-----END PGP SIGNATURE-----

--2AOAozvC3BJfdqc4--
