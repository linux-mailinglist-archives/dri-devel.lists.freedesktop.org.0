Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 7E1A978E743
	for <lists+dri-devel@lfdr.de>; Thu, 31 Aug 2023 09:38:14 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DA92D10E17C;
	Thu, 31 Aug 2023 07:38:09 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0014D10E17C
 for <dri-devel@lists.freedesktop.org>; Thu, 31 Aug 2023 07:38:08 +0000 (UTC)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 2963161D12;
 Thu, 31 Aug 2023 07:38:08 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 43DD6C433C7;
 Thu, 31 Aug 2023 07:38:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1693467487;
 bh=32Rbp6OyadPJT9rceFsTs8rDhe2WmzpzitbkTpO+w9A=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=GkZ8e65qPq1gIMnbzaqr5uDJrvM6PVEmXqRcn2pSMuJUlu4smOdnCpXo9zZkVfF5p
 SAMXxHRQJKrt/WLfkOOfekELpkZcCvO73mTZ/Jkse0mB6Tj4CouHvoztlcUm4TEZPW
 Dgp6X9izaiXbny7Lg4kJTehq+B/+71Uq/fkg803t08rs2FIDJLYuqvnQV6OLGbz5XL
 35GuAeSLghhV0NiVObCsvOCqj5RbNV7Nseyng5UFoazEyJIHBvJMX8YyksQBwolv+N
 qWDxExk56hTM7uyavLl4mEyCpUCE0SjD71FRWS1aQZObXlL6bQUqG9zgyBNap7aegj
 evz1vxqSMHxRg==
Date: Thu, 31 Aug 2023 09:38:04 +0200
From: Maxime Ripard <mripard@kernel.org>
To: Doug Anderson <dianders@chromium.org>
Subject: Re: [RFC PATCH 04/10] drm/panel_helper: Introduce drm_panel_helper
Message-ID: <wwzbd7dt5qyimshnd7sbgkf5gxk7tq5dxtrerz76uw5p6s7tzt@cbiezkfeuqqn>
References: <20230804210644.1862287-1-dianders@chromium.org>
 <20230804140605.RFC.4.I930069a32baab6faf46d6b234f89613b5cec0f14@changeid>
 <bphkopaq76imqzut7xrx7aprqybhx3veajdympqhig2wqlix6c@64ck23rc5cv7>
 <CAD=FV=XiVkoCsjin4R74nkcd8vzOq9uPq+o5cRjd=YOoPXuQkg@mail.gmail.com>
 <lhd6ai7d6swlxhisjhikytguor7pptrymo3bmfwej4k7zqrnv4@hp2gvhw7mh3m>
 <CAD=FV=XUhzguFCC=aKzHFMV0bBnZzkHXP_tx+P=PNkVr=8SnTA@mail.gmail.com>
 <mumiep5q7x7qj7k64h3cyodxrgk737iy5rum5keguquwymf2gy@3qruwfrqjgy7>
 <CAD=FV=VEene+nr1us87iA+bomxzQ039r-E+wqvizvFGbxXjDvA@mail.gmail.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
 protocol="application/pgp-signature"; boundary="n3yi4w4hn2i6dbxt"
Content-Disposition: inline
In-Reply-To: <CAD=FV=VEene+nr1us87iA+bomxzQ039r-E+wqvizvFGbxXjDvA@mail.gmail.com>
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
Cc: Thomas Zimmermann <tzimmermann@suse.de>, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


