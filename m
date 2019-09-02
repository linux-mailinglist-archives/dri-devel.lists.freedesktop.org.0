Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id D5BE6A5986
	for <lists+dri-devel@lfdr.de>; Mon,  2 Sep 2019 16:40:14 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1478F89450;
	Mon,  2 Sep 2019 14:40:12 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-x341.google.com (mail-wm1-x341.google.com
 [IPv6:2a00:1450:4864:20::341])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1EC8C89450
 for <dri-devel@lists.freedesktop.org>; Mon,  2 Sep 2019 14:40:11 +0000 (UTC)
Received: by mail-wm1-x341.google.com with SMTP id c10so2957606wmc.0
 for <dri-devel@lists.freedesktop.org>; Mon, 02 Sep 2019 07:40:11 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=rqck1HgtYvTFndS0HVWjRCv4NRinryTkdQd/sTBP6J8=;
 b=KgLvO38CG1z6GM0FN0CYfQQ6odizGxsveon0ovRvN2OIuxkXz+6qjlyeBE/15jaLly
 MtOmA9GJla0Nn5SissFZulWGFv2dEgL92OLGJdj9sElqvRTd99Rj2A5XN2ZrjiALGIc2
 6ym92xQn8tpJwYqMGNI0ntO6+2paDmk56LxaviUpB+mIz4nHHCDHNBL8vNgFtFR/EER+
 raWgyNvdL8xJ19uqYvzSolUZ9XOCsNbbxKA12UDP+Td7mFZnuVsPPYO/TfpBVqOWhsGH
 DeL+K+0930wubacebFSZuUhXScrr5y7HfrivedcnA5xUb1IRyz4LwBViUkQ38DBMbL32
 UEIw==
X-Gm-Message-State: APjAAAXw8Axy31t+28T69xmJZ4qLeZQH+Oj2s2R2RFNN6dUTN7ENxrh2
 WGybJYI5mreCTGvXXw3TA+M0Vxdb
X-Google-Smtp-Source: APXvYqwAzM8lYoZC5FAWTuEWeriwbFm0I649F/5EWCknS8Fe2HF0zsLG31yKXQBFy6IPxafMi7IDWg==
X-Received: by 2002:a1c:9a0f:: with SMTP id c15mr14014869wme.27.1567435209635; 
 Mon, 02 Sep 2019 07:40:09 -0700 (PDT)
Received: from localhost (pD9E51890.dip0.t-ipconnect.de. [217.229.24.144])
 by smtp.gmail.com with ESMTPSA id e3sm11679270wrh.12.2019.09.02.07.40.07
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 02 Sep 2019 07:40:07 -0700 (PDT)
Date: Mon, 2 Sep 2019 16:40:06 +0200
From: Thierry Reding <thierry.reding@gmail.com>
To: Linus Walleij <linus.walleij@linaro.org>
Subject: Re: [PATCH 1/2] drm/panel: Add DT bindings for Sony ACX424AKP
Message-ID: <20190902144006.GB1445@ulmo>
References: <20190902090633.24239-1-linus.walleij@linaro.org>
 <20190902093517.GA12946@ulmo>
 <CACRpkdb_X+Eia=mhHrXBcBn0osMtw6bKU6uAS5AV8ASV63qBkg@mail.gmail.com>
MIME-Version: 1.0
In-Reply-To: <CACRpkdb_X+Eia=mhHrXBcBn0osMtw6bKU6uAS5AV8ASV63qBkg@mail.gmail.com>
User-Agent: Mutt/1.12.1 (2019-06-15)
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20161025;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to:user-agent;
 bh=rqck1HgtYvTFndS0HVWjRCv4NRinryTkdQd/sTBP6J8=;
 b=GhBvx41L5btNRr/sYbSeodk8h+ahuX8GTBk2fkrI18hB/AnW5Sj0Zq+2NCVGA0XXNk
 3VDw71YhqEcMgrx+6qtWX1rApRkZywGPo8u0cqwU1ctMDApoJf6VnAyc93MYbcgG5PJ5
 UnMB+zbqx4TX7l9XDSXgxW4Kh6sulAy25T///fX92fOyXlmBPMvvCmtHPt3CMz/ZH3M4
 QEB3AeuDkbK6xvh0X+5K5hAsiThUWpIgEoEHWcclnqxQ5qLgVxyecy8lCy/Hc+9lMTc3
 sEp+uhiB9FWpts0LHGkrfgZsAYMRjt6ShmUQucNEivtB1ZOf96s0GSeN1AiV6HXjqT7M
 JMeg==
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
 <devicetree@vger.kernel.org>, Sam Ravnborg <sam@ravnborg.org>,
 "open list:DRM PANEL DRIVERS" <dri-devel@lists.freedesktop.org>
