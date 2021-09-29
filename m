Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 4239241C212
	for <lists+dri-devel@lfdr.de>; Wed, 29 Sep 2021 11:54:30 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 15B126EA24;
	Wed, 29 Sep 2021 09:54:26 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-4316.protonmail.ch (mail-4316.protonmail.ch [185.70.43.16])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3C7A96EA24
 for <dri-devel@lists.freedesktop.org>; Wed, 29 Sep 2021 09:54:25 +0000 (UTC)
Date: Wed, 29 Sep 2021 09:54:14 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=emersion.fr;
 s=protonmail; t=1632909263;
 bh=aRoLv5qviC+3Z5E42yIdLCBye2rDKy1bua0AObKlehE=;
 h=Date:To:From:Cc:Reply-To:Subject:From;
 b=uTLnBXZD544Onz3FCXpaV6dEqLr8qvDrwObuLmYDimELmMJNM157cDbZksngc4FSh
 5g6X3/05WxJrWCt1O3FG19v2FMtgZCdPLJtOaftT44XxlI2jeJ/iLiqZmL9Va41IAr
 JAW6xBGCbXJF1WSYPhMlYwPmj2CD7Ey/Bkm+WhnrBS5jHVRaW48kXEKiRelce+afc+
 6OQrqzxqnUm+wuGqQ0TagSdlTY3AAbRyHTyGxcTSVFbDhIA0AkNpcPQ1gOa7xd/hsk
 MR6+jYu8qDdrpQklf922LvNskfWFro1L74Br7BLEzHLU5+Z2q8YIVbBIepezEwO+J4
 0A+vzISU7LdqA==
To: dri-devel@lists.freedesktop.org
From: Simon Ser <contact@emersion.fr>
Cc: Daniel Vetter <daniel@ffwll.ch>, Pekka Paalanen <ppaalanen@gmail.com>
Subject: [PATCH] drm: document pre-multiplied assumptions
Message-ID: <20210929095357.49984-1-contact@emersion.fr>
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

When a plane is missing the "alpha blend mode" property, KMS drivers
will use the pre-multiplied mode.

Signed-off-by: Simon Ser <contact@emersion.fr>
Cc: Daniel Vetter <daniel@ffwll.ch>
Cc: Pekka Paalanen <ppaalanen@gmail.com>
---
 drivers/gpu/drm/drm_blend.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/drivers/gpu/drm/drm_blend.c b/drivers/gpu/drm/drm_blend.c
index ec37cbfabb50..eebb32ba84d7 100644
--- a/drivers/gpu/drm/drm_blend.c
+++ b/drivers/gpu/drm/drm_blend.c
@@ -185,6 +185,9 @@
  *=09=09 plane does not expose the "alpha" property, then this is
  *=09=09 assumed to be 1.0
  *
+ *=09When a plane is missing this property, the plane uses the
+ *=09"Pre-multiplied" equation.
+ *
  * Note that all the property extensions described here apply either to th=
e
  * plane or the CRTC (e.g. for the background color, which currently is no=
t
  * exposed and assumed to be black).
--=20
2.33.0


