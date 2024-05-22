Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 529728CBF86
	for <lists+dri-devel@lfdr.de>; Wed, 22 May 2024 12:51:15 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C404710F4BE;
	Wed, 22 May 2024 10:51:06 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="lOZQwGu1";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-f43.google.com (mail-lf1-f43.google.com
 [209.85.167.43])
 by gabe.freedesktop.org (Postfix) with ESMTPS id ED63810F4BB
 for <dri-devel@lists.freedesktop.org>; Wed, 22 May 2024 10:51:02 +0000 (UTC)
Received: by mail-lf1-f43.google.com with SMTP id
 2adb3069b0e04-51f71e4970bso7794989e87.2
 for <dri-devel@lists.freedesktop.org>; Wed, 22 May 2024 03:51:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1716375061; x=1716979861; darn=lists.freedesktop.org;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:from:to:cc:subject:date:message-id
 :reply-to; bh=/cpewU7AgCBeUcebhA/squE/VnkWqKDOhJWxtD0Wziw=;
 b=lOZQwGu1wW/U1zLnGbjZFlRNdDmeBFjn+iDhXC7ZPmoe5M28mfvdv5AMcUgH3vm0PP
 w3/jGqDRmpWVjosqYRpwKmaa3/1G7IvxDn4YP7X6TDx3EoB9DA1KzCyyWmeJlpoV6038
 CI0Ouke8MBnNmAGgocZc0jXyRLOEFWeQ+GgNi4EN3nSZCghsNTXM6o4zc89pZIqTnmoH
 pIbdRhx9Oz77mN22wZcL6hBMQw/VNZ05Hwx05KIu50h/TETKVJ1riAD/CtBsmY/9WekN
 L5S4NVddBlv0RuJ2+1fmdFAKdbgJ1pkEmfqjcMldGB2BGVikdHSPTGSnJxGa0z7xSocF
 1dng==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1716375061; x=1716979861;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=/cpewU7AgCBeUcebhA/squE/VnkWqKDOhJWxtD0Wziw=;
 b=v5zI3V19Y6r7EOXeWk9xvXAS1eYJVeTPAFdcyqTP0Hm27LbFybIVmuMfuq7FjBwjm/
 NF0QqiC1P/Hr3oRlyeiHHLZjvzSIwKvul6CLH6xEYkptuX+Z8/xJdnVY1RIPqwFW9FJM
 +aRXzYrleL7WHWSHsfxwt/X41DeK+mmeBlvWpiuBQMIeJRzPBMrMtcXD96lSchTQfrFy
 uQtTElWAxj/oXzgBAAIhOY4UBR/SVgCvSRh6mScGmtAkq4FIRpWBYjN+JusgrnSjWlw1
 FTbDtyWJjSCVQ6rcF/LS+8dNL+yZBaT21DnAmUbsL+n+bGlG1e4P3FrxQ7iDtcWfdw2+
 9ofw==
X-Forwarded-Encrypted: i=1;
 AJvYcCWuWfuqYk8LQs+g+9m9Ls6CXBSCeMz97ie/jYG1qpZCkfj0V3ojI9dgdv2Z0c1Ld0/19eKr2C4pgWtt55dN3z9TLYQvSUXnrO29QaIGJvWa
X-Gm-Message-State: AOJu0YyTRrTtfbiGGOR15Om6G7L95XXWL+28F/QxLxVV3272q4Ck0jX2
 0zjV1J4iOFTGkuSBzChpFNvz/Uv58rMKtMtA/OBH05WDWUnV5CrPv5B9Yjsw25cPlfXNX2Kl43f
 Z
X-Google-Smtp-Source: AGHT+IHA746vcyQKIF6ARQUrKclZUZ17SOeurs4Y7bb5zbXhpahNcHMlhYUZc1enWJkGEceoCKPVVA==
X-Received: by 2002:a05:6512:2030:b0:51d:1d42:3eef with SMTP id
 2adb3069b0e04-526bf82d08bmr1528410e87.29.1716375061315; 
 Wed, 22 May 2024 03:51:01 -0700 (PDT)