Content-Type: multipart/mixed; boundary="===============0520038326=="
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


--===============0520038326==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="EuxKj2iCbKjpUGkD"
Content-Disposition: inline


--EuxKj2iCbKjpUGkD
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Sep 02, 2019 at 01:44:38PM +0200, Linus Walleij wrote:
> On Mon, Sep 2, 2019 at 11:35 AM Thierry Reding <thierry.reding@gmail.com>=
 wrote:
>=20
> > > +  dsi-command-mode:
> > > +     type: boolean
> > > +     description:
> > > +       If this is specified, the panel will be used in command
> > > +       mode instead of video mode.
> >
> > I'm not sure there's concensus on this one yet. I think so far the
> > driver decides which mode to use the panel in. Technically this falls
> > into the category of configuration, so it doesn't really belong in the
> > DT.
>=20
> The way we've used DT is for a bit of both hardware description
> and configuration I'd say, but I'm no authority on the subject.
>=20
> > I vaguely recall from discussions I've had on this subject that there's
> > usually no reason to do video mode if you can do command mode because
> > command mode is more power efficient. This was a long time ago, so I may
> > be misremembering. Perhaps you have different information on this?
>=20
> No idea. I was under the impression that video mode was preferred
> but I have no idea why.

Hm... my recollection is that command mode is only supported on "smart"
panels that have an internal framebuffer. So the commands actually
instruct the panel to update their internal framebuffer, which means you
can technically switch off the display engine when there are no updates.

Under those circumstances I think it'd make sense to default to command
mode if both the panel and the host support it and stick with video mode
if for example the host can't do command mode.

Or perhaps this is something that could be set from some userspace
policy maker via a connector property? A compositor for instance would
have a pretty good idea of what kind of activity is going on, so it
could at some point decide to switch between video mode and command mode
if one of them is more appropriate for the given workload.

Command mode can also be used to do partial updates, if I remember
correctly, which again would make it possible for a compositor to send
only a subset of a screen update.

Thierry

--EuxKj2iCbKjpUGkD
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEEiOrDCAFJzPfAjcif3SOs138+s6EFAl1tKcYACgkQ3SOs138+
s6Getw//VlLa1RVzsDcvNquUxqbLt7fKys2ntFacTCSHS7dRHxODI3n4LQdqX4oD
RsVefgn7sFKYB4Q5/Gx+JWwcpnOlGgYhvry62RUGLLAeQdCgVdFDgFy9eVIB5lDh
yYFz4HNLOvqyjC5IZozy6n/qAYrAzDMJJ9mz5h4WJ8w+p5qyg0bT/k1PtG0iLsZW
5EzzjB7OXjqGrNUvZb0at+fK4tOz862ZXsXUY1VP+6/VKd5pWns56xLC3ZHdh1y6
yLgezbG8zHttMgxfF65EeSTVxaC1NvcNySb+aNxZFtpoyZbyLi/UHRZNjHkAdRVP
GNghtHXPZvjDaC/qrvVwyHsRiO+Pb+pMVezchyn1B2b5BeTtKzHr9bVAdX1ldlwN
w043kdBcA6lY981UYC397KsrLhbYecn25RoblZBJsevNgMBfcN7AE1/8xl3teYga
n9f3xsmExjuQsI+sDiq1phTrOU0iaZkg8zf+cYFMozThavk79l9SHc5mwkMuKjWd
jy3WapegGFnmGh/BEdwZKsVJaA2ebGCZMU+kLea1yvQKajU8fAudmDl9+XUuWmUO
3LPgVRR0SHTXcX5eWaeQVD9ckEn20nEBtWnr5ARNZbBbG7k539MF7kHAytuY+XNl
H4nc7fX6LEeAHNWFlmIZ9moJ9jslFKzIXid3RIdZqL4YtWZi2fM=
=JVKc
-----END PGP SIGNATURE-----

--EuxKj2iCbKjpUGkD--

--===============0520038326==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVs
IG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlz
dHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVs

--===============0520038326==--
