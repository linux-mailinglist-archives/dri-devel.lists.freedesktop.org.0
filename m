Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 92BF89F086D
	for <lists+dri-devel@lfdr.de>; Fri, 13 Dec 2024 10:50:27 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 09A0310E259;
	Fri, 13 Dec 2024 09:50:26 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="JEWBeCg9";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-x333.google.com (mail-wm1-x333.google.com
 [IPv6:2a00:1450:4864:20::333])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3DE4C10E259
 for <dri-devel@lists.freedesktop.org>; Fri, 13 Dec 2024 09:50:24 +0000 (UTC)
Received: by mail-wm1-x333.google.com with SMTP id
 5b1f17b1804b1-436249df846so10704595e9.3
 for <dri-devel@lists.freedesktop.org>; Fri, 13 Dec 2024 01:50:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1734083423; x=1734688223; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:date:message-id:subject
 :references:in-reply-to:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=2BrG/YdfyMfJSbNwPUyHp+NyjkXJ3CoxC8wyqAirNVg=;
 b=JEWBeCg9IasnwgpxHx+ccswTpLn1d/l4IYyhv32/zQQVYKWJkNAA3DvdvYraezZmhW
 7ZrQdM+phaO38NPqtgNS132I8nousmwchyEB+kl2LMOrs8N0zIOoxiih1EJsJtW2qIoy
 J40cAuNsveUgSrb9/VTZM92HkgoBlg59yiVbaDLxp9WHVBEM9Dnqgu7woeA4vWN6o9Xy
 LaxmMihAeNjoQt5dIhU1v6HKzsQAwaoOWTOg3XQH1XreoT56DbWymzRT3vO9ulmo0tlX
 ahY0rjkCFV7NdjuB7xRj8rOBZA7sIFdakymdUlTPuLcvh0RlAgfuFuLKyRGGXrSCO5I+
 8XYg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1734083423; x=1734688223;
 h=content-transfer-encoding:mime-version:date:message-id:subject
 :references:in-reply-to:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=2BrG/YdfyMfJSbNwPUyHp+NyjkXJ3CoxC8wyqAirNVg=;
 b=NA5167h3N88Cjc22OdFJhI+BimKAL8kPWOdChpZ8liiKe505WdzXBGY2wFxeykJ4fx
 n2P/6szfC+gSVuNhDizd4OYi7dtItP/1Hf5NRN25hZrScP9Fyxkj1F0ZZmVDUxHSAyFH
 z8P8GjelgykNdKly0mltR2DuYZrIu2qLlHK30Qg6fxM9XDUBnTlBNRdP2ZkTD6QgtLez
 fu4mUaCyWKGtyoC20RG3NvT+xhmt2C8rQ+25utRgs7yp3IGXEGIrONjtsUov1GFWl70U
 a3zOjWEZqNmXngR9Bx/8nzBhzaY5CH/3MC7vwLvUETfAbttLQv94VD0zmv+/L79sWfHW
 V/mQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCXWudQbT2/vQHRPfV/pe23cCsYx/yy53hX0E5X62IUyDKHeKebcwpGp0R2maPw5CbpZsuw8sVfhOYE=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YyeXuxGB3ev/yxWGDP/QvnaiDKza8hy5r1pU2Tx3gYRVYCIpa35
 L04zAuYULCIzKzrU+c0QhNerK1WbBeghl9MiBKPoIQ/6ToNHO8kAXmOVeYIwcK8=
X-Gm-Gg: ASbGncsOy/EjpdYgmkHdh2YH5b8X+djpxxJfgDd9RXol/Cgfg+6UQeG0f+FcXELo0fy
 BA/bRQkWKoJUxWxsPt4X675Tw1xP5lKvKo86QecvjZgKBiGvzG4X0hQYhGxyO2xGnQ+eKVkvyJc
 zHbA+3e3g04XQw9qynsw6tq0azcrEeN2lCvOKc9zvIItsgTDcsJdqG8RBhZG+jvZAEqA3CC8WNw
 HVa/pjUwrExTcgXLcKuc8Kak0Z2cekczbybhIh8oi6PyIwg9g35pLfS+eBRGOkZ7SZhDkeCp4Yo
 Rg==
X-Google-Smtp-Source: AGHT+IG9A/KVakoN8guITzQ9eblOlzfndf3qs1MoLosGMewWA0MLS7+7RXq3a6QkML6U748MbVt8iw==
X-Received: by 2002:a05:600c:1e28:b0:434:f8a0:9df0 with SMTP id
 5b1f17b1804b1-4362aa3d988mr12741175e9.8.1734083422743; 
 Fri, 13 Dec 2024 01:50:22 -0800 (PST)
Received: from arrakeen.starnux.net ([2a01:e0a:982:cbb0:8261:5fff:fe11:bdda])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-387824a3e38sm6521670f8f.23.2024.12.13.01.50.22
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 13 Dec 2024 01:50:22 -0800 (PST)
From: Neil Armstrong <neil.armstrong@linaro.org>
To: Fabio Estevam <festevam@gmail.com>
Cc: robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org, 
 shawnguo@kernel.org, imx@lists.linux.dev, 
 linux-arm-kernel@lists.infradead.org, dri-devel@lists.freedesktop.org, 
 devicetree@vger.kernel.org, Fabio Estevam <festevam@denx.de>
In-Reply-To: <20241210105705.116116-1-festevam@gmail.com>
References: <20241210105705.116116-1-festevam@gmail.com>
Subject: Re: (subset) [PATCH v2 1/2] dt-bindings: display: panel-lvds: Add
 compatible for AUO G084SN05 V9
Message-Id: <173408342200.146926.12035228317678634165.b4-ty@linaro.org>
Date: Fri, 13 Dec 2024 10:50:22 +0100
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

On Tue, 10 Dec 2024 07:57:04 -0300, Fabio Estevam wrote:
> The AUO G084SN05 V9 is an 8.4" 800x600 LVDS display.
> 
> Add a compatible entry for this LVDS display model.
> 
> 

Thanks, Applied to https://gitlab.freedesktop.org/drm/misc/kernel.git (drm-misc-next)

[1/2] dt-bindings: display: panel-lvds: Add compatible for AUO G084SN05 V9
      https://gitlab.freedesktop.org/drm/misc/kernel/-/commit/1c64605fd976cd2c7e4f30d826818a8c27924c32

-- 
Neil

