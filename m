Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B76B5596A3D
	for <lists+dri-devel@lfdr.de>; Wed, 17 Aug 2022 09:18:55 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 272D810FE2D;
	Wed, 17 Aug 2022 07:18:41 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
X-Greylist: delayed 367 seconds by postgrey-1.36 at gabe;
 Wed, 17 Aug 2022 07:07:08 UTC
Received: from us-smtp-delivery-110.mimecast.com
 (us-smtp-delivery-110.mimecast.com [170.10.129.110])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 54E8610E41C
 for <dri-devel@lists.freedesktop.org>; Wed, 17 Aug 2022 07:07:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=globallogic.com;
 s=mimecast20210517; t=1660720027;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=pH7OvNNPsm5VQKGPpzNsRUdrZIopXa5V2ADSxMuiVQs=;
 b=Xp5xHxN0D1R1n6X1uJuU8GaWRiglQXm0X+dCGdWH7g1ENNqI1hpotVa9uBhMfBS65WSlqD
 Uq/nScGfIJJ+0/D+ZWln9OPTbhUvRCXdAUwEpRhLjJk/TUQy1eb9JA2Nmhsxxl5TYuwGrb
 MTr3WEBa+5WpMIUlTpvBuucDbd/HpdyGtbdzAwnfXaPYOgJCsO2CbvuvRzP3G+cYiUB4xv
 SOcI/ExyNOW3xrv81f09Rxe1pmi8be9G1jnmIkpk/7Tp6gYo8n6f9W+Spl1yfrVFwtwmTj
 LwqQerzkLSn1vA6sC0QgEbnXRDtE9troBvNhoP73EySmfAUpbNEVY/6614XIiQ==
