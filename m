Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 3A9A123D22
	for <lists+dri-devel@lfdr.de>; Mon, 20 May 2019 18:22:20 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 81F8389089;
	Mon, 20 May 2019 16:22:17 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x442.google.com (mail-wr1-x442.google.com
 [IPv6:2a00:1450:4864:20::442])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 02A1289089
 for <dri-devel@lists.freedesktop.org>; Mon, 20 May 2019 16:22:16 +0000 (UTC)
Received: by mail-wr1-x442.google.com with SMTP id w13so4552152wru.11
 for <dri-devel@lists.freedesktop.org>; Mon, 20 May 2019 09:22:15 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=l1VWSTDtud746hgIjhIDSptYM9UIuqfSFhRbRw1VwRA=;
 b=gj5Ycw30qG/h0hMzh1iynhtHwtHUgvvZINEQJicoTzjlYGYG/La4+iYbojsJQqGL1r
 24p1H5YBNWvUgPJDNTQKosvdg18fH3aJD+2eMkRfCaTDXZ3I4MJ9ER8rmLOqc3hi8W/W
 ff86dHrpS6s/lcxkByZcB6Q4980sETlnwRRoyTmIWn9jC4c2905HjD89GGyVrJ16v3FA
 HE9O1pTyZnpq911oSqul7VhpbNpwUXUhhQsD61VO616srEdmkOgnH1O8pcafrVDuw/tK
 3/1PIIkxuZhv22hcHJ7vW3nTPCKejcOt9M53hwlo4y6Bo7gGVI7onmrFzKKzpHWwGDDG
 6rHQ==
X-Gm-Message-State: APjAAAXZ22LbP89mHx4hZtEWWnqpDNG/VxuCF1RXR0eu5Y6TgPR3Mmus
 orCdsh6+NUYsneyX5WGa1ic=
X-Google-Smtp-Source: APXvYqybohR2+KL4/3fxHr3AxhNuH3PZ9z3gY69xmWxM3y0yiW9eAtw0qi2pguHU0GJ1MZfMxEXkpQ==
X-Received: by 2002:adf:e691:: with SMTP id r17mr27846239wrm.50.1558369334643; 
 Mon, 20 May 2019 09:22:14 -0700 (PDT)
