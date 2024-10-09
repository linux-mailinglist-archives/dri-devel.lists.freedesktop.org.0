Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id BEF1199618C
	for <lists+dri-devel@lfdr.de>; Wed,  9 Oct 2024 09:56:01 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3A55C10E676;
	Wed,  9 Oct 2024 07:56:00 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="zbcxukxT";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-f47.google.com (mail-wm1-f47.google.com
 [209.85.128.47])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 90AF710E676
 for <dri-devel@lists.freedesktop.org>; Wed,  9 Oct 2024 07:55:58 +0000 (UTC)
Received: by mail-wm1-f47.google.com with SMTP id
 5b1f17b1804b1-42cb0f28bfbso61614215e9.1
 for <dri-devel@lists.freedesktop.org>; Wed, 09 Oct 2024 00:55:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1728460557; x=1729065357; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:date:message-id:subject
 :references:in-reply-to:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=vF+bwgt5K0DxX6gVjgMOFqltEB1h2u/fKc87de81MiQ=;
 b=zbcxukxTfhXVLKW6ZqYNqkBzzHxFlzPradUBqEH9XFUXzLo5UqKcwlXUY53Uvz0P+N
 5BHgO85AbNImruC9VtzH8yknfPMo6QwDbSmsCuxKhuMZNSshYmP3PnR7lFHwJswcg1eO
 qslAPj7p+WXLoeXdngzUBydP/xAjPGjruN3datF9Avu9h/KocEaFY/ybvVZGJ8tPDSIS
 GWjFukoZWneI5fjIjZJFO0fseccaN3hsELKHqbrW/Xyt/ev918aeE/zkjaaL/Ovlpoou
 SfBGhJCgEcySZY0fbJo7vEXlGR3+dSrD5/h+KzgPJeiJoqVOWAmTbBzS81ZwW01jgmA5
 7DoA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1728460557; x=1729065357;
 h=content-transfer-encoding:mime-version:date:message-id:subject
 :references:in-reply-to:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=vF+bwgt5K0DxX6gVjgMOFqltEB1h2u/fKc87de81MiQ=;
 b=Ey673sParQqV7/GCpc/i3j1VZskIt8+j0b3jFXNMiUx5dPCEZL9p8Z5lQgUX11HBJZ
 dB0wS8o3KdZ2nyRpxJluPYvRm+bp9IO0Pfpz5/M76Nxq0QZrVZzgEQAzuTPDmbz87/RK
 0aBTvubQtt/J9OUd5znWxH1U+3cHjVUNtK0aSF1bHMzFBq9OKvw+oLKsEB6SglUIKvG1
 7QS7FdrYtEsMoHx1vIlRoxku2Mc97nMCg2lQ4weCMkuRoMyOhcjsuKPTfSv9Mrh6zp2/
 ksW783Ad/JHtWdLRvZTgvidbSFV5o6SblZfw0hx6KAbGVdGALYVgyBHqG0cNsYIbsi36
 /Zjw==
X-Forwarded-Encrypted: i=1;
 AJvYcCULaxgN/3GOmpkPXkqd6PtQL4OTuDVP/xUpXxsQJ9AIzefW4ePicF0wr87h3a/OO3yDk0twfA7KBcg=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YyupSkRvVh7Y5rz6YWd8HdUVuk6ADlwunB3bDbLUtCJ5AFk5zwh
 gBx0Jraxx7l0kOMgTAqkOjyjEnaveAkVrY45imFP2sV3MhcuEtuXICa9cUelq+M=
X-Google-Smtp-Source: AGHT+IHLlUU3NnG9hXwulDxBDdXbtdhESRXfgH6ae8spTgJdMsE262PfGzNXfp3eWmSSA9CE1JyGgA==
X-Received: by 2002:adf:fa82:0:b0:37c:cd71:2b96 with SMTP id
 ffacd0b85a97d-37d3aa84533mr951060f8f.36.1728460556864; 
 Wed, 09 Oct 2024 00:55:56 -0700 (PDT)
