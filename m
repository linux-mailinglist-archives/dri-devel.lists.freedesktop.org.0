Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id C38B21B8001
	for <lists+dri-devel@lfdr.de>; Fri, 24 Apr 2020 22:10:07 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C4DBA6EB3F;
	Fri, 24 Apr 2020 20:08:32 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from wnew2-smtp.messagingengine.com (wnew2-smtp.messagingengine.com
 [64.147.123.27])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D5EC56EAAF
 for <dri-devel@lists.freedesktop.org>; Fri, 24 Apr 2020 15:36:08 +0000 (UTC)
Received: from compute4.internal (compute4.nyi.internal [10.202.2.44])
 by mailnew.west.internal (Postfix) with ESMTP id C400D3E9;
 Fri, 24 Apr 2020 11:36:07 -0400 (EDT)
Received: from mailfrontend1 ([10.202.2.162])
 by compute4.internal (MEProxy); Fri, 24 Apr 2020 11:36:08 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cerno.tech; h=
 from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding; s=fm2; bh=ZDDHs6S1gq2LI
 nfVgmp0pHkW/VF7Q7iLnmFsdw8/KiU=; b=r//bO9qIgxdaJSKujrpIRc2odnZ23
 m0spgdGn3TSSH1yiyLwkbAUk5NAcAC3I5empK8aw4TU/uk33ajmezUoX4skp7rhJ
 ilvZp2wQnZtwfPaY0tr3KOE9JV9g3n2zjxjcAS7p1oq1wnEYtljBjjXfjMpwf3PR
 tYvS7oI3KBnU6P6VWewWDaty0Rq+xZkQSOA2osw2pbsDRlsJZKBQ3h1aZnAf6Oc0
 X1ww/Lykmt2wF+Ye51tNlzHhBtztH2KHfr3sU4gfaBqFrkm5DXANgX35i3QlDlsf
 ezSskS46bFAsLz84NKLJnJEznN8FEDoKseWqhSfQWktgFuGAExvkflgrA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-transfer-encoding:date:from
 :in-reply-to:message-id:mime-version:references:subject:to
 :x-me-proxy:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=
 fm2; bh=ZDDHs6S1gq2LInfVgmp0pHkW/VF7Q7iLnmFsdw8/KiU=; b=T6hbr9/f
 JvMhh2zBE3RVRuztK5bIGCwlEzqHvGUgsBJnzFfpr1mLYxU1vkK8VkJpLXdZpMhb
 Vs7zQtYTez8xTm6S9YCscm27PAeYXXomLyXyGUeEwP5I39KAnYtdohsoHoaSOq6l
 HKa1O82lNpYjns5STZ1hPQGj0fA9C5MMvjM05/ctdAsUVxb4T1dsS+Au4VdbrOl0
 LhxD4FmqrUp+MrzfYlzM5gI/faNxj8MbizvcDg7791fixXGN9CH0IZdXwehhViiL
 E/EU8Ey8WyulVogAAE3tazAY6wgPDOWw3b34eC/XsPTNuo3urBIulaQCmX6XvGD3
 cdAijCp/ACbbzQ==
X-ME-Sender: <xms:ZwejXoa5z1yHEhpuBIMOcLDQonnMn1XslMfpDIeqnGHH17CUwFGBnA>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeduhedrhedugdekiecutefuodetggdotefrodftvf
 curfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfghnecu
 uegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenuc
 fjughrpefhvffufffkofgjfhgggfestdekredtredttdenucfhrhhomhepofgrgihimhgv
 ucftihhprghrugcuoehmrgigihhmvgestggvrhhnohdrthgvtghhqeenucfkphepledtrd
 ekledrieekrdejieenucevlhhushhtvghrufhiiigvpedvheenucfrrghrrghmpehmrghi
 lhhfrhhomhepmhgrgihimhgvsegtvghrnhhordhtvggthh
X-ME-Proxy: <xmx:ZwejXmChnfT6QMbyJZaO6Bqpj_w-zYtFFw3NP7-2fmxSKueeIm_Fkg>
 <xmx:ZwejXieksySxOwa-RPe1eSlg4Jq3dIh-R-1rDnVyteUJMxuS1FbCZQ>
 <xmx:ZwejXj_icdsdgEwZIDpf5d8qCcxnmjoBWEE8rLyxEtLM0N0qsuOzkg>
 <xmx:ZwejXrIHsmCIfSK9IHIAHNpsPJi7vGkDvaNWD_5nEK-soQ_qU-odYrP_V-c>
Received: from localhost (lfbn-tou-1-1502-76.w90-89.abo.wanadoo.fr
 [90.89.68.76])
 by mail.messagingengine.com (Postfix) with ESMTPA id 09E68328005E;
 Fri, 24 Apr 2020 11:36:06 -0400 (EDT)
From: Maxime Ripard <maxime@cerno.tech>
To: Nicolas Saenz Julienne <nsaenzjulienne@suse.de>,
 Eric Anholt <eric@anholt.net>
Subject: [PATCH v2 32/91] drm/vc4: drv: Add include guards
Date: Fri, 24 Apr 2020 17:34:13 +0200
Message-Id: <e460188876bf0d4b3b3a6428a237794907bbb4d4.1587742492.git-series.maxime@cerno.tech>
X-Mailer: git-send-email 2.26.0
In-Reply-To: <cover.d1e741d37e43e1ba2d2ecd93fc81d42a6df99d14.1587742492.git-series.maxime@cerno.tech>
References: <cover.d1e741d37e43e1ba2d2ecd93fc81d42a6df99d14.1587742492.git-series.maxime@cerno.tech>
MIME-Version: 1.0
X-Mailman-Approved-At: Fri, 24 Apr 2020 20:08:26 +0000
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
Cc: Tim Gover <tim.gover@raspberrypi.com>,
 Dave Stevenson <dave.stevenson@raspberrypi.com>, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, bcm-kernel-feedback-list@broadcom.com,
 linux-rpi-kernel@lists.infradead.org, Phil Elwell <phil@raspberrypi.com>,
 linux-arm-kernel@lists.infradead.org, Maxime Ripard <maxime@cerno.tech>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

vc4_drv.h doesn't have any include guards which prevents it from being
included twice. Let's add them.

Signed-off-by: Maxime Ripard <maxime@cerno.tech>
---
 drivers/gpu/drm/vc4/vc4_drv.h | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/drivers/gpu/drm/vc4/vc4_drv.h b/drivers/gpu/drm/vc4/vc4_drv.h
index 139d25a8328e..e7748f8e2967 100644
--- a/drivers/gpu/drm/vc4/vc4_drv.h
+++ b/drivers/gpu/drm/vc4/vc4_drv.h
@@ -2,6 +2,8 @@
 /*
  * Copyright (C) 2015 Broadcom
  */
+#ifndef _VC4_DRV_H_
+#define _VC4_DRV_H_
 
 #include <linux/delay.h>
 #include <linux/refcount.h>
@@ -897,3 +899,5 @@ int vc4_perfmon_destroy_ioctl(struct drm_device *dev, void *data,
 			      struct drm_file *file_priv);
 int vc4_perfmon_get_values_ioctl(struct drm_device *dev, void *data,
 				 struct drm_file *file_priv);
+
+#endif /* _VC4_DRV_H_ */
-- 
git-series 0.9.1
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
