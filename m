Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B5DC8B1A61F
	for <lists+dri-devel@lfdr.de>; Mon,  4 Aug 2025 17:34:40 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1CA3010E59B;
	Mon,  4 Aug 2025 15:34:39 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="FbtJUh0q";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-f46.google.com (mail-wr1-f46.google.com
 [209.85.221.46])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C212010E59B
 for <dri-devel@lists.freedesktop.org>; Mon,  4 Aug 2025 15:34:37 +0000 (UTC)
Received: by mail-wr1-f46.google.com with SMTP id
 ffacd0b85a97d-3b7825e2775so3777341f8f.2
 for <dri-devel@lists.freedesktop.org>; Mon, 04 Aug 2025 08:34:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1754321676; x=1754926476; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:date:message-id:subject
 :references:in-reply-to:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=PP/vyVyUPS8WNIUqsnkkJp8JWYjpnaKX98zCW9jQC04=;
 b=FbtJUh0q0RAffke2N46JgdVS8yAhTIjGiT+6M4eoJSPCFxn8UeFONzkULWNB+A04Ix
 b3S9Imd8xiNYyB281YPRMXj2GwlVjQpkvjYHvjgIcQLVCDdwqBnybXPIKg8AtItv1SAM
 Rao6XRYw0QHT7L9g/Sj7y1ZPf6rcaC0zLNoAmMKSbFuCwArSP22fZRhd+nta4eu7IUkz
 RKS5han/hD/LlweiCRTh1hp5kMS9nev/4TW+oLE0TTUQ5hZ7KP+a+hKGi90WJ1TfCR3z
 Vd7kxUslF1d2cTZ7YvWYZnocfktC2980TDiXNqj/HMM7fvqhzq05hLGQuHZZUeXoPlOx
 B5ug==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1754321676; x=1754926476;
 h=content-transfer-encoding:mime-version:date:message-id:subject
 :references:in-reply-to:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=PP/vyVyUPS8WNIUqsnkkJp8JWYjpnaKX98zCW9jQC04=;
 b=mTNvYX20DqaZQFuprBWrhhRkgbG2yJ5voEj1jhbnEqtWaXX8ol+ec38cMvBonsgRQ9
 gAO7FabhQasqHIkraJvLJYWmPq1Q5xLl81TsvIL3LdxfxhOlb4YEB4sO0solZyt7BmF8
 KkncExCx1cugGgQEmu+DizCcjWpnJ8g6SBNY0j4m8QQ3A+UryHSQsPRgtzOqoyCUm0U0
 29JRevYW1rxEOjVJ2HhDHVX78c9BptZGbjXTeOfga/AtEC65iGLYAvrCqRLoPUxYmTUV
 8Aq+H5V0M4ad+cW56txtbeYfxKjqfHXnOLoAj7RX3ucuQ84jPVU8oakMD4EQApsfRY+c
 sBXQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCUNz5gDttqygOkGzdJ27c34UnkItEReb8DhlJOxRKAr1SksOBISVnbYU6RPRJ/o/IO0MtBrb0l3azM=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YxcH1Y9aQfWTiUu7kMJduGGU0QjfC4uzxzvJ7J8EC8WuFnV6xp8
 YicnPeE8m7GdyIL+4Dmx/YNopVe9M0QP/l0i3St1J+AkoHcg5teQ1H+frQGA6o9ySyA=
X-Gm-Gg: ASbGncvwmzFqSdHYViIL+e6z1KSdAX/XsllGRg7y88Mtf4bxF00sqaJMeOBB2Z3c4Y0
 mijQPdaar4Wsye6xruxhHOk4jCuaqIEFSa91ur4WCWoGP27grQv+RsVK6BNWfi7RGOD2/hS6mlh
 wL0tAu99uCaD2zT24jM67v87b0GNNourqWb6myu1tu/C7LJAEb+A2cpJXyL81SZ1IRfK6EYL/kp
 iNcOXvGDkTkBRh6n9ImaEuHdUtDxZ8VFFRsZFnaKSiCa+5FBhbdCLaG27ARiYVzI4Xw1ExzCJEM
 BQRq66SRYJoECMR1FFHvs504jyhFumsN1cicRQbS+t4sD853XhMnouS40icHVrl87U/NSNF4fmD
 ULUVkNcyVJ8wlgJFxnyeNG8MKnbpwxx0gVUgXYw+46/Q=
X-Google-Smtp-Source: AGHT+IHacVKTZRSz25+eAotKNDY4IU6kgNCfyI03oFOmR+EnMi/3U/A2JXjBCEeT22ax+koIXvlpeg==
X-Received: by 2002:a05:6000:310c:b0:3b8:d22d:a8ad with SMTP id
 ffacd0b85a97d-3b8d946ad3dmr6701130f8f.3.1754321676272; 
 Mon, 04 Aug 2025 08:34:36 -0700 (PDT)
Received: from arrakeen.starnux.net ([2a01:e0a:3d9:2080:52eb:f6ff:feb3:451a])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-3b79c3bf956sm16206459f8f.24.2025.08.04.08.34.35
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 04 Aug 2025 08:34:35 -0700 (PDT)
From: Neil Armstrong <neil.armstrong@linaro.org>
To: =?utf-8?q?Guido_G=C3=BCnther?= <agx@sigxcpu.org>, 
 Purism Kernel Team <kernel@puri.sm>, Ondrej Jirman <megi@xff.cz>, 
 Jessica Zhang <jessica.zhang@oss.qualcomm.com>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
 Hugo Villeneuve <hugo@hugovil.com>
Cc: Hugo Villeneuve <hvilleneuve@dimonoff.com>, 
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org
In-Reply-To: <20250721152818.1891212-1-hugo@hugovil.com>
References: <20250721152818.1891212-1-hugo@hugovil.com>
Subject: Re: [PATCH] drm/panel: sitronix-st7703: fix typo in comments
Message-Id: <175432167542.3675907.15086744789768610853.b4-ty@linaro.org>
Date: Mon, 04 Aug 2025 17:34:35 +0200
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

Hi,

On Mon, 21 Jul 2025 11:28:15 -0400, Hugo Villeneuve wrote:
> Fix typo in comments:
>     souch -> such.
> 
> 

Thanks, Applied to https://gitlab.freedesktop.org/drm/misc/kernel.git (drm-misc-next)

[1/1] drm/panel: sitronix-st7703: fix typo in comments
      https://gitlab.freedesktop.org/drm/misc/kernel/-/commit/cf9710a0a2ed490bd3c6933ecfc22556894a1df4

-- 
Neil

