Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 0BB17BAF645
	for <lists+dri-devel@lfdr.de>; Wed, 01 Oct 2025 09:24:29 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5496210E694;
	Wed,  1 Oct 2025 07:24:27 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="BIMk7JVd";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-f47.google.com (mail-wm1-f47.google.com
 [209.85.128.47])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4574310E674
 for <dri-devel@lists.freedesktop.org>; Wed,  1 Oct 2025 07:24:26 +0000 (UTC)
Received: by mail-wm1-f47.google.com with SMTP id
 5b1f17b1804b1-46e4f2696bdso46320415e9.0
 for <dri-devel@lists.freedesktop.org>; Wed, 01 Oct 2025 00:24:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1759303465; x=1759908265; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:date:message-id:subject
 :references:in-reply-to:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=ZeCJ3SwyftHMw0airnJwEwlrbv4c6ebfFx7pe6MtVRo=;
 b=BIMk7JVdRSSYz1WkJXiAdkO3SqA8abP5XdWNrHujQ1mBCa48ucAvt+gO5PtZbUjnQQ
 8PiY3UmmUrol8Ka02TvLKtuL3aH7mutq5iC4+l0y6QeQMEGIarpGJy/vf66O11TN2lYO
 b61W5VishfvgS469rHE0cdzIF6dcLX6KOnFyfx0RBcvBj5Zp1WiC08GRUZQTjwmquv9Z
 FtndqdN9PHfUFT9is8swwmkiK6mXsMwuay8bvc7oEO6M/IpnIMqsztRD7ZFhD4H+V37y
 qFmcRkctg5bNxKXaQFmDIIXZpdrnUaT7+tLJ475igjX9hhDDCIy7KAiSsHuzc1mxttpx
 ECMg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1759303465; x=1759908265;
 h=content-transfer-encoding:mime-version:date:message-id:subject
 :references:in-reply-to:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=ZeCJ3SwyftHMw0airnJwEwlrbv4c6ebfFx7pe6MtVRo=;
 b=bPG0vUG0hrxeuKfcriILwDknPTQWAWdXknRr3eJmV3WwteMNpn0ZfbbmyjoMUC4/SI
 pT797Sv1GP0jeRef4b+nNkAY/OaicBW2Xv8h5lu/yxeUf9wNMOK0y6cdGhahIImEqzF1
 wH2yJSwzp/ZBl2Dg9QJmz99aKHGTI8cmxlk5TVe3X6K/dwWGX2WVpFBamVfbbhosV+Rx
 rDWi/NjruIznz4jxLfrwO3fxliQI9K66xcg3Ph3nrmJMxTn5jkQj67QtUOxl0XY2neP5
 O/xqESFqcJ3Fg2RvfRp/gxI7qACmnNuzSsdWnLVqCmAATypSbmC/MnrUOps/SDOBgbiy
 Curg==
X-Gm-Message-State: AOJu0Yw9JafwTRfrSPRhgNSxGPUKpLSSfTY8VbOaOWcHm/9hYqOnZY+P
 Xy56XZ6rZExipOB9t6gXhSbfD3xvpAvxYiB9VQNLYqjX+SXSJ3Ylz5VqcPylN4i50LI=
X-Gm-Gg: ASbGncv48PqmUX3g+MfaNgus3O7xYZFrE/di2XkbpjETf/GsxGY77hCNpfN6dSXMjoG
 7IJQ0oG4fXK2Rkz6UAdjhv7jvqWosLKAi+ahh/Avycpr7SQoT5MzWbvMb6d6npxOeSxnmE7/eSN
 QkhAqAj5GcpQyu/RErj/LRf51hhH3fKUE7glh8DHVojW/chIq1NkhRSxtzWZzDnBmANgLLbTpOw
 uvsVbKqTF+Pa7BH1YJev6C4BTxoztJsJDjmkWE6LWEwLpQsUs5EghUdQrDTJ3McepwJeiVTRfwO
 36dYDz0bQHiCW4gJ/QVPcDT0VsvweEDI0weLvEWJKLWCnI3w/UxR9WXpToJsHkJrr3fN2mc62kx
 zrysJoe/ri4xKesMHiEBPsrxZfmRB5r4m9SDZSAYxC5JMGXfU95bUn3C4pkbTtcgnbJc=
X-Google-Smtp-Source: AGHT+IEdl4XsbaJCInDt4HTeuo5oUgfE1ebcq3HCf1e90j8pjuSWVWqbjVTfAuHDD3TOxEbAqeiTMg==
X-Received: by 2002:a05:600c:3543:b0:45d:d68c:2a36 with SMTP id
 5b1f17b1804b1-46e61281448mr18833445e9.27.1759303464618; 
 Wed, 01 Oct 2025 00:24:24 -0700 (PDT)
Received: from arrakeen.starnux.net ([2a01:e0a:3d9:2080:8261:5fff:fe11:bdda])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-410f2007372sm25047153f8f.16.2025.10.01.00.24.23
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 01 Oct 2025 00:24:24 -0700 (PDT)
From: Neil Armstrong <neil.armstrong@linaro.org>
To: Jessica Zhang <quic_jesszhan@quicinc.com>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Svyatoslav Ryhel <clamor95@gmail.com>
Cc: dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org
In-Reply-To: <20250912064253.26346-1-clamor95@gmail.com>
References: <20250912064253.26346-1-clamor95@gmail.com>
Subject: Re: (subset) [PATCH v2 0/2] DRM: panel: add support for Sharp
 LQ079L1SX01 panel
Message-Id: <175930346392.470940.890356781501046012.b4-ty@linaro.org>
Date: Wed, 01 Oct 2025 09:24:23 +0200
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

On Fri, 12 Sep 2025 09:42:51 +0300, Svyatoslav Ryhel wrote:
> Sharp LQ079L1SX01 panel is a LCD panel working in dual video mode found in
> Xiaomi Mi Pad (A0101).
> 

Thanks, Applied to https://gitlab.freedesktop.org/drm/misc/kernel.git (drm-misc-next)

[2/2] gpu/drm: panel: Add Sharp LQ079L1SX01 panel support
      https://gitlab.freedesktop.org/drm/misc/kernel/-/commit/306e6407ed96ca3dcae5e3dbec8cf207ea33fbee

-- 
Neil

