Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id BD9383F1916
	for <lists+dri-devel@lfdr.de>; Thu, 19 Aug 2021 14:25:48 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8B6746E8C2;
	Thu, 19 Aug 2021 12:25:43 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pg1-x52d.google.com (mail-pg1-x52d.google.com
 [IPv6:2607:f8b0:4864:20::52d])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3718E6E8A2
 for <dri-devel@lists.freedesktop.org>; Thu, 19 Aug 2021 12:25:42 +0000 (UTC)
Received: by mail-pg1-x52d.google.com with SMTP id q2so5728035pgt.6
 for <dri-devel@lists.freedesktop.org>; Thu, 19 Aug 2021 05:25:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=huaqin-corp-partner-google-com.20150623.gappssmtp.com; s=20150623;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=XW9PBRfUXR7lnr+qB3HOr4k2j7y13kRSAoHN05D6Ifg=;
 b=PTdsPiESeKaUOOFqzd0mlPjFsLrP9jVADDhywGQb9ceINtk+I36p+Zq73M3LLo+J6c
 C7ntcLKx0bYAcjHkH+kzJNzrX1lQDLewjHCAJWvN8ijpd1kN46Dn8PeVNe9iKPMKcHE/
 zwOnrz6L21aic4k4gGmvryQqqc5S9tHgrkbu5FLURanbCgRFAV2pk666mpphjQCoB6VX
 sX7oY28kIaDWmHWy890qQWajYaI+lXy+sw1W09wd6Vdf0ne7N5PVjeFs14YT0/h/9mYL
 WEI8VEC3WaxMPpHFsvBa1bk/ahEcJEmXnZ3sAdJ2w8b+PxvqspW/haGr7TLhRXRVqUUP
 K31Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=XW9PBRfUXR7lnr+qB3HOr4k2j7y13kRSAoHN05D6Ifg=;
 b=gYjaBKNCdngXM/6IQRzvBSmQP2NTYTUBtWIOVbXoLg/Bdfygo+LVwFyutZLRDf6u/W
 9IEnezAO8VOtJY1ADKbAxcQualj+n8J95LsYxz6RcungEszW/XYVUcAKrGVM60yzShTj
 fyoLYXCuGpCUH8E21uysoRa2PLwDRDAZNjkVGspGSmOSe4bm8eg3H9fRYVh/9OCRuMeg
 6oUV1soPP1II89n5eVf6l5Dkev+/tcQ9dOnpGgA4t0LCzazU8tULf+H+divdm1PGIWBP
 IROizZV//w3lOdnVrlmjkpNc1N/+qhK0L4Jqdgg0ChAj+k8Ce9v/fILZYczFlasUibEr
 T94g==
X-Gm-Message-State: AOAM5321Rzfxte4qu4ypaLIrnNIVZevy9NtR3tvVOREAu5242NrJnS2D
 Jia8aOwZQzfWKig0h8A0vkHCSQ==
X-Google-Smtp-Source: ABdhPJyr5R2VyBQ7Zkp0b5rJb35mp4YmzriEkpcreO4L4Pw6V/aCtylG1PlpjcVKRzl8ae6IIPVZQQ==
X-Received: by 2002:a65:450d:: with SMTP id n13mr13824917pgq.13.1629375941873; 
 Thu, 19 Aug 2021 05:25:41 -0700 (PDT)
Received: from yc.huaqin.com ([101.78.151.213])
 by smtp.gmail.com with ESMTPSA id k197sm3439933pfd.190.2021.08.19.05.25.40
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 19 Aug 2021 05:25:41 -0700 (PDT)
From: yangcong <yangcong5@huaqin.corp-partner.google.com>
To: yangcong5@huaqin.com
Cc: dri-devel@lists.freedesktop.org,
 yangcong <yangcong5@huaqin.corp-partner.google.com>
Subject: [PATCH] no review: test for uploading patch
Date: Thu, 19 Aug 2021 20:25:36 +0800
Message-Id: <20210819122536.11416-1-yangcong5@huaqin.corp-partner.google.com>
X-Mailer: git-send-email 2.25.1
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

