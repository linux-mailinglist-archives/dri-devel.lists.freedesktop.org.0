Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 0941B654DAE
	for <lists+dri-devel@lfdr.de>; Fri, 23 Dec 2022 09:45:06 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AD51110E608;
	Fri, 23 Dec 2022 08:44:28 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from sender-of-o50.zoho.in (sender-of-o50.zoho.in [103.117.158.50])
 by gabe.freedesktop.org (Postfix) with ESMTPS id ACFDA10E04D
 for <dri-devel@lists.freedesktop.org>; Thu, 22 Dec 2022 15:40:58 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; t=1671723651; cv=none; d=zohomail.in; s=zohoarc; 
 b=Jqc0VQquB+j/zoLYAQH9Bx3xekdzsxmrYlcQwoDHDi7zlpxZIHxuIoo61kvRXM+GD8pz9VuANzJ4pO+RH26K0QwFIspawTa2DV9sYfdbG0n7e4OzXkAY7W/+vPp5ECOR8pWfCtIcZRKe8ynQUC6Cw8SfPGnvWMySGrJu3gbSUOY=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.in;
 s=zohoarc; t=1671723651;
 h=Content-Type:Content-Transfer-Encoding:Cc:Date:From:In-Reply-To:MIME-Version:Message-ID:References:Subject:To;
 bh=jOS7lFqPyYp4aF6uyo+Mu87tNYK2Fubh9HQ2gBzQ9pY=; 
 b=dYu0F1rb0hwU/HMv7vvPxKe3VACmJwvUaoRfSBueVni/13B9C3nlb5KuSgK4gGq2IzlAzEj7KKQDejBFEqcvQ9orVkHfwZ40jwc/lUBG6aldblKUKIHY/rRvei+NtifpGNMQTXr7VUvrNPVblViYegcJCrZTxp6aX1gyuGLFlLc=
ARC-Authentication-Results: i=1; mx.zohomail.in; dkim=pass  header.i=siddh.me;
 spf=pass  smtp.mailfrom=code@siddh.me;
 dmarc=pass header.from=<code@siddh.me>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1671723651; 
 s=zmail; d=siddh.me; i=code@siddh.me;
 h=From:From:To:To:Cc:Cc:Message-ID:Subject:Subject:Date:Date:In-Reply-To:References:MIME-Version:Content-Transfer-Encoding:Content-Type:Message-Id:Reply-To;
 bh=jOS7lFqPyYp4aF6uyo+Mu87tNYK2Fubh9HQ2gBzQ9pY=;
 b=ZwaW4OiBc8H0sdC6pEw/EDve8LxAnsN78Dhmm2TraAW9sb5BnMEVMEBROldnTfDd
 nf/Gahc3ZqjACQXVgPafDwqoNwUruYKpziEyl26ScP8QCeIVEyM85siXvwPhRMHIEox
 VLAZJHS04wzyBuCdON7Hq/F4EF+aUaNmI3VvdikY=
Received: from kampyooter.. (110.226.31.37 [110.226.31.37]) by mx.zoho.in
 with SMTPS id 167172365051070.15665484717306;
 Thu, 22 Dec 2022 21:10:50 +0530 (IST)
From: Siddh Raman Pant <code@siddh.me>
To: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>,
 Daniel Vetter <daniel@ffwll.ch>, Simon Ser <contact@emersion.fr>
Message-ID: <58ca4a915c1ff714198316365afbb7fb2da1bf8b.1671723195.git.code@siddh.me>
Subject: [PATCH v2 8/9] drm/drm_blend: Remove usage of deprecated
 DRM_DEBUG_ATOMIC
Date: Thu, 22 Dec 2022 21:10:42 +0530
X-Mailer: git-send-email 2.35.1
In-Reply-To: <cover.1671723195.git.code@siddh.me>
References: <cover.1671723195.git.code@siddh.me>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-ZohoMailClient: External
Content-Type: text/plain; charset=utf8
X-Mailman-Approved-At: Fri, 23 Dec 2022 08:44:25 +0000
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
Cc: linux-kernel <linux-kernel@vger.kernel.org>,
 dri-devel <dri-devel@lists.freedesktop.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

drm_print.h says DRM_DEBUG_ATOMIC is deprecated in favor of
drm_dbg_atomic().

Signed-off-by: Siddh Raman Pant <code@siddh.me>
Reviewed-by: Simon Ser <contact@emersion.fr>
---
 drivers/gpu/drm/drm_blend.c | 13 ++++++-------
 1 file changed, 6 insertions(+), 7 deletions(-)

diff --git a/drivers/gpu/drm/drm_blend.c b/drivers/gpu/drm/drm_blend.c
index b4c8cab7158c..6e74de833466 100644
--- a/drivers/gpu/drm/drm_blend.c
+++ b/drivers/gpu/drm/drm_blend.c
@@ -450,8 +450,8 @@ static int drm_atomic_helper_crtc_normalize_zpos(struct=
 drm_crtc *crtc,
 =09int i, n =3D 0;
 =09int ret =3D 0;
=20
-=09DRM_DEBUG_ATOMIC("[CRTC:%d:%s] calculating normalized zpos values\n",
-=09=09=09 crtc->base.id, crtc->name);
+=09drm_dbg_atomic(dev, "[CRTC:%d:%s] calculating normalized zpos values\n"=
,
+=09=09       crtc->base.id, crtc->name);
=20
 =09states =3D kmalloc_array(total_planes, sizeof(*states), GFP_KERNEL);
 =09if (!states)
@@ -469,9 +469,8 @@ static int drm_atomic_helper_crtc_normalize_zpos(struct=
 drm_crtc *crtc,
 =09=09=09goto done;
 =09=09}
 =09=09states[n++] =3D plane_state;
-=09=09DRM_DEBUG_ATOMIC("[PLANE:%d:%s] processing zpos value %d\n",
-=09=09=09=09 plane->base.id, plane->name,
-=09=09=09=09 plane_state->zpos);
+=09=09drm_dbg_atomic(dev, "[PLANE:%d:%s] processing zpos value %d\n",
+=09=09=09       plane->base.id, plane->name, plane_state->zpos);
 =09}
=20
 =09sort(states, n, sizeof(*states), drm_atomic_state_zpos_cmp, NULL);
@@ -480,8 +479,8 @@ static int drm_atomic_helper_crtc_normalize_zpos(struct=
 drm_crtc *crtc,
 =09=09plane =3D states[i]->plane;
=20
 =09=09states[i]->normalized_zpos =3D i;
-=09=09DRM_DEBUG_ATOMIC("[PLANE:%d:%s] normalized zpos value %d\n",
-=09=09=09=09 plane->base.id, plane->name, i);
+=09=09drm_dbg_atomic(dev, "[PLANE:%d:%s] normalized zpos value %d\n",
+=09=09=09       plane->base.id, plane->name, i);
 =09}
 =09crtc_state->zpos_changed =3D true;
=20
--=20
2.35.1


