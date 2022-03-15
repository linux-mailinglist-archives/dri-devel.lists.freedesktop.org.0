Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 71EED4DA3F2
	for <lists+dri-devel@lfdr.de>; Tue, 15 Mar 2022 21:24:55 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 86FF010E3F3;
	Tue, 15 Mar 2022 20:24:53 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x432.google.com (mail-wr1-x432.google.com
 [IPv6:2a00:1450:4864:20::432])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 442E710E3E6;
 Tue, 15 Mar 2022 20:24:52 +0000 (UTC)
Received: by mail-wr1-x432.google.com with SMTP id h15so185476wrc.6;
 Tue, 15 Mar 2022 13:24:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=SLLTqIhVx97asbYPr4Ba30RhGW0/k9gGUJ6yMqUQca8=;
 b=HGVwT2u8w1di/2Ba6Mr3uF7wANvgMQhwksp2VCgHGD+YHZd2YNQFvthoW0aL1i+eUW
 Ut+47rb5iS6ZjVGYKl2VEeLBQBkEs0iwXXdh6PwbjyICixDvwj0+2y6GSgtdUAIsve/K
 Y1u/+x3hCOFHzjtISdWRQnfcaRJHy1R3n3I8jaNS8pqfX+EFIpDL3ZyF/dR8mnWyTSFa
 9gwxCf5RcGXqMHGEWNpB1V1Eb1DvqizTGVwm9nggVh2QjXqGLhyWVkGBzGLAJ7W79MB+
 d8Z7AKgHVKJ/vLT0PSkxbR/zwLHNXat10jflfoOOXA2Ppjcb3X0gT2rqdevVVOXxRDt6
 0ihA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=SLLTqIhVx97asbYPr4Ba30RhGW0/k9gGUJ6yMqUQca8=;
 b=eLuWbXhRN8xzW5NlE0gtRHAURJkRrEGKJM1S7ciu5DRyaNd7Qek50BHbpOaeHmXrAd
 OkZ/Vr0XvLKXxCzi1bF5E4Px1k1LY0FsyALRE83Q0pE0WfnXj5FTsx6iU47PQ+jmF44/
 vNiPCW/Sa1UrHqt44iizSeCiElvn0gWwmx7pHKWZJILReE7+ZRnF8PCADBy5ul4KwgR0
 Gf1rXWerZxvORTQ9nMWTGl0ysPchhKM42j83wNpoyI0HoP16r4oxoa4/uoq9oKJ8t8MU
 sHuAF+onE82D1CS85DSYCtaat5N4ocEk67wYilkh0GLxciRFcle6aUndWK9FOodMvk+y
 2SxA==
X-Gm-Message-State: AOAM530bLHLaG8YXZVCdEH9mvyEZC+lkE0Z3NzTHX0w9vwzECCl9U5SY
 UC2Bi1ytKkNb+vqXqVWwtss=
X-Google-Smtp-Source: ABdhPJxhdTXqW/kPnVuI531rJ1j83VzktKMWxWPNmL/em2OL4k0Zaihe+NRG+blq1ChVnZ991OdzQA==
X-Received: by 2002:a5d:6d86:0:b0:1f1:f938:6626 with SMTP id
 l6-20020a5d6d86000000b001f1f9386626mr21184356wrs.701.1647375890836; 
 Tue, 15 Mar 2022 13:24:50 -0700 (PDT)
Received: from localhost (cpc154979-craw9-2-0-cust193.16-3.cable.virginm.net.
 [80.193.200.194]) by smtp.gmail.com with ESMTPSA id
 k18-20020adfe8d2000000b0020294da2b42sm24801116wrn.117.2022.03.15.13.24.50
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 15 Mar 2022 13:24:50 -0700 (PDT)
From: Colin Ian King <colin.i.king@gmail.com>
To: Zhenyu Wang <zhenyuw@linux.intel.com>, Zhi Wang <zhi.a.wang@intel.com>,
 Jani Nikula <jani.nikula@linux.intel.com>,
 Joonas Lahtinen <joonas.lahtinen@linux.intel.com>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>,
 Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>,
 David Airlie <airlied@linux.ie>, Daniel Vetter <daniel@ffwll.ch>,
 intel-gvt-dev@lists.freedesktop.org, intel-gfx@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org
Subject: [PATCH] drm/i915/reg: Fix spelling mistake "Unsupport" ->
 "Unsupported"
Date: Tue, 15 Mar 2022 20:24:49 +0000
Message-Id: <20220315202449.2952845-1-colin.i.king@gmail.com>
X-Mailer: git-send-email 2.35.1
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
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
Cc: kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

There is a spelling mistake in a gvt_vgpu_err error message. Fix it.

Signed-off-by: Colin Ian King <colin.i.king@gmail.com>
---
 drivers/gpu/drm/i915/gvt/handlers.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/i915/gvt/handlers.c b/drivers/gpu/drm/i915/gvt/handlers.c
index 520a7e1942f3..a01e3a893e24 100644
--- a/drivers/gpu/drm/i915/gvt/handlers.c
+++ b/drivers/gpu/drm/i915/gvt/handlers.c
@@ -914,7 +914,7 @@ static int update_fdi_rx_iir_status(struct intel_vgpu *vgpu,
 	else if (FDI_RX_IMR_TO_PIPE(offset) != INVALID_INDEX)
 		index = FDI_RX_IMR_TO_PIPE(offset);
 	else {
-		gvt_vgpu_err("Unsupport registers %x\n", offset);
+		gvt_vgpu_err("Unsupported registers %x\n", offset);
 		return -EINVAL;
 	}
 
-- 
2.35.1

