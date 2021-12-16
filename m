Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 4AFDF477459
	for <lists+dri-devel@lfdr.de>; Thu, 16 Dec 2021 15:20:31 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 37392112227;
	Thu, 16 Dec 2021 14:20:29 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x42e.google.com (mail-wr1-x42e.google.com
 [IPv6:2a00:1450:4864:20::42e])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 839B2112235
 for <dri-devel@lists.freedesktop.org>; Thu, 16 Dec 2021 14:20:27 +0000 (UTC)
Received: by mail-wr1-x42e.google.com with SMTP id o13so44409761wrs.12
 for <dri-devel@lists.freedesktop.org>; Thu, 16 Dec 2021 06:20:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to:user-agent;
 bh=2aMnjU7hIQzPIODNPQxr8yp+39K6YzUUOxZgZZF/gHk=;
 b=jEXIJan1huk1UQpmmCmNfmwqrd4qKANO5zNtO8Iijqax4fsDmJvFxqBEI9x5qrcgfq
 Ye8tnshx4JVdfL4kZBqhxOzJ2xMFLrThaclAwSTQmw/2fs0XZaIGl4xlTA6Vf/ebNqwF
 sO2rK2ZGdWMbB6Fbo08LnCIjOBiU6gTb1Lk1WGlvdpWNfnRStY1ulhBlmov2PZzKUzJK
 ZDdHZUNzPxPjFmX6KnFQysxSD0QIfXb2jSCBjNOFPbIxqLjcmJeNfzGyRNWrqkMJo6xv
 G1joetmCmqGyaqWacTWR5NhiGJ4DfQ3vKCg/5K55qhCws8gH9Vja2Ua4hpztSGsIqdSu
 Nbeg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=2aMnjU7hIQzPIODNPQxr8yp+39K6YzUUOxZgZZF/gHk=;
 b=CG+JMIlMIv2Gdh71Vy18MsVmgYkraRqr5i7KGjMYaQ0qfsfyhy50tJ60mH/dTagLlk
 zsiZ/lZ/Bd1jpdVZ1MGSqTjkLf6ErKeXv0DtdGJJhboqpuyBYwX3Wn4tZYbbO183OEA2
 yOHaAWQ5Lweft9Khc74JDvh8HneO/LBBOPjAG94vszlgBLzf/UL9ix98AHgzb3gZBPx7
 beonaFWEuF1zUhNiw7Ub3F6dVuEKmgnfjIGgXsoVEotloSQML30qfy1jyiYPSvwg0/rE
 U+IaygiJ7a9OXeo2Bw9TKbghczbBINtJl73TCUdCwM+7FRLg3htK/aObdUA9/qxYW5uL
 oVvA==
X-Gm-Message-State: AOAM530NqdMiBbF0EmIq9R6xIYCarJtsK3YI0iqVtnblXm/7LTc2B5lR
 SyN2XnxKzGvNc+ObEVd3ofw=
X-Google-Smtp-Source: ABdhPJzyhdKgbIYkyLmJVEDx2jsU2zymKPqxvGpbsD2mBizBJldfL7d0I25gv5R9KPE9gf994HYdeg==
X-Received: by 2002:adf:f68a:: with SMTP id v10mr8139833wrp.212.1639664426137; 
 Thu, 16 Dec 2021 06:20:26 -0800 (PST)
Received: from orome ([193.209.96.43])
 by smtp.gmail.com with ESMTPSA id q13sm1460504wrr.64.2021.12.16.06.20.23
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 16 Dec 2021 06:20:25 -0800 (PST)
Date: Thu, 16 Dec 2021 15:20:21 +0100
From: Thierry Reding <thierry.reding@gmail.com>
To: Dmitry Osipenko <digetx@gmail.com>
Subject: Re: [PATCH v4 04/22] dt-bindings: host1x: Document optional HDMI
 sound-dai-cells
Message-ID: <YbtLJeIxXlVyQhd3@orome>
References: <20211204143725.31646-1-digetx@gmail.com>
 <20211204143725.31646-5-digetx@gmail.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="s6xvmThKn00W/gOE"
Content-Disposition: inline
In-Reply-To: <20211204143725.31646-5-digetx@gmail.com>
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


--s6xvmThKn00W/gOE
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Sat, Dec 04, 2021 at 05:37:07PM +0300, Dmitry Osipenko wrote:
> Document new optional sound-dai-cells property of HDMI node. This node wi=
ll
> be used as endpoint of HDMI sound DAI graph.
>=20
> Acked-by: Rob Herring <robh@kernel.org>
> Signed-off-by: Dmitry Osipenko <digetx@gmail.com>
> ---
>  .../devicetree/bindings/display/tegra/nvidia,tegra20-host1x.txt  | 1 +
>  1 file changed, 1 insertion(+)

It's probably best for this to go through ASoC along with the other
audio-related bindings.

Alternatively, I've just sent out a patch that converts the host1x
bindings to json-schema, so I could work this into that as well.

Thierry

--s6xvmThKn00W/gOE
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEEiOrDCAFJzPfAjcif3SOs138+s6EFAmG7SyUACgkQ3SOs138+
s6HU9Q/+LJiPotWXIHgjqddwtzU6/HD7NNzSDIDIQzl+FQCjYyWmJCFfhyIgmI1O
3t27pQ7abUhhsvr1oZr/+vnUpw/ZGekjOTA7cuqXWstDJfVpKtALJXwqqNvn059V
NDBYXE9IvoNnPWZlKZpF+RvPxBekzBOOG7zQ8Ig/2JwhG/caYnzRYNsH1GF5NOhN
8zbP5CrTY+jRpaKWF5J2oXrvS+EmV0tYuleNpJsZttYhPwWwbyE6Nk12WNqacnEW
vGBSNv/DeO2yPvcfxvn15SXPFRo93hc1JdoiuGKUrS38BoKCjQj4yA5DTFgp9MVz
tLzMZ38YlZS7hwxrlhzGjNPyZmZ6e7o09cj2CgfYzL++fJC0PzTXK9bPkwBpnmB8
TT9TCAVZE+KUpExyiOroT6TmpJRl8ETH+x/cUOltkPwtpl1eKIS19l1qFuTqp3x0
Uh5w4Wg96EeqRlf8BDw6l7748TmED1Z4BqiyMZ0SrDAxF8fzalxsoIgfZ9xrn2u7
xJIoigBHB2gHjVfaDFxOx3eHTioW9xQCdjMC0y6vBbJYPjw1lXz5Sc1n84k3Wyij
Gd80HQ68NLb2hcERYf6Rbl+jVnibKYrS5HEuA9bGU0gU/HEoTqEJTAicFKHu5PwH
OjRKjFar0sFhYQtFVQh77Yb7CQzlV4dg9ywdLK718KnY9IlzipA=
=InZN
-----END PGP SIGNATURE-----

--s6xvmThKn00W/gOE--
