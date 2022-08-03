Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 58FA1589366
	for <lists+dri-devel@lfdr.de>; Wed,  3 Aug 2022 22:43:18 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AB17410E1C3;
	Wed,  3 Aug 2022 20:43:11 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-40136.proton.ch (mail-40136.proton.ch [185.70.40.136])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 37A76891BA
 for <dri-devel@lists.freedesktop.org>; Wed,  3 Aug 2022 20:43:02 +0000 (UTC)
Date: Wed, 03 Aug 2022 20:42:47 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=emersion.fr;
 s=protonmail3; t=1659559379; x=1659818579;
 bh=8XlFONgs+Gi2FQsHSEeU9iW0mujgWJEVRuegN9bNLTc=;
 h=Date:To:From:Reply-To:Subject:Message-ID:Feedback-ID:From:To:Cc:
 Date:Subject:Reply-To:Feedback-ID:Message-ID;
 b=mjz8t/u86GK6GCz+1hImz3Z27W6reA+dGwV1Xu0IjweWFvXbMEzK2v4whaERVKqvX
 asY+78lHX4JXzyN5o0YBdKe7f/Ws4paBXexVRCakl53ekKxvZWguI6EN44ZuB/6Mjv
 aRGyN2GcAVDXuMeSmKoh6BLhaDBtwMA5Ux+laUmnfFHyQf5Q4/pLbom2N/yQpDViKT
 w6yZEmsbTAxlVNyqaa7xBmxVacCEs483iLZHwllOAu3EJQx/spelihnrDwLofGx816
 aAcqzIKXPELdnlUasS7l1y2oE226Yaldik6GrzXbFvnphVojDX9TH9I7AAV8XBzkNj
 w9v4yIIUZ4a5g==
To: dri-devel@lists.freedesktop.org
From: Simon Ser <contact@emersion.fr>
Subject: [PATCH] drm: fix whitespace in drm_plane_create_color_properties()
Message-ID: <20220803204240.33409-1-contact@emersion.fr>
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
Reply-To: Simon Ser <contact@emersion.fr>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

The drm_property_create_enum() call for "COLOR_RANGE" contains a tab
character in the middle of the argument list.

Signed-off-by: Simon Ser <contact@emersion.fr>
---
 drivers/gpu/drm/drm_color_mgmt.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/drm_color_mgmt.c b/drivers/gpu/drm/drm_color_m=
gmt.c
index 17c6c3eefcd6..d021497841b8 100644
--- a/drivers/gpu/drm/drm_color_mgmt.c
+++ b/drivers/gpu/drm/drm_color_mgmt.c
@@ -575,7 +575,7 @@ int drm_plane_create_color_properties(struct drm_plane =
*plane,
 =09=09len++;
 =09}
=20
-=09prop =3D drm_property_create_enum(dev, 0,=09"COLOR_RANGE",
+=09prop =3D drm_property_create_enum(dev, 0, "COLOR_RANGE",
 =09=09=09=09=09enum_list, len);
 =09if (!prop)
 =09=09return -ENOMEM;
--=20
2.37.1


