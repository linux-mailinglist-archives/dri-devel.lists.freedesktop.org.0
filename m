Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 1F10C2A817B
	for <lists+dri-devel@lfdr.de>; Thu,  5 Nov 2020 15:52:44 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9475C6EDA1;
	Thu,  5 Nov 2020 14:52:37 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-x343.google.com (mail-wm1-x343.google.com
 [IPv6:2a00:1450:4864:20::343])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9D01F6EDA0
 for <dri-devel@lists.freedesktop.org>; Thu,  5 Nov 2020 14:52:35 +0000 (UTC)
Received: by mail-wm1-x343.google.com with SMTP id h2so1875429wmm.0
 for <dri-devel@lists.freedesktop.org>; Thu, 05 Nov 2020 06:52:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=Lzr2LZKkjeyh+0gXSjtszqjFcxymZo2/y4TJCmeBIoM=;
 b=swOlcuLUwLVsy5H0kZyJDIny5wOGPi4N36T5qjg/xyiN0ZRy/TR+lqUsJM/dksU6HV
 LRpj6JmHpaFZLKcgMPDDw95n0IWR1MQOO2UN4udOERsKfNg+qKMRbef8h/Pk7Rynqb7V
 ldZWi/RBJgzaXFam5OkPaWd/9Pwh0fjVkAQUZXoJcfL+6QR7ox+/FUSwFYJFBdzfrkjj
 d/tw9iWv6GAE0cL9vwkWbzs2WnsflB5dzqlm0JCj4kUOPF2Fww1gU8Deb9SxCMD/EAuZ
 n92AkxxE100PUWDbNbdgYLDNmHqxg7zOBJoYqfDD+QWhk5y+EVgYOUJorOQBpC2tRFUz
 sRaA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=Lzr2LZKkjeyh+0gXSjtszqjFcxymZo2/y4TJCmeBIoM=;
 b=AMIB+lg/EDRrpbh0eeacu+m8KxaUhls+jNWx1la7uwKQWEQa+mHsRiGGun+uh1brMX
 oGS5fCaXhhx5Fh4U1+M3v1ViUsSC8663PlPklQS+uePTEMe02HtSRinorsRHqKkmi5nD
 MmHNv3y2e9zwKSi7vzPi46phvbJL1Rd7rdTLZw5BqIPtiXI1qO5cxOY9T8JSeaZxgDrh
 qP5isBx+0AWWSLpGedjZy+il2+SvosvWHDjkj5X28ISGKR80d0PHK0M9xre0Y82eLmm2
 eKkeab4Br7Ia/FNlmW4th81t1xNSzgeQlpu4R1e5YLL8CmCwX0wrstjOR8Gil6J+qv3Z
 W5Lg==
X-Gm-Message-State: AOAM5336PIHMVZIDsNVgjA6vjezTcZ6A8E4uIjGd7F6g8WT0x+s2w0CB
 XwHsqTWuWQsSlYr6Lhlppuye8w==
X-Google-Smtp-Source: ABdhPJwEQdQy1KXngQ0iziaR9HkA2R0NAcKEAYFhCBRARBNNh5ssNJoyNlHhkkm7K6yluAbMvU79zQ==
X-Received: by 2002:a1c:5f45:: with SMTP id t66mr3197691wmb.20.1604587954367; 
 Thu, 05 Nov 2020 06:52:34 -0800 (PST)
Received: from dell.default ([91.110.221.242])
 by smtp.gmail.com with ESMTPSA id f5sm2631243wmh.16.2020.11.05.06.52.33
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 05 Nov 2020 06:52:33 -0800 (PST)
From: Lee Jones <lee.jones@linaro.org>
To: lee.jones@linaro.org
Subject: [PATCH 16/19] gpu: drm: panel: panel-ilitek-ili9322: Demote
 non-conformant kernel-doc header
