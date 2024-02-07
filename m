Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 2C06F84C71D
	for <lists+dri-devel@lfdr.de>; Wed,  7 Feb 2024 10:19:25 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 340C710E1AF;
	Wed,  7 Feb 2024 09:19:20 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="EjUQx8ND";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-f47.google.com (mail-wm1-f47.google.com
 [209.85.128.47])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2A33D10ECD8
 for <dri-devel@lists.freedesktop.org>; Wed,  7 Feb 2024 09:19:19 +0000 (UTC)
Received: by mail-wm1-f47.google.com with SMTP id
 5b1f17b1804b1-4101d08c34cso144845e9.2
 for <dri-devel@lists.freedesktop.org>; Wed, 07 Feb 2024 01:19:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1707297557; x=1707902357; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:date:message-id:subject
 :references:in-reply-to:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=3E4sDqzii/6R8d7i8uvIM9PeK0fYlmETkH8H6KbNcjA=;
 b=EjUQx8NDJWubjVKQ1gfr0Nn2ftMfb5TZJfdEZMm3kvuVo+UGKSfbS6MjH7BwtH+8xq
 wUsuzG8BjkaTzsUCFzVkp7VUgxK1Bv11mCvaKm89M2BPubGUbCq3l2YgNuBnJypONCn8
 U9lcOY2VKimfhH4elzZG6rAIAZZ7uwJ1bhPObZCWoiuoJSLzypUXBPXb4jG6eH/0lyoB
 DbqOqxufpxNM62EM+rwLTQ57HnucZpXoloW7gdzdZAo1ntcl6UXzbYOFnypevTG7PYLC
 RQR7/SLF+UZq/pf57xMVGXZEySbPnk7xcRDjkWlWKaCXV0GidMA5owodqY4JANC5kRue
 7OxQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1707297557; x=1707902357;
 h=content-transfer-encoding:mime-version:date:message-id:subject
 :references:in-reply-to:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=3E4sDqzii/6R8d7i8uvIM9PeK0fYlmETkH8H6KbNcjA=;
 b=sRaMgf9c0lcqUG1aEAAGqm1bTUCcTzczoVbX2iPJUhppu2A0R+NeP6LFkJSnV7flFi
 Xzju6/B35b29+AB5w0GGWP654RkcOuPz1G1A+8GrjToFgvrdMN0LYoMMMhEkIEwzq5OR
 IlPxnP1dZ3YJnHMse39iw6yNHxWOJOLkMDsXkb7yxlxEB4CACL+pF7Mt1no5I9pqgxyG
 3hWI/uPEOS5bOtLdsv+jq153x6yo8PPiYCvkd+9gN61W+3MPJRo3mh56GDvoanNOMbS3
 jOfBYa0uBO/nUFBlxDriHYEihguMh6Gy3twCx7yz7Y2lzT/OlRl1rcMzGTFgD8OpFiNB
 b1ug==
X-Forwarded-Encrypted: i=1;
 AJvYcCUHojjeh2PEHNg01ignGdjcgWCauSWFMybGPrYCKb3JNqRce5KfgpNm1zUpqg4USOO2YNoXDzr+hf0qFwLG/gHUTJ5k0CqAoT72a57zt54e
X-Gm-Message-State: AOJu0Ywm6bfaoQOQZ2Ovd8k3Xk4bocZgdSr01nzAR4vljpX1Z6Rwnu1+
 PSpq07uWjWl8luNhS+3TXRAiByO26l0SUkU6RqutDCScatRXUWK/JGiJX6znIAo=
X-Google-Smtp-Source: AGHT+IGWzAsUTDmBmLWHnB0zSYQvDAlkA/M0ZyEQ9KVtZ5H+fM6jmNNCaOcPYRkzWHOKIg5Lztf8QA==
X-Received: by 2002:a05:600c:502a:b0:410:1d5f:5bc with SMTP id
 n42-20020a05600c502a00b004101d5f05bcmr7264wmr.31.1707297557602; 
 Wed, 07 Feb 2024 01:19:17 -0800 (PST)
