Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C48F5B16F2C
	for <lists+dri-devel@lfdr.de>; Thu, 31 Jul 2025 12:05:34 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6312410E762;
	Thu, 31 Jul 2025 10:05:32 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="ophpj/ua";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from tor.source.kernel.org (tor.source.kernel.org [172.105.4.254])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 125C910E75C
 for <dri-devel@lists.freedesktop.org>; Thu, 31 Jul 2025 10:05:31 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by tor.source.kernel.org (Postfix) with ESMTP id 26157601F0;
 Thu, 31 Jul 2025 10:05:30 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 577B7C4CEF6;
 Thu, 31 Jul 2025 10:05:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1753956329;
 bh=TwWzZNXS3126/f8PdQlm7YDzO/1WPbf3eY1o+4XtMSA=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=ophpj/ua3vBwmMvkxqzGxaaAycuvhEfFRoAmkaf2p3goWqTgST0fMiEGx652ayJMu
 iEzbDIvAQZQlMjVr395rGQOm/FalYs3dvwEa0p5BQ2MZ7of+19Wom+2K8YrH780PnF
 8p0WC+pQ3RqmBTLpW3xRqpgAQ4kV/vHgGtH2EqNIfwfQ7RJvAs2OkaqYtXEvnJvhTU
 IlCHJX3UHZ0FEWhuNdY8vlQmA63sfgYPJ8ZjUSZDyaXJLfYugIPshUAm+O9tXc0Ti8
 l9op4Ft+HRtOwMZV5kgRbg8nXscOoo+6RlszQIiVJhfZ7KAgO7WAoEP7v0zr9zg1mR
 8gKDOh09q0axA==
Date: Thu, 31 Jul 2025 12:05:27 +0200
From: Maxime Ripard <mripard@kernel.org>
To: Luca Ceresoli <luca.ceresoli@bootlin.com>
Cc: Inki Dae <inki.dae@samsung.com>, Jagan Teki <jagan@amarulasolutions.com>,
 Marek Szyprowski <m.szyprowski@samsung.com>, 
 Andrzej Hajda <andrzej.hajda@intel.com>,
 Neil Armstrong <neil.armstrong@linaro.org>, 
 Robert Foss <rfoss@kernel.org>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>, 
 Jonas Karlman <jonas@kwiboo.se>, Jernej Skrabec <jernej.skrabec@gmail.com>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Thomas Zimmermann <tzimmermann@suse.de>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
 Hui Pu <Hui.Pu@gehealthcare.com>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>, 
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] samsung-dsim: move drm_bridge_add() call to probe
Message-ID: <20250731-tactful-jellyfish-of-perspective-cb0324@houat>
References: <20250725-drm-bridge-samsung-dsim-add-in-probe-v1-1-b23d29c23fbd@bootlin.com>
 <20250728-diligent-brainy-hyena-109dde@houat>
 <20250728194430.082f9952@booty>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha384;
 protocol="application/pgp-signature"; boundary="ik26d6ysspebbtcv"
Content-Disposition: inline
In-Reply-To: <20250728194430.082f9952@booty>
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


--ik26d6ysspebbtcv
Content-Type: text/plain; protected-headers=v1; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
Subject: Re: [PATCH] samsung-dsim: move drm_bridge_add() call to probe
MIME-Version: 1.0

On Mon, Jul 28, 2025 at 07:44:30PM +0200, Luca Ceresoli wrote:
> Hi Maxime,
>=20
> thanks for the quick feedback.
>=20
> On Mon, 28 Jul 2025 10:10:38 +0200
> Maxime Ripard <mripard@kernel.org> wrote:
>=20
> > Hi,
> >=20
> > On Fri, Jul 25, 2025 at 05:28:03PM +0200, Luca Ceresoli wrote:
> > > This bridge driver calls drm_bridge_add() in the DSI host .attach cal=
lback
> > > instead of in the probe function. This looks strange, even though
> > > apparently not a problem for currently supported use cases.
> > >=20
> > > However it is a problem for supporting hotplug of DRM bridges, which =
is in
> > > the works [0][1][2]. The problematic case is when this DSI host is al=
ways
> > > present while its DSI device is hot-pluggable. In such case with the
> > > current code the DRM card will not be populated until after the DSI d=
evice
> > > attaches to the host, and which could happen a very long time after
> > > booting, or even not happen at all.
> > >=20
> > > Supporting hotplug in the latest public draft is based on an ugly
> > > workaround in the hotplug-bridge driver code. This is visible in the
> > > hotplug_bridge_dsi_attach implementation and documentation in [3] (but
> > > keeping in mind that workaround is complicated as it is also circumve=
nting
> > > another problem: updating the DSI host format when the DSI device gets
> > > connected).
> > >=20
> > > As a preliminary step to supporting hotplug in a proper way, and also=
 make
