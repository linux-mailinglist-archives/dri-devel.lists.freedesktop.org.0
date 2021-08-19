Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id E650D3F2779
	for <lists+dri-devel@lfdr.de>; Fri, 20 Aug 2021 09:17:26 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 038AF6EA24;
	Fri, 20 Aug 2021 07:17:19 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pj1-x102f.google.com (mail-pj1-x102f.google.com
 [IPv6:2607:f8b0:4864:20::102f])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C368B6E83A
 for <dri-devel@lists.freedesktop.org>; Thu, 19 Aug 2021 12:07:23 +0000 (UTC)
Received: by mail-pj1-x102f.google.com with SMTP id
 gz13-20020a17090b0ecdb0290178c0e0ce8bso7116352pjb.1
 for <dri-devel@lists.freedesktop.org>; Thu, 19 Aug 2021 05:07:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=huaqin-corp-partner-google-com.20150623.gappssmtp.com; s=20150623;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=XW9PBRfUXR7lnr+qB3HOr4k2j7y13kRSAoHN05D6Ifg=;
 b=KiBUzRwggdBFgmkziOLOb5pfz8UtU0gBLyJGs/1sr3GLjkerlY9s5myH0k4uGUoKWI
 KqIO1N/17vLduYcHTuGYnew8wTp30ojF+Q+Wm/GL7IEEvcmGgKQ9ZzYcks5s988wscBr
 N86ZFT3WzHfV9mqOSrSPj52tFZSivBqQ96tNIHiEPnP+QvmvfEF4n/Qx6qqfzIs6PnZt
 adOnfCWfs78ohx3Dk71Bstu0fXJ7yplsEU0Fm5IjxM1TLGD3/y6zyyaIKftwKIN5PAbM
 ShoelnPRStpl6phjm7xC8wqcQaN+dEMFNAdmZ69DZfkS2XJEl4p0c0sjrL6OK2E5Zf7T
 JxZQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=XW9PBRfUXR7lnr+qB3HOr4k2j7y13kRSAoHN05D6Ifg=;
 b=p4v+lrxVhfFG6tfF1vBwEazzQ6XpKHF7bvS9hiLARFiAmitg/jN3r9t1qlK/EiP1vv
 7eQlRrRImtTTznko5W41g74JSpxKzpRyOsLWG11nzpOd4eWu/57laC0v9S4PhQmid6RL
 ARIx1jlev8nZjfWGwHZR+Ig2VpS2RvSLKDK9Of8tH+Hqo+0ROpHGfWrRAazKpWORLzA9
 eToDEJBKe5/4qOdiPNVxMxuvWntKCPada+dxf9gpBnJh/7zddpIYFUe1NLaQbZAUdXy7
 wV8UaMUEArR3iXegS5GJ7jOpNT4bOr+mGTWlQDbidsqOdOnQ7cZkO6mp3cYrslwqZjgI
 eRhQ==
X-Gm-Message-State: AOAM531q8O6N7DdL3ho+BG0I2VXMYE7Nh43wSN1vQ+BJO4J6OLc8goS6
 mTYOL6JHLW9fLxbUow51yLmOfhyZWE6PWWAX
X-Google-Smtp-Source: ABdhPJxiUKa8a3huSartOmTu6hUp+2s/pwoN75Wauzhn/Yfvc8fYi12RSHOoqksSf6ZtSPBBbweC7g==
X-Received: by 2002:a17:90a:f3d2:: with SMTP id
 ha18mr15199540pjb.68.1629374843002; 
 Thu, 19 Aug 2021 05:07:23 -0700 (PDT)
Received: from yc.huaqin.com ([101.78.151.213])
 by smtp.gmail.com with ESMTPSA id u16sm3971949pgh.53.2021.08.19.05.07.21
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 19 Aug 2021 05:07:22 -0700 (PDT)
From: yangcong <yangcong5@huaqin.corp-partner.google.com>
To: yangcong5@huaqin.com
Cc: dri-devel@lists.freedesktop.org,
 yangcong <yangcong5@huaqin.corp-partner.google.com>
Subject: [PATCH] no review: test for uploading patch
Date: Thu, 19 Aug 2021 20:07:17 +0800
Message-Id: <20210819120717.10110-1-yangcong5@huaqin.corp-partner.google.com>
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

