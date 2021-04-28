Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 99B0A36E49A
	for <lists+dri-devel@lfdr.de>; Thu, 29 Apr 2021 07:49:53 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3CA3C6EC72;
	Thu, 29 Apr 2021 05:49:50 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
X-Greylist: delayed 331 seconds by postgrey-1.36 at gabe;
 Wed, 28 Apr 2021 15:21:42 UTC
Received: from smtp65.ord1c.emailsrvr.com (smtp65.ord1c.emailsrvr.com
 [108.166.43.65])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8C7936EBA6
 for <dri-devel@lists.freedesktop.org>; Wed, 28 Apr 2021 15:21:42 +0000 (UTC)
X-Auth-ID: kenneth@whitecape.org
Received: by smtp17.relay.ord1c.emailsrvr.com (Authenticated sender:
 kenneth-AT-whitecape.org) with ESMTPSA id B0EEC60242; 
 Wed, 28 Apr 2021 11:16:09 -0400 (EDT)
From: Kenneth Graunke <kenneth@whitecape.org>
To: intel-gfx@lists.freedesktop.org, Matthew Auld <matthew.auld@intel.com>
Subject: Re: [PATCH 1/9] drm/doc/rfc: i915 DG1 uAPI
Date: Wed, 28 Apr 2021 08:16:05 -0700
Message-ID: <4429978.s5xreEhoxC@mizzik>
In-Reply-To: <20210426093901.28937-1-matthew.auld@intel.com>
References: <20210426093901.28937-1-matthew.auld@intel.com>
MIME-Version: 1.0
X-Classification-ID: 1b6e87f8-8473-4d75-8b21-f26ea96611b3-1-1
X-Mailman-Approved-At: Thu, 29 Apr 2021 05:49:48 +0000
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
Content-Type: multipart/mixed; boundary="===============1302078835=="
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

--===============1302078835==
Content-Type: multipart/signed; boundary="nextPart7036856.UipX05xarL"; micalg="pgp-sha256"; protocol="application/pgp-signature"

--nextPart7036856.UipX05xarL
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"; protected-headers="v1"
From: Kenneth Graunke <kenneth@whitecape.org>
To: intel-gfx@lists.freedesktop.org, Matthew Auld <matthew.auld@intel.com>
Cc: Joonas Lahtinen <joonas.lahtinen@linux.intel.com>, Thomas =?ISO-8859-1?Q?Hellstr=F6m?= <thomas.hellstrom@linux.intel.com>, Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>, Lionel Landwerlin <lionel.g.landwerlin@linux.intel.com>, Jon Bloomfield <jon.bloomfield@intel.com>, Jordan Justen <jordan.l.justen@intel.com>, Daniel Vetter <daniel.vetter@intel.com>, Jason Ekstrand <jason@jlekstrand.net>, Dave Airlie <airlied@gmail.com>, dri-devel@lists.freedesktop.org, mesa-dev@lists.freedesktop.org, Daniel Vetter <daniel.vetter@ffwll.ch>, Dave Airlie <airlied@redhat.com>
Subject: Re: [PATCH 1/9] drm/doc/rfc: i915 DG1 uAPI
Date: Wed, 28 Apr 2021 08:16:05 -0700
Message-ID: <4429978.s5xreEhoxC@mizzik>
In-Reply-To: <20210426093901.28937-1-matthew.auld@intel.com>
References: <20210426093901.28937-1-matthew.auld@intel.com>

On Monday, April 26, 2021 2:38:53 AM PDT Matthew Auld wrote:
> +Existing uAPI issues
> +====================
> +Some potential issues we still need to resolve.
> +
> +I915 MMAP
> +---------
> +In i915 there are multiple ways to MMAP GEM object, including mapping the same
> +object using different mapping types(WC vs WB), i.e multiple active mmaps per
> +object. TTM expects one MMAP at most for the lifetime of the object. If it
> +turns out that we have to backpedal here, there might be some potential
> +userspace fallout.
> +
> +I915 SET/GET CACHING
> +--------------------
> +In i915 we have set/get_caching ioctl. TTM doesn't let us to change this, but
> +DG1 doesn't support non-snooped pcie transactions, so we can just always
> +allocate as WB for smem-only buffers.  If/when our hw gains support for
> +non-snooped pcie transactions then we must fix this mode at allocation time as
> +a new GEM extension.
> +
> +This is related to the mmap problem, because in general (meaning, when we're
> +not running on intel cpus) the cpu mmap must not, ever, be inconsistent with
> +allocation mode.
> +
> +Possible idea is to let the kernel picks the mmap mode for userspace from the
> +following table:
> +
> +smem-only: WB. Userspace does not need to call clflush.
> +
> +smem+lmem: We allocate uncached memory, and give userspace a WC mapping
> +for when the buffer is in smem, and WC when it's in lmem. GPU does snooped
> +access, which is a bit inefficient.

I think you meant to write something different here.  What I read was:

- If it's in SMEM, give them WC
- If it's in LMEM, give them WC

Presumably one of those should have been something else, since otherwise
you would have written "always WC" :)

> +
> +lmem only: always WC
> +
> +This means on discrete you only get a single mmap mode, all others must be
> +rejected. That's probably going to be a new default mode or something like
> +that.
> +
> +Links
> +=====
> +[1] https://patchwork.freedesktop.org/series/86798/
> +
> +[2] https://gitlab.freedesktop.org/mesa/mesa/-/merge_requests/5599#note_553791

--nextPart7036856.UipX05xarL
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part.
Content-Transfer-Encoding: 7Bit

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEE6OtbNAgc4e6ibv4ZW1vaBx1JzDgFAmCJfDUACgkQW1vaBx1J
zDgT4w/9ElB7IBqVSGbWFtpqNfaComfNbMPBISGCJtrhwju7VG89bJraurdSMPix
Jm3KqV5hW1cIsQWlRHmf3rY1efO9sMDoC4yPV8arjcUjY1XvJipWFvI9RP2PRw7J
ujBoN0XtegfTc3mdBBTo0TdTW5U0WkcEx1UdiVaFitioak1L+yQoFFnii32qIMdU
jSiJXJ7czB5+1ZYAjsnOParuN/3mXnq59enDv4uhNFD5rLFAUWnkQEEpAIBj21yw
sdYZ+QsGVUcmoN54MA3QX6D5EIRvhEM7zFq8FAM4lGSH2JcaDEpFBgiHIpPAi2g+
TlwhaOLXb96o/Gfz59k4lvsKKdi2g4j8+e3tx9lK/Y+9NP6XUEKofBxHPFhQSYnw
XM0ezMYuf8VTbeafxpb4rLMcjgqRGSurNBinuMsec5OATkErfQj/ajLIKi8SERK5
p2r8u0Y6M6vvz6D0asMfrXPzUXtMmBJY4UnefEUr1XMYfOuYCUEz4DICldwi2zpU
Fcq58l+ucbD3RrDQPZtEwzIz5s+cR6F7A10+ogM6wCyu5EIoJYHH2i5slAgPrrXB
qhh+PB+cSHGQ+y8NxJWQLvr1zvbvj34XXtYNZAEMkOf4aARga3YDfED22oedbj+R
R7kmXVUUROdQS5Bt30jrMdlbzDcEwh/rB6s1O6EDttDBw0uMy60=
=+RXI
-----END PGP SIGNATURE-----

--nextPart7036856.UipX05xarL--




--===============1302078835==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel

--===============1302078835==--



