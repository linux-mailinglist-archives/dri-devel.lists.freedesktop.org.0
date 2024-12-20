Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E70699F90E8
	for <lists+dri-devel@lfdr.de>; Fri, 20 Dec 2024 12:08:32 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 563E210EF81;
	Fri, 20 Dec 2024 11:08:29 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="Rx+zzuvP";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-x329.google.com (mail-wm1-x329.google.com
 [IPv6:2a00:1450:4864:20::329])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E76B610E376
 for <dri-devel@lists.freedesktop.org>; Fri, 20 Dec 2024 11:08:25 +0000 (UTC)
Received: by mail-wm1-x329.google.com with SMTP id
 5b1f17b1804b1-435f8f29f8aso12890615e9.2
 for <dri-devel@lists.freedesktop.org>; Fri, 20 Dec 2024 03:08:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1734692904; x=1735297704; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:date:message-id:subject
 :references:in-reply-to:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=RRlKZM9qNPWGnJDtOfs4An0xeCPtJ9CUcGhq8wuSQ8o=;
 b=Rx+zzuvPjBVOgQKWPswFfk4XYQ1X3q6ZjTotzWLCNufEDfiKd/988/8hk0I7xLjOOl
 16yXc4vmzirUFYqRAf8nCfR7UMbpiCDjIVfubaJPZf+WZKvR8UQFU+J3fuX7PmToEdgD
 M+Idf/M2E72m8H5e9dI0Cckfh/iLApLcOpPU8KNoo/VZcP8+I2cugxBp/1+FDk9fKayF
 p+ME4FjbwtEH7JPLwuXt7F1g98Fwx1F9S8F197KeVSbEs8YeO0x9zm17QhJVX6XMClIw
 j2a3rwF+mGTjddfeyNm2STBTWw5MS+L+KGKwWeBxOB/noIfAg3z9rZ0KVap+162kJ2jQ
 czUg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1734692904; x=1735297704;
 h=content-transfer-encoding:mime-version:date:message-id:subject
 :references:in-reply-to:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=RRlKZM9qNPWGnJDtOfs4An0xeCPtJ9CUcGhq8wuSQ8o=;
 b=tVgjPeWwjLmMONOY7Wfae5bqNvDOkb2G5I4hPcJnWJ4Om9tfyUEcddfhjwoTTETaVD
 e7NdtQNxJaa7D6LvGetOF54Dbnpcmo/g4JaZV4+vZJEIXbhdp5K/J733OTeU25O5ArVD
 zaJExG7W6T2fN+NNh6mcR1LJB9+MNHB6PwO4ksGmNoo1NtPxCAucvZqBQdJWxjg3W6hh
 De+4hL/6vIMYLC5SZSJW6Eg1n5PljdRJ+tpm+VRHGqhxtC0QvagvqQnKO2pEKF0Pdy5m
 y2cv8QAV6aXnUdRdYXRZ7OCJ/akE4Tzwc5pPoX4Imzhef7Clq2SM0s9oM3CplEzinQB8
 kTLg==
X-Forwarded-Encrypted: i=1;
 AJvYcCXKsGCl45R3H+JP0HvHEjUEHKFj2ZiE3sP8uEUKdoBcBjg/miEr+5twocBsxuXXfPyhbwq/Vmf3oOY=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YwcO6wS4mcF69HSb99DOnVyCyvgKmtJ/BDTlVuebFVmfxKf6vMz
 O488DNQ40p0rAVp60XVdTWATeUVgb0p1xNqsDam21///lvY5UfKwYH8mGaKy+Lw=
X-Gm-Gg: ASbGncuWk/a0tz/QJzZCLLd/JcVulwoyC00xzvmxglUVme+FkkkPvYu4RDyZpGjFG6j
 iOiibkkc7o0K5qzT/0lJbkCX30DN/wo6jEVtYLzfTRb1KsAMl9Fi28a7pZRhOSdxUBK8LFIjd33
 pShV5b3IBX0Xkzzplm2T51Kucb4S6XtexQ6+x7VFXcgxW1ajKryz21adXzGyz83NZMhwd2nBy7X
 TbTPd9N8ZTIDfqKTaIAbNalog6brrwGiAHQjYIMKiRwU2ChXkQO3JI/npWIV/gWc8XVSLz74pjZ
 1g==
X-Google-Smtp-Source: AGHT+IGTAF/pSzj3LXM93cmPXKO8xYXLPXZ1OltvUVzzoFgW0rtLniEfWzrVq23Ex/thwwxNlcSF1w==
X-Received: by 2002:a05:600c:46ce:b0:431:55c1:f440 with SMTP id
 5b1f17b1804b1-43668b7a2cfmr21846865e9.30.1734692904262; 
 Fri, 20 Dec 2024 03:08:24 -0800 (PST)
Received: from arrakeen.starnux.net ([2a01:e0a:982:cbb0:8261:5fff:fe11:bdda])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-38a1c8474b6sm3790616f8f.51.2024.12.20.03.08.22
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 20 Dec 2024 03:08:23 -0800 (PST)
From: Neil Armstrong <neil.armstrong@linaro.org>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Jessica Zhang <quic_jesszhan@quicinc.com>, David Airlie <airlied@gmail.com>, 
 Simona Vetter <simona@ffwll.ch>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 Thierry Reding <thierry.reding@gmail.com>, Sam Ravnborg <sam@ravnborg.org>, 
 Ahmad Fatoum <a.fatoum@pengutronix.de>
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 dri-devel@lists.freedesktop.org, kernel@pengutronix.de
In-Reply-To: <20241218-topland-tian-g07017-v1-0-d5e411c199e3@pengutronix.de>
References: <20241218-topland-tian-g07017-v1-0-d5e411c199e3@pengutronix.de>
Subject: Re: [PATCH 0/3] drm: panel-simple: support TOPLAND TIAN G07017 LCD
 panel
Message-Id: <173469290291.3312755.5329965308965600351.b4-ty@linaro.org>
Date: Fri, 20 Dec 2024 12:08:22 +0100
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

On Wed, 18 Dec 2024 20:44:57 +0100, Ahmad Fatoum wrote:
> The TIAN-G07017-01 is a 7" TFT-LCD module by TOPLAND ELECTRONICS (H.K).
> The panel features 1024x600 24-bit RGB pixels driven over LVDS as well
> as a PWM backlight and I2C-connected  ft5506-compatible capacitive touch.
> 
> This series adds DT binding and Linux driver support for this panel.
> 

Thanks, Applied to https://gitlab.freedesktop.org/drm/misc/kernel.git (drm-misc-next)

[1/3] dt-bindings: vendor-prefixes: add prefix for Topland Electronics (H.K)
      https://gitlab.freedesktop.org/drm/misc/kernel/-/commit/bd2f80c16f33f5d2abde1e23bfc06dc637259a56
[2/3] dt-bindings: display: panel-simple: Document Topland TIAN-G07017-01
      https://gitlab.freedesktop.org/drm/misc/kernel/-/commit/3e743df4722c24f021143977335649a0f2e1311e
[3/3] drm: panel-simple: support TOPLAND TIAN G07017 LCD panel
      https://gitlab.freedesktop.org/drm/misc/kernel/-/commit/652be03b54e042d229fde7d086655c24b7146924

-- 
Neil

