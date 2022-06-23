Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id EEC1A557501
	for <lists+dri-devel@lfdr.de>; Thu, 23 Jun 2022 10:09:52 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F20D5113E96;
	Thu, 23 Jun 2022 08:09:50 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-x32f.google.com (mail-wm1-x32f.google.com
 [IPv6:2a00:1450:4864:20::32f])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D86AE113E96;
 Thu, 23 Jun 2022 08:09:49 +0000 (UTC)
Received: by mail-wm1-x32f.google.com with SMTP id z9so10536616wmf.3;
 Thu, 23 Jun 2022 01:09:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=WUf4hh7XmxGqI1TyChD6Q9Q40vdp6ztxwpVVqyoKOb0=;
 b=M/Ksx3wAMaMxEES700OFBcZXpRa4wc0oINeNKEcajTDoEYnhRbdBv4KdmPmYqil1rp
 s67yY7qs7Z9uMQX9abv80e6zOAxDf0D4FQ9gS8Ga6gTnE2vJi86reVunCnB/mp9/pQNX
 0plD3hZ2Om0IwBM8oJlmj9IJZ0h+C6PSU8pSut0A69n3kNt5ZW2TV9wEfEzQLC1agRLE
 +d/BDuJsc7ByQwocxAPKAwfkXzenkyPNr1edj63us5r9waaF8KjiU8C4Fb4STONfOx86
 mtkXTc5YDmD6uI+sZyTbh64Tn0D6Ey2JmdkqzHdBVvVuJQIlPIkk3XGshW5rM3RJKjgC
 LKFQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=WUf4hh7XmxGqI1TyChD6Q9Q40vdp6ztxwpVVqyoKOb0=;
 b=Ns6F9JmDYPLLihlQ+/1g0pEqrcuJTj0h0DCk4P0CgjUIc6Ixynzm5mq8B1saeKcTnC
 dnWuBhoPlCuKlLQ2AnBALbKXFLc+Xav1n6pZiMrv5ImBEb11Ugs5Van4rkN/AV9Lvw5M
 DF4K/QhPFoB+0FQP4jPx3wLn6WKOsEj8r7WKrF67VRiHwhXrkllJQImyDuZSEP2ROaGi
 I1uXwTaC+nUv7IMSAnELjL3CcMtQjUbdv1HzwP+gC5X5yHXYVtn+7kNOOsP/RyYvwAtJ
 ZbG91J+NODT+qT8ASvpf2CpglI2drKAqGdAlQZoqmTTWRbSN/up+SFvUGunTC9aM7EpR
 zetw==
X-Gm-Message-State: AJIora+5mgHn+rVDVd8y4kU2j/BVrTHWP/XLBGfpsS7NDXYA6/TYtfGs
 W3vGJDZm0bx6oA/ewJvQWAM=
X-Google-Smtp-Source: AGRyM1tQCbkUDkb6HTKJP5xcbeP5k2VYytY3SaNTGGVmqI0KWdLDTOTW45BA4TJBrtuUMuOyZy642Q==
X-Received: by 2002:a05:600c:6020:b0:39c:5cec:da86 with SMTP id
 az32-20020a05600c602000b0039c5cecda86mr2610353wmb.75.1655971788177; 
 Thu, 23 Jun 2022 01:09:48 -0700 (PDT)
Received: from localhost (cpc154979-craw9-2-0-cust193.16-3.cable.virginm.net.
 [80.193.200.194]) by smtp.gmail.com with ESMTPSA id
 k17-20020a5d6e91000000b0021a39f5ba3bsm21009445wrz.7.2022.06.23.01.09.47
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 23 Jun 2022 01:09:47 -0700 (PDT)
From: Colin Ian King <colin.i.king@gmail.com>
To: Harry Wentland <harry.wentland@amd.com>, Leo Li <sunpeng.li@amd.com>,
 Rodrigo Siqueira <Rodrigo.Siqueira@amd.com>,
 Alex Deucher <alexander.deucher@amd.com>,
 =?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>,
 Xinhui.Pan@amd.com, David Airlie <airlied@linux.ie>,
 Daniel Vetter <daniel@ffwll.ch>, amd-gfx@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org
Subject: [PATCH][next] drm/amdgpu/display: Fix spelling mistake "supporing" ->
 "supporting"
Date: Thu, 23 Jun 2022 09:09:46 +0100
Message-Id: <20220623080946.19116-1-colin.i.king@gmail.com>
X-Mailer: git-send-email 2.35.3
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
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
Cc: kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

There is a spelling mistake in a dml_print message. Fix it.

Signed-off-by: Colin Ian King <colin.i.king@gmail.com>
---
 drivers/gpu/drm/amd/display/dc/dml/dcn32/display_mode_vba_32.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/amd/display/dc/dml/dcn32/display_mode_vba_32.c b/drivers/gpu/drm/amd/display/dc/dml/dcn32/display_mode_vba_32.c
index 7f144adb1e36..7d536c2f4477 100644
--- a/drivers/gpu/drm/amd/display/dc/dml/dcn32/display_mode_vba_32.c
+++ b/drivers/gpu/drm/amd/display/dc/dml/dcn32/display_mode_vba_32.c
@@ -1098,7 +1098,7 @@ static void DISPCLKDPPCLKDCFCLKDeepSleepPrefetchParametersWatermarksAndPerforman
 				if (mode_lib->vba.ImmediateFlipRequirement[k] != dm_immediate_flip_not_required && v->ImmediateFlipSupportedForPipe[k] == false) {
 					v->ImmediateFlipSupported = false;
 #ifdef __DML_VBA_DEBUG__
-					dml_print("DML::%s: Pipe %0d not supporing iflip\n", __func__, k);
+					dml_print("DML::%s: Pipe %0d not supporting iflip\n", __func__, k);
 #endif
 				}
 			}
-- 
2.35.3

