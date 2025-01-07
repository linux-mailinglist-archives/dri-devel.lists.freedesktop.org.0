Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C337EA03BD6
	for <lists+dri-devel@lfdr.de>; Tue,  7 Jan 2025 11:07:48 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3F51810E3DD;
	Tue,  7 Jan 2025 10:07:47 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="BYvqVXou";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lj1-f175.google.com (mail-lj1-f175.google.com
 [209.85.208.175])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1E26810E312
 for <dri-devel@lists.freedesktop.org>; Tue,  7 Jan 2025 10:07:46 +0000 (UTC)
Received: by mail-lj1-f175.google.com with SMTP id
 38308e7fff4ca-3002c324e7eso174017311fa.3
 for <dri-devel@lists.freedesktop.org>; Tue, 07 Jan 2025 02:07:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1736244404; x=1736849204; darn=lists.freedesktop.org;
 h=cc:to:message-id:content-transfer-encoding:mime-version:subject
 :date:from:from:to:cc:subject:date:message-id:reply-to;
 bh=Izcd6WrPP2fLpFqgomXI5uNPQ0WXKpVMcpKWcSXBKvs=;
 b=BYvqVXoupCJiAjup2RDDg2CUQB0Lush7YBR9Qu9uK1cfTJgtZW76/JU+T8sndm+svv
 1HIJBxEMEnl5MNNlEuBqRx7Rcjdu8UUioHl6TEDLBKMt6SPkEq66FivmwA7sqGg1BRSY
 WYBM2IWA9Dz0snauu4CvyozMFByUQVE1CDRRfeteAN2FOTKhB3X33STnQj2q+d5pJ6QI
 oAD1v65Y1K5yze2Mf6o5WlfL7egMFeWvlvJo+vwTQcKCmMB2QCspGhT3oh+H2t8V2Gxt
 IK3Oeslum9R3EZSMeps0dTTiSxe12rQQwlVdCkLVf5Olm/utgg2BF755BVOm0uQ1WixM
 hRZw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1736244404; x=1736849204;
 h=cc:to:message-id:content-transfer-encoding:mime-version:subject
 :date:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=Izcd6WrPP2fLpFqgomXI5uNPQ0WXKpVMcpKWcSXBKvs=;
 b=jzqR4uU2YxminO3rWQ0HbDyqSc0kxgHi8f2suW9DFnq7R+VEdo3J2hlcoaDw/xuJfY
 mBJ+TagGut99KOhQWwIPcmoLB48wHoIGLaKxXs3b747FIMUa6HzNkqx4KGTQDKfQYCBB
 3x6ES1ouWxaE/VOYtM+m5lk4jKpaFA5RkY3Xlklf0WQ2SLYGaVGdbDqRH/2ixIfLazeI
 rLgw6xgBDBlsoo9dTttpXzPonHQNtpKyWSer5LpVKgL3KN5a7fPi8TlyastSXXPOoMSj
 r2n4XC9jbswJozHQmaNahomjK91KORW2KfUEwvLp3qAlV6eujavyuBr8YlzrZZeOBy4A
 +b1w==
X-Gm-Message-State: AOJu0YxzETYLSZby6fdTDSYgCS9iG0xIBr70v7KSMJc29RrrT+hZ7ZQS
 lfG+C7x/wGKAtZmCAtDk0n1X7JYul9M/wPdNho25EOyGtUNalxzwoBDxCX+vF6E=
X-Gm-Gg: ASbGncuwNmh7fpC7FPLjM6OJ+vlCLT5s7j8sUCpsY2YuqtyA1dBwpArGDUQb0AlY4rm
 vPXlLUwY6cLLHEx/bOMLxa8waHxYVh65xbOWRr2sLFso9HNqN/fTWUiiLllZO3v21qs9wio22yS
 5dhLAKZp4ARVmZJttnOo0ZQ8deyRki77/Z9gxUmzl6IDsBZHGUDZv21hqD43mesG7qRHlFn+LrU
 wiRIDb6vccLI99cpJikeuE8HmHsWFYAdLEXJ3ojeLsJUOM6RB3SgUffP2JDWAkl
X-Google-Smtp-Source: AGHT+IFSjz2lOzj8/6QMFwfSZsbOGPsTunjn2SXO+JxdVs0t1Su1Z05IlH+XtxJTBF2IpM/ah34PLw==
X-Received: by 2002:a05:6512:3d16:b0:53e:ca48:776e with SMTP id
 2adb3069b0e04-54229562a17mr19168921e87.36.1736244404441; 
 Tue, 07 Jan 2025 02:06:44 -0800 (PST)
