Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 2834ACDBB54
	for <lists+dri-devel@lfdr.de>; Wed, 24 Dec 2025 09:57:13 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8DFB110E1E0;
	Wed, 24 Dec 2025 08:57:10 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=broadcom.com header.i=@broadcom.com header.b="NTYIqWxs";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-qk1-f226.google.com (mail-qk1-f226.google.com
 [209.85.222.226])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F338210E1E0
 for <dri-devel@lists.freedesktop.org>; Wed, 24 Dec 2025 08:57:08 +0000 (UTC)
Received: by mail-qk1-f226.google.com with SMTP id
 af79cd13be357-8bc53dae8c2so865405785a.2
 for <dri-devel@lists.freedesktop.org>; Wed, 24 Dec 2025 00:57:08 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1766566627; x=1767171427;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:dkim-signature:x-gm-gg:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=VerAfBullZiHp/WWvzSGqbTxnUFTnHi0CQ8Rn/jBT1o=;
 b=Nrr+/KKxDADFeA2VjyKttK5Uc8JOif/2SoE7bWkD6Npe/RekacxNjtVDOh3J6oV3OU
 NYC3kgFScHRfCpGpE7tXGupyYhCSwr3gxQ7XPptyFl7jh2qO51rt5tqj6oEL948LRR3p
 qYmAZiATrw38DTeuAR8iI9rmTnmViy1ns05rnxe6B5gH4T6bfqK7WuDhkLYXJSXcKQXg
 ijZ5Wk7ZmUsBwp0IE0Y1D7am71lkctpNjsatZ3HmFln/rTgSeLVTihjmZKdlixpGbhUa
 jqb4HQYPlNtskiJXSxHv5zGkqE0ZRWWLoZtSqEG3wG9lA1b3K3+MsDeXeGWk7qckQQ6i
 x0Ew==
X-Forwarded-Encrypted: i=1;
 AJvYcCU8EAI2JOmorqsTuDG/e0x5ren7031tNttss1Z7yFOs7Ii2mPqACpaD2ROdnI7x1Sqvb8oXWtw/4rA=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yz4dbm67FO4RMmhnpS2XBIn0Y3vDZIF+nXmMwu7HabOiz+bwQjb
 jo2OyPzjPHpQTa3tXE7eQY6BEi/P9oOOZl04aIw/5fC4rZUax7eTEBJOlfksZYlf/Pc1/VZHago
 VsYljdD27H2Lgf4zNg3qv9D22tqU0lSrFxCSFJZi3s5oZ8/YB2Nfxv2xL4PC9uByzmGSaAjcK4H
 duWK5z8TIRcu4SUGTXb7B2E+bO7HQnpsAgV6RCdho7sioDRSJ48u7FRKff49gTRrnR9j3Xf/biw
 FH7KI0ilCKEuBQejxrd5wZRnffLuQ==
X-Gm-Gg: AY/fxX4/aVinbb4s6szDa15LAeR+GpV7F0+fV4sXdZ/EnqHvmEyB1pWboojE3OHnVmD
 Bf1/yUCcrIXyeUbM0zuicanFoE6pqdtFhH1nhdGoFh+WiVhXcfxDBlKoELDFzMtTtzRWRY77ZCK
 v/tzJS+v6xMov3BMXfkYL5Dx+1CnZQV05g0YjGIGYxr+KjNUnI1ZGKwX1r92Sq2tUR7m6F5P/zC
 mUVaZSPKgo33q5eXtnnN/YyrOio0LwthW69BJ4sycyCz4idc+zwtCa8I/AYe7zDf8VdaDnvf03j
 p9lDVvcty4GPMiShhfXt96HHmTfGRwVwLikzZddZadQV5MzaTVEmkciBeGWzQspkXiESODVUUxW
 /INZiawcqnq+yLwpHKbjaV+cgHPz/cWLLMoJ2lV+j1+/DU2jP8Fm38VMc0gVAJlUdOCeb0Z54Jy
 dRyMjeVLPA2am/8n/H7EHXI2kRBgfgWzKXyiOmU+Xwa047gIif
X-Google-Smtp-Source: AGHT+IFEi6lYPrcyB9Lcfor56EAIB0REdy7tsj6O+tey7lwmeW/D69WMEQXN3fIx1jiNLDLGp40Ca5fgKzwZ
X-Received: by 2002:a05:620a:f03:b0:8a3:87ef:9245 with SMTP id
 af79cd13be357-8c08fd1a9d5mr2463518085a.85.1766566627033; 
 Wed, 24 Dec 2025 00:57:07 -0800 (PST)
