Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 1024AAA44CE
	for <lists+dri-devel@lfdr.de>; Wed, 30 Apr 2025 10:06:42 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 586EC10E71F;
	Wed, 30 Apr 2025 08:06:40 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="qSJCd580";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-f41.google.com (mail-wm1-f41.google.com
 [209.85.128.41])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A08E210E715
 for <dri-devel@lists.freedesktop.org>; Wed, 30 Apr 2025 08:06:39 +0000 (UTC)
Received: by mail-wm1-f41.google.com with SMTP id
 5b1f17b1804b1-43cf3192f3bso66231385e9.1
 for <dri-devel@lists.freedesktop.org>; Wed, 30 Apr 2025 01:06:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1746000398; x=1746605198; darn=lists.freedesktop.org;
 h=content-disposition:mime-version:message-id:subject:cc:to:from:date
 :from:to:cc:subject:date:message-id:reply-to;
 bh=JaBtCb/6XVAvBecubHAVnnEpXRtXlY0yxjWDApUS/CE=;
 b=qSJCd580RyHq3jZ0CLfw1ew+a+6xKrDGVEbcV/x0hzZl9gRb0AeZtJoONsB7wsBmdV
 5Q1e9uQh031BOcWAE6K32A3N4lcJ4Zb24Rhvl3yzvKMptu5Cwo6wcr4EQdePk5WEpujk
 iSBTOQd8rKaHZj2t3KxBI+MQk0g0JS1oWslW4uyCoisCxdh/uc9OxbtM0EJke4LeHRKG
 YtB/Hp4YI9xsPpF/8hqQrhgIHkYGidLmajPU4UtVFWh3xYNCBece1YLMV6KDSn++ORux
 Dz7XbL5b/Km2Xvrr+0ulQVRGNbxz9OiQA8sT+fptxCMBUKqtpyLbsvYiQu7bbnjQSdWX
 eluQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1746000398; x=1746605198;
 h=content-disposition:mime-version:message-id:subject:cc:to:from:date
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=JaBtCb/6XVAvBecubHAVnnEpXRtXlY0yxjWDApUS/CE=;
 b=T/QxjYpsyp1QK4yvHKtxfzAC8lt2GHynQJAauKmbOkPCIqW1VJp9aaN+1jqOsaNT/X
 07zNzePskpjzfULX3KoVCCLcAlEG96yGxc8H0CcHIatWa1xCJ73fgBDJDS8Mn55s0uL5
 Nn2+ze0V357QzXFOi7gqhDYO5HUZot8F7DDINHtCbNJfIh1M4a6FeY/K4nR3JYxbmp/F
 zV6d9+TrpbQzdlWjZ6mbMxd1GI0q78cK9dZJf7Ic28TzoXUdJrMR5qQfgw8Tm5w50zIF
 0Z+xiM37lGpUO1xOwhgPkksrBGaQokKyIEoMsNwiHKZ5e2JGYN1W6ziODat34ZF6EiTM
 lMgA==
X-Forwarded-Encrypted: i=1;
 AJvYcCWkoLukuvoCdoX+FCvPzHhopmhWSgJEOdKcpDhYBV5ReFFfWTNmJZjzapw62HuaCkRmqUCIi6NXnp0=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YxXtSuvEOsOKsskfSCMBKsPG9X3cT2ZXdeVpp8y72vcZSPcj52/
 od6WITLeClTVmbPqfRsxdNKplUxXQOm2+PsrBsyMjdo2B+Gmzfo2psMhU+ogtr0=
X-Gm-Gg: ASbGnctCl0II0rZEl3h5OceEZWlSvVPf1rG/TFpZTln3d2qOxfIyLrhaKqdDqzj8/AU
 nOO1pngJF+efXEF4IqJVLLPddLl41TCo85xZxlyP5QRg3zlQQbezmjxF46Y80gxnGd6mx/bMAVn
 +6n+o7hCtV6KxCfci/jLX4yXO0uA0VGsdB8AJOm/kASF+eOBlkUYh8ySQNHc/jfpuNDCKtmxB7q
 NkwOwo7YGwpUufzIydC3kT4wEvbBxoOhvvqqCeMzyrXIaj+HKCeRg3Km/iXuvQaPkbge540XHk0
 jMil0dCluOBfetU/IwTDMRGpfoEtt1bE4x2kz0xM8vrKGw==
X-Google-Smtp-Source: AGHT+IHP+atkeWPXnPct3xYEf+jUQ0S7DQqC5h4qJD0wJmpfwo3S07LKuBCrJm3Z9SrRTQ8TUMm+ag==
X-Received: by 2002:a05:600c:502b:b0:440:6a1a:d89f with SMTP id
 5b1f17b1804b1-441b1f30736mr19057575e9.4.1746000398163; 
 Wed, 30 Apr 2025 01:06:38 -0700 (PDT)
Received: from localhost ([196.207.164.177])
 by smtp.gmail.com with UTF8SMTPSA id
 5b1f17b1804b1-441b2bbbedfsm15173965e9.26.2025.04.30.01.06.35
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 30 Apr 2025 01:06:37 -0700 (PDT)
Date: Wed, 30 Apr 2025 11:06:32 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: Lyude Paul <lyude@redhat.com>
Cc: Danilo Krummrich <dakr@kernel.org>, David Airlie <airlied@gmail.com>,
 Simona Vetter <simona@ffwll.ch>, dri-devel@lists.freedesktop.org,
 nouveau@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 kernel-janitors@vger.kernel.org
Subject: [PATCH] drm/nouveau/fifo: small cleanup in nvkm_chan_cctx_get()
Message-ID: <aBHaCM66pXaP84ei@stanley.mountain>
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

"&chan->cgrp->mutex" and "&cgrp->mutex" are the same thing.  Use
"&cgrp->mutex" consistently.  It looks nicer and it silences a
Smatch static checker warning.

Signed-off-by: Dan Carpenter <dan.carpenter@linaro.org>
---
 drivers/gpu/drm/nouveau/nvkm/engine/fifo/chan.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/nouveau/nvkm/engine/fifo/chan.c b/drivers/gpu/drm/nouveau/nvkm/engine/fifo/chan.c
index 7d4716dcd512..f5cd7f7c48b4 100644
--- a/drivers/gpu/drm/nouveau/nvkm/engine/fifo/chan.c
+++ b/drivers/gpu/drm/nouveau/nvkm/engine/fifo/chan.c
@@ -104,7 +104,7 @@ nvkm_chan_cctx_get(struct nvkm_chan *chan, struct nvkm_engn *engn, struct nvkm_c
 	if (cctx) {
 		refcount_inc(&cctx->refs);
 		*pcctx = cctx;
-		mutex_unlock(&chan->cgrp->mutex);
+		mutex_unlock(&cgrp->mutex);
 		return 0;
 	}
 
-- 
2.47.2

