Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id BA42C4BF8F8
	for <lists+dri-devel@lfdr.de>; Tue, 22 Feb 2022 14:17:56 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 99C7D10E624;
	Tue, 22 Feb 2022 13:17:54 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-oo1-xc34.google.com (mail-oo1-xc34.google.com
 [IPv6:2607:f8b0:4864:20::c34])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D0E0B10E624
 for <dri-devel@lists.freedesktop.org>; Tue, 22 Feb 2022 13:17:53 +0000 (UTC)
Received: by mail-oo1-xc34.google.com with SMTP id
 p206-20020a4a2fd7000000b0031bfec11983so17386278oop.13
 for <dri-devel@lists.freedesktop.org>; Tue, 22 Feb 2022 05:17:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=usp.br; s=usp-google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=gUjTQJmzrA7YmPv0U39+3zh4DUhMv7PoZUE1y8daTkU=;
 b=FPkH1X3s9Z4MaxrX4uqfjr3F7a7VH/XL8sjYBD6kv6nMhEpAtU0QfomFMaSf8GNpNb
 t8YlseyboP1Z50Mc5eIfXqwSJbkKQTQ9ZXMON7BiQCTV40wpQybAmTe494JaSNRDO+zC
 vbuySWtEozg1GqhKsGDm9fQ6jWZhJiM7f8lLHj9CylLBenQ2MER4QfyRBDuXXRIlTfvt
 5ryycyOYPDO6dj2uPS+Xzphui8DCkRzUX48xpDmIKU+nAvi9WGP2l70vmWQ0sQFkV6ea
 LdMIKNtGBicAKMdkC8dcenYvWdwTribZIuLNqcKIWS1LNJGiEYXiZp0ClRVbRr+Q0sZT
 YZIA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=gUjTQJmzrA7YmPv0U39+3zh4DUhMv7PoZUE1y8daTkU=;
 b=jV11zfJyjKTyjHrACeplm3s4gshYRiJrTe/ePbopQ8du58Cq50/omDZdQIe5GPi9XR
 3mvi+55cUJPObKedgoGK19D4uu1krIK78dXpMrdb7ItPiV/MgqNDWIXGAPSHtPbPo3px
 JvQzAxC7DNrygwsnGkO7T0Urnjv6ILNyo6ZMbDhhWUn+5j9x4FJjbu8jM0/P0e2Vd/Py
 EJNgzyND/Q42q3wb6+CFFoiGkevvQ9DGsK3QFr8+ON7i39QErQZucpoLp2QvB5XlxBEP
 N+BOig708VGv44/0pfpJEwkOyPv9/0qz0N+b9m8j4DgJD+BBzwxbRR30n7xswY0585IR
 entg==
X-Gm-Message-State: AOAM53188eRz3PYKV4SClBvfE/egLlPHQu9JhJ5gTvN8Dy057lyGdxPJ
 ux3wQwRalbu4jbycKb5pYoS4qA==
X-Google-Smtp-Source: ABdhPJzSWobKzGCiBglLAMfGQ3zQeN2B60sOxZj/bjK565W/h7V9hy4VhSqKHUZu46XzLWuT1K3MqQ==
X-Received: by 2002:a05:6870:2142:b0:d2:c3fe:83c8 with SMTP id
 g2-20020a056870214200b000d2c3fe83c8mr1630946oae.165.1645535873120; 
 Tue, 22 Feb 2022 05:17:53 -0800 (PST)
Received: from fedora.. ([187.36.236.204])
 by smtp.gmail.com with ESMTPSA id c9sm6325050otd.26.2022.02.22.05.17.46
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 22 Feb 2022 05:17:52 -0800 (PST)
From: =?UTF-8?q?Ma=C3=ADra=20Canal?= <maira.canal@usp.br>
To: alexander.deucher@amd.com, christian.koenig@amd.com, Xinhui.Pan@amd.com,
 Hawking.Zhang@amd.com, john.clements@amd.com, tao.zhou1@amd.com,
 YiPeng.Chai@amd.com, luben.tuikov@amd.com, Stanley.Yang@amd.com,
 Dennis.Li@amd.com, mukul.joshi@amd.com, harry.wentland@amd.com,
 sunpeng.li@amd.com, Rodrigo.Siqueira@amd.com, Anthony.Koo@amd.com
Subject: [PATCH 03/10] drm/amdgpu: Remove unused get_umc_v8_7_channel_index
 function
Date: Tue, 22 Feb 2022 10:16:54 -0300
Message-Id: <20220222131701.356117-4-maira.canal@usp.br>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20220222131701.356117-1-maira.canal@usp.br>
References: <20220222131701.356117-1-maira.canal@usp.br>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
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
Cc: magalilemes00@gmail.com,
 =?UTF-8?q?Ma=C3=ADra=20Canal?= <maira.canal@usp.br>,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org, mwen@igalia.com,
 amd-gfx@lists.freedesktop.org, isabbasso@riseup.net
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Remove get_umc_v8_7_channel_index function, which is not used
in the codebase.

This was pointed by clang with the following warning:

drivers/gpu/drm/amd/amdgpu/umc_v8_7.c:50:24: warning: unused function
'get_umc_v8_7_channel_index' [-Wunused-function]
static inline uint32_t get_umc_v8_7_channel_index(struct amdgpu_device *adev,
                       ^

Signed-off-by: Maíra Canal <maira.canal@usp.br>
---
 drivers/gpu/drm/amd/amdgpu/umc_v8_7.c | 7 -------
 1 file changed, 7 deletions(-)

diff --git a/drivers/gpu/drm/amd/amdgpu/umc_v8_7.c b/drivers/gpu/drm/amd/amdgpu/umc_v8_7.c
index de85a998ef99..f35253e0eaa6 100644
--- a/drivers/gpu/drm/amd/amdgpu/umc_v8_7.c
+++ b/drivers/gpu/drm/amd/amdgpu/umc_v8_7.c
@@ -47,13 +47,6 @@ static inline uint32_t get_umc_v8_7_reg_offset(struct amdgpu_device *adev,
 	return adev->umc.channel_offs*ch_inst + UMC_8_INST_DIST*umc_inst;
 }
 
-static inline uint32_t get_umc_v8_7_channel_index(struct amdgpu_device *adev,
-						uint32_t umc_inst,
-						uint32_t ch_inst)
-{
-	return adev->umc.channel_idx_tbl[umc_inst * adev->umc.channel_inst_num + ch_inst];
-}
-
 static void umc_v8_7_ecc_info_query_correctable_error_count(struct amdgpu_device *adev,
 						uint32_t umc_inst, uint32_t ch_inst,
 						unsigned long *error_count)
-- 
2.35.1

