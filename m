Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 519C47A95D0
	for <lists+dri-devel@lfdr.de>; Thu, 21 Sep 2023 18:48:39 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A638A10E145;
	Thu, 21 Sep 2023 16:48:34 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from ams.source.kernel.org (ams.source.kernel.org [145.40.68.75])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2685910E145
 for <dri-devel@lists.freedesktop.org>; Thu, 21 Sep 2023 16:48:32 +0000 (UTC)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by ams.source.kernel.org (Postfix) with ESMTPS id 0F7C9B8214F;
 Thu, 21 Sep 2023 16:48:30 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4A439C611A5;
 Thu, 21 Sep 2023 16:48:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1695314908;
 bh=ZbMXdzw0c6h6S382Eseu0JWC3SsTXULfTbe1Huhp5BM=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=D2YWMMMQiBTC5mxrk+SG24U9NwIaq8dJU0Qw9abr55Q84220BN00grlowP+mIyJ9X
 Due81h4X6s9m6SpzErNcepsukUfq5XGjMjTYHIysoBms4ojX/ilMzZGW7t6tdLOH9g
 Q10WJPqeiYnEYz3xd0jJyE0qNhj9YJ3urQlGTvaqdFDOWz94iiDE/WRL9by3g/VgOb
 NK+SFUA4pA8acwVjMHwKK2hPAx1dn4GuI//4CZzzUM9MxuP8c3Ypp9lXqViDXp6SzB
 e6BsQW5Rqm4XNeo4k86JIqffTyyrZYc0GomPiLHiieFizLyldl4ngBJFXIoghmw/i5
 5k13QgGKHqYRA==
Date: Thu, 21 Sep 2023 18:48:26 +0200
From: Maxime Ripard <mripard@kernel.org>
To: Hans Verkuil <hverkuil@xs4all.nl>
Subject: Re: [PATCH RFC v2 00/37] drm/connector: Create HDMI Connector
 infrastructure
Message-ID: <cbbovd3t7ssstvk22qmhwl7hgfo74jdwy77harjh3wwyaml3hh@qfsoqtqaw26x>
References: <20230920-kms-hdmi-connector-state-v2-0-17932daddd7d@kernel.org>
 <f6bf0ef2-7a2a-4456-825f-a34ba8c8886f@xs4all.nl>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
 protocol="application/pgp-signature"; boundary="tqheb5u3s3lx5xmw"
Content-Disposition: inline
In-Reply-To: <f6bf0ef2-7a2a-4456-825f-a34ba8c8886f@xs4all.nl>
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
Cc: Thomas Zimmermann <tzimmermann@suse.de>, Emma Anholt <emma@anholt.net>,
 Jonathan Corbet <corbet@lwn.net>, linux-kernel@vger.kernel.org,
 Samuel Holland <samuel@sholland.org>, Sandy Huang <hjc@rock-chips.com>,
 Jernej Skrabec <jernej.skrabec@gmail.com>, linux-doc@vger.kernel.org,
 linux-rockchip@lists.infradead.org, Chen-Yu Tsai <wens@csie.org>,
 dri-devel@lists.freedesktop.org, linux-media@vger.kernel.org,
 linux-sunxi@lists.linux.dev, linux-arm-kernel@lists.infradead.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


--tqheb5u3s3lx5xmw
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi Hans,

