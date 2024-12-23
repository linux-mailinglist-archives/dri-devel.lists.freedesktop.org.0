Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 004DF9FAD98
	for <lists+dri-devel@lfdr.de>; Mon, 23 Dec 2024 12:17:15 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6F84710E507;
	Mon, 23 Dec 2024 11:17:14 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="kTsrvUEl";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-x12d.google.com (mail-lf1-x12d.google.com
 [IPv6:2a00:1450:4864:20::12d])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1C41410E507
 for <dri-devel@lists.freedesktop.org>; Mon, 23 Dec 2024 11:17:13 +0000 (UTC)
Received: by mail-lf1-x12d.google.com with SMTP id
 2adb3069b0e04-53ff1f7caaeso4352687e87.0
 for <dri-devel@lists.freedesktop.org>; Mon, 23 Dec 2024 03:17:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1734952631; x=1735557431; darn=lists.freedesktop.org;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=oAg0zQo1HvAo0iqaanIJTGGSdxrt4g4lbpXT4Fzk4t8=;
 b=kTsrvUEllVsA4kQaM8wAwRNLjWssf0zONEhtQX5o5y83Ijbshxtto6ORIxR5EP0dDF
 lHugoce+QN9Sy7Ufmh55AmVzf5JipOwm6uBMEFXD2znU18hVKY3Qjp0ZPuZUqP3r3pos
 pduCc5+6dihxikG5IwLM+/GdnBoV/NaGS3wPeyH90RN4luv4kmCFJfsHXSF+2sINeLtb
 Zq9E88YWUzshntrolJ7RIC+2+7HL6KBnV2SRpEMDZG4+Oos1z4Nr/WW8JFzCkMHC/300
 D25v0LiynwBgeKIvyrB6BD4ySFAgm3OmO0GLVogBCQc/aT48nWTeTaTcI0VrnbGW9Jnn
 Rkhw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1734952631; x=1735557431;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=oAg0zQo1HvAo0iqaanIJTGGSdxrt4g4lbpXT4Fzk4t8=;
 b=jGgUd5hlNR3bgE5nOJ1G6lu05SWnoxXmY60cghA+bV9F30qzF+N/St5YSRgUgyK4J/
 7QpM0KxMOCZ3li/WqCfI/Tln5SkwwW181fDlvlNfQtEYbx9KPH1Z4v5015g7AwX+8c4D
 vnCgqi3Gery15vU49TjeLbTe9rs8LBAEf86WiFHvIv2/PyVkzhYQ0FWH131m9u5wEsmX
 Rg1MMdp5sg3ZuUv+ynGbXQB3YIj85kgIpu63Bd7tp8lwlU5jVLRABmbMyrNUBMwNfzew
 w18utJTYXhP2NxdaapUV8d8Ea/rzcwlwcGcZZpuI0Lx1E6lr0NQCBg3rM4AsvYQCy+k/
 K0Hw==
X-Gm-Message-State: AOJu0YxCz/uG7ralbspqVuCF2dVjJJU+kjUvOHp0tx7C8jtmYy49APf4
 Z826zd1BuaEULkNI5souBpgSTMRHqw8lvHNkNIvKlcLsXuhDOp86ntoBmhbN0QE=
X-Gm-Gg: ASbGncuzd/iJiVokQYqHIGS8AqoBz76Wg7jhdFtIrWo1D4RwwzXY7Qm39HUB2ugYAeX
 N4DloZgdtVNbIYSnIPUY3MQAZlgn4s+yU0LGMs4hPujsoUjYeUV3q/4VP7MmnsrX9MgTIIcNTSk
 tgSBbOat7Fue4on28Sf+pEe4bBEhGesdVR5uhV6LCyIPK0SUx405THl2AOjLAN1M8ZQ6oZb+V55
 vEV921Og0//F3w6wkpbWe8H+74FTV13pIkX2iK5SIG+hZgu7LRd3Tx2Y+co/MZ+RjH4FZzPLGXl
 +45Qrlje1DraY47Sgx9ymgqomLokajTcvYw3
