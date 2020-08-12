Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 78C34242BDF
	for <lists+dri-devel@lfdr.de>; Wed, 12 Aug 2020 17:05:23 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 77A8C6E904;
	Wed, 12 Aug 2020 15:05:21 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x444.google.com (mail-wr1-x444.google.com
 [IPv6:2a00:1450:4864:20::444])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4738D6E904
 for <dri-devel@lists.freedesktop.org>; Wed, 12 Aug 2020 15:05:20 +0000 (UTC)
Received: by mail-wr1-x444.google.com with SMTP id f7so2381053wrw.1
 for <dri-devel@lists.freedesktop.org>; Wed, 12 Aug 2020 08:05:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to:user-agent;
 bh=uQbKhBKRUJq7zZ3+0sD1zvMUISdsbqsC7k+YACrEssI=;
 b=Jfakotvstwf+HG4VqE6S/xyho7/fB6xvavN0D73Uj2akQE6LXpQv9TROxhf8gWSw4d
 +UnrIAuuXJsRjGp4mun7yL//F5DQ4bFiOZHBu329bJC1G7uHsk+V9tyW1GU+lfwrFgb7
 vmp5qXxESmQ+5nmiaI+RJmEFbjPM9tKYT7iC6MDRO8nsL/iWYNKmebKuwHlPffvQOHzP
 uviVrm/vRLOOlDTz/O2oFrcHS37MRthG5+4qaSnOoMthwE+1NKDPMErDUZtK+HoFvy5I
 ePh1mzzrXkCR6JxcDvfRmoNAZz5n7wTev+dEFz9AokC/8CQn8W7k5WT5Wl8MqtseSWYz
 4ciw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=uQbKhBKRUJq7zZ3+0sD1zvMUISdsbqsC7k+YACrEssI=;
 b=WiopZTroO+EKX1MLUfyXVy70RIYIug/JeAz94DU7a3QiZdGJuKJVHAlu0Aqt7jW1KS
 iPZZUd17ehi39exYjzFGBdjk45Gvzeerx90hWiiaFnGCsXBHWhLTm+xW7iVMO9bYkJtX
 lp/jSxmmpEOSl3m8uhmO92ittNPaFtXHLbxqgJYI8vFYTlP1Z6qneD80DDFgLp4sMBWP
 H4/KKN75qY5gQGghHUWyNnj+vR/uFfBSW22KLyasyO+5eUxbtxJQyvu22oY3q14FccHg
 MqTZtxYMChiYNCNo8OhhpJ0cUme0xlLQ2h3SB1ESGqlaXw/RRXSaAyHfCOQI65NYEUlk
 5qVA==
X-Gm-Message-State: AOAM5320Q3lYfs+CVrvqjcEYpZXxHvnh058XUsQsMt6hkeBAG3+H/Pl/
 KKcEKSWeiYFoew+mlguXnvw=
X-Google-Smtp-Source: ABdhPJyuZNP/DuATDT9a/FxhO3klj8ttnQC0oudvTMnV0/cH80zJgHYitQkihBVYGHIcmVCZm2QDVg==
X-Received: by 2002:a05:6000:c:: with SMTP id h12mr72252wrx.49.1597244718861; 
 Wed, 12 Aug 2020 08:05:18 -0700 (PDT)
