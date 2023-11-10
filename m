Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 022D17E7CE2
	for <lists+dri-devel@lfdr.de>; Fri, 10 Nov 2023 15:14:07 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4810810E05A;
	Fri, 10 Nov 2023 14:14:04 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0FA0910E05A
 for <dri-devel@lists.freedesktop.org>; Fri, 10 Nov 2023 14:14:02 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by dfw.source.kernel.org (Postfix) with ESMTP id 3E7C7619F8;
 Fri, 10 Nov 2023 14:14:01 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 92708C433C7;
 Fri, 10 Nov 2023 14:14:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1699625640;
 bh=rmDJqVYvwo+L5MowSKHuVgkdTSw0B5dUajxsY6eH/EQ=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=oiH2RbD65+5eYhjsHtLgqGW0SY4U/2f59xcLo7GtOl3N+J3HrMIqL6jNm2fy65MPR
 OKytmAlRcdbM2FgXAFWm/6BnOJGIHP9nvSppzjjOYRzfniQfjrhPCgOgRKLCs7RFq1
 ek8iAYC70LVnGO/Gs8vOqOp+tL4O+VtQhgWVMM6aspKyXuaiQYcLlpGy4tsZ8nnv3O
 1zNzEBKDyPVtspmD7FyJesMPv6cZgSWxsPDmWEGJwFoQNBuRpTOamD8BEgHK9hfhLA
 QA4iPmRWY+1/iurTV33xGaadYSgl2ijYxGWH5CDrhmZeIlHEeAeCSWGvgyB2+M7Ur5
 ikyI+X2RYOlYw==
Date: Fri, 10 Nov 2023 15:13:57 +0100
From: Maxime Ripard <mripard@kernel.org>
To: Simon Ser <contact@emersion.fr>
Subject: Re: [RFC PATCH 2/2] vc4: introduce DMA-BUF heap
Message-ID: <l72427ml6ljlbbf732pilstfavqznrtmdvz3pkn7vc5vgqxm6j@2kyg6bgjygce>
References: <20231109074545.148149-1-contact@emersion.fr>
 <20231109074545.148149-2-contact@emersion.fr>
 <tmsf75w3iskpvx2dxgzpk4vn7g6jpfdgdq2qv3nl5i4ocawzz4@ihcwmnq5gval>
 <bEg7cd-LFy1CzhAIao2Dt0cNFUFEb6D1ZhZN1Rec3w151EjXWpaXsOAs2MmvEPMxQjVhuE0k3qvuryxN6hJp5tJCU1b7EqSKHdTXte-UvmQ=@emersion.fr>
 <hqeyywu2pnava4hdgmjnsktsdkblia4mllrtffl5skocqm7kkx@eqtiltsn44ts>
 <oTp8iN2ODz4pEo4WpvMQ5HWhBfoPYzA4aGKhe04iKaGNo7dn1G3Uw04Nsw6ZKlflcboqsp_gPb-V6mqGCLwT-V68O6JzBYbua56bLq0H51s=@emersion.fr>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
 protocol="application/pgp-signature"; boundary="7hxubvppenu4uelq"
Content-Disposition: inline
In-Reply-To: <oTp8iN2ODz4pEo4WpvMQ5HWhBfoPYzA4aGKhe04iKaGNo7dn1G3Uw04Nsw6ZKlflcboqsp_gPb-V6mqGCLwT-V68O6JzBYbua56bLq0H51s=@emersion.fr>
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
Cc: Thomas Zimmermann <tzimmermann@suse.de>,
 =?utf-8?B?TWHDrXJh?= Canal <mcanal@igalia.com>,
 Iago Toral Quiroga <itoral@igalia.com>, dri-devel@lists.freedesktop.org,
 Erico Nunes <nunes.erico@gmail.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


