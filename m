Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id DA271865C4
	for <lists+dri-devel@lfdr.de>; Thu,  8 Aug 2019 17:29:47 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0A0296E87B;
	Thu,  8 Aug 2019 15:29:45 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from relay8-d.mail.gandi.net (relay8-d.mail.gandi.net
 [217.70.183.201])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1D8806E87C;
 Thu,  8 Aug 2019 15:29:42 +0000 (UTC)
X-Originating-IP: 88.168.111.231
Received: from localhost (lpr83-1-88-168-111-231.fbx.proxad.net
 [88.168.111.231]) (Authenticated sender: maxime.ripard@bootlin.com)
 by relay8-d.mail.gandi.net (Postfix) with ESMTPSA id 327B91BF206;
 Thu,  8 Aug 2019 15:29:38 +0000 (UTC)
Date: Thu, 8 Aug 2019 17:29:38 +0200
From: Maxime Ripard <maxime.ripard@bootlin.com>
To: Daniel Vetter <daniel@ffwll.ch>
Subject: Re: [PULL] drm-misc-next
Message-ID: <20190808152938.vxdykmx7nio3xdmz@flea>
References: <20190803104719.gwb6hmreeaqyye6n@flea>
 <CAPM=9tygocpAnOzJHy3TW2UQc0_6A86e7CpQT1CCMEhWfjzheg@mail.gmail.com>
 <20190806160146.sj7l5wrrjtt5nhbz@flea>
 <20190806161132.GC7444@phenom.ffwll.local>
 <20190807120246.tl4hhztr3qna3qf6@flea>
 <CAKMK7uF6+qEoJ9StaB=r2P=VGMV8O+DoNhQZvtV0NKKgJxbi2A@mail.gmail.com>
MIME-Version: 1.0
In-Reply-To: <CAKMK7uF6+qEoJ9StaB=r2P=VGMV8O+DoNhQZvtV0NKKgJxbi2A@mail.gmail.com>
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
Cc: "DRM maintainer tools announcements, discussion,
 and development" <dim-tools@lists.freedesktop.org>,
 Intel Graphics Development <intel-gfx@lists.freedesktop.org>,
 dri-devel <dri-devel@lists.freedesktop.org>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>, Sean Paul <sean@poorly.run>
Content-Type: multipart/mixed; boundary="===============2076128058=="
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


--===============2076128058==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="tpm5r3tjneldi45c"
Content-Disposition: inline


--tpm5r3tjneldi45c
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi,

On Wed, Aug 07, 2019 at 02:30:25PM +0200, Daniel Vetter wrote:
> On Wed, Aug 7, 2019 at 2:02 PM Maxime Ripard <maxime.ripard@bootlin.com> wrote:
> > On Tue, Aug 06, 2019 at 06:11:32PM +0200, Daniel Vetter wrote:
> > > On Tue, Aug 06, 2019 at 06:01:46PM +0200, Maxime Ripard wrote:
> > > > On Tue, Aug 06, 2019 at 10:33:53AM +1000, Dave Airlie wrote:
> > > > > On Sat, 3 Aug 2019 at 20:47, Maxime Ripard <maxime.ripard@bootlin.com> wrote:
> > > > > >
> > > > > > Hi Daniel, Dave,
> > > > > >
> > > > > > Here is the first (and pretty late) drm-misc-next PR.
> > > > > >
> > > > > > It's pretty big due to the lateness, but there's nothing really major
> > > > > > showing up. It's pretty much the usual bunch of reworks, fixes, and
> > > > > > new helpers being introduced.
> > > > >
> > > > > dim: 415d2e9e0757 ("Revert "drm/gem: Rename drm_gem_dumb_map_offset()
> > > > > to drm_gem_map_offset()""): mandatory review missing.
> > > > > dim: be855382bacb ("Revert "drm/panfrost: Use drm_gem_map_offset()""):
> > > > > mandatory review missing.
> > > > > dim: e4eee93d2577 ("drm/vgem: drop DRM_AUTH usage from the driver"):
> > > > > mandatory review missing.
> > > > > dim: 88209d2c5035 ("drm/msm: drop DRM_AUTH usage from the driver"):
> > > > > mandatory review missing.
> > > > > dim: ccdae4257569 ("drm/nouveau: remove open-coded drm_invalid_op()"):
> > > > > mandatory review missing.
> > > > >
> > > > > Pretty sure review in drm-misc-next is a rule. I don't even see acks
> > > > > on most of these.
> > > >
> > > > Ugh, sorry for that. I guess I'm still pretty new to the
> > > > maintainer-side of dim, which commands did you use to check that?
> > >
> > > dim apply-pull does this. If all committers use the tooling as they should
> > > they shouldn't be able to push patches which violate anything here, that's
> > > why dim request-pull doesn't reject.
> >
> > Yeah, sure, I meant to ask if there was anyway to check this before
> > sending the PR on our end.
>
> I think we'd need to create new command. Or maybe we should integrate
> it as part of the pull request generation, as an information/warning
> that there might be problems you need to explain. Want to write a dim
> patch?

I just sent something that should catch that, but considering my
dim-fu, you probably want to review it :)

Maxime

--
Maxime Ripard, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com

--tpm5r3tjneldi45c
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRcEzekXsqa64kGDp7j7w1vZxhRxQUCXUw/4gAKCRDj7w1vZxhR
xQhZAQDIFh4FiAC2OiEynoM7OgTcLbBRVCAtxnX0wjbRXAmUqQD/VHWeXxKlsWKq
HA8j4Z84fwIgTw1b3CpyUilEOC13Bwo=
=2oc6
-----END PGP SIGNATURE-----

--tpm5r3tjneldi45c--

--===============2076128058==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVs
IG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlz
dHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVs

--===============2076128058==--
