Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 6E6F23C3B35
	for <lists+dri-devel@lfdr.de>; Sun, 11 Jul 2021 10:50:53 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E55786EB91;
	Sun, 11 Jul 2021 08:50:48 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pg1-x52c.google.com (mail-pg1-x52c.google.com
 [IPv6:2607:f8b0:4864:20::52c])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EC52A6EB91
 for <dri-devel@lists.freedesktop.org>; Sun, 11 Jul 2021 08:50:47 +0000 (UTC)
Received: by mail-pg1-x52c.google.com with SMTP id y4so12342757pgl.10
 for <dri-devel@lists.freedesktop.org>; Sun, 11 Jul 2021 01:50:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=fiuAO62+7h7s9nSyvEm63tvLNu0SfPaEdE1IBzqVth0=;
 b=TDmSZmVie/dyu8SHyYbkDDM+qqdCjrqdgh5/P5Hm03vkA6wgJzgwajW7tog8kSSpig
 JKTaeAxeKkcttBLAnqQZWJS0d5CsYOKWDuAAg/8fFGkamr6eOq/W8HaNKtP/D+fHtmsG
 M1c5DAEIB73uC4YQyTPC2I0QuUes1UFHd/WawvXXwCsXn44x8z+FI049X38q/+piG3ll
 RaLiGcV0AbhRnbOJsjFpK6fNvm0t+pku8J9wPQlFc7rTdaH9pkqeYR4+rAUSE3ksRFfw
 WeeKDTe6g4r/ip3f4+o6Lp4UVBR5/YCbvr9mQUAbg3ASKD8+HbSb6sHFJIcNgyh/syQS
 XKxQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=fiuAO62+7h7s9nSyvEm63tvLNu0SfPaEdE1IBzqVth0=;
 b=qjwZd0Y1ypZ9f1IF/0GoMxVAUL/ifBVTZs5sN6MHbRgSioqnn4OWB8eAFwWv7uxO86
 hoQ0J62u7srlp9XIg0pHmQfguAFKmiqBnXSQVCrsyoU6mEJtDPpo08rJY8REIKjvi+4f
 S8LgudJmxUlnBS2VNBoASF6PXg5NmK+6+mwpRxEqKiskGBi9sshuCLCWFEV5iyg7lifN
 oUmuUGljDWwIAvVf/1Eedz9osOGshO7lY22qfzWwdy/9G+WuWy7VAN7DRMm/ITpV5yV7
 ICTxWy2NB3yFddGj8gB7ZnWeU6/jM0JDKEQ3zlo9uNzIC8Hq9/G7aUMAAhiovfcx3jre
 mbwg==
X-Gm-Message-State: AOAM532WI77vXACszVZhjHBcn/9trW03/yPK2RQP2++ylk/xGOpN0kRg
 VCs6cCoqAENb104XBwoR0fE=
X-Google-Smtp-Source: ABdhPJwsO8DE8Sk8noo2PuY6bWKqC6vmA6roIRoJ1kzEdEgol51DnfQmTBeze8YwXxwirGqEd53ToQ==
X-Received: by 2002:a63:1661:: with SMTP id 33mr5901358pgw.443.1625993447486; 
 Sun, 11 Jul 2021 01:50:47 -0700 (PDT)
Received: from localhost.localdomain ([49.37.51.242])
 by smtp.gmail.com with ESMTPSA id f19sm959714pjj.22.2021.07.11.01.50.44
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 11 Jul 2021 01:50:47 -0700 (PDT)
From: Dwaipayan Ray <dwaipayanray1@gmail.com>
To: airlied@linux.ie,
	daniel@ffwll.ch
Subject: [PATCH] drivers:gpu:drm:selftests: cleanup __FUNCTION__ usage
Date: Sun, 11 Jul 2021 14:20:30 +0530
Message-Id: <20210711085030.95725-1-dwaipayanray1@gmail.com>
X-Mailer: git-send-email 2.28.0
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
Cc: lukas.bulwahn@gmail.com, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, Dwaipayan Ray <dwaipayanray1@gmail.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

__FUNCTION__ exists only for backwards compatibility reasons
with old gcc versions. Replace it with __func__.

Signed-off-by: Dwaipayan Ray <dwaipayanray1@gmail.com>
---
 drivers/gpu/drm/selftests/test-drm_modeset_common.h | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/selftests/test-drm_modeset_common.h b/drivers/gpu/drm/selftests/test-drm_modeset_common.h
index cfb51d8da2bc..a4e9d9bacc89 100644
--- a/drivers/gpu/drm/selftests/test-drm_modeset_common.h
+++ b/drivers/gpu/drm/selftests/test-drm_modeset_common.h
@@ -9,7 +9,7 @@
 #define FAIL(test, msg, ...) \
 	do { \
 		if (test) { \
-			pr_err("%s/%u: " msg, __FUNCTION__, __LINE__, ##__VA_ARGS__); \
+			pr_err("%s/%u: " msg, __func__, __LINE__, ##__VA_ARGS__); \
 			return -EINVAL; \
 		} \
 	} while (0)
-- 
2.28.0

