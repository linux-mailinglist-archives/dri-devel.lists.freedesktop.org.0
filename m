Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 698A673633C
	for <lists+dri-devel@lfdr.de>; Tue, 20 Jun 2023 07:40:53 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5A46210E261;
	Tue, 20 Jun 2023 05:40:49 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtp-relay-internal-0.canonical.com
 (smtp-relay-internal-0.canonical.com [185.125.188.122])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 28C0F10E25C
 for <dri-devel@lists.freedesktop.org>; Tue, 20 Jun 2023 05:40:45 +0000 (UTC)
Received: from mail-lj1-f200.google.com (mail-lj1-f200.google.com
 [209.85.208.200])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by smtp-relay-internal-0.canonical.com (Postfix) with ESMTPS id 9A23F423EA
 for <dri-devel@lists.freedesktop.org>; Tue, 20 Jun 2023 05:40:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canonical.com;
 s=20210705; t=1687239643;
 bh=eKxatBk/Yyq4Kcp78eUZOCU8RQk/O3McJworAZUfA7k=;
 h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
 MIME-Version;
 b=KV56MXsEPVYGgVmbpZITcKNT2qYhOQvGlvkdQPfvw5Ghp1pPVSrNPUkwf7qdN3udB
 cjWNx8SSVE6hmxAF/3VnvmRtIpznYefx+gjbHkx9BLFlazRXiXWlqeccgfidSO/Su0
 kOwm79Hhm/Tw8tJeYwGWtGDX00vX18s5wjlAg6f8ABSN99ZZz1MaIAL8GcT55lRoSh
 IO08UDZbjja9L8UQQhCVt1Iv+yIs93XhKQC3gP5Pg8UxCtyuunwJZ2wq6BLcijM6SC
 1ZJjbz1UNszuAsEzWQd6so08PZRud5TbtjvvVFe2BYLlJKtDqk4adXeay7pClTgVAv
 h/k3seYTG6NRw==
Received: by mail-lj1-f200.google.com with SMTP id
 38308e7fff4ca-2b337a245b7so31403841fa.3
 for <dri-devel@lists.freedesktop.org>; Mon, 19 Jun 2023 22:40:43 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1687239641; x=1689831641;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=eKxatBk/Yyq4Kcp78eUZOCU8RQk/O3McJworAZUfA7k=;
 b=aJNWMUT4VhkKY7nKRVv2itzHwlMNeUND4wqCrWJGZKTw41ywuztTpmC1bMIsW7bmap
 o3NL+o3rQ+HfPMmO60n7KrYqr8s20Cf4SzJUhDUcpbmV5wbBPH43Kb5n0kPWhC5UCiJT
 Cbu5rYP42NrJe6B80TtNVKgKk7stFsHOBDEKOkqjyHSSekbz1MEZLDvC4AP4riy81Tkn
 M7FlGSgtFR1SyWSxZKKuWv+6hr4wYc7gzKCNZ4Vhgp2opaNr2jyKkz+ikWJZhmnXbPbI
 fMPp43rtVNR0RfqCWmoHtErTNDNYavkgMwvoqdbCK9tXzmXOqBSfWfy7CtV/IR3SaQaR
 7qew==
X-Gm-Message-State: AC+VfDxbgeKwZ73C4t/p/Rw2Uh7wlU/y0mxtGoTpN+VzaJ/S3cq3O9Tc
 FwAyjNgSWIeIORDE0NkxWrBnpbQAAocKhwlmccLf9gtV0aXsFunO1ApUvsCGcjEON6HcxTBFgDH
 mVklg07xHjjajdH0GopDzq1iPefEFdANcG7fZxXqZlhhIqw==
X-Received: by 2002:ac2:499e:0:b0:4f8:6f40:4776 with SMTP id
 f30-20020ac2499e000000b004f86f404776mr2610354lfl.46.1687239641133; 
 Mon, 19 Jun 2023 22:40:41 -0700 (PDT)