--n3yi4w4hn2i6dbxt
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Aug 30, 2023 at 04:10:20PM -0700, Doug Anderson wrote:
> Hi,
>=20
> On Tue, Aug 29, 2023 at 1:38=E2=80=AFAM Maxime Ripard <mripard@kernel.org=
> wrote:
> >
> > On Mon, Aug 28, 2023 at 09:06:29AM -0700, Doug Anderson wrote:
> > > > > Shutdown is called any time you reboot a device. That means that =
if a
> > > > > DRM driver is _not_ calling drm_atomic_helper_shutdown() on the
> > > > > panel's behalf at shutdown time then the panel won't be powered o=
ff
> > > > > properly. This feels to me like something that might actually mat=
ter.
> > > >
> > > > It does matter. What I disagree on is that you suggest working arou=
nd
> > > > that brokenness in the core framework. What I'm saying is driver is
> > > > broken, we should keep the core framework sane and fix it in the dr=
iver.
> > > >
> > > > It should be fairly easy with a coccinelle script to figure out whi=
ch
> > > > panels are affected, and to add that call in remove.
> > >
> > > I think I'm confused here. I've already figured out which panels are
> > > affected in my patch series, right? It's the set of panels that today
> > > try to power the panel off in their shutdown call, right? ...but I
> > > think we can't add the call you're suggesting,
> > > drm_atomic_helper_shutdown(), to the _panel_'s shutdown callback, can
> > > we? We need to add it to the shutdown callback of the top-level DRM
> > > driver, right?
> >
> > I have no idea what happens if we just unbind the panel device from its
> > driver.
> >
> > If we can't, then it's all fine. If we can, then we need figure out how
> > to unregister the DRM device (or block the unbinding from happening).
>=20
> Nothing prevents unbinding the panel driver directly. I just confirmed
> on my sc7180-lazor:
>=20
> cd /sys/bus/dp-aux/drivers/panel-simple-dp-aux
> echo aux-2-0008 > unbind
>=20
> ...no errors happened and the panel unbound. I think this is as
> expected since I'm not aware of a way to prevent unbinding a driver. I
> think the relevant function is unbind_store() in bus.c, right? There
> is no failure code returned by device_driver_detach(). Presumably this
> is by design?

Well, that sucks :(

If I'm reading the docs right, then we could add a device link from the
panel (provider) to the KMS device (consumer), and unbinding the panel
would unbind the KMS driver.

https://www.kernel.org/doc/html/latest/driver-api/device_link.html#state-ma=
chine

"""
Before a supplier's driver is removed, links to consumers that are
not bound to a driver are updated to DL_STATE_SUPPLIER_UNBIND. (Call to
device_links_busy() from __device_release_driver().) This prevents the
consumers from binding. (Call to device_links_check_suppliers() from
really_probe().) Consumers that are bound are freed from their driver;
consumers that are probing are waited for until they are done. (Call to
device_links_unbind_consumers() from __device_release_driver().) Once
all links to consumers are in DL_STATE_SUPPLIER_UNBIND state, the
supplier driver is released and the links revert to DL_STATE_DORMANT.
(Call to device_links_driver_cleanup() from __device_release_driver().)
"""

It would be painful to rebind the whole thing, but at least we would be
safe.

> FWIW, also trying to re-bind didn't work, also as expected (I think).
> I think the whole bridge chain would need to be resolved again and
> nothing I'm aware of makes that happen. Maybe I'm simply missing
> something in my understanding, of course.

Yeah, I would expect rebinding the entire thing would solve this too. We
never really supported partial devices (which is also why the panel or
bridges going away sucks), so switching to something more dynamic is
probably going to be a lot of work for not much gains.

> If you want to attempt to tackle some of these issues then I'd be more
> than happy. I'm already waist deep in yak hair and I think this is too
> big of a task for me to add on.

I don't think we need to fix this in this series, or even now. Maybe we
should add a TODO note so that we don't forget about it, but I'd rather
get the original problem fixed :)

> Should this issue block my work, then?

No, definitely not. It's orthogonal to me. The only thing we could learn
=66rom that experiment for this series is that calling
drm_atomic_helper_shutdown() is probably just wishful thinking at this
point.

> Today, panels will at least cleanly power themselves off if someone
> tries to unbind them like that. If I remove the clean power off at
> driver unbind time and rely on the DRM driver to power panels off
> cleanly then if someone directly unbinds a panel like I've done above
> then it won't be power sequenced properly, right?

Yeah... The kernel also probably just blew up because it followed a
dangling pointer to what used to be our panel but got freed when it was
unbound.

So, if we go back to the original intent of this series and sums things
up.

Our goals are:

  1) We want to have the panel disabled at KMS shutdown and remove
     (Doug, Maxime);

  2) but we want them to be disabled once to avoid any double-free or
     related issue (Doug, Maxime);

  3) doing so should work out of the box so that we close this once and
     for all, so no boilerplate or function to call in the panel driver
     (Maxime);

For 3) to happen, it means that all drivers should call
drm_atomic_helper_shutdown() both in remove/unbind and at shutdown. It's
something that drivers should do anymay, but a very significant number
of them don't.

However, panels and bridges, when they are unbound/removed, don't notify
the KMS driver that they are connected to and thus we end up with
dangling pointers and the panel still powered on if 3 is implemented as
is.

We shouldn't try to fix panel unbinding at the moment, so we have to
take it into account.

