Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 5C5229011F4
	for <lists+dri-devel@lfdr.de>; Sat,  8 Jun 2024 16:21:18 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8FE4110E094;
	Sat,  8 Jun 2024 14:21:16 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="IrAf7gqx";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-f54.google.com (mail-wm1-f54.google.com
 [209.85.128.54])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A4A1010E094
 for <dri-devel@lists.freedesktop.org>; Sat,  8 Jun 2024 14:21:14 +0000 (UTC)
Received: by mail-wm1-f54.google.com with SMTP id
 5b1f17b1804b1-42163fa630aso18164565e9.3
 for <dri-devel@lists.freedesktop.org>; Sat, 08 Jun 2024 07:21:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1717856473; x=1718461273; darn=lists.freedesktop.org;
 h=content-disposition:mime-version:message-id:subject:cc:to:from:date
 :from:to:cc:subject:date:message-id:reply-to;
 bh=FjYuT33PAKShV15vOZT2MY4Py8HrSQc+sDa6zAJXDS0=;
 b=IrAf7gqx+PZ4THLi+mGuax8MGZLYHn7j97soF18fWSUOp4SGnyAGkJHpS9JHXuMpRL
 zSOel5Fzf70/cwbfau0POHu05fKdwdxILjrxkfCtXBqyGcfRGo24bo7ZyN+5QgKtP7nI
 FLHgmyQsCj/G/B+3uTXy9Q4S0/Sd7AmkKnJstRhyZPAHrHki3hYqDwSzBCTRhp3735mH
 HGIuIBHlOjdQNOyy/qXHlat4VmYbd05y/D80usJDrhcqpVpD0i9n5y6n+xv+rUxx2GSU
 RwSHmmcuaYNQcMjmQGo/sJoKE9Wpmcagoxp/lWisLawpic5M1Lph4kDPOm592ONMOqzA
 uWmQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1717856473; x=1718461273;
 h=content-disposition:mime-version:message-id:subject:cc:to:from:date
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=FjYuT33PAKShV15vOZT2MY4Py8HrSQc+sDa6zAJXDS0=;
 b=I8suD0OEIDZYBp7uyGcRnX8gMC1bV9HVbsbfTwXhvMMPHjI5527rdp5kx0K9j245uh
 B9NDGXVNcsUdn8lA0s7sta6jAlKpqemR2rezCajKaIXg7xPUuoA8InLo5wsB4rECuGVV
 xnxhe608PFNcNAdkh0m4jLq+6x1zvxMcLq4kyKBkRdCYlVL2UkSQGToVSQjoPa0TZH4X
 551PdLU6JcOJr/IbLldemd91TtOs0LtROuEUsW+KWxkk8SFDvjazP2Evs2SKqW2TsLIG
 GCmJnfxtk071qFQ79pW6ntQ2VHJnEy8LJPix2O+3iLfoZOthG3VSwonEBiEFVFZk1cSV
 aXFQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCXdSoKBTvtk/xe1yKAIFauTIbM72Rp2oo4DkufxiUcR0lCqwgU14Rzp2uC3AZcwvLidI59EheqawXwzpf7o21dWl/xvaDLVmz5b4MZnLKP+
X-Gm-Message-State: AOJu0YzsxBvatE7Efb59G4CpfSPF9qT4wtnrJIFAcO3z5mP+6TcSYQYh
 7vfsIMXBJnWlSCXhsen6GISBkFQTdPZ7LToFLAALK4UjGliKyJr/h6VOBKn+W3o=
X-Google-Smtp-Source: AGHT+IHMSDClGwHp6ZpeLqtN0xANquwVMTE0SCEKdNN8oNRycIpwR41xcOpeGGQ6Ptb5UJz1fLwcoA==
X-Received: by 2002:a05:600c:1552:b0:421:6a73:5fd7 with SMTP id
 5b1f17b1804b1-4216a736254mr33767185e9.15.1717856472749; 
 Sat, 08 Jun 2024 07:21:12 -0700 (PDT)
Received: from localhost ([102.222.70.76]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-4215c2c690dsm87193245e9.34.2024.06.08.07.21.11
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 08 Jun 2024 07:21:12 -0700 (PDT)
Date: Sat, 8 Jun 2024 17:21:08 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: Allen Chen <allen.chen@ite.com.tw>
Cc: Andrzej Hajda <andrzej.hajda@intel.com>,
 Neil Armstrong <neil.armstrong@linaro.org>, Robert Foss <rfoss@kernel.org>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Jonas Karlman <jonas@kwiboo.se>, Jernej Skrabec <jernej.skrabec@gmail.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>,
 Hermes Wu <hermes.wu@ite.com.tw>,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 kernel-janitors@vger.kernel.org
Subject: [PATCH] drm/bridge: it6505: Fix potential NULL dereference
Message-ID: <5e6e8882-478a-46c0-9119-b643d524cc0c@moroto.mountain>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
X-Mailer: git-send-email haha only kidding
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

Smatch complains correctly that the NULL checking isn't consistent:

    drivers/gpu/drm/bridge/ite-it6505.c:2583 it6505_poweron()
    error: we previously assumed 'pdata->pwr18' could be null
    (see line 2569)

Add a NULL check to prevent a NULL dereference on the error path.

Fixes: b5c84a9edcd4 ("drm/bridge: add it6505 driver")
Signed-off-by: Dan Carpenter <dan.carpenter@linaro.org>
---
 drivers/gpu/drm/bridge/ite-it6505.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/bridge/ite-it6505.c b/drivers/gpu/drm/bridge/ite-it6505.c
index 3f68c82888c2..4f01fadaec0f 100644
--- a/drivers/gpu/drm/bridge/ite-it6505.c
+++ b/drivers/gpu/drm/bridge/ite-it6505.c
@@ -2580,7 +2580,8 @@ static int it6505_poweron(struct it6505 *it6505)
 		usleep_range(1000, 2000);
 		err = regulator_enable(pdata->ovdd);
 		if (err) {
-			regulator_disable(pdata->pwr18);
+			if (pdata->pwr18)
+				regulator_disable(pdata->pwr18);
 			return err;
 		}
 	}
-- 
2.43.0

