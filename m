Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 28FB7347BD9
	for <lists+dri-devel@lfdr.de>; Wed, 24 Mar 2021 16:14:44 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A3BC56EA30;
	Wed, 24 Mar 2021 15:14:40 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-x32a.google.com (mail-wm1-x32a.google.com
 [IPv6:2a00:1450:4864:20::32a])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8D4AE6EA32
 for <dri-devel@lists.freedesktop.org>; Wed, 24 Mar 2021 15:14:39 +0000 (UTC)
Received: by mail-wm1-x32a.google.com with SMTP id p19so13110890wmq.1
 for <dri-devel@lists.freedesktop.org>; Wed, 24 Mar 2021 08:14:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to:user-agent;
 bh=vjgABm8xHVXIhTgFNyGGl8fWrWAzbbNLflcWKceQnNA=;
 b=ccgkR98ZWcERYLV/CzKzwcs2nvnlp8jwnRIBMEHVYaiEx7btvyBNNCl2umNmTD1UHQ
 JWgc/bErkLKOwPFvbGSzZ1dJdEkqGtltI08GzIM1cd3zUnoc5A1j9rH5TATCOfcUI+H/
 IeY3xS0PK9z4C6ucUOlDXE4t4sxDRmZGTJuPNk4lWXQzraG50chCiguSYX70q+RadCjr
 wJnu1y2Xx4MVz1e+AJr7UJidUTrakZIMDtTf2VyzcjAnLFESp7iR+8gPpWmOhIeDur+V
 cq2H/K8RJTd1V9MkHxLMXE+VdE1+wxyrzcNxS1GkjOXWbXPh7pk/GbPHbi3B1SNGks56
 Ga1Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=vjgABm8xHVXIhTgFNyGGl8fWrWAzbbNLflcWKceQnNA=;
 b=DbZE+VyxOqO67vOz8ksBiOhAEPNLgTVAU//hF5gtXlZ2zgCdpSbA3GZXy/PV9eEzJB
 NzvIcAT8k9i+s+hhiNBv0uIQHvibULhFvHLXvL6DbXgakbBfn6kbAGXXcf8Rj18o4D+6
 9QyBU/D1Q67xGeRNvre6k8DnBPnuE9yaBthWOrAYB8xgZhSrSzH4tFegX0/4E/DKuBgo
 tV3vY7ipgKXWX2iom1C7i/VJGHz/9CQ6Rsq9KDWgr1YTTqFoLkG5D9bqWguVJIZ0Aiud
 sYgPDL2jHT9QqHMKiifVspldZ0avkJNx0k+0A3Z8wJURgl5pwS2Lbcz/vK1mh9eTk8nO
 pXVQ==
X-Gm-Message-State: AOAM532un4Nw6h+iFYWLiPLY9NbRkGsNgGNWjhRyFrBFI68ft5lOILq8
 or2SduG/pbfP7yzg9UjNfHg=
X-Google-Smtp-Source: ABdhPJyOvj1GeY/MtJ72u5NFtRr76OvRZgU6wn3YvkmCUvRWkKpYuEWGPhaiiuhVtZEXft9guX4iMQ==
X-Received: by 2002:a1c:1f94:: with SMTP id f142mr3460945wmf.180.1616598878302; 
 Wed, 24 Mar 2021 08:14:38 -0700 (PDT)
Received: from localhost ([62.96.65.119])
 by smtp.gmail.com with ESMTPSA id f126sm2840936wmf.17.2021.03.24.08.14.36
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 24 Mar 2021 08:14:37 -0700 (PDT)
Date: Wed, 24 Mar 2021 16:14:57 +0100
From: Thierry Reding <thierry.reding@gmail.com>
To: Dmitry Osipenko <digetx@gmail.com>
Subject: Re: [PATCH v1] drm/tegra: dc: Don't set PLL clock to 0Hz
Message-ID: <YFtXcTyLrBJShWac@orome.fritz.box>
References: <20210302131506.11790-1-digetx@gmail.com>
MIME-Version: 1.0
In-Reply-To: <20210302131506.11790-1-digetx@gmail.com>
User-Agent: Mutt/2.0.6 (98f8cb83) (2021-03-06)
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
Cc: Svyatoslav Ryhel <clamor95@gmail.com>, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, Jonathan Hunter <jonathanh@nvidia.com>,
 David Heidelberg <david@ixit.cz>, linux-tegra@vger.kernel.org
