Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 91F3678922C
	for <lists+dri-devel@lfdr.de>; Sat, 26 Aug 2023 01:01:22 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DE9B010E164;
	Fri, 25 Aug 2023 23:01:15 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pl1-x629.google.com (mail-pl1-x629.google.com
 [IPv6:2607:f8b0:4864:20::629])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 558C810E168
 for <dri-devel@lists.freedesktop.org>; Fri, 25 Aug 2023 23:01:13 +0000 (UTC)
Received: by mail-pl1-x629.google.com with SMTP id
 d9443c01a7336-1c0d5b16aacso9492105ad.1
 for <dri-devel@lists.freedesktop.org>; Fri, 25 Aug 2023 16:01:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=chromium.org; s=google; t=1693004473; x=1693609273;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=IRTyWDBK1um2dub2uCRhljhMZPNFPjV3AO6WOp/mvBA=;
 b=jhsR+9LbG+Ou958P7E+9XQk3NWBxZyvL08H58dOJFMpUbywkYDZuTJiRYqvl6aRWuZ
 ZWu9s/VR8KOtt4TmPta7k9Ii0sbMJEWVEX92p3BZ5Q3axWxD0EJaGZ+Q2g5QflyiOCdz
 K6TFEGZnXS0pu/yaXvvYJN1OTOVbmRLoP1Lcc=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1693004473; x=1693609273;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=IRTyWDBK1um2dub2uCRhljhMZPNFPjV3AO6WOp/mvBA=;
 b=UWNfedrnL9j6joDmLq3gnmwPfIjOUkcRUK3RydhjPd0nFFIJcC62h3DQUYvh8SloT6
 6YJ86j0+jpEeOHmypBbecd8JKu1cxd6i3fc0gQH4fiV1vaAEdy1rbk8Sl7B4C7GDYdp2
 Av8LTvcbp7aNaMnbRMN+gT39UaXgcBbFXTRtZHsgvV0kq0qPvmssXMV4869g8bjdNAv9
 +FI/Xbk3JW7tQZXQqpo7zwdQ2Zrws8ZwbMT6hMozft/dq7ke6cgx+LKPaQ8h9H/i/ZOT
 rbYb0ZHGbrbA74EUYx3jtyjaK0toZ288S/VP2/1hc6WkE9BTnR1EPABIAEuuygXEEZGY
 TtcQ==
X-Gm-Message-State: AOJu0Yz7o3phZccYbeFtlpiv3DTJgHaqGKe86CqEFIztr4N0N+wrHCun
 t7i2bEYbgXsvWM0z4wQ5ykldIg==
X-Google-Smtp-Source: AGHT+IFzWclzxaj4YjkShuNK7rHT+Q1ZnPtkApoHCwgpQ4ybP7Ay3vwlvDyjy6qd5fa/B4Eoo/zG4Q==
X-Received: by 2002:a17:903:32c6:b0:1c0:a8cb:b61d with SMTP id
 i6-20020a17090332c600b001c0a8cbb61dmr11484872plr.34.1693004472806; 
 Fri, 25 Aug 2023 16:01:12 -0700 (PDT)
Received: from smtp.gmail.com ([2620:15c:11a:201:d711:d7a0:fa61:8f24])
 by smtp.gmail.com with ESMTPSA id
 z12-20020a1709027e8c00b001bf044dc1a6sm2330059pla.39.2023.08.25.16.01.10
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 25 Aug 2023 16:01:12 -0700 (PDT)
From: Stephen Boyd <swboyd@chromium.org>
To: Rob Clark <robdclark@gmail.com>, Abhinav Kumar <quic_abhinavk@quicinc.com>,
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Subject: [PATCH] drm/msm/dp: Add newlines to debug printks
Date: Fri, 25 Aug 2023 16:01:08 -0700
Message-ID: <20230825230109.2264345-1-swboyd@chromium.org>
X-Mailer: git-send-email 2.42.0.rc1.204.g551eb34607-goog
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
Cc: linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, Kuogee Hsieh <quic_khsieh@quicinc.com>,
 patches@lists.linux.dev, Vinod Polimera <quic_vpolimer@quicinc.com>,
 freedreno@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

These debug printks are missing newlines, causing drm debug logs to be
hard to read. Add newlines so that the messages are on their own line.

Cc: Kuogee Hsieh <quic_khsieh@quicinc.com>
Cc: Vinod Polimera <quic_vpolimer@quicinc.com>
Signed-off-by: Stephen Boyd <swboyd@chromium.org>
---
 drivers/gpu/drm/msm/dp/dp_link.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/msm/dp/dp_link.c b/drivers/gpu/drm/msm/dp/dp_link.c
index 42427129acea..6375daaeb98e 100644
--- a/drivers/gpu/drm/msm/dp/dp_link.c
+++ b/drivers/gpu/drm/msm/dp/dp_link.c
@@ -1090,7 +1090,7 @@ int dp_link_process_request(struct dp_link *dp_link)
 	} else if (dp_link_read_psr_error_status(link)) {
 		DRM_ERROR("PSR IRQ_HPD received\n");
 	} else if (dp_link_psr_capability_changed(link)) {
-		drm_dbg_dp(link->drm_dev, "PSR Capability changed");
+		drm_dbg_dp(link->drm_dev, "PSR Capability changed\n");
 	} else {
 		ret = dp_link_process_link_status_update(link);
 		if (!ret) {
@@ -1107,7 +1107,7 @@ int dp_link_process_request(struct dp_link *dp_link)
 		}
 	}
 
-	drm_dbg_dp(link->drm_dev, "sink request=%#x",
+	drm_dbg_dp(link->drm_dev, "sink request=%#x\n",
 				dp_link->sink_request);
 	return ret;
 }

base-commit: 706a741595047797872e669b3101429ab8d378ef
-- 
https://chromeos.dev

