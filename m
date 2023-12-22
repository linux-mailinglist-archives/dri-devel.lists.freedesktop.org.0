Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 0A5F881CDCA
	for <lists+dri-devel@lfdr.de>; Fri, 22 Dec 2023 18:43:01 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BD0C610E852;
	Fri, 22 Dec 2023 17:42:43 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x436.google.com (mail-wr1-x436.google.com
 [IPv6:2a00:1450:4864:20::436])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AB2AB10E81B
 for <dri-devel@lists.freedesktop.org>; Fri, 22 Dec 2023 17:42:29 +0000 (UTC)
Received: by mail-wr1-x436.google.com with SMTP id
 ffacd0b85a97d-3369ccb539aso287744f8f.3
 for <dri-devel@lists.freedesktop.org>; Fri, 22 Dec 2023 09:42:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1703266948; x=1703871748; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=/kgyib+/6QRevWIU1dtxLSbx62QPgtFJTlVAtzjG6Is=;
 b=GZ+UAO+YtPE5fpEUjo1KswoZD4I6BWuQhTsauUAGTa2ESYhRQdg8bHs4+qNeJJvsmv
 F2VzW/3q26gkgJ6+vXud0A+Af/URlsiThgSE9L13ZmCNbzSpYUHncPn+f93Gl7YduEga
 DPy4mVWd8KwovYZBqTxxmZIY5STAUOWOcBkGSZmZIZiAqb+Gnx1pHyZfPzh7LzJoB9+j
 VBssNRY9g/GRaW3tUUr/JtD7q07MZoWk/U/VFgnNuiApHdB/6gPokWZLPfvAa86qwC9z
 gsH/GJ5x1/op1F5/p/SJ8RIf313CDmpPwTe4Lapsf1JhwT/smctxEGyDxo0J3IBKTvC7
 wX8w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1703266948; x=1703871748;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=/kgyib+/6QRevWIU1dtxLSbx62QPgtFJTlVAtzjG6Is=;
 b=BsiR5paZBJAyI2wpKp0oEcDW0L5/nDcK2SVtDqD1ZnFZNCu3Z+a1uWkFXUXVXxaEQq
 ruKmfzFcHQfBpTJoDe3b9u0ijHKL2pnI1z+0/wVtS5dFXB2pVCPGF1K6wLH26uNwycZG
 Mnua1gkLhLasyAwy97ZFMvxJ2gKc52A/BUGbiPI5kZMU3bKIGbBbamdrj/357uWAz9nq
 OaqmBpOw+USBVLoD5LcdusmYWKNoD6IDQMIPLJxjwJr1LGDBkaMU+paH4JfilkEzsp6Z
 lgYFSBc7ezhyFd8qd3XCxYaHw1d+Rzccq2s6R3Kefgi/0/2BmlQ8LoBYDR1H+k+AqOQk
 sL6g==
X-Gm-Message-State: AOJu0YwIvpGHZhFMXmgK//iiyZStUBU3ayk/KUewxXrPnVlEkXXZY6ML
 YwMeSoh0nIWNOgS+EvCx0w==
X-Google-Smtp-Source: AGHT+IEt/69sUBqxWe1PRE1w6MCXmB6NT4MwzHjZjfhAIB1uVmcCKnZlBEfqCpNWf7fYGOh8JR0yEw==
X-Received: by 2002:adf:e911:0:b0:336:4bfe:5ab2 with SMTP id
 f17-20020adfe911000000b003364bfe5ab2mr864375wrm.8.1703266948004; 
 Fri, 22 Dec 2023 09:42:28 -0800 (PST)
Received: from U4.lan ([2a02:810b:f40:4300:f3ae:2788:7e03:f44])
 by smtp.gmail.com with ESMTPSA id
 w10-20020adfec4a000000b00336670abdcasm4777116wrn.40.2023.12.22.09.42.27
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 22 Dec 2023 09:42:27 -0800 (PST)
From: Alex Bee <knaerzche@gmail.com>
To: Sandy Huang <hjc@rock-chips.com>,
 =?UTF-8?q?Heiko=20St=C3=BCbner?= <heiko@sntech.de>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Conor Dooley <conor+dt@kernel.org>
Subject: [PATCH v4 08/29] drm/rockchip: inno_hdmi: no need to store vic
Date: Fri, 22 Dec 2023 18:41:59 +0100
Message-ID: <20231222174220.55249-9-knaerzche@gmail.com>
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

The mode's VIC is only ever used in the inno_hdmi_setup() function so
there's no need to store it in the main structure.

Signed-off-by: Maxime Ripard <mripard@kernel.org>
Tested-by: Alex Bee <knaerzche@gmail.com>
[made checkpatch happy]
Signed-off-by: Alex Bee <knaerzche@gmail.com>
---
changes in v2:
 - imported patch

changes in v3:
 - none

changes in v4:
 - none

 drivers/gpu/drm/rockchip/inno_hdmi.c | 12 +++++-------
 1 file changed, 5 insertions(+), 7 deletions(-)

diff --git a/drivers/gpu/drm/rockchip/inno_hdmi.c b/drivers/gpu/drm/rockchip/inno_hdmi.c
index 299770e481b7..d99896f1a73a 100644
--- a/drivers/gpu/drm/rockchip/inno_hdmi.c
+++ b/drivers/gpu/drm/rockchip/inno_hdmi.c
@@ -28,7 +28,6 @@
 #include "inno_hdmi.h"
 
 struct hdmi_data_info {
-	int vic;
 	bool sink_has_audio;
 	unsigned int enc_in_format;
 	unsigned int enc_out_format;
@@ -443,16 +442,15 @@ static int inno_hdmi_setup(struct inno_hdmi *hdmi,
 			   struct drm_display_mode *mode)
 {
 	struct drm_display_info *display = &hdmi->connector.display_info;
-
-	hdmi->hdmi_data.vic = drm_match_cea_mode(mode);
+	u8 vic = drm_match_cea_mode(mode);
 
 	hdmi->hdmi_data.enc_in_format = HDMI_COLORSPACE_RGB;
 	hdmi->hdmi_data.enc_out_format = HDMI_COLORSPACE_RGB;
 
-	if ((hdmi->hdmi_data.vic == 6) || (hdmi->hdmi_data.vic == 7) ||
-	    (hdmi->hdmi_data.vic == 21) || (hdmi->hdmi_data.vic == 22) ||
-	    (hdmi->hdmi_data.vic == 2) || (hdmi->hdmi_data.vic == 3) ||
-	    (hdmi->hdmi_data.vic == 17) || (hdmi->hdmi_data.vic == 18))
+	if (vic == 6 || vic == 7 ||
+	    vic == 21 || vic == 22 ||
+	    vic == 2 || vic == 3 ||
+	    vic == 17 || vic == 18)
 		hdmi->hdmi_data.colorimetry = HDMI_COLORIMETRY_ITU_601;
 	else
 		hdmi->hdmi_data.colorimetry = HDMI_COLORIMETRY_ITU_709;
-- 
2.43.0

