Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C307A36E49F
	for <lists+dri-devel@lfdr.de>; Thu, 29 Apr 2021 07:51:12 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 690856EC7A;
	Thu, 29 Apr 2021 05:51:10 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
X-Greylist: delayed 375 seconds by postgrey-1.36 at gabe;
 Wed, 28 Apr 2021 17:36:47 UTC
Received: from smtp120.iad3b.emailsrvr.com (smtp120.iad3b.emailsrvr.com
 [146.20.161.120])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B0CC76EC0D
 for <dri-devel@lists.freedesktop.org>; Wed, 28 Apr 2021 17:36:47 +0000 (UTC)
X-Auth-ID: kenneth@whitecape.org
Received: by smtp24.relay.iad3b.emailsrvr.com (Authenticated sender:
 kenneth-AT-whitecape.org) with ESMTPSA id AAE0D401F6; 
 Wed, 28 Apr 2021 13:30:29 -0400 (EDT)
From: Kenneth Graunke <kenneth@whitecape.org>
To: intel-gfx@lists.freedesktop.org, Matthew Auld <matthew.auld@intel.com>
Subject: Re: [PATCH 1/9] drm/doc/rfc: i915 DG1 uAPI
Date: Wed, 28 Apr 2021 10:30:28 -0700
Message-ID: <23513095.4OMeIDWhAa@mizzik>
In-Reply-To: <20210426093901.28937-1-matthew.auld@intel.com>
References: <20210426093901.28937-1-matthew.auld@intel.com>
MIME-Version: 1.0
X-Classification-ID: bf419c33-bc3d-4679-92d2-831103a60b42-1-1
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
 Thomas =?ISO-8859-1?Q?Hellstr=F6m?= <thomas.hellstrom@linux.intel.com>,
 Dave Airlie <airlied@redhat.com>, Jordan Justen <jordan.l.justen@intel.com>,
 dri-devel@lists.freedesktop.org, Daniel Vetter <daniel.vetter@ffwll.ch>,
 Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>,
 Jon Bloomfield <jon.bloomfield@intel.com>,
 Jason Ekstrand <jason@jlekstrand.net>, mesa-dev@lists.freedesktop.org,
 Daniel Vetter <daniel.vetter@intel.com>
Content-Type: multipart/mixed; boundary="===============0085317879=="
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

--===============0085317879==
Content-Type: multipart/signed; boundary="nextPart4801889.86a5JYxHxL"; micalg="pgp-sha256"; protocol="application/pgp-signature"

--nextPart4801889.86a5JYxHxL
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="iso-8859-1"; protected-headers="v1"
From: Kenneth Graunke <kenneth@whitecape.org>
To: intel-gfx@lists.freedesktop.org, Matthew Auld <matthew.auld@intel.com>
Cc: Joonas Lahtinen <joonas.lahtinen@linux.intel.com>, Thomas =?ISO-8859-1?Q?Hellstr=F6m?= <thomas.hellstrom@linux.intel.com>, Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>, Lionel Landwerlin <lionel.g.landwerlin@linux.intel.com>, Jon Bloomfield <jon.bloomfield@intel.com>, Jordan Justen <jordan.l.justen@intel.com>, Daniel Vetter <daniel.vetter@intel.com>, Jason Ekstrand <jason@jlekstrand.net>, Dave Airlie <airlied@gmail.com>, dri-devel@lists.freedesktop.org, mesa-dev@lists.freedesktop.org, Daniel Vetter <daniel.vetter@ffwll.ch>, Dave Airlie <airlied@redhat.com>
Subject: Re: [PATCH 1/9] drm/doc/rfc: i915 DG1 uAPI
Date: Wed, 28 Apr 2021 10:30:28 -0700
Message-ID: <23513095.4OMeIDWhAa@mizzik>
In-Reply-To: <20210426093901.28937-1-matthew.auld@intel.com>
References: <20210426093901.28937-1-matthew.auld@intel.com>

