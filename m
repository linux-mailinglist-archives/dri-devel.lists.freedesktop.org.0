Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 5DEA59391ED
	for <lists+dri-devel@lfdr.de>; Mon, 22 Jul 2024 17:39:45 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DD57110E176;
	Mon, 22 Jul 2024 15:39:41 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="Nj8vvFYH";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lj1-f182.google.com (mail-lj1-f182.google.com
 [209.85.208.182])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 99B0B10E176;
 Mon, 22 Jul 2024 15:39:40 +0000 (UTC)
Received: by mail-lj1-f182.google.com with SMTP id
 38308e7fff4ca-2ebe40673d8so55069111fa.3; 
 Mon, 22 Jul 2024 08:39:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1721662779; x=1722267579; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=jALI6UyYbNYiJLxWXhrO5w7i6Qk20r5OJVMCi7IoOuI=;
 b=Nj8vvFYHfO/ZwAXaD88GoAzPgklX84ZzLBzqCei6lz2si+iSx8x2LQcBoHMqZJDuuq
 CRImSrYApbBCLVpl25fB+ZTFbojtAmSrVpekw1fl8alwG4z04duviVROP66nc+Hw78dY
 l7IZahguniO72GKYmDdu0QOSWVti9QsFoCztTorJHZXNfjaRZetBsEIm0OhBnTZuf6ax
 sejKc2GGyCnnY/lL/3Lm7CZHRbIEFwRRgjdHdPbsMPV4OscBZasrOdAbJY0Tbl+qAygm
 P+OuFsHNtldHU8ndkHjUC8hq2M1LzH2abR2FvvcCHVOat6m+y2kDPFKVoaQ8wTBZvcUu
 8VQw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1721662779; x=1722267579;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=jALI6UyYbNYiJLxWXhrO5w7i6Qk20r5OJVMCi7IoOuI=;
 b=mVp7HuH36AozxQbuGAi6wZR60diRg245JCTuLvnf/95KKcd7OAXDFS4fZeMe8IPJ1t
 uE98Fy8OdLErEcTWuQMiFXieTWWLxP2Ag+kRRsk6aoxd3twxvQP+tkTBQ4YjDzr/U7DV
 ywOyceP3bW8L0SeGsW6KTJ4GZryf4HnA6AD75ylRRHnQ6980C2fmlBpSJZwnk9SH1K8C
 4ahdVrFHZJWLxEH84MZXQ4gP1E2Re/4lWU4WaOGOkWXlEhpuc1Yz28wqNzF72Xa95eIg
 NFtBR9JzfjYyxtVc7Fc3LmDOJIbj/fPAUaa/WNzNbIGn5O48BgvcR9UL1pKb28mKGQpv
 uhxw==
X-Forwarded-Encrypted: i=1;
 AJvYcCWpYyqIJPgYOUP972oYkdi+WeqgpW5zNQG5g3XoJTpbvNpwBHU9TcCBwte+iqbsWwvujK0stsS3Lv6TiSaixjs4hWz7U07Rt59SMAp3QNfX+nhjE8EE8EMJ1KYbmOhj8Zua8/tXz7IKcI0O3LOGpsCT3T8nA/EgnWPGJSR323A4GMb7anSGyjnO7QQRke+UaGk=
X-Gm-Message-State: AOJu0YwrZ+bNNjFN8ygJaGWBkf+fmlEIN9tLjf4hXOawQWkC8sgz7OVV
 n+faBWRH9VwE8RdjJBTmQfSjgNACNa1wjmTeRsgDkLpkihY+75R4GDI1nk1P
X-Google-Smtp-Source: AGHT+IEhKUeP+/D9FQONxFDVZjw8vfePr2AjP+B5tksegFlWs6Qyu1RK+OOhND9kOEGL7YES1M1u1A==
X-Received: by 2002:a2e:7a04:0:b0:2ef:2eb9:5e55 with SMTP id
 38308e7fff4ca-2ef2eb95ea2mr24921191fa.13.1721662778449; 
 Mon, 22 Jul 2024 08:39:38 -0700 (PDT)
Received: from localhost
 (craw-09-b2-v4wan-169726-cust2117.vm24.cable.virginm.net. [92.238.24.70])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-427d2920313sm117230425e9.0.2024.07.22.08.39.37
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 22 Jul 2024 08:39:37 -0700 (PDT)
From: Colin Ian King <colin.i.king@gmail.com>
To: Jani Nikula <jani.nikula@linux.intel.com>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>,
 Joonas Lahtinen <joonas.lahtinen@linux.intel.com>,
 Tvrtko Ursulin <tursulin@ursulin.net>, David Airlie <airlied@gmail.com>,
 Daniel Vetter <daniel@ffwll.ch>, intel-gfx@lists.freedesktop.org,
 intel-xe@lists.freedesktop.org, dri-devel@lists.freedesktop.org
Cc: kernel-janitors@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH][next] drm/i915/dp: Make read-only array bw_gbps static const
Date: Mon, 22 Jul 2024 16:39:37 +0100
Message-Id: <20240722153937.574819-1-colin.i.king@gmail.com>
X-Mailer: git-send-email 2.39.2
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Don't populate the read-only array bw_gbps on the stack at run time,
instead make it static const.

Signed-off-by: Colin Ian King <colin.i.king@gmail.com>
---
 drivers/gpu/drm/i915/display/intel_dp.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/i915/display/intel_dp.c b/drivers/gpu/drm/i915/display/intel_dp.c
index 59f11af3b0a1..a082ed8f5464 100644
--- a/drivers/gpu/drm/i915/display/intel_dp.c
+++ b/drivers/gpu/drm/i915/display/intel_dp.c
@@ -3434,7 +3434,7 @@ static void intel_dp_get_pcon_dsc_cap(struct intel_dp *intel_dp)
 
 static int intel_dp_pcon_get_frl_mask(u8 frl_bw_mask)
 {
-	int bw_gbps[] = {9, 18, 24, 32, 40, 48};
+	static const int bw_gbps[] = {9, 18, 24, 32, 40, 48};
 	int i;
 
 	for (i = ARRAY_SIZE(bw_gbps) - 1; i >= 0; i--) {
-- 
2.39.2

