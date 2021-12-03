Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id B85E2467907
	for <lists+dri-devel@lfdr.de>; Fri,  3 Dec 2021 15:04:02 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 35FB66E044;
	Fri,  3 Dec 2021 14:04:00 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from new2-smtp.messagingengine.com (new2-smtp.messagingengine.com
 [66.111.4.224])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4E3086E044
 for <dri-devel@lists.freedesktop.org>; Fri,  3 Dec 2021 14:03:59 +0000 (UTC)
Received: from compute3.internal (compute3.nyi.internal [10.202.2.43])
 by mailnew.nyi.internal (Postfix) with ESMTP id AD74B5802D4;
 Fri,  3 Dec 2021 09:03:58 -0500 (EST)
Received: from mailfrontend1 ([10.202.2.162])
 by compute3.internal (MEProxy); Fri, 03 Dec 2021 09:03:58 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cerno.tech; h=
 date:from:to:cc:subject:message-id:references:mime-version
 :content-type:in-reply-to; s=fm1; bh=pfeo7OdvX46103Xhlg/M4A/EqUj
 UdZ6l52e9NDt2Z2U=; b=YHCjwbmuyDIF/TTcIpnQmZwgRg4FaVs6vRK0IXYzzD2
 ENa6V8VE7J4qY7Sdiz6zc0ks4aaQikzfkv4KnNnWZjAAdBHlD8KPK0kvL0nRGvJs
 EmV9tGNo/TY5M/NoqJBS3UHkXalaMADciuHybKriD+Det1GPXn67d4ialIpAO4Uk
 nFr5A2+IScCH0nCxE6/E89JjOS76ZDfeT0C+ZlJEp/i2qaHoNJMrBQLBZqLv/CFn
 +rtHxfeIgMFcznhaSm7WX5W5wPBVNFSSC0Xp1hioB+iNS3q7nz4uVMp96PuK37TV
 4fQk2Cw1XuyJyQLA/XDeL3EmwQ5/+lwcPM5mZulGlRw==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to:x-me-proxy
 :x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm1; bh=pfeo7O
 dvX46103Xhlg/M4A/EqUjUdZ6l52e9NDt2Z2U=; b=NVUfHY7KC7td8xbZJ8BEFt
 ty3j/6fhAUOpQeGp1b2y/pd0Uw4qu3gKry7U7eCBOaP6Iyz6SvnaT1ofhCwyyFXG
 N+2Dmpde2VklnrAOxN5uvoGWVLw6UxFo99ILjp5W6hTDbnkGTnF9nC4OhFgZA14j
 RxZf+3kz7yXpAtvudpVPsqHeg7KBLchwtAThmgP/hQTDikA9u6IYv50Eqq2AZCsZ
 /JPJkLAkICTGkyuh+rsWP2a4WBtndRfKvwJEYnZcots5OI1xfjjCGebZR7uO7/R1
 wi3B4yqre3JXDuHNo6jMoN1Hy08x7ksB6ABAFpZigHJENyKPZSTVhy9RQq7yuOTA
 ==
X-ME-Sender: <xms:zSOqYf75TkajvExbyJEmgrkWy8W5DgBjUeIwyfVRcAWpKZNg1WlHHA>
 <xme:zSOqYU7BWOYEwuozBC_QfMILS_zTnGlyU1yYskDHT7sIRvY3rOel7EiqpTgY0KtvR
 _bmaxvE-vKlEKyE6Uk>
X-ME-Received: <xmr:zSOqYWe6vqDG8aPGtHUFGrtk4k8Rfyzq-pvLkzCcGDKCvmi7stYQUi5kxudsxtY5JwcNHhrp3WyurDTIuBIoFmhxcOO1Drzc_XobkdXEBqAIAg>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvuddrieejgdeiudcutefuodetggdotefrodftvf
 curfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfghnecu
 uegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenuc
 fjughrpeffhffvuffkfhggtggujgesghdtreertddtjeenucfhrhhomhepofgrgihimhgv
 ucftihhprghrugcuoehmrgigihhmvgestggvrhhnohdrthgvtghhqeenucggtffrrghtth
 gvrhhnpeeutdfgjeeuudehvefgvedvtedtudelfffgffekledtffekgedukeejueevieeg
 udenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepmhgrihhlfhhrohhmpehmrg
 igihhmvgestggvrhhnohdrthgvtghh
