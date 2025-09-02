Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 9A097B3F957
	for <lists+dri-devel@lfdr.de>; Tue,  2 Sep 2025 11:00:40 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3ED4210E605;
	Tue,  2 Sep 2025 09:00:37 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="O39kjrzL";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-f47.google.com (mail-wm1-f47.google.com
 [209.85.128.47])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E417510E605
 for <dri-devel@lists.freedesktop.org>; Tue,  2 Sep 2025 09:00:36 +0000 (UTC)
Received: by mail-wm1-f47.google.com with SMTP id
 5b1f17b1804b1-45b9814efbcso3406735e9.0
 for <dri-devel@lists.freedesktop.org>; Tue, 02 Sep 2025 02:00:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1756803635; x=1757408435; darn=lists.freedesktop.org;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:from:to:cc:subject:date:message-id
 :reply-to; bh=zGYSWAcPy26A8NcvE1GHC5uOZ8pXLq1QnhxmCLIQEEk=;
 b=O39kjrzL/QZMtldVbQKy4N7AJQhiYf7IwNzl4XEG48//KejESiQjmb3boQnd9jTZ3Z
 VzTnmgeiW/hkg+9omvCziv5b8RppXsVrAdc3nF/D1Ax6IMr8gyPN9avwlYGpjKyJpfEB
 bBU35hM0AgkoUC7SRzDx7IuHIx0sC8J0wGsxhE8/hC5PvjBowkt6t0zO8tJEs5F3XK3s
 Ziw6POzuGpm1OdpO3z10D7PNs4VtV28TCTynuMoyN98E/La2jcwbd6+vqREoAp6NycFR
 234oO8Lne7irS3GggJQ1v5gUXTWovkJ+cyxAflFCwNjV4mI9zP621Zwa4l6Li+9CSA7o
 wLEw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1756803635; x=1757408435;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=zGYSWAcPy26A8NcvE1GHC5uOZ8pXLq1QnhxmCLIQEEk=;
 b=dLNhg1ukXw9vL3fgPfFRdzYA1uafnqs+JJ554tHiikjE6dIDAnLOx/q3BkZQj2YpzH
 CGqIJRH2n77E9GXRwLcce/WY9Iq4WAZcUYlwMHjQnwtgSmJWVjox0gcC0aAk7F/XDb2W
 9kh/rAbgm6/AkNrfUBsBSIS9fxVXgesJD5wZ0r0uKYSdMEt2+hHk+DOYaAFCEdgWHMZS
 eH2ayPVn1eSMLPGyC5uzmR+3oSP8mO3adr3bmn0xTUs+J61NOM/4vzeP4+N21a8t763S
 N3rGjLS9xMey0AGrIbLcJ43OIoOH7CaEcPg40qwgEtuV597QQIiSVLvJmXxg9unuQ++H
 69bQ==
X-Gm-Message-State: AOJu0YyDV4O7jO9fxwFkGJXrGa/Bh8evSi0OcftKZI2pnuCh7JMOhT/P
 mwp2fOl7y6UzX+FW/L7XqNF1gL6RYZXBgBo28Gt4seHvl64eVtp0+lDLxpSP8aoh7ZQ=
X-Gm-Gg: ASbGncvVYUstuP70zcnpcaJ+SJOdwcbVlAnK5FGbra2sRJbEl3u67DT/RtE5M5W2/X2
 tjY1jZHnmiSptgcw2OP2xMSkA57ijb/k4JgJ3XG+NG9MXsR1QbPKfqOFQFFKJL+DoT0rp8ATdcl
 Ngff8L3RZ7OoQwouroqfIr9QD+6VyKeLRoluoT4k2qV3r1ZhV10oSIBVyc2NZetQ7kNrDD+PfOR
 gatzwSQVCO6Y2xnpVaQW0gLxk1AcAEeQ8vUUK+55/QHvSjthYGYXkZ/2G6P9fIzkJBS3WT3Giis
 EObeG3hK6FR4/frwD6871MXlhSakMb7TlHh5SvQdGf4D444Zq6nID/udWWGSnCTVpQaHU3ZCsX6
 +CEWZGrmjbM9/uJUl9wmmQ4fOqxEnej25wdgd8Hctwk6pGUINcbMcVQ==
X-Google-Smtp-Source: AGHT+IGo6pK1+48xuNgN3auTewN/EHFWBz9+Iiu+OQ7VN6pvjPbYNc8364yuEsgI32HicaXdpYLUhQ==
X-Received: by 2002:a05:600d:1c:b0:45b:8b95:7119 with SMTP id
 5b1f17b1804b1-45b8b957228mr58823695e9.8.1756803635309; 
 Tue, 02 Sep 2025 02:00:35 -0700 (PDT)