X-Google-Smtp-Source: AGHT+IGwOxJn54Td8r+NyaqARiydob0173z+5mppR6r0JXqtqFfPSqJJa2vifkVmQItUKQ/aSDHrlg==
X-Received: by 2002:a05:6512:39cc:b0:542:250d:eefb with SMTP id
 2adb3069b0e04-5422955fd2fmr4096765e87.41.1734952631337; 
 Mon, 23 Dec 2024 03:17:11 -0800 (PST)
Received: from eriador.lumag.spb.ru
 (2001-14ba-a0c3-3a00--b8c.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::b8c])
 by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-54223825f48sm1244622e87.225.2024.12.23.03.17.08
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 23 Dec 2024 03:17:10 -0800 (PST)
Date: Mon, 23 Dec 2024 13:17:07 +0200
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Liu Ying <victor.liu@nxp.com>
Cc: dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org, 
 imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org, 
 linux-kernel@vger.kernel.org, linux-phy@lists.infradead.org,
 p.zabel@pengutronix.de, 
 airlied@gmail.com, simona@ffwll.ch, maarten.lankhorst@linux.intel.com, 
 mripard@kernel.org, tzimmermann@suse.de, robh@kernel.org, krzk+dt@kernel.org, 
 conor+dt@kernel.org, shawnguo@kernel.org, s.hauer@pengutronix.de, 
 kernel@pengutronix.de, festevam@gmail.com, tglx@linutronix.de, vkoul@kernel.org,
 kishon@kernel.org, aisheng.dong@nxp.com, agx@sigxcpu.org, 
 u.kleine-koenig@baylibre.com, francesco@dolcini.it, frank.li@nxp.com
Subject: Re: [PATCH v7 11/19] drm/imx: Add i.MX8qxp Display Controller
 interrupt controller
Message-ID: <6eg5ahmcxfvwzoybqqcksqergoeu5ivsqshfjjmotwe6t4brge@aahohpjlfqic>
References: <20241223064147.3961652-1-victor.liu@nxp.com>
 <20241223064147.3961652-12-victor.liu@nxp.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20241223064147.3961652-12-victor.liu@nxp.com>
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

On Mon, Dec 23, 2024 at 02:41:39PM +0800, Liu Ying wrote:
> i.MX8qxp Display Controller has a built-in interrupt controller to support
> Enable/Status/Preset/Clear interrupt bit.  Add driver for it.
> 
> Reviewed-by: Maxime Ripard <mripard@kernel.org>
> Signed-off-by: Liu Ying <victor.liu@nxp.com>
> ---
> v7:
> * Fix regmap_config definition by removing name field, correcting read ranges
>   and setting max_register field.
> * Collect Maxime's R-b tag.
> 
> v6:
> * No change.
> 
> v5:
> * Replace .remove_new with .remove in dc-ic.c. (Uwe)
> 
> v4:
> * Use regmap to define register map for all registers. (Dmitry)
> * Use regmap APIs to access registers. (Dmitry)
> * Use devm_kzalloc() to drmm_kzalloc() to allocate dc_ic_data data strutures.
> * Set suppress_bind_attrs driver flag to true to avoid unnecessary sys
>   interfaces to bind/unbind the driver.
> * Take DC interrupt controller driver as a standalone driver instead of a
>   component driver.
> * Replace drmm_kcalloc() with devm_kcalloc() to allocate an array for
>   struct dc_ic_entry.
> * Call platform_get_irq() from DC interrupt controller driver to make sure
>   parent interrupt controller driver is probed first.
> 
> v3:
> * No change.
> 
> v2:
> * No change.
> 
>  drivers/gpu/drm/imx/dc/Kconfig  |   1 +
>  drivers/gpu/drm/imx/dc/Makefile |   2 +-
>  drivers/gpu/drm/imx/dc/dc-drv.c |   1 +
>  drivers/gpu/drm/imx/dc/dc-drv.h |   1 +
>  drivers/gpu/drm/imx/dc/dc-ic.c  | 282 ++++++++++++++++++++++++++++++++
>  5 files changed, 286 insertions(+), 1 deletion(-)
>  create mode 100644 drivers/gpu/drm/imx/dc/dc-ic.c

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>

-- 
With best wishes
Dmitry