X-ME-Proxy: <xmx:zSOqYQJUhTqLw_W6nywSe4AL-rbbyFl5Fsj5ejc-nCc38YuivxapOw>
 <xmx:zSOqYTJVWh4U_DZkvKYEt0xaTNDPkdE7HhYICwL3E16LWZFfJHxJvw>
 <xmx:zSOqYZzO_3uXADDRy6X0g1_ao0K4lD5QzduGTbxO8E_EBrvP8DdQzw>
 <xmx:ziOqYUV5f9QZxF8iQ5_vjw42YGLJuVmhMqzmSFFTBHGNeFD1Xa3TLQ>
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Fri,
 3 Dec 2021 09:03:57 -0500 (EST)
Date: Fri, 3 Dec 2021 15:03:55 +0100
From: Maxime Ripard <maxime@cerno.tech>
To: Jian-Hong Pan <jhp@endlessos.org>
Subject: Re: [PATCH v2 0/6] drm/vc4: kms: Misc fixes for HVS commits
Message-ID: <20211203140355.p2aj7d3s4feubtap@houat>
References: <20211117094527.146275-1-maxime@cerno.tech>
 <CAPpJ_eewp9Z_xdpmB+E_NFH1GGq8oyckVBmS1PD84CvCRUminQ@mail.gmail.com>
 <20211118104009.jkvkhxi5nh4e4zlp@gilmour>
 <CAPpJ_ef5XeLKpHAzxsrokkdg8M8uqrLo9X9E5uGbFn1-Baroig@mail.gmail.com>
 <20211126154532.nqlqkoxa77apioxu@houat>
 <CAPpJ_edY+HXfv_rNL01piUFYaTUdFb9KEj2h-xN0MH0cYRyMTQ@mail.gmail.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
 protocol="application/pgp-signature"; boundary="czxaihewcov44zn6"
Content-Disposition: inline
In-Reply-To: <CAPpJ_edY+HXfv_rNL01piUFYaTUdFb9KEj2h-xN0MH0cYRyMTQ@mail.gmail.com>
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
Cc: Dom Cobley <dom@raspberrypi.com>, Tim Gover <tim.gover@raspberrypi.com>,
 Dave Stevenson <dave.stevenson@raspberrypi.com>,
 David Airlie <airlied@linux.ie>, dri-devel <dri-devel@lists.freedesktop.org>,
 linux@endlessos.org, Thomas Zimmermann <tzimmermann@suse.de>,
 Daniel Vetter <daniel.vetter@intel.com>, Phil Elwell <phil@raspberrypi.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


