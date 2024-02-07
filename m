Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A76E684C542
	for <lists+dri-devel@lfdr.de>; Wed,  7 Feb 2024 07:56:55 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B5C59113124;
	Wed,  7 Feb 2024 06:56:48 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Nf1misr0";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BAC92113121;
 Wed,  7 Feb 2024 06:56:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1707289007; x=1738825007;
 h=message-id:subject:from:to:cc:date:in-reply-to:
 references:content-transfer-encoding:mime-version;
 bh=lLOLMXJsAYbQ6m+PnkysiiwQB1o67gcWOvRURYVCQ7c=;
 b=Nf1misr0tNNbewIJ/sbE9VxGCo0yWeOwC8M1mgoE6ljFtqFJfBvviQg7
 bjdEvcEugDFHMG2H1EfLiR5ANeE/G18OeswhfEMbcewT13zKUzieIGuEX
 7hMjYSk89CoRSKXDGGtB1Yc6HUwchpyX0Vg8tiXu9I0knALNMdN2MBLqq
 ScfQoTTUnfS78GNwLg0kwej7by8HS1kptKE9Ae3geUpIKRXCKiccu9ND6
 1mWIl2pMDm1+ZHG2sYMHDY+aV4uY7OukoN7mXeAcEvJXsgtqqgWTf4xWf
 pCVU5s7HnO4kcAGFXl94AVziZso8a1cqvty85dw1BTxbog1jkxctQ5Iem Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10976"; a="11508194"
X-IronPort-AV: E=Sophos;i="6.05,250,1701158400"; d="scan'208";a="11508194"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
 by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 Feb 2024 22:56:46 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.05,250,1701158400"; 
   d="scan'208";a="1477944"
Received: from yuyingfa-mobl.ccr.corp.intel.com (HELO [10.249.254.50])
 ([10.249.254.50])
 by fmviesa008-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 Feb 2024 22:56:42 -0800
Message-ID: <5b3adb702cfaa944fdaa1b49ee7f10e4d0e86b2f.camel@linux.intel.com>
Subject: Re: Re: linux-next: build failure after merge of the drm-misc tree
From: Thomas =?ISO-8859-1?Q?Hellstr=F6m?= <thomas.hellstrom@linux.intel.com>
To: Lucas De Marchi <lucas.demarchi@intel.com>
Cc: Stephen Rothwell <sfr@canb.auug.org.au>, Daniel Vetter
 <daniel.vetter@ffwll.ch>, Matthew Brost <matthew.brost@intel.com>, Rodrigo
 Vivi <rodrigo.vivi@intel.com>, Christian =?ISO-8859-1?Q?K=F6nig?=
 <christian.koenig@amd.com>, Somalapuram Amaranath
 <Amaranath.Somalapuram@amd.com>, Intel Graphics
 <intel-gfx@lists.freedesktop.org>, DRI <dri-devel@lists.freedesktop.org>, 
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Linux Next
 Mailing List <linux-next@vger.kernel.org>, Dave Airlie <airlied@gmail.com>,
 intel-xe@lists.freedesktop.org
Date: Wed, 07 Feb 2024 07:56:39 +0100
In-Reply-To: <tughiv3y52m6ruczgb3g6mvvek7ihfrxaxh7ovoogzqfi6jmun@jcn6xap7vwcg>
References: <20240206122822.12a2df89@canb.auug.org.au>
 <f9a027765a3c65c69c2d49cf2964fe1155e914f4.camel@linux.intel.com>
 <tughiv3y52m6ruczgb3g6mvvek7ihfrxaxh7ovoogzqfi6jmun@jcn6xap7vwcg>
Autocrypt: addr=thomas.hellstrom@linux.intel.com; prefer-encrypt=mutual;
 keydata=mDMEZaWU6xYJKwYBBAHaRw8BAQdAj/We1UBCIrAm9H5t5Z7+elYJowdlhiYE8zUXgxcFz360SFRob21hcyBIZWxsc3Ryw7ZtIChJbnRlbCBMaW51eCBlbWFpbCkgPHRob21hcy5oZWxsc3Ryb21AbGludXguaW50ZWwuY29tPoiTBBMWCgA7FiEEbJFDO8NaBua8diGTuBaTVQrGBr8FAmWllOsCGwMFCwkIBwICIgIGFQoJCAsCBBYCAwECHgcCF4AACgkQuBaTVQrGBr/yQAD/Z1B+Kzy2JTuIy9LsKfC9FJmt1K/4qgaVeZMIKCAxf2UBAJhmZ5jmkDIf6YghfINZlYq6ixyWnOkWMuSLmELwOsgPuDgEZaWU6xIKKwYBBAGXVQEFAQEHQF9v/LNGegctctMWGHvmV/6oKOWWf/vd4MeqoSYTxVBTAwEIB4h4BBgWCgAgFiEEbJFDO8NaBua8diGTuBaTVQrGBr8FAmWllOsCGwwACgkQuBaTVQrGBr/P2QD9Gts6Ee91w3SzOelNjsus/DcCTBb3fRugJoqcfxjKU0gBAKIFVMvVUGbhlEi6EFTZmBZ0QIZEIzOOVfkaIgWelFEH
Organization: Intel Sweden AB, Registration Number: 556189-6027
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.50.3 (3.50.3-1.fc39) 
MIME-Version: 1.0
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

On Tue, 2024-02-06 at 14:21 -0600, Lucas De Marchi wrote:
> On Tue, Feb 06, 2024 at 01:39:28PM +0100, Thomas Hellstr=C3=B6m wrote:
> > Hi
> >=20
> > On Tue, 2024-02-06 at 12:28 +1100, Stephen Rothwell wrote:
> > > Hi all,
> > >=20
> > > After merging the drm-misc tree, today's linux-next build (x86_64
> > > allmodconfig) failed like this:
> > >=20
> > >=20
> > > Caused by commit
> > >=20
> > > =C2=A0 a78a8da51b36 ("drm/ttm: replace busy placement with flags v6")
> > >=20
> > > interacting with commit
> > >=20
> > > =C2=A0 dd08ebf6c352 ("drm/xe: Introduce a new DRM driver for Intel
> > > GPUs")
> > >=20
> > > (and maybe others) from Linus' tree (v6.8-rc1).
> > >=20
> > > I have applied the following merge fix patch for today.=C2=A0 This
> > > makes
> > > it build,
> > > but more is likely needed ...
> >=20
> > There was a manual fixup for the drm-misc-next merge into drm-tip
> > that
> > did the right thing here.
> >=20
> > How do we ensure these are included into the linux-next builds?
>=20
> I think it should have been done in commit 4db102dcb039 ("Merge
> drm/drm-next into drm-misc-next")
> when drm-next merged back into drm-misc-next. Now one option is
> probably a
> commit on drm-misc-next with this content:
> https://cgit.freedesktop.org/drm-tip/tree/fixups/drm-misc-next.patch?h=3D=
rerere-cache&id=3Dc39c6e3d74203820ef630884a5323237696bd36c
>=20
>=20
> Lucas De Marchi

Indeed. Not even drm-misc itself compiles with xe enabled. I'll ping
drm-misc maintainers.

/Thomas



