Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 1ACA644E4E4
	for <lists+dri-devel@lfdr.de>; Fri, 12 Nov 2021 11:52:58 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 83E716EC19;
	Fri, 12 Nov 2021 10:52:52 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x430.google.com (mail-wr1-x430.google.com
 [IPv6:2a00:1450:4864:20::430])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 798796EC87
 for <dri-devel@lists.freedesktop.org>; Fri, 12 Nov 2021 10:52:51 +0000 (UTC)
Received: by mail-wr1-x430.google.com with SMTP id r8so14689571wra.7
 for <dri-devel@lists.freedesktop.org>; Fri, 12 Nov 2021 02:52:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to:user-agent;
 bh=iNVobpr0uSF9aM9qI8/4Nu4IxqJVNye+v3UuU2+MbT0=;
 b=KkWO70vZ7PLKt0/KuFir4VGCEYlhRVgf2jHw+rYjjdeM/PPVghco/53xbbQFYOA1PW
 VYgxgLzJtByyhexpkTzDZ3vGdog9Nu6IsU8bhNcIH4+vlxKIrPSIM6qLM0NdDtamzPVd
 q2I9xhG1QmD6KukfS7Jr5gmp3j5o/ZELjfuDDd/HoHEEZ6Y0ETC4WJqGL8JqoH5eIMf7
 uCU/7cGtq0I3wgRSv4lHcReCfWGIl2V+7WY51sW6hls3rs9cqUXfKSIkSaLPa6hfQ+xx
 +mbByXUxbVkrE3e7LJWJop0IOn5Rmls+h0e0pjeYylvlCBGjg1eI0BLd4ybMFj8bzgBw
 +3Yg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=iNVobpr0uSF9aM9qI8/4Nu4IxqJVNye+v3UuU2+MbT0=;
 b=b47UTrOTCjgU658GmoQcTsGDv8C3lSkPg3Fwv6+nkzib6P2AW0sasg/W9dPphXxiT/
 SruofXQ993u0LaxezOsqRxFDGyayMeJ5YTkXB9Y0r//eqZ5eSRXhOMXZ1LEaO/RdVvEG
 bdLONvlWnMLOZynNGWh2yALqJ8QmnLWGIKcNY02+vLNKsxhVr65nZUyHSP9TpTExEQe0
 JGup16JO6cxsV55nd8WgV42fqi2WbEMkvdyoTWrdL1hdDklvIM4aP6Co0Wpn8ESFWoIK
 M+PM+iBuDfsydCWlmfCGvz3US2ZbnP/9c1stZcJXO6jfrldx63otCIGBiA2mg4Arw1XE
 perg==
X-Gm-Message-State: AOAM533QzThhkMFHxD1klrD6PSoDNUmPHHjLRSzlInCc2yxKVjnuNT5M
 SGzjNKk5R3IdulRIBYljBac=
X-Google-Smtp-Source: ABdhPJxt8hmwkoNxAkljX6wwnFaU6kzsqjStqBPrz83FM5iRJqxpjlAEBUOF2MaReZmhy5IknMdJrA==
X-Received: by 2002:adf:d1e2:: with SMTP id g2mr18045252wrd.346.1636714369976; 
 Fri, 12 Nov 2021 02:52:49 -0800 (PST)
Received: from orome.fritz.box ([193.209.96.43])
 by smtp.gmail.com with ESMTPSA id f133sm5426527wmf.31.2021.11.12.02.52.47
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 12 Nov 2021 02:52:49 -0800 (PST)
Date: Fri, 12 Nov 2021 11:52:45 +0100
From: Thierry Reding <thierry.reding@gmail.com>
To: Dmitry Osipenko <digetx@gmail.com>
Subject: Re: [PATCH v1 2/2] drm/tegra: Use drm_dp_aux_register_ddc/chardev()
 helpers
Message-ID: <YY5HfUUSmnr6qQSU@orome.fritz.box>
References: <20211107230821.13511-1-digetx@gmail.com>
 <20211107230821.13511-2-digetx@gmail.com>
 <YYk/jfcceun/Qleq@phenom.ffwll.local>
 <0a2c02ae-3fe1-e384-28d3-13e13801d675@gmail.com>
 <YYo9IXjevmstSREu@phenom.ffwll.local>
 <857a48ae-9ff4-89fe-11ce-5f1573763941@gmail.com>
 <efdc184a-5aa3-1141-7d74-23d29da41f2d@gmail.com>
 <71fcbc09-5b60-ee76-49b2-94adc965eda5@gmail.com>
 <49ffd29b-eb64-e0ca-410c-44074673d740@gmail.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="S/soAJF3g9rQohRZ"
