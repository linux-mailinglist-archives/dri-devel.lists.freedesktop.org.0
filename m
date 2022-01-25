Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 20DB649C560
	for <lists+dri-devel@lfdr.de>; Wed, 26 Jan 2022 09:35:57 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E438110E784;
	Wed, 26 Jan 2022 08:35:31 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-x32e.google.com (mail-wm1-x32e.google.com
 [IPv6:2a00:1450:4864:20::32e])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9657B10EF1B;
 Tue, 25 Jan 2022 09:14:02 +0000 (UTC)
Received: by mail-wm1-x32e.google.com with SMTP id
 l12-20020a7bc34c000000b003467c58cbdfso1131526wmj.2; 
 Tue, 25 Jan 2022 01:14:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=sRD6qyOpLvPcbfxyrO55uccAQnyiA9egM9CuSrcd7Oc=;
 b=pxDtXbN4xMP3UQSMn75sFL/SaeutiFSKz3kyKW6caQJyCeyRxcWrn7GX9HpWclAX7Z
 dOIbygVko6RUJ/wt6z/a095spH8ZQrmCIPD7+FxqN+rexXZo86O9CQyYthLZ4/37WKN3
 RIEOsH+MByBUUHXUyyl+eVy7OlEWbgjzuOs6QI7e0OXOlacH5EaTneJZHG0gNex2UHOt
 sUaTXry+PvodKcsJNnvv6exMgY6eos/9VZOhdIMFMf2UTnH+coNJ8RoHHjKxCqC886p2
 uy8HF9SmsVkV70U6Vvd81B6fE8yREd+3EaFq6CirH1obIK0hImClV0TNBLZqGnugmzdk
 7b8A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=sRD6qyOpLvPcbfxyrO55uccAQnyiA9egM9CuSrcd7Oc=;
 b=ClNhfxeU9aX7TeVDv4gy8goCuMUdzxIlHRsEEJRxZa963CdJLmYsOcdC9b9ORiRazv
 7du7/k06vZiHN0JIhvTpPLbkwt+p8bhtqeHezjN7zvGyaysxK5MYt4hSQJKLzhjZyIw2
 LkFJ7a1yZzsPIRSCMOgtqXIxTmVZlwxiSNnnMyx+2H2RxNnJjzOHsiBB9VfoyWhnXtWe
 AVJWKb+qx6GkY5QW6sJ0CZiptwVZxM1GXQ1M0EA7HkV/uS6CKTee3p3NK3TQdXFRRMXb
 VreXZ/wJaU2OQyRtpMJY9KoIALRYkXkJz70bAxgh5lJvy4Tt53IPuYkVeTsYOSBsORnA
 Jnug==
X-Gm-Message-State: AOAM532ItFQnt2HmFEztrUkZcFKCyLR6UCjKuFpk4uUJEskUB863S4dL
 zXLT9MoBg13CeRnLVncWB8o=
X-Google-Smtp-Source: ABdhPJxzyKb03iquT0LFx2oqC90sGv/+nQr+qE2QH5pD8+5O0GEBKjf4WlPRN0eo54vLAvnnDr0wuA==
X-Received: by 2002:a7b:c4c3:: with SMTP id g3mr2038528wmk.125.1643102040934; 
 Tue, 25 Jan 2022 01:14:00 -0800 (PST)
Received: from localhost (cpc154979-craw9-2-0-cust193.16-3.cable.virginm.net.
 [80.193.200.194])
 by smtp.gmail.com with ESMTPSA id l4sm3859839wrs.6.2022.01.25.01.14.00
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 25 Jan 2022 01:14:00 -0800 (PST)
From: Colin Ian King <colin.i.king@gmail.com>
To: Jani Nikula <jani.nikula@linux.intel.com>,
 Joonas Lahtinen <joonas.lahtinen@linux.intel.com>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>,
 Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>,
 David Airlie <airlied@linux.ie>, Daniel Vetter <daniel@ffwll.ch>,
 John Harrison <John.C.Harrison@Intel.com>,
 Matthew Brost <matthew.brost@intel.com>, intel-gfx@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org
Subject: [PATCH][next] drm/i915/guc: fix spelling mistake "notificaion" ->
 "notification"
Date: Tue, 25 Jan 2022 09:13:59 +0000
Message-Id: <20220125091359.350918-1-colin.i.king@gmail.com>
X-Mailer: git-send-email 2.33.1
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-Mailman-Approved-At: Wed, 26 Jan 2022 08:35:29 +0000
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

There is a spelling mistake in a drm_err error message. Fix it.

Signed-off-by: Colin Ian King <colin.i.king@gmail.com>
---
 drivers/gpu/drm/i915/gt/uc/intel_guc_submission.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/i915/gt/uc/intel_guc_submission.c b/drivers/gpu/drm/i915/gt/uc/intel_guc_submission.c
index 1331ff91c5b0..1ae3d1f259e3 100644
--- a/drivers/gpu/drm/i915/gt/uc/intel_guc_submission.c
+++ b/drivers/gpu/drm/i915/gt/uc/intel_guc_submission.c
@@ -3942,7 +3942,7 @@ static void guc_handle_context_reset(struct intel_guc *guc,
 		guc_context_replay(ce);
 	} else {
 		drm_err(&guc_to_gt(guc)->i915->drm,
-			"Invalid GuC engine reset notificaion for 0x%04X on %s: banned = %d, blocked = %d",
+			"Invalid GuC engine reset notification for 0x%04X on %s: banned = %d, blocked = %d",
 			ce->guc_id.id, ce->engine->name, intel_context_is_banned(ce),
 			context_blocked(ce));
 	}
-- 
2.33.1

