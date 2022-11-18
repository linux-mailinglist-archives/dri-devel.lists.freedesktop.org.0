Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id AAF5F62FA04
	for <lists+dri-devel@lfdr.de>; Fri, 18 Nov 2022 17:16:19 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C45A910E71A;
	Fri, 18 Nov 2022 16:16:10 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from wout2-smtp.messagingengine.com (wout2-smtp.messagingengine.com
 [64.147.123.25])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C4C5310E71A
 for <dri-devel@lists.freedesktop.org>; Fri, 18 Nov 2022 16:16:05 +0000 (UTC)
Received: from compute3.internal (compute3.nyi.internal [10.202.2.43])
 by mailout.west.internal (Postfix) with ESMTP id 45DF632003F4;
 Fri, 18 Nov 2022 11:16:02 -0500 (EST)
Received: from mailfrontend2 ([10.202.2.163])
 by compute3.internal (MEProxy); Fri, 18 Nov 2022 11:16:03 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cerno.tech; h=cc
 :cc:content-type:date:date:from:from:in-reply-to:in-reply-to
 :message-id:mime-version:references:reply-to:sender:subject
 :subject:to:to; s=fm2; t=1668788161; x=1668874561; bh=2MRLkOCbkE
 DRX6CVJEr1WS1Or0qtrbdWjr/+FfwAdfY=; b=YMzFndB7zrBvT2IC3ECT7lKQwP
 /w0BOoFtW+9KkFSk80XZtuq+0Jy5vBZO6O1+FCtKWS5Qs98G0Yr0hOxvcdNYHERD
 Qz0lyYk7bjPCYmgxK17GQ4sVrOlWWGfFPaEfbw4sFiNsCnxg6jWbw+DmuMGNMkk3
 vFK/xIVaFuUXCqoO9XeE8Gz3v83sQZkNfrR2l5ryGdbqRQrfoknY8XZ4K4DI6dux
 NcQAZz0mvUl95M8hTi0uALSd0IO3sB2z/2agMfTZnK1uZjeycc9rw1dgynQwQ65m
 LiSKT/yixbGNQX4N2uI4qoXf65p0Zw25u4D6iBZjQy6RetQ1aH+QozMra+6A==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:cc:content-type:date:date:feedback-id
 :feedback-id:from:from:in-reply-to:in-reply-to:message-id
 :mime-version:references:reply-to:sender:subject:subject:to:to
 :x-me-proxy:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=
 fm1; t=1668788161; x=1668874561; bh=2MRLkOCbkEDRX6CVJEr1WS1Or0qt
 rbdWjr/+FfwAdfY=; b=GQ8XSoXG43kEfb0mzBbyhydSwd5vp252VFBlah8DkQuS
 w/UFRrHxJs7QR0a/pPYdf28I9jZI+tdF8293C7v1P4g8utuPkneoR2W2GS8BWAxx
 ZwwLe5PixP3zN18x7sSyyXYZNb+XY01zMjtjeIhBMO/dgWGRFKu1hwv9vQDLxvmi
 BB5NcpX2Eyz31fFSub55dofOs/wT2kOpgfhd/ILXuJeQnLrEpJDDm/XIPA5S4kqH
 4m7wF/LERbS94rBkV5rxyZzhlamMN6xm2lt/hJ8SmVSOTW8Vt1ivTLSDPIezkBKO
 0gY0qbYXPvH6AJs2CakzJR3cOLaGOYijOS/enGzxBA==
X-ME-Sender: <xms:wa93Y6z_5mXt0s9cAQ-tzEX91YKzfD3M0xPxV-a2vwo5KaF6JOrBUA>
 <xme:wa93Y2SAlQ-Pz9rTOANk-ie6bIQDcb2tFG4UsEZZbDNyUcSB26kNDfHwF0wZq38Zs
 YM_tIACsBH3F5jIvrs>
X-ME-Received: <xmr:wa93Y8Xakf-V0VzeVB4-g6aTDss60rLLsHLjvN45tPYZAFi67wIEeIzLhxyHXHt56FW9PKqPQ3ak3SIptGVU0A3DZTrwri7rh_ICXqKdEcbyzA>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvgedrhedtgdekjecutefuodetggdotefrodftvf
 curfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfghnecu
 uegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenuc
 fjughrpeffhffvvefukfhfgggtuggjsehgtderredttddvnecuhfhrohhmpeforgigihhm
 vgcutfhiphgrrhguuceomhgrgihimhgvsegtvghrnhhordhtvggthheqnecuggftrfgrth
 htvghrnhepgfeuuedtfefgveevheejfeeghedvjeejfeehkeffudetuedtgfeiieeiffeu
 tdffnecuffhomhgrihhnpegsohhothhlihhnrdgtohhmnecuvehluhhsthgvrhfuihiivg
 eptdenucfrrghrrghmpehmrghilhhfrhhomhepmhgrgihimhgvsegtvghrnhhordhtvggt
 hh
