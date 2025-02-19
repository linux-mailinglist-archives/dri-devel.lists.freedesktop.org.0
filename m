Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 7A942A3B8FA
	for <lists+dri-devel@lfdr.de>; Wed, 19 Feb 2025 10:29:20 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 18CE410E7A0;
	Wed, 19 Feb 2025 09:29:02 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="Y/OawoYI";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from nyc.source.kernel.org (nyc.source.kernel.org [147.75.193.91])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 068BD10E79B
 for <dri-devel@lists.freedesktop.org>; Wed, 19 Feb 2025 09:29:00 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by nyc.source.kernel.org (Postfix) with ESMTP id 712F0A41FDD;
 Wed, 19 Feb 2025 09:27:14 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 92E56C4CED1;
 Wed, 19 Feb 2025 09:28:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1739957338;
 bh=2YoKx2TA+5+dia75YWBoUPKIALRgLf622XWlx8fTymc=;
 h=Date:From:To:Subject:References:In-Reply-To:From;
 b=Y/OawoYIG1YanwzyXgQHJASucgl7c83lWPCnd57U+zaG5W9+10Md34elMbKPqHBRh
 xCGnUNbKSEZ3RoktoQ6HSIYhRVpOEuCEQR5zMDyh+jMdIePuBkCw/fgGnatLC16vUN
 bXeOaeGZyVDlA7vUHEPBI+lY/dPPQmoqaZRLFmTfCleH3LbKW+0di4T1jZ8xsq3Ol1
 2LZer1jSbb+fuyUYl5XqUr43cG83+dbv8fYxIqc4dZ6strL8sltGzJtgQ8gOfrhAuo
 RqWwZNaeYnS08IX/8PQnw/+KEMphinLjjncNOXFsNoUx4/81BOgSjRNMqaaz1V3KSD
 wYEJf7mhZwk/w==
Date: Wed, 19 Feb 2025 10:28:56 +0100
From: Maxime Ripard <mripard@kernel.org>
To: Rodrigo Siqueira <rodrigosiqueiramelo@gmail.com>, 
 Melissa Wen <melissa.srw@gmail.com>,
 =?utf-8?B?TWHDrXJh?= Canal <mairacanal@riseup.net>, 
 Haneen Mohammed <hamohammed.sa@gmail.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>, 
 Simona Vetter <simona@ffwll.ch>, Simona Vetter <simona.vetter@ffwll.ch>, 
 jose.exposito89@gmail.com, dri-devel@lists.freedesktop.org,
 arthurgrillo@riseup.net, 
 linux-kernel@vger.kernel.org, jeremie.dautheribes@bootlin.com,
 miquel.raynal@bootlin.com, 
 thomas.petazzoni@bootlin.com, seanpaul@google.com, nicolejadeyee@google.com
Subject: Re: [PATCH RFC v2 00/16] drm/vkms: ConfigFS interface
Message-ID: <20250219-versatile-smilodon-of-felicity-cbcc4d@houat>
References: <20241122-google-config-fs-v2-0-4b7e6f183320@bootlin.com>
 <Z0DC8nd1ZFN4A82-@louis-chauvet-laptop>
 <20241126-overjoyed-knowing-cuttlefish-c8d0f6@houat>
 <Z2GqEOiVkdgB3IXy@louis-chauvet-laptop>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha384;
 protocol="application/pgp-signature"; boundary="5dyx5btulynwqir3"
Content-Disposition: inline
In-Reply-To: <Z2GqEOiVkdgB3IXy@louis-chauvet-laptop>
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


--5dyx5btulynwqir3
Content-Type: text/plain; protected-headers=v1; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
Subject: Re: [PATCH RFC v2 00/16] drm/vkms: ConfigFS interface
MIME-Version: 1.0

On Tue, Dec 17, 2024 at 05:42:56PM +0100, Louis Chauvet wrote:
> Hi,
>=20
> > > Hi all,
> > >=20
> > > I am also currently working on MST emulation for VKMS. If someone can=
 read=20
> > > what I already did and at tell me if my implementation seems on the r=
ight=20
> > > track it could be nice.
> > >=20
> > > The current status is not very advanced: I can emulate a mst HUB, but=
 not=20
