Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 108CD3F277B
	for <lists+dri-devel@lfdr.de>; Fri, 20 Aug 2021 09:17:36 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9E8406EA25;
	Fri, 20 Aug 2021 07:17:32 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pl1-x633.google.com (mail-pl1-x633.google.com
 [IPv6:2607:f8b0:4864:20::633])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B47DE6E5C3
 for <dri-devel@lists.freedesktop.org>; Thu, 19 Aug 2021 11:12:54 +0000 (UTC)
Received: by mail-pl1-x633.google.com with SMTP id f3so3723463plg.3
 for <dri-devel@lists.freedesktop.org>; Thu, 19 Aug 2021 04:12:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=huaqin-corp-partner-google-com.20150623.gappssmtp.com; s=20150623;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=J6U9S0s17cRugomog4lLkEVfjR7QoaRMCFqRJRXrs9A=;
 b=xDAs+eY60P5CaBKeKpa5ClLus7xHHGxQnu9eNIVp4Bznqj5PJHz3gkYRr3eGbjmhe9
 7ryz50BUQwNIJj5XhzDwbu22FiLpV0w6BcqqY30tcXPMoHJIMDqhO6aXIwY14SqHfXyD
 d8wbCUPF9on//ljA1rwoOWjswDcHdL/edYCAiSXvNGebJ3ZZOfLohOvY9OP+br2wnjAP
 8znGKY7GwuqZsf6CmE6qS0n/+ge1XU1p4YxdDySm9oPP0amFmOD0wsXrLKB9kYLzuwAX
 TG4Uqfg2g+zvhYM1OibnQt5zcgNK/CAFn2NpbcQllTMZZpOuJWZ7Hr/4YY+g9Hy0QmXQ
 RUJw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=J6U9S0s17cRugomog4lLkEVfjR7QoaRMCFqRJRXrs9A=;
 b=L6bSjvnuHCllTXuv4B1qTPZGuaCSsF0YTJjIWqAHb2aTwYuSuv5xOAtsZ60GThGbDu
 +xx56PieA51yM2e86vpPPfj8uqjRlju7VhCVzZF/BicvVz+bLCLczK62fvuL9vha2iQM
 xkCYsIzRWBKJCPbsnKrn6DapxPqAXseWVPf1l+L7Dj52+ENrrgo8zusyfc2XF1vEIJoY
 TGCdBNkKQdz0PYvdqn3WFH5xgEe/CEPp7/ZGko2KfMEV7MBHgpCQo4taMNjVs82sZpWw
 TwgiV8L3LmxF3EwZC6gP881JOyTAvV0p5WoKgPSUEAzCHlELy0UeBmAd1Vx1J5ckAtTc
 A/vA==
X-Gm-Message-State: AOAM532qNC6ANESZIB63TsRHXcAShAY0XgmWp1ewnuSI9w3+spZmrwoh
 K2CVoR5QG0FSLR82RHHMawlkPg==
X-Google-Smtp-Source: ABdhPJyVpMXLZ0QaVt+9RITrNffuUw7xt7/JX1+RTvfPNCG+XaP7sV4QHpi7/x6WhVV2pY25g1H+lA==
X-Received: by 2002:a17:90a:eb17:: with SMTP id
 j23mr14491185pjz.229.1629371574295; 
 Thu, 19 Aug 2021 04:12:54 -0700 (PDT)
Received: from xu.huaqin.com ([101.78.151.213])
 by smtp.gmail.com with ESMTPSA id ne3sm8133995pjb.51.2021.08.19.04.12.52
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 19 Aug 2021 04:12:53 -0700 (PDT)
From: xuxinxiong <xuxinxiong@huaqin.corp-partner.google.com>
To: xuxinxiong@huaqin.com
Cc: dri-devel@lists.freedesktop.org,
 xuxinxiong <xuxinxiong@huaqin.corp-partner.google.com>
Subject: [PATCH] This is only used for testing upstream progress
Date: Thu, 19 Aug 2021 19:12:43 +0800
Message-Id: <20210819111243.2695376-1-xuxinxiong@huaqin.corp-partner.google.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Mailman-Approved-At: Fri, 20 Aug 2021 07:16:30 +0000
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

We want to test the upstream progress.

Signed-off-by: xuxinxiong <xuxinxiong@huaqin.corp-partner.google.com>
---
 drivers/gpu/drm/panel/panel-boe-tv101wum-nl6.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/drivers/gpu/drm/panel/panel-boe-tv101wum-nl6.c b/drivers/gpu/drm/panel/panel-boe-tv101wum-nl6.c
index dc49079a74d1..ce7437d1b682 100644
--- a/drivers/gpu/drm/panel/panel-boe-tv101wum-nl6.c
+++ b/drivers/gpu/drm/panel/panel-boe-tv101wum-nl6.c
@@ -4,6 +4,8 @@
  * Author: Jitao Shi <jitao.shi@mediatek.com>
  */
 
+/* This is used for test upstream progress */
+
 #include <linux/delay.h>
 #include <linux/gpio/consumer.h>
 #include <linux/module.h>
-- 
2.25.1

