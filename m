Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 60B4236E49B
	for <lists+dri-devel@lfdr.de>; Thu, 29 Apr 2021 07:49:57 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 080646EC77;
	Thu, 29 Apr 2021 05:49:51 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtp89.ord1c.emailsrvr.com (smtp89.ord1c.emailsrvr.com
 [108.166.43.89])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 50CF26E153
 for <dri-devel@lists.freedesktop.org>; Wed, 28 Apr 2021 17:28:05 +0000 (UTC)
X-Auth-ID: kenneth@whitecape.org
Received: by smtp28.relay.ord1c.emailsrvr.com (Authenticated sender:
 kenneth-AT-whitecape.org) with ESMTPSA id A47B740238; 
 Wed, 28 Apr 2021 13:28:03 -0400 (EDT)
From: Kenneth Graunke <kenneth@whitecape.org>
To: intel-gfx@lists.freedesktop.org, Matthew Auld <matthew.auld@intel.com>
Subject: Re: [PATCH 6/9] drm/i915/uapi: implement object placement extension
Date: Wed, 28 Apr 2021 10:28:03 -0700
Message-ID: <6803385.KsXFIaTQHz@mizzik>
In-Reply-To: <20210426093901.28937-6-matthew.auld@intel.com>
References: <20210426093901.28937-1-matthew.auld@intel.com>
 <20210426093901.28937-6-matthew.auld@intel.com>
MIME-Version: 1.0
X-Classification-ID: e11d4714-109f-44ce-a4b1-fc7f70a79440-1-1
X-Mailman-Approved-At: Thu, 29 Apr 2021 05:49:49 +0000
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
Cc: Lionel Landwerlin <lionel.g.landwerlin@linux.intel.com>,
 Jordan Justen <jordan.l.justen@intel.com>, dri-devel@lists.freedesktop.org,
 CQ Tang <cq.tang@intel.com>,
 Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>,
 Jason Ekstrand <jason@jlekstrand.net>, mesa-dev@lists.freedesktop.org,
 Daniel Vetter <daniel.vetter@intel.com>
Content-Type: multipart/mixed; boundary="===============0748599179=="
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

--===============0748599179==
Content-Type: multipart/signed; boundary="nextPart3923341.ekzWyWCOrY"; micalg="pgp-sha256"; protocol="application/pgp-signature"

--nextPart3923341.ekzWyWCOrY
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"; protected-headers="v1"
From: Kenneth Graunke <kenneth@whitecape.org>
To: intel-gfx@lists.freedesktop.org, Matthew Auld <matthew.auld@intel.com>
Cc: CQ Tang <cq.tang@intel.com>, Joonas Lahtinen <joonas.lahtinen@linux.intel.com>, Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>, Lionel Landwerlin <lionel.g.landwerlin@linux.intel.com>, Jordan Justen <jordan.l.justen@intel.com>, Daniel Vetter <daniel.vetter@intel.com>, Jason Ekstrand <jason@jlekstrand.net>, Dave Airlie <airlied@gmail.com>, dri-devel@lists.freedesktop.org, mesa-dev@lists.freedesktop.org
Subject: Re: [PATCH 6/9] drm/i915/uapi: implement object placement extension
Date: Wed, 28 Apr 2021 10:28:03 -0700
Message-ID: <6803385.KsXFIaTQHz@mizzik>
In-Reply-To: <20210426093901.28937-6-matthew.auld@intel.com>
References: <20210426093901.28937-1-matthew.auld@intel.com> <20210426093901.28937-6-matthew.auld@intel.com>

