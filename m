Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id CC6AFB1A60C
	for <lists+dri-devel@lfdr.de>; Mon,  4 Aug 2025 17:33:16 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A45A610E572;
	Mon,  4 Aug 2025 15:33:00 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="J6vIIMC+";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-f46.google.com (mail-wr1-f46.google.com
 [209.85.221.46])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 65E4010E572
 for <dri-devel@lists.freedesktop.org>; Mon,  4 Aug 2025 15:32:59 +0000 (UTC)
Received: by mail-wr1-f46.google.com with SMTP id
 ffacd0b85a97d-3b788feab29so2431302f8f.2
 for <dri-devel@lists.freedesktop.org>; Mon, 04 Aug 2025 08:32:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1754321578; x=1754926378; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:date:message-id:subject
 :references:in-reply-to:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=+wO1zoAKHaQSzcjVJ3GnxsXBacl0eggix/R4YBPDlPI=;
 b=J6vIIMC+1SVAVek/TKuKJx3pNw18+pSRLsuGPQPuOA4S9EdFEd5DueviB8G80GKW06
 TfiXmtrvFC/OAOyhFe2IVu2vQnQDY9H9KIM1uL3Jr/NNDYKiX8NzKEuv0l/JloibsxTH
 2x8DHmpaA6Tzl9mmcVMZQNJe0X0DCsdwy4OrgpeMRK1hGGEhlW+nvnOGChn8g4yKnps9
 StH/bWRgz5oW5mx1fWqQeJYNNMdi7EGOTn/1SHa1GuRRL3DBuS2Z2hSUvrbXKlHt7aHI
 et5z1odEXWQNS/nVxvFB9lrhLtkxbNEmg+cUrFdqjaFqaHeavvI6R9GD2ZkYUpfnpsvu
 tCeA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1754321578; x=1754926378;
 h=content-transfer-encoding:mime-version:date:message-id:subject
 :references:in-reply-to:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=+wO1zoAKHaQSzcjVJ3GnxsXBacl0eggix/R4YBPDlPI=;
 b=jslA/QK8sPSxdZCcqtslgtt+Z0a8JejtlRds2TimmxdzAoTpsVGqpUNL8Qo7wYMAsz
 Q0bIqCUE7O5CYrqG0qE9hWoryr1BqRK4rPmelDmgjuHP91f5B5bJB34OsHkNiGQuSnab
 +/kG0bH+mG9pm0s6xRJmtIAjJ9rq7dOXARaCB1aPhkJpAlY7ggd1AmBW+7Pl4BV8gwE0
 /Ehn/61cph1U/bOH3Bnxzn2JnCfKndjdxi/ZxXwfKfZtyx+VcIFdJLuXXPQX2O9IcFPY
 DtC3aexJZ/qheDjRWvyv6uS1ZGHFPAnLC6u3VLhdYiNCKZZ+Zzp+Zn6XXCYwYg92VRaG
 n6BA==
X-Gm-Message-State: AOJu0Yxh35/N+vepjuJhSY2F2wz7B3iWm+aEPI0DFlUZhj2ekwoF5jV7
 uPj8XJ9gIGf8iaa1q+TdZY3g9uOldfwOiIE6dVDyf9gmk9xFtXtx0XUupE9lttLIMPI=
X-Gm-Gg: ASbGncuOZwbry1mA4lTKu8KW29218mwUCLwpbSFI9zM4LwtOk0EFxsg3mnQk+LXaZUD
 tRTNK5P/f2WbD8VGoAO0M0HbPPPBSq3X5IizJQl46iaob8t/q8NreXqi4hSx/Eoc7LY0NkIo5nE
 7U6F1Zdt9qJWeEY2GkhJPZ2403haYdCd4R4uyNiRGBRLphul+o2hrN9x4jp6TF0ZB30wN3ZtRSO
 Bu90N5Lqw/Ao0+rVzxNp0AFzqAUoCzsI03YkasusmyAjUSva4UG9GpVqpLAa0OSWkJGNT8c1Bfn
 8Yb66GCztNLgNESWLwBvB5ujNt902c8mV2UzBFL9V5j/rIvEN/0Ez1rhQwk7b5a7H8QNxoHUkAE
 knmewZbtxE4iPLMiuM75wRXp1ogtl5u7+nHZo5gDfo3c=
X-Google-Smtp-Source: AGHT+IGzYJXMN+QHfXX3SrTuT/OBzGP+W/AdGblgpQIkiy+BxQ+LG4rjRGI4C2pPJoNlunoLVYq/Aw==
X-Received: by 2002:a05:6000:2c11:b0:3b7:78c8:937f with SMTP id
 ffacd0b85a97d-3b8d94720d1mr7189113f8f.20.1754321577802; 
 Mon, 04 Aug 2025 08:32:57 -0700 (PDT)
Received: from arrakeen.starnux.net ([2a01:e0a:3d9:2080:52eb:f6ff:feb3:451a])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-3b79c47ca5fsm15664010f8f.63.2025.08.04.08.32.56
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 04 Aug 2025 08:32:57 -0700 (PDT)
From: Neil Armstrong <neil.armstrong@linaro.org>
To: dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, Paul Kocialkowski <paulk@sys-base.io>
Cc: Jessica Zhang <quic_jesszhan@quicinc.com>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Thierry Reding <thierry.reding@gmail.com>, Sam Ravnborg <sam@ravnborg.org>
In-Reply-To: <20250702082230.1291953-1-paulk@sys-base.io>
References: <20250702082230.1291953-1-paulk@sys-base.io>
Subject: Re: [PATCH v2 1/2] dt-bindings: display: simple: Add Olimex
 LCD-OLinuXino-5CTS
Message-Id: <175432157672.3671011.14707033702603455664.b4-ty@linaro.org>
Date: Mon, 04 Aug 2025 17:32:56 +0200
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

On Wed, 02 Jul 2025 10:22:29 +0200, Paul Kocialkowski wrote:
> Add the Olimex LCD-OLinuXino-5CTS, a 5-inch TFT LCD panel.
> 
> 

Thanks, Applied to https://gitlab.freedesktop.org/drm/misc/kernel.git (drm-misc-next)

[1/2] dt-bindings: display: simple: Add Olimex LCD-OLinuXino-5CTS
      https://gitlab.freedesktop.org/drm/misc/kernel/-/commit/1da71a08080bb5cf5601f237e94c3dd5cede446b
[2/2] drm/panel: simple: Add Olimex LCD-OLinuXino-5CTS support
      https://gitlab.freedesktop.org/drm/misc/kernel/-/commit/26232780077b3e6147fabb6111afd0bd9a60f973

-- 
Neil

