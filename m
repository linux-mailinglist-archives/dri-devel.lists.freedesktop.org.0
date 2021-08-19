Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 9B7FC3F2766
	for <lists+dri-devel@lfdr.de>; Fri, 20 Aug 2021 09:16:33 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 34C896EA10;
	Fri, 20 Aug 2021 07:16:31 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pg1-x52c.google.com (mail-pg1-x52c.google.com
 [IPv6:2607:f8b0:4864:20::52c])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A8D2F89CF8
 for <dri-devel@lists.freedesktop.org>; Thu, 19 Aug 2021 12:16:23 +0000 (UTC)
Received: by mail-pg1-x52c.google.com with SMTP id e7so5706166pgk.2
 for <dri-devel@lists.freedesktop.org>; Thu, 19 Aug 2021 05:16:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=huaqin-corp-partner-google-com.20150623.gappssmtp.com; s=20150623;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=XW9PBRfUXR7lnr+qB3HOr4k2j7y13kRSAoHN05D6Ifg=;
 b=Mptp1pA4YtcDupEhkavC37cwIcP6+2MmGVfWmI7tanr0eAuOJdOLDCwYbx1crzbqb5
 0v0rTG8bSn+ziMXAjvyTBLANphLPXnyeRFAr/ZPnsVLsEdpoP0abr/n8MC8bLBPnlCtc
 4d2A9J6aKXT8Zd1xGE/z8wnksVYzzOxElyhfYQhtljQK01F0wXI35AZ7l1RjQqexlXYQ
 qDhRyGUm6TetlvxO4skujE5fnenfCSsTYyEHoFDpaSGxqnFWd+G9FBwsXv/5SkqvqrdL
 9+0fP0wr5dSyi52mkkgHkgeeaW0jelBneo5iTvc2QFpHf5VVs4ljLPgvYcmRCqZ61tAK
 5vig==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=XW9PBRfUXR7lnr+qB3HOr4k2j7y13kRSAoHN05D6Ifg=;
 b=nIkphUw0j+F5R+X2fhowp8Wfna/8/EPDyazESW3MD5mBBRY1hWLs5L3WlqbM7OBpSX
 SfO7slUegZdF6YtmVCKE1CovBpp0aC0CE7BfK9QOk/zyc8DOCbv4++bylHeYqtp1vW2+
 124dWp68nJWeF+42m2oxetXIsrNcUs0WDnXL45ElFVOIiigzE+5vLcSUW57tjpUeqqYF
 K872IrRv9A3xUAQ2zq5CIx9POU0qH7eptwfIfP4nsj5i9CZR9uRFfqgOuyqxnHPOAlC8
 H3qCzRuLemSQ/NW5UXnfRzD2bye4zoxCLTJUXbOQVNAgeBxyO0Q2b3c8yKh9lIdobrNB
 CfZg==
X-Gm-Message-State: AOAM531wtF59A8m3zcccXwj39+twFJVtAhFtKKuoJ5byLaoH8DRlLuWq
 B5wy+jTgbFEopiwkyysVW3+maQ==
X-Google-Smtp-Source: ABdhPJw7V6EGo1tnilEOothrBDR5nCSFr4oKnofpmYZXwF8JtptQEa/1W/Q0M6C8eC4HpvxLsAs+GQ==
X-Received: by 2002:a63:2f04:: with SMTP id v4mr13720900pgv.380.1629375383409; 
 Thu, 19 Aug 2021 05:16:23 -0700 (PDT)
Received: from yc.huaqin.com ([101.78.151.213])
 by smtp.gmail.com with ESMTPSA id b7sm3053319pfl.195.2021.08.19.05.16.22
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 19 Aug 2021 05:16:23 -0700 (PDT)
From: yangcong <yangcong5@huaqin.corp-partner.google.com>
To: yangcong5@huaqin.com
Cc: dri-devel@lists.freedesktop.org,
 yangcong <yangcong5@huaqin.corp-partner.google.com>
Subject: [PATCH] no review: test for uploading patch
Date: Thu, 19 Aug 2021 20:16:18 +0800
Message-Id: <20210819121618.10837-1-yangcong5@huaqin.corp-partner.google.com>
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

