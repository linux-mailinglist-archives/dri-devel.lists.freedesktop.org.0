Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 5E527A09166
	for <lists+dri-devel@lfdr.de>; Fri, 10 Jan 2025 14:05:04 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BB1BF10F0AA;
	Fri, 10 Jan 2025 13:05:01 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Yp4CAT5+";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9819D10F0A9;
 Fri, 10 Jan 2025 13:04:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1736514300; x=1768050300;
 h=message-id:subject:from:to:cc:date:in-reply-to:
 references:content-transfer-encoding:mime-version;
 bh=sWu6pz46Rp+wZhgwPeMTGIxoLJjFsUdAyLmGfOzKy1U=;
 b=Yp4CAT5+qygbjttgHY/YDWWtXb0zjdHqaK0xvT6ovrfcpJbcghgN2WK0
 IRHU588Lm+Z/wGE0vYeu5VBaOqF5uNFev5utOMEy+137pBRWs11GnXbK8
 xeQEeClBKR0nYxZ5FLa8xS/iwhdLweHZAStQNfCTzNG26LYcuVhTrdO7O
 +F4UVBm3We8Gt/TdYvu750cyuHK0eLlK5uK1uZn7eEzJM0HsP4W7P+HLH
 +gdovbW6nHdxTUqT0C2WEZkd5xfgPSgcclM8gbuMDB3tfWDabl1A4YFYX
 4JWTc2NpwCxi5OiYAx2T02n0Q2Izg2xw5ywyToHr+O8K0eNGDhyVSynqM w==;
X-CSE-ConnectionGUID: 511mapIJRoq7BSsGC9jsYA==
X-CSE-MsgGUID: nSqZQ/vAS0SlvX/GyXqrxg==
X-IronPort-AV: E=McAfee;i="6700,10204,11311"; a="36915749"
X-IronPort-AV: E=Sophos;i="6.12,303,1728975600"; d="scan'208";a="36915749"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
 by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Jan 2025 05:05:00 -0800
X-CSE-ConnectionGUID: 7n/Dzox7Qz6scrBKpAHkxQ==
X-CSE-MsgGUID: VuHm4A7bRvuCKlen3QE0jQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,224,1728975600"; d="scan'208";a="104612128"
Received: from klitkey1-mobl1.ger.corp.intel.com (HELO [10.245.246.11])
 ([10.245.246.11])
 by orviesa008-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Jan 2025 05:04:57 -0800
Message-ID: <c75c7c1891eee928235cf84bf2c354bda43fd04d.camel@linux.intel.com>
Subject: Re: [PATCH v15 0/9] TTM shrinker helpers and xe buffer object shrinker
From: Thomas =?ISO-8859-1?Q?Hellstr=F6m?= <thomas.hellstrom@linux.intel.com>
To: Christian =?ISO-8859-1?Q?K=F6nig?= <christian.koenig@amd.com>, 
 intel-xe@lists.freedesktop.org
Cc: Somalapuram Amaranath <Amaranath.Somalapuram@amd.com>, Matthew Brost
 <matthew.brost@intel.com>, Paulo Zanoni <paulo.r.zanoni@intel.com>, 
 dri-devel@lists.freedesktop.org, Simona Vetter <simona.vetter@ffwll.ch>
Date: Fri, 10 Jan 2025 14:04:53 +0100
In-Reply-To: <d1f431f6-559f-4ca8-8cf2-b97fcbd2f5dd@amd.com>
References: <20241217145852.37342-1-thomas.hellstrom@linux.intel.com>
 <d1f431f6-559f-4ca8-8cf2-b97fcbd2f5dd@amd.com>
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

On Fri, 2025-01-10 at 10:47 +0100, Christian K=C3=B6nig wrote:
> Any objections that I push patch #1 and #3 to drm-misc-next?
>=20
> They are general cleanups anyway and this way we have them out of the
> way.
>=20
> Regards,
> Christian.

Please do. I have to rewrite the cover letter but that's not a big
deal. Also perhaps consider adding a patch to remove the "allow_pools"
functionality.

Also re-raising the question if there is a way we can make TTM
development scale a bit better, with a team of trusted reviewers?=C2=A0
I am currently working under the assumption that you want to at least
ack everything that goes into TTM?

Thanks,
Thomas



