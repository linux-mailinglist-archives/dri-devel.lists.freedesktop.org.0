Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A99F5A49398
	for <lists+dri-devel@lfdr.de>; Fri, 28 Feb 2025 09:33:28 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E819A10EC16;
	Fri, 28 Feb 2025 08:33:25 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="Aa1ky5Ts";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-f42.google.com (mail-wm1-f42.google.com
 [209.85.128.42])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EA1CD10EC16
 for <dri-devel@lists.freedesktop.org>; Fri, 28 Feb 2025 08:33:24 +0000 (UTC)
Received: by mail-wm1-f42.google.com with SMTP id
 5b1f17b1804b1-43aac0390e8so11905145e9.2
 for <dri-devel@lists.freedesktop.org>; Fri, 28 Feb 2025 00:33:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1740731603; x=1741336403; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=altOlD5OfS9XMQsr9JEVj89aEfRHMr4jhcpHBqrXJ/0=;
 b=Aa1ky5Ts8HPOIQGJhIfybdJpfweC6vPECSPFemd5Ab3VqEXUtFPOs5ZsQLWaGK0Sbm
 bYgxa8HJERN7Cp8yETrrFfHvbfkHIoSsJftj3XWHV7i3Y/ZF18FPGfdzq8H2D/Yf37pm
 pm/fBRP+6I2bKzUMahSlN/Z8EOYbrSnqO2BfGjrzUHUj3ZA59laNyZWhtUHj553+HCPy
 /LRm4pEGZygtmPf+3SQzPtYVpXrlPjINxSojF8NaTT4171kocCDgRnLXysurc+2h3nfl
 77iWeBOVHGn0NBhVDXXYEgwQh8PUCK/faJxvIxH39jcRfjpf0whozQ4oR58YMjpCZeJf
 Evkg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1740731603; x=1741336403;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=altOlD5OfS9XMQsr9JEVj89aEfRHMr4jhcpHBqrXJ/0=;
 b=la4ocxrFFcDxu1Dsd0v+yOBS62PDcHEeXYLMcqW29ClMfbAcAP2Jm2ey8NLBq2zgNd
 1NbCSyAT/N9O7GfL8XWYJ0Xte5Zc8tqWTjZ2C+XFh7YwW5RiGYbK389CDhLvoODgruwz
 eK0GIjKuHWjg+rN84r9NB0u11RoGPLmiGQYDhyOefXAAIkcmMZeglo9NNpQn6K5qJ7xF
 jBqnc9yVIFhufGNdjgXdd6IMSm0g0kUes3+5XsCoh3NIg1yRR47VT+2yB2ozn3ErpRme
 uCqi63ZdEn35YFcUD/Tww0vclBRAquZV6gKpH0o8lthbzwDQOzVpg+0TOwNRnGnnJFyw
 pInQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCVzUVLAC2ODV805wS4pn4dpei7dEm4xT44KZ8v58cEj7EXow+En8vES+S/zm0gWv7+W1kK9cKCBrKI=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YzgCq8UDnyDbea6VRe0WCvUqngS6f5uzNwZqJrXhM9eS9vi6zKI
 LbuRx2e0vw0H5wedaWYfufGWt35TOYv1rcCNok9IDP7MqSRqyckE
X-Gm-Gg: ASbGnctonTXH/geB8JFQp19hM1uLZZmc1UVZmVnI/zI1itAACJlf3x8XK4TNmp/XUiP
 au/mj8V3D7On2CY8LsmZYZvIVwM3Vyr0z3qAm2w40lUlU5WNjv8Mc/iuVfVZeCjKaPsifSjaeEm
 7J3aWHStscEc/d5KZYQQ+yKJrdybPqmU0IQuTmXdb82R69brX8AM5E4VQGx6fu8h6+veq/Zx30O
 xbWszubIa+PJjUOuCGvHSxmtkd/JBPBhBPFyPEnHu8gH4YpWrPH/ueqV2+JAN8t9tStXsU7F9xw
 jOUq8+88GBd1pssgbYS7XVDll1o=
X-Google-Smtp-Source: AGHT+IFow7FUOytG/ykCncfTbL0sB2LYY5hKFmRDCWNXGIyfl+KPtU4kWQ6hYwmvBGNpZfuJxe3aQQ==
X-Received: by 2002:a05:600c:3b0d:b0:439:88bb:d02d with SMTP id
 5b1f17b1804b1-43ba66da7eemr16388845e9.2.1740731603153; 
 Fri, 28 Feb 2025 00:33:23 -0800 (PST)
Received: from localhost ([194.120.133.72])
 by smtp.gmail.com with UTF8SMTPSA id
 5b1f17b1804b1-43aba532b2fsm79801705e9.10.2025.02.28.00.33.22
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 28 Feb 2025 00:33:22 -0800 (PST)
From: Colin Ian King <colin.i.king@gmail.com>
To: Andrzej Hajda <andrzej.hajda@intel.com>,
 Neil Armstrong <neil.armstrong@linaro.org>, Robert Foss <rfoss@kernel.org>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Jonas Karlman <jonas@kwiboo.se>, Jernej Skrabec <jernej.skrabec@gmail.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>,
 Simona Vetter <simona@ffwll.ch>, dri-devel@lists.freedesktop.org
Cc: kernel-janitors@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH][next] drm/bridge: Fix spelling mistake "gettin" -> "getting"
Date: Fri, 28 Feb 2025 08:32:47 +0000
Message-ID: <20250228083248.676473-1-colin.i.king@gmail.com>
X-Mailer: git-send-email 2.47.2
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

There is a spelling mistake in a dev_err message. Fix it.

Signed-off-by: Colin Ian King <colin.i.king@gmail.com>
---
 drivers/gpu/drm/bridge/sii902x.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/bridge/sii902x.c b/drivers/gpu/drm/bridge/sii902x.c
index 2100a687096e..914a2609a685 100644
--- a/drivers/gpu/drm/bridge/sii902x.c
+++ b/drivers/gpu/drm/bridge/sii902x.c
@@ -887,7 +887,7 @@ static int sii902x_audio_codec_init(struct sii902x *sii902x,
 		lanes[0] = 0;
 	} else if (num_lanes < 0) {
 		dev_err(dev,
-			"%s: Error gettin \"sil,i2s-data-lanes\": %d\n",
+			"%s: Error getting \"sil,i2s-data-lanes\": %d\n",
 			__func__, num_lanes);
 		return num_lanes;
 	}
-- 
2.47.2

