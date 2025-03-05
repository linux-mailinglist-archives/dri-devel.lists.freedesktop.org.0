Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 23ACBA4FF83
	for <lists+dri-devel@lfdr.de>; Wed,  5 Mar 2025 14:06:50 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9D81010E75D;
	Wed,  5 Mar 2025 13:06:47 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="hk0R4nGH";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ed1-f50.google.com (mail-ed1-f50.google.com
 [209.85.208.50])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 860D210E771
 for <dri-devel@lists.freedesktop.org>; Wed,  5 Mar 2025 13:06:45 +0000 (UTC)
Received: by mail-ed1-f50.google.com with SMTP id
 4fb4d7f45d1cf-5e4ebc78da5so10316328a12.2
 for <dri-devel@lists.freedesktop.org>; Wed, 05 Mar 2025 05:06:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1741180002; x=1741784802; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=BvA69GRM940nbh4WvjTd5eG8jH1Ow0PBoCzHHS2i3Ls=;
 b=hk0R4nGHvkHVrSzd6CutJrvCrzk/cVDZ67iQ5s7aWzeyFI1LGGe8PCWpnan/DCYmhe
 jpJqTp9uwHd3YBrr9XjeEWQbmuCE/DHXqwY0SiEqPch6bJ5AAAycop8T9sKVDp9ZRnhU
 3Ir63TXHZ4sAZgQ9pMZ0bqQ1uWwx1jzWrrYmHcshI7cMEEROtJeFxnq2JWr3tdXSmtLi
 0UQkepWlFrZMnwKFLka+PjkVEMhwz3+qsgY0QE0ASr+QwYiEnoG4ST4BPeAwbELWtbhn
 58+T3Xtwvc8Fe7MMUD4YXKLwL3v8LlWH0pgaSEg7Rl0Xg24KGPRPCnETTfAwBhT8+nDv
 dRcA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1741180002; x=1741784802;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=BvA69GRM940nbh4WvjTd5eG8jH1Ow0PBoCzHHS2i3Ls=;
 b=Ew1uwyL8J+Aukc+zGFHCQcMkVj7/9LxO9zgPgRgcMRI0z3DQWMzN95zhuYlS7hEeA5
 r8JL19WOiYSjbI2h4yWlNCvMtTmxkKFSQyh1Ij/fdjtWBpokBHH+BVHs+oPix6ALwMqM
 G9Aq5N9uAv/bfJzmq+gluNzSKNkNRZ0sHlO+8W8thC//4YXpWdWCSSbu+NfYTDiWkG8P
 ixTHhaYKNejNDwDh5VRejW8BHQeZw+Stbk94NQkBcbUrY8Or2AqSnnRw852+Z+EPRx2d
 YDa6whkwMNUTqUHDdMvM06BXV2cw/RnyhLOWWuSTzFLHRvVenKj96w+0TSkujhfzMLzl
 W2Fg==
X-Forwarded-Encrypted: i=1;
 AJvYcCXx2AeSfpC+yjG7U2xmV3H+17kFr6ipg1BNV7XVJLxQgDUlge9nBk4wisY4O5fSN5WbCthGR/oZS80=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YyCneXDWQ7vnjQQKjVHGMpF+PHVMZuSQZOZFKVgTpu7LE+F3B3k
 eKkqqbo3Pu4qoBzqDVKHnffsygNuiSKW2lRiWvfeRLxmqasA4+2gQrcvhwFJ39HSGbBeDTyt8Yc
 W5rE=