Received: from arrakeen.starnux.net ([2a01:e0a:982:cbb0:52eb:f6ff:feb3:451a])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-37d16972fd9sm9660342f8f.104.2024.10.09.00.55.55
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 09 Oct 2024 00:55:56 -0700 (PDT)
From: Neil Armstrong <neil.armstrong@linaro.org>
To: Conor Dooley <conor+dt@kernel.org>, David Airlie <airlied@gmail.com>, 
 devicetree@vger.kernel.org, dri-devel@lists.freedesktop.org, 
 imx@lists.linux.dev, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>, 
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>, 
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Rob Herring <robh@kernel.org>, 
 Sascha Hauer <s.hauer@pengutronix.de>, Shawn Guo <shawnguo@kernel.org>, 
 Thierry Reding <thierry.reding@gmail.com>, 
 Thomas Zimmermann <tzimmermann@suse.de>, 
 Simona Vetter <simona.vetter@ffwll.ch>, Frieder Schrempf <frieder@fris.de>
Cc: Frieder Schrempf <frieder.schrempf@kontron.de>, 
 Alexander Stein <alexander.stein@ew.tq-group.com>, 
 Chris Morgan <macromorgan@hotmail.com>, 
 Conor Dooley <conor.dooley@microchip.com>, 
 Fabio Estevam <festevam@gmail.com>, 
 Francesco Dolcini <francesco.dolcini@toradex.com>, 
 Gregor Herburger <gregor.herburger@ew.tq-group.com>, 
 Heiko Stuebner <heiko.stuebner@cherry.de>, 
 Hugo Villeneuve <hvilleneuve@dimonoff.com>, 
 Jessica Zhang <quic_jesszhan@quicinc.com>, 
 Joao Paulo Goncalves <joao.goncalves@toradex.com>, 
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>, 
 Linus Walleij <linus.walleij@linaro.org>, 
 Parthiban Nallathambi <parthiban@linumiz.com>, Peng Fan <peng.fan@nxp.com>, 
 Pengutronix Kernel Team <kernel@pengutronix.de>, 
 =?utf-8?q?Rafa=C5=82_Mi=C5=82ecki?= <rafal@milecki.pl>, 
 Raphael Gallais-Pou <raphael.gallais-pou@foss.st.com>
In-Reply-To: <20240828074753.25401-1-frieder@fris.de>
References: <20240828074753.25401-1-frieder@fris.de>
Subject: Re: (subset) [PATCH v2 0/4] arm64: dts: imx8mm-kontron: Add HDMI
 and LVDS display support
Message-Id: <172846055533.3028267.13306014745754490027.b4-ty@linaro.org>
Date: Wed, 09 Oct 2024 09:55:55 +0200
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.14.1
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

On Wed, 28 Aug 2024 09:46:52 +0200, Frieder Schrempf wrote:
> From: Frieder Schrempf <frieder.schrempf@kontron.de>
> 
> This add support for the display bridges (DSI->LVDS and DSI->HDMI)
> on the BL i.MX8MM and the 7" LVDS panel in a separate overlay.
> 
> Only one of the interfaces (HDMI or LVDS) is supported at the same
> time. Enabling the LVDS overlay will disable the HDMI interface.
> 
> [...]

Thanks, Applied to https://gitlab.freedesktop.org/drm/misc/kernel.git (drm-misc-next)

[1/4] dt-bindings: vendor-prefixes: Add Jenson Display
      https://gitlab.freedesktop.org/drm/misc/kernel/-/commit/763dc2cdeb2ac5a5067972b614f9f0603f716f9b
[2/4] dt-bindings: display: panel-lvds: Add compatible for Jenson BL-JT60050-01A
      https://gitlab.freedesktop.org/drm/misc/kernel/-/commit/15bda06bc93fca828e5f11ca6b773fed19e45b8e

-- 
Neil

