Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 96F46946E50
	for <lists+dri-devel@lfdr.de>; Sun,  4 Aug 2024 12:43:41 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 728D110E077;
	Sun,  4 Aug 2024 10:43:36 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=fail reason="signature verification failed" (4096-bit key; unprotected) header.d=davidgow.net header.i=@davidgow.net header.b="RPovt8hv";
	dkim=fail reason="signature verification failed" (4096-bit key) header.d=davidgow.net header.i=@davidgow.net header.b="cC3lp0kU";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from sphereful.davidgow.net (sphereful.davidgow.net [203.29.242.92])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5B8A510E0DD;
 Sun,  4 Aug 2024 09:19:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=davidgow.net;
 s=201606; t=1722763154;
 bh=PEUXQAcLo0EsZ5sdEKiSD3qA6h0wU3l4S5Fvl64PCmk=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=RPovt8hvJ2vDw+LavVkyDHe8gXNEOdFYrN/3HsQIjCu7KoW9wkz1jsDuD8G8O/AGb
 WnuFIKKoKMNRHRJaAWMANx+Yh/IlCjRMBpfGxnyqQ2a7Ppd0PzDf8E4HkiVJR6xStA
 nIPlQVgeG9+ixogcQhCY194/DjC3oqi+IhH6MDbFy5t28+UklGBP9T5BLt+AsMC+TG
 IwoBVhDgOBBx3DLH/u7ZqkkcXeGGonYZ6o3PY0p7pjcqshokGB14vVspfU4gCh0mKn
 mpsswU3VxIBgTYnIm22DQlb0c3kPFjOj4GIlr2nGMYIMnWIhUfzHT/4/712qe4qv9j
 go6mZvyigCTmdTqn+VPh7oXCTjQFy/Vk9c9Bg2Xmq4Ev2Z8FraYW9b+1zZ4F95drXq
 pqFC44JUDoz32udp9a6Qv/7CgYlquGmqlKS6PCSUkzbtheMdNfs+WE3xaLH0+ZELDk
 uQkEctXOCEdUVp4hZixfnM6nJJC1WIw0gBuQxGbsHVVMnSKatO34TIlgtTFKmDXo6o
 w1s6leLHfccDTWftGF2ZHiqGk5UdEvBqp2NmQlqMz6b5cd63jq6xn4whM8Tg6El16w
 V/D9Fg0Kd889UKvfmbJIOOKBYGi1IPfrrlAvZ08BmbsOJxaPbSTfpjXHdgg+rliOy5
 +Jsict0bRleoPcGVpDQW3HuM=
