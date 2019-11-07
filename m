Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 386AFF2D21
	for <lists+dri-devel@lfdr.de>; Thu,  7 Nov 2019 12:11:49 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 266ED6E405;
	Thu,  7 Nov 2019 11:11:46 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from relay6-d.mail.gandi.net (relay6-d.mail.gandi.net
 [217.70.183.198])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F05C56E405
 for <dri-devel@lists.freedesktop.org>; Thu,  7 Nov 2019 11:11:44 +0000 (UTC)
X-Originating-IP: 93.34.114.233
Received: from uno.localdomain (93-34-114-233.ip49.fastwebnet.it
 [93.34.114.233]) (Authenticated sender: jacopo@jmondi.org)
 by relay6-d.mail.gandi.net (Postfix) with ESMTPSA id 058D8C0012;
 Thu,  7 Nov 2019 11:11:42 +0000 (UTC)
Date: Thu, 7 Nov 2019 12:13:35 +0100
From: Jacopo Mondi <jacopo@jmondi.org>
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Subject: Re: [GIT PULL FOR v5.5 - 2nd try] R-Car DU CMM support
Message-ID: <20191107111327.bl2ynkleesx4h2ne@uno.localdomain>
References: <20191022103135.GC4756@pendragon.ideasonboard.com>
 <20191105194902.GA8235@pendragon.ideasonboard.com>
 <CAPM=9tzhDyPU8GtJXCr+YRhNgx9F=Zo9PGiSbmpBWYkQ4qv9gg@mail.gmail.com>
 <CAPM=9tyh-cMCyKr-A7C0dHmCQaqrm+fypKM+m2zyJ22S5aXC7w@mail.gmail.com>
 <20191106100059.GA4878@pendragon.ideasonboard.com>
 <20191106100205.GB4878@pendragon.ideasonboard.com>
 <20191106104628.opzkif5ab5cinee6@uno.localdomain>
 <20191106125225.GC4878@pendragon.ideasonboard.com>
 <20191106125653.GD4878@pendragon.ideasonboard.com>
MIME-Version: 1.0
In-Reply-To: <20191106125653.GD4878@pendragon.ideasonboard.com>
User-Agent: NeoMutt/20180716
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
Cc: dri-devel <dri-devel@lists.freedesktop.org>
Content-Type: multipart/mixed; boundary="===============1300821636=="
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


--===============1300821636==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="hkwx7vum3z3fwpyt"
Content-Disposition: inline


--hkwx7vum3z3fwpyt
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline

Hi Laurent,

On Wed, Nov 06, 2019 at 02:56:53PM +0200, Laurent Pinchart wrote:
> Hi Jacopo,
>
> On Wed, Nov 06, 2019 at 02:52:25PM +0200, Laurent Pinchart wrote:
> > On Wed, Nov 06, 2019 at 11:46:28AM +0100, Jacopo Mondi wrote:
> > > On Wed, Nov 06, 2019 at 12:02:05PM +0200, Laurent Pinchart wrote:
> > > > On Wed, Nov 06, 2019 at 12:00:59PM +0200, Laurent Pinchart wrote:
> > > > > On Wed, Nov 06, 2019 at 01:40:13PM +1000, Dave Airlie wrote:
> > > > > > On Wed, 6 Nov 2019 at 05:56, Dave Airlie wrote:
> > > > > > > On Wed, 6 Nov 2019 at 05:49, Laurent Pinchart wrote:
> > > > > > > >
> > > > > > > > Hi Dave,
> > > > > > > >
> > > > > > > > Has this pull request fallen through the cracks ?
> > > > > > >
> > > > > > > It fell down a different crack than usual, it made it from patchwork
> > > > > > > onto my hard drive, but then I didn't execute the pull.
> > > > > > >
> > > > > > > I've pulled it down, thanks for reminder.
> > > > > >
> > > > > > Now it failed as I mentioned on irc.
> > > > > >
> > > > > > I think the new kconfig option needs to be a tristate, otherwise
> > > > > > setting it to Y and having rcar-du as M fails to link
> > > > >
> > > > > Sorry about that :-S Both I and the 0-day bot failed to catch it.
> > > > > Jacopo, could you please have a look ? I'm afraid this likely mean a new
> > > > > version of the series, and thus missing the merge window, as we're
> > > > > already at -rc6.
> > >
> > > I managed to reproduce it by setting DRM=m.
> > > RCAR_CMM stays indeed =y as it's a bool. Simply setting it to tristate
> > > is enough to have it set to =m when DRM=m.
> > >
> > > Could this be changed when applying the series ?
> > >
> > > diff --git a/drivers/gpu/drm/rcar-du/Kconfig b/drivers/gpu/drm/rcar-du/Kconfig
> > > index 539d232790d1..e6607b5c8bb3 100644
> > > --- a/drivers/gpu/drm/rcar-du/Kconfig
> > > +++ b/drivers/gpu/drm/rcar-du/Kconfig
> > > @@ -14,7 +14,7 @@ config DRM_RCAR_DU
> > >           If M is selected the module will be called rcar-du-drm.
> > >
> > >  config DRM_RCAR_CMM
> > > -       bool "R-Car DU Color Management Module (CMM) Support"
> > > +       tristate "R-Car DU Color Management Module (CMM) Support"
> > >         depends on DRM && OF
> > >         depends on DRM_RCAR_DU
> > >         help
> >
> > This looks reasonable to me. I'll let Dave decide if he wants to apply
> > this change himself, or if I should send a new pull request for v5.6.
>
> Actually this won't work. With DRM_RCAR_DU=y and DRM_RCAR_CMM=m you'll
> have a link failure.
>

