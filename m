Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 2FB73A0B26D
	for <lists+dri-devel@lfdr.de>; Mon, 13 Jan 2025 10:11:11 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 44A6F10E266;
	Mon, 13 Jan 2025 09:11:08 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="L17F0aYY";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-f42.google.com (mail-lf1-f42.google.com
 [209.85.167.42])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2E93A10E1D3
 for <dri-devel@lists.freedesktop.org>; Mon, 13 Jan 2025 09:11:07 +0000 (UTC)
Received: by mail-lf1-f42.google.com with SMTP id
 2adb3069b0e04-53e3a227b82so3488107e87.0
 for <dri-devel@lists.freedesktop.org>; Mon, 13 Jan 2025 01:11:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1736759405; x=1737364205; darn=lists.freedesktop.org;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=2m7BqFyPTCb5l2+wQfuOnNqekkEOfPARePQKvpZbjSw=;
 b=L17F0aYYDYRZSKUM1FxA4zGqsUev+YCdic9hAuZOnTHOjypGO+OPBig9Xz+xTsO2d7
 Eunb/92JcGljiqG7LFZ7xdXYee4PcAa2sR2NBt5Mloca+quogexKqujiDCWWhh21uJqT
 7/zKHfFDMBRedJtrYWj9hIgXHkzHPW7Sgonwe3AOdL3wBDftFn7ppOdPmmU/L7X9YpQE
 T2nK6yQzaRMKqCR554rP9x6DgOsiI0acBS433BeyJob1xXBf3TJtjpAhSfKpvV+99O+e
 Y6lOvnLUyvRuctlzfaFECY8lfA+lxxuy4uNC9K9OTBNYgSChGMxYJnGXzuF6fFIvipYl
 BRMA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1736759405; x=1737364205;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=2m7BqFyPTCb5l2+wQfuOnNqekkEOfPARePQKvpZbjSw=;
 b=oAdXRfW9Bp9+KsdRkSSJgBWomZskFISZpCoDVyuo50DSLmXDAoQo5oWjFgI/Q6PBcW
 PDDt+UCKsfBjNN2OAWrjR8iy2HYIPGrG8QQyLSRZrXSnkCi2KMOAzGyPgvXM0kPVhqAL
 ekFmppMIdD/CzSUFveu2oYMtLeehYJVNA2xZkf/kqdnK/BIHsNApUCzAq2LlseF0UYnx
 SgusJ6R9MAuhAQk/7o3mZF3e4hv1QiyPp9vx71rbfxCmhoMO3ODJtUYT9JxBG1fwsMWu
 AAMLZFSBwHk/RJzfu6NfqrLGVF1DwI7VR1ej58IJFpqkl3nylE22UzV3LazcVVz/QdcU
 J/tg==
X-Forwarded-Encrypted: i=1;
 AJvYcCWnPXzNTKEfe/AdEr5Ehz0vNTcZi5tfYcIf3QEKG7OV+/GU7pTR4/FLS/a9gVno3hEz+atb2Siet+o=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YyHnAPJ4STcNbRxYGh1+3wj+4bD/3DLjr1kdMXCV9os11rR/DkL
 6raMoOlMH64c5ymJ2v6nKK06Cl2754CHc9LTumZFhAyIsRd8hyVcsZbarmFuN1U=
X-Gm-Gg: ASbGnct+Ujg0YFTc7b+CNR1NNPhLP/Q33NDh2QE3a3Dofor5ZpZLTk3MxvkM2UbvsCt
 tWlMibeuf1pKacmRcgUHXVfwwKQUcWAtxADk21WOKm/3NM0FDcSz963qLvC+Go9bssVt68Gm+TT
 O3gvJAb9J2pVoavKezEngQbBIScaE/6vC7grKdL9j9l4DU8bdgRYvaMUktSahmjGY8rYAxC2zQu
 Ziyn6uzc8q1/UR/DWbeF+KPuyon0ReBn7SYPdZMTAOVz51MEVq8hPiSXlkGaHP/U/U1looTvikt
 CVxY9zpFQHRy/eeowFRFVw7UFRa6PbUovdK2
X-Google-Smtp-Source: AGHT+IGw4VY/Y6W8zkOKJuAFr5OCeGQE4lHsOJ/tJKFeVu0YC0sUMWeW67o9DovWrzDT+skDY5PJJw==
X-Received: by 2002:a05:6512:3f12:b0:540:3566:5397 with SMTP id
 2adb3069b0e04-542845b70d4mr6410811e87.22.1736759405308; 
 Mon, 13 Jan 2025 01:10:05 -0800 (PST)
