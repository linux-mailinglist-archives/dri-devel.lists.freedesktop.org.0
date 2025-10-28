Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 0FAE4C16946
	for <lists+dri-devel@lfdr.de>; Tue, 28 Oct 2025 20:16:23 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6CBC910E648;
	Tue, 28 Oct 2025 19:16:21 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="jMU6VmCp";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-f42.google.com (mail-wr1-f42.google.com
 [209.85.221.42])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B087A10E645
 for <dri-devel@lists.freedesktop.org>; Tue, 28 Oct 2025 19:16:19 +0000 (UTC)
Received: by mail-wr1-f42.google.com with SMTP id
 ffacd0b85a97d-4285169c005so3025075f8f.0
 for <dri-devel@lists.freedesktop.org>; Tue, 28 Oct 2025 12:16:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1761678978; x=1762283778; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=6Nm3E4MKpYHM3eDwwralpb5B+mems99sHN7CXPQYlpw=;
 b=jMU6VmCpjbzViWJJudES8hQ6kVG/3pshg/hTSojmHtqETNb5CXoZauHv6VQK60OJDK
 VyfdaZeB5Rdcw2OTAdfrZ8V3vN1DiTTIgOEdkzw4QlhOqGHuqU8j0TbxrjNhTg+k1OBS
 j6P0nW8MiAw9ZpG3yLsWRa486y+VmNWqrr82L3TSRD+Yq9O2udFCLZM1tgxb2yj6Llbt
 p5sh5j4QdgfXfuURdtxglg4y1uzYmO/LGaO1HBfwtTAdEBhbL23EgUL9//giAM+GpkWu
 r6tEtBPKUijNk5K4Mgx4phItwTe7rHc2Xy+ga0aaqxiMYTq5s650GS+rv6yovuafeh9h
 QiBw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1761678978; x=1762283778;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=6Nm3E4MKpYHM3eDwwralpb5B+mems99sHN7CXPQYlpw=;
 b=lq+u4K1AUFQ/bkbAFig+FHGNGzW58yI1hdTz2ymnNrAFk08qnRrGSy3B5aJ5eSehne
 wZWHc8qiFel246DioNCOfukVgVtA0WZzXLuc+FdsrR6BwIb+GciL2UoyMkUXF9PmRkVq
 JsyY5xrO3iTE8Q+VqIm4OhYbGFLfhWluuvReqSsfkXTYnNY3bxifTqLPyTC76qfEez32
 fGC2MBP8xCx4JS1E7YPsqTZMcbm1D/LboUCe7DbcftFBKan8fDk2HPii4/3o33LE2dA1
 jqFZWZbIvjC6eihR4zl8KMJ9Q149MjYSoy4RStjh4CRwWGxNMLPes229HxJ5ACE2Jdfc
 S97w==
X-Forwarded-Encrypted: i=1;
 AJvYcCVfkRoIGpdrquZ3kV2aOVyiCMdBE/eRp+cvJTKbmxCLDCLSJPkI3m2YkHk6ei98vG8lQcj0MRQTq7g=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yyq0yWP8t6h2vvqsXKieeGR3XsT82m9hX+t0CoCgiBwCHSpqCD6
 xDD60NKoAlVXM0jA+vlhlt5tGMruLMDvK7Ntv77E01P5dlek3+93srV/
X-Gm-Gg: ASbGnctyIvuFXTD5uSKl30Druw8SHPRE2zgIlG5rL5rDP2J7BG0NPw9xb+nnYJHBd17
 Dpxtw1DCFlnMA5uFJuycI1MQuHfDdroUYrdcgsg+nBPkvyIzz8H1ic4BLCLXK4XgIpfr3XtfuIk
 rUBYUbI1A4VMhtxZ1N2wDSnbmFWSxcdcl/dPPTje5oc81ck3uLYGLD+CM5h5xygRe/J1iguTBjn
 uZdD5/EYgAqYfRTOWEATdzA8m5of1IQP60oo0AL3bdITdd2SG23pVIew3xiMCJC2+PBKXzs8XcQ
 dTFOZ9trp0KvSyVb1EYM+X8ICV1D/Ca4IOwg9BCtc2inguLqns0UMBlJeZt4zVNWEZmP2mW78oK
 kPm56Jf1v3CtWCczdnv9JX9BpA/KjaFU4NJ8I4ustpTAtKpECFLWYcWpErivZeKMa2mXoS4aUWA
 x/+jNIep4x7+epOJE/73JAqDIlCJF27NJBhmWsrBLL5vngQV5GNGSY+DpHXkM=
