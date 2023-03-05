Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id A60606AAF1E
	for <lists+dri-devel@lfdr.de>; Sun,  5 Mar 2023 11:35:25 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C1F6410E037;
	Sun,  5 Mar 2023 10:35:21 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-4317.proton.ch (mail-4317.proton.ch [185.70.43.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 19C3F10E037
 for <dri-devel@lists.freedesktop.org>; Sun,  5 Mar 2023 10:35:20 +0000 (UTC)
Date: Sun, 05 Mar 2023 10:35:10 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=emersion.fr;
 s=protonmail; t=1678012517; x=1678271717;
 bh=7hJ6A97it0ps/WtZC8AB7EH9QDA7ERJPWBt/OeZ5ktU=;
 h=Date:To:From:Cc:Subject:Message-ID:Feedback-ID:From:To:Cc:Date:
 Subject:Reply-To:Feedback-ID:Message-ID:BIMI-Selector;
 b=PjKU5GUMTlAKbSITGT8ZNGvwIVNETcdndrKcA9qVpWUCBXHqVI2fMe4ORVbQsnsIc
 YrRjQTE4cIGpdxc3vuxNnkrfk9CD+pzz2MtlMc97TM+q2T4k1G+ItafHr0aEeowC9g
 f9kiLNMie1d8B2gQXRvW6i3gSG1l56+uiGPxjP788/lzFptrempfqa3a8goiaoZnrH
 Ef5NGBHChyzCgHyzMdbqyM1DQAj5T1bNMPMgvJ8SnctarblfnPKM+ggnm1iiotlinA
 yPQaYjZmwWHKBQn0gwBqdinX3D75XbbGlziIR8+UUa+9u8pYaEOyQEgBuJCmTRP6AH
 V6KbgqlTmUEVw==
To: dri-devel@lists.freedesktop.org
From: Simon Ser <contact@emersion.fr>
Subject: [PATCH] drm: fix typo in margin connector properties docs
Message-ID: <20230305103503.42619-1-contact@emersion.fr>
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
Cc: Pekka Paalanen <pekka.paalanen@collabora.com>,
 Maxime Ripard <maxime@cerno.tech>,
 Dave Stevenson <dave.stevenson@raspberrypi.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

This was pointed out by Ville and Pekka in their replies, but
forgot to apply the change properly before pushing. Sorry for
the noise!

Signed-off-by: Simon Ser <contact@emersion.fr>
Fixes: 409f07d353b3 ("drm: document connector margin properties")
Cc: Ville Syrj=C3=A4l=C3=A4 <ville.syrjala@linux.intel.com>
Cc: Pekka Paalanen <pekka.paalanen@collabora.com>
Cc: Maxime Ripard <maxime@cerno.tech>
Cc: Dave Stevenson <dave.stevenson@raspberrypi.com>
---
 drivers/gpu/drm/drm_connector.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/drm_connector.c b/drivers/gpu/drm/drm_connecto=
r.c
index 4b12c7a39ee3..48df7a5ea503 100644
--- a/drivers/gpu/drm/drm_connector.c
+++ b/drivers/gpu/drm/drm_connector.c
@@ -1452,7 +1452,7 @@ static const struct drm_prop_enum_list dp_colorspaces=
[] =3D {
  *
  * left margin, right margin, top margin, bottom margin:
  *=09Add margins to the connector's viewport. This is typically used to
- *=09mitigate underscan on TVs.
+ *=09mitigate overscan on TVs.
  *
  *=09The value is the size in pixels of the black border which will be
  *=09added. The attached CRTC's content will be scaled to fill the whole
--=20
2.39.2


