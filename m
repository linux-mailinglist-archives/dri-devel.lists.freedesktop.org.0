Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id F0D972F83AC
	for <lists+dri-devel@lfdr.de>; Fri, 15 Jan 2021 19:16:43 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 22C3B6E4E6;
	Fri, 15 Jan 2021 18:16:38 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x429.google.com (mail-wr1-x429.google.com
 [IPv6:2a00:1450:4864:20::429])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3D2F66E4D0
 for <dri-devel@lists.freedesktop.org>; Fri, 15 Jan 2021 18:16:31 +0000 (UTC)
Received: by mail-wr1-x429.google.com with SMTP id m4so10191230wrx.9
 for <dri-devel@lists.freedesktop.org>; Fri, 15 Jan 2021 10:16:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=5LH1gDNEpa04mVmMwrdsnTHPuZadf7vRIYykG237nqs=;
 b=OoioVsm+TQx6nV7gS8EYVFvVJ1Fv6AK0ME2b/TTWZE6GVipp0qR5swgZ83FEbZ12hJ
 bHfLNqxGSPlvKS/kjMA6EFo0ABSEJZ7RxksriR+eL3aLaSRw+duGxMmfMFNZ/6DWKvR1
 W10uIAzHzlddHv+JocGFwsSmxmEbLV0Tlhngr0vMllvQKG/JNDysKLzXv0AyOiKStki+
 WjLofYAriQTZgUtIf2WYUjD/ue1rD7qJbI760ANCfyWYCqT4EUaiH+f56OdxXd2zqSut
 keQOIR2LCIAHQ4j+dA2EHerIqjTJF5JZ+VvUE4csnjttU6l1DvBN4KjjB/ingtnz4MwT
 z7Kg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=5LH1gDNEpa04mVmMwrdsnTHPuZadf7vRIYykG237nqs=;
 b=bKsOyfDq856hmCYdqmlY9nVh6sssSgh2GQv4OUYVv4XwrxG/x6uUKjmcOWZ3qvpeg8
 9HuwfXzUt+hKjHpPfHeb0zLrs7ud3O21uW2nrLlfC+zjjBSyJcPq/rGSEcOKftcsqO97
 INNX1+XnhtL4ztg6YnLcgmV8/7VeV4t1FUhisuwmKs+wjLz/Tf2KhydJFIoBJvdBzwe6
 1I5oxRTKj9fPniYQ5BwpWfO5Zk8lSNAl4PjnlLP1d+tD8BZ6c9hz7YhDLLLipOm8+Vzn
 pCEU1MsjnLk1JQlL2jDUbjn7m4jnzmuR2IMnIK0m312jV9LtLwiamLXapRSv/U8uP3vR
 U0Yg==
X-Gm-Message-State: AOAM531Xg/0V6HcB3f+WihL9sxMvtEO9Y/6bap7gilCrmruDBdrmkbfc
 C+HMk0uJJwyCFoyCVULmOT52yA==
X-Google-Smtp-Source: ABdhPJyKcUhDIemsychtub1SOGZ27ei+YoeVSS+BDyIF3O5uT+K79mKwPFMnaxURU7ZO+559zmOaNQ==
X-Received: by 2002:adf:fdce:: with SMTP id i14mr14514805wrs.58.1610734589879; 
 Fri, 15 Jan 2021 10:16:29 -0800 (PST)
Received: from dell.default ([91.110.221.158])
 by smtp.gmail.com with ESMTPSA id b133sm14405979wme.33.2021.01.15.10.16.28
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 15 Jan 2021 10:16:29 -0800 (PST)
From: Lee Jones <lee.jones@linaro.org>
To: lee.jones@linaro.org
Subject: [PATCH 17/29] drm/gma500/cdv_intel_dp: Demote one unworthy header fix
 another
Date: Fri, 15 Jan 2021 18:15:49 +0000
Message-Id: <20210115181601.3432599-18-lee.jones@linaro.org>
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
Cc: Keith Packard <keithp@keithp.com>, David Airlie <airlied@linux.ie>,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Fixes the following W=1 kernel build warning(s):

 drivers/gpu/drm/gma500/cdv_intel_dp.c:315: warning: Function parameter or member 'encoder' not described in 'is_edp'
 drivers/gpu/drm/gma500/cdv_intel_dp.c:315: warning: Excess function parameter 'intel_dp' description in 'is_edp'
 drivers/gpu/drm/gma500/cdv_intel_dp.c:1698: warning: Function parameter or member 'connector' not described in 'cdv_intel_dp_detect'
 drivers/gpu/drm/gma500/cdv_intel_dp.c:1698: warning: Function parameter or member 'force' not described in 'cdv_intel_dp_detect'

Cc: Patrik Jakobsson <patrik.r.jakobsson@gmail.com>
Cc: David Airlie <airlied@linux.ie>
Cc: Daniel Vetter <daniel@ffwll.ch>
Cc: Keith Packard <keithp@keithp.com>
Cc: dri-devel@lists.freedesktop.org
Signed-off-by: Lee Jones <lee.jones@linaro.org>
---
 drivers/gpu/drm/gma500/cdv_intel_dp.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/gma500/cdv_intel_dp.c b/drivers/gpu/drm/gma500/cdv_intel_dp.c
index bfd9a15d63b1a..6d3ada39ff867 100644
--- a/drivers/gpu/drm/gma500/cdv_intel_dp.c
+++ b/drivers/gpu/drm/gma500/cdv_intel_dp.c
@@ -306,7 +306,7 @@ static uint32_t dp_vswing_premph_table[] = {
 };
 /**
  * is_edp - is the given port attached to an eDP panel (either CPU or PCH)
- * @intel_dp: DP struct
+ * @encoder: GMA encoder struct
  *
  * If a CPU or PCH DP output is attached to an eDP panel, this function
  * will return true, and false otherwise.
@@ -1687,7 +1687,7 @@ static enum drm_connector_status cdv_dp_detect(struct gma_encoder *encoder)
 	return status;
 }
 
-/**
+/*
  * Uses CRT_HOTPLUG_EN and CRT_HOTPLUG_STAT to detect DP connection.
  *
  * \return true if DP port is connected.
-- 
2.25.1

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