X-Forwarded-Encrypted: i=1;
 AJvYcCUs/M/jhqlfqTPEJC9TWo03wE+lL81k14rkOIobGRfNTLxv0PThTJ+BtQKuutnm0kxgX4FMDgJQ0IHyuCD33UsPM9Qxq3PYM+rFgkZMn5IDVREVm//fUXqYkMhNkdAD4ksZyt28tJbXb5paKj0nmDdeFX26/TpWOCy4I5CQXzB3YfZr2lc2Fslb81CxPqZpznSKGYimpvNE4b5YSsZHjLOuANGREgLCvA2+iSSxVUBp4elFleBXjzGyL6u9fLlpxy2TaS0shtyXTb+nuSFh3DFWptHtXhmTt0lAaPRLR8rZNuLvTovJvFsA0gQpCu2wCrNxmiU7nsSkPyWACOR0cTLeguUzKyS9KjofmhqbOE/JW7v+5MCdsfjopyqaHPSksgho4FqUKKdxN2LFHAe9IwmSHa5paMu/Tn0WdFqQ+COOmolv3vO4qq3QnIUSdWpJCb+DjY2H3dp2Y5teYCdPA5HFlcY7I5SpT9oBajGcJZkRgWIPdfgVzEQxMXP4mgQdro4qPhxXz8aM1+09hGwofBjAg5R3KL3vdtvJqGrHWoC8bnD5eEsX0Gt7z6jxnD3EM/ZxRiOrtms/ckzwKP+WrDF3/Tji/p44zCslZeULCOJDvIjNTbUM2MT1Mv5iQRDaK0cEYJyBI7h7UJEesus=
Received: from arrakeen.starnux.net ([2a01:e0a:982:cbb0:8261:5fff:fe11:bdda])
 by smtp.gmail.com with ESMTPSA id
 r20-20020adfb1d4000000b00337d6f0013esm1003490wra.107.2024.02.07.01.19.16
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 07 Feb 2024 01:19:17 -0800 (PST)
From: Neil Armstrong <neil.armstrong@linaro.org>
To: Rob Herring <robh+dt@kernel.org>, 
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Maxime Coquelin <mcoquelin.stm32@gmail.com>, 
 Alexandre Torgue <alexandre.torgue@foss.st.com>, 
 Jessica Zhang <quic_jesszhan@quicinc.com>, Sam Ravnborg <sam@ravnborg.org>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>, 
 Raphael Gallais-Pou <raphael.gallais-pou@foss.st.com>
Cc: devicetree@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com, 
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
 dri-devel@lists.freedesktop.org
In-Reply-To: <20240205-ltdc_mp13-v1-5-116d43ebba75@foss.st.com>
References: <20240205-ltdc_mp13-v1-0-116d43ebba75@foss.st.com>
 <20240205-ltdc_mp13-v1-5-116d43ebba75@foss.st.com>
Subject: Re: [PATCH 5/5] drm/panel: simple: push blanking limit on
 RK32FN48H
Message-Id: <170729755662.1647630.425379349649657352.b4-ty@linaro.org>
Date: Wed, 07 Feb 2024 10:19:16 +0100
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.12.4
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

On Mon, 05 Feb 2024 10:26:50 +0100, Raphael Gallais-Pou wrote:
> Push horizontal front porch and vertical back porch blanking limit.
> This allows to get a 60 fps sharp.
> 
> 

Thanks, Applied to https://anongit.freedesktop.org/git/drm/drm-misc.git (drm-misc-next)

[5/5] drm/panel: simple: push blanking limit on RK32FN48H
      https://cgit.freedesktop.org/drm/drm-misc/commit/?id=c9424076d7642bf6e214eccf34904848c8b53515

-- 
Neil

