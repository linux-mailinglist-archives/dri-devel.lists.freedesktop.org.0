Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 5FCD8A74C96
	for <lists+dri-devel@lfdr.de>; Fri, 28 Mar 2025 15:28:13 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7705910EA2B;
	Fri, 28 Mar 2025 14:28:10 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="oWM0CN97";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from tor.source.kernel.org (tor.source.kernel.org [172.105.4.254])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3C4ED10EA2B
 for <dri-devel@lists.freedesktop.org>; Fri, 28 Mar 2025 14:28:09 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by tor.source.kernel.org (Postfix) with ESMTP id 027B9614BD;
 Fri, 28 Mar 2025 14:28:02 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A26D2C4CEEA;
 Fri, 28 Mar 2025 14:28:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1743172087;
 bh=2uknwqe+Y6i7pMdOjoqSIIMaI/JT+FSHvmuSZYqm9ao=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=oWM0CN97srCgu07X54677tyhZpT67sX/u6RNoWG3my9j17UvNNXiWqapNtjpF3kVN
 lhcbfz0TglfnGi0IDUU8q3YQEss0hV6Jc3EynVY3RWAxbasJ+9gftsIC03fzIeZUcp
 93tGRbbx/7m1gAKzPnw4WhNiT3Z2FmWGAudU84obUsdg+z8WMstK15XeKigbFV2Cpz
 PCc+tdehJwluqQ8xqZ7gbk+ozaWrv9i0kjWwxr6ArNjqtcT521zl4oeObSqBadImOY
 ZE5JaNjJpnMpTrcSfrPEbn5cuXaw+Gxt2gRAAnLW+1UDbJEGP/9W9llVfEyqQPUO8b
 ytv+yyOfdi7uA==
Date: Fri, 28 Mar 2025 15:28:04 +0100
From: Maxime Ripard <mripard@kernel.org>
To: Danilo Krummrich <dakr@kernel.org>
Cc: airlied@gmail.com, simona@ffwll.ch, maarten.lankhorst@linux.intel.com, 
 tzimmermann@suse.de, lyude@redhat.com, acurrid@nvidia.com, lina@asahilina.net, 
 daniel.almeida@collabora.com, j@jannau.net, ojeda@kernel.org,
 alex.gaynor@gmail.com, 
 boqun.feng@gmail.com, gary@garyguo.net, bjorn3_gh@protonmail.com, 
 benno.lossin@proton.me, a.hindborg@kernel.org, aliceryhl@google.com,
 tmgross@umich.edu, 
 dri-devel@lists.freedesktop.org, rust-for-linux@vger.kernel.org
Subject: Re: [PATCH 5/8] rust: drm: add DRM driver registration
Message-ID: <20250328-impossible-locust-of-merriment-b625bd@houat>
References: <20250325235522.3992-1-dakr@kernel.org>
 <20250325235522.3992-6-dakr@kernel.org>
 <20250326-loyal-scrupulous-leech-59d44a@houat>
 <Z-PbHiaMNqR0FPbY@pollux>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
 protocol="application/pgp-signature"; boundary="yogbmzuaf53os4lx"
Content-Disposition: inline
In-Reply-To: <Z-PbHiaMNqR0FPbY@pollux>
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


--yogbmzuaf53os4lx
Content-Type: text/plain; protected-headers=v1; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
Subject: Re: [PATCH 5/8] rust: drm: add DRM driver registration
MIME-Version: 1.0

On Wed, Mar 26, 2025 at 11:46:54AM +0100, Danilo Krummrich wrote:
> On Wed, Mar 26, 2025 at 10:24:43AM +0100, Maxime Ripard wrote:
> > Hi,
> >=20
> > On Wed, Mar 26, 2025 at 12:54:32AM +0100, Danilo Krummrich wrote:
> > > Implement the DRM driver `Registration`.
> > >=20
> > > The `Registration` structure is responsible to register and unregiste=
r a
> > > DRM driver. It makes use of the `Devres` container in order to allow =
the
> > > `Registration` to be owned by devres, such that it is automatically
> > > dropped (and the DRM driver unregistered) once the parent device is
> > > unbound.
> >=20
> > The code looks correct, but the wording is confusing to me.
> > drm_dev_unregister does indeed unregister the device, but it's not freed
> > until the last reference is dropped, so it's not really "dropped once
> > the parent device is unbound", the reference is, and it's not active
> > anymore.
>=20
> The above wording is related to the Registration structure itself, i.e. t=
he
> Registration is dropped, but not the the DRM device itself. However, if t=
he
> Registration had the last reference to the DRM device, then of course it's
> freed.

Ok, my bad then :)

> > > +impl<T: Driver> Drop for Registration<T> {
> > > +    /// Removes the registration from the kernel if it has completed=
 successfully before.
> > > +    fn drop(&mut self) {
> > > +        // SAFETY: Safe by the invariant of `ARef<drm::Device<T>>`. =
The existence of this
> > > +        // `Registration` also guarantees the this `drm::Device` is =
actually registered.
> > > +        unsafe { bindings::drm_dev_unregister(self.0.as_raw()) };
> > > +    }
> > > +}
> >=20
> > drm_dev_unregister also have an hotplug-aware variant in
> > drm_dev_unplug(). However, most devices are hotpluggable, even if only
> > through sysfs. So drm_dev_unplug() is generally a better option. Should
> > we use it here, and / or should we provide multiple options still?
> >=20
> > Another thing worth mentioning I think is that drm_dev_unplug() works by
> > setting a flag, and drivers are expected to check that their access to
> > device-bound resources (so registers mapping, clocks, regulators, etc.)
> > are still there through drm_dev_enter/drm_dev_exit. It's pretty fragile
> > overall, so I wonder if it's something we could abstract away in Rust.
>=20
> DRM should not have to take care of the lifetime of device resources of t=
he
> parent device. This is the responsibility of the driver core abstractions.
>
> At least for the device resources we directly give out to drivers, it has=
 to be,
> since otherwise it would mean that the driver core abstraction is unsound.
> Drivers could otherwise extend the lifetime of device resources arbitrari=
ly.

Sure.

> For instance, I/O memory is only ever given out by bus abstractions embed=
ded in
> a Devres container (e.g. Devres<pci::Bar>). Once the parent device is unb=
ound
> the pci::Bar within the Devres container won't be accessible any more and=
 will
> be dropped internally. So, that's nothing DRM has to take care of.
>=20
> However, there are cases where it's better to let subsystem abstractions =
manage
> the lifetime of device resources, (e.g. DMA mappings). The relevant thing=
 is,
> that we never hand out device resources to a driver in a way that the dri=
ver can
> extend their lifetime arbitrarily.

I was talking about the opposite though: when the driver is still around
but the device (and its resources) aren't anymore.

It makes total sense to tie the lifetime of the device resources to the
device. However, the DRM device and driver will far outlive the device
it was bound to so it needs to deal with that kind of degraded "the DRM
driver can still be called by userspace, but it doesn't have a device
anymore" scenario. That's what I was talking about.

Maxime

--yogbmzuaf53os4lx
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQRcEzekXsqa64kGDp7j7w1vZxhRxQUCZ+ax9AAKCRDj7w1vZxhR
xRi7AQCZe5y9bi0+6xnE2QtnR5CfK9kyAMyEiwgRrYFv1zkJnwD/RTJYHFLlyypZ
AkDjxaDIihAM/IBomZ31OeO/Y1yJNwE=
=iLCa
-----END PGP SIGNATURE-----

--yogbmzuaf53os4lx--
