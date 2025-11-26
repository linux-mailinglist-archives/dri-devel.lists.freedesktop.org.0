Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 75AE1C8B862
	for <lists+dri-devel@lfdr.de>; Wed, 26 Nov 2025 20:06:47 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9347610E6FD;
	Wed, 26 Nov 2025 19:06:44 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="Vwhcj+aE";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ej1-f49.google.com (mail-ej1-f49.google.com
 [209.85.218.49])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3BEA510E6E6
 for <dri-devel@lists.freedesktop.org>; Wed, 26 Nov 2025 19:06:43 +0000 (UTC)
Received: by mail-ej1-f49.google.com with SMTP id
 a640c23a62f3a-b737cd03d46so20199966b.0
 for <dri-devel@lists.freedesktop.org>; Wed, 26 Nov 2025 11:06:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1764184002; x=1764788802; darn=lists.freedesktop.org;
 h=cc:to:message-id:content-transfer-encoding:mime-version:subject
 :date:from:from:to:cc:subject:date:message-id:reply-to;
 bh=stckSta45RSO4GKvqssT9Kpz23idPNbtjVdz9ZGQhAQ=;
 b=Vwhcj+aEab5rtf23NovA5tQ9ArDhplA5CV9jkgcgZHLX/lE98NQRtY2aR7KFzooNGz
 vawZgHtKOJxAS4qHCk2/I4vZquW7GSLitx1/MY+BStQDTEhFRgP6oOU1xGC/K4tdNnvZ
 CWfgbBwc0hRgohoPbd0sGp2nSfn0d+ijcQiUpmI6aH5HzMqIIfSIqwh+VFhCgis1eTJg
 rFPI7/CrZgJ8YjZ1op+sUdmcF+b/U6Z9Z7273OvChTTHGl8Kai6W9TaFaI3ClyQQ5mYy
 WP+gLNZaLbf3WS66tsysbHQhyqbky1u6qIQ3FmUIX8C1S7a1clBPmhslUkwNsCBjoDsT
 /Zhw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1764184002; x=1764788802;
 h=cc:to:message-id:content-transfer-encoding:mime-version:subject
 :date:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=stckSta45RSO4GKvqssT9Kpz23idPNbtjVdz9ZGQhAQ=;
 b=My/xI+tWgL0VR16ha16AzJzBtKvP5BtrniHE1V5CSvCL74oTPsPC5Dgk4TrJ2MhwEV
 Xs7qq0TBJ6PwgY5JH1SKigfjH6HbhqXBwnxJSdlnPzTMug8SXhtzP7s3t04cDoj+++Wo
 HkE2GnNlFEKMRzmoKuUKlyZDTmXpmMvSCRiW/WsfoGDE8qPsOgVswybjKHQq5qmI3Zbw
 OuiRfLSYejS+FDuQhoTFoJBq+jZ8oJ3C9qeZqRs6YQr+MbaUkKJFaBZTQPn/n1igvs5m
 pmkKhy9/z9yKTpyLpfTaVQ0mapgYlchgChEeP/vxGs1S6Abl7+8K0sWkfKHMFT4+fZ9f
 8M1A==
X-Forwarded-Encrypted: i=1;
 AJvYcCWM31q5X2viMCV78TuI+S+DkMyiTwlOt+HRyBeSTCirOGiNNAy0Wv+LW9NWgY2w16hnPPkXz8INnyA=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YxIpqKu18pYdp6NdlUmEv+LX82VzgXt6J6l4cG1CWhUct+lEJaj
 gkHbHcaplHStus5yRfkUWqffzFxeeb9P7zYKrPe03Q777DUoiISwX/o=
X-Gm-Gg: ASbGncs/46mLNOMYqKo/Pedddc1gaXNjSdt49IEMU7Qc4NAkaA4cQiw3ApRWN8q3caE
 aimbP8EqxbFsZCWm6hkRiLEdjIyE0puFHzNWBdSpBQmrfDUi8nvy4Brj9qLO4nt9nhXqCaM1nWd
 BhQf370NplL5yCbusm3ffVioqdc6Lkrd9FKrxNqsmvpiv+a2Jp/978CALHNC0z0o6w8kpnomd1K
 TlJXZIHVnbMfAjDWBSG8PlA1ReDwDllUAJGCc96od9aFn+amFV/EoJxEz07nHWr1GjFRRDfnQB/
 AawIg02BKF8w8NuDageq6/YIv9y/pNo0kKHUcRNnjL+xB2Mp7QAXg4Kw/+sl3uHOCHr2QEwWd4i
 U6w1RwLcMaZAIxszlz54x7xX98tUxcBYW0Kqh3WCYBzf+2ch6vYjaglYI9zt0lZm7F/r6LSpFiw
 aNX9b0jQ+2mdechcTTD3Ltd4qZOBaAVkef5slRc8+cz2Bdnx6fZW3vBRGWwS/g0TY79/Vr0s9Bq
 Q==
