Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A9138244C92
	for <lists+dri-devel@lfdr.de>; Fri, 14 Aug 2020 18:22:18 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E65396E21F;
	Fri, 14 Aug 2020 16:22:15 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-x342.google.com (mail-wm1-x342.google.com
 [IPv6:2a00:1450:4864:20::342])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 771AB6E21F
 for <dri-devel@lists.freedesktop.org>; Fri, 14 Aug 2020 16:22:14 +0000 (UTC)
Received: by mail-wm1-x342.google.com with SMTP id 9so7930318wmj.5
 for <dri-devel@lists.freedesktop.org>; Fri, 14 Aug 2020 09:22:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to:user-agent;
 bh=m52Spa7/nlwgf8ZLfFyksbThFXx8x3WnTx8WLDZrWD4=;
 b=pXGLOE5KcMXx93S7dLcVzugE0GcahSZvpYilfyJYKcYi18lzYDp7/b98RoeYnBz7us
 dBU9IL0IjKNp9srv5E10c8XJWsxpglsdlnmBI++vZGhpDYUvva91Q6EPMPhPG2P7biqY
 1PlbBluJETi4JFnCaSFvUo+iZ4beiOnGoheSeQff3X/Rpkj5IArZbQjjfkdNo4rriOu0
 uuRo4VpxXZUSUvFx3Y6wBZkL+Y8uhe2pcJMnABj00gWwaHAyFQLt/WR2pBCt/eyyf+J+
 Amntib91LfHIyOCd0jAM2SF94RJ6HzdTtMLsGi23v2RMZnY+JEnCuWHDvqfREsM78Znr
 KAxA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=m52Spa7/nlwgf8ZLfFyksbThFXx8x3WnTx8WLDZrWD4=;
 b=p/QDZVCwiUVaVR0742lsbkkn+yfvE92agqbK2riekCcZ+rVKDl7LNT/Yr+w9T8ZaL5
 QD3a3YaQHN9G0VJvPiJpAlpw7QJnh1XdTCOjipfgTvsqpJOh9NOyhIl7KOBzBDRs+Yxw
 MpaW87KvUqmfQ8yVAd0zx48JIomIhJiqWk17hhPZEY5zQdndma/MAhpP9xBlnYDCTmsT
 9IfoaYAdGV3ciD/sPn1mZVvHQWYi9ZwXLOwvLB5I0GYn4dy21mvgKZQdgb2xXdUszfeH
 L1IS2nhPxAsKhqsOYSXd4yPUAwJhPAzKTPRdMjKvIsNXyD/yR0djiARf9lhUs+HHuaGm
 WTuQ==
X-Gm-Message-State: AOAM531YXGp1x/yaLjoyMeEILWd0UGR7M3rmkujNwOvs1Tc9x+9T2eAT
 VnaFHseAXnOCAhZ99S6YtpWXlNat5Dk=
X-Google-Smtp-Source: ABdhPJxQsao3q8IfY95QjvttZS0QT1xzQlaj0E1LGYN0+GOynClxqxGzcStvH9EHau/upwhk0TcJ5w==
X-Received: by 2002:a1c:66c5:: with SMTP id a188mr3109429wmc.173.1597422133062; 
 Fri, 14 Aug 2020 09:22:13 -0700 (PDT)
Received: from localhost
 (p200300e41f10ca00f451c56750ebc625.dip0.t-ipconnect.de.
 [2003:e4:1f10:ca00:f451:c567:50eb:c625])
 by smtp.gmail.com with ESMTPSA id e4sm16741205wru.55.2020.08.14.09.22.11
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 14 Aug 2020 09:22:11 -0700 (PDT)
Date: Fri, 14 Aug 2020 18:22:10 +0200
From: Thierry Reding <thierry.reding@gmail.com>
To: Karol Herbst <kherbst@redhat.com>
Subject: Re: [git pull] drm for 5.8-rc1
Message-ID: <20200814162210.GA611027@ulmo>
References: <CACO55tu1RWZ0ZGcMcrU-snT3CkJtwxawwJ9990-5a+hpByh-Hw@mail.gmail.com>
 <CACO55tsfV9pGijOF5F=dLqFhpXgPSArGHXa44Mt3eRBk7z-X=g@mail.gmail.com>
 <CACO55tsEjGUhfrBdbcpT9xLa8N-T0JR-t7xFBA5pxDZ5+NiQhg@mail.gmail.com>
 <efb830fe-9ded-f5d3-6944-45adbb2a1f80@nvidia.com>
 <20200814140527.GD556087@ulmo>
 <CACO55tsr9hTd6mkaKfnnEWUz-7X=Sx7EY5sr1BVz-O2ftr98ww@mail.gmail.com>
 <20200814153449.GH556087@ulmo>
 <CACO55tt69SbBKLkmTVtoq2BLRJGbO5fmUH4dFWX_qC7nii3jSQ@mail.gmail.com>
 <20200814160631.GI556087@ulmo>
 <CACO55tvzoCBNvvnrzn9fSQZwB-hXPPApFMkbJ+ZGWDHgkgkJTw@mail.gmail.com>
