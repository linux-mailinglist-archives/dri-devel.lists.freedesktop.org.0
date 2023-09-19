Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 40D0E7A5E04
	for <lists+dri-devel@lfdr.de>; Tue, 19 Sep 2023 11:33:57 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B130610E25D;
	Tue, 19 Sep 2023 09:33:51 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from sin.source.kernel.org (sin.source.kernel.org [145.40.73.55])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DB87E10E239
 for <dri-devel@lists.freedesktop.org>; Tue, 19 Sep 2023 09:33:47 +0000 (UTC)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by sin.source.kernel.org (Postfix) with ESMTPS id E4879CE0B04;
 Tue, 19 Sep 2023 09:33:44 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id DA97EC433C8;
 Tue, 19 Sep 2023 09:33:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1695116023;
 bh=avUzQ65GcPX7paR7cIIF/tntqPhqLmf4/xu1oPsGAeA=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=Rvpy6WWTErgqnvURFZ7gC9+YNK0xDeaGDAd4Rk71KSBrd/2tha6bs0TJrF4pAHTjs
 cfDAkqzl8Y7wQvFgmt5rJ5cgIiakkGFbSfrmko8LbDv3MBeUphZ1GkKmQkn/TVrU16
 o9tuNLc1VtYH+G4jH2OEaq1eqJh6+a10TYkhdMBZ1CErahj3xdPsxw1NA2i8/+E6rB
 YHQs5IW7ixMh0RtMUFTslwT/0n5Jg1WO/OMohaZPhfSd9SZYR1S2AJt+d+Zj8fsBAG
 qak1FiVG/ALXiRfzShX8NnlCJHusqfFEMRLy81Lp01vV8TiRIc1ZBGDTXNkt9a3RGi
 1q2ntTusF2uYQ==
Date: Tue, 19 Sep 2023 11:33:40 +0200
From: Maxime Ripard <mripard@kernel.org>
To: Doug Anderson <dianders@chromium.org>
Subject: Re: [RFT PATCH 03/15] drm/ingenic: Call drm_atomic_helper_shutdown()
 at shutdown time
Message-ID: <i25dbp63khr35wmdjltttbmhoc37ejzulzzkqj6xosptde44mg@ijga2qee4vby>
References: <20230901234202.566951-1-dianders@chromium.org>
 <20230901164111.RFT.3.Iea742f06d8bec41598aa40378fc625fbd7e8a3d6@changeid>
 <288af70dafc5e73d0fdfac71a33449385d4d6bd3.camel@crapouillou.net>
 <CAD=FV=VuJe7ACFw3pt1z=EAh14_Z4iTOc5VKJt24CGwZYjRpeQ@mail.gmail.com>
 <3prgpsxxnf3hzeqcpjs5r37nfojbkuwk4ezizrwfrcthm666k6@t2q2qcpnfkiu>
 <CAD=FV=VSTP2g1RttMu_9+AGQbMK87MzQO+tw1cZBEJ3g-jAmYg@mail.gmail.com>
 <vkdjbjda23fwofsbt23wtjgiya3uhelby7evwtvteqkpwb4dr4@ybla63hqndic>
 <CAD=FV=VWF8tP2aykNW7+4tkqQExdoja71OqtiDFGZs+c7Gjttw@mail.gmail.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
 protocol="application/pgp-signature"; boundary="hk3mjln4nblbmh47"
Content-Disposition: inline
In-Reply-To: <CAD=FV=VWF8tP2aykNW7+4tkqQExdoja71OqtiDFGZs+c7Gjttw@mail.gmail.com>
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
Cc: linux-mips@vger.kernel.org, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, Paul Cercueil <paul@crapouillou.net>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


