Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 467DEA123EC
	for <lists+dri-devel@lfdr.de>; Wed, 15 Jan 2025 13:42:12 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C4BA010E671;
	Wed, 15 Jan 2025 12:42:10 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="LJV+UApZ";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F14C610E671
 for <dri-devel@lists.freedesktop.org>; Wed, 15 Jan 2025 12:42:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1736944929; x=1768480929;
 h=message-id:subject:from:to:cc:date:in-reply-to:
 references:content-transfer-encoding:mime-version;
 bh=2fYtcgRqFifDv9S3LhZevfTHGbkLpNbkV/10jzoNMQs=;
 b=LJV+UApZ78qgcTivVCLZfF9MXI1DWVbWnOO5IDkJaszCPp6nya1xIuXV
 O7cPCIv4x1L2uOxrhjXRsCiz5ZE/cHX9AoDMm/WvwArsPIReNKtRdO0xW
 R9NfDHqYz4LHeeX1QOHHN/Aex48iZQ6W7vCy77cHTe0Zc389Kxh+JtPDZ
 5toKmDZBQFzBoRAgC7YLMTiB97VrmDsu5qx1uvw9i8AFYlgBcDrWa08/o
 vTSUaAfD0hmxGiIipvZg05r56Ysl07VOSCSdnkhhwNXEbf2Oxoynpuh1U
 gDoYylt9VHKpANnyu4hmzibBmAnX1Pd4JBW3N0ZHnNh7j5kMpSsAhUps6 A==;
X-CSE-ConnectionGUID: hDoyCHbgT7yngbu/4J/AdQ==
X-CSE-MsgGUID: oVv4ksydSOSh+Uo6pxO67Q==
X-IronPort-AV: E=McAfee;i="6700,10204,11314"; a="48689331"
X-IronPort-AV: E=Sophos;i="6.12,310,1728975600"; d="scan'208";a="48689331"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
 by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 Jan 2025 04:42:09 -0800
X-CSE-ConnectionGUID: Qb1DcjH5R4WNxvS3KBawOA==
X-CSE-MsgGUID: 6Pfj51xdSaS18wlXOrxdEQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,224,1728975600"; d="scan'208";a="105992114"
Received: from bergbenj-mobl1.ger.corp.intel.com (HELO [10.245.246.51])
 ([10.245.246.51])
 by orviesa008-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 Jan 2025 04:42:06 -0800
Message-ID: <a46c13c9bfd1761d3b4d131b86e5de033f905a8b.camel@linux.intel.com>
Subject: Re: [PATCH] drm/tests/buddy: fix build with unused prng
From: Thomas =?ISO-8859-1?Q?Hellstr=F6m?= <thomas.hellstrom@linux.intel.com>
To: Matthew Auld <matthew.auld@intel.com>, dri-devel@lists.freedesktop.org
Cc: Jani Nikula <jani.nikula@intel.com>, Arunpravin Paneer Selvam
 <Arunpravin.PaneerSelvam@amd.com>, Christian =?ISO-8859-1?Q?K=F6nig?=
 <christian.koenig@amd.com>
Date: Wed, 15 Jan 2025 13:42:03 +0100
In-Reply-To: <a2cadd9da0eed757b1a6e4727d5c9bc3adeed768.camel@linux.intel.com>
References: <20250115123734.154243-2-matthew.auld@intel.com>
 <a2cadd9da0eed757b1a6e4727d5c9bc3adeed768.camel@linux.intel.com>
Organization: Intel Sweden AB, Registration Number: 556189-6027
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.54.2 (3.54.2-1.fc41) 
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

On Wed, 2025-01-15 at 13:40 +0100, Thomas Hellstr=C3=B6m wrote:
> On Wed, 2025-01-15 at 12:37 +0000, Matthew Auld wrote:
> > We no longer use the prng, which leads to the following warning:
> >=20
> > drivers/gpu/drm/tests/drm_buddy_test.c: In function
> > =E2=80=98drm_test_buddy_alloc_clear=E2=80=99:
> > drivers/gpu/drm/tests/drm_buddy_test.c:264:23: error: unused
> > variable
> > =E2=80=98prng=E2=80=99 [-Werror=3Dunused-variable]
> > =C2=A0 264 |=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 DRM_RND_ST=
ATE(prng, random_seed);
> >=20
> > Reported-by: Jani Nikula <jani.nikula@intel.com>
> > Reported-by: Thomas Hellstr=C3=B6m <thomas.hellstrom@linux.intel.com>
> > Fixes: 8cb3a1e2b350 ("drm/buddy: Add a testcase to verify the
> > multiroot fini")
> > Signed-off-by: Matthew Auld <matthew.auld@intel.com>
> > Cc: Arunpravin Paneer Selvam <Arunpravin.PaneerSelvam@amd.com>
> > Cc: Christian K=C3=B6nig <christian.koenig@amd.com>
>=20
> Reviewed-by: Thomas Hellstr=C3=B6m <thomas.hellstrom@linux.intel.com>

Oh, checkpatch.pl might complain about some missing tags, though,
like Closes: or Link:

/Thomas



>=20
> > ---
> > =C2=A0drivers/gpu/drm/tests/drm_buddy_test.c | 1 -
> > =C2=A01 file changed, 1 deletion(-)
> >=20
> > diff --git a/drivers/gpu/drm/tests/drm_buddy_test.c
> > b/drivers/gpu/drm/tests/drm_buddy_test.c
> > index 4b5818f9f2a9..7a0e523651f0 100644
> > --- a/drivers/gpu/drm/tests/drm_buddy_test.c
> > +++ b/drivers/gpu/drm/tests/drm_buddy_test.c
> > @@ -261,7 +261,6 @@ static void
> > drm_test_buddy_alloc_range_bias(struct kunit *test)
> > =C2=A0static void drm_test_buddy_alloc_clear(struct kunit *test)
> > =C2=A0{
> > =C2=A0	unsigned long n_pages, total, i =3D 0;
> > -	DRM_RND_STATE(prng, random_seed);
> > =C2=A0	const unsigned long ps =3D SZ_4K;
> > =C2=A0	struct drm_buddy_block *block;
> > =C2=A0	const int max_order =3D 12;
>=20

