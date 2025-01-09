Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E1F8FA082C6
	for <lists+dri-devel@lfdr.de>; Thu,  9 Jan 2025 23:30:33 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C94C810EF51;
	Thu,  9 Jan 2025 22:30:31 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=chromium.org header.i=@chromium.org header.b="SfzaDJ9i";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pl1-f182.google.com (mail-pl1-f182.google.com
 [209.85.214.182])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A903B10EF51
 for <dri-devel@lists.freedesktop.org>; Thu,  9 Jan 2025 22:30:30 +0000 (UTC)
Received: by mail-pl1-f182.google.com with SMTP id
 d9443c01a7336-2166360285dso24167805ad.1
 for <dri-devel@lists.freedesktop.org>; Thu, 09 Jan 2025 14:30:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=chromium.org; s=google; t=1736461770; x=1737066570;
 darn=lists.freedesktop.org; 
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=u9tudYrMcVrvrqUeyZ1At9CF351UtypC1p2HVqNm+ho=;
 b=SfzaDJ9iaQUsLENm/8laNRf4fTxNwTdbKC+RKeO9i2NvmBRnWzyFSp017dRIe5RXds
 NclGlkAR4ePmavQJHrp8xFi13gHNe+Zg+Gx2IstDdBsJKzgm0WVJqIIq64Y5kG8c3l+O
 5AANyFGNMKWiGo7jP8z0JZ59IuLiTPof+5gXc=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1736461770; x=1737066570;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=u9tudYrMcVrvrqUeyZ1At9CF351UtypC1p2HVqNm+ho=;
 b=TNxiQQo4Ll1ABCDFY+HCmQ9RmdD0+83TqOVN43IZwXFsCt4wccOVmRaeDzJLkZPQsA
 Ac8PeneXiKdWk0a2hcDYt/VPCnmKQ/IeyCNy0lKc5TKLVCdXc5aZwnKFh+jlpPXwpeWa
 bAKAC/2uw8SMv9S7Fx73fV3QX/vDUCGl/bvSmsaxyDdnn8Dyjhamfs0aBFozr/XL0NA8
 OuyoNnfBirKA4kKeS52DD+G4JQjPagyITOaUZWPodP605eV8P0y2p6TGBvO8ytXHn+zs
 kR15pvzHDLgb4nWWDJI8ZDzLboGd7vMNGFMQ6edXPHmUD+4lDC4Y96sPmweAqhUUizq3
 U9MA==
X-Gm-Message-State: AOJu0YwO6Kf2YDfoeruK1pD/JGuR1kZkVyEPusB0drmtjlmcgZsuRPQR
 B9ooEf68Zd9amhop8+ZwRax3iCVf1wj2/tUovH4nIAGRqp7bqE5YmuMFpC8F3iFOqSfc5qeXVS8
 =
X-Gm-Gg: ASbGncuqrIxE2kGGSidO78MYKUjShnEGostG4cltTMJgoz2WCMdyCdfRKNt3eLahfpU
 6zksff6bW5e0jrGWaaePrmSXik46zxHLuVORmNrakwoiUCa4vRQNu4CJsuGzCccfj1olnxTQ6Xk
 8DeKflYdD+9gtVPGV1HOBFKP++/pVdYC/ASwFnmZJz6bUxpBirDbmXps4+EKFPSpGP5xEdpHT4s
 yTMfTwxzUDjyMOVfMofqa3dkkgQ8SC4SXOfBYlLHAS0WmWgcLvUL/LHguRSm8MyRSk4N7e3rVsd
X-Google-Smtp-Source: AGHT+IFjkXZYyb3wtqMMIOWHdoRctZrqyyEXu2lYB545kerlVDQlHNQ09kh3MZj9QMT/IcE2zLRtRw==
X-Received: by 2002:a17:903:1206:b0:216:59ed:1ab0 with SMTP id
 d9443c01a7336-21a83f5d8c3mr112126225ad.27.1736461769663; 
 Thu, 09 Jan 2025 14:29:29 -0800 (PST)