--czxaihewcov44zn6
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Nov 29, 2021 at 04:31:57PM +0800, Jian-Hong Pan wrote:
> Maxime Ripard <maxime@cerno.tech> =E6=96=BC 2021=E5=B9=B411=E6=9C=8826=E6=
=97=A5 =E9=80=B1=E4=BA=94 =E4=B8=8B=E5=8D=8811:45=E5=AF=AB=E9=81=93=EF=BC=9A
> >
> > On Fri, Nov 19, 2021 at 06:24:34PM +0800, Jian-Hong Pan wrote:
> > > Maxime Ripard <maxime@cerno.tech> =E6=96=BC 2021=E5=B9=B411=E6=9C=881=
8=E6=97=A5 =E9=80=B1=E5=9B=9B =E4=B8=8B=E5=8D=886:40=E5=AF=AB=E9=81=93=EF=
=BC=9A
> > > >
> > > > On Thu, Nov 18, 2021 at 02:42:58PM +0800, Jian-Hong Pan wrote:
> > > > > Maxime Ripard <maxime@cerno.tech> =E6=96=BC 2021=E5=B9=B411=E6=9C=
=8817=E6=97=A5 =E9=80=B1=E4=B8=89 =E4=B8=8B=E5=8D=885:45=E5=AF=AB=E9=81=93=
=EF=BC=9A
> > > > > > The conversion to DRM commit helpers (f3c420fe19f8, "drm/vc4: k=
ms: Convert to
> > > > > > atomic helpers") introduced a number of issues in corner cases,=
 most of them
> > > > > > showing themselves in the form of either a vblank timeout or us=
e-after-free
> > > > > > error.
> > > > > >
> > > > > > These patches should fix most of them, some of them still being=
 debugged.
> > > > > >
> > > > > > Maxime
> > > > > >
> > > > > > Changes from v1:
> > > > > >   - Prevent a null pointer dereference
> > > > > >
> > > > > > Maxime Ripard (6):
> > > > > >   drm/vc4: kms: Wait for the commit before increasing our clock=
 rate
> > > > > >   drm/vc4: kms: Fix return code check
> > > > > >   drm/vc4: kms: Add missing drm_crtc_commit_put
> > > > > >   drm/vc4: kms: Clear the HVS FIFO commit pointer once done
> > > > > >   drm/vc4: kms: Don't duplicate pending commit
> > > > > >   drm/vc4: kms: Fix previous HVS commit wait
> > > > > >
> > > > > >  drivers/gpu/drm/vc4/vc4_kms.c | 42 ++++++++++++++++-----------=
--------
> > > > > >  1 file changed, 19 insertions(+), 23 deletions(-)
> > > > >
> > > > > I tested the v2 patches based on latest mainline kernel with RPi =
4B.
> > > > > System can boot up into desktop environment.
> > > >
> > > > So the thing that was broken initially isn't anymore?
> > >
> > > No.  It does not appear anymore.
> > >
> > > > > Although it still hit the bug [1], which might be under debugging=
, I
> > > > > think these patches LGTM.
> > > >
> > > > The vblank timeout stuff is a symptom of various different bugs. Ca=
n you
> > > > share your setup, your config.txt, and what you're doing to trigger=
 it?
> > >
> > > I get the RPi boot firmware files from raspberrypi's repository at tag
> > > 1.20211029 [1]
> > > And, make system boots:
> > > RPi firmware -> U-Boot -> Linux kernel (aarch64) with corresponding D=
TB
> > >
> > > The config.txt only has:
> > > enable_uart=3D1
> > > arm_64bit=3D1
> > > kernel=3Duboot.bin
> > >
> > > This bug can be reproduced with es2gears command easily.  May need to
> > > wait it running a while.
> > >
> > > Mesa: 21.2.2
> > > libdrm: 2.4.107
> > > xserver/wayland: 1.20.11  Using wayland
> > >
> > > This bug happens with direct boot path as well:
> > > RPi firmware -> Linux kernel (aarch64) with corresponding DTB
> > >
> > > I tried with Endless OS and Ubuntu's RPi 4B images.
> > > An easy setup is using Ubuntu 21.10 RPi 4B image [2].  Then, replace
> > > the kernel & device tree blob and edit the config.txt.
> >
> > Does it still appear if you raise the core clock in the config.txt file
> > using: core_freq_min=3D600 ?
>=20
> It still appears when I raise the core clock in the config.txt file:
> core_freq_min=3D600

That's weird, we had some issues like that already but could never point
exactly what was going on.

Is testing the official raspberrypi kernel an option for you? If so,
trying the same workload with fkms would certainly help

Maxime

--czxaihewcov44zn6
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQRcEzekXsqa64kGDp7j7w1vZxhRxQUCYaojywAKCRDj7w1vZxhR
xXuEAP9OBm520SXfn2duRssbqnrqpj9WcW3eXVfnr1dpRvkQGgEAjK2/V9CIfIBn
J44aJrHTDvpk9e6NefTjI4Pq+oH8BQ8=
=2T8s
-----END PGP SIGNATURE-----

--czxaihewcov44zn6--
