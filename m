Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id A2D3525E4B0
	for <lists+dri-devel@lfdr.de>; Sat,  5 Sep 2020 02:36:02 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EC4616ED05;
	Sat,  5 Sep 2020 00:35:34 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-qk1-x741.google.com (mail-qk1-x741.google.com
 [IPv6:2607:f8b0:4864:20::741])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B4E046EC99
 for <dri-devel@lists.freedesktop.org>; Fri,  4 Sep 2020 17:30:06 +0000 (UTC)
Received: by mail-qk1-x741.google.com with SMTP id w16so7028734qkj.7
 for <dri-devel@lists.freedesktop.org>; Fri, 04 Sep 2020 10:30:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=marek-ca.20150623.gappssmtp.com; s=20150623;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=qMG1ps8fgPCdKYmX4D9C0vTU0mM7NukKZP7s8FwwQlE=;
 b=ViyTBUKFruXN0VnmAsL8NgjxNce0CorHAmM5BdC1GhOcVAdeJNLMUmWeG2CnKftulb
 FXUGbhhHvbRj0kchEEER/Eb9W2ilBzfHXqxWlpHzRHrvZE/4W9syeqz4vRreMGIBOXL6
 msJsqURCahbJJZF6/2RDY/mhTzUH37BFK1kiYBealqQj/75yX0xAWMBOMD/Qd1yIT0Ci
 mrvaCfUqs6QnP6V+lx6q9Ff1yg9E2hJfBCrFYHViAlbVVe4EB6B5UnpEd0E8NlRnITpQ
 xWLdRmubcwWeXUGu28zFiqNI606wGvyaWuOO/K8A1fjjVKqssVvNOfnwF5DaW03GWGcA
 C5EA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=qMG1ps8fgPCdKYmX4D9C0vTU0mM7NukKZP7s8FwwQlE=;
 b=hp8jRQSn4ZlqCSRbBXLj3OaV9IDmpdVxmnAGemobgCrpfMB0zgSiD0FZSCyoJ5BP+S
 ISCjFwmLIueDN5dL+sAKTMnwsn1/sCaANOUkBhPtfbELMoq/GMQ1ek0sAco13ZHcKsdB
 Icp3KQQHtSM5axV6MiAUqT8zg1b2nE1fxWgVEvy51jtvTb/3pkwRD7gSNlwt2eMiwax9
 /2KwVtr9eaIYklZ4i66owY3qcDCi6IoQXzKVBoFa9QRKD59aK0Q0SRyKqfdrfqw8Xs+P
 iYGUIBN4LpkU+hZHU1OJdkmsZq5UoIMj1UAlM7RKwfKSzUvySTU23FcsFggA9zcANB2b
 nIGA==
X-Gm-Message-State: AOAM530jMmDc1X66VrXyFU6DKlH6wE1Zxnbz179C63cJWniNwHKVCWMT
 yLRadbKKJ/u45p5yjf+BSbFf7w==
X-Google-Smtp-Source: ABdhPJx58g/vQxNQERfeujwhlruc479tT6x7SVFypiBtCQJtMohP5A6VeGR8kjgBFY56JBEQXbOpDA==
X-Received: by 2002:a37:2cc1:: with SMTP id s184mr9064820qkh.357.1599240605934; 
 Fri, 04 Sep 2020 10:30:05 -0700 (PDT)
Received: from localhost.localdomain ([147.253.86.153])
 by smtp.gmail.com with ESMTPSA id i66sm5103330qkc.63.2020.09.04.10.30.04
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 04 Sep 2020 10:30:05 -0700 (PDT)
From: Jonathan Marek <jonathan@marek.ca>
To: freedreno@lists.freedesktop.org
Subject: [PATCH 1/3] drm/msm/dsi: remove unused clk_pre/clk_post in
 msm_dsi_dphy_timing
Date: Fri,  4 Sep 2020 13:28:36 -0400
Message-Id: <20200904172859.25633-2-jonathan@marek.ca>
X-Mailer: git-send-email 2.26.1
In-Reply-To: <20200904172859.25633-1-jonathan@marek.ca>
References: <20200904172859.25633-1-jonathan@marek.ca>
MIME-Version: 1.0
X-Mailman-Approved-At: Sat, 05 Sep 2020 00:35:27 +0000
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
Cc: David Airlie <airlied@linux.ie>,
 "open list:DRM DRIVER FOR MSM ADRENO GPU" <linux-arm-msm@vger.kernel.org>,
 Konrad Dybcio <konradybcio@gmail.com>,
 "open list:DRM DRIVER FOR MSM ADRENO GPU" <dri-devel@lists.freedesktop.org>,
 open list <linux-kernel@vger.kernel.org>,
 AngeloGioacchino Del Regno <kholk11@gmail.com>, Sean Paul <sean@poorly.run>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

The clk_pre/clk_post values in shared_timings are used instead, and these
are unused.

Signed-off-by: Jonathan Marek <jonathan@marek.ca>
---
 drivers/gpu/drm/msm/dsi/phy/dsi_phy.h | 2 --
 1 file changed, 2 deletions(-)

diff --git a/drivers/gpu/drm/msm/dsi/phy/dsi_phy.h b/drivers/gpu/drm/msm/dsi/phy/dsi_phy.h
index ef8672d7b123..886a9e3b44b5 100644
--- a/drivers/gpu/drm/msm/dsi/phy/dsi_phy.h
+++ b/drivers/gpu/drm/msm/dsi/phy/dsi_phy.h
@@ -50,8 +50,6 @@ extern const struct msm_dsi_phy_cfg dsi_phy_10nm_cfgs;
 extern const struct msm_dsi_phy_cfg dsi_phy_10nm_8998_cfgs;
 
 struct msm_dsi_dphy_timing {
-	u32 clk_pre;
-	u32 clk_post;
 	u32 clk_zero;
 	u32 clk_trail;
 	u32 clk_prepare;
-- 
2.26.1

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