Received: from eriador.lumag.spb.ru
 (2001-14ba-a0c3-3a00--b8c.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::b8c])
 by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-5428be5492bsm1294955e87.104.2025.01.13.01.10.02
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 13 Jan 2025 01:10:04 -0800 (PST)
Date: Mon, 13 Jan 2025 11:10:01 +0200
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Damon Ding <damon.ding@rock-chips.com>
Cc: heiko@sntech.de, robh@kernel.org, krzk+dt@kernel.org, 
 conor+dt@kernel.org, rfoss@kernel.org, vkoul@kernel.org, 
 sebastian.reichel@collabora.com, cristian.ciocaltea@collabora.com,
 l.stach@pengutronix.de, 
 andy.yan@rock-chips.com, hjc@rock-chips.com, algea.cao@rock-chips.com, 
 kever.yang@rock-chips.com, dri-devel@lists.freedesktop.org,
 devicetree@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-rockchip@lists.infradead.org,
 linux-kernel@vger.kernel.org, linux-phy@lists.infradead.org
Subject: Re: [PATCH v1 0/6] Add eDP mode support for Rockchip Samsung HDPTX PHY
Message-ID: <ezoduel3qz5ihlhekry26cb7ace3bm4xmzsfrsqvbodtcl3gjq@xxo75h7uozei>
References: <20250112090714.1564158-1-damon.ding@rock-chips.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250112090714.1564158-1-damon.ding@rock-chips.com>
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

On Sun, Jan 12, 2025 at 05:07:08PM +0800, Damon Ding wrote:
> Picked from:
> https://patchwork.kernel.org/project/linux-rockchip/list/?series=923593

Then it should have been v6, not v1.

> 
> These patchs have been tested with a 1536x2048p60 eDP panel on
> RK3588S EVB1 board, and HDMI 1080P/4K display also has been verified
> on RK3588 EVB1 board.
> 
> Damon Ding (6):
>   phy: phy-rockchip-samsung-hdptx: Swap the definitions of LCPLL_REF and
>     ROPLL_REF
>   phy: phy-rockchip-samsung-hdptx: Supplement some register names with
>     their full version
>   phy: phy-rockchip-samsung-hdptx: Add the '_MASK' suffix to all
>     registers
>   phy: phy-rockchip-samsung-hdptx: Add eDP mode support for RK3588
>   dt-bindings: display: rockchip: Fix label name of hdptxphy for RK3588
>     HDMI TX Controller
>   arm64: dts: rockchip: Fix label name of hdptxphy for RK3588
> 
>  .../rockchip/rockchip,rk3588-dw-hdmi-qp.yaml  |   2 +-
>  arch/arm64/boot/dts/rockchip/rk3588-base.dtsi |   4 +-
>  .../dts/rockchip/rk3588-coolpi-cm5-evb.dts    |   2 +-
>  .../rockchip/rk3588-coolpi-cm5-genbook.dts    |   2 +-
>  .../boot/dts/rockchip/rk3588-evb1-v10.dts     |   2 +-
>  .../rk3588-friendlyelec-cm3588-nas.dts        |   2 +-
>  .../arm64/boot/dts/rockchip/rk3588-jaguar.dts |   2 +-
>  .../boot/dts/rockchip/rk3588-nanopc-t6.dtsi   |   2 +-
>  .../dts/rockchip/rk3588-orangepi-5-plus.dts   |   2 +-
>  .../boot/dts/rockchip/rk3588-rock-5b.dts      |   2 +-
>  .../boot/dts/rockchip/rk3588-tiger-haikou.dts |   2 +-
>  .../boot/dts/rockchip/rk3588s-coolpi-4b.dts   |   2 +-
>  .../dts/rockchip/rk3588s-indiedroid-nova.dts  |   2 +-
>  .../boot/dts/rockchip/rk3588s-nanopi-r6.dtsi  |   2 +-
>  .../boot/dts/rockchip/rk3588s-odroid-m2.dts   |   2 +-
>  .../boot/dts/rockchip/rk3588s-orangepi-5.dtsi |   2 +-
>  .../boot/dts/rockchip/rk3588s-rock-5a.dts     |   2 +-
>  .../boot/dts/rockchip/rk3588s-rock-5c.dts     |   2 +-
>  .../phy/rockchip/phy-rockchip-samsung-hdptx.c | 971 +++++++++++++++++-
>  19 files changed, 934 insertions(+), 75 deletions(-)
> 
> -- 
> 2.34.1
> 

-- 
With best wishes
Dmitry
