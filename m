Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A547E8921BC
	for <lists+dri-devel@lfdr.de>; Fri, 29 Mar 2024 17:39:10 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CF9AE10E05D;
	Fri, 29 Mar 2024 16:39:07 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="BlwRgPGI";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-f54.google.com (mail-wm1-f54.google.com
 [209.85.128.54])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3088310E05D
 for <dri-devel@lists.freedesktop.org>; Fri, 29 Mar 2024 16:39:02 +0000 (UTC)
Received: by mail-wm1-f54.google.com with SMTP id
 5b1f17b1804b1-41551500a7eso3671715e9.2
 for <dri-devel@lists.freedesktop.org>; Fri, 29 Mar 2024 09:39:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1711730279; x=1712335079; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:date:message-id:subject
 :references:in-reply-to:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=UwLmF2g9SeFgO0qE9J71WGfItvHTsnplXOGpXDPoZl0=;
 b=BlwRgPGIJGTxz+AnnIZzLlbc2ZTVy+GYcxz7GCQJtJEBFYVHWY6iTIs+d7B+pJpoov
 zGkYEZV80mlB1Vw0P3JsAW4bbPxYNktNLEFKPg8gnOCRbn6KT4yJmsJAsWq1hF8hMIkb
 FD5VTCNnSpqO8Qp4Sy+UcV/T9qKjSlnCJAuPzmDwWkWWZ24Ok9vduCm4RH0Av5vMquDP
 1VyAj+5X2ls4l8Ko1NgMl2fMH+cpDoLBm2tnwAwhPpmugjju7VZOPh8zXJiLS2Uy4mjo
 aH4vhp0QD68Cga+ZP2o8rDQ1orjCe3rzZEpn1je9Kk5GSKRg0jOeipS42mk9b7G0ua82
 db9A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1711730279; x=1712335079;
 h=content-transfer-encoding:mime-version:date:message-id:subject
 :references:in-reply-to:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=UwLmF2g9SeFgO0qE9J71WGfItvHTsnplXOGpXDPoZl0=;
 b=BWIkJ+eRX2AmkmxxIrxTWZ34zr6+x6hoHNgxRuWZTkLXXXUNJiLeFQ2j25aEAjfUlw
 HME21UZuST5F0Y5gSue6EEbB7Ukpbi49Nn4mjZo+R15/WBGX1luqFBnSgnEMwTmtsHJQ
 DwBPSaGv+7TIenXqzHMsZHeQFNT3oLzPqYNLIrz7hUO8ToCZ9qiYnFyEvXkuYN++1etr
 lmp4YRVcBkvpBhh0t6cDfwA8NhbFIFtCcxqjNAH0DI5WeqVLcyacB/NZWJSA3nuuyWqi
 S6+3xgEgLxGq27hOzFDbyDQUPqb3FkeHYOGwOtlaS6XkoU/MAmEOS9VC8IyCBMBTklIa
 u8VQ==
X-Gm-Message-State: AOJu0Ywosh74TO0isG4Zf+JxHNoMVbaLwe8JI4lKEC9Z/kHaJv255YAw
 STtF2f+z4XYIhb3AsgOCQnHaU1U82Hcj/oWkgdtLsZk8+cfZpuE5dQ6Y34GwFGk=
X-Google-Smtp-Source: AGHT+IFxR9kCg8wK1tdVBWU2BipcSmXFIAMRH1mlDRbii8iRl38mOAwB9CBqVsbED9XR994yGHrUNw==
X-Received: by 2002:a05:600c:4f0c:b0:414:85f:1f72 with SMTP id
 l12-20020a05600c4f0c00b00414085f1f72mr1763054wmq.6.1711730279018; 
 Fri, 29 Mar 2024 09:37:59 -0700 (PDT)
Received: from arrakeen.starnux.net ([2a01:e0a:982:cbb0:52eb:f6ff:feb3:451a])
 by smtp.gmail.com with ESMTPSA id
 m4-20020a05600c4f4400b004146bcdde06sm5958736wmq.6.2024.03.29.09.37.58
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 29 Mar 2024 09:37:58 -0700 (PDT)
From: Neil Armstrong <neil.armstrong@linaro.org>
To: linux-rockchip@lists.infradead.org, Chris Morgan <macroalpha82@gmail.com>
Cc: dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org, 
 daniel@ffwll.ch, airlied@gmail.com, sam@ravnborg.org, 
 quic_jesszhan@quicinc.com, megi@xff.cz, kernel@puri.sm, agx@sigxcpu.org, 
 heiko@sntech.de, conor+dt@kernel.org, krzysztof.kozlowski+dt@linaro.org, 
 robh@kernel.org, Chris Morgan <macromorgan@hotmail.com>
In-Reply-To: <20240325134959.11807-1-macroalpha82@gmail.com>
References: <20240325134959.11807-1-macroalpha82@gmail.com>
Subject: Re: (subset) [PATCH 0/5] Add Support for RK3326 GameForce Chi
Message-Id: <171173027816.1500306.363820748335291439.b4-ty@linaro.org>
Date: Fri, 29 Mar 2024 17:37:58 +0100
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

On Mon, 25 Mar 2024 08:49:54 -0500, Chris Morgan wrote:
> From: Chris Morgan <macromorgan@hotmail.com>
> 
> Add support for the GameForce Chi [1].
> 
> The GameForce Chi has the following hardware:
> Tested:
>  - 3.5" dual lane 640x480 DSI display.
>  - 15 GPIO based face buttons.
>  - 2 ADC based face buttons.
>  - 1 ADC joystick (left) connected to internal SARADC.
>  - RGB LED arrays for key backlighting
>  - Dual internal speakers.
>  - Realtek RTL8723BS SDIO WiFi.
>  - Single SDMMC slot.
> 
> [...]

Thanks, Applied to https://gitlab.freedesktop.org/drm/misc/kernel.git (drm-misc-next)

[1/5] dt-bindings: vendor-prefix: Add prefix for GameForce
      https://gitlab.freedesktop.org/drm/misc/kernel/-/commit/59237fc04ee1c4cdf62ad5dba18244713970e36f
[2/5] dt-bindings: display: Add GameForce Chi Panel
      https://gitlab.freedesktop.org/drm/misc/kernel/-/commit/387974a21a63b1c7efcbc19c48b9930f6ef5ac63
[3/5] drm/panel: st7703: Add GameForce Chi Panel Support
      https://gitlab.freedesktop.org/drm/misc/kernel/-/commit/4c4f33be7e4d476566246e7166c54ef175287e00

-- 
Neil