MIME-Version: 1.0
In-Reply-To: <CACO55tvzoCBNvvnrzn9fSQZwB-hXPPApFMkbJ+ZGWDHgkgkJTw@mail.gmail.com>
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
Cc: James Jones <jajones@nvidia.com>, Thierry Reding <treding@nvidia.com>,
 Alyssa Rosenzweig <alyssa.rosenzweig@collabora.com>,
 dri-devel <dri-devel@lists.freedesktop.org>
Content-Type: multipart/mixed; boundary="===============0060327011=="
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


--===============0060327011==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="BXVAT5kNtrzKuDFl"
Content-Disposition: inline


--BXVAT5kNtrzKuDFl
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, Aug 14, 2020 at 06:12:56PM +0200, Karol Herbst wrote:
> On Fri, Aug 14, 2020 at 6:06 PM Thierry Reding <thierry.reding@gmail.com>=
 wrote:
> >
> > On Fri, Aug 14, 2020 at 05:40:34PM +0200, Karol Herbst wrote:
> > > On Fri, Aug 14, 2020 at 5:35 PM Thierry Reding <thierry.reding@gmail.=
com> wrote:
> > > >
> > > > On Fri, Aug 14, 2020 at 04:44:43PM +0200, Karol Herbst wrote:
> > > > > On Fri, Aug 14, 2020 at 4:05 PM Thierry Reding <thierry.reding@gm=
ail.com> wrote:
> > > > > >
> > > > > > On Thu, Aug 13, 2020 at 10:45:34AM -0700, James Jones wrote:
> > > > > > > I'll defer to Thierry, but I think that may be by design.  Te=
gra format
> > > > > > > modifiers were added to get things like this working in the f=
irst place,
> > > > > > > right?  It's not a regression, is it?
> > > > > >
> > > > > > I recall that things used to work with or without modifiers at =
some
> > > > > > point. That was basically the point of the "pitch-linear by def=
ault"
> > > > > > patch, see:
> > > > > >
> > > > > >     https://gitlab.freedesktop.org/mesa/mesa/-/commit/9603d81df=
05105857b676f20dff964ef3ab0ecff
> > > > > >
> > > > > > If we don't force pitch-linear for cases where we don't have mo=
difiers,
> > > > > > there's no way we can properly display these as framebuffers be=
cause we
> > > > > > lack the modifier information at the kernel level.
> > > > > >
> > > > >
> > > > > I suspect that's related to
> > > > > https://gitlab.freedesktop.org/mesa/mesa/commit/c56fe4118a2dd991f=
f1b2a532c0f234eddd435e9
> > > >
> > > > But we're checking the the PIPE_USAGE_SCANOUT flag specifically for=
 that
> > > > type of case, so this should work. On the other hand, it does sound=
 like
> > > > that logic might actually work, but for some reason Nouveau then en=
ds up
> > > > allocating a linear render buffer and a tiled depth buffer, and tha=
t's
> > > > the combination that doesn't work. Did I understand that correctly?
> > > >
> > > > So it sounds like there's a few options:
> > > >
> > > >   a) Make Nouveau render without a depth buffer in these cases (not=
 sure
> > > >      if that's even possible).
> > > >
> > > >   b) Allocate a linear buffer *in addition* to the normal buffer th=
at
> > > >      Nouveau allocates (with whatever it selects as the default lay=
out)
> > > >      and then blit from the tiled buffer to the linear buffer every=
time
> > > >      we need to. I think that'd be basically reproducing the code t=
hat
> > > >      is controlled by the DRI_PRIME environment variable.
> > > >
> > >
> > > yeah, I think Ilia suggested something like that a long time ago as w=
ell.
> > >
> > > >   c) Accept that modifiers are the way to go and rely on them for p=
roper
> > > >      functionality. This is obviously a really bad solution because=
 not
