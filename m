Return-Path: <dri-devel-bounces@lists.freedesktop.org>
Delivered-To: lists+dri-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 6EQDFsmzc2liyAAAu9opvQ
	(envelope-from <dri-devel-bounces@lists.freedesktop.org>)
	for <lists+dri-devel@lfdr.de>; Fri, 23 Jan 2026 18:45:45 +0100
X-Original-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A0E2D792A8
	for <lists+dri-devel@lfdr.de>; Fri, 23 Jan 2026 18:45:44 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0C17310E2D6;
	Fri, 23 Jan 2026 17:45:42 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="aiwJBok4";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from tor.source.kernel.org (tor.source.kernel.org [172.105.4.254])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 54A4B10E2D6
 for <dri-devel@lists.freedesktop.org>; Fri, 23 Jan 2026 17:45:41 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by tor.source.kernel.org (Postfix) with ESMTP id 6376260147;
 Fri, 23 Jan 2026 17:45:40 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E4ED8C4CEF1;
 Fri, 23 Jan 2026 17:45:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1769190340;
 bh=On5W4DpasCDZqy0SIpDx69gtPIvdnD3pmryfp09bKPg=;
 h=Date:From:To:Cc:Subject:From;
 b=aiwJBok4Dt5ZV0cMTWceCmYjAw8lFwmn+gVqMUMpizTAW+AiB2R2NS0IagmbdIr8s
 +3ttDY/oD5IHDVaaa7EwP6LRWMO4tLEYYwi2D/zXu9iBUAJ3X7yWEIPkzrYIsbjIzO
 OdZzEnNMXtVS88t8g9Qri4LdSvPO6U4dncACZP07ZYfZwaiPC4yXwfAeSBukm1HbUf
 y+VuD09X/y7CVuzufadfXZNDhE1BlkBw8x0h8Zut+Y1uG36U9WOMgVzGYS6yviGDqD
 Iu/SVFeHyAqsHo/4Nw1htTicX/Y9yqm7fkfiQUl23B8tODpLGrQqr72a0SK1kxsNmk
 Eu6AzKChhjQRQ==
Date: Fri, 23 Jan 2026 17:45:36 +0000
From: Mark Brown <broonie@kernel.org>
To: Dave Airlie <airlied@redhat.com>, DRI <dri-devel@lists.freedesktop.org>
Cc: Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 Linux Next Mailing List <linux-next@vger.kernel.org>,
 Thomas =?iso-8859-1?Q?Hellstr=F6m?= <thomas.hellstrom@linux.intel.com>
Subject: linux-next: manual merge of the drm tree with the drm-fixes tree
Message-ID: <aXOzwL50DYVm570X@sirena.org.uk>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
 protocol="application/pgp-signature"; boundary="t7Mo67/N8DZDOQvB"