Received: from dianders.sjc.corp.google.com
 ([2620:15c:9d:2:52e9:9ded:c8d2:20ba])
 by smtp.gmail.com with ESMTPSA id
 d9443c01a7336-21a9f155e00sm2758985ad.103.2025.01.09.14.29.28
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 09 Jan 2025 14:29:29 -0800 (PST)
From: Douglas Anderson <dianders@chromium.org>
To: dri-devel@lists.freedesktop.org
Cc: Stephen Boyd <swboyd@chromium.org>,
 Douglas Anderson <dianders@chromium.org>, David Airlie <airlied@gmail.com>,
 Jessica Zhang <quic_jesszhan@quicinc.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Neil Armstrong <neil.armstrong@linaro.org>,
 Simona Vetter <simona@ffwll.ch>, Thomas Zimmermann <tzimmermann@suse.de>,
 linux-kernel@vger.kernel.org
Subject: [PATCH] drm/panel-edp: Add Starry 116KHD024006
Date: Thu,  9 Jan 2025 14:28:53 -0800
Message-ID: <20250109142853.1.Ibcc3009933fd19507cc9c713ad0c99c7a9e4fe17@changeid>
X-Mailer: git-send-email 2.47.1.688.g23fc6f90ad-goog
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

We have a few reports of sc7180-trogdor-pompom devices that have a
panel in them that IDs as STA 0x0004 and has the following raw EDID:

  00 ff ff ff ff ff ff 00  4e 81 04 00 00 00 00 00
  10 20 01 04 a5 1a 0e 78  0a dc dd 96 5b 5b 91 28
  1f 52 54 00 00 00 01 01  01 01 01 01 01 01 01 01
  01 01 01 01 01 01 8e 1c  56 a0 50 00 1e 30 28 20
  55 00 00 90 10 00 00 18  00 00 00 00 00 00 00 00
  00 00 00 00 00 00 00 00  00 00 00 00 00 00 00 00
  00 00 00 00 00 00 00 00  00 00 00 00 00 00 00 fe
  00 31 31 36 4b 48 44 30  32 34 30 30 36 0a 00 e6

We've been unable to locate a datasheet for this panel and our partner
has not been responsive, but all Starry eDP datasheets that we can
find agree on the same timing (delay_100_500_e200) so it should be
safe to use that here instead of the super conservative timings. We'll
still go a little extra conservative and allow `hpd_absent` of 200
instead of 100 because that won't add any real-world delay in most
cases.

We'll associate the string from the EDID ("116KHD024006") with this
panel. Given that the ID is the suspicious value of 0x0004 it seems
likely that Starry doesn't always update their IDs but the string will
still work to differentiate if we ever need to in the future.

Signed-off-by: Douglas Anderson <dianders@chromium.org>
---

 drivers/gpu/drm/panel/panel-edp.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/gpu/drm/panel/panel-edp.c b/drivers/gpu/drm/panel/panel-edp.c
index f8511fe5fb0d..b0315d3ba00a 100644
--- a/drivers/gpu/drm/panel/panel-edp.c
+++ b/drivers/gpu/drm/panel/panel-edp.c
@@ -1993,6 +1993,7 @@ static const struct edp_panel_entry edp_panels[] = {
 	EDP_PANEL_ENTRY('S', 'H', 'P', 0x154c, &delay_200_500_p2e100, "LQ116M1JW10"),
 	EDP_PANEL_ENTRY('S', 'H', 'P', 0x1593, &delay_200_500_p2e100, "LQ134N1"),
 
+	EDP_PANEL_ENTRY('S', 'T', 'A', 0x0004, &delay_200_500_e200, "116KHD024006"),
 	EDP_PANEL_ENTRY('S', 'T', 'A', 0x0100, &delay_100_500_e200, "2081116HHD028001-51D"),
 
 	{ /* sentinal */ }
-- 
2.47.1.688.g23fc6f90ad-goog