> > > this driver cleaner, move drm_bridge_add() at probe time, so that the
> > > bridge is available during boot.
> > >=20
> > > However simply moving drm_bridge_add() prevents populating the whole =
card
> > > when the hot-pluggable addon is not present at boot, for another
> > > reason. The reason is:
> > >=20
> > >  * now the encoder driver finds this bridge instead of getting
> > >    -EPROBE_DEFER as before
> > >  * but it cannot attach it because the bridge attach function in turn=
 tries
> > >    to attach to the following bridge, which has not yet been hot-plug=
ged
> > >=20
> > > This needs to be fixed in the bridge attach function by simply return=
ing
> > > -EPROBE_DEFER ifs the following bridge (i.e. the DSI device) is not y=
et
> > > present.
> > >=20
> > > [0] https://lpc.events/event/18/contributions/1750/
> > > [1] https://lore.kernel.org/lkml/20240924174254.711c7138@booty/
> > > [2] https://lore.kernel.org/lkml/20250723-drm-bridge-alloc-getput-for=
_each_bridge-v1-0-be8f4ae006e9@bootlin.com/
> > > [3] https://lore.kernel.org/lkml/20240917-hotplug-drm-bridge-v4-4-bc4=
dfee61be6@bootlin.com/
> > >=20
> > > Signed-off-by: Luca Ceresoli <luca.ceresoli@bootlin.com> =20
> >=20
> > There's many things lacking from that commit log to evaluate whether
> > it's a good solution or not:
>=20
> Before answering your questions: I realized my patch is incomplete, it
> should also move drm_bridge_remove() to samsung_dsim_remove() for
> symmetry. This is a trivial change and it's done and tested locally:
>=20
> @@ -1825,8 +1825,6 @@ static int samsung_dsim_host_detach(struct mipi_dsi=
_host *host,
> =20
>  	samsung_dsim_unregister_te_irq(dsi);
> =20
> -	drm_bridge_remove(&dsi->bridge);
> -
>  	return 0;
>  }
> =20
> @@ -2069,6 +2067,8 @@ void samsung_dsim_remove(struct platform_device *pd=
ev)
>  {
>  	struct samsung_dsim *dsi =3D platform_get_drvdata(pdev);
> =20
> +	drm_bridge_remove(&dsi->bridge);
> +
>  	pm_runtime_disable(&pdev->dev);
> =20
>  	if (dsi->plat_data->host_ops && dsi->plat_data->host_ops->unregister_ho=
st)
>=20
>=20
> Let me reorder your questions so the replies follow a step-by-step
> path.
>=20
> > - What is the next bridge in your case? Did you try with a device
> >   controlled through DCS, or with a bridge connected through I2C/SPI
> >   that would typically have a lifetime disconnected from the DSI host.
>=20
> The pipeline is the following:
>=20
> |--------------------- fixed components --------------------|     |------=
-- hot-pluggable addon --------|=20
> |--------------- i.MX8MP ------------|                      =20
>=20
> +----------------+    +------------+     +------------------+     +------=
-------------+      +----------+
> |                |    |samsung-dsim|     |hotplug DSI bridge|     |   TI =
SN65DSI84    |      |LVDS panel|
> |fsl,imx8mp-lcdif| A  |            |  B  |                  |  C  |      =
             |  D   |          |
> |                +--->|    DSI host+---->|device        host+---->|DSI ho=
st   LVDS out+----->|LVDS in   |
> +----------------+    +------------+ DSI +------------------+ DSI +------=
-------------+ LVDS +----------+
>                                                                          =
  ^
>                                                                       I2C=
 -'
>
> This is a device tree based system (i.MX8MP, ARM64).
>=20
> This is the only hot-pluggable hardware I have access to and there is no
> DCS.
>=20
> In the hardware the next bridge after the samsung-dsim is the sn65dsi84
> (ti-sn65dsi83.c driver), and there the hotplug connector is between
> them.
>=20
> In the software implementation the next bridge is currently the
> hotplug-bridge, which "represents" the hotplug connector (!=3D DRM
> connector). As discussed in the past, the hotplug-bridge may be removed
> in future implementations but at the current stage of my work on DRM it
> is still needed.
>=20
> The hotplug-bridge is not (yet?) in mainline, and so aren't some other
> bits. However they haven't changed much since my old v4 series [0].

I'd like to take the hotplug DSI bridge out of the equation for now.
Does this issue happen without it?

> Also, I expect this patch to be mostly valid regardless of whether the
> hotplug-bridge will or not be in the final design.
>=20
> > - What is the typical sequence of probe / attach on your board?
>=20
> The probe/attach sequence before this patch is the following. This is
> in the case the hotpluggable addon is not connected during boot, which
> is the most problematic one.
>=20
>  1) The lcdif starts probing, but probe is deferred until (6.)
>     because the samsung-dsim has not probed yet.
>     Code path: lcdif_probe() -> lcdif_load() -> lcdif_attach_bridge() ->
>                devm_drm_of_get_bridge() -> -EPROBE_DEFER
>  2) samsung-dsim probes, but does not drm_bridge_add() itself, so the
>     lcdif driver cannot find it
>  3) lcdif tries to probe again
>     A) it does not find the next bridge and returns -EPROBE_DEFER
>  4) hotplug-bridge probes, including:
>     A) drm_bridge_add()
>     B) mipi_dsi_attach() to register as a "fake" DSI device to
>        the samsung-dsim DSI host
>        - this registration is fake, meaning it has a fake format;
>          it's needed or the samsung-dsim driver would not
>          drm_bridge_add() itself and the lcdif would not populate the
>          DRM card
>     C) look for the next bridge but in the typical case the TI bridge
>        has not probed yet; this is not fatal by design of the
>        hotplug-bridge (that's its goal indeed)
>  5) reacting to 4.B, in the samsung_dsim_host_attach() func does, among
>     other things, drm_bridge_add() itself
>  6) lcdif tries to probe again
>     A) this triggers a chain of drm_bridge_attach:
>        * lcdif calls drm_bridge_attach() on the samsung-dsim
>        * samsung-dsim calls drm_bridge_attach() on the hotplug-bridge
>     B) the DRM card is populated and accessible to userspace
>=20
> When the addon is connected (can be hours later or even never):
>=20
>  7) the TI SN65DSI84 driver probes, including:
>     * drm_bridge_add()
>        - thanks to notifiers ([0] patch 2) the hotplug bridge is
>          informed and takes note of its next_bridge
>     * does mipi_dsi_attach() on its host (hotplug bridge)
>  8) the hotplug-bridge DSI host side reacts to the mipi_dsi_attach() from
>     the TI DSI device by calling:
>     * mipi_dsi_detach() on the samsung-dsim to remove the
>       fake registration
>     * mipi_dsi_attach() with the correct format from the sn65dsi84
>=20
> Note: after 5) the global bridge_list has a samsung-dsim bridge, while
> after an addon insertion/removal there is no samsung-dsim in there
> anymore. This is due to the fake registration, which happens only the
> first time: at every addon removal samsung_dsim_host_detach() will
> drm_bridge_remove() itself.
>=20
> With the patch applied the sequence would become:
>=20
>  1) The lcdif starts probing multiple times, but probe is deferred
>     until (5.) because the samsung-dsim has not probed yet.
>     (so far no changes)
>  2) samsung-dsim probes, _and_ does drm_bridge_add() itself
>  3) lcdif tries to probe again
>     A) this triggers a lcdif probe and a chain of drm_bridge_attach:
>        * lcdif calls drm_bridge_attach() on the samsung-dsim
>        * samsung-dsim returns -EPROBE_DEFER because there is no next
>          bridge yet (with another error the lcdif would fail without
>          further deferral)
>  4) the hotplug-bridge probes
>  5) lcdif tries to probe again
>     A) this triggers a lcdif probe and a chain of drm_bridge_attach:
>        * lcdif calls drm_bridge_attach() on the samsung-dsim
>        * samsung-dsim calls drm_bridge_attach() on the hotplug-bridge
>     B) the DRM card is populated and accessible to userspace
>=20
> When the addon is connected (can be hours later or even never):
>=20
>  6) the TI SN65DSI84 driver probes, including:
>     A) drm_bridge_add()
>        - thanks to notifiers ([0] patch 2) the hotplug bridge is
>          informed and takes note of its next_bridge
>     B) does mipi_dsi_attach() on its host (hotplug bridge)
>     (so far no changes)
>  7) the hotplug-bridge DSI host side reacts to the mipi_dsi_attach() from
>     the TI DSI device without detaching/attaching from/to the
>     samsung-dsim, but only by notifying to samsung-dsim the new format;
>     for this my current draft adds a .format_changed op to struct
>     mipi_dsi_host_ops, so the hotplug bridge can inform about the new
>     format, but in the end we might as well get rid of the hotplug
>     bridge entirely

