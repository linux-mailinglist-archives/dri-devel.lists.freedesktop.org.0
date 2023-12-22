Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 59B3881CDB7
	for <lists+dri-devel@lfdr.de>; Fri, 22 Dec 2023 18:42:35 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C340310E815;
	Fri, 22 Dec 2023 17:42:28 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x432.google.com (mail-wr1-x432.google.com
 [IPv6:2a00:1450:4864:20::432])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8987810E7F8
 for <dri-devel@lists.freedesktop.org>; Fri, 22 Dec 2023 17:42:27 +0000 (UTC)
Received: by mail-wr1-x432.google.com with SMTP id
 ffacd0b85a97d-33694bf8835so686224f8f.3
 for <dri-devel@lists.freedesktop.org>; Fri, 22 Dec 2023 09:42:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1703266946; x=1703871746; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=JDZw6NA00pLIWCPFGMihyx1IVwowkY8XOiwDd7TasQE=;
 b=LGfT/6rLTDYtXk8Yp4tiZyGX7xT1Y/331W1VWOXfuK4PFKoN7SdEzEL89f6ePR4cNH
 AFf19VUgpmxJw+CaXzoELJTrfzztlVv27QDwNcesaxRFuRDFkAqagAmqQbUCaZvsmOT4
 alYi4XQkSYhso/ymVHo4ubSMCKnDIW111G7/rTvmceLbPkExp3ArSnEG8ydevPNY4m0Y
 QIIK0benJkrtGDn/MjPChq3HW80ZrNwczhjIzz7ehodLmHPsDuSBN/kZCxu0wfaZ8Xx+
 ehNYWG+34GolGx3h2Ep3WfPa7I2g4AfqFsllhSPltUf6zEnqOVv8C21zy+tMzFuGLqmS
 WNgA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1703266946; x=1703871746;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=JDZw6NA00pLIWCPFGMihyx1IVwowkY8XOiwDd7TasQE=;
 b=sptYVQekmvuFHuhqhDw8mGeRe2eIMsTuFI3ZVXzmEnHwsQj2MT6goNzGjLs2Z9MKoO
 speHhKSLI21QODC8l46un/XV7lvhL6rb342LQv0yr7mK9ocNdmLbocOM8fRsWhFSfVV9
 wQaYJ5R2JY12eN2pxETyrZ1QfBq6NyxAjxJnu4tdbcWs6rbdGYL22G7BlFINW8IKMRTO
 GIlCJUEtIad5u1wTU7/ndkizHVBbKMIsyqlnV4Lh1shqyVFYDcKaHzFtqKAw5qcDo4LO
 FguaJhTQNox/Etl02klGuZKKbUGN0xSKcTzUwT8e9EZqH4XnDOudyhyKWwu5xCSu0KxD
 itWg==
X-Gm-Message-State: AOJu0Yxt8k9csEZPdS3I7kr91FSiHmHuBV7543XFM3Vnch51T87T5ggD
 J0+u6M9lKnTR/AWoF5rb0w==
X-Google-Smtp-Source: AGHT+IGOfU9ODiH9NLfSXETtkHv9WTh+X98b43SlP0OW8MLrcFPW+Mc6NKBN1yINEst4gkgEd8TDVw==
X-Received: by 2002:a5d:58c1:0:b0:336:48fd:3458 with SMTP id
 o1-20020a5d58c1000000b0033648fd3458mr1123123wrf.68.1703266945929; 
 Fri, 22 Dec 2023 09:42:25 -0800 (PST)
Received: from U4.lan ([2a02:810b:f40:4300:f3ae:2788:7e03:f44])
 by smtp.gmail.com with ESMTPSA id
 w10-20020adfec4a000000b00336670abdcasm4777116wrn.40.2023.12.22.09.42.25
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 22 Dec 2023 09:42:25 -0800 (PST)
From: Alex Bee <knaerzche@gmail.com>
To: Sandy Huang <hjc@rock-chips.com>,
 =?UTF-8?q?Heiko=20St=C3=BCbner?= <heiko@sntech.de>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Conor Dooley <conor+dt@kernel.org>
Subject: [PATCH v4 05/29] drm/rockchip: inno_hdmi: Remove useless copy of
 drm_display_mode
Date: Fri, 22 Dec 2023 18:41:56 +0100
Message-ID: <20231222174220.55249-6-knaerzche@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20231222174220.55249-1-knaerzche@gmail.com>
References: <20231222174220.55249-1-knaerzche@gmail.com>
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
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, Alex Bee <knaerzche@gmail.com>,
 linux-rockchip@lists.infradead.org, David Airlie <airlied@gmail.com>,
 linux-arm-kernel@lists.infradead.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: Maxime Ripard <mripard@kernel.org>

The driver maintains a copy of the adjusted mode but doesn't use it
anywhere. Remove it.

Signed-off-by: Maxime Ripard <mripard@kernel.org>
Tested-by: Alex Bee <knaerzche@gmail.com>
Signed-off-by: Alex Bee <knaerzche@gmail.com>
---
changes in v2:
 - imported patch

changes in v3:
 - added my SoB

changes in v4:
 - none

 drivers/gpu/drm/rockchip/inno_hdmi.c | 4 ----
 1 file changed, 4 deletions(-)

diff --git a/drivers/gpu/drm/rockchip/inno_hdmi.c b/drivers/gpu/drm/rockchip/inno_hdmi.c
index 0b1740b38c7b..14d2ba92a606 100644
--- a/drivers/gpu/drm/rockchip/inno_hdmi.c
+++ b/drivers/gpu/drm/rockchip/inno_hdmi.c
@@ -62,7 +62,6 @@ struct inno_hdmi {
 	unsigned int tmds_rate;
 
 	struct hdmi_data_info	hdmi_data;
-	struct drm_display_mode previous_mode;
 };
 
 static struct inno_hdmi *encoder_to_inno_hdmi(struct drm_encoder *encoder)
@@ -498,9 +497,6 @@ static void inno_hdmi_encoder_mode_set(struct drm_encoder *encoder,
 	struct inno_hdmi *hdmi = encoder_to_inno_hdmi(encoder);
 
 	inno_hdmi_setup(hdmi, adj_mode);
-
-	/* Store the display mode for plugin/DPMS poweron events */
-	drm_mode_copy(&hdmi->previous_mode, adj_mode);
 }
 
 static void inno_hdmi_encoder_enable(struct drm_encoder *encoder)
-- 
2.43.0

