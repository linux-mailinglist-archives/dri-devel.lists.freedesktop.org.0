Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 5B8CA9F79F2
	for <lists+dri-devel@lfdr.de>; Thu, 19 Dec 2024 11:59:43 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D8C2410ECCF;
	Thu, 19 Dec 2024 10:59:40 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="QSpdxDJs";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-x334.google.com (mail-wm1-x334.google.com
 [IPv6:2a00:1450:4864:20::334])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 31B3E10ECCF
 for <dri-devel@lists.freedesktop.org>; Thu, 19 Dec 2024 10:59:39 +0000 (UTC)
Received: by mail-wm1-x334.google.com with SMTP id
 5b1f17b1804b1-4361f796586so6564985e9.3
 for <dri-devel@lists.freedesktop.org>; Thu, 19 Dec 2024 02:59:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1734605978; x=1735210778; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:date:message-id:subject
 :references:in-reply-to:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=cS+nRbp5xUtPRCpEi25EwuCO4ItLuZHhxv5YcNc6e4M=;
 b=QSpdxDJsgS15m+k30A9ghHH5wnLyGuRzGrMh7Ir1RGDOy9fxN2lgbJ869YBwHGVXnh
 9eeu5gS1aR9JPxXCGiWNnQvNA01BD+G6dv4teg/qZwu0xBOOvEOY3bSWzSc7+A6MinFI
 ybn0QZVChM0jFVphXzq/EComfGX3FIYFtmZIrq7LHgj1JjX/sn59xVbC0D/DSbKxaw10
 4QHrW/9xAdbHGIIoaB+6p/qqx73C4GnZMEdZrSlc7Bztk2fr5WEFQ6wDeOp8xVTPX7Vl
 I7RVzkrK9WMGBK35Mq/WzgZ231oSKATikwFg5j8TcLWGzhA0wTWcYRBFjeSzH1g/P4lC
 P9Rg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1734605978; x=1735210778;
 h=content-transfer-encoding:mime-version:date:message-id:subject
 :references:in-reply-to:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=cS+nRbp5xUtPRCpEi25EwuCO4ItLuZHhxv5YcNc6e4M=;
 b=H6zEeEoJHILTWGlt+UlI2O5HB5uxj95buIvUmu89Iu7IYqfUEQl8CuCoBKcmAvMmUX
 FZtK8U9qPn3H8q3urL0oDGM0a5fLqiQDsSx5NzVCWh7xKFpc0qA5VidfdByg8Am/wlG2
 bM33M+O7xX8/Z9EwM/UpIGffbKP/ywm7iwAgeHSfW1ukoY/4YOwLtn7e0DaBaAHSUKxk
 sTkKO9GRJrbJRncYXzZL4kGwxzkCntfWcJL/Mu2A4QiAwx6H9+KD9LqXG2aLeTsyBHHt
 0I7azEZOivmSKl338r0V6a1Zcjn8o88RlYs8po4m7UiYy0RHkT4Iy6QDyK3W5B0CmUI+
 Ls8w==
X-Gm-Message-State: AOJu0YwHw1O/NmDxp0ci/n59xYLRVE+BaN+a7C/5t9s0rAZQpmoiWXql
 y+3vT7bSaRuokSw79iDbtUrF4qgwauoPXJFZiOASoErEnZM8fge6Vk6WFy9Lb7o=
X-Gm-Gg: ASbGncv2t5zj9AXWMrWJR/Z1sgej9a7hgSj7HT9Cy75ivJZKchXPoZgFCeJM4+6Nxh+
 FhNJeQD4bGb+kXR5GyEkoBsUaCWVvabwB9ojkY6HXpR17pU91SnuVkdMD17vNy82SiCiPJTc+3k
 5uyfaIUYNlVYtAVYVFRi+Erq7SNmk8BhGNKkdVyOJZ26vUZjoYQ/hFmwtui8Uvzko5t8u/JI1C5
 D6o9hDvTQZY4xFiW1RuckqLOx23hxAmy2Err4j2Qw0yQ7zjpOfqTmdsC+D8yv4hMSejYyqzR7g3
 pA==
X-Google-Smtp-Source: AGHT+IENRpTZ1e7nnnS7IIxmPArBgJVUoa1AtaNNn0RO62JEfVFRRCR0Cb6o8qC4D0b/oXcnJqyscw==
X-Received: by 2002:a5d:584e:0:b0:385:e9de:d521 with SMTP id
 ffacd0b85a97d-38a19af880cmr2997296f8f.8.1734605977659; 
 Thu, 19 Dec 2024 02:59:37 -0800 (PST)
Received: from arrakeen.starnux.net ([2a01:e0a:982:cbb0:8261:5fff:fe11:bdda])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-38a1c89e2d2sm1289920f8f.71.2024.12.19.02.59.36
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 19 Dec 2024 02:59:37 -0800 (PST)
From: Neil Armstrong <neil.armstrong@linaro.org>
To: andrzej.hajda@intel.com, rfoss@kernel.org, 
 Laurent.pinchart@ideasonboard.com, jonas@kwiboo.se, 
 jernej.skrabec@gmail.com, airlied@gmail.com, simona@ffwll.ch, 
 maarten.lankhorst@linux.intel.com, mripard@kernel.org, tzimmermann@suse.de, 
 robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org, 
 shawnguo@kernel.org, s.hauer@pengutronix.de, kernel@pengutronix.de, 
 festevam@gmail.com, marex@denx.de, Andrej Picej <andrej.picej@norik.com>
Cc: dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, imx@lists.linux.dev, 
 linux-arm-kernel@lists.infradead.org, upstream@lists.phytec.de
In-Reply-To: <20241216085410.1968634-1-andrej.picej@norik.com>
References: <20241216085410.1968634-1-andrej.picej@norik.com>
Subject: Re: (subset) [PATCH v7 0/3] SN65DSI83/4 lvds_vod_swing properties
Message-Id: <173460597657.883073.14115671156294694663.b4-ty@linaro.org>
Date: Thu, 19 Dec 2024 11:59:36 +0100
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

On Mon, 16 Dec 2024 09:54:07 +0100, Andrej Picej wrote:
> The LVDS differential voltage swing can be specified as arrays of min, max
> in microvolts. Two arrays, one for data-lanes and one for clock-lane can
> be specified. Additionally, because LVDS voltage swing depends on near-end
> termination this can now also be specified with separate property.
> 
> Driver goes through the tables, taken from datasheet [1] and selects the
> appropriate configuration. If appropriate configuration can not be found
> the probe fails. If these properties are not defined default values are
> used as before.
> 
> [...]

Thanks, Applied to https://gitlab.freedesktop.org/drm/misc/kernel.git (drm-misc-next)

[1/3] dt-bindings: drm/bridge: ti-sn65dsi83: Add properties for ti,lvds-vod-swing
      https://gitlab.freedesktop.org/drm/misc/kernel/-/commit/63f4e7dfef8c1162e22cd25c9a23b125ba40dfc4
[2/3] drm/bridge: ti-sn65dsi83: Add ti,lvds-vod-swing optional properties
      https://gitlab.freedesktop.org/drm/misc/kernel/-/commit/d2b8c6d5495706eee2347483ea89b5c13f256ff2

-- 
Neil