On Monday, April 26, 2021 2:38:58 AM PDT Matthew Auld wrote:
> Add new extension to support setting an immutable-priority-list of
> potential placements, at creation time.
> 
> If we use the normal gem_create or gem_create_ext without the
> extensions/placements then we still get the old behaviour with only
> placing the object in system memory.
> 
> v2(Daniel & Jason):
>     - Add a bunch of kernel-doc
>     - Simplify design for placements extension
> 
> Testcase: igt/gem_create/create-ext-placement-sanity-check
> Testcase: igt/gem_create/create-ext-placement-each
> Testcase: igt/gem_create/create-ext-placement-all
> Signed-off-by: Matthew Auld <matthew.auld@intel.com>
> Signed-off-by: CQ Tang <cq.tang@intel.com>
> Cc: Joonas Lahtinen <joonas.lahtinen@linux.intel.com>
> Cc: Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>
> Cc: Lionel Landwerlin <lionel.g.landwerlin@linux.intel.com>
> Cc: Jordan Justen <jordan.l.justen@intel.com>
> Cc: Daniel Vetter <daniel.vetter@intel.com>
> Cc: Kenneth Graunke <kenneth@whitecape.org>
> Cc: Jason Ekstrand <jason@jlekstrand.net>
> Cc: Dave Airlie <airlied@gmail.com>
> Cc: dri-devel@lists.freedesktop.org
> Cc: mesa-dev@lists.freedesktop.org
> ---
>  drivers/gpu/drm/i915/gem/i915_gem_create.c    | 215 ++++++++++++++++--
>  drivers/gpu/drm/i915/gem/i915_gem_object.c    |   3 +
>  .../gpu/drm/i915/gem/i915_gem_object_types.h  |   6 +
>  .../drm/i915/gem/selftests/i915_gem_mman.c    |  26 +++
>  drivers/gpu/drm/i915/intel_memory_region.c    |  16 ++
>  drivers/gpu/drm/i915/intel_memory_region.h    |   4 +
>  include/uapi/drm/i915_drm.h                   |  62 +++++
>  7 files changed, 315 insertions(+), 17 deletions(-)
> 
> diff --git a/drivers/gpu/drm/i915/gem/i915_gem_create.c b/drivers/gpu/drm/i915/gem/i915_gem_create.c
> index 90e9eb6601b5..895f1666a8d3 100644
> --- a/drivers/gpu/drm/i915/gem/i915_gem_create.c
> +++ b/drivers/gpu/drm/i915/gem/i915_gem_create.c
> @@ -4,12 +4,47 @@
>   */
>  
>  #include "gem/i915_gem_ioctls.h"
> +#include "gem/i915_gem_lmem.h"
>  #include "gem/i915_gem_region.h"
>  
>  #include "i915_drv.h"
>  #include "i915_trace.h"
>  #include "i915_user_extensions.h"
>  
> +static u32 object_max_page_size(struct drm_i915_gem_object *obj)
> +{
> +	u32 max_page_size = 0;
> +	int i;
> +
> +	for (i = 0; i < obj->mm.n_placements; i++) {
> +		struct intel_memory_region *mr = obj->mm.placements[i];
> +
> +		GEM_BUG_ON(!is_power_of_2(mr->min_page_size));
> +		max_page_size = max_t(u32, max_page_size, mr->min_page_size);
> +	}
> +
> +	GEM_BUG_ON(!max_page_size);
> +	return max_page_size;
> +}
> +
> +static void object_set_placements(struct drm_i915_gem_object *obj,
> +				  struct intel_memory_region **placements,
> +				  unsigned int n_placements)
> +{
> +	GEM_BUG_ON(!n_placements);
> +
> +	if (n_placements == 1) {
> +		struct intel_memory_region *mr = placements[0];
> +		struct drm_i915_private *i915 = mr->i915;
> +
> +		obj->mm.placements = &i915->mm.regions[mr->id];
> +		obj->mm.n_placements = 1;
> +	} else {
> +		obj->mm.placements = placements;
> +		obj->mm.n_placements = n_placements;
> +	}
> +}
> +

I found this helper function rather odd looking at first.  In the
general case, it simply sets fields based on the parameters...but in
the n == 1 case, it goes and uses something else as the array.

On further inspection, this makes sense: normally, we have an array
of multiple placements in priority order.  That array is (essentially)
malloc'd.  But if there's only 1 item, having a malloc'd array of 1
thing is pretty silly.  We can just point at it directly.  Which means
the callers can kfree the array, and the object destructor should not.

Maybe a comment saying

   /* 
    * For the common case of one memory region, skip storing an
    * allocated array and just point at the region directly.
    */

would be helpful?

--nextPart3923341.ekzWyWCOrY
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part.
Content-Transfer-Encoding: 7Bit

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEE6OtbNAgc4e6ibv4ZW1vaBx1JzDgFAmCJmyMACgkQW1vaBx1J
zDh6vQ//T82IVQ+sBnzPdBGTPBuvs1Bwy4gFkRW7+pebcAIZOA2J3aw41Yyo7qT1
YwVElEoiO8nTEoDTMLetQx//SSYftdXSU6AvicX1xF+6YKu2P1bu/cU53+Dcfm69
5qxUQ3Eme0Rw1szuKM0XQoMLhj6jPsSNOu0njrng+R/iVv/A2QJKzE3TiEwUkdzY
lRTT9tjarGxuw8sx9B36QetwFsxHlkXbbrutxcP6yPO/GBzkXxcIkuAqJCvRX44V
gBr/IMNA8HG4ZASxCsb/trl32fK9nGOR40buHb71ynrqVljpxsMoDp0/c3VXmLyJ
6GLNQaF1p49pftW64TmSBxVQJxDxNrC9v71E/BXICSHJw2Fze8mTdUelDU+m43WX
gbFQQ50xoHIM5mSS3lKZNyadDjRT3PpF8WbAoLKT/d6gWmDo9LIjDPZYgRQXkzHP
sk6rHuc3TYAMVJJHSOFfYRCHQXNqHnkpYGzmci30l3u6MIwoVylNlXtZwOXIkCKG
9rvH1lP1GHs1Gq4oq7zi31glejCeIrGiwSMju4QamP4y6Xbu1Ll83jMyPPw/TOHs
xjYm1GeUH3fLhIl1jCU1U+nmcXmTNrQVP14RDs85eaar+Dim6gX+2uupKH5obdhW
kX/csN0Vwwls6dpIF/D8HhFPs92nwM9VDvO2XpxOVe+fm5qd97g=
=nDg0
-----END PGP SIGNATURE-----

--nextPart3923341.ekzWyWCOrY--




--===============0748599179==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel

--===============0748599179==--



