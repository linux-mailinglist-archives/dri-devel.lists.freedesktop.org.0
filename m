Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id B1F7E604968
	for <lists+dri-devel@lfdr.de>; Wed, 19 Oct 2022 16:38:11 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 880CB10F23F;
	Wed, 19 Oct 2022 14:38:02 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-4317.proton.ch (mail-4317.proton.ch [185.70.43.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 224B710F247
 for <dri-devel@lists.freedesktop.org>; Wed, 19 Oct 2022 14:37:59 +0000 (UTC)
Date: Wed, 19 Oct 2022 14:37:51 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=emersion.fr;
 s=protonmail3; t=1666190276; x=1666449476;
 bh=xnh5lw5bGYBpJgz3G8t0R9Z8/B0eZuEXm2vVqAyKBZw=;
 h=Date:To:From:Cc:Subject:Message-ID:In-Reply-To:References:
 Feedback-ID:From:To:Cc:Date:Subject:Reply-To:Feedback-ID:
 Message-ID;
 b=b3/Ht/qjdHMnrbon1V52Sv1G5OsOz+q0670afdpYw+Pvzsc8tplxGI/UEGd9J90/J
 pUvzrlwB/ok3cdf28ADJ/J/l7oL5h3ZFl6cpQ61udVMiOcrpr3WovWTo1TsMF3pE9l
 IqF+p070tovn32M/KjU4gSYdSdVQViHhN/cZaw2NWrPpnk+v8fGP9iviCoWmb+DQeV
 YiwlooOyFI2+xeHmXx97YQdrJJQ4NlcheOlFaqpgyyP1TVcC3A5YrtXK29RqAnG7or
 0lc4q+DhzyZa0m2D2wD2qJi4qOs6c58K07XOf9I3o3wggHiozomKXWK4Bt1C+pHyhF
 zjoW4qVpa261g==
To: dri-devel@lists.freedesktop.org
From: Simon Ser <contact@emersion.fr>
Subject: [PATCH 2/7] drm/atomic: drop extra bracket from log messages
Message-ID: <20221019143736.267324-2-contact@emersion.fr>
In-Reply-To: <20221019143736.267324-1-contact@emersion.fr>
References: <20221019143736.267324-1-contact@emersion.fr>
Feedback-ID: 1358184:user:proton
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
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
Cc: Jani Nikula <jani.nikula@intel.com>, Daniel Vetter <daniel.vetter@ffwll.ch>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Signed-off-by: Simon Ser <contact@emersion.fr>
Cc: Daniel Vetter <daniel.vetter@ffwll.ch>
Cc: Jani Nikula <jani.nikula@intel.com>
---
 drivers/gpu/drm/drm_atomic_uapi.c | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/drivers/gpu/drm/drm_atomic_uapi.c b/drivers/gpu/drm/drm_atomic=
_uapi.c
index e659fdae477d..826cb2212b26 100644
--- a/drivers/gpu/drm/drm_atomic_uapi.c
+++ b/drivers/gpu/drm/drm_atomic_uapi.c
@@ -463,7 +463,7 @@ static int drm_atomic_crtc_set_property(struct drm_crtc=
 *crtc,
 =09=09return crtc->funcs->atomic_set_property(crtc, state, property, val);
 =09} else {
 =09=09drm_dbg_atomic(crtc->dev,
-=09=09=09       "[CRTC:%d:%s] unknown property [PROP:%d:%s]]\n",
+=09=09=09       "[CRTC:%d:%s] unknown property [PROP:%d:%s]\n",
 =09=09=09       crtc->base.id, crtc->name,
 =09=09=09       property->base.id, property->name);
 =09=09return -EINVAL;
@@ -586,7 +586,7 @@ static int drm_atomic_plane_set_property(struct drm_pla=
ne *plane,
 =09=09=09=09property, val);
 =09} else {
 =09=09drm_dbg_atomic(plane->dev,
-=09=09=09       "[PLANE:%d:%s] unknown property [PROP:%d:%s]]\n",
+=09=09=09       "[PLANE:%d:%s] unknown property [PROP:%d:%s]\n",
 =09=09=09       plane->base.id, plane->name,
 =09=09=09       property->base.id, property->name);
 =09=09return -EINVAL;
@@ -781,7 +781,7 @@ static int drm_atomic_connector_set_property(struct drm=
_connector *connector,
 =09=09=09=09state, property, val);
 =09} else {
 =09=09drm_dbg_atomic(connector->dev,
-=09=09=09       "[CONNECTOR:%d:%s] unknown property [PROP:%d:%s]]\n",
+=09=09=09       "[CONNECTOR:%d:%s] unknown property [PROP:%d:%s]\n",
 =09=09=09       connector->base.id, connector->name,
 =09=09=09       property->base.id, property->name);
 =09=09return -EINVAL;
--=20
2.38.0


