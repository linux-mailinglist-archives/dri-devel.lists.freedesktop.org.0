Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id BF6B089AA38
	for <lists+dri-devel@lfdr.de>; Sat,  6 Apr 2024 11:48:19 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F16B010E10C;
	Sat,  6 Apr 2024 09:48:17 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="k/x6q/wi";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pf1-f182.google.com (mail-pf1-f182.google.com
 [209.85.210.182])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A008210E10C
 for <dri-devel@lists.freedesktop.org>; Sat,  6 Apr 2024 09:48:16 +0000 (UTC)
Received: by mail-pf1-f182.google.com with SMTP id
 d2e1a72fcca58-6ed150119f6so204945b3a.1
 for <dri-devel@lists.freedesktop.org>; Sat, 06 Apr 2024 02:48:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1712396896; x=1713001696; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=48v1DyWIRGHgOWn3r5CxOJNWFsbPTbw0i9C5xk0EDEI=;
 b=k/x6q/wi0QoXpCxOLn9H2VPIvKqAZ3z/s4T2EReugEdnlWviNrs4EBMtdn3Y0hbYod
 YD96h0L/PC04anbK9otUDVARsJZLNP08258vwlwVkIJjciBpvv81OVvRq/pwk0SxF9V9
 mh7fB9AGhC5DedVuUobEnnQq4ww1FCIqfO1MFNj4gNV7GlPEYGpUdJuylSD0t/ePTKJE
 ZyVEzRHgFjNBhLLs5usFtOBOmx1dvivlLEtKpX3egvMHrcVbaODTw+hoP18wgVxcT1ej
 O5PxrP4TAhaeLpLwqayBMLouB/X9AEn46E7wiCPcO3yTn4sOyicFrh1BY23bfQnWYqTO
 YnFw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1712396896; x=1713001696;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=48v1DyWIRGHgOWn3r5CxOJNWFsbPTbw0i9C5xk0EDEI=;
 b=rINl+9YDnNx71cGdj8/9JgMmdce+3aY3eiUQrvmWPDYIJxnz5TaXj4YQXcF4PFuO/Y
 CgPCxdnO+qy3IC2NUKGr4dibzjcikdMoN8R192g1ZJbTZp9hVu2yRlWFNbBSNujd42yC
 rgyg6ZRMIAOURLhCFFOSxEjnQdaDY/dHSgraT3L1rYbiISomYUn3lKjHa5Qg0xCnPZ88
 IX5moenNq58DYsOwYg611fDnzeXw/NaFEKyKi9cmplch5DAztG1g9yGYdUjpR9PPT1bq
 pVKUxc37ztXqYPQi89nfWZqnNOYa1cOhhDti6Nu5k+FditJfZ/+Ln93PefVwfUT5IyKL
 UAaw==
X-Gm-Message-State: AOJu0Yy3DMkLWNon4ThkxjbJu8M36TczEw+m+Ry6+ObZjI4RHCbua6yM
 TXb+CSK3QkZPFA0e9AVHswy/OcG/nuAHpwrWzjinTXdm3FwedU+E
X-Google-Smtp-Source: AGHT+IGCWcAU2MpP1I6UGGQFKMtNKfCgiiUZSakrZ9PbkmO4OoKTK7qFHCDjW0zqxVNfGpmgqJ2uKw==
X-Received: by 2002:a05:6a20:8423:b0:1a3:ac20:e204 with SMTP id
 c35-20020a056a20842300b001a3ac20e204mr4823805pzd.3.1712396895877; 
 Sat, 06 Apr 2024 02:48:15 -0700 (PDT)
Received: from kernel.. ([2402:e280:214c:86:6906:a9a6:61b7:7791])
 by smtp.gmail.com with ESMTPSA id
 it10-20020a056a00458a00b006ece7862035sm2855249pfb.128.2024.04.06.02.47.53
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 06 Apr 2024 02:48:05 -0700 (PDT)
From: R SUNDAR <prosunofficial@gmail.com>
To: airlied@gmail.com, daniel@ffwll.ch, dmitry.baryshkov@linaro.org,
 ankit.k.nautiyal@intel.com, mripard@kernel.org, jani.nikula@intel.com,
 quic_abhinavk@quicinc.com, imre.deak@intel.com, dianders@chromium.org,
 mitulkumar.ajitkumar.golani@intel.com
Cc: dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 R SUNDAR <prosunofficial@gmail.com>
Subject: [PATCH] Fix for kernel doc warning
Date: Sat,  6 Apr 2024 15:17:40 +0530
Message-Id: <20240406094740.7143-1-prosunofficial@gmail.com>
X-Mailer: git-send-email 2.34.1
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

[linux-next] Changed enum name to field name to fix kernel doc warning.

./include/drm/display/drm_dp_helper.h:126: warning: Function parameter or struct member 'mode' not described in 'drm_dp_as_sdp'
./include/drm/display/drm_dp_helper.h:126: warning: Excess struct member 'operation_mode' description in 'drm_dp_as_sdp'

Signed-off-by: R SUNDAR <prosunofficial@gmail.com>
---
 include/drm/display/drm_dp_helper.h | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/include/drm/display/drm_dp_helper.h b/include/drm/display/drm_dp_helper.h
index baf9949ff96f..6799f57d635c 100644
--- a/include/drm/display/drm_dp_helper.h
+++ b/include/drm/display/drm_dp_helper.h
@@ -112,7 +112,7 @@ struct drm_dp_vsc_sdp {
  * @target_rr: Target Refresh
  * @duration_incr_ms: Successive frame duration increase
  * @duration_decr_ms: Successive frame duration decrease
- * @operation_mode: Adaptive Sync Operation Mode
+ * @mode: Adaptive Sync Operation Mode
  */
 struct drm_dp_as_sdp {
 	unsigned char sdp_type;
-- 
2.34.1

