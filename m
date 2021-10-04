Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 80597420807
	for <lists+dri-devel@lfdr.de>; Mon,  4 Oct 2021 11:12:59 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6B3296E987;
	Mon,  4 Oct 2021 09:12:57 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-4317.protonmail.ch (mail-4317.protonmail.ch [185.70.43.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5EE0B6E987
 for <dri-devel@lists.freedesktop.org>; Mon,  4 Oct 2021 09:12:55 +0000 (UTC)
Date: Mon, 04 Oct 2021 09:12:50 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=emersion.fr;
 s=protonmail; t=1633338772;
 bh=+iDpsdErgW3Un3ETFbxAJW/28nw8kV9blU2wCTqj1X0=;
 h=Date:To:From:Cc:Reply-To:Subject:From;
 b=O7QiEo8UwIwouOolHJBEGB//xtg5ziWmYzDt10FbUizl4wjrKTm1oyOVGm32xXs/m
 eAKOSVnYspwh71jrUjWZUYH1XuPF1OAucpgL9WkUbks1r/X8zDoRfoDvs12EEZohma
 dHi8RJTaK3CV3C5GL3hiA7m1rNJh+MKVn++I6b49kI61CNFTswyo9d4sw0ZBeK0p1K
 X5t8B+6qOr7ndyecpXZJ2C+koZpQJ6BGzeQeva8lwwDE4uHWRfmYZH0lV3ad32jgZo
 5v8qTdjIWlfY4dNzlsMBwtb2YMUkZNPuOlU1yoD9e8HVlWAX1XnN9FeFSufur09gYk
 YuFMEjfXd3+NA==
To: dri-devel@lists.freedesktop.org
From: Simon Ser <contact@emersion.fr>
Cc: Emmanuel Gil Peyrot <linkmauve@linkmauve.fr>,
 Daniel Vetter <daniel@ffwll.ch>, Pekka Paalanen <ppaalanen@gmail.com>,
 Ville Syrjala <ville.syrjala@linux.intel.com>,
 Jani Nikula <jani.nikula@linux.intel.com>
Subject: [PATCH] drm/connector: refer to CTA-861-G in the "content type" prop
 docs
Message-ID: <20211004091236.82010-1-contact@emersion.fr>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-Spam-Status: No, score=-1.2 required=10.0 tests=ALL_TRUSTED,DKIM_SIGNED,
 DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF shortcircuit=no
 autolearn=disabled version=3.4.4
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on
 mailout.protonmail.ch
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

The KMS documentation doesn't say much about the meaning of each
content type. Add a reference to the specification defining them.

Signed-off-by: Simon Ser <contact@emersion.fr>
Cc: Emmanuel Gil Peyrot <linkmauve@linkmauve.fr>
Cc: Daniel Vetter <daniel@ffwll.ch>
Cc: Pekka Paalanen <ppaalanen@gmail.com>
Cc: Ville Syrjala <ville.syrjala@linux.intel.com>
Cc: Jani Nikula <jani.nikula@linux.intel.com>
---
 drivers/gpu/drm/drm_connector.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/drivers/gpu/drm/drm_connector.c b/drivers/gpu/drm/drm_connecto=
r.c
index 3bc782b630b9..79d8163686cd 100644
--- a/drivers/gpu/drm/drm_connector.c
+++ b/drivers/gpu/drm/drm_connector.c
@@ -1397,6 +1397,8 @@ EXPORT_SYMBOL(drm_connector_attach_dp_subconnector_pr=
operty);
  *=09Game:
  *=09=09Content type is game
  *
+ *=09The meaning of each content type is defined in CTA-861-G table 15.
+ *
  *=09Drivers can set up this property by calling
  *=09drm_connector_attach_content_type_property(). Decoding to
  *=09infoframe values is done through drm_hdmi_avi_infoframe_content_type(=
).
--=20
2.33.0


