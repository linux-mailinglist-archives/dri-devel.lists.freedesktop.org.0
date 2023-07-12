Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A62DD750A2B
	for <lists+dri-devel@lfdr.de>; Wed, 12 Jul 2023 15:57:45 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3DE3A10E539;
	Wed, 12 Jul 2023 13:57:43 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-4317.proton.ch (mail-4317.proton.ch [185.70.43.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 846B110E538
 for <dri-devel@lists.freedesktop.org>; Wed, 12 Jul 2023 13:57:40 +0000 (UTC)
Date: Wed, 12 Jul 2023 13:57:26 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=emersion.fr;
 s=protonmail; t=1689170257; x=1689429457;
 bh=uh/hSg5Mos7GcPsQjs1DwkwRZhEL5dUyb4rZKocMWZg=;
 h=Date:To:From:Cc:Subject:Message-ID:Feedback-ID:From:To:Cc:Date:
 Subject:Reply-To:Feedback-ID:Message-ID:BIMI-Selector;
 b=sAhT0iUse/lddTyjUqvacQEqDb8HGAS169T/X4kfSRZsO6f3rA2xrQvkM7J3hOn+z
 Gx4q4O/eN755F/9+Ysorm2AHkresBdo9/t6lkBOM0XSkiYowJt5PzPIvFAAWgvujw1
 Npo+3Js599RD1n9VuBq9AEyfz/gYZwRfEJEcNKNHPrOpray+YFTIxwgHEawfFq4rrJ
 xTYDTbBiyfnwwAqHaMdIDyd3SmHGmjXYvrTjlV962wJLKa9diLebqDlNQoQChhB7Eu
 S+TXFhRle/jOl7901Fu6Yo7oM0AGw34qOKQXzAPnNfB5v6CdSO4J/UFvOZTZzjOn95
 GKHsq7WVFovUg==
To: dri-devel@lists.freedesktop.org
From: Simon Ser <contact@emersion.fr>
Subject: [PATCH 1/4] drm/doc: use cross-references for macros
Message-ID: <20230712135723.173506-1-contact@emersion.fr>
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
Cc: Daniel Vetter <daniel.vetter@ffwll.ch>,
 Pekka Paalanen <pekka.paalanen@collabora.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

These will show up as monospace, and will get linkified as soon as
we document the macro they point to.

Signed-off-by: Simon Ser <contact@emersion.fr>
Cc: Pekka Paalanen <pekka.paalanen@collabora.com>
Cc: Daniel Vetter <daniel.vetter@ffwll.ch>
---
 Documentation/gpu/drm-uapi.rst | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/Documentation/gpu/drm-uapi.rst b/Documentation/gpu/drm-uapi.rs=
t
index 65fb3036a580..f2fe6e8bd018 100644
--- a/Documentation/gpu/drm-uapi.rst
+++ b/Documentation/gpu/drm-uapi.rst
@@ -450,12 +450,12 @@ VBlank event handling
=20
 The DRM core exposes two vertical blank related ioctls:
=20
-DRM_IOCTL_WAIT_VBLANK
+:c:macro:`DRM_IOCTL_WAIT_VBLANK`
     This takes a struct drm_wait_vblank structure as its argument, and
     it is used to block or request a signal when a specified vblank
     event occurs.
=20
-DRM_IOCTL_MODESET_CTL
+:c:macro:`DRM_IOCTL_MODESET_CTL`
     This was only used for user-mode-settind drivers around modesetting
     changes to allow the kernel to update the vblank interrupt after
     mode setting, since on many devices the vertical blank counter is
@@ -478,8 +478,8 @@ The index is used in cases where a densely packed ident=
ifier for a CRTC is
 needed, for instance a bitmask of CRTC's. The member possible_crtcs of str=
uct
 drm_mode_get_plane is an example.
=20
-DRM_IOCTL_MODE_GETRESOURCES populates a structure with an array of CRTC ID=
's,
-and the CRTC index is its position in this array.
+:c:macro:`DRM_IOCTL_MODE_GETRESOURCES` populates a structure with an array=
 of
+CRTC ID's, and the CRTC index is its position in this array.
=20
 .. kernel-doc:: include/uapi/drm/drm.h
    :internal:
--=20
2.41.0


