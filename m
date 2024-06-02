Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 002C48D74DA
	for <lists+dri-devel@lfdr.de>; Sun,  2 Jun 2024 13:08:31 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0C65110E09E;
	Sun,  2 Jun 2024 11:08:19 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="NkmmxA/0";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pl1-f193.google.com (mail-pl1-f193.google.com
 [209.85.214.193])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6D6A710E03B
 for <dri-devel@lists.freedesktop.org>; Sun,  2 Jun 2024 08:46:25 +0000 (UTC)
Received: by mail-pl1-f193.google.com with SMTP id
 d9443c01a7336-1f61f775738so23656485ad.2
 for <dri-devel@lists.freedesktop.org>; Sun, 02 Jun 2024 01:46:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1717317985; x=1717922785; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=JftoCKvTUzwdjKYhGR/l+pUm3JyDm2uIElHiFV8nCTA=;
 b=NkmmxA/0PE743WTP3SQgGtvhrxhm5gDQDK2os4UlaheVbBOEbnK+po5YMNzbPorA7O
 2sd/NdB4cQImsq8aEntfmnkVhWD2dbNJ86ky5PMsGac9yxO/+C5z8KCzbcwi9Z+Fk4qq
 MlxzYPaR/BvfMLI9n7H1bE41eIZ5IKvLUi8HyHRJRtWgl/82o13IZko45sm+LezpWNAj
 5JMdvN0LwOvfgGu1Ehpi/tojfxR0B4rHP8ogh4uf6VZ76r5Fw9neDItPJVS3bHy4SCnM
 k99OKOUL35/GGiPxOev2XkLTWTEPx2PTZRhAyAKomTePoq0IMI0u1XR+h57zFYIzBngE
 VT7Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1717317985; x=1717922785;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=JftoCKvTUzwdjKYhGR/l+pUm3JyDm2uIElHiFV8nCTA=;
 b=PZ6nlk8GRoanEqNnPiCw3tyo4gl6qdsPQusXk3S+jjzo2zr4iMqpuH7BEhaLRU2HSn
 eO3U462j/1Sg5QZMyOytRzVM86W7iu55E9GCmmn+NUdglFh9Odi2nBtcAKu6mkBGxLRJ
 ZG20zoi1OjAeseUXSyFpLYJFYqQ+XedpLVg3yPtk/P6Zzz4FGA2cQ4oVPYfXtR6P3HI3
 4+wmMpj3YvRSDjtXIPWc8iU9BDIvz/ay6mquhkGZ2QwzlCkSBbVid8yG+38yQ47yFDjD
 8jkQsQFXFHWvCu/ix0wZFv8XnocI6hoc2y1SoBTIMArYvB6lxqXpCsHRLc4+9Zhdm/xS
 yNNQ==
X-Gm-Message-State: AOJu0Yy+EMTlL/k4BTJf1OB1C4GYYnp08YydUApaboPAZMHxk90fOysa
 TUOBczPQ7HBxAILc2YDJwFUeUruGVY0tvtTKKsK+VA+vbCI+fUQ3
X-Google-Smtp-Source: AGHT+IFx5gcwjM6LFwHA6DeHkWhVqb0rbu9a+X2fWXnd8f5joE6EHDG2CGbHWkQklP8vSAWTqNrsEg==
X-Received: by 2002:a17:902:f805:b0:1f4:6c83:23d3 with SMTP id
 d9443c01a7336-1f6370bcd33mr55691915ad.52.1717317984654; 
 Sun, 02 Jun 2024 01:46:24 -0700 (PDT)
Received: from lhy-a01-ubuntu22.. ([106.39.42.164])
 by smtp.gmail.com with ESMTPSA id
 d9443c01a7336-1f6323eb1fdsm44248015ad.204.2024.06.02.01.46.20
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 02 Jun 2024 01:46:24 -0700 (PDT)
From: Huai-Yuan Liu <qq810974084@gmail.com>
To: thierry.reding@gmail.com, mperttunen@nvidia.com, airlied@gmail.com,
 daniel@ffwll.ch, jonathanh@nvidia.com
Cc: dri-devel@lists.freedesktop.org, linux-tegra@vger.kernel.org,
 linux-kernel@vger.kernel.org, baijiaju1990@gmail.com,
 Huai-Yuan Liu <qq810974084@gmail.com>
Subject: [PATCH V2] drm/tegra: fix a possible null pointer dereference
Date: Sun,  2 Jun 2024 16:46:13 +0800
Message-Id: <20240602084613.220931-1-qq810974084@gmail.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Mailman-Approved-At: Sun, 02 Jun 2024 11:08:14 +0000
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

In malidp_tegra_crtc_reset, new memory is allocated with kzalloc, but
no check is performed. Before calling __drm_atomic_helper_crtc_reset,
mw_state should be checked to prevent possible null pointer dereference.

Fixes: b7e0b04ae450 ("drm/tegra: Convert to using __drm_atomic_helper_crtc_reset() for reset.")
Signed-off-by: Huai-Yuan Liu <qq810974084@gmail.com>
---
V2:
* In patch V2, we call __drm_atomic_helper_crtc_reset(crtc, NULL) when
state is null.
  Thanks to Thierry Reding for helpful suggestion.
---
 drivers/gpu/drm/tegra/dc.c | 5 ++++-
 1 file changed, 4 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/tegra/dc.c b/drivers/gpu/drm/tegra/dc.c
index be61c9d1a4f0..afa7c269c29a 100644
--- a/drivers/gpu/drm/tegra/dc.c
+++ b/drivers/gpu/drm/tegra/dc.c
@@ -1388,7 +1388,10 @@ static void tegra_crtc_reset(struct drm_crtc *crtc)
 	if (crtc->state)
 		tegra_crtc_atomic_destroy_state(crtc, crtc->state);
 
-	__drm_atomic_helper_crtc_reset(crtc, &state->base);
+	if (state)
+		__drm_atomic_helper_crtc_reset(crtc, &state->base);
+	else
+		__drm_atomic_helper_crtc_reset(crtc, NULL);
 }
 
 static struct drm_crtc_state *
-- 
2.34.1