On Thu, Sep 21, 2023 at 06:29:29PM +0200, Hans Verkuil wrote:
> On 20/09/2023 16:35, Maxime Ripard wrote:
> > Hi,
> >=20
> > Here's a series that creates a subclass of drm_connector specifically
> > targeted at HDMI controllers.
> >=20
> > The idea behind this series came from a recent discussion on IRC during
> > which we discussed infoframes generation of i915 vs everything else.=20
> >=20
> > Infoframes generation code still requires some decent boilerplate, with
> > each driver doing some variation of it.
> >=20
> > In parallel, while working on vc4, we ended up converting a lot of i915
> > logic (mostly around format / bpc selection, and scrambler setup) to
> > apply on top of a driver that relies only on helpers.
> >=20
> > While currently sitting in the vc4 driver, none of that logic actually
> > relies on any driver or hardware-specific behaviour.
> >=20
> > The only missing piece to make it shareable are a bunch of extra
> > variables stored in a state (current bpc, format, RGB range selection,
> > etc.).
> >=20
> > The initial implementation was relying on some generic subclass of
> > drm_connector to address HDMI connectors, with a bunch of helpers that
> > will take care of all the "HDMI Spec" related code. Scrambler setup is
> > missing at the moment but can easily be plugged in.
> >=20
> > The feedback was that creating a connector subclass like was done for
> > writeback would prevent the adoption of those helpers since it couldn't
> > be used in all situations (like when the connector driver can implement
> > multiple output) and required more churn to cast between the
> > drm_connector and its subclass. The decision was thus to provide a set
> > of helper and to store the required variables in drm_connector and
> > drm_connector_state. This what has been implemented now.
> >=20
> > Hans Verkuil also expressed interest in implementing a mechanism in v4l2
> > to retrieve infoframes from HDMI receiver and implementing an
> > infoframe-decode tool.
>=20
> I'd love to get started on that, but...
>=20
> >=20
> > This series thus leverages the infoframe generation code to expose it
> > through debugfs.
> >=20
> > This entire series is only build-tested at the moment. Let me know what
> > you think,
>=20
> ...trying this series on my RPi4 gives me this during boot:
>=20
> [    2.361239] vc4-drm gpu: bound fe400000.hvs (ops 0xffff800080cac6f8)
> [    2.367834] Unable to handle kernel NULL pointer dereference at virtua=
l address 0000000000000090
> [    2.376748] Mem abort info:
> [    2.379570]   ESR =3D 0x0000000096000044
> [    2.383367]   EC =3D 0x25: DABT (current EL), IL =3D 32 bits
> [    2.388748]   SET =3D 0, FnV =3D 0
> [    2.391835]   EA =3D 0, S1PTW =3D 0
> [    2.395011]   FSC =3D 0x04: level 0 translation fault
> [    2.399951] Data abort info:
> [    2.402864]   ISV =3D 0, ISS =3D 0x00000044, ISS2 =3D 0x00000000
> [    2.408420]   CM =3D 0, WnR =3D 1, TnD =3D 0, TagAccess =3D 0
> [    2.413536]   GCS =3D 0, Overlay =3D 0, DirtyBit =3D 0, Xs =3D 0
> [    2.418916] [0000000000000090] user address but active_mm is swapper
> [    2.425353] Internal error: Oops: 0000000096000044 [#1] PREEMPT SMP
> [    2.431700] Modules linked in:
> [    2.434791] CPU: 2 PID: 55 Comm: kworker/u8:3 Not tainted 6.6.0-rc1-hd=
mi-dbg #245
> [    2.442372] Hardware name: Raspberry Pi 4 Model B Rev 1.4 (DT)
> [    2.448278] Workqueue: events_unbound deferred_probe_work_func
> [    2.454193] pstate: 80000005 (Nzcv daif -PAN -UAO -TCO -DIT -SSBS BTYP=
E=3D--)
> [    2.461245] pc : drm_connector_attach_max_bpc_property+0x48/0x90
> [    2.467332] lr : drm_connector_attach_max_bpc_property+0x3c/0x90
> [    2.473415] sp : ffff800081d038b0
> [    2.476766] x29: ffff800081d038b0 x28: 0000000000000000 x27: ffff00010=
41968c0
> [    2.483999] x26: 0000000000000000 x25: ffff00010339d558 x24: ffff00010=
3399000
> [    2.491231] x23: ffff800080caa3e8 x22: ffff800080e96a20 x21: 000000000=
000000c
> [    2.498463] x20: 000000000000000c x19: ffff00010339d558 x18: fffffffff=
fffffff
> [    2.505694] x17: ffff0001008e7650 x16: ffff800080d55500 x15: fffffffff=
fffffff
> [    2.512926] x14: ffff000105dda209 x13: 0000000000000006 x12: 000000000=
0000001
> [    2.520158] x11: 0101010101010101 x10: ffff00027effe219 x9 : 000000000=
0000001
> [    2.527389] x8 : ffff000105db8ad4 x7 : 00000000c0c0c0c0 x6 : 00000000c=
0c0c0c0
> [    2.534620] x5 : 0000000000000000 x4 : ffff00010339d728 x3 : ffff00010=
339d728
> [    2.541852] x2 : 000000000000000c x1 : 0000000000000000 x0 : 000000000=
0000000
> [    2.549083] Call trace:
> [    2.551554]  drm_connector_attach_max_bpc_property+0x48/0x90
> [    2.557285]  drmm_connector_hdmi_init+0x114/0x14c
> [    2.562048]  vc4_hdmi_bind+0x320/0xa40
> [    2.565842]  component_bind_all+0x114/0x23c
> [    2.570077]  vc4_drm_bind+0x148/0x2c0
> [    2.573784]  try_to_bring_up_aggregate_device+0x168/0x1d4
> [    2.579253]  __component_add+0xa4/0x16c
> [    2.583136]  component_add+0x14/0x20
> [    2.586754]  vc4_hdmi_dev_probe+0x1c/0x28
> [    2.590815]  platform_probe+0x68/0xc4
> [    2.594522]  really_probe+0x148/0x2b0
> [    2.598228]  __driver_probe_device+0x78/0x12c
> [    2.602638]  driver_probe_device+0xd8/0x15c
> [    2.606873]  __device_attach_driver+0xb8/0x134
> [    2.611372]  bus_for_each_drv+0x80/0xdc
> [    2.615254]  __device_attach+0x9c/0x188
> [    2.619136]  device_initial_probe+0x14/0x20
> [    2.623371]  bus_probe_device+0xac/0xb0
> [    2.627253]  deferred_probe_work_func+0x88/0xc0
> [    2.631839]  process_one_work+0x138/0x244
> [    2.635899]  worker_thread+0x320/0x438
> [    2.639692]  kthread+0x10c/0x110
> [    2.642957]  ret_from_fork+0x10/0x20
> [    2.646576] Code: 94005f8d 12001e94 f9427e61 52800000 (39024034)
> [    2.652745] ---[ end trace 0000000000000000 ]---

Well, I guess I'll have to start testing what I'm doing then :)

Maxime

--tqheb5u3s3lx5xmw
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQRcEzekXsqa64kGDp7j7w1vZxhRxQUCZQxz2gAKCRDj7w1vZxhR
xTmAAP9zoK2b+SdtpCJFGCX7o373ATzx/Z9LKZn8NsK54IxYDAEAqMqFpI0Xg1Kq
iSTWfIp3pAvquRgXpVDtgkMv7+qbSAU=
=vGpA
-----END PGP SIGNATURE-----

--tqheb5u3s3lx5xmw--
