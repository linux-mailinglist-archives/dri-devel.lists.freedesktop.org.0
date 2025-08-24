Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 617D5B32EC9
	for <lists+dri-devel@lfdr.de>; Sun, 24 Aug 2025 11:27:48 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BB10810E204;
	Sun, 24 Aug 2025 09:27:46 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="ejI/mDEK";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ed1-f41.google.com (mail-ed1-f41.google.com
 [209.85.208.41])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D0B0210E202
 for <dri-devel@lists.freedesktop.org>; Sun, 24 Aug 2025 09:27:41 +0000 (UTC)
Received: by mail-ed1-f41.google.com with SMTP id
 4fb4d7f45d1cf-61c266e81caso1918224a12.3
 for <dri-devel@lists.freedesktop.org>; Sun, 24 Aug 2025 02:27:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1756027660; x=1756632460; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=6QAnF6RQJWxSSGLUa+yOoR8YIWrn+p1dbQGhI+0L21k=;
 b=ejI/mDEKddC+pwt7Uxqp90dMw0wv84tBBH6tWAOKQeIqZRn0M7tdySYpB6IDR1yt2Q
 RerdiDhH2v12UskWJkRcNAKCXigr0/5IuAtkS27Jk+QyO9POo3zdXGqobFzgUpiNg/1K
 vdD+zX0mkvNe5rB81yNKdeMhj5HewltCkAaR2Z6mJ4WuZ3nPqWD131YodOQ3OFrsXyxa
 qxU6yuWGZY1oIBPSchutb/34ReMMh9cFNcwr7KXEv+OD2ood6ORY9LIciXafYU0HJmfQ
 tAXjzFy0aJ0e2Nxu+/cUsFWSX7P9WxhmdUxI+uFm7RvYblfUI392VCfO3jPuoB6CPsy0
 1EeA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1756027660; x=1756632460;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=6QAnF6RQJWxSSGLUa+yOoR8YIWrn+p1dbQGhI+0L21k=;
 b=BH+b4W57EG1gObUTUkuKPIujInuoRmbsWtwN389Mz4Nzp8IR4s/rwWfCL7hXS/pC/X
 3VeENfvDpmVruIzGyLnRp7SreBabHF5g4BVtB58kKRloY12D2VqWL53sQNZSdV/Jpc3/
 W0tHSF7seERVo1KJ0SPKUn1hioW5EfbrDroqTfBs2mcD5niQmG9tRnG5TZJM6VRie/T7
 zzXQiyWv5EnYhP5EGPJW4Jfvud1w4M3YjH/jNULFxiGg/bEjSLpEtr9JxR2IqFdB/7So
 5ykUzq+IvYcswfelshXOlx0s/oer9Z8EjGURR4n0sr7COs3msbZ0hwnKvhEjA8AKuHAx
 XqxA==
X-Gm-Message-State: AOJu0YxZERzwwIpWGNfU49RT6nYdle6G1mQEJ+xzifcFI4BvALpQPtXE
 25DKHg3V8m68I8YXH6m2K8MqKrXZd0fOYGV5krOlZtNuwVH2WAfMXQhl
X-Gm-Gg: ASbGncs6mHH9R0vO4nH/V/obxDupUhjbnJ8tLM3vra8ykH2uj1rcTuHgfEI1f8tMjda
 9y+wuX6G3qcGBNNOm7ibdRiFkNNQUCcGtfzOfKSLnbAqosIgid98EP0UFmV5baV/OQ8Evjz6L4C
 KlbsaN6tSRmX4iffS//GNKmBwlRLxCwO7ujxVpnQjyCjc56wsUmJfXE/Vt40Dl2O6K2ODM5ZCOE
 iSrnpQknz7/v9D4M6xWnsMBlNjacgRB3v3nUjS5WKJoPEnO7GJ5dHgnDF7JOYaqEAdmkoe8kzB5
 zenRTkXm5MLewdyOOPtsRt84tnV5C3Mg7pSx7Erk0d1kC7E6UsCuakVo0/k/qMNkHX1hBTjgxD1
 eiwHBgYQ8BWcHRr/pRCDY453K
X-Google-Smtp-Source: AGHT+IFRDj2zIEpy57OjDTZdxkDbqj2s6MYrtw/nnV23mOyecpb6Y/xhuaCvm5jFN32fJDOfIoGI+Q==
X-Received: by 2002:a05:6402:27d1:b0:61c:5272:a739 with SMTP id
 4fb4d7f45d1cf-61c5272a7e4mr1604664a12.2.1756027660198; 
 Sun, 24 Aug 2025 02:27:40 -0700 (PDT)
Received: from xeon.. ([188.163.112.76]) by smtp.gmail.com with ESMTPSA id
 4fb4d7f45d1cf-61c316f503dsm3035391a12.31.2025.08.24.02.27.38
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 24 Aug 2025 02:27:39 -0700 (PDT)
From: Svyatoslav Ryhel <clamor95@gmail.com>
To: Andrzej Hajda <andrzej.hajda@intel.com>,
 Neil Armstrong <neil.armstrong@linaro.org>, Robert Foss <rfoss@kernel.org>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Jonas Karlman <jonas@kwiboo.se>, Jernej Skrabec <jernej.skrabec@gmail.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>,
 Simona Vetter <simona@ffwll.ch>, Svyatoslav Ryhel <clamor95@gmail.com>,
 Maxim Schwalm <maxim.schwalm@gmail.com>
Cc: dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org
Subject: [PATCH v3 3/3 RESEND] drm/bridge: simple-bridge: Add support for
 MStar TSUMU88ADT3-LF-1
Date: Sun, 24 Aug 2025 12:27:28 +0300
Message-ID: <20250824092728.105643-4-clamor95@gmail.com>
X-Mailer: git-send-email 2.48.1
In-Reply-To: <20250824092728.105643-1-clamor95@gmail.com>
References: <20250824092728.105643-1-clamor95@gmail.com>
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
index ab0b0e36e97a..948300378cb0 100644
--- a/drivers/gpu/drm/bridge/simple-bridge.c
+++ b/drivers/gpu/drm/bridge/simple-bridge.c
@@ -260,6 +260,11 @@ static const struct of_device_id simple_bridge_match[] = {
 			.timings = &default_bridge_timings,
 			.connector_type = DRM_MODE_CONNECTOR_VGA,
 		},
+	}, {
+		.compatible = "mstar,tsumu88adt3-lf-1",
+		.data = &(const struct simple_bridge_info) {
+			.connector_type = DRM_MODE_CONNECTOR_HDMIA,
+		},
 	}, {
 		.compatible = "ti,opa362",
 		.data = &(const struct simple_bridge_info) {
-- 
2.43.0

