Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 053611CA684
	for <lists+dri-devel@lfdr.de>; Fri,  8 May 2020 10:48:04 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2DD9A6EAB8;
	Fri,  8 May 2020 08:47:28 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from bombadil.infradead.org (bombadil.infradead.org
 [IPv6:2607:7c80:54:e::133])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 104CD6EA2F
 for <dri-devel@lists.freedesktop.org>; Thu,  7 May 2020 16:23:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=bombadil.20170209; h=Content-Transfer-Encoding:
 Content-Type:MIME-Version:Date:Message-ID:Subject:From:To:Sender:Reply-To:Cc:
 Content-ID:Content-Description:In-Reply-To:References;
 bh=HWcYFhwuKZBkcAlypnWomG6dn+SIe9TYlotFgzRCTJg=; b=fWwekOEKyltFs3du68d9ZNphza
 oLlBD7294ZfcEiOENvK6tGCjvvhIWyUaDESHwoTHPU6/tgJGEz3i3LgseeEUER9jFcTC4OetLfs35
 tx371+qnyiE+CrPMV9ptgA7quZgLqGIfhrBZi5XHmcYeKRhbz+cCUMoso9/YbdoBRv9RaFqKnpEiv
 jp2utHCAAJhotGbQ6esIDg8npjaSdXQFWfg2l4odPJhV919bMwSEWdRBd/PHoi0YmFQNSJ1v8KtHw
 8z9RYYp9/G1BA0y4XSdAhuYPBDjdA3aNVZZx8kpeh7rapIl1FZl6BW+9PPN/CIfuWLdQx9WGUjXI3
 dkUGf+xA==;
Received: from [2601:1c0:6280:3f0::19c2]
 by bombadil.infradead.org with esmtpsa (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jWjIm-0008To-Fd; Thu, 07 May 2020 16:23:12 +0000
To: dri-devel <dri-devel@lists.freedesktop.org>,
 LKML <linux-kernel@vger.kernel.org>,
 Thierry Reding <thierry.reding@gmail.com>, Sam Ravnborg <sam@ravnborg.org>
From: Randy Dunlap <rdunlap@infradead.org>
Subject: [PATCH -next] drm: panel: add MODULE_LICENSE to
 panel-visionox-rm69299.c
Message-ID: <bbb7b3b3-9968-9a1f-8ef6-2e8e3be998f6@infradead.org>
Date: Thu, 7 May 2020 09:23:11 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.7.0
MIME-Version: 1.0
Content-Language: en-US
X-Mailman-Approved-At: Fri, 08 May 2020 08:47:23 +0000
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: Randy Dunlap <rdunlap@infradead.org>

Add MODULE_LICENSE() to the panel-visionox-rm69299 driver
to fix a build warning.

WARNING: modpost: missing MODULE_LICENSE() in drivers/gpu/drm/panel/panel-visionox-rm69299.o

Signed-off-by: Randy Dunlap <rdunlap@infradead.org>
Cc: Thierry Reding <thierry.reding@gmail.com>
Cc: Sam Ravnborg <sam@ravnborg.org>
Cc: dri-devel@lists.freedesktop.org
---
 drivers/gpu/drm/panel/panel-visionox-rm69299.c |    1 +
 1 file changed, 1 insertion(+)

--- linux-next-20200507.orig/drivers/gpu/drm/panel/panel-visionox-rm69299.c
+++ linux-next-20200507/drivers/gpu/drm/panel/panel-visionox-rm69299.c
@@ -300,3 +300,4 @@ static struct mipi_dsi_driver visionox_r
 module_mipi_dsi_driver(visionox_rm69299_driver);
 
 MODULE_DESCRIPTION("Visionox RM69299 DSI Panel Driver");
+MODULE_LICENSE("GPL v2");

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
