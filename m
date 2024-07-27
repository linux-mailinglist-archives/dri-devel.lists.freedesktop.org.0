Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 4167393DF1E
	for <lists+dri-devel@lfdr.de>; Sat, 27 Jul 2024 13:17:18 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BB84110E0A2;
	Sat, 27 Jul 2024 11:17:13 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="AfzZqpJW";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-f48.google.com (mail-lf1-f48.google.com
 [209.85.167.48])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E2B4E10E0A2
 for <dri-devel@lists.freedesktop.org>; Sat, 27 Jul 2024 11:17:12 +0000 (UTC)
Received: by mail-lf1-f48.google.com with SMTP id
 2adb3069b0e04-52ea2b6a9f5so2213106e87.0
 for <dri-devel@lists.freedesktop.org>; Sat, 27 Jul 2024 04:17:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1722079031; x=1722683831; darn=lists.freedesktop.org;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=Fkpa8TJ5OIzpKRb43AjTpsIXqFuO8ZOzenewpTC4PxI=;
 b=AfzZqpJWZ4ZrEiwYR66x7l0Tter5Z1a7Zb8LOvU6vZ5XTK+vnprkIZhKLK/gy32JUI
 y3JQFC44uGaKFDCKXs8Zn6NcBOJAReW4ge3gq+g8GiQ+eDbcdZqVCLF+MO7Hbg4VfHj3
 zZ6iuJE02T0H9SauyIal6FJb6WVQ2XdDTCL/9+e9rkmrxXqS82/xuxcEVUBFvtX7gVpj
 kzBIkw+Kh/tCFZjU++07dlVOCEXWqbhF/0GmaeVINcznBiWdI+TwyEJ24uZ9PTxL+FFT
 wZQx50xPLXuL+wW58pSd1JDbGoESglkpb44/Mq+Ry2o8dkFUbNrZgORofUuN3uL7g6cP
 LZTA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1722079031; x=1722683831;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=Fkpa8TJ5OIzpKRb43AjTpsIXqFuO8ZOzenewpTC4PxI=;
 b=cPwSLjeGbyyrW740sFizADfPc6x19YPQRRHk9oSAYTlDb59Uo6NlYQ5vN6eaEcEg8y
 8vG3+Oq+S74kFk5J4sH7MsCjQxVRkhuC1N2PiwyqtfoGISpz21CW/mJQrzqpfOeyLwrm
 B21UwM3zzI7CXf6m+18kw8YoQMELyGATi5w5J2Mg6xyqb4NXvfUD9o5spH1ifbijdFAe
 VakE3jzJF1l8dMitHHpcLyokz7b+8/YKwiosLv1CcmKV+5/KMIHI8AF2Od/cCFuLGZJW
 u0s08Q4Y0xXsqupAnzyZXNeaNMAwpPSq8CqPvxMn5Ipb50DqpTLLxxdRhuEk6cqE4baT
 F8fQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCXSvYH0f9AUVRI15Jt/KZCyRm4gZehPlOA2hY7X2w7Y/5+xcbr4Nckr16jNlQGnwwE79seg8wl+lK/FSyNBDPtj0Ot83vXfs5ln+uTH8jE0
X-Gm-Message-State: AOJu0Yz8UBtjzqz+RJiRxFIZKqbqOvaOD63SHsqdkcmxOWhkVuKFCUnj
 SaLRG+0Nc/UgdqDZ3cU26h6etSBXzYt/l1RCbn7IzLHPXGoLBrdv6BJ+aXzx0cY=
X-Google-Smtp-Source: AGHT+IFV2u5maYoEb8aiufChQSWaSXHdEC+3/iMuz9LLuZn9KA+LN3EVhcasTTkA+CVS8KmRnu6Uww==
X-Received: by 2002:ac2:511c:0:b0:52c:dac3:392b with SMTP id
 2adb3069b0e04-5309b27d5d1mr1449168e87.33.1722079030930; 
 Sat, 27 Jul 2024 04:17:10 -0700 (PDT)
Received: from eriador.lumag.spb.ru
 (dzdbxzyyyyyyyyyyybrhy-3.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::b8c])
 by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-52fd5c19dc4sm733863e87.221.2024.07.27.04.17.10
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 27 Jul 2024 04:17:10 -0700 (PDT)
Date: Sat, 27 Jul 2024 14:17:08 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Philipp Zabel <p.zabel@pengutronix.de>, 
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, 
 Thomas Zimmermann <tzimmermann@suse.de>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Conor Dooley <conor+dt@kernel.org>, 
 Shawn Guo <shawnguo@kernel.org>, Sascha Hauer <s.hauer@pengutronix.de>, 
 Pengutronix Kernel Team <kernel@pengutronix.de>,
 Fabio Estevam <festevam@gmail.com>
Cc: Chris Healy <cphealy@gmail.com>, dri-devel@lists.freedesktop.org, 
 devicetree@vger.kernel.org, imx@lists.linux.dev,
 linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH v3 00/12] drm/imx/ipuv3: switch LDB and parallel-display
 driver to use drm_bridge_connector
Message-ID: <uqsnphe2pm366xenpdvtsxvpkiewgmxoqyv2zvbgc3ewlx23mp@guesbce35jcm>
References: <20240602-drm-imx-cleanup-v3-0-e549e2a43100@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240602-drm-imx-cleanup-v3-0-e549e2a43100@linaro.org>
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

On Sun, Jun 02, 2024 at 03:04:40PM GMT, Dmitry Baryshkov wrote:
> The IPUv3 DRM i.MX driver contains several codepaths for different
> usescases: both LDB and paralllel-display drivers handle next-bridge,
> panel and the legacy display-timings DT node on their own.
> 
> Drop unused ddc-i2c-bus and edid handling (none of the DT files merged
> upstream ever used these features), switch to panel-bridge driver,
> removing the need to handle drm_panel codepaths separately and finally
> switch to drm_bridge_connector, removing requirement for the downstream
> bridges to create drm_connector on their own.
> 
> This has been tested on the iMX53 with the DPI panel attached to LDB via
> LVDS decoder, using all possible usecases (lvds-codec + panel, panel
> linked directly to LDB node and the display-timings node).
> 
> To be able to test on the iMX53 QSRB with the HDMI cape apply [1], [2]
> 
> [1] https://lore.kernel.org/all/20240514030718.533169-1-victor.liu@nxp.com/
> [2] https://lore.kernel.org/all/20240602-imx-sii902x-defconfig-v1-1-71a6c382b422@linaro.org/
> 
> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> ---
> Changes in v3:
> - Notice (soft) dependencies in the cover letter (Chris)
> - Select DRM_BRIDGE instead of depending on it (Philipp)
> - Dropped unused selection of DRM_PANEL (Philipp)
> - Added missing include of <drm/bridge/imx.h> to parallel-display.c
>   (Philipp)
> - Link to v2: https://lore.kernel.org/r/20240331-drm-imx-cleanup-v2-0-d81c1d1c1026@linaro.org
> 
> Changes in v2:
> - Fixed drm_bridge_attach flags in imx/parallel-display driver.
> - Moved the legacy bridge to drivers/gpu/drm/bridge
> - Added missing EXPORT_SYMBOL_GPL to the iMX legacy bridge
> - Link to v1: https://lore.kernel.org/r/20240311-drm-imx-cleanup-v1-0-e104f05caa51@linaro.org

Just a gracious ping, this has been without maintainer's review for
nearly two months.

Should we change ipu-v3 to the 'S: Odd Fixes' state?

-- 
With best wishes
Dmitry
