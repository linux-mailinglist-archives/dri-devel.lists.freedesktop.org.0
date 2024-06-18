Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id F298F90CD28
	for <lists+dri-devel@lfdr.de>; Tue, 18 Jun 2024 15:07:23 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6675D10E662;
	Tue, 18 Jun 2024 13:07:21 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=freebox-fr.20230601.gappssmtp.com header.i=@freebox-fr.20230601.gappssmtp.com header.b="t7h91BQt";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-f53.google.com (mail-wm1-f53.google.com
 [209.85.128.53])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B551010E662
 for <dri-devel@lists.freedesktop.org>; Tue, 18 Jun 2024 13:07:19 +0000 (UTC)
Received: by mail-wm1-f53.google.com with SMTP id
 5b1f17b1804b1-4217926991fso48460465e9.3
 for <dri-devel@lists.freedesktop.org>; Tue, 18 Jun 2024 06:07:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=freebox-fr.20230601.gappssmtp.com; s=20230601; t=1718716037; x=1719320837;
 darn=lists.freedesktop.org; 
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=5c9cwGXYmzk+MjLggJac641vRbAprTqVR2Sr/FfwH+w=;
 b=t7h91BQtme6oZ7j3JEEG73v5MifwkmFS+YogpVI9C78kMw7g83LSUnObahT+/6OQ9i
 SaZs7wOq0wSo3S21lKc5tyxiJwkF69JjyZ0coH6mPhfsFYmInj50M7vYw7LrC6zOPA4D
 EGq9Nl3dIl6H6TR73i/JrGa1lEAnsnJ5kOj+lxiLRa6x1jBIV0a92GsuVzPcBer/XTY6
 W1SRz+wKjrzIMiY3oRTzII2BNFEwO0UrEaog7GSArTE7cAWWH3dkVNFgT2i/T9BsuIZz
 FihatW7oq83+9lOos4PA953HNYrReU2V+B08rFni3KdkSQg+7GyIAwhpngUM0F+yfHIF
 obFg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1718716037; x=1719320837;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=5c9cwGXYmzk+MjLggJac641vRbAprTqVR2Sr/FfwH+w=;
 b=t2OkOzGEpG8iZPOdiqB54Or8GUA8Aj1kUkOCaQA+UPsubx4TBEo9OzaJy+s2TCYl12
 njF2SUcWdWpIQQensZCEbJ1Z8oonBPJSNufQdY0RuUMzOoc6234LZC9csIeQs1LL32Nw
 b+kSHSMx0Phq27xUQYWM+8MpIklq9DSe8N9aQ8gUFOnsGwikAoeRS9GO9Mzw9P482fKt
 67yM6zQcG+1m/z6cZbuX6xjo8FmZCFPuNJrd5c6S3alDwsPfwe7WsZYiaMzZ1Abf9hii
 TrOD/0gSXRvd3fVKUTtTKNJbmAJUh/9NiabY1EidOqwl4V7SiuL7NiNeNlzSgsJysrnT
 ObYg==
X-Gm-Message-State: AOJu0Yyaz0yrV9rPQJbJWtRbYns7dgsrG3rc6NA0W6PMrtol95jXCMXD
 RhUiIcOXjbsScNb9zeh+N+6PYfVGOjnQ+weE7wVM8TZQPx5Gz+VOuDkDFl8I2mQ=
X-Google-Smtp-Source: AGHT+IGZrt8zhLaFKoFLKP39CJT1ArEc4bLWnDCAyL8YNI+BFQ32v1zOGDc5IH3aUK1U1RiC+jq32g==
X-Received: by 2002:a05:600c:3055:b0:421:7e0c:f876 with SMTP id
 5b1f17b1804b1-423048607a8mr87920905e9.41.1718716037340; 
 Tue, 18 Jun 2024 06:07:17 -0700 (PDT)
Received: from [192.168.108.81] (freebox.vlq16.iliad.fr. [213.36.7.13])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-422f9e2b306sm187017515e9.16.2024.06.18.06.07.16
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 18 Jun 2024 06:07:16 -0700 (PDT)
Message-ID: <fac01fa5-f257-488a-854e-716bd2634d85@freebox.fr>
Date: Tue, 18 Jun 2024 15:07:16 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 0/4] Basic support for TI TDP158
To: Andrzej Hajda <andrzej.hajda@intel.com>,
 Neil Armstrong <neil.armstrong@linaro.org>, Robert Foss <rfoss@kernel.org>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Jonas Karlman <jonas@kwiboo.se>, Jernej Skrabec <jernej.skrabec@gmail.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>,
 Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>
Cc: dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org,
 Arnaud Vrac <avrac@freebox.fr>, Pierre-Hugues Husson <phhusson@freebox.fr>,
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
References: <20240617-tdp158-v1-0-df98ef7dec6d@freebox.fr>
Content-Language: en-US
From: Marc Gonzalez <mgonzalez@freebox.fr>
In-Reply-To: <20240617-tdp158-v1-0-df98ef7dec6d@freebox.fr>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
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

On 17/06/2024 18:02, Marc Gonzalez wrote:

> Marc Gonzalez (4):
>       dt-bindings: display: simple-bridge: add ti,tdp158
>       drm: bridge: simple-bridge: use dev pointer in probe
>       drm: bridge: simple-bridge: use only devm* in probe
>       drm: bridge: simple-bridge: add tdp158 support
> 
>  .../bindings/display/bridge/simple-bridge.yaml     |  4 +
>  drivers/gpu/drm/bridge/simple-bridge.c             | 85 +++++++++++++++++-----
>  2 files changed, 71 insertions(+), 18 deletions(-)

Series has been NACKed.

Can be marked as "Rejected" in patchwork.

Please ignore.

