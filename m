Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 66830A3D512
	for <lists+dri-devel@lfdr.de>; Thu, 20 Feb 2025 10:45:32 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D4B4210E4B6;
	Thu, 20 Feb 2025 09:45:30 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="g9RX/Lua";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lj1-f169.google.com (mail-lj1-f169.google.com
 [209.85.208.169])
 by gabe.freedesktop.org (Postfix) with ESMTPS id ADCC710E4A7
 for <dri-devel@lists.freedesktop.org>; Thu, 20 Feb 2025 09:45:25 +0000 (UTC)
Received: by mail-lj1-f169.google.com with SMTP id
 38308e7fff4ca-30613802a6bso7123751fa.1
 for <dri-devel@lists.freedesktop.org>; Thu, 20 Feb 2025 01:45:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1740044724; x=1740649524; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=ygy9fOgk6MRr8NA0et8LD0ypbUW05zgOvC6SdedZlXc=;
 b=g9RX/LuaaM69v2dNQFFqWu5zNUMuBEOBrdtZb2SuEh339a18vQLd82fcr2tq4q8aX7
 Xyxv47C+cILq8qfM4IheeApm7H2G8krESmOfTx07po/XL7vWXdkqWSDQM14XWDltlN6c
 1w+EYjB3o8biHsh654Kpf3Q+a9m3yuK/D2kIPaVo0qKOupDRXbmB9v/hDPcX1V2ryauV
 /S0B4A1h/FWJoszkUz02beFVOOdYIpV9DuVx1ZQIx5GBK+3Xr5V3AJeVYSO6cxasErJv
 YlXt28uVj6gwFgEabCitWFdvbedyM7PsEo/7BqTyhnRNPqko0j7jUphaO2fLZsRZxnUU
 umtA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1740044724; x=1740649524;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=ygy9fOgk6MRr8NA0et8LD0ypbUW05zgOvC6SdedZlXc=;
 b=EqQpomcjVLsSt5CzWyqspEJuqvbz4QhMj5zjXVLtPIbfK+LtLT/KO8XkL/1v9LtOSI
 wNvA+t4TGhRZyuetLJgY1dUz+WDZ0iHQ4niZKHr7/NEfcxE4KVDiuhaXjuqaRhlJNBjT
 Ewh8exgBIkU6ZNZGIs6EmGC2CgwVsZf3bsnHLukUZPTCniGcV/nNBbCLkTDKgCiPCLVO
 +LBE48M90MCN1JPAuYs5EkF60b4E7C+0dhLFQc+ZPFBlopq3iZZdcMKIHaNq5g4x9W7g
 KIQrCN9fhorceLE9U+kno64EmRs3QHAkNUapejir3EIQSM3EfFuplxM+n2FEWXDezthu
 EOOA==
X-Gm-Message-State: AOJu0YyZCoSohrRjQin+oFRCx232O0W3YLMDEe9ZNZKMdAxbavzcMGwP
 DDR0yWsxgRNNnBwABgT4tnH8D91UDVYhkfKMwa9rka1ACVhwKlo5
X-Gm-Gg: ASbGnctzZJdEFbivo9OigkwTTFs3Bf6tP8SiXcdeQnAA9G5zj5ioMoGs5ZmXUAQ8rhg
 hIj/vPURxr1pjT7q0eRDMVTn26IkD/NSE0LH8fnf2iCccBlzXtlSIB56b9ICPQ9oxH98K7KtDNO
 Ktz8iHRobH/2NMPFIjAStXCuUJ6zWh9Y3EcqfFi2oprsXYiww6Zgh+C/BeI3mnuehoot3O25oQn
 MErUtshp3KyCC/A1OV0xO3o7POA0sRrb4gigg4zTcM6q5x7lf8QudreJZyjH4WFr4FNaQohahls
 vQSFRGM=
X-Google-Smtp-Source: AGHT+IHtiyfeKeppq46ihJyG5+Xx+dlbk3UXHERlc6GLGvUym4f4iISGaaNk/JL7p9AhyTZamk5CDQ==
X-Received: by 2002:a2e:8618:0:b0:308:f827:f901 with SMTP id
 38308e7fff4ca-30927a632cfmr61727621fa.21.1740044723649; 
 Thu, 20 Feb 2025 01:45:23 -0800 (PST)
Received: from xeon.. ([188.163.112.51]) by smtp.gmail.com with ESMTPSA id
 38308e7fff4ca-30a3a0d1c2bsm9574311fa.11.2025.02.20.01.45.21
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 20 Feb 2025 01:45:23 -0800 (PST)
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
Subject: [PATCH v1 3/3] drm/bridge: simple-bridge: Add support for MStar
 TSUMU88ADT3-LF-1
Date: Thu, 20 Feb 2025 11:44:56 +0200
Message-ID: <20250220094456.32818-4-clamor95@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250220094456.32818-1-clamor95@gmail.com>
References: <20250220094456.32818-1-clamor95@gmail.com>
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