Received: from localhost
 (p200300e41f10ca00f451c56750ebc625.dip0.t-ipconnect.de.
 [2003:e4:1f10:ca00:f451:c567:50eb:c625])
 by smtp.gmail.com with ESMTPSA id g16sm4029440wrs.88.2020.08.12.08.05.15
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 12 Aug 2020 08:05:16 -0700 (PDT)
Date: Wed, 12 Aug 2020 17:05:14 +0200
From: Thierry Reding <thierry.reding@gmail.com>
To: Karol Herbst <kherbst@redhat.com>
Subject: Re: [git pull] drm for 5.8-rc1
Message-ID: <20200812150514.GA8341@ulmo>
References: <CAPj87rOrUHBZZR3cw+iqUMtZL1ZQyjd=RoM2yHt5oUeRO5uDTA@mail.gmail.com>
 <5ffa32db-4383-80f6-c0cf-a9bb12e729aa@nvidia.com>
 <a3d331e9-d17e-9135-68c7-8e3e10df184d@nvidia.com>
 <CAKMK7uG8x4dHrRnzK9FFrJbtWsdLk+TTObK9r-nSncKowHVe3A@mail.gmail.com>
 <CAPM=9twK34VyR2kwiR1jzxqys1Bng2Vt8FY6aQTvCe2GL0Zopg@mail.gmail.com>
 <261cd7c9-6853-3d5f-3a3e-86b65c9dba71@nvidia.com>
 <CACO55ttJwjh2HZsygwqA7HUeF5UMuP0=Y9RyZU=UJsf-gWGagA@mail.gmail.com>
 <ad64c242-95f3-d346-87f3-a9ac149dc3a2@nvidia.com>
 <CACO55tt81q3VwpEmz9wxeUzWGPLXA1XPj8ZgxhuELUBPDpX1PA@mail.gmail.com>
 <CACO55ts2AHgDNZKBvoU8NZf26V8BJDGkKiapY=1xaUQ1DrC8SA@mail.gmail.com>
MIME-Version: 1.0
In-Reply-To: <CACO55ts2AHgDNZKBvoU8NZf26V8BJDGkKiapY=1xaUQ1DrC8SA@mail.gmail.com>
User-Agent: Mutt/1.14.6 (2020-07-11)
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
Cc: Daniel Vetter <daniel.vetter@ffwll.ch>, James Jones <jajones@nvidia.com>,
 Ben Skeggs <bskeggs@redhat.com>, dri-devel <dri-devel@lists.freedesktop.org>
Content-Type: multipart/mixed; boundary="===============0896455340=="
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


--===============0896455340==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="gKMricLos+KVdGMg"
Content-Disposition: inline


--gKMricLos+KVdGMg
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Aug 12, 2020 at 12:43:17PM +0200, Karol Herbst wrote:
> On Wed, Aug 12, 2020 at 12:27 PM Karol Herbst <kherbst@redhat.com> wrote:
> >
> > On Wed, Aug 12, 2020 at 2:19 AM James Jones <jajones@nvidia.com> wrote:
> > >
> > > Sorry for the slow reply here as well.  I've been in the process of
> > > rebasing and reworking the userspace patches.  I'm not clear my chang=
es
> > > will address the Jetson Nano issue, but if you'd like to try them, the
> > > latest userspace changes are available here:
> > >
> > >    https://gitlab.freedesktop.org/mesa/mesa/-/merge_requests/3724
> > >
> > > And the tegra-drm kernel patches are here:
> > >
> > >
> > > https://patchwork.ozlabs.org/project/linux-tegra/patch/20191217005205=
=2E2573-1-jajones@nvidia.com/
> > >
> > > Those + the kernel changes addressed in this thread are everything I =
had
> > > outstanding.
> > >
> >
> > I don't know if that's caused by your changes or not, but now the
> > assert I hit is a different one pointing out that
> > nvc0_miptree_select_best_modifier fails in a certain case and returns
> > MOD_INVALID... anyway, it seems like with your patches applied it's
> > now way easier to debug and figure out what's going wrong, so maybe I
> > can figure it out now :)
> >
>=20
> collected some information which might help to track it down.
>=20
> src/gallium/frontends/dri/dri2.c:648 is the assert hit: assert(*zsbuf)
>=20
> templ is {reference =3D {count =3D 0}, width0 =3D 300, height0 =3D 300, d=
epth0
> =3D 1, array_size =3D 1, format =3D PIPE_FORMAT_Z24X8_UNORM, target =3D
> PIPE_TEXTURE_2D, last_level =3D 0, nr_samples =3D 0, nr_storage_samples =
=3D
> 0, usage =3D 0, bind =3D 1, flags =3D 0, next =3D 0x0, screen =3D 0x0}
>=20
> inside tegra_screen_resource_create modifier says
> DRM_FORMAT_MOD_INVALID as template->bind is 1
>=20
> and nvc0_miptree_select_best_modifier returns DRM_FORMAT_MOD_INVALID,
> so the call just returns NULL leading to the assert.
>=20
> Btw, this is on Xorg-1.20.8-1.fc32.aarch64 with glxgears.