Date: Thu,  5 Nov 2020 14:45:14 +0000
Message-Id: <20201105144517.1826692-17-lee.jones@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20201105144517.1826692-1-lee.jones@linaro.org>
References: <20201105144517.1826692-1-lee.jones@linaro.org>
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
 dri-devel@lists.freedesktop.org, Thierry Reding <thierry.reding@gmail.com>,
 Sam Ravnborg <sam@ravnborg.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Fixes the following W=1 kernel build warning(s):

 drivers/gpu/drm/panel/panel-ilitek-ili9322.c:177: warning: Enum value 'ILI9322_INPUT_SRGB_THROUGH' not described in enum 'ili9322_input'
 drivers/gpu/drm/panel/panel-ilitek-ili9322.c:177: warning: Enum value 'ILI9322_INPUT_SRGB_ALIGNED' not described in enum 'ili9322_input'
 drivers/gpu/drm/panel/panel-ilitek-ili9322.c:177: warning: Enum value 'ILI9322_INPUT_SRGB_DUMMY_320X240' not described in enum 'ili9322_input'
 drivers/gpu/drm/panel/panel-ilitek-ili9322.c:177: warning: Enum value 'ILI9322_INPUT_SRGB_DUMMY_360X240' not described in enum 'ili9322_input'
 drivers/gpu/drm/panel/panel-ilitek-ili9322.c:177: warning: Enum value 'ILI9322_INPUT_DISABLED_1' not described in enum 'ili9322_input'
 drivers/gpu/drm/panel/panel-ilitek-ili9322.c:177: warning: Enum value 'ILI9322_INPUT_PRGB_THROUGH' not described in enum 'ili9322_input'
 drivers/gpu/drm/panel/panel-ilitek-ili9322.c:177: warning: Enum value 'ILI9322_INPUT_PRGB_ALIGNED' not described in enum 'ili9322_input'
 drivers/gpu/drm/panel/panel-ilitek-ili9322.c:177: warning: Enum value 'ILI9322_INPUT_YUV_640X320_YCBCR' not described in enum 'ili9322_input'
 drivers/gpu/drm/panel/panel-ilitek-ili9322.c:177: warning: Enum value 'ILI9322_INPUT_YUV_720X360_YCBCR' not described in enum 'ili9322_input'
 drivers/gpu/drm/panel/panel-ilitek-ili9322.c:177: warning: Enum value 'ILI9322_INPUT_DISABLED_2' not described in enum 'ili9322_input'
 drivers/gpu/drm/panel/panel-ilitek-ili9322.c:177: warning: Enum value 'ILI9322_INPUT_ITU_R_BT656_720X360_YCBCR' not described in enum 'ili9322_input'
 drivers/gpu/drm/panel/panel-ilitek-ili9322.c:177: warning: Enum value 'ILI9322_INPUT_ITU_R_BT656_640X320_YCBCR' not described in enum 'ili9322_input'
 drivers/gpu/drm/panel/panel-ilitek-ili9322.c:177: warning: Enum value 'ILI9322_INPUT_UNKNOWN' not described in enum 'ili9322_input'

Cc: Thierry Reding <thierry.reding@gmail.com>
Cc: Sam Ravnborg <sam@ravnborg.org>
Cc: David Airlie <airlied@linux.ie>
Cc: Daniel Vetter <daniel@ffwll.ch>
Cc: Linus Walleij <linus.walleij@linaro.org>
Cc: dri-devel@lists.freedesktop.org
Signed-off-by: Lee Jones <lee.jones@linaro.org>
---
 drivers/gpu/drm/panel/panel-ilitek-ili9322.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/panel/panel-ilitek-ili9322.c b/drivers/gpu/drm/panel/panel-ilitek-ili9322.c
index 074e18559b9f6..8e84df9a0033d 100644
--- a/drivers/gpu/drm/panel/panel-ilitek-ili9322.c
+++ b/drivers/gpu/drm/panel/panel-ilitek-ili9322.c
@@ -152,7 +152,7 @@
 #define ILI9322_GAMMA_7			0x16
 #define ILI9322_GAMMA_8			0x17
 
-/**
+/*
  * enum ili9322_input - the format of the incoming signal to the panel
  *
  * The panel can be connected to various input streams and four of them can
-- 
2.25.1

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
