Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 74CDD5F7EA1
	for <lists+dri-devel@lfdr.de>; Fri,  7 Oct 2022 22:23:57 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0A33910E1CC;
	Fri,  7 Oct 2022 20:23:43 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-x32d.google.com (mail-wm1-x32d.google.com
 [IPv6:2a00:1450:4864:20::32d])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 038ED10E02B;
 Fri,  7 Oct 2022 20:23:41 +0000 (UTC)
Received: by mail-wm1-x32d.google.com with SMTP id
 v130-20020a1cac88000000b003bcde03bd44so5183726wme.5; 
 Fri, 07 Oct 2022 13:23:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=N4kEDyMI5UqC9ruVvmCcki1BdeOTW3NtjCIMHC3n+Jg=;
 b=Dtu4pTRs03tYHwEXfWsls4vcDbX2kF2YLFQXzp9UFGWcai2XfQqci6d2tNVUZwl6xD
 azA5HQvB+G8u/RfN8kPHfH6y0VlDklPDTd4eVCeCqu/1kK6x6t1I6B9fKYdZO8HvihxR
 kQ8Zf6QiW4TsoAElwkpr2S/FdZNX65olf6ULu3i5dK9t4qC9nOXwdPKHa77xQHEq1lWy
 CI5qr8Bau4z0eFh16/8zNPKf96etRbqvHGTkhCy0aPAs8cGDaa3Dk0ZhP6Bp/sbFZAdn
 lyasOa/K6eVTa8X0UIcQvr/J7w2rvEC1VJnNuaz+VHLj5pqVVITI3PdPBxKDsivUWJmH
 pLeA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=N4kEDyMI5UqC9ruVvmCcki1BdeOTW3NtjCIMHC3n+Jg=;
 b=ev0CGTlS3m0Jwe/LkXLp+8EIbIJjWoghc+HjcvV3yHkkR4XjXaRbQB1QirzEfMxVG3
 TdiroqicfdrpGVOwexGcRNV/iyIRxEoLanQe9gR8qC/oSpRLr0X4O3ihH32PTg5Tpf7R
 MhvJjmYPy7qkfCUsjEQMLwkpDoCQw075jnIuBZm2lyTlQI3XMbv7b8Qnz0BDx0Gp7en0
 qWulp6f9zaPnYkmgER3ld/fei7ZeIDMEV5o0HH9Bzr/rCggh8PuvB80F8NHRKHUERRoq
 TaFDZ0b+6wKFxRKZuB6ZA4TUPctAM+ejdsEWeRJVk36V6iM6WX7ZiSMg6IhF4oSKYaVY
 yVpg==
X-Gm-Message-State: ACrzQf1a5pEB1R6/0JMLl+ig1/QVbPNGlNH9TRM62bao79biuRQwRt3o
 X+jU65iCTzrznulCcy7Pu2tpCEss4XcvOBVT
X-Google-Smtp-Source: AMsMyM7FOf1VWcxEIUUoCJsxtPAhOvtPxcgbzPEoWCDXoB8cgyQj/iZHvPe5+m/QMYSmDjAAGCIoog==
X-Received: by 2002:a05:600c:229a:b0:3c0:130d:320d with SMTP id
 26-20020a05600c229a00b003c0130d320dmr9394670wmf.51.1665174219391; 
 Fri, 07 Oct 2022 13:23:39 -0700 (PDT)
Received: from localhost (cpc154979-craw9-2-0-cust193.16-3.cable.virginm.net.
 [80.193.200.194]) by smtp.gmail.com with ESMTPSA id
 m7-20020a056000008700b00228daaa84aesm2843561wrx.25.2022.10.07.13.23.38
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 07 Oct 2022 13:23:38 -0700 (PDT)
From: Colin Ian King <colin.i.king@gmail.com>
To: Rob Clark <robdclark@gmail.com>, Abhinav Kumar <quic_abhinavk@quicinc.com>,
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>,
 linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
 freedreno@lists.freedesktop.org
Subject: [PATCH] drm/msm: Kconfig: Fix spelling mistake "throught" -> "through"
Date: Fri,  7 Oct 2022 21:23:38 +0100
Message-Id: <20221007202338.2755731-1-colin.i.king@gmail.com>
X-Mailer: git-send-email 2.37.3
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

There is a spelling mistake in a Kconfig description. Fix it.

Signed-off-by: Colin Ian King <colin.i.king@gmail.com>
---
 drivers/gpu/drm/msm/Kconfig | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/msm/Kconfig b/drivers/gpu/drm/msm/Kconfig
index 4e0cbd682725..3c9dfdb0b328 100644
--- a/drivers/gpu/drm/msm/Kconfig
+++ b/drivers/gpu/drm/msm/Kconfig
@@ -155,7 +155,7 @@ config DRM_MSM_HDMI
 	  Compile in support for the HDMI output MSM DRM driver. It can
 	  be a primary or a secondary display on device. Note that this is used
 	  only for the direct HDMI output. If the device outputs HDMI data
-	  throught some kind of DSI-to-HDMI bridge, this option can be disabled.
+	  through some kind of DSI-to-HDMI bridge, this option can be disabled.
 
 config DRM_MSM_HDMI_HDCP
 	bool "Enable HDMI HDCP support in MSM DRM driver"
-- 
2.37.3

