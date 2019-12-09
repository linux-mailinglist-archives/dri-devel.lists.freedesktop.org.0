Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 17B3911798C
	for <lists+dri-devel@lfdr.de>; Mon,  9 Dec 2019 23:40:19 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B01786E575;
	Mon,  9 Dec 2019 22:40:15 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from ozlabs.org (bilbo.ozlabs.org [203.11.71.1])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F0A3E6E575
 for <dri-devel@lists.freedesktop.org>; Mon,  9 Dec 2019 22:40:14 +0000 (UTC)
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest
 SHA256) (No client certificate requested)
 by mail.ozlabs.org (Postfix) with ESMTPSA id 47WynQ44pkz9sP3;
 Tue, 10 Dec 2019 09:40:09 +1100 (AEDT)
Date: Tue, 10 Dec 2019 09:39:57 +1100
From: Stephen Rothwell <sfr@canb.auug.org.au>
To: Daniel Vetter <daniel.vetter@ffwll.ch>, Jani Nikula
 <jani.nikula@linux.intel.com>, Joonas Lahtinen
 <joonas.lahtinen@linux.intel.com>, Rodrigo Vivi <rodrigo.vivi@intel.com>,
 Intel Graphics <intel-gfx@lists.freedesktop.org>, DRI
 <dri-devel@lists.freedesktop.org>
Subject: linux-next: build failure after merge of the drm-intel tree
Message-ID: <20191210093957.5120f717@canb.auug.org.au>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=canb.auug.org.au; s=201702; t=1575931211;
 bh=xaSCsYIoLdbzF/sfZe8codPTTC7A2ZfwROYPO4I7q5A=;
 h=Date:From:To:Cc:Subject:From;
 b=Jv1OIDoTtqvkK0ol86sbY30Po7yJ8IEWSa5/4vEou4tBOlNtlWGBTzD7Ej2zEk8Eq
 0lzcaWeCGNBWLpmDD4HyPpkEt1B4CxWZZ+fGYeXeGXdKLr5tvzVs1yJWOwComVOjJu
 /zKpr0H+KgQTrtAM724vgNg/R4Vy3RY3aQAQ8iEhtjBQMsL9Gl+MiYgTzC8HGgtEUN
 2qF+3upaiaDuRKpDVrg6YlEFonT0kGGeLi2QIKnK1h9o82bVAob7ryptqNstNMTwa0
 BN3YL9zkvXi2uUOObBdwu7ecQkEMV7wl2DteSpb2Y+Zw6VyT6TNLlFJYt/AWexxgFp
 VPShxC0RPZ1pA==
X-BeenThere: dri-devel@lists.freedesktop.org
X-Mailman-Version: 2.1.23
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
Cc: Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
	S@freedesktop.org,
	Linux Next Mailing List <linux-next@vger.kernel.org>,
	Qian Cai <cai@lca.pw>, Ingo Molnar <mingo@kernel.org>
Content-Type: multipart/mixed; boundary="===============1635831426=="
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

--===============1635831426==
Content-Type: multipart/signed; boundary="Sig_/tJr8VZx+xkUy1CKFjl_+NyY";
 protocol="application/pgp-signature"; micalg=pgp-sha256

--Sig_/tJr8VZx+xkUy1CKFjl_+NyY
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

After merging the drm-intel tree, today's linux-next build (x86_64
allmodconfig) failed like this:

In file included from include/linux/spinlock_types.h:18,
                 from include/linux/mutex.h:16,
                 from include/linux/kernfs.h:12,
                 from include/linux/sysfs.h:16,
                 from include/linux/kobject.h:20,
                 from include/linux/of.h:17,
                 from include/linux/irqdomain.h:35,
                 from include/linux/acpi.h:13,
                 from drivers/gpu/drm/i915/i915_drv.c:30:
drivers/gpu/drm/i915/gem/i915_gem_object.h: In function 'i915_gem_object_pi=
n_pages':
include/linux/lockdep.h:635:2: error: too many arguments to function 'lock_=
release'
  635 |  lock_release(&(lock)->dep_map, 0, _THIS_IP_);  \
      |  ^~~~~~~~~~~~
