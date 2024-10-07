Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id EA992993514
	for <lists+dri-devel@lfdr.de>; Mon,  7 Oct 2024 19:33:12 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 04E4110E213;
	Mon,  7 Oct 2024 17:33:10 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="gPkZe+35";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pj1-f54.google.com (mail-pj1-f54.google.com
 [209.85.216.54])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BED9B10E213;
 Mon,  7 Oct 2024 17:33:08 +0000 (UTC)
Received: by mail-pj1-f54.google.com with SMTP id
 98e67ed59e1d1-2e0b467da03so578850a91.2; 
 Mon, 07 Oct 2024 10:33:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1728322388; x=1728927188; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=QBVwovZqhJiutGf/q57pmoMot4Vg5YimdUN+GQvqspM=;
 b=gPkZe+35mIYIIdSlBeFNfXy4WiHRuGF/z1dJ+E9rRUodAD+P+WploIqkG2wKqw1e/u
 ZEc2nn/OGnRDCESydqfU/qmvEv1bpKOfpCnvhVZlNFoJYuJytRfpQ4M/VyK8x4ocL431
 31DGelrwDya20cbqWz1v9bIb1t9VKl3xG3CAqCg2to35CjueeduD5kQSNpquAQy7HcNE
 QySm+KERJraWGGaz5ceba08AgbO7EBQ03oTptwTw1Yk37BS4qpGeOozon0CvX3g1piCn
 HE5mu7rvLXujf4ZvPsY5gJiGzxH/cmXtviMSY/Damyu3JtcRyZraLJAPIga4fvr5igVH
 GuGw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1728322388; x=1728927188;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=QBVwovZqhJiutGf/q57pmoMot4Vg5YimdUN+GQvqspM=;
 b=BB5Oli/lTVSlWhuQVtYEsU1lFP7WFXL/t71TWdKRD1uswK2dSBGGposlsTGdTkQfSl
 8W2ossUCHxkuncO9kuC3TQZt4szv/XjMokZTITlTehUl9/M6O8BZHhqKUxfj+MtDAnf4
 8HGij6vH3jmsjnF6yqwt9a/rJeKDKtzXzSYK2X2C+zBs8PkQHqAzCmiBW0oCzwzjjPRF
 OCef71l3iajHPSOYpy04vpaOmO7vasAdZNqwikkijapKNQQJaKrcdE7AWTXicqpc2Ojy
 glYhR/cfGPmUFSuaRbFZN+ntHhfKRyT56qQGYwZyCRMzPjTjKosPpm/dPi1O3ET/3bP7
 Rd2w==
X-Forwarded-Encrypted: i=1;
 AJvYcCV1EJTHXBgf8R61mABkMSg6z8dfrHCvmUCzrjeBfhY03IS2zcHCUPjI0gFvSuIyquZKqGcJHgMBOQQ=@lists.freedesktop.org,
 AJvYcCWhqVHy5FWHpYGTWo1o7SU4/igeqoFDFKGNjepZL/xn4uG/C8/ZG7AQts5GU4RTEw1BbvkDVH+HVbc=@lists.freedesktop.org,
 AJvYcCXBh/chXA0xrFa0byQAWQcTbMBLHKSXI1uvjqTaou5cR3yqSHK5qPo1a/gLX3M3INQiX7jzSJLaUomP@lists.freedesktop.org
X-Gm-Message-State: AOJu0YwXGniTiiogeqZBC86/iMiivyOZxSHsirJ9VWLz/yOTZ3DB73cF
 d5Ui7ZYECHURJmYXM2DaaGtbFEvNBkg1xoZDzD9h9BeX976T9k2L
X-Google-Smtp-Source: AGHT+IGbvJGQl/UAHTUNNHtW5c/lWs0TlfWR9gt/d7p98Gcfl9rgsSZB50FW193XaadNkp+X0cxCxg==
X-Received: by 2002:a17:90b:1115:b0:2db:60b:eee with SMTP id
 98e67ed59e1d1-2e1e63eabeemr6155040a91.9.1728322388268; 
 Mon, 07 Oct 2024 10:33:08 -0700 (PDT)
Received: from dev.. ([2402:e280:214c:86:a843:852f:eac4:ff92])
 by smtp.gmail.com with ESMTPSA id
 98e67ed59e1d1-2e1e86657d5sm7442881a91.46.2024.10.07.10.33.04
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 07 Oct 2024 10:33:08 -0700 (PDT)
From: R Sundar <prosunofficial@gmail.com>
To: Jani Nikula <jani.nikula@linux.intel.com>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>,
 Joonas Lahtinen <joonas.lahtinen@linux.intel.com>,
 Tvrtko Ursulin <tursulin@ursulin.net>, David Airlie <airlied@gmail.com>,
 Simona Vetter <simona@ffwll.ch>, intel-gfx@lists.freedesktop.org,
 intel-xe@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, imre.deak@intel.com
Cc: R Sundar <prosunofficial@gmail.com>, kernel test robot <lkp@intel.com>,
 Julia Lawall <julia.lawall@inria.fr>
Subject: [PATCH linux-next] drm/i915/ddi: use string choice helpers
Date: Mon,  7 Oct 2024 23:03:00 +0530
Message-Id: <20241007173300.83902-1-prosunofficial@gmail.com>
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

Use str_enabled_disabled string helpers for better readability and to
fix cocci warning.

Reported-by: kernel test robot <lkp@intel.com>
Reported-by: Julia Lawall <julia.lawall@inria.fr>
Closes: https://lore.kernel.org/r/202410071601.TFpXoqgW-lkp@intel.com/
Signed-off-by: R Sundar <prosunofficial@gmail.com>
---

Reported in linux repo:

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master

cocci warnings: (new ones prefixed by >>)
>> drivers/gpu/drm/i915/display/intel_ddi.c:2225:7-13: opportunity for str_enabled_disabled(enable)

vim +2225 drivers/gpu/drm/i915/display/intel_ddi.c

compile tested only.

 drivers/gpu/drm/i915/display/intel_ddi.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/i915/display/intel_ddi.c b/drivers/gpu/drm/i915/display/intel_ddi.c
index fe1ded6707f9..ff4c633c8546 100644
--- a/drivers/gpu/drm/i915/display/intel_ddi.c
+++ b/drivers/gpu/drm/i915/display/intel_ddi.c
@@ -2236,7 +2236,7 @@ static void intel_dp_sink_set_fec_ready(struct intel_dp *intel_dp,
 	if (drm_dp_dpcd_writeb(&intel_dp->aux, DP_FEC_CONFIGURATION,
 			       enable ? DP_FEC_READY : 0) <= 0)
 		drm_dbg_kms(display->drm, "Failed to set FEC_READY to %s in the sink\n",
-			    enable ? "enabled" : "disabled");
+			    str_enabled_disabled(enable));
 
 	if (enable &&
 	    drm_dp_dpcd_writeb(&intel_dp->aux, DP_FEC_STATUS,
-- 
2.34.1

