Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id EC92310D3B6
	for <lists+dri-devel@lfdr.de>; Fri, 29 Nov 2019 11:13:03 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 24C4F6E8A3;
	Fri, 29 Nov 2019 10:13:01 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-x344.google.com (mail-wm1-x344.google.com
 [IPv6:2a00:1450:4864:20::344])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9AC9C6E8A3
 for <dri-devel@lists.freedesktop.org>; Fri, 29 Nov 2019 10:12:59 +0000 (UTC)
Received: by mail-wm1-x344.google.com with SMTP id g206so13593421wme.1
 for <dri-devel@lists.freedesktop.org>; Fri, 29 Nov 2019 02:12:59 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=oa7MiYiAk5GrxWDt6PpZGpH2IjwbXlZEtryLiXI8D8E=;
 b=QXLYJhUW6eeNhWIyF6fmic6HIWRD4bZj063SQ3JtLKsmuzkh6beVwQzq/icFwOPll3
 jswpAnQWa2Z2lYfOUhehv2Nmsgbr+RMXaiOkrqYrgOdDrfy2BLInx/2E6DplOxT+w7Xs
 RmxAOeZwfIVfHUykQkgTSKl2vpCoCMZCzZKqvuwpjHOwWH4acGXYMsQnyghY0Mo9jf2j
 icL2/djfckWKfTJP+qyni2qBRlwLdQXeHLnHNaePijn4KhWWWEd9Pt/zf0Y9k2VJe3mj
 lB3ekGnJ26YVW2FDdQocai3ooZd1C+AZSD/m8xBdc1gvKJreQ09BYb/R/1YZyg9WC2J1
 xVKQ==
X-Gm-Message-State: APjAAAWLC/4V4bqrRIlLmRZ15Bjkrb1d5iyqGz+VZDfX2c5lg/sqgjcv
 LIf5LefdGyEHIJXM5D8YBZhKrBWZ7d0=
X-Google-Smtp-Source: APXvYqxJzGJerIqg15/1EiUFWI6AzJxxWKBtqCrQsjszXmOjTkkY7pPk99+aVSYcHG0HDrmdqv/4eA==
X-Received: by 2002:a1c:f705:: with SMTP id v5mr13087966wmh.82.1575022378007; 
 Fri, 29 Nov 2019 02:12:58 -0800 (PST)
Received: from localhost (pD9E518ED.dip0.t-ipconnect.de. [217.229.24.237])
 by smtp.gmail.com with ESMTPSA id d9sm25232647wrj.10.2019.11.29.02.12.56
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 29 Nov 2019 02:12:56 -0800 (PST)
Date: Fri, 29 Nov 2019 11:12:55 +0100
From: Thierry Reding <thierry.reding@gmail.com>
To: Daniel Vetter <daniel@ffwll.ch>
Subject: Re: [PATCH 1/9] drm/tegra: hub: Remove bogus connection mutex check
Message-ID: <20191129101255.GA2771912@ulmo>
References: <20191128153741.2380419-1-thierry.reding@gmail.com>
 <20191128153741.2380419-2-thierry.reding@gmail.com>
 <20191129090643.GA624164@phenom.ffwll.local>
MIME-Version: 1.0
In-Reply-To: <20191129090643.GA624164@phenom.ffwll.local>
User-Agent: Mutt/1.12.2 (2019-09-21)
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20161025;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to:user-agent;
 bh=oa7MiYiAk5GrxWDt6PpZGpH2IjwbXlZEtryLiXI8D8E=;
 b=fsAUQ8Y0riz0EYLZhYjBnfBnCGqaXg+wiYPsPKoaTQkcQr8HnDt5/7jSLH2UQF7ZKO
 COqhqgavG6Bn7frGTCGPkY362hbvcCgVT68Se8P60CgUsT49rvFfjzoAvzUGqkEUOJG0
 GeRNe53KrZmesqHkE4tX+lN0miAcI12TGw25RMhBQb+khjxJdpXCxRTc57OmWTcDkVsS
 g/0TG1QnkziLJVRZkIiVZKCAQpRVrVzmkXX8H2GSY8JTmv65Yp/nxZ/G7TnNptaEboQ+
 BKk4XYTe8yG2L1a8mcK/AHiUoJI3nd2yB3jmw8g6EPqBEAdkdzdHFTPsV1NE/UOeN6yq
 vNiw==
X-BeenThere: dri-devel@lists.freedesktop.org
X-Mailman-Version: 2.1.23
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
Cc: linux-tegra@vger.kernel.org, dri-devel@lists.freedesktop.org
Content-Type: multipart/mixed; boundary="===============0048630322=="
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


--===============0048630322==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="ncSAzJYg3Aa9+CRW"
Content-Disposition: inline