Received: from mail-lj1-f199.google.com (mail-lj1-f199.google.com
 [209.85.208.199]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-503-EdZpppBUOpyj3byAaJ5_Ew-1; Wed, 17 Aug 2022 03:00:58 -0400
X-MC-Unique: EdZpppBUOpyj3byAaJ5_Ew-1
Received: by mail-lj1-f199.google.com with SMTP id
 c18-20020a2ebf12000000b0025e5168c246so3835427ljr.1
 for <dri-devel@lists.freedesktop.org>; Wed, 17 Aug 2022 00:00:58 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc;
 bh=1exQ5qdkhCvVq2PBAzpRU9G+dzwvsJeddbBUdhaFhX8=;
 b=pKqQT0Xq3bGnesManCGLjaBw+I1CP55YTJsQyKGXZxmR7ENmzdP7WuptDYScRyNQZ1
 3NpPAMuASAJ2ckyNaIg9bwyOU0xegKQXems4l5Mrp20PPV3rgzW58P0HlwwOfELJ5mhg
 cW/gUWiRGpmF+RNz1VIMO6THWnq0VICUV0THh428pgWDVqE58ukq2DBOk6YWxHDrfsYR
 ZVEgiafbqMCd2lZcYL8ZLChHNZ0X6ww/qmGz30dy7Mv/WicIiAnMyIFFaU/I35brtJI0
 6rwyKs8gE2bbiXG6aKeEQxSK1WLX2O9VryEa9yai5v5jGlbBeDkTyT3y+MJjFxDRABr2
 n1KA==
X-Gm-Message-State: ACgBeo2PIJPYMT3UHgWB9T8sgmTBSuCPudhzlda4UWWHZSSdCWrXSDDA
 /06EvMu1KY+slkpQDXruSNSx9B6JI9BWUpQyEjRhnmZ2Bjr8VxYLM9G8nFlDFf+eDXTVwdCB792
 Ac1CfjhbP69ToXyZt/nOWPlnxjH8=
X-Received: by 2002:ac2:4562:0:b0:48b:2a91:e59 with SMTP id
 k2-20020ac24562000000b0048b2a910e59mr8050300lfm.91.1660719657284; 
 Wed, 17 Aug 2022 00:00:57 -0700 (PDT)
X-Google-Smtp-Source: AA6agR6a7nMNBiNK6k+E8U2fEcZfWVKJGSibaw9CkQYQp99t+6R5gMnJO2+WyETeLUoo4et3K4AZng==
X-Received: by 2002:ac2:4562:0:b0:48b:2a91:e59 with SMTP id
 k2-20020ac24562000000b0048b2a910e59mr8050281lfm.91.1660719656896; 
 Wed, 17 Aug 2022 00:00:56 -0700 (PDT)
Received: from localhost.localdomain ([91.245.79.37])
 by smtp.googlemail.com with ESMTPSA id
 o18-20020a05651205d200b0048a91266268sm1592278lfo.232.2022.08.17.00.00.55
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 17 Aug 2022 00:00:56 -0700 (PDT)
From: Sviatoslav Peleshko <sviatoslav.peleshko@globallogic.com>
To: 
Subject: [PATCH] drm/i915: Fix random -ENOSPC eviction errors due to locked
 vma objects
Date: Wed, 17 Aug 2022 09:55:41 +0300
Message-Id: <20220817065541.30101-1-sviatoslav.peleshko@globallogic.com>
X-Mailer: git-send-email 2.37.1
MIME-Version: 1.0
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: globallogic.com
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="US-ASCII"; x-default=true
X-Mailman-Approved-At: Wed, 17 Aug 2022 07:17:49 +0000
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
Cc: Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>,
 Sviatoslav Peleshko <sviatoslav.peleshko@globallogic.com>,
 =?UTF-8?q?Thomas=20Hellstr=C3=B6m?= <thomas.hellstrom@linux.intel.com>,
 David Airlie <airlied@linux.ie>, intel-gfx@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 Rodrigo Vivi <rodrigo.vivi@intel.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

The i915_gem_object_trylock we had in the grab_vma() makes it return false
when the vma->obj is already locked. In this case we'll skip this vma
during eviction, and eventually might be forced to return -ENOSPC even
though we could've evicted this vma if we waited for the lock a bit.

To fix this, replace the i915_gem_object_trylock with i915_gem_object_lock.
And because we have to worry about the potential deadlock now, bubble-up
the error code, so it will be correctly handled by the WW mechanism.

This fixes the issue https://gitlab.freedesktop.org/drm/intel/-/issues/6564

Fixes: 7e00897be8bf ("drm/i915: Add object locking to i915_gem_evict_for_no=
de and i915_gem_evict_something, v2.")
Signed-off-by: Sviatoslav Peleshko <sviatoslav.peleshko@globallogic.com>
---
 drivers/gpu/drm/i915/i915_gem_evict.c | 69 ++++++++++++++++++---------
 1 file changed, 46 insertions(+), 23 deletions(-)

diff --git a/drivers/gpu/drm/i915/i915_gem_evict.c b/drivers/gpu/drm/i915/i=
915_gem_evict.c
index f025ee4fa526..9d43f213f68f 100644
--- a/drivers/gpu/drm/i915/i915_gem_evict.c
+++ b/drivers/gpu/drm/i915/i915_gem_evict.c
@@ -55,49 +55,58 @@ static int ggtt_flush(struct intel_gt *gt)
 =09return intel_gt_wait_for_idle(gt, MAX_SCHEDULE_TIMEOUT);
 }
=20
-static bool grab_vma(struct i915_vma *vma, struct i915_gem_ww_ctx *ww)
+static int grab_vma(struct i915_vma *vma, struct i915_gem_ww_ctx *ww)
 {
+=09int ret =3D 0;
+
 =09/*
 =09 * We add the extra refcount so the object doesn't drop to zero until
 =09 * after ungrab_vma(), this way trylock is always paired with unlock.
 =09 */
 =09if (i915_gem_object_get_rcu(vma->obj)) {
-=09=09if (!i915_gem_object_trylock(vma->obj, ww)) {
+=09=09ret =3D i915_gem_object_lock(vma->obj, ww);
+=09=09if (ret)
 =09=09=09i915_gem_object_put(vma->obj);
-=09=09=09return false;
-=09=09}
 =09} else {
 =09=09/* Dead objects don't need pins */
 =09=09atomic_and(~I915_VMA_PIN_MASK, &vma->flags);
 =09}
=20
-=09return true;
+=09return ret;
 }
=20
-static void ungrab_vma(struct i915_vma *vma)
+static void ungrab_vma(struct i915_vma *vma, struct i915_gem_ww_ctx *ww)
 {
 =09if (dying_vma(vma))
 =09=09return;
=20
-=09i915_gem_object_unlock(vma->obj);
+=09if (!ww)
+=09=09i915_gem_object_unlock(vma->obj);
+
 =09i915_gem_object_put(vma->obj);
 }
=20
-static bool
+static int
 mark_free(struct drm_mm_scan *scan,
 =09  struct i915_gem_ww_ctx *ww,
 =09  struct i915_vma *vma,
 =09  unsigned int flags,
 =09  struct list_head *unwind)
 {
+=09int err;
+
 =09if (i915_vma_is_pinned(vma))
-=09=09return false;
+=09=09return -ENOSPC;
=20
-=09if (!grab_vma(vma, ww))
-=09=09return false;
+=09err =3D grab_vma(vma, ww);
+=09if (err)
+=09=09return err;
=20
 =09list_add(&vma->evict_link, unwind);
-=09return drm_mm_scan_add_block(scan, &vma->node);
+=09if (!drm_mm_scan_add_block(scan, &vma->node))
+=09=09return -ENOSPC;
+
+=09return 0;
 }
=20
 static bool defer_evict(struct i915_vma *vma)
@@ -150,6 +159,7 @@ i915_gem_evict_something(struct i915_address_space *vm,
 =09enum drm_mm_insert_mode mode;
 =09struct i915_vma *active;
 =09int ret;
+=09int err =3D 0;
=20
 =09lockdep_assert_held(&vm->mutex);
 =09trace_i915_gem_evict(vm, min_size, alignment, flags);
@@ -210,17 +220,23 @@ i915_gem_evict_something(struct i915_address_space *v=
m,
 =09=09=09continue;
 =09=09}
=20
-=09=09if (mark_free(&scan, ww, vma, flags, &eviction_list))
+=09=09err =3D mark_free(&scan, ww, vma, flags, &eviction_list);
+=09=09if (!err)
 =09=09=09goto found;
+=09=09if (err =3D=3D -EDEADLK)
+=09=09=09break;
 =09}
=20
 =09/* Nothing found, clean up and bail out! */
 =09list_for_each_entry_safe(vma, next, &eviction_list, evict_link) {
 =09=09ret =3D drm_mm_scan_remove_block(&scan, &vma->node);
 =09=09BUG_ON(ret);
-=09=09ungrab_vma(vma);
+=09=09ungrab_vma(vma, ww);
 =09}
=20
+=09if (err =3D=3D -EDEADLK)
+=09=09return err;
+
 =09/*
 =09 * Can we unpin some objects such as idle hw contents,
 =09 * or pending flips? But since only the GGTT has global entries
@@ -267,7 +283,7 @@ i915_gem_evict_something(struct i915_address_space *vm,
 =09=09=09__i915_vma_pin(vma);
 =09=09} else {
 =09=09=09list_del(&vma->evict_link);
-=09=09=09ungrab_vma(vma);
+=09=09=09ungrab_vma(vma, ww);
 =09=09}
 =09}
=20
@@ -277,17 +293,21 @@ i915_gem_evict_something(struct i915_address_space *v=
m,
 =09=09__i915_vma_unpin(vma);
 =09=09if (ret =3D=3D 0)
 =09=09=09ret =3D __i915_vma_unbind(vma);
-=09=09ungrab_vma(vma);
+=09=09ungrab_vma(vma, ww);
 =09}
=20
 =09while (ret =3D=3D 0 && (node =3D drm_mm_scan_color_evict(&scan))) {
 =09=09vma =3D container_of(node, struct i915_vma, node);
=20
 =09=09/* If we find any non-objects (!vma), we cannot evict them */
-=09=09if (vma->node.color !=3D I915_COLOR_UNEVICTABLE &&
-=09=09    grab_vma(vma, ww)) {
-=09=09=09ret =3D __i915_vma_unbind(vma);
-=09=09=09ungrab_vma(vma);
+=09=09if (vma->node.color !=3D I915_COLOR_UNEVICTABLE) {
+=09=09=09ret =3D grab_vma(vma, ww);
+=09=09=09if (!ret) {
+=09=09=09=09ret =3D __i915_vma_unbind(vma);
+=09=09=09=09ungrab_vma(vma, ww);
+=09=09=09} else if (ret !=3D -EDEADLK) {
+=09=09=09=09ret =3D -ENOSPC;
+=09=09=09}
 =09=09} else {
 =09=09=09ret =3D -ENOSPC;
 =09=09}
@@ -382,8 +402,11 @@ int i915_gem_evict_for_node(struct i915_address_space =
*vm,
 =09=09=09break;
 =09=09}
=20
-=09=09if (!grab_vma(vma, ww)) {
-=09=09=09ret =3D -ENOSPC;
+=09=09ret =3D grab_vma(vma, ww);
+=09=09if (ret) {
+=09=09=09if (ret !=3D -EDEADLK)
+=09=09=09=09ret =3D -ENOSPC;
+
 =09=09=09break;
 =09=09}
=20
@@ -405,7 +428,7 @@ int i915_gem_evict_for_node(struct i915_address_space *=
vm,
 =09=09if (ret =3D=3D 0)
 =09=09=09ret =3D __i915_vma_unbind(vma);
=20
-=09=09ungrab_vma(vma);
+=09=09ungrab_vma(vma, ww);
 =09}
=20
 =09return ret;
--=20
2.37.1

