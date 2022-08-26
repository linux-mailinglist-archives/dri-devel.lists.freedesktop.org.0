Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 02F685A22A1
	for <lists+dri-devel@lfdr.de>; Fri, 26 Aug 2022 10:11:11 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6F7E710E391;
	Fri, 26 Aug 2022 08:11:05 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x436.google.com (mail-wr1-x436.google.com
 [IPv6:2a00:1450:4864:20::436])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 587D810E391;
 Fri, 26 Aug 2022 08:11:01 +0000 (UTC)
Received: by mail-wr1-x436.google.com with SMTP id n17so881037wrm.4;
 Fri, 26 Aug 2022 01:11:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc;
 bh=v4H+4AvGFUQ4X3fIy7w2GNzFwXOQBQhFujlzuWD9IjY=;
 b=OuOtNoLcjmkerE26piau/BBAmyQeBWWJkFV58GBry+HSm1QOf12Wf52ETbS/4swFqt
 RpG0fLp7sf8KvPbnEj9ZB2pTKlL3bUVHjcowxS2N1cnm4WnN+B7kDFFipvgXAOXWgZs0
 MfLFr6BQKC4USPKszgF7/pPZcr3vHgg+xVpQJn4YMBFKmQ7+wTn8mtWeAoQal3vI3cqv
 GPzr/Byw7ZiQXZco5ec70eUVMuohUFyEAGDp+RX3hBqzUFdjBJj9S9z4lgVtrMdpRsBi
 OupQC1G8CwSlHs+JVynTj0+4eT2PAfs7c1p/JFs4WrNbFMdDpaDxiBLyNZQWQGNGL7O/
 gBJw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc;
 bh=v4H+4AvGFUQ4X3fIy7w2GNzFwXOQBQhFujlzuWD9IjY=;
 b=dIJZHR3gYRd5ZVIEIVdFJ+EklA3NK/6NVKoGqs3IM/uyb2eRDtQRHtIKC2F/5O5J+D
 1g3rJRa4J6KTBdrl/3i66grdbBFyU/ywKrDXYrikJj2AiBIrLRYEaOQudU6j5u+HIB/1
 BibBJXUncg2s9j6NWJQBy0ztDYNDOlvGyjjY8u0/+5KrQuTdAJapcmBwB0HR/X3SO4e6
 fV3ND6POUhbBdwtod2TgRgCjlGbzH34Tc2XPrnSURDOTm7sEdpZMfXwtLGlF1XQyAyWY
 rCXAKNywSFx/NLH9fdxVGSEJ+30r00fUEqyjKa3yWHKg87VYbPJg0vKRmEZIPF5FWx5v
 pqIg==
X-Gm-Message-State: ACgBeo24Ufzq482qQuhWWcwbqskmn51ly6YzzjS84Lkx2zN5HpxKbPSg
 pl9++GBt0xTSwInm3IQ9zz21rqT3fve61A==
X-Google-Smtp-Source: AA6agR7ysxe9JNOKfIwiIIgPuKqoR5ZYpJJUcQVOQgPdpzLzxZskEsNeXkzfxokh5KxwZ7dlKEKHTw==
X-Received: by 2002:adf:d1c1:0:b0:220:5ec3:fb62 with SMTP id
 b1-20020adfd1c1000000b002205ec3fb62mr4154423wrd.69.1661501459865; 
 Fri, 26 Aug 2022 01:10:59 -0700 (PDT)
Received: from localhost (cpc154979-craw9-2-0-cust193.16-3.cable.virginm.net.
 [80.193.200.194]) by smtp.gmail.com with ESMTPSA id
 u10-20020adfdd4a000000b00225232c03fdsm1500927wrm.27.2022.08.26.01.10.58
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 26 Aug 2022 01:10:59 -0700 (PDT)
From: Colin Ian King <colin.i.king@gmail.com>
To: Jani Nikula <jani.nikula@linux.intel.com>,
 Joonas Lahtinen <joonas.lahtinen@linux.intel.com>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>,
 Rahul Kumar Singh <rahul.kumar.singh@intel.com>,
 Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>,
 David Airlie <airlied@linux.ie>, Daniel Vetter <daniel@ffwll.ch>,
 John Harrison <John.C.Harrison@Intel.com>, intel-gfx@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org
Subject: [PATCH][next] drm/i915/guc: Fix spelling mistake "heatbeat" ->
 "heartbeat"
Date: Fri, 26 Aug 2022 09:10:58 +0100
Message-Id: <20220826081058.1605094-1-colin.i.king@gmail.com>
X-Mailer: git-send-email 2.37.1
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

There is a spelling mistake in a drm_err message. Fix it.

Signed-off-by: Colin Ian King <colin.i.king@gmail.com>
---
 drivers/gpu/drm/i915/gt/uc/selftest_guc_hangcheck.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/i915/gt/uc/selftest_guc_hangcheck.c b/drivers/gpu/drm/i915/gt/uc/selftest_guc_hangcheck.c
index 01f8cd3c3134..d7857cf7c08f 100644
--- a/drivers/gpu/drm/i915/gt/uc/selftest_guc_hangcheck.c
+++ b/drivers/gpu/drm/i915/gt/uc/selftest_guc_hangcheck.c
@@ -61,7 +61,7 @@ static int intel_hang_guc(void *arg)
 	old_beat = engine->props.heartbeat_interval_ms;
 	ret = intel_engine_set_heartbeat(engine, BEAT_INTERVAL);
 	if (ret) {
-		drm_err(&gt->i915->drm, "Failed to boost heatbeat interval: %d\n", ret);
+		drm_err(&gt->i915->drm, "Failed to boost heartbeat interval: %d\n", ret);
 		goto err;
 	}
 
-- 
2.37.1