Content-Type: multipart/mixed; boundary="===============1564704476=="
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


--===============1564704476==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="7irehgoz3UdKwUP2"
Content-Disposition: inline


--7irehgoz3UdKwUP2
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Mar 02, 2021 at 04:15:06PM +0300, Dmitry Osipenko wrote:
> RGB output doesn't allow to change parent clock rate of the display and
> PCLK rate is set to 0Hz in this case. The tegra_dc_commit_state() shall
> not set the display clock to 0Hz since this change propagates to the
> parent clock. The DISP clock is defined as a NODIV clock by the tegra-clk
> driver and all NODIV clocks use the CLK_SET_RATE_PARENT flag.
>=20
> This bug stayed unnoticed because by default PLLP is used as the parent
> clock for the display controller and PLLP silently skips the erroneous 0Hz
> rate changes because it always has active child clocks that don't permit
> rate changes. The PLLP isn't acceptable for some devices that we want to
> upstream (like Samsung Galaxy Tab and ASUS TF700T) due to a display panel
> clock rate requirements that can't be fulfilled by using PLLP and then the
> bug pops up in this case since parent clock is set to 0Hz, killing the
> display output.
>=20
> Don't touch DC clock if pclk=3D0 in order to fix the problem.
>=20
> Signed-off-by: Dmitry Osipenko <digetx@gmail.com>
> ---
>  drivers/gpu/drm/tegra/dc.c | 10 +++++-----
>  1 file changed, 5 insertions(+), 5 deletions(-)

Applied, thanks.

Thierry

--7irehgoz3UdKwUP2
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEEiOrDCAFJzPfAjcif3SOs138+s6EFAmBbV3EACgkQ3SOs138+
s6E1XRAAp4wJgbqgYTYH9FLgeuJ25xmXJbnsEMINM4Cro0mcWnXPCUpZ1TKcCiCa
pxwtGihRgbOU8u1beBuSxK+U6VAmI2Tf/hMUPd0lsr+iyoBK4dF/WnDbswvsyD+h
cA+3B7C8hrAjPEDRvCoJy2AOuqAIaDt76H/NmYcIHXTE3vkqrqyGs27XVos4YJF6
MEuU7BMcnWQsnHmbx9Y0E6gb5mEvAy8uKSeMEOqYb2b0uMdOuN+VYkCH2IlK/tR9
GPOnbaexCpgr1KlaRQ9KQN9agtyVvq+7tZevHVblh9/VOz4IaEWcC8rMM2nNc46O
qibUiITW2qjn2hQdIxezlBVP5TvQdkk1ofNkGGpHi/bnUV8Agn8ptJn09RIExv9f
eQFXbYYRpdSNj+CaXH5OoJA8mlIHKOlyDXdI+xPdn81npecwPMfjfUqcxuaLNPTY
ySvb0qGJAM+6OVLJarR+3VN9jlJe0aNP7zrTS3LI7vxhMNq2tsUb7NrHA6fRFpBz
atgr7fvabtizdkxoMq/ln1LLnGRclB1MtOoIAzetNhuRCGv2YU1MOqr2L0XDLVk8
8cUXSH+YKRs86SYhGYji1K9g2AwWBDUGSv2hYDpYWMyDlcqcs5tGpoWTalPa7yr5
Nv3ayMVv3kjpHpKU2UywwBXAlEzn7/YdYzdrokRLXFf8i7F/29I=
=xaGH
-----END PGP SIGNATURE-----

--7irehgoz3UdKwUP2--

--===============1564704476==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel

--===============1564704476==--
