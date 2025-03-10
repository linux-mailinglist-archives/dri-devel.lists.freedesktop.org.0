Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 4D888A5A3FF
	for <lists+dri-devel@lfdr.de>; Mon, 10 Mar 2025 20:46:31 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A68F810E4D8;
	Mon, 10 Mar 2025 19:46:28 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="hfLekJwF";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-f50.google.com (mail-wr1-f50.google.com
 [209.85.221.50])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 10FD410E4D6
 for <dri-devel@lists.freedesktop.org>; Mon, 10 Mar 2025 19:46:25 +0000 (UTC)
Received: by mail-wr1-f50.google.com with SMTP id
 ffacd0b85a97d-3913d129c1aso1502101f8f.0
 for <dri-devel@lists.freedesktop.org>; Mon, 10 Mar 2025 12:46:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1741635983; x=1742240783; darn=lists.freedesktop.org;
 h=content-disposition:mime-version:message-id:subject:cc:to:from:date
 :from:to:cc:subject:date:message-id:reply-to;
 bh=IvLfn3qhWG0LPJSKPMLdwGHyzm3ZQnbWN9kL2fMh4Mw=;
 b=hfLekJwF+5xjjaCsXkJjJ+8WM5+vtIIjZzrfduozUhhP1YF8S5HBJzY/cHgKsS9w5K
 d++nNjnftoRGKgyAji7CIq2nLfyCTsebhXDV01ENXVLNtD6zon4ln/hkLEu+WXi9XOyy
 PdsyIJ0rcwoCeju2GemKsBPdQ0QZKlOzqaUbxOaS+im5Ynt5kEKjrJBMkjAdrEP9xATy
 vtSL02DMgOVzHLS7pD1r2coAqYVt5cgL9arke+A/g0Yl5IKV1NZSgNLsztdIPwQQ7tZE
 FRQSPT0IRh7HHIkbouybU5HpfLUjahIZOF9A9jw62zvaE1k+VN9FaMmFO0yn8Vl6V0DJ
 +3AA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1741635983; x=1742240783;
 h=content-disposition:mime-version:message-id:subject:cc:to:from:date
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=IvLfn3qhWG0LPJSKPMLdwGHyzm3ZQnbWN9kL2fMh4Mw=;
 b=nBxwgphvzS9zpFhTdjK3HlGgEYCy2tNVInK72DvjGFjgqOuvHnAMiKIvvdHNS6dViI
 cvUK21rZb1T5QUuAGDkawsvdMeHInOxhaerfb5zFc7/ZxUvs8vZ5wPeB/goCVTz46Uhh
 /KXqlEEs67xxtDRo1lTsUrDIOr04vtzIFMj3sNNqLxCg7ConPR9+a5iM3XCPQ/ta3K6g
 pqqx13JwpZQD2lbJ527bxYH4ZA3l3DroqiX8AY+G4uiHsm1UjImL6wRHqcIknow91B6+
 UKEJZBJP1qxt0VHWrO2M6FJdo9p+BG1ct2+mUIX8T3UQ1/EgxsyoVtqPhLSujMbPPkcu
 X65A==
X-Forwarded-Encrypted: i=1;
 AJvYcCXHsnt+kEfQj56KDP++Ktt7P0884ZSMyncGyfdqlBbLAQaXnrz8ZgOmFwyvOtWFmuDcBcygO8HsZso=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YwqTxDOfHF9/DxmvpzMEH+75d67n30C5Nmv3R0cN9a5Idx1Y1e4
 2PJQz140nPgHFMJw9e2nYeqSamJltG1o1BawpcC0S1UklEcNgc7TMacs4CnHmPo=
X-Gm-Gg: ASbGncsgajJNk6qPBPkP9i640UwjOp3aJ38UqF3pTZrCCdDxlVKh8VGzfwMvUNaowAw
 moKv6KNMPlMdI266Afz2AAkS3Pb8Y/Mu6pg5vXensEr4DTb7xxPpBCuyPVSOau/5sNTh/Xm451d
 EHYVeY5plK0F+Cg+nacnIA2bQh7ohgzHuYG37PwGfR6LebglwhAXjX7EvpDp5yFFiGy6m1XIFPy
 jJTJ/Oi8WFqZCHzVTZmiBMrjvQ21F4do5/3CeUmp5f+PalR3S6bxhcU064AcCUc2EtOJbsGCHyV
 dESL7m5U5S5SQ2Uc6TA9/4bVNL7sVDnhCFK6PxY5lbRkuVq/iw==
X-Google-Smtp-Source: AGHT+IEd/pl739SBNrD6h1Towv44982Wiak2l2/J5QTRayAEyqBes8blAzLgBmUO87jKdAG+98SPfw==
X-Received: by 2002:a5d:64e4:0:b0:391:865:5a93 with SMTP id
 ffacd0b85a97d-3926d123ba9mr995249f8f.22.1741635983490; 
 Mon, 10 Mar 2025 12:46:23 -0700 (PDT)
Received: from localhost ([196.207.164.177])
 by smtp.gmail.com with UTF8SMTPSA id
 ffacd0b85a97d-3912c0e3250sm15993154f8f.61.2025.03.10.12.46.22
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 10 Mar 2025 12:46:23 -0700 (PDT)
Date: Mon, 10 Mar 2025 22:46:19 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>,
 Jani Nikula <jani.nikula@linux.intel.com>
Cc: Joonas Lahtinen <joonas.lahtinen@linux.intel.com>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>,
 Tvrtko Ursulin <tursulin@ursulin.net>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 John Harrison <John.C.Harrison@intel.com>,
 intel-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org
Subject: [PATCH] drm/i915/gsc: delete a stray tab in
 intel_gsc_fw_get_binary_info()
Message-ID: <6152e1ac-745d-4b38-ba49-f013e6760936@stanley.mountain>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
X-Mailer: git-send-email haha only kidding
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

This line is indented on tab too far.  Delete the extra tab.

Signed-off-by: Dan Carpenter <dan.carpenter@linaro.org>
---
 drivers/gpu/drm/i915/gt/uc/intel_gsc_fw.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/i915/gt/uc/intel_gsc_fw.c b/drivers/gpu/drm/i915/gt/uc/intel_gsc_fw.c
index 5dc0ccd07636..d550eb6edfb8 100644
--- a/drivers/gpu/drm/i915/gt/uc/intel_gsc_fw.c
+++ b/drivers/gpu/drm/i915/gt/uc/intel_gsc_fw.c
@@ -230,7 +230,7 @@ int intel_gsc_fw_get_binary_info(struct intel_uc_fw *gsc_fw, const void *data, s
 		gt_info(gt, "Invalid GSC firmware for MTL/ARL, got %d.%d.%d.%d but need 102.x.x.x",
 			gsc->release.major, gsc->release.minor,
 			gsc->release.patch, gsc->release.build);
-			return -EINVAL;
+		return -EINVAL;
 	}
 
 	if (min_ver.major) {
-- 
2.47.2