Is that a good summary?

If so, then I think we can implement everything by doing something like:

  - Implement enable and disable refcounting in panels.
    drm_panel_prepare and drm_panel_enable would increase it,
    drm_panel_unprepare and drm_panel_disable would decrease it.

  - Only actually call the disable and unprepare functions when that
    refcount goes to 0 in the normal case.

  - In drm_panel_remove, if we still have a refcount > 0, then we WARN
    and force unprepare/disable the panel.

And in parallel, we convert all drivers to use
drm_atomic_helper_shutdown() so that, in the most common case, we don't
rely on the drm_panel_remove safety net. And we'll want a bunch of TODO
items to eventually remove that safety net and the refcounting entirely
once we fix the unbinding issue.

Does that make sense?

> > > > > Panels tend to be one of those things that really care about their
> > > > > power sequencing and can even get damaged (or not turn on properly
> > > > > next time) if sequencing is not done properly, so just removing t=
his
> > > > > code and putting the blame on the DRM driver seems scary to me.
> > > >
> > > > Sure, it's bad. But there's no difference compared to the approach =
you
> > > > suggest in that patch: you created a helper, yes, but every driver =
will
> > > > still have to call that helper and if they don't, the panel will st=
ill
> > > > be called and it's a bug. And we would have to convert everything to
> > > > that new helper.
> > > >
> > > > It's fundamentally the same discussion than what you were opposed to
> > > > above.
> > >
> > > I think the key difference here is that, if I understand correctly,
> > > drm_atomic_helper_shutdown() needs to be added to the top-level DRM
> > > driver, not to the panel itself. I guess I'm worried that I'll either
> > > miss a case or that simply adding a call to
> > > drm_atomic_helper_shutdown() in the top-level DRM driver will break
> > > something. Well, I suppose I can try it and see what happens...
> >
> > The more I think about this discussion, the more I think that the
> > original intent of the prepared/enabled flags were precisely there to
> > prevent a double-disable for drivers with drm_atomic_helper_shutdown(),
> > while still shutting down the panel resources when the panel is used
> > with a driver that doesn't call it.
>=20
> Sure, that makes sense.

And we would also catch that and complain loudly so that if we ever miss
drivers in the conversion, it's clear that it needs to be fixed.

> > Honestly, I think the right thing to do here is to make every driver
> > call shutdown, and then you don't need the reference counting anymore.
> >
> > I had a shot at a (possibly very suboptimal) coccinelle script to look
> > for drivers that are KMS drivers but don't call
> > drm_atomic_helper_shutdown() at shutdown.
> >
> > https://paste.ack.tf/bb42e6@raw
>=20
> Your paste seems to have expired. Maybe you used the default and had
> it expire in 1 day? Maybe you could just paste the script in email so
> it'll be archived for posterity on lore?

Argh, sorry. The coccinelle script was massive so I didn't want to
inline it, but here you go:

----8<----
virtual report

@ has_driver @
identifier driver;
position p;
@@

(
 struct pci_driver driver@p =3D {
   ...
 };
|
 struct platform_driver driver@p =3D {
   ...
 };
|
 struct spi_driver driver@p =3D {
   ...
 };
)

@ has_probe @
identifier has_driver.driver;
identifier probe_f;
@@

(
  struct pci_driver driver =3D {
	.probe =3D probe_f,
  };
|
  struct platform_driver driver =3D {
	.probe =3D probe_f,
  };
|
  struct spi_driver driver =3D {
	.probe =3D probe_f,
  };
)

@ has_shutdown @
identifier has_driver.driver;
identifier shutdown_f;
@@

(
  struct pci_driver driver =3D {
	.shutdown =3D shutdown_f,
  };
|
  struct platform_driver driver =3D {
	.shutdown =3D shutdown_f,
  };
|
  struct spi_driver driver =3D {
	.shutdown =3D shutdown_f,
  };
)

@ has_kms_atomic @
identifier kms_driver;
@@

  struct drm_driver kms_driver =3D {
        .driver_features =3D DRIVER_ATOMIC | ...,
  };

@ is_kms_probe depends on has_probe && has_kms_atomic @
identifier has_probe.probe_f;
identifier has_kms_atomic.kms_driver;
@@

 probe_f(...)
 {
	<+...
(
	drm_dev_alloc(&kms_driver, ...)
|
	devm_drm_dev_alloc(..., &kms_driver, ...)
)
	...+>
 }