Received: from localhost (p2E5BEF36.dip0.t-ipconnect.de. [46.91.239.54])
 by smtp.gmail.com with ESMTPSA id e12sm17134266wrs.8.2019.05.20.09.22.13
 (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
 Mon, 20 May 2019 09:22:13 -0700 (PDT)
Date: Mon, 20 May 2019 18:22:12 +0200
From: Thierry Reding <thierry.reding@gmail.com>
To: Fabio Estevam <festevam@gmail.com>
Subject: Re: [PATCH v2 1/3] dt-bindings: Add vendor prefix for VXT Ltd
Message-ID: <20190520162212.GA22833@ulmo>
References: <20190219002706.20077-1-festevam@gmail.com>
 <20190423110336.GB23448@ulmo>
 <CAOMZO5C4YKcUGJ9wDJHQE04278Cr6ujYnYwPs-yhCyKumbruqg@mail.gmail.com>
MIME-Version: 1.0
In-Reply-To: <CAOMZO5C4YKcUGJ9wDJHQE04278Cr6ujYnYwPs-yhCyKumbruqg@mail.gmail.com>
User-Agent: Mutt/1.11.4 (2019-03-13)
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20161025;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to:user-agent;
 bh=l1VWSTDtud746hgIjhIDSptYM9UIuqfSFhRbRw1VwRA=;
 b=beNzaDeGc1Fs/34/1YRfWzd/EyBTGhID67eNO3NYR3dYIXpTUg8MWrLpSK9Jfs8g1C
 ZBb+I5vvGtslC0YJBGw9f5IgZpYdTniggL8FT0DjlVjDWbLz6U66yk0/iZSAAEo6uSAC
 Kc+Ti40zIjej9/w/+7+awFLY+LQGEAyzGyrsoRTolsYjsf+vPXvjDHo33ZaAUs8k6aGX
 0/JUUFSew67lnu5rKutPrpEuJHfbAHOhKLTh9OyQIhP6snOovUtLFyrdoOE3FnCZXugn
 SoEqosO7HXY38AfYMvygJlarYXlK+BGdU1pcfbMYCxTtfdBgooZkOMRJoE6jT7TnfH/J
 C1Wg==
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
Cc: "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS"
 <devicetree@vger.kernel.org>,
 Otavio Salvador <otavio.salvador@ossystems.com.br>,
 DRI mailing list <dri-devel@lists.freedesktop.org>,
 Rob Herring <robh+dt@kernel.org>, Sam Ravnborg <sam@ravnborg.org>,
 John Weber <john.weber@technexion.com>
Content-Type: multipart/mixed; boundary="===============2056940107=="
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


--===============2056940107==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="a8Wt8u1KmwUX3Y2C"
Content-Disposition: inline


--a8Wt8u1KmwUX3Y2C
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, May 20, 2019 at 11:15:05AM -0300, Fabio Estevam wrote:
> On Tue, Apr 23, 2019 at 8:03 AM Thierry Reding <thierry.reding@gmail.com>=
 wrote:
> >
> > On Mon, Feb 18, 2019 at 09:27:04PM -0300, Fabio Estevam wrote:
> > > VXT Ltd is a manufacturer of projected capacitive touch panel
> > > and display solutions: http://www.vxt.com.tw/
> > >
> > > Reviewed-by: Otavio Salvador <otavio@ossystems.com.br>
> > > Reviewed-by: Rob Herring <robh@kernel.org>
> > > Signed-off-by: Fabio Estevam <festevam@gmail.com>
> > > ---
> > > Changes since v1:
> > > - None
> > >
> > >  Documentation/devicetree/bindings/vendor-prefixes.txt | 1 +
> > >  1 file changed, 1 insertion(+)
> >
> > Applied all three patches, thanks.
>=20
> I don't see any of these patches applied in linux-next nor 5.2-rc1.
>=20
> What is the issue here?

The patch is in drm-misc-next and should show up in linux-next tomorrow.

My understanding is that somebody needs to push drm-misc-next after each
-rc1 release before drm-misc-next feeds into linux-next. Chances of that
happening between -rc1 and the linux-next release the day after are
fairly small.

Thierry

--a8Wt8u1KmwUX3Y2C
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEEiOrDCAFJzPfAjcif3SOs138+s6EFAlzi1DAACgkQ3SOs138+
s6Fvjg/8CnT+tpBemRaTuPMVdtW6RcvZYnuD+AlNSXZIXEwo+ICEmdVqTC4b90yX
HxJmjc1skcQ3i4J+UJbf+E+8GrqlUllogGDo1eSkt2XaRrKYdMq5LOglISWl3slO
CHmcC2oZPYtmIutDNYJ/KrQ0s0TFFoZ3QYYTxy6F0XC5HVgXhyensfEXAFPNRpt6
anULoCzdKy3sH/mZBxG4t6pUsSMwqPnJq9kEkHu9b92inVgcB6oOPlj5hPuIGn7c
F/yA+ygUEHQEpNL6lixOL6hoEy/JvwjwbIwVF15ijYJ73SMDOVS3W3xkFuJjYcs9
R1QzyvRpE/6UZcSrOhBOeKWjtWw6wfAslfXQJoFtUw1NClWheaaFWkb2mkb0D6Yd
yXwDvP4W1uk2vfUM0ljAYsrOiWKrRXHcBHJEzwc9DDPeTh9sdYTybV0IT4yrftMc
yOcA1ZGz0Yyw+Mv8U46SLMNh7lDRQqUF2s99wbTCWN3UuKZxGXl9mqFDrvSJEKo/
JygSrYcRigcQFPNtFGjf8qqBqGzJON0icX3cvs8NQGBY7D9i4niK/KXqESr+tcHU
Dlypdd7pKF5i7dkZa45NsXXE1lYO6HI4ZQnZZL4+Csgdq6gaZ0Qxylda1hEOSPeH
QxcKrK1BTTbe7QBaSiRJqByjWNYGk1h2v8dtD7mF8AQ3LnP5oGI=
=KW7q
-----END PGP SIGNATURE-----

--a8Wt8u1KmwUX3Y2C--

--===============2056940107==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVs
IG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlz
dHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVs

--===============2056940107==--
