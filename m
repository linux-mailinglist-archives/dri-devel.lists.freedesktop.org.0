Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B5332969C8A
	for <lists+dri-devel@lfdr.de>; Tue,  3 Sep 2024 13:56:53 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 112C710E35D;
	Tue,  3 Sep 2024 11:56:51 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="nqF9COob";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from nyc.source.kernel.org (nyc.source.kernel.org [147.75.193.91])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A93A710E35D
 for <dri-devel@lists.freedesktop.org>; Tue,  3 Sep 2024 11:56:49 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by nyc.source.kernel.org (Postfix) with ESMTP id 75749A433EE;
 Tue,  3 Sep 2024 11:56:41 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id EF8EAC4CEC4;
 Tue,  3 Sep 2024 11:56:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1725364608;
 bh=b9Utbm9UqOtmVq9baiDIRxzUGkDXu1W11qtpgj75KQQ=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=nqF9COobcC1K34BZ0KijycMDUCVqXOr5ZQ4ODlT+2mH5NsMsjnz6l07H0Xhopy09O
 TphPDSAj0CszqUmzmae5tqa3/VRb+fBgHm4HqiWj0mwKHAI7iyiJn76xTZlABkdOOU
 1k59efZuuOQ2txQgT0FMbeW5v7n/8oi+MfF/5YPFXsxZ+d65GXc1EPvnvq6fMs74LM
 PFYSph9ETKyngm3ouPrz9IQe87OpIsMMop9baVLgo6GLO/Kh3nsICZhUp06dCcyI8f
 THyCAIZyzQwGkcozfogiAXh1CVn/fxYdBlMWsWPDWFQcTlask8uoHd+jsDnB7PqtkT
 +EgqFBDDTu9TQ==
Date: Tue, 3 Sep 2024 13:56:45 +0200
From: Maxime Ripard <mripard@kernel.org>
To: Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
Cc: Daniel Vetter <daniel.vetter@ffwll.ch>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>,
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>, 
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] drm/mipi-dsi: Fix devm unregister & detach
Message-ID: <20240903-encouraging-guillemot-of-warranty-aac44c@houat>
References: <66ab4206-d1c8-4aad-99a7-c4c316e343a9@ideasonboard.com>
 <20240626-warping-nondescript-mustang-bfce27@houat>
 <b7cf71b8-76fd-4638-a7b6-cc8dbae635bf@ideasonboard.com>
 <20240702-bold-exotic-mamba-fdbba4@houat>
 <7293448e-e8cc-4522-b39c-5ad133e5f732@ideasonboard.com>
 <20240725-natural-giga-crane-d54067@houat>
 <4ed3791f-bc5a-46f1-88e1-2441c7f9c8d4@ideasonboard.com>
 <20240902-refined-smooth-mammoth-fbee81@houat>
 <ZtWYWuqhqvdWd0Q7@phenom.ffwll.local>
 <d411e79f-a22e-48e9-b135-5d7a0afa3cf3@ideasonboard.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha384;
 protocol="application/pgp-signature"; boundary="j2aedqlgxplamaf4"
Content-Disposition: inline
In-Reply-To: <d411e79f-a22e-48e9-b135-5d7a0afa3cf3@ideasonboard.com>
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


