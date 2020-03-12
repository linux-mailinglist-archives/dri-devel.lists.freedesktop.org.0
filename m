Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 4F045182A9C
	for <lists+dri-devel@lfdr.de>; Thu, 12 Mar 2020 09:09:16 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 402C86EA56;
	Thu, 12 Mar 2020 08:08:17 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from bombadil.infradead.org (bombadil.infradead.org
 [IPv6:2607:7c80:54:e::133])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 41DF56EA23
 for <dri-devel@lists.freedesktop.org>; Thu, 12 Mar 2020 05:09:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=bombadil.20170209; h=Content-Transfer-Encoding:
 Content-Type:MIME-Version:Date:Message-ID:Subject:From:Cc:To:Sender:Reply-To:
 Content-ID:Content-Description:In-Reply-To:References;
 bh=+MMAgr+LaCv2k1zN/x1GpYWsAedizhAP04NXBfBxfUY=; b=B7LWHfMUHPAGMMsGfLqDIcUNuI
 3Z4ac/7WW9mh4+oqhrh3y8VU63GOCqQQREFLvrk2llb57hhtfy44NTZByM81DLCQQZ+Rwsc2irHJ+
 IMX3Qvi94MthI5LK9e+bFy1BKAtrmb+glJKcMGvS104O+/y3UuPnTiQjiHyNYt2aZrH8TzbG3Ej1p
 Q+btsJ1AMTXyo8/+aQw1hMpvSdWv52we4Z7eMAUxcuyKl/lWJUpM8n178LrPvuLWoLdlIj+X/noZh
 CfqpVerFUBvJ6qA09nyj2tJOnd2KPoR8L2OGq6gCnTxMO3ur0LrLhJbb/UCnxqqkBItCEzxbZI/yj
 hADu4shg==;
Received: from [2601:1c0:6280:3f0::19c2]
 by bombadil.infradead.org with esmtpsa (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jCG69-0007E9-MO; Thu, 12 Mar 2020 05:09:33 +0000
To: LKML <linux-kernel@vger.kernel.org>,
 dri-devel <dri-devel@lists.freedesktop.org>
From: Randy Dunlap <rdunlap@infradead.org>
Subject: [PATCH] drm: mxsfb: fix Kconfig menu presentation
Message-ID: <a57392eb-da12-f760-7124-ba39fdd8775b@infradead.org>
Date: Wed, 11 Mar 2020 22:09:32 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.5.0
MIME-Version: 1.0
Content-Language: en-US
X-Mailman-Approved-At: Thu, 12 Mar 2020 08:08:13 +0000
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
Cc: Marek Vasut <marex@denx.de>, Fabio Estevam <fabio.estevam@nxp.com>,
 Andrew Morton <akpm@linux-foundation.org>, Shawn Guo <shawnguo@kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: Randy Dunlap <rdunlap@infradead.org>

Make DRM_MXS depend on DRM. This causes the MXS FB menu to be
presented in the DRM menu where it should be instead of in the
Graphics support menu.

Fixes: 45d59d704080 ("drm: Add new driver for MXSFB controller")
Signed-off-by: Randy Dunlap <rdunlap@infradead.org>
Cc: Marek Vasut <marex@denx.de>
Cc: Lucas Stach <l.stach@pengutronix.de>
Cc: Fabio Estevam <fabio.estevam@nxp.com>
Cc: Shawn Guo <shawnguo@kernel.org>
Cc: Stefan Agner <stefan@agner.ch>
Cc: dri-devel@lists.freedesktop.org
---
 drivers/gpu/drm/mxsfb/Kconfig |    1 +
 1 file changed, 1 insertion(+)

--- linux-next-a.orig/drivers/gpu/drm/mxsfb/Kconfig
+++ linux-next-b/drivers/gpu/drm/mxsfb/Kconfig
@@ -1,6 +1,7 @@
 # SPDX-License-Identifier: GPL-2.0-only
 config DRM_MXS
 	bool
+	depends on DRM
 	help
 	  Choose this option to select drivers for MXS FB devices
 

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
