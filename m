Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C425E9DE83B
	for <lists+dri-devel@lfdr.de>; Fri, 29 Nov 2024 15:05:27 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C3ECE10E2AB;
	Fri, 29 Nov 2024 14:05:24 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="qBlc6fi9";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from nyc.source.kernel.org (nyc.source.kernel.org [147.75.193.91])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 482D610E2AB;
 Fri, 29 Nov 2024 14:05:24 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by nyc.source.kernel.org (Postfix) with ESMTP id 826DEA43EA6;
 Fri, 29 Nov 2024 14:03:30 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 87B5FC4CECF;
 Fri, 29 Nov 2024 14:05:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1732889122;
 bh=qnn7jF7scUdP+uRzWLU+k8s5eIGMfPm2GBZjlbmhg5A=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=qBlc6fi9WGn1K/dmj6c5hN2SkeKQglvLFbqtgokrimgGtnqtwIEaw6D+MpPBVQslT
 aKfmKIRU3fYNq6CFWutopmFIBlToXlH2jyjUnMo8DCZmwkVj7BuiXebJfMvqezQ0g2
 qhjf2sVuZxZHizrRtxLAa925Ms47v1WXmd4V8CqoOJipAhiwxhQUOGICYDFIXX6UDj
 TkmevdAX7kbwMzVq6sl2ATCoGE5c52WHuua/eM58sNcF63XYlUXs3De8ie5HTtwpWv
 0Z57xOWorLFao9rJAyyzCn4of7FiIg99nT2s5xetZcUAh4/CSVINJ1sNPWrfjzYPZj
 zhGA5pHbBizTw==
Date: Fri, 29 Nov 2024 15:05:20 +0100
From: Maxime Ripard <mripard@kernel.org>
To: Rodrigo Vivi <rodrigo.vivi@intel.com>
Cc: Christian =?utf-8?B?S8O2bmln?= <christian.koenig@amd.com>, 
 maarten.lankhorst@linux.intel.com, tzimmermann@suse.de,
 Matthew Brost <matthew.brost@intel.com>, 
 intel-xe@lists.freedesktop.org, dri-devel@lists.freedesktop.org, 
 thomas.hellstrom@linux.intel.com
Subject: Re: [PATCH v7 2/8] drm/ttm: Add ttm_bo_access
Message-ID: <20241129-abstract-flawless-kestrel-d36df9@houat>
References: <20241126174615.2665852-1-matthew.brost@intel.com>
 <20241126174615.2665852-3-matthew.brost@intel.com>
 <0554dd02-06a5-4da1-821a-e2b26b651402@amd.com>
 <Z0hKSYRokwJoi_T1@intel.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha384;
 protocol="application/pgp-signature"; boundary="f74bwaksphzeszv5"
Content-Disposition: inline
In-Reply-To: <Z0hKSYRokwJoi_T1@intel.com>
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


--f74bwaksphzeszv5
Content-Type: text/plain; protected-headers=v1; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
Subject: Re: [PATCH v7 2/8] drm/ttm: Add ttm_bo_access
MIME-Version: 1.0

On Thu, Nov 28, 2024 at 05:47:37AM -0500, Rodrigo Vivi wrote:
> On Wed, Nov 27, 2024 at 02:19:32PM +0100, Christian K=F6nig wrote:
> > Am 26.11.24 um 18:46 schrieb Matthew Brost:
> > > Non-contiguous VRAM cannot easily be mapped in TTM nor can non-visible
> > > VRAM easily be accessed. Add ttm_bo_access, which is similar to
> > > ttm_bo_vm_access, to access such memory.
> > >=20
> > > v4:
> > >   - Fix checkpatch warnings (CI)
> > > v5:
> > >   - Fix checkpatch warnings (CI)
> > > v6:
> > >   - Fix kernel doc (Auld)
> > > v7:
> > >   - Move ttm_bo_access to ttm_bo_vm.c (Christian)
> > >=20
> > > Cc: Christian K=F6nig <christian.koenig@amd.com>
> > > Reported-by: Christoph Manszewski <christoph.manszewski@intel.com>
> > > Suggested-by: Thomas Hellstr=F6m <thomas.hellstrom@linux.intel.com>
> > > Signed-off-by: Matthew Brost <matthew.brost@intel.com>
> > > Tested-by: Mika Kuoppala <mika.kuoppala@linux.intel.com>
> > > Reviewed-by: Matthew Auld <matthew.auld@intel.com>
> >=20
> > Reviewed-by: Christian K=F6nig <christian.koenig@amd.com>
>=20
> Thank you!
>=20
> Ack on get this through drm-xe-next?
>=20
> drm-misc-maintainers?
Acked-by: Maxime Ripard <mripard@kernel.org>

Maxime

--f74bwaksphzeszv5
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iJUEABMJAB0WIQTkHFbLp4ejekA/qfgnX84Zoj2+dgUCZ0nKHwAKCRAnX84Zoj2+
diQQAYDDrclgQ221d/+68zwJ08lbl0KSaHp2wE9ORtvqXvlshV+3ncynugfWTd39
LHf4iW4BgNZVqLjOLNgqyvb44wJs+jOdaLqSwPBTPmO7hIQp1rH0rwjVIIWt2imV
jY4M9YNQpw==
=kEVr
-----END PGP SIGNATURE-----

--f74bwaksphzeszv5--