@ uses_component @
identifier ops;
identifier bind_f;
@@

  struct component_master_ops ops =3D {
        .bind =3D bind_f,
  };

@ registers_bind depends on has_probe && uses_component @
identifier uses_component.ops;
identifier has_probe.probe_f;
@@

 probe_f(...)
 {
	<+...
(
	component_master_add_with_match(..., &ops, ...)
|
	drm_of_component_probe(..., &ops)
)
	...+>
 }

@ is_kms_component depends on uses_component && registers_bind && has_kms_a=
tomic @
identifier uses_component.bind_f;
identifier has_kms_atomic.kms_driver;
@@

 bind_f(...)
 {
	<+...
(
	drm_dev_alloc(&kms_driver, ...)
|
	devm_drm_dev_alloc(..., &kms_driver, ...)
)
	...+>
 }

@ has_kms_init_f depends on has_kms_atomic && !(is_kms_probe || is_kms_comp=
onent) @
identifier has_kms_atomic.kms_driver;
identifier init_f;
@@

 init_f(...)
 {
	<+...
(
	drm_dev_alloc(&kms_driver, ...)
|
	devm_drm_dev_alloc(..., &kms_driver, ...)
)
	...+>
 }

@ is_kms_probe_subf depends on has_probe && has_kms_init_f @
identifier has_kms_init_f.init_f;
identifier has_probe.probe_f;
@@

 probe_f(...)
 {
	<+...
	init_f(...)
	...+>
 }

@ is_kms_bind_subf depends on uses_component && has_kms_init_f @
identifier has_kms_init_f.init_f;
identifier uses_component.bind_f;
@@

 bind_f(...)
 {
	<+...
	init_f(...)
	...+>
 }

@ shuts_down depends on has_shutdown @
identifier has_shutdown.shutdown_f;
@@

 shutdown_f(...)
 {
	<+...
	drm_atomic_helper_shutdown(...)
	...+>
 }

@ script:python depends on report && (is_kms_probe || is_kms_probe_subf || =
is_kms_component || is_kms_bind_subf) && !has_shutdown @
ops << has_driver.driver;
p << has_driver.p;
@@

