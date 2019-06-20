Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 54C4C4D0C8
	for <lists+dri-devel@lfdr.de>; Thu, 20 Jun 2019 16:50:22 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8ADA06E5B4;
	Thu, 20 Jun 2019 14:50:19 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x441.google.com (mail-wr1-x441.google.com
 [IPv6:2a00:1450:4864:20::441])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0B3916E5B2;
 Thu, 20 Jun 2019 14:50:18 +0000 (UTC)
Received: by mail-wr1-x441.google.com with SMTP id m3so3370357wrv.2;
 Thu, 20 Jun 2019 07:50:17 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=hm8noEl+mXcjCJ5uoNHwR3iW+YieyytTnm7E4DsqIOA=;
 b=AnfftUy8/1oooFZ3dUeg2H8j4LQbvGowmNIvz9k2OSbrNJr//I7S6OawsQSXglHAFD
 tGrPUlnBlbqr9gI8/2DbGBVL1fXXBS04wqY1fewkEmiZew2nrml+xVeGS3p/rDbp152q
 LaL3loZ3+iDACW7tTlXFTioCmQAnGSWTEkYzIsDbMlaUdry2/EFPFjbMzL9P/4PNmaYl
 SUYSQtG5AeLITxO9F9IvERD0Zt1QtAF86QQ46SWTMBFfwEt2oErbz84eJOlyjBAS/qDk
 HuKOuT2gpoBlPWhaJFTZlyoJHW6loqmIY8nJjODJGCiTrG72ggJMt8OcXx1tTFgu4sPZ
 rekw==
X-Gm-Message-State: APjAAAWtREW3mGjp4kUQhxh1fgLbQWr6TVfgJXx70kLuP8ibDvONfKAQ
 X4NIV/RAqih2iMe3uKEL6Sg=
X-Google-Smtp-Source: APXvYqwczqrf3HviX2H3AujmEDBEe7VhDXI1TXvMkXVAv/l7IBAn+i3l+ogH5MSk/1yskNMBKsDd5w==
X-Received: by 2002:a5d:498a:: with SMTP id r10mr93304845wrq.28.1561042216573; 
 Thu, 20 Jun 2019 07:50:16 -0700 (PDT)
