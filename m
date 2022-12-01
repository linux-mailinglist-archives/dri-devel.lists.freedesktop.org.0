Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 7F23163F43F
	for <lists+dri-devel@lfdr.de>; Thu,  1 Dec 2022 16:39:12 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D669610E621;
	Thu,  1 Dec 2022 15:39:04 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x432.google.com (mail-wr1-x432.google.com
 [IPv6:2a00:1450:4864:20::432])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AD66610E621;
 Thu,  1 Dec 2022 15:39:01 +0000 (UTC)
Received: by mail-wr1-x432.google.com with SMTP id x17so3298416wrn.6;
 Thu, 01 Dec 2022 07:39:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=3m4lR5iK2kmxABfa43t2m8SIZD2ax3y9Sc1+j5dpKAI=;
 b=LCvjsgK+CJig+4ldDaHtFllWv0RCXqDGiuaOGqkjxBb/MbaSDbgyGe8l5JV7Z3DaSq
 B+W6IKfOnodpVe5JClUu5OsuMWLyEPvYKKLVjnNPI0+6qOrFifEAksE2dZwvAPPte+CN
 5lFsUJgwit1WV0Tb1OYfRLSWPiQNXcscdrCdY3jfBeya7akC1csG9oSaXW4tAtdgeACM
 uMaQ5bgpr4hpzXSRl6AIwODi17mlcQaiNMbD1ZC50MfuJC7OVCvRM3Q8JwoIBhAAD5IT
 Hkpk4KatoTm8DhzKoHgz342mSym9AWuFnCduxmvMyR+NZc4FzUp+2A3S5tXqXJuCPGGc
 sUuQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=3m4lR5iK2kmxABfa43t2m8SIZD2ax3y9Sc1+j5dpKAI=;
 b=TWEQcwHqWYthx0i285tWlTN5/HQkZupSyVQGyvoDpAJn1vYGapDD7mKCh/BRETfWXD
 PdWRyMFiEglhvux1z1pZROV7H3d7dKwkTWToXoJRb0RnPEH1iUQ5Y/sOPt7SQfZ0bJQt
 DEKU8sOad0yJ2vTJAxOlp9zxGP+0B6hGWlOFOLnC0lSZsf2dYrdAD4A1uqk+hCIn4jRx
 lGSKVgab95fuBHVC17dxIgEKd27TYSxC1Vk4HiQI7clylkvwlQPtGqAG1RqQesE9vvW7
 iLL6vZ4oNRjWj20xBxWWRcc1FcBINZYGrehOB/oTdNKbxmEQIDhIB10ceoRp6u8N6Klu
 yjjA==
X-Gm-Message-State: ANoB5pmSsdcBYgqVLoMSD4Cr82wDwciQYagB5XiL6dOS7IwcXjDerIFB
 M/uiECJLhJF/vVPSMGS2CG8=
X-Google-Smtp-Source: AA0mqf4YF2ImTRWdFV3LVCym0LVVnvPdj5LT9uGv92FB1Bh89MJf2KmQ3XjU18ekZuWMau74F8S5mg==
X-Received: by 2002:a5d:6210:0:b0:22e:6a6f:3416 with SMTP id
 y16-20020a5d6210000000b0022e6a6f3416mr40531398wru.60.1669909140115; 
 Thu, 01 Dec 2022 07:39:00 -0800 (PST)
Received: from wlan-cl-kit-cs-172-17-20-201.scc.kit.edu
 ([2a00:1398:9:fb03:6341:588f:5b6d:9173])
 by smtp.gmail.com with ESMTPSA id
 fn7-20020a05600c688700b003c6b70a4d69sm5523597wmb.42.2022.12.01.07.38.59
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 01 Dec 2022 07:38:59 -0800 (PST)
From: Peter Maucher <bellosilicio@gmail.com>
To: alexander.deucher@amd.com, amd-gfx@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org, linux-doc@vger.kernel.org,
 linux-kernel@vger.kernel.org
Subject: [PATCH 1/3] drm/amdgpu: improve GART and GTT documentation
Date: Thu,  1 Dec 2022 16:38:20 +0100
Message-Id: <20221201153820.257570-2-bellosilicio@gmail.com>
X-Mailer: git-send-email 2.38.1
In-Reply-To: <20221201153820.257570-1-bellosilicio@gmail.com>
References: <20221201153820.257570-1-bellosilicio@gmail.com>
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
Cc: Peter Maucher <bellosilicio@gmail.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Document difference between amdgpu.gartsize and amdgpu.gttsize
module parameters, as initially explained by Alex Deucher here:
https://lists.freedesktop.org/archives/dri-devel/2022-October/375358.html

Signed-off-by: Peter Maucher <bellosilicio@gmail.com>
---
 drivers/gpu/drm/amd/amdgpu/amdgpu_drv.c | 11 ++++++-----
 1 file changed, 6 insertions(+), 5 deletions(-)

diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_drv.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_drv.c
index bf2d50c8c92a..d647836ba7b8 100644
--- a/drivers/gpu/drm/amd/amdgpu/amdgpu_drv.c
+++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_drv.c
@@ -230,17 +230,18 @@ module_param_named(vis_vramlimit, amdgpu_vis_vram_limit, int, 0444);
 
 /**
  * DOC: gartsize (uint)
- * Restrict the size of GART in Mib (32, 64, etc.) for testing. The default is -1 (The size depends on asic).
+ * Restrict the size of GART (for kernel use) in Mib (32, 64, etc.) for testing.
+ * The default is -1 (The size depends on asic).
  */
-MODULE_PARM_DESC(gartsize, "Size of GART to setup in megabytes (32, 64, etc., -1=auto)");
+MODULE_PARM_DESC(gartsize, "Size of kernel GART to setup in megabytes (32, 64, etc., -1=auto)");
 module_param_named(gartsize, amdgpu_gart_size, uint, 0600);
 
 /**
  * DOC: gttsize (int)
- * Restrict the size of GTT domain in MiB for testing. The default is -1 (It's VRAM size if 3GB < VRAM < 3/4 RAM,
- * otherwise 3/4 RAM size).
+ * Restrict the size of GTT domain (for userspace usage) in MiB for testing.
+ * The default is -1 (It's VRAM size if 3GB < VRAM < 3/4 RAM, otherwise 3/4 RAM size).
  */
-MODULE_PARM_DESC(gttsize, "Size of the GTT domain in megabytes (-1 = auto)");
+MODULE_PARM_DESC(gttsize, "Size of the GTT userspace domain in megabytes (-1 = auto)");
 module_param_named(gttsize, amdgpu_gtt_size, int, 0600);
 
 /**
-- 
2.38.1