X-ME-Proxy: <xmx:wa93YwiQJqSZ8Yb4OvXKHoMyxRn_LFiIlqRQ-NclROoNyNNSXbnWxQ>
 <xmx:wa93Y8BHdn0UAqJojqKE8A6gRQboxo5p9GD4TBRz7XrhzsW1xXboNA>
 <xmx:wa93YxKpudX4mw5wWXF7ADxz591TwWUYQX363gG-ZYnsIBLTOz3Obg>
 <xmx:wa93Y2zN8QOw1lBrH-2Ilez0eeK-fYsYgzL0Uv5iyhsByC_EHulbvQ>
Feedback-ID: i8771445c:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Fri,
 18 Nov 2022 11:16:00 -0500 (EST)
Date: Fri, 18 Nov 2022 17:15:58 +0100
From: Maxime Ripard <maxime@cerno.tech>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 "Rafael J. Wysocki" <rafael@kernel.org>
Subject: Re: DRM-managed resources / devm_drm_dev_alloc leaking resources
Message-ID: <20221118161558.ym7sif4tkr5srk2b@houat>
References: <20221117165311.vovrc7usy4efiytl@houat>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
 protocol="application/pgp-signature"; boundary="sn3tq4edyve2huny"
Content-Disposition: inline
In-Reply-To: <20221117165311.vovrc7usy4efiytl@houat>
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
Cc: David Airlie <airlied@linux.ie>,
 Javier Martinez Canillas <javierm@redhat.com>, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, Thomas Zimmermann <tzimmermann@suse.de>,
 Daniel Vetter <daniel.vetter@intel.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


--sn3tq4edyve2huny
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi,

Javier and I looked into it some more today, and I think we have a
better idea of what is going on.

On Thu, Nov 17, 2022 at 05:53:11PM +0100, Maxime Ripard wrote:
> After trying to get more kunit tests for KMS, I found out that the
> recent kunit helpers we merged to create a DRM device [1] are broken and
> won't free their device-managed and DRM-managed resources.
>=20
> With some help from Thomas, we've dug into this and it turns out that if
> we allocate a device with root_device_register, initialise our drm
> device with devm_drm_dev_alloc(), register it using drm_dev_register(),
> unregister it using drm_dev_unregister/drm_dev_unplug and then remove
> the parent device, neither the device managed nor the DRM managed
> actions are run.
>=20
> root_device_register initializes the device by eventually calling
> device_initialize() which sets the initial reference count of the root
> device to 1 [2]. devm_drm_dev_alloc() then comes in, drm_dev_init() will
> increase the root device refcount [3] and initialize our DRM device to 1
> [4]. drm_dev_register(), through drm_minor_register() and device_add(),
> will increase the root device refcount [5].
>=20
> When unrolling things, drm_dev_unregister(), through
> drm_minor_unregister() and device_del(), will give up its reference [6].
> root_device_unregister(), through device_unregister(), will also give up
> its own [7].
>=20
> So we end up with this for the reference counts:
>=20
> +------------------------+-------------+------------+
> |         funcs          | root device | DRM device |
> +------------------------+-------------+------------+
> | root_device_register   |           1 | N/A        |
> | devm_drm_dev_alloc     |           2 | 1          |
> | drm_dev_register       |           3 | 1          |
> | drm_dev_unregister     |           2 | 1          |
> | root_device_unregister |           1 | 1          |
> +------------------------+-------------+------------+
>=20
> If we go back to the list of reference taken, the root device reference
> and the initial drm_device reference, both taken by devm_drm_dev_alloc()
> through drm_dev_init(), haven't been put back.
>=20
> If we look at the drm_dev_init code(), we can see that it sets up a
> DRM-managed action [8] that will put back the device reference [9]. The
> DRM-managed code is executed by the drm_managed_cleanup() function, that
> is executed as part of a release hook [10] executed once we give up the
> final reference to the DRM device [11].
>=20
> If we go back a little, the final reference to the DRM device is
> actually the initial one setup by devm_drm_dev_alloc(). This function
> has superseded drm_dev_alloc(), with the documentation that we do need a
> final drm_dev_put() to put back our final reference [12].
>=20
> devm_drm_dev_alloc() is a more convenient variant that has been
> introduced explicitly to not require that drm_dev_put(), and states it
> as such in the documentation [13]. It does so by adding a device-managed
> action that will call drm_dev_put() [14].
>=20
> Device-managed actions are ran as part devres_release_all() that is
> called by device_release() [15], itself being run when the last
> reference on the device is put back [16][17][18].
>=20
> So if we sum things up, the DRM device will only give its last root
> device reference when the last DRM device reference will be put back,
> and the last DRM device reference will be put back when the last device
> reference will be put back, which sounds very circular to me, with both
> ending up in a deadlock scenario.
>=20
> I've added two kunit tests that demonstrate the issue: we register a
> device, allocate and register a DRM device, register a DRM-managed
> action, remove the DRM device and the parent device, and wait for the
> action to execute. drm_register_unregister_with_devm_test() uses the
> broken(?) devm_drm_dev_alloc and is failing.
> drm_register_unregister_test uses the deprecated drm_dev_alloc() that
> requires an explicit call to drm_dev_put() which works fine.
>=20
> It's also worth noting that Thomas tested with simpledrm and it seems to
> work fine.

