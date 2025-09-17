Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 5D4FCB809F5
	for <lists+dri-devel@lfdr.de>; Wed, 17 Sep 2025 17:37:11 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9276010E09C;
	Wed, 17 Sep 2025 15:37:09 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=broadcom.com header.i=@broadcom.com header.b="aaxZx11s";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-io1-f97.google.com (mail-io1-f97.google.com
 [209.85.166.97])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B5E5F10E09C
 for <dri-devel@lists.freedesktop.org>; Wed, 17 Sep 2025 15:37:08 +0000 (UTC)
Received: by mail-io1-f97.google.com with SMTP id
 ca18e2360f4ac-88703c873d5so198851939f.3
 for <dri-devel@lists.freedesktop.org>; Wed, 17 Sep 2025 08:37:08 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1758123428; x=1758728228;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:dkim-signature:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=kI095f/hsxILwkzit50JtpRq9Ha0jASQA3zTMMsrKow=;
 b=u3dqpgH7gqJBVOuCU4FR9wRmr2d9kb6dpiYuIQ1bvBKVnm9VkTswE5DL/IRYuMMGCW
 Ezc3M81Ku6RI1LJsFSNQvVWtSTCBOB/vTOopPC4UkW4cDzGkm5NTmPk5fuKjOh6W1vIo
 rMJbl5DpFBjedrToFXmXJGiKrirqbtL7AKDl6+e2TMcieraKdZWqtpy/xW9IPoySSkmB
 J/uEFiGjTOB1NMhgp55OPho08I6E/iS48jSl7jdQFgG64hG1ywPIyBGZ9c173JBNuGio
 y/vyUByG28c2TM8HQ6SiCBA1Y8zvgdep/wpxUBXtbear7K7JIuJdOPgdzuNx8PteuB26
 5ghw==
X-Gm-Message-State: AOJu0YywX0QIW1izy+fMo9Q3/A+kQrIv9THcqDnHFXI46XBQLOIUb1YW
 XHBY+gES9oz8XS8qQZQ3Q7bGncySRVbYyj2VrdcgkJMXzByG8Lw3ZymRvC47cPU6crsaslAhWdz
 9nU8FCA8fjZK04U9lVJ86CLUDDvsSq3BjGy7oGalM7lvmwhONBwBGMLbHxbTX4eUqq3QHFKtHoX
 RN8Qcq0uH0YKlNEvIGj7ZG3MXRKLERZaRiKrDZ9I+t+bd+MD/TAqI86RqKZFAfKBa/juykpBuDN
 uVRfGD/c33PfJrC+iK7
X-Gm-Gg: ASbGncsak6OPQiivBnADYxNHuc6gjv+0WPYFxXvgSeLKpOmfzKRceONOfJ/sBwCbXUK
 I+Xx9pBtAH2XrOixcsM0VQgg+f7RKg96rtXxAkCY/bFnETFsrtOWKGQLQAkSwQrrC7VYkd0Ks1V
 6AGj0lw0Mpxr3cmhyKRJpW4EFi/hDz+KZFf+sSaI5MmdgGU6yINSUDfIgfDMYygmiOixv/ijEuG
 +/niQ0Ki+CA3UJo8pxho5oxNMA3iVhX8dp2ORiYMsEr5mBBmmHxI+I8/OM7KS1qTLDR6T2BZvRL
 VvA4ybYvW59N/JbFxe4uEAtD0paa+6nVvXx7jbGKhyncYMOAbZeXQ1tJcC0UGAxdI4Kvg/pw/1z
 rMJUcVy6PVZZ+CgAYSx317RVXHX2KqeMdSJcR5xhS5NG7J+hQwYrdM1aQ7k656ITn++GcWBu8WG
 k=
X-Google-Smtp-Source: AGHT+IHQcOgMZ4bOFX8MDXjc7I3H53kSNqzEt6Z5KkDNsqjqjcOFc0haboMMVv/dh99XzQy3l/slhvnaFNXF
X-Received: by 2002:a05:6602:48b:b0:893:656f:5481 with SMTP id
 ca18e2360f4ac-89d2603e8b0mr319146639f.12.1758123427595; 
 Wed, 17 Sep 2025 08:37:07 -0700 (PDT)
