Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 3305D340F05
	for <lists+dri-devel@lfdr.de>; Thu, 18 Mar 2021 21:26:37 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 556B06E973;
	Thu, 18 Mar 2021 20:26:35 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-qk1-x72d.google.com (mail-qk1-x72d.google.com
 [IPv6:2607:f8b0:4864:20::72d])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EA45B6E973;
 Thu, 18 Mar 2021 20:26:33 +0000 (UTC)
Received: by mail-qk1-x72d.google.com with SMTP id g15so614786qkl.4;
 Thu, 18 Mar 2021 13:26:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=CfWkFC2hGX7FJGJQjgEoAFgo2CeiDrhWvQ3LOmHsLm0=;
 b=Z7SJ3tKdyS+cujui3ZNLLtq2X+T9wQl4QMMIMdjqxI4cKxiO49AXbqtRBK5+uFICwY
 EjlalX53XBXReOQZADmexESUjo0EH1MQq/u5lvUoFYir2mm6icEBClYGcVQ63EoSoqO0
 MEAI4DPXejcVouHot0/h6th82uWyuMlzeTIAz3Ul44+hdyjxLdQ0muBTwiH5eHl+SiqT
 dvvkYR1O0OkO84KfKxGG29iGyTbj0eErbbN/sNN/B4iGbm7WV6Jw1zQr83qOD4NMwYOs
 fQw8BVtjufvdyhJwi+fd4vupmxUnX+k/HqnabkQD1CjxvGiEZNhDz3z+GWhk5C0cG6Km
 XoFA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=CfWkFC2hGX7FJGJQjgEoAFgo2CeiDrhWvQ3LOmHsLm0=;
 b=VpHBS5VLfQvWqEPOoYKVvUusaxjTFXgZxY/nPH1EBV+vF4aAR++swX4bsWJhZ4/ysQ
 YScaFYf8jC5PB40U3R3lvzBNcplBOQPYGvji2cv5TS7jj77IuEa0mTRo9jRc+CopChHC
 81A5M16ApgC+5WYdghHWqRGADndo57MW3Lpnq1R42chuaW4HWUYJoMHW6fljSJECrbyV
 S8ZgQ9n8JSl/lHjP6jbFcA41kSGxWdknt7IezbVBOT3mLoP9Q47VP34E584CylaANn8L
 2BUQzSP148vkrVUYfCOX47tSZRBVN0Pg+TlEKa1ySB1GxlUvSvNavmCYpO/Qh3S9yK4d
 tloA==
X-Gm-Message-State: AOAM5311vmTcTyXHreOomhYM5ElFCRtsRhAox38BHTkvCIkYbUmkSQ+2
 Jrdunu4joBhLurvBQTY6gOc=
X-Google-Smtp-Source: ABdhPJwrPO3+5RzvcpKYhHwegYfMnS5cha49OiiD3mTxGTiXFxONegDkQ+mPcpfr7/QRqj+bACLN7A==
X-Received: by 2002:a37:a0ca:: with SMTP id j193mr6255899qke.242.1616099193200; 
 Thu, 18 Mar 2021 13:26:33 -0700 (PDT)
Received: from localhost.localdomain ([37.19.198.63])
 by smtp.gmail.com with ESMTPSA id j15sm2199786qtr.34.2021.03.18.13.26.26
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 18 Mar 2021 13:26:32 -0700 (PDT)
From: Bhaskar Chowdhury <unixbhaskar@gmail.com>
To: alexander.deucher@amd.com, christian.koenig@amd.com, airlied@linux.ie,
 daniel@ffwll.ch, Hawking.Zhang@amd.com, John.Clements@amd.com,
 tao.zhou1@amd.com, guchun.chen@amd.com, Likun.Gao@amd.com,
 Bhawanpreet.Lakha@amd.com, unixbhaskar@gmail.com, ray.huang@amd.com,
 Jiansong.Chen@amd.com, amd-gfx@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org
Subject: [PATCH V2] drm/amdgpu: Fix a typo
Date: Fri, 19 Mar 2021 01:54:14 +0530
Message-Id: <20210318202414.10547-1-unixbhaskar@gmail.com>
X-Mailer: git-send-email 2.26.2
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
Cc: rdunlap@infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

s/traing/training/

...Plus the entire sentence construction for better readability.

Signed-off-by: Bhaskar Chowdhury <unixbhaskar@gmail.com>
---
 Changes from V1:
  Alex and Randy's suggestions incorporated.

 drivers/gpu/drm/amd/amdgpu/psp_v11_0.c | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/drivers/gpu/drm/amd/amdgpu/psp_v11_0.c b/drivers/gpu/drm/amd/amdgpu/psp_v11_0.c
index c325d6f53a71..bf3857867f51 100644
--- a/drivers/gpu/drm/amd/amdgpu/psp_v11_0.c
+++ b/drivers/gpu/drm/amd/amdgpu/psp_v11_0.c
@@ -661,10 +661,10 @@ static int psp_v11_0_memory_training(struct psp_context *psp, uint32_t ops)

 	if (ops & PSP_MEM_TRAIN_SEND_LONG_MSG) {
 		/*
-		 * Long traing will encroach certain mount of bottom VRAM,
-		 * saving the content of this bottom VRAM to system memory
-		 * before training, and restoring it after training to avoid
-		 * VRAM corruption.
+		 * Long training will encroach a certain amount on the bottom of VRAM;
+                 * save the content from the bottom VRAM to system memory
+                 * before training, and restore it after training to avoid
+                 * VRAM corruption.
 		 */
 		sz = GDDR6_MEM_TRAINING_ENCROACHED_SIZE;

--
2.26.2

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
