Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 1274D3FDE6F
	for <lists+dri-devel@lfdr.de>; Wed,  1 Sep 2021 17:18:05 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C89B76E1F2;
	Wed,  1 Sep 2021 15:18:01 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
X-Greylist: delayed 2304 seconds by postgrey-1.36 at gabe;
 Wed, 01 Sep 2021 13:09:46 UTC
Received: from mail.bsdpad.com (mail.bsdpad.com [116.202.106.248])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DB1D8897EF
 for <dri-devel@lists.freedesktop.org>; Wed,  1 Sep 2021 13:09:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=bsdpad.com; 
 s=20201212; h=Subject:To:From;
 bh=tzHJbtZEVgupBHTpFOONCJfpbNPw+e9kOSHhB1N+0Xw=; b=IX5N8iCcIOOekG1zQQlARvnrs0
 bFExZMrCZ7XRrEtG26lP2arF8urS3SJqw5LR5WtqwLkT+AWfcNdmaagfD9h1mflWGfsoej3L69qqv
 waWoNpL+HU0LeacyGOZbbfz75vP2xOTz6WOiWG8dr6QS1vdAMejOh+rKXvnx+knhMCV5XWbvhhIgf
 6xKQKpHwuBFH51rDF3p9mS7i6xcWpuUHU2IxxLbwK+EDnQw3QZZAIL77NZDUKhQOB9Y6VurQrQZVW
 uprjlwjNJSCESD63rC/us0mI/mtr9fzhcTjr/fUSVeFeFAiw80U1YSpSHMoES6K/JfXo5qrs07eaO
 BqlIEAIw==;
Received: from localhost ([127.0.0.1] helo=bsdpad.com)
 by mail.bsdpad.com with smtp (Exim 4.94 (FreeBSD))
 (envelope-from <br@bsdpad.com>)
 id 1mLPOS-000MWz-Nb; Wed, 01 Sep 2021 12:31:19 +0000
Received: by bsdpad.com (nbSMTP-1.00) for uid 1001
 br@bsdpad.com; Wed,  1 Sep 2021 13:31:19 +0100 (BST)
Date: Wed, 1 Sep 2021 13:31:19 +0100
From: Ruslan Bukin <ruslan.bukin@cl.cam.ac.uk>
To: dri-devel@lists.freedesktop.org
Cc: Rob Herring <robh@kernel.org>, Tomeu Vizoso <tomeu.vizoso@collabora.com>,
 Steven Price <steven.price@arm.com>,
 Alyssa Rosenzweig <alyssa.rosenzweig@collabora.com>,
 David Airlie <airlied@linux.ie>, Daniel Vetter <daniel@ffwll.ch>
Subject: [PATCH]: drm/panfrost: Dual licence the Mali GPU headers in GPL-2
 and MIT.
Message-ID: <YS9ylzpy4xh0JsdP@bsdpad.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
X-Mailman-Approved-At: Wed, 01 Sep 2021 15:18:00 +0000
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

    drm/panfrost: Dual licence the Mali GPU headers in GPL-2 and MIT.
    
    Signed-off-by: Ruslan Bukin <br@bsdpad.com>

diff --git a/drivers/gpu/drm/panfrost/panfrost_features.h b/drivers/gpu/drm/panfrost/panfrost_features.h
index 5056777c7744..23c4973c377f 100644
--- a/drivers/gpu/drm/panfrost/panfrost_features.h
+++ b/drivers/gpu/drm/panfrost/panfrost_features.h
@@ -1,4 +1,4 @@
-/* SPDX-License-Identifier: GPL-2.0 */
+/* SPDX-License-Identifier: GPL-2.0 or MIT */
 /* (C) COPYRIGHT 2014-2018 ARM Limited. All rights reserved. */
 /* Copyright 2019 Linaro, Ltd., Rob Herring <robh@kernel.org> */
 #ifndef __PANFROST_FEATURES_H__
diff --git a/drivers/gpu/drm/panfrost/panfrost_issues.h b/drivers/gpu/drm/panfrost/panfrost_issues.h
index 8e59d765bf19..cc6f7943ada2 100644
--- a/drivers/gpu/drm/panfrost/panfrost_issues.h
+++ b/drivers/gpu/drm/panfrost/panfrost_issues.h
@@ -1,4 +1,4 @@
-/* SPDX-License-Identifier: GPL-2.0 */
+/* SPDX-License-Identifier: GPL-2.0 or MIT */
 /* (C) COPYRIGHT 2014-2018 ARM Limited. All rights reserved. */
 /* Copyright 2019 Linaro, Ltd., Rob Herring <robh@kernel.org> */
 #ifndef __PANFROST_ISSUES_H__
diff --git a/drivers/gpu/drm/panfrost/panfrost_regs.h b/drivers/gpu/drm/panfrost/panfrost_regs.h
index dc9df5457f1c..ebd52c4abddc 100644
--- a/drivers/gpu/drm/panfrost/panfrost_regs.h
+++ b/drivers/gpu/drm/panfrost/panfrost_regs.h
@@ -1,4 +1,4 @@
-/* SPDX-License-Identifier: GPL-2.0 */
+/* SPDX-License-Identifier: GPL-2.0 or MIT */
 /* Copyright 2018 Marty E. Plummer <hanetzer@startmail.com> */
 /* Copyright 2019 Linaro, Ltd, Rob Herring <robh@kernel.org> */
 /*