Received: from smtp-us-east1-p01-i01-si01.dlp.protect.broadcom.com
 (address-144-49-247-19.dlp.protect.broadcom.com. [144.49.247.19])
 by smtp-relay.gmail.com with ESMTPS id
 af79cd13be357-8c096dcefc6sm177400085a.8.2025.12.24.00.57.06
 for <dri-devel@lists.freedesktop.org>
 (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
 Wed, 24 Dec 2025 00:57:07 -0800 (PST)
X-Relaying-Domain: broadcom.com
X-CFilter-Loop: Reflected
Received: by mail-pg1-f197.google.com with SMTP id
 41be03b00d2f7-b62da7602a0so5919780a12.2
 for <dri-devel@lists.freedesktop.org>; Wed, 24 Dec 2025 00:57:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=broadcom.com; s=google; t=1766566625; x=1767171425;
 darn=lists.freedesktop.org; 
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=VerAfBullZiHp/WWvzSGqbTxnUFTnHi0CQ8Rn/jBT1o=;
 b=NTYIqWxsoaPhGyHnycCiZkm2SfnenvO96S05H6/Et69SjmMhBO08eiz/R/6tMOmbKV
 jsRtU/Cc/HC5ll78V9XPv0G1rk9VtZoqyRKmJhzbosH0k5cSGFt4PY7QJSnsJp8UXG4y
 E/wEMvNqiFLHAgGZTzCakVfuMBN2wr/9KXOAE=
X-Forwarded-Encrypted: i=1;
 AJvYcCXbGC7y8vyxUoXWFj42uLaw+qLZPZQ+DHj9hi+efwzk9HhwH2NsZAvRL1p5Z2Aw4JpzL1S7vV8Hq8s=@lists.freedesktop.org
X-Received: by 2002:a05:693c:809a:b0:2b0:5609:a593 with SMTP id
 5a478bee46e88-2b05ebd0cd4mr16134862eec.16.1766566624965; 
 Wed, 24 Dec 2025 00:57:04 -0800 (PST)
X-Received: by 2002:a05:693c:809a:b0:2b0:5609:a593 with SMTP id
 5a478bee46e88-2b05ebd0cd4mr16134846eec.16.1766566624413; 
 Wed, 24 Dec 2025 00:57:04 -0800 (PST)
Received: from shivania.lvn.broadcom.net ([192.19.161.250])
 by smtp.gmail.com with ESMTPSA id
 5a478bee46e88-2b06a046e99sm43516490eec.6.2025.12.24.00.57.03
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 24 Dec 2025 00:57:04 -0800 (PST)
From: Shivani Agarwal <shivani.agarwal@broadcom.com>
To: stable@vger.kernel.org,
	gregkh@linuxfoundation.org
Cc: zack.rusin@broadcom.com, bcm-kernel-feedback-list@broadcom.com,
 maarten.lankhorst@linux.intel.com, mripard@kernel.org, tzimmermann@suse.de,
 simona@ffwll.ch, airlied@gmail.com, brianp@vmware.com, dtor@vmware.com,
 airlied@redhat.com, thellstrom@vmware.com, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, ajay.kaher@broadcom.com,
 alexey.makhalov@broadcom.com, vamsi-krishna.brahmajosyula@broadcom.com,
 yin.ding@broadcom.com, tapas.kundu@broadcom.com,
 Kuzey Arda Bulut <kuzeyardabulut@gmail.com>,
 Ian Forbes <ian.forbes@broadcom.com>, Sasha Levin <sashal@kernel.org>,
 Shivani Agarwal <shivani.agarwal@broadcom.com>
Subject: [PATCH v5.10-v6.1] drm/vmwgfx: Fix a null-ptr access in the cursor
 snooper
Date: Wed, 24 Dec 2025 00:36:52 -0800
Message-Id: <20251224083652.614902-1-shivani.agarwal@broadcom.com>
X-Mailer: git-send-email 2.25.1
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

From: Zack Rusin <zack.rusin@broadcom.com>

[ Upstream commit 5ac2c0279053a2c5265d46903432fb26ae2d0da2 ]

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
Reported-by: Kuzey Arda Bulut <kuzeyardabulut@gmail.com>
Cc: Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>
Cc: dri-devel@lists.freedesktop.org
Reviewed-by: Ian Forbes <ian.forbes@broadcom.com>
Link: https://lore.kernel.org/r/20250917153655.1968583-1-zack.rusin@broadcom.com
Signed-off-by: Sasha Levin <sashal@kernel.org>
[Shivani: Modified to apply on v5.10.y-v6.1.y]
Signed-off-by: Shivani Agarwal <shivani.agarwal@broadcom.com>
---
 drivers/gpu/drm/vmwgfx/vmwgfx_execbuf.c | 17 ++++++++++++-----
 1 file changed, 12 insertions(+), 5 deletions(-)

diff --git a/drivers/gpu/drm/vmwgfx/vmwgfx_execbuf.c b/drivers/gpu/drm/vmwgfx/vmwgfx_execbuf.c
index 0d12d6af6..5d3827b5d 100644
--- a/drivers/gpu/drm/vmwgfx/vmwgfx_execbuf.c
+++ b/drivers/gpu/drm/vmwgfx/vmwgfx_execbuf.c
@@ -1507,6 +1507,7 @@ static int vmw_cmd_dma(struct vmw_private *dev_priv,
 		       SVGA3dCmdHeader *header)
 {
 	struct vmw_buffer_object *vmw_bo = NULL;
+	struct vmw_resource *res;
 	struct vmw_surface *srf = NULL;
 	VMW_DECLARE_CMD_VAR(*cmd, SVGA3dCmdSurfaceDMA);
 	int ret;
@@ -1542,18 +1543,24 @@ static int vmw_cmd_dma(struct vmw_private *dev_priv,
 
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
 
-	vmw_kms_cursor_snoop(srf, sw_context->fp->tfile, &vmw_bo->base, header);
+	srf = vmw_res_to_srf(res);
+	vmw_kms_cursor_snoop(srf, sw_context->fp->tfile, &vmw_bo->base,
+			     header);
 
 	return 0;
 }
-- 
2.40.4

