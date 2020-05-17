Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 07B301D6C72
	for <lists+dri-devel@lfdr.de>; Sun, 17 May 2020 21:39:51 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1E8A56E0EC;
	Sun, 17 May 2020 19:39:47 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x441.google.com (mail-wr1-x441.google.com
 [IPv6:2a00:1450:4864:20::441])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B58FE6E0EC
 for <dri-devel@lists.freedesktop.org>; Sun, 17 May 2020 19:39:45 +0000 (UTC)
Received: by mail-wr1-x441.google.com with SMTP id h17so9336897wrc.8
 for <dri-devel@lists.freedesktop.org>; Sun, 17 May 2020 12:39:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=4NdydZZDXMjOvbztI+guEmdW2k9699SEIQW41x68WeY=;
 b=WE6YUaLwDOTz+1upjYpBa+MMSkJ9yMAvBNcWwqWYdWHDZLl+xyK1OP3CddAG3DD+XJ
 O+KgI/E+0JE2UU95cy5az/A1jSYTBpYmXFH/abMHD4g4RsEV2xpTx4eXUMcTEX8wO4Db
 iOPCsZu6t17mHC3SFfFqR7b955IkFUz9gZzTRqnEo1yCnBXWQCxzMfvtpbpxzLUhsaVf
 xPs2U3W/Xvrjp4h5nZ9DUnVRSVyRucVxqWIl41ppb2FpQRpyJd3B+Rqo+ZSz4L387Rpw
 fehQhlFa2eEH50qV6gyBc09fgeCJ3q7CnXID92emzXiqE04czfHE1Dn65JVrIf3Kz2cj
 rhuw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=4NdydZZDXMjOvbztI+guEmdW2k9699SEIQW41x68WeY=;
 b=GEcQUM7GSlthPpjNf814xNJekiXfAXri9kaj3U7qhID79zbygYft6kDzWnsV567eAE
 sa2Nr5+9PLVUEoMdqOQ3oxSJ3iwDxFNlsxCRZizbLH3xfezQWzinLNqmILRDI6ITkpta
 Y+MSfx9pNkR+3SXkkYqTUWhJkS1E5UZJj7tpiHHvhZ8O9CuCnRv4Dt1HfhvL+INIn7uO
 q/XkRVlgGoC4HHCcDrleduJmiaJ16e1yEmKN1ixTOxu+jLEGgEZGO8dmJJh8MAHQi1cK
 Z0f9ClRksSgYd/b+R7lR9o8GVveLnNn5QRzL6txAtJsAcej4uFd4xTIgsKxWzMByCqkL
 tQ6Q==
X-Gm-Message-State: AOAM532q3pY316GSnKCzhj3CrlJrRBdPY5nKDFhA8RAo5E9ZBi/Obj01
 khq/EIZnp2cpVl5l9P9Yc2bkgwzT
X-Google-Smtp-Source: ABdhPJwzmiSFGeV09L4grWjCJLCS4ExGZp95xym3x7GVYRcXRd++BxOp4Z7hp6PWxg7HDDotJPO+og==
X-Received: by 2002:adf:fdd0:: with SMTP id i16mr15659529wrs.389.1589744384104; 
 Sun, 17 May 2020 12:39:44 -0700 (PDT)
Received: from localhost.localdomain
 (cpc91192-cmbg18-2-0-cust374.5-4.cable.virginm.net. [80.6.113.119])
 by smtp.gmail.com with ESMTPSA id g24sm13882339wrb.35.2020.05.17.12.39.42
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 17 May 2020 12:39:43 -0700 (PDT)
From: Emil Velikov <emil.l.velikov@gmail.com>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH 1/3] drm/arm: Kconfig annotate drivers as COMPILE_TEST
Date: Sun, 17 May 2020 20:36:53 +0100
Message-Id: <20200517193655.3895087-1-emil.l.velikov@gmail.com>
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
Cc: Liviu Dudau <liviu.dudau@arm.com>, emil.l.velikov@gmail.com,
 Mali DP Maintainers <malidp@foss.arm.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Add the COMPILE_TEST conditional, so that people can at least build test
the drivers.

Cc: Liviu Dudau <liviu.dudau@arm.com>
Cc: Brian Starkey <brian.starkey@arm.com>
Cc: Mali DP Maintainers <malidp@foss.arm.com>
Cc: dri-devel@lists.freedesktop.org
Signed-off-by: Emil Velikov <emil.l.velikov@gmail.com>
---
Please merge through the ARM tree.

Aside: would make sense to have the tree drivers in separate folders
alongside each other.

With lima and panfrost in-tree, there's little point in the extra
"display" for komeda. Might as well remove that one.
---
 drivers/gpu/drm/arm/Kconfig | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/arm/Kconfig b/drivers/gpu/drm/arm/Kconfig
index a204103b3efb..3a9e966e0e78 100644
--- a/drivers/gpu/drm/arm/Kconfig
+++ b/drivers/gpu/drm/arm/Kconfig
@@ -3,7 +3,7 @@ menu "ARM devices"
 
 config DRM_HDLCD
 	tristate "ARM HDLCD"
-	depends on DRM && OF && (ARM || ARM64)
+	depends on DRM && OF && (ARM || ARM64 || COMPILE_TEST)
 	depends on COMMON_CLK
 	select DRM_KMS_HELPER
 	select DRM_KMS_CMA_HELPER
@@ -24,7 +24,7 @@ config DRM_HDLCD_SHOW_UNDERRUN
 
 config DRM_MALI_DISPLAY
 	tristate "ARM Mali Display Processor"
-	depends on DRM && OF && (ARM || ARM64)
+	depends on DRM && OF && (ARM || ARM64 || COMPILE_TEST)
 	depends on COMMON_CLK
 	select DRM_KMS_HELPER
 	select DRM_KMS_CMA_HELPER
-- 
2.25.1

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
