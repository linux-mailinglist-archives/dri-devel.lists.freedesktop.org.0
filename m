Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B31593912D6
	for <lists+dri-devel@lfdr.de>; Wed, 26 May 2021 10:48:24 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6C94F6EC47;
	Wed, 26 May 2021 08:48:22 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-x330.google.com (mail-wm1-x330.google.com
 [IPv6:2a00:1450:4864:20::330])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0B5AB6EC35
 for <dri-devel@lists.freedesktop.org>; Wed, 26 May 2021 08:47:41 +0000 (UTC)
Received: by mail-wm1-x330.google.com with SMTP id
 l11-20020a05600c4f0bb029017a7cd488f5so54485wmq.0
 for <dri-devel@lists.freedesktop.org>; Wed, 26 May 2021 01:47:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=hSDS0B4fQp47KmNI4VulVH8wz4wQl27Y7BX42nP21sg=;
 b=dcN/WRihIO90bHiQ9m0MJt0eKZLdYaTMCHRtA5oqLwEwYpsQgez2GUQcn71i3ih0jW
 plNUmFHspKhJO2iQGHv17+YcEIRq4fiTrfQWA4ghswtFulk+FsfsAv831pv8xyB2c6cG
 owohKi5lh4ZipKQPkVyvihqIPKWE8AoypYbSepOd+/l8UozrVuWyHTfYYmlUD7EQHqgh
 GwstL/JKm2DpxzzEzwW+FqvbzAxso9w8qJcpSNqPW1TEJ1oRqhaGLvsQWsR+yqoCTV9C
 1/iEm0F+7DwR2FNLxuVifk5iaWQWisncmcnNFZCooBlssHa10v7lifobDNHrux6bNLiq
 3Wcg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=hSDS0B4fQp47KmNI4VulVH8wz4wQl27Y7BX42nP21sg=;
 b=txIAbTr+YtrxEn+1qo8XVyFACxbkSnkPeLqkqXYx/TQYooBYeS1bsmUR8f2NoIZwYB
 39Yn+ySsD9RXOlcx8Iqvpr1riN05Qy+uzzZYlV+Fv8dY1LLC+NnL9n02C6IozlhZbEt8
 7AH6SVNOcbqiaYhpQ3tiWflGLmFAQ8sFpPgryvGWh6DeJB2mf30C8+Jl0Ma7PyuTH9ab
 +dDQoF/K4ym7cFsGOhKTy+mkuwORFD484SZirRH/l2JnNVxoLNs80abzY6f5YuwnFFaf
 7NxkR04pKwEarK66QkzR3tu77VCeLrBJ+rR++7T+GxLJvYhdMhT7mDtUqbzxAPscsl4Q
 AQcg==
X-Gm-Message-State: AOAM532X2kjFwoHEJqt94mTkLPKQbm+F6ZQEDdw/rJogzro7jSL3pOIt
 CTwDQijHFcehlF3bViqHCyrB5w==
X-Google-Smtp-Source: ABdhPJzqDrnjoRziv6JoSt76RUtBnwKhDOJNyexrZdLJodTCazVGqrbE34zIibURPetmptwFMYs0jA==
X-Received: by 2002:a05:600c:2289:: with SMTP id
 9mr2320654wmf.29.1622018859683; 
 Wed, 26 May 2021 01:47:39 -0700 (PDT)
Received: from dell.default ([91.110.221.223])
 by smtp.gmail.com with ESMTPSA id l18sm18911918wrt.97.2021.05.26.01.47.38
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 26 May 2021 01:47:39 -0700 (PDT)
From: Lee Jones <lee.jones@linaro.org>
To: lee.jones@linaro.org
Subject: [PATCH 09/34] drm/amd/display/dc/bios/command_table_helper2: Fix
 function name 'dal_cmd_table_helper_transmitter_bp_to_atom2()'
Date: Wed, 26 May 2021 09:47:01 +0100
Message-Id: <20210526084726.552052-10-lee.jones@linaro.org>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210526084726.552052-1-lee.jones@linaro.org>
References: <20210526084726.552052-1-lee.jones@linaro.org>
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
Cc: Leo Li <sunpeng.li@amd.com>, linux-kernel@vger.kernel.org,
 amd-gfx@lists.freedesktop.org, David Airlie <airlied@linux.ie>,
 dri-devel@lists.freedesktop.org, Alex Deucher <alexander.deucher@amd.com>,
 =?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Fixes the following W=1 kernel build warning(s):

 drivers/gpu/drm/amd/amdgpu/../display/dc/bios/command_table_helper2.c:141: warning: expecting prototype for translate_transmitter_bp_to_atom2(). Prototype was for dal_cmd_table_helper_transmitter_bp_to_atom2() instead

Cc: Harry Wentland <harry.wentland@amd.com>
Cc: Leo Li <sunpeng.li@amd.com>
Cc: Alex Deucher <alexander.deucher@amd.com>
Cc: "Christian König" <christian.koenig@amd.com>
Cc: David Airlie <airlied@linux.ie>
Cc: Daniel Vetter <daniel@ffwll.ch>
Cc: amd-gfx@lists.freedesktop.org
Cc: dri-devel@lists.freedesktop.org
Signed-off-by: Lee Jones <lee.jones@linaro.org>
---
 drivers/gpu/drm/amd/display/dc/bios/command_table_helper2.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/amd/display/dc/bios/command_table_helper2.c b/drivers/gpu/drm/amd/display/dc/bios/command_table_helper2.c
index 00706b072b5f8..6d2fb112ad9f9 100644
--- a/drivers/gpu/drm/amd/display/dc/bios/command_table_helper2.c
+++ b/drivers/gpu/drm/amd/display/dc/bios/command_table_helper2.c
@@ -129,7 +129,7 @@ bool dal_cmd_table_helper_controller_id_to_atom2(
 }
 
 /**
- * translate_transmitter_bp_to_atom2 - Translate the Transmitter to the
+ * dal_cmd_table_helper_transmitter_bp_to_atom2 - Translate the Transmitter to the
  *                                     corresponding ATOM BIOS value
  *  @t: transmitter
  *  returns: digitalTransmitter
-- 
2.31.1

