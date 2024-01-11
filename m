Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D6C3082A974
	for <lists+dri-devel@lfdr.de>; Thu, 11 Jan 2024 09:51:24 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8B22210E82A;
	Thu, 11 Jan 2024 08:50:47 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from m16.mail.126.com (m16.mail.126.com [220.197.31.6])
 by gabe.freedesktop.org (Postfix) with ESMTP id 6F52110E070;
 Thu, 11 Jan 2024 03:29:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=126.com;
 s=s110527; h=From:Subject:Date:Message-Id; bh=JakblxmWyy+zHXn5+u
 HJsxOT+5Y0ss6Ei99IbnkKdCI=; b=pzst5lYlPbG3QubNR8fEvTTH97wRt+RGGb
 c0tXxM0Hkk60+mNYH8yDIkhePCIcTuiIAzCauu0aBMSwA0EQVAXCBilBWCCyDJOy
 W7RkE29ZSEy21NsuRIkJGZSWmYBTfBGJozUP/VXx2z63Xf4MxAuiaKLdU1kDoSx7
 0oyVTKXfA=
Received: from localhost.localdomain (unknown [182.148.14.173])
 by gzga-smtp-mta-g1-4 (Coremail) with SMTP id _____wD3P8BnYJ9lb+ouAA--.13966S2;
 Thu, 11 Jan 2024 11:28:39 +0800 (CST)
From: chenxuebing <chenxb_99091@126.com>
To: daniel@ffwll.ch, alexander.deucher@amd.com, airlied@gmail.com,
 Xinhui.Pan@amd.com, christian.koenig@amd.com
Subject: [PATCH] drm/amdgpu: Clean up errors in cgs_common.h
Date: Thu, 11 Jan 2024 03:28:37 +0000
Message-Id: <20240111032837.7666-1-chenxb_99091@126.com>
X-Mailer: git-send-email 2.17.1
X-CM-TRANSID: _____wD3P8BnYJ9lb+ouAA--.13966S2
X-Coremail-Antispam: 1Uf129KBjvJXoW7uw1fCF4rJry8GFW8ur47CFg_yoW8trWfpa
 98Aa45tr4Ut3y7u3y7XF15Wa43K3WjgFWxuFy8Cwn2gryqkr97tFZ0qw4Fkr17XFW8CFyU
 tF1UX3yj9w4UAFUanT9S1TB71UUUUU7qnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
 9KBjDUYxBIdaVFxhVjvjDU0xZFpf9x0zRijjPUUUUU=
X-Originating-IP: [182.148.14.173]
X-CM-SenderInfo: hfkh05lebzmiizr6ij2wof0z/1tbiHARixWV2zz-RcgAAs-
X-Mailman-Approved-At: Thu, 11 Jan 2024 08:50:44 +0000
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
Cc: dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 amd-gfx@lists.freedesktop.org, chenxuebing <chenxb_99091@126.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Fix the following errors reported by checkpatch:

ERROR: open brace '{' following struct go on the same line
ERROR: space required after that ',' (ctx:VxV)

Signed-off-by: chenxuebing <chenxb_99091@126.com>
---
 drivers/gpu/drm/amd/include/cgs_common.h | 23 +++++++++++------------
 1 file changed, 11 insertions(+), 12 deletions(-)

diff --git a/drivers/gpu/drm/amd/include/cgs_common.h b/drivers/gpu/drm/amd/include/cgs_common.h
index 60a6536ff656..f40b6a03fe63 100644
--- a/drivers/gpu/drm/amd/include/cgs_common.h
+++ b/drivers/gpu/drm/amd/include/cgs_common.h
@@ -149,27 +149,26 @@ struct cgs_ops {
 
 struct cgs_os_ops; /* To be define in OS-specific CGS header */
 
-struct cgs_device
-{
+struct cgs_device {
 	const struct cgs_ops *ops;
 	/* to be embedded at the start of driver private structure */
 };
 
 /* Convenience macros that make CGS indirect function calls look like
  * normal function calls */
-#define CGS_CALL(func,dev,...) \
+#define CGS_CALL(func, dev, ...) \
 	(((struct cgs_device *)dev)->ops->func(dev, ##__VA_ARGS__))
-#define CGS_OS_CALL(func,dev,...) \
+#define CGS_OS_CALL(func, dev, ...) \
 	(((struct cgs_device *)dev)->os_ops->func(dev, ##__VA_ARGS__))
 
-#define cgs_read_register(dev,offset)		\
-	CGS_CALL(read_register,dev,offset)
-#define cgs_write_register(dev,offset,value)		\
-	CGS_CALL(write_register,dev,offset,value)
-#define cgs_read_ind_register(dev,space,index)		\
-	CGS_CALL(read_ind_register,dev,space,index)
-#define cgs_write_ind_register(dev,space,index,value)		\
-	CGS_CALL(write_ind_register,dev,space,index,value)
+#define cgs_read_register(dev, offset)		\
+	CGS_CALL(read_register, dev, offset)
+#define cgs_write_register(dev, offset, value)		\
+	CGS_CALL(write_register, dev, offset, value)
+#define cgs_read_ind_register(dev, space, index)		\
+	CGS_CALL(read_ind_register, dev, space, index)
+#define cgs_write_ind_register(dev, space, index, value)		\
+	CGS_CALL(write_ind_register, dev, space, index, value)
 
 #define cgs_get_firmware_info(dev, type, info)	\
 	CGS_CALL(get_firmware_info, dev, type, info)
-- 
2.17.1

