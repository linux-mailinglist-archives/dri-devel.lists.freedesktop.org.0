Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id DB3DE28CCD9
	for <lists+dri-devel@lfdr.de>; Tue, 13 Oct 2020 13:55:00 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BD5546E8C9;
	Tue, 13 Oct 2020 11:54:48 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B8C436E3B2
 for <dri-devel@lists.freedesktop.org>; Tue, 13 Oct 2020 11:54:43 +0000 (UTC)
Received: from mail.kernel.org (ip5f5ad5b2.dynamic.kabel-deutschland.de
 [95.90.213.178])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 29DAC2247F;
 Tue, 13 Oct 2020 11:54:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1602590081;
 bh=AzevpnhjPOfpNRJ4TdS/s5gc3wKEYC/zOtDzpRXy+IY=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=XmDMZ2vQ9ZDgVE/C31LBldo468C4NfoKY8GfA+H+pips0SXBJLTDrUn8xKk6rmDuG
 ukjh24olL7bxhOd7zfDaD7IGOGLZKIYsZjAq9TcteZnhKJdfRYlE00KmqpvCuMq9XM
 pAzuF+PPpNmQnZ/cF8cswwHfabE5SlOAjMt+JG24=
Received: from mchehab by mail.kernel.org with local (Exim 4.94)
 (envelope-from <mchehab@kernel.org>)
 id 1kSIt5-006CWo-UN; Tue, 13 Oct 2020 13:54:39 +0200
From: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
To: Linux Doc Mailing List <linux-doc@vger.kernel.org>
Subject: [PATCH v6 75/80] drm: kernel-doc: add description for a new function
 parameter
Date: Tue, 13 Oct 2020 13:54:30 +0200
Message-Id: <03f1bf0aea97d73d7cd4a5ab71adbdc23dcdb3e1.1602589096.git.mchehab+huawei@kernel.org>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <cover.1602589096.git.mchehab+huawei@kernel.org>
References: <cover.1602589096.git.mchehab+huawei@kernel.org>
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
Cc: Thomas Zimmermann <tzimmermann@suse.de>, Jonathan Corbet <corbet@lwn.net>,
 Mauro Carvalho Chehab <mchehab+huawei@kernel.org>,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 David Airlie <airlied@linux.ie>, Gerd Hoffmann <kraxel@redhat.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

As reported by "make htmldocs":

	./drivers/gpu/drm/drm_prime.c:808: warning: Function parameter or member 'dev' not described in 'drm_prime_pages_to_sg'

Add a description for the new parameter.

Fixes: 707d561f77b5 ("drm: allow limiting the scatter list size.")
Signed-off-by: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
---
 drivers/gpu/drm/drm_prime.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/gpu/drm/drm_prime.c b/drivers/gpu/drm/drm_prime.c
index 1693aa7c14b5..1395688930f8 100644
--- a/drivers/gpu/drm/drm_prime.c
+++ b/drivers/gpu/drm/drm_prime.c
@@ -793,6 +793,7 @@ static const struct dma_buf_ops drm_gem_prime_dmabuf_ops =  {
 
 /**
  * drm_prime_pages_to_sg - converts a page array into an sg list
+ * @dev: DRM device
  * @pages: pointer to the array of page pointers to convert
  * @nr_pages: length of the page vector
  *
-- 
2.26.2

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
