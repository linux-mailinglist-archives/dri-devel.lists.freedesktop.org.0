Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 691363F2767
	for <lists+dri-devel@lfdr.de>; Fri, 20 Aug 2021 09:16:37 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E59956EA11;
	Fri, 20 Aug 2021 07:16:33 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pg1-x52d.google.com (mail-pg1-x52d.google.com
 [IPv6:2607:f8b0:4864:20::52d])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B74716E5C3
 for <dri-devel@lists.freedesktop.org>; Thu, 19 Aug 2021 10:59:55 +0000 (UTC)
Received: by mail-pg1-x52d.google.com with SMTP id k14so5542597pga.13
 for <dri-devel@lists.freedesktop.org>; Thu, 19 Aug 2021 03:59:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=huaqin-corp-partner-google-com.20150623.gappssmtp.com; s=20150623;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=XW9PBRfUXR7lnr+qB3HOr4k2j7y13kRSAoHN05D6Ifg=;
 b=Xhgj3JfcvxdoFoi/wi9mdurHPg2PER/PbM8y185D/Vp3wgusVZ6CGQS0R7jBDofq0L
 KsUvLgbppIlJAPBO1zj88dfx90DtXNmq6SFpB8ena9eEj0WTdbaPnLpHxWCs8Rr6lzKY
 W1+QAmuCszK3803qcvi4I2aVohjWkodJj2CqdVYEb6cxsPIkrJwP9porD+fypHlbqykQ
 CfXghKNdYie+PXRHkgDS6fOEnnB1AR8D6oBexRQQqy5JMWK2rCW6aofWqvyidA4QTemK
 zhrRbruc+n6+aD67F+GGscDoqh1ijbdqwsz+TRN+QuyX9Y6BukvyDwmA7KMjLEfUoA69
 ExWw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=XW9PBRfUXR7lnr+qB3HOr4k2j7y13kRSAoHN05D6Ifg=;
 b=klKWZr5Z9sn9NeFoljMisX8q4cNtXgPGsL1xpK42D+pP4RvxENnJHHHYa4Qnh4XAew
 O8E5b65aWbBuMkOB37ftE2VZy1u9urTy813TPX/TvH+PJemy8B6FN87shK7Hxpj1asO0
 316H5RxOmPpCRNZtUFdX84CkMwJicXyVqI5YdSaNQOIoSX4Yx18I9sa5x7QADP/q9269
 EDKCmlL2LF0XtogDVWEw+F8Wf+zQNN+KRNp7UK6G8Xm55tBYiNxpZEgF8L25m//muXoA
 B5W+90oDs6tKS5pFaBtmNvxvCKWrVQboZheArYDmShdVoLAGRja3JmKryxZxYP1Xvrsy
 ZbEg==
X-Gm-Message-State: AOAM532t1HvpY7SGjyJv5rgMVzbhnCwyvekyIilmlIwmApnVtyMGFCrd
 7hRdDcCL4Mq8eTbBlWVIcPNaFg==
X-Google-Smtp-Source: ABdhPJwCKJTtSstBV3tj6PSvXlAE1A7QBwmJ4DVAso+DyKU9m7MPq8P3nHmEAdk8N8bFlGwP4JeQuw==
X-Received: by 2002:a63:1e4e:: with SMTP id p14mr13566517pgm.261.1629370795389; 
 Thu, 19 Aug 2021 03:59:55 -0700 (PDT)
Received: from yc.huaqin.com ([101.78.151.214])
 by smtp.gmail.com with ESMTPSA id m18sm2827902pjq.32.2021.08.19.03.59.53
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 19 Aug 2021 03:59:54 -0700 (PDT)
From: yangcong <yangcong5@huaqin.corp-partner.google.com>
To: yangcong5@huaqin.com
Cc: dri-devel@lists.freedesktop.org,
 yangcong <yangcong5@huaqin.corp-partner.google.com>
Subject: [PATCH] no review: test for uploading patch
Date: Thu, 19 Aug 2021 18:59:50 +0800
Message-Id: <20210819105950.5182-1-yangcong5@huaqin.corp-partner.google.com>
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

no review: test for uploading patch
---
 drivers/gpu/drm/panel/panel-simple.c | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/drivers/gpu/drm/panel/panel-simple.c b/drivers/gpu/drm/panel/panel-simple.c
index 1b80290c2b53..fa4925e5b1bf 100644
--- a/drivers/gpu/drm/panel/panel-simple.c
+++ b/drivers/gpu/drm/panel/panel-simple.c
@@ -42,6 +42,10 @@
 /**
  * struct panel_desc - Describes a simple panel.
  */
+ 
+/**
+ * test patch for panel.
+ */
 struct panel_desc {
 	/**
 	 * @modes: Pointer to array of fixed modes appropriate for this panel.
-- 
2.25.1