On Monday, April 26, 2021 2:38:53 AM PDT Matthew Auld wrote:
> Add an entry for the new uAPI needed for DG1. Also add the overall
> upstream plan, including some notes for the TTM conversion.
>=20
> v2(Daniel):
>   - include the overall upstreaming plan
>   - add a note for mmap, there are differences here for TTM vs i915
>   - bunch of other suggestions from Daniel
> v3:
>  (Daniel)
>   - add a note for set/get caching stuff
>   - add some more docs for existing query and extensions stuff
>   - add an actual code example for regions query
>   - bunch of other stuff
>  (Jason)
>   - uAPI change(!):
> 	- try a simpler design with the placements extension
> 	- rather than have a generic setparam which can cover multiple
> 	  use cases, have each extension be responsible for one thing
> 	  only
> v4:
>  (Daniel)
>   - add some more notes for ttm conversion
>   - bunch of other stuff
>  (Jason)
>   - uAPI change(!):
> 	- drop all the extra rsvd members for the region_query and
> 	  region_info, just keep the bare minimum needed for padding
>=20
> Signed-off-by: Matthew Auld <matthew.auld@intel.com>
> Cc: Joonas Lahtinen <joonas.lahtinen@linux.intel.com>
> Cc: Thomas Hellstr=F6m <thomas.hellstrom@linux.intel.com>
> Cc: Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>
> Cc: Lionel Landwerlin <lionel.g.landwerlin@linux.intel.com>
> Cc: Jon Bloomfield <jon.bloomfield@intel.com>
> Cc: Jordan Justen <jordan.l.justen@intel.com>
> Cc: Daniel Vetter <daniel.vetter@intel.com>
> Cc: Kenneth Graunke <kenneth@whitecape.org>
> Cc: Jason Ekstrand <jason@jlekstrand.net>
> Cc: Dave Airlie <airlied@gmail.com>
> Cc: dri-devel@lists.freedesktop.org
> Cc: mesa-dev@lists.freedesktop.org
> Acked-by: Daniel Vetter <daniel.vetter@ffwll.ch>
> Acked-by: Dave Airlie <airlied@redhat.com>
> ---
>  Documentation/gpu/rfc/i915_gem_lmem.h   | 212 ++++++++++++++++++++++++
>  Documentation/gpu/rfc/i915_gem_lmem.rst | 130 +++++++++++++++
>  Documentation/gpu/rfc/index.rst         |   4 +
>  3 files changed, 346 insertions(+)
>  create mode 100644 Documentation/gpu/rfc/i915_gem_lmem.h
>  create mode 100644 Documentation/gpu/rfc/i915_gem_lmem.rst

With or without any of my suggestions,

Patch 7 is:

Acked-by: Kenneth Graunke <kenneth@whitecape.org>

The rest of the series (1-6, 8-9) are:

Reviewed-by: Kenneth Graunke <kenneth@whitecape.org>

--nextPart4801889.86a5JYxHxL
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part.
Content-Transfer-Encoding: 7Bit

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEE6OtbNAgc4e6ibv4ZW1vaBx1JzDgFAmCJm7QACgkQW1vaBx1J
zDi3RQ//YbVI4K7jkE3PLo2zIW5cp6UX/uDo1vQUa9Nggd37O96IdYKfzdbeT0Dt
MNsD45taj57PYvSpAl8hFXHXhlYlz2Lx05LyMw7m3ixENiNzY5Tq5cCFJg1gXYtK
+DOk58Xgh+WErk464FzQT3h/qb5TKzfFX0pnehla6lxfnUXLGoWwh4jvgyg43oyL
qnT98ds2gD9/Fi0Y9f+Kec5+cN21rTOtvynmiYxMA9GsFCAUDQ1CKRTKRezilNEA
ygcDvEV+S0EBIjXbq8lm81lgdtLtPrGgkVqdhvlIQOjU5t2MvWUKdBli439GXokZ
f+U2a/GxYls4DlbsiMXVeOqPQ6Wy2uIIhtFiY3Y+bQFlwI7+de8qI5aQzVZ6MYsu
6G49ldHK/F3nigKk2GGFvQFuw/k5HoXdSs5SEWmoptz1iPEPj6UaJFa/ho4RzKGq
wyawmzTrZilwo+WCwZbtbg2rkydtbFQPDWlt64kiXYX/xR8gDZIL2tV9jZchh1mi
4eq9E+OESH92NtJimCHZTOXrAJfFOz4ud1n34nIPU3YEG1uvxZlya89ZEOtnPYC7
nKonqygDsVQgjLdR3maA4YL+I5TSFu3PhxdLXp2/uYI9L3lwo2hqpVD9P6T0gl4/
KKwA6miu5kjCPXllPJgmOb/ofve7e2PYcLTcFLqKJzvTR6pOV2o=
=AJfu
-----END PGP SIGNATURE-----

--nextPart4801889.86a5JYxHxL--




--===============0085317879==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel

--===============0085317879==--



