Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D92638ADE46
	for <lists+dri-devel@lfdr.de>; Tue, 23 Apr 2024 09:32:03 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1918B113193;
	Tue, 23 Apr 2024 07:32:00 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="aMO1Mwx4";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-f44.google.com (mail-wm1-f44.google.com
 [209.85.128.44])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F3774113193
 for <dri-devel@lists.freedesktop.org>; Tue, 23 Apr 2024 07:31:57 +0000 (UTC)
Received: by mail-wm1-f44.google.com with SMTP id
 5b1f17b1804b1-41aa21b06b3so8463495e9.0
 for <dri-devel@lists.freedesktop.org>; Tue, 23 Apr 2024 00:31:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1713857516; x=1714462316; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:date:message-id:subject
 :references:in-reply-to:to:from:from:to:cc:subject:date:message-id
 :reply-to; bh=1Sg65QOPtcQZrOuYCGKYckpDE7YmJS9IWjjcvkkY/64=;
 b=aMO1Mwx4RGRrOVOCXkT1FpRlAmNPmyO1DCHbKqIci8oC6u2VwgEZ0JKDixutiOaG+/
 V/gSMhh3Cl+HAPIj/24IJ4grH7FapULcgknGUfecQfV/fZINq+iX6oYR15e7YEJ1TAFD
 3tuzZq2H9OsuzCb6Tq9tAo2Mk1Wl315N/o5Xcsss0y8nC6F1BTB1H7YNoFAQRs+jG5Gk
 XJ0L82uceGVdT5sMScoizF57D9ZSy2r+C6yKjB1RVBXZJT4WfFt0hp1Kybc0zVpjzUPn
 GI/7Q59y7YU8l4E7b5AJcz74pUdpf3XNYL2YeVlKU4ZVmYbb0PERgO0mC162R/THYO3K
 bGoQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1713857516; x=1714462316;
 h=content-transfer-encoding:mime-version:date:message-id:subject
 :references:in-reply-to:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=1Sg65QOPtcQZrOuYCGKYckpDE7YmJS9IWjjcvkkY/64=;
 b=T62QWVQKZAwLcOxd0O4WTzdwMyQ8ZJO5O5KI+pdRn9/mp53zGaSTdn2HxJWoBPnus8
 /UXmHtGNvZTjm+FdKB/peeVGNANsRbg3fXLJbVBGvXi4jZac2XYkuT/ZYJoL52vOCC++
 rGjfEDRKsxPTOXkWV9uU2Vf4zqdhIQTFV+i5znjXnSdNgMEshP0eFdB5PaQQ0X669lLr
 XoIXEoCk3FZFqrWZoo+Ukb7O8gxpXjtN5/ppoiq4cOqQ4wK1dbTrxp5aDOYYIYmDD5Rr
 pDwIpnWT95fWAzBGRWoc0yLelYhtq94yQHFnKfMI3d/wyEG11yJRORPLY5CErankNeiA
 69ew==
X-Forwarded-Encrypted: i=1;
 AJvYcCX6HZ0FkZyWKPtI1/nAhO3dlDXRX55v3E0ilV91kMMJzCXFeB2DsshBbjGEY5yuIw6VNCG1t+/wziByySBcL6WsETP3fIrRj1y1vxWoK24p
X-Gm-Message-State: AOJu0YzFhVaAE52bMW9YzIDo846NgBJU3LgWCaTv2YPCketmkFB9pWEb
 adTUEY038wU5WodKl8kUgu+NuQmuUJN3ZwXlaQpFOAQQ7JpXkx/hLWxenHRPnlM=
X-Google-Smtp-Source: AGHT+IEjX6XmY23ztXbTm1qHkzpcVPy7yUfnvurNDsfJDLw/qOQdKczcN+j324+ogboWYhVA1mtzgA==
X-Received: by 2002:a05:600c:4689:b0:418:f308:7fa2 with SMTP id
 p9-20020a05600c468900b00418f3087fa2mr11273273wmo.14.1713857515759; 
 Tue, 23 Apr 2024 00:31:55 -0700 (PDT)
