Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 3A2823912D2
	for <lists+dri-devel@lfdr.de>; Wed, 26 May 2021 10:48:11 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 107676EC42;
	Wed, 26 May 2021 08:48:00 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-x332.google.com (mail-wm1-x332.google.com
 [IPv6:2a00:1450:4864:20::332])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 489006EC38
 for <dri-devel@lists.freedesktop.org>; Wed, 26 May 2021 08:47:47 +0000 (UTC)
Received: by mail-wm1-x332.google.com with SMTP id
 s5-20020a7bc0c50000b0290147d0c21c51so27535wmh.4
 for <dri-devel@lists.freedesktop.org>; Wed, 26 May 2021 01:47:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=lH0QiIv9GplFfw8+sE0Oz9qNWUTXoSa9cJ3TV4liCwY=;
 b=RB/7ogGfRKR/H7xbMg6lQNSx4WrXK0TQZTmShXZ6vEsfWcdJt9mpwfOSaOSL1ocabF
 /L+NmojU7HiAsSEG+onzR8iw/jSwxAwiZvxxqQyIh2jDsOsHAv+ydEDMELlHuh+aoT/g
 wpOlNrw7F5oyIq8Weqcxg396wPPR2XTefQA029ZoYa2V3AFlbiST21TRICtIVUMwcLLD
 Uo5g2JUO6sWhLAmjiX8yx4YZrpjAmi5mrFL+Ue9nh/8iBuYPdLZEerF1WKq0TdqvD82T
 V0R0QuLlc77v1p3bR65MevvgCbC0PfDSSyJ2Qsd6JNxadfxJ6XpGRtK6u1DqxeuhxICk
 HxPw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=lH0QiIv9GplFfw8+sE0Oz9qNWUTXoSa9cJ3TV4liCwY=;
 b=VuJvhFbJwQ9JlQ1hlJbdNsZtHxhxoaBAIlv43e+Rx6O7ZOvdft5z6bDEeh3nEKgMBA
 fVjjFTA5YwYPK0zXEb0TdV+Nskwwoez3S7U09TuElWmYzzEfWF1pl0wjh7kqCM5daT4u
 nsFAV/R+Gsv0Ozo0Vx9BAz83Hx0MrsfsnWd6vEJkK9b2Y/eNlGjTvN7aID5TtZ8HtzMH
 8PfFF6JBGw4ATeMJD1zACVR25uHh2C0HqJI0/rjJRfTKP6bUmRAFeotxfNb+XfGJWdoL
 unURp0hL3BjalvQDbaKnXEyjoW4EWYSaqsFvXwLeJ4Ae/FM4BEegBincV8BU3igCa9iC
 i9Sw==
X-Gm-Message-State: AOAM532iu9Ze8zqOLo+Xy8ZlZuWP/SVflP4XUITjnh7URCJoGyGmV+II
 +hmYpchlHuIErPKSgDNhEsIbKg==
X-Google-Smtp-Source: ABdhPJxtgNzpcQUJUz+PEveawDKv5XlwuQ3p/fcDcouhayhnN7/EaDgJ8QeVnCBVRTFNMYQbAi+g0Q==
X-Received: by 2002:a1c:5454:: with SMTP id p20mr2263933wmi.160.1622018865874; 
 Wed, 26 May 2021 01:47:45 -0700 (PDT)
Received: from dell.default ([91.110.221.223])
 by smtp.gmail.com with ESMTPSA id l18sm18911918wrt.97.2021.05.26.01.47.44
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 26 May 2021 01:47:45 -0700 (PDT)
From: Lee Jones <lee.jones@linaro.org>
To: lee.jones@linaro.org
Subject: [PATCH 15/34] drm/amd/display/dc/dce110/dce110_hw_sequencer: Include
 our own header
Date: Wed, 26 May 2021 09:47:07 +0100
Message-Id: <20210526084726.552052-16-lee.jones@linaro.org>
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

 drivers/gpu/drm/amd/amdgpu/../display/dc/dce110/dce110_hw_sequencer.c:927:6: warning: no previous prototype for ‘dce110_edp_wait_for_T12’ [-Wmissing-prototypes]

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
 drivers/gpu/drm/amd/display/dc/dce110/dce110_hw_sequencer.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/drivers/gpu/drm/amd/display/dc/dce110/dce110_hw_sequencer.c b/drivers/gpu/drm/amd/display/dc/dce110/dce110_hw_sequencer.c
index 5ddeee96bf235..9219db79f32b6 100644
--- a/drivers/gpu/drm/amd/display/dc/dce110/dce110_hw_sequencer.c
+++ b/drivers/gpu/drm/amd/display/dc/dce110/dce110_hw_sequencer.c
@@ -63,6 +63,8 @@
 
 #include "atomfirmware.h"
 
+#include "dce110_hw_sequencer.h"
+
 #define GAMMA_HW_POINTS_NUM 256
 
 /*
-- 
2.31.1

