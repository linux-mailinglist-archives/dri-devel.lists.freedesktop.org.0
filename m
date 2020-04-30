Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 2AEAF1BEDF7
	for <lists+dri-devel@lfdr.de>; Thu, 30 Apr 2020 03:59:42 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7FBDA6EB27;
	Thu, 30 Apr 2020 01:59:37 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-qt1-x843.google.com (mail-qt1-x843.google.com
 [IPv6:2607:f8b0:4864:20::843])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8D9286EB27
 for <dri-devel@lists.freedesktop.org>; Thu, 30 Apr 2020 01:59:36 +0000 (UTC)
Received: by mail-qt1-x843.google.com with SMTP id 71so3725084qtc.12
 for <dri-devel@lists.freedesktop.org>; Wed, 29 Apr 2020 18:59:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=massaru-org.20150623.gappssmtp.com; s=20150623;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=fVFXHIsh0/YRSKtqr5ljSmMbeR52DAiwA44HTGSUEYs=;
 b=LxmFwU7TGw7y9TAZafLVzvatQZ0gZjRW65fHnG9mih+vMFlq42rxUunxAOoL/uGZwV
 b5K/FJ8TlMReE9NuZwdRSN6JlWVx8OuU2m6gEcAXGPHBij943y09p3qom6ajQqpAGCDL
 DkgvAmBO0xKju/EuTeKYhKvfU/Vh10jMxTnMlNsbKhjkRYiFRaS9DB/KBcYIG1mCBMbw
 C5iSVrlzItgv9jyBA+YiqNlUYGLVHSg4H1/08Bcf6R2/x3tcYJFHZ+r/5kUSPSwN+Wts
 /0wnxrhLKsD/Orm3kO/tYZVEOjnATZK4APJk6ZCQ2tof62k6ScOI5t0iHP4HngekMbhA
 fsCw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=fVFXHIsh0/YRSKtqr5ljSmMbeR52DAiwA44HTGSUEYs=;
 b=BNnZGDVBSmuuUEM5g/yRRObvXWOUmIx/LzqC1g+miDqTJgbo5Dhpenp8dOiiaoGFck
 pCW8Eb94RWdTZMuDUd5iyYYwKXSCnBZoDWcjLJ0lpaLFGhinVCO4ger1H212YRMDx1eY
 d/FTCsc/gfR/BIhTpx22khdRv9N8oq/0ZqrRy0DATzek/L6uzAZrvhk1iG4MTmQd4t0C
 B01MLIuGfzV8mcMuMfff2T4+ppG1pxcuUdxOzERa9pTpOzPpcmv861zfyndo/G7fu1WQ
 P+AoKA/BQRgWjWtH/skzC9DasAMheFBVRurcz9acl8A0ea50WL/YSEy/ACmFYieRHIfl
 T8yQ==
X-Gm-Message-State: AGi0PuYZFmOHQQeWuXxh32QDcDENqy2kynoInBZtNgOjEDEv9HrA1nwx
 nyt3j+28C/VkJZXmHwlDlkv+gUKdBTg=
X-Google-Smtp-Source: APiQypJoSfYUsyxQnQO9ATp9PPbiyFH/GL856p8ztpAhtz6K1Fy0hNXDM3D+1FjMDNceAVO1N+vsvA==
X-Received: by 2002:ac8:51cb:: with SMTP id d11mr1332622qtn.370.1588211975468; 
 Wed, 29 Apr 2020 18:59:35 -0700 (PDT)
Received: from bbking.lan ([2804:14c:4a5:36c::cd2])
 by smtp.gmail.com with ESMTPSA id l24sm836378qtp.8.2020.04.29.18.59.33
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 29 Apr 2020 18:59:35 -0700 (PDT)
From: Vitor Massaru Iha <vitor@massaru.org>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH] dma-buf: Documentation: fix: `make htmldocs` warnings
Date: Wed, 29 Apr 2020 22:59:30 -0300
Message-Id: <20200430015930.32224-1-vitor@massaru.org>
X-Mailer: git-send-email 2.25.1
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
Cc: brendanhiggins@google.com, linux-kernel@vger.kernel.org,
 linaro-mm-sig@lists.linaro.org, skhan@linuxfoundation.org,
 linux-kernel-mentees@lists.linuxfoundation.org, linux-media@vger.kernel.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Add missed ":" on kernel-doc function parameter.

This patch fixes this warnings from `make htmldocs`:
./drivers/dma-buf/dma-buf.c:678: warning: Function parameter or member 'importer_ops' not described in 'dma_buf_dynamic_attach'
./drivers/dma-buf/dma-buf.c:678: warning: Function parameter or member 'importer_priv' not described in 'dma_buf_dynamic_attach'

Signed-off-by: Vitor Massaru Iha <vitor@massaru.org>
---
 drivers/dma-buf/dma-buf.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/dma-buf/dma-buf.c b/drivers/dma-buf/dma-buf.c
index ccc9eda1bc28..0756d2155745 100644
--- a/drivers/dma-buf/dma-buf.c
+++ b/drivers/dma-buf/dma-buf.c
@@ -655,8 +655,8 @@ EXPORT_SYMBOL_GPL(dma_buf_put);
  * calls attach() of dma_buf_ops to allow device-specific attach functionality
  * @dmabuf:		[in]	buffer to attach device to.
  * @dev:		[in]	device to be attached.
- * @importer_ops	[in]	importer operations for the attachment
- * @importer_priv	[in]	importer private pointer for the attachment
+ * @importer_ops:	[in]	importer operations for the attachment
+ * @importer_priv:	[in]	importer private pointer for the attachment
  *
  * Returns struct dma_buf_attachment pointer for this attachment. Attachments
  * must be cleaned up by calling dma_buf_detach().
-- 
2.25.1

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