X-Google-Smtp-Source: ACHHUZ7mAmYRUNcTRvaEpgafMNWbpCh84NFbi5qKXny7yAHkhYQctNPgq9IskSasfT3ZfXza5M/jjg==
X-Received: by 2002:ac2:499e:0:b0:4f8:6f40:4776 with SMTP id
 f30-20020ac2499e000000b004f86f404776mr2610336lfl.46.1687239640866; 
 Mon, 19 Jun 2023 22:40:40 -0700 (PDT)
Received: from localhost ([194.191.244.86]) by smtp.gmail.com with ESMTPSA id
 m12-20020a7bcb8c000000b003f7ea771b5dsm1433746wmi.1.2023.06.19.22.40.40
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 19 Jun 2023 22:40:40 -0700 (PDT)
From: Juerg Haefliger <juerg.haefliger@canonical.com>
To: juerg.haefliger@canonical.com
Subject: [PATCH v2] drm/msm/adreno: Add missing MODULE_FIRMWARE macros
Date: Tue, 20 Jun 2023 07:40:31 +0200
Message-Id: <20230620054031.1203960-1-juerg.haefliger@canonical.com>
X-Mailer: git-send-email 2.37.2
In-Reply-To: <20230616122815.1037425-1-juerg.haefliger@canonical.com>
References: <20230616122815.1037425-1-juerg.haefliger@canonical.com>
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
Cc: sean@poorly.run, quic_akhilpo@quicinc.com, ribalda@chromium.org,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 quic_abhinavk@quicinc.com, konrad.dybcio@linaro.org, joel@joelfernandes.org,
 linux-arm-msm@vger.kernel.org, dmitry.baryshkov@linaro.org,
 freedreno@lists.freedesktop.org, johan+linaro@kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

The driver references some firmware files that don't have corresponding
MODULE_FIRMWARE macros and thus won't be listed via modinfo. Fix that.

Signed-off-by: Juerg Haefliger <juerg.haefliger@canonical.com>

---
v2:
  - Drop addition and removal of zap files (needs more discussion)
  - Add new a690_gmu.bin
  - Update commit subject and message accordingly
---
 drivers/gpu/drm/msm/adreno/adreno_device.c | 11 +++++++++++
 1 file changed, 11 insertions(+)

diff --git a/drivers/gpu/drm/msm/adreno/adreno_device.c b/drivers/gpu/drm/msm/adreno/adreno_device.c
index cb94cfd137a8..7c1f9a844009 100644
--- a/drivers/gpu/drm/msm/adreno/adreno_device.c
+++ b/drivers/gpu/drm/msm/adreno/adreno_device.c
@@ -397,10 +397,21 @@ MODULE_FIRMWARE("qcom/a530_zap.mdt");
 MODULE_FIRMWARE("qcom/a530_zap.b00");
 MODULE_FIRMWARE("qcom/a530_zap.b01");
 MODULE_FIRMWARE("qcom/a530_zap.b02");
+MODULE_FIRMWARE("qcom/a540_gpmu.fw2");
 MODULE_FIRMWARE("qcom/a619_gmu.bin");
 MODULE_FIRMWARE("qcom/a630_sqe.fw");
 MODULE_FIRMWARE("qcom/a630_gmu.bin");
 MODULE_FIRMWARE("qcom/a630_zap.mbn");
+MODULE_FIRMWARE("qcom/a640_gmu.bin");
+MODULE_FIRMWARE("qcom/a650_gmu.bin");
+MODULE_FIRMWARE("qcom/a650_sqe.fw");
+MODULE_FIRMWARE("qcom/a660_gmu.bin");
+MODULE_FIRMWARE("qcom/a660_sqe.fw");
+MODULE_FIRMWARE("qcom/a690_gmu.bin");
+MODULE_FIRMWARE("qcom/leia_pfp_470.fw");
+MODULE_FIRMWARE("qcom/leia_pm4_470.fw");
+MODULE_FIRMWARE("qcom/yamato_pfp.fw");
+MODULE_FIRMWARE("qcom/yamato_pm4.fw");
 
 static inline bool _rev_match(uint8_t entry, uint8_t id)
 {
-- 
2.37.2