X-Google-Smtp-Source: AGHT+IEO55xzsXA+ZlrZjP+KV22ag55rRi9OAgB0Mc9+QCEFL9ug5YnYdS/m8CJD3vtIPmo5let39w==
X-Received: by 2002:a17:907:7286:b0:b3d:73e1:d809 with SMTP id
 a640c23a62f3a-b767173270emr2633206566b.48.1764184001521; 
 Wed, 26 Nov 2025 11:06:41 -0800 (PST)
Received: from [192.168.1.17] (host-87-16-172-206.retail.telecomitalia.it.
 [87.16.172.206]) by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-b7654cdab19sm2062564266b.10.2025.11.26.11.06.40
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 26 Nov 2025 11:06:41 -0800 (PST)
From: Anna Maniscalco <anna.maniscalco2000@gmail.com>
Date: Wed, 26 Nov 2025 20:06:23 +0100
Subject: [PATCH] drm/msm: add PERFCTR_CNTL to ifpc_reglist
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251126-ifpc_counters-v1-1-f2d5e7048032@gmail.com>
X-B4-Tracking: v=1; b=H4sIAK5PJ2kC/x3MQQqAIBBA0avIrBNywoiuEhFiY81GRSsC8e5Jy
 7f4v0CmxJRhFgUSPZw5+AbVCbCn8QdJ3psBe9RK4SjZRbvZcPuLUpY07XpwZkCNBK2JiRy//29
 Za/0AckzexV8AAAA=
X-Change-ID: 20251126-ifpc_counters-e8d53fa3252e
To: Rob Clark <robin.clark@oss.qualcomm.com>, Sean Paul <sean@poorly.run>, 
 Konrad Dybcio <konradybcio@kernel.org>, 
 Akhil P Oommen <akhilpo@oss.qualcomm.com>, 
 Dmitry Baryshkov <lumag@kernel.org>, 
 Abhinav Kumar <abhinav.kumar@linux.dev>, 
 Jessica Zhang <jesszhan0024@gmail.com>, 
 Marijn Suijten <marijn.suijten@somainline.org>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>
Cc: linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org, 
 freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org, 
 Anna Maniscalco <anna.maniscalco2000@gmail.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1764183999; l=994;
 i=anna.maniscalco2000@gmail.com; s=20240815; h=from:subject:message-id;
 bh=gXWVyG9h24Agp604ZvSh2BkWdNVoab+cVEPp20+0P/o=;
 b=NTVIfrsDGcRjmRgOu+Y2IQYIb8F+JTr+P+HhY2BNIwGMi92QWwDh2DrCZ6O7rLd21GBVLZyOJ
 Z3IhujLoQZSDyjn7zVrUOdnNwZP9xRPDPR0PqIJO+NdBnzwPvwUoGn7
X-Developer-Key: i=anna.maniscalco2000@gmail.com; a=ed25519;
 pk=0zicFb38tVla+iHRo4kWpOMsmtUrpGBEa7LkFF81lyY=
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

Previously this register would become 0 after IFPC took place which
broke all usages of counters.

Signed-off-by: Anna Maniscalco <anna.maniscalco2000@gmail.com>
---
 drivers/gpu/drm/msm/adreno/a6xx_catalog.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/gpu/drm/msm/adreno/a6xx_catalog.c b/drivers/gpu/drm/msm/adreno/a6xx_catalog.c
index 29107b362346..b731491dc522 100644
--- a/drivers/gpu/drm/msm/adreno/a6xx_catalog.c
+++ b/drivers/gpu/drm/msm/adreno/a6xx_catalog.c
@@ -1392,6 +1392,7 @@ static const u32 a750_ifpc_reglist_regs[] = {
 	REG_A6XX_TPL1_BICUBIC_WEIGHTS_TABLE(2),
 	REG_A6XX_TPL1_BICUBIC_WEIGHTS_TABLE(3),
 	REG_A6XX_TPL1_BICUBIC_WEIGHTS_TABLE(4),
+	REG_A6XX_RBBM_PERFCTR_CNTL,
 	REG_A6XX_TPL1_NC_MODE_CNTL,
 	REG_A6XX_SP_NC_MODE_CNTL,
 	REG_A6XX_CP_DBG_ECO_CNTL,

---
base-commit: 7bc29d5fb6faff2f547323c9ee8d3a0790cd2530
change-id: 20251126-ifpc_counters-e8d53fa3252e

Best regards,
-- 
Anna Maniscalco <anna.maniscalco2000@gmail.com>

