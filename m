Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 5CC25C202DC
	for <lists+dri-devel@lfdr.de>; Thu, 30 Oct 2025 14:11:56 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6FA7410E892;
	Thu, 30 Oct 2025 13:11:54 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=compal-corp-partner-google-com.20230601.gappssmtp.com header.i=@compal-corp-partner-google-com.20230601.gappssmtp.com header.b="Re4Z4yxC";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pl1-f174.google.com (mail-pl1-f174.google.com
 [209.85.214.174])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D308810E951
 for <dri-devel@lists.freedesktop.org>; Thu, 30 Oct 2025 09:44:41 +0000 (UTC)
Received: by mail-pl1-f174.google.com with SMTP id
 d9443c01a7336-290deb0e643so6428225ad.2
 for <dri-devel@lists.freedesktop.org>; Thu, 30 Oct 2025 02:44:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=compal-corp-partner-google-com.20230601.gappssmtp.com; s=20230601;
 t=1761817481; x=1762422281; darn=lists.freedesktop.org; 
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=dUMWN07GOm3UETuex7a4WdCXyC4g5BU9lI+5N7mCsWI=;
 b=Re4Z4yxC2rqD+Lel+TQG0NBPgVSwIdR3Bh2Bhy3N/PDwjr5vmRHrn54DM2B18Feiku
 h244jD1sVPFnPxB4awQLMDMi/YmKf26x76Bj+WPYbhLH3uoEW7Qbk95ZZ2Vkq0j4FeIv
 XovweC5j2W+rK51RnqsVK5Y7zWJx+F9WYC48XbZZvyQIIdS/JhNUBPh0h9fSZqkpKtyN
 supEBtZmD4SEnxsBlsrk87bN7Y0A7+355nB38Isf15BYyZ4IObDJNYh2zn+fwDu51Qax
 fSUeH3Bt3QhWAmDooB1GTEPtMFUdMKx2zUTI0vu8cd4zgDboF5os8mX68YFinFG9pNXF
 j/fw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1761817481; x=1762422281;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=dUMWN07GOm3UETuex7a4WdCXyC4g5BU9lI+5N7mCsWI=;
 b=l/XoHxQghxqSg4QvtqcOj7g8gdgJekpcumw7cIRQFtXjrImh5V9dTileOm0q84prWv
 lu+otCuWafaLFh5bMDcA/52dLhGjZf8lyc316bdNbwM9HG4QX1bBF6Zn//dmhAizbf/p
 1l6yu63bxS0yy/nPzcy0hpNRxJNMEVUUPgk0lOXnsp485XS8oKxAB9iFJtNSZSnVhRme
 uQiAarjr9qtiDEy5GuwhQc7bz6JRZ1rjY+34sDu/mAeNVnOQPQaPLw09p/Ylawui3HgE
 DIxksp3/pU3ZVKwrKHkvmpisJB+sTbSA39X8z53I5Yn4WvE2unM0bsDQ2mOoMZ2ow0QF
 lfOQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCUKhGHR5XqqUuBmZX3xKil4m1pUh/Lr5f7gPup66SAqnT4Eu3dySyh6jBrz5ju8Uutch1J32y7pheQ=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YyNiddmwCkSh42NTPLcmPYoJ30+sFvBaoj0kg84ywpZTfxfAcI4
 FGRMt8/7xbva1hGU85zW8LyNiat6bLwTUihMNtV5M1Y+LT7BagtRx51HTM6pJX7HdWc=
X-Gm-Gg: ASbGncszEE2/YQRJPobRr3YehXRIVankIHYU+muJScSZX5P98lR1ONNiLMFlr+dECdR
 v5zYu/IRGce9TFL6ZunaFCspv4N/NnpeyHTrbW18AZDjeKNX88TaPAkPG47mRTdpSJKijTnfv3c
 pcRwCrBMuQmG+qiAJRMGarQq6pKAALrL3g/HZvynbPd6rhrgmF1tj0+14RnhNecNW6xf7l9H1nU
 9eSXT2kpL3HKwSeO6jMF65lioEEtB9CruAJnJcBvdC0bCoR7LK+YuJroMHXckco8pAAHVIqXt9i
 SOHYTpmq7Y9CSrNuZoq9zu/nepan5+yNn/PW/yUDhC86jFbdlQsYJmbgrmuIxCaboSXOcg871Au
 YxA+f/H+rPwD3QwZ2krbvv9AtDlVt9drGSZnAKxQAEnh2CfHjtzWcZFoaAP5MkPKMs15EuHCrzS
 jolr9qIW81dFHinWe9VRX8TkhbbVBn7Cr1nlCTBFpPCHXHCwhCJtb8/7S85sMhWWYuiqPNakFcV
 d/Eeg==
X-Google-Smtp-Source: AGHT+IGRBRkOmZGPU5EMzd9TgaTueUJvpQPPnxjEI1ZcWRlqn8hhOpa3io65WaXAJwks1FNKf4aGTw==
X-Received: by 2002:a17:903:234d:b0:290:7e29:f59f with SMTP id
 d9443c01a7336-294dee60875mr73492425ad.27.1761817481234; 
 Thu, 30 Oct 2025 02:44:41 -0700 (PDT)
Received: from localhost.localdomain (61-219-175-100.hinet-ip.hinet.net.
 [61.219.175.100]) by smtp.gmail.com with ESMTPSA id
 d9443c01a7336-29498d26c13sm179027625ad.53.2025.10.30.02.44.39
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 30 Oct 2025 02:44:40 -0700 (PDT)
From: Ajye Huang <ajye_huang@compal.corp-partner.google.com>
To: linux-kernel@vger.kernel.org
Cc: Douglas Anderson <dianders@chromium.org>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, David Airlie <airlied@gmail.com>,
 Simona Vetter <simona@ffwll.ch>, dri-devel@lists.freedesktop.org,
 Ajye Huang <ajye_huang@compal.corp-partner.google.com>
Subject: [PATCH v1] drm/edid: add 6 bpc quirk to the Sharp LQ116M1JW10
Date: Thu, 30 Oct 2025 17:44:34 +0800
Message-Id: <20251030094434.1390143-1-ajye_huang@compal.corp-partner.google.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Mailman-Approved-At: Thu, 30 Oct 2025 13:11:53 +0000
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

The Sharp LQ116M1JW105 reports that it supports 8 bpc modes,
but it will happen display noise in some videos.
So, limit it to 6 bpc modes.

Signed-off-by: Ajye Huang <ajye_huang@compal.corp-partner.google.com>
---
 drivers/gpu/drm/drm_edid.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/drivers/gpu/drm/drm_edid.c b/drivers/gpu/drm/drm_edid.c
index e2e85345aa9a..a73d37fe7ea1 100644
--- a/drivers/gpu/drm/drm_edid.c
+++ b/drivers/gpu/drm/drm_edid.c
@@ -250,6 +250,9 @@ static const struct edid_quirk {
 	EDID_QUIRK('S', 'V', 'R', 0x1019, BIT(EDID_QUIRK_NON_DESKTOP)),
 	EDID_QUIRK('A', 'U', 'O', 0x1111, BIT(EDID_QUIRK_NON_DESKTOP)),
 
+	/* LQ116M1JW10 displays noise when 8 bpc, but display fine as 6 bpc */
+	EDID_QUIRK('S', 'H', 'P', 0x154c, EDID_QUIRK_FORCE_6BPC),
+
 	/*
 	 * @drm_edid_internal_quirk entries end here, following with the
 	 * @drm_edid_quirk entries.
-- 
2.25.1