> > > >      everyone has transitioned to framebuffer modifiers yet. On the
> > > >      other hand, this is precisely the kind of use-case that frameb=
uffer
> > > >      modifiers were meant to address, so it isn't all that far-fetc=
hed
> > > >      to make them a requirement.
> > > >
> > >
> > > the problem with that is, that by default we don't have modifier aware
> > > desktops. gnome-shell by default and no Xorg release.
> > >
> > > > None of those are really great options... does anyone have any other
> > > > ideas?
> > > >
> > >
> > > What I am wondering about is why with my patch it simply works in X,
> > > but that could be a mere coincidence.
> >
> > So I was testing your revert with Weston and that "works", but only as
> > in "it doesn't crash". As expected, since there's now a mismatch between
> > what layout Nouveau assumes and the pitch-linear buffer that modesetting
> > assumes it got, it'll now be completely scrambled. That said, even
> > without the revert I can't seem to be able to make Weston work without
> > modifiers support.
> >
>=20
> yeah, that does seem to reproduce what I noticed with
> gnome-shell/wayland as well.

Oh, here's the patch I used to disable framebuffer modifiers in Weston,
in case anyone is interested:

--- >8 ---
diff --git a/libweston/backend-drm/kms.c b/libweston/backend-drm/kms.c
index f5215f20d694..889b2444b99f 100644
--- a/libweston/backend-drm/kms.c
+++ b/libweston/backend-drm/kms.c
@@ -1480,6 +1480,10 @@ init_kms_caps(struct drm_backend *b)
 	else
 		b->fb_modifiers =3D 0;
=20
+	if (getenv("WESTON_DISABLE_FB_MODIFIERS")) {
+		b->fb_modifiers =3D 0;
+	}
+
 	/*
 	 * KMS support for hardware planes cannot properly synchronize
 	 * without nuclear page flip. Without nuclear/atomic, hw plane
--- >8 ---

I suspect that the reason why this works in X but not in Wayland is
because X passes the right usage flags, whereas Weston may not. But I'll
have to investigate more in order to be sure.

In either case, it does seem to me like b) above would be the best
solution for the legacy case (i.e. where we don't have modifiers). It's
not going to be great in terms of performance because of the extra copy,
but I thought I had seen one of the render-only drivers do something
similar, so I'll go look at them to see if I can use them as inspiration
for implementing something like this on Tegra.

This should ideally only be an issue for desktops that don't support FB
modifiers at the moment. Even if that's the default for most at this
point, hopefully that will change down the road.

Perhaps we can go and release X 1.21.0 with that modifier enablement
patch and that'll motivate desktops to adopt it as well as the default?

Thierry

--BXVAT5kNtrzKuDFl
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEEiOrDCAFJzPfAjcif3SOs138+s6EFAl82ujAACgkQ3SOs138+
s6ES/xAAgdUbkJJ4BaoYDjpoTg3+uhA8eaFwcL3NFOSrLkt78uaM6Y1bTLOt7xnp
P8yZ00LMvOQ1DKApXBfLqSk2WUl1F5uHmYd7aEipnqX1kGYfUMC+sakUPQpAIE2c
ksEhDCXyDumlD8gyFy0RrAPcCnBXdVxCB9yQ9lxGeVh50MOUFunL5Taj/pKLQQxP
cYyKi0pijj530B3Vlh6SHGkMBt3v07hMoCIFtHHtrttU8THdcJWlJMP8uuJd4IN9
CNmqnPt1Bs/GKKnSoys3/7UniDziytZTPi1xm6TTFxMvZ/1Z32rmjvtsFsYu0fOj
uy6edNLvx5sGmv0KZMvzOzKgtewBHhDavt2fKbSIudII2xzTY6ZPvNLSnNl8S6Me
XdC2jbPgsWa7ry8uLStgwFo58ajH1y3bHrga4K4vfBuwvsiZ3Eksp79Dwx1VnOoq
oZ/F5ME7sZGt+jFxlr9PGTUCfvy001i2SZuulSUfL5YyMZgKahkVlQgkZ+q2vIOq
/jzMbty0mexVB/KdGqtly8lz3shLwBaTgyS7iVCePYqV7sL7IPNnkxWAFkhr3CJy
PZRJCmCv3nNcD9TCRdRAu60dms4eEQUTKBF/XZMqN7hA0fvePBZ4XjBbX0PmdYxq
u6ErokHvR5DwBP6ULrxJGt6u1PHxbQRnH2o2OmnffT4yus4cjUc=
=MRgp
-----END PGP SIGNATURE-----

--BXVAT5kNtrzKuDFl--

--===============0060327011==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel

--===============0060327011==--
