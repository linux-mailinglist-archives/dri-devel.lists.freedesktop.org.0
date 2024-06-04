Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 662B48FB427
	for <lists+dri-devel@lfdr.de>; Tue,  4 Jun 2024 15:44:32 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3400510E48B;
	Tue,  4 Jun 2024 13:44:30 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="s65NGHku";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-f42.google.com (mail-lf1-f42.google.com
 [209.85.167.42])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 15D4210E48B
 for <dri-devel@lists.freedesktop.org>; Tue,  4 Jun 2024 13:44:29 +0000 (UTC)
Received: by mail-lf1-f42.google.com with SMTP id
 2adb3069b0e04-52b87e8ba1eso5830971e87.3
 for <dri-devel@lists.freedesktop.org>; Tue, 04 Jun 2024 06:44:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1717508667; x=1718113467; darn=lists.freedesktop.org;
 h=in-reply-to:content-transfer-encoding:content-disposition
 :mime-version:references:message-id:subject:cc:to:from:date:from:to
 :cc:subject:date:message-id:reply-to;
 bh=gXPZsC/Zt7fU/Whsjt7Ixqr0Q1zSlZNphtmL5xPMdKg=;
 b=s65NGHkuoR2FGHrS1BfhwJ0xwmET9TeFV+NfsedKV5dTIU7QB3DAv7ahbTi8fRpzxD
 Vj351DwJAoYxyqSAwh4X84ZydwqFoFF1xJIdLJ3MvsCWT/UUamOsOYRppGuQqzuj/9ew
 Bc+j1sziV4zka5mefRXEL5ms/OQZtEgyoYet18yD729XWwbfTkdyjvv3z7NC3pRkUl0n
 fGJRdiogL9jrjAxy8XzHCFQRx/KDMZWsFTw5HBkbyUmZH6EdcXzA1pclhUXPH+omZ5Bg
 BAu6+sBxodb4uUqWjCEWzg9QXMauviRbhZirxHd57aItejvevX9QaK/OBsT8CAHUBgtE
 B58A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1717508667; x=1718113467;
 h=in-reply-to:content-transfer-encoding:content-disposition
 :mime-version:references:message-id:subject:cc:to:from:date
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=gXPZsC/Zt7fU/Whsjt7Ixqr0Q1zSlZNphtmL5xPMdKg=;
 b=weaa00ydusiDyL/FqvKKQB1HXgOMOHiFHgf+hCbQdwo0pdSiScWtYyk+ZmzDZPOCQ6
 nLX8lTFx42CxeqxfM4t8arJIV7bUWjJzwkAM/fopV3Et38Q0JztKp+NZTIY+fNffWAaa
 w8vAyBr0oIs6XWzpZoYikXuizpPmb2QO1ne8fD0IaOOZxrknkK69OWvIWFlZ1ZKcVrV4
 idRGeIwKHbOE4818lpRBxEpmBfWIidN/2isEdoLGGPosaN0RkEXInB/t44MGRpNi+c2p
 4k4+BeFnmO0x654A19ff3nsLsqjaYz8wpBypTQaoP53mqF0BVBMZ4P21USCnCywb8sA9
 bN9g==
X-Forwarded-Encrypted: i=1;
 AJvYcCUiMGG/IxHLfjf1RreQMS5aeoPZnnXMp5xOrXvtpP/OmI7Ainj3HIEgaj7hJQlVfxNP6n++WGPW2aASnpjGGfUfhVskrOr8b0B9HBsz5R+c
X-Gm-Message-State: AOJu0Yxn2X8Wfu1zr69K2oegAhFLfjLxdOQWUuPeiqYIweyszXc5IwuY
 A0ucat2JVUlSvsIk2am4y5jWsVn5R0LmDaBPU8q5P3AcpbODoWedmPhm89b45OU=
X-Google-Smtp-Source: AGHT+IFjdDAasq2jJous5ofmbY6kDP9p2KSr9f2oZG4CUsK3cc1cYhrCYj1n8+p3q7ghwpMRb0/X+Q==
X-Received: by 2002:ac2:4822:0:b0:51a:d08d:bab4 with SMTP id
 2adb3069b0e04-52b896bea15mr9359093e87.55.1717508666890; 
 Tue, 04 Jun 2024 06:44:26 -0700 (PDT)
Received: from eriador.lumag.spb.ru
 (dzdbxzyyyyyyyyyyyykxt-3.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::227])
 by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-52b9ae898d1sm568437e87.246.2024.06.04.06.44.26
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 04 Jun 2024 06:44:26 -0700 (PDT)
Date: Tue, 4 Jun 2024 16:44:24 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: noralf@tronnes.org
Cc: Neil Armstrong <neil.armstrong@linaro.org>, 
 Jessica Zhang <quic_jesszhan@quicinc.com>, Sam Ravnborg <sam@ravnborg.org>, 
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, 
 Thomas Zimmermann <tzimmermann@suse.de>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Conor Dooley <conor+dt@kernel.org>, 
 David Lechner <david@lechnology.com>, dri-devel@lists.freedesktop.org,
 devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, Kamlesh Gurudasani <kamlesh.gurudasani@gmail.com>,
 Tommaso Merciai <tommaso.merciai@amarulasolutions.com>
Subject: Re: [PATCH v4 4/5] drm/mipi-dbi: Add support for DRM_FORMAT_RGB888
Message-ID: <ngney3w6vrnnfcpbq64d5pffc7zjw6hobu7fhmsqoke2zuq5tm@kdwfe3rwqjwq>
References: <20240604-panel-mipi-dbi-rgb666-v4-0-d7c2bcb9b78d@tronnes.org>
 <20240604-panel-mipi-dbi-rgb666-v4-4-d7c2bcb9b78d@tronnes.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20240604-panel-mipi-dbi-rgb666-v4-4-d7c2bcb9b78d@tronnes.org>
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

On Tue, Jun 04, 2024 at 03:20:31PM +0200, Noralf Trønnes via B4 Relay wrote:
> From: Noralf Trønnes <noralf@tronnes.org>
> 
> DRM_FORMAT_RGB888 is 24 bits per pixel and it would be natural to send it
> on the SPI bus using a 24 bits per word transfer. The problem with this
> is that not all SPI controllers support 24 bpw.
> 
> Since DRM_FORMAT_RGB888 is stored in memory as little endian and the SPI
> bus is big endian we use 8 bpw to always get the same pixel format on the
> bus: b8g8r8.
> 
> The MIPI DCS specification lists the standard commands that can be sent
> over the MIPI DBI interface. The set_address_mode (36h) command has one
> bit in the parameter that controls RGB/BGR order. This means that the
> controller can be configured to receive the pixel as BGR.
> 
> RGB888 is rarely supported on these controllers but RGB666 is very common.
> All datasheets I have seen do at least support the pixel format option
> where each color is sent as one byte and the 6 MSB's are used.
> 
> All this put together means that we can send each pixel as b8g8r8 and an
> RGB666 capable controller sees this as b6x2g6x2r6x2.
> 
> v4:
> - s/emulation_format/pixel_format/ (Dmitry)
> 
> Signed-off-by: Noralf Trønnes <noralf@tronnes.org>
> ---
>  drivers/gpu/drm/drm_mipi_dbi.c | 29 +++++++++++++++++++++++++----
>  include/drm/drm_mipi_dbi.h     |  5 +++++
>  2 files changed, 30 insertions(+), 4 deletions(-)
> 

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>


-- 
With best wishes
Dmitry