Received: from umbar.lan ([192.130.178.91]) by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-52431778ec8sm1279126e87.194.2024.05.22.03.51.00
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 22 May 2024 03:51:00 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date: Wed, 22 May 2024 13:50:56 +0300
Subject: [PATCH v2 04/14] drm/msm/hdmi: set infoframes on all pre_enable calls
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240522-fd-hdmi-hpd-v2-4-c30bdb7c5c7e@linaro.org>
References: <20240522-fd-hdmi-hpd-v2-0-c30bdb7c5c7e@linaro.org>
In-Reply-To: <20240522-fd-hdmi-hpd-v2-0-c30bdb7c5c7e@linaro.org>
To: Rob Clark <robdclark@gmail.com>, 
 Abhinav Kumar <quic_abhinavk@quicinc.com>, 
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>, Sean Paul <sean@poorly.run>, 
 Marijn Suijten <marijn.suijten@somainline.org>, 
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>
Cc: linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org, 
 freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org
X-Mailer: b4 0.13.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=1133;
 i=dmitry.baryshkov@linaro.org; h=from:subject:message-id;
 bh=v9IgZbEVIzCU//v+7Xjr4VR0vD49EBefgZxRpj3Zixc=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBmTc4PZtDbcPARHAK4vTPyxmPCjneihSIWI/DGZ
 yc1CddrMImJATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCZk3ODwAKCRCLPIo+Aiko
 1QuwB/9C68k51MnziXzY9cD980CHlYfmEBZfzN3HRPuRudP0j0YzyHWgbm6wN+ZIQY4jaqGVNXV
 4T6y6ytqk8N1gNtMxki5EfrFIiQDKRYxXyAYrRgiTzzjI0g6vBAThzSgKlJwXnBzu3LZJ0rNPBD
 gRrFHl1GehF5mJ64QLav5u/c5z7EuAX5ElXSH0DjRsfdnMsGeTyD73KCyNw94bk7XeeGKf6R/bU
 6k5iRyb6YQLYbv3Nkgy173dvexu7PNVkL6FDi3yKAUfCG+i9b0RlqKDbYT8r+VfvR3bMX+n5dt5
 wCrGSQLNLCj7cHogLW0nFCKGhkFBzo3TPJ2i9qjyMejciR3l
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

In consequent modeset calls, the atomic_pre_enable() will be called
several times without calling atomic_post_disable() inbetween. Thus
iframes will not be updated for the next mode. Fix this by setting the
iframe outside of the !power_on check.

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 drivers/gpu/drm/msm/hdmi/hdmi_bridge.c | 9 +++++----
 1 file changed, 5 insertions(+), 4 deletions(-)

diff --git a/drivers/gpu/drm/msm/hdmi/hdmi_bridge.c b/drivers/gpu/drm/msm/hdmi/hdmi_bridge.c
index 3c6121c57b01..fb99328107dd 100644
--- a/drivers/gpu/drm/msm/hdmi/hdmi_bridge.c
+++ b/drivers/gpu/drm/msm/hdmi/hdmi_bridge.c
@@ -133,10 +133,11 @@ static void msm_hdmi_bridge_atomic_pre_enable(struct drm_bridge *bridge,
 		msm_hdmi_phy_resource_enable(phy);
 		msm_hdmi_power_on(bridge);
 		hdmi->power_on = true;
-		if (hdmi->hdmi_mode) {
-			msm_hdmi_config_avi_infoframe(hdmi);
-			msm_hdmi_audio_update(hdmi);
-		}
+	}
+
+	if (hdmi->hdmi_mode) {
+		msm_hdmi_config_avi_infoframe(hdmi);
+		msm_hdmi_audio_update(hdmi);
 	}
 
 	msm_hdmi_phy_powerup(phy, hdmi->pixclock);

-- 
2.39.2