Received: from arrakeen.starnux.net ([2a01:e0a:3d9:2080:52eb:f6ff:feb3:451a])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-45b7271cd01sm261112045e9.23.2025.09.02.02.00.34
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 02 Sep 2025 02:00:35 -0700 (PDT)
From: Neil Armstrong <neil.armstrong@linaro.org>
Date: Tue, 02 Sep 2025 11:00:29 +0200
Subject: [PATCH v2 2/5] drm/bridge: simple: add Realtek RTD2171 DP-to-HDMI
 bridge
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250902-topic-x1e80100-hdmi-v2-2-f4ccf0ef79ab@linaro.org>
References: <20250902-topic-x1e80100-hdmi-v2-0-f4ccf0ef79ab@linaro.org>
In-Reply-To: <20250902-topic-x1e80100-hdmi-v2-0-f4ccf0ef79ab@linaro.org>
To: Andrzej Hajda <andrzej.hajda@intel.com>, Robert Foss <rfoss@kernel.org>, 
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>, 
 Jonas Karlman <jonas@kwiboo.se>, Jernej Skrabec <jernej.skrabec@gmail.com>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Vinod Koul <vkoul@kernel.org>, 
 Kishon Vijay Abraham I <kishon@kernel.org>, 
 Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konradybcio@kernel.org>
Cc: dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org, 
 linux-phy@lists.infradead.org, Neil Armstrong <neil.armstrong@linaro.org>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=933;
 i=neil.armstrong@linaro.org; h=from:subject:message-id;
 bh=yi+yrbIzGW/iL1vhPwZbx/n4ZLKTnBzZ9NjoEtR61eM=;
 b=owEBbQKS/ZANAwAKAXfc29rIyEnRAcsmYgBotrIu1rzwhA3usNfOLqoRch32SVvHPgyil+fD4ZNq
 nNQ95BCJAjMEAAEKAB0WIQQ9U8YmyFYF/h30LIt33NvayMhJ0QUCaLayLgAKCRB33NvayMhJ0c6ND/
 9lkmS7XWOeRpyO4D/IzKA6TOlXSIZbQjaXoiBZoCqEgQlddd6BnF+B4alveipEBm919yvs0w1oObaB
 B59pxJbpMnIYNDW+uZmhwvJBJTK/53NYszuzbVoIlqkj9xB97pt2CPdTFV2uTSc07gMqFi5X99dFtl
 eZYOzch/q449Ca3DraYde5kJWpk9SyCNzbGP5i3JXtZ3IT/oNLFFbQSavQ5k6bVPheGKHC3BsjydGA
 jIZ1XAQRSbM4WzLqtbk5UKne7vEabHKLtMhNv59vtVx0Wa0fDI/MCx5ex+3XrkYxcKMSO3EHlRFUdJ
 v9jJUv/Sj8dXnlMfNcnc6yj2Hhc9ioIWFvxHbVcYwtP/fU8wZxRoBH1esjHjMnsCH5iVijJg4bxplG
 nG6vT5YWAXPvoKgBFjSqWbhHZMv4Fi6Imi9pHlqEvXl4LsKqrjRA5ZbBFy7VqihvOftvruy34dI6ZW
 IAFs+aHk0hdTgD2LjY+TvqDAgKFbh79BWvZXm96KLxMXu2BgR5zRjmJCEetGeomk990fCaX7382nma
 R+AstoG0xrZ8ZbOj1HsfPBTTkyf2r7gaeWHotRSS/gxmbZctKhpFyrqbo0qAGxWJoi0u+ggzay+Kjy
 LrfDkeCFTU1rdZCgQtdOJH8u9CmnA6jSAf1dZP6spP0Kc7SbACB0DnK35DNQ==
X-Developer-Key: i=neil.armstrong@linaro.org; a=openpgp;
 fpr=89EC3D058446217450F22848169AB7B1A4CFF8AE
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

Add support for the transparent Realtek RTD2171 DP-to-HDMI bridge.

Signed-off-by: Neil Armstrong <neil.armstrong@linaro.org>
---
 drivers/gpu/drm/bridge/simple-bridge.c | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/drivers/gpu/drm/bridge/simple-bridge.c b/drivers/gpu/drm/bridge/simple-bridge.c
index 3d15ddd394703a351c1a537e7ab5f1487e024ee4..acf8a6b639da4119f17e4a7c40605947495da0e5 100644
--- a/drivers/gpu/drm/bridge/simple-bridge.c
+++ b/drivers/gpu/drm/bridge/simple-bridge.c
@@ -261,6 +261,11 @@ static const struct of_device_id simple_bridge_match[] = {
 			.timings = &default_bridge_timings,
 			.connector_type = DRM_MODE_CONNECTOR_VGA,
 		},
+	}, {
+		.compatible = "realtek,rtd2171",
+		.data = &(const struct simple_bridge_info) {
+			.connector_type = DRM_MODE_CONNECTOR_HDMIA,
+		},
 	}, {
 		.compatible = "ti,opa362",
 		.data = &(const struct simple_bridge_info) {

-- 
2.34.1