Content-Disposition: inline
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
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-3.41 / 15.00];
	SIGNED_PGP(-2.00)[];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	MAILLIST(-0.20)[mailman];
	R_SPF_ALLOW(-0.20)[+ip4:131.252.210.177:c];
	MIME_GOOD(-0.20)[multipart/signed,text/plain];
	RWL_MAILSPIKE_GOOD(-0.10)[131.252.210.177:from];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_COUNT_THREE(0.00)[4];
	FORGED_RECIPIENTS(0.00)[m:airlied@redhat.com,m:linux-kernel@vger.kernel.org,m:linux-next@vger.kernel.org,m:thomas.hellstrom@linux.intel.com,s:lists@lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	ARC_NA(0.00)[];
	TO_DN_ALL(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_SENDER(0.00)[broonie@kernel.org,dri-devel-bounces@lists.freedesktop.org];
	MIME_TRACE(0.00)[0:+,1:+,2:~];
	FORWARDED(0.00)[dri-devel@lists.freedesktop.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCPT_COUNT_FIVE(0.00)[5];
	PREVIOUSLY_DELIVERED(0.00)[dri-devel@lists.freedesktop.org];
	NEURAL_HAM(-0.00)[-0.641];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[broonie@kernel.org,dri-devel-bounces@lists.freedesktop.org];
	DKIM_TRACE(0.00)[kernel.org:+];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[dri-devel];
	MISSING_XM_UA(0.00)[];
	ASN(0.00)[asn:6366, ipnet:131.252.0.0/16, country:US];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sirena.org.uk:mid,gabe.freedesktop.org:helo,gabe.freedesktop.org:rdns]
X-Rspamd-Queue-Id: A0E2D792A8
X-Rspamd-Action: no action


--t7Mo67/N8DZDOQvB
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi all,

Today's linux-next merge of the drm tree got a conflict in:

  include/drm/drm_pagemap.h

between commits:

  754c232384386 ("drm/pagemap, drm/xe: Ensure that the devmem allocation is=
 idle before use")
  bdcdf968be314 ("drm, drm/xe: Fix xe userptr in the absence of CONFIG_DEVI=
CE_PRIVATE")

=66rom the drm-fixes tree and commits:

  a599b98607dec ("drm/pagemap, drm/xe: Add refcounting to struct drm_pagema=
p")
  75af93b3f5d0a ("drm/pagemap, drm/xe: Support destination migration over i=
nterconnect")
  77f14f2f2d73f ("drm/pagemap: Add a drm_pagemap cache and shrinker")

=66rom the drm tree.

I fixed it up (see below) and can carry the fix as necessary. This
is now fixed as far as linux-next is concerned, but any non trivial
conflicts should be mentioned to your upstream maintainer when your tree
is submitted for merging.  You may also want to consider cooperating
with the maintainer of the conflicting tree to minimise any particularly
complex conflicts.

diff --cc include/drm/drm_pagemap.h
index eb29e5309f0ab,46e9c58f09e01..0000000000000
--- a/include/drm/drm_pagemap.h
+++ b/include/drm/drm_pagemap.h
@@@ -209,19 -243,56 +243,69 @@@ struct drm_pagemap_devmem_ops=20
  			   struct dma_fence *pre_migrate_fence);
  };
 =20
 +#if IS_ENABLED(CONFIG_ZONE_DEVICE)
 +
 +struct drm_pagemap *drm_pagemap_page_to_dpagemap(struct page *page);
 +
 +#else
 +
 +static inline struct drm_pagemap *drm_pagemap_page_to_dpagemap(struct pag=
e *page)
 +{
 +	return NULL;
 +}
 +
 +#endif /* IS_ENABLED(CONFIG_ZONE_DEVICE) */
 +
+ int drm_pagemap_init(struct drm_pagemap *dpagemap,
+ 		     struct dev_pagemap *pagemap,
+ 		     struct drm_device *drm,
+ 		     const struct drm_pagemap_ops *ops);
+=20
+ struct drm_pagemap *drm_pagemap_create(struct drm_device *drm,
+ 				       struct dev_pagemap *pagemap,
+ 				       const struct drm_pagemap_ops *ops);
+=20
+ #if IS_ENABLED(CONFIG_DRM_GPUSVM)
+=20
+ void drm_pagemap_put(struct drm_pagemap *dpagemap);
+=20
+ #else
+=20
+ static inline void drm_pagemap_put(struct drm_pagemap *dpagemap)
+ {
+ }
+=20
+ #endif /* IS_ENABLED(CONFIG_DRM_GPUSVM) */
+=20
+ /**
+  * drm_pagemap_get() - Obtain a reference on a struct drm_pagemap
+  * @dpagemap: Pointer to the struct drm_pagemap, or NULL.
+  *
+  * Return: Pointer to the struct drm_pagemap, or NULL.
+  */
+ static inline struct drm_pagemap *
+ drm_pagemap_get(struct drm_pagemap *dpagemap)
+ {
+ 	if (likely(dpagemap))
+ 		kref_get(&dpagemap->ref);
+=20
+ 	return dpagemap;
+ }
+=20
+ /**
+  * drm_pagemap_get_unless_zero() - Obtain a reference on a struct drm_pag=
emap
+  * unless the current reference count is zero.
+  * @dpagemap: Pointer to the drm_pagemap or NULL.
+  *
+  * Return: A pointer to @dpagemap if the reference count was successfully
+  * incremented. NULL if @dpagemap was NULL, or its refcount was 0.
+  */
+ static inline struct drm_pagemap * __must_check
+ drm_pagemap_get_unless_zero(struct drm_pagemap *dpagemap)
+ {
+ 	return (dpagemap && kref_get_unless_zero(&dpagemap->ref)) ? dpagemap : N=
ULL;
+ }
+=20
  /**
   * struct drm_pagemap_devmem - Structure representing a GPU SVM device me=
mory allocation
   *
@@@ -246,8 -317,23 +330,25 @@@ struct drm_pagemap_devmem=20
  	struct dma_fence *pre_migrate_fence;
  };
 =20
+ /**
+  * struct drm_pagemap_migrate_details - Details to govern migration.
+  * @timeslice_ms: The time requested for the migrated pagemap pages to
+  * be present in @mm before being allowed to be migrated back.
+  * @can_migrate_same_pagemap: Whether the copy function as indicated by
+  * the @source_peer_migrates flag, can migrate device pages within a
+  * single drm_pagemap.
+  * @source_peer_migrates: Whether on p2p migration, The source drm_pagemap
+  * should use the copy_to_ram() callback rather than the destination
+  * drm_pagemap should use the copy_to_devmem() callback.
+  */
+ struct drm_pagemap_migrate_details {
+ 	unsigned long timeslice_ms;
+ 	u32 can_migrate_same_pagemap : 1;
+ 	u32 source_peer_migrates : 1;
+ };
+=20
 +#if IS_ENABLED(CONFIG_ZONE_DEVICE)
 +
  int drm_pagemap_migrate_to_devmem(struct drm_pagemap_devmem *devmem_alloc=
ation,
  				  struct mm_struct *mm,
  				  unsigned long start, unsigned long end,
@@@ -269,6 -356,7 +369,10 @@@ int drm_pagemap_populate_mm(struct drm_
  			    struct mm_struct *mm,
  			    unsigned long timeslice_ms);
 =20
 +#endif /* IS_ENABLED(CONFIG_ZONE_DEVICE) */
 +
+ void drm_pagemap_destroy(struct drm_pagemap *dpagemap, bool is_atomic_or_=
reclaim);
+=20
+ int drm_pagemap_reinit(struct drm_pagemap *dpagemap);
++
  #endif

--t7Mo67/N8DZDOQvB
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmlzs78ACgkQJNaLcl1U
h9DgFwf/VYWqILaSRQFpmD336OmNc9V1ARzwvyBLXNiGytt9cobc+dKCsHi8Rm0/
zIKLYcFSdgU2FPkPBWpJQDNcNaFhQyS+gJhIlw+XecMeQTpchlsgHTsPe3Rrfbc/
ilnEdjx6Fz/Sogf0ck8m3ZPbyTywTR/lGvPYfZSBn8l2GG8xxeRDcacj72slymKC
1gAvJohLItWvN0C+ymQqV10PQGv2mSG04SFtWm+Lv6ySyQGFmpIhpdCWHiGlx6Vr
bBCRGI6BYCHMpcpROn4ArD4b4byWWVP/bwWie22bol88o2tYUf7X6pE0WifZCmrn
rlbfEi4CH5SC9OZwaN/PVUSkPuO13A==
=PhOR
-----END PGP SIGNATURE-----

--t7Mo67/N8DZDOQvB--