--j2aedqlgxplamaf4
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Sep 02, 2024 at 03:31:28PM GMT, Tomi Valkeinen wrote:
> Hi,
>=20
> On 02/09/2024 13:50, Daniel Vetter wrote:
> > On Mon, Sep 02, 2024 at 11:26:11AM +0200, Maxime Ripard wrote:
> > > Hi,
> > >=20
> > > On Wed, Aug 07, 2024 at 03:19:23PM GMT, Tomi Valkeinen wrote:
> > > > On 25/07/2024 14:28, Maxime Ripard wrote:
> > > > > On Mon, Jul 15, 2024 at 11:32:34AM GMT, Tomi Valkeinen wrote:
> > > > > > On 02/07/2024 14:43, Maxime Ripard wrote:
> > > > > > > Hi Tomi,
> > > > > > >=20
> > > > > > > On Wed, Jun 26, 2024 at 06:53:40PM GMT, Tomi Valkeinen wrote:
> > > > > > > > On 26/06/2024 18:07, Maxime Ripard wrote:
> > > > > > > > > On Wed, Jun 26, 2024 at 12:55:39PM GMT, Tomi Valkeinen wr=
ote:
> > > > > > > > > > On 26/06/2024 11:49, Maxime Ripard wrote:
> > > > > > > > > > > Hi,
> > > > > > > > > > >=20
> > > > > > > > > > > On Wed, Jun 19, 2024 at 12:07:48PM GMT, Tomi Valkeine=
n wrote:
> > > > > > > > > > > > From: Tomi Valkeinen <tomi.valkeinen+renesas@ideaso=
nboard.com>
> > > > > > > > > > > >=20
> > > > > > > > > > > > When a bridge driver uses devm_mipi_dsi_device_regi=
ster_full() or
> > > > > > > > > > > > devm_mipi_dsi_attach(), the resource management is =
moved to devres,
> > > > > > > > > > > > which releases the resource automatically when the =
bridge driver is
> > > > > > > > > > > > unbound.
> > > > > > > > > > > >=20
> > > > > > > > > > > > However, if the DSI host goes away first, the host =
unregistration code
> > > > > > > > > > > > will automatically detach and unregister any DSI pe=
ripherals, without
> > > > > > > > > > > > notifying the devres about it. So when the bridge d=
river later is
> > > > > > > > > > > > unbound, the resources are released a second time, =
leading to crash.
> > > > > > > > > > >=20
> > > > > > > > > > > That's super surprising. mipi_dsi_device_unregister c=
alls
> > > > > > > > > > > device_unregister, which calls device_del, which in t=
urn calls
> > > > > > > > > > > devres_release_all.
> > > > > > > > > >=20
> > > > > > > > > > Hmm, right.
> > > > > > > > > >=20
> > > > > > > > > > > If that doesn't work like that, then it's what needs =
to be fixed, and
> > > > > > > > > > > not worked around in the MIPI-DSI bus.
> > > > > > > > > >=20
> > > > > > > > > > Well, something causes a crash for both the device regi=
ster/unregister case
> > > > > > > > > > and the attach/detach case, and the call stacks and deb=
ug prints showed a
> > > > > > > > > > double unregister/detach...
> > > > > > > > > >=20
> > > > > > > > > > I need to dig up the board and check again why the devr=
es_release_all() in
> > > > > > > > > > device_del() doesn't solve this. But I can probably onl=
y get back to this in
> > > > > > > > > > August, so it's perhaps best to ignore this patch for n=
ow.
> > > > > > > > > >=20
> > > > > > > > > > However, the attach/detach case is still valid? I see n=
o devres calls in the
> > > > > > > > > > detach paths.
> > > > > > > > >=20
> > > > > > > > > I'm not sure what you mean by the attach/detach case. Do =
you expect
> > > > > > > > > device resources allocated in attach to be freed when det=
ach run?
> > > > > > > >=20
> > > > > > > > Ah, never mind, the devres_release_all() would of course de=
al with that too.
> > > > > > > >=20
> > > > > > > > However, I just realized/remembered why it crashes.
> > > > > > > >=20
> > > > > > > > devm_mipi_dsi_device_register_full() and devm_mipi_dsi_atta=
ch() are given a
> > > > > > > > device which is used for the devres. This device is probabl=
y always the
> > > > > > > > bridge device. So when the bridge device goes away, so do t=
hose resources.
> > > > > > > >=20
> > > > > > > > The mipi_dsi_device_unregister() call deals with a DSI devi=
ce, which was
> > > > > > > > created in devm_mipi_dsi_device_register_full(). Unregister=
ing that DSI
> > > > > > > > device, which does happen when the DSI host is removed, doe=
s not affect the
> > > > > > > > devres of the bridge.
> > > > > > > >=20
> > > > > > > > So, unloading the DSI host driver causes mipi_dsi_device_un=
register() and
> > > > > > > > mipi_dsi_detach() to be called (as part of mipi_dsi_host_un=
register()), and
> > > > > > > > unloading the bridge driver causes them to be called again =
via devres.
> > > > > > >=20
> > > > > > > Sorry, that's one of the things I don't quite get. Both funct=
ions are
> > > > > > > exclusively(?) called from I2C bridges, so the device passed =
there
> > > > > > > should be a i2c_client instance, and thus the MIPI-DSI host g=
oing away
> > > > > > > will not remove those i2c devices, only the MIPI-DSI ones, ri=
ght?
> > > > > >=20
> > > > > > Yes.
> > > > > >=20
> > > > > > > So if we remove the host, the MIPI-DSI device will be detache=
d and
> > > > > > > removed through the path you were explaing with the i2c clien=
t lingering
> > > > > > > around. And if we remove the I2C device, then devm will kick =
in and will
> > > > > > > detach and remove the MIPI-DSI device.
> > > > > >=20
> > > > > > Right.
> > > > > >=20
> > > > > > > Or is it the other way around? That if you remove the host, t=
he device
> > > > > > > is properly detached and removed, but there's still the devm =
actions
> > > > > > > lingering around in the i2c device with pointers to the mipi_=
dsi_device
> > > > > > > that was first created, but since destroyed?
> > > > > > >=20
> > > > > > > And thus, if the i2c device ever goes away, we get a use-afte=
r-free?
> > > > > >=20
> > > > > > Hmm, I'm not sure I understand what you mean here... Aren't you=
 describing
