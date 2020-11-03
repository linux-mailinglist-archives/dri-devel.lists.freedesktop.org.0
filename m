Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 67F612A41E8
	for <lists+dri-devel@lfdr.de>; Tue,  3 Nov 2020 11:31:30 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4F1F86EC23;
	Tue,  3 Nov 2020 10:31:25 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail2.protonmail.ch (mail2.protonmail.ch [185.70.40.22])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4C7A56EC16
 for <dri-devel@lists.freedesktop.org>; Tue,  3 Nov 2020 10:31:22 +0000 (UTC)
Date: Tue, 03 Nov 2020 10:31:15 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=emersion.fr;
 s=protonmail2; t=1604399479;
 bh=Nac5stxmKIdGjjHhLkDFCQ/YCQFZZOt5q6ZU89rn9S4=;
 h=Date:To:From:Cc:Reply-To:Subject:From;
 b=O7KLFMJ87UHlcBIfS3EnNYG6Dc5KCYPthsq33oxyKiUEKBAIKvlqZxiVRMnmAFaHw
 5YEfXP4n3KIhXjPpkFRiEGYr09EgMhaBK/x8+btRZ9aEd0Qo2e0jfE62+Eeeg/viTi
 2Gdew8p0N5p15011wQ54OKLFDXhN64RcrWayxYW2Z3hmBHEgZzFFFovL1e+4Q3yav9
 V7YwKveTDWDABLkgf36VXNmkr/pi698/d/sXJJERvFLv/qS/yBXjf0AX8PtgdOFizk
 XASuCxAzBEDKi/kjt4qshkoKGylbHqrd0QBY/HFjDYVI4ELUEyMgRMmvPSnVjBkhcR
 FjWORert8z5Lw==
To: dri-devel@lists.freedesktop.org
From: Simon Ser <contact@emersion.fr>
Subject: [PATCH] drm: unify formatting for color management documentation
Message-ID: <7dhjUKqlDC0IiRRON0VhWnkuoxcRDLG4EFKzyhcEA@cp7-web-043.plabs.ch>
MIME-Version: 1.0
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Other properties are documented with a colon character after the
property name. Consistently using a colon character allows the docs to
be machine-readable.

Signed-off-by: Simon Ser <contact@emersion.fr>
Cc: Daniel Vetter <daniel@ffwll.ch>
---
 drivers/gpu/drm/drm_color_mgmt.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/drm_color_mgmt.c b/drivers/gpu/drm/drm_color_mgmt.c
index 138ff34b31db..3bcabc2f6e0e 100644
--- a/drivers/gpu/drm/drm_color_mgmt.c
+++ b/drivers/gpu/drm/drm_color_mgmt.c
@@ -97,12 +97,12 @@
  * &drm_plane specific COLOR_ENCODING and COLOR_RANGE properties. They
  * are set up by calling drm_plane_create_color_properties().
  *
- * "COLOR_ENCODING"
+ * "COLOR_ENCODING":
  * 	Optional plane enum property to support different non RGB
  * 	color encodings. The driver can provide a subset of standard
  * 	enum values supported by the DRM plane.
  *
- * "COLOR_RANGE"
+ * "COLOR_RANGE":
  * 	Optional plane enum property to support different non RGB
  * 	color parameter ranges. The driver can provide a subset of
  * 	standard enum values supported by the DRM plane.
-- 
2.29.2


_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