drivers/gpu/drm/i915/gem/i915_gem_object.h:294:2: note: in expansion of mac=
ro 'might_lock_nested'
  294 |  might_lock_nested(&obj->mm.lock, I915_MM_GET_PAGES);
      |  ^~~~~~~~~~~~~~~~~
include/linux/lockdep.h:352:13: note: declared here
  352 | extern void lock_release(struct lockdep_map *lock, unsigned long ip=
);
      |             ^~~~~~~~~~~~
In file included from include/linux/spinlock_types.h:18,
                 from include/linux/spinlock.h:83,
                 from include/linux/mmzone.h:8,
                 from include/linux/gfp.h:6,
                 from include/linux/slab.h:15,
                 from drivers/gpu/drm/i915/i915_irq.c:32:
drivers/gpu/drm/i915/gem/i915_gem_object.h: In function 'i915_gem_object_pi=
n_pages':
include/linux/lockdep.h:635:2: error: too many arguments to function 'lock_=
release'
  635 |  lock_release(&(lock)->dep_map, 0, _THIS_IP_);  \
      |  ^~~~~~~~~~~~
drivers/gpu/drm/i915/gem/i915_gem_object.h:294:2: note: in expansion of mac=
ro 'might_lock_nested'
  294 |  might_lock_nested(&obj->mm.lock, I915_MM_GET_PAGES);
      |  ^~~~~~~~~~~~~~~~~
include/linux/lockdep.h:352:13: note: declared here
  352 | extern void lock_release(struct lockdep_map *lock, unsigned long ip=
);
      |             ^~~~~~~~~~~~

Caused by commit

  e692b4021a2e ("lockdep: add might_lock_nested()")

interacting with commit

  5facae4f3549 ("locking/lockdep: Remove unused @nested argument from lock_=
release()")

from Linus' tree.

I have applied the following merge fix patch for today:

From: Stephen Rothwell <sfr@canb.auug.org.au>
Date: Tue, 10 Dec 2019 09:37:07 +1100
Subject: [PATCH] lockdep: fix up for lock_release API change

---
 include/linux/lockdep.h | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/include/linux/lockdep.h b/include/linux/lockdep.h
index 5bbfd5866081..664f52c6dd4c 100644
--- a/include/linux/lockdep.h
+++ b/include/linux/lockdep.h
@@ -632,7 +632,7 @@ do {									\
 	typecheck(struct lockdep_map *, &(lock)->dep_map);		\
 	lock_acquire(&(lock)->dep_map, subclass, 0, 1, 1, NULL,		\
 		     _THIS_IP_);					\
-	lock_release(&(lock)->dep_map, 0, _THIS_IP_);		\
+	lock_release(&(lock)->dep_map, _THIS_IP_);			\
 } while (0)
=20
 #define lockdep_assert_irqs_enabled()	do {				\
--=20
2.24.0

--=20
Cheers,
Stephen Rothwell

--Sig_/tJr8VZx+xkUy1CKFjl_+NyY
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAl3uzT0ACgkQAVBC80lX
0GxfjQf9FkuEQVzH4uB6UtQEvnm5ebHcOeJhYFUNr/U1AFMJ+7kOJ2J3Xbj4FBkB
xQenFH3Vdix8oeUaaSu4Q6MPAAEH83x3fR3mzRUu46YRhuiPeXu7Jb9oFAb4vaae
wMEO7Ar+LopIFFWByHbGjFyv564gisfuVO7cTsZhr02n/rOx5GiniIYHtr+vEIAe
00VkBnU50XsaoJHuSJ0Y+EDipY4jEaRgTHR99tDdQyuJOM2nDE+0OjjR4gNAg+qA
nMoTnczOPrbnKG3189cDnEyZ4jr0x+EyWkngXpqgVhTuKH2Iy9QeV1JVMA+7xD52
v1gCOZFIbboOrIYqPKGI/ATa9ZSNnQ==
=SDEv
-----END PGP SIGNATURE-----

--Sig_/tJr8VZx+xkUy1CKFjl_+NyY--

--===============1635831426==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVs
IG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlz
dHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVs

--===============1635831426==--