X-Gm-Gg: ASbGnctHYFXy+8W3Maqa54ukpkDVzfeWl2g114bVWOK3f5fHtl+YcZ6O7m43/IgDtGq
 fs031MOzkr739DHvjnDrQW7fAj4D1BP4U2vP1vWr65cziXx5WTHCp3L2MUGNnNJLAeMJkaWnutK
 V+1j4DA7WDxGgbY9bxn9I/lGN3vVbIw5NcBv3UifsIX5v7SKkkmJZBZfvV/JYJXRn9UrtwkTEf7
 ucYgeQJnTgRNN6VwLo5Kv4D7IgwhsNUeb4fDiWXOl4HUlwxOEz/nO8UzH1ma2PXK8tRfI8EPma7
 DYsXX7oJjivwbOrTyDIj5uoEEYrHCTGwH1VQ6UHPIzpKKURrMcnGppV9iqEY1hHin1ypDNEZ8X5
 I3v0hGXVFYJJcljIOOLzdig==
X-Google-Smtp-Source: AGHT+IEjtiBAYCTH0+e95UXzOpV6Qk/1lP6TuM4iQbwFmlqCq9fGF9wURhaIIhsi+UMHMk8/oJkTeQ==
X-Received: by 2002:a50:c8cd:0:b0:5e5:bcd6:4ad8 with SMTP id
 4fb4d7f45d1cf-5e5bcd64d5amr155764a12.9.1741180002364; 
 Wed, 05 Mar 2025 05:06:42 -0800 (PST)
Received: from rayden.urgonet (h-98-128-140-123.A175.priv.bahnhof.se.
 [98.128.140.123]) by smtp.gmail.com with ESMTPSA id
 4fb4d7f45d1cf-5e5bcd1595bsm65714a12.42.2025.03.05.05.06.40
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 05 Mar 2025 05:06:41 -0800 (PST)
From: Jens Wiklander <jens.wiklander@linaro.org>
To: linux-kernel@vger.kernel.org, linux-media@vger.kernel.org,
 dri-devel@lists.freedesktop.org, linaro-mm-sig@lists.linaro.org,
 op-tee@lists.trustedfirmware.org, linux-arm-kernel@lists.infradead.org
Cc: Olivier Masse <olivier.masse@nxp.com>,
 Thierry Reding <thierry.reding@gmail.com>, Yong Wu <yong.wu@mediatek.com>,
 Sumit Semwal <sumit.semwal@linaro.org>,
 Benjamin Gaignard <benjamin.gaignard@collabora.com>,
 Brian Starkey <Brian.Starkey@arm.com>, John Stultz <jstultz@google.com>,
 "T . J . Mercier" <tjmercier@google.com>,
 =?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>,
 Sumit Garg <sumit.garg@linaro.org>,
 Matthias Brugger <matthias.bgg@gmail.com>,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
 azarrabi@qti.qualcomm.com, Simona Vetter <simona.vetter@ffwll.ch>,
 Daniel Stone <daniel@fooishbar.org>,
 Jens Wiklander <jens.wiklander@linaro.org>
Subject: [PATCH v6 01/10] tee: tee_device_alloc(): copy dma_mask from parent
 device
Date: Wed,  5 Mar 2025 14:04:07 +0100
Message-ID: <20250305130634.1850178-2-jens.wiklander@linaro.org>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250305130634.1850178-1-jens.wiklander@linaro.org>
References: <20250305130634.1850178-1-jens.wiklander@linaro.org>
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

If a parent device is supplied to tee_device_alloc(), copy the dma_mask
field into the new device. This avoids future warnings when mapping a
DMA-buf for the device.

Signed-off-by: Jens Wiklander <jens.wiklander@linaro.org>
---
 drivers/tee/tee_core.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/drivers/tee/tee_core.c b/drivers/tee/tee_core.c
index d113679b1e2d..685afcaa3ea1 100644
--- a/drivers/tee/tee_core.c
+++ b/drivers/tee/tee_core.c
@@ -922,6 +922,8 @@ struct tee_device *tee_device_alloc(const struct tee_desc *teedesc,
 	teedev->dev.class = &tee_class;
 	teedev->dev.release = tee_release_device;
 	teedev->dev.parent = dev;
+	if (dev)
+		teedev->dev.dma_mask = dev->dma_mask;
 
 	teedev->dev.devt = MKDEV(MAJOR(tee_devt), teedev->id);
 
-- 
2.43.0