Received: from arrakeen.starnux.net ([2a01:e0a:982:cbb0:52eb:f6ff:feb3:451a])
 by smtp.gmail.com with ESMTPSA id
 g9-20020a05600c310900b0041a9fc2a6b5sm2456064wmo.20.2024.04.23.00.31.54
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 23 Apr 2024 00:31:55 -0700 (PDT)
From: Neil Armstrong <neil.armstrong@linaro.org>
To: "dmitry . baryshkov @ linaro . org" <dmitry.baryshkov@linaro.org>, 
 "andrzej . hajda @ intel . com" <andrzej.hajda@intel.com>, 
 "rfoss @ kernel . org" <rfoss@kernel.org>, 
 "Laurent . pinchart @ ideasonboard . com" <Laurent.pinchart@ideasonboard.com>, 
 "jonas @ kwiboo . se" <jonas@kwiboo.se>, 
 "jernej . skrabec @ gmail . com" <jernej.skrabec@gmail.com>, 
 "maarten . lankhorst @ linux . intel . com"
 <maarten.lankhorst@linux.intel.com>, 
 "mripard @ kernel . org" <mripard@kernel.org>, 
 "tzimmermann @ suse . de" <tzimmermann@suse.de>, 
 "airlied @ gmail . com" <airlied@gmail.com>, 
 "daniel @ ffwll . ch" <daniel@ffwll.ch>, 
 "robh+dt @ kernel . org" <robh+dt@kernel.org>, 
 "krzysztof . kozlowski+dt @ linaro . org" <krzysztof.kozlowski+dt@linaro.org>, 
 "conor+dt @ kernel . org" <conor+dt@kernel.org>, 
 "linux @ armlinux . org . uk" <linux@armlinux.org.uk>, 
 "Nicolas . Ferre @ microchip . com" <Nicolas.Ferre@microchip.com>, 
 "alexandre . belloni @ bootlin . com" <alexandre.belloni@bootlin.com>, 
 "claudiu . beznea @ tuxon . dev" <claudiu.beznea@tuxon.dev>, 
 "Manikandan . M @ microchip . com" <Manikandan.M@microchip.com>, 
 "arnd @ arndb . de" <arnd@arndb.de>, 
 "geert+renesas @ glider . be" <geert+renesas@glider.be>, 
 "Jason @ zx2c4 . com" <Jason@zx2c4.com>, 
 "mpe @ ellerman . id . au" <mpe@ellerman.id.au>, 
 "gerg @ linux-m68k . org" <gerg@linux-m68k.org>, 
 "rdunlap @ infradead . org" <rdunlap@infradead.org>, 
 "vbabka @ suse . cz" <vbabka@suse.cz>, 
 "dri-devel @ lists . freedesktop . org" <dri-devel@lists.freedesktop.org>, 
 "devicetree @ vger . kernel . org" <devicetree@vger.kernel.org>, 
 "linux-kernel @ vger . kernel . org" <linux-kernel@vger.kernel.org>, 
 "oe-kbuild-all @ lists . linux . dev" <oe-kbuild-all@lists.linux.dev>, 
 "Hari . PrasathGE @ microchip . com" <Hari.PrasathGE@microchip.com>, 
 Dharma Balasubiramani <dharma.b@microchip.com>
In-Reply-To: <20240421011050.43265-1-dharma.b@microchip.com>
References: <20240421011050.43265-1-dharma.b@microchip.com>
Subject: Re: (subset) [PATCH v8 0/4] LVDS Controller Support for SAM9X75
 SoC
Message-Id: <171385751450.47981.16261973588553752989.b4-ty@linaro.org>
Date: Tue, 23 Apr 2024 09:31:54 +0200
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.13.0
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

On Sun, 21 Apr 2024 06:40:46 +0530, Dharma Balasubiramani wrote:
> This patch series introduces LVDS controller support for the SAM9X75 SoC. The
> LVDS controller is designed to work with Microchip's sam9x7 series
> System-on-Chip (SoC) devices, providing Low Voltage Differential Signaling
> capabilities.
> 
> Patch series Changelog:
> - Include configs: at91: Enable LVDS serializer
> - include all necessary To/Cc entries.
> The Individual Changelogs are available on the respective patches.
> 
> [...]

Thanks, Applied to https://gitlab.freedesktop.org/drm/misc/kernel.git (drm-misc-next)

[1/4] dt-bindings: display: bridge: add sam9x75-lvds binding
      https://gitlab.freedesktop.org/drm/misc/kernel/-/commit/c24177ca3b27e5a7ddaab8d330cedecd7eb9244a
[2/4] drm/bridge: add lvds controller support for sam9x7
      https://gitlab.freedesktop.org/drm/misc/kernel/-/commit/179b0769fc5fc193d7837bdcb6ddee118a0fa9b8
[3/4] MAINTAINERS: add SAM9X7 SoC's LVDS controller
      https://gitlab.freedesktop.org/drm/misc/kernel/-/commit/e95752752eaf06c860811ac5ddf9badf6c1b43ca

-- 
Neil