coccilib.report.print_report(p[0], "ERROR: KMS driver %s is missing shutdow=
n implementation" % (ops))

@ script:python depends on report && (is_kms_probe || is_kms_probe_subf || =
is_kms_component || is_kms_bind_subf) && (has_shutdown && !shuts_down) @
ops << has_driver.driver;
p << has_driver.p;
@@

coccilib.report.print_report(p[0], "ERROR: KMS driver %s shutdown implement=
ation is missing a call to drm_atomic_helper_shutdown()" % (ops))

----8<----

>=20
> > The result is:
> >
> > $ make coccicheck COCCI=3D./test-drm-shutdown.cocci MODE=3Dreport
> >
> > ...
> >
> > ./drivers/gpu/drm/sti/sti_drv.c:262:30-49: ERROR: KMS driver sti_platfo=
rm_driver is missing shutdown implementation
> > ./drivers/gpu/drm/armada/armada_drv.c:245:30-56: ERROR: KMS driver arma=
da_drm_platform_driver is missing shutdown implementation
> > ./drivers/gpu/drm/vmwgfx/vmwgfx_drv.c:1637:25-39: ERROR: KMS driver vmw=
_pci_driver is missing shutdown implementation
> > ./drivers/gpu/drm/vboxvideo/vbox_drv.c:163:25-40: ERROR: KMS driver vbo=
x_pci_driver is missing shutdown implementation
> > ./drivers/gpu/drm/tiny/arcpgu.c:424:30-52: ERROR: KMS driver arcpgu_pla=
tform_driver is missing shutdown implementation
> > ./drivers/gpu/drm/omapdrm/omap_drv.c:856:30-34: ERROR: KMS driver pdev =
is missing shutdown implementation
> > ./drivers/gpu/drm/fsl-dcu/fsl_dcu_drm_drv.c:361:30-57: ERROR: KMS drive=
r fsl_dcu_drm_platform_driver is missing shutdown implementation
> > ./drivers/gpu/drm/tve200/tve200_drv.c:261:30-43: ERROR: KMS driver tve2=
00_driver is missing shutdown implementation
> > ./drivers/gpu/drm/stm/drv.c:235:30-53: ERROR: KMS driver stm_drm_platfo=
rm_driver is missing shutdown implementation
> > ./drivers/gpu/drm/qxl/qxl_drv.c:267:25-39: ERROR: KMS driver qxl_pci_dr=
iver is missing shutdown implementation
> > ./drivers/gpu/drm/logicvc/logicvc_drm.c:494:30-57: ERROR: KMS driver lo=
gicvc_drm_platform_driver is missing shutdown implementation
> > ./drivers/gpu/drm/sun4i/sun4i_drv.c:439:30-55: ERROR: KMS driver sun4i_=
drv_platform_driver is missing shutdown implementation
> > ./drivers/gpu/drm/atmel-hlcdc/atmel_hlcdc_dc.c:827:30-60: ERROR: KMS dr=
iver atmel_hlcdc_dc_platform_driver is missing shutdown implementation
> > ./drivers/gpu/drm/mcde/mcde_drv.c:471:30-41: ERROR: KMS driver mcde_dri=
ver is missing shutdown implementation
> > ./drivers/gpu/drm/hisilicon/hibmc/hibmc_drm_drv.c:366:25-41: ERROR: KMS=
 driver hibmc_pci_driver is missing shutdown implementation
> > ./drivers/gpu/drm/aspeed/aspeed_gfx_drv.c:365:30-56: ERROR: KMS driver =
aspeed_gfx_platform_driver is missing shutdown implementation
> > ./drivers/gpu/drm/ingenic/ingenic-drm-drv.c:1607:30-48: ERROR: KMS driv=
er ingenic_drm_driver is missing shutdown implementation
> > ./drivers/gpu/drm/arm/malidp_drv.c:982:30-52: ERROR: KMS driver malidp_=
platform_driver is missing shutdown implementation
> > ./drivers/gpu/drm/arm/hdlcd_drv.c:400:30-51: ERROR: KMS driver hdlcd_pl=
atform_driver is missing shutdown implementation
> > ./drivers/gpu/drm/kmb/kmb_drv.c:622:30-49: ERROR: KMS driver kmb_platfo=
rm_driver is missing shutdown implementation
> > ./drivers/gpu/drm/exynos/exynos_drm_drv.c:356:30-56: ERROR: KMS driver =
exynos_drm_platform_driver is missing shutdown implementation
> > ./drivers/gpu/drm/tiny/bochs.c:718:25-41: ERROR: KMS driver bochs_pci_d=
river is missing shutdown implementation
> > ./drivers/gpu/drm/tiny/cirrus.c:746:25-42: ERROR: KMS driver cirrus_pci=
_driver is missing shutdown implementation
> > ./drivers/gpu/drm/mediatek/mtk_drm_drv.c:954:30-53: ERROR: KMS driver m=
tk_drm_platform_driver is missing shutdown implementation
> >
> > It's a significant number of drivers, but it's not the end of the world,
> > really.
>=20
> My own analysis shows more than that, actually. I can't look at your
> script since it's expired, but as one example your list seems to have
> neither imx/ipuv3 nor imx/dcss. imx/ipuv3 seems to be missing
> drm_atomic_helper_shutdown() at both unbind and system shutdown time.

Yeah, this was due to the script ignoring drm_of_component_probe that
ipuv3 uses. It's fixed now.

> imx/dcss seems to be missing drm_atomic_helper_shutdown() at system
> shutdown time, though it does have it at driver remove time.

And I'm wondering if this one is due to the fact that probe only calls a
function that isn't in the same file, which confuses my script. I'm not
entirely sure how to address that though.

> Did I mess up in identifying those two drivers as ones that need
> fixing?

No, both look like legit issues indeed.

> I can't give you an exact list because I don't have a great search
> that identifies the problem. I'm mostly looking for all instances of
> drm_dev_register() where the driver is "DRIVER_MODESET" and then
> manually checking their use of drm_atomic_helper_shutdown(). Until I
> get through them all I won't know the count, and it's a manual
> process.

I think my coccinnelle script will match with most of them, but we might
still miss a few indeed.

Maxime

--n3yi4w4hn2i6dbxt
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQRcEzekXsqa64kGDp7j7w1vZxhRxQUCZPBDXAAKCRDj7w1vZxhR
xT5JAP49R6gHmRGhOx93IcouvIvQXCC9xl1GZcxVMeQhHaHftwD/XiPKcRu7LGC2
ksfkDmP9Dg8c8Z+mWTMzUzVmVuFa3Qs=
=yGXw
-----END PGP SIGNATURE-----

--n3yi4w4hn2i6dbxt--
