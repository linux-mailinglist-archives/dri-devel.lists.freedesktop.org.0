Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E5842B18F56
	for <lists+dri-devel@lfdr.de>; Sat,  2 Aug 2025 18:13:49 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2E0FE10E174;
	Sat,  2 Aug 2025 16:13:47 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="IRfa3MRH";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ed1-f51.google.com (mail-ed1-f51.google.com
 [209.85.208.51])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C0ECE10E174
 for <dri-devel@lists.freedesktop.org>; Sat,  2 Aug 2025 16:13:46 +0000 (UTC)
Received: by mail-ed1-f51.google.com with SMTP id
 4fb4d7f45d1cf-615a115f0c0so4881722a12.0
 for <dri-devel@lists.freedesktop.org>; Sat, 02 Aug 2025 09:13:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1754151225; x=1754756025; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=WrDtMtgXDAh4aQCn1amCHGAxD2IuoC9BaP8lJI8ilpU=;
 b=IRfa3MRHcb9wB/ufnIH78n8f8JEsD86SjOfnBHxkYxX3fIccv5+1cApHcC4IvOsV1B
 sMHfq+No5ojQwdW2JGWl2TxPneSyawDfgpTwAfctLvwzVigTzeXoMwLwCN0gpw6viymI
 4Ny0QbA3fF/3P31lvTbn4GDqTyBckGIikKffL721TVERBaP52q+ARDPwS9BnK67M16v9
 X/MYMhi35OvoLJJmNnigr2ca7D02ppIsOrJ3I9kupr45qHv28gEUa/NVky4XUOwaJhEI
 qGc/xSo5Xjh1k8tB9NSTmDFiID44PPUMVUG1ML6r8AC7oPNDYECJ+ckdH9ZPJ0Sr3rya
 2FrQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1754151225; x=1754756025;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=WrDtMtgXDAh4aQCn1amCHGAxD2IuoC9BaP8lJI8ilpU=;
 b=iO+GAfYmGJPx1mXT4TCJJmv/KLZCtI3vxVzuPzfooIBoZoR4AXAjFYKyUqsXnWGncT
 btVBaIHrrURrdQQywCIL1G94ZHAneYqxv45qQuA4+c134n2n3kfbtyNUZZGNLVrFjafa
 Zf2wv9UeJxZ74fmmTFBqQr6PW7olPacC1BgEwHURagVu+ahU2H6KoA0hDpM7hC+QL9GF
 oLcU5MQ3I6ItF4JtPhSF2Qst1dm8d9H1i4rco7a+gBhncQqi/152K3ROZAakdAzqpqrH
 GHozfNbN3lRgcD2c1I/vCslQhXNeB29bC10cgCQ91gFkNoLv6OHXJmmBOn0wr+yi54Kd
 MITg==
X-Forwarded-Encrypted: i=1;
 AJvYcCVEXxkQN3SIHFbI9cz4DGC46rYTaaw4izfZmfRhpZx66qqCjQPNFdzkS/idotDof9x1fd1Ux4D8cQk=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yzx1HnWU7d3CGbD6vuDWc6kgKE9FkXRSBCsGrhRvef24a2v8bhC
 sHq2+hF2+hzuyYwo+PZdcye2cXlX7vaPvMgVuSVUidpdKd1qN+0rpFHO
X-Gm-Gg: ASbGncsprn+FnJYuIDAB0ao+VGcfdkaU6k9nqCWDAtWivAVHDQaeCGTqWZCXn9H6570
 vfQS3afzcsDfl2bWIG9kHEKmMij0wthXes3D3Kp6mEWvsO/6a/82On6RYzeGrj7ENKXz1z1oyVY
 SbiW7kGBZDbhWBQTDSa0/TAJ0+UqfL2OTakIsySTliqDXB+ng39cTkdUsqlCCHAx7SdH7GTSdc+
 UT1Raj2XYXq9s0/913xjmorwUVjXUagPNk347QinvCyjn1JIBLlr1Ogaj/6gdjScacY4rxLdbO+
 XlVMEW8oTdS+YY83o5dojgtFpJsDjABmGNAD9UXTYJGaRVz4H6aMXsjoTBtqs7M2ubORdn0rppu
 XCGxNOLoIGBEWYrJzrS3Y/MGKe3un8065/4GyCq0A0cvF6o3wVkMo5rMxyOOtwKtEZDOa7c/Dxi
 v/FZV0ysIh3MjeSgRc3i7opZ5kXSOdpZXLoublP79Yhg==
X-Google-Smtp-Source: AGHT+IGJC2NvD6UQnMiSqb/7JcSyp9498E96SzuBdZPwGcfTuVGVWWGQmPas/UULbsiTpyd/ly6LoA==
X-Received: by 2002:a17:907:6d0a:b0:ae3:e378:159e with SMTP id
 a640c23a62f3a-af940062f58mr365236066b.26.1754151224871; 
 Sat, 02 Aug 2025 09:13:44 -0700 (PDT)
Received: from hsukr3.localdomain
 (dynamic-2a02-3100-3a10-5000-2839-9355-6f35-74dc.310.pool.telefonica.de.
 [2a02:3100:3a10:5000:2839:9355:6f35:74dc])
 by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-af91a24370asm455456766b.128.2025.08.02.09.13.42
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 02 Aug 2025 09:13:44 -0700 (PDT)
From: Sukrut Heroorkar <hsukrut3@gmail.com>
To: Andrzej Hajda <andrzej.hajda@intel.com>,
 Neil Armstrong <neil.armstrong@linaro.org>, Robert Foss <rfoss@kernel.org>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Jonas Karlman <jonas@kwiboo.se>, Jernej Skrabec <jernej.skrabec@gmail.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>,
 Simona Vetter <simona@ffwll.ch>,
 dri-devel@lists.freedesktop.org (open list:DRM DRIVERS),
 linux-kernel@vger.kernel.org (open list)
Cc: skhan@linuxfoundation.org, david.hunter.linux@gmail.com,
 Sukrut Heroorkar <hsukrut3@gmail.com>
Subject: [PATCH] drm/drm_bridge: Document 'connector' parameter in
 drm_bridge_detect()
Date: Sat,  2 Aug 2025 18:13:05 +0200
Message-ID: <20250802161309.1198855-1-hsukrut3@gmail.com>
X-Mailer: git-send-email 2.43.0
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

drm: drm_bridge: fix missing parameter documentation

The function documentation was missing description for the
parameter 'connector'.

Add missing function parameter documentation for drm_bridge_detect()
to fix kernel-doc warnings.

Warning: drivers/gpu/drm/drm_bridge.c:1241 function parameter 'connector' not described in 'drm_bridge_detect'

Signed-off-by: Sukrut Heroorkar <hsukrut3@gmail.com>
---
 drivers/gpu/drm/drm_bridge.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/gpu/drm/drm_bridge.c b/drivers/gpu/drm/drm_bridge.c
index dd45d9b504d8..387a3b6cda54 100644
--- a/drivers/gpu/drm/drm_bridge.c
+++ b/drivers/gpu/drm/drm_bridge.c
@@ -1227,6 +1227,7 @@ EXPORT_SYMBOL(drm_atomic_bridge_chain_check);
 /**
  * drm_bridge_detect - check if anything is attached to the bridge output
  * @bridge: bridge control structure
+ * @connector: connector associated with the bridge
  *
  * If the bridge supports output detection, as reported by the
  * DRM_BRIDGE_OP_DETECT bridge ops flag, call &drm_bridge_funcs.detect for the
-- 
2.43.0

