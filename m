Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 0CF26AC5188
	for <lists+dri-devel@lfdr.de>; Tue, 27 May 2025 17:04:10 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6CC5B10E4DB;
	Tue, 27 May 2025 15:04:08 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="VcoxJzqG";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5103010E4DB
 for <dri-devel@lists.freedesktop.org>; Tue, 27 May 2025 15:04:07 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by dfw.source.kernel.org (Postfix) with ESMTP id D52305C51A1;
 Tue, 27 May 2025 15:01:45 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3744BC4CEF1;
 Tue, 27 May 2025 15:04:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1748358242;
 bh=ArZNSH3ZncbgQbNY80Kff9ftXaMFoTfgRgzzmaY75y0=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=VcoxJzqGDPY5t3CM5xOnRByvDyDZwtQlc0f9pE4hdLWfZ11Nrsc0BFclDF4Udnaq0
 PBGdKR4prp9cjivsHnKHeF2dougo8NrsbC+NcgT5awjpvECxdio50dR9ad+oxXJeLy
 CMK6RzwcLzoBMnfDAJVQmFwwdGJonTKtjBHhxL1Up1RUJpWytSkdre/Iu6WgG1LV7O
 MK/9UCEJ28Lf7xOo89ImMwsiQnXqOEGhpKMxE24vtvRqaM6P1OCNZYZ/9++RGc5Y/3
 3aw0uhPrF1hUc34i/773c+q3ssu4vuu6dlRaaq457YuzDGfvopVT2pt/fbuLryfSSh
 xDElf7HyozgDg==
Date: Tue, 27 May 2025 17:04:00 +0200
From: Maxime Ripard <mripard@kernel.org>
To: Jani Nikula <jani.nikula@linux.intel.com>
Cc: Anusha Srivatsa <asrivats@redhat.com>, 
 Neil Armstrong <neil.armstrong@linaro.org>,
 Jessica Zhang <quic_jesszhan@quicinc.com>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Thomas Zimmermann <tzimmermann@suse.de>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 dri-devel@lists.freedesktop.org, 
 linux-kernel@vger.kernel.org, Luca Ceresoli <luca.ceresoli@bootlin.com>
Subject: Re: [PATCH v4 2/4] drm/panel: Add refcount support
Message-ID: <20250527-origami-mayfly-of-superiority-2a1cf1@houat>
References: <20250505-slim-bizarre-marten-a674ac@houat>
 <CAN9Xe3RLazpAXdxxJmyF2QAShDtMSgdoxMdo6ecdYd7aZiP9kA@mail.gmail.com>
 <874ixvtbxy.fsf@intel.com>
 <20250509-rapid-flounder-of-devotion-6b26bb@houat>
 <87r00yj6kv.fsf@intel.com>
 <molexnyjkiryvhetfdc66gmzecrf6f7kxl656qn46djdkixrkb@fdgnp5hispbf>
 <875xi3im1r.fsf@intel.com>
 <20250519-singing-silent-stingray-fe5c9b@houat>
 <87sekztwyc.fsf@intel.com>
 <8210f7fc0dbcfc5b1eea47ccb762c7e53b45236a@intel.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha384;
 protocol="application/pgp-signature"; boundary="f7vm5jv4rvsfprh5"
Content-Disposition: inline
In-Reply-To: <8210f7fc0dbcfc5b1eea47ccb762c7e53b45236a@intel.com>
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


--f7vm5jv4rvsfprh5
Content-Type: text/plain; protected-headers=v1; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
Subject: Re: [PATCH v4 2/4] drm/panel: Add refcount support
MIME-Version: 1.0

Hi,

On Fri, May 23, 2025 at 02:34:05PM +0300, Jani Nikula wrote:
> On Tue, 20 May 2025, Jani Nikula <jani.nikula@linux.intel.com> wrote:
> > Maxime -
> >
> > I'm cutting a lot of context here. Not because I don't think it deserves
> > an answer, but because I seem to be failing at communication.
> >
> > On Mon, 19 May 2025, Maxime Ripard <mripard@kernel.org> wrote:
> >> You still haven't explained why it would take anything more than
> >> registering a dumb device at probe time though.
> >
> > With that, do you mean a dumb struct device, or any struct device with a
> > suitable lifetime, that we'd pass to devm_drm_panel_alloc()?
>=20
> I'm no expert in ACPI, but I think it needs to be a struct device
> embedded inside struct acpi_device to implement the
> drm_panel_add_follower() lookup for ACPI.

What data do you have in the ACPI tables to associate the HID
touchscreen to the panel?

drm_panel_add_follower use the DT to lookup the panel, so the panel must
have a device->of_node pointer, so that obviously won't work, but it
might with ACPI, or we might need to split that function into several
parts to accomodate ACPI.

Maxime

--f7vm5jv4rvsfprh5
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iJUEABMJAB0WIQTkHFbLp4ejekA/qfgnX84Zoj2+dgUCaDXUXwAKCRAnX84Zoj2+
doWvAX9aaIPgwMBAbXCT4g5OIKOBpK7IbIAWDpqhQGxRrWvFy1IwDFcZ7/83+w/m
C2+bIXoBf3lj6gKshujnfMmS7lhD2pK8Xh5uQPimSA/HZw+4qGyTLEfxNKSizvif
pDUC3WAsSg==
=M7P2
-----END PGP SIGNATURE-----

--f7vm5jv4rvsfprh5--
