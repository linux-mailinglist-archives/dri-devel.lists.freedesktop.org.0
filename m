Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id F15C629A84B
	for <lists+dri-devel@lfdr.de>; Tue, 27 Oct 2020 10:51:54 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D13C66EB4D;
	Tue, 27 Oct 2020 09:51:43 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C2FCC6EB4C
 for <dri-devel@lists.freedesktop.org>; Tue, 27 Oct 2020 09:51:42 +0000 (UTC)
Received: from mail.kernel.org (ip5f5ad5af.dynamic.kabel-deutschland.de
 [95.90.213.175])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id C7C3F241A5;
 Tue, 27 Oct 2020 09:51:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1603792302;
 bh=Gs04cG1Tye+lS5FDSHJrAW5BW11RBRgt4lDXQz69d1U=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=SF2PoE+qd3WV9tSHpUuacQT5ze8yeVBWS79BlCzPYFdaG5JQSFjiw9OZfj92Yx9rZ
 TwX3RpnRNBpwaw4YQyQYc5J2oT4+P6OCIyZOxTrdNJHJn44kDieXX05qCcgKMmHhLK
 s12gZfZlwUhiGy4faJf+hXepvgquqXmTPeQjKoR4=
Received: from mchehab by mail.kernel.org with local (Exim 4.94)
 (envelope-from <mchehab@kernel.org>)
 id 1kXLdj-003FFW-PD; Tue, 27 Oct 2020 10:51:39 +0100
From: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
To: Linux Doc Mailing List <linux-doc@vger.kernel.org>,
 Jonathan Corbet <corbet@lwn.net>
Subject: [PATCH v3 24/32] drm: drm_edid: remove a duplicated kernel-doc
 declaration
Date: Tue, 27 Oct 2020 10:51:28 +0100
Message-Id: <9310f4074fa9d29cd3ad60684d86d0ace8dab7ae.1603791716.git.mchehab+huawei@kernel.org>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <cover.1603791716.git.mchehab+huawei@kernel.org>
References: <cover.1603791716.git.mchehab+huawei@kernel.org>
MIME-Version: 1.0
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
Cc: Thomas Zimmermann <tzimmermann@suse.de>,
 Mauro Carvalho Chehab <mchehab+huawei@kernel.org>,
 linux-kernel@vger.kernel.org, David Airlie <airlied@linux.ie>,
 dri-devel@lists.freedesktop.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

It is not possible to create cross-references for duplicated
symbols. While Sphinx always detected it, on Sphinx 3 it
generates warnings like this:

	.../Documentation/gpu/drm-kms-helpers:326: ../drivers/gpu/drm/drm_edid.c:1626: WARNING: Duplicate C declaration, also defined in 'gpu/drm-kms-helpers'.
	Declaration is 'bool drm_edid_are_equal (const struct edid *edid1, const struct edid *edid2)'.

So, get rid of the duplicated kernel-doc markup.

Signed-off-by: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
---
 include/drm/drm_edid.h | 7 -------
 1 file changed, 7 deletions(-)

diff --git a/include/drm/drm_edid.h b/include/drm/drm_edid.h
index b27a0e2169c8..e97daf6ffbb1 100644
--- a/include/drm/drm_edid.h
+++ b/include/drm/drm_edid.h
@@ -359,13 +359,6 @@ drm_load_edid_firmware(struct drm_connector *connector)
 }
 #endif
 
-/**
- * drm_edid_are_equal - compare two edid blobs.
- * @edid1: pointer to first blob
- * @edid2: pointer to second blob
- * This helper can be used during probing to determine if
- * edid had changed.
- */
 bool drm_edid_are_equal(const struct edid *edid1, const struct edid *edid2);
 
 int
-- 
2.26.2

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
