Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 4464A2F83A7
	for <lists+dri-devel@lfdr.de>; Fri, 15 Jan 2021 19:16:34 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F42326E4D0;
	Fri, 15 Jan 2021 18:16:31 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-x333.google.com (mail-wm1-x333.google.com
 [IPv6:2a00:1450:4864:20::333])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 27ED46E4CA
 for <dri-devel@lists.freedesktop.org>; Fri, 15 Jan 2021 18:16:23 +0000 (UTC)
Received: by mail-wm1-x333.google.com with SMTP id s24so1404337wmj.0
 for <dri-devel@lists.freedesktop.org>; Fri, 15 Jan 2021 10:16:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=Pk5+6mRjwwMBA1oTZMeewA7tFyIHWI0+EL96CyzELJ8=;
 b=vXcak5ntquYDz653i1Vs6VN6dq47ysugV+cN1Mcv7e+2SbuXbmiq4gzzxa3qtSfJtP
 iDLpgM9bzc4m2lupyUGfbM3/WzGGvqGS7802m0E3Xa1FxP57gU/VLF/+uN+8qxvLE4ru
 tLDSbod3qxRpck5TB1Na64i43keLb2lC5M+YaOXe57EIqjZE0wnjXfPx5fBXmA7P1/Jg
 eYb5bj5G2/rwj3+MFStbGYvn/gQOKYCgG+NB8gL0m/14PVzYC/n0LaevwZHgvZnBC4uG
 0/AH/tzlOU81Qpl6eBZ+JxqYYsd+wOAkTKfMZ55HzUixFp1CkhRmMBll2wLjnbYy22jC
 dIDg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=Pk5+6mRjwwMBA1oTZMeewA7tFyIHWI0+EL96CyzELJ8=;
 b=HQ3f7vkIuR6BO5WmxPHaqqMHCGkkARuP8XlNSWv7bRuqmKaCLRsuEDNG/ygQfiICxf
 02CIJdCTabTfg2XA1HdMenqJqSPH0SHo1X60XaiRbmdAVxAmeD9n6IjNcb8EN1cZsujb
 1OHQ65rhRB/bmlxyLWjda16QrraTV48GG0mQHFmwIj1iHEpXBAswjdo3LNxrf1VqrebN
 4oKWGACHWtvThq9jT/9vMO1EXeTUe8vZmhPvHO8TZMz5V9MmnfG3f28ilEBRbanmLKxJ
 AY+aUx3SL3fm7OKZjBDHiHQS9HuyR6Wq6wseQdimqf8bRDCPEpF0P8eH843nx8K6u1vd
 /R9g==
X-Gm-Message-State: AOAM5327L1X3MISjxDUNjKc7mF4J5JZuhjJWAcyj3NzRffR20rEEXiWE
 5i6rGlTIG7QzfHllVJCsoCEWjA==
X-Google-Smtp-Source: ABdhPJziSG5JNrmyeD/Cfd4CigulzEBuOBdQ6siz1iWXcp4UaNN7um1FPb2T4SUj0PnvdWvNa90U1g==
X-Received: by 2002:a1c:358a:: with SMTP id c132mr9884433wma.157.1610734581782; 
 Fri, 15 Jan 2021 10:16:21 -0800 (PST)
Received: from dell.default ([91.110.221.158])
 by smtp.gmail.com with ESMTPSA id b133sm14405979wme.33.2021.01.15.10.16.20
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 15 Jan 2021 10:16:21 -0800 (PST)
From: Lee Jones <lee.jones@linaro.org>
To: lee.jones@linaro.org
Subject: [PATCH 11/29] drm/gma500/psb_intel_sdvo: Demote kernel-doc abuses
Date: Fri, 15 Jan 2021 18:15:43 +0000
Message-Id: <20210115181601.3432599-12-lee.jones@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210115181601.3432599-1-lee.jones@linaro.org>
References: <20210115181601.3432599-1-lee.jones@linaro.org>
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
 Jesse Barnes <jesse.barnes@intel.com>, dri-devel@lists.freedesktop.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Fixes the following W=1 kernel build warning(s):

 drivers/gpu/drm/gma500/psb_intel_sdvo.c:230: warning: Function parameter or member 'psb_intel_sdvo' not described in 'psb_intel_sdvo_write_sdvox'
 drivers/gpu/drm/gma500/psb_intel_sdvo.c:230: warning: Function parameter or member 'val' not described in 'psb_intel_sdvo_write_sdvox'
 drivers/gpu/drm/gma500/psb_intel_sdvo.c:598: warning: Function parameter or member 'psb_intel_sdvo' not described in 'psb_intel_sdvo_get_trained_inputs'
 drivers/gpu/drm/gma500/psb_intel_sdvo.c:598: warning: Function parameter or member 'input_1' not described in 'psb_intel_sdvo_get_trained_inputs'
 drivers/gpu/drm/gma500/psb_intel_sdvo.c:598: warning: Function parameter or member 'input_2' not described in 'psb_intel_sdvo_get_trained_inputs'
 drivers/gpu/drm/gma500/psb_intel_sdvo.c:1831: warning: Function parameter or member 'dev_priv' not described in 'psb_intel_sdvo_select_ddc_bus'
 drivers/gpu/drm/gma500/psb_intel_sdvo.c:1831: warning: Function parameter or member 'sdvo' not described in 'psb_intel_sdvo_select_ddc_bus'
 drivers/gpu/drm/gma500/psb_intel_sdvo.c:1831: warning: Function parameter or member 'reg' not described in 'psb_intel_sdvo_select_ddc_bus'

Cc: Patrik Jakobsson <patrik.r.jakobsson@gmail.com>
Cc: David Airlie <airlied@linux.ie>
Cc: Daniel Vetter <daniel@ffwll.ch>
Cc: Jesse Barnes <jesse.barnes@intel.com>
Cc: Eric Anholt <eric@anholt.net>
Cc: dri-devel@lists.freedesktop.org
Signed-off-by: Lee Jones <lee.jones@linaro.org>
---
 drivers/gpu/drm/gma500/psb_intel_sdvo.c | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/drivers/gpu/drm/gma500/psb_intel_sdvo.c b/drivers/gpu/drm/gma500/psb_intel_sdvo.c
index 2ddf7e41aa5d4..355da28563891 100644
--- a/drivers/gpu/drm/gma500/psb_intel_sdvo.c
+++ b/drivers/gpu/drm/gma500/psb_intel_sdvo.c
@@ -221,7 +221,7 @@ static bool
 psb_intel_sdvo_create_enhance_property(struct psb_intel_sdvo *psb_intel_sdvo,
 				   struct psb_intel_sdvo_connector *psb_intel_sdvo_connector);
 
-/**
+/*
  * Writes the SDVOB or SDVOC with the given value, but always writes both
  * SDVOB and SDVOC to work around apparent hardware issues (according to
  * comments in the BIOS).
@@ -588,7 +588,7 @@ static bool psb_intel_sdvo_set_target_input(struct psb_intel_sdvo *psb_intel_sdv
 				    &targets, sizeof(targets));
 }
 
-/**
+/*
  * Return whether each input is trained.
  *
  * This function is making an assumption about the layout of the response,
@@ -1818,7 +1818,7 @@ psb_intel_sdvo_guess_ddc_bus(struct psb_intel_sdvo *sdvo)
 #endif
 }
 
-/**
+/*
  * Choose the appropriate DDC bus for control bus switch command for this
  * SDVO output based on the controlled output.
  *
-- 
2.25.1

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