Thanks for the writeup. I'd still like to know what it looks like
without the hotplug-bridge in there.

> > - Why moving the call to drm_bridge_attach helps?
>=20
> You mean _from_ drm_bridge_attach, I guess.
>=20
> Some drawbacks of current code are because at every DSI attach/detach,
> the samsung-dsim does drm_bridge_add/remove() itself:
>=20
>  * To me this looks like a bad design, the samsung-dsim is always
>    present and not hotpluggable, so why should it add/remove itself?
>=20
>  * I have a debugfs patch to show in $BUDUGFS/dri/bridges_removed all
>    the removes bridges: bridges after drm_bridge_remove() but not yet
>    freed because refcount still > 0. But it causes crashes due to the
>    samsung-dsim going backwards from "removed" to "added", and further
>    hacks are needed to avoid this crash.
>=20
>  * At LPC 2024 we had discussed the idea of a ".gone" flag in struct
>    drm_bridge, and drm_bridge_enter/exit() macros similar to
>    drm_dev_enter/exit() to avoid races between bridge removal and bridge
>    usage. I drafted something, but the samsung-dsim would be "ungone"
>    when it does a drm_bridge_remove/add() sequence, so more flags and
>    hacks would be needed for the .gone flag to work correctly.

Gone would be based on the dsim platform_device being there or not, I'm
not sure how it relates to whether a child DSI device has been attached
or not?