You're right.. Actually just changing the RCAR_CMM option to tristate
won't be enough. Adding "imply DRM_RCAR_CMM" to the DU option instead
makes it impossible to select CMM=m when DU=y and viceversa, so it
should be enough.

> Let's fix this properly for v5.6. Could you please propose a fix that
> will work with all combinations of DRM, DRM_RCAR_DU and DRM_RCAR_CMM ?

Can I send a v6.1 version of the CMM patch only, or would you prefer a
v7 ? we're anyway late for 5.5 I presume

Thanks
  j

>
> --
> Regards,
>
> Laurent Pinchart

--hkwx7vum3z3fwpyt
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEEtcQ9SICaIIqPWDjAcjQGjxahVjwFAl3D/F8ACgkQcjQGjxah
Vjx6+w/+Miz4wqNWSKpeKIpTLmUCI4kPZ4HZKcn4yo9qhlDxX6bQTg1Y6/0maRi/
gIKEHE7yhMSQJs6FKM1z52ps509RLvIXiMbLI/xpLr5Nbd9o2bdr+LzCbIALYSGg
2SMg8yJiKkl0pfSTy6QzEQUqIAg7CtnrBm3Q+BwSXZIu0mr0APT0IRWu9MqBpWFs
PMfNGAyB4tCbu2L2L+yqsvvmyExnrWeUqlzEg9IPklWLsLpJ7ZC6jmDIh333lBNv
Mh5tXwNFQPXEMSbAfPVLLmqdGsdITr0hD/v2yMXpiAejuYgtsvGfdrCYvdFrty4x
oDyK1rIuGU5ymQVXSs7Fu9WDeoQ+2shY2QSvOfZofKKz0Uy1mKsr9MnZKcq+YSi6
HQpxxHD1xpyvkk/UOEmtXZUPcSTdiMYLBKJjHd9p5J7VGi0uOkv5BAJ/jDVsoLl6
R/+yCSm2v2P7C7oYC4Xvpu1JIz1ec/Ltpaxvzscqaayes41cPRoegj24JxSMzSDB
1SZ4tVnG2qaFmjg65vp+DXdO6yldApLDHEltvoIi79B64PvABHY78S7Whj1YcioK
1iqCggPjweKP7dohF2UdvS7/RS0K0OIIbRpeMSCZ2Yf4gnjBSjDwn45huSLs2bPk
JvvAlFSdu7Pcpm7C3jc6L1L0WUwnM6phVfEjFkohPnLEOHf77gs=
=NxZZ
-----END PGP SIGNATURE-----

--hkwx7vum3z3fwpyt--

--===============1300821636==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVs
IG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlz
dHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVs

--===============1300821636==--