Received: from localhost (p2E5BEF36.dip0.t-ipconnect.de. [46.91.239.54])
 by smtp.gmail.com with ESMTPSA id v15sm18584632wrt.25.2019.06.20.07.50.15
 (version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
 Thu, 20 Jun 2019 07:50:15 -0700 (PDT)
Date: Thu, 20 Jun 2019 16:50:14 +0200
From: Thierry Reding <thierry.reding@gmail.com>
To: Daniel Vetter <daniel@ffwll.ch>
Subject: Re: drm connectors, tegra, and the web they weave (was Re: [PATCH
 58/59] drm/todo: Add new debugfs todo)
Message-ID: <20190620145014.GB15501@ulmo>
References: <20190614203615.12639-1-daniel.vetter@ffwll.ch>
 <20190614203615.12639-59-daniel.vetter@ffwll.ch>
 <20190618151938.GA2567@kroah.com> <20190618152530.GA4576@kroah.com>
 <CAKMK7uEd0sZ81RMjDsz6cnkW+krPuvoqUcEY4U3ofB9W_qeFvA@mail.gmail.com>
 <20190618180113.GA26105@kroah.com>
 <20190618214656.GH12905@phenom.ffwll.local>
MIME-Version: 1.0
In-Reply-To: <20190618214656.GH12905@phenom.ffwll.local>
User-Agent: Mutt/1.11.4 (2019-03-13)
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20161025;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to:user-agent;
 bh=hm8noEl+mXcjCJ5uoNHwR3iW+YieyytTnm7E4DsqIOA=;
 b=aQn3Nmujshz2gHjAPk9l8nqFRkec9X6tZrPeH9we0CcldGP2+eFNvO/hff/1sqh7SP
 6pE4djZm/NyYQTS9MePFJuZBYS41EC1xm+9L6BHQiS+sFJsJAhQU8ODJH52lAJcS3qoJ
 CgBieLDZDTCWYbuslKezfZXmXOGhOFdpwbWM1n0y7LF7uFa8GypTpri9Z/cacL8JZwCX
 KvlfQPK5r0/EZgskdq4KJbM/ZlqGCLctwyqpVHjMHQ76mTnYeB+YDlYNkuYxUn8HMSdP
 +qakLb+KXYh7+mwlEPoedWJGLFgtPcs3w2EUt7n0OvSugHcUckgMeHSHO29PGxOapK2j
 oS1w==
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
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Intel Graphics Development <intel-gfx@lists.freedesktop.org>,
 DRI Development <dri-devel@lists.freedesktop.org>,
 Jonathan Hunter <jonathanh@nvidia.com>, Daniel Vetter <daniel.vetter@ffwll.ch>,
 linux-tegra@vger.kernel.org, Daniel Vetter <daniel.vetter@intel.com>
Content-Type: multipart/mixed; boundary="===============1324315698=="
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


--===============1324315698==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="XOIedfhf+7KOe/yw"
Content-Disposition: inline


--XOIedfhf+7KOe/yw
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Jun 18, 2019 at 11:46:56PM +0200, Daniel Vetter wrote:
> On Tue, Jun 18, 2019 at 08:01:13PM +0200, Greg Kroah-Hartman wrote:
> > On Tue, Jun 18, 2019 at 07:32:20PM +0200, Daniel Vetter wrote:
> > > On Tue, Jun 18, 2019 at 5:25 PM Greg Kroah-Hartman
> > > <gregkh@linuxfoundation.org> wrote:
> > > > On Tue, Jun 18, 2019 at 05:19:38PM +0200, Greg Kroah-Hartman wrote:
> > > > > I could just "open code" a bunch of calls to debugfs_create_file(=
) for
> > > > > these drivers, which would solve this issue, but in a more "non-d=
rm"
> > > > > way.  Is it worth to just do that instead of overthinking the who=
le
> > > > > thing and trying to squish it into the drm "model" of drm debugfs=
 calls?
> > > >
> > > > An example of "open coding" this is the patch below for the sor.c
> > > > driver.
> > >=20
> > > I think open-coding is the way to go here. One of the todos is to
> > > extend debugfs support for crtc/connectors, but looking at the
> > > open-coded version we really don't need a drm-flavoured midlayer here.
> >=20
> > There already is debugfs support in the code for crtc/connectors, these
> > files are "hanging" off of those locations already.  I'll keep that, but
> > indent it one more directory so that there's no namespace collisions.
>=20
> The todo was to have some drm wrappers here for the boilerplate, but after
> looking at your version that's not a good idea. So not just making sure
> crtcs/connectors have a debugfs directory made for them, but more.
>=20
> Wrt adding a new directory: debugfs isnt uapi, but there's usually a
> massive pile of script relying on them, so it's not nice to shuffle paths
> around. Plus the lifetimes match anyway (at least if you don't hotplug
> connectors, which tegra doesn't do).

So, I think you two already covered everything. From a Tegra perspective
there's not really a need to care about the exact structure of debugfs
because there are only a handful of scripts that use this and they are
not exactly widely distributed. At the same time there's really no need
to add another level of directories, since the connector really is the
SOR, so an sor directory in the connector's directory is just redundant.
Cleaning up and lifetime management aren't issues, really, so there are
no good arguments for adding it, in my opinion.

Historically, the sor.c driver is interesting because it used to be just
plain debugfs calls. Only when I added a second debugfs file I decided
to go with the built-in DRM infrastructure for this and then later went
and converted the first file to it as well, for consistency. I do
remember though that I was very unhappy about the fact that I had to do
all this kmemdup()'ing just to make debugfs files per-instance (the DRM
infrastructure doesn't allow that by default). In retrospect that was a
poor decision and I should've just stuck with debugfs and perhaps just
spin a couple of helpers around that instead.

So I'm happy to see this effort.

Thierry

--XOIedfhf+7KOe/yw
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEEiOrDCAFJzPfAjcif3SOs138+s6EFAl0LnSIACgkQ3SOs138+
s6GbLg//Tf3ufNZkqFacywTcO2/eLYw94OGpRZCe4oB2e4jJKCHs1SWTUWtDPWZU
b0R/dzDuxQNct7JbIFyEvXpJ82NiXN3tffzxbE7xQ0KrEQMqaVV2vM3rf9WqNHMV
ibx/VzorAkbvXEkODn8xmx33ieDsJOzlRVq3Oo3/Lw8oLs7+mYrr/LHzYGuGA8ue
XYFGzR8xdRTlbXNxQQ3EgsUn0ILD+UwGxaVb4lJnhtCf0M1auQwFclxO9T253mJO
mbrdEcpoQEUWBrdXjdicazSiiB6TrfH066uERoG4+AyFJbVP872FJVTkp5p9RGXj
lLgZcVJJrleSMPXSZIX3lqsvOpVsXrzxDsPN+Wswx2j0fLl62/drAthWoV1M9LPE
p6x5gx262qT5+qxWJOZaNcSrPYIuaz3SqFclSTWaDZTllVopS/y6QSXX9bg5cTHk
6HRQZ7lmega0AcQb+acdqjQDJWz+dje8ZAKAVZFAiB2wfQXbpRP+UptUP5X0qyz+
PZUpTWrn+vzEYtao4iflUL/lgLw6d+Zd4n2JRNjp4SCcuKP9/r88IJ8kIwVyem8X
sGO8V0IF8aVR6eH6VYX/xrAsalrFOAuhAWpD1c5IJtzjtwg99xCADR+Wv0WU1N12
+l8viBAMu1vgmbrwbGIqRv0sHXVa/v8qlPvP5WuhwQnOI59TsHk=
=UkZH
-----END PGP SIGNATURE-----

--XOIedfhf+7KOe/yw--

--===============1324315698==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVs
IG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlz
dHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVs

--===============1324315698==--
