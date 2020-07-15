Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 8E2992205AE
	for <lists+dri-devel@lfdr.de>; Wed, 15 Jul 2020 09:00:30 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 54D396E447;
	Wed, 15 Jul 2020 07:00:04 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from casper.infradead.org (casper.infradead.org
 [IPv6:2001:8b0:10b:1236::1])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B88476E378
 for <dri-devel@lists.freedesktop.org>; Wed, 15 Jul 2020 05:24:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=casper.20170209; h=Content-Transfer-Encoding:MIME-Version:
 References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:
 Content-Type:Content-ID:Content-Description;
 bh=W6d2rIfmPgB2Me+j3lzL51vigZ26PwE/oISWnxasd3k=; b=vdi1FjyDet0vrzo7qKoohaC600
 ocUWo/IQxBXughg1N7FllP39wcgVlO3Rty+2FIsrzFBMtFlTN86tEwWJmheg9+ODJTgJvk9iqAB4e
 rAo9k78EhN5tQYh8HREM1OSPouvuGBzctAJTCVzycbYdwZSx3yQeIzdasjQlbu6cAm63J9bu+3G83
 VN+Tg809XxJnCkkQO3ha5M1I0sQb9fdh59JOaj+v6J2dyaWoVsmbyhe5D+/LyEnsLD8GsG9I2/GQG
 EKDMOqt36P1qB1YcmeX8613s+bIrfsNHP4Dur/7zJFoTq7vysbk8v5HRGBkif4e9fJerqHN5hR9nr
 NP1Ot6IA==;
Received: from [2601:1c0:6280:3f0::19c2] (helo=smtpauth.infradead.org)
 by casper.infradead.org with esmtpsa (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jvZtd-0006Vd-Bq; Wed, 15 Jul 2020 05:23:57 +0000
From: Randy Dunlap <rdunlap@infradead.org>
To: linux-kernel@vger.kernel.org
Subject: [PATCH 4/7] drm: drm_mode_config.h: delete duplicated words in
 comments
Date: Tue, 14 Jul 2020 22:23:46 -0700
Message-Id: <20200715052349.23319-4-rdunlap@infradead.org>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20200715052349.23319-1-rdunlap@infradead.org>
References: <20200715052349.23319-1-rdunlap@infradead.org>
MIME-Version: 1.0
X-Mailman-Approved-At: Wed, 15 Jul 2020 06:59:56 +0000
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
Cc: David Airlie <airlied@linux.ie>, Randy Dunlap <rdunlap@infradead.org>,
 dri-devel@lists.freedesktop.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Drop doubled word "is" in several comments.

Signed-off-by: Randy Dunlap <rdunlap@infradead.org>
Cc: David Airlie <airlied@linux.ie>
Cc: Daniel Vetter <daniel@ffwll.ch>
Cc: dri-devel@lists.freedesktop.org
---
 include/drm/drm_mode_config.h |    8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

--- linux-next-20200714.orig/include/drm/drm_mode_config.h
+++ linux-next-20200714/include/drm/drm_mode_config.h
@@ -603,22 +603,22 @@ struct drm_mode_config {
 	struct drm_property *prop_src_h;
 	/**
 	 * @prop_crtc_x: Default atomic plane property for the plane destination
-	 * position in the &drm_crtc is is being shown on.
+	 * position in the &drm_crtc is being shown on.
 	 */
 	struct drm_property *prop_crtc_x;
 	/**
 	 * @prop_crtc_y: Default atomic plane property for the plane destination
-	 * position in the &drm_crtc is is being shown on.
+	 * position in the &drm_crtc is being shown on.
 	 */
 	struct drm_property *prop_crtc_y;
 	/**
 	 * @prop_crtc_w: Default atomic plane property for the plane destination
-	 * position in the &drm_crtc is is being shown on.
+	 * position in the &drm_crtc is being shown on.
 	 */
 	struct drm_property *prop_crtc_w;
 	/**
 	 * @prop_crtc_h: Default atomic plane property for the plane destination
-	 * position in the &drm_crtc is is being shown on.
+	 * position in the &drm_crtc is being shown on.
 	 */
 	struct drm_property *prop_crtc_h;
 	/**
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