Received: from umbar.lan ([192.130.178.90]) by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-542235feeecsm5240825e87.68.2025.01.07.02.06.43
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 07 Jan 2025 02:06:43 -0800 (PST)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date: Tue, 07 Jan 2025 12:06:39 +0200
Subject: [PATCH] drm/bridge: fix documentation for the hdmi_audio_prepare()
 callback
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250107-drm-bridge-fix-docs-v1-1-84e539e6f348@linaro.org>
X-B4-Tracking: v=1; b=H4sIAK78fGcC/x2MSQqAMAwAvyI5G2gNKvoV8aBt1BxcSEGE4t8NH
 odhJkNiFU7QFxmUb0lyHga+LCBs07EySjSGylW1867FqDvOKtHMIg/GMyRcuo58Qw0T1WDlpWz
 uvw7j+354o3BAZQAAAA==
X-Change-ID: 20250107-drm-bridge-fix-docs-f9931636e335
To: Andrzej Hajda <andrzej.hajda@intel.com>, 
 Neil Armstrong <neil.armstrong@linaro.org>, Robert Foss <rfoss@kernel.org>, 
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>, 
 Jonas Karlman <jonas@kwiboo.se>, Jernej Skrabec <jernej.skrabec@gmail.com>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>
Cc: dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org, 
 Stephen Rothwell <sfr@canb.auug.org.au>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=1277;
 i=dmitry.baryshkov@linaro.org; h=from:subject:message-id;
 bh=YavJFYe02D4AC91xAe/ZPEMRvZ0FxnxXRUhqu4FDNaE=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBnfPyyPKOC+xSPfjZ0nAT/V6ibXMI1lfSYHb552
 p0vTVo0ka2JATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCZ3z8sgAKCRCLPIo+Aiko
 1Yh3B/9OJQ7M/GzqOy8ZLXDIuAz+FH4SNp5hEeBpV/734XgTAZBlsCvhAqxL2k+jyNsVXE0KfzG
 2+f9N05G8BQDOiEJfh6KB4U4mJl/8EL7bDr53E/EDRgpGU5nJM4xYU58Rsacti62bYVm7yl/wWY
 yZMzqvJm7V/n61zRXB4xorIicRjwQeBw/O1HPAvVabWPDETfmLViE/5KCP4zHCDztHrxdBFP4KQ
 mNLBz58bR2OzwLN1SmXPSBbzFev4NBgoVKl3Ci5u66Vb9wA9BVIEDMNfrZg/xWEIALLO2mqlzTX
 RDPC3PoQW6NisdMJkWMidlFcibt7Mu66JjrdmXE6uDZVlIjA
X-Developer-Key: i=dmitry.baryshkov@linaro.org; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A
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

Fix c&p error and change linuxdoc comment for the hdmi_audio_prepare()
callback from drm_bridge_funcs to mention the callback name instead of
the original prepare() callback.

Fixes: 0beba3f9d366 ("drm/bridge: connector: add support for HDMI codec framework")
Reported-by: Stephen Rothwell <sfr@canb.auug.org.au>
Closes: https://lore.kernel.org/linux-next/20250106174645.463927e0@canb.auug.org.au/
Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 include/drm/drm_bridge.h | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/include/drm/drm_bridge.h b/include/drm/drm_bridge.h
index 4b84faf14e368310dd20aa964e8178ec80aa6fa7..496dbbd2ad7edff7f091adfbe62de1e33ef0cf07 100644
--- a/include/drm/drm_bridge.h
+++ b/include/drm/drm_bridge.h
@@ -691,7 +691,7 @@ struct drm_bridge_funcs {
 				  struct drm_bridge *bridge);
 
 	/**
-	 * @prepare:
+	 * @hdmi_audio_prepare:
 	 * Configures HDMI-encoder for audio stream. Can be called multiple
 	 * times for each setup. Mandatory if HDMI audio is enabled in the
 	 * bridge's configuration.

---
base-commit: 938fbb16aba8f7b88e0fdcf56f315a5bbad41aad
change-id: 20250107-drm-bridge-fix-docs-f9931636e335

Best regards,
-- 
Dmitry Baryshkov <dmitry.baryshkov@linaro.org>