> > > > > > the same thing in both of these cases?
> > > > > >=20
> > > > > > In any case, to expand the description a bit, module unloading =
is quite
> > > > > > fragile. I do get a crash if I first unload the i2c bridge modu=
le, and only
> > > > > > then go and unload the other ones in the DRM pipeline. But I th=
ink module
> > > > > > unloading will very easily crash, whatever the DRM drivers bein=
g used are,
> > > > > > so it's not related to this particular issue.
> > > > > >=20
> > > > > > In my view, the unload sequence that should be supported (for d=
evelopment
> > > > > > purposes, not for production) is to start the unload from the d=
isplay
> > > > > > controller module, which tears down the DRM pipeline, and going=
 from there
> > > > > > towards the panels/connectors.
> > > > > >=20
> > > > > > Of course, it would be very nice if the module unloading worked=
 perfectly,
> > > > > > but afaics fixing all that's related to module unloading would =
be a
> > > > > > multi-year project... So, I just want to keep the sequence I de=
scribed above
> > > > > > working, which allows using modules while doing driver developm=
ent.
> > > > >=20
> > > > > FTR, I'm all for supporting module unloading. The discussion abov=
e was
> > > > > about what is broken exactly, so we can come up with a good solut=
ion.
> > > >=20
> > > > Does that mean that you're ok with the patch, or that something sho=
uld be
> > > > improved?
> > >=20
> > > No, I meant that at the very least the commit log needs to be updated=
 to
> > > reflect what is actually going on, because at least my understanding =
of
> > > it doesn't match what actually happens.
> > >=20
> > > We want a solution to the problem you're facing, but it's not clear to
> > > me what the problem is exactly at this point, so it's hard to review a
> > > solution.
> >=20
> > So I haven't looked at the full thing, but I think the proper fix is to
> > make both detach and unregister cope with being called multiple times. I
> > think devm_ here is a red herring, the underlying issues is that we can
> > unregister/detach from two sides:
> >=20
> > - when the host dsi goes away
> > - when individual dsi devices on a given host go away
> >=20
> > So there needs to be book-keeping and locking to make sure no matter wh=
ich
> > order things disappear, we don't try to unregister/detach a dsi device
> > twice.
>=20
> I think that is what my patch does (for devm_).
>=20
> Some vocabulary first:
>=20
> dsi peripheral device - The device that represents the DSI peripheral. It=
 is
