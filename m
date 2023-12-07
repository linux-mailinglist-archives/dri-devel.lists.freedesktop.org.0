Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id A77F48090E3
	for <lists+dri-devel@lfdr.de>; Thu,  7 Dec 2023 19:58:32 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 098B910E0C1;
	Thu,  7 Dec 2023 18:58:29 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from dfw.source.kernel.org (dfw.source.kernel.org
 [IPv6:2604:1380:4641:c500::1])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F302A10E0C1
 for <dri-devel@lists.freedesktop.org>; Thu,  7 Dec 2023 18:58:27 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by dfw.source.kernel.org (Postfix) with ESMTP id DD41D621C6;
 Thu,  7 Dec 2023 18:58:26 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3627AC433CA;
 Thu,  7 Dec 2023 18:58:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1701975506;
 bh=xt1Y/+kttVY9PNDwkDjXmwsJOVheyqKF1T6pNH3dGtg=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=jz5XnCaYN+luVaE47xCUh01SlCqazNvM+pIr7TfJlWPFfVP8k6bMbv/qFl+c2k0DG
 xNfUzAJ/xalYGkPYbJCqRlxLovMBAcbI7mIBlB7FS6qyaT+nrDpgT7YRPjG5NDIRRC
 hCfchARFo1GBtuR00ObXnV4sxGLvTJUci3ANbun4jHM6xtkaJsc7eShJSuq4lVT5aj
 lCOP3diS2aVG5+I7PX9m4QBHcpVxlHO6IHXCPUxAsRmBlrXgUilZX6CFfB7xuRQwBn
 Sr+ZUbL+U3qcea6n0XhvTtMuG4XSxssBn/yRt21FF76GYyKIPasMEu+ejizA49yfof
 8HiP01ypjSOgA==
Date: Thu, 7 Dec 2023 19:58:24 +0100
From: Maxime Ripard <mripard@kernel.org>
To: Doug Anderson <dianders@chromium.org>
Subject: Re: [PATCH v2 4/4] drm/panel-edp: Add some panels with conservative
 timings
Message-ID: <fctpvshu5ychxketsf35jfg2qzi6i3nfup5hy7r7hzmmbpd2j4@xmsik3cycjlj>
References: <20231207081801.4049075-1-treapking@chromium.org>
 <20231207081801.4049075-5-treapking@chromium.org>
 <CAD=FV=U6M5rpQXmjC+iGf0BGtiyjRAAcMfo4Fr3pDyYVp3m4aQ@mail.gmail.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
 protocol="application/pgp-signature"; boundary="kpzcmzjycd4hvubw"
Content-Disposition: inline
In-Reply-To: <CAD=FV=U6M5rpQXmjC+iGf0BGtiyjRAAcMfo4Fr3pDyYVp3m4aQ@mail.gmail.com>
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
Cc: Neil Armstrong <neil.armstrong@linaro.org>, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, Pin-yen Lin <treapking@chromium.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, Guenter Roeck <groeck@chromium.org>,
 Jessica Zhang <quic_jesszhan@quicinc.com>, Sam Ravnborg <sam@ravnborg.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


--kpzcmzjycd4hvubw
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Dec 07, 2023 at 10:23:53AM -0800, Doug Anderson wrote:
> Hi,
>=20
> On Thu, Dec 7, 2023 at 12:18=E2=80=AFAM Pin-yen Lin <treapking@chromium.o=
rg> wrote:
> >
> > These panels are used by Mediatek MT8173 Chromebooks but we can't find
> > the corresponding data sheets, and these panels used to work on v4.19
> > kernel without any specified delays.
> >
> > Therefore, instead of having them use the default conservative timings,
> > update them with less-conservative timings from other panels of the same
> > vendor. The panels should still work under those timings, and we can
> > save some delays and suppress the warnings.
> >
> > Signed-off-by: Pin-yen Lin <treapking@chromium.org>
> >
> > ---
> >
> > (no changes since v1)
> >
> >  drivers/gpu/drm/panel/panel-edp.c | 31 +++++++++++++++++++++++++++++++
> >  1 file changed, 31 insertions(+)
>=20
> Reviewed-by: Douglas Anderson <dianders@chromium.org>
>=20
> Repeating my comments from v1 here too, since I expect this patch to
> sit on the lists for a little while:
>=20
>=20
> This is OK w/ me, but it will need time on the mailing lists before
> landing in case anyone else has opinions.

Generally speaking, I'm not really a fan of big patches that dump
whatever ChromeOS is doing ...

> Specifical thoughts:
>=20
> * I at least feel fairly confident that this is OK since these panels
> essentially booted without _any_ delays back on the old downstream
> v4.19 kernel. Presumably the panels just had fairly robust timing
> controllers and so worked OK, but it's better to get the timing more
> correct.

=2E.. especially since you have to rely on the recollection of engineers
involved at the time and you have no real way to test and make things
clearer anymore, and we have to take patches in that are handwavy "trust
us, it's doing the right thing".

I'd really prefer to have these patches sent as they are found out.

Also, the fact that the 4.19 kernel mentionned in the commit log is
actually a downstream tree needs to be made much clearer.

Maxime

--kpzcmzjycd4hvubw
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQRcEzekXsqa64kGDp7j7w1vZxhRxQUCZXIV0AAKCRDj7w1vZxhR
xeYzAQC5Kfn8dNrwLwALt+hK6tSD4201IsoTzahQwfQbf9GB3gD9HiIAYt8FNGuE
6Kmrydj+s2FsQuULmnFdbvdumWwYcwQ=
=sewR
-----END PGP SIGNATURE-----

--kpzcmzjycd4hvubw--