--hk3mjln4nblbmh47
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Sep 14, 2023 at 03:29:16PM -0700, Doug Anderson wrote:
> Hi,
>=20
> On Thu, Sep 14, 2023 at 1:14=E2=80=AFAM Maxime Ripard <mripard@kernel.org=
> wrote:
> >
> > > > So it doesn't have any relationship with the unbind/remove timing, =
and
> > > > for all we know it can be there indefinitely, while the application
> > > > continues to interact with the driver.
> > >
> > > I spent some time thinking about similar issues recently and, assuming
> > > my understanding is correct, I'd at least partially disagree.
> > >
> > > Specifically, I _think_ the only thing that's truly required to remain
> > > valid until userspace closes the last open "fd" is the memory for the
> > > "struct drm_device" itself, right? My understanding is that this is
> > > similar to how "struct device" works. The memory backing a "struct
> > > device" has to live until the last client releases a reference to it
> > > even if everything else about a device has gone away. So if it was all
> > > working perfectly then if the Linux driver backing the "struct
> > > drm_device" goes away then we'd release resources and NULL out a bunch
> > > of stuff in the "struct drm_device" but still keep the actual "struct
> > > drm_device" around since userspace still has a reference. Pretty much
> > > all userspace calls would fail, but at least they wouldn't crash. Is
> > > that roughly the gist?
> >
> > Yes, but also, no.
> >
> > In the spirit, you're right. However, there's three things interfering
> > here:
> >
> >   - You don't always have a match between device and KMS entity. Display
> >     pipelines are usually multiple devices working together, and while
> >     you probably have a 1:1 relationship with bridges and panels (and to
> >     some extent encoders/connectors), the planes and framebuffers for
> >     example are a mess :) So, if the device backing the planes is to be
> >     removed, what are you removing exactly? All of the planes and
> >     framebuffers? Do you free the buffers allocated by the userspace
> >     (that it might still use?)?
> >
> >   - In addition to that, KMS doesn't deal with individual entities being
> >     hotplugged so neither the subsystem nor the application expect to
> >     have a connector being removed.
> >
> >   - ioctl's aren't filtered once the device is starting to get removed
> >     on most drivers.
> >
> > So due to 1 and 2, we can't really partially remove components unless
> > the application is aware of it, and it doesn't expect to. And most
> > drivers still allow (probably unwillingly though) the application to
> > call ioctls once the DRM device has lost at least one of its backing
> > devices.
>=20
> We "can't", but we "can", right? Userspace can freely unbind a driver.
> Unless you want to dig into if the community would allow a driver to
> block "unbind" then we have to, at the very least, not crash the
> kernel when userspace does this. Ideally we'd have something more
> elegant than just "don't crash the kernel", but at least we shouldn't
> crash.

I'm not sure what you mean here, sorry

> > > Assuming that's correct, then _most_ of the resource acquiring /
> > > memory allocation can still happen in the device probe() routine and
> > > can still use devm as long as we do something to ensure that any
> > > resources released are no longer pointed to by anything in the "struct
> > > drm_device".
> > >
> > > To make it concrete, I think we want this (feel free to correct). For
> > > simplicity, I'm assuming a driver that _doesn't_ use the component
> > > framework:
> > >
> > > a) Linux driver probe() happens. The "struct drm_device" is allocated
> > > in probe() by devm_drm_dev_alloc(). This takes a reference to the
> > > "struct drm_device". The device also acquires resources / allocates
> > > memory.
> >
> > You need to differentiate resources and allocations there. Resources can
> > be expected to go away at the same time than the device, so using devm
> > is fine. Allocations are largely disconnected from the device lifetime,
> > and using devm leads to UAF.
>=20
> Right. I think my original point was looking at "ingenic-drm-drv.c".
> Much of the "devm" stuff there is resources and those specific things
> could be moved to probe() instead of bind(), right?

It depends. The registers, clock, regmap allocations are fine. The panel
isn't for example.

> For allocations, I think you'd have to look at each allocation. If the
> allocation needed to live as long as the "struct drm_device" then devm
> is clearly the wrong choice. ...but not every allocation needs to live
> that long.

Most of the allocations are in a KMS driver though? At least all the
structures that store either planes, crtcs, encoders, connectors, panels
or bridges (plus their state) need to be allocated through drmm.

> Also, even if in the "simple" case allocations need to live as long as
> a "struct drm_device", it's possible that there are some cases where
> there's only an indirect reference to the memory. In that case, you
> could NULL out the indirect reference and then free it. Obviously
> someone would need to take care here.

I guess we could, but it would be fairly hard to do since if we clear a
connector, we would need to clear that particular allocation, but also
=66rom all the states that reference it, and the entities that store a
pointer to it somehow (some of them possibly in drivers). It's not super
valuable anyway since the current expectation is that it's all or
nothing, if you remove one connector you are expected to remove the
whole KMS driver.