X-Google-Smtp-Source: AGHT+IHffoMv5k0CgidXAMVyKRHrRcXi4iDRyKmMUzXSwiqt2PVTWsko8mfU0XNy6JLFIyM8tRxTSQ==
X-Received: by 2002:a05:6000:26d0:b0:3e9:2fea:6795 with SMTP id
 ffacd0b85a97d-429aefcaa41mr153239f8f.53.1761678977999; 
 Tue, 28 Oct 2025 12:16:17 -0700 (PDT)
Received: from dell (229.red-88-1-12.dynamicip.rima-tde.net. [88.1.12.229])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-429952cbb2bsm22256326f8f.13.2025.10.28.12.16.17
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 28 Oct 2025 12:16:17 -0700 (PDT)
From: Javier Garcia <rampxxxx@gmail.com>
To: deller@gmx.de
Cc: linux-fbdev@vger.kernel.org, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, shuah@kernel.org,
 Javier Garcia <rampxxxx@gmail.com>
Subject: [PATCH v2] fbdev: vga16fb: Request memory region.
Date: Tue, 28 Oct 2025 20:16:15 +0100
Message-ID: <20251028191615.2765711-1-rampxxxx@gmail.com>
X-Mailer: git-send-email 2.50.1
In-Reply-To: <6c565f4c-ef05-45f2-9a82-cbba4a11cc07@gmx.de>
References: <6c565f4c-ef05-45f2-9a82-cbba4a11cc07@gmx.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
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

This patch reserve and release VGA memory region.

This align with Documentation/drm/todo.rst
"Request memory regions in all fbdev drivers"

I've tested with 32bits kernel and qemu.

Signed-off-by: Javier Garcia <rampxxxx@gmail.com>
---
v1 -> v2:
      * Add release in vga16fb_remove , thanks Helge Deller.
      * v1 https://lore.kernel.org/lkml/20251016171845.1397153-1-rampxxxx@gmail.com/

 drivers/video/fbdev/vga16fb.c | 9 +++++++++
 1 file changed, 9 insertions(+)

diff --git a/drivers/video/fbdev/vga16fb.c b/drivers/video/fbdev/vga16fb.c
index eedab14c7d51..208e3eefb3ff 100644
--- a/drivers/video/fbdev/vga16fb.c
+++ b/drivers/video/fbdev/vga16fb.c
@@ -1319,6 +1319,11 @@ static int vga16fb_probe(struct platform_device *dev)
 	if (ret)
 		return ret;
 
+	if (!request_mem_region(vga16fb_fix.smem_start, vga16fb_fix.smem_len,
+				"vga16b")) {
+		dev_err(&dev->dev,"vga16b: cannot reserve video memory at 0x%lx\n",
+		       vga16fb_fix.smem_start);
+	}
 	printk(KERN_DEBUG "vga16fb: initializing\n");
 	info = framebuffer_alloc(sizeof(struct vga16fb_par), &dev->dev);
 
@@ -1398,6 +1403,8 @@ static int vga16fb_probe(struct platform_device *dev)
  err_ioremap:
 	framebuffer_release(info);
  err_fb_alloc:
+	release_mem_region(vga16fb_fix.smem_start,
+		    vga16fb_fix.smem_len);
 	return ret;
 }
 
@@ -1407,6 +1414,8 @@ static void vga16fb_remove(struct platform_device *dev)
 
 	if (info)
 		unregister_framebuffer(info);
+	release_mem_region(vga16fb_fix.smem_start,
+		    vga16fb_fix.smem_len);
 }
 
 static const struct platform_device_id vga16fb_driver_id_table[] = {
-- 
2.50.1

