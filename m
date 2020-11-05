Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 50A732A8181
	for <lists+dri-devel@lfdr.de>; Thu,  5 Nov 2020 15:52:46 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3CF886EDA2;
	Thu,  5 Nov 2020 14:52:40 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x442.google.com (mail-wr1-x442.google.com
 [IPv6:2a00:1450:4864:20::442])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 267C76EDA0
 for <dri-devel@lists.freedesktop.org>; Thu,  5 Nov 2020 14:52:32 +0000 (UTC)
Received: by mail-wr1-x442.google.com with SMTP id n15so2107892wrq.2
 for <dri-devel@lists.freedesktop.org>; Thu, 05 Nov 2020 06:52:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=F0IbdwxDH4j9csyHE4k5O0hxf8H6de2hTqN1yOLzedY=;
 b=N+9AOKvoS24VvDcMunCNgXiSgEzn4l1Am+g6ZNVSMuDooX+deYX5oJWAtDt2A/EY7P
 yu7qk3VrkH4ysHxosDjcQ3bnH0IqqYgA8oDzrmdEZ+6XvcGJB0/FuPE6rBVbsp5AUXgZ
 EWV+I+CJ+vGh87wbE4wS80cTatwtn1fWimWEj0k0qZoc6SlqOr2p4cw4V2A38vfgdee8
 DMLYwv/qszAuBohW0aF12ct7lTy5aVTld1e93cPR1FDuoGp59nKpIasJVfXe21/I/v8D
 cw8wTIwy9TvvdDfQNJP9ewj/6V3gn3mlSaVcOVW5mkKS2NkaVcjq8IDhIDnGR2klyvRJ
 hjRg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=F0IbdwxDH4j9csyHE4k5O0hxf8H6de2hTqN1yOLzedY=;
 b=iTROYDyXMCgdOo43pgswb5ir/+oSVmq2kVTVbkBZ7y3TxzEBdW+TGFWe9o6+hUykLP
 uzR8tJcRcmW72chFRKb2MkAe0vaogmcqYT6VC6caH8QcHQUQ1IyZEdKejOF3gbkCu//4
 EQ1einsSUiz771Hd0eTf32K1YQTWK9X3bqr94F3wdM+f+tER8CNRjzTfHtkuiXgxhuVL
 uhcGZjRmRHVgPXZrKg1x/mHuIQN1eEELcQsJ9qJNk9SrImdexoCrvfXcq29Vkxq/65W+
 jqvo5w5PwPlhLuDR3RBXDle23snV3SPctrF9CidgtkcGDehmjtmC3tnpvHVODC5AOxo0
 1gQA==
X-Gm-Message-State: AOAM5331mFbt9rvGSJ/s1R6eJRLlQLyEEiMGmjFFZaqEcWjlKd1F//vJ
 yRdEh2llYIFr+qqQAIsGGi5WZw==
X-Google-Smtp-Source: ABdhPJwAkqDrGU58mpfo9/oDp9kDfWjs3etPOM56QRr6g6b6lprxLixxEpoU8gNb6/mzmV66ghlueA==
X-Received: by 2002:adf:c14c:: with SMTP id w12mr3641178wre.40.1604587950781; 
 Thu, 05 Nov 2020 06:52:30 -0800 (PST)
Received: from dell.default ([91.110.221.242])
 by smtp.gmail.com with ESMTPSA id f5sm2631243wmh.16.2020.11.05.06.52.29
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 05 Nov 2020 06:52:30 -0800 (PST)
From: Lee Jones <lee.jones@linaro.org>
To: lee.jones@linaro.org
Subject: [PATCH 13/19] gpu: drm: ttm: ttm_tt: Demote kernel-doc header format
 abuses
Date: Thu,  5 Nov 2020 14:45:11 +0000
Message-Id: <20201105144517.1826692-14-lee.jones@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20201105144517.1826692-1-lee.jones@linaro.org>
References: <20201105144517.1826692-1-lee.jones@linaro.org>
MIME-Version: 1.0
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Fixes the following W=1 kernel build warning(s):

 drivers/gpu/drm/ttm/ttm_tt.c:45: warning: Function parameter or member 'bo' not described in 'ttm_tt_create'
 drivers/gpu/drm/ttm/ttm_tt.c:45: warning: Function parameter or member 'zero_alloc' not described in 'ttm_tt_create'
 drivers/gpu/drm/ttm/ttm_tt.c:83: warning: Function parameter or member 'ttm' not described in 'ttm_tt_alloc_page_directory'

Cc: Christian Koenig <christian.koenig@amd.com>
Cc: Huang Rui <ray.huang@amd.com>
Cc: David Airlie <airlied@linux.ie>
Cc: Daniel Vetter <daniel@ffwll.ch>
Cc: dri-devel@lists.freedesktop.org
Signed-off-by: Lee Jones <lee.jones@linaro.org>
---
 drivers/gpu/drm/ttm/ttm_tt.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/ttm/ttm_tt.c b/drivers/gpu/drm/ttm/ttm_tt.c
index 8861a74ac3351..3190bafd8b783 100644
--- a/drivers/gpu/drm/ttm/ttm_tt.c
+++ b/drivers/gpu/drm/ttm/ttm_tt.c
@@ -38,7 +38,7 @@
 #include <drm/drm_cache.h>
 #include <drm/ttm/ttm_bo_driver.h>
 
-/**
+/*
  * Allocates a ttm structure for the given BO.
  */
 int ttm_tt_create(struct ttm_buffer_object *bo, bool zero_alloc)
@@ -76,7 +76,7 @@ int ttm_tt_create(struct ttm_buffer_object *bo, bool zero_alloc)
 	return 0;
 }
 
-/**
+/*
  * Allocates storage for pointers to the pages that back the ttm.
  */
 static int ttm_tt_alloc_page_directory(struct ttm_tt *ttm)
-- 
2.25.1

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
