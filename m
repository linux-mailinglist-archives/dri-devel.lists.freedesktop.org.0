Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id ACB25C1D591
	for <lists+dri-devel@lfdr.de>; Wed, 29 Oct 2025 22:05:54 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1804B10E851;
	Wed, 29 Oct 2025 21:05:49 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="CEEz1dh8";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-f45.google.com (mail-wr1-f45.google.com
 [209.85.221.45])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 85DD910E850
 for <dri-devel@lists.freedesktop.org>; Wed, 29 Oct 2025 21:05:40 +0000 (UTC)
Received: by mail-wr1-f45.google.com with SMTP id
 ffacd0b85a97d-3ed20bdfdffso259153f8f.2
 for <dri-devel@lists.freedesktop.org>; Wed, 29 Oct 2025 14:05:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1761771939; x=1762376739; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:date:message-id:subject
 :references:in-reply-to:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=XTofcu4fJBU+wnClkDXXNYpcQQPdGA2T8MS/AzVhf3s=;
 b=CEEz1dh8PpO9Wsy2vftTUaabTVvI0o3Ckneya6fRyKHRI0HFSP6Yonz0cw26qdM9KR
 LB7rSGg5JmeJBNJIhsg8k9uT5ZNk5FExx810FHg/EdF0oX/d0uA1B0eLpddvw0ENLfLF
 Faq7jhL8h8T1R9AWCGPwa/3cmgHuovjhxgPFEKM3M6+45PEKb0tue7Vetk0CiRx2hkZT
 SxuKL/Rp8DS6j5CB36ZVbNa2MaXarqy8DBEQk+4OowjshdQXPRPZuILT9pFSL4GaLHjl
 QlpEJ6yek1pBWa0vLv5ZRimO9mT+klkE5ji0gR7Q+WCsYzsXrllyG9ejhg0id8FceLzv
 SLJQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1761771939; x=1762376739;
 h=content-transfer-encoding:mime-version:date:message-id:subject
 :references:in-reply-to:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=XTofcu4fJBU+wnClkDXXNYpcQQPdGA2T8MS/AzVhf3s=;
 b=dAhmz5AEiprW26WR9Zst3OKoOs22Klp1pzamW56HoykH+uZ76Pnb/RzO61Q2/O4oPN
 yk1BinfhTU7eJJp+QLlYN9dARYbkaKnOkt2ZXmtGuSaZ32eKfZcBcOLEGPKFRuknMGPl
 vYJ3gvzx/wNbm+mnCubP4AKtU0MMxbyRq6+q4Vc4sZXxsblAAgeCFkQfzE2pMIxYi0zD
 wOKkLpfSHUre1RtOW9unagcV7Tb/pWLyAOObYLSbkrOwfQUM0VbEs1QAiTZypv4mYC8v
 a/o7BjkJGFEbEd2kwusks0rnNj/EDtZrA8dSrknjFIGURi5PAaMHYextFAGUvHBkkxX6
 uCgQ==
X-Gm-Message-State: AOJu0YzC0VSPho0gWBfTw2KyUeWtu5ip2NKJy0s3nvZDch70gAS563Qo
 yyTaZ15FjrgzniotrRd3Z7/ttrfPKJgE5X0wxLRd/OnYJIfikMmFBlvwX8wDCs53ea8=
X-Gm-Gg: ASbGncuz6DKssFNQI5ybNELl8byOVMb4Uo5W4KjbxdENTb+VD0AF1Un1NyYrkKFEJZ6
 IOLxzTSKywrrlWIpae/ZS0MoR4x+8YNK9mlsm6Q5aSDOL6SdmJYhL9rSP2x12m2hkknHDnEVOuf
 wlDBxCAvNV9AZk35gYNKu8Wx1Fm005vxwsAyv9dUQARP+boPkblVc6zkz22a2T4r9I1dTUdhx+f
 q8kA8rwTVs+fQ7PDIGVehYe6o73MinTAbtE8qMFnmWe9+/Ju2BMDan6zHjlTEn3NLGQKR97ASfx
 VOvdAL3Yhj/0qhpgpHuDxSXX2YoSkhlPrTBDYo5fJhX+f1TOk16+nyZdCKBqH+mHJ+1iprEEp5O
 vmcGvD/jLcDRqCfSEqOvwfFxsqNE/EtedgCyvNi6xZAf1mTZpadannjfnypS2yqrlYz/5wcmYL9
 bVLYyLKCTrs0lF+BEMYZ4G+fL06JcWcj4=
X-Google-Smtp-Source: AGHT+IEXesMK4yi3aw7WNkX0LUl8o2qwDZkqC9YReAIB/Znsz0lE3UE+zV3f3Lh5yILl8ityWjzuTw==
X-Received: by 2002:a05:6000:24c1:b0:427:492:79cd with SMTP id
 ffacd0b85a97d-429aefd6a64mr3010887f8f.41.1761771938978; 
 Wed, 29 Oct 2025 14:05:38 -0700 (PDT)
Received: from arrakeen.starnux.net ([2a01:e0a:3d9:2080:52eb:f6ff:feb3:451a])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-429952de971sm27815109f8f.39.2025.10.29.14.05.38
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 29 Oct 2025 14:05:38 -0700 (PDT)
From: Neil Armstrong <neil.armstrong@linaro.org>
To: Jessica Zhang <jesszhan0024@gmail.com>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Douglas Anderson <dianders@chromium.org>, Abel Vesa <abel.vesa@linaro.org>
Cc: dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org
In-Reply-To: <20251028-drm-panel-samsung-add-atna60cl08-v1-1-73123789fcdb@linaro.org>
References: <20251028-drm-panel-samsung-add-atna60cl08-v1-1-73123789fcdb@linaro.org>
Subject: Re: [PATCH] dt-bindings: display: panel: samsung,atna33xc20:
 Document ATNA60CL08
Message-Id: <176177193834.2073083.4758126268960108187.b4-ty@linaro.org>
Date: Wed, 29 Oct 2025 22:05:38 +0100
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.14.3
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

On Tue, 28 Oct 2025 14:22:48 +0200, Abel Vesa wrote:
> The Samsung ATNA40CT06 panel is a 16" AMOLED eDP panel. It is similar to
> the ATNA33XC20 except that it is larger and has a different resolution.
> It is found on Qualcomm Glymur CRD platform.
> 
> Raw panel edid:
> 
> 00 ff ff ff ff ff ff 00 4c 83 a6 41 00 00 00 00
> 00 20 01 04 b5 22 16 78 03 0b d1 af 51 3d b6 23
> 0b 50 54 00 00 00 01 01 01 01 01 01 01 01 01 01
> 01 01 01 01 01 01 cb fe 40 64 b0 08 18 70 20 08
> 88 00 58 d7 10 00 00 1b cb fe 40 64 b0 08 c8 7a
> 20 08 88 00 58 d7 10 00 00 1b 00 00 00 fd 00 30
> 78 da da 42 01 00 00 00 00 00 00 00 00 00 00 02
> 00 00 00 00 19 96 c8 46 1c 5e c8 00 00 00 01 4c
> 
> [...]

Thanks, Applied to https://gitlab.freedesktop.org/drm/misc/kernel.git (drm-misc-next)

[1/1] dt-bindings: display: panel: samsung,atna33xc20: Document ATNA60CL08
      https://gitlab.freedesktop.org/drm/misc/kernel/-/commit/2a6550191adfa20c6f63044531fe21202cfa03e0

-- 
Neil