Hi Karol,

I'm not sure if I'm doing something wrong, but I can't seem to reproduce
these assertions at all. I've got a debug Mesa build from today as well
as an X server build from today and if I run glxgears it works just fine
for me. This is on Jetson TX1, but I don't think there's any difference
to Jetson Nano in that regard. I'll try to give this a try on Jetson
Nano as well, just to make sure. I can also try to pull in James'
patches to see if they change anything for me.

However, perhaps we can compare notes on what exactly your configuration
is so that perhaps I can reproduce and take a closer look at what's
going on.

My Mesa build uses the following configuration:

    $ meson --prefix /usr --libexecdir /usr/lib --buildtype debug -Dgles1=
=3Dfalse \
        -Dgallium-drivers=3Dnouveau,swrast,tegra -Dgallium-opencl=3Dstandal=
one \
        -Dvulkan-drivers=3D'' -Dplatforms=3Dwayland,x11,drm,surfaceless \
        -Dbuild-tests=3Dtrue -Dtexture-float=3Dtrue -Ddri-drivers=3D'' \
        -Dgallium-omx=3Ddisabled -Dllvm=3Dtrue

And here's what I use for X:

    $ meson --prefix /usr --libexecdir /usr/lib \
        --libexecdir /usr/lib/xorg-server -Dxdmcp=3Dfalse

I've stripped out some cross-compilation boilerplate there because that
shouldn't be relevant. Do you see anything in there that I'm missing and
which might be causing the issue not to happen for me?

Also, what's the window manager that you use? I use TWM (for simplicity)
and I suspect that's not what you use, so perhaps this is relevant
somehow as well?

Thierry

--gKMricLos+KVdGMg
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEEiOrDCAFJzPfAjcif3SOs138+s6EFAl80BSYACgkQ3SOs138+
s6HVUA/+LK7MjLKLhTWKmWFA6a11S2qe8QIgg8MJRY1qoEdC165gd/BlJWq4Rmif
XGwqeWDs+LkjznP2tLCW+SqpgmkmWEWjMp4ELIq4GvtNvtu9KB1IatGyKLg4WYEP
np/qlkSbvqVuW00CfchJKFbGlM2Z9N+6eLJ+3DxmWlK4gQfcu6ohUWnyNHTkizW5
mEZ680VCzd5zuhF15OlyPBropyNwFGrQ29PHJhYtQn4e5zYGgp67vDxarOSGSCDN
WjdN6Bnlq6yPQe+XTqwklc/2KaztrbkD5Y8Lrnk89Ar2cp8TGQUfGLx8P6XtY6pX
HIXoqUYs+vPJxEVdkSv7om1MfCK+1Gr2L4qOG6Vo0m0ZQg8H16VM0mttOqEWlYxO
7zF/R1cKTcxGSmA1jGBjN5iIgDNLLFf60xDNb5i8zwDy/EpAdeKe81JvzCDvBbJ1
p2XrV6qEqF59k6hWTVLomuEZxwacouAcIZGCjYd23zWmwX9HtNwMJ1qelDLGLH6H
wggXeRoLlWC8JpiHBb3nYd9ffiYYtapKjwakCwIEphc18uaC4vOqoHy1coAQsBzA
yRwqCpdR0YrtV9E1mrxMMmt+X/z/MUOEAF/bTB69HqQMbJWvvVeTJQKY5+frP+dE
W4zM/jPxucDI0GtCjLZgjCWjmXZ4/N/BjMBWN/6YTlXnGV/3Xs0=
=fyBF
-----END PGP SIGNATURE-----

--gKMricLos+KVdGMg--

--===============0896455340==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel

--===============0896455340==--
