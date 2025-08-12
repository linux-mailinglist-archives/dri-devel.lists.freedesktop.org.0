Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 13D59B21E5C
	for <lists+dri-devel@lfdr.de>; Tue, 12 Aug 2025 08:32:40 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1D52910E34D;
	Tue, 12 Aug 2025 06:32:37 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=chromium.org header.i=@chromium.org header.b="MtQv4COY";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pg1-f182.google.com (mail-pg1-f182.google.com
 [209.85.215.182])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3766810E34D
 for <dri-devel@lists.freedesktop.org>; Tue, 12 Aug 2025 06:32:35 +0000 (UTC)
Received: by mail-pg1-f182.google.com with SMTP id
 41be03b00d2f7-b3f80661991so4311323a12.0
 for <dri-devel@lists.freedesktop.org>; Mon, 11 Aug 2025 23:32:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=chromium.org; s=google; t=1754980355; x=1755585155;
 darn=lists.freedesktop.org; 
 h=content-transfer-encoding:mime-version:date:message-id:subject
 :references:in-reply-to:to:from:from:to:cc:subject:date:message-id
 :reply-to; bh=e2EbEqlDXIPuEkSIhf625qIlzs3WVIMHmlWMM9SUkVA=;
 b=MtQv4COYLlZvW6IIPGekhNj3MNaPOIt1AjIQCkrrXOw2eaBklczou4lF+r5WDxzLEF
 yV0ZFyJoMNCM/32Rkzx7dnxSXgUqX0snUBh/as5Iqa6DmuH/uX3CY1lJrge/4aZfPn6E
 l/TtA9dK5HTGUGd+P66bskziNQ01dog/c5Rq8=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1754980355; x=1755585155;
 h=content-transfer-encoding:mime-version:date:message-id:subject
 :references:in-reply-to:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=e2EbEqlDXIPuEkSIhf625qIlzs3WVIMHmlWMM9SUkVA=;
 b=JuzTk6OBgKCJaL8TiiquFUiwFCjQ2MOnMD8KGEcrIOY6//RJ6NNhNTV2gC+ui3XjGV
 Z/j3Y+cHu0joobcBDBn7CSdulH735h83weDQDE9J5ddUT6QeyRb1k/z7IpsRfQ+iNiZL
 wVVthCUEercbMCL+U3x6SRmWcaJ2LSXL4qqaQLqJPujrzrJwU4iQNLmffnyCAw6RLPiA
 Ddti5eXBB8nB4z/PHw5cbGDbdhEF5fMpY6NrK7YWsj4ac5EqEvgzCoXAjmykhkhZUtOG
 vCV5RGbWYiwKoIkBq92p20+v44JFNvZl+G7uc7PEd7nkXDfg5rnIVRw6TP+s9j4LQX1t
 H1Pg==
X-Forwarded-Encrypted: i=1;
 AJvYcCXBuN6wVnCReAr76TSNTqYJ8K+gY0y3wdfOfwtUjyk75eA+nVs98Vbe7EZ0QN3sjmTPf939/k8PIhI=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YyGwophHeCKX91ZJXXd6yDV3Xy4EOSa/SSOt9eAS2GEyJHwdfwb
 IlTLqH7KMrdBgye/iqLAeE+1GVM+8FA/1vF78zLpfLxs8gY4/OyYwIafHVbNoFS9Hg==
X-Gm-Gg: ASbGncsy9UZoTgCFT8+eKb7RN5Qn5Yh2ZKocLuQRvA9Lmr9nw45ACAUVuwZZtJ6ZiSL
 8tpEo0pPXv0OWduR2fiMME2wFhBx/6qARcbJIDAtwY+KNCzfZOJNSrVcsSN5NUUHQXcIDsyVWNM
 xQwPU2hzt21Qx1pAE+GfQ5huoLbVLQeQFP8z7UDO1dZNjm86TRjaqHvqsAbkFoHs3K9oUjeFciy
 Stc4KL6niKGN9P/h64QR42KkFu0TR2jgkVydYW7ki2aj/pv1AIMHAaLavp9aZHDDC7jeZ55NuXS
 jS6NIe2zuDPLKU8MyRNvjs8bdONPtN6L+ZhN01LLWubs6DjZ2QWPtOjAY96LduaEDMNfWs+Oemg
 5bS9uVsQbCVDp2YlgnB9nRR1nU50SevYjObec++Jj
X-Google-Smtp-Source: AGHT+IFhTFwxRSv8E2GLDX/po2ou7d5z6m3Vj1K82MSazLrjmlphpMDTRRPJFvKoS8p3fmF9jHXehw==
X-Received: by 2002:a17:902:d4c4:b0:23f:9718:85f5 with SMTP id
 d9443c01a7336-242fc38a2efmr36482365ad.15.1754980354691; 
 Mon, 11 Aug 2025 23:32:34 -0700 (PDT)
Received: from wenstp920.tpe.corp.google.com
 ([2401:fa00:1:10:f81e:7c91:8fbf:672a])
 by smtp.gmail.com with ESMTPSA id
 d9443c01a7336-241e8976cbdsm291456165ad.75.2025.08.11.23.32.32
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 11 Aug 2025 23:32:34 -0700 (PDT)
From: Chen-Yu Tsai <wenst@chromium.org>
To: Andrzej Hajda <andrzej.hajda@intel.com>, 
 Neil Armstrong <neil.armstrong@linaro.org>, Robert Foss <rfoss@kernel.org>, 
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>, 
 Jonas Karlman <jonas@kwiboo.se>, Jernej Skrabec <jernej.skrabec@gmail.com>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org, 
 Chia-I Wu <olvaffe@gmail.com>
In-Reply-To: <20250610235825.3113075-1-olvaffe@gmail.com>
References: <20250610235825.3113075-1-olvaffe@gmail.com>
Subject: Re: [PATCH] drm/bridge: it6505: select REGMAP_I2C
Message-Id: <175498035196.3219801.9473521709226149034.b4-ty@chromium.org>
Date: Tue, 12 Aug 2025 14:32:31 +0800
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.14.2
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


On Tue, 10 Jun 2025 16:58:25 -0700, Chia-I Wu wrote:
> Fix
> 
>   aarch64-linux-gnu-ld: drivers/gpu/drm/bridge/ite-it6505.o: in function `it6505_i2c_probe':
>   ite-it6505.c:(.text+0x754): undefined reference to `__devm_regmap_init_i2c'
> 
> 

Applied, thanks!

[1/1] drm/bridge: it6505: select REGMAP_I2C
      commit: 21b137f651cf9d981e22d2c60a2a8105f50a6361

Best regards,
-- 
Chen-Yu Tsai <wenst@chromium.org>

