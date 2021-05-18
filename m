Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 2D6AC387738
	for <lists+dri-devel@lfdr.de>; Tue, 18 May 2021 13:14:56 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BD7EC6E875;
	Tue, 18 May 2021 11:14:53 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail2.protonmail.ch (mail2.protonmail.ch [185.70.40.22])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2F2916E875
 for <dri-devel@lists.freedesktop.org>; Tue, 18 May 2021 11:14:53 +0000 (UTC)
Date: Tue, 18 May 2021 11:14:47 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=emersion.fr;
 s=protonmail3; t=1621336490;
 bh=tOjHNqhISJHLnpaE4iSUDCuUPsOA/RrC8c32xTKht4E=;
 h=Date:To:From:Cc:Reply-To:Subject:From;
 b=r/jdr0Hcd8iD8c5yNVu4qr5sOsvHFCK3BFQnkSuWJmApiF7+F+JL/wqcDLvEAQlZH
 7QfOTncKImrgn+gimoMq5THm4x9I6bGWKZ42pjYJDKD1cGgWKk2vInqGhdXvjcBNBa
 4cytyY72XCN/n66d2mHeNG9eEPLSUzlhTmskLhbtl5wvNzx+r04ilyIca+TPQQC48d
 MayrcpOvY6LZiQXvobnPORi4ogeM4+Zad3HtT1ugAT1gFgV10/xqthBTjED5EBBwBD
 YhUpSc/KYaomGuAihfgZ9EQgLCJwpABis0xoQxH3KdksFQTRcHOvd3YUXef7+bwaeM
 TYeAOsthp3LwA==
To: dri-devel@lists.freedesktop.org
From: Simon Ser <contact@emersion.fr>
Subject: [PATCH 2/3] drm: clarify and linkify
 DRM_CLIENT_CAP_WRITEBACK_CONNECTORS docs
Message-ID: <J47jNf2tAKjofhxL2LEdu1b3w1iRaisxtLCVObf9A@cp4-web-037.plabs.ch>
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
Cc: Daniel Stone <daniels@collabora.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Make it clear that the client is responsible for enabling ATOMIC
prior to enabling WRITEBACK_CONNECTORS. Linkify the reference to
ATOMIC.

Signed-off-by: Simon Ser <contact@emersion.fr>
Cc: Daniel Vetter <daniel@ffwll.ch>
Cc: Daniel Stone <daniels@collabora.com>
Cc: Pekka Paalanen <ppaalanen@gmail.com>
---
 include/uapi/drm/drm.h | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/include/uapi/drm/drm.h b/include/uapi/drm/drm.h
index 1c947227f72b..87878aea4526 100644
--- a/include/uapi/drm/drm.h
+++ b/include/uapi/drm/drm.h
@@ -812,8 +812,8 @@ struct drm_get_cap {
  * DRM_CLIENT_CAP_WRITEBACK_CONNECTORS
  *
  * If set to 1, the DRM core will expose special connectors to be used for
- * writing back to memory the scene setup in the commit. Depends on client
- * also supporting DRM_CLIENT_CAP_ATOMIC
+ * writing back to memory the scene setup in the commit. The client must e=
nable
+ * &DRM_CLIENT_CAP_ATOMIC first.
  */
 #define DRM_CLIENT_CAP_WRITEBACK_CONNECTORS=095
=20
--=20
2.31.1