--7hxubvppenu4uelq
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, Nov 10, 2023 at 11:08:06AM +0000, Simon Ser wrote:
> > On Thu, Nov 09, 2023 at 03:31:44PM +0000, Simon Ser wrote:
> > > > > - What would be a good name for the heap? "vc4" is maybe a bit na=
ive and
> > > > > not precise enough. Something with "cma"? Do we need to plan a na=
ming
> > > > > scheme to accomodate for multiple vc4 devices?
> > > >=20
> > > > That's a general issue though that happens with pretty much all dev=
ices
> > > > with a separate node for modesetting and rendering, so I don't think
> > > > addressing it only for vc4 make sense, we should make it generic.
> > > >=20
> > > > So maybe something like "scanout"?
> > > >=20
> > > > One thing we need to consider too is that the Pi5 will have multiple
> > > > display nodes (4(?) iirc) with different capabilities, vc4 being on=
ly
> > > > one of them. This will impact that solution too.
> > >=20
> > > I'm not sure trying to find a unique generic name for all split rende=
r/display
> > > SoC is a good idea:
> > >=20
> > > - For the purposes of replacing DRM dumb buffers usage from v3d, we d=
on't
> > >   actually need a generic name, it's perfectly fine to hardcode a nam=
e here
> > >   since vc4 is pretty much hardcoded there already.
> >=20
> > Right. I'm wondering how that will work with drivers like panfrost or
> > powervr that will need to interact with different display drivers. We
> > will have the same issue for those, but we won't be able to hardcode the
> > driver name.
>=20
> We will be able to hardcode the driver name. In fact, the driver name is
> already hardcoded in kmsro today (Mesa creates one kmsro .so per supported
> display driver in /usr/lib/dri).
>=20
> It's just a matter of passing through the actual display device to panfro=
st in
> Mesa and adding a very simple mapping of driver name -> heap name.
>=20
> > Similarly, if you have multiple display drivers, what "scanout-capable"
> > will mean might differ from one device to the other. Some have
> > constraints on the memory they can access for example, so you cannot
> > just assume that a scanout-capable buffer allocated by vc4 might not be
> > scanout-capable for one of the RP1 DSI device.
> >=20
> > > - As you said, "scanout" may be ill-defined depending on the system. =
What if
> > >   a PCIe or USB device is plugged in? What if vkms is loaded? What if=
 there are
> > >   multiple platform display devices? What does "scanout" mean then?
> > > - A generic solution to advertise what DMA heaps a DRM display device=
 is
> > >   compatible with is probably better addressed by populating sysfs wi=
th new
> > >   files.
> >=20
> > That would be a good idea indeed
> >=20
> > >   We've talked with Sima at XDC about adding a symlink pointing to the
> > >   DMA heap and extra metadata files describing priorities and such.
> > >   However we don't actually need that part for the purposes of v3d --
> > >   I think I'd rather defer that until more DMA heaps are plumbed
> > >   across the DRM drivers.
> >=20
> > Honestly, I don't think we can afford to only consider vc4/v3d here. The
> > issue you described seem to affect any SoC with a split scanout/GPU,
> > which is pretty much all of them? And if they are all affected, we
> > should design something that fixes it once and for all.
>=20
> We don't need any sysfs stuff to fix the primary node and DRM dumb buffer
> issues in Mesa's kmsro/renderonly. The sysfs stuff is only required for a=
 fully
> generic buffer placement constraint/compatibility uAPI. Which would be su=
per
> useful in compositors, but let's do one step at a time.

I don't think a solution that further fragments the ecosystem is worth
taking, sorry. What you're doing is valuable, we should totally fix the
issue you have, but not at the expense of making vc4 special on one of
the platforms it supports.

Maxime

--7hxubvppenu4uelq
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQRcEzekXsqa64kGDp7j7w1vZxhRxQUCZU46pQAKCRDj7w1vZxhR
xYQfAP9dbkJe4V45w0nNSIc9JnjWZxtZqaV506JrKDFhAI0rKwEAlm2txB/iCI/4
+FbHw3xhglhizbJk2BKqO5NkNKIcjA0=
=F5Z4
-----END PGP SIGNATURE-----

--7hxubvppenu4uelq--