--ncSAzJYg3Aa9+CRW
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, Nov 29, 2019 at 10:06:43AM +0100, Daniel Vetter wrote:
> On Thu, Nov 28, 2019 at 04:37:33PM +0100, Thierry Reding wrote:
> > From: Thierry Reding <treding@nvidia.com>
> >=20
> > I have no recollection why that check is there, but it seems to trigger
> > all the time, so remove it. Everything works fine without.
> >=20
> > Signed-off-by: Thierry Reding <treding@nvidia.com>
> > ---
> >  drivers/gpu/drm/tegra/hub.c | 3 ---
> >  1 file changed, 3 deletions(-)
> >=20
> > diff --git a/drivers/gpu/drm/tegra/hub.c b/drivers/gpu/drm/tegra/hub.c
> > index 6aca0fd5a8e5..e56c0f7d3a13 100644
> > --- a/drivers/gpu/drm/tegra/hub.c
> > +++ b/drivers/gpu/drm/tegra/hub.c
> > @@ -615,11 +615,8 @@ static struct tegra_display_hub_state *
> >  tegra_display_hub_get_state(struct tegra_display_hub *hub,
> >  			    struct drm_atomic_state *state)
> >  {
> > -	struct drm_device *drm =3D dev_get_drvdata(hub->client.parent);
> >  	struct drm_private_state *priv;
> > =20
> > -	WARN_ON(!drm_modeset_is_locked(&drm->mode_config.connection_mutex));
>=20
> I suspect copypasta from the mst private state stuff, which relied on this
> lock to protect it. Except your code never bothered to grab that lock (or
> any other) so was technically broken until we added generic locking in
>=20
> commit b962a12050a387e4bbf3a48745afe1d29d396b0d
> Author: Rob Clark <robdclark@gmail.com>
> Date:   Mon Oct 22 14:31:22 2018 +0200
>=20
>     drm/atomic: integrate modeset lock with private objects
>=20
> Hence this is now ok to drop, originally it wasnt.
>=20
> Reviewed-by: Daniel Vetter <daniel.vetter@ffwll.ch>

Great, thanks for pointing that out. I'll update the commit message with
that explanation.

> Aside: You're single-thread all your atomic updates on the hub->lock,
> which might not be what you want. At least updates to separate crtc should
> go through in parallel. Usual way to fix this is to add a
> tegra_crtc_state->hub_changed that your earlier code sets, and then you
> walk the crtc states in the atomic commit (only those, not all, otherwise
> you just rebuild that global lock again), and then only grab the hub state
> when you need to update something.

I'm confused. Where do you see hub->lock? Did you mean wgrp->lock?

Thierry

--ncSAzJYg3Aa9+CRW
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEEiOrDCAFJzPfAjcif3SOs138+s6EFAl3g7ycACgkQ3SOs138+
s6GOuQ/9HuycDIjBfg0rCdiRffTMfRaOWBHBnpkbzza9RvHQklg7RTWpqLMSe/iS
gkgagWGI5SQDygWi+WQK9hGJsR7iKv6GzZ62Bsza+TWKN10mYB6bUtjsLKGTIAYu
NRTs045Oa5xi0KKWfGnvFv2/gVM89TnjiJ+wf6CGQM5LHNkA4DfNokfyeIEFsw0p
xNAja97cocFh2I8ba9zDoXAJUGqgjhttqlfpgiQ3Bu02QpfDW46YjkWOBYF/6zmI
RbgAviKyrfxOAjEGfZBoHzWpOXMgq5Hz1TEQctznmhQy7MYEbPEFe7mPGFOPmOpU
ZG423NHBxG0tfz+SE2dME2nSQ9d8bywl2Gf9wPpyENAXvmlxUtTCFuZe340zKBN9
xz+tZWSvMS20qY0SuBjoT2D0r8P+pL6yxkram4FPBcTZc9TZxD1tmSuK8JR+iBws
2u7U2gt2IZwx4f2AOzoXL3akdKDlDNnRD1YRiQCtHEp37gZODYWWIjtU3n+UjPco
QTeAY54uzteREIYZbKtkPCezbPenQSFk70x1+8w6DSDNazHCGn5vuwAk/OxLWpnA
W4Qg27ytBi6ZoPO0F7amgz/rqrJTpq9zvJMU1wDaq+YoYfFlwzpFYkh1i3JKgFQR
kl7iOTfFGTVTxFMCI1yHU+NzAXNWcP5yRSmFpSFpqdZ5f2msSuM=
=wr9b
-----END PGP SIGNATURE-----

--ncSAzJYg3Aa9+CRW--

--===============0048630322==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVs
IG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlz
dHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVs

--===============0048630322==--
