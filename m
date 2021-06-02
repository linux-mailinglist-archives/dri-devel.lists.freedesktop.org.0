Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 4C1CA398CF8
	for <lists+dri-devel@lfdr.de>; Wed,  2 Jun 2021 16:33:52 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F3AAC6ECBA;
	Wed,  2 Jun 2021 14:33:32 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-x335.google.com (mail-wm1-x335.google.com
 [IPv6:2a00:1450:4864:20::335])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5B5616ECCE
 for <dri-devel@lists.freedesktop.org>; Wed,  2 Jun 2021 14:33:31 +0000 (UTC)
Received: by mail-wm1-x335.google.com with SMTP id
 h5-20020a05600c3505b029019f0654f6f1so3390542wmq.0
 for <dri-devel@lists.freedesktop.org>; Wed, 02 Jun 2021 07:33:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=S4QyaYMBoYLFq2bECv9NcJDq+15DdDgMC7JcY/MSiHQ=;
 b=ZHA4IONbN+kviuc/7VbXytRPaVxiy3BtnnGuE9xq9bBqBdkVFCTn/zFV85GqT3Mpk7
 RoiU7RBUA/zqv8ZPFH/ojovuu8ys/TwIs8hJnDW9d5sT8rBc5EDQH33XMKlg0Sla41xe
 tAqsWaYceMT96z79m6Zipp0DNqpxVxdOi4rPXeRVacyHcb5WZPeSC7WvHPUKb/5ADF6N
 xPkiFTvs2wJa72Y8kr4r/ImovYGj512DKk+WQHX4HC3ygj8mmPOMp6pgLvyFOWhWqJYq
 QP0oiKEaR63hfoNtZ2vgcAQjf9J80Naq5moBuvB4884j/3Rv+Ot6vplisPpHKYazkESt
 fIBg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=S4QyaYMBoYLFq2bECv9NcJDq+15DdDgMC7JcY/MSiHQ=;
 b=WCQu0RPlmQoa3hBIgjsgAbKcdcWcYNQBTmh29eRhdcEmhLP8QrSZaU4UNqCCqkVDrI
 mDOyrGT5sEBVshR5/DdheiVJjsi2VrFQ5S7BYB/pzUep4ta7QzIp7+hPZJVi/X/R1GQv
 YQ436xz/Oc4P1AmlY7lBcSyIjQyTzpZK82cq3SdtSI6l5vN7IoJLL1wsD6w1KkxWOeoi
 rtaPbLQF8TCcYf3tBvRpCrHS//c77Ui7PBDxOhr4+WePkmDeqq9pcAWv4iNXS52fDHUo
 K/GEU0NKRLuP4Al4/LkHQuiUQw94PdgyoeJ5oGRd9HkZD2FolVfFjy4eg3HioCHMEk+V
 eLBw==
X-Gm-Message-State: AOAM531QrNKofFYQbG4UMI6kZ/3dc88nYnfzIi4EvLlptDWicX0b396Y
 neExqUuxTaVU1M/QqtVvQNv9ew==
X-Google-Smtp-Source: ABdhPJz9yQsFXiAFF7uLV3aeeBapyXs4piTHs0jC4AWBx1IuzK7GHp9xp5K+NUdA8RoxwTP+oOfcYQ==
X-Received: by 2002:a1c:bc09:: with SMTP id m9mr15312997wmf.143.1622644410082; 
 Wed, 02 Jun 2021 07:33:30 -0700 (PDT)
Received: from dell.default ([91.110.221.214])
 by smtp.gmail.com with ESMTPSA id o11sm132315wrq.93.2021.06.02.07.33.29
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 02 Jun 2021 07:33:29 -0700 (PDT)
From: Lee Jones <lee.jones@linaro.org>
To: lee.jones@linaro.org
Subject: [RESEND 19/26] drm/ttm/ttm_tt: Demote non-conformant kernel-doc header
Date: Wed,  2 Jun 2021 15:32:53 +0100
Message-Id: <20210602143300.2330146-20-lee.jones@linaro.org>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210602143300.2330146-1-lee.jones@linaro.org>
References: <20210602143300.2330146-1-lee.jones@linaro.org>
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
Cc: David Airlie <airlied@linux.ie>, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, Huang Rui <ray.huang@amd.com>,
 Christian Koenig <christian.koenig@amd.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Fixes the following W=1 kernel build warning(s):

 drivers/gpu/drm/ttm/ttm_tt.c:398: warning: Function parameter or member 'num_pages' not described in 'ttm_tt_mgr_init'
 drivers/gpu/drm/ttm/ttm_tt.c:398: warning: Function parameter or member 'num_dma32_pages' not described in 'ttm_tt_mgr_init'

Cc: Christian Koenig <christian.koenig@amd.com>
Cc: Huang Rui <ray.huang@amd.com>
Cc: David Airlie <airlied@linux.ie>
Cc: Daniel Vetter <daniel@ffwll.ch>
Cc: dri-devel@lists.freedesktop.org
Signed-off-by: Lee Jones <lee.jones@linaro.org>
---
 drivers/gpu/drm/ttm/ttm_tt.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/ttm/ttm_tt.c b/drivers/gpu/drm/ttm/ttm_tt.c
index 539e0232cb3b4..682c840c9a517 100644
--- a/drivers/gpu/drm/ttm/ttm_tt.c
+++ b/drivers/gpu/drm/ttm/ttm_tt.c
@@ -415,7 +415,7 @@ DEFINE_SHOW_ATTRIBUTE(ttm_tt_debugfs_shrink);
 #endif
 
 
-/**
+/*
  * ttm_tt_mgr_init - register with the MM shrinker
  *
  * Register with the MM shrinker for swapping out BOs.
-- 
2.31.1

