Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 98DF8D1D5F
	for <lists+dri-devel@lfdr.de>; Thu, 10 Oct 2019 02:23:00 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B83F76EA75;
	Thu, 10 Oct 2019 00:22:57 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from ozlabs.org (bilbo.ozlabs.org [203.11.71.1])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 42A896EA74;
 Thu, 10 Oct 2019 00:22:56 +0000 (UTC)
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest
 SHA256) (No client certificate requested)
 by mail.ozlabs.org (Postfix) with ESMTPSA id 46pWy251BKz9s7T;
 Thu, 10 Oct 2019 11:22:49 +1100 (AEDT)
Date: Thu, 10 Oct 2019 11:22:49 +1100
From: Stephen Rothwell <sfr@canb.auug.org.au>
To: Dave Airlie <airlied@linux.ie>, Daniel Vetter <daniel.vetter@ffwll.ch>,
 Jani Nikula <jani.nikula@linux.intel.com>, Joonas Lahtinen
 <joonas.lahtinen@linux.intel.com>, Rodrigo Vivi <rodrigo.vivi@intel.com>,
 Intel Graphics <intel-gfx@lists.freedesktop.org>, DRI
 <dri-devel@lists.freedesktop.org>
Subject: linux-next: build failure after merge of the drm tree
Message-ID: <20191010112249.720989aa@canb.auug.org.au>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=canb.auug.org.au; s=201702; t=1570666973;
 bh=7+fjtYqa172Ftzt3UBW5VOoZd1S9i31z/HZVdVxdAZ0=;
 h=Date:From:To:Cc:Subject:From;
 b=EhPM9H9Cwzep0HCSliuIfx+P2uR+uy6coKqispWQSTVxbJW5kvWl81W0ZL5R19dT4
 TLfMrbeITvv0MkitjTxaA/tb+y2u59dmaZ/eRaa3rdZ6ODWDrH9jq9Eu2WpXFYfPXO
 Pet0clnSfsaiLvL0Calao53LlLEffJeLTny6B69ZbWb2rO6hTw7JEOJnHQYM092iFL
 NggyZaab0LLrn/6Y0688JJBf3MlBMcHXz+uN1DcQCZ2Ii3+QoDhqGOGRRP6IOqezxy
 U//FxX5Z+0N7hC219Z5py2S2/AoaGbxukj23BDrv1RiwKJFhb1ebdOAN59w/pb5xjQ
 hECYVDcP6oLwQ==
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
Cc: Linux Next Mailing List <linux-next@vger.kernel.org>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
Content-Type: multipart/mixed; boundary="===============1772483716=="
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

--===============1772483716==
Content-Type: multipart/signed; boundary="Sig_/lIT/TpjrrNf6nF9Pwa/PMRX";
 protocol="application/pgp-signature"; micalg=pgp-sha256

--Sig_/lIT/TpjrrNf6nF9Pwa/PMRX
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

After merging the drm tree, today's linux-next build (x86_64 allmodconfig)
failed like this:

In file included from drivers/gpu/drm/i915/i915_vma.h:35,
                 from drivers/gpu/drm/i915/gt/uc/intel_guc.h:17,
                 from drivers/gpu/drm/i915/gt/uc/intel_uc.h:9,
                 from drivers/gpu/drm/i915/gt/intel_gt_types.h:16,
                 from drivers/gpu/drm/i915/i915_drv.h:81,
                 from drivers/gpu/drm/i915/i915_getparam.c:7:
drivers/gpu/drm/i915/gem/i915_gem_object.h:174:1: error: redefinition of 'i=
915_gem_object_never_bind_ggtt'
  174 | i915_gem_object_never_bind_ggtt(const struct drm_i915_gem_object *o=
bj)
      | ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
drivers/gpu/drm/i915/gem/i915_gem_object.h:168:1: note: previous definition=
 of 'i915_gem_object_never_bind_ggtt' was here
  168 | i915_gem_object_never_bind_ggtt(const struct drm_i915_gem_object *o=
bj)
      | ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

Caused by the automatic merge of commit

  3a1fea6d2353 ("drm/i915/userptr: Never allow userptr into the mappable GG=
TT")

from the drm-intel-fixes tree and commits

  a4311745bba9 ("drm/i915/userptr: Never allow userptr into the mappable GG=
TT")
  3cbad5d77749 ("drm/i915/gem: Refactor tests on obj->ops->flags")

from the drm tree.

I fixed it up by removing the extra definition.  This sort of thing will
keep happening as longs as bugs are fixed in your development trees
and then cherry-picked back into your -fixes trees.  This practise also
causes quite a few unnecessary conflicts that each have to be checked
and merged by hand.

--=20
Cheers,
Stephen Rothwell

--Sig_/lIT/TpjrrNf6nF9Pwa/PMRX
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAl2eedkACgkQAVBC80lX
0GyOYgf/f4qvlGy3OVWVxHDAOJjjxnAAWRG3u5oxfmagSZsi3NjqV9aGPzQXJk0P
YoPfZv35qqfSSTB3Ao9XTUbij2nI5/76mq7oPp/0/43MLyeun+/pPQlyZ4sPp7qi
eddvMCPvRfF6PjH2R12zeopTsT6HtXp5Gfo2E+tLxGrxjWEKQbq8HZFsZEnN3sZx
T88Nu7zJ4grx8043pf8ZqVAMTQmKkaNHtZC33ZPNKsiFSt2UzyNxiD8ukKnkm1st
6iVAcfe3Mw/ZVWIQHt2z8KWMPrBzhZo7LXoJtD2bem1LlP0bLC9E4WmQWIjzvWcu
IfMKQdFmfnpWffH5pe/C5OPucH10ng==
=3MwN
-----END PGP SIGNATURE-----

--Sig_/lIT/TpjrrNf6nF9Pwa/PMRX--

--===============1772483716==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVs
IG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlz
dHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVs

--===============1772483716==--