> > > b) Userspace acquires a reference to the "struct drm_device". Refcount
> > > is now 2 (one from userspace, one from the Linux driver).
> > >
> > > c) The Linux driver unbinds, presumably because userspace requested
> > > it. From earlier I think we decided that we can't (by design) block
> > > unbind. Once unbind happens then we shouldn't try to keep operating
> > > the device
> >
> > That part is correct, because the resources aren't there anymore.
> >
> > > the driver should stop running.
> >
> > But for the reasons above, the driver needs to still operate (in a
> > degraded mode).
>=20
> So I think here is where the disconnect is from our viewpoints. IMO
> when a Linux driver is unbound then it makes no sense to try to
> operate the device in "a degraded mode". When a Linux driver is
> unbound then it should be releasing all of the resources from the
> device (iomaps, IRQs, regulators, GPIOs, etc). That's just what
> unbinding a driver is supposed to do.

I guess we agree on that part.

> I understand what you're saying above about display pipelines being
> multiple Linux drivers working together and that it doesn't make lots
> of sense to just unbind a random Linux device driver in the middle of
> things.

That's not what I'm saying though. What I'm saying is that if we remove
one, everything must go. And that's what ingenic is doing btw. But all
the allocations still need to stay until the last fd is closed.

> ...and I don't really have a simple/great answer for how to do
> something super elegant if userspace tries to just randomly unbind one
> of the many drivers in an active display pipeline.

That's not a concern. I know vc4 handles that just fine, probably others
too.

> > > As part of the unbind, the remove() is called and also "devm"
> > > resources are deallocated. If any of the things freed are pointed to
> > > by the "struct drm_device" then the code needs to NULL them out at
> > > this time.
> >
> > Right, we also need to make sure we don't access any of the resources
> > that got freed. This is typically done by protecting all the accesses
> > with drm_dev_enter/drm_dev_exit.
> >
> > > Also we should make sure that any callback functions that userspace
> > > could cause to be invoked return errors.
> >
> > That would prevent any new ioctl from occuring after the device has been
> > removed, but that doesn't fix the race condition if it's removed while
> > there's a commit happening. This is further complicated by the fact that
> > commits can be queued (so you would have multiple submitted already) or
> > made asynchronous.
>=20
> I guess I would have expected that the remove() callback in the device
> would prevent new commits from starting and then block waiting until
> any in-progress commits were finished? ...kinda like how drivers call
> del_timer_sync() in their remove functions...
>=20
>=20
> > > Our code could go away at any point here since userspace could "rmmod"
> > > our module.
> >
> > Yeah, we probably have a bug there. Boris also reported something like
> > that recently where if you add an action with drmm_add_action, and then
> > remove the module, the function would have been free'd by the time it
> > executes.
>=20
> I'm fairly certain that you can prevent a module from being unloaded
> by just grabbing a refcount to it. However, I'm not sure that's the
> right solution. If we're trying to run driver code after a driver has
> been unbound then, IMO, that's the bug.

init, exit and probe run while the device in unbound.

> > > However, it's not a panacea for everything. Specifically once
> > > the Linux driver unbind finishes then the device isn't functional
> > > anymore.
> >
> > What's wrong with it then?
>=20
> I'm mostly just saying don't just search-and-replace "devm" with
> "drmm" in your driver and call it done. You need to think carefully
> about which things are which lifetime.

Sure, where did I say anything different? For vc4, it took me a ~60
patches to do the conversion, so yeah, it's not just a sed call.

> Ironically, while digging into this I'm tempted to take back my
> original request. Despite the kernel docs I pointed at [1], it
> actually looks like it might be fine to use "devm" within a
> component's bind() function. In try_to_bring_up_aggregate_device() it
> seems like the code is opening up a nested "devres" group specifically
> to allow this to work. A little bit of testing that I did with this
> shows that, indeed, the nesting seems to be working. Am I missing
> something here?

I don't think we're on the same page, because I also don't know why
that's relevant in that particular context?

Sure, you can use devm in a component framework driver. The limitations
I'm talking about have nothing to do with the component framework but
rather between devm and KMS. So all the issues I brought up are still
very much relevant for a single device doing devm_ allocations at probe.

Maxime

--hk3mjln4nblbmh47
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQRcEzekXsqa64kGDp7j7w1vZxhRxQUCZQlq9AAKCRDj7w1vZxhR
xd21AQCvWBuoYKCHRtoJkg2ixDhpE58+7aOV2cBNc0tqLf6krQD/aEJAm2jYK/aw
ZbSRpzivtFRNhcNVJwo69UROHMKH6QE=
=uZlq
-----END PGP SIGNATURE-----

--hk3mjln4nblbmh47--
