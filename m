Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 19C15AAFFCA
	for <lists+dri-devel@lfdr.de>; Thu,  8 May 2025 18:00:18 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 11BEA10E1F8;
	Thu,  8 May 2025 16:00:12 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="BbZ600/1";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-f46.google.com (mail-wm1-f46.google.com
 [209.85.128.46])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 06FEB10E1F8
 for <dri-devel@lists.freedesktop.org>; Thu,  8 May 2025 16:00:04 +0000 (UTC)
Received: by mail-wm1-f46.google.com with SMTP id
 5b1f17b1804b1-441c99459e9so8225025e9.3
 for <dri-devel@lists.freedesktop.org>; Thu, 08 May 2025 09:00:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1746720003; x=1747324803; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:date:message-id:subject
 :references:in-reply-to:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=Lto75e4LcteqoafW12Fg61u3EViZNOc4137QZAwHJ4Q=;
 b=BbZ600/1Es3VujtRia0kyi5sCL9KWyZQxPln2Mfo7IJDCG8M70XSae4jA17HopBkci
 akUFD4n3v8rI2DL7r4mvIKjFeYzP89tgJpzMVzEDBT7R7SV9TjqYptoYy0mBQcNidlJS
 3k9hw8kTkMwQE2cVPAhWBZ2cDJknoBjW3HArpwAndTzRBaeYdUyLC7C3URb9tmXiJi8I
 lr/EYxmuMtnVsvYcNN6uoZAlVlu9Z2UCl1j/PslzxbdsAhxeUM5ivrxCTAcK5T2FPUkx
 nHmVSo619pKxO6t9HXo8dLXwC34lN94DW9Aa//1Wy4F2yj0PbzAGBuJZreNuQtSap7GJ
 gslA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1746720003; x=1747324803;
 h=content-transfer-encoding:mime-version:date:message-id:subject
 :references:in-reply-to:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=Lto75e4LcteqoafW12Fg61u3EViZNOc4137QZAwHJ4Q=;
 b=p9qt7kzd37W7PeMs+uGwKsVxOvBscIkS3ssAA3uhc9nxMX9NtktnK+p/mIRXNTXMGY
 oDtc3kigspOwXLYsIQY4ska2inaQsa/4k+5A8P6MiU8NDcrHKsOorfSBQGjx46WYvEOz
 10pCp+vjLlY/yqbqbnPJ0QU2drhVp0TvgdB6FSLn61aUTgqZTJmlWOpjra1j4uswJ2a4
 iSXDK1WFKBGrc6zH6OWnIg9yxhQXgHTyDlI/IktSBNCqYjadlZjC31yC5kbrxjBKLFJ+
 1jumBywq+/GyMFlbAQD1LLEIAFNvbvib/bVDymRwX28jNMW2GxWbyPzfB2XLLqSURKj2
 bhYA==
X-Gm-Message-State: AOJu0YyhhcqIrbbrLhzWklEMPSmNDlDNa/K47tEsF2IjIuucLT69p8vB
 JMDZKaO8pRC2kPYZ9tCdePo+KP2kWaB98iPNKegxxxJInN57iLAii7mvaF8ksoE=
X-Gm-Gg: ASbGncter6le9m+nFeinJH5BVSSgO1zRrREyLWIhYDl4ARyQHXIywGTzUzQteyoXgoj
 8S6pcR5cqQ8/GmddrBXqyMHX6Bnaz+t9oCsBJ2w09HbYE1A2JX7oGdA5Qsml3JQnYiSfoIPDmb7
 bzp4yrdo9XptbTJfwOf7Mi+B7c+QyN3NzHSJ7wLJ9sABj7pS7n6LfDMHwBt78glYg5g4iU5OIEi
 w0M3+kwa/SUPBnO2LvXkJUM/GH7ermHejlBsAvoU+i12Ykvm17zEm5n/5NHuJP5GPdRU/mWJtK/
 YQt4P3X3jcrcy9TrFLtZLXhJEck8doiTUtAduNe0WF1V30ZYVcwSFWYOCdfx2A==
X-Google-Smtp-Source: AGHT+IHGh7pry40R1R5S0vzwYBv9QiYLXrctllxajG/Law1YVfbMcDbFKmJfKNCqz30hlRaA+hAD2w==
X-Received: by 2002:a05:600c:a413:b0:43d:49eb:963f with SMTP id
 5b1f17b1804b1-441d44dd4a6mr61912635e9.24.1746720002650; 
 Thu, 08 May 2025 09:00:02 -0700 (PDT)
Received: from arrakeen.starnux.net ([2a01:e0a:3d9:2080:8261:5fff:fe11:bdda])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-442d676ef1csm43535e9.0.2025.05.08.09.00.01
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 08 May 2025 09:00:02 -0700 (PDT)
From: Neil Armstrong <neil.armstrong@linaro.org>
To: Krzysztof Kozlowski <krzk@kernel.org>, 
 Jessica Zhang <quic_jesszhan@quicinc.com>, David Airlie <airlied@gmail.com>, 
 Simona Vetter <simona@ffwll.ch>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 Rob Herring <robh@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Cc: dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, Linus Walleij <linus.walleij@linaro.org>
In-Reply-To: <20250508-sm8750-display-panel-v2-0-3ca072e3d1fa@linaro.org>
References: <20250508-sm8750-display-panel-v2-0-3ca072e3d1fa@linaro.org>
Subject: Re: [PATCH v2 0/2] drm/panel: Add Novatek NT37801 panel driver
Message-Id: <174672000196.3610792.15233043209666142507.b4-ty@linaro.org>
Date: Thu, 08 May 2025 18:00:01 +0200
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

On Thu, 08 May 2025 16:34:46 +0200, Krzysztof Kozlowski wrote:
> Changes in v2:
> - Use devm_drm_panel_alloc (Neil)
> - Add novatek_nt37801_switch_page (Linus)
> - Add Rb tags
> - Link to v1: https://lore.kernel.org/r/20250505-sm8750-display-panel-v1-0-e5b5398482cc@linaro.org
> 
> Add driver for the Novatek NT37801 or NT37810 AMOLED DSI panel, used on
> Qualcomm MTP8750 board (SM8750).
> 
> [...]

Thanks, Applied to https://gitlab.freedesktop.org/drm/misc/kernel.git (drm-misc-next)

[1/2] dt-bindings: display: panel: Add Novatek NT37801
      https://gitlab.freedesktop.org/drm/misc/kernel/-/commit/0311e0fd07919b4b8ea651a632eedb0e3f9f540c
[2/2] drm/panel: Add Novatek NT37801 panel driver
      https://gitlab.freedesktop.org/drm/misc/kernel/-/commit/4fca6849864d78e55f005115c143257e6566c89c

-- 
Neil

