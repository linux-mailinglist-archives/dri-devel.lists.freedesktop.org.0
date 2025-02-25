Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 935D4A437B6
	for <lists+dri-devel@lfdr.de>; Tue, 25 Feb 2025 09:34:24 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0F3AE10E37F;
	Tue, 25 Feb 2025 08:34:23 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="fgObWU9l";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-f41.google.com (mail-wr1-f41.google.com
 [209.85.221.41])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D7B0410E183
 for <dri-devel@lists.freedesktop.org>; Tue, 25 Feb 2025 08:34:15 +0000 (UTC)
Received: by mail-wr1-f41.google.com with SMTP id
 ffacd0b85a97d-38f22fe889aso4646944f8f.3
 for <dri-devel@lists.freedesktop.org>; Tue, 25 Feb 2025 00:34:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1740472454; x=1741077254; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=XAie+sSFo6Wruq18O6QZqBe2ud6CsbFB0wWs2UuJrRc=;
 b=fgObWU9lxu49KPqX/kCklozzM0KmuIsL5+/VUYOWFIeFqt5PKUwgyr/pLU8q1hY89Y
 Y39HUC84h6imizgHzLH8YOKhiQmHhBpIvG/ad/GmlDM0xEDfZqJ79kuj9dPE4N+g37SI
 oFTZHMsyvmdLSD8oKP09PcVJfshLZxMAnx2acA9JTXl/jqOypBUnhBZFI71Rjm5EFZGB
 jI09KM2A0tp0G8iDqMkQvLwlPTGcwI/pZO0Dd3nY1OI5pTPCxhzuegNpDF7TIbXQyqiD
 r2I/irFTJi8tBHGpdfa5GnA0eOpPQA4gXVspezfU6CQ/guPQxmvlqkRFqRsRx3uRurlj
 i8lw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1740472454; x=1741077254;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=XAie+sSFo6Wruq18O6QZqBe2ud6CsbFB0wWs2UuJrRc=;
 b=SgauO7gJy9NgM2/uHsusrImEHH+GjFXJ0j6uplZPv6b6XsGApEnt0lc8rbC6o0is4e
 osyf+BDIG2UDMAfMOZEyPuPtegReV574lxT4ZCusKmYDg3Yl77wjvkFHfPnkuFRVGMNM
 h9skf7oMjE02SqHRQ+GLkDTRmyw4O9huOUVNia6csqRnGVvQPWu0q1KZ8pDaFxTnx0n8
 FezXCLTGO/g9rt5YrKM/gNC5R+ISgNzeqEbRXti2J1ZQURBbUnmpxjDTfYU888VhnGfm
 QYSc34vIFSlAVT3ibjZ5JI0sBpegkUgtvmEAIyGpR+gCRk6OfJj5Tu+4XNPRwDBzfDiD
 JjFA==
X-Gm-Message-State: AOJu0YxYok6PGfQU6MPnQ3E5ilXS/NLK0i7ZZxqhlzrLQGtEQuB3TyfP
 erRoW6519ddH/PEFqa5eOiVSOtK0BpnuTug0urA7EL4dsXoEaEVx
X-Gm-Gg: ASbGncuEoP6RUkeG+IM1UadsR88Q0EIQdXj3ctrKWjyN61k9D9Lpvul7R9fgIfcB4s1
 r2ixEYDfFGWUeVrczCYcu4KCPAUFzJ3OCzWkxLqXAitQuS4I+0XwW2287jJEfv3u/9hawI97drF
 t//ttkZakPwQCxjmDoXUqldRNoqsjIbiZaraZDWzkopSXQK6YkCwsWZR2JiPnRmsEMInmXRLZtV
 5HLrLCiNMNav1XIu65zkSD1frDftuZCbSZQW37W/GOsqLOO7xjuwpO/Rkr5rwIquuaKjnq8BXPF
 IQzbe9e5yCAyPOG2ew==
X-Google-Smtp-Source: AGHT+IEvzxnmyAjZsfb0e+j5h+pA5J//LqIC1N+5T0Gss65x98CYcIC2LFS4QKxaVbkYqPE5QavCjw==
X-Received: by 2002:adf:e344:0:b0:38f:4fcf:d295 with SMTP id
 ffacd0b85a97d-390cc60a7d4mr1350730f8f.29.1740472454102; 
 Tue, 25 Feb 2025 00:34:14 -0800 (PST)
Received: from xeon.. ([188.163.112.51]) by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-abed1cdbe0asm102660766b.36.2025.02.25.00.34.12
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 25 Feb 2025 00:34:13 -0800 (PST)
From: Svyatoslav Ryhel <clamor95@gmail.com>
To: Andrzej Hajda <andrzej.hajda@intel.com>,
 Neil Armstrong <neil.armstrong@linaro.org>, Robert Foss <rfoss@kernel.org>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Jonas Karlman <jonas@kwiboo.se>, Jernej Skrabec <jernej.skrabec@gmail.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>,
 Simona Vetter <simona@ffwll.ch>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Svyatoslav Ryhel <clamor95@gmail.com>,
 Maxim Schwalm <maxim.schwalm@gmail.com>
Cc: dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org
Subject: [PATCH v2 3/3] drm/bridge: simple-bridge: Add support for MStar
 TSUMU88ADT3-LF-1
Date: Tue, 25 Feb 2025 10:33:44 +0200
Message-ID: <20250225083344.13195-4-clamor95@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250225083344.13195-1-clamor95@gmail.com>
References: <20250225083344.13195-1-clamor95@gmail.com>
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

From: Maxim Schwalm <maxim.schwalm@gmail.com>

A simple HDMI bridge used in ASUS Transformer AiO P1801-T.

Signed-off-by: Maxim Schwalm <maxim.schwalm@gmail.com>
Signed-off-by: Svyatoslav Ryhel <clamor95@gmail.com>
Reviewed-by: Robert Foss <rfoss@kernel.org>
---
 drivers/gpu/drm/bridge/simple-bridge.c | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/drivers/gpu/drm/bridge/simple-bridge.c b/drivers/gpu/drm/bridge/simple-bridge.c
index ab0b0e36e97a..c0f1f7baaa37 100644
--- a/drivers/gpu/drm/bridge/simple-bridge.c
+++ b/drivers/gpu/drm/bridge/simple-bridge.c
@@ -277,6 +277,11 @@ static const struct of_device_id simple_bridge_match[] = {
 			.timings = &ti_ths8134_bridge_timings,
 			.connector_type = DRM_MODE_CONNECTOR_VGA,
 		},
+	}, {
+		.compatible = "mstar,tsumu88adt3-lf-1",
+		.data = &(const struct simple_bridge_info) {
+			.connector_type = DRM_MODE_CONNECTOR_HDMIA,
+		},
 	},
 	{},
 };
-- 
2.43.0