Received: from smtp-us-east1-p01-i01-si01.dlp.protect.broadcom.com
 (address-144-49-247-118.dlp.protect.broadcom.com. [144.49.247.118])
 by smtp-relay.gmail.com with ESMTPS id
 ca18e2360f4ac-89365df4199sm47547339f.1.2025.09.17.08.37.06
 for <dri-devel@lists.freedesktop.org>
 (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
 Wed, 17 Sep 2025 08:37:07 -0700 (PDT)
X-Relaying-Domain: broadcom.com
X-CFilter-Loop: Reflected
Received: by mail-qk1-f199.google.com with SMTP id
 af79cd13be357-829080582b4so822120785a.0
 for <dri-devel@lists.freedesktop.org>; Wed, 17 Sep 2025 08:37:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=broadcom.com; s=google; t=1758123425; x=1758728225;
 darn=lists.freedesktop.org; 
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=kI095f/hsxILwkzit50JtpRq9Ha0jASQA3zTMMsrKow=;
 b=aaxZx11sEvC6DytGrr37zX3YIsU898bk0qBm5VEx+cLqsE82PSYZ8GttfrmlvFIc6z
 R493Csbrf54NiwJMwjD4vQGUrAKBnJDK9c5WOl5+czx7Wn1wP5LUA2hoVngCjIQSLlbc
 392SPEbr8Zxx5nwl9ARSEugP7sq4o0oxFuQog=
X-Received: by 2002:a05:620a:f0c:b0:828:5c95:9f14 with SMTP id
 af79cd13be357-831146830c4mr269344685a.54.1758123424828; 
 Wed, 17 Sep 2025 08:37:04 -0700 (PDT)
X-Received: by 2002:a05:620a:f0c:b0:828:5c95:9f14 with SMTP id
 af79cd13be357-831146830c4mr269337785a.54.1758123424056; 
 Wed, 17 Sep 2025 08:37:04 -0700 (PDT)
Received: from localhost.localdomain
 (pool-173-49-113-140.phlapa.fios.verizon.net. [173.49.113.140])
 by smtp.gmail.com with ESMTPSA id
 af79cd13be357-8363198b184sm1947885a.51.2025.09.17.08.37.03
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 17 Sep 2025 08:37:03 -0700 (PDT)
From: Zack Rusin <zack.rusin@broadcom.com>
To: dri-devel@lists.freedesktop.org
Cc: Broadcom internal kernel review list
 <bcm-kernel-feedback-list@broadcom.com>, ian.forbes@broadcom.com,
 maaz.mombasawala@broadcom.com, Zack Rusin <zack.rusin@broadcom.com>
Subject: [PATCH] drm/vmwgfx: Fix a null-ptr access in the cursor snooper
Date: Wed, 17 Sep 2025 11:36:55 -0400
Message-ID: <20250917153655.1968583-1-zack.rusin@broadcom.com>
X-Mailer: git-send-email 2.48.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-DetectorID-Processed: b00c1d49-9d2e-4205-b15f-d015386d3d5e
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

Check that the resource which is converted to a surface exists before
trying to use the cursor snooper on it.

vmw_cmd_res_check allows explicit invalid (SVGA3D_INVALID_ID) identifiers
because some svga commands accept SVGA3D_INVALID_ID to mean "no surface",
unfortunately functions that accept the actual surfaces as objects might
(and in case of the cursor snooper, do not) be able to handle null
objects. Make sure that we validate not only the identifier (via the
vmw_cmd_res_check) but also check that the actual resource exists before
trying to do something with it.

Fixes unchecked null-ptr reference in the snooping code.

Signed-off-by: Zack Rusin <zack.rusin@broadcom.com>
Fixes: c0951b797e7d ("drm/vmwgfx: Refactor resource management")
Cc: Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>
Cc: dri-devel@lists.freedesktop.org
---
 drivers/gpu/drm/vmwgfx/vmwgfx_execbuf.c | 17 ++++++++++++-----
 1 file changed, 12 insertions(+), 5 deletions(-)

diff --git a/drivers/gpu/drm/vmwgfx/vmwgfx_execbuf.c b/drivers/gpu/drm/vmwgfx/vmwgfx_execbuf.c
index 819704ac675d..d539f25b5fbe 100644
--- a/drivers/gpu/drm/vmwgfx/vmwgfx_execbuf.c
+++ b/drivers/gpu/drm/vmwgfx/vmwgfx_execbuf.c
@@ -1497,6 +1497,7 @@ static int vmw_cmd_dma(struct vmw_private *dev_priv,
 		       SVGA3dCmdHeader *header)
 {
 	struct vmw_bo *vmw_bo = NULL;
+	struct vmw_resource *res;
 	struct vmw_surface *srf = NULL;
 	VMW_DECLARE_CMD_VAR(*cmd, SVGA3dCmdSurfaceDMA);
 	int ret;
@@ -1532,18 +1533,24 @@ static int vmw_cmd_dma(struct vmw_private *dev_priv,
 
 	dirty = (cmd->body.transfer == SVGA3D_WRITE_HOST_VRAM) ?
 		VMW_RES_DIRTY_SET : 0;
-	ret = vmw_cmd_res_check(dev_priv, sw_context, vmw_res_surface,
-				dirty, user_surface_converter,
-				&cmd->body.host.sid, NULL);
+	ret = vmw_cmd_res_check(dev_priv, sw_context, vmw_res_surface, dirty,
+				user_surface_converter, &cmd->body.host.sid,
+				NULL);
 	if (unlikely(ret != 0)) {
 		if (unlikely(ret != -ERESTARTSYS))
 			VMW_DEBUG_USER("could not find surface for DMA.\n");
 		return ret;
 	}
 
-	srf = vmw_res_to_srf(sw_context->res_cache[vmw_res_surface].res);
+	res = sw_context->res_cache[vmw_res_surface].res;
+	if (!res) {
+		VMW_DEBUG_USER("Invalid DMA surface.\n");
+		return -EINVAL;
+	}
 
-	vmw_kms_cursor_snoop(srf, sw_context->fp->tfile, &vmw_bo->tbo, header);
+	srf = vmw_res_to_srf(res);
+	vmw_kms_cursor_snoop(srf, sw_context->fp->tfile, &vmw_bo->tbo,
+			     header);
 
 	return 0;
 }
-- 
2.48.1