> > > a screen. I am currently working on properly emulating the HUB by usi=
ng an=20
> > > other hub.
> > >=20
> > > You can find the branch for this work here:
> > > https://gitlab.freedesktop.org/louischauvet/kernel/-/tree/b4/vkms-mst
> >=20
> > I think this is exactly the kind of things where we'll want eBPF I
> > think. There's no way you'll be able to model each possible test
> > scenarios for MST through configfs, even more so with a stable
> > interface.
>=20
> I just spent some time to think about it. I agree that eBPF seems=20
> applicable: we want to allows userspace to emulate any MST device, and we=
=20
> don't want to create huge uAPI + whole emulation in the kernel.
>=20
> As most of the protocol is similar accros device kind, I currently built=
=20
> my code around the struct vkms_mst_sideband_helpers to specify only the=
=20
> changed behavior (this way the "write to registers" "parse command"... is=
=20
> only done in one place). The choice of function is not definitive at all=
=20
> (it was just practical at this moment).
>=20
> With eBPF, I know three different way to attach programs to the kernel:
>  - Using a kprobe/attaching to a function: I can change the behavior of=
=20
>    all the device, there is no way "attach prog1 to hub" and "attach prog=
2=20
>    to screen1", it will be "attach prog1 to the function=20
>    `vkms_mst_emulator_handle_transfer_write`, and all the device will be=
=20
>    affected. This should be very easy to implement (maybe it already=20
>    works without modification?), but very limited / make userspace stuff=
=20
>    very ugly =3D> Not ideal at all
>  - Creating a whole architecture to attach eBPF programs in vkms: VKMS=20
>    manage the list of attached eBPF programs, call them when it needs...=
=20
>    This is probably the "most flexible" option (in the sense "VKMS can do=
=20
>    whatever we need to fit our usecase"). This seems not trivial to=20
>    implement (drm complexity + MST complexity + BPF complexity in the sam=
e=20
>    driver seems a bad idea, espicially because VKMS don't have a lot of=
=20
>    maintainance and I don't feel confident introducing more complexity)
>    =3D> Can work, require some work, but may bring more complexity in VKMS
>  - Using BPF struct_ops: I can "simply" create/complete a struct ops for=
=20
>    diverse mst callbacks (see the proposition bellow). I looked at some=
=20
>    example, this seems to be "easy" to do, and the work in VKMS should be=
=20
>    limited.
>    =3D> Can work, a bit less flexible than the previous solution, but avo=
id=20
>    a lot of complexity
>=20
> I don't know if I will be able to finish the implementation but I imagine=
=20
> something like that may be a nice interface (may be not possible "as is"):
>=20
> // vkms_mst.c struct_ops that can be filled by userspace with custom=20
> // functions
> // Known limitation: maximum 64 functions in this table
> struct vkms_mst_ops {
> 	// Completly overide the transfer function, so the userspace can=20
> 	// do whatever he wants (even emulating a complex MST tree=20
> 	// without using stuff in vkms)
> 	handle_transfer(drm_dp_aux_msg);=20
>=20
> 	// If default transfer function is used, those are the callback=20
> 	// you can use (again, they will come with default=20
> 	// implementation)
> 	clear_payload_id_table(..);
> 	link_address(..);
> 	enum_path_ressources(..);
> 	[...]
>=20
> 	// Used to identify this kind of device, in my example the=20
> 	// userspace could register "LG_screen", "dell dock", "HP screen",=20
> 	// and then configure each mst device with the correct kind
> 	name =3D "<unique name for this device kind>",
>=20
> 	// If you want to use the default "hub" implementation, but only=20
> 	// tweak one specific behavior, you can use this
> 	base =3D "<name of the other structops>"
> }
>=20
>=20
> // Needed to implement eBPF struct_ops, called when userspace registers a
> // struct_ops of type vkms_mst_ops
> void register_struct_ops(new_ops...) {
> 	vkms_registered_ops.append(new_ops).
> }
>=20
> // In vkms_connector.c
> // Callback called by drm core to do transfer on the connector
> void vkms_mst_transfer(aux, msg) {
> 	mst_emulator =3D get_mst_emulator(aux);
>=20
> 	ops =3D vkms_registered_ops.search_for(mst_emulator.name);
> 	ops->handle_transfer(msg);
> }
>=20
> // mst_ebpf.c In the BPF program, userspace side
> void handle_transfer(...) {
> 	[...]
> }
> struct vkms_mst_ops {
> 	handle_transfer =3D handle_transfer;
> 	name =3D "lg-screen";
> 	base =3D "default-screen"
> }

I don't think MST is the right abstraction there. We should have MST
related helper functions available to eBPF programs, but we should load
them at the connector level, ie, implement a full blown connector
atomic_check for example. It's more flexible and will allow to implement
other use-cases people have been interested in (like panels).

Maxime

--5dyx5btulynwqir3
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iJUEABMJAB0WIQTkHFbLp4ejekA/qfgnX84Zoj2+dgUCZ7WkVwAKCRAnX84Zoj2+
doFcAYC9HgMlrj9WYV3EnakLXo2nwaDCK95rzk/ZxsNzM6i3k3SvH8/2NjkDtx4F
ePU9yu8Bfjbnbg4P3dN6CXDb8pdmbCZiiQnOzLAgK6B+uEaKTGgnUFeL+Hdd1lyW
Rj2kUfHx8w==
=jqNE
-----END PGP SIGNATURE-----

--5dyx5btulynwqir3--