>=20
> Am 17.12.24 um 15:58 schrieb Thomas Hellstr=C3=B6m:
> > This series implements TTM shrinker / eviction helpers and an xe bo
> > shrinker. It builds on a previous series, *and obsoletes that one*.
> >=20
> > https://lore.kernel.org/linux-mm/b7491378-defd-4f1c-31e2-29e4c77e2d67@a=
md.com/T/
> >=20
> > Where the comment about layering
> > https://lore.kernel.org/linux-mm/b7491378-defd-4f1c-31e2-29e4c77e2d67@a=
md.com/T/#ma918844aa8a6efe8768fdcda0c6590d5c93850c9
> >=20
> > now addressed, and this version also implements shmem objects for
> > backup
> > rather than direct swap-cache insertions, which was used in the
> > previuos
> > series. It turns out that with per-page backup / shrinking, shmem
> > objects
> > appears to work just as well as direct swap-cache insertions with
> > the
> > added benefit that was introduced in the previous TTM shrinker
> > series to
> > avoid running out of swap entries isn't really needed.
> >=20
> > The series earlier consisted of a LRU traversal part and the
> > current part.
> > The LRU traversal part is merged, but is still mentioned in the
> > history
> > below.
> >=20
> > Patch 1 balances ttm_resource_cursor_fini() with an init function.
> > It
> > makes patch 5 more straightforward.
> >=20
> > Patch 2 introduces a backup implemententaion.
> >=20
> > Patch 3 reworks the structure of ttm_pool_alloc in preparation for
> > patch 4.
> >=20
> > Patch 4 introduces functionality in the ttm_pool code for page-by-
> > page shrinking
> > and recovery. It avoids having to temporarily allocate a huge
> > amount of
> > memory to be able to shrink a buffer object. It also introduces the
> > possibility to immediately write-back pages if needed.
> >=20
> > Patch 5 Adds a simple error injection to the above code to help
> > increase
> > test coverage.
> >=20
> > Patch 6 Implements a macro for LRU iteration.
> >=20
> > Patch 7 Introduces driver-facing helpers for shrinking.
> >=20
> > Patch 8 Implements the xe bo shrinker.
> >=20
> > Patch 9 Increases (removes) the XE_PL_TT watermark.
> >=20
> > v2:
> > - Squash obsolete revision history in the patch commit messages.
> > - Fix a couple of review comments by Christian
> > - Don't store the mem_type in the TTM managers but in the
> > =C2=A0=C2=A0 resource cursor.
> > - Rename introduced TTM *back_up* function names to *backup*
> > - Add ttm pool recovery fault injection.
> > - Shrinker xe kunit test
> > - Various bugfixes
> >=20
> > v3:
> > - Address some review comments from Matthew Brost and Christian
> > K=C3=B6nig.
> > - Use the restartable LRU walk for TTM swapping and eviction.
> > - Provide a POC drm_exec locking implementation for exhaustive
> > =C2=A0=C2=A0 eviction. (Christian K=C3=B6nig).
> >=20
> > v4:
> > - Remove the RFC exhaustive eviction part. While the path to
> > exhaustive
> > =C2=A0=C2=A0 eviction is pretty clear and demonstrated in v3, there is =
still
> > some
> > =C2=A0=C2=A0 drm_exec work that needs to be agreed and implemented.
> > - Add shrinker power management. On some hw we need to wake when
> > shrinking.
> > - Fix the lru walker helper for -EALREADY errors.
> > - Add drm/xe: Increase the XE_PL_TT watermark.
> >=20
> > v5:
> > - Update also TTM kunit tests
> > - Handle ghost- and zombie objects in the shrinker.
> > - A couple of compile- and UAF fixes reported by Kernel Build Robot
> > and
> > =C2=A0=C2=A0 Dan Carpenter.
> >=20
> > v6:
> > - Address review comments from Matthew Brost on the
> > =C2=A0=C2=A0 restartable LRU traversal path.
> >=20
> > v7:
> > - Split out TTM restartable LRU traversal path and merge that.
> > - Adapt the review comments on that series.
> >=20
> > v8:
> > - Address review comments from Matthew Brost as detailed in the
> > =C2=A0=C2=A0 respective patches.
> >=20
> > v9:
> > - Rebase and fix compilation errors
> >=20
> > v10:
> > - Use a LRU iteration macro rather than a function with a callback.
> > - Rebasing and cleanups
> > - Address some additional review comments from Matt Brost.
> > - Drop the shrinker selftest. It was already merged as a swapout
> > =C2=A0=C2=A0 self-test.
> >=20
> > v11:
> > - Move more core interaction to additional TTM helpers.
> > - Don't back up without __GFP_FS, and don't start writeback without
> > __GFP_IO.
> > - Rebase.
> >=20
> > v12:
> > - Fix an indentation flaw.
> > - Rebase
> >=20
> > v13:
> > - Remove the backup base-class, and use direct calls for ttm_backup
> > =C2=A0=C2=A0 (Christian K=C3=B6nig).
> > - Rebase on the ttm_backup changes.
> > - Move shrunken bos from the LRU list to the unevictable list.
> > - Provide an accessor function with sanity checks to set the
> > - ttm_tt::backup field.
> > - Update documentation.
> >=20
> > v14:
> > - Update documentation of ttm_backup_bytes_avail().
> > - Work around converting between struct file * and struct ttm-
> > backup *.
> > - Don't set up backup for imported buffers.
> >=20
> > v15:
> > - ttm_backup return value change. (Christian K=C3=B6nig)
> > - ttm_pool restore/alloc implementation rework (Christian K=C3=B6nig)
> > - Documentation update.
> > - Remove cond_resched (Christian K=C3=B6nig)
> >=20
> > Cc: Somalapuram Amaranath <Amaranath.Somalapuram@amd.com>
> > Cc: Christian K=C3=B6nig <christian.koenig@amd.com>
> > Cc: Matthew Brost <matthew.brost@intel.com>
> > Cc: Paulo Zanoni <paulo.r.zanoni@intel.com>
> > Cc: <dri-devel@lists.freedesktop.org>
> >=20
> > Thomas Hellstr=C3=B6m (9):
> > =C2=A0=C2=A0 drm/ttm: Balance ttm_resource_cursor_init() and
> > =C2=A0=C2=A0=C2=A0=C2=A0 ttm_resource_cursor_fini()
> > =C2=A0=C2=A0 drm/ttm: Provide a shmem backup implementation
> > =C2=A0=C2=A0 drm/ttm/pool: Restructure the pool allocation code
> > =C2=A0=C2=A0 drm/ttm/pool, drm/ttm/tt: Provide a helper to shrink pages
> > =C2=A0=C2=A0 drm/ttm: Use fault-injection to test error paths
> > =C2=A0=C2=A0 drm/ttm: Add a macro to perform LRU iteration
> > =C2=A0=C2=A0 drm/ttm: Add helpers for shrinking
> > =C2=A0=C2=A0 drm/xe: Add a shrinker for xe bos
> > =C2=A0=C2=A0 drm/xe: Increase the XE_PL_TT watermark
> >=20
> > =C2=A0 drivers/gpu/drm/ttm/Makefile=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0 |=C2=A0=C2=A0 2 +-
> > =C2=A0 drivers/gpu/drm/ttm/ttm_backup.c=C2=A0=C2=A0=C2=A0=C2=A0 | 207 +=
+++++++
> > =C2=A0 drivers/gpu/drm/ttm/ttm_bo.c=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0 |=C2=A0=C2=A0 3 +-
> > =C2=A0 drivers/gpu/drm/ttm/ttm_bo_util.c=C2=A0=C2=A0=C2=A0 | 250 ++++++=
+++-
> > =C2=A0 drivers/gpu/drm/ttm/ttm_pool.c=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0 | 718
> > +++++++++++++++++++++++----
> > =C2=A0 drivers/gpu/drm/ttm/ttm_resource.c=C2=A0=C2=A0 |=C2=A0 35 +-
> > =C2=A0 drivers/gpu/drm/ttm/ttm_tt.c=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0 |=C2=A0 83 ++++
> > =C2=A0 drivers/gpu/drm/xe/Makefile=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0 |=C2=A0=C2=A0 1 +
> > =C2=A0 drivers/gpu/drm/xe/tests/xe_bo.c=C2=A0=C2=A0=C2=A0=C2=A0 |=C2=A0=
=C2=A0 6 +-
> > =C2=A0 drivers/gpu/drm/xe/xe_bo.c=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0 | 202 +++++++-
> > =C2=A0 drivers/gpu/drm/xe/xe_bo.h=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0 |=C2=A0 36 ++
> > =C2=A0 drivers/gpu/drm/xe/xe_device.c=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0 |=C2=A0=C2=A0 8 +
> > =C2=A0 drivers/gpu/drm/xe/xe_device_types.h |=C2=A0=C2=A0 2 +
> > =C2=A0 drivers/gpu/drm/xe/xe_shrinker.c=C2=A0=C2=A0=C2=A0=C2=A0 | 258 +=
+++++++++
> > =C2=A0 drivers/gpu/drm/xe/xe_shrinker.h=C2=A0=C2=A0=C2=A0=C2=A0 |=C2=A0=
 18 +
> > =C2=A0 drivers/gpu/drm/xe/xe_ttm_sys_mgr.c=C2=A0 |=C2=A0=C2=A0 3 +-
> > =C2=A0 include/drm/ttm/ttm_backup.h=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0 |=C2=A0 74 +++
> > =C2=A0 include/drm/ttm/ttm_bo.h=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 |=C2=A0 93 ++++
> > =C2=A0 include/drm/ttm/ttm_pool.h=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0 |=C2=A0=C2=A0 8 +
> > =C2=A0 include/drm/ttm/ttm_resource.h=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0 |=C2=A0 11 +-
> > =C2=A0 include/drm/ttm/ttm_tt.h=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 |=C2=A0 69 ++-
> > =C2=A0 21 files changed, 1935 insertions(+), 152 deletions(-)
> > =C2=A0 create mode 100644 drivers/gpu/drm/ttm/ttm_backup.c
> > =C2=A0 create mode 100644 drivers/gpu/drm/xe/xe_shrinker.c
> > =C2=A0 create mode 100644 drivers/gpu/drm/xe/xe_shrinker.h
> > =C2=A0 create mode 100644 include/drm/ttm/ttm_backup.h
> >=20
>=20

