Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id E4729769587
	for <lists+dri-devel@lfdr.de>; Mon, 31 Jul 2023 14:05:04 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8DBDC10E26E;
	Mon, 31 Jul 2023 12:05:01 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D1BAA10E26E;
 Mon, 31 Jul 2023 12:04:59 +0000 (UTC)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 4CBF26108E;
 Mon, 31 Jul 2023 12:04:59 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5FA01C433C8;
 Mon, 31 Jul 2023 12:04:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1690805098;
 bh=CxFnYp7q+XxZ7znzGHFxRtOTFd57UjGuXrJBT9Z6jfw=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=dNP7+QrCm8e46TuickOROLjjoLk92XRMECcE6QClmuWcLojczZGukm8KMESE1qWL8
 CYxrXkdWiffoaLzos/RLuhWfIAdUqM/Q1pylPvMfbNH8spCCndcH/XDhXCxRQLggiF
 vgBrGQHEXumy5TAx6WhEAHo1gT1LXoPY6m/epkfeeFQumPrdgl5SdK3jQGgrHF5mq7
 pvD/f2EG7lAQIaTUn5JiXPWse/LTC4ro5PhsIEbt/I/IqH0PTMZa/o3xLuLyeDE+Ts
 JhrfTd66S/ROXLq2LHi4ag2u/bghGxZltrDXN2c6wo0BCVdmbyzvetd4DsqUafCH0A
 cW61RjU8PEI9Q==
Date: Mon, 31 Jul 2023 14:04:55 +0200
From: Maxime Ripard <mripard@kernel.org>
To: Boris Brezillon <boris.brezillon@collabora.com>
Subject: Re: [PATCH drm-misc-next v8 01/12] drm: manager to keep track of
 GPUs VA mappings
Message-ID: <r7gbbrkn4hjyjyjgapf7jnyswbuvks4ng7uuy7gibsra2xpvzf@iot4rgafaqjn>
References: <20230720001443.2380-1-dakr@redhat.com>
 <20230720001443.2380-2-dakr@redhat.com>
 <hi5magp4icayy5dxmylfyxws52cu63jvlhu4yj5xem3acoaylk@msf7zthcr3lg>
 <20230728142612.2ecf99ef@collabora.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
 protocol="application/pgp-signature"; boundary="wm7cpxvm7mxqxcv7"
Content-Disposition: inline
In-Reply-To: <20230728142612.2ecf99ef@collabora.com>
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
Cc: matthew.brost@intel.com,
 Thomas =?utf-8?Q?Hellstr=C3=B6m?= <thomas.hellstrom@linux.intel.com>,
 willy@infradead.org, dri-devel@lists.freedesktop.org, corbet@lwn.net,
 nouveau@lists.freedesktop.org, ogabbay@kernel.org, linux-doc@vger.kernel.org,
 linux-kernel@vger.kernel.org, Liam.Howlett@oracle.com,
 Danilo Krummrich <dakr@redhat.com>, bskeggs@redhat.com, tzimmermann@suse.de,
 Dave Airlie <airlied@redhat.com>, bagasdotme@gmail.com,
 christian.koenig@amd.com, jason@jlekstrand.net, donald.robson@imgtec.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


--wm7cpxvm7mxqxcv7
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi Boris,

On Fri, Jul 28, 2023 at 02:26:12PM +0200, Boris Brezillon wrote:
> On Fri, 28 Jul 2023 13:31:36 +0200
> Maxime Ripard <mripard@kernel.org> wrote:
>=20
> > Hi Danilo,
> >=20
> > On Thu, Jul 20, 2023 at 02:14:22AM +0200, Danilo Krummrich wrote:
> > > Add infrastructure to keep track of GPU virtual address (VA) mappings
> > > with a decicated VA space manager implementation.
> > >=20
> > > New UAPIs, motivated by Vulkan sparse memory bindings graphics drivers
> > > start implementing, allow userspace applications to request multiple =
and
> > > arbitrary GPU VA mappings of buffer objects. The DRM GPU VA manager is
> > > intended to serve the following purposes in this context.
> > >=20
> > > 1) Provide infrastructure to track GPU VA allocations and mappings,
> > >    making using an interval tree (RB-tree).
> > >=20
> > > 2) Generically connect GPU VA mappings to their backing buffers, in
> > >    particular DRM GEM objects.
> > >=20
> > > 3) Provide a common implementation to perform more complex mapping
> > >    operations on the GPU VA space. In particular splitting and merging
> > >    of GPU VA mappings, e.g. for intersecting mapping requests or part=
ial
> > >    unmap requests.
> > >=20
> > > Acked-by: Thomas Hellstr=F6m <thomas.hellstrom@linux.intel.com>
> > > Acked-by: Matthew Brost <matthew.brost@intel.com>
> > > Reviewed-by: Boris Brezillon <boris.brezillon@collabora.com>
> > > Tested-by: Matthew Brost <matthew.brost@intel.com>
> > > Tested-by: Donald Robson <donald.robson@imgtec.com>
> > > Suggested-by: Dave Airlie <airlied@redhat.com>
> > > Signed-off-by: Danilo Krummrich <dakr@redhat.com> =20
> >=20
> > For some reason this breaks the drm_exec kunit patches:
>=20
> Fix available here [1].
>=20
> [1]https://lore.kernel.org/dri-devel/cbf4ccf9-8131-27a0-332c-6942866340d1=
@igalia.com/T/#t

Thanks for pointing it out :)

Maxime

--wm7cpxvm7mxqxcv7
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQRcEzekXsqa64kGDp7j7w1vZxhRxQUCZMejZwAKCRDj7w1vZxhR
xaW5AQCv028JEAAnIb/aFhQc1sYoXrIKQLstpLgP6KnY2r99tAD7BvwHotLO3uHq
7wsMukvisTg7tcpMtdYRdRiWIaoh+gs=
=nrso
-----END PGP SIGNATURE-----

--wm7cpxvm7mxqxcv7--
