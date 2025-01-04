Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id EFFF2A015FE
	for <lists+dri-devel@lfdr.de>; Sat,  4 Jan 2025 17:53:05 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6B82410E37D;
	Sat,  4 Jan 2025 16:53:03 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="LrJVWo8C";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pl1-f182.google.com (mail-pl1-f182.google.com
 [209.85.214.182])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C673E10E37D
 for <dri-devel@lists.freedesktop.org>; Sat,  4 Jan 2025 16:53:02 +0000 (UTC)
Received: by mail-pl1-f182.google.com with SMTP id
 d9443c01a7336-21661be2c2dso168487825ad.1
 for <dri-devel@lists.freedesktop.org>; Sat, 04 Jan 2025 08:53:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1736009522; x=1736614322; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=p0gJLjGQtNMIfdSDNA5Kocy1zB0tmICb1ZatEZnjOMA=;
 b=LrJVWo8CqHd1EWVuH/5fQYZGCjFLcd/toC7jrXQ8SiN384K00Xd4Xt03J4tZk4api7
 k94X4t6u99Zz7Bw8eWOUIJsukhoJfzdSN6koXk0N6GasrD2S2hWr4YJ5gtYNewZvCG79
 KH1O7KIbRpoMwwYZkr1Wg23ymjM8TjWk0KbsB4ZNzKiFagjvWw+BjRceiYQBPf2aBl8T
 KOYV+bP6dASsGxS7eOfwYi+RboooCUbKW+fvFAZinqMt9MEg43oPJm4nAEv3Kj30EHJD
 evHvKFGC7jjfigSvK4/QyPQj18wDB6m48fRBO5Q5O9QrQ9UW6zYivAnucpIWe76m+7zH
 l2fQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1736009522; x=1736614322;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=p0gJLjGQtNMIfdSDNA5Kocy1zB0tmICb1ZatEZnjOMA=;
 b=JplN0UwV6ViP1nJ8jzUty8Nv/xegXBvSw1r3L8V34AI+DmC006fwUD4lnLn346MXgM
 +x1bdS0siBv1BdGAdOOc8ktIZIkoe9K5UbwwhTSuk1fdmkuqBt+EFDuZhtK+3ZSnmk0q
 xUf9J+GZfsK5oEy4f67R/u6jJpRcJPNWBki69yS75vDj61vvdyhZSP5LU/BQKk6eypCL
 d3csb2JF/6PmNXlI6RSfoDTUmTO+BwUNvxXoGTSlT7ngLUp0O0AXFplHtLyAX5iVyFPw
 TFcsuKOp+9VWmKnd+5CGXAYv92ijRokhJWpOSaLatW8J06xB/TYCJl0S+buLdhgxlvBb
 c8tQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCW6uYaZnZbYGE9vUOnCwKnWz23RmQOmMctnQ218OvbZ6lN2Mz+y208xQyr6JYp5C1PPl0oV9rqE8aU=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YxuV5uB1eM4F89+PZOoyBLdYqA+dPAV+aO0NXPN6IvTRztcpIgU
 /uEBqO7VmgVgKAjXgw9CC4wPF9FJ2kpKfjC5efJynlSl3GYCDGOD
X-Gm-Gg: ASbGncv8JI/t3nW+7HnEeB73zCvH9b3uAAtQDhdAR4Z834osEc5fryIDCEwXZehkACY
 auGGeuY9gpHrQWUKsP1527e8Oo+CD4S/trnFaR9uvmLad0y4+HUwIGAK/tF/TfwuQWrg60Y+0lp
 y+bEZQvOsIr8nsxjANdDO9mN+4mZG9/WMRTnLMViU2/ZRaYc+FRG/tykogEV4SWEkZynvH8ea9U
 DqdDfiRMDbP7GkxewXV2GfJX9+P2qJIgubCGVjfhdSfr+iNIak8lW1Cvcc6Hg==
X-Google-Smtp-Source: AGHT+IH5Di4BtjtEOxmRO2h6y+u798FSI6DLj9n7LXkA2xkip+HBFBpzXk2Tr/6rzuqsh0jSYWwosA==
X-Received: by 2002:a17:903:1cb:b0:215:9894:5679 with SMTP id
 d9443c01a7336-219e6cc8836mr687168675ad.0.1736009522209; 
 Sat, 04 Jan 2025 08:52:02 -0800 (PST)
Received: from eleanor-wkdl.. ([140.116.96.205])
 by smtp.gmail.com with ESMTPSA id
 d9443c01a7336-219dc9705c1sm262602295ad.101.2025.01.04.08.51.59
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 04 Jan 2025 08:52:01 -0800 (PST)
From: Yu-Chun Lin <eleanor15x@gmail.com>
To: maarten.lankhorst@linux.intel.com, mripard@kernel.org, tzimmermann@suse.de,
 airlied@gmail.com, simona@ffwll.ch
Cc: ruanjinjie@huawei.com, jserv@ccns.ncku.edu.tw,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 Yu-Chun Lin <eleanor15x@gmail.com>, kernel test robot <lkp@intel.com>,
 Kuan-Wei Chiu <visitorckw@gmail.com>,
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Subject: [PATCH v2] drm/tests: helpers: Fix compiler warning
Date: Sun,  5 Jan 2025 00:51:33 +0800
Message-ID: <20250104165134.1695864-1-eleanor15x@gmail.com>
X-Mailer: git-send-email 2.43.0
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

Delete one line break to make the format correct, resolving the
following warning during a W=1 build:

>> drivers/gpu/drm/tests/drm_kunit_helpers.c:324: warning: bad line: for a KUnit test

Reported-by: kernel test robot <lkp@intel.com>
Closes: https://lore.kernel.org/oe-kbuild-all/202501032001.O6WY1VCW-lkp@intel.com/
Reviewed-by: Kuan-Wei Chiu <visitorckw@gmail.com>
Tested-by: Kuan-Wei Chiu <visitorckw@gmail.com>
Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Signed-off-by: Yu-Chun Lin <eleanor15x@gmail.com>
---
v1 -> v2
Correct typos in the original commit message title.

 drivers/gpu/drm/tests/drm_kunit_helpers.c | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/tests/drm_kunit_helpers.c b/drivers/gpu/drm/tests/drm_kunit_helpers.c
index 04a6b8cc62ac..3c0b7824c0be 100644
--- a/drivers/gpu/drm/tests/drm_kunit_helpers.c
+++ b/drivers/gpu/drm/tests/drm_kunit_helpers.c
@@ -320,8 +320,7 @@ static void kunit_action_drm_mode_destroy(void *ptr)
 }
 
 /**
- * drm_kunit_display_mode_from_cea_vic() - return a mode for CEA VIC
-					   for a KUnit test
+ * drm_kunit_display_mode_from_cea_vic() - return a mode for CEA VIC for a KUnit test
  * @test: The test context object
  * @dev: DRM device
  * @video_code: CEA VIC of the mode
-- 
2.43.0

