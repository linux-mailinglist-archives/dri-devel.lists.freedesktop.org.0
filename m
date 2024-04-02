Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 2B92C895FC9
	for <lists+dri-devel@lfdr.de>; Wed,  3 Apr 2024 00:49:13 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 57B19112130;
	Tue,  2 Apr 2024 22:49:04 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; secure) header.d=pm.me header.i=@pm.me header.b="Zgn2BYNt";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-41104.protonmail.ch (mail-41104.protonmail.ch
 [185.70.41.104])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 57D2310EEB4
 for <dri-devel@lists.freedesktop.org>; Tue,  2 Apr 2024 22:43:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=pm.me;
 s=protonmail3; t=1712097826; x=1712357026;
 bh=M5g/fcmIVnd03cJua4t7cktQpdvhmTWTKnPw4RyHuwI=;
 h=Date:To:From:Cc:Subject:Message-ID:In-Reply-To:References:
 Feedback-ID:From:To:Cc:Date:Subject:Reply-To:Feedback-ID:
 Message-ID:BIMI-Selector;
 b=Zgn2BYNtEub2wOHTZ512OSFsjW68aYTqzJJMvtctlN9DvmKOJswdeE/AKPPtCrHft
 JoEop76LObx7G4aBep/eIHaCWDmIHwcVvisu8YbIb+sMB1zXPP9sgJcPCDYoMZhnPZ
 uZPWRfJi/0hb8PJe6Mk93PMXzeThkhWFwj43Vq1fYTE38in3CmwDka7C+Vf4YwheLD
 DavkTtg/ozn5nKf2znzu5jWjwYQGVLF7Mw8lIhqli7eXk+wPY3xUt8rAYnfhacNZ8p
 NUVHv+WPXlzv1w2waG/gUmFsnnY1wseeRuRzQ+TiXWxQ/SvcwqY0nSTboJpl04+8T7
 PzMBqQoXKirqQ==
Date: Tue, 02 Apr 2024 22:43:43 +0000
To: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org
From: Nicolas Devos <ndevos-dev@pm.me>
Cc: Nicolas Devos <ndevos-dev@pm.me>
Subject: [PATCH 3/4] gpu/drm: Prefer `unsigned int` over `unsigned`
Message-ID: <20240402224320.12146-4-ndevos-dev@pm.me>
In-Reply-To: <20240402224320.12146-1-ndevos-dev@pm.me>
References: <20240402224320.12146-1-ndevos-dev@pm.me>
Feedback-ID: 76711691:user:proton
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-Mailman-Approved-At: Tue, 02 Apr 2024 22:48:59 +0000
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

This commit fixes following checkpatch warning:
WARNING: Prefer 'unsigned int' to bare use of 'unsigned'

Signed-off-by: Nicolas Devos <ndevos-dev@pm.me>
---
 drivers/gpu/drm/drm_connector.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/drm_connector.c b/drivers/gpu/drm/drm_connecto=
r.c
index 6d8f0fc905f3..de71805aab2c 100644
--- a/drivers/gpu/drm/drm_connector.c
+++ b/drivers/gpu/drm/drm_connector.c
@@ -2076,7 +2076,7 @@ int drm_connector_attach_scaling_mode_property(struct=
 drm_connector *connector,
 =09struct drm_device *dev =3D connector->dev;
 =09struct drm_property *scaling_mode_property;
 =09int i;
-=09const unsigned valid_scaling_mode_mask =3D
+=09const unsigned int valid_scaling_mode_mask =3D
 =09=09(1U << ARRAY_SIZE(drm_scaling_mode_enum_list)) - 1;
=20
 =09if (WARN_ON(hweight32(scaling_mode_mask) < 2 ||
--=20
2.42.0


