Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D5BAF3912B4
	for <lists+dri-devel@lfdr.de>; Wed, 26 May 2021 10:47:38 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B9DFF6EC30;
	Wed, 26 May 2021 08:47:35 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x42e.google.com (mail-wr1-x42e.google.com
 [IPv6:2a00:1450:4864:20::42e])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DF6C46EC33
 for <dri-devel@lists.freedesktop.org>; Wed, 26 May 2021 08:47:34 +0000 (UTC)
Received: by mail-wr1-x42e.google.com with SMTP id y14so162668wrm.13
 for <dri-devel@lists.freedesktop.org>; Wed, 26 May 2021 01:47:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=G7iaDAB2ZuYVyZx68crg6QhzsOg2OHh06HlhEV13AEw=;
 b=I44CIXDqN65PoObP1/rnC7UjnZafXPh+DuBi0Kq2AWIMOpWajEcw78rMhgD/TBi7oB
 wQgH4fcGxdTk4hb1J/Z9fSCeumJdhs0xsuW5LIMQKFUtFdY6YpqGYGgty7pr46KVg5ny
 7q7Ea6E5YIAanyRZeCH40+Ipeq7NKd9LXLVQX7/ckkNe4lhcSsJTgZleDyj3sBvKcyYo
 X0Ssu4Uq4x6S4+g6/RC+pZsBe3yvR/6OjXnGTRdRkX9fK+pU9iexVjgDaBKyrtm/HJr/
 t0cXJxRJSOAnFQ9RPkc78nW8/5+Y4ZSP0fA51KvYlXl2dd/6gFl+keus84Ue65vf6oO8
 IYKw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=G7iaDAB2ZuYVyZx68crg6QhzsOg2OHh06HlhEV13AEw=;
 b=rz4mk84ELMVQ76+nJ8iKkGuj5Go31mlm6iEWRDyf/vy8KTRjtp6GiiMOox7WRf4XTM
 x5e5HDOek3ZAzXzXovg5D7SLO9w6BXt1TxbMVlDbWJAZpkvvtS53Liqe4MGiLANz+HFK
 58pH81TXPDgVYX7pqxNRvBtFajsS9x2/oXsIsAH6tukF33TExwjyL8IfnlCkcsmSlV4u
 YGyjy3ZXfwdS4g908RXeT56/LcDp3fH55KrUdQDlpp38em+31MbW78y2N2Ksyo8EVCHh
 OrtTHUeIVfXqmUWoPp7s/Hth6FaaXJE9OPm+gbXJ6w5rknGg8lf9tV4AZxbQM1GrJgN1
 kObg==
X-Gm-Message-State: AOAM530b9ZdOiJ7KVAoHf/A0IakJuBymxSU+Orb+8sj5rXBt88xZdsNC
 AZeBjiZzvY4imduSGtUXCPz3jQ==
X-Google-Smtp-Source: ABdhPJyISrVWreIUVorPlzyIi2UoKk92HM0mafCSCAAuFnhn6pcE2wxasr0XIJ9wDl0RbS9Aht9XuQ==
X-Received: by 2002:a5d:52ce:: with SMTP id r14mr17258203wrv.395.1622018853569; 
 Wed, 26 May 2021 01:47:33 -0700 (PDT)
Received: from dell.default ([91.110.221.223])
 by smtp.gmail.com with ESMTPSA id l18sm18911918wrt.97.2021.05.26.01.47.32
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 26 May 2021 01:47:33 -0700 (PDT)
From: Lee Jones <lee.jones@linaro.org>
To: lee.jones@linaro.org
Subject: [PATCH 03/34] drm/amd/pm/powerplay/hwmgr/smu7_thermal: Provide
 function name for 'smu7_fan_ctrl_set_default_mode()'
Date: Wed, 26 May 2021 09:46:55 +0100
Message-Id: <20210526084726.552052-4-lee.jones@linaro.org>
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
Cc: David Airlie <airlied@linux.ie>, linux-kernel@vger.kernel.org,
 amd-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 Alex Deucher <alexander.deucher@amd.com>, Evan Quan <evan.quan@amd.com>,
 =?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Fixes the following W=1 kernel build warning(s):

 drivers/gpu/drm/amd/amdgpu/../pm/powerplay/hwmgr/smu7_thermal.c:132: warning: This comment starts with '/**', but isn't a kernel-doc comment. Refer Documentation/doc-guide/kernel-doc.rst

Cc: Evan Quan <evan.quan@amd.com>
Cc: Alex Deucher <alexander.deucher@amd.com>
Cc: "Christian König" <christian.koenig@amd.com>
Cc: David Airlie <airlied@linux.ie>
Cc: Daniel Vetter <daniel@ffwll.ch>
Cc: amd-gfx@lists.freedesktop.org
Cc: dri-devel@lists.freedesktop.org
Signed-off-by: Lee Jones <lee.jones@linaro.org>
---
 drivers/gpu/drm/amd/pm/powerplay/hwmgr/smu7_thermal.c | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/drivers/gpu/drm/amd/pm/powerplay/hwmgr/smu7_thermal.c b/drivers/gpu/drm/amd/pm/powerplay/hwmgr/smu7_thermal.c
index 0d38d4206848a..6cfe148ed45bb 100644
--- a/drivers/gpu/drm/amd/pm/powerplay/hwmgr/smu7_thermal.c
+++ b/drivers/gpu/drm/amd/pm/powerplay/hwmgr/smu7_thermal.c
@@ -129,10 +129,10 @@ int smu7_fan_ctrl_set_static_mode(struct pp_hwmgr *hwmgr, uint32_t mode)
 }
 
 /**
-* Reset Fan Speed Control to default mode.
-* @hwmgr:  the address of the powerplay hardware manager.
-* Exception: Should always succeed.
-*/
+ * smu7_fan_ctrl_set_default_mode - Reset Fan Speed Control to default mode.
+ * @hwmgr:  the address of the powerplay hardware manager.
+ * Exception: Should always succeed.
+ */
 int smu7_fan_ctrl_set_default_mode(struct pp_hwmgr *hwmgr)
 {
 	if (!hwmgr->fan_ctrl_is_in_default_mode) {
-- 
2.31.1