Content-Disposition: inline
In-Reply-To: <49ffd29b-eb64-e0ca-410c-44074673d740@gmail.com>
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
Cc: David Airlie <airlied@linux.ie>,
 Thomas Graichen <thomas.graichen@gmail.com>, linux-kernel@vger.kernel.org,
 Jonathan Hunter <jonathanh@nvidia.com>, dri-devel@lists.freedesktop.org,
 Thomas Zimmermann <tzimmermann@suse.de>, linux-tegra@vger.kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


--S/soAJF3g9rQohRZ
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Nov 09, 2021 at 05:39:02PM +0300, Dmitry Osipenko wrote:
> 09.11.2021 17:17, Dmitry Osipenko =D0=BF=D0=B8=D1=88=D0=B5=D1=82:
> > 09.11.2021 17:08, Dmitry Osipenko =D0=BF=D0=B8=D1=88=D0=B5=D1=82:
> >>> +static void host1x_drm_dev_deinit(struct host1x_device *dev)
> >>> +{
> >>> +	struct drm_device *drm =3D dev_get_drvdata(&dev->dev);
> >> And platform_unregister_drivers() should be moved here.
> >>
> >=20
> > Nah, that should cause deadlock. This ad-hoc is too lame.
>=20
> Actually, there is no problem here as I see now. The host1x driver
> populates DT nodes after host1x_register() [1], meaning that Host1x DRM
> will be always inited first.
>=20
> [1]
> https://elixir.bootlin.com/linux/v5.15/source/drivers/gpu/host1x/dev.c#L4=
75
>=20
> Still I'm not a fan of the ad-hoc solution.

Could we not fix this by making the panel "hot-pluggable"? I don't think
there's anything inherent to the driver that would prevent doing so. The
original reason for why things are as intertwined as they are now is
because back at the time deferred framebuffer creation didn't exist. In
fact I added deferred framebuffer support with Daniel's help precisely
to fix a similar issue for things like HDMI and DP.

With HDMI and DP it's slightly less critical, because a lack of mode
support would've created a 1024x768 framebuffer, which most HDMI/DP
monitors support. However, with panels we need to ensure that the exact
mode from the panel is used to create the framebuffer, so it can only be
created when the panel is available.

But, given that deferred framebuffer creation works now (which allows
the framebuffer console to show up at the preferred resolution for HDMI
and DP), even if a monitor is attached only after the driver has probed
already, we should be able to make something like that work with panels
as well.

Thierry

> > Another solution is to defer probing of DP AUX driver while
> > tegra_drm_device() returns NULL, but it's icky.
> >=20
> > Reverting the original DP AUX DDC registration order is the best option
> > so far, IMO.
> >=20

--S/soAJF3g9rQohRZ
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEEiOrDCAFJzPfAjcif3SOs138+s6EFAmGOR3sACgkQ3SOs138+
s6EHgRAAoIDj2P+UNQ4T3bSA3g7NyqrteKqplIUSd3ratHZCAh6cqSte/7oLo/kd
VKYOMALWSy/I2FFVqQAQjGhRa/YnAt1e7BF7fMYf2dNTPlxwBBOoVscqWUxxR+Dr
XDmYvWL8zcZDe2bMObMTKlp6SDn9wSjFLyNCYcvqq6qcK9fdskWw66tgXyEAL/8J
AffMB9etD7Ubb3HzFV/NHyBfFi4qlYoGeQvE91thQqS+QXvkb399usoNg8jQDUXS
ThEdURRNr2zXe72EWlPACFP1E1kMG3hY60PYXfN3C7+4wcCOcuhCI1LomZQKuQhA
F6A6o2NTVLpPOR47u+id+TKkIiMZ7kAuNfdElZS4Sw1LsD63wYswf4GZjTJ/iyG5
e2Typ6BQ5LCQnuOb/RNxiUlVKa3w1V44pSvxaOgtYT6SE6LgaRTbdUOGIPnlWtHI
F/sVXmY1mDtOzTkgw6CxUD32OkNVmPxfnU9qmNbXEQuON8NESK+lo5y6/H1l/Mvb
TB1WeWwZgKjoNWl1IEzxyMQUSTpRWwjiytWKgRbobK1JpxX+wkoeVc7mrZ2rvkG3
S44iqZprimUvBTtgk1rblCrr2laqBHeEwesUcpHpDIi6AL3BeVy4J1lpBdRcJF4+
2/WmeTrxSt8YDkz73CzPR/oN5SLoUXaDD/kMMEiWGZZLF9myW1I=
=1siM
-----END PGP SIGNATURE-----

--S/soAJF3g9rQohRZ--