Indeed, the transition from simpledrm to a full-blown DRM driver handles
this properly. It's using a platform_device_unregister() [1] and
eventually device_del() [2][3]. That part is handled just like
root_device_unregister() [4][5]. Basically, both will call device_del(),
and then device_put(), so device_del() is called while holding a
reference.

As we've seen before, at this point the DRM driver still holds a
reference to the device as well.

device_del() will call bus_remove_device() [6], which will be skipped
for the root device since it doesn't have a bus [7].

It will then call device_release_driver() [8], which is basically forwarded
to __device_release_driver() [9][10], that will call device_unbind_cleanup(=
) [11].

device_unbind_cleanup() calls devres_release_all() directly [12], that
runs all the device-managed actions [13]. And it does so WHILE THERE'S
STILL A REFCOUNT OF 2!

I would expect the call to devres_release_all to happen only in
device_release, once all the device reference have been put back. Not 4
functions in as a side effect, and while there's still some active
references.

> Using a platform_device instead of the root_device doesn't
> change anything to the outcome in my tests, so there might be a more
> subtle behaviour involved.

This one has the same symptom but a different cause. I was just
registering a platform_device but it wasn't bound to any driver. While
it's valid to do so according to that comment [13], it doesn't have any
driver so the check for the driver in device_release_driver() [8], and
never hits device_unbind_cleanup().

Thanks again to Thomas and Javier for their help
Maxime

1: https://elixir.bootlin.com/linux/latest/source/drivers/video/aperture.c#=
L199
2: https://elixir.bootlin.com/linux/latest/source/drivers/base/platform.c#L=
793
3: https://elixir.bootlin.com/linux/latest/source/drivers/base/platform.c#L=
751
4: https://elixir.bootlin.com/linux/latest/source/drivers/base/core.c#L4153
5: https://elixir.bootlin.com/linux/latest/source/drivers/base/core.c#L3733
6: https://elixir.bootlin.com/linux/latest/source/drivers/base/core.c#L3704
7: https://elixir.bootlin.com/linux/latest/source/drivers/base/bus.c#L511
8: https://elixir.bootlin.com/linux/latest/source/drivers/base/bus.c#L529
9: https://elixir.bootlin.com/linux/latest/source/drivers/base/dd.c#L1298
10: https://elixir.bootlin.com/linux/latest/source/drivers/base/dd.c#L1275
11: https://elixir.bootlin.com/linux/latest/source/drivers/base/dd.c#L1255
12: https://elixir.bootlin.com/linux/latest/source/drivers/base/dd.c#L530
13: https://elixir.bootlin.com/linux/latest/source/drivers/base/core.c#L2312

--sn3tq4edyve2huny
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQRcEzekXsqa64kGDp7j7w1vZxhRxQUCY3evvgAKCRDj7w1vZxhR
xZhwAQC5Rhgvvw332lWs45Crsps/+M9lQJf7Dpo3aqUQVlcZ3wD/XR01SNFEMIcI
LK/nxSF19p2OTFpBjr5mRlVMutGgoAA=
=IYM0
-----END PGP SIGNATURE-----

--sn3tq4edyve2huny--