> a bridge or a panel, and (usually) an i2c or platform device.
>=20
> dsi peripheral driver - The driver handling the dsi peripheral device.
>=20
> dsi device - Runtime created device instance that represents the DSI
> peripheral. So in my case we have the i2c bridge device, and a dsi device=
 is
> created for it in the setup code.
>=20
> dsi controller device - A device that has a DSI bus (usually a platform or
> i2c device, I would guess).
>=20
> dsi controller driver - A driver for the dsi controller device. Creates t=
he
> dsi host.
>=20
> dsi host - represents the DSI host side, owned by the dsi controller driv=
er.
>=20
> When a dsi peripheral driver uses devm_mipi_dsi_device_register_full() or
> devm_mipi_dsi_attach(), the dsi device is created and attached to the dsi
> host. When the dsi peripheral device-driver is unbound, devres will call
> unregister and detach are called automatically. This works fine.
>=20
> But when the device-driver for the dsi controller is unbound, the dsi
> controller driver will unregister the dsi host,

I assume that you're talking about:
https://elixir.bootlin.com/linux/v6.10.7/source/drivers/gpu/drm/drm_mipi_ds=
i.c#L357 ?

> and the unregistration will also unregister and detach the dsi device.

And https://elixir.bootlin.com/linux/v6.10.7/source/drivers/gpu/drm/drm_mip=
i_dsi.c#L346 ?

> But the devres is not told about that.

If my assumptions are correct, device_unregister() will definitely clean
up the devres resources on that device:

https://elixir.bootlin.com/linux/v6.10.7/source/drivers/base/core.c#L3886

> So when the dsi peripheral is later unbound, its devres will again
> unregister and detach.

I guess in this case, only the device resource tied to the i2c client
device (so dsi device? in your nomenclature) will run.

Or is it that:
https://elixir.bootlin.com/linux/v6.10.7/source/drivers/gpu/drm/drm_mipi_ds=
i.c#L250

Gets tied to the i2c client device, but the host being removed has
free'd that device already?

> To fix that this patch uses devm_remove_action() to remove the devres
> action when the host side goes away first.
>
> Now, after writing the above, I realized that all this won't help with the
> non-devm versions: the host side has unregistered and detached the dsi
> device, but if the dsi peripheral driver calls mipi_dsi_detach() or
> mipi_dsi_device_unregister(), it will again crash.
>=20
> Handling the attach/detach should be quite easy, and in fact the code
> already handles it, but it uses WARN_ON() there so that has to go. But
> attach/detach will crash anyway if the dsi device has already been freed,
> which happens when the dsi controller driver calls
> mipi_dsi_device_unregister().
>=20
> So... The dsi peripheral driver should keep a reference to the dsi device,
> with get_device()? And then do a put_device() after calling
> mipi_dsi_device_unregister()?
>=20
> But we don't free the dsi device, it has essentially been disabled without
> telling the dsi peripheral driver about it, which might cause problems.

Yeah, and the host pointer would be lingering as well.

> I don't know... This doesn't sound correct to me. Probably my patch is ju=
st
> new wrong on top of old wrong. Or maybe I don't quite grasp how this work=
s.

I think we can fix some of them by storing the "parent" device of
mipi_dsi_device (ie, the i2c client device) that the devm action is
registered against, and removing the action in
mipi_dsi_remove_device_fn.

And marking non-devm variants as deprecated in favor of the devm one.

Maxime

--j2aedqlgxplamaf4
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iJUEABMJAB0WIQTkHFbLp4ejekA/qfgnX84Zoj2+dgUCZtb5eQAKCRAnX84Zoj2+
dtk/AX43duGHox0IptyY38pXOiDowlDUUv3Hx26/tM/uKEck3nzEJ42ggcyWbvsL
8jSI0JMBf2HZCspCGHHozi9NV5BcDzh/3EyNFgar8pQPb+f2xWwdsNMmqLC4vNo4
TzUIjMhsJg==
=RRCt
-----END PGP SIGNATURE-----

--j2aedqlgxplamaf4--