> Additionally this patch removes the need for a fake registration to get
> a DRM card up. The fake registration has many drawbacks:
>=20
>  * It's a horrible hack to start with, as guaranteed by its author O:-)
>    (see the code in [0] patch 4 -> hotplug_bridge_dsi_attach).
>=20
>  * This hack is better not done by all bridge drivers, to it must stay
>    in the hotplug-bridge, preventing the idea of its removal.
>=20
>  * The samsung-dsim appears present in the global bridge_list after
>    initial probe, but absent after a hotplug+hotunplug sequence (as
>    described in the Note above)
>=20
> > - If you think it's a pattern that is generic enough, we must document
> >   it. If you don't, we must find something else.
>=20
> Intuitively it looks to me that a bridge driver should drm_bridge_add()
> itself wen probing: I probe, ergo I exist, ergo I add myself to the
> global bridge_list.
>=20
> But that's not too relevant, code is not necessarily intuitive, I know. :)

I largely agree with your intuition, but then there's also many moving
parts: The two stage bridge probing (between probe and attach),
sometimes the component framework adds an extra step, then you have
devices that probes right after the DSI host (DSI devices), some that
probes with a sequence completely uncorrelated (I2C devices), etc.

It's hard to test, reason about, and we do have to have some workaround
sometimes.

> However if we want to support a DSI device that is pluggable while the
> DSI host is always present, we need to support multiple
> mipi_dsi_host_attach/detach cycles for the same DSI host instance. So
> we have two options:
>=20
>  1. the DSI host bridge does drm_bridge_add/remove() in probe as this
>     patch proposes, so it is "stable" regardless of how many
>     dsi_attach/detach cycles it gets:
>=20
>     xyz_probe
>     drm_bridge_add
>     N x {
>        dsi_attach
>        dsi_remove
>     }
>     drm_bridge_remove
>     xyz_remove
>=20
>  2. we support devices that can be drm_device_add/remove() themselves
>     multiple times during the lifetime of a single instance:
>=20
>     xyz_probe
>     N x {
>        drm_bridge_add
>        dsi_attach
>        dsi_remove
>        drm_bridge_remove
>     } x N
>     xyz_remove
>=20
> As mentioned above, supporting case 2 would introduce problems in many
> areas, including the ".gone" flag which seems fundamental. I'm
> obviously biased in favor of option 1, at the moment, but open to
> discussion.

I really think we should stop discussing future work. It might be clear
to you, but it really isn't for everybody else because that works is
mostly off list and hasn't been reviewed right now.

So can you please frame the problem on what happens upstream, right now.

> So it boils down to what is the meaning of "add" and "remove". I'm
> giving up on my intuitive interpretation and waiting for your point of
> view here. :)
>=20
> > - Why returning EPROBE_DEFER from the attach callback helps? Also, this
> >   is an undocumented behaviour, so if it does, we must document that
> >   it's acceptable.
>=20
> (Note: this question is surely relevant but I think it is a side topic,
> not affecting the reasoning about whether drm_bridge_add() should be
> called in probe or in dsi_host.attach)

I mean, it's not a side topic, it's literally in the patch you posted.
If anything, that whole discussion above is the side topic ;)

Maxime

--ik26d6ysspebbtcv
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iJUEABMJAB0WIQTkHFbLp4ejekA/qfgnX84Zoj2+dgUCaIs/3gAKCRAnX84Zoj2+
dpQPAX9vaysF0qcrdrbL1tzA1ICC3UFxjAbOebsKrvO9JbaVT0/pfDfB19AtTANm
NZXF4LoBfRd3hqv+COzuNAi8Tj90SD2MkNtyF7nPNPmBMEnMkUMBLAOF+2sbMLmB
brI4yS7wQg==
=oc4F
-----END PGP SIGNATURE-----

--ik26d6ysspebbtcv--