Received: by sphereful.davidgow.net (Postfix, from userid 119)
 id 18BD81DC0A3; Sun,  4 Aug 2024 17:19:14 +0800 (AWST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
 sphereful.davidgow.net
X-Spam-Level: 
X-Spam-Status: No, score=-1.1 required=5.0 tests=ALL_TRUSTED,DKIM_SIGNED,
 DKIM_VALID,DKIM_VALID_AU autolearn=unavailable autolearn_force=no
 version=3.4.6
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=davidgow.net;
 s=201606; t=1722763150;
 bh=PEUXQAcLo0EsZ5sdEKiSD3qA6h0wU3l4S5Fvl64PCmk=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=cC3lp0kUAN/idgTORACmVH+lFo1vws1WDhLDm7nLam7iwYLAMJn4PKNQ4xv+cp2dw
 xqS9PbLzvFCfyqp9fylBPJZIM7H+b+XV9GPaU8GDpAbQnzOVrxwZJPRFVoS4FO4yaB
 CBmBmVpJVtTsvCjd1KzwryOh0fbS/bvoJ8C3A/5vxXpVdRog3qmwPAtke4bXWz/xTm
 WZwOAjHDQKeR8yWuvV4iHophSnoHAOVhcOu1OgzECPTzJbbE7Zc91eEu5lwpMknZh0
 jP/pBZxT3+p4tcytsU91FReRAdzjt+N2yitC61H+l9kCbPf2vWKbviP8+5t2pOsUlc
 HvKLk8fHCgwUxV6Y6TGzLsMtBwQLex5EpxD+a/3TxX6++1YC92mPbjUxjt2rB0uMnP
 j79h4l3RDCsl09YU6adom8zugxSQRwjpk7Rgc4ndJg5jKEdApo95ltstjnMFpnU2hQ
 Pmma6f9IpUpZNev4aiqg2bDFDEpB8ikjeWi1QqTkIRyf7GDNWRu+ssMX5TDU36jmPW
 HquQQsp3FdBJDn7ydlWHdHKlZMAzGkhvuBB82abq8dRKWXyj9JGHrRVHX4d19NnrlH
 PX/J69JA1WUTxj/hgw9h0Gub9Tf6Pps0JIILkvh3p7uIQ8BGrCWwCl6qx0dt1G8Qtr
 +d0GBwj26Z1axNd44tgN7OWI=
Received: from sparky.lan (unknown [IPv6:2001:8003:8824:9e00::bec])
 by sphereful.davidgow.net (Postfix) with ESMTPSA id 7CA821DC092;
 Sun,  4 Aug 2024 17:19:10 +0800 (AWST)
From: David Gow <david@davidgow.net>
To: =?UTF-8?q?Christian=20K=C3=B6nig?= <ckoenig.leichtzumerken@gmail.com>,
 Somalapuram Amaranath <Amaranath.Somalapuram@amd.com>,
 =?UTF-8?q?Thomas=20Hellstr=C3=B6m?= <thomas.hellstrom@linux.intel.com>,
 Lucas De Marchi <lucas.demarchi@intel.com>,
 Andi Shyti <andi.shyti@linux.intel.com>,
 Thomas Zimmermann <tzimmermann@suse.de>
Cc: David Gow <david@davidgow.net>, Jani Nikula <jani.nikula@linux.intel.com>,
 Joonas Lahtinen <joonas.lahtinen@linux.intel.com>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>,
 Tvrtko Ursulin <tursulin@ursulin.net>,
 =?UTF-8?q?Ville=20Syrj=C3=A4l=C3=A4?= <ville.syrjala@linux.intel.com>,
 intel-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org
Subject: [PATCH 1/2] drm/i915: Allow evicting to use the requested placement
Date: Sun,  4 Aug 2024 17:18:47 +0800
Message-ID: <20240804091851.122186-2-david@davidgow.net>
X-Mailer: git-send-email 2.46.0
In-Reply-To: <20240804091851.122186-1-david@davidgow.net>
References: <20240804091851.122186-1-david@davidgow.net>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Mailman-Approved-At: Sun, 04 Aug 2024 10:43:34 +0000
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

In commit a78a8da51b36 ("drm/ttm: replace busy placement with flags v6"),
the old system of having a separate placement list (for placements
which should be used without eviction) and a 'busy' placement list (for
placements which should be attempted if eviction is required) was
replaced with a new one where placements could be marked 'FALLBACK' (to
be attempted if eviction is required) or 'DESIRED' (to be attempted
first, but not if eviction is required).

i915 had always included the requested placement in the list of
'busy' placements: i.e., the placement could be used either if eviction
is required or not. But when the new system was put in place, the
requested (first) placement was marked 'DESIRED', so would never be used
if eviction became necessary. While a bug in the original commit
prevented this flag from working, when this was fixed in
4a0e7b3c ("drm/i915: fix applying placement flag"), it caused long hangs
on DG2 systems with small BAR.

Don't mark the requested placement DESIRED (or FALLBACK), allowing it to
be used in both situations. This matches the old behaviour, and resolves
the hangs.

Thanks to Justin Brewer for bisecting the issue.

Fixes: a78a8da51b36 ("drm/ttm: replace busy placement with flags v6")
Fixes: 4a0e7b3c3753 ("drm/i915: fix applying placement flag")
Link: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/11255
Signed-off-by: David Gow <david@davidgow.net>
---
 drivers/gpu/drm/i915/gem/i915_gem_ttm.c | 1 -
 1 file changed, 1 deletion(-)

diff --git a/drivers/gpu/drm/i915/gem/i915_gem_ttm.c b/drivers/gpu/drm/i915/gem/i915_gem_ttm.c
index e6f177183c0f..fb848fd8ba15 100644
--- a/drivers/gpu/drm/i915/gem/i915_gem_ttm.c
+++ b/drivers/gpu/drm/i915/gem/i915_gem_ttm.c
@@ -165,7 +165,6 @@ i915_ttm_placement_from_obj(const struct drm_i915_gem_object *obj,
 	i915_ttm_place_from_region(num_allowed ? obj->mm.placements[0] :
 				   obj->mm.region, &places[0], obj->bo_offset,
 				   obj->base.size, flags);
-	places[0].flags |= TTM_PL_FLAG_DESIRED;
 
 	/* Cache this on object? */
 	for (i = 0; i < num_allowed; ++i) {
-- 
2.46.0

