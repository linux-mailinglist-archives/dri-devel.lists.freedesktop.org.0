Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 9AC1E727C53
	for <lists+dri-devel@lfdr.de>; Thu,  8 Jun 2023 12:07:31 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E951910E5A4;
	Thu,  8 Jun 2023 10:07:26 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x433.google.com (mail-wr1-x433.google.com
 [IPv6:2a00:1450:4864:20::433])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DEE9C10E5A4;
 Thu,  8 Jun 2023 10:07:25 +0000 (UTC)
Received: by mail-wr1-x433.google.com with SMTP id
 ffacd0b85a97d-30e53cacc10so289874f8f.0; 
 Thu, 08 Jun 2023 03:07:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20221208; t=1686218844; x=1688810844;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=e9pgMIbtNGvt+dZacrjStBRF6ycRamKEcgmVWNACzbk=;
 b=B6VsdJXuVBxjoRidl/rWXx6lyaYIQFvp6tWrCs2klKJkfmNI5IfqRB3FYJE9QNs7XZ
 VQPgYaeyFzIYXB5Qpd/UPFXCdx1Tt4cK2F0Yg+wx1WstWHbLwafT2d40KyEmd2oKkwYA
 3bxFngz+IU0+Thmfq3uXmK/BY/AWKCJVbkrTotOodhq24zTiVThPtuYwc9t6S6rKfFp2
 pF+8vUbFK+BP92TFQDj+8Rjr/GiO0xtV0yygankwhNC7hAIMpLN9emUgK+APb6Lc1MuH
 CLfmfwi9lWlB/u3pQfxTOqJCt4IWpB/1eObhNw/6SceyHfK9l0c0S+97IU3Yahb7pTwG
 gfIQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1686218844; x=1688810844;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=e9pgMIbtNGvt+dZacrjStBRF6ycRamKEcgmVWNACzbk=;
 b=ZgrM7DCTOdkfGmf6jRz6O+YisTf+X/CXQ8SpZp/p4ABeq7KJQGC73G0zkxInWACckZ
 rk87CDPcv2GayvROS+Vl+NYC+R01o+6ITMegpQHbOExgvtUR3s2dzhvc6S09xYv+X9we
 pfwycEIYwiaoStFUfiz+uQN6ZE2SxZTL6algPmlnBd9cJ3L6TnCSYMuFdLbYKJDqT+fa
 sj0cSF9MT3bMRFFnHdSFBRd8W7hP5fhcdESH0SdoETZ15noScMSn41le2qGVJs0XJxTC
 iKa9M0goXUmOmV6opxXx+5adVjTQymHmjgNHu213P4/GFigM9GeP9njGnR28Sxl23pNt
 tsxQ==
X-Gm-Message-State: AC+VfDzAH08J6CyjXsPQE3oQyRn21edTNSmJES+KTzW1QPDsissUiiGV
 +2azr8AFZxTS3U281J2AOm8=
X-Google-Smtp-Source: ACHHUZ5UbkzYfeP23mP06MNOclTBsL8+JGEjJfF81Bk0/Obd6/6ehp942TML9tFOWhsksM+sPC42jA==
X-Received: by 2002:adf:ee8e:0:b0:30e:3da5:46e5 with SMTP id
 b14-20020adfee8e000000b0030e3da546e5mr7274154wro.59.1686218843798; 
 Thu, 08 Jun 2023 03:07:23 -0700 (PDT)
Received: from localhost (cpc154979-craw9-2-0-cust193.16-3.cable.virginm.net.
 [80.193.200.194]) by smtp.gmail.com with ESMTPSA id
 q3-20020adff503000000b002ca864b807csm1141756wro.0.2023.06.08.03.07.22
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 08 Jun 2023 03:07:23 -0700 (PDT)
From: Colin Ian King <colin.i.king@gmail.com>
To: Jani Nikula <jani.nikula@linux.intel.com>,
 Joonas Lahtinen <joonas.lahtinen@linux.intel.com>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>,
 Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>,
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>,
 Gustavo Sousa <gustavo.sousa@intel.com>, intel-gfx@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org
Subject: [PATCH][next] drm/i915/mtl: Fix spelling mistake "initate" ->
 "initiate"
Date: Thu,  8 Jun 2023 11:07:22 +0100
Message-Id: <20230608100722.1148771-1-colin.i.king@gmail.com>
X-Mailer: git-send-email 2.30.2
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

There is a spelling mistake in a drm_dbg_kms message. Fix it.

Signed-off-by: Colin Ian King <colin.i.king@gmail.com>
---
 drivers/gpu/drm/i915/display/intel_pmdemand.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/i915/display/intel_pmdemand.c b/drivers/gpu/drm/i915/display/intel_pmdemand.c
index f7608d363634..f59e1e962e3d 100644
--- a/drivers/gpu/drm/i915/display/intel_pmdemand.c
+++ b/drivers/gpu/drm/i915/display/intel_pmdemand.c
@@ -555,7 +555,7 @@ intel_pmdemand_program_params(struct drm_i915_private *i915,
 		goto unlock;
 
 	drm_dbg_kms(&i915->drm,
-		    "initate pmdemand request values: (0x%x 0x%x)\n",
+		    "initiate pmdemand request values: (0x%x 0x%x)\n",
 		    mod_reg1, mod_reg2);
 
 	intel_de_rmw(i915, XELPDP_INITIATE_PMDEMAND_REQUEST(1), 0,
-- 
2.30.2

